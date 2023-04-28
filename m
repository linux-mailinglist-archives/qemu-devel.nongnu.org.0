Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78F96F19B2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:34:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOFN-000746-L7; Fri, 28 Apr 2023 09:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cstLZAcKCmEODENKDXFNNFKD.BNLPDLT-CDUDKMNMFMT.NQF@flex--pefoley.bounces.google.com>)
 id 1psOFK-00073p-F2
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 09:34:46 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cstLZAcKCmEODENKDXFNNFKD.BNLPDLT-CDUDKMNMFMT.NQF@flex--pefoley.bounces.google.com>)
 id 1psOFI-0003q6-HH
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 09:34:46 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-b9a7d92d0f7so3252139276.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682688883; x=1685280883;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=FyM4MQENczJBd0OSV3w2QAH5w1ffjH5EtyY9BzWXRJ8=;
 b=sQc6i49h7sJona57Vq+TP0Imykh9lbcMOD6tVarXyC/mllSbNE0n8czhHJvBRRoN6H
 7zYJEWvBLiIYduq/+HDmJ7vejOJV4Tc7HM/HYxxA1u3xsch4It9Jzz2mAj1LLYohkiFZ
 tSXUhFgFnIS+opMBNrBoiaPJXUxcQS/FKQnwhzUce+oLHD5hJtCLvkgOFEaQt4ouUxD0
 mEpLe+nobTdsmGEeePRCN1u4syU3lFpznSRT2hZVZU5upCdzrPx0UpVrx0QrzisjR8Oj
 ngTy7Ef4YmKoczFMlwRw9tguzq98r2tXT99gQrds2/j7PXRiom9C2rjoS3xEMoxBmNzP
 Srcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688883; x=1685280883;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FyM4MQENczJBd0OSV3w2QAH5w1ffjH5EtyY9BzWXRJ8=;
 b=QEX49GNLfUNFBuChjPq+byG6hKnLD5Qbzrv+kHNvRY6uQWVkHDZLqAXVn7gQ3GjpQ8
 7UXBlT6jw5PVLe902rnjbaP7lM7UHWhAMwv3R3BDzxY0BDq6VEptEKc4xMTInrhiD5/k
 WvAmYM4cciwNoa30VHxuxj7t7e2iKeCurgxyLpWEDi/BksqYkFx59J6roM+e9yVkRuMt
 gwm+O4344L3au9qxSlsxF+An4rUy8Sb8TWW7vl7nwK9v63QULVQBUZ1mFM+A6qZYR5ud
 HNIm0vYxvHkJEYKeYbvUgPo/WclUB5MtIn/2LZngOFx8JAvVbretpeHVnvlflu6XLS4C
 X5lw==
X-Gm-Message-State: AC+VfDy73QWDGoavr3SbzSU5tmHGIJ5Xk1/U270PRqe8eYpIh9fVYI/L
 PS1a3ydC+3EFVnZiXuI7wShZPX57U+BI
X-Google-Smtp-Source: ACHHUZ63Q0qEtn2pNnXqQdZAmxw1aAmDO0MfIluZpcMLFzR8UALbfN3ZQq+BMrnfiq3Kb0tePU8oDxMTvMvz
X-Received: from pefoley.res.corp.google.com
 ([2620:15c:4d:200:18c8:6551:2687:ed69])
 (user=pefoley job=sendgmr) by 2002:a25:4045:0:b0:b33:531b:3dd4 with SMTP id
 n66-20020a254045000000b00b33531b3dd4mr1899536yba.1.1682688882929; Fri, 28 Apr
 2023 06:34:42 -0700 (PDT)
Date: Fri, 28 Apr 2023 09:34:31 -0400
In-Reply-To: <6278798.ENyYtN1ivr@silver>
Mime-Version: 1.0
References: <6278798.ENyYtN1ivr@silver>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230428133431.523924-1-pefoley@google.com>
Subject: [PATCH v2] Don't require libcap-ng for virtfs support
From: Peter Foley <pefoley@google.com>
To: qemu_oss@crudebyte.com, qemu-devel@nongnu.org
Cc: venture@google.com, Peter Foley <pefoley@google.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 "=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=" <marcandre.lureau@redhat.com>, 
 "=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3cstLZAcKCmEODENKDXFNNFKD.BNLPDLT-CDUDKMNMFMT.NQF@flex--pefoley.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
 meson.build                   | 11 ++++++++---
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  4 ++++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index c44d05a13f..2f9c671119 100644
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
2.40.1.495.gc816e09b53d-goog


