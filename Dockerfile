FROM debian:bookworm-slim

# Install Dotnet 6.0+
RUN apt-get update && apt-get install -y wget unzip zip && \
    wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y dotnet-sdk-8.0

# Install Godot 4.3
RUN wget https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_mono_linux_x86_64.zip && \
    unzip Godot_v4.3-stable_mono_linux_x86_64.zip && \
    rm -rf Godot_v4.3-stable_mono_linux_x86_64.zip && \
    cd Godot_v4.3-stable_mono_linux_x86_64/ && \
    mv Godot_v4.3-stable_mono_linux.x86_64 godot && \
    mv * /usr/bin && \
    # Install Godot export templates for 4.3
    wget https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_mono_export_templates.tpz && \
    unzip Godot_v4.3-stable_mono_export_templates.tpz && \
    rm -rf Godot_v4.3-stable_mono_export_templates.tpz && \
    mkdir -p /usr/local/share/godot/templates/ && \
    mv templates/* /usr/local/share/godot/templates/