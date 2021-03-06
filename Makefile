NAME =			drupal
VERSION =		latest
VERSION_ALIASES =	7.40 7
TITLE =			Drupal 7.40
DESCRIPTION =		Drupal is an open source content management platform
SOURCE_URL =		https://github.com/scaleway-community/scaleway-drupal
DOC_URL =		https://scaleway.com/docs/getting-started-with-the-drupal-instant-apps/
VENDOR_URL =		https://www.drupal.org/

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	stable
IMAGE_NAME =		Drupal 7.40

## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
