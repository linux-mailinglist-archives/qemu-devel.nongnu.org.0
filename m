Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3504362045B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:59:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC1d-0005LO-JT; Mon, 07 Nov 2022 18:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1b-0005EO-A3
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:31 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1Z-0003qm-LK
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:30 -0500
Received: by mail-wr1-x431.google.com with SMTP id z14so18523123wrn.7
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QvFVCFU+6/7VpsKGkw+DBrZFOFd7YMLOuvT51dahy9Q=;
 b=GTrLTlGhcKwdhN6duPyMRccHybTd5F2y4baNyuwnv2FHEppeSS7GIeJcBua7Hgm9Ua
 ZZhCGiOkJkTyrSx0odzq+/sBY97Ru726Rh5q+klTEqQ2scINjPvlgERKAu4Bkv6lRWD6
 oMqIfqwGZomJaaS/La/t284mhZEbt/j6pJlRnj0kQ/tL77hnNhBORVAv+M5I/zma9tV7
 AuFZF9Vuk3Pwpp7MyQWQzpo/mBC6RqWbqXyazJuIw6eA27Nzz6yqaMNdTF5+Vo3jNILh
 GhdLnD3YmbMChgp6Y3C+odh110vgEdcuTZQaUecYymQrJWEoYD6H5KrjoJGHyA2bdcbL
 ZFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QvFVCFU+6/7VpsKGkw+DBrZFOFd7YMLOuvT51dahy9Q=;
 b=aJq+yiki6IlqUIGvoonVYlKxVt5H9j3zF2J60J6lsA2DzG1r/LmHfP3KomHyrtU//M
 8zDFJEhbXH1QSgUA1DNCYVAzqRSA/Mjech3FrqOtmVIq9JOqiNgMBypCsy+u6ibgOrgY
 7CDmpamaTzYhax3WXu17kU12HNbVFZB7l1vYEItG3b5Jjb0DpaIIc7pClg5UA8bDkoaT
 5hAmgCEoSl079bvWX6zjtPP3T5215PDmfJ8idmZAiStWyKBt043T+qDNHu8fxKKjyW9l
 Lgi5PLgyjYF0MIXSz4wJtn27SEBv5eQalAggHQAPPL+peoJbvledmvAiv8Sr41zEQG6F
 2P5A==
X-Gm-Message-State: ACrzQf0VcnGcrTNM4n87qNrtEdSiHO7+RD7VP/3pUe7RJbEBr1VZmBI1
 zUcy03MFcQVfgDGaU4+NPgrxUfcK0ybl2A==
X-Google-Smtp-Source: AMsMyM4ylQMmcpF3W0sfyhvwJlD0O49Olg1Bsidd7Idfo37rYABffb8Hgd5WfRVP0sQD96HS3+/Mcg==
X-Received: by 2002:adf:fb12:0:b0:236:f48f:d488 with SMTP id
 c18-20020adffb12000000b00236f48fd488mr19848147wrr.345.1667865568258; 
 Mon, 07 Nov 2022 15:59:28 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o13-20020adfeacd000000b002366a624bd4sm8550069wrn.28.2022.11.07.15.59.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:59:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/14] disas/nanomips: Tidy read for 48-bit opcodes
Date: Tue,  8 Nov 2022 00:58:21 +0100
Message-Id: <20221107235822.71458-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

There is no point in looking for a 48-bit opcode if we've
not read the second word for a 32-bit opcode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221106023735.5277-5-richard.henderson@linaro.org>
---
 disas/nanomips.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 3b998118e3..a0253598dd 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21964,14 +21964,14 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
             return -1;
         }
         length = 4;
-    }
 
-    /* Handle 48-bit opcodes.  */
-    if ((words[0] >> 10) == 0x18) {
-        if (!read_u16(&words[1], memaddr + 4, info)) {
-            return -1;
+        /* Handle 48-bit opcodes.  */
+        if ((words[0] >> 10) == 0x18) {
+            if (!read_u16(&words[1], memaddr + 4, info)) {
+                return -1;
+            }
+            length = 6;
         }
-        length = 6;
     }
 
     for (int i = 0; i < ARRAY_SIZE(words); i++) {
-- 
2.38.1


