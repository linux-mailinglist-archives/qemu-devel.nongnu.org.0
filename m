Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5145387D7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:46:33 +0200 (CEST)
Received: from localhost ([::1]:36572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlLV-0007f4-2h
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlEM-0006zf-3s; Mon, 30 May 2022 15:39:11 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlEK-0008F5-KD; Mon, 30 May 2022 15:39:09 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m14-20020a17090a414e00b001df77d29587so206290pjg.2; 
 Mon, 30 May 2022 12:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RDRU+6JkBy4sLgS3aQWSiZOqQJUAYugjHx5ft3m2OBI=;
 b=Iq8oQ7vOGMVPvFPsSiFi3DKcMPC6Nh2/RIzLiQnwrg7e0onNz9h2MBPy5jB4ipQpjr
 x4K5J3uRzdCJVqTTjCH9cgXY226kxExA8Q6vXbelMINETMXKzcLtRGwppXzYDdh8RFuj
 CucWFyggOApl0xk1Uh+/ven0Pvn72N950NMxmcUfMnA3Lr+dyrh4esoiQMvK5pPnW/j7
 IF86arPZwuVUMmo/om3Bo9B8jxB2ZzW99pbfAvNS/SP33o+d28iTtaG6sxGFFDfT7oxG
 hL0gbwWrygzxWWlPvrIZ8pq7Rs5VvRGEgW5D/XxYGlJHLuh7Hf7WMbaw6WYojgJw3teT
 BA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RDRU+6JkBy4sLgS3aQWSiZOqQJUAYugjHx5ft3m2OBI=;
 b=UCEssiMY4QCSi0mEmk3AB86hqN0mwivMtamq/oI+PGqd9Zj4R5AT0+0ZFMcPuA0Jsr
 jmc19fampAHcIuWTdkpb/IDGC7IRQDUZMV5VRGacliHvtUhtQqDrAaVc0drovdW+RP9R
 kOwtZ9yCo5dlvHRwwpugkdXOgdGIhC6Zt2e1ZRxU60R3sS2Fq8aAzQIvq88iVXyQ865E
 yUSQ9pFSxntlLMqBavXNRnQ5KoQHNVUJJsFgdhvPJDmhvqQywGFAqbCLOjI1tAuR/61d
 px98eH1JID/OM5/Hil8dAPMCBdYPq+AoZZqzAgz1qR7wbkNRZjABUk5wNLsAk/g8vmwt
 e8aw==
X-Gm-Message-State: AOAM531O6XJFXowgWp62ou7u07PmMLnlUBJ4SBX1CKN+qj0WV+kqIXpa
 irDyxjP0yHvs3kmtyh59wOMp8tP8g6M=
X-Google-Smtp-Source: ABdhPJwhIpDzpVgAjakM8JpLACxBFwRJrkx9MBtmuMXSPzlRaNLREVt31mifg6D2tpCrAxpT7eMU3g==
X-Received: by 2002:a17:90a:4587:b0:1de:c6ee:80f with SMTP id
 v7-20020a17090a458700b001dec6ee080fmr24515208pjg.196.1653939546703; 
 Mon, 30 May 2022 12:39:06 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a170902ed4d00b0015ea4173bd6sm197555plb.195.2022.05.30.12.39.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:39:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 05/25] hw/sd: Introduce sd_cmd_handler type
Date: Mon, 30 May 2022 21:37:56 +0200
Message-Id: <20220530193816.45841-6-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
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

Add 2 command handler arrays in SDProto, for CMD and ACMD.
Have sd_normal_command() / sd_app_command() use these arrays:
if an command handler is registered, call it, otherwise fall
back to current code base.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-5-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 953dbbd7ae..ed63528615 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -87,8 +87,12 @@ enum SDCardStates {
     sd_disconnect_state,
 };
 
+typedef sd_rsp_type_t (*sd_cmd_handler)(SDState *sd, SDRequest req);
+
 typedef struct SDProto {
     const char *name;
+    sd_cmd_handler cmd[SDMMC_CMD_MAX];
+    sd_cmd_handler acmd[SDMMC_CMD_MAX];
 } SDProto;
 
 struct SDState {
@@ -1031,6 +1035,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
     }
 
+    if (sd_proto(sd)->cmd[req.cmd]) {
+        return sd_proto(sd)->cmd[req.cmd](sd, req);
+    }
+
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
     case 0:	/* CMD0:   GO_IDLE_STATE */
@@ -1575,6 +1583,11 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
     trace_sdcard_app_command(sd_proto(sd)->name, sd_acmd_name(req.cmd),
                              req.cmd, req.arg, sd_state_name(sd->state));
     sd->card_status |= APP_CMD;
+
+    if (sd_proto(sd)->acmd[req.cmd]) {
+        return sd_proto(sd)->acmd[req.cmd](sd, req);
+    }
+
     switch (req.cmd) {
     case 6:	/* ACMD6:  SET_BUS_WIDTH */
         if (sd->spi) {
-- 
2.36.1


