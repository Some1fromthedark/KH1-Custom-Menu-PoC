// src/main.c

//#include <stdint.h>

/*
 * Address of the original function entry point.
 *
 * Replace this with the function address you are hooking.
 * This should be the address that the hook originally jumped to.
 */
#define ORIGINAL_CONFIG_MENU_FUNCTION_ADDRESS 0x00219F98


typedef void (*OriginalConfigMenuFunction_t)(void);


/*
 * Call the original function.
 *
 * This symbol is exported into the ELF and is what your
 * config.json should reference.
 */
void custom_config_options_handler(void)
{
    OriginalConfigMenuFunction_t original =
        (OriginalConfigMenuFunction_t)ORIGINAL_CONFIG_MENU_FUNCTION_ADDRESS;

    original();
}
