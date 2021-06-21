Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EAE3AEFB8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:39:38 +0200 (CEST)
Received: from localhost ([::1]:36130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMxV-0001dR-Cy
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmx-00070J-48
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:43 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmu-0007Te-0W
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id w13so4316482wmc.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PqO2tfm/fXn5751DDoxxGt2P/gDrTGh7qNXdOpilhkc=;
 b=Lp+ZbsO2HRqzlvFdFsccmrdRowRLVBU6sGBvGjQNMIH3TWgLlGxylCzykRAfHP/gmM
 GIskIZsSe42B0igiyutUi+BcUEui9DnCJ/aD3NYT2QEhHyv4+uKbDa3vMx0NmIpqmIBX
 QdsDRQJoUjWgNdAbEsumV5Fq/V78Y9+TLRwCvsa7gOyEBNZv/UFlUxSRcs+Ks7NytaSD
 Q1ypPFszTomTQJCiNU/uV5E13xlpkKXqQjNCtHKrpp1QrpoeVmS5eqhSJsEICJNUWM2F
 hYuPo/z92XMynWsmZf3arNulh5KmnZFNMP7zLUNRvrk7SSsTJtAXEP5BUHsR3bHMokfM
 B+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PqO2tfm/fXn5751DDoxxGt2P/gDrTGh7qNXdOpilhkc=;
 b=aD1LO8R4jvib3pZZU0WB/rk2V3ErU9H8iJxRbTdXrdza2XrU5AlPV6nGehVi1lu3tr
 mF/hQj3+OmYWJJ/ov5rCMv6xH1ukZxovAMRK2+o9ZL4FrcPHJ7vARMHN9AWeDHKtqfpW
 Zv4BDFCfQeEeMyBZLQ9eW/y7PV95A1VyQWDanFw4yr9gka91k2owtE0LZt5PIXdNYYr+
 bzb/Dvjma09wEcheVWMgynJFx911w/LGSJdEJ7RlDO1YwyKi1/iXlo1bF8h016SI5MYc
 YN8N8p5KQtgwlURRM7JzFSgWr7pK9x3qzVKgzFGOFyhl+yPjN1e8a6QVcKSmMdT9d8Az
 NwOQ==
X-Gm-Message-State: AOAM532xRsvuF7nRlZMhREqrYPJ3y/THu4FO8l2B6dzRNbIhQwelD4+f
 3+VTWjhM17tH68I4hlM0KCGkDG6SD3YlN+pe
X-Google-Smtp-Source: ABdhPJwwNzPpFq0Xc5sjrdqgjweFUGXSM+l76uYV1+bwGqFWx05PdbDKxjsp5kKO6R6cyGmmpEbVDw==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr28571447wmj.128.1624292918664; 
 Mon, 21 Jun 2021 09:28:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/57] target/arm/translate-vfp.c: Whitespace fixes
Date: Mon, 21 Jun 2021 17:27:41 +0100
Message-Id: <20210621162833.32535-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the code for handling VFP system register accesses there is some
stray whitespace after a unary '-' operator, and also some incorrect
indent in a couple of function prototypes.  We're about to move this
code to another file, so fix the code style issues first so
checkpatch doesn't complain about the code-movement patch.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210618141019.10671-2-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 01e26a246d6..5a4a13ec1e1 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -771,9 +771,8 @@ static void gen_branch_fpInactive(DisasContext *s, TCGCond cond,
 }
 
 static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
-
                                   fp_sysreg_loadfn *loadfn,
-                                 void *opaque)
+                                  void *opaque)
 {
     /* Do a write to an M-profile floating point system register */
     TCGv_i32 tmp;
@@ -874,8 +873,8 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
 }
 
 static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
-                                fp_sysreg_storefn *storefn,
-                                void *opaque)
+                                 fp_sysreg_storefn *storefn,
+                                 void *opaque)
 {
     /* Do a read from an M-profile floating point system register */
     TCGv_i32 tmp;
@@ -1207,7 +1206,7 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
     TCGv_i32 addr;
 
     if (!a->a) {
-        offset = - offset;
+        offset = -offset;
     }
 
     addr = load_reg(s, a->rn);
@@ -1242,7 +1241,7 @@ static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque)
     TCGv_i32 value = tcg_temp_new_i32();
 
     if (!a->a) {
-        offset = - offset;
+        offset = -offset;
     }
 
     addr = load_reg(s, a->rn);
-- 
2.20.1


