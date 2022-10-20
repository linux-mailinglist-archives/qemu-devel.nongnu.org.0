Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3EB606BAF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:54:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleQZ-0005vB-J4
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:54:15 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleA3-0007xV-Bj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9v-0007Nw-7V
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:03 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9s-0000yZ-Cn
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:01 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so1041355pjl.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2QyK6qaxKPHmlYeK5hx+cv5ntpv8x7vPZcfjTuC15M=;
 b=tN+e33oIK1n/AvyMDJ8cmjcD45Uj2pPDxosrmE5k9j0nKNmVbi/UMqPyNzVZkWyuK7
 5wtXdvB1kLJwJa6Omkpi220UAueuEZuC0ZxpH9otwFI8ySuYL+1rgBzO+KjB+51emh9+
 /gZeFuLm84MpBVOE/N13TXIGP9l32Uw/qGXrwhmgFrraKN5rPPX5CDTtSGcKxlsJpivY
 aflcoxnURS9PB+iS/CN+qdEOzCKgyysF86lthb9CwIIx6YumqdpLRbpI1Weswe9UTsek
 BGXqO8hesZ5H7wUppw2RcvQf/U+nQIq7IfJLLfnK6MAkXSACCZtsJPsfNPoGPAe5SAD1
 u3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2QyK6qaxKPHmlYeK5hx+cv5ntpv8x7vPZcfjTuC15M=;
 b=DfC2G29W4VWeEG1wIjfVJs5H6iDJuwLEkP5bOFmL4Nu5uthHnYQ+uRGs+2TCQLS0xw
 TAOyXhHfTqp4nMj/HfPx0uMM5WONTBYMYMvlXs5DShcZUJanbgRl1mfbnWExS43U/LhL
 sHYkqFptvZ4tSbO6FlMBjMS2GsxiXd+snViCxGFI8wYn5MnMAE0usfwZ3q0RJecjAIRh
 HHoDLwSwpDm5GX2v7Ri0FT3XONGC2NvPz+6tSqs+mVgKt+AvBscu6+b9xiDZBkGy4yl0
 IBGAeG5+TyBaINF3AYGto4WgEkDoh2jACy3+MP+hI62iraHywmHN4wvm1C4bgTpMgw/R
 pP+g==
X-Gm-Message-State: ACrzQf3sqt4PEhYiHjP+F+FLd2Uu8ZR5Rcq0Yo7lQattmV4nA4I9yFSg
 l7hxIFRWA6GzTVOr6GxAUKaQ7Thi6NapUWiU
X-Google-Smtp-Source: AMsMyM7sNRf0pn+RAiCGza7lO5vxQVEYFl5ZOmsdHZhcEbvBGPLnxuqtDt2NKKojSOPa4cxKoYCSvg==
X-Received: by 2002:a17:90b:4b02:b0:20d:3937:7ad with SMTP id
 lx2-20020a17090b4b0200b0020d393707admr53800341pjb.145.1666305419465; 
 Thu, 20 Oct 2022 15:36:59 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 10/14] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Fri, 21 Oct 2022 08:35:44 +1000
Message-Id: <20221020223548.2310496-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Both GP and DBM are in the upper attribute block.
Extend the computation of attrs to include them,
then simplify the setting of guarded.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6820c2f4bc..cb2e9072ec 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1077,7 +1077,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     uint64_t descriptor;
     bool nstable;
 
@@ -1343,7 +1342,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (regime_is_stage2(mmu_idx)) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1351,7 +1350,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1404,7 +1402,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = guarded;
+        result->f.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (regime_is_stage2(mmu_idx)) {
-- 
2.34.1


