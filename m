Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC01051E48B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 07:58:15 +0200 (CEST)
Received: from localhost ([::1]:35394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnDSI-0006dc-Ui
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 01:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nnDLS-0002EX-Ve
 for qemu-devel@nongnu.org; Sat, 07 May 2022 01:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nnDLR-0003ep-4s
 for qemu-devel@nongnu.org; Sat, 07 May 2022 01:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651902666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hh/GR7w4jSmMdtn2gDjYE86RvZ/jQ6FAnNvqBPGVq/E=;
 b=dTDIodWdiaOEBmr9lQCRRnnUO1/uPPPssZYX7/CoYFjeL08WMWOnH5plN25ir87MYxk1rw
 1yztb4qIisAqZ1366c1joWfBsoRtD+DYOxRoqLmNfdG3Mx1LeO9VXaxHd/HnAhd7IjU6us
 F/Ws662+t4DFOIxTJ+2REcvGTxJfZJs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-TgrtnNDeODGvSDbA1WHipA-1; Sat, 07 May 2022 01:51:05 -0400
X-MC-Unique: TgrtnNDeODGvSDbA1WHipA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hq12-20020a1709073f0c00b006f48c335617so5297893ejc.2
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 22:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hh/GR7w4jSmMdtn2gDjYE86RvZ/jQ6FAnNvqBPGVq/E=;
 b=EJyEXRYwbehTA8TZbylZMBWBzMtn5aqXDaebcMh5m9EoMGpHZwZwO1ElaBg1Luuch+
 cum+A3dh9M8yjLqxF8iC0Bf0Tmtfbxhv3JYfm5q83o962fKW8sig8WHMpi2yu6zG/kWF
 DR3m4eLv2ikLbqmSDWrsCcz9pgHfi7CaRajgj71tYO4oLDB9UO/zpRKS4V1Rqy56PNti
 yks+bkKynvkPqDI38OYnlRqrL5lIG8N6Xrqp5oQ/+3gKinYGOvHzKVebh50AGEeHT1ed
 IKwJn+BdssqFS6Qmj6zWlstx1uv2RJb4ZPQXfD8boX0AFUg8PAjYHJGuDgt2ei5+nHb8
 ZFrQ==
X-Gm-Message-State: AOAM530I/ZuUlGlfTlsd9SxYGdCFDEaekhxA8K2dOFDI6zBRLzAvb8vj
 pFfaIS4ff+BBDYXkkScJ5whmcLKLrOJbc/F7Eliffl4tpyasb6WKYkLEcuv1DYcCs7ZCliKIJ+/
 OkSlCuNxDea9FNuTZuJHx1ducciy1IGu6bcwTY8rDzeCL410C5tluSTp2kA8Ufrx9QDk=
X-Received: by 2002:a17:907:3f86:b0:6db:b745:f761 with SMTP id
 hr6-20020a1709073f8600b006dbb745f761mr6050552ejc.610.1651902663926; 
 Fri, 06 May 2022 22:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiFuOuMi/MnVblzjU22wvHdQbIAr88+VdHTei4/Mw7mOYxYIJrhxxvBJEySWHWDH/PC9vPow==
X-Received: by 2002:a17:907:3f86:b0:6db:b745:f761 with SMTP id
 hr6-20020a1709073f8600b006dbb745f761mr6050538ejc.610.1651902663556; 
 Fri, 06 May 2022 22:51:03 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 hb44-20020a170907162c00b006f3ef214e26sm2714533ejc.140.2022.05.06.22.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 22:51:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 10/25] meson, configure: move bdrv whitelists to meson
Date: Sat,  7 May 2022 07:50:59 +0200
Message-Id: <20220507055059.125324-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507055059.125324-1-pbonzini@redhat.com>
References: <20220507055059.125324-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index ae3b3a45e7..3604a0d264 100644
--- a/meson.build
+++ b/meson.build
@@ -1594,6 +1594,19 @@ have_virtfs = get_option('virtfs') \
 
 have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
 
+if get_option('block_drv_ro_whitelist') == ''
+  config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
+else
+  config_host_data.set('CONFIG_BDRV_RO_WHITELIST',
+        '"' + get_option('block_drv_ro_whitelist').replace(',', '", "') + '", ')
+endif
+if get_option('block_drv_rw_whitelist') == ''
+  config_host_data.set('CONFIG_BDRV_RW_WHITELIST', '')
+else
+  config_host_data.set('CONFIG_BDRV_RW_WHITELIST',
+        '"' + get_option('block_drv_rw_whitelist').replace(',', '", "') + '", ')
+endif
+
 foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
 endforeach
@@ -2209,16 +2222,8 @@ config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
 
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
@@ -3800,8 +3805,8 @@ summary_info = {}
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


