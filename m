Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB89403CB9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:44:16 +0200 (CEST)
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzkF-0005A0-57
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbv-0003ow-Bx
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:39 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbt-0003qz-Hz
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:39 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MMoXE-1mgcvD3ZO0-00Ik43; Wed, 08
 Sep 2021 17:35:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] mac_via: rename VIA2_IRQ_SLOT_BIT to VIA2_IRQ_NUBUS_BIT
Date: Wed,  8 Sep 2021 17:35:28 +0200
Message-Id: <20210908153529.453843-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908153529.453843-1-laurent@vivier.eu>
References: <20210908153529.453843-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6oIF4ueHNEy+Azacv7N1qci0XtWUe4FQoC+HyElAtVu3OOYw/eb
 OCt0jraseRsQ5mtl6U42QN4RgESHiLwHOwtiIlMtKoDrDq+WcwCjz6xd4jRKFSWhy7fyG0D
 wKizku4/cZqLEQxGjelkqiwqS9n2c2/hm0RfOgu7TKKRh6D+Ig7BOp0tphy4PSZ64Awc3SF
 oT+I8kI+0o4X8If7PdsKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tb65/c0u5bY=:gZJZ6l76QXttJClfc/wBmF
 DG3hx1RkxJAj4mL2FAZNSdNFN6nha43DSS8OSUlVx+FxndI42owKzXpszXkdGclyptPpdFhpl
 88mZT1sqrHM6CdvyAhh+H9393B+hEW00B2b45Emh3etiK57U8/v8IwzoMk7S+DqJjkVJ6Xg6w
 LVmAooyM9r8qqzs04EzcLuHb9FmF/pw0PrIaQvvo4qcDDMQGHRMAcJIqU8w78SalZD1CrKtHs
 qy60wXkwDegykT+UAY0Pe0WGqCEvnmjT5lzAbj2J9tDdo5+qX6YP6lGJqsG9vZ2yoWA9ATAzd
 qqOUV+m/nWLatSxN3FKJV4MsLJsa6PG+s5peaFf0WhgT1ad7lMhpuHGVXGRJqYKvwKSYpiWkX
 p4zbSjdkdzeN0MRLdXOL8faK1+FdAzfJJC3O4r8HejWsW+lZkVzl4bpvQ9pMgu272CI2srMzS
 OA79XkfzTR9wQTuGSpNI7ofd6xsrFjNCbp9qQLMzHqqgOeHC6I1JRAZOcZFiXeyZJBII5NifI
 QT/H+chu4gQvyBrcbH5uIAIaMSqhzkIszVRPboubqVCi2RDi145tMSee7Gf5gVvfOiRJMRL0N
 qu2V3P/A5jg+O42BTB/KXCvZjPdBmo/L6YQO7LCzZtXprH/rXCuwZhctgQpjzB685YZoOkL7y
 s/G7HHS31Dj2FOHcEdo47VJsx069pxTqYI8jc9v7qmdLq/OqxFYdoeqwDpQEXgKaKd/kfBaCK
 1cz11pRPHgirQrANAgEp+WmdHWQUjkJW+aIYNQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Also improve the alignment of the shifted constants.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210830102447.10806-12-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/misc/mac_via.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 9a8bca056ef3..5168e3ce665c 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -26,11 +26,11 @@
 
 #define VIA1_IRQ_NB             8
 
-#define VIA1_IRQ_ONE_SECOND (1 << VIA1_IRQ_ONE_SECOND_BIT)
-#define VIA1_IRQ_60HZ       (1 << VIA1_IRQ_60HZ_BIT)
-#define VIA1_IRQ_ADB_READY  (1 << VIA1_IRQ_ADB_READY_BIT)
-#define VIA1_IRQ_ADB_DATA   (1 << VIA1_IRQ_ADB_DATA_BIT)
-#define VIA1_IRQ_ADB_CLOCK  (1 << VIA1_IRQ_ADB_CLOCK_BIT)
+#define VIA1_IRQ_ONE_SECOND     (1 << VIA1_IRQ_ONE_SECOND_BIT)
+#define VIA1_IRQ_60HZ           (1 << VIA1_IRQ_60HZ_BIT)
+#define VIA1_IRQ_ADB_READY      (1 << VIA1_IRQ_ADB_READY_BIT)
+#define VIA1_IRQ_ADB_DATA       (1 << VIA1_IRQ_ADB_DATA_BIT)
+#define VIA1_IRQ_ADB_CLOCK      (1 << VIA1_IRQ_ADB_CLOCK_BIT)
 
 
 #define TYPE_MOS6522_Q800_VIA1 "mos6522-q800-via1"
@@ -80,18 +80,18 @@ struct MOS6522Q800VIA1State {
 
 /* VIA 2 */
 #define VIA2_IRQ_SCSI_DATA_BIT  0
-#define VIA2_IRQ_SLOT_BIT       1
+#define VIA2_IRQ_NUBUS_BIT      1
 #define VIA2_IRQ_UNUSED_BIT     2
 #define VIA2_IRQ_SCSI_BIT       3
 #define VIA2_IRQ_ASC_BIT        4
 
 #define VIA2_IRQ_NB             8
 
-#define VIA2_IRQ_SCSI_DATA  (1 << VIA2_IRQ_SCSI_DATA_BIT)
-#define VIA2_IRQ_SLOT       (1 << VIA2_IRQ_SLOT_BIT)
-#define VIA2_IRQ_UNUSED     (1 << VIA2_IRQ_SCSI_BIT)
-#define VIA2_IRQ_SCSI       (1 << VIA2_IRQ_UNUSED_BIT)
-#define VIA2_IRQ_ASC        (1 << VIA2_IRQ_ASC_BIT)
+#define VIA2_IRQ_SCSI_DATA      (1 << VIA2_IRQ_SCSI_DATA_BIT)
+#define VIA2_IRQ_NUBUS          (1 << VIA2_IRQ_NUBUS_BIT)
+#define VIA2_IRQ_UNUSED         (1 << VIA2_IRQ_SCSI_BIT)
+#define VIA2_IRQ_SCSI           (1 << VIA2_IRQ_UNUSED_BIT)
+#define VIA2_IRQ_ASC            (1 << VIA2_IRQ_ASC_BIT)
 
 #define TYPE_MOS6522_Q800_VIA2 "mos6522-q800-via2"
 OBJECT_DECLARE_SIMPLE_TYPE(MOS6522Q800VIA2State, MOS6522_Q800_VIA2)
-- 
2.31.1


