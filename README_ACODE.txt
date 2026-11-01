ISOKO PLUS — ACODE READY (SELF-CONTAINED PAGES)
=================================================

IMPORTANT: Every HTML page includes its own CSS and JavaScript.
You do NOT need to copy css/ or js/ files. This package is designed
to avoid Acode Preview failing to find linked CSS/JS files.

OPEN ON ANDROID / ACODE
1. Download this ZIP.
2. Extract it completely.
3. In Acode, use Open Folder and select ISOKO_PLUS_ACODE_READY.
4. Open index.html from that extracted folder.
5. Tap Preview.
6. Use the navigation links at the top or footer to open other pages.
7. Dashboard pages are inside the dashboards folder.

PAGES
index.html, buy.html, rent.html, categories.html, product.html,
about.html, contact.html, login.html, register.html, terms.html,
privacy.html, delivery.html,
dashboards/admin.html, dashboards/seller.html, dashboards/buyer.html

NO DEMO PRODUCTS
The marketplace intentionally shows no fake sample listings.
Seller listing creation saves only in this browser preview.

IMPORTANT LIMITATION
This is a front-end preview. Authentication, secure admin access,
Supabase persistence, payment processing, orders, delivery tracking,
disputes and payouts are not production-enabled. Do not use real
passwords or payment credentials. Connect and test the separate
ISOKO PLUS backend before deployment.


OFFICIAL CONTACT DETAILS
WhatsApp: https://wa.me/250784520912
Instagram: https://www.instagram.com/erick_gavana_films?srtk=MTFjNnd2aHNrbzBzOA==
YouTube: https://youtube.com/@erick-gavana?si=E4ynH0A4J12PK28d
Email: djeeyerick@gmail.com

The header and footer logo links return users to index.html. About and Contact pages
include the updated ISOKO PLUS information and official contact channels.


SUPABASE BACKEND CONNECTION
===========================
This build uses the Supabase project URL and publishable key supplied by the
ISOKO PLUS owner. The publishable key is intended for browser use; never place
a Supabase secret/service_role key in website files.

SETUP REQUIRED BEFORE AUTHENTICATION WORKS
1. Open https://supabase.com/dashboard and select the ISOKO PLUS project.
2. Open SQL Editor > New query.
3. Open SUPABASE_SETUP.sql from this package, copy all SQL, paste it in SQL
   Editor and press Run. Confirm the query succeeds.
4. In Supabase Authentication > URL Configuration, set Site URL to the final
   deployed website URL. Add the deployed URL and its wildcard path to
   Redirect URLs if required by your hosting setup.
5. Deploy the complete folder to hosting (GitHub Pages/Netlify/etc.) and use
   the deployed HTTPS URL to test. Do not test Supabase auth using file://.
6. In Supabase > Authentication > Providers > Email, turn OFF "Confirm email"
   if you want ordinary account registration to sign users in immediately.
   This is required for the instant-registration experience in this build.
7. Configure an SMS provider in Supabase Authentication > Providers > Phone
   (for example, a supported Twilio SMS setup) and enable Phone authentication.
   SMS delivery may incur provider charges. Without an SMS provider, business
   phone verification cannot send real codes.
8. Open Register and create an ordinary Buyer / Renter account. No email
   confirmation is requested when Confirm email is OFF.
9. From the Buyer dashboard, use "Open a Business Account", enter a phone
   number in international format (+250...), request the SMS code, then enter
   it to verify and activate the Seller / Lender role.
10. Seller listings are saved in Supabase with status pending; they are not
    publicly visible until an admin publishes them.

ADMIN ACCOUNT
-------------
Register the owner's account first. Then run the final UPDATE statement in
SUPABASE_SETUP.sql after replacing YOUR-ADMIN-EMAIL with the owner's exact
email address. Admin role is deliberately not offered on public registration.
Only the project owner should promote an account to admin.

CURRENT SCOPE / IMPORTANT
-------------------------
- Supabase email/password signup and login are connected.
- Public registration creates Buyer / Renter accounts only.
- Ordinary registration can sign in immediately only when Supabase Email
  "Confirm email" is OFF.
- Business Account activation requires verified SMS phone OTP and the SQL
  function public.isoko_activate_business_account().
- Admin role cannot be created from public registration.
- Dashboard access checks the user's profile role and database RLS policies.
- Seller product creation writes to the Supabase products table as pending.
- Public product pages read only published listings.
- Orders, checkout, payments, delivery, refunds, chat, seller payouts, and
  full admin moderation UI are not yet implemented. Do not accept real
  payments or claim a transaction is complete until those modules are built
  and tested.


EXISTING SUPABASE PROJECT - APPLY THE BUSINESS VERIFICATION UPDATE
------------------------------------------------------------------
If the base schema has already been run, run BUSINESS_PHONE_VERIFICATION.sql
once in Supabase SQL Editor. Also confirm:
- Authentication > Providers > Email > Confirm email = OFF.
- Authentication > Providers > Phone is enabled.
- A working SMS provider is configured in Supabase.
Then test with a real phone number in international format.
