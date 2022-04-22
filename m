Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D1650B5F3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:12:30 +0200 (CEST)
Received: from localhost ([::1]:49660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrDB-0004lv-PZ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAK-0005aL-CD
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAI-0002wQ-PX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c10so10337081wrb.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/Wc2molG4qiAr3BjeYuq/HUxjFtE+KVmYa08eBlI6Z4=;
 b=b35r+kZOGY1qAIN7AHze5z2zuAAtqsN4RtOBlCxZKZ+H2uH4eG+vjGPBgKjM+rfNTq
 49LiT/KH3aCsVNwAm6kCTDyg/uHx11sA321xrFUI9XzjnWqJJqEKGytdEgQceXnbDpny
 lbAK+cEmhX49roo/sxcWKyMlDONFSFvBFf2bWgU+pt+PpCpYyB3LfQQh1zCposvPyB7V
 GcNQIJc67aSz+m0rXGdBvuBe6H2NNkB4+AsovEQjU/fFFro8p2ThFkjVz/aCa6676doV
 XRJByj1rj5Bn5luFy/uvV+iFMIbRKQwhHdlpVhiAiJGiJJDoxjoIVtutJgZ9Ke8RJPmG
 UJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Wc2molG4qiAr3BjeYuq/HUxjFtE+KVmYa08eBlI6Z4=;
 b=jIdfxx9PH+cC+IB/n65Hj6G/NLvrtGC6ds58DI75IJao7jhn+RaW+ZeKvEY4f4sHQD
 ojQCwtzYaS8Rrxu0dUjB70V/t3OTwMz9zT3P/M9HQMqWtqF5z/82jZkLmwHqpMwLbj/S
 DRSsrz9bYrrISlfxDWrCS1f4UlQ9iXfRir5cSlEZU47fDKZ0BzKWSJ6u2e4+HEKjEd5R
 1Iso/Dvo3MfF4ukUOGFpI7fiDjQZRCnSj+uDua1wCj3oXmKYtc6/Gmhsx0dbTehaLfpT
 9JUSlaZ5vSYtNGnnFgXTzxk5PXXKUWeNIv6J9sRLA7ylJeoZ1l8MCfUxDhZZ2yw26ewv
 LOhQ==
X-Gm-Message-State: AOAM531JMo9ItgIMh241ZM6pbwVFqaBivQgOcf41/lWXEqV7lDi3ASrY
 qXo6jFrlNjq9ins+NOhakLV33WY65UbKKg==
X-Google-Smtp-Source: ABdhPJwiaKMvMAUa+Rw2dz/Y1DpnTBugJUjEE8jARF8aFpCl9j82AJnCYl11GhM/HI0n/qteSoekxg==
X-Received: by 2002:a05:6000:1809:b0:20a:cafc:fd39 with SMTP id
 m9-20020a056000180900b0020acafcfd39mr1443525wrh.255.1650621920369; 
 Fri, 22 Apr 2022 03:05:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/61] target/arm: Change DisasContext.thumb to bool
Date: Fri, 22 Apr 2022 11:04:19 +0100
Message-Id: <20220422100432.2288247-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Bool is a more appropriate type for this value.
Move the member down in the struct to keep the
bool type members together and remove a hole.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h     | 2 +-
 target/arm/translate-a64.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8b7dd1a4c05..050d80f6f90 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -30,7 +30,6 @@ typedef struct DisasContext {
     bool eci_handled;
     /* TCG op to rewind to if this turns out to be an invalid ECI state */
     TCGOp *insn_eci_rewind;
-    int thumb;
     int sctlr_b;
     MemOp be_data;
 #if !defined(CONFIG_USER_ONLY)
@@ -65,6 +64,7 @@ typedef struct DisasContext {
     GHashTable *cp_regs;
     uint64_t features; /* CPU features bits */
     bool aarch64;
+    bool thumb;
     /* Because unallocated encodings generate different exception syndrome
      * information from traps due to FP being disabled, we can't do a single
      * "is fp access disabled" check at a high level in the decode tree.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f6303848918..1ae465687ad 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14670,7 +14670,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
      */
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
-    dc->thumb = 0;
+    dc->thumb = false;
     dc->sctlr_b = 0;
     dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
     dc->condexec_mask = 0;
-- 
2.25.1


