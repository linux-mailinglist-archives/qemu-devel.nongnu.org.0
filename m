Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FA6F5892
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:08:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCDO-0006Bk-Aj; Wed, 03 May 2023 09:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3tVxSZAcKCuARGHQNGaIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--pefoley.bounces.google.com>)
 id 1puCDL-0006BL-Px
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:08:11 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3tVxSZAcKCuARGHQNGaIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--pefoley.bounces.google.com>)
 id 1puCDI-0003E3-UK
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:08:11 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-b9a6eeea78cso4151052276.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683119287; x=1685711287;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fz/3gQx00TK02gTN/E33JK+KOh0DuYLLcbPt7JE5lyY=;
 b=bAMX3HAp52TYuL6jH0oJNEOf9/QcwfL1+ym1LHKSASaUyozEj9FMfhmh7JCYVOFaXR
 kW9m8y7bTiwHokiI4gyModAqkQZfd5q6FF+gGlG2FM1T6UykJAQyR/7KSyw+IiMLp/OI
 7IjD57Kbhz1s5mEqyYHrquDKOWh0KwlpJ1FRTX5KjMuBTXH5NtyaPKL7UJcCpt5PNDw+
 h9XWFaFIYfr9Eu6BLRgQZxLhvnVS9uYSYrAG/oltI4HcGsoSDIUXHA8zlGXkCQKzQc0O
 DTzXY5t/HSTRcYC/HDj/N70lIMDW3XiMwPbj+qsnA/cQVHFXgeGk5RIfzS9FVYWE9Vl3
 HQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683119287; x=1685711287;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fz/3gQx00TK02gTN/E33JK+KOh0DuYLLcbPt7JE5lyY=;
 b=JBvvFWHY8FsPsKr9w9dlnBh3sOe7cUsOB0tH4KqL5n2egmVAS74imn2NqS2LMydS0y
 nOvc/10ix8+ZFAnySrGydBgwYc9uD9Wz4Q1WN2hndo6MJJ5nr5ebwj8NjhuaBe0JVeih
 DtOUiWktWDaIHUZNByAUe5TH5ULXw3+aQce2O1dMT1u228iCS06av9IrjxEFUh9m6MQT
 UJ3ZiE/o2iAsfvaI5/tsMkAbLrnrQHzjWNusJryGUYYuU/P9llo4taANG7ZzEp+M3fQv
 d5hj1PU34KUf+xm01b8h85UlRTzDep0dilk3S/Sox5PoZeeY4cunO1TT8CJd51O8s+X2
 tq7A==
X-Gm-Message-State: AC+VfDx/5pnUhAm+yetmc3gRGK5BjrSpOb8tbYSTgZzX6vVssHm0cGaf
 gz8YKHbLCtTcI+sWxb2m7EVh7QmPhXSa
X-Google-Smtp-Source: ACHHUZ5VdpXY1u8KAW+mGI7Xxvn6uhGsuXPTcXRJ4hhpVWu4GC9S0Zr/gRciwr1GNo3KPQMYhHcYTNAoR+lL
X-Received: from pefoley.res.corp.google.com
 ([2620:15c:4d:200:a5fd:d553:d964:f74f])
 (user=pefoley job=sendgmr) by 2002:a05:690c:3709:b0:55a:5e16:af7e with SMTP
 id fv9-20020a05690c370900b0055a5e16af7emr1402758ywb.2.1683119285556; Wed, 03
 May 2023 06:08:05 -0700 (PDT)
Date: Wed,  3 May 2023 09:07:56 -0400
In-Reply-To: <5706940.3l9IZQ4Y0r@silver>
Mime-Version: 1.0
References: <5706940.3l9IZQ4Y0r@silver>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230503130757.863824-1-pefoley@google.com>
Subject: [PATCH v3] Don't require libcap-ng for virtfs support
From: Peter Foley <pefoley@google.com>
To: qemu_oss@crudebyte.com, qemu-devel@nongnu.org
Cc: venture@google.com, Peter Foley <pefoley@google.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 "=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=" <marcandre.lureau@redhat.com>, 
 "=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3tVxSZAcKCuARGHQNGaIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--pefoley.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It's only required for the proxy helper.

Add a new option for the proxy helper rather than enabling it
implicitly.

Change-Id: I95b73fca625529e99d16b0a64e01c65c0c1d43f2
Signed-off-by: Peter Foley <pefoley@google.com>
---
 meson.build                   | 12 +++++++++---
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  4 ++++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 77d42898c8..a46bc67cdb 100644
--- a/meson.build
+++ b/meson.build
@@ -1759,12 +1759,17 @@ have_virtfs = get_option('virtfs') \
              error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
     .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
              error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
-    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
-             error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
+    .require(targetos == 'darwin' or libattr.found(),
+             error_message: 'virtio-9p (virtfs) on Linux requires libattr-devel') \
     .disable_auto_if(not have_tools and not have_system) \
     .allowed()
 
-have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
+have_virtfs_proxy_helper = get_option('virtfs_proxy_helper') \
+    .require(targetos != 'darwin', error_message: 'the virtfs proxy helper is incompatible with macOS') \
+    .require(have_virtfs, error_message: 'the virtfs proxy helper requires that virtfs is enabled') \
+    .disable_auto_if(not have_tools) \
+    .require(libcap_ng.found(), error_message: 'the virtfs proxy helper requires libcap-ng') \
+    .allowed()
 
 if get_option('block_drv_ro_whitelist') == ''
   config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
@@ -3911,6 +3916,7 @@ if have_block
   summary_info += {'Block whitelist (ro)': get_option('block_drv_ro_whitelist')}
   summary_info += {'Use block whitelist in tools': get_option('block_drv_whitelist_in_tools')}
   summary_info += {'VirtFS support':    have_virtfs}
+  summary_info += {'VirtFS Proxy Helper support': have_virtfs_proxy_helper}
   summary_info += {'Live block migration': config_host_data.get('CONFIG_LIVE_BLOCK_MIGRATION')}
   summary_info += {'replication support': config_host_data.get('CONFIG_REPLICATION')}
   summary_info += {'bochs support':     get_option('bochs').allowed()}
diff --git a/meson_options.txt b/meson_options.txt
index 2471dd02da..908b4b7fd9 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -272,6 +272,8 @@ option('vhost_user_blk_server', type: 'feature', value: 'auto',
        description: 'build vhost-user-blk server')
 option('virtfs', type: 'feature', value: 'auto',
        description: 'virtio-9p support')
+option('virtfs_proxy_helper', type: 'feature', value: 'auto',
+       description: 'virtio-9p proxy helper support')
 option('libvduse', type: 'feature', value: 'auto',
        description: 'build VDUSE Library')
 option('vduse_blk_export', type: 'feature', value: 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index d4369a3ad8..3bb9dd3504 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -176,6 +176,8 @@ meson_options_help() {
   printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
   printf "%s\n" '  virglrenderer   virgl rendering support'
   printf "%s\n" '  virtfs          virtio-9p support'
+  printf "%s\n" '  virtfs-proxy-helper'
+  printf "%s\n" '                  virtio-9p proxy helper support'
   printf "%s\n" '  vmnet           vmnet.framework network backend support'
   printf "%s\n" '  vnc             VNC server'
   printf "%s\n" '  vnc-jpeg        JPEG lossy compression for VNC server'
@@ -461,6 +463,8 @@ _meson_option_parse() {
     --disable-virglrenderer) printf "%s" -Dvirglrenderer=disabled ;;
     --enable-virtfs) printf "%s" -Dvirtfs=enabled ;;
     --disable-virtfs) printf "%s" -Dvirtfs=disabled ;;
+    --enable-virtfs-proxy-helper) printf "%s" -Dvirtfs_proxy_helper=enabled ;;
+    --disable-virtfs-proxy-helper) printf "%s" -Dvirtfs_proxy_helper=disabled ;;
     --enable-vmnet) printf "%s" -Dvmnet=enabled ;;
     --disable-vmnet) printf "%s" -Dvmnet=disabled ;;
     --enable-vnc) printf "%s" -Dvnc=enabled ;;
-- 
2.40.1.521.gf1e218fcd8-goog


