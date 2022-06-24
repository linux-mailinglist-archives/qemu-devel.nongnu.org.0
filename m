Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E406559AC1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:57:47 +0200 (CEST)
Received: from localhost ([::1]:47012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jog-0005HW-9t
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4ja0-00018E-81; Fri, 24 Jun 2022 09:42:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZy-00058k-M4; Fri, 24 Jun 2022 09:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iJeZHKd2ESfTdLxK3gngrDHiZnVgxD1i9JMP8ahasbE=; b=u/sZyxJ8w7dvgIh6YPb5F1mupt
 H5sehCNdI6t4roXt1VtFgdFzezhUUbp2jEu28dgBi7GGRCxtwlTSiPp9X/a+Srk0ORtwyp0wOF1kR
 nn+vrjvaVlL01UBazD6hBzCTl9tPt4uIpArooyzs7Rw0ceAmItxLlsEMvYulZytx2wpkvIYjWV7lg
 ZnTSmNjweTwt9JhYb+Kv7za20nQ4tfU/lIjLawoq7REzgS8JwanXQiyOJkxe9nt3S+DJ6JCpcPhsF
 UjDTEdWAh8dTyrmdF+T8mNCPnJmQq9IGaTvOET7D1ZV81PDFVaSIZKP611UKveumHR8oRzN+NYn7b
 u3+S0EtcxYnZ00LGNKV15XIymHCLRBEBAQh0MiqrrQJKQGtuNJjx9tB/3JKYZA1bJYblV9cZ6zyUi
 diQ1Cct6qJCY+VVZbt3D6VNtICwvvzwhiNXwGMeZIgyPHRIo/Aq/9CKFMN60+WUPTEvpkcFGSfm/s
 t6llJQT6+G6aSUukdDvgX+b64h7QmNoCQ8K0Ym33sWEWfQIJQ/Wd7Yi4ojrDbxW/+GtoZw9dJfkTg
 RdhuvCcDTFB+VwZxBBw3mkCMh10xP3+Mbjx+otC/gn5ctEf/PJE0kf1XAAUw7NjeOvvWHaOhwia+s
 XL/Qe/vKp7V12XhwoLn7+3qmkZXH9zZBpXsMwgkXA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYM-00037t-80; Fri, 24 Jun 2022 14:40:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:29 +0100
Message-Id: <20220624134109.881989-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 14/54] pl050: checkpatch fixes
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


