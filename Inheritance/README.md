# AdminSDHolder with DACL Protection Disabled

Unfortunately, it's more common than I'd like to see AD environments with inheritance enabled on AdminSDHolder. So it's important to test out and demonstrate the effect this has on the ability of AdminSDHolder to protect privileged accounts.

This follder contains data from a set of tests performed around when the DACL_Protected flag is removed from the AdminSDHolder object, which enables DACL inheritance on objects protected by AdminSDHolder, and the AdminSDHolder itself. The tests were performed in the AD2025.lan forest, specifically in the Inheritance.AD2025.lan child domain of my home lab.

DACL Inheritance Enabled contains screenshots and data captured from when the AdminSDHolder's DACL_Protected flag is removed, rendering the configuration in a less secure state.

DACL Protected State contains screenshots and data captured after the DACL_Protected flag had been re-enabled (which is the default state).
