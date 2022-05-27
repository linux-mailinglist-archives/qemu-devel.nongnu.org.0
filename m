Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4934B53675A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:10:35 +0200 (CEST)
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufM2-0007Dr-D6
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecP-0003gy-Iq
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:26 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecA-0004SQ-Fj
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:25 -0400
Received: by mail-pl1-x62b.google.com with SMTP id q18so4794888pln.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=im78Upxg0zk5dU+V0gmuH6hKFndyvPtO+XBJ2vNwYI4=;
 b=nt1X8aHmD4aXJTjIRG6UzHL6ui/OcC1OEMbZ0MySrYj2XTFoCsVvrnyr+eKHRKI5Qq
 q3OMpVYz1tBCqoP89WFeArc7lI6kHTxW7RUR/uOK1rFZ0HsOnQhTIEnUJCxZVe9MF6Ur
 nrMgHKjQZsabJKhIDYsCQxYK/3BfQ0vPAj39cpVGS6d8ZM0SSZJN0OEL/TwfAqKxBYfM
 y2gKSvqO70kkuheottcsJpHjSwnMkrQn0UGCb9kXTC1ou0GvvfH4D9uIoaLvTLkIj9Ax
 +JMPyKOqOurW33JdeYaKRYG49+8MGfSppda+khMKYQ/n743IyANJ4DuemPqXf4Csyuhe
 N0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=im78Upxg0zk5dU+V0gmuH6hKFndyvPtO+XBJ2vNwYI4=;
 b=FwnPBDebGOnTVRKhd6OYSugZcEIbBe78Ha3Mo/V7NSzAkVXcEWBmdPofAX7O1lOj6g
 cQ5AW2/p8FkEeKMstSNQnw0SFKqufTvhiT13CVTSWmNVThWejLOuYTAHgoq7DQKOsr/u
 HCIwWnGoKmtG5G39SIgmPne78WICN1c26BMXqLqy03OPAlmdYR0PCs7FBus53zykH7yr
 qHf92URFaKjJCevlxT4e/Tfc178PVhCfXgYxUv26VKZZtth16nzGA48RZ+kvpYyR2oOF
 8cOC0MMhCJ+Ek6JQiSZ9CaoigBXZ8o5vlfpYGPNEE7tSzFqN3VCKiHAishBMrV50XoW7
 hWbQ==
X-Gm-Message-State: AOAM532mQ1eqZVE1AqOzb+28qC+xcxX/X4RoeEuyiRJhXAhhsQmoNsGz
 W6FolE2yAD9aXNVdHPn6wuiwhaC3t2YjqA==
X-Google-Smtp-Source: ABdhPJx4aEmfzV6IIWOb3aWRapV0nscDSazBNmQQHvXUGE7N7kw4NIO9ZoQhDPOQ6wTnz8C+c+HTDA==
X-Received: by 2002:a17:902:7087:b0:161:88a4:db37 with SMTP id
 z7-20020a170902708700b0016188a4db37mr43916014plk.131.1653675789018; 
 Fri, 27 May 2022 11:23:09 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 065/114] target/arm: Use TRANS_FEAT for SPLICE
Date: Fri, 27 May 2022 11:18:18 -0700
Message-Id: <20220527181907.189259-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 target/arm/translate-sve.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index caa587506c..8eb70fd56f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2658,20 +2658,11 @@ TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
-static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
-{
-    return gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
-                             a->rd, a->rn, a->rm, a->pg, a->esz);
-}
+TRANS_FEAT(SPLICE, aa64_sve, gen_gvec_ool_arg_zpzz,
+           gen_helper_sve_splice, a, a->esz)
 
-static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
-                             a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz);
-}
+TRANS_FEAT(SPLICE_sve2, aa64_sve2, gen_gvec_ool_zzzp, gen_helper_sve_splice,
+           a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz)
 
 /*
  *** SVE Integer Compare - Vectors Group
-- 
2.34.1


