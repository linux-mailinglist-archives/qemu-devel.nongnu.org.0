Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB0D354321
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 17:02:27 +0200 (CEST)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQkE-0004Hs-6K
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 11:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHS-0001X6-H5
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:42 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHO-0001qK-A2
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:42 -0400
Received: by mail-wm1-x32c.google.com with SMTP id k128so5809286wmk.4
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WpMshF9WUsdtJUGU8Fhgh+vZmUfhSBfrnYZEgnqW7JI=;
 b=EdhxKA1Wj6QWKGJeY4DsStDw21VO1nBbX+MdXrg1iqcvW7nEs3djHL5UngqgGikjaE
 hy9veL/tdrVez9Ntx6ef+fS96ueY6AJp0ZJzOeEM7nt4DUhPRk/5f1KaBgOlWznoSAre
 hZ6on1zgwr/QpTq0t+N+57C28bAWRLOuhI+m2FOCDIY6VdJaY0/MdREM0VlevSDsIQMu
 oP0qcydOmP0pbky4nG1DE8zDwlAjCbgp3Lm611iMwfIw+emkHuwsKZZYf3k1GEOWvVlE
 m9JvTzWVPjAN5wrcZQKjU8FY0zltsvdH4Z9AAGdQGiZ8wsRBm+kZM9RSR6GQBtrwyoUM
 wVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WpMshF9WUsdtJUGU8Fhgh+vZmUfhSBfrnYZEgnqW7JI=;
 b=idcyfcWoWqkVAf+r1Y8X3UMZzmNEaiY4Z04QyxyljRYp4/pvNLlKJDGStY0hs1QNme
 ieG7DnCWALUeU5/yy/+5dqs/qbVIVnADUkIt1FqvRxndz76fVehkOUFGDimo3c301GNw
 DpLSnsT6XThLBDtwfBQBy5b5D70ryXVGgu+GhcNAPwouURp3AjobnZV+NTW2EqUpqseE
 u9BbEuB6MiklcqIAyxW7E3Z2NSLsflGbvLoCSxw+Yhg7MtdEqBxtdgfMHY8HsRhawP4R
 YbFMO8sq/npAvX2lKg/Pnf0Oe62wG+ind1i6j5mR0EUvLQgYTpOlF1FRBbOlTFmrUEIV
 Vk3Q==
X-Gm-Message-State: AOAM531YhIF8QeGylvb7B/r/RAtaD93tXqajQVO7l4kMp0Katq8LwS5r
 4PNdiounz/U1kh/K29k5OzUF5PVHiYEEwg==
X-Google-Smtp-Source: ABdhPJzA+Mk3Z0Rt2/rdSs+Fz9/m9gSqLvvU/Yu0/IaGPs85UCVNLSSgCWwUsoKMMQthsHSRWpJlTg==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr25229205wmk.53.1617633154541; 
 Mon, 05 Apr 2021 07:32:34 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:34 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 23/27] arcv3: BCR and AUX register changes
Date: Mon,  5 Apr 2021 15:31:34 +0100
Message-Id: <20210405143138.17016-24-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 target/arc/regs-detail.def | 40 ++++++++++++++++++++++++++++++++++++++
 target/arc/regs-impl.c     |  5 +++++
 target/arc/regs.def        | 20 +++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/target/arc/regs-detail.def b/target/arc/regs-detail.def
index 6f0cc94809..48b26d6cb0 100644
--- a/target/arc/regs-detail.def
+++ b/target/arc/regs-detail.def
@@ -39,8 +39,10 @@ DEF(0xa,   ARC_OPCODE_ARCALL,  NONE, status32)
 DEF(0xb,   ARC_OPCODE_ARCV2,   NONE, status32_p0)
 DEF(0xc,   ARC_OPCODE_ARCv2EM, NONE, sec_extra)
 DEF(0xd,   ARC_OPCODE_ARCV2,   NONE, aux_user_sp)
+DEF(0xd,   ARC_OPCODE_V3_ALL,  NONE, aux_user_sp)
 DEF(0xe,   ARC_OPCODE_ARC700,  NONE, clk_enable)
 DEF(0xe,   ARC_OPCODE_ARCV2,   NONE, aux_irq_ctrl)
+DEF(0xe,   ARC_OPCODE_V3_ALL,  NONE, aux_irq_ctrl)
 DEF(0xf,   ARC_OPCODE_ARC700,  NONE, bpu_flush)
 DEF(0xf,   ARC_OPCODE_ARCv2HS, NONE, debugi)
 DEF(0x10,  ARC_OPCODE_ARCV1,   NONE, ivic)
@@ -75,6 +77,7 @@ DEF(0x23,  ARC_OPCODE_ARCALL,  NONE, limit0)
 DEF(0x24,  ARC_OPCODE_ARCV1,   NONE, pcport)
 DEF(0x25,  ARC_OPCODE_ARC700,  NONE, int_vector_base)
 DEF(0x25,  ARC_OPCODE_ARCV2,   NONE, int_vector_base)
+DEF(0x25,  ARC_OPCODE_V3_ALL,  NONE, int_vector_base)
 DEF(0x26,  ARC_OPCODE_ARC600,  NONE, aux_vbfdw_mode)
 DEF(0x27,  ARC_OPCODE_ARC600,  NONE, aux_vbfdw_bm0)
 DEF(0x28,  ARC_OPCODE_ARC600,  NONE, aux_vbfdw_bm1)
@@ -116,6 +119,7 @@ DEF(0x41,  ARC_OPCODE_ARCV1,   NONE, aux_macmode)
 DEF(0x42,  ARC_OPCODE_ARC600,  NONE, lsp_newval)
 DEF(0x43,  ARC_OPCODE_ARCV1,   NONE, aux_irq_lv12)
 DEF(0x43,  ARC_OPCODE_ARCV2,   NONE, aux_irq_act)
+DEF(0x43,  ARC_OPCODE_V3_ALL,  NONE, aux_irq_act)
 DEF(0x44,  ARC_OPCODE_ARCV1,   NONE, aux_xmac0)
 DEF(0x45,  ARC_OPCODE_ARCV1,   NONE, aux_xmac1)
 DEF(0x46,  ARC_OPCODE_ARCV1,   NONE, aux_xmac2)
@@ -126,7 +130,9 @@ DEF(0x4a,  ARC_OPCODE_ARCALL,  NONE, dc_ivdl)
 DEF(0x4b,  ARC_OPCODE_ARCALL,  NONE, dc_flsh)
 DEF(0x4c,  ARC_OPCODE_ARCALL,  NONE, dc_fldl)
 DEF(0x4d,  ARC_OPCODE_ARCV2,   NONE, dc_startr)
+DEF(0x4d,  ARC_OPCODE_V3_ALL,  NONE, dc_startr)
 DEF(0x4e,  ARC_OPCODE_ARCV2,   NONE, dc_endr)
+DEF(0x4e,  ARC_OPCODE_V3_ALL,  NONE, dc_endr)
 DEF(0x50,  ARC_OPCODE_NONE,    NONE, hexdata)
 DEF(0x51,  ARC_OPCODE_NONE,    NONE, hexctrl)
 DEF(0x52,  ARC_OPCODE_NONE,    NONE, led)
@@ -191,13 +197,17 @@ DEF(0x100, ARC_OPCODE_ARCALL,  NONE, count1)
 DEF(0x101, ARC_OPCODE_ARCALL,  NONE, control1)
 DEF(0x102, ARC_OPCODE_ARCALL,  NONE, limit1)
 DEF(0x103, ARC_OPCODE_ARCV2,   NONE, aux_rtc_ctrl)
+DEF(0x103, ARC_OPCODE_V3_ALL,  NONE, aux_rtc_ctrl)
 DEF(0x104, ARC_OPCODE_ARCV2,   NONE, aux_rtc_low)
+DEF(0x104, ARC_OPCODE_V3_ALL,  NONE, aux_rtc_low)
 DEF(0x105, ARC_OPCODE_ARCV2,   NONE, aux_rtc_high)
+DEF(0x105, ARC_OPCODE_V3_ALL,  NONE, aux_rtc_high)
 DEF(0x200, ARC_OPCODE_ARCV1,   NONE, aux_irq_lev)
 DEF(0x200, ARC_OPCODE_ARCV2,   NONE, irq_priority_pending)
 DEF(0x201, ARC_OPCODE_ARCALL,  NONE, aux_irq_hint)
 DEF(0x202, ARC_OPCODE_ARC600,  NONE, aux_inter_core_interrupt)
 DEF(0x206, ARC_OPCODE_ARCV2,   NONE, irq_priority)
+DEF(0x206, ARC_OPCODE_V3_ALL,  NONE, irq_priority)
 DEF(0x210, ARC_OPCODE_ARC700,  NONE, aes_aux_0)
 DEF(0x211, ARC_OPCODE_ARC700,  NONE, aes_aux_1)
 DEF(0x212, ARC_OPCODE_ARC700,  NONE, aes_aux_2)
@@ -273,10 +283,15 @@ DEF(0x408, ARC_OPCODE_ARC700,  NONE, tlbcommand)
 DEF(0x409, ARC_OPCODE_ARC700,  NONE, pid)
 DEF(0x409, ARC_OPCODE_ARCALL,  NONE, mpuen)
 DEF(0x40a, ARC_OPCODE_ARCV2,   NONE, icause)
+DEF(0x40a, ARC_OPCODE_V3_ALL,  NONE, icause)
 DEF(0x40b, ARC_OPCODE_ARCV2,   NONE, irq_select)
+DEF(0x40b, ARC_OPCODE_V3_ALL,  NONE, irq_select)
 DEF(0x40c, ARC_OPCODE_ARCV2,   NONE, irq_enable)
+DEF(0x40c, ARC_OPCODE_V3_ALL,  NONE, irq_enable)
 DEF(0x40d, ARC_OPCODE_ARCV2,   NONE, irq_trigger)
+DEF(0x40d, ARC_OPCODE_V3_ALL,  NONE, irq_trigger)
 DEF(0x40f, ARC_OPCODE_ARCV2,   NONE, irq_status)
+DEF(0x40f, ARC_OPCODE_V3_ALL,  NONE, irq_status)
 DEF(0x410, ARC_OPCODE_ARCALL,  NONE, xpu)
 DEF(0x412, ARC_OPCODE_ARCALL,  NONE, bta)
 DEF(0x413, ARC_OPCODE_ARC700,  NONE, bta_l1)
@@ -497,12 +512,17 @@ DEF(0xff, ARC_OPCODE_DEFAULT,  NONE, unimp_bcr)
 /* Actual BCR implementations */
 
 DEF(0x6d, ARC_OPCODE_ARCv2HS, NONE, mpu_build)
+DEF(0x6d, ARC_OPCODE_V3_ALL,  NONE, mpu_build)
 DEF(0x6f, ARC_OPCODE_ARCv2HS, NONE, mmu_build)
 DEF(0x75, ARC_OPCODE_ARCALL, NONE, timer_build)
 DEF(0xf3, ARC_OPCODE_ARCV2,  NONE, irq_build)
+DEF(0xf3, ARC_OPCODE_V3_ALL, NONE, irq_build)
 DEF(0x72, ARC_OPCODE_ARCV2,  NONE, d_cache_build)
+DEF(0x72, ARC_OPCODE_V3_ALL, NONE, d_cache_build)
 DEF(0x77, ARC_OPCODE_ARCV2,  NONE, i_cache_build)
+DEF(0x77, ARC_OPCODE_V3_ALL, NONE, i_cache_build)
 DEF(0x7b, ARC_OPCODE_ARCV2,  NONE, mpy_build)
+DEF(0x7b, ARC_OPCODE_V3_ALL, NONE, mpy_build)
 
 /* OLD BCR definitions */
 /*
@@ -538,3 +558,23 @@ DEF (0xfc,  ARC_OPCODE_ARCALL,  NONE, vlc_build)
 DEF (0xfd,  ARC_OPCODE_ARCALL,  NONE, simd_dma_build)
 DEF (0xfe,  ARC_OPCODE_ARCALL,  NONE, ifetch_queue_build)
 */
+
+/* ARCV3 definitions. */
+
+DEF (0x7,   ARC_OPCODE_V3_ALL,   NONE, memseg)
+DEF (0x16,  ARC_OPCODE_V3_ALL,   NONE, ic_ivir)
+DEF (0x17,  ARC_OPCODE_V3_ALL,   NONE, ic_endr)
+DEF (0x460, ARC_OPCODE_V3_ALL,   NONE, mmu_rtp0)
+DEF (0x461, ARC_OPCODE_V3_ALL,   NONE, mmu_rtp0hi)
+DEF (0x462, ARC_OPCODE_V3_ALL,   NONE, mmu_rtp1)
+DEF (0x463, ARC_OPCODE_V3_ALL,   NONE, mmu_rtp1hi)
+DEF (0x464, ARC_OPCODE_V3_ALL,   NONE, tlbindex)
+DEF (0x465, ARC_OPCODE_V3_ALL,   NONE, mmuv6_tlbcommand)
+DEF (0x466, ARC_OPCODE_V3_ALL,   NONE, mmu_tlb_data0)
+DEF (0x467, ARC_OPCODE_V3_ALL,   NONE, mmu_tlb_data1)
+DEF (0x468, ARC_OPCODE_V3_ALL,   NONE, mmu_ctrl)
+DEF (0x469, ARC_OPCODE_V3_ALL,   NONE, mmu_ttbcr)
+DEF (0x46a, ARC_OPCODE_V3_ALL,   NONE, mmu_mem_attr)
+DEF (0x46b, ARC_OPCODE_V3_ALL,   NONE, mmu_fault_status)
+DEF (0xc1,  ARC_OPCODE_V3_ALL,   NONE, isa_config)
+DEF (0x6f,  ARC_OPCODE_V3_ALL,   NONE, mmuv6_build)
diff --git a/target/arc/regs-impl.c b/target/arc/regs-impl.c
index 18a307fdc4..d7ae57e8cf 100644
--- a/target/arc/regs-impl.c
+++ b/target/arc/regs-impl.c
@@ -46,6 +46,11 @@ static target_ulong get_identity(CPUARCState *env)
         arcver = 0x54;
         break;
 
+    /* TODO: Add V3/ARC32. */
+    case ARC_OPCODE_V3_ARC64:
+        arcver = 0x70;
+        break;
+
     default:
         arcver = 0;
 
diff --git a/target/arc/regs.def b/target/arc/regs.def
index 5dc3764266..9c0e81d884 100644
--- a/target/arc/regs.def
+++ b/target/arc/regs.def
@@ -410,3 +410,23 @@ AUX_REG (xylsbasey, NULL, NULL)
 AUX_REG (aux_rtc_ctrl, aux_timer_get, aux_timer_set)
 AUX_REG (aux_rtc_low, aux_timer_get, aux_timer_set)
 AUX_REG (aux_rtc_high, aux_timer_get, aux_timer_set)
+
+/* ARCV3 specific registers. */
+
+AUX_REG_GETTER(arc_mmuv6_aux_get)
+AUX_REG_SETTER(arc_mmuv6_aux_set)
+
+AUX_REG (mmuv6_build, arc_mmuv6_aux_get, NULL)
+AUX_REG (mmuv6_tlbcommand,  arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+
+AUX_REG (mmu_ctrl, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_rtp0, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_rtp0hi, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_rtp1, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_rtp1hi, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_ttbcr, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_tlb_data0, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_tlb_data1, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_fault_status, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_mem_attr, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
-- 
2.20.1


