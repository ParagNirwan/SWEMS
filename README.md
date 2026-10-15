# Smart Warehouse Environment Monitoring System (SWEMS)

SWEMS is an IoT coursework project that monitors warehouse environmental conditions using a DHT22 temperature/humidity sensor and an MQ-4 gas sensor on a Pinecone BL602 board.

## Team

- Amit Kumar Yadav
- Ameya Prashant Benare
- Parag Nirwan

## Repository contents

The repository includes firmware/project sources, a Makefile, configuration files, and supporting components referenced through Git submodules.

## Build notes

Use the toolchain and setup instructions for the BL602 board and the linked SDK/submodules. Initialize submodules after cloning:

```bash
git submodule update --init --recursive
```

Then review the Makefile and project configuration for the expected toolchain and build targets. Hardware readings should be validated against known conditions before the system is used for any safety-critical monitoring.

## Repository hygiene

Generated build output should be reproducible from source and generally should not be committed. Keep source code, configuration templates, and documentation separate from compiled artifacts.