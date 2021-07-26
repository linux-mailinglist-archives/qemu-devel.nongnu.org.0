Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72373D5CAB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:10:56 +0200 (CEST)
Received: from localhost ([::1]:53132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82Fr-0002Ab-Sc
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m82Ex-0001Mi-2H; Mon, 26 Jul 2021 11:09:59 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m82Ev-0006y6-9M; Mon, 26 Jul 2021 11:09:58 -0400
Received: by mail-wr1-x430.google.com with SMTP id l18so3836458wrv.5;
 Mon, 26 Jul 2021 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lbwi38DDQolKOdWMh2b8WokaPQFGMypPPeb5Ex6B7k8=;
 b=fxq4JE29KWHO7SMJBD6EDDBmlXsWR9Zp+V69jtg1l2Ggx+1srLVyeBKvZbuRhicat7
 N6q+Vyiti9Ix5fw/86X9Ge01Tq86O+BrRgllx3la2K/1rr8d5Et7rrEyU6hujHx6oUU3
 gulyFZGhbbkIpugGsdLZTNE2nhKPcXRiqOYSQ5lDZ1owcNhe63Xi32xCfic/THnhk+9C
 V15/niHEC2m9V5Z5NyeYR0tvijJ4ohNPgAi7k/H6c0SYzd6O5OrsMMMWUXig54TwE89q
 sQbDx3+7/YNK+UQ3U2Rmb+56smFZ8+lvlevleOw5kIsy4yxGmE6Y4wbbYbDn1FO6Y6yW
 DPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Lbwi38DDQolKOdWMh2b8WokaPQFGMypPPeb5Ex6B7k8=;
 b=jq7hM4PY8Pwfr1xnHM4LVu3jBb8mdAki8EGHeKBF1ffsVBD+blZTAfQBNFnQ16CAuM
 EJLs8ZUmhAYFJTmxDOaD4omnOeRyQZvnniClNI35GV8FoX7j59nXImcuD+do+o/3KI0b
 JkqDFc17BFe/m7SMSm3nSz0UYXAudAzNPzQmSkSuKQkHWjDiGbkCRJJgkM/ZoA0VwLDJ
 30NIr32et7Mj9MHUgvWkeeDwJtSW8ok91nx4q4qHgwQYmwsjO8nZLSQQkBLAYoYTjFR0
 J9k2VUIkTq2R2m8yugsOVi1i3oR3Vhvg4Rbx0e3wAGxyXOK3WwEL3nygBCUPBIE9ZqS4
 3J4A==
X-Gm-Message-State: AOAM53348FjJiie627xSMlu7haRJ3w+f177wzDoOo9k7Gp7LIiTDocvu
 Spe4ZlB/XclOxhW0CGgiNLuSNwmEif9Ryg==
X-Google-Smtp-Source: ABdhPJwK9Q2FEPoY+3t9/pnYW2LwipRVKXaRYaiL24OaKboy2BzdDfdJ1kFclOOXgFafkD45HVa4sg==
X-Received: by 2002:adf:de11:: with SMTP id b17mr15900902wrm.403.1627312195187; 
 Mon, 26 Jul 2021 08:09:55 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id h9sm44262wmb.35.2021.07.26.08.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 08:09:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/nseries: Display hexadecimal value with '0x' prefix
Date: Mon, 26 Jul 2021 17:09:53 +0200
Message-Id: <20210726150953.1218690-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/nseries.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 906c915df78..af3164c5519 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -692,7 +692,7 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd, int len)
     default:
     bad_cmd:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: unknown command %02x\n", __func__, s->cmd);
+                      "%s: unknown command 0x%02x\n", __func__, s->cmd);
         break;
     }
 
-- 
2.31.1


