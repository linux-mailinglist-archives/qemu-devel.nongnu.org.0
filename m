Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A350CA86
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:18:48 +0200 (CEST)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFex-0005DT-R6
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFj-0007Ml-Ab
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:43 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFg-0005Bm-BG
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:41 -0400
Received: by mail-ej1-x62f.google.com with SMTP id y10so21132933ejw.8
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VBs4vjitGdQirWraLuswcU5ORW9WNwSgTDn5ND5M/lY=;
 b=V7d7xzGYzUFhPHyIobuNBYNKx8WbrHI30jnYlI8a5HG26YhpHcWIed7XPbWmt//g6j
 Picd48svXepdKHkPfry6gAvkU1aO0kXS55S/lzIfHEA+dTktc7swYquKAEiNv1HEZ23C
 NMfFCBLYo904hpD9EDzhqImFkD0rmkVtyK8Bx2nEjpyoQctHs0BrXfTJn+zGaVBIa47F
 lt+6bQeCuPeIHmAmKh+WV0vn5V6hJ74/2vtEeS9R6TYaL3+HzWu3A7VbfOhjeY4xehsT
 UWaFHnm2aTwi7J3xPGVWezagPoVA88vhhVj3DPgrBRSF3WgEBr0jK+bAAU/B6Eym4cLA
 +2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VBs4vjitGdQirWraLuswcU5ORW9WNwSgTDn5ND5M/lY=;
 b=Qw0M7IzKm8VT4FR3k0sJdpuku4AptqQbSkAOMLNCxnntExEgOSfVTiKxTkqpu7LojN
 8+i2bMt18oD9JObjtlp4zDJ3IDFZHqz3HVAZ7qPWgsbdn16eF8OK5eWGGtWzCGdboxL9
 ODBPR9WB1+x281k3SD0PvMdA31PmZ/MJnSVcNJ8YPTox7P14G5x0nxU2hCUTac1i9gdi
 w+E3sbK3hfGLRLGgM44G4omoNRkXj9hGg7RrEhXx9Mol+9JUAF0b5FLkJapG4zP6CLHs
 l0Z8DV7O5A/rwQJyU18Ncor08z+7hDBx6mXyJFRxn6yA8lPXxTv1P+/iz1MTKw3qPJzu
 /CZA==
X-Gm-Message-State: AOAM533y56P+zq/BF2KGAPSQpavvBrGQYJEP7yNCbJ5muivDBHyFNNXc
 AEKvG85KtTcSMx3zLqBl84DbeT47M7KH+g==
X-Google-Smtp-Source: ABdhPJznY11BRCD+kab/k8RQWrdzgEup4lJLTfkk6nHkCcchiHn4Asy+uq9BLuxJri+1c/tS4SmarA==
X-Received: by 2002:a17:907:6e0d:b0:6e0:59ae:21f1 with SMTP id
 sd13-20020a1709076e0d00b006e059ae21f1mr8442926ejc.362.1650718358921; 
 Sat, 23 Apr 2022 05:52:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/34] meson, configure: move bdrv whitelists to meson
Date: Sat, 23 Apr 2022 14:51:37 +0200
Message-Id: <20220423125151.27821-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new support for string option parsing.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
v1->v2: fix RO/RW typo

 configure                     | 14 --------------
 meson.build                   | 27 ++++++++++++++++-----------
 meson_options.txt             |  4 ++++
 scripts/meson-buildoptions.sh |  8 ++++++++
 4 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/configure b/configure
index c23f12159e..56dcc7ba8e 100755
--- a/configure
+++ b/configure
@@ -235,8 +235,6 @@ interp_prefix="/usr/gnemul/qemu-%M"
 static="no"
 cross_compile="no"
 cross_prefix=""
-block_drv_rw_whitelist=""
-block_drv_ro_whitelist=""
 host_cc="cc"
 lto="false"
 stack_protector=""
@@ -815,10 +813,6 @@ for opt do
     # configure to be used by RPM and similar macros that set
     # lots of directory switches by default.
   ;;
-  --block-drv-rw-whitelist=*|--block-drv-whitelist=*) block_drv_rw_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
-  ;;
-  --block-drv-ro-whitelist=*) block_drv_ro_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
-  ;;
   --enable-debug-tcg) debug_tcg="yes"
   ;;
   --disable-debug-tcg) debug_tcg="no"
@@ -1154,12 +1148,6 @@ Advanced options (experts only):
   --disable-stack-protector disable compiler-provided stack protection
   --audio-drv-list=LIST    set audio drivers to try if -audiodev is not used
   --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
-  --block-drv-rw-whitelist=L
-                           set block driver read-write whitelist
-                           (by default affects only QEMU, not tools like qemu-img)
-  --block-drv-ro-whitelist=L
-                           set block driver read-only whitelist
-                           (by default affects only QEMU, not tools like qemu-img)
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --cpu=CPU                Build for host CPU [$cpu]
@@ -2184,8 +2172,6 @@ fi
 if test "$static" = "yes" ; then
   echo "CONFIG_STATIC=y" >> $config_host_mak
 fi
-echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
-echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
 qemu_version=$(head $source_path/VERSION)
 echo "PKGVERSION=$pkgversion" >>$config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
diff --git a/meson.build b/meson.build
index f0b861aacd..da8d3076d7 100644
--- a/meson.build
+++ b/meson.build
@@ -1592,6 +1592,19 @@ have_virtfs = get_option('virtfs') \
 
 have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
 
+if get_option('block_drv_ro_whitelist') == ''
+  config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
+else
+  config_host_data.set('CONFIG_BDRV_RO_WHITELIST',
+        '"' + get_option('block_drv_ro_whitelist').replace(',', '", "') + '"')
+endif
+if get_option('block_drv_rw_whitelist') == ''
+  config_host_data.set('CONFIG_BDRV_RW_WHITELIST', '')
+else
+  config_host_data.set('CONFIG_BDRV_RW_WHITELIST',
+        '"' + get_option('block_drv_rw_whitelist').replace(',', '", "') + '"')
+endif
+
 foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
 endforeach
@@ -2206,16 +2219,8 @@ config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
     'HAVE_GDB_BIN']
-arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
 foreach k, v: config_host
-  if ignored.contains(k)
-    # do nothing
-  elif arrays.contains(k)
-    if v != ''
-      v = '"' + '", "'.join(v.split()) + '", '
-    endif
-    config_host_data.set(k, v)
-  elif k.startswith('CONFIG_')
+  if k.startswith('CONFIG_') and not ignored.contains(k)
     config_host_data.set(k, v == 'y' ? 1 : v)
   endif
 endforeach
@@ -3797,8 +3802,8 @@ summary_info = {}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
 summary_info += {'coroutine pool':    have_coroutine_pool}
 if have_block
-  summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
-  summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
+  summary_info += {'Block whitelist (rw)': get_option('block_drv_rw_whitelist')}
+  summary_info += {'Block whitelist (ro)': get_option('block_drv_ro_whitelist')}
   summary_info += {'Use block whitelist in tools': get_option('block_drv_whitelist_in_tools')}
   summary_info += {'VirtFS support':    have_virtfs}
   summary_info += {'build virtiofs daemon': have_virtiofsd}
diff --git a/meson_options.txt b/meson_options.txt
index 891c0ec130..ec974003b3 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -21,6 +21,10 @@ option('default_devices', type : 'boolean', value : true,
 option('audio_drv_list', type: 'array', value: ['default'],
        choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl'],
        description: 'Set audio driver list')
+option('block_drv_rw_whitelist', type : 'string', value : '',
+       description: 'set block driver read-write whitelist (by default affects only QEMU, not tools like qemu-img)')
+option('block_drv_ro_whitelist', type : 'string', value : '',
+       description: 'set block driver read-only whitelist (by default affects only QEMU, not tools like qemu-img)')
 option('fuzzing_engine', type : 'string', value : '',
        description: 'fuzzing engine library for OSS-Fuzz')
 option('trace_file', type: 'string', value: 'trace',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 0e0548aa87..4c49d4af08 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -2,6 +2,12 @@
 meson_options_help() {
   printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices:'
   printf "%s\n" '                           alsa/coreaudio/default/dsound/jack/oss/pa/sdl)'
+  printf "%s\n" '  --block-drv-ro-whitelist=VALUE'
+  printf "%s\n" '                           set block driver read-only whitelist (by default'
+  printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
+  printf "%s\n" '  --block-drv-rw-whitelist=VALUE'
+  printf "%s\n" '                           set block driver read-write whitelist (by default'
+  printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
@@ -161,6 +167,8 @@ _meson_option_parse() {
     --disable-avx2) printf "%s" -Davx2=disabled ;;
     --enable-avx512f) printf "%s" -Davx512f=enabled ;;
     --disable-avx512f) printf "%s" -Davx512f=disabled ;;
+    --block-drv-ro-whitelist=*) quote_sh "-Dblock_drv_ro_whitelist=$2" ;;
+    --block-drv-rw-whitelist=*) quote_sh "-Dblock_drv_rw_whitelist=$2" ;;
     --enable-block-drv-whitelist-in-tools) printf "%s" -Dblock_drv_whitelist_in_tools=true ;;
     --disable-block-drv-whitelist-in-tools) printf "%s" -Dblock_drv_whitelist_in_tools=false ;;
     --enable-bochs) printf "%s" -Dbochs=enabled ;;
-- 
2.35.1



