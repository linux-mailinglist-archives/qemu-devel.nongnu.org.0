Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C103D3BC7B5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:17:55 +0200 (CEST)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gHC-00041X-SE
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0gG3-0002q1-Hv
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:16:43 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0gG1-00027B-Oo
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:16:43 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 h18-20020a05600c3512b029020e4ceb9588so1050033wmq.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 01:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S4a4DETRAyhHFXba3Piw4UbV8J7nicTVM9Gs0MaTHSM=;
 b=Gxwt3WqJ4BByL6Kl8bAt7nSWIb50wqC3YiWZV3/3ixjgsqwshr+Pkg/NkXU76z/lrK
 rtBOa24K9/aWKlZAAKKNoHJ1QduNvc3ISr8tcJMAsrO9GA3QU8ie0xEo0vFJt2Qt4sxv
 4QXOr1a8Vy5bft4cQt2wnFv8spFSDvLSeEwmlAjbo2lAckPOCcJHn6rCI7dKcSG4lC2A
 +utqBDwtk+t0LHtZyVYSGN0KF6maQbLmUAdW/eQG96/WAPjtNVZBu4+NlhWJJVEcp1Gc
 cfg7/qV23XrBcgu5WYYT9VwX4zWCDVNyToW4GgCXvrTQcQ7rOeZj//D0GXONJuboffNr
 U4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=S4a4DETRAyhHFXba3Piw4UbV8J7nicTVM9Gs0MaTHSM=;
 b=dwULVAljkqFnbgvdajnLt2acnRKRbTAiSjzFk+aJ4yUrp3VlDZhvqKEMp7EYYsnp+0
 fF3roAkPI1634/tFT6hsaaBrVqCMazA/HsWDbFzfwrFyEIxVb8HYYI6Ci9oCS0TTLE56
 yjBmL0Tduzlo5ikGTtIA9+qJfVlq2vTx7iP5jVAO1oJO3mjlCxtXyA4borcDQfVBXby0
 0jfy82jW40p8fbq0rxSwGIHKB/eJjT0b8tQGalPm472S7QwofYWeQ/Y2iWc3wXcJxFCZ
 aoehXrBL0sz4VQ+d2oKZgIpBcptmefYHhubcf5ul86YLpy/E9caKDA2JGijQQQ2ovvaG
 DKxg==
X-Gm-Message-State: AOAM530iJAkWQgsy533mrI1mqLsTEH3+ykUMYwPu+7MA5fP+JBH6PpJz
 XCWyqJRsM78Kojv1PZEHtxjCXfGwwJQ=
X-Google-Smtp-Source: ABdhPJwm0WvFtCck2Uiwr+s7k4xE/O4O6xXxIGS9E8AQlFaXdsGwcgWtt6OuPxN19YpDuh/HtKzavw==
X-Received: by 2002:a05:600c:1d06:: with SMTP id
 l6mr16034168wms.111.1625559399593; 
 Tue, 06 Jul 2021 01:16:39 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 i11sm2169819wmg.18.2021.07.06.01.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 01:16:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] Set icon for QEMU binary on Mac OS
Date: Tue,  6 Jul 2021 10:15:40 +0200
Message-Id: <20210706081540.298232-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: John Arbuckle <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Arbuckle <programmingkidx@gmail.com>

Before switching the build system over to Meson, an icon was
added to the QEMU binary on Mac OS. This patch adds back that
feature; it piggybacks on the existing scripts/entitlement.sh,
which already does in-place changes to the executable on Darwin.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
Message-Id: <20210705195328.36442-1-programmingkidx@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build            | 15 ++++++++++-----
 scripts/entitlement.sh | 10 +++++++++-
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 1651496800..8b61fdb4be 100644
--- a/meson.build
+++ b/meson.build
@@ -2507,8 +2507,7 @@ foreach target : target_dirs
   endif
   foreach exe: execs
     exe_name = exe['name']
-    exe_sign = 'CONFIG_HVF' in config_target
-    if exe_sign
+    if targetos == 'darwin'
       exe_name += '-unsigned'
     endif
 
@@ -2522,7 +2521,13 @@ foreach target : target_dirs
                link_args: link_args,
                gui_app: exe['gui'])
 
-    if exe_sign
+    if 'CONFIG_HVF' in config_target
+      entitlements = meson.current_source_dir() / 'accel/hvf/entitlements.plist'
+    else
+      entitlements = '/dev/null'
+    endif
+    if targetos == 'darwin'
+      icon = meson.current_source_dir() / 'pc-bios/qemu.rsrc'
       emulators += {exe['name'] : custom_target(exe['name'],
                    depends: emulator,
                    output: exe['name'],
@@ -2530,14 +2535,14 @@ foreach target : target_dirs
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
index f7aaaf2766..d2a7079ce3 100755
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
+Rez -append "$ICON" -o "$SRC"
+SetFile -a C "$SRC"
+
 mv -f "$SRC" "$DST"
 trap '' exit
-- 
2.31.1


