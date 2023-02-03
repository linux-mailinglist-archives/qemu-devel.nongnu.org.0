Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA9E689BA7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx5S-00085Y-46; Fri, 03 Feb 2023 09:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4d-0006lB-Qc
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:56 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4a-00057e-85
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:55 -0500
Received: by mail-wm1-x32a.google.com with SMTP id u10so953230wmj.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BhearbGMg07ixmxcVta7913JfgZva0wWKZfBDKaes20=;
 b=p7NvEgSosXD4LYrwXJ4g74fQ+yZQPaezsBGjT2jGQNfO2d35npqIJ5Uu8KKwRSpXIC
 fsSedcPm4NT0bdd+h9OaXUoHGRN3gS4mLNvwawhpHHy2yVMEL88NKbEZs5EZi5dF/l6L
 /403ZexQ4/gZ9FssTW+djsXO2PdWsrAcj/92eoCCNqvPXWihyRG+m4CMDY3zQSiEulaE
 42EDysb4MGQBjsqIZE7/zWWx4Gklb52iZyYOwtIjQRi6uIxfiqs73fEfyzF4lNKBR/na
 DN+z7ue5zmhNGqjH1vGhQHQmCQDFSXmI7lnYau1hFVpTB5lBCmvMO9mql5wxQtvkdVaT
 zAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BhearbGMg07ixmxcVta7913JfgZva0wWKZfBDKaes20=;
 b=KFldb80Tu3kEsrjY8kS/07sBlWu6IsryeSuz3X4zG17vk6G1SpKJAv7gA20LvjbPkm
 wuOsNeNfyR0oSxYLoq9pkWQaG7ZGaU1xxzJN+StUX3WccTjfof/5JobgZZFCQoJbSk4M
 IXUXVNc2qGunCMhsiGNSDN8P18QePDckyDoxsc5WUKUxX3O42L69klwKVKF6nOCk7D9o
 rRzf1E9ShzATRO/CRGOpxAjyaXsqaYbRv8NNmUTse0AHzC2XzufJVoENVzULYWA6EnZw
 sOa7v5BybaayLN/JvtCqmv3rpm4/79UFqIlh7U0iJnXmkFlwawCVlJqWmvAzq266NTyt
 E/fg==
X-Gm-Message-State: AO0yUKU+YknsSD77SFviGn/OY02603hao1172937ifj2LVyqNIaCDkFj
 TF2wAMGa8XMYM/AksIssRGSMhQ/Z24DszORE
X-Google-Smtp-Source: AK7set+nBXMGKj/0n3AcB56hzkZm1rib3k9E4TUBvYBJYSFujlFj1MK77V9fhlWTS190TfyOPk1lPw==
X-Received: by 2002:a05:600c:1c81:b0:3dc:5987:fe9 with SMTP id
 k1-20020a05600c1c8100b003dc59870fe9mr10183749wms.2.1675434589544; 
 Fri, 03 Feb 2023 06:29:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/33] target/arm: Mark up sysregs for HDFGRTR bits 0..11
Date: Fri,  3 Feb 2023 14:29:18 +0000
Message-Id: <20230203142927.834793-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Mark up the sysreg definitons for the registers trapped
by HDFGRTR/HDFGWTR bits 0..11. These cover various debug
related registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-15-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-15-peter.maydell@linaro.org
---
 target/arm/cpregs.h       | 12 ++++++++++++
 target/arm/debug_helper.c | 11 +++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index fef8ad08acc..7c4d07ed9c6 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -622,6 +622,18 @@ typedef enum FGTBit {
     DO_BIT(HFGRTR, ERRIDR_EL1),
     DO_REV_BIT(HFGRTR, NSMPRI_EL1),
     DO_REV_BIT(HFGRTR, NTPIDR2_EL0),
+
+    /* Trap bits in HDFGRTR_EL2 / HDFGWTR_EL2, starting from bit 0. */
+    DO_BIT(HDFGRTR, DBGBCRN_EL1),
+    DO_BIT(HDFGRTR, DBGBVRN_EL1),
+    DO_BIT(HDFGRTR, DBGWCRN_EL1),
+    DO_BIT(HDFGRTR, DBGWVRN_EL1),
+    DO_BIT(HDFGRTR, MDSCR_EL1),
+    DO_BIT(HDFGRTR, DBGCLAIM),
+    DO_BIT(HDFGWTR, OSLAR_EL1),
+    DO_BIT(HDFGRTR, OSLSR_EL1),
+    DO_BIT(HDFGRTR, OSECCR_EL1),
+    DO_BIT(HDFGRTR, OSDLR_EL1),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index cced3f168d0..b106746b0e1 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -672,6 +672,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_MDSCR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
       .resetvalue = 0 },
     /*
@@ -702,6 +703,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "OSECCR_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_OSECCR_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
@@ -717,16 +719,19 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
       .access = PL1_W, .type = ARM_CP_NO_RAW,
       .accessfn = access_tdosa,
+      .fgt = FGT_OSLAR_EL1,
       .writefn = oslar_write },
     { .name = "OSLSR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL1_R, .resetvalue = 10,
       .accessfn = access_tdosa,
+      .fgt = FGT_OSLSR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.oslsr_el1) },
     /* Dummy OSDLR_EL1: 32-bit Linux will read this */
     { .name = "OSDLR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
       .access = PL1_RW, .accessfn = access_tdosa,
+      .fgt = FGT_OSDLR_EL1,
       .writefn = osdlr_write,
       .fieldoffset = offsetof(CPUARMState, cp15.osdlr_el1) },
     /*
@@ -763,10 +768,12 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 6,
       .type = ARM_CP_ALIAS,
       .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_DBGCLAIM,
       .writefn = dbgclaimset_write, .readfn = dbgclaimset_read },
     { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
       .access = PL1_RW, .accessfn = access_tda,
+      .fgt = FGT_DBGCLAIM,
       .writefn = dbgclaimclr_write, .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
 };
@@ -1127,12 +1134,14 @@ void define_debug_regs(ARMCPU *cpu)
             { .name = dbgbvr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
               .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGBVRN_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]),
               .writefn = dbgbvr_write, .raw_writefn = raw_write
             },
             { .name = dbgbcr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
               .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGBCRN_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]),
               .writefn = dbgbcr_write, .raw_writefn = raw_write
             },
@@ -1149,12 +1158,14 @@ void define_debug_regs(ARMCPU *cpu)
             { .name = dbgwvr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
               .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGWVRN_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgwvr[i]),
               .writefn = dbgwvr_write, .raw_writefn = raw_write
             },
             { .name = dbgwcr_el1_name, .state = ARM_CP_STATE_BOTH,
               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
               .access = PL1_RW, .accessfn = access_tda,
+              .fgt = FGT_DBGWCRN_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.dbgwcr[i]),
               .writefn = dbgwcr_write, .raw_writefn = raw_write
             },
-- 
2.34.1


