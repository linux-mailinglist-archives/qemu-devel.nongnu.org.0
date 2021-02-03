Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27630E11B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:32:00 +0100 (CET)
Received: from localhost ([::1]:55158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7M0U-0004sD-HX
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7LoW-000410-Uq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7LoP-0003pB-A7
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612372767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYklCZBhA7V8LFsFYA0gNo4ysA72N5WDoOxZLU9rWOs=;
 b=H/B1H421Y1uB2ilrxm882uXUd+3K38JHsMcDg6P+sbunQLutRYNVlsmP3mr+XmOS7qOUKg
 MyL42/v9FNr0W8AFaCBaL/UWV/Ptewg1Wqi7R4sHTb5gwnHlVuxXk7tewwm1JVjWWH1hpk
 Grq1KMV0XfEYVHRr3uGfLQrMuUUJiUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-inMR2hwEM4i_a3rvKwWibw-1; Wed, 03 Feb 2021 12:19:25 -0500
X-MC-Unique: inMR2hwEM4i_a3rvKwWibw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3BA0107ACC7;
 Wed,  3 Feb 2021 17:19:24 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 514C15886C;
 Wed,  3 Feb 2021 17:19:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/4] hw/block/fdc: Remove the check_media_rate property
Date: Wed,  3 Feb 2021 18:18:30 +0100
Message-Id: <20210203171832.483176-3-thuth@redhat.com>
In-Reply-To: <20210203171832.483176-1-thuth@redhat.com>
References: <20210203171832.483176-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, libvir-list@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was only required for the pc-1.0 and earlier machine types.
Now that these have been removed, we can also drop the corresponding
code from the FDC device.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/block/fdc.c             | 17 ++---------------
 tests/qemu-iotests/172.out | 35 -----------------------------------
 2 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 292ea87805..198940e737 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -874,7 +874,6 @@ struct FDCtrl {
         FloppyDriveType type;
     } qdev_for_drives[MAX_FD];
     int reset_sensei;
-    uint32_t check_media_rate;
     FloppyDriveType fallback; /* type=auto failure fallback */
     /* Timers state */
     uint8_t timer0;
@@ -1021,18 +1020,10 @@ static const VMStateDescription vmstate_fdrive_media_changed = {
     }
 };
 
-static bool fdrive_media_rate_needed(void *opaque)
-{
-    FDrive *drive = opaque;
-
-    return drive->fdctrl->check_media_rate;
-}
-
 static const VMStateDescription vmstate_fdrive_media_rate = {
     .name = "fdrive/media_rate",
     .version_id = 1,
     .minimum_version_id = 1,
-    .needed = fdrive_media_rate_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(media_rate, FDrive),
         VMSTATE_END_OF_LIST()
@@ -1689,8 +1680,7 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
 
     /* Check the data rate. If the programmed data rate does not match
      * the currently inserted medium, the operation has to fail. */
-    if (fdctrl->check_media_rate &&
-        (fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
+    if ((fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
         FLOPPY_DPRINTF("data rate mismatch (fdc=%d, media=%d)\n",
                        fdctrl->dsr & FD_DSR_DRATEMASK, cur_drv->media_rate);
         fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
@@ -2489,8 +2479,7 @@ static void fdctrl_result_timer(void *opaque)
         cur_drv->sect = (cur_drv->sect % cur_drv->last_sect) + 1;
     }
     /* READ_ID can't automatically succeed! */
-    if (fdctrl->check_media_rate &&
-        (fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
+    if ((fdctrl->dsr & FD_DSR_DRATEMASK) != cur_drv->media_rate) {
         FLOPPY_DPRINTF("read id rate mismatch (fdc=%d, media=%d)\n",
                        fdctrl->dsr & FD_DSR_DRATEMASK, cur_drv->media_rate);
         fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
@@ -2895,8 +2884,6 @@ static Property isa_fdc_properties[] = {
     DEFINE_PROP_UINT32("dma", FDCtrlISABus, dma, 2),
     DEFINE_PROP_DRIVE("driveA", FDCtrlISABus, state.qdev_for_drives[0].blk),
     DEFINE_PROP_DRIVE("driveB", FDCtrlISABus, state.qdev_for_drives[1].blk),
-    DEFINE_PROP_BIT("check_media_rate", FDCtrlISABus, state.check_media_rate,
-                    0, true),
     DEFINE_PROP_SIGNED("fdtypeA", FDCtrlISABus, state.qdev_for_drives[0].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index 2cd4a8fd83..349ae51d6c 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -14,7 +14,6 @@ Testing:
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -44,7 +43,6 @@ Testing: -fda TEST_DIR/t.qcow2
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -84,7 +82,6 @@ Testing: -fdb TEST_DIR/t.qcow2
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -139,7 +136,6 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -195,7 +191,6 @@ Testing: -fdb
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -236,7 +231,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -276,7 +270,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -331,7 +324,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -392,7 +384,6 @@ Use -device floppy,unit=0,drive=... instead.
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -434,7 +425,6 @@ Use -device floppy,unit=1,drive=... instead.
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -478,7 +468,6 @@ Use -device floppy,unit=1,drive=... instead.
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -537,7 +526,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -577,7 +565,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -617,7 +604,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -678,7 +664,6 @@ Use -device floppy,unit=1,drive=... instead.
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -736,7 +721,6 @@ Use -device floppy,unit=0,drive=... instead.
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -808,7 +792,6 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -864,7 +847,6 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -920,7 +902,6 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -976,7 +957,6 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1041,7 +1021,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1097,7 +1076,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1161,7 +1139,6 @@ Use -device floppy,unit=0,drive=... instead.
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1219,7 +1196,6 @@ Use -device floppy,unit=0,drive=... instead.
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1277,7 +1253,6 @@ Use -device floppy,unit=1,drive=... instead.
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1335,7 +1310,6 @@ Use -device floppy,unit=1,drive=... instead.
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1391,7 +1365,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global floppy.drive=none0 -device
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1473,7 +1446,6 @@ Testing: -device floppy
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1500,7 +1472,6 @@ Testing: -device floppy,drive-type=120
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1527,7 +1498,6 @@ Testing: -device floppy,drive-type=144
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1554,7 +1524,6 @@ Testing: -device floppy,drive-type=288
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1584,7 +1553,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1624,7 +1592,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1667,7 +1634,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1707,7 +1673,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
             dma = 2 (0x2)
             driveA = ""
             driveB = ""
-            check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-- 
2.27.0


