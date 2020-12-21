Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61452DFD63
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:20:07 +0100 (CET)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMyk-00021O-Nn
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRH-0004s1-9n
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRB-0007l4-1S
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:30 -0500
Received: by mail-wm1-x330.google.com with SMTP id n16so10368540wmc.0
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m67FwaeJk/Ye3KqiHPzwkiuVxbFDXaK+wQCs40zqR4Q=;
 b=uUL875jnpd3xCDM+pUIdsBd8rsvygNa9rrGRYuYJ9u6tk8Ytp+KQAayNTNAyjjM2hH
 unpvqYFFv++SU2578RrXNuQ23rbof6KHz71kcXU0/DNfQwXG5G+3yfQ0uYnwcPTW6dPd
 f5Mg0LOH3XjWwoFguTEq1scE6KtVa6wFh+nIJ7krSA4jxEABQ+xgCR6aYqVFJUqiJHwn
 vJrnxi8dux0gGCMT5cUWPlCTuAIfy/mPCUa0UTAv0B26oa/1MfrX3YUCEace7gefoAsD
 kKjnzTxRR3zGNu0goNIrZXnyQ6L9lXBL6MXfjsqXjQq1v6Bj1gJ7xKVpKzZQZxU6WCK1
 yX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m67FwaeJk/Ye3KqiHPzwkiuVxbFDXaK+wQCs40zqR4Q=;
 b=ol6LverbkU6rcRJRGEv7XjqCbk7JTmyz9d4A7z/swfayOJwyeZGMltqBE334KwK8xe
 0GFrrikoichYsCIZ5+NQqLWrA0JwBe4c40lialeLdW5x0nxwq0qbSvYTeWF+SIsEGz92
 I7eAbODYLI9Oo23cJfEAn4EsRT2XebaBXuwtQDyvL8QtmVux1b675rfcJCViIq7GZ3au
 Ni8uvkB21lAUMQ6RNNz4Dppdbxt/uXyVMP78JchYcXo2UBTlwash0S0ITphpOuZq7kYR
 ZJuh7KCrTjUbxn2o/BBsgD1/iW33ox47zreQkZ+zlTSkidHTXLlZi0jgTbZpxcg3vyDs
 83Aw==
X-Gm-Message-State: AOAM533rJOocmqpSThMGprU73Q7WAxdZRJ2NjJKIAJbP7elNU/6Q4cN/
 Ag1QW3Ic3pB0u5V8E+CxrGf5BcWVQEo=
X-Google-Smtp-Source: ABdhPJyn6Qk9j79NqHD8ZMqlMiGKMqUqkM6GnwBba8Iu0FC5mcibD60A7eV0/+A9PpLch9U8mbfCmg==
X-Received: by 2002:a1c:2c4:: with SMTP id 187mr17251957wmc.187.1608561912960; 
 Mon, 21 Dec 2020 06:45:12 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/55] meson: switch minimum meson version to 0.56.0
Date: Mon, 21 Dec 2020 15:44:19 +0100
Message-Id: <20201221144447.26161-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

Meson 0.56.0 does not need b_staticpic=$pie anymore, and has
stabilized the keyval module.  Remove the workaround and use a few
replacements for features deprecated in that release cycle.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     |  5 ----
 docs/meson.build              | 12 ++++----
 meson.build                   | 54 ++++++++++++++++-------------------
 plugins/meson.build           |  4 +--
 tests/meson.build             |  2 +-
 tests/qapi-schema/meson.build |  4 +--
 tests/qtest/meson.build       |  2 +-
 trace/meson.build             |  4 +--
 8 files changed, 39 insertions(+), 48 deletions(-)

diff --git a/configure b/configure
index 0a6de3b8ef..ce4f365231 100755
--- a/configure
+++ b/configure
@@ -6963,10 +6963,6 @@ fi
 mv $cross config-meson.cross
 
 rm -rf meson-private meson-info meson-logs
-unset staticpic
-if ! version_ge "$($meson --version)" 0.56.0; then
-  staticpic=$(if test "$pie" = yes; then echo true; else echo false; fi)
-fi
 NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --libdir "$libdir" \
@@ -6986,7 +6982,6 @@ NINJA=$ninja $meson setup \
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
         -Dstrip=$(if test "$strip_opt" = yes; then echo true; else echo false; fi) \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
-        ${staticpic:+-Db_staticpic=$staticpic} \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
diff --git a/docs/meson.build b/docs/meson.build
index bb8fe4c9e4..4e88ed7516 100644
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
 
   configure_file(output: 'index.html',
diff --git a/meson.build b/meson.build
index ada35d56e1..34ecb93b03 100644
--- a/meson.build
+++ b/meson.build
@@ -1,14 +1,10 @@
-project('qemu', ['c'], meson_version: '>=0.55.0',
-        default_options: ['warning_level=1', 'c_std=gnu99', 'cpp_std=gnu++11', 'b_colorout=auto'] +
-                         (meson.version().version_compare('>=0.56.0') ? [ 'b_staticpic=false' ] : []),
-        version: run_command('head', meson.source_root() / 'VERSION').stdout().strip())
+project('qemu', ['c'], meson_version: '>=0.56.0',
+        default_options: ['warning_level=1', 'c_std=gnu99', 'cpp_std=gnu++11', 'b_colorout=auto',
+                          'b_staticpic=false'],
+        version: run_command('head', meson.project_source_root() / 'VERSION').stdout().strip())
 
 not_found = dependency('', required: false)
-if meson.version().version_compare('>=0.56.0')
-  keyval = import('keyval')
-else
-  keyval = import('unstable-keyval')
-endif
+keyval = import('keyval')
 ss = import('sourceset')
 fs = import('fs')
 
@@ -1372,21 +1368,21 @@ genh += configure_file(output: 'config-host.h', configuration: config_host_data)
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
@@ -1895,14 +1891,14 @@ foreach target : target_dirs
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
@@ -1911,7 +1907,7 @@ foreach target : target_dirs
       specific_fuzz = specific_fuzz_ss.apply(config_target, strict: false)
       execs += [{
         'name': 'qemu-fuzz-' + target_name,
-        'gui': false,
+        'win_subsystem': 'console',
         'sources': specific_fuzz.sources(),
         'dependencies': specific_fuzz.dependencies(),
       }]
@@ -1919,7 +1915,7 @@ foreach target : target_dirs
   else
     execs = [{
       'name': 'qemu-' + target_name,
-      'gui': false,
+      'win_subsystem': 'console',
       'sources': [],
       'dependencies': []
     }]
@@ -1934,7 +1930,7 @@ foreach target : target_dirs
                link_language: link_language,
                link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
                link_args: link_args,
-               gui_app: exe['gui'])
+               win_subsystem: exe['win_subsystem'])
     }
 
     if 'CONFIG_TRACE_SYSTEMTAP' in config_host
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
diff --git a/tests/meson.build b/tests/meson.build
index 1fa068f27b..0b8c3c6f32 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -113,7 +113,7 @@ tests = {
   'test-keyval': [testqapi],
   'test-logging': [],
   'test-uuid': [],
-  'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
+  'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
   'test-qapi-util': [],
 }
 
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
index 6a67c538be..450af3e51c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -237,7 +237,7 @@ foreach dir : target_dirs
     qtest_env.set('QTEST_QEMU_IMG', './qemu-img')
     test_deps += [qemu_img]
   endif
-  qtest_env.set('G_TEST_DBUS_DAEMON', meson.source_root() / 'tests/dbus-vmstate-daemon.sh')
+  qtest_env.set('G_TEST_DBUS_DAEMON', meson.project_source_root() / 'tests/dbus-vmstate-daemon.sh')
   qtest_env.set('QTEST_QEMU_BINARY', './qemu-system-' + target_base)
   
   foreach test : target_qtests
diff --git a/trace/meson.build b/trace/meson.build
index b19309b327..012d0dbceb 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -2,7 +2,7 @@ specific_ss.add(files('control-target.c'))
 
 trace_events_files = []
 foreach dir : [ '.' ] + trace_events_subdirs
-  trace_events_file = meson.source_root() / dir / 'trace-events'
+  trace_events_file = meson.project_source_root() / dir / 'trace-events'
   trace_events_files += [ trace_events_file ]
   group_name = dir == '.' ? 'root' : dir.underscorify()
   group = '--group=' + group_name
@@ -68,7 +68,7 @@ foreach d : [
 ]
   gen = custom_target(d[0],
                 output: d[0],
-                input: meson.source_root() / 'trace-events',
+                input: meson.project_source_root() / 'trace-events',
                 command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@' ],
                 capture: true)
   specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
-- 
2.29.2



