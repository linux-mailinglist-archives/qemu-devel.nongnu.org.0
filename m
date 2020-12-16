Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513372DC40F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:25:36 +0100 (CET)
Received: from localhost ([::1]:53698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZcN-0007N5-Dl
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXF-0002ED-2w
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:18 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXB-0006Uo-2E
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:15 -0500
Received: by mail-ej1-x62c.google.com with SMTP id g20so33598578ejb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MzUl6qav6DlTh4FgD5iqMGZ7LoRhAPDQS1hxgDUNfM=;
 b=uYolXSl+PrNz1CfMH0erF2Ciin4G48qWQAICm+ucxH01Tu2/pqZSWfLJNn4LzxHYP7
 uUjBzzZ8GVlGwDUZmPjA4aXTcp3aW3Tvt7p0z/9O8FVlwzA8iwkI7t9cYq4xPHvKKzmw
 ybcsepiBhQ8rH4F7DUJFbdkbHorHemTN8FPJrk5xUvzNYepU6b7hqLhJG0dQ9zYYMNCa
 dnfJTsePlzE0MP0ByiFo73PPVkjiGnIMz+5gaQNGNAR/IMElQJOkZre4MbTaI7rPp0z/
 AUnwP0dtKOwaD+9BLilDX0mPx8dzziBzfWkMUj3yllZrs7lixwvQlJVOCbnosTLbUU8u
 RTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/MzUl6qav6DlTh4FgD5iqMGZ7LoRhAPDQS1hxgDUNfM=;
 b=kyeSPxE+xtj3fMFfh2bqqu7qC01wCCECxbCczMB/e1JS1WznSjaFmDTr9rsCicnHH2
 gtv3y2tflqb79US7PEfBTY8LtPAehI6mCTPGXAHXqIYZ1iRStRJd+c564ogW+B0Fbh9H
 1aYSeTJbKyLVwgA5+q8zpbv6OXtht+1RRNJqphz16IhXbGtoyLhZYMcD33L1o0Sgfp5i
 Wfwa1GPMBap6iw6KTq7sSUv6/4QP3jhMO8PCCk9agkTYQLHPuwXPYc6F/h99xuh4AiL1
 pj6YMq6wCI3sVMdMBiHQS94CCH1wlBKjQWeDmouYXbF/Nf3F5+ezJXyon5r33Im/l1bZ
 kHpg==
X-Gm-Message-State: AOAM5313/WmTYElZG3t6ESy8/4NHHuRDVHUiaYiU09wF4qKVww77BrOc
 j4jewiatVAeXb03ZJ/dWtjoIYm4V+2U=
X-Google-Smtp-Source: ABdhPJyaw8B/I/8qqaCnieNhigm3wNalI5VbPD2OQx/j94iI1dDH4g1bQPPGFfRRY1qCyNhGXD2aCg==
X-Received: by 2002:a17:906:3c04:: with SMTP id
 h4mr30791288ejg.220.1608135611305; 
 Wed, 16 Dec 2020 08:20:11 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a13sm21264501edb.76.2020.12.16.08.20.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:20:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] meson: switch minimum meson version to 0.56.0
Date: Wed, 16 Dec 2020 17:20:02 +0100
Message-Id: <20201216162006.433850-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216162006.433850-1-pbonzini@redhat.com>
References: <20201216162006.433850-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson 0.56.0 does not need b_staticpic=$pie anymore, and has
stabilized the keyval module.  Remove the workaround and use a few
replacements for features deprecated in that release cycle.

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
index 8d12b715e3..708cf365f0 100755
--- a/configure
+++ b/configure
@@ -6965,10 +6965,6 @@ fi
 mv $cross config-meson.cross
 
 rm -rf meson-private meson-info meson-logs
-unset staticpic
-if ! version_ge "$($meson --version)" 0.56.0; then
-  staticpic=$(if test "$pie" = yes; then echo true; else echo false; fi)
-fi
 NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --libdir "$libdir" \
@@ -6988,7 +6984,6 @@ NINJA=$ninja $meson setup \
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
index 77ac9ec01b..39fc9b7143 100644
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
@@ -1894,14 +1890,14 @@ foreach target : target_dirs
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
@@ -1910,7 +1906,7 @@ foreach target : target_dirs
       specific_fuzz = specific_fuzz_ss.apply(config_target, strict: false)
       execs += [{
         'name': 'qemu-fuzz-' + target_name,
-        'gui': false,
+        'win_subsystem': 'console',
         'sources': specific_fuzz.sources(),
         'dependencies': specific_fuzz.dependencies(),
       }]
@@ -1918,7 +1914,7 @@ foreach target : target_dirs
   else
     execs = [{
       'name': 'qemu-' + target_name,
-      'gui': false,
+      'win_subsystem': 'console',
       'sources': [],
       'dependencies': []
     }]
@@ -1933,7 +1929,7 @@ foreach target : target_dirs
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



