Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B35387EB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:57:25 +0200 (CEST)
Received: from localhost ([::1]:36516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlW0-0001qc-QP
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlGA-0001MR-H8; Mon, 30 May 2022 15:41:02 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlG8-0000Ho-Md; Mon, 30 May 2022 15:41:01 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 nn3-20020a17090b38c300b001e0e091cf03so247749pjb.1; 
 Mon, 30 May 2022 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+2eolDr3CGVIRnHJAwizCG0JzGaCJsy89c17GmqoJs=;
 b=b/Oxt7VbntZw5XhfAt705GbWEbHPEaJ1RXoHQS1eKTJnZ+GQLBFn/TNCyCk2t4SWyv
 obgLZpuW670usSRVvvNkN7Lt9uXYnCo/5cI3OXT3FgnSHnvu4MGrf3h3wXUZm5bwFJmo
 RRJY0mfJzGZDNo9DnxiSzQkPVP9ODLlAPG1HiJpj6VzKFeLzlsaKPMUCIL7/zL4/x5nw
 cJu6Lml61s/JFYlkMzHKRrQfOpYbPn0HrB7zpL97hWophVNX8B5aJTAECMSwEmeeLXOU
 7Qes5hPjaY/eEE/AGaagZyHME+binYnrXdtzZY7X23QN6QlIjlQQyo82ERBj5rN9FlX2
 rOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+2eolDr3CGVIRnHJAwizCG0JzGaCJsy89c17GmqoJs=;
 b=TxnhSOWJgwqVirhZc4YaM/87UvPL1zRCtBP3rF5PPfLYJUmHiOXtfuss/JlnJrmk1I
 lSzcY+c5vxKJUd+tm7WBEQuVlPYFkqQIs+0FwSeFo2C+ERn13Oi5hv8CPaAh0dXRtqg7
 hQxTnlb5m4wzDOb8uEpKAdRQ+n/axkuSSDGeTZN7zJHp1NXZt7Mo+F/DhHH/tQgdArSc
 vZtre69ZB3UIB4BALK2O1Q1I1I8wCUt/raqyOvg01HND4IwFw2mtIVuBGjrT33hqjHIJ
 LAK88UmCquIy+X/Tuj3Dmn6hFfrv9mHBdHj1toLAGlQztHhiRIbFSjo4GMRLqyD91QGw
 ln5Q==
X-Gm-Message-State: AOAM531wyuTF3dzCARldUEyN8/RaCHe1qx6QEQo1mowedsB7nowuvbb/
 7Wz0KWOv96liVdRJY1LO7DQNkv1sLb0=
X-Google-Smtp-Source: ABdhPJwPLhm24pk2hKUiQP/lmHkDy03W1XFocsBH32yV3tIWRn0lF2ibhFrqkM6rX7e3t0T69ccqwQ==
X-Received: by 2002:a17:90a:ba0b:b0:1e0:97b4:e0ad with SMTP id
 s11-20020a17090aba0b00b001e097b4e0admr24667261pjr.19.1653939658462; 
 Mon, 30 May 2022 12:40:58 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q44-20020a17090a17af00b001cd4989ff41sm86745pja.8.2022.05.30.12.40.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:40:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 18/25] hw/sd: Add sd_emmc_cmd_APP_CMD() handler
Date: Mon, 30 May 2022 21:38:09 +0200
Message-Id: <20220530193816.45841-19-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
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
 hw/sd/sd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 100fe191a7..90da24ad2d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2202,6 +2202,11 @@ static sd_rsp_type_t sd_emmc_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
     return sd_r2_i;
 }
 
+static sd_rsp_type_t sd_emmc_cmd_APP_CMD(SDState *sd, SDRequest req)
+{
+    return sd_r0;
+}
+
 static const SDProto sd_proto_emmc = {
     .name = "eMMC",
     .cmd = {
@@ -2213,6 +2218,7 @@ static const SDProto sd_proto_emmc = {
         [19]        = sd_cmd_SEND_TUNING_BLOCK,
         [41]        = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
+        [55]        = sd_emmc_cmd_APP_CMD,
         [58]        = sd_cmd_illegal,
         [59]        = sd_cmd_illegal,
     },
-- 
2.36.1


