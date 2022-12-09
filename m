Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B586481F2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:48:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bX7-0005qm-99; Fri, 09 Dec 2022 06:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUs-0003yc-3S
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUn-0000zv-J5
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7GByV2/tPXhbOnzsuk4iLNqmk3qgnJ2d7J1SI0Y0iM=;
 b=LQEANeu5kgN20lqFRdDeS63Df0FuN2Hsx7+YB684vPA4X4AThhaZ5OVTxBM83Uz2tb+JzK
 e+t8o8sMDt9z+xbUJK1USj+qrmkLy0mvd1cChXmXjuv1wRrkANqp2NPWklePYnBa9102wi
 40POZOq4QEGGZasE+urNFU8U0psojsE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-quXVSTrvNCOtoCU4DzFsKg-1; Fri, 09 Dec 2022 06:24:46 -0500
X-MC-Unique: quXVSTrvNCOtoCU4DzFsKg-1
Received: by mail-ej1-f72.google.com with SMTP id
 js17-20020a17090797d100b007c0dd8018b6so2920511ejc.17
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O7GByV2/tPXhbOnzsuk4iLNqmk3qgnJ2d7J1SI0Y0iM=;
 b=K2l4p/PCfcA7Z0rsLVUF7ISy95T0PnxJ7Z6wgNWSOjXnJRc5Q/0V6venySM2fgG4WM
 YD+8K8/TLnuE1h9x8ECbLH2H3yKmMnB66DdrH94NQWUA3jH/GUAtamspJE24vsKkMYf0
 VF9ztTDlGLhzkk7r5O8pWvyJHCshSTyJnusFNXzeoOL78I4+LNdpWNQE0vQIgAHIefEe
 eYzOWBl8YcQfzHvPR9qEoZoELxlnj/G1AbR3shdWT1iMUHT0WAKEb+jy0ydzQbOWLuh5
 0/0UcWLoynHegr7qZp8yw5jRq4r1AyZHP9P2r3aVM8zy/py15DK1jeEMzYb8Xe8tyGUL
 3LOQ==
X-Gm-Message-State: ANoB5pkxOM3YEDeONPdQJxHQNIVVU1oFXSXXwj7a+zwv9iS8wtPKtBtD
 rXzqUWTYMAFAwkuohqo3CjIWxtpIh1BWriNVCMbkB1Vsuq8v54BrMX04v/pQC8XkRVBWMwrFdnd
 9RC54VXf9GLdEOwIlphUz8PKaRBdGMDy5v6ayoCkMaJMkcn2DC+2IPTDfvlZGQur/Hhg=
X-Received: by 2002:a17:907:a803:b0:78d:f457:1062 with SMTP id
 vo3-20020a170907a80300b0078df4571062mr6021585ejc.31.1670585085232; 
 Fri, 09 Dec 2022 03:24:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf79xKurqpd3pkShQl8nz4JgRCMVxyeClZIGTCjSLKja6A0QotmIxhOjB1nLwo7lRgv+yheAgQ==
X-Received: by 2002:a17:907:a803:b0:78d:f457:1062 with SMTP id
 vo3-20020a170907a80300b0078df4571062mr6021568ejc.31.1670585084896; 
 Fri, 09 Dec 2022 03:24:44 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 lb17-20020a170907785100b007a9c3831409sm442583ejc.137.2022.12.09.03.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 12/30] modinfo: lookup compile_commands.json by object
Date: Fri,  9 Dec 2022 12:23:51 +0100
Message-Id: <20221209112409.184703-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With Meson 0.63 having fixed various issues with extract_objects, the
compile_commands.json lookups can be simplified.  If the lookup uses
the object file as key, there is no need to use the command line to
distinguish among all entries for a given source.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                | 14 ++++----------
 scripts/modinfo-collect.py | 23 +++++++++++------------
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/meson.build b/meson.build
index 9ccbe0f6e4ee..8a9ed5628317 100644
--- a/meson.build
+++ b/meson.build
@@ -3123,16 +3123,11 @@ foreach d, list : modules
         softmmu_mods += sl
       endif
       if module_ss.sources() != []
-        # FIXME: Should use sl.extract_all_objects(recursive: true) as
-        # input. Sources can be used multiple times but objects are
-        # unique when it comes to lookup in compile_commands.json.
-        # Depnds on a mesion version with
-        # https://github.com/mesonbuild/meson/pull/8900
         modinfo_files += custom_target(d + '-' + m + '.modinfo',
                                        output: d + '-' + m + '.modinfo',
-                                       input: module_ss.sources() + genh,
+                                       input: sl.extract_all_objects(recursive: true),
                                        capture: true,
-                                       command: [modinfo_collect, module_ss.sources()])
+                                       command: [modinfo_collect, '@INPUT@'])
       endif
     else
       if d == 'block'
@@ -3165,12 +3160,11 @@ foreach d, list : target_modules
                                 c_args: c_args,
                                 pic: true)
             softmmu_mods += sl
-            # FIXME: Should use sl.extract_all_objects(recursive: true) too.
             modinfo_files += custom_target(module_name + '.modinfo',
                                            output: module_name + '.modinfo',
-                                           input: target_module_ss.sources() + genh,
+                                           input: sl.extract_all_objects(recursive: true),
                                            capture: true,
-                                           command: [modinfo_collect, '--target', target, target_module_ss.sources()])
+                                           command: [modinfo_collect, '--target', target, '@INPUT@'])
           endif
         endif
       endforeach
diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
index 4e7584df6676..48bd92bd6180 100755
--- a/scripts/modinfo-collect.py
+++ b/scripts/modinfo-collect.py
@@ -7,15 +7,6 @@
 import shlex
 import subprocess
 
-def find_command(src, target, compile_commands):
-    for command in compile_commands:
-        if command['file'] != src:
-            continue
-        if target != '' and command['command'].find(target) == -1:
-            continue
-        return command['command']
-    return 'false'
-
 def process_command(src, command):
     skip = False
     out = []
@@ -43,14 +34,22 @@ def main(args):
         print("MODINFO_DEBUG target %s" % target)
         arch = target[:-8] # cut '-softmmu'
         print("MODINFO_START arch \"%s\" MODINFO_END" % arch)
+
     with open('compile_commands.json') as f:
-        compile_commands = json.load(f)
-    for src in args:
+        compile_commands_json = json.load(f)
+    compile_commands = { x['output']: x for x in compile_commands_json }
+
+    for obj in args:
+        entry = compile_commands.get(obj, None)
+        if not entry:
+            sys.stderr.print('modinfo: Could not find object file', obj)
+            sys.exit(1)
+        src = entry['file']
         if not src.endswith('.c'):
             print("MODINFO_DEBUG skip %s" % src)
             continue
+        command = entry['command']
         print("MODINFO_DEBUG src %s" % src)
-        command = find_command(src, target, compile_commands)
         cmdline = process_command(src, command)
         print("MODINFO_DEBUG cmd", cmdline)
         result = subprocess.run(cmdline, stdout = subprocess.PIPE,
-- 
2.38.1


