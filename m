Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C3455B34C
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 19:56:10 +0200 (CEST)
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WUT-0008Th-27
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 13:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLG-0002fJ-D4
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLE-0008Pu-Qd
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nTv/GntpdFOeKbpIoIbnma4io06TzyCNKdAwqPdh5t4=; b=yULPkJxmrM/IQRBsKhHWN+j9YI
 73Id0JyyBBCNAdsZmeZp8Dnn8KDgUDpPyPWJg8GRL7Dh8x+FTHIWo6KjeMofkbE4gWDUbY7NZyOjR
 KuHclUgnEazYTrahj47S5f0bazFMfigXusX8sE3XVdLeEXbZXnnYQWyAawNKIacSwLtqx80jSJIG2
 VR+ikSwWf6w08u+8V7Yg2XOBoBO5+6h4M8qngKy9jleHBiahKAsk+n7XKk+TRDAxLFAHhOEH5Eh+p
 w7uZGbCunTBLWdj9MFu3Epk22yrzu/tp5TZTlKh+yvY4z9w+gL/9wz8F60ZdHYHuuF7QB83Ua2tCz
 QcOa4srY5QBGsCFEgwv7IaRw4WeB61e32AG0zz3/6fh3xdCBWJgc+oX0HB3qo2EcCjgBj2KjyMO7P
 rr/s+zwo8DFnBo1F9T0xOmsNeRFgf4L5CfpM8xoD1bd+EF28L5Zu9Hmx8wz2TGqE+5alJw4LCgsj+
 WlO+o4BvAKh4UI2vGo59u6RXtCb5vrp5xaedOrUy48gv/6D1sBMeVzWgH+RnT09Ybt4byjP1H08ig
 mB/31Ghnzi62bugALHLp8Tk8aIjzrthFmIh1gJCjCehVgawJaWyQVBzQqa65PVUzJB2opy5Ih55Kv
 jUOaBqU5AzQhRG7DKEwbwowfwwtZOVcQ6WftTi/HE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WK0-0007KY-Ib; Sun, 26 Jun 2022 18:45:24 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:50 +0100
Message-Id: <20220626174531.969187-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 14/55] pl050: checkpatch fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch also includes a couple of minor spacing updates.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-15-mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index d279b6c148..889a0674d3 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -53,8 +53,9 @@ static const VMStateDescription vmstate_pl050 = {
 #define PL050_KMIC            (1 << 1)
 #define PL050_KMID            (1 << 0)
 
-static const unsigned char pl050_id[] =
-{ 0x50, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
+static const unsigned char pl050_id[] = {
+    0x50, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
+};
 
 static void pl050_update(void *opaque, int level)
 {
@@ -71,8 +72,10 @@ static uint64_t pl050_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
     PL050State *s = (PL050State *)opaque;
-    if (offset >= 0xfe0 && offset < 0x1000)
+
+    if (offset >= 0xfe0 && offset < 0x1000) {
         return pl050_id[(offset - 0xfe0) >> 2];
+    }
 
     switch (offset >> 2) {
     case 0: /* KMICR */
@@ -88,16 +91,19 @@ static uint64_t pl050_read(void *opaque, hwaddr offset,
             val = (val ^ (val >> 1)) & 1;
 
             stat = PL050_TXEMPTY;
-            if (val)
+            if (val) {
                 stat |= PL050_RXPARITY;
-            if (s->pending)
+            }
+            if (s->pending) {
                 stat |= PL050_RXFULL;
+            }
 
             return stat;
         }
     case 2: /* KMIDATA */
-        if (s->pending)
+        if (s->pending) {
             s->last = ps2_read_data(s->dev);
+        }
         return s->last;
     case 3: /* KMICLKDIV */
         return s->clk;
@@ -114,6 +120,7 @@ static void pl050_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
     PL050State *s = (PL050State *)opaque;
+
     switch (offset >> 2) {
     case 0: /* KMICR */
         s->cr = value;
-- 
2.30.2


