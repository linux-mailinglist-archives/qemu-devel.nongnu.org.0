Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850343BCA08
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:34:09 +0200 (CEST)
Received: from localhost ([::1]:41270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iP2-00038P-Gv
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu9-0001fV-LU
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:13 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu7-0002Wk-0Q
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id l1so13138318wme.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4a4DETRAyhHFXba3Piw4UbV8J7nicTVM9Gs0MaTHSM=;
 b=SCVWJ0je2KnVWwOq2zGyAD8uX7DIGqd7Bquwz3eoE5TCgODXaW1QzTf44qNRc6PTRM
 AfDGaPk6ev1HvVd6ytMi+aJf79hJ4d3cJw7ZHLaRc9uzcJYd3xuSrBdQLEiHGKEkQXAN
 aM2o5agVdXIGmS90+N0CwAnFOoCBfniwPpyPI6/mBCzCHR90ybYyNnB5qa1VwrSt9EVw
 5LGtcUa7dQlypTaPCWWY4QR40bSwpoOGqW4SgEj03/iWH0EDIqa9ZnBXONGt8+8sXmkW
 ex/x2I3GGvj3ijMKSE5CEJRFUCg2OBhuZu8OPuPkqfFwvckYBCUti5zmC7XQ4GR6vTWF
 oznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S4a4DETRAyhHFXba3Piw4UbV8J7nicTVM9Gs0MaTHSM=;
 b=IrO0m180yi74dKRKe+js8qZB3CxtlI4aIQjS/TNlzao53m6B78I6kH920lf2+1D49q
 IAY2fEZ99xExZsMioO+E+3Bd5Blngj694XYE9Z93a6K+76HglxE+PPgJmVM5PdfRT56x
 J7x812xU2JIg9mmfQ4H9Oe2H7C4MnVmYM9pgi4KmpjzqhpRPgv315FIDAxgiSgxo39sy
 /RmtF1YDk/L9j2dVnHgsIHdAUuNeYO1tCB4DyT/f/BoqHxEyakfGN1kE5dAaEgWGgWGZ
 UZovyn7j+nIVhV5h8Idmp/QNtjY8IGawSFK22UnBCsE3ZKno7S0Hxj0Q4DnwlRPZ831W
 eRWg==
X-Gm-Message-State: AOAM5311eza3x/Ydoto/hsOsAHa6xMv3PgJWLuWtn/+NolG//2DeDNfr
 a88kn/lJJtUOBxhgaR7ChzIwZIPMJBc=
X-Google-Smtp-Source: ABdhPJybRse/haUz3VL2CjODs4qa9cbyCFtjF0VmYCZy0fU0mJ1RCrNSJFvl7kjubbl4qUe5TyQscA==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr3845238wmh.69.1625565729766;
 Tue, 06 Jul 2021 03:02:09 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/40] Set icon for QEMU binary on Mac OS
Date: Tue,  6 Jul 2021 12:01:40 +0200
Message-Id: <20210706100141.303960-40-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
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



