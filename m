Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200AC545B91
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 07:20:34 +0200 (CEST)
Received: from localhost ([::1]:58840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzX4T-0007Bj-5R
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 01:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxr-0003KP-J5
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:13:48 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxp-0007ah-Ii
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 01:13:42 -0400
Received: by mail-pg1-x533.google.com with SMTP id 184so7820963pga.12
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 22:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2ge7bZK9xSY2snc2hjPAO9/G+RG135skC2HfVo1UCA=;
 b=cWa4SJp2oi9+diMwf1lLdbJL8vkBb38akECZaz/bjFSUB7KyZfgubD3lyxJ1I7OtDN
 /6pFLILnsl7sfbkiy5eN1DzGyAqEFRhrsxFjbmOJTQ2orqE2zvfaP3536q8IuZK+FY8Q
 1HdPCXX3SC+QBbsxiiWBtRnXu9F15CLd5p1NmzN4iZoyzHAk5Ln7Egzl2qU5TGVj+2Yj
 lMiL7hX47QehAwBrsgLaFT7Yrqngo1KNeIv2YhcXp6FIjMaE/pcStOR92fpe5MjBIrV2
 LAhKYVhcmRw1V68b4d5SSIBt5l7uBqYmYRMVkd1ZPQK/sgokt2oLFaHhs3EROSnJMppX
 H+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V2ge7bZK9xSY2snc2hjPAO9/G+RG135skC2HfVo1UCA=;
 b=V1m/RhxiEDAq5J+aQywzbWej3H+Mf+HCVKLlpGPVBj9iCu5VgL5WlXI2mt2YNt2ifr
 +/g6fPbEHvkW4f7htm9DOiMyA1cCFT279emRQuxu2ODXT/Cr/g4giEgQ0sSQHIpkBZ5Y
 lLFLVEvBvybIYr8w05gNyJKgoOJUfz4eRvx41z/4M/e5Y0gxtBrf3oPxVDMTm1NnxEU2
 F9sF1QtNeR6yGYugDCsT/VRypdB4se+YpmO9dLlxG4QbLB4pVxxtrSxuPk0UzIu0hoFV
 vs+XKCkbb0q+mTi5sxnGD7GwHeIFaLLEuAorAYc2i53uD0AMCT5P0ZVNc9dPDp2pzT3F
 7pyA==
X-Gm-Message-State: AOAM531BDM19KukQG7Qj8nn3p0oBT2MHGTHb9SkQ73cBEN1xj1undCpl
 3d6WTCyJMmXQHMRU3B+aF9UDsIVAGeoBCQ==
X-Google-Smtp-Source: ABdhPJyOIIvHgn9pCjF8E6l59Qug0LjsfIIw/LPyoUhG4qaJXeBoedUvQmR8UFZLigawA5f9w18VLw==
X-Received: by 2002:a05:6a00:b8b:b0:51b:eefc:7fd2 with SMTP id
 g11-20020a056a000b8b00b0051beefc7fd2mr33919186pfj.74.1654838019796; 
 Thu, 09 Jun 2022 22:13:39 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:13:39 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/9] target/riscv: debug: Introduce build_tdata1() to build
 tdata1 register content
Date: Fri, 10 Jun 2022 13:13:19 +0800
Message-Id: <20220610051328.7078-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610051328.7078-1-frank.chang@sifive.com>
References: <20220610051328.7078-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Introduce build_tdata1() to build tdata1 register content, which can be
shared among all types of triggers.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/debug.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index abbcd38a17..089aae0696 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -94,18 +94,23 @@ static inline target_ulong get_trigger_type(CPURISCVState *env,
     return extract_trigger_type(env, tdata1);
 }
 
-static inline target_ulong trigger_type(CPURISCVState *env,
-                                        trigger_type_t type)
+static inline target_ulong build_tdata1(CPURISCVState *env,
+                                        trigger_type_t type,
+                                        bool dmode, target_ulong data)
 {
     target_ulong tdata1;
 
     switch (riscv_cpu_mxl(env)) {
     case MXL_RV32:
-        tdata1 = RV32_TYPE(type);
+        tdata1 = RV32_TYPE(type) |
+                 (dmode ? RV32_DMODE : 0) |
+                 (data & RV32_DATA_MASK);
         break;
     case MXL_RV64:
     case MXL_RV128:
-        tdata1 = RV64_TYPE(type);
+        tdata1 = RV64_TYPE(type) |
+                 (dmode ? RV64_DMODE : 0) |
+                 (data & RV64_DATA_MASK);
         break;
     default:
         g_assert_not_reached();
@@ -490,7 +495,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
 void riscv_trigger_init(CPURISCVState *env)
 {
-    target_ulong tdata1 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
+    target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, 0);
     int i;
 
     /* init to type 2 triggers */
-- 
2.36.1


