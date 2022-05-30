Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D5C538634
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 18:38:39 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviPe-0005qh-NM
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 12:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvR-0002nx-Mg
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvQ-0007Dj-0s
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u3so15268882wrg.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Tyo1dX0e4/krx9e2lZTj/NtBJ5C9VYnXtfROtdBV5QY=;
 b=Ipaf3GmqmaiQzngcm+e12oElQxrbPtFWA8y5+I1gD7CK+HlmUh+ArKE/SSHgI3IxHZ
 4jqOwMgYulWRqsTiwnpEVNe79kAkWzaqLGgsjexEj1zXrnCWhBL17YVggGHKoEwjXV1g
 dOBVG/5U/RK9kWWioaMAf+5ZAMa4RJdV7YYgfx4ELzK1NwZ02Bs/3l+ILZnwgLBSuADj
 2HpGzxix0uIoTzgcTZZINgUC23vS0vkkfkOq74dgPc0U0w7gwIVnHoQopTNQbD+YLDUE
 q+5k1IJ+7Gc4Y0MhVmThK8dVI1X810Lsxo1AUzOn47FZNFlE9i+TWUq9f4gg1yjt0nWt
 N1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tyo1dX0e4/krx9e2lZTj/NtBJ5C9VYnXtfROtdBV5QY=;
 b=XuPfJ/gxdnNBcVu0PbmbCBJy1u6zsWASXeWlTNiZhEuq9BLwaNtMBPzEa6dMu2ifbe
 4ebcDVIGqhrHIzu+6wp7wf954DlaXqtpa/HCQ1tIb5DKPcwjWIPfv9oVG2jTIM8VXdEv
 QZmVj+6o9mQtqjpiZL7OyI+TSNIATHxBRFwjtQmGJHQs9jmwdJpZKYfSECrdxWzQFRIn
 XDgGD77djlK4cl+U9ER2/L69bU1A5uFBlaVW6/WtKxiiDV3oIs9y7XtTH/u9LKVNDzuk
 0/Sxnfwv6cgxPhtcb3s33Jy5tKDnTCm+nUCSeiZ7R3sOtNeuf+E15pBGylgXYgFCnSCw
 m/fQ==
X-Gm-Message-State: AOAM530ye7/VXmzxIYhBcwf1F9bb0as6GuM7PPMSv0BGtu1qBN11zQwd
 BdZwkVP/Iah5rTlel00WCwYKjkbMlR2ayg==
X-Google-Smtp-Source: ABdhPJylFNzPN5d5JjiunCx2z0I8BqfS0i/jBAfkY1+7o0qzhzdjgDdpRjWKnkCtSKBU9LihJ79mFA==
X-Received: by 2002:a05:6000:1b8d:b0:20c:d372:f07c with SMTP id
 r13-20020a0560001b8d00b0020cd372f07cmr47050648wru.607.1653926842588; 
 Mon, 30 May 2022 09:07:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 015/117] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzzz
Date: Mon, 30 May 2022 17:05:26 +0100
Message-Id: <20220530160708.726466-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Convert SVE translation functions directly using
gen_gvec_ool_arg_zzzz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-13-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 47 ++++++++------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cae6df705a4..f7367a4f62c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8302,37 +8302,15 @@ static bool trans_FMLSLT_zzxw(DisasContext *s, arg_rrxr_esz *a)
     return do_FMLAL_zzxw(s, a, true, true);
 }
 
-static bool do_i8mm_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
-                             gen_helper_gvec_4 *fn, int data)
-{
-    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzzz(s, fn, a, data);
-}
+TRANS_FEAT(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_smmla_b, a, 0)
+TRANS_FEAT(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_usmmla_b, a, 0)
+TRANS_FEAT(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_ummla_b, a, 0)
 
-static bool trans_SMMLA(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_smmla_b, 0);
-}
-
-static bool trans_USMMLA(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_usmmla_b, 0);
-}
-
-static bool trans_UMMLA(DisasContext *s, arg_rrrr_esz *a)
-{
-    return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_ummla_b, 0);
-}
-
-static bool trans_BFDOT_zzzz(DisasContext *s, arg_rrrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzzz(s, gen_helper_gvec_bfdot, a, 0);
-}
+TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_bfdot, a, 0)
 
 static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
 {
@@ -8343,13 +8321,8 @@ static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
                              a->rd, a->rn, a->rm, a->ra, a->index);
 }
 
-static bool trans_BFMMLA(DisasContext *s, arg_rrrr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzzz(s, gen_helper_gvec_bfmmla, a, 0);
-}
+TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_bfmmla, a, 0)
 
 static bool do_BFMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
 {
-- 
2.25.1


