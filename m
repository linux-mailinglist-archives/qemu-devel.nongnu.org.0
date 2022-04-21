Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3307D50AAE3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:41:42 +0200 (CEST)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nheYX-0008Pk-97
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWW-0005mz-0Y
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:36 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWU-000733-HC
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:35 -0400
Received: by mail-pl1-x630.google.com with SMTP id d15so6588710pll.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GkOVLKdXxegKlp83Sy1ujnBKWFv4qJCtgt4Rfj9+MPw=;
 b=nc03PdL52tYfUTR+LCnT1e4b3FEsXqlXbhDg9L0rj4DVSU2ExnaVJbq8N/hdOoFEUb
 yHTEforn2/3sIXUGl9/kY1qRQ1tAKsrCtFVoDE7EtgU3D0qBeejsadYrV3YjQzkqFKos
 l4SM20hLF7PpSX4BFm8Y4zb2ti9UqA85CtM/HwmCtlsFOvN2X/dVJi+YsQp8v6d1Hnwi
 qelKsYsVUYZLkyrGsjBGRgCivkBdKMLo/JKW6MGxyacq7JHOA7I4PDtGxiONpT2Zt+Xf
 QfE/T1jbLbFsLIjTZX5jXWjm9L3lA9vtQVY/a3nTBhULCY/oWgY2blgVCSV+8dXIcgeR
 HBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GkOVLKdXxegKlp83Sy1ujnBKWFv4qJCtgt4Rfj9+MPw=;
 b=Uaz29TSdT5tizsoan9atQ7kiG2Hlz8NbDqBktNhu7yP0b1EvsdNIX5CpKWwX/WKoFG
 BIhCl8DTG3Zo13ZxMc4edpITP8O26QkendWFUCPjoaLvtiLwFHbPMql0uB8a8RSJFUoO
 pzZsuS8ktCPFHDp2/FveoaqtgKOz52STyph1EdTN+K4LYbeehOF5RcYgEnNcoW21lBoA
 g2m0R+EgCrorV1tP3G4Fimntle24Ql+3ih3dbwi6xItXDkCOi143W3aNMN0nHLk+hJaP
 tFmCQX9LHeMUkkoH17XGEVSTWyLEwEVsMbmfLTySiJIUxOFY7X10qzDWNPWqNnRlVe56
 nElw==
X-Gm-Message-State: AOAM532KGqqLlvgLGDiTt7AOP4Ny6VapnQk/XqqDyZBNcofzEkbkTlHw
 dDYuxhF5y5Q6LkH7GiNFUoPOXmnaVJl91A==
X-Google-Smtp-Source: ABdhPJw+vc019jhTwOedNV7PVENnxD8LoOEkzQObfKHsGY3wzWTsXCW9xuZtqfdLbU2k6HdoMd4OYg==
X-Received: by 2002:a17:90a:72ce:b0:1cb:6ec7:cd61 with SMTP id
 l14-20020a17090a72ce00b001cb6ec7cd61mr12718123pjk.213.1650577172817; 
 Thu, 21 Apr 2022 14:39:32 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:df13:3d47:8c92:6576])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b004fac0896e35sm73977pfi.42.2022.04.21.14.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:39:32 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] target/xtensa: use tcg_constant_* for TLB opcodes
Date: Thu, 21 Apr 2022 14:39:14 -0700
Message-Id: <20220421213917.368830-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421213917.368830-1-jcmvbkbc@gmail.com>
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dtlb is a boolean flag, use tcg_constant_* for it.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 77d2e1303746..82a0dbf46d7c 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1710,10 +1710,9 @@ static void translate_itlb(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    TCGv_i32 dtlb = tcg_const_i32(par[0]);
+    TCGv_i32 dtlb = tcg_constant_i32(par[0]);
 
     gen_helper_itlb(cpu_env, arg[0].in, dtlb);
-    tcg_temp_free(dtlb);
 #endif
 }
 
@@ -2050,11 +2049,10 @@ static void translate_ptlb(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    TCGv_i32 dtlb = tcg_const_i32(par[0]);
+    TCGv_i32 dtlb = tcg_constant_i32(par[0]);
 
     tcg_gen_movi_i32(cpu_pc, dc->pc);
     gen_helper_ptlb(arg[0].out, cpu_env, arg[1].in, dtlb);
-    tcg_temp_free(dtlb);
 #endif
 }
 
@@ -2253,10 +2251,9 @@ static void translate_rtlb(DisasContext *dc, const OpcodeArg arg[],
         gen_helper_rtlb0,
         gen_helper_rtlb1,
     };
-    TCGv_i32 dtlb = tcg_const_i32(par[0]);
+    TCGv_i32 dtlb = tcg_constant_i32(par[0]);
 
     helper[par[1]](arg[0].out, cpu_env, arg[1].in, dtlb);
-    tcg_temp_free(dtlb);
 #endif
 }
 
@@ -2564,10 +2561,9 @@ static void translate_wtlb(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    TCGv_i32 dtlb = tcg_const_i32(par[0]);
+    TCGv_i32 dtlb = tcg_constant_i32(par[0]);
 
     gen_helper_wtlb(cpu_env, arg[0].in, arg[1].in, dtlb);
-    tcg_temp_free(dtlb);
 #endif
 }
 
-- 
2.30.2


