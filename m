Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB8407F08
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:43:58 +0200 (CEST)
Received: from localhost ([::1]:43064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTWH-00026E-U0
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHO-000790-Mf
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHN-0004nb-93
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:34 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so4964673wms.4
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qq83gm6o51EoSTv2SvU60Q/ZscN9CmckVp0QDVwTqtI=;
 b=TgDgAFMxvCGmVWj6gAZvz02snYlfloG0VVtTqcFE9No2+KMF0VLNSSgXWhZNJbJA0V
 jUw66EgHul1IfP4etBtQnNd6dxo6WI8Li2p9AmfdHwB6mGD9HagLEusevqEHq13zMGon
 GParFual0zRQQbpv1Uc4DngXmHnpi7ctQ64u3yZXNIPexCRub7fVEOBU2RkK23F2SNVk
 DbI07RKPN1xUHQ/HcZ4biEVEZ4sBCtuh0bxUAg3wkQ2BV98FcQlaT33uYSOBkLGVdZbt
 LqwUgg1dQcXWv/1ICTXOvKLTSDpDCDI192c/FfPNpHfrbUCmtfyNSz4KxMqTK4snyvUF
 9Rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qq83gm6o51EoSTv2SvU60Q/ZscN9CmckVp0QDVwTqtI=;
 b=y242eTDZ178aeeWXRvBn1sJmSlmgW/Gl4z2r98hYuJNxtXNtt1/zGZgzYmkYl6KDnJ
 GL/m+G22+G7s9Hr8phtxC7hf15a32ehxyLoRU0jTrBLuBzMSOjLdnKJlW4HbQaGQE3EC
 54t/NlcWm0jQTcc6RfKo1IqBphQm5W9MTZX/Dl0uGWACU/Zcc22fQhCnZbUusG0GY4Xw
 35tGbon4tcTciueBaW6K0teRojI/Qtfd0I+xVQXTQbSSirWZY4GlNWd4X9aDF2Cz6RAV
 jEpYbSKV2zuM/F5K9ZCSWwMTMsD7c8nFCxBDhv1lz3dld5nD3UCUwJGKxKkCg7xfp+sZ
 D1Ig==
X-Gm-Message-State: AOAM533KisLQ6n7cWEIfex+Ji+/sWhSEICerH5tjqS8WMaA/gtVUAINt
 nrFTos5llLtmEIM8qObMT7WnGkQvhDo=
X-Google-Smtp-Source: ABdhPJxaM6kK8+YMfXbRgYjIyIenb96IxBorX79OYaWcUsL3USevqsikB4EoIRika8N8trl1/PLMKQ==
X-Received: by 2002:a1c:2bc6:: with SMTP id r189mr7597705wmr.183.1631467711726; 
 Sun, 12 Sep 2021 10:28:31 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u8sm4925518wmq.45.2021.09.12.10.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/30] target/hexagon: Remove unused has_work() handler
Date: Sun, 12 Sep 2021 19:27:13 +0200
Message-Id: <20210912172731.789788-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

has_work() is sysemu specific, and Hexagon target only provides
a linux-user implementation. Remove the unused hexagon_cpu_has_work().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3338365c16e..aa01974807c 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -189,11 +189,6 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
     env->gpr[HEX_REG_PC] = tb->pc;
 }
 
-static bool hexagon_cpu_has_work(CPUState *cs)
-{
-    return true;
-}
-
 void restore_state_to_opc(CPUHexagonState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
@@ -287,7 +282,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
-    cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
-- 
2.31.1


