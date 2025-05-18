.PHONY: package-win package-lin clean

package-win:
	@echo "Packaging windows executable"
	cp -r data build/
	/usr/bin/flatpak run org.godotengine.Godot --command=godot --headless --export-release "Windows Desktop" ./build/Praedor_Chargen.exe
	ark --add-to ./build/Praedor_Chargen_Win.zip ./build/Praedor_Chargen.exe ./build/data
	rm -r build/data

package-lin:
	@echo "Packaging linux executable"
	cp -r data build/
	/usr/bin/flatpak run org.godotengine.Godot --command=godot --headless --export-release "Linux Desktop" ./build/Praedor_Chargen.exe
	ark --add-to ./build/Praedor_Chargen_Lin.zip ./build/Praedor_Chargen.bin.x86_64 ./build/Praedor_Chargen.bin.sh ./build/data
	rm -r build/data

clean:
	rm -r build/*
