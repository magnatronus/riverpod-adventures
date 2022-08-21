# Riverpod Adventures
This is a collection of sample Flutter apps based on [Riverpod](https://riverpod.dev). While developing various apps I have used a variety of state management architectures/techniques such as

- setState
- Flutter BLoC
- Provider

each with their own way of providing a solution, usually depending on how complex (or simple) the app being written is. My current *goto* is [Provider](https://pub.dev/packages/provider) as it *'provides'* a good solution that allows me to create a simple structured and repeatable codebase for each app.

I have now started, for various reasons, looking at **Riverpod** as an alternative,  and so am starting with some simple scenarios that I have used in the past with **Provider** to see what the difference is  and to experiment with how to restructure the codebase of any potential projects.

*Please Note - this is by no means a **best practices** set of exercises it is a way for me to get to understand the many ways that an app could be architected using Riverpod in a way that relates to similar structures I have used with Provider*

## Projects

This is a list of the test projects, and hopefully the list will expand as I try out different things.

### app_navigator
A simple use of **StateProvider** to track the status of an app and show a different screen depending on that status.

### persist_app_navigator
This is a clone of **app_navigator** but as the state of the app changes the status is persisted using **shared_preferences**. This means that even if the app is shut down when it is restarted it will navigate to the screen it was last on, rather than restarting each time.

Really an example of initialising a StateNotifier **state** value with the result of an *async* call.