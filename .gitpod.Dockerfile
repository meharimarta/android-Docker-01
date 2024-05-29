# Use the gitpod/workspace-full image as the base image
FROM gitpod/workspace-full:latest

# Install Android SDK
RUN mkdir -p $ANDROID_HOME && \
    cd $ANDROID_HOME && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O android-sdk.zip && \
    unzip -qq android-sdk.zip && \
    rm android-sdk.zip

# Set environment variables
ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

# Accept licenses
RUN yes | sdkmanager --licenses

# Install necessary SDK packages
RUN sdkmanager "platforms;android-30" "build-tools;30.0.3"
