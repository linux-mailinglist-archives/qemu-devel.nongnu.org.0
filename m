Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1221515001
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:55:38 +0200 (CEST)
Received: from localhost ([::1]:53152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSy2-0006DM-1u
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSs-00028M-ED
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:26 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSq-00069b-Nc
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:26 -0400
Received: by mail-ej1-x631.google.com with SMTP id dk23so16093906ejb.8
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZe5XfwXTVI3O5zGujNaKUL1PtQPp4bviw9gZAV8t6c=;
 b=HK3gafuq1yYsLJFYVEoXShAVIBIB5EmufcZ0UOd/6iJPtU7/8pu4CGMKCt0UmSoiE4
 5AzOTX+l0RwayXUc3EwbHw2wKRCHQ/X0asRYlJvY8puIzVq/W/V48cLuH0ORQKUZ4vwY
 pUxPWj7HCuxw12tEtr8KS7dWNyW2Lb4fzQeuAIuYT9oID4EyC0n6YxVVM2fRE0/ty4dc
 02lte0CVpOMZbvIjMBweSAERk1anTKdIzTGli6DwgZrluHJ1N3Ms8871/OhrOOVDCL2G
 E6wELsalPs9CNsNaAsfRPv1Xbim2r3eUkHEEadODxaAYlOpiNApUvUhe/WJXljNnajrk
 0O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eZe5XfwXTVI3O5zGujNaKUL1PtQPp4bviw9gZAV8t6c=;
 b=2iortfQkr8OKjOGCR2z41CBZMR3ejPa22p/Wcl1AHhCljr7ZqNTfd3l5N3cDSc6XS6
 VGpFb6MsXt4YinjjjdIH88IpBA0jWsAp1NEJkktqyD4xjpwLzpVqPf5KtxBU7n149S7K
 v5cT4tH92NgHi9QmsDzUeRFSp8VVypZ4luWuQ5Q7MSOd1Jj3XVRoTpqzbohYeMEyGppS
 VITywhaXjynSfHkmEISweuVHf7ysr8vLkYZXdYD8Qbdarl/dSbb10+79hUk3l2fqC2ZJ
 SDieQMXwS9we6doazXVuuTwQhN7WsRHSxTFh7kxMTt6YedJsR+nSgI7HzlTwbJkiwtKs
 xFZg==
X-Gm-Message-State: AOAM530/zARwd7gnUedouMzisSbYSf9eXkcNYtC021Tn1BCPwWBPaJKb
 DxEcArwGdxJLYWSKeXuznHzpRL3DyTtQ3A==
X-Google-Smtp-Source: ABdhPJz4uKSC9Zd27lyGIntNOoDkqDaFxACIDWshgEMrzcEfOnW+3AUCAhGuArniFG0M/idZBrherQ==
X-Received: by 2002:a17:906:a08b:b0:6cf:65bc:e7de with SMTP id
 q11-20020a170906a08b00b006cf65bce7demr37415885ejy.220.1651245803465; 
 Fri, 29 Apr 2022 08:23:23 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/25] meson, configure: move --interp-prefix to meson
Date: Fri, 29 Apr 2022 17:22:59 +0200
Message-Id: <20220429152312.335715-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the last CONFIG_* entry in config-host.mak that had to be
special cased.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 6 ------
 meson.build                   | 6 ++----
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index b8d3d04072..4102683d75 100755
--- a/configure
+++ b/configure
@@ -231,7 +231,6 @@ fi
 
 # default parameters
 cpu=""
-interp_prefix="/usr/gnemul/qemu-%M"
 static="no"
 cross_compile="no"
 cross_prefix=""
@@ -697,8 +696,6 @@ for opt do
   ;;
   --prefix=*) prefix="$optarg"
   ;;
-  --interp-prefix=*) interp_prefix="$optarg"
-  ;;
   --cross-prefix=*)
   ;;
   --cc=*)
@@ -1091,8 +1088,6 @@ Options: [defaults in brackets after descriptions]
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
index 0ff752343a..83b06ca611 100644
--- a/meson.build
+++ b/meson.build
@@ -2227,10 +2227,8 @@ if targetos == 'windows' and link_language == 'cpp'
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
@@ -2336,7 +2334,7 @@ foreach target : target_dirs
     config_target += {
       'CONFIG_USER_ONLY': 'y',
       'CONFIG_QEMU_INTERP_PREFIX':
-        config_host['CONFIG_QEMU_INTERP_PREFIX'].format(config_target['TARGET_NAME'])
+        get_option('interp_prefix').replace('%M', config_target['TARGET_NAME'])
     }
   endif
 
diff --git a/meson_options.txt b/meson_options.txt
index bdb45092ca..ae6c4b2475 100644
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
index 3a86dd7271..59c4a27c5a 100644
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



