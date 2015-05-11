#!/usr/bin/env python

import sys, re
from distutils.version import StrictVersion

list1 = sorted(sys.argv[1:], reverse=True, key=lambda x: StrictVersion(re.sub('^\\D*', '', x)))
for line in list1:
	print line
