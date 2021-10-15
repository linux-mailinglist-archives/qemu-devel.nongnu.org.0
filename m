Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9109542EC86
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:37:09 +0200 (CEST)
Received: from localhost ([::1]:48514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIiB-0000xa-L2
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyS-0002F7-AC
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyO-0004OX-Mh
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6744682pjb.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hFiPe5kmzK+mNMnbtOK8iz6abHX4p2dtrZdth579Gp0=;
 b=d1aT/vjjSgi9L+iCaLhR7OkXB0MZnoxql4XT2Ks+wkL9ZRdA3O0GR0Uixk4/X6WHq7
 RJkt3Elss82tNC/48zjuvn2E1hEAnOF2MMUk5Ldvgrku5E1NRS09MBbI5a5sLQHQIfQV
 NkslfHSlkGoOw9fI+hXTP2Prs5BfJkT4fgzXboi2uL/MneXY4Kz6uqg6VPyT7ZjDADEv
 T67FD8ORnrF2r8pR/IVbdYZG65EKwCTKaQfcL1aomRCV1sd4PiOuxWOkv3ecnFgkFYYx
 X817tpr1eHLx5Sd8YuCxvjGZCMoNI81RH/J5Oc/k2cFU2p5Edo0AAXWfWtVLZqqKTvJb
 H6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hFiPe5kmzK+mNMnbtOK8iz6abHX4p2dtrZdth579Gp0=;
 b=UaM1I2UxlDR8N5cCgc7/qSjaoXxy+R/f6W6WIIMQB0zO15taYqrnQm7POcCpQqovrU
 pfqNLqUake9TqJ8AiLFZ3UymFJCaOZjSOaKvsxi6bNKg4fCQ7n4VISRWp25n2dWpMsud
 Unvu/5s4+f1GxC7PANjCyFjQ9oHD/RnODC/4eMVYbKp96IeMxIJFu87CUXm+q01NUqEF
 0APtLsQtfgslkbi4yQHlA+Tr+vwaggLfdlzV8ckPNYO9hssFMJ2RM48E8OT8ths/8V1M
 FG0HuW79l8FosfDcAT2ipDA/kSi01N6DXwrFI3IRQI/l0cNApLDrAEDm592oKB67O0x9
 yAww==
X-Gm-Message-State: AOAM533Vx5FR1dxV3x+o2iZUTuB2PuwVRVlkcAkaM7HNavUrzvQFIY6y
 5CEmCz5o3RmbpnPQIb+6qX9IkbO6f8YpHIkn
X-Google-Smtp-Source: ABdhPJyCHl62BegcJ/MywiEyBGBBAGNN7ZUNPBZW4QJT37C4WTBGj3eH42nf2Pn/6TfB+oD9d/FEZQ==
X-Received: by 2002:a17:903:31c2:b0:13c:9de8:d314 with SMTP id
 v2-20020a17090331c200b0013c9de8d314mr9712985ple.1.1634284187339; 
 Fri, 15 Oct 2021 00:49:47 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:47 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 49/78] target/riscv: rvv-1.0: mask-register logical
 instructions
Date: Fri, 15 Oct 2021 15:45:57 +0800
Message-Id: <20211015074627.3957162-57-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 target/riscv/vector_helper.c            | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2fe8f4a3c2f..e59fc5a01d8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2651,7 +2651,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
 #define GEN_MM_TRANS(NAME)                                         \
 static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s)) {                                   \
         uint32_t data = 0;                                         \
         gen_helper_gvec_4_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 71d7b1e8796..f883fdf4749 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4231,7 +4231,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
                   void *vs2, CPURISCVState *env,          \
                   uint32_t desc)                          \
 {                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;          \
     uint32_t vl = env->vl;                                \
     uint32_t i;                                           \
     int a, b;                                             \
@@ -4241,9 +4240,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
         b = vext_elem_mask(vs2, i);                       \
         vext_set_elem_mask(vd, i, OP(b, a));              \
     }                                                     \
-    for (; i < vlmax; i++) {                              \
-        vext_set_elem_mask(vd, i, 0);                     \
-    }                                                     \
 }
 
 #define DO_NAND(N, M)  (!(N & M))
-- 
2.25.1


