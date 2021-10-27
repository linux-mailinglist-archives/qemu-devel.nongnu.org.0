Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A9E43D177
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:12:19 +0200 (CEST)
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoLS-0007Mo-HZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnNI-0006NU-2v
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:10:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnNF-0004tm-Fv
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:10:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id s14so2707416wrb.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0oONdiURWAN4jI2LxqaDt83lwJJMkpLnHcdzTxz66k4=;
 b=b5hcHW+waBkdvPTbl30r+TKxH84mZnmcPE3IZOLWPWMsGjfLUnNEcMJpDFZhlrm6CJ
 2jBlzrtTLbT5mLKYC//gEB9HL3fsFRTZR7r6iskKXiehzfNvTYNboq9N+WKGrAh5yw5t
 7HKVAk6xslTijOuUEstmsSxgTLF2D1c+ORgwnT6EPglmVlKsVTQ7B04TivlIwnc6C1uf
 IVNvPwYh1fhhSgi9iLGWP0RLZvTpCuX43+Y1Zpe8/kq6Cd8fb9LVQ0r5vKbA7DGPNHhC
 0yTG9gxrerQrs+NQsz7IKwdtr5hrELV5E+PPTFgX2eB6v75K38Mny1/sjhul25GX87TQ
 BoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0oONdiURWAN4jI2LxqaDt83lwJJMkpLnHcdzTxz66k4=;
 b=NRoBCv3WVOgx+kP9QA7PZKQ7ccfK360oZF55bZ1dhfV2qzdrb18zaX2s7C2QLx6yQd
 FCsALLphcsBdEiG9rcSzIbQ4wnovyVrBUw6isJgT+MQr2/LU8pgXzjJJ5jctLWm33i69
 aynqInOjTxZ3Mai5IlZzhEIS/sy7qHoGVp2mvD6fJZV2v494yVLqAsIjlVszobp3BBzs
 NSSSJGavG9yV6O5ZLLCqUjKVlhfiFidlbrL2d2YFBZwt4EfHNQSdr4sjar3UfaPKHwWU
 R7urntpPav+2eQOYkgXBlZ45Dssa9eWDjJ+/eViIE0zwVqfJYiGNHR/xcHkcPbrAdZ4m
 lLcw==
X-Gm-Message-State: AOAM530IOouteGknqg4ZpG0vrzJi5EJaUuxfXdfHOLzU1cOk2mx8G2S7
 ZirStXI3aKkDyuzn2LU1RL54h2jqBls=
X-Google-Smtp-Source: ABdhPJywWsLD0zcGBmlzNoRVpz2ufzxaMUeMrhjy8xZwBCaBiR4vg83SPukRngUbc12UUfCXm3wLDA==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr32452187wrw.256.1635358202541; 
 Wed, 27 Oct 2021 11:10:02 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j7sm641617wmq.32.2021.10.27.11.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:10:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/32] target/mips: Adjust style in msa_translate_init()
Date: Wed, 27 Oct 2021 20:07:30 +0200
Message-Id: <20211027180730.1551932-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the first 'off' variable assignment is unused, it helps
to better understand the code logic. Move the assignation where
it would have been used so it is easier to compare the MSA
registers based on FPU ones versus the MSA specific registers.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index ef0e00772a6..f6d4f32248c 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -122,13 +122,15 @@ void msa_translate_init(void)
     int i;
 
     for (i = 0; i < 32; i++) {
-        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
+        int off;
 
         /*
          * The MSA vector registers are mapped on the
          * scalar floating-point unit (FPU) registers.
          */
+        off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
         msa_wr_d[i * 2] = fpu_f64[i];
+
         off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
         msa_wr_d[i * 2 + 1] =
                 tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
-- 
2.31.1


