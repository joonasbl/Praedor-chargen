.PHONY: package-win package-lin

package-win:
	@echo "Packaging windows executable"
	cp -r data build/
	ark --add-to ./build/Praedor_Chargen_Win.zip ./build/Praedor_Chargen.bin.exe ./build/data
	rm -r build/data

package-lin:
	@echo "Packaging linux executable"
	cp -r data build/
	ark --add-to ./build/Praedor_Chargen_Lin.zip ./build/Praedor_Chargen.bin.x86_64 ./build/Praedor_Chargen.bin.sh ./build/data
	rm -r build/data