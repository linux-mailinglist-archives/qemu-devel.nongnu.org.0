Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043432DC4EC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:01:50 +0100 (CET)
Received: from localhost ([::1]:34686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaBQ-0006GG-UM
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpa3K-0006Ag-9F
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:53:28 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpa3G-00030g-HJ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:53:26 -0500
Received: by mail-ed1-x52d.google.com with SMTP id h16so25565735edt.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CXTTTVFNbQ3kSqv7PUI1NMVYR8sl9xcWdsahjQFd7eY=;
 b=Ly8b+6H3lS0S4y8EpNRMt/dzEvYojmNkM3e6ZITN3umAE/c3zIOZ5aRK231tmcKax0
 st5fY8S1JEwEka5zd+BnobGXgtPQTq7f5l0sztrZmIXUjEuPQGOy378XhZr5+uaPmU6c
 14lWfNyA/p9C1xeSP5cr3oYFenwljumxLZ3mZCzhmiwgpDsGpQtmI7zgKPnfl3VmrgVS
 VhV4UgWZy4J18cptfH3z5l5u0sBHM5p0VA4rRB3/o5g1Q9pui4ZIytBCYk4HKdoyJh68
 AwPlYmI+gkCnGei7cnvRDlhhFprc/B0aQVSXX5LS0OSy7vxKBBKf38aABBCI0oReo9Oa
 NlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CXTTTVFNbQ3kSqv7PUI1NMVYR8sl9xcWdsahjQFd7eY=;
 b=SgmHaamylpF1kx8cG6zM9vE1/LAJoOPUITB3G1nU8nWCekhHvAWTQpAIl/dT10tVtC
 lWExD+RmYVg1f2m0S4rjF4suYeyxBQvtvYHxBEOs7nvFVACRGIli+udFWWbXdHHdbS1m
 2a1CPgCPgj9zI6k0Mo6TElQJI5Gv4dzQizHprEvTHDzt7dPpKD0IWCh9OG4z+Jutl8eJ
 a5gNZyPXlSQx2FHh2jMWYVGPLhSiwu2g1qFVKTrKFyEZHVIt7X5CVH0ay4Mkr3Megi3u
 2h9feJMo+1/lg7zn3cYXZkPCcgf1YEy22D14g9S9RJ7kevF7dnCsrr0J/9PRt1u55D/7
 H/qA==
X-Gm-Message-State: AOAM532P2VcvzpGiUOnjxeDugs6h5EH5lG0eKPSu2PuFSmGgchoRNV7W
 cQfvfrvZWF/FynDmaLRp81FOj9G1IYZtl38P1cg=
X-Google-Smtp-Source: ABdhPJxuXkazvxh0rs0/E5w32gHb8NuQcaVLCo3VD2nD/csN4+vZ58JrfLu2okPkgU87qD1BMXhZFmN9WXCdf2YoIKU=
X-Received: by 2002:a05:6402:318f:: with SMTP id
 di15mr34754133edb.237.1608137601189; 
 Wed, 16 Dec 2020 08:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20201216162006.433850-1-pbonzini@redhat.com>
 <20201216162006.433850-4-pbonzini@redhat.com>
In-Reply-To: <20201216162006.433850-4-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Dec 2020 20:53:09 +0400
Message-ID: <CAJ+F1CL3LFC--y7G-TQPHqeCBG0jGrZypPy-nigYVKEDPFj4kQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] meson: switch minimum meson version to 0.56.0
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000780d1e05b697b628"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000780d1e05b697b628
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 8:24 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Meson 0.56.0 does not need b_staticpic=3D$pie anymore, and has
> stabilized the keyval module.  Remove the workaround and use a few
> replacements for features deprecated in that release cycle.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure                     |  5 ----
>  docs/meson.build              | 12 ++++----
>  meson.build                   | 54 ++++++++++++++++-------------------
>  plugins/meson.build           |  4 +--
>  tests/meson.build             |  2 +-
>  tests/qapi-schema/meson.build |  4 +--
>  tests/qtest/meson.build       |  2 +-
>  trace/meson.build             |  4 +--
>  8 files changed, 39 insertions(+), 48 deletions(-)
>
> diff --git a/configure b/configure
> index 8d12b715e3..708cf365f0 100755
> --- a/configure
> +++ b/configure
> @@ -6965,10 +6965,6 @@ fi
>  mv $cross config-meson.cross
>
>  rm -rf meson-private meson-info meson-logs
> -unset staticpic
> -if ! version_ge "$($meson --version)" 0.56.0; then
> -  staticpic=3D$(if test "$pie" =3D yes; then echo true; else echo false;=
 fi)
> -fi
>  NINJA=3D$ninja $meson setup \
>          --prefix "$prefix" \
>          --libdir "$libdir" \
> @@ -6988,7 +6984,6 @@ NINJA=3D$ninja $meson setup \
>          -Dwerror=3D$(if test "$werror" =3D yes; then echo true; else ech=
o
> false; fi) \
>          -Dstrip=3D$(if test "$strip_opt" =3D yes; then echo true; else e=
cho
> false; fi) \
>          -Db_pie=3D$(if test "$pie" =3D yes; then echo true; else echo fa=
lse;
> fi) \
> -        ${staticpic:+-Db_staticpic=3D$staticpic} \
>          -Db_coverage=3D$(if test "$gcov" =3D yes; then echo true; else e=
cho
> false; fi) \
>          -Db_lto=3D$lto -Dcfi=3D$cfi -Dcfi_debug=3D$cfi_debug \
>          -Dmalloc=3D$malloc -Dmalloc_trim=3D$malloc_trim -Dsparse=3D$spar=
se \
> diff --git a/docs/meson.build b/docs/meson.build
> index bb8fe4c9e4..4e88ed7516 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -38,12 +38,12 @@ endif
>  if build_docs
>    SPHINX_ARGS +=3D ['-Dversion=3D' + meson.project_version(), '-Drelease=
=3D' +
> config_host['PKGVERSION']]
>
> -  sphinx_extn_depends =3D [ meson.source_root() / 'docs/sphinx/depfile.p=
y',
> -                          meson.source_root() / 'docs/sphinx/hxtool.py',
> -                          meson.source_root() /
> 'docs/sphinx/kerneldoc.py',
> -                          meson.source_root() /
> 'docs/sphinx/kernellog.py',
> -                          meson.source_root() / 'docs/sphinx/qapidoc.py'=
,
> -                          meson.source_root() /
> 'docs/sphinx/qmp_lexer.py',
> +  sphinx_extn_depends =3D [ meson.current_source_dir() /
> 'sphinx/depfile.py',
> +                          meson.current_source_dir() / 'sphinx/hxtool.py=
',
> +                          meson.current_source_dir() /
> 'sphinx/kerneldoc.py',
> +                          meson.current_source_dir() /
> 'sphinx/kernellog.py',
> +                          meson.current_source_dir() /
> 'sphinx/qapidoc.py',
> +                          meson.current_source_dir() /
> 'sphinx/qmp_lexer.py',
>                            qapi_gen_depends ]
>
>    configure_file(output: 'index.html',
> diff --git a/meson.build b/meson.build
> index 77ac9ec01b..39fc9b7143 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1,14 +1,10 @@
> -project('qemu', ['c'], meson_version: '>=3D0.55.0',
> -        default_options: ['warning_level=3D1', 'c_std=3Dgnu99',
> 'cpp_std=3Dgnu++11', 'b_colorout=3Dauto'] +
> -                         (meson.version().version_compare('>=3D0.56.0') =
? [
> 'b_staticpic=3Dfalse' ] : []),
> -        version: run_command('head', meson.source_root() /
> 'VERSION').stdout().strip())
> +project('qemu', ['c'], meson_version: '>=3D0.56.0',
> +        default_options: ['warning_level=3D1', 'c_std=3Dgnu99',
> 'cpp_std=3Dgnu++11', 'b_colorout=3Dauto',
> +                          'b_staticpic=3Dfalse'],
> +        version: run_command('head', meson.project_source_root() /
> 'VERSION').stdout().strip())
>
>  not_found =3D dependency('', required: false)
> -if meson.version().version_compare('>=3D0.56.0')
> -  keyval =3D import('keyval')
> -else
> -  keyval =3D import('unstable-keyval')
> -endif
> +keyval =3D import('keyval')
>  ss =3D import('sourceset')
>  fs =3D import('fs')
>
> @@ -1372,21 +1368,21 @@ genh +=3D configure_file(output: 'config-host.h',
> configuration: config_host_data)
>  hxtool =3D find_program('scripts/hxtool')
>  shaderinclude =3D find_program('scripts/shaderinclude.pl')
>  qapi_gen =3D find_program('scripts/qapi-gen.py')
> -qapi_gen_depends =3D [ meson.source_root() / 'scripts/qapi/__init__.py',
> -                     meson.source_root() / 'scripts/qapi/commands.py',
> -                     meson.source_root() / 'scripts/qapi/common.py',
> -                     meson.source_root() / 'scripts/qapi/error.py',
> -                     meson.source_root() / 'scripts/qapi/events.py',
> -                     meson.source_root() / 'scripts/qapi/expr.py',
> -                     meson.source_root() / 'scripts/qapi/gen.py',
> -                     meson.source_root() / 'scripts/qapi/introspect.py',
> -                     meson.source_root() / 'scripts/qapi/parser.py',
> -                     meson.source_root() / 'scripts/qapi/schema.py',
> -                     meson.source_root() / 'scripts/qapi/source.py',
> -                     meson.source_root() / 'scripts/qapi/types.py',
> -                     meson.source_root() / 'scripts/qapi/visit.py',
> -                     meson.source_root() / 'scripts/qapi/common.py',
> -                     meson.source_root() / 'scripts/qapi-gen.py'
> +qapi_gen_depends =3D [ meson.current_source_dir() /
> 'scripts/qapi/__init__.py',
> +                     meson.current_source_dir() /
> 'scripts/qapi/commands.py',
> +                     meson.current_source_dir() /
> 'scripts/qapi/common.py',
> +                     meson.current_source_dir() / 'scripts/qapi/error.py=
',
> +                     meson.current_source_dir() /
> 'scripts/qapi/events.py',
> +                     meson.current_source_dir() / 'scripts/qapi/expr.py'=
,
> +                     meson.current_source_dir() / 'scripts/qapi/gen.py',
> +                     meson.current_source_dir() /
> 'scripts/qapi/introspect.py',
> +                     meson.current_source_dir() /
> 'scripts/qapi/parser.py',
> +                     meson.current_source_dir() /
> 'scripts/qapi/schema.py',
> +                     meson.current_source_dir() /
> 'scripts/qapi/source.py',
> +                     meson.current_source_dir() / 'scripts/qapi/types.py=
',
> +                     meson.current_source_dir() / 'scripts/qapi/visit.py=
',
> +                     meson.current_source_dir() /
> 'scripts/qapi/common.py',
> +                     meson.current_source_dir() / 'scripts/qapi-gen.py'
>  ]
>
>  tracetool =3D [
> @@ -1894,14 +1890,14 @@ foreach target : target_dirs
>    if target.endswith('-softmmu')
>      execs =3D [{
>        'name': 'qemu-system-' + target_name,
> -      'gui': false,
> +      'win_subsystem': 'console',
>        'sources': files('softmmu/main.c'),
>        'dependencies': []
>      }]
>      if targetos =3D=3D 'windows' and (sdl.found() or gtk.found())
>        execs +=3D [{
>          'name': 'qemu-system-' + target_name + 'w',
> -        'gui': true,
> +        'win_subsystem': 'windows',
>          'sources': files('softmmu/main.c'),
>          'dependencies': []
>        }]
> @@ -1910,7 +1906,7 @@ foreach target : target_dirs
>        specific_fuzz =3D specific_fuzz_ss.apply(config_target, strict: fa=
lse)
>        execs +=3D [{
>          'name': 'qemu-fuzz-' + target_name,
> -        'gui': false,
> +        'win_subsystem': 'console',
>          'sources': specific_fuzz.sources(),
>          'dependencies': specific_fuzz.dependencies(),
>        }]
> @@ -1918,7 +1914,7 @@ foreach target : target_dirs
>    else
>      execs =3D [{
>        'name': 'qemu-' + target_name,
> -      'gui': false,
> +      'win_subsystem': 'console',
>        'sources': [],
>        'dependencies': []
>      }]
> @@ -1933,7 +1929,7 @@ foreach target : target_dirs
>                 link_language: link_language,
>                 link_depends: [block_syms, qemu_syms] +
> exe.get('link_depends', []),
>                 link_args: link_args,
> -               gui_app: exe['gui'])
> +               win_subsystem: exe['win_subsystem'])
>      }
>
>      if 'CONFIG_TRACE_SYSTEMTAP' in config_host
> diff --git a/plugins/meson.build b/plugins/meson.build
> index e77723010e..d58efc980e 100644
> --- a/plugins/meson.build
> +++ b/plugins/meson.build
> @@ -1,7 +1,7 @@
>  if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
> -  plugin_ldflags =3D ['-Wl,--dynamic-list=3D' + (meson.build_root() /
> 'qemu-plugins-ld.symbols')]
> +  plugin_ldflags =3D ['-Wl,--dynamic-list=3D' + (meson.project_build_roo=
t() /
> 'qemu-plugins-ld.symbols')]
>  elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
> -  plugin_ldflags =3D ['-Wl,-exported_symbols_list,' + (meson.build_root(=
) /
> 'qemu-plugins-ld64.symbols')]
> +  plugin_ldflags =3D ['-Wl,-exported_symbols_list,' +
> (meson.project_build_root() / 'qemu-plugins-ld64.symbols')]
>  else
>    plugin_ldflags =3D []
>  endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 1fa068f27b..0b8c3c6f32 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -113,7 +113,7 @@ tests =3D {
>    'test-keyval': [testqapi],
>    'test-logging': [],
>    'test-uuid': [],
> -  'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() /
> 'hw/core/ptimer.c'],
> +  'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() /
> 'hw/core/ptimer.c'],
>    'test-qapi-util': [],
>  }
>
> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.buil=
d
> index 304ef939bd..26588396d2 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -1,5 +1,5 @@
>  test_env =3D environment()
> -test_env.set('PYTHONPATH', meson.source_root() / 'scripts')
> +test_env.set('PYTHONPATH', meson.project_source_root() / 'scripts')
>  test_env.set('PYTHONIOENCODING', 'utf-8')
>
>  schemas =3D [
> @@ -240,7 +240,7 @@ if build_docs
>                                 # clutter up the build dir with the cache=
.
>                                 command: [SPHINX_ARGS,
>                                           '-b', 'text', '-E',
> -                                         '-c', meson.source_root() /
> 'docs',
> +                                         '-c',
> meson.project_source_root() / 'docs',
>                                           '-D', 'master_doc=3Ddoc-good',
>                                           meson.current_source_dir(),
>                                           meson.current_build_dir()])
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 6a67c538be..450af3e51c 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -237,7 +237,7 @@ foreach dir : target_dirs
>      qtest_env.set('QTEST_QEMU_IMG', './qemu-img')
>      test_deps +=3D [qemu_img]
>    endif
> -  qtest_env.set('G_TEST_DBUS_DAEMON', meson.source_root() /
> 'tests/dbus-vmstate-daemon.sh')
> +  qtest_env.set('G_TEST_DBUS_DAEMON', meson.project_source_root() /
> 'tests/dbus-vmstate-daemon.sh')
>    qtest_env.set('QTEST_QEMU_BINARY', './qemu-system-' + target_base)
>
>    foreach test : target_qtests
> diff --git a/trace/meson.build b/trace/meson.build
> index b19309b327..012d0dbceb 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -2,7 +2,7 @@ specific_ss.add(files('control-target.c'))
>
>  trace_events_files =3D []
>  foreach dir : [ '.' ] + trace_events_subdirs
> -  trace_events_file =3D meson.source_root() / dir / 'trace-events'
> +  trace_events_file =3D meson.project_source_root() / dir / 'trace-event=
s'
>    trace_events_files +=3D [ trace_events_file ]
>    group_name =3D dir =3D=3D '.' ? 'root' : dir.underscorify()
>    group =3D '--group=3D' + group_name
> @@ -68,7 +68,7 @@ foreach d : [
>  ]
>    gen =3D custom_target(d[0],
>                  output: d[0],
> -                input: meson.source_root() / 'trace-events',
> +                input: meson.project_source_root() / 'trace-events',
>                  command: [ tracetool, '--group=3Droot', '--format=3D@0@'=
.format(d[1]),
> '@INPUT@' ],
>                  capture: true)
>    specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
> --
> 2.29.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000780d1e05b697b628
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020 at 8:24 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Meso=
n 0.56.0 does not need b_staticpic=3D$pie anymore, and has<br>
stabilized the keyval module.=C2=A0 Remove the workaround and use a few<br>
replacements for features deprecated in that release cycle.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 5 ----<br>
=C2=A0docs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12=
 ++++----<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 54 ++++++++++++++++-------------------<br>
=C2=A0plugins/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4=
 +--<br>
=C2=A0tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
=C2=A0tests/qapi-schema/meson.build |=C2=A0 4 +--<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0trace/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 +--<br>
=C2=A08 files changed, 39 insertions(+), 48 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 8d12b715e3..708cf365f0 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -6965,10 +6965,6 @@ fi<br>
=C2=A0mv $cross config-meson.cross<br>
<br>
=C2=A0rm -rf meson-private meson-info meson-logs<br>
-unset staticpic<br>
-if ! version_ge &quot;$($meson --version)&quot; 0.56.0; then<br>
-=C2=A0 staticpic=3D$(if test &quot;$pie&quot; =3D yes; then echo true; els=
e echo false; fi)<br>
-fi<br>
=C2=A0NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--prefix &quot;$prefix&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--libdir &quot;$libdir&quot; \<br>
@@ -6988,7 +6984,6 @@ NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dwerror=3D$(if test &quot;$werror&quot; =
=3D yes; then echo true; else echo false; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dstrip=3D$(if test &quot;$strip_opt&quot=
; =3D yes; then echo true; else echo false; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Db_pie=3D$(if test &quot;$pie&quot; =3D =
yes; then echo true; else echo false; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${staticpic:+-Db_staticpic=3D$staticpic} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Db_coverage=3D$(if test &quot;$gcov&quot=
; =3D yes; then echo true; else echo false; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Db_lto=3D$lto -Dcfi=3D$cfi -Dcfi_debug=
=3D$cfi_debug \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dmalloc=3D$malloc -Dmalloc_trim=3D$mallo=
c_trim -Dsparse=3D$sparse \<br>
diff --git a/docs/meson.build b/docs/meson.build<br>
index bb8fe4c9e4..4e88ed7516 100644<br>
--- a/docs/meson.build<br>
+++ b/docs/meson.build<br>
@@ -38,12 +38,12 @@ endif<br>
=C2=A0if build_docs<br>
=C2=A0 =C2=A0SPHINX_ARGS +=3D [&#39;-Dversion=3D&#39; + meson.project_versi=
on(), &#39;-Drelease=3D&#39; + config_host[&#39;PKGVERSION&#39;]]<br>
<br>
-=C2=A0 sphinx_extn_depends =3D [ meson.source_root() / &#39;docs/sphinx/de=
pfile.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 meson.source_root() / &#39;docs/sphinx/hxtool.py&#39;,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 meson.source_root() / &#39;docs/sphinx/kerneldoc.py&#39;,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 meson.source_root() / &#39;docs/sphinx/kernellog.py&#39;,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 meson.source_root() / &#39;docs/sphinx/qapidoc.py&#39;,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 meson.source_root() / &#39;docs/sphinx/qmp_lexer.py&#39;,=
<br>
+=C2=A0 sphinx_extn_depends =3D [ meson.current_source_dir() / &#39;sphinx/=
depfile.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 meson.current_source_dir() / &#39;sphinx/hxtool.py&#39;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 meson.current_source_dir() / &#39;sphinx/kerneldoc.py&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 meson.current_source_dir() / &#39;sphinx/kernellog.py&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 meson.current_source_dir() / &#39;sphinx/qapidoc.py&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 meson.current_source_dir() / &#39;sphinx/qmp_lexer.py&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0qapi_gen_depends ]<br>
<br>
=C2=A0 =C2=A0configure_file(output: &#39;index.html&#39;,<br>
diff --git a/meson.build b/meson.build<br>
index 77ac9ec01b..39fc9b7143 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1,14 +1,10 @@<br>
-project(&#39;qemu&#39;, [&#39;c&#39;], meson_version: &#39;&gt;=3D0.55.0&#=
39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 default_options: [&#39;warning_level=3D1&#39;,=
 &#39;c_std=3Dgnu99&#39;, &#39;cpp_std=3Dgnu++11&#39;, &#39;b_colorout=3Dau=
to&#39;] +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(meson.version().version_compare(&#39;&gt;=3D0.56.0&#39;) =
? [ &#39;b_staticpic=3Dfalse&#39; ] : []),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 version: run_command(&#39;head&#39;, meson.sou=
rce_root() / &#39;VERSION&#39;).stdout().strip())<br>
+project(&#39;qemu&#39;, [&#39;c&#39;], meson_version: &#39;&gt;=3D0.56.0&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default_options: [&#39;warning_level=3D1&#39;,=
 &#39;c_std=3Dgnu99&#39;, &#39;cpp_std=3Dgnu++11&#39;, &#39;b_colorout=3Dau=
to&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;b_staticpic=3Dfalse&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 version: run_command(&#39;head&#39;, meson.pro=
ject_source_root() / &#39;VERSION&#39;).stdout().strip())<br>
<br>
=C2=A0not_found =3D dependency(&#39;&#39;, required: false)<br>
-if meson.version().version_compare(&#39;&gt;=3D0.56.0&#39;)<br>
-=C2=A0 keyval =3D import(&#39;keyval&#39;)<br>
-else<br>
-=C2=A0 keyval =3D import(&#39;unstable-keyval&#39;)<br>
-endif<br>
+keyval =3D import(&#39;keyval&#39;)<br>
=C2=A0ss =3D import(&#39;sourceset&#39;)<br>
=C2=A0fs =3D import(&#39;fs&#39;)<br>
<br>
@@ -1372,21 +1368,21 @@ genh +=3D configure_file(output: &#39;config-host.h=
&#39;, configuration: config_host_data)<br>
=C2=A0hxtool =3D find_program(&#39;scripts/hxtool&#39;)<br>
=C2=A0shaderinclude =3D find_program(&#39;scripts/<a href=3D"http://shaderi=
nclude.pl" rel=3D"noreferrer" target=3D"_blank">shaderinclude.pl</a>&#39;)<=
br>
=C2=A0qapi_gen =3D find_program(&#39;scripts/qapi-gen.py&#39;)<br>
-qapi_gen_depends =3D [ meson.source_root() / &#39;scripts/qapi/__init__.py=
&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/commands.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/common.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/error.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/events.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/expr.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/gen.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/introspect.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/parser.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/schema.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/source.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/types.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/visit.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi/common.py&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.source_root() / &#39;scripts/qapi-gen.py&#39;<br>
+qapi_gen_depends =3D [ meson.current_source_dir() / &#39;scripts/qapi/__in=
it__.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/commands.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/common.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/error.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/events.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/expr.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/gen.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/introspect.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/parser.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/schema.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/source.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/types.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/visit.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi/common.py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;scripts/qapi-gen.py&#39;<br>
=C2=A0]<br>
<br>
=C2=A0tracetool =3D [<br>
@@ -1894,14 +1890,14 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0if target.endswith(&#39;-softmmu&#39;)<br>
=C2=A0 =C2=A0 =C2=A0execs =3D [{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;name&#39;: &#39;qemu-system-&#39; + target_=
name,<br>
-=C2=A0 =C2=A0 =C2=A0 &#39;gui&#39;: false,<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;win_subsystem&#39;: &#39;console&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sources&#39;: files(&#39;softmmu/main.c&#39=
;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dependencies&#39;: []<br>
=C2=A0 =C2=A0 =C2=A0}]<br>
=C2=A0 =C2=A0 =C2=A0if targetos =3D=3D &#39;windows&#39; and (sdl.found() o=
r gtk.found())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0execs +=3D [{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;name&#39;: &#39;qemu-system-&#39; + =
target_name + &#39;w&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;gui&#39;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;win_subsystem&#39;: &#39;windows&#39;,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sources&#39;: files(&#39;softmmu/mai=
n.c&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dependencies&#39;: []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}]<br>
@@ -1910,7 +1906,7 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0specific_fuzz =3D specific_fuzz_ss.apply(config_=
target, strict: false)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0execs +=3D [{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;name&#39;: &#39;qemu-fuzz-&#39; + ta=
rget_name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;gui&#39;: false,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;win_subsystem&#39;: &#39;console&#39;,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sources&#39;: specific_fuzz.sources(=
),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dependencies&#39;: specific_fuzz.dep=
endencies(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}]<br>
@@ -1918,7 +1914,7 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0execs =3D [{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;name&#39;: &#39;qemu-&#39; + target_name,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 &#39;gui&#39;: false,<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;win_subsystem&#39;: &#39;console&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sources&#39;: [],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dependencies&#39;: []<br>
=C2=A0 =C2=A0 =C2=A0}]<br>
@@ -1933,7 +1929,7 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_language: link=
_language,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_depends: [bloc=
k_syms, qemu_syms] + exe.get(&#39;link_depends&#39;, []),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_args: link_arg=
s,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gui_app: exe[&#39;g=
ui&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0win_subsystem: exe[=
&#39;win_subsystem&#39;])<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if &#39;CONFIG_TRACE_SYSTEMTAP&#39; in config_host<br>
diff --git a/plugins/meson.build b/plugins/meson.build<br>
index e77723010e..d58efc980e 100644<br>
--- a/plugins/meson.build<br>
+++ b/plugins/meson.build<br>
@@ -1,7 +1,7 @@<br>
=C2=A0if &#39;CONFIG_HAS_LD_DYNAMIC_LIST&#39; in config_host<br>
-=C2=A0 plugin_ldflags =3D [&#39;-Wl,--dynamic-list=3D&#39; + (meson.build_=
root() / &#39;qemu-plugins-ld.symbols&#39;)]<br>
+=C2=A0 plugin_ldflags =3D [&#39;-Wl,--dynamic-list=3D&#39; + (meson.projec=
t_build_root() / &#39;qemu-plugins-ld.symbols&#39;)]<br>
=C2=A0elif &#39;CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST&#39; in config_host<br>
-=C2=A0 plugin_ldflags =3D [&#39;-Wl,-exported_symbols_list,&#39; + (meson.=
build_root() / &#39;qemu-plugins-ld64.symbols&#39;)]<br>
+=C2=A0 plugin_ldflags =3D [&#39;-Wl,-exported_symbols_list,&#39; + (meson.=
project_build_root() / &#39;qemu-plugins-ld64.symbols&#39;)]<br>
=C2=A0else<br>
=C2=A0 =C2=A0plugin_ldflags =3D []<br>
=C2=A0endif<br>
diff --git a/tests/meson.build b/tests/meson.build<br>
index 1fa068f27b..0b8c3c6f32 100644<br>
--- a/tests/meson.build<br>
+++ b/tests/meson.build<br>
@@ -113,7 +113,7 @@ tests =3D {<br>
=C2=A0 =C2=A0&#39;test-keyval&#39;: [testqapi],<br>
=C2=A0 =C2=A0&#39;test-logging&#39;: [],<br>
=C2=A0 =C2=A0&#39;test-uuid&#39;: [],<br>
-=C2=A0 &#39;ptimer-test&#39;: [&#39;ptimer-test-stubs.c&#39;, meson.source=
_root() / &#39;hw/core/ptimer.c&#39;],<br>
+=C2=A0 &#39;ptimer-test&#39;: [&#39;ptimer-test-stubs.c&#39;, meson.projec=
t_source_root() / &#39;hw/core/ptimer.c&#39;],<br>
=C2=A0 =C2=A0&#39;test-qapi-util&#39;: [],<br>
=C2=A0}<br>
<br>
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build<=
br>
index 304ef939bd..26588396d2 100644<br>
--- a/tests/qapi-schema/meson.build<br>
+++ b/tests/qapi-schema/meson.build<br>
@@ -1,5 +1,5 @@<br>
=C2=A0test_env =3D environment()<br>
-test_env.set(&#39;PYTHONPATH&#39;, meson.source_root() / &#39;scripts&#39;=
)<br>
+test_env.set(&#39;PYTHONPATH&#39;, meson.project_source_root() / &#39;scri=
pts&#39;)<br>
=C2=A0test_env.set(&#39;PYTHONIOENCODING&#39;, &#39;utf-8&#39;)<br>
<br>
=C2=A0schemas =3D [<br>
@@ -240,7 +240,7 @@ if build_docs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # clutter up the build dir with the =
cache.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [SPHINX_ARGS,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;-b&#39;, &#39;text&#39;, &#39;-E&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;-c&#39;, meson.source_root() / &#39;docs&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;-c&#39;, meson.project_source_root() / &#39;docs&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;-D&#39;, &#39;master_doc=3Ddoc-good&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m=
eson.current_source_dir(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m=
eson.current_build_dir()])<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 6a67c538be..450af3e51c 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -237,7 +237,7 @@ foreach dir : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0qtest_env.set(&#39;QTEST_QEMU_IMG&#39;, &#39;./qemu-img=
&#39;)<br>
=C2=A0 =C2=A0 =C2=A0test_deps +=3D [qemu_img]<br>
=C2=A0 =C2=A0endif<br>
-=C2=A0 qtest_env.set(&#39;G_TEST_DBUS_DAEMON&#39;, meson.source_root() / &=
#39;tests/dbus-vmstate-daemon.sh&#39;)<br>
+=C2=A0 qtest_env.set(&#39;G_TEST_DBUS_DAEMON&#39;, meson.project_source_ro=
ot() / &#39;tests/dbus-vmstate-daemon.sh&#39;)<br>
=C2=A0 =C2=A0qtest_env.set(&#39;QTEST_QEMU_BINARY&#39;, &#39;./qemu-system-=
&#39; + target_base)<br>
<br>
=C2=A0 =C2=A0foreach test : target_qtests<br>
diff --git a/trace/meson.build b/trace/meson.build<br>
index b19309b327..012d0dbceb 100644<br>
--- a/trace/meson.build<br>
+++ b/trace/meson.build<br>
@@ -2,7 +2,7 @@ specific_ss.add(files(&#39;control-target.c&#39;))<br>
<br>
=C2=A0trace_events_files =3D []<br>
=C2=A0foreach dir : [ &#39;.&#39; ] + trace_events_subdirs<br>
-=C2=A0 trace_events_file =3D meson.source_root() / dir / &#39;trace-events=
&#39;<br>
+=C2=A0 trace_events_file =3D meson.project_source_root() / dir / &#39;trac=
e-events&#39;<br>
=C2=A0 =C2=A0trace_events_files +=3D [ trace_events_file ]<br>
=C2=A0 =C2=A0group_name =3D dir =3D=3D &#39;.&#39; ? &#39;root&#39; : dir.u=
nderscorify()<br>
=C2=A0 =C2=A0group =3D &#39;--group=3D&#39; + group_name<br>
@@ -68,7 +68,7 @@ foreach d : [<br>
=C2=A0]<br>
=C2=A0 =C2=A0gen =3D custom_target(d[0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output: d[0],=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input: meson.sourc=
e_root() / &#39;trace-events&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input: meson.proje=
ct_source_root() / &#39;trace-events&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command: [ tr=
acetool, &#39;--group=3Droot&#39;, &#39;--format=3D@0@&#39;.format(d[1]), &=
#39;@INPUT@&#39; ],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0capture: true=
)<br>
=C2=A0 =C2=A0specific_ss.add(when: &#39;CONFIG_TCG&#39;, if_true: gen)<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000780d1e05b697b628--

