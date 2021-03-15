Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AC033C4D0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:49:53 +0100 (CET)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrLk-0003Cg-Fr
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBb-0002y0-6j
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:23 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBY-0006we-T2
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:22 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v11so6114853wro.7
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=onMoUBLviSPCS3bpGBpIbx41tpTqISJsM1IU2zfIpXI=;
 b=frfHuBPjYwQ+iUARrIOIYT38/w7MuNvB+WV9tq7lySA/OPUxQ9sDGOnqGD0zjpxtna
 A54Gqk95dmsvsfRXADn8ZHQamxGV0mgS0aaRCZKalG76la7QF2/K8CNcWYl45K9Fnv5y
 qKthm8LMaqi+dQIQBk3fkfkdI1O6ntEzTOn5YjAYLNpLUrk+wLG/BViDVtPE3Fd6vVHU
 ojWmBlwQ+1m5/OF8e9mcU2C93ZnZ9xWN6WNgdWYr6OHLI6Fn3Fbn/lL3ahHMvPb5KmF0
 kX9HXRfnQG9YKKxPDmEhOpSnheh6fdXTuJsVwoF2hSk+BxWuxjkRTsXdCB2tKfAV4RgZ
 PxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=onMoUBLviSPCS3bpGBpIbx41tpTqISJsM1IU2zfIpXI=;
 b=Ib2Mf8yt+verBFRMbvcc5Kw8xkvB2oiM9Apjkx56ZA205PMXAoMXP7R69wqOTKfAZI
 p3huRpzn+0WfYAgZ0/+Uflcl8HUx2OzLAoUObEfJBd5SQ2La9eckAKl9r3fyDBOOe5bA
 KN95XIpayM4fqohCd2PsHOwftCf8iO4HHYWm1Rx2mgcU6tc66c2MKFUX+xsw21xfKgqF
 xKiQjcS7BoTRH62Uf9FgeBxp53QzG0cShEpbTSGLqHAbj0rNyiQVmqRrpzEpagB3I0r5
 LzdjA9eDZCR5nWDHxnscqA+Fyn9oOjHN3yCq8fHxKiU4JhGUhMIXdX3psvP3txTg74aV
 CxUA==
X-Gm-Message-State: AOAM530wrIRyqf9uNKMLmzYFmPRMwQzSjYSxFMz8mM58Mv/C6dkcsrQp
 xE+UVJ9Jo1y62zaHLD5iGWSKndEDDCg=
X-Google-Smtp-Source: ABdhPJwj/jPEsET0NS3sq9HIBPG9Wn2NHSP3CmR5kHTNhsCUFwElVN3dv9wKsTHI/s3Rz4l9a+KwCw==
X-Received: by 2002:a05:6000:1546:: with SMTP id
 6mr764360wry.398.1615829959523; 
 Mon, 15 Mar 2021 10:39:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 m132sm295613wmf.45.2021.03.15.10.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:39:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] meson: switch minimum meson version to 0.57.0
Date: Mon, 15 Mar 2021 18:39:11 +0100
Message-Id: <20210315173912.197857-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315173912.197857-1-pbonzini@redhat.com>
References: <20210315173912.197857-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson 0.57.0 does not need b_staticpic=$pie anymore, and has
stabilized the keyval module.  Remove the workaround and use a few
replacements for features deprecated in the 0.57.0 release cycle.

The CentOS 7 dockerfile change forces the rebuild of the container.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                               |  7 +---
 docs/meson.build                        | 12 +++---
 meson.build                             | 54 ++++++++++++-------------
 plugins/meson.build                     |  4 +-
 scripts/mtest2make.py                   |  7 +---
 tests/docker/dockerfiles/centos7.docker |  2 +-
 tests/qapi-schema/meson.build           |  4 +-
 tests/qtest/meson.build                 |  2 +-
 tests/unit/meson.build                  |  2 +-
 trace/meson.build                       |  4 +-
 10 files changed, 43 insertions(+), 55 deletions(-)

diff --git a/configure b/configure
index f7d022a5db..0be5a5c148 100755
--- a/configure
+++ b/configure
@@ -1945,7 +1945,7 @@ python_version=$($python -c 'import sys; print("%d.%d.%d" % (sys.version_info[0]
 python="$python -B"
 
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.55.3; then
+    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.57.0; then
         meson=meson
     elif test $git_submodules_action != 'ignore' ; then
         meson=git
@@ -6384,10 +6384,6 @@ fi
 mv $cross config-meson.cross
 
 rm -rf meson-private meson-info meson-logs
-unset staticpic
-if ! version_ge "$($meson --version)" 0.56.0; then
-  staticpic=$(if test "$pie" = yes; then echo true; else echo false; fi)
-fi
 NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --libdir "$libdir" \
@@ -6407,7 +6403,6 @@ NINJA=$ninja $meson setup \
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
         -Dstrip=$(if test "$strip_opt" = yes; then echo true; else echo false; fi) \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
-        ${staticpic:+-Db_staticpic=$staticpic} \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
diff --git a/docs/meson.build b/docs/meson.build
index f84306ba7e..0aa98719af 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -38,12 +38,12 @@ endif
 if build_docs
   SPHINX_ARGS += ['-Dversion=' + meson.project_version(), '-Drelease=' + config_host['PKGVERSION']]
 
-  sphinx_extn_depends = [ meson.source_root() / 'docs/sphinx/depfile.py',
-                          meson.source_root() / 'docs/sphinx/hxtool.py',
-                          meson.source_root() / 'docs/sphinx/kerneldoc.py',
-                          meson.source_root() / 'docs/sphinx/kernellog.py',
-                          meson.source_root() / 'docs/sphinx/qapidoc.py',
-                          meson.source_root() / 'docs/sphinx/qmp_lexer.py',
+  sphinx_extn_depends = [ meson.current_source_dir() / 'sphinx/depfile.py',
+                          meson.current_source_dir() / 'sphinx/hxtool.py',
+                          meson.current_source_dir() / 'sphinx/kerneldoc.py',
+                          meson.current_source_dir() / 'sphinx/kernellog.py',
+                          meson.current_source_dir() / 'sphinx/qapidoc.py',
+                          meson.current_source_dir() / 'sphinx/qmp_lexer.py',
                           qapi_gen_depends ]
 
   have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
diff --git a/meson.build b/meson.build
index a7d2dd429d..e03ba6543a 100644
--- a/meson.build
+++ b/meson.build
@@ -1,14 +1,10 @@
-project('qemu', ['c'], meson_version: '>=0.55.0',
-        default_options: ['warning_level=1', 'c_std=gnu99', 'cpp_std=gnu++11', 'b_colorout=auto'] +
-                         (meson.version().version_compare('>=0.56.0') ? [ 'b_staticpic=false' ] : []),
-        version: run_command('head', meson.source_root() / 'VERSION').stdout().strip())
+project('qemu', ['c'], meson_version: '>=0.57.0',
+        default_options: ['warning_level=1', 'c_std=gnu99', 'cpp_std=gnu++11', 'b_colorout=auto',
+                          'b_staticpic=false'],
+        version: files('VERSION'))
 
 not_found = dependency('', required: false)
-if meson.version().version_compare('>=0.56.0')
-  keyval = import('keyval')
-else
-  keyval = import('unstable-keyval')
-endif
+keyval = import('keyval')
 ss = import('sourceset')
 fs = import('fs')
 
@@ -1646,21 +1642,21 @@ genh += configure_file(output: 'config-host.h', configuration: config_host_data)
 hxtool = find_program('scripts/hxtool')
 shaderinclude = find_program('scripts/shaderinclude.pl')
 qapi_gen = find_program('scripts/qapi-gen.py')
-qapi_gen_depends = [ meson.source_root() / 'scripts/qapi/__init__.py',
-                     meson.source_root() / 'scripts/qapi/commands.py',
-                     meson.source_root() / 'scripts/qapi/common.py',
-                     meson.source_root() / 'scripts/qapi/error.py',
-                     meson.source_root() / 'scripts/qapi/events.py',
-                     meson.source_root() / 'scripts/qapi/expr.py',
-                     meson.source_root() / 'scripts/qapi/gen.py',
-                     meson.source_root() / 'scripts/qapi/introspect.py',
-                     meson.source_root() / 'scripts/qapi/parser.py',
-                     meson.source_root() / 'scripts/qapi/schema.py',
-                     meson.source_root() / 'scripts/qapi/source.py',
-                     meson.source_root() / 'scripts/qapi/types.py',
-                     meson.source_root() / 'scripts/qapi/visit.py',
-                     meson.source_root() / 'scripts/qapi/common.py',
-                     meson.source_root() / 'scripts/qapi-gen.py'
+qapi_gen_depends = [ meson.current_source_dir() / 'scripts/qapi/__init__.py',
+                     meson.current_source_dir() / 'scripts/qapi/commands.py',
+                     meson.current_source_dir() / 'scripts/qapi/common.py',
+                     meson.current_source_dir() / 'scripts/qapi/error.py',
+                     meson.current_source_dir() / 'scripts/qapi/events.py',
+                     meson.current_source_dir() / 'scripts/qapi/expr.py',
+                     meson.current_source_dir() / 'scripts/qapi/gen.py',
+                     meson.current_source_dir() / 'scripts/qapi/introspect.py',
+                     meson.current_source_dir() / 'scripts/qapi/parser.py',
+                     meson.current_source_dir() / 'scripts/qapi/schema.py',
+                     meson.current_source_dir() / 'scripts/qapi/source.py',
+                     meson.current_source_dir() / 'scripts/qapi/types.py',
+                     meson.current_source_dir() / 'scripts/qapi/visit.py',
+                     meson.current_source_dir() / 'scripts/qapi/common.py',
+                     meson.current_source_dir() / 'scripts/qapi-gen.py'
 ]
 
 tracetool = [
@@ -2205,14 +2201,14 @@ foreach target : target_dirs
   if target.endswith('-softmmu')
     execs = [{
       'name': 'qemu-system-' + target_name,
-      'gui': false,
+      'win_subsystem': 'console',
       'sources': files('softmmu/main.c'),
       'dependencies': []
     }]
     if targetos == 'windows' and (sdl.found() or gtk.found())
       execs += [{
         'name': 'qemu-system-' + target_name + 'w',
-        'gui': true,
+        'win_subsystem': 'windows',
         'sources': files('softmmu/main.c'),
         'dependencies': []
       }]
@@ -2221,7 +2217,7 @@ foreach target : target_dirs
       specific_fuzz = specific_fuzz_ss.apply(config_target, strict: false)
       execs += [{
         'name': 'qemu-fuzz-' + target_name,
-        'gui': false,
+        'win_subsystem': 'console',
         'sources': specific_fuzz.sources(),
         'dependencies': specific_fuzz.dependencies(),
       }]
@@ -2229,7 +2225,7 @@ foreach target : target_dirs
   else
     execs = [{
       'name': 'qemu-' + target_name,
-      'gui': false,
+      'win_subsystem': 'console',
       'sources': [],
       'dependencies': []
     }]
@@ -2249,7 +2245,7 @@ foreach target : target_dirs
                link_language: link_language,
                link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
                link_args: link_args,
-               gui_app: exe['gui'])
+               win_subsystem: exe['win_subsystem'])
 
     if exe_sign
       emulators += {exe['name'] : custom_target(exe['name'],
diff --git a/plugins/meson.build b/plugins/meson.build
index e77723010e..d58efc980e 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -1,7 +1,7 @@
 if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-  plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.build_root() / 'qemu-plugins-ld.symbols')]
+  plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.project_build_root() / 'qemu-plugins-ld.symbols')]
 elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-  plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.build_root() / 'qemu-plugins-ld64.symbols')]
+  plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.project_build_root() / 'qemu-plugins-ld64.symbols')]
 else
   plugin_ldflags = []
 endif
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index ee072c0502..02c0453e67 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -60,11 +60,8 @@ def process_tests(test, targets, suites):
     if test['workdir'] is not None:
         print('.test.dir.%d := %s' % (i, shlex.quote(test['workdir'])))
 
-    if 'depends' in test:
-        deps = (targets.get(x, []) for x in test['depends'])
-        deps = itertools.chain.from_iterable(deps)
-    else:
-        deps = ['all']
+    deps = (targets.get(x, []) for x in test['depends'])
+    deps = itertools.chain.from_iterable(deps)
 
     print('.test.name.%d := %s' % (i, test['name']))
     print('.test.driver.%d := %s' % (i, driver))
diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 75fdb53c7c..dc36b4ebc3 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -28,7 +28,7 @@ ENV PACKAGES \
     mesa-libEGL-devel \
     mesa-libgbm-devel \
     nettle-devel \
-    ninja-build \
+    'ninja-build >= 1.8' \
     perl-Test-Harness \
     pixman-devel \
     python3 \
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 304ef939bd..26588396d2 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -1,5 +1,5 @@
 test_env = environment()
-test_env.set('PYTHONPATH', meson.source_root() / 'scripts')
+test_env.set('PYTHONPATH', meson.project_source_root() / 'scripts')
 test_env.set('PYTHONIOENCODING', 'utf-8')
 
 schemas = [
@@ -240,7 +240,7 @@ if build_docs
                                # clutter up the build dir with the cache.
                                command: [SPHINX_ARGS,
                                          '-b', 'text', '-E',
-                                         '-c', meson.source_root() / 'docs',
+                                         '-c', meson.project_source_root() / 'docs',
                                          '-D', 'master_doc=doc-good',
                                          meson.current_source_dir(),
                                          meson.current_build_dir()])
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 2688e1bfad..50dd85e1df 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -261,7 +261,7 @@ foreach dir : target_dirs
     qtest_env.set('QTEST_QEMU_IMG', './qemu-img')
     test_deps += [qemu_img]
   endif
-  qtest_env.set('G_TEST_DBUS_DAEMON', meson.source_root() / 'tests/dbus-vmstate-daemon.sh')
+  qtest_env.set('G_TEST_DBUS_DAEMON', meson.project_source_root() / 'tests/dbus-vmstate-daemon.sh')
   qtest_env.set('QTEST_QEMU_BINARY', './qemu-system-' + target_base)
   
   foreach test : target_qtests
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 4bfe4627ba..907e9f5f26 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -42,7 +42,7 @@ tests = {
   'test-keyval': [testqapi],
   'test-logging': [],
   'test-uuid': [],
-  'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
+  'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
   'test-qapi-util': [],
 }
 
diff --git a/trace/meson.build b/trace/meson.build
index 08f83a15c3..317b557915 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -3,7 +3,7 @@ specific_ss.add(files('control-target.c'))
 
 trace_events_files = []
 foreach dir : [ '.' ] + trace_events_subdirs
-  trace_events_file = meson.source_root() / dir / 'trace-events'
+  trace_events_file = meson.project_source_root() / dir / 'trace-events'
   trace_events_files += [ trace_events_file ]
   group_name = dir == '.' ? 'root' : dir.underscorify()
   group = '--group=' + group_name
@@ -69,7 +69,7 @@ foreach d : [
 ]
   gen = custom_target(d[0],
                 output: d[0],
-                input: meson.source_root() / 'trace-events',
+                input: meson.project_source_root() / 'trace-events',
                 command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@', '@OUTPUT@' ],
                 depend_files: tracetool_depends)
   specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
-- 
2.29.2



