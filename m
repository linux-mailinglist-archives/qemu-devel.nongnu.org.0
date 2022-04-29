Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA55514FED
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:53:08 +0200 (CEST)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSvb-0001fe-53
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSq-00022o-Ry
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSo-000698-Vh
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:24 -0400
Received: by mail-ed1-x533.google.com with SMTP id e23so9441515eda.11
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fNc5lWvrIfTI+jbsjepWvHetTBezBT3cJOef0+HALMI=;
 b=Iwd8exNs35LcE8c7PWIaFSbkwqLI1lOboaAF4zWBE3yMhwNVMwOnib5eGEfer9inSW
 darz2xfscY9ze+Apmki5ZHD4bGTW5SmdZgK4zY5+0C9wzZonTuP3fl7nxB4kztMXK5s5
 fElczKY+ptgccz6AIT09gQhWlsa2rjGSVgCQfJjPiAqfalU46sU/YQpXLp5hSLPsUQ3j
 aUp0diEmRrh4hFh4hQOEX9dzP5qYraxGuw2Rh3S63j4Uq04Sn3yRjmZE+4TBHu2w7DyC
 Vi82SaBezTyv4Z7Dy0x8hf/3A8j86RSUYVv6iRkhUKEtiy6KTetDhxIh5ZQBIqCys1v1
 chfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fNc5lWvrIfTI+jbsjepWvHetTBezBT3cJOef0+HALMI=;
 b=2Wgbz4byVrxPn6RkQqXXeE34mUh1GT3LoyJ8wayKcsMDvKxrRTtO9wpjTp56e7u5ig
 VAeZfuia9c7kL0CVrhATKs0lhKyW1x7GU3KCrGcbS4zJJjxPkjZzZy9g+8LrWvyKAf3U
 i2u8rZRQaOc7apXylxDie4N9xQI6/uMO8R0gqg/Wh8gX+sUizGNFKPGSiKa+7q0nJige
 l3foPO36kZDykvm4j8tqYGikm5sdT1VlHZLnFyH+bQdnAqpJIYSei23eviRWDvm47x3f
 8S7AagKLXRuY0saiAKUh1/7kXE9DtbY4llr8cSFBPEEECLljQhF3VyFUftKHEKTWuGZ1
 G0MQ==
X-Gm-Message-State: AOAM531YW2qjjeY15gD8J72IAaz7rTMydJG3iCbs3B6d8Ab6STs3Ef/v
 b9HgWVPW8DidxApiPwCXpQJtLmnMxlEeOg==
X-Google-Smtp-Source: ABdhPJzvekwyu3iYqphRHHvr0NBjIZnmfz/WAvnOwiW7Mwg9E+d71UcDMUl0YgHJQSA3DmOQm92DwA==
X-Received: by 2002:a05:6402:22e1:b0:425:d5e5:c63 with SMTP id
 dn1-20020a05640222e100b00425d5e50c63mr32827595edb.185.1651245801727; 
 Fri, 29 Apr 2022 08:23:21 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/25] meson, configure: move bdrv whitelists to meson
Date: Fri, 29 Apr 2022 17:22:57 +0200
Message-Id: <20220429152312.335715-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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

Use the new support for string option parsing.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 14 --------------
 meson.build                   | 27 ++++++++++++++++-----------
 meson_options.txt             |  4 ++++
 scripts/meson-buildoptions.sh |  8 ++++++++
 4 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/configure b/configure
index 9062f9ccd6..e81ea490da 100755
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
@@ -816,10 +814,6 @@ for opt do
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
@@ -1155,12 +1149,6 @@ Advanced options (experts only):
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
@@ -2185,8 +2173,6 @@ fi
 if test "$static" = "yes" ; then
   echo "CONFIG_STATIC=y" >> $config_host_mak
 fi
-echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
-echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
 qemu_version=$(head $source_path/VERSION)
 echo "PKGVERSION=$pkgversion" >>$config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
diff --git a/meson.build b/meson.build
index f4f518c7b8..750840a0e9 100644
--- a/meson.build
+++ b/meson.build
@@ -1594,6 +1594,19 @@ have_virtfs = get_option('virtfs') \
 
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
@@ -2208,16 +2221,8 @@ config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
 
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
@@ -3799,8 +3804,8 @@ summary_info = {}
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
index c8e0a10d91..430674522f 100644
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
index 3919eeec0b..d5cba2638a 100644
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



