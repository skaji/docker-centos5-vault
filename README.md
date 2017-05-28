# Failed to build perl-5.26.0-RC2 on CentOS 5

* http://blogs.perl.org/users/yuki_kimoto/2017/05/i-cant-install-perl-5260-rc1-in-centos-5.html
* http://www.nntp.perl.org/group/perl.perl5.porters/2017/05/msg244376.html

```
> gcc --version
gcc (GCC) 4.1.2 20080704 (Red Hat 4.1.2-55)

> cd perl-5.26.0-RC2 && ./Configure -de && make
...
cc -fstack-protector -L/usr/local/lib -o miniperl \
	    opmini.o perlmini.o  gv.o toke.o perly.o pad.o regcomp.o dump.o util.o mg.o reentr.o mro_core.o keywords.o hv.o av.o run.o pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o utf8.o taint.o deb.o universal.o globals.o perlio.o perlapi.o numeric.o mathoms.o locale.o pp_pack.o pp_sort.o caretx.o dquote.o time64.o  miniperlmain.o  -lpthread -lnsl -ldl -lm -lcrypt -lutil -lc
sv.o: In function `S_hextract':
sv.c:(.text+0xe11): undefined reference to `Perl_fp_class_denorm'
collect2: ld returned 1 exit status
make: *** [lib/buildcustomize.pl] Error 1
```

See [full.log](full.log) for details.

# How can we reproduce this failure?

I assume you have docker. Then:

```
> git clone git://github.com/skaji/docker-centos5-vault.git
> cd docker-centos5-vault
> docker build .
```

# From when?

From [these commits](https://perl5.git.perl.org/perl.git/commitdiff/624c42e..1bee6ae) (cf [github](https://github.com/Perl/perl5/compare/624c42e...1bee6ae)),
we cannot build perl on CentOS 5.

# Why?

From [these commits](https://perl5.git.perl.org/perl.git/commitdiff/624c42e..1bee6ae) (cf [github](https://github.com/Perl/perl5/compare/624c42e...1bee6ae)),
perl uses `Perl_fp_class_denorm` function to check whether numbers are subnormal or not.

As [Dave Mitchell](http://www.nntp.perl.org/group/perl.perl5.porters/2017/05/msg244382.html)
pointed at,
the function `Perl_fp_class_denorm` is defined by a complex series of alternates.
And it may happen that it is not defined on some platforms.

In fact, on CentOS 5, it is **NOT** defined. The related checks in `Configure` on CentOS 5 are below:

```
<quadmath.h> NOT found.
Checking to see if you have fpclassify...
You do not have fpclassify.
fp_classify() NOT found.
fp_classl() NOT found.
fpclass() NOT found.
fpclassl() NOT found.
```

See [full.log](full.log) for details.
