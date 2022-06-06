Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA953E522
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:46:12 +0200 (CEST)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDzf-0002wx-0b
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr5-0001wa-QI
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDqn-0000We-Ig
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFr/Aaii6FmPOYULMv1KwzCLupIB34T325TogenjuFQ=;
 b=I8i+J9x6evzMeuhybWp/src/K5zq650iW0jfqbS48nLgsnZgJR5A5lHDKV55vafGhwhkiQ
 A9QiR2sVc3nGFZw1g0Y7eB+1xZLLGPRdatZDG9hhfT+NesZ6lqqls7HoFBZGPYDzCRjZD6
 yL99pmyKDgxc+HjGHoQoNlnH9O0lcgc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-N-_QqcKZO2ae2mpQ23wnOQ-1; Mon, 06 Jun 2022 10:36:59 -0400
X-MC-Unique: N-_QqcKZO2ae2mpQ23wnOQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c16-20020a5d4cd0000000b00213b1d4a96cso2300536wrt.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HFr/Aaii6FmPOYULMv1KwzCLupIB34T325TogenjuFQ=;
 b=ROsRA7Q/PL+TZrvCJnLQYGpMyst4fS3K2RwoPGw3QMaau7Wf+zW+Jkw5HGTRE9yFvB
 xW/zrQInnLY9gWizhTp7mbfcUytzmJ/reLl1xHQZq8jErhM1v2JvV/jxHdgm+a8mF/qy
 4QOxjKReEGZrF0Hrlln5uka6d89+S8Jl5ArwLVLDpG4UAWlODF2ZMKPthrEFJ70FDiIY
 JihUK0jt8YzBZWECCUPt+G/sZJKfibMehY1HZ8ZnIJ3h6JiJm1A8nc8B3dQv9yc4pVjs
 p5pLulINd4cdL2SQJPXS2TFKDo9xYV5hG1Za1pHZH3LhyBNQGqwuPb0GD3m97Bp4fEb/
 jmGw==
X-Gm-Message-State: AOAM530eU+VpgSJkxZEHJwZf7b+sGoEoaWyDHIcgaAGZEdey707l63jE
 1O0CxKib1gymUS+rOyVVZqcXNrC5NZOPHz3awIM0zvc2e2Bt7LwmZJoju0Gz/y2086Cz4YbFqfC
 XfeX4fTgFybAtRBCnRjPIJmNE5e9qjN8S7ccivs6Kms/qdyB//FVV9T0gr6TGsr+K8CM=
X-Received: by 2002:a5d:56d2:0:b0:212:9250:e18b with SMTP id
 m18-20020a5d56d2000000b002129250e18bmr20921200wrw.672.1654526217827; 
 Mon, 06 Jun 2022 07:36:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEwj2k0cDgMU1Vx4Kn7K4X2K1MxSSglXR6i3Gh7HMm8FpyvXro4dtWRktvsLwWgGvbBwr/6A==
X-Received: by 2002:a5d:56d2:0:b0:212:9250:e18b with SMTP id
 m18-20020a5d56d2000000b002129250e18bmr20921167wrw.672.1654526217521; 
 Mon, 06 Jun 2022 07:36:57 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b0039c362311d2sm20936018wmp.9.2022.06.06.07.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:36:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jose R. Ziviani" <jziviani@suse.de>, Dario Faggioli <dfaggioli@suse.com>
Subject: [PULL 05/29] modules: generates per-target modinfo
Date: Mon,  6 Jun 2022 16:36:20 +0200
Message-Id: <20220606143644.1151112-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: "Jose R. Ziviani" <jziviani@suse.de>

This patch changes the way modinfo is generated and built. Instead of
one modinfo.c it generates one modinfo-<target>-softmmu.c per target. It
aims a fine-tune control of modules by configuring Kconfig.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Message-Id: <165369003038.5857.13084289285185196779.stgit@work>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                 | 25 +++++++++++++------
 scripts/modinfo-generate.py | 49 ++++++++++++++++++++++++++-----------
 2 files changed, 52 insertions(+), 22 deletions(-)

diff --git a/meson.build b/meson.build
index 9b3fd4e52b..d738391810 100644
--- a/meson.build
+++ b/meson.build
@@ -3175,14 +3175,23 @@ foreach d, list : target_modules
 endforeach
 
 if enable_modules
-  modinfo_src = custom_target('modinfo.c',
-                              output: 'modinfo.c',
-                              input: modinfo_files,
-                              command: [modinfo_generate, '@INPUT@'],
-                              capture: true)
-  modinfo_lib = static_library('modinfo', modinfo_src)
-  modinfo_dep = declare_dependency(link_whole: modinfo_lib)
-  softmmu_ss.add(modinfo_dep)
+  foreach target : target_dirs
+    if target.endswith('-softmmu')
+      config_target = config_target_mak[target]
+      config_devices_mak = target + '-config-devices.mak'
+      modinfo_src = custom_target('modinfo-' + target + '.c',
+                                  output: 'modinfo-' + target + '.c',
+                                  input: modinfo_files,
+                                  command: [modinfo_generate, '--devices', config_devices_mak, '@INPUT@'],
+                                  capture: true)
+
+      modinfo_lib = static_library('modinfo-' + target + '.c', modinfo_src)
+      modinfo_dep = declare_dependency(link_with: modinfo_lib)
+
+      arch = config_target['TARGET_NAME'] == 'sparc64' ? 'sparc64' : config_target['TARGET_BASE_ARCH']
+      hw_arch[arch].add(modinfo_dep)
+    endif
+  endforeach
 endif
 
 nm = find_program('nm')
diff --git a/scripts/modinfo-generate.py b/scripts/modinfo-generate.py
index 689f33c0f2..b1538fcced 100755
--- a/scripts/modinfo-generate.py
+++ b/scripts/modinfo-generate.py
@@ -32,7 +32,7 @@ def parse_line(line):
             continue
     return (kind, data)
 
-def generate(name, lines):
+def generate(name, lines, enabled):
     arch = ""
     objs = []
     deps = []
@@ -49,7 +49,13 @@ def generate(name, lines):
             elif kind == 'arch':
                 arch = data;
             elif kind == 'kconfig':
-                pass # ignore
+                # don't add a module which dependency is not enabled
+                # in kconfig
+                if data.strip() not in enabled:
+                    print("    /* module {} isn't enabled in Kconfig. */"
+                          .format(data.strip()))
+                    print("/* },{ */")
+                    return None
             else:
                 print("unknown:", kind)
                 exit(1)
@@ -60,8 +66,8 @@ def generate(name, lines):
     print_array("objs", objs)
     print_array("deps", deps)
     print_array("opts", opts)
-    print("},{");
-    return deps
+    print("},{")
+    return {dep.strip('" ') for dep in deps}
 
 def print_pre():
     print("/* generated by scripts/modinfo-generate.py */")
@@ -74,23 +80,38 @@ def print_post():
     print("}};")
 
 def main(args):
-    deps = {}
+    if len(args) < 3 or args[0] != '--devices':
+        print('Expected: modinfo-generate.py --devices '
+              'config-device.mak [modinfo files]', file=sys.stderr)
+        exit(1)
+
+    # get all devices enabled in kconfig, from *-config-device.mak
+    enabled = set()
+    with open(args[1]) as file:
+        for line in file.readlines():
+            config = line.split('=')
+            if config[1].rstrip() == 'y':
+                enabled.add(config[0][7:]) # remove CONFIG_
+
+    deps = set()
+    modules = set()
     print_pre()
-    for modinfo in args:
+    for modinfo in args[2:]:
         with open(modinfo) as f:
             lines = f.readlines()
         print("    /* %s */" % modinfo)
-        (basename, ext) = os.path.splitext(modinfo)
-        deps[basename] = generate(basename, lines)
+        (basename, _) = os.path.splitext(modinfo)
+        moddeps = generate(basename, lines, enabled)
+        if moddeps is not None:
+            modules.add(basename)
+            deps.update(moddeps)
     print_post()
 
-    flattened_deps = {flat.strip('" ') for dep in deps.values() for flat in dep}
     error = False
-    for dep in flattened_deps:
-        if dep not in deps.keys():
-            print("Dependency {} cannot be satisfied".format(dep),
-                  file=sys.stderr)
-            error = True
+    for dep in deps.difference(modules):
+        print("Dependency {} cannot be satisfied".format(dep),
+              file=sys.stderr)
+        error = True
 
     if error:
         exit(1)
-- 
2.36.1



