Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E906F325C29
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:52:15 +0100 (CET)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUAo-0008BP-Th
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTj8-0001SN-Aw
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:38 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:39913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTj3-0002B4-Hx
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:38 -0500
Received: by mail-pg1-x52d.google.com with SMTP id o63so5402870pgo.6
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zq+WO6dqQdKLzV9SUpnVBHKepWySTwXuRNliVWSbr6I=;
 b=DhY49YUvOovy9pgP/gDR01tK48Qxp32lTSIOXDV7LCF/8Mg3X6/sYq1UCmPUunDn6J
 sPd6mmM+S/mL293Cl8t2mDW8W0k4WyBEJ1QHPGD3njp2sTAGATLJSoDoKCa8hgSPDKbD
 +aP233tA6ZvuQQTtyff6C/rEKZGJkdeNejPsTgmDgCMS+QbjkQPnOiJVD3OhstjEvSGN
 HLUsPqhO1Ty7DxQkjS3qPgSXPeZQEsVbKUoovFDIPKx4gq0KZQYnxseygaAriwRDfmpV
 JyNy/OX58vLjq4w/y/F8NF5SBk9dDSV8virqH+u89xqqc1JKYaGUW/mld90XY23J0APD
 U5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zq+WO6dqQdKLzV9SUpnVBHKepWySTwXuRNliVWSbr6I=;
 b=XTMfKpP7+//t5QG/K6zH1277LVuqzO4QuL3a1rA+mQC4SfmcYbBmLrG9LjmCWw7d/L
 W8Qo+086ohYmCmZImMbw6ym8FrQy1yJSkQVHg9+2LghsQlCtz/tWFKcv9XASJOsYa9CG
 yBlMYYrBgltW2DhCiGPLesZcVGCxbf/X+N15oEf1qIvRpBo+ubyZDgrrtTx9pidKaa3N
 xtHWoAfjMkgDaGq2OpTcP1QfEvaC3Dh/lLdWbUWV6uum5Yy1BazAM/KiurD0O7JVw/AH
 hKWRBII97fyRi/9uWk9TPM1DyKoGyLIpCLzK9L7Ty3jzSB3WDewxRFhcHmHw4hTF3HHt
 Xgsg==
X-Gm-Message-State: AOAM532eJnb4+VKbbJiN3WKQkYSYjuBUawCosJoWN+BJ3a35V8ywwt24
 xc6fVLeqdQCVO/CKIWy6jknPmxBJPTHf2w==
X-Google-Smtp-Source: ABdhPJz0ZWNzUoWm0v/2ED+cgEZN316G6IA5jkqgJu8NeHcse8Ue0XlPpzK5GadCPYtzkB4wY9oX9Q==
X-Received: by 2002:a05:6a00:15d2:b029:1b7:30c1:8495 with SMTP id
 o18-20020a056a0015d2b02901b730c18495mr969026pfu.32.1614309811648; 
 Thu, 25 Feb 2021 19:23:31 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:31 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 46/75] target/riscv: rvv-1.0: integer comparison
 instructions
Date: Fri, 26 Feb 2021 11:18:30 +0800
Message-Id: <20210226031902.23656-47-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Sign-extend vmselu.vi and vmsgtu.vi immediate values.
* Remove "set tail elements to zeros" as tail elements can be unchanged
  for either VTA to have undisturbed or agnostic setting.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 8 --------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 39e2d21da5e..523c6cf7f6d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2038,9 +2038,9 @@ GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
 
 GEN_OPIVI_TRANS(vmseq_vi, IMM_SX, vmseq_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsne_vi, IMM_SX, vmsne_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsleu_vi, IMM_ZX, vmsleu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsleu_vi, IMM_SX, vmsleu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsle_vi, IMM_SX, vmsle_vx, opivx_cmp_check)
-GEN_OPIVI_TRANS(vmsgtu_vi, IMM_ZX, vmsgtu_vx, opivx_cmp_check)
+GEN_OPIVI_TRANS(vmsgtu_vi, IMM_SX, vmsgtu_vx, opivx_cmp_check)
 GEN_OPIVI_TRANS(vmsgt_vi, IMM_SX, vmsgt_vx, opivx_cmp_check)
 
 /* Vector Integer Min/Max Instructions */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e14626b40bb..5622fb23f85 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1399,7 +1399,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -1410,9 +1409,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         }                                                     \
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
@@ -1451,7 +1447,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);              \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -1462,9 +1457,6 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
         vext_set_elem_mask(vd, i,                                   \
                 DO_OP(s2, (ETYPE)(target_long)s1));                 \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
-- 
2.17.1


