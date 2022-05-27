Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BCC536751
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:03:59 +0200 (CEST)
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufFf-0005JM-17
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003b8-95
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebz-0004NU-U3
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:11 -0400
Received: by mail-pj1-x102d.google.com with SMTP id gk22so5293531pjb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Idgrlh/We6yI9UhWR8sUoza0FQjb3tpfLfRpWHZppnM=;
 b=EADIKuYHeMAffUPVd/70FTVhJgdYzIZaHWNISfqtpziwFmTovem9XVkMehaoW3JCps
 5vQJZ+w+WYfSQQ8DGdXUNosKWrmJz1qXhGmc7Wu9YMhVxqEKo4wbKJ04pljJafF6ViCt
 xju50CXtsrUz1gfvw6NM81c3pR+mU3Uw9zaIozNqjcbd+4wRQwKBQvXbK0g1vqsoYhtR
 PDOf0ryFWNT5jjOtD3/zs1TSR4xwkSMVin6FdmdSZs0Vt6bLdP8QH8UjBskNw6bOPO6P
 r6OR0Afmiqohp+CZlr/GYVBwCm3kUo5WPV3E4+e3gkmAVh5DRKZyrniFmhMnMyz1GGRS
 uehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Idgrlh/We6yI9UhWR8sUoza0FQjb3tpfLfRpWHZppnM=;
 b=tFFUa2bnV3XiC9dmxyImttdKrbPl8fX1v4ol9AsI2/zf/yXtu6Wjst1PJeILldyPCb
 oTll4fajOhnpocSofA0U+PyGAkMtig6YEV5EluXleVok48coVqGIGwWurjhMp5mrnhsm
 nDVRe2sHvBQGd+uiZF+ek3CL9owfx0HxIlyBArUZCFZA866WYZItHXoEkAUNJ11jIMjo
 JWFUHxaX3nGNE7BOu8QJ18c/mN5VTx0qRnqbAm/5sG+bqIwpWyOFYiqXrsHMAtt6P1qb
 CLZ0d5oINBx1vuAjhW6+2Gmr6jM8ezDT7sQSEiSzy/Aaf3rxvtvkXw3UiSSmbR5xb3rw
 LfbQ==
X-Gm-Message-State: AOAM530kFJIq+foDoJF5WmCIVDC2J99NQE/fpaDmKi+UWF2OFfJlIV98
 i+ReiyvmoH2HVzOE0ySDLfVGholSG1gofA==
X-Google-Smtp-Source: ABdhPJzcHO/uj7bZnI4Ib9OwhjEVFbsbPLryM10rGPlrlYJqzcg6+ulgQVOJg3kRReF3AKT7j1BcKw==
X-Received: by 2002:a17:90b:380b:b0:1e0:2639:6e2d with SMTP id
 mq11-20020a17090b380b00b001e026396e2dmr9540531pjb.203.1653675778596; 
 Fri, 27 May 2022 11:22:58 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 054/114] target/arm: Use TRANS_FEAT for do_EXT
Date: Fri, 27 May 2022 11:18:07 -0700
Message-Id: <20220527181907.189259-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
 target/arm/translate-sve.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index abb5433ee5..7139e6c0b0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2081,18 +2081,8 @@ static bool do_EXT(DisasContext *s, int rd, int rn, int rm, int imm)
     return true;
 }
 
-static bool trans_EXT(DisasContext *s, arg_EXT *a)
-{
-    return do_EXT(s, a->rd, a->rn, a->rm, a->imm);
-}
-
-static bool trans_EXT_sve2(DisasContext *s, arg_rri *a)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return do_EXT(s, a->rd, a->rn, (a->rn + 1) % 32, a->imm);
-}
+TRANS_FEAT(EXT, aa64_sve, do_EXT, a->rd, a->rn, a->rm, a->imm)
+TRANS_FEAT(EXT_sve2, aa64_sve2, do_EXT, a->rd, a->rn, (a->rn + 1) % 32, a->imm)
 
 /*
  *** SVE Permute - Unpredicated Group
-- 
2.34.1


