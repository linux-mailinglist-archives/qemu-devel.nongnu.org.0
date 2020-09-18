Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6E526FA00
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 12:12:08 +0200 (CEST)
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJDN9-0005DY-E4
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 06:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kJDJ9-00037M-Uv
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 06:07:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49112
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kJDJ3-0001c5-6e
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 06:07:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600423671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ShmJGE9dLYYIU+hbjnPcxg43Sl/HJxmj5E5dmxaVeC0=;
 b=byHotec6h6iRd0a5Dm/ca+3XmqJRbAAfYqDno/lWlvLf9mIJZrP57YJ2Cx3Xub7aPXQ1lv
 wyOiRDGJc7/O1Tg5QiPfHFbH6mddDrxtDH2Ggsk6PH61w/cgQoLXbFB3/HBr2kp2+n8fpN
 p3XQ5Cgy2qpCvFBHwGW+39H3DNfwFSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-FFwYOv68Os2nCbZEJpRUGg-1; Fri, 18 Sep 2020 06:07:48 -0400
X-MC-Unique: FFwYOv68Os2nCbZEJpRUGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EC4C61266
 for <qemu-devel@nongnu.org>; Fri, 18 Sep 2020 10:07:47 +0000 (UTC)
Received: from localhost (unknown [10.36.110.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA7DA73676;
 Fri, 18 Sep 2020 10:07:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] spice: remove obsolete callback
Date: Fri, 18 Sep 2020 14:07:37 +0400
Message-Id: <20200918100737.91646-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 05:23:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com, fziglio@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The "attach_worker" callbacks aren't doing anything in QEMU, but they
were mandatory until Spice server commit
6aa1a17c69dc3cc02f338a78b3266e4c00ea1c1a ("spice-qxl: Remove QXLWorker
definition").

Furthermore, the old spelling is deprecated since commit
974692bda1e77af92b71ed43b022439448492cb9 ("spice-qxl: Fix typo in
callback name and remove obsolete parameter")

Compile that code out if Spice server version is recent enough.

Fix compiler deprecation warnings with Spice > 0.14.3 (not released
yet). We may want to wait until newer version is actually released to
apply the patch.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/qxl.c   | 4 ++++
 ui/spice-display.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 11871340e7..a02072dee0 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -518,12 +518,14 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct QXLCommandExt *ext)
 
 /* spice display interface callbacks */
 
+#if SPICE_SERVER_VERSION < 0x000e04 /* release 0.14.4 */
 static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
 {
     PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
 
     trace_qxl_interface_attach_worker(qxl->id);
 }
+#endif
 
 static void interface_set_compression_level(QXLInstance *sin, int level)
 {
@@ -1156,7 +1158,9 @@ static const QXLInterface qxl_interface = {
     .base.major_version      = SPICE_INTERFACE_QXL_MAJOR,
     .base.minor_version      = SPICE_INTERFACE_QXL_MINOR,
 
+#if SPICE_SERVER_VERSION < 0x000e04 /* release 0.14.4 */
     .attache_worker          = interface_attach_worker,
+#endif
     .set_compression_level   = interface_set_compression_level,
 #if SPICE_NEEDS_SET_MM_TIME
     .set_mm_time             = interface_set_mm_time,
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 19632fdf6c..811936ff7f 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -500,10 +500,12 @@ void qemu_spice_display_refresh(SimpleSpiceDisplay *ssd)
 
 /* spice display interface callbacks */
 
+#if SPICE_SERVER_VERSION < 0x000e04 /* release 0.14.4 */
 static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
 {
     /* nothing to do */
 }
+#endif
 
 static void interface_set_compression_level(QXLInstance *sin, int level)
 {
@@ -709,7 +711,9 @@ static const QXLInterface dpy_interface = {
     .base.major_version      = SPICE_INTERFACE_QXL_MAJOR,
     .base.minor_version      = SPICE_INTERFACE_QXL_MINOR,
 
+#if SPICE_SERVER_VERSION < 0x000e04 /* release 0.14.4 */
     .attache_worker          = interface_attach_worker,
+#endif
     .set_compression_level   = interface_set_compression_level,
 #if SPICE_NEEDS_SET_MM_TIME
     .set_mm_time             = interface_set_mm_time,
-- 
2.26.2


