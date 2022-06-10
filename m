Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD27D546A96
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:38:06 +0200 (CEST)
Received: from localhost ([::1]:58632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhe9-0002BT-Sj
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB2-0007jQ-Gu
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB0-0007H9-Ph
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:00 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q15so29093597wrc.11
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ryrG+j/r0HSHzLTslEo6BO2UcHKwPzaUEpMCEFxJuwI=;
 b=LdZ9qQBNbI+Rwqq1NnuBLKHMfdDetrnMJL3gE0H0QWlEERB8BSLP+Fkyo1vuP/24pe
 C8uMXCTYyu71B9Ye3G30T9MGAm/9IJVR24+7MizBcZzBeGvQLuhgv8twRk5TF805hMlJ
 ABo+Jye1BqG95oOTfP8gsI+3hbjFlxdwimWCqB9ETduvwoDOTkUVgZmuxVZkakIA54E8
 f3ngJ92C5Dc3YQ7y7hh1dzeS3SuJa72DIU1a01DYcqZM5ocTU2zwCMYWIlh8X0rLfQwW
 YEW0cfWG6D0PFOirZB0Ku0b7v6c+owxDr19suv/t8oxCjRes7sq0ms0rlvenrdxuOR54
 YVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ryrG+j/r0HSHzLTslEo6BO2UcHKwPzaUEpMCEFxJuwI=;
 b=3iSCVaEtN7W2WbflrwSXrKNOyiQRxuHJmDA9PydzRhNVdLs1UUXKKxJAgTYpXiRPo9
 V49QjzgarTKBBwVw09M55MzSAVee4Nbig4cab8ETmGyL2AE8PuEog+qJmQHsRjqe/CNC
 RnXPClVWrIeFYk1nIUNyq+DuJN9YsTHMddDZYBzEOGs/jmkCck1pRiG+w9TB3ZrbiaRc
 HcMxOzfEsy9fn0KtkWANpF3Yd29xDN0ONPxe9VCZUtfVqlnFyXynXsHzWK4JIX5EZYSk
 5cqDQ2dU7UmiYjVKbKMafe6FjFBs+8ifV5/oQrS7wZpVK1d7YZMPZU20lvVCTHiUy4PW
 EV3g==
X-Gm-Message-State: AOAM531xgvR66bA/0yVhtuxWVzhNd4rID7Ng9HxlBRtECiG5luQGaxxG
 9z1ajwup5xZVj2P4Cj0OIY4MDNnkAVOJ6g==
X-Google-Smtp-Source: ABdhPJxp0vbyGRr3EMkTb4e+d/tmcJYcV+wUwYFef7+vDbwaGFjRCGpTnujRA89uRNyGnE/G9GSaqA==
X-Received: by 2002:adf:f20d:0:b0:214:c726:ce76 with SMTP id
 p13-20020adff20d000000b00214c726ce76mr37900567wro.649.1654877275788; 
 Fri, 10 Jun 2022 09:07:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/28] target/arm: Introduce gen_exception
Date: Fri, 10 Jun 2022 17:07:27 +0100
Message-Id: <20220610160738.2230762-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Richard Henderson <richard.henderson@linaro.org>

Create a new wrapper function that passes the default
exception target to gen_exception_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-18-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index edb7d3f3944..5a48937eded 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1093,6 +1093,11 @@ static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
                                           tcg_constant_i32(target_el));
 }
 
+static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
+{
+    gen_exception_el(excp, syndrome, default_exception_el(s));
+}
+
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
@@ -9758,8 +9763,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                             default_exception_el(dc));
+            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
@@ -9828,8 +9832,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                             default_exception_el(dc));
+            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-- 
2.25.1


