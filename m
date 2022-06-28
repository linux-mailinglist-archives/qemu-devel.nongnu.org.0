Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B4E55BE41
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:48:53 +0200 (CEST)
Received: from localhost ([::1]:46732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o639g-0006Pd-7E
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k0-000277-9H
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:20 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jx-0003l2-Ap
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:19 -0400
Received: by mail-pg1-x532.google.com with SMTP id q140so11014780pgq.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=etMuVHeaAxa7UcmLEv5W86A71baIUw+lp8OsVjYF6WM=;
 b=puj1I9y/VtHkwVJGHxevoTOBp1e2q2AntNADVlFiTKf2CkV7X5+wD8Kf7Aq+Hji1HS
 JXWepixmwfbIJsYQUyN/6+2VttmQ2dJtwy9F8Kj4l1h8k0/WrlsGxt0s/8nAvXwXaatJ
 o3Tu8LOaTqAjCpl3iWFAuKPrCMNK9Lvh4M6cXi8lz/ynUs/25mXJcTITWzEuSaMlHc6p
 YKP8BYJS3kSW0k1yQ0OGWjF/wmmwTfJRBbCom7SWs4oenBcGm553MVkynQJpaaqJajaL
 UoEaM4vpgo0jCZSZ4NjH1GfNUZOoxBvYIHlDX2wMZSI0yZVvoLdys6N/aEOY+X/cjhpY
 +Kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=etMuVHeaAxa7UcmLEv5W86A71baIUw+lp8OsVjYF6WM=;
 b=1oWyhaxI0TK/JAAjPdg995BKpm/eZqJoZUSxNc/3j9iHfNSoITlbyhAfgzKwrFeGXy
 xfzfJHjdSsiOIrGXrSgxABW/HiEun8DdGxUZpjb9XKUKgOJTfiufggDRo55qsBTBRpkX
 OKSKXRIHBZ6uShvul9VQd8W5Pj0kr/18YrVSDeQqSuDIsMd57NMe713LYmscrCbn2Een
 7bazeavb/fqCBTUZ/BkrLQWoTTq8ZYK67b+aSSD7ss3zRmYT2LlTGM/m25cveT5lqtAm
 j3WnmHPA+n+0znTEDAc0wE0nDHk1pERaO0TVCdwCkeJiKrGocAQbEThm9sKPIfZfd2j2
 1sEw==
X-Gm-Message-State: AJIora/slua1/J3EoBhGjcXqkJmMVUxKuBB4O2JxJOOJ8utjzyj60wmw
 W0U4Mwx4GzTsUCG/KHPMBoDozL8ynLKBzQ==
X-Google-Smtp-Source: AGRyM1tMSlXDEJmaofYfXW3uQOFhMZM6li87nFj6lR9u9M+/pqkGfsAubx+4T0isNERjAtM7fKW2eg==
X-Received: by 2002:a63:3e47:0:b0:40c:fa04:dd6e with SMTP id
 l68-20020a633e47000000b0040cfa04dd6emr15900035pga.224.1656390134643; 
 Mon, 27 Jun 2022 21:22:14 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 22/45] target/arm: Implement SME LDR, STR
Date: Tue, 28 Jun 2022 09:50:54 +0530
Message-Id: <20220628042117.368549-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

We can reuse the SVE functions for LDR and STR, passing in the
base of the ZA vector and a zero offset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme.decode      |  7 +++++++
 target/arm/translate-sme.c | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 900e3f2a07..f1ebd857a5 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -46,3 +46,10 @@ LDST1           1110000 0 esz:2 st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst rs=%mova_rs
 LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst esz=4 rs=%mova_rs
+
+&ldstr          rv rn imm
+@ldstr          ....... ... . ...... .. ... rn:5 . imm:4 \
+                &ldstr rv=%mova_rs
+
+LDR             1110000 100 0 000000 .. 000 ..... 0 ....        @ldstr
+STR             1110000 100 1 000000 .. 000 ..... 0 ....        @ldstr
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index f9846f137f..87bbf9ab7f 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -246,3 +246,27 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
     tcg_temp_free_i64(addr);
     return true;
 }
+
+typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int);
+
+static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    int imm = a->imm;
+    TCGv_ptr base;
+
+    if (!sme_za_enabled_check(s)) {
+        return true;
+    }
+
+    /* ZA[n] equates to ZA0H.B[n]. */
+    base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
+
+    fn(s, base, 0, svl, a->rn, imm * svl);
+
+    tcg_temp_free_ptr(base);
+    return true;
+}
+
+TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
+TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
-- 
2.34.1


