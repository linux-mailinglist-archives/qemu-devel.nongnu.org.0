Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B338568269
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:04:51 +0200 (CEST)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90xl-00076o-7N
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LA-00060e-Bk
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:56 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90L6-0000PU-S7
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:55 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 v4-20020a17090abb8400b001ef966652a3so5142449pjr.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3fycTpR631CAyDn0p7xxlDZ9oFm740riIb23T+ghRkc=;
 b=GkfpssZ3zDqg3a2hEsIIUnMan3aEYwz0l+ZG8gYBuXNobkfxMOLo4SmeK92tLQ218i
 1b6RLycoN5u/BryOhh7+vmbieDN/twcdUmyH3aWardqGV5vWm+XZ2nndcSeIh2Y+HZrW
 FopuesK7mJ8M6RebWkA66PTfgurKpfo+XG5TJ2AYxVeeYLI9kQNtQesZCXKrT4RjNS73
 65QBswAvBob3eFpE6ce2L8mPbmdrLINcD5tUAYVpcYRbi3RX8UG8BsFG10H+AbYcYy61
 rCE+pB9+BZ57t7QJTxAnYX3zOZTkTEWU8NqoYWkh+ttIkZTaPVvyo4Cihv6fREQtPSk5
 7liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3fycTpR631CAyDn0p7xxlDZ9oFm740riIb23T+ghRkc=;
 b=AKhCg3ONaJUN45zHBpaNIkQuE/sosWNrG8D/Adx2dUH15YRWDshW+vyUZ7GyHqzlFa
 RF4XYjpOKgFbIK4D53rp988r+g6klU0bh/t10zANT/I27jfbVuGu+NA+0ICQIZJx1qFM
 k8pwHQejjuNR3aQKtBa1i5BTey2cPd6sj4ixzezbqt8ap84KBZOA9GhmLdkNlyHOZ1OL
 kw/YBw1AwSlhVwT69O6hBGWRNxq06J3qvd6lHUiPWXOzdGA2mRKY/w0dGUXSB4uAV8Iu
 +3ZtY9JSmA76V/5Yes7jwPacQI3oK8QGwklJTrvAbZJkdisXC9x3oYFrjqI0Wq4e7wA6
 /8sw==
X-Gm-Message-State: AJIora+xClYguGcV2OKQ7tE+UgOYTF2VnV6bgBbVpEbi89vMfdVkcFU/
 3XCc8GUNIvLm1Ui1hreTbV+lDvZG5ZFUFMgi
X-Google-Smtp-Source: AGRyM1vkX5zX7vHsxd2gp58TCEuvXWwANYHgbZwtLFoN0liwY51kroh03i42d3rxWOiXiIvuElFo/A==
X-Received: by 2002:a17:90b:343:b0:1ef:b65d:f4d8 with SMTP id
 fh3-20020a17090b034300b001efb65df4d8mr1902757pjb.187.1657095889488; 
 Wed, 06 Jul 2022 01:24:49 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 13/45] target/arm: Mark LDFF1 and LDNF1 as non-streaming
Date: Wed,  6 Jul 2022 13:53:39 +0530
Message-Id: <20220706082411.1664825-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 2 --
 target/arm/translate-sve.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 7d4c33fb5b..2b5432bf85 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,5 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
-FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
 FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bbf3bf2119..5182ee4c06 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4805,6 +4805,7 @@ static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
@@ -4906,6 +4907,7 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> dtype_esz[a->dtype];
-- 
2.34.1


