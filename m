Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B42B5BA5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:20:33 +0100 (CET)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexA8-0003Yd-7g
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8p-0001y1-W0
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex8n-0006OY-Sr
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605604748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RnLT5+JMl+oOfkBbmmWTI1h88S6MNDyRCGrZS7inZw=;
 b=bS0PzNGzEtlLAxFM7TwToXP8Ls/SGPPuHbOunliNvFO4rZVltjiTzgL8A76McQoQa7GSgr
 JmdAJ48xacJLHIF9PgJPiDGu7n3tQ543HNQkgxaJPXTYHiZhja+FIrZ/YOCwUakipRn6bj
 Q8QfYOEi0lwYELWmBf7sKANwKqE7eWA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-2mrFOCMEOXWsd4wPBdKnjQ-1; Tue, 17 Nov 2020 04:19:06 -0500
X-MC-Unique: 2mrFOCMEOXWsd4wPBdKnjQ-1
Received: by mail-wr1-f70.google.com with SMTP id v5so12696742wrr.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 01:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0RnLT5+JMl+oOfkBbmmWTI1h88S6MNDyRCGrZS7inZw=;
 b=nlv9thMaHG8APCHHJ+3uQMLE2OlIqtXyoZuDBlxpAAxiswFd8888YpvoYEOx9KjllU
 bgoc6gJjd3lK8Hgzhyv5uuBNz+dkEiU9UZFpkLMQscqlCX/mWmClxQaAo++j+5J/5DaW
 UwfjZfbcRpJDTbBMOb+jpoPpLQ2IPcWrdACGQXpp7iaWg6UC+VK+e6arcwrohG8gkQRj
 1cXS4WAyBC+/2AvPMNBU2Up6h0NJfGozD81IeZ4eBkm6hG9fKJxqIO13pn9QgItNFHNe
 LWJV7FwwtkoSaHSQTaM40KsMJ1OoLHyZalQBjNuWB1HSf+PwHi+bmqRw3ZcROeOgEZ/h
 g1rA==
X-Gm-Message-State: AOAM530mIc+oab+jQrJU9ddZ2UktH/0SYSU0vIJnA5lnoia2D5GBPnX9
 nm/M8TwWOfDc8WK5P5R05mXNqJqlEUNZdqSXxcmu0ngzh6DbiTKvxA3ncJnqUzU0r9JwSqtIj1w
 PmXEKeJCjnoCWXyZ5/5cSK041JFim4f1NBSEfmL5V2cwS/XZUvrlUt5UJSH0Z
X-Received: by 2002:a1c:9949:: with SMTP id b70mr3286166wme.85.1605604745228; 
 Tue, 17 Nov 2020 01:19:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwx7DteglsDPtOoPBRfIn1LlenLWX9itX2ZK2hwmvEKaHrNQfFRfgZ6wkzcXJH9PDESd6gD4w==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr3286145wme.85.1605604744976; 
 Tue, 17 Nov 2020 01:19:04 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id s25sm2570302wmh.16.2020.11.17.01.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 01:19:04 -0800 (PST)
Date: Tue, 17 Nov 2020 04:19:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 2/7] meson: move vhost_user_blk_server to meson.build
Message-ID: <20201117091848.695370-3-mst@redhat.com>
References: <20201117091848.695370-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201117091848.695370-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The --enable/disable-vhost-user-blk-server options were implemented in
./configure. There has been confusion about them and part of the problem
is that the shell syntax used for setting the default value is not easy
to read. Move the option over to meson where the conditions are easier
to understand:

  have_vhost_user_blk_server = (targetos == 'linux')

  if get_option('vhost_user_blk_server').enabled()
      if targetos != 'linux'
          error('vhost_user_blk_server requires linux')
      endif
  elif get_option('vhost_user_blk_server').disabled() or not have_system
      have_vhost_user_blk_server = false
  endif

This patch does not change behavior.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201110171121.1265142-2-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson_options.txt        |  2 ++
 configure                | 16 ++++------------
 block/export/meson.build |  5 ++++-
 meson.build              | 12 ++++++++++++
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index b4f1801875..f6f64785fe 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -64,6 +64,8 @@ option('xkbcommon', type : 'feature', value : 'auto',
        description: 'xkbcommon support')
 option('virtiofsd', type: 'feature', value: 'auto',
        description: 'build virtiofs daemon (virtiofsd)')
+option('vhost_user_blk_server', type: 'feature', value: 'auto',
+       description: 'build vhost-user-blk server')
 
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
diff --git a/configure b/configure
index 4cef321d9d..516f28a088 100755
--- a/configure
+++ b/configure
@@ -329,7 +329,7 @@ vhost_crypto=""
 vhost_scsi=""
 vhost_vsock=""
 vhost_user=""
-vhost_user_blk_server=""
+vhost_user_blk_server="auto"
 vhost_user_fs=""
 kvm="auto"
 hax="auto"
@@ -1247,9 +1247,9 @@ for opt do
   ;;
   --enable-vhost-vsock) vhost_vsock="yes"
   ;;
-  --disable-vhost-user-blk-server) vhost_user_blk_server="no"
+  --disable-vhost-user-blk-server) vhost_user_blk_server="disabled"
   ;;
-  --enable-vhost-user-blk-server) vhost_user_blk_server="yes"
+  --enable-vhost-user-blk-server) vhost_user_blk_server="enabled"
   ;;
   --disable-vhost-user-fs) vhost_user_fs="no"
   ;;
@@ -2390,12 +2390,6 @@ if test "$vhost_net" = ""; then
   test "$vhost_kernel" = "yes" && vhost_net=yes
 fi
 
-# libvhost-user is Linux-only
-test "$vhost_user_blk_server" = "" && vhost_user_blk_server=$linux
-if test "$vhost_user_blk_server" = "yes" && test "$linux" = "no"; then
-  error_exit "--enable-vhost-user-blk-server is only available on Linux"
-fi
-
 ##########################################
 # pkg-config probe
 
@@ -6289,9 +6283,6 @@ fi
 if test "$vhost_vdpa" = "yes" ; then
   echo "CONFIG_VHOST_VDPA=y" >> $config_host_mak
 fi
-if test "$vhost_user_blk_server" = "yes" ; then
-  echo "CONFIG_VHOST_USER_BLK_SERVER=y" >> $config_host_mak
-fi
 if test "$vhost_user_fs" = "yes" ; then
   echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
 fi
@@ -7012,6 +7003,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
+        -Dvhost_user_blk_server=$vhost_user_blk_server \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/block/export/meson.build b/block/export/meson.build
index 19526435d8..135b356775 100644
--- a/block/export/meson.build
+++ b/block/export/meson.build
@@ -1,2 +1,5 @@
 blockdev_ss.add(files('export.c'))
-blockdev_ss.add(when: 'CONFIG_VHOST_USER_BLK_SERVER', if_true: files('vhost-user-blk-server.c'))
+
+if have_vhost_user_blk_server
+    blockdev_ss.add(files('vhost-user-blk-server.c'))
+endif
diff --git a/meson.build b/meson.build
index b473620321..4b789f18c1 100644
--- a/meson.build
+++ b/meson.build
@@ -751,6 +751,16 @@ statx_test = '''
 
 has_statx = cc.links(statx_test)
 
+have_vhost_user_blk_server = (targetos == 'linux')
+
+if get_option('vhost_user_blk_server').enabled()
+    if targetos != 'linux'
+        error('vhost_user_blk_server requires linux')
+    endif
+elif get_option('vhost_user_blk_server').disabled() or not have_system
+    have_vhost_user_blk_server = false
+endif
+
 #################
 # config-host.h #
 #################
@@ -775,6 +785,7 @@ config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
 config_host_data.set('CONFIG_CURSES', curses.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
+config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
 config_host_data.set('CONFIG_VNC_PNG', png.found())
@@ -2103,6 +2114,7 @@ summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPT
 summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
 summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_KERNEL')}
+summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
 summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
 summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
-- 
MST


