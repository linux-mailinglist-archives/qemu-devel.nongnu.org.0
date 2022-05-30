Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0645386ED
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:54:09 +0200 (CEST)
Received: from localhost ([::1]:43916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjai-0003Eo-Bv
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwQ-0003tg-Qt
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwF-0007FZ-54
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s24so7955976wrb.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ki54UcxWl0FdreHIfC41FultY1F0rbDsTYQ4JxUZVYw=;
 b=CyPUSUDorbwlXv5oQTHgEEzskO3rSBH0xMNrLEisYxzvQkeRkqhVyhtBmsk9TTtLxf
 KLt5QQyM0FhNjnrMJ4Lx5TlZ2FKfCr/dv0CxEN6R0hPujflf8k2ceyCZXVHT5Tv49neD
 vIs6lSRDtpY+cMIXLo/RlDsVAaS5jCTciKkBP/anRe5EDKOezSDgVMEX43+jiDnzUVya
 6fDsbhHZIovvIxOFlVTxk3nO+Ev6hmGUGhaSwDQ1v0KGuDdhnBfZ9HjzAGRAkwJVK0Eq
 L+f7T1/RDWfRO5AjHIlUH31tuKIhLYr3s5OApnekGuLckZDfFdiRKxugRG69EFHbhCdV
 85eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ki54UcxWl0FdreHIfC41FultY1F0rbDsTYQ4JxUZVYw=;
 b=5NoivULg6iLkRk+gmHJmhKd/3GhgPJdkuoBtH7DnPhlX42ledsOnbZCj38P9M0BUjt
 0PYTtl/K7gYxOhOZWpw80Ri1/Vwcyjaw9W0PvgFBb03rLY73s1Z/SEQgCr2ZtvbkPwEN
 voA+w0QyMX1flvXhTdhaHnS6Fex5Nw6QRsd4/Jh7q/kwLuAT2ci7hDxrJBPAiMmvfRoq
 b3e8k/itF7FXlUum+sFrBqrz0Z7r+gw7AzZAPWIYYxEnISyzIMD1yVGfMjX4HNmsAYeX
 OJ8lwrV9fcwS77E/E5bjZp7d2IzWdIJCjuE8YzOZ1EL7AfFTdwjQhWhxtcl7RUP2ISwP
 +0CQ==
X-Gm-Message-State: AOAM531SU0VuUH3/tn0TWJQ+ELOrI3actGDw/kbkpZVIJSIPBDK+9rdM
 qDwYeb/U/076xW+RczliMlPMXaBLN1ajAA==
X-Google-Smtp-Source: ABdhPJz3A6Y/qEyF+UwYz3RXXCnsE2h1mJKvpi3N+cnMXA0v5Loj7a9Lyq9/PG0mJEFtRIFpan9txA==
X-Received: by 2002:a5d:47a3:0:b0:20e:5c89:9da2 with SMTP id
 3-20020a5d47a3000000b0020e5c899da2mr47915657wrb.277.1653926891846; 
 Mon, 30 May 2022 09:08:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 064/117] target/arm: Use TRANS_FEAT for do_clast_fp
Date: Mon, 30 May 2022 17:06:15 +0100
Message-Id: <20220530160708.726466-65-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Message-id: 20220527181907.189259-62-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 51358667984..21c2bd099d4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2542,15 +2542,8 @@ static bool do_clast_fp(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_CLASTA_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_fp(s, a, false);
-}
-
-static bool trans_CLASTB_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_clast_fp(s, a, true);
-}
+TRANS_FEAT(CLASTA_v, aa64_sve, do_clast_fp, a, false)
+TRANS_FEAT(CLASTB_v, aa64_sve, do_clast_fp, a, true)
 
 /* Compute CLAST for a Xreg.  */
 static bool do_clast_general(DisasContext *s, arg_rpr_esz *a, bool before)
-- 
2.25.1


