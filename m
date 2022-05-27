Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEFD5367F1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:14:46 +0200 (CEST)
Received: from localhost ([::1]:57138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugM9-0000tC-RW
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefW-0001jD-Cr
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:38 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefT-0005Hp-Bj
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:37 -0400
Received: by mail-pl1-x631.google.com with SMTP id s14so4808300plk.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rq70BX8hTMAI6b+cFkI1RRrKLuHgtJvjF5od3jr4Io4=;
 b=d8Dx9zyN5GjhIAOFuEqONCoFcB1Go+sySL9JUtyZxRz2PXkaPBwppQAqDIzRQNcE6W
 PXGnYX4fFyFYHuFu0jIXUX6ZRyd4L+/iI3xnLFvN+9jDOdpsuicxGEd1iUSEbERJO6gy
 mGWT9WSJVp5ayVNKNpH5Mbj75TlKrcfCs9JJ+MiQrm7EA7/W3AzpO4+WHVGnu2Kv1fOv
 eae6tq4/zlTkv7ELJAjFSWEp9cpdbyq4MWw90wWE9pnBQ3XwAsYedohwCruVPet9xV+J
 ka9EhagAWojfB2G2rsbC7EtH2tyJj7Arbpz15nwAkJFIo3XY/73z/MBOGiYpvlf+4sNU
 KHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rq70BX8hTMAI6b+cFkI1RRrKLuHgtJvjF5od3jr4Io4=;
 b=r8ftUzf4hk/5HE4qFMEPHfTGz4JkUBrIosDRsHC+/Vf4qYxhhHkuyZRWuByaTQMfiH
 G1nxgaqhUzU9dBF5P1h4MDQNmg2vIkgicdORLffvsT6xGObi7Ms5wqD80OqPmdvzhun0
 ++zAxi+khWxtHz19NN2YIo09md+L8u2yR0tXWwumQvStrMLQs/TwVId3PV4eAOSpgHSb
 B15NVzLHfIdPCMl8jvD78Hj6T8Qq98uRmJtrUzIfRaaMqrgZkNUHE/cGTbdDC6nmvDlT
 sTYKbF/gVxSXvCn0rOc2uwZprt2t0qjYgmQxyoN6vMy4WJ0AMS76tFI0MpRAj3MxtAaT
 ytYQ==
X-Gm-Message-State: AOAM533Sgo6OakvhqmOX3eaGgnAGKWV1QdKLAqo1y2aUWeJCaJ2xYbmD
 Z2p9sxw/UGUjD1Yfhd3bgcEmsCi+Rtuzqw==
X-Google-Smtp-Source: ABdhPJwTqwka9rtYb8Dw7oO+7h8t3wc9hj/kxR8yn/VWtfBY/DTabp/hcZkZ7s/UJKAD+Wy5NIdYDw==
X-Received: by 2002:a17:902:b698:b0:158:faee:442f with SMTP id
 c24-20020a170902b69800b00158faee442fmr45317894pls.75.1653675994629; 
 Fri, 27 May 2022 11:26:34 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 092/114] target/arm: Expand frint_fns for MO_8
Date: Fri, 27 May 2022 11:18:45 -0700
Message-Id: <20220527181907.189259-93-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Simplify indexing of this array.  This will allow folding
of the illegal esz == 0 into the normal fn == NULL check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2f7651249a..99e5d89645 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4167,7 +4167,8 @@ static bool trans_FCVTZU_dd(DisasContext *s, arg_rpr_esz *a)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_dd);
 }
 
-static gen_helper_gvec_3_ptr * const frint_fns[3] = {
+static gen_helper_gvec_3_ptr * const frint_fns[] = {
+    NULL,
     gen_helper_sve_frint_h,
     gen_helper_sve_frint_s,
     gen_helper_sve_frint_d
@@ -4179,7 +4180,7 @@ static bool trans_FRINTI(DisasContext *s, arg_rpr_esz *a)
         return false;
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16,
-                      frint_fns[a->esz - 1]);
+                      frint_fns[a->esz]);
 }
 
 static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
@@ -4222,7 +4223,7 @@ static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
@@ -4230,7 +4231,7 @@ static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
@@ -4238,7 +4239,7 @@ static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
@@ -4246,7 +4247,7 @@ static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
@@ -4254,7 +4255,7 @@ static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
     if (a->esz == 0) {
         return false;
     }
-    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz - 1]);
+    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz]);
 }
 
 static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a)
-- 
2.34.1


