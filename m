Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFB5367A4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:45:53 +0200 (CEST)
Received: from localhost ([::1]:39550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufuC-0006rM-4I
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefS-0001fQ-At
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:34 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefO-0005Iy-34
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:33 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 cs3-20020a17090af50300b001e0808b5838so5047223pjb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ClqLPoIZ/41OrD+vo7PYhFvrA5CSJiS7v7bUYNtgnOA=;
 b=TNGCWNRi9He2JoVf+1xnwZQ5tGir4jH9jE7GqkKpIJL2Tq5BdMG9Ll2st0gI6ufMkw
 JR3Hrus8Wd7qutXf4lkdXs5S3IZrFNcr2wL1fNn1RLcczzINWe5eCoQphbRwvdhM2Mcs
 4oKivISs4usLvvSDxB5ZBH0uiBZIapc1yGjn/cQUlPujyILA9JGEc3B5NdFIzhiov32y
 TVVBxxR08whkFUgbW6AlDksi2O319g6d9foOUm93+LkqgGSq83sj69l++oE80BEYSgis
 RIP2xjZfyw0BwQ2miLDGU/tJIEyz3ju4GNJkDfsWu46KB3WKJJLYyJdlsX0YYbaD6HPs
 1eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ClqLPoIZ/41OrD+vo7PYhFvrA5CSJiS7v7bUYNtgnOA=;
 b=R8Inqy6MmuFwoCfQm8RN8umnuaOXt0eqApZQ5OtIiOsME5ocCQLG1rnMTBOiQxehIx
 J4erPDBtlwXQzLVlzDhGuW72eRk5R6g+YbMH76VKi4El4yhexS7JnMPkj/5lgrN5pwTb
 dH4Ixv7H55lf6NNfheeLG2MsqZdYE6Du4VE4MSI//xW3tDjdOJMJJmToAwjVeeORBANL
 Z/RX2OtEWeI4ty0FVECKp9WIIXP5PFa5Bm0D8W8dKhryjsOvnxmbrPjNX18oUlVooIlB
 omB50kr8bnQaiStkmJmypCCymzb14AL54EurGOO/dhtG32+GqjIzkr5GrRxGEtm3k3WA
 QYWg==
X-Gm-Message-State: AOAM531tRHPQYg9oSPRke5hgby7v54BFmFMhofmkmemxSpjcjIB0r+sL
 KDRdWR42JiFlzrwapdxj/vawSodrdZ4hxA==
X-Google-Smtp-Source: ABdhPJxMsfBbUoOKtXu01wFzPN3dDflLc+y8Quol091xBEq5SVwFGQmIlrkBbKsbZFJxt+06+tJNOQ==
X-Received: by 2002:a17:903:41d0:b0:161:bec6:b33b with SMTP id
 u16-20020a17090341d000b00161bec6b33bmr44201864ple.21.1653675988934; 
 Fri, 27 May 2022 11:26:28 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 086/114] target/arm: Use TRANS_FEAT for DO_FP3
Date: Fri, 27 May 2022 11:18:39 -0700
Message-Id: <20220527181907.189259-87-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 61bf5f5757..d596e7a027 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3799,14 +3799,11 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
  */
 
 #define DO_FP3(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)           \
-{                                                                   \
-    static gen_helper_gvec_3_ptr * const fns[4] = {                 \
+    static gen_helper_gvec_3_ptr * const name##_fns[4] = {          \
         NULL, gen_helper_gvec_##name##_h,                           \
         gen_helper_gvec_##name##_s, gen_helper_gvec_##name##_d      \
     };                                                              \
-    return gen_gvec_fpst_arg_zzz(s, fns[a->esz], a, 0);             \
-}
+    TRANS_FEAT(NAME, aa64_sve, gen_gvec_fpst_arg_zzz, name##_fns[a->esz], a, 0)
 
 DO_FP3(FADD_zzz, fadd)
 DO_FP3(FSUB_zzz, fsub)
-- 
2.34.1


