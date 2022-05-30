Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D324E5387EA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:57:20 +0200 (CEST)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlVv-0001R5-VG
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlEv-0007ll-Af; Mon, 30 May 2022 15:39:45 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlEt-0008LQ-EX; Mon, 30 May 2022 15:39:44 -0400
Received: by mail-pl1-x62f.google.com with SMTP id q18so11038372pln.12;
 Mon, 30 May 2022 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hc8op+xHNyF3R11bJslh7S9ghBerJPL5Ix/mS+aQ9B4=;
 b=fdxSyGd1UgkkzqAw3L2L5Kn8Gmt8ogMwHczY9a/B9f+RO+eJA3XduNjAolN0clPBHR
 mDKvM8bP9zMGLX+zgd3NCztjw/0Is/YasqhPJjAum9HFZn8DqnCtdtYPNxWTS2cQuW6o
 3wsDbl8GhzsmGrQkPSdHyMy8rQsppKgSn3AIANFwRlKNev0IIM+oIUQx3iY/HFVm92mA
 6H7lDPTxmS7pmopG9xU4CVM/SFMXLE0UC1Ss+JZSTlxYC+EhoxBoYipaKE0H3h/3dZe+
 NqNRht43+QOl4LV60l5S0aJAIRkVNBLThTDh/TW0zkVJICqVRID3E2yO+SVbclanpdsw
 PZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hc8op+xHNyF3R11bJslh7S9ghBerJPL5Ix/mS+aQ9B4=;
 b=HVEAx+WrSeeKknGVpeNkT2VQEcsOYho6aDT2LauD1z7BMod48+W3K/RUWSHWG0xdui
 2Fd+WI7fYZResLk/l/O7KUPTPeqCmMamPpFs9KkaZU2w4suzfYXqYnO59lO1MF0YSAEE
 NHZpQCeHMI7JUHFNKOYZGEcsU8q+PefFNUDOYYheBJf5CMX+i/fiWfCYwBWgmMqOGFOB
 9WEIAwWmUSyMOckuOwI5yBP51BFfAmDhjzHhgL+IpHiSjG04+Fgrr7qTt1uIeT4MsCOr
 t4V7rNTvmb97O/BjnTHFnJ8z+6m6lfVz7oQKqllPkeENcv8v2xuCJayrUMLoK7FL4Y/Y
 E1SQ==
X-Gm-Message-State: AOAM531hONA/DnBX46HW9wEfvK94RTbgBHIosq3iMWYGnaDelr0CItmh
 R+jlEm0U1sZe+/fBX3nKs+EKdGTRIao=
X-Google-Smtp-Source: ABdhPJyRP1OBTChenIjMfYlytpYOtwSGQET7+2rDpEFKHqnsSIC/1/2fvh/4gXQ9M8vSUgcNoAWxOg==
X-Received: by 2002:a17:90a:5b03:b0:1df:86d4:ba27 with SMTP id
 o3-20020a17090a5b0300b001df86d4ba27mr24372368pji.124.1653939581677; 
 Mon, 30 May 2022 12:39:41 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a170903101500b0015e8d4eb26bsm5184960plb.181.2022.05.30.12.39.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:39:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 09/25] hw/sd: Add sd_cmd_SEND_OP_CMD() handler
Date: Mon, 30 May 2022 21:38:00 +0200
Message-Id: <20220530193816.45841-10-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[ clg: Update cmd_abbrev ]
Message-Id: <20210624142209.1193073-9-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c             | 18 +++++++++---------
 hw/sd/sdmmc-internal.c |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 22405e8bb6..ac81e1c667 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1030,6 +1030,13 @@ static sd_rsp_type_t sd_cmd_GO_IDLE_STATE(SDState *sd, SDRequest req)
     return sd->spi ? sd_r1 : sd_r0;
 }
 
+static sd_rsp_type_t sd_cmd_SEND_OP_CMD(SDState *sd, SDRequest req)
+{
+    sd->state = sd_transfer_state;
+
+    return sd_r1;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1069,10 +1076,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 1:	/* CMD1:   SEND_OP_CMD */
-        sd->state = sd_transfer_state;
-        return sd_r1;
-
     case 2:	/* CMD2:   ALL_SEND_CID */
         switch (sd->state) {
         case sd_ready_state:
@@ -1622,11 +1625,6 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         break;
 
     case 41:	/* ACMD41: SD_APP_OP_COND */
-        if (sd->spi) {
-            /* SEND_OP_CMD */
-            sd->state = sd_transfer_state;
-            return sd_r1;
-        }
         if (sd->state != sd_idle_state) {
             break;
         }
@@ -2131,6 +2129,7 @@ static const SDProto sd_proto_spi = {
     .name = "SPI",
     .cmd = {
         [0]         = sd_cmd_GO_IDLE_STATE,
+        [1]         = sd_cmd_SEND_OP_CMD,
         [2 ... 4]   = sd_cmd_illegal,
         [5]         = sd_cmd_illegal,
         [7]         = sd_cmd_illegal,
@@ -2140,6 +2139,7 @@ static const SDProto sd_proto_spi = {
     },
     .acmd = {
         [6]         = sd_cmd_unimplemented,
+        [41]        = sd_cmd_SEND_OP_CMD,
     },
 };
 
diff --git a/hw/sd/sdmmc-internal.c b/hw/sd/sdmmc-internal.c
index 2053def3f1..8648a7808d 100644
--- a/hw/sd/sdmmc-internal.c
+++ b/hw/sd/sdmmc-internal.c
@@ -14,7 +14,7 @@
 const char *sd_cmd_name(uint8_t cmd)
 {
     static const char *cmd_abbrev[SDMMC_CMD_MAX] = {
-         [0]    = "GO_IDLE_STATE",
+         [0]    = "GO_IDLE_STATE",           [1]    = "SEND_OP_CMD",
          [2]    = "ALL_SEND_CID",            [3]    = "SEND_RELATIVE_ADDR",
          [4]    = "SET_DSR",                 [5]    = "IO_SEND_OP_COND",
          [6]    = "SWITCH_FUNC",             [7]    = "SELECT/DESELECT_CARD",
-- 
2.36.1


