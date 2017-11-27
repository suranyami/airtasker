# Airtasker coding challenge

## Objective

This program is designed to give you the opportunity to show off your skills
and give us something we can talk about in your interview.

What we want is an example of code you're happy with and want to talk about.

If this is something you can provide from outside, that is great and we'd love
for you to show us in advance of your interview.

If not, that's cool, we have some standard coding challenges you can do too.

The coding challenge should take you between one and three hours, probably
depending on how recently you've done something similar...

## challenge one - Rate Limiter

For this challenge, you'll start off by creating a new rails application.
You can include any gems or other libraries you consider will be helpful.

Create a new controller, perhaps called "home", with an index method.
This should return only the text string "ok".

The challenge is to implement rate limiting on this controller.
Limit it such that a requester can only make 100 requests per hour.
After the limit has been reached, return a 429 with the text
"Rate limit exceeded. Try again in #{n} seconds".

How you do this is up to you. Think about how easy your rate limiter
will be to maintain and control. Try to write what you consider to be
production-quality code, with comments and tests if and when you consider
them necessary.

When you've finished, send us the link to your repo on github. Good luck!
