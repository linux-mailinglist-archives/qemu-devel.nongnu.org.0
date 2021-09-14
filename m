Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD940A1DA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:24:32 +0200 (CEST)
Received: from localhost ([::1]:39790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwFS-0007YI-HC
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6N-0001fo-6q
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:07 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6J-0007bc-V2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id k23so7626362pji.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m7emFn9ZXxGGMcBZFosB1EnmF9R96t2zGLMZbzq44mc=;
 b=TurQUQWc7Q7RbRu9vOUwSJR4tkVMweP2LedHj3cvyY24vqCbhU74F1d/P3DGxdTdxE
 mktZzkxj+oUFJPp2sLL6gED+f1q9Tboe4jdFlc0FtwziMdfWd8OxPGb//F6/xoM44i7r
 Gvn6tLpkyZyxrUtPE4FA1sfiLomnDFK4ROyehsjB5UYOPLBTiWMgk4FpSD84zh/dwBKU
 yKVi7ji/DRY5yBWNgF1ph84vgOZ2TKw00h6vQIWtZthF7DJB3X+OMx+H8bwgdZNth7Wr
 EYchxP2J+0a1zj4BYZrlbZy3LH494RJZmiBvEp/m5sJBbxeDHGN3DjPEAhUcS/GctJiR
 GDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m7emFn9ZXxGGMcBZFosB1EnmF9R96t2zGLMZbzq44mc=;
 b=ZVM23yGbPCgNc0kWVxRgg4MrNJVv2y4nZ7sdTBfGJh062NIm3MmUaP5NM3guC2EINq
 kHAX/cf5X886UAfCM7+4Amo1CCQprh8D1vNPWOBgLN0DnDV2qIa4oiNaWAQ5nRrNjWvr
 A62YkxJF392lVcJkHsuf/Xoq4FTMPMkrXNjzQ5kdTEV9+RVNiDoZd9D0dkOBGkpaDpIs
 fsGyU0UnD9WFoLHps5IJQiU0QaSXnrWLKMNdvD5T2sRQdEVpdlosznlKwG7h5X8d4Ou4
 a+7lxD16lHVOeLMfMm1Mm0TGHxz/0sziK/iYRJV/FKtfhCvUfY1KPpdCKSotUrT1WHBp
 wltA==
X-Gm-Message-State: AOAM533pkvBymPEvmkMEEWd2jZheeNDQL+hZHJIXttPVh3uAgqv2qw3/
 4ARsNg7JPjDh6OyQ0ffk+IPoE476SFWQZw==
X-Google-Smtp-Source: ABdhPJzht1z43cLidLnYotz4eadLFJYV/fNdtH3l436h3w72dmBvv4eIXvZgN08pYh6Mrl8CIGGhTw==
X-Received: by 2002:a17:90a:ef0b:: with SMTP id
 k11mr1893929pjz.209.1631578502618; 
 Mon, 13 Sep 2021 17:15:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/44] tcg/ppc: Replace TCG_TARGET_CALL_DARWIN with _CALL_DARWIN
Date: Mon, 13 Sep 2021 17:14:18 -0700
Message-Id: <20210914001456.793490-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If __APPLE__, ensure that _CALL_DARWIN is set, then remove
our local TCG_TARGET_CALL_DARWIN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e0f4665213..2202ce017e 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -25,8 +25,8 @@
 #include "elf.h"
 #include "../tcg-pool.c.inc"
 
-#if defined _CALL_DARWIN || defined __APPLE__
-#define TCG_TARGET_CALL_DARWIN
+#if !defined _CALL_DARWIN && defined __APPLE__
+#define _CALL_DARWIN 1
 #endif
 #ifdef _CALL_SYSV
 # define TCG_TARGET_CALL_ALIGN_ARGS   1
@@ -169,7 +169,7 @@ static const int tcg_target_call_oarg_regs[] = {
 };
 
 static const int tcg_target_callee_save_regs[] = {
-#ifdef TCG_TARGET_CALL_DARWIN
+#ifdef _CALL_DARWIN
     TCG_REG_R11,
 #endif
     TCG_REG_R14,
@@ -2372,7 +2372,7 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 # define LINK_AREA_SIZE                (6 * SZR)
 # define LR_OFFSET                     (1 * SZR)
 # define TCG_TARGET_CALL_STACK_OFFSET  (LINK_AREA_SIZE + 8 * SZR)
-#elif defined(TCG_TARGET_CALL_DARWIN)
+#elif defined(_CALL_DARWIN)
 # define LINK_AREA_SIZE                (6 * SZR)
 # define LR_OFFSET                     (2 * SZR)
 #elif TCG_TARGET_REG_BITS == 64
-- 
2.25.1


