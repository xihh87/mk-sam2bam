SAM2BAM_TARGETS=`{./targets_sam2bam }

sam2bam:V: $SAM2BAM_TARGETS

clean:VE:
	rm -f $SAM2BAM_TARGETS || true

results/%.bam:		data/%.sam
	mkdir -p `dirname $target`
	samtools  view \
		-b \
		$prereq \
		-o $target'.build' \
	&& mv $target'.build' $target
