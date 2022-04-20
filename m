Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC1508C6D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:49:34 +0200 (CEST)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCaD-0004kg-UP
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLt-0001oJ-Ow
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:45 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLs-0000z7-07
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:45 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so1508070wms.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOwOPwaL3uOrEX0319KPKBGNWZApezlxb9nD0A6Am/Q=;
 b=dBydlTle/vx3RATEAl5l5PFIBus44nMVLrHd30Fxt9YUnRv4lebxfr+lRpl8Gt18NF
 tiAYNFGy99WT+cezPhJN3Aaj/PTn1BSnkn8tANjk7Qw+RN4NPffx1PPBPFGcn84cBiBV
 H522A3BsZzOPN/RyRQp/HWTjhlIQDrpybSERsf4y93wBzYKIqURW2UdG3jVO6sv+8wQm
 KbyZRQ7wEW42KRN7sctcHEtTU0osfmynQ6WMq2BzGqOvGaSkp+3mWUGt9CcnqJCgeZic
 F2uRfsEfi+7RnihIfoVla+2CrTbxkIXrFI1/ybn2QtFVVN/fMJKpdcb7mTg4JWDqcYsK
 0nNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uOwOPwaL3uOrEX0319KPKBGNWZApezlxb9nD0A6Am/Q=;
 b=Y6SJp3JkufYCOLF2hIMsPSLnY+5nrp2b5q8nlYLWgEDj4v1KRBc5aoX5kiTzMsvabr
 MypWsCYT+5pbcrkkk4CJXyRAgETNPWbDsyW23aZeR2hyc7pwszaf1GupsD7ytZ333wni
 jnj0fCktOizo7ddXAs0jaCSmEwZiAxhZ8r8/f7I17if1G8NjfEpuHPd06sumpIgWPjrC
 MV5uADb5P1Ws/x3RUe/fur8YqF59nipTHL8BkbxdNCjnevzYdwYM2ghTLvh7VH8hSdgO
 0zwV+Mfxqm3IgCNt2aI/1HCsuq3FdGhRLv2x+77kuQLenA+oSMTJDj5W4lS9vYLhTPr0
 b3Ng==
X-Gm-Message-State: AOAM530XMzP8qExSMRUs4JTm8wqnXDlm+eYqrf7eArjjslTZskire7Xc
 G2reizn+Xc2LCxmedhjWot+6ohIw8uaPyQ==
X-Google-Smtp-Source: ABdhPJyVLAO41ILcJFBh9wv0FiK0IUJpWTbpV/+zGoMfydPvk49KVkLiWGrkLfnPpm8bFc9oPzep6Q==
X-Received: by 2002:a05:600c:b54:b0:390:82ee:e15b with SMTP id
 k20-20020a05600c0b5400b0039082eee15bmr4217038wmr.17.1650468882426; 
 Wed, 20 Apr 2022 08:34:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/34] meson, configure: move --interp-prefix to meson
Date: Wed, 20 Apr 2022 17:33:55 +0200
Message-Id: <20220420153407.73926-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This is the last CONFIG_* entry in config-host.mak that had to be
special cased.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 6 ------
 meson.build                   | 6 ++----
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index 5bf0a7d69b..200ef3be23 100755
--- a/configure
+++ b/configure
@@ -231,7 +231,6 @@ fi
 
 # default parameters
 cpu=""
-interp_prefix="/usr/gnemul/qemu-%M"
 static="no"
 cross_compile="no"
 cross_prefix=""
@@ -696,8 +695,6 @@ for opt do
   ;;
   --prefix=*) prefix="$optarg"
   ;;
-  --interp-prefix=*) interp_prefix="$optarg"
-  ;;
   --cross-prefix=*)
   ;;
   --cc=*)
@@ -1090,8 +1087,6 @@ Options: [defaults in brackets after descriptions]
 Standard options:
   --help                   print this message
   --prefix=PREFIX          install in PREFIX [$prefix]
-  --interp-prefix=PREFIX   where to find shared libraries, etc.
-                           use %M for cpu name [$interp_prefix]
   --target-list=LIST       set target list (default: build all)
 $(echo Available targets: $default_target_list | \
   fold -s -w 53 | sed -e 's/^/                           /')
@@ -2289,7 +2284,6 @@ for target in $target_list; do
     esac
 done
 
-echo "CONFIG_QEMU_INTERP_PREFIX=$interp_prefix" | sed 's/%M/@0@/' >> $config_host_mak
 if test "$default_targets" = "yes"; then
   echo "CONFIG_DEFAULT_TARGETS=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 424ff454d2..869cc10128 100644
--- a/meson.build
+++ b/meson.build
@@ -2226,10 +2226,8 @@ if targetos == 'windows' and link_language == 'cpp'
 endif
 config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
 
-ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
-    'HAVE_GDB_BIN']
 foreach k, v: config_host
-  if k.startswith('CONFIG_') and not ignored.contains(k)
+  if k.startswith('CONFIG_')
     config_host_data.set(k, v == 'y' ? 1 : v)
   endif
 endforeach
@@ -2323,7 +2321,7 @@ foreach target : target_dirs
     config_target += {
       'CONFIG_USER_ONLY': 'y',
       'CONFIG_QEMU_INTERP_PREFIX':
-        config_host['CONFIG_QEMU_INTERP_PREFIX'].format(config_target['TARGET_NAME'])
+        get_option('interp_prefix').replace('%M', config_target['TARGET_NAME'])
     }
   endif
 
diff --git a/meson_options.txt b/meson_options.txt
index dc6fb796c6..848426460c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -27,6 +27,8 @@ option('block_drv_rw_whitelist', type : 'string', value : '',
        description: 'set block driver read-write whitelist (by default affects only QEMU, not tools like qemu-img)')
 option('block_drv_ro_whitelist', type : 'string', value : '',
        description: 'set block driver read-only whitelist (by default affects only QEMU, not tools like qemu-img)')
+option('interp_prefix', type : 'string', value : '/usr/gnemul/qemu-%M',
+       description: 'where to find shared libraries etc., use %M for cpu name')
 option('fuzzing_engine', type : 'string', value : '',
        description: 'fuzzing engine library for OSS-Fuzz')
 option('trace_file', type: 'string', value: 'trace',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index bf9878e24f..a0c86db116 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -41,6 +41,8 @@ meson_options_help() {
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
+  printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
+  printf "%s\n" '                           cpu name [/usr/gnemul/qemu-%M]'
   printf "%s\n" '  --sphinx-build=VALUE     Use specified sphinx-build for building document'
   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
   printf "%s\n" '                           [NORMAL]'
@@ -252,6 +254,7 @@ _meson_option_parse() {
     --disable-iconv) printf "%s" -Diconv=disabled ;;
     --enable-install-blobs) printf "%s" -Dinstall_blobs=true ;;
     --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
+    --interp-prefix=*) quote_sh "-Dinterp_prefix=$2" ;;
     --enable-jack) printf "%s" -Djack=enabled ;;
     --disable-jack) printf "%s" -Djack=disabled ;;
     --enable-keyring) printf "%s" -Dkeyring=enabled ;;
-- 
2.35.1



