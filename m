Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAAB5387F2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:59:16 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlXm-0004sT-Mr
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFt-00016j-0Q; Mon, 30 May 2022 15:40:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFr-0000GJ-B4; Mon, 30 May 2022 15:40:44 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso196264pjl.3; 
 Mon, 30 May 2022 12:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0cBhYgoYW3zeyEDvoShgTC1bQ+P+Lr18CMCPV7PbY6I=;
 b=dfzjvQNF+BJ9jF23fsxtvqb8TouysTJUVYXk2LuiacMI9Q5aBggqWXZW0s2Q1JA4iA
 sdj+UheYHFez2V5n7t+k4PW1+CIfqd8XK9yfLHfOEg7+afx72FKezl7pWRcQqdTxKY0o
 a0y7Y3G1IK4ayg8aXjrxkoEVitrIR70bGSax87c7XJ25LGNmJIYk8fPzJa/12XS8HaII
 nhLFpo09VrlmvGgXA1YL3oFN8lThk8LThAAXpuumMbAKr4tCNjed2rWyN+LnwH2Qlh/C
 Fo0rV06SXPfiodEogvTKlZzpKJ6xHviDLlhuh+X43iF38CyddPDpdpMZciql/HKGAArB
 WJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0cBhYgoYW3zeyEDvoShgTC1bQ+P+Lr18CMCPV7PbY6I=;
 b=7kH+LpSHx194zfTeseuLp3N0L0Ufqu1AD9DaWJk3kmb06iNa0lgNMK8pTClHr/b2Xw
 eocYQvJKGNMFUPzp9PS59j4Wv17fix0Z4+AHdEwkwGXUe4hw2AStn72s7AvDWuEhuEKM
 MGYZQM6mZZj/9h3Y1q7zRcSpOkLBqPzGT3jeHJoswwIEx6adi0Uim73MrIJLJY9ZYKjv
 WGYPc7OHKoQXuUOAFqbnVW7F/D863r/Sbb3NVrPHWT3TU/WJRJw49aRbMcKkt2K5UP9+
 vg2eSgVRz+TKaikQUwNNn0dx1hpquUGAPtv53TasGzIYHgliskTo9tqP5h+n7c21zJAf
 H4fA==
X-Gm-Message-State: AOAM5313nMccY9D1KFa9LhUUIhZFOS23XRrwFFbgtefAgswoITxQK83v
 TrLwuw1utCAyxb7VQ9BowbQw8ZjNGoE=
X-Google-Smtp-Source: ABdhPJxcEbcSKXh2QDUpmpnVv8nZqujjlTp1ibVnPiCkEsCMe6c/RFMi5CU77rK+ZlPLLKq0HNtvXA==
X-Received: by 2002:a17:90a:df16:b0:1e3:1cd:6c6f with SMTP id
 gp22-20020a17090adf1600b001e301cd6c6fmr6147308pjb.10.1653939641573; 
 Mon, 30 May 2022 12:40:41 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a63ee42000000b003f61c311e79sm4901832pgk.56.2022.05.30.12.40.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:40:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 16/25] hw/sd: Add sd_emmc_cmd_ALL_SEND_CID() handler
Date: Mon, 30 May 2022 21:38:07 +0200
Message-Id: <20220530193816.45841-17-philippe.mathieu.daude@gmail.com>
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
index 538231dbab..5e315f171c 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2172,11 +2172,23 @@ static sd_rsp_type_t sd_emmc_cmd_SEND_OP_CMD(SDState *sd, SDRequest req)
     return sd_r3;
 }
 
+static sd_rsp_type_t sd_emmc_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
+{
+    if (sd->state != sd_ready_state && sd->state != sd_idle_state) {
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+
+    sd->state = sd_identification_state;
+
+    return sd_r2_i;
+}
+
 static const SDProto sd_proto_emmc = {
     .name = "eMMC",
     .cmd = {
         [0]         = sd_cmd_GO_IDLE_STATE,
         [1]         = sd_emmc_cmd_SEND_OP_CMD,
+        [2]         = sd_emmc_cmd_ALL_SEND_CID,
         [5]         = sd_cmd_illegal,
         [19]        = sd_cmd_SEND_TUNING_BLOCK,
         [41]        = sd_cmd_illegal,
-- 
2.36.1


