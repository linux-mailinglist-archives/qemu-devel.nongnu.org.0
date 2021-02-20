Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D84320560
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 13:42:07 +0100 (CET)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDRaI-00041H-6m
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 07:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRU5-0006rN-8A; Sat, 20 Feb 2021 07:35:41 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:34689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRU1-0003DJ-RD; Sat, 20 Feb 2021 07:35:41 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M1qfu-1lFePK2qgS-002JL9; Sat, 20 Feb 2021 13:35:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] hw/block/fdc: Remove the check_media_rate property
Date: Sat, 20 Feb 2021 13:35:15 +0100
Message-Id: <20210220123525.1353731-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RWM60CcJi6YEFQXOYDRGjgef2sLIRKP7JinhJNJpikJ2XJOua18
 Kbw2wyQvKAAJDW40H5KuMNRGH6ZqGxF4NpthpnuAHjK5NXGYExtooOc7ZDSiu7DDOKUKP9o
 Fp8xO+DuxOcP7F20eRAPdnklrUciRv/C64/Kin4MCETJpquiMmE7GaHO96imMm0LiUzKU9b
 dJM8IqQpM25Joaz6AHfQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IhhxjFCJgSc=:0OMtphWgIZsHBc7b4bE0Zl
 bD9TGVseg/7jAKyb6EzGiYx+4qPYBBGfC26yIUia7jRiV9uYp3oZZd1H8kfcPToYItT+tIQe9
 FHFek6tRo6rjyVVCn6dacIRPBPx3fvoQV78ArOSmE/i/nTtpBOPT1gvinuMlH1pJH17nXj2CC
 oECP87odMkVjnXyyQV+y/Ho9TK+kvnzpEjM/G1EF9WBM2EcZeZSz2RRoNo7JC5dO32Mw8UoNo
 22I0ny6DEXx3WZz7iOZePEcU8e50karJAaNxiNi1PhZAoQzxrJk2WRaGna08g0cB+jMgGs4Sd
 YZogzAzWAWH4DUKnAGdrGirwDWtwTiQHwOt1+CnLR6D8fT9xsHmWsqzskNqBeVlcgWoWU4k1r
 epngWGCSS3Xn8/MJTst6OTqNTJQ9kMWlJPl7rt3ok06Tj14JzlJkfcogBI2LQywSg5qXM5UV1
 tgbSvdC0cA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

This was only required for the pc-1.0 and earlier machine types.
Now that these have been removed, we can also drop the corresponding
code from the FDC device.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
Message-Id: <20210203171832.483176-3-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/block/fdc.c             | 17 ++---------------
 tests/qemu-iotests/172.out | 35 -----------------------------------
 2 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 292ea878052a..198940e73799 100644
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
index 2cd4a8fd83ca..349ae51d6ce2 100644
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
2.29.2


