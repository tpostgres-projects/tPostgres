# src/pl/plperl/nls.mk
CATALOG_NAME     = plperl
AVAIL_LANGUAGES  = de es fr it ja pt_BR ro tr zh_CN zh_TW
GETTEXT_FILES    = plperl.c SPI.c
GETTEXT_TRIGGERS = $(BACKEND_COMMON_GETTEXT_TRIGGERS)
