Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED4C5FFF64
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 15:02:18 +0200 (CEST)
Received: from localhost ([::1]:40394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok3HU-00020o-Pz
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 09:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ok33i-0005mK-8r
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 08:48:05 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ok33g-0003Q9-PF
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 08:48:02 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so11943538pjg.1
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5lPrslxA19cuBVAxVr+vfn8Re3zX6DcwoRgt1PP6cQ=;
 b=FWX7dxFr9FaihHl++WXg7hDlEa7e/Vq962XUwIgvuyaQgJ+erMElkKTp0ZLTAk8GC3
 s1x/MMwSEnEj+DuaOSKWCekJQK8GpP7EZFoCkeg5P59a/tvsWKbxMaax/m1hAbe7l961
 DGSk5IDOYCtplhxN+sPzmXosh7bUZEOvOdr5lPsnM8gBIZ42b/Wr+Njj0pmc+JYn303Z
 cjC5eSiaMHX9D/DTA8XnVvp1qGRND28F5r11kVK9/I9XLcF0zTRFj2shiZbyLrCzHFyD
 5nUe++ZDgPk9pSDApByS2FAIPxryAGBUj1B6zsB9fEZhF4qS5RKZFgR3hy5YgJV+tK1f
 wxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5lPrslxA19cuBVAxVr+vfn8Re3zX6DcwoRgt1PP6cQ=;
 b=e1cuzPriYSMRou2QneMRHoP8YMFnemQ5UZLlmXmdGNEsGwFnbWniJz0ATa9NQA/917
 xY3Bb5A14xYv6ulNoGiZc3al2e9yM5XmVq3cqDFjSNCWCxom9V14lQrCGyFBBmnmCc95
 3cNqKjWvwmVAwNREtUMh2R8sUvMLktWwQAWzhybZ+yMr7FwRnSGV4wRZJ+Vhxua2xn3E
 RCFKp0rjQoGANGUDuxiEu3vqYxpY4PLVeFlGBQReddq/GGZSjcHldpdvT98AbsVTeSi/
 QcRXOaWkcsFn/u5HDQa8DC3IvfTD6ZLAy5QsvtXAl692XB/D4xShVLeYPNbPkfMlBKWz
 YXTw==
X-Gm-Message-State: ACrzQf2TJ8pd+cGhcSO0tYv+jbVfnJIg0cDhsGKa1WwQVNNF1P91w1BO
 i+7cQS3AQ4EZjTdhEdrq+Q77dbG8tS6c+Q==
X-Google-Smtp-Source: AMsMyM5AOKDcsV39PLdZ7UCrDKbvTYo5IqqscNQbGM7P4OMRMFchu3RKalhrY4pm3ctTntXZFvtQ5A==
X-Received: by 2002:a17:903:1250:b0:185:40c6:3c2c with SMTP id
 u16-20020a170903125000b0018540c63c2cmr7092921plh.64.1665924479693; 
 Sun, 16 Oct 2022 05:47:59 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com
 ([2401:4900:57ef:25d:3187:d4f6:127:22d3])
 by smtp.googlemail.com with ESMTPSA id
 v18-20020a634812000000b0043b565cb57csm4444894pga.73.2022.10.16.05.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:47:59 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH v11 3/5] target/riscv: generate virtual instruction exception
Date: Sun, 16 Oct 2022 18:17:24 +0530
Message-Id: <20221016124726.102129-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221016124726.102129-1-mchitale@ventanamicro.com>
References: <20221016124726.102129-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1029.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a mechanism to generate a virtual instruction
instruction exception instead of an illegal instruction exception
during instruction decode when virt is enabled.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/translate.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index db123da5ec..8b0bd38bb2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -76,6 +76,7 @@ typedef struct DisasContext {
        to reset this known value.  */
     int frm;
     RISCVMXL ol;
+    bool virt_inst_excp;
     bool virt_enabled;
     const RISCVCPUConfig *cfg_ptr;
     bool hlsx;
@@ -243,7 +244,11 @@ static void gen_exception_illegal(DisasContext *ctx)
 {
     tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
                    offsetof(CPURISCVState, bins));
-    generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
+    if (ctx->virt_inst_excp) {
+        generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
+    } else {
+        generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
+    }
 }
 
 static void gen_exception_inst_addr_mis(DisasContext *ctx)
@@ -1062,6 +1067,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
 
+    ctx->virt_inst_excp = false;
     /* Check for compressed insn */
     if (insn_len(opcode) == 2) {
         if (!has_ext(ctx, RVC)) {
-- 
2.25.1


