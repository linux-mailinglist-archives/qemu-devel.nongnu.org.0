Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D74301EAE
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:18:48 +0100 (CET)
Received: from localhost ([::1]:51064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3lqR-0001Ui-QI
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljj-0002oe-OR; Sun, 24 Jan 2021 15:11:51 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljh-0008AG-GO; Sun, 24 Jan 2021 15:11:50 -0500
Received: by mail-wr1-x433.google.com with SMTP id p15so3579056wrq.8;
 Sun, 24 Jan 2021 12:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvlrFXvx36UvMO8am/Ebt5BL3p3nP+BcIJYQlCouQhQ=;
 b=iibR4p2K2ozBOrvrvixWTdiMR69bEbwQzxhdgdvEdVtjWnZDZrAWs3ZUHtBITnKGdN
 /AAY1OyKIiTqopAFJNDoJqYPJTR8TjREnx13y9xHCeNFDuR9/7dbHm7KrUHDb3vDi/C9
 foiEPNZr3gBe3c5ue4L09C30+yPfy0k4M0y3oLkLA4/PJSk2tbI5/402LioKb39BxR1t
 dVPGDHnlGgqabEJ1n0lN9XGFS+gMlAUgV6Zsok53zsa15eQfWWc8KavH3MDm2wUF8iIr
 r0PpJg/oi9aHHMGSyIy8GpA4yqLU4S+KpBEJPcAFGLlHCRuJHZfjEJb4rDw/44h2U+9v
 n6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CvlrFXvx36UvMO8am/Ebt5BL3p3nP+BcIJYQlCouQhQ=;
 b=EaE7Vh98Ycd/UP1kPYcKLoCDCmrU90eW9yRPWjMvZ/87bQxL21VBkPHPC47iaFGAUz
 4WP12mo/h6DMAL++R5pw6ZqcMA4/LRNMVUiZrvYCrjMMVNu9s0GUjJdTHZFPTc+hPXqm
 /AOuhmku2+S8NTJdwsymhvekdkLM8whNGO4HD/gbYhqOG7F6+JdmfrUwSqpCYbcdfLT5
 rdlOIjmnQn033+DcGgO2u53Bbe6vZa1/a5h09Kj/9bIvoWsRBefHpoFWp2uVOCGt22Iq
 8OZwOXzs5V+poS138qKxbBM/NO4qNt5/gRu5TwBw6ft4xgPx6Y/+0mm8Cfn8XEXmJVoE
 dEiw==
X-Gm-Message-State: AOAM531yWPQlRFHWUKwLRbeFj18xby9ZQ34mSPL2+nmEgsr21f5vwYRw
 LfbmUfq/YRdKMOGcjaSDDWY9NLk0HHo=
X-Google-Smtp-Source: ABdhPJzxbwcyMWSK0hq8p0/OoC/e1TVLiEeT1vwoGzjmSg5wkxV0JYNRmJyQ5GBxf2PXMNjB9S5/6w==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr4063559wru.364.1611519107021; 
 Sun, 24 Jan 2021 12:11:47 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d9sm12409388wrq.74.2021.01.24.12.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:11:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] hw/sd: ssi-sd: Use macros for the dummy value and tokens
 in the transfer
Date: Sun, 24 Jan 2021 21:11:05 +0100
Message-Id: <20210124201106.2602238-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124201106.2602238-1-f4bug@amsat.org>
References: <20210124201106.2602238-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the codes use hardcoded numbers (0xff/0xfe) for the dummy
value and block start token. Replace them with macros.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210123104016.17485-12-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 12dffb6f55e..be1bb101645 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -78,6 +78,12 @@ OBJECT_DECLARE_SIMPLE_TYPE(ssi_sd_state, SSI_SD)
 #define SSI_SDR_ADDRESS_ERROR   0x2000
 #define SSI_SDR_PARAMETER_ERROR 0x4000
 
+/* single block read/write, multiple block read */
+#define SSI_TOKEN_SINGLE        0xfe
+
+/* dummy value - don't care */
+#define SSI_DUMMY               0xff
+
 static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 {
     ssi_sd_state *s = SSI_SD(dev);
@@ -91,14 +97,14 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
 
     switch (s->mode) {
     case SSI_SD_CMD:
-        if (val == 0xff) {
+        if (val == SSI_DUMMY) {
             DPRINTF("NULL command\n");
-            return 0xff;
+            return SSI_DUMMY;
         }
         s->cmd = val & 0x3f;
         s->mode = SSI_SD_CMDARG;
         s->arglen = 0;
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_CMDARG:
         if (s->arglen == 4) {
             SDRequest request;
@@ -173,15 +179,15 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         } else {
             s->cmdarg[s->arglen++] = val;
         }
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_PREP_RESP:
         DPRINTF("Prepare card response (Ncr)\n");
         s->mode = SSI_SD_RESPONSE;
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_RESPONSE:
         if (s->stopping) {
             s->stopping = 0;
-            return 0xff;
+            return SSI_DUMMY;
         }
         if (s->response_pos < s->arglen) {
             DPRINTF("Response 0x%02x\n", s->response[s->response_pos]);
@@ -194,16 +200,16 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
             DPRINTF("End of command\n");
             s->mode = SSI_SD_CMD;
         }
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_PREP_DATA:
         DPRINTF("Prepare data block (Nac)\n");
         s->mode = SSI_SD_DATA_START;
-        return 0xff;
+        return SSI_DUMMY;
     case SSI_SD_DATA_START:
         DPRINTF("Start read block\n");
         s->mode = SSI_SD_DATA_READ;
         s->response_pos = 0;
-        return 0xfe;
+        return SSI_TOKEN_SINGLE;
     case SSI_SD_DATA_READ:
         val = sdbus_read_byte(&s->sdbus);
         s->crc16 = crc_ccitt_false(s->crc16, (uint8_t *)&val, 1);
@@ -224,7 +230,7 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
         return val;
     }
     /* Should never happen.  */
-    return 0xff;
+    return SSI_DUMMY;
 }
 
 static int ssi_sd_post_load(void *opaque, int version_id)
-- 
2.26.2


