Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6D548DD17
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:46:16 +0100 (CET)
Received: from localhost ([::1]:49200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84Ax-0000T8-Bo
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:46:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83oH-0007mD-VX
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:22:49 -0500
Received: from [2a00:1450:4864:20::130] (port=36361
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83oF-0000pE-0L
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:22:49 -0500
Received: by mail-lf1-x130.google.com with SMTP id b14so3537339lff.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RclDevLSd6+w1woMZtxoloXjHn4OEESSZuOsEg2ug0=;
 b=h++zwS5+KwevZlvKknWgjT5NWv9dkZ/fd2gtEft55CDolT1GyCdWOFF7WRVn4AnNtJ
 GNqzB47e9kEGvR+dhEO7JYwb6R3to8Su7RTLJiYGfU6JNNBpG9y28zbuy76vJqv2bvv6
 Dm+PSC2mxFG7GrCsL4XFrH2hFt7KkNzpBqObSOLL88MhiFCWVAzIKF8mp9nd18cY6UPb
 49pL4PaOOzkmF7aPgjhj3bbg2EBjcAO0w04bvjiIDc2BNnmGfX3V3hhG+dnQbrEEG5k3
 JTVsKe+bomY/2WKyzW6wI4krMh7HIYUZTnhERE+GuyFa1eCnnT0IP6QKo6Jks2yvtHsY
 vEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6RclDevLSd6+w1woMZtxoloXjHn4OEESSZuOsEg2ug0=;
 b=1ZotHOV3YF2Q8S1r7uk3kUsdEkOkBDFxNj7uLdcPGABJ41fPOB7wMz7AYYd34c0dNN
 Qms05kSryaxQSh+WX8EJAbiQZTo5SJy76HBEPQih3rfVxqHEJ0uot9zYzF6T+qhw0a4O
 SL5Ye/8AQYZa5qwIko9n7czR+hf88xzxM7HdEciecoc5O6SO6h8fC199Ub1r7nK+E93P
 fP1KhiA663Oi88yHh45C45X+S6zA496dFA//aa6ESo9Tsdw3tqudgL6G4sQ5ObO64Wpj
 Z+FIetIN+X5eFalyDTtAGs41TtBy+EF76YJsseboo0QtZhu81QLekBtPH4/z7130KPcj
 uHDA==
X-Gm-Message-State: AOAM531wg2lvMn1vdfYTEFaBKbSY6lsEUJRZUqG2arsiJSAsz8MbyDYE
 2qsQDrmDqP+ObhHlpKMyPSNA6jRrMcNoalhd
X-Google-Smtp-Source: ABdhPJyevsn+6abst0HuQLt20n0rHcdFHUDV5FkKXXmm3Xd2bf/pNndVplQ+RnW2Fpg1kX2KpkEvYQ==
X-Received: by 2002:a05:651c:224:: with SMTP id
 z4mr3517545ljn.418.1642094565211; 
 Thu, 13 Jan 2022 09:22:45 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id h17sm323410ljk.41.2022.01.13.09.22.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 09:22:44 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 1/7] net/vmnet: add vmnet dependency and customizable
 option
Date: Thu, 13 Jan 2022 20:22:13 +0300
Message-Id: <20220113172219.66372-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 alex.bennee@linaro.org, jasowang@redhat.com, phillip.ennen@gmail.com,
 armbru@redhat.com, dirty@apple.com, f4bug@amsat.org, roman@roolebo.dev,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 qemu_oss@crudebyte.com, eblake@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vmnet.framework dependency is added with 'vmnet' option
to enable or disable it. Default value is 'auto'.

vmnet features to be used are available since macOS 11.0,
corresponding probe is created into meson.build.

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 meson.build                   | 16 +++++++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index c1b1db1e28..285fb7bc41 100644
--- a/meson.build
+++ b/meson.build
@@ -496,6 +496,18 @@ if cocoa.found() and get_option('gtk').enabled()
   error('Cocoa and GTK+ cannot be enabled at the same time')
 endif
 
+vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
+if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
+                                              'VMNET_BRIDGED_MODE',
+                                              dependencies: vmnet)
+  vmnet = not_found
+  if get_option('vmnet').enabled()
+    error('vmnet.framework API is outdated')
+  else
+    warning('vmnet.framework API is outdated, disabling')
+  endif
+endif
+
 seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
@@ -1492,6 +1504,7 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
+config_host_data.set('CONFIG_VMNET', vmnet.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
@@ -3406,7 +3419,8 @@ summary(summary_info, bool_yn: true, section: 'Crypto')
 # Libraries
 summary_info = {}
 if targetos == 'darwin'
-  summary_info += {'Cocoa support':   cocoa}
+  summary_info += {'Cocoa support':           cocoa}
+  summary_info += {'vmnet.framework support': vmnet}
 endif
 summary_info += {'SDL support':       sdl}
 summary_info += {'SDL image support': sdl_image}
diff --git a/meson_options.txt b/meson_options.txt
index 921967eddb..701e1381f9 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -151,6 +151,8 @@ option('netmap', type : 'feature', value : 'auto',
        description: 'netmap network backend support')
 option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
+option('vmnet', type : 'feature', value : 'auto',
+       description: 'vmnet.framework network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
 option('vnc', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 50bd7bed4d..cdcece4b05 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -84,6 +84,7 @@ meson_options_help() {
   printf "%s\n" '  u2f             U2F emulation support'
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
+  printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
   printf "%s\n" '  virglrenderer   virgl rendering support'
@@ -248,6 +249,8 @@ _meson_option_parse() {
     --disable-usb-redir) printf "%s" -Dusb_redir=disabled ;;
     --enable-vde) printf "%s" -Dvde=enabled ;;
     --disable-vde) printf "%s" -Dvde=disabled ;;
+    --enable-vmnet) printf "%s" -Dvmnet=enabled ;;
+    --disable-vmnet) printf "%s" -Dvmnet=disabled ;;
     --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
     --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
     --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
-- 
2.23.0


