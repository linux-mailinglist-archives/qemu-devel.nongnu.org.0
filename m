Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579ED5387FD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 22:01:06 +0200 (CEST)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlZZ-0006yR-BT
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 16:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlGH-0001Zl-IT; Mon, 30 May 2022 15:41:09 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlGF-0000GJ-T7; Mon, 30 May 2022 15:41:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso196264pjl.3; 
 Mon, 30 May 2022 12:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCLgBMbpBxR8PGqqnVdVF4Mxh0waVagEBbV26nroY/U=;
 b=b/JEUHzpBRbZcmoydkZxRH/ZqEVZuph945zxIqHZpR4j8i8uaVKMc2KlznNRHU/yLa
 1gMg+oVi4003io+wiXTJU4kwiT//7v8sd7QCuSL+hrmgMb9QF1/O/orOY0xkBYgb8fXP
 4nR0VT1xUgVhq5mRDh4rtkrJO0Z9+AhD0vuYUlYX5ploWem1c0DbhgUld6nlaYMUTzA5
 yP/aqIv0NMi6rHDu0faqEs5s4YCY2sk2phm9utDfZ9jPWwREFzkVyIy7revpPQheNhWi
 AiGz+3hLHGNqmK89FPGQPyYjxOdRABwaztH6ezEsYnIcjtBPpAElB9DigLOeDrfYF013
 STTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCLgBMbpBxR8PGqqnVdVF4Mxh0waVagEBbV26nroY/U=;
 b=Vzb2KZU7p2nCAwB3HvVRwP+3XbVajSVLeMOOuO7gdJhQdvhdbLj0QoPHu3ESEJ81Zm
 dZDx6K3LzXcz+s5Z0IAs6l5GLUqurxbClZtsSePW5EPFhMLMEn/Jeq5SGmuxJviw1WHV
 jzc0NOJDybRgUMpeSRo0/u+8P8i8EAplHXLmL2mMpXdy6yCX03OO4ZkwEH5Bp0HzxGAV
 chXIgDS13n5/vlxYrVcnk/Mffq3xnW0GfNE4NPcDMVCgRHzd07h/CwhXj+0iN6JGKBLF
 jqOdKui7MxvctRB5oe2AAIdCTphjKPGz5/ou2vLX7CSUQ3ncFTHNooARk4iAjZ3Lkiy/
 4lJw==
X-Gm-Message-State: AOAM532NYYQYh1Ls+F85BR/hB4LikfeFsbGyUi62Y2NlfssquT/OfekR
 gsDojOaZ6BvC3XUbyN8/z9mcSt32sm0=
X-Google-Smtp-Source: ABdhPJwMj4mznrT+bSqO6esQg1xx07zuPKncJcDCk6BAQJLiiR5iB0mz5mErQjd+f0tySweMpNdwRw==
X-Received: by 2002:a17:903:189:b0:163:56c3:8506 with SMTP id
 z9-20020a170903018900b0016356c38506mr27890444plg.70.1653939666747; 
 Mon, 30 May 2022 12:41:06 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a17090a7a8800b001e2cbb55b45sm57715pjf.53.2022.05.30.12.41.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:41:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 19/25] hw/sd: add sd_emmc_cmd_SEND_TUNING_BLOCK() handler
Date: Mon, 30 May 2022 21:38:10 +0200
Message-Id: <20220530193816.45841-20-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
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

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 90da24ad2d..d38ee5094d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2207,6 +2207,17 @@ static sd_rsp_type_t sd_emmc_cmd_APP_CMD(SDState *sd, SDRequest req)
     return sd_r0;
 }
 
+static sd_rsp_type_t sd_emmc_cmd_SEND_TUNING_BLOCK(SDState *sd, SDRequest req)
+{
+    if (sd->state != sd_transfer_state) {
+        sd_invalid_state_for_cmd(sd, req);
+    }
+
+    sd->state = sd_sendingdata_state;
+    sd->data_offset = 0;
+    return sd_r1;
+}
+
 static const SDProto sd_proto_emmc = {
     .name = "eMMC",
     .cmd = {
@@ -2216,6 +2227,7 @@ static const SDProto sd_proto_emmc = {
         [3]         = sd_emmc_cmd_SEND_RELATIVE_ADDR,
         [5]         = sd_cmd_illegal,
         [19]        = sd_cmd_SEND_TUNING_BLOCK,
+        [21]        = sd_emmc_cmd_SEND_TUNING_BLOCK,
         [41]        = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
         [55]        = sd_emmc_cmd_APP_CMD,
-- 
2.36.1


