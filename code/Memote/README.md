# memote



### Installation
```
pip install memote
```

### Main function

- `memote.py`:  Evaluate the quality of models by the metabolic model testing suite (MEMOTE).

### Input parameters
- `--filename`: output filename 


### Documentation
[The genome-scale metabolic model test suite](https://memote.readthedocs.io/)


### Other functions

- `excel2SBML.m`: Convert models from excel format to SBML format.

- `getDatabaseMappings.m`: Return information on known mappings of database entries to model field names, along with additional information about the  fields.

- `makeSBMLAnnotationString.m`: Give the annotationString for an SBML based on the fields in the model.

- `writeSBML.m`: Export a COBRA structure into an SBML FBCv2 file. 



### References

- Lieven, C., Beber, M.E., Olivier, B.G. et al. MEMOTE for standardized genome-scale metabolic model testing. Nat Biotechnol 38, 272–276 (2020). https://doi.org/10.1038/s41587-020-0446-y
