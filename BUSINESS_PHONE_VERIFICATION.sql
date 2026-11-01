-- ISOKO PLUS: Business Account activation after Supabase SMS phone verification
-- Run in Supabase SQL Editor after the base ISOKO_PLUS setup.
-- The front end first verifies the phone with Supabase Auth SMS OTP, then calls this RPC.

create or replace function public.isoko_activate_business_account()
returns void
language plpgsql
security definer
set search_path = public, auth
as $$
declare verified_phone text;
begin
  if auth.uid() is null then
    raise exception 'You must be signed in.';
  end if;

  select u.phone into verified_phone
  from auth.users u
  where u.id = auth.uid()
    and u.phone_confirmed_at is not null;

  if verified_phone is null then
    raise exception 'Verify your phone number by SMS before activating a Business Account.';
  end if;

  update public.profiles
  set role = 'seller'
  where id = auth.uid()
    and role = 'buyer';

  if not found then
    if exists (select 1 from public.profiles where id = auth.uid() and role = 'seller') then
      return;
    end if;
    raise exception 'Buyer profile not found or account cannot be upgraded.';
  end if;
end;
$$;

revoke all on function public.isoko_activate_business_account() from public, anon;
grant execute on function public.isoko_activate_business_account() to authenticated;
