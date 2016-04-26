NAME =			drupal
VERSION =		latest
VERSION_ALIASES =	8.0.1 8.0 8
TITLE =			Drupal
DESCRIPTION =		Drupal is an open source content management platform
SOURCE_URL =		https://github.com/scaleway-community/scaleway-drupal
DOC_URL =		https://scaleway.com/docs/getting-started-with-the-drupal-instant-apps/
VENDOR_URL =		https://www.drupal.org/
DEFAULT_IMAGE_ARCH =	x86_64

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT = latest
IMAGE_NAME =		Drupal 8.0.1


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
