Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C290F418A5D
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:28:44 +0200 (CEST)
Received: from localhost ([::1]:39466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUXxD-00087K-RE
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mUXmE-0004jt-SA
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mUXmA-000842-OE
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632676638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Jyypjh5kwg7eqWOLRnIaQGV6oukQ07bQ3ZbZ+Kyr5w=;
 b=CInqdNNWNtC6yVR5gIl6S1hHNux+RXbXpy76PWiqg+8R6uC1zvFO7zxir7kUODRqMRZ+x6
 9TY5aC7acpQvhZ8SGNtL5hv+ut5FVkrjlmIxUouG3Tj7hSxcvgJc1Y66a9lQAL7IPvzzFi
 ZCKwGANMLWLNuiHp/niOErM6sQHsiEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-ZGRGb-KWMg2fdFJi_xQK3w-1; Sun, 26 Sep 2021 13:17:14 -0400
X-MC-Unique: ZGRGb-KWMg2fdFJi_xQK3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A7B2802B9F
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:17:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD715652A1;
 Sun, 26 Sep 2021 17:17:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 2/5] meson: switch minimum meson version to 0.58.2
Date: Sun, 26 Sep 2021 13:17:05 -0400
Message-Id: <20210926171708.455435-3-pbonzini@redhat.com>
In-Reply-To: <20210926171708.455435-1-pbonzini@redhat.com>
References: <20210926171708.455435-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson 0.58.2 does not need b_staticpic=$pie anymore, and has
stabilized the keyval module.  Remove the workaround and use a few
replacements for features deprecated in the 0.57.0 release cycle.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     |  8 ++----
 docs/meson.build              | 14 ++++-----
 meson.build                   | 54 ++++++++++++++++-------------------
 plugins/meson.build           |  4 +--
 scripts/mtest2make.py         |  7 ++---
 tests/qapi-schema/meson.build |  4 +--
 tests/qtest/meson.build       |  2 +-
 tests/unit/meson.build        |  2 +-
 trace/meson.build             |  4 +--
 9 files changed, 44 insertions(+), 55 deletions(-)

diff --git a/configure b/configure
index da2501489f..bfe1fddf4c 100755
--- a/configure
+++ b/configure
@@ -1995,7 +1995,7 @@ python_version=$($python -c 'import sys; print("%d.%d.%d" % (sys.version_info[0]
 python="$python -B"
 
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.55.3; then
+    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.58.2; then
         meson=meson
     elif test $git_submodules_action != 'ignore' ; then
         meson=git
@@ -5162,10 +5162,6 @@ if test "$skip_meson" = no; then
   mv $cross config-meson.cross
 
   rm -rf meson-private meson-info meson-logs
-  unset staticpic
-  if ! version_ge "$($meson --version)" 0.56.0; then
-    staticpic=$(if test "$pie" = yes; then echo true; else echo false; fi)
-  fi
   NINJA=$ninja $meson setup \
         --prefix "$prefix" \
         --libdir "$libdir" \
@@ -5185,7 +5181,6 @@ if test "$skip_meson" = no; then
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
         -Dstrip=$(if test "$strip_opt" = yes; then echo true; else echo false; fi) \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
-        ${staticpic:+-Db_staticpic=$staticpic} \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
@@ -5221,6 +5216,7 @@ else
     perl -i -ne '
       s/^gettext = true$/gettext = auto/;
       s/^gettext = false$/gettext = disabled/;
+      /^b_staticpic/ && next;
       print;' meson-private/cmd_line.txt
   fi
 fi
diff --git a/docs/meson.build b/docs/meson.build
index cffe1ecf1d..be4dc30f39 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -37,14 +37,14 @@ endif
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
-  sphinx_template_files = [ meson.source_root() / 'docs/_templates/footer.html' ]
+  sphinx_template_files = [ meson.project_source_root() / 'docs/_templates/footer.html' ]
 
   have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
 
diff --git a/meson.build b/meson.build
index 2711cbb789..3945a6cc2d 100644
--- a/meson.build
+++ b/meson.build
@@ -1,14 +1,10 @@
-project('qemu', ['c'], meson_version: '>=0.55.0',
-        default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto'] +
-                         (meson.version().version_compare('>=0.56.0') ? [ 'b_staticpic=false' ] : []),
-        version: run_command('head', meson.source_root() / 'VERSION').stdout().strip())
+project('qemu', ['c'], meson_version: '>=0.57.0',
+        default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
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
 
@@ -1963,21 +1959,21 @@ genh += configure_file(output: 'config-host.h', configuration: config_host_data)
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
@@ -2624,14 +2620,14 @@ foreach target : target_dirs
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
@@ -2640,7 +2636,7 @@ foreach target : target_dirs
       specific_fuzz = specific_fuzz_ss.apply(config_target, strict: false)
       execs += [{
         'name': 'qemu-fuzz-' + target_name,
-        'gui': false,
+        'win_subsystem': 'console',
         'sources': specific_fuzz.sources(),
         'dependencies': specific_fuzz.dependencies(),
       }]
@@ -2648,7 +2644,7 @@ foreach target : target_dirs
   else
     execs = [{
       'name': 'qemu-' + target_name,
-      'gui': false,
+      'win_subsystem': 'console',
       'sources': [],
       'dependencies': []
     }]
@@ -2667,7 +2663,7 @@ foreach target : target_dirs
                link_language: link_language,
                link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
                link_args: link_args,
-               gui_app: exe['gui'])
+               win_subsystem: exe['win_subsystem'])
 
     if targetos == 'darwin'
       icon = 'pc-bios/qemu.rsrc'
diff --git a/plugins/meson.build b/plugins/meson.build
index bfd5c9822a..aeb386ebae 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -2,9 +2,9 @@ plugin_ldflags = []
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
   if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-    plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.build_root() / 'qemu-plugins-ld.symbols')]
+    plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.project_build_root() / 'qemu-plugins-ld.symbols')]
   elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-    plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.build_root() / 'qemu-plugins-ld64.symbols')]
+    plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.project_build_root() / 'qemu-plugins-ld64.symbols')]
   endif
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
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 6b2a4ce41a..6a08d23ce8 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -1,5 +1,5 @@
 test_env = environment()
-test_env.set('PYTHONPATH', meson.source_root() / 'scripts')
+test_env.set('PYTHONPATH', meson.project_source_root() / 'scripts')
 test_env.set('PYTHONIOENCODING', 'utf-8')
 
 schemas = [
@@ -253,7 +253,7 @@ if build_docs
                                # clutter up the build dir with the cache.
                                command: [SPHINX_ARGS,
                                          '-b', 'text', '-E',
-                                         '-c', meson.source_root() / 'docs',
+                                         '-c', meson.project_source_root() / 'docs',
                                          '-D', 'master_doc=doc-good',
                                          meson.current_source_dir(),
                                          meson.current_build_dir()])
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 757bb8499a..e1f4df3df8 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -275,7 +275,7 @@ foreach dir : target_dirs
     qtest_env.set('QTEST_QEMU_IMG', './qemu-img')
     test_deps += [qemu_img]
   endif
-  qtest_env.set('G_TEST_DBUS_DAEMON', meson.source_root() / 'tests/dbus-vmstate-daemon.sh')
+  qtest_env.set('G_TEST_DBUS_DAEMON', meson.project_source_root() / 'tests/dbus-vmstate-daemon.sh')
   qtest_env.set('QTEST_QEMU_BINARY', './qemu-system-' + target_base)
   if have_tools and have_vhost_user_blk_server
     qtest_env.set('QTEST_QEMU_STORAGE_DAEMON_BINARY', './storage-daemon/qemu-storage-daemon')
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 5736d285b2..7c297d7e5c 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -43,7 +43,7 @@ tests = {
   'test-keyval': [testqapi],
   'test-logging': [],
   'test-uuid': [],
-  'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
+  'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
   'test-qapi-util': [],
 }
 
diff --git a/trace/meson.build b/trace/meson.build
index e401e7c415..b8f95de200 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -4,7 +4,7 @@ specific_ss.add(files('control-target.c'))
 trace_events_files = []
 dtrace = find_program('dtrace', required: 'CONFIG_TRACE_DTRACE' in config_host)
 foreach dir : [ '.' ] + trace_events_subdirs
-  trace_events_file = meson.source_root() / dir / 'trace-events'
+  trace_events_file = meson.project_source_root() / dir / 'trace-events'
   trace_events_files += [ trace_events_file ]
   group_name = dir == '.' ? 'root' : dir.underscorify()
   group = '--group=' + group_name
@@ -70,7 +70,7 @@ foreach d : [
 ]
   gen = custom_target(d[0],
                 output: d[0],
-                input: meson.source_root() / 'trace-events',
+                input: meson.project_source_root() / 'trace-events',
                 command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@', '@OUTPUT@' ],
                 depend_files: tracetool_depends)
   specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
-- 
2.27.0



