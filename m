Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569EF5386E3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:48:07 +0200 (CEST)
Received: from localhost ([::1]:35406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjUs-0005gw-FR
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwI-0003rB-EJ
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwF-0007Mg-Va
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:17 -0400
Received: by mail-wr1-x434.google.com with SMTP id t13so15279904wrg.9
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CmEzCmuZbHlYMfmNK9AR6WHdmSkHcgr1OmRx30bZjTo=;
 b=Pksst2fcFAhzqXWZM6jgvpM7nkkZCmocRrmnxPvNllt6bOkC4G5Ptti3Q3Gnm/QoPo
 0++MFmQPUhFgTWDPTHQp+FWKlM57kvPQYZYDWWQWTDPyV3IZ/WrNkHDxX+crXOuYq8CH
 +WyZ8Uq+tH3tkMXbzBunwK6AGS+r/VoMiiCI6Mf7HygVsY4NaLnRwSo/Y06uSt1tdciO
 dD9VcWcNDfEHd5cYeHMKXffrdPz2AlATAmfLiTl9Kx1mGRf3cbdVYXgHe5HaH09C3AdS
 jso4IOekRJa5rmOTttwOmWGL7FG42i1PrBOk4rEB0tiwv8fw88BHszL8E6z9sR3QpBe+
 UHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CmEzCmuZbHlYMfmNK9AR6WHdmSkHcgr1OmRx30bZjTo=;
 b=AUAXKkvUW3puhqA/am+D1Q/lLbzVn0otZ4m2S/isX3rN8wMd6S4pKaFXsm3yK3DVt+
 NoPnkx3LkvJzgpqc3WPNCUoII+snongW/5NHwz+o53RLuMTH9evNBiomL+NuOHy5T5C8
 kHDKGEgi5hdkvsXtJ59txFQMh8+1QnehZado/PzoorGa569BOp0JSMhlLdh8yWN/+r2r
 kZxpKxFWdE7JvalZ1a9g+hYUd7IKw5w6N5I+R0/ECR+0lNcl5jroKHUmftcHKoQYojYb
 gSwFXDjyvG4mAJaRs5bFt4rvOYhjh5RCiLByvbQQStayADDBmRgkX5bJlRdJmIqUzN4c
 Gong==
X-Gm-Message-State: AOAM530nyvtI/4y4/o1aH+pxnxJUBK0ZM/3gciOXWBfXb8hvrnSq9/1n
 RFYzd4DEDj+tTRDXsCjdojwoNpWXyW2FXA==
X-Google-Smtp-Source: ABdhPJyLtDFQY/KGJJGTzKM/VO8+BsKaR2CFlxxZtCXT5dAu8XLQVAdxqINNJNz0XjW4iajEbzwHKw==
X-Received: by 2002:a5d:64ab:0:b0:20f:ef37:a9d1 with SMTP id
 m11-20020a5d64ab000000b0020fef37a9d1mr26046539wrp.197.1653926893305; 
 Mon, 30 May 2022 09:08:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 066/117] target/arm: Use TRANS_FEAT for do_last_fp
Date: Mon, 30 May 2022 17:06:17 +0100
Message-Id: <20220530160708.726466-67-peter.maydell@linaro.org>
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
Message-id: 20220527181907.189259-64-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f5453e99e15..841c1b56449 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2608,15 +2608,8 @@ static bool do_last_fp(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_LASTA_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_fp(s, a, false);
-}
-
-static bool trans_LASTB_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_fp(s, a, true);
-}
+TRANS_FEAT(LASTA_v, aa64_sve, do_last_fp, a, false)
+TRANS_FEAT(LASTB_v, aa64_sve, do_last_fp, a, true)
 
 /* Compute LAST for a Xreg.  */
 static bool do_last_general(DisasContext *s, arg_rpr_esz *a, bool before)
-- 
2.25.1


