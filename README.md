failed to install perl-5.26.0-RC1 into centos5

full log: https://gist.github.com/skaji/842d5a4688ce39164bb9e375b5467b66

```
Step 6/8 : RUN gcc --version
 ---> Running in 44e928c7299d
gcc (GCC) 4.1.2 20080704 (Red Hat 4.1.2-55)
Copyright (C) 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Step 7/8 : RUN make --version
 ---> Running in 32116c8a8adf
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for x86_64-redhat-linux-gnu

Step 8/8 : RUN cd perl-5.26.0-RC1 && ./Configure -des && make
 ---> Running in 4db5f66fded4
...

cc -fstack-protector -L/usr/local/lib -o miniperl \
	    opmini.o perlmini.o  gv.o toke.o perly.o pad.o regcomp.o dump.o util.o mg.o reentr.o mro_core.o keywords.o hv.o av.o run.o pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o utf8.o taint.o deb.o universal.o globals.o perlio.o perlapi.o numeric.o mathoms.o locale.o pp_pack.o pp_sort.o caretx.o dquote.o time64.o  miniperlmain.o  -lpthread -lnsl -ldl -lm -lcrypt -lutil -lc
sv.o: In function `S_hextract':
sv.c:(.text+0xe11): undefined reference to `Perl_fp_class_denorm'
collect2: ld returned 1 exit status
make: *** [lib/buildcustomize.pl] Error 1
```
