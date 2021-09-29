Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A85841C220
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:57:54 +0200 (CEST)
Received: from localhost ([::1]:36400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWLZ-0006Im-Iz
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtd-00024S-69
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:01 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:58299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVta-0005qg-Ix
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:00 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M1q4e-1mXioq2Gmu-002FUB; Wed, 29
 Sep 2021 11:28:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] nubus: generate bus error when attempting to access
 empty slots
Date: Wed, 29 Sep 2021 11:28:31 +0200
Message-Id: <20210929092843.2686234-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jSCUnpEoiEZU2+l5R2/TnoHeE7c+d4Vg/kix7thKvrEtVx1OymI
 qJEiHIzZRlnhhFhVYgKPNNtFh19442/qN6d8Hb47PgBCsoJEDqnWkp8n2eoI16grlCEdIGq
 KJL2RJBO5dJnp9VrqcGhE+SLTVCADy7/GOitsuvHqkeFWJPlXSBvxyQ+x0sXstgTp+FS7yS
 JPHBZfNbj4M11qyj1yQcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rviC9qnDCwU=:M6vuhiibbKfoiBGf7AwjCV
 1Q04Jh+58qcgjZvRSYDasQq3K0oaNLyuov7CUZNDvKcusmgOvf3bk3Yr7jzf/Tf+4CySo6CZ0
 sFutqlUqkXmPwBheHAsmF2j8+qsXZcm6zQmVxBl9pGbsCeguSyaaiiksuSuNH42wETukSIjYs
 QDqiGWHWLbV/FGcXXWBQ0HGzM2CzdQtPkMdJgI1k9wiCz5Trg/iGzEKWQ6qlJjafNCkV0wbPH
 lfwExFd87JqIs9FuD/77aErp5uwi3Sz3YTwqDwF5Mc80u/cSIE9ga+yd8lZMZpX0Dm7RXbz3g
 /R/DYPQEw/s7yWSry6EBCxs9++B32O2sU+XzvSUOTdBZzPYRfUUucc7JgFAt9NPngtkzAFbqi
 jc7qOLitstS4uBvJjCaC8C0luxlWoPKyNI9f2DYaiu9joL16lasHzWdvufPDEsISN3gXWpQrm
 CvX8Hj+s/m7Wc8/qhP7fhe1bii6Hz9pGAdZvfMgENhliidEveeX6dRibyWCptFqYXYDZpFX85
 pto7k1QI9txxrAVU74yPTYrnD+MEIaV4O74x8lfQFuGvi9mPvvck2G/juoDSdwy2DKWGmdzyR
 HEcF/QyRGmEuTRIbscje579Q1aKflzUsJt3/QOIKLtEUBwA0EvexXBCO1zj4xH2AR87vLcLju
 kIz4IG3oXuU6WYourcE3DuB8yT+UGA71lEyUAzT7fmr4WDf5WbyAcGdaZV2mVi11vwb7HZgDQ
 SYs0KYFfgSNR0ZJfV4R3ec1XSAOmnHjNvrzuhg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

According to "Designing Cards and Drivers for the Macintosh Family" any attempt
to access an unimplemented address location on Nubus generates a bus error. MacOS
uses a custom bus error handler to detect empty Nubus slots, and with the current
implementation assumes that all slots are occupied as the Nubus transactions
never fail.

Switch nubus_slot_ops and nubus_super_slot_ops over to use {read,write}_with_attrs
and hard-code them to return MEMTX_DECODE_ERROR so that unoccupied Nubus slots
will generate the expected bus error.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-9-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nubus/nubus-bus.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index a9fb6ded9e4e..215fdb6b4ec2 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -28,23 +28,23 @@ static NubusBus *nubus_find(void)
     return NUBUS_BUS(object_resolve_path_type("", TYPE_NUBUS_BUS, NULL));
 }
 
-static void nubus_slot_write(void *opaque, hwaddr addr, uint64_t val,
-                             unsigned int size)
+static MemTxResult nubus_slot_write(void *opaque, hwaddr addr, uint64_t val,
+                                    unsigned size, MemTxAttrs attrs)
 {
-    /* read only */
     trace_nubus_slot_write(addr, val, size);
+    return MEMTX_DECODE_ERROR;
 }
 
-static uint64_t nubus_slot_read(void *opaque, hwaddr addr,
-                                unsigned int size)
+static MemTxResult nubus_slot_read(void *opaque, hwaddr addr, uint64_t *data,
+                                   unsigned size, MemTxAttrs attrs)
 {
     trace_nubus_slot_read(addr, size);
-    return 0;
+    return MEMTX_DECODE_ERROR;
 }
 
 static const MemoryRegionOps nubus_slot_ops = {
-    .read  = nubus_slot_read,
-    .write = nubus_slot_write,
+    .read_with_attrs  = nubus_slot_read,
+    .write_with_attrs = nubus_slot_write,
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
@@ -52,23 +52,25 @@ static const MemoryRegionOps nubus_slot_ops = {
     },
 };
 
-static void nubus_super_slot_write(void *opaque, hwaddr addr, uint64_t val,
-                                   unsigned int size)
+static MemTxResult nubus_super_slot_write(void *opaque, hwaddr addr,
+                                          uint64_t val, unsigned size,
+                                          MemTxAttrs attrs)
 {
-    /* read only */
     trace_nubus_super_slot_write(addr, val, size);
+    return MEMTX_DECODE_ERROR;
 }
 
-static uint64_t nubus_super_slot_read(void *opaque, hwaddr addr,
-                                      unsigned int size)
+static MemTxResult nubus_super_slot_read(void *opaque, hwaddr addr,
+                                         uint64_t *data, unsigned size,
+                                         MemTxAttrs attrs)
 {
     trace_nubus_super_slot_read(addr, size);
-    return 0;
+    return MEMTX_DECODE_ERROR;
 }
 
 static const MemoryRegionOps nubus_super_slot_ops = {
-    .read  = nubus_super_slot_read,
-    .write = nubus_super_slot_write,
+    .read_with_attrs = nubus_super_slot_read,
+    .write_with_attrs = nubus_super_slot_write,
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
-- 
2.31.1


