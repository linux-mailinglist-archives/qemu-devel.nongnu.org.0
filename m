Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3D342EC45
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:27:33 +0200 (CEST)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIYu-00016Z-GI
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxW-0000WQ-Od
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:56 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxU-0003ax-2S
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:54 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 lk8-20020a17090b33c800b001a0a284fcc2so8780292pjb.2
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJHejLyCCOoN2Nwf/HlTIWR091SAoLWmPXvvdNf286Y=;
 b=dCqTg/BYS5zvNt+obClp4Y7FUvv6mWCjbNfJjw5u7nkmPmaMVVEnFcOXGTz1EGsS1w
 235ptZZNY0+tQWblK7xkyLDNLGWkSI1KvCyIxikQB4mH3yzWyF4s/uWWu/nVufsuaIyx
 AMsVyJ3jzJ91Xs+s7tBoT9NVYUkn7tvUCxNHFgw5vV6+t9gO1B5VQF7VBrE0KxAwmi90
 +6QInizC3EvUQX5YlWZ8oqfdKgfcB7i8fdDSsRYp4vDuIz37t5/Va76ByGcOxKvQHtne
 dNy2AjCooAQouYp76uumT/nt8/XstiKlO9heE8N9yR4x9ah0E9Fc8/BiMU9f28vGYAm9
 IclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJHejLyCCOoN2Nwf/HlTIWR091SAoLWmPXvvdNf286Y=;
 b=fxQv5DBcSsJWZidQV0NhETra0NcpYCny+QBbpuWKu0tu0oOmg3iGiOHsoHm0LPjDGr
 3jIM6XV98G1aKuHbhpG+Afv6Zpl1DwsnDF1HQhHSz3H/wMIfh38MVtAVC05TfFbU8Ogk
 nN91c5FMzqpAftpLhrtMYUTKf6nRmDwi2VyfJLYV8V2x7N9EZywBYusvUrnAbQ/PbRZA
 0t/i5fXcVoqIvDADX1/UbjGuEMbyYs/c2EeKUA6QdoG4AHbZqX/8ErgNd09oH20xhYRZ
 ja87r24we74Jpks+N2z+MHLypz2zj692nv6WQL0Xv0nccYzbFNpCn4vwi5jfEMlOK8oI
 u+4g==
X-Gm-Message-State: AOAM5317tPcuVmtOdxQCp8sy4paSHuGN7Jd1ZFzqsElCQtB+whdiLZFi
 QH1XAmiVMHlZEmY0vRfcVrr4YE0A50U1rjP9
X-Google-Smtp-Source: ABdhPJxxX59jmYfeb2EWxnpMcE6sezWnvN34juxjd3gyGJvgqU9+OC4kCFMg+fu+neVZCYCt80bd9w==
X-Received: by 2002:a17:902:ec82:b0:13f:663c:87cc with SMTP id
 x2-20020a170902ec8200b0013f663c87ccmr9729203plg.24.1634284130671; 
 Fri, 15 Oct 2021 00:48:50 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:50 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 32/78] target/riscv: rvv-1.0: iota instruction
Date: Fri, 15 Oct 2021 15:45:40 +0800
Message-Id: <20211015074627.3957162-40-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d139c0aade7..3ac5162aeb7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 538a32a605a..3751496676f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2756,12 +2756,18 @@ GEN_M_TRANS(vmsbf_m)
 GEN_M_TRANS(vmsif_m)
 GEN_M_TRANS(vmsof_m)
 
-/* Vector Iota Instruction */
+/*
+ * Vector Iota Instruction
+ *
+ * 1. The destination register cannot overlap the source register.
+ * 2. If masked, cannot overlap the mask register ('v0').
+ * 3. An illegal instruction exception is raised if vstart is non-zero.
+ */
 static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        require_noover(a->rd, s->lmul, a->rs2, 0) &&
+        !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
         require_align(a->rd, s->lmul)) {
         uint32_t data = 0;
-- 
2.25.1


