

#!/bin/bash

filename = "infra/.terraform"

if[ -d $filename ]
then
	exit
else
	
		cd infra
		terraform init
		cd -

fi	
