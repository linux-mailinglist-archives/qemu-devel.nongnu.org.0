Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A203BC342
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 21:54:41 +0200 (CEST)
Received: from localhost ([::1]:36006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Ufv-0001p4-Tq
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 15:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m0Uf1-000156-Mh
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:53:43 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:36435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m0Uez-0000T4-Uo
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:53:43 -0400
Received: by mail-qt1-x835.google.com with SMTP id z12so7844755qtj.3
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 12:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71QQaUtLQ8oaGfECzNNjhnFx67Wf8Kv8nnxENU/PdLQ=;
 b=B4SQde5bdyxjsNFFLacFW23GAlBEbpuz4NfWdKqn+xiicAWYQ0X/JcWmH0xVqXLvA2
 r1hxBjRQS3i9Y/nlkCRoqS3aobO6ZMnQfp9cV+WeylX6qIZjjEiSnhdscfED03WY4Evi
 FgZcwa8LHh+Qg9j7idxoiQclJ3y+/Hy6S5az5//+Z/TBeBtz/RbUv8Zr982qS8VFZRax
 0NGlD8fP4e/ewCJNma0nwlZ9qvVUSEDbaOP+lnoyaKRazP73MPMaD9bdwTOMzguExpLS
 698QC3zJakPXyW71m9J89Qi+S4/Dm+P0Akq3CpOW+Ll4Zm13iaG0kPOqVIM4kCniefXb
 D/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=71QQaUtLQ8oaGfECzNNjhnFx67Wf8Kv8nnxENU/PdLQ=;
 b=EuFp/7zHvmXs0fN6CNB/gjSXTnsZBMsqTzgnm8yTS+aHkj+JtMlrzlDv0qs0hdvxqV
 laWEtbCmWrlwUQ/asX1SLnfZddK3p0gLNsnAL7ZXFW+BA04h61qprShH3BOCQz9h4pdV
 SnTUYas9f0XC801sgzB3ILaEPvhoYSPWfXzkDnN9zQM/m2aaYNxyka1AvA1k3721S0H1
 Z3vGA16cbB8nsBVHfynkSd8DUjFFlI1PgD/fx5WJ+ff39WHct8YEDVbapJ5aC7TS84b0
 V7C1cch87ey0d88DcK76fZjsSYZgMG8DPc2pRKyZF3ZCfE/R+eq8MQGCcn/rf3SNxwkf
 uVQA==
X-Gm-Message-State: AOAM532cVswzjd7vIPquJitpcdjT8vmTJNNgd22bMXqmky6vQGJj3LOt
 QM0bUNsBOGqad0mzdv8DmY8=
X-Google-Smtp-Source: ABdhPJwdO4n495tX0ppS32SYu0NDyIjHsPSHHPgzCXdByyESwS7ynqHKtDHxGUQfi6Hv3Hbrq2RM/Q==
X-Received: by 2002:ac8:4c89:: with SMTP id j9mr3573531qtv.16.1625514820938;
 Mon, 05 Jul 2021 12:53:40 -0700 (PDT)
Received: from localhost.localdomain (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id y10sm4719662qta.35.2021.07.05.12.53.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Jul 2021 12:53:40 -0700 (PDT)
From: John Arbuckle <programmingkidx@gmail.com>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v2] Set icon for QEMU binary on Mac OS
Date: Mon,  5 Jul 2021 15:53:28 -0400
Message-Id: <20210705195328.36442-1-programmingkidx@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: John Arbuckle <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---
v1 changes:
Rewrote the patch as the maintainer had wanted.

 meson.build            | 15 ++++++++++-----
 scripts/entitlement.sh | 10 +++++++++-
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index db6789af9c..499ab49981 100644
--- a/meson.build
+++ b/meson.build
@@ -2360,8 +2360,7 @@ foreach target : target_dirs
   endif
   foreach exe: execs
     exe_name = exe['name']
-    exe_sign = 'CONFIG_HVF' in config_target
-    if exe_sign
+    if targetos == 'darwin'
       exe_name += '-unsigned'
     endif
 
@@ -2375,7 +2374,13 @@ foreach target : target_dirs
                link_args: link_args,
                gui_app: exe['gui'])
 
-    if exe_sign
+    if 'CONFIG_HVF' in config_target
+      entitlements = meson.current_source_dir() / 'accel/hvf/entitlements.plist'
+    else
+      entitlements = '/dev/null'
+    endif
+    if targetos == 'darwin'
+      icon = '...'
       emulators += {exe['name'] : custom_target(exe['name'],
                    depends: emulator,
                    output: exe['name'],
@@ -2383,14 +2388,14 @@ foreach target : target_dirs
                      meson.current_source_dir() / 'scripts/entitlement.sh',
                      meson.current_build_dir() / exe_name,
                      meson.current_build_dir() / exe['name'],
-                     meson.current_source_dir() / 'accel/hvf/entitlements.plist'
+                     entitlements, icon
                    ])
       }
 
       meson.add_install_script('scripts/entitlement.sh', '--install',
                                get_option('bindir') / exe_name,
                                get_option('bindir') / exe['name'],
-                               meson.current_source_dir() / 'accel/hvf/entitlements.plist')
+                               entitlements, icon)
     else
       emulators += {exe['name']: emulator}
     endif
diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
index f7aaaf2766..46e378426b 100755
--- a/scripts/entitlement.sh
+++ b/scripts/entitlement.sh
@@ -11,6 +11,7 @@ fi
 SRC="$1"
 DST="$2"
 ENTITLEMENT="$3"
+ICON="$4"
 
 if $in_place; then
   trap 'rm "$DST.tmp"' exit
@@ -20,6 +21,13 @@ else
   cd "$MESON_INSTALL_DESTDIR_PREFIX"
 fi
 
-codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
+if test "$ENTITLEMENT" != '/dev/null'; then
+  codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
+fi
+
+# Add the QEMU icon to the binary on Mac OS
+Rez -append '../pc-bios/qemu.rsrc' -o "$SRC"
+SetFile -a C "$SRC"
+
 mv -f "$SRC" "$DST"
 trap '' exit
-- 
2.24.3 (Apple Git-128)


