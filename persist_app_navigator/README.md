# persist_app_navigator

A clone of the **app_navigator**  app using **Riverpod** and **StateNotifierProvider** with the help of **shared_preferences** to ensure that as the app state is changed it is persisted. This allows the app to restart at the point it was shut down.

The persistence is now optional with a default of being turue.

This persistence technique could also be used for initialising lists or other data.
