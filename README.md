# Transmission Keydnap Checker Script

*Simple Homebrew command to scan your system for Keydnap*

With the recent Keydnap malware distribution throught a Transmission application package, I stumbled accross a few checks to do to make sure that my system was not infected.

Being the nerd I am, instead of checking for the couple of files manually, I wrote a script and distribute it through Homebrew. Every occasion is a good occasion to learn!

## Installation

Simple! Run the following commands from your Terminal:

`$ brew tap vallieres/tap`

`$ brew install transmission-keydnap-checker`

Then simply run like so:

`$ transmission-keydnap-checker`

Read the summary for details on your machine state. If you are infected, you can check the following section for the cleanup steps.

## Cleanup

Refer to [Cleanup.md](https://github.com/vallieres/transmission-keydnap-checker/blob/master/Cleanup.md)

## Liability

Basically I wrote this for funzies. So don't think it's 100% bulletproof, it seems to work and I cannot be held liable if it does not properly scan you system. 

Remember that Keydnap is now at version 1.5 and it could get an update tommorow and reinfect Transmission or another package.

Refer to the [License](https://github.com/vallieres/transmission-keydnap-checker/blob/master/LICENSE) for details of liability.