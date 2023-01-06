Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C6765FD26
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDi6X-0002eC-TT; Fri, 06 Jan 2023 03:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi6Q-0002ce-Pr
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi6M-0005Xe-TX
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672993762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ah0xNb6XBNsTuNA7BAcqy4DPeJMVq26yuw5U7Zys/Q8=;
 b=iCP5goMr9MtMT1GET6m9qSM9+SFn6h0SoP/xeN20P6z4cSAi+CZcd6VocCUjuJIC6z7WtF
 DXLnJhsjjLDOj+lsVtJ0JbqNpJuVqEv77scKKDggwWAMeG3swgGh7dNfei7q+1jUGdFrRD
 jbrh1sWcNFfxjWUcPet00qGbvekuaBA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-s3cFLAyTMKinpXhD3a-SzA-1; Fri, 06 Jan 2023 03:29:14 -0500
X-MC-Unique: s3cFLAyTMKinpXhD3a-SzA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D75FB3C0219E;
 Fri,  6 Jan 2023 08:29:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA83D492B06;
 Fri,  6 Jan 2023 08:29:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL 12/15] Update scripts/meson-buildoptions.sh
Date: Fri,  6 Jan 2023 09:28:50 +0100
Message-Id: <20230106082853.31787-13-thuth@redhat.com>
In-Reply-To: <20230106082853.31787-1-thuth@redhat.com>
References: <20230106082853.31787-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alessandro Di Federico <ale@rev.ng>

Note: `Makefile` relies on modification dates in the source tree to
detect changes to `meson_options.txt`. However, git does not track
those. Therefore, the following was necessary to regenerate
`meson-buildoptions.sh`:

    touch meson_options.txt
    cd "$BUILD_DIR"
    make update-buildoptions

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Message-Id: <20230102104113.3438895-1-ale@rev.ng>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/meson-buildoptions.sh | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index aa6e30ea91..0f71e92dcb 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -10,6 +10,9 @@ meson_options_help() {
   printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
   printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
+  printf "%s\n" '  --disable-hexagon-idef-parser'
+  printf "%s\n" '                           use idef-parser to automatically generate TCG'
+  printf "%s\n" '                           code for the Hexagon frontend'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
   printf "%s\n" '                           (can be empty) [share/doc]'
@@ -40,7 +43,8 @@ meson_options_help() {
   printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
-  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-firmware]'
+  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-'
+  printf "%s\n" '                           firmware]'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
@@ -93,7 +97,7 @@ meson_options_help() {
   printf "%s\n" '  glusterfs       Glusterfs block device driver'
   printf "%s\n" '  gnutls          GNUTLS cryptography support'
   printf "%s\n" '  gtk             GTK+ user interface'
-  printf "%s\n" '  gtk-clipboard   clipboard support for GTK (EXPERIMENTAL, MAY HANG)'
+  printf "%s\n" '  gtk-clipboard   clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)'
   printf "%s\n" '  guest-agent     Build QEMU Guest Agent'
   printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest Agent'
   printf "%s\n" '  hax             HAX acceleration support'
@@ -156,6 +160,8 @@ meson_options_help() {
   printf "%s\n" '  usb-redir       libusbredir support'
   printf "%s\n" '  vde             vde network backend support'
   printf "%s\n" '  vdi             vdi image format support'
+  printf "%s\n" '  vduse-blk-export'
+  printf "%s\n" '                  VDUSE block export support'
   printf "%s\n" '  vfio-user-server'
   printf "%s\n" '                  vfio-user server support'
   printf "%s\n" '  vhost-crypto    vhost-user crypto backend support'
@@ -164,8 +170,6 @@ meson_options_help() {
   printf "%s\n" '  vhost-user      vhost-user backend support'
   printf "%s\n" '  vhost-user-blk-server'
   printf "%s\n" '                  build vhost-user-blk server'
-  printf "%s\n" '  vduse-blk-export'
-  printf "%s\n" '                  VDUSE block export support'
   printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
   printf "%s\n" '  virglrenderer   virgl rendering support'
   printf "%s\n" '  virtfs          virtio-9p support'
@@ -283,6 +287,8 @@ _meson_option_parse() {
     --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=disabled ;;
     --enable-hax) printf "%s" -Dhax=enabled ;;
     --disable-hax) printf "%s" -Dhax=disabled ;;
+    --enable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=true ;;
+    --disable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=false ;;
     --enable-hvf) printf "%s" -Dhvf=enabled ;;
     --disable-hvf) printf "%s" -Dhvf=disabled ;;
     --iasl=*) quote_sh "-Diasl=$2" ;;
@@ -429,6 +435,8 @@ _meson_option_parse() {
     --disable-vde) printf "%s" -Dvde=disabled ;;
     --enable-vdi) printf "%s" -Dvdi=enabled ;;
     --disable-vdi) printf "%s" -Dvdi=disabled ;;
+    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=enabled ;;
+    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
     --enable-vfio-user-server) printf "%s" -Dvfio_user_server=enabled ;;
     --disable-vfio-user-server) printf "%s" -Dvfio_user_server=disabled ;;
     --enable-vhost-crypto) printf "%s" -Dvhost_crypto=enabled ;;
@@ -441,8 +449,6 @@ _meson_option_parse() {
     --disable-vhost-user) printf "%s" -Dvhost_user=disabled ;;
     --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
     --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
-    --enable-vduse-blk-export) printf "%s" -Dvduse_blk_export=enabled ;;
-    --disable-vduse-blk-export) printf "%s" -Dvduse_blk_export=disabled ;;
     --enable-vhost-vdpa) printf "%s" -Dvhost_vdpa=enabled ;;
     --disable-vhost-vdpa) printf "%s" -Dvhost_vdpa=disabled ;;
     --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
-- 
2.31.1


