Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105B942EC8D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:37:59 +0200 (CEST)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIj0-000355-3q
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyM-00029G-QF
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:46 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHyL-0004M7-BR
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:46 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so8800910pjw.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YE6GU3EgdqLfh6XtDoPgH6ClC3r3aGQSWUDP080hnKE=;
 b=S4a3ivMeiIuWzoL02rmNmZB4zIl55mNT+JbtBlIMRt1L2OiSAfNPtfhpG4AR8RUs6c
 4K4JqX/MLmuJAUk3rjgCP7k9yDlEUeJDQuVo8LClFlNS4oDi/6olUzCPfO/jGOEvxeAK
 OwU1N7hZp+aUhVegpc9vf8endWRcGLza5Ulzb7I2vU+eZItxLyHExTnr+ePs2DSJ+G9E
 p+rFNi/ROnca7KlQkQ/ysYyRngW0Mx6cBuPoL9s4mLj70smA1pzXJkyLhZkGxcmlccQA
 u1N7UZ8w70mBQdUKpO7BxVwY+5zl5uczIRL8dwm5x4UwLGDLM3zUE27rN+/oA1iGOk/X
 MLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YE6GU3EgdqLfh6XtDoPgH6ClC3r3aGQSWUDP080hnKE=;
 b=evpEFqh6s8w4CU3ULN3YFUfSsR3M+BVusIVXd4O/d33wACPzI8x5wGTYzKRtkaJoy0
 LNVe2azHZF98+ntupdTaIaAVLRHkZYoql7dTy3EFLvFHM+vjoT+FX8XwfHfG4b0Wf7BZ
 FvXXGWZ96gSqsGP3S4hDwEcGFnAJJNFFLuy8Poj0HfX3FyR1Z+B9NsrAHC2hkoSFB8ZZ
 UqIHyfItLOc1X7W1GTsUTREpOJ8C2jsHYwO6TdGW027ZdKyIqHhS5ItArUL55gvIGvci
 TzFMVIAjt/8f5NvpjnFAu+l8WAdhcF3f9R0XB0De5poPvJnxMju/H6jmMb9YVtZ9xlUj
 /ZHw==
X-Gm-Message-State: AOAM530hqXrxakg1Xudzu1bAnhrXFZfSpqGcrcfD5NAySBG2R42Zqx9F
 sdf6pyo7ckVLXwN43VuMA1/t4noV0Qye2U5Z
X-Google-Smtp-Source: ABdhPJyvhF8NymJhZRpTHlsNZUCddnHA1rsRIIdyFS+raVAHkCl36nZjFyyGJnO86h0aGg3f1Vahtw==
X-Received: by 2002:a17:902:ec82:b0:13f:663c:87cc with SMTP id
 x2-20020a170902ec8200b0013f663c87ccmr9732263plg.24.1634284184008; 
 Fri, 15 Oct 2021 00:49:44 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 48/78] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Fri, 15 Oct 2021 15:45:56 +0800
Message-Id: <20211015074627.3957162-56-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
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
 target/riscv/vector_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 277a5e4120a..71d7b1e8796 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3710,8 +3710,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -3723,9 +3721,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3738,7 +3733,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -3749,9 +3743,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
-- 
2.25.1


