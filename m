Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FAC538627
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:33:35 +0200 (CEST)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviKk-0006GM-3S
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvW-0002rf-U4
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:30 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvH-0007Aj-14
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:30 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e2so15314489wrc.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uhQoBBJ/7iTjtvKeEpgab8YkXq728EARbWasfrH6vg8=;
 b=XqSlHNQoyp4RqJKgZZ33cI7BrJQV7ENarKuMSRmMG9kBOXItdqG8dYFnzR/EED28kt
 sg5Y1uYtJhOKJ5lV5C7qpbFoWe2zmyub/1kDV3MrIS3fqncCRNtQQova44jSMAUYiwBQ
 hz6mhw7iIOev4KKdQHzv3CUesjtjx6Ht4IMyunj4JyDB6Pd91Dk6Wd3PHBjNWkcOK0/2
 5A6zOJRSF7QJjiPZfZF7bsERt9OANpJD3Q2UtfN2h/szUUrcwNbiJ1m4145vhkEearYE
 o3K7n2Zd+KuswOyaJhpry6CCa2jgfGO9EfF6qSQzOw03SBWb1QwRu5hpi0j6AiBYLVeR
 n2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uhQoBBJ/7iTjtvKeEpgab8YkXq728EARbWasfrH6vg8=;
 b=xG8ZHUbGn/zSW/SsMJgrGcOyRT3HnBiVLPr6DNb/50Hj2BEv2hJQrBN6TZJCpSM98t
 4a6FF/PeN8NBt3aMmz8zV5BNRsgZQ2txz7NAuEEXtf7tuevI+87V4fTKStJ/ZOPmJsY4
 KzcV1MMhBJbofyyjcVTuDQOGIEFucPz5eX38/Jao7lFNWvvtlxumY9/HfyxO1Ch30Yy1
 fcandDNLK9rUmlBJsbY5lE4aU9FQsoBZuYxiheUbCqbX7H0YozMcHm5DgJsj7pqnb98J
 cXexzzo0dOAKA8z6TSCBlCYrfq2a03/pJQ8tIWnAHENCvHqgJPUSz8XNNEmTXs9iYiM/
 N9/g==
X-Gm-Message-State: AOAM531nVeJAAUacehUugsAS2zlzKhz/a4mnGtFACKaA2783+DM0YLIO
 hU2rX5nvgLJPG6IdZyXwsKh6ZzlrbZVnvA==
X-Google-Smtp-Source: ABdhPJwykZ8Ojhq/2nbVzyOx5xh1BBa+uAcXJ4DyKiTSD7lBST0ojNTYdM7xGXPITKCvtWy/ucazeg==
X-Received: by 2002:adf:e0c3:0:b0:20c:5672:9577 with SMTP id
 m3-20020adfe0c3000000b0020c56729577mr45678404wri.466.1653926833319; 
 Mon, 30 May 2022 09:07:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 004/117] target/arm: Introduce TRANS, TRANS_FEAT
Date: Mon, 30 May 2022 17:05:15 +0100
Message-Id: <20220530160708.726466-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Steal the idea for these leaf function expanders from PowerPC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 6f0ebdc88e5..9f0bb270c5b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -576,4 +576,15 @@ static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
  */
 uint64_t asimd_imm_const(uint32_t imm, int cmode, int op);
 
+/*
+ * Helpers for implementing sets of trans_* functions.
+ * Defer the implementation of NAME to FUNC, with optional extra arguments.
+ */
+#define TRANS(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
+    { return FUNC(s, __VA_ARGS__); }
+#define TRANS_FEAT(NAME, FEAT, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
+    { return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__); }
+
 #endif /* TARGET_ARM_TRANSLATE_H */
-- 
2.25.1


