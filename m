Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15D05386B0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:20:21 +0200 (CEST)
Received: from localhost ([::1]:32772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj40-0006hL-SJ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwF-0003qo-CY
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwA-0007MD-RS
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id q21so4089541wra.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SRfsh9/+yXCD5jUQIGsKMcU3hZ/ekrvMQwtiv+KkcFk=;
 b=ujQCyAmi4fJVD4dJIP+ZMLXpesCmkk0totjYTb3kKum22CNSwQkX6jnVaxVLmGTBkx
 pavztesEPWQ2g0tRGkT6twoQLfjiJSwustwfwp6//w7GcKPG1/dWZD6s56ZmWW2FbDfl
 T7AA/spjxwv2RTmcj0EU4nq2+UX38cJSjzO7IUsePZZql0/RtDF7XCPErNZzohYajaUU
 D75MA+VrMpF+vBLbLtj+0nAqqOxUwgHRVBoS4n6xzbwhZLNp80YfJgJ6m125QJUpGU1b
 8oJMG5y3jvd6uN5hiPOze2qgyFkSlisopf9qEaLowp/ZkAS94Py7RRrXziXLa0iw44I5
 +OqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRfsh9/+yXCD5jUQIGsKMcU3hZ/ekrvMQwtiv+KkcFk=;
 b=MqwhUT8QEmR+UcouShKmKDwr7gY3KVxXL8fcBt8ajb8bHo5oAKIbMyQbJydKjiSyqi
 WRQ3CLHWqJrYiEsQa6thF3jh1Lq0sBsxy5Q7hVKZohMQQFjxKpjbR4Bk2j8/5aL7AwyJ
 xEqc2deAoBPI6D04q11hDpyMl6vVtYcoCMnQtkapm4AwLrGrVcRI+4NrLSkHiQNO0xRO
 NV5PTVv4E+zStjtb3Sgg5GS8I7RBT7GiJwZeu25gF41Yj9Y8u/XPVzfbqEstxf0Lopzs
 Vrr55R3FjoTr1jLroTdOdnIkF9quHhUMfbEu31NkWtn/8Sjl/2jNzc/0TO0pj7hDq/GE
 q01w==
X-Gm-Message-State: AOAM5309q3pgrFaq2+WG5eMNdMnD8ZihJmbfZo9Q1UkM7+0TRujx+Fa8
 f9l27IyMnDMHKC+VtlvVwH7t/fxeDTTw/Q==
X-Google-Smtp-Source: ABdhPJyVHq3kO4WYUoOAxv3RyyHRI6xQnDkq4QThpXMdqGCuL/ait6i2qJOEKbYJ9CHz6GrQaKSG+A==
X-Received: by 2002:adf:e0c3:0:b0:20c:5672:9577 with SMTP id
 m3-20020adfe0c3000000b0020c56729577mr45681556wri.466.1653926889475; 
 Mon, 30 May 2022 09:08:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 061/117] target/arm: Use gen_gvec_ool_arg_zzz for do_zip,
 do_zip_q
Date: Mon, 30 May 2022 17:06:12 +0100
Message-Id: <20220530160708.726466-62-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-59-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c2ced3e2bb1..75c52d8ce1e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2293,16 +2293,10 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
         gen_helper_sve_zip_b, gen_helper_sve_zip_h,
         gen_helper_sve_zip_s, gen_helper_sve_zip_d,
     };
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned high_ofs = high ? vsz / 2 : 0;
 
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        unsigned high_ofs = high ? vsz / 2 : 0;
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, high_ofs, fns[a->esz]);
-    }
-    return true;
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, high_ofs);
 }
 
 static bool trans_ZIP1_z(DisasContext *s, arg_rrr_esz *a)
@@ -2317,18 +2311,13 @@ static bool trans_ZIP2_z(DisasContext *s, arg_rrr_esz *a)
 
 static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
 {
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
+
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           vsz, vsz, high_ofs, gen_helper_sve2_zip_q);
-    }
-    return true;
+    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_zip_q, a, high_ofs);
 }
 
 static bool trans_ZIP1_q(DisasContext *s, arg_rrr_esz *a)
-- 
2.25.1


