Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC720AEE3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 11:25:18 +0200 (CEST)
Received: from localhost ([::1]:40910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jokbl-0005DB-93
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 05:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jokaA-0003Mc-Ar; Fri, 26 Jun 2020 05:23:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34182
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1joka8-0004MQ-Pi; Fri, 26 Jun 2020 05:23:38 -0400
Received: from host86-158-109-79.range86-158.btcentralplus.com
 ([86.158.109.79] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1joka7-0007bz-JX; Fri, 26 Jun 2020 10:23:39 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org, laurent@vivier.eu, david@gibson.dropbear.id.au,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Fri, 26 Jun 2020 10:22:56 +0100
Message-Id: <20200626092317.3875-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626092317.3875-1-mark.cave-ayland@ilande.co.uk>
References: <20200626092317.3875-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.158.109.79
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 01/22] adb: coding style update to fix checkpatch errors
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will help ensure that style guidelines are being maintained during
subsequent changes.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Finn Thain <fthain@telegraphics.com.au>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200623204936.24064-2-mark.cave-ayland@ilande.co.uk>
---
 hw/input/adb.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index b1ac4a3852..bf1bc30d19 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -44,14 +44,14 @@ int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int len)
 
     cmd = buf[0] & 0xf;
     if (cmd == ADB_BUSRESET) {
-        for(i = 0; i < s->nb_devices; i++) {
+        for (i = 0; i < s->nb_devices; i++) {
             d = s->devices[i];
             adb_device_reset(d);
         }
         return 0;
     }
     devaddr = buf[0] >> 4;
-    for(i = 0; i < s->nb_devices; i++) {
+    for (i = 0; i < s->nb_devices; i++) {
         d = s->devices[i];
         if (d->devaddr == devaddr) {
             ADBDeviceClass *adc = ADB_DEVICE_GET_CLASS(d);
@@ -69,9 +69,10 @@ int adb_poll(ADBBusState *s, uint8_t *obuf, uint16_t poll_mask)
     uint8_t buf[1];
 
     olen = 0;
-    for(i = 0; i < s->nb_devices; i++) {
-        if (s->poll_index >= s->nb_devices)
+    for (i = 0; i < s->nb_devices; i++) {
+        if (s->poll_index >= s->nb_devices) {
             s->poll_index = 0;
+        }
         d = s->devices[s->poll_index];
         if ((1 << d->devaddr) & poll_mask) {
             buf[0] = ADB_READREG | (d->devaddr << 4);
-- 
2.20.1


