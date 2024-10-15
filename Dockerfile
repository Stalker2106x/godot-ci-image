FROM bitnami/dotnet:6

RUN wget https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_mono_linux_x86_64.zip && \
    unzip Godot_v4.3-stable_mono_linux_x86_64.zip && \
    rm -rf Godot_v4.3-stable_mono_linux_x86_64.zip && \
    cd Godot_v4.3-stable_mono_linux_x86_64/ && \
    mv Godot_v4.3-stable_mono_linux.x86_64 godot && \
    mv * /usr/bin && \
    wget https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_mono_export_templates.tpz && \
    unzip Godot_v4.3-stable_mono_export_templates.tpz && \
    rm -rf Godot_v4.3-stable_mono_export_templates.tpz && \
    mkdir -p /usr/local/share/godot/templates/ && \
    mv templates/* /usr/local/share/godot/templates/