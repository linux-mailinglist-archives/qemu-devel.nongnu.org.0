Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35AA3A95EA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:19:16 +0200 (CEST)
Received: from localhost ([::1]:37582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRha-0003nB-4W
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltRei-0000jN-1z
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltRee-00066F-KH
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 05:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623834970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zt/pxcsF62DFNMvK33ygpK0yRJ5uztlTPCrw79JWe28=;
 b=AKDVdN1r157OepK9zIJE0eI1fMsPJDgEAy2R95UW+cJ8/3A6ME7fUGadPbW0nLXiXWXQwI
 sbXEccNliiJOs7+QkvQHIRxKYDtKSQF7uMCwz90j0bNEdO04rW1iEbrMni9dIEpBpck8Iq
 /aCE88Y/Py1A+KWJT0w2rj1DYL8Y/BU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-H0EQ_vxlOb2zEeOUaxckAQ-1; Wed, 16 Jun 2021 05:16:07 -0400
X-MC-Unique: H0EQ_vxlOb2zEeOUaxckAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E659D801106
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:16:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E76E5D9DE;
 Wed, 16 Jun 2021 09:16:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E43D418000B2; Wed, 16 Jun 2021 11:16:04 +0200 (CEST)
Date: Wed, 16 Jun 2021 11:16:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
Message-ID: <20210616091604.teypyrrggxe7gooz@sirius.home.kraxel.org>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
 <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
 <8b860457-7c51-f4cb-1e80-02848ad92648@redhat.com>
 <20210615044915.agzl7vsjewpatyhp@sirius.home.kraxel.org>
 <20210615075646.vcv3bhbrffs5exez@sirius.home.kraxel.org>
 <20210615130715.lye3spkpa24x3pyj@sirius.home.kraxel.org>
 <279b97e2-d06d-b929-0265-d4bd41dc6ee2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <279b97e2-d06d-b929-0265-d4bd41dc6ee2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 03:35:44PM +0200, Paolo Bonzini wrote:
> On 15/06/21 15:07, Gerd Hoffmann wrote:
> > > Hmm, looks like I actually need both.  Seems there is no easy way to get
> > > the cflags out of a source_set to construct a cpp command line.  Pulling
> > > this out of compile_commands.json with jq works though.
> > Well, easy until I look at target-specific modules where the
> > "source file" -> "command" mapping isn't unique any more.  Which makes
> > this route less attractive ...
> 
> I was almost giving up... but it looks like the result of
> extract_all_objects(recursive: true) can be passed to custom_target(). Then
> you can match it after compile_commands.json's "output" key.

Seems the custom_target commands do not land in compile_commands.json.

But I have figured meanwhile that looking for the target name in the
command line works reliable.  That will will match
-DCONFIG_TARGET="${target}-config-target.h".

Current WIP patch below, seems to work nicely.  Whole patch series needs
an overhaul now ...

From 70c96336e38f1a7f114aee2c7ef023546cc560e5 Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 15 Jun 2021 09:23:52 +0200
Subject: [PATCH] try -DQEMU_MODINFO

---
 scripts/modinfo-collect.py  | 66 +++++++++++++++++++++++++++++++++++++
 scripts/modinfo-generate.py | 61 ++++++++++++++++++++++++++++++++++
 include/qemu/module.h       | 33 ++++++++++---------
 meson.build                 | 28 +++++++++++++++-
 4 files changed, 171 insertions(+), 17 deletions(-)
 create mode 100755 scripts/modinfo-collect.py
 create mode 100755 scripts/modinfo-generate.py

diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
new file mode 100755
index 000000000000..b804099cfd1e
--- /dev/null
+++ b/scripts/modinfo-collect.py
@@ -0,0 +1,66 @@
+#!/usr/bin/env python3
+# -*- coding: utf-8 -*-
+
+import os
+import sys
+import json
+import shlex
+import subprocess
+
+def find_command(src, target, compile_commands):
+    for command in compile_commands:
+        if command['file'] != src:
+            continue
+        if target != '' and command['command'].find(target) == -1:
+            continue
+        return command['command']
+    return 'false'
+
+def process_command(src, command):
+    skip = False
+    arg = False
+    out = []
+    for item in shlex.split(command):
+        if arg:
+            out.append(x)
+            arg = False
+            continue
+        if skip:
+            skip = False
+            continue
+        if item == '-MF' or item == '-MQ' or item == '-o':
+            skip = True
+            continue
+        if item == '-c':
+            skip = True
+            continue
+        out.append(item)
+    out.append('-DQEMU_MODINFO')
+    out.append('-E')
+    out.append(src)
+    return out
+
+def main(args):
+    target = ''
+    if args[0] == '--target':
+        args.pop(0)
+        target = args.pop(0)
+        print("MODINFO_DEBUG target %s" % target)
+        arch = target[:-8] # cut '-softmmu'
+        print("MODINFO_START arch \"%s\" MODINFO_END" % arch)
+    with open('compile_commands.json') as f:
+        compile_commands = json.load(f)
+    for src in args:
+        print("MODINFO_DEBUG src %s" % src)
+        command = find_command(src, target, compile_commands)
+        cmdline = process_command(src, command)
+        print("MODINFO_DEBUG cmd", cmdline)
+        result = subprocess.run(cmdline, capture_output = True, text = True)
+        if result.returncode != 0:
+            sys.exit(result.returncode)
+        for line in result.stdout.split('\n'):
+            if line.find('MODINFO') != -1:
+                print(line)
+
+if __name__ == "__main__":
+    main(sys.argv[1:])
diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
new file mode 100755
index 000000000000..b37d2e8edab9
--- /dev/null
+++ b/scripts/modinfo-generate.py
@@ -0,0 +1,61 @@
+#!/usr/bin/env python3
+# -*- coding: utf-8 -*-
+
+import os
+import sys
+
+def print_array(name, values):
+    if len(values) == 0:
+        return
+    print("    .%s = ((const char*[]){ %s, NULL })," % (name, ", ".join(values)))
+
+def generate(name, lines):
+    arch = ""
+    objs = []
+    deps = []
+    opts = []
+    for line in lines:
+        if line.startswith("MODINFO_START"):
+            items = line.split()
+            if items[1] == 'obj':
+                objs.append(items[2])
+            elif items[1] == 'dep':
+                deps.append(items[2])
+            elif items[1] == 'opts':
+                opts.append(items[2])
+            elif items[1] == 'arch':
+                arch = items[2];
+            else:
+                print("unknown:", items[1])
+                exit(1)
+
+    print("    .name = \"%s\"," % name)
+    if arch != "":
+        print("    .arch = %s," % arch)
+    print_array("objs", objs)
+    print_array("deps", deps)
+    print_array("opts", opts)
+    print("},{");
+
+def print_pre():
+    print("/* generated by scripts/modinfo.py */")
+    print("#include \"qemu/osdep.h\"")
+    print("#include \"qemu/module.h\"")
+    print("const QemuModinfo qemu_modinfo[] = {{")
+
+def print_post():
+    print("    /* end of list */")
+    print("}};")
+
+def main(args):
+    print_pre()
+    for modinfo in args:
+        with open(modinfo) as f:
+            lines = f.readlines()
+        print("    /* %s */" % modinfo)
+        (basename, ext) = os.path.splitext(modinfo)
+        generate(basename, lines)
+    print_post()
+
+if __name__ == "__main__":
+    main(sys.argv[1:])
diff --git a/include/qemu/module.h b/include/qemu/module.h
index 7825f6d8c847..23e92fff8484 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -74,26 +74,27 @@ void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
 
-/*
- * macros to store module metadata in a .modinfo section.
- * qemu-modinfo utility will collect the metadata.
- *
- * Use "objdump -t -s -j .modinfo ${module}.so" to inspect.
- */
-
-#define ___PASTE(a, b) a##b
-#define __PASTE(a, b) ___PASTE(a, b)
-
-#define modinfo(kind, value)                             \
-    static const char __PASTE(kind, __LINE__)[]          \
-        __attribute__((__used__))                        \
-        __attribute__((section(".modinfo")))             \
-        __attribute__((aligned(1)))                      \
-        = stringify(kind) "=" value
+/* scripts/modinfo.sh collects module info (using -DQEMU_MODINFO) */
+#ifdef QEMU_MODINFO
+# define modinfo(kind, value) \
+    MODINFO_START kind value MODINFO_END
+#else
+# define modinfo(kind, value)
+#endif
 
 #define module_obj(name) modinfo(obj, name)
 #define module_dep(name) modinfo(dep, name)
 #define module_arch(name) modinfo(arch, name)
 #define module_opts(name) modinfo(opts, name)
 
+typedef struct QemuModinfo QemuModinfo;
+struct QemuModinfo {
+    const char *name;
+    const char *arch;
+    const char **objs;
+    const char **deps;
+    const char **opts;
+};
+extern const QemuModinfo qemu_modinfo[];
+
 #endif
diff --git a/meson.build b/meson.build
index 46ebc07dbb67..f5c7ba979981 100644
--- a/meson.build
+++ b/meson.build
@@ -2048,6 +2048,10 @@ target_modules += { 'accel' : { 'qtest': qtest_module_ss,
 # Library dependencies #
 ########################
 
+modinfo_collect = find_program('scripts/modinfo-collect.py')
+modinfo_generate = find_program('scripts/modinfo-generate.py')
+modinfo_files = []
+
 block_mods = []
 softmmu_mods = []
 foreach d, list : modules
@@ -2056,6 +2060,11 @@ foreach d, list : modules
       module_ss = module_ss.apply(config_all, strict: false)
       sl = static_library(d + '-' + m, [genh, module_ss.sources()],
                           dependencies: [modulecommon, module_ss.dependencies()], pic: true)
+      modinfo_files += custom_target(d + '-' + m + '.modinfo',
+                                     output: d + '-' + m + '.modinfo',
+                                     input: module_ss.sources(),
+                                     capture: true,
+                                     command: [modinfo_collect, '@INPUT@'])
       if d == 'block'
         block_mods += sl
       else
@@ -2084,12 +2093,18 @@ foreach d, list : target_modules
                     '-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target)]
           target_module_ss = module_ss.apply(config_target, strict: false)
           if target_module_ss.sources() != []
-            sl = static_library(d + '-' + m + '-' + config_target['TARGET_NAME'],
+            module_name = d + '-' + m + '-' + config_target['TARGET_NAME']
+            sl = static_library(module_name,
                                 [genh, target_module_ss.sources()],
                                 dependencies: [modulecommon, target_module_ss.dependencies()],
                                 include_directories: target_inc,
                                 c_args: c_args,
                                 pic: true)
+            modinfo_files += custom_target(module_name + '.modinfo',
+                                           output: module_name + '.modinfo',
+                                           input: target_module_ss.sources(),
+                                           capture: true,
+                                           command: [modinfo_collect, '--target', target, '@INPUT@'])
             softmmu_mods += sl
           endif
         endif
@@ -2100,6 +2115,17 @@ foreach d, list : target_modules
   endforeach
 endforeach
 
+if enable_modules
+  modinfo_src = custom_target('modinfo.c',
+                              output: 'modinfo.c',
+                              input: modinfo_files,
+                              command: [modinfo_generate, '@INPUT@'],
+                              capture: true)
+  modinfo_lib = static_library('modinfo', modinfo_src)
+  modinfo_dep = declare_dependency(link_whole: modinfo_lib)
+  softmmu_ss.add(modinfo_dep)
+endif
+
 nm = find_program('nm')
 undefsym = find_program('scripts/undefsym.py')
 block_syms = custom_target('block.syms', output: 'block.syms',
-- 
2.31.1


