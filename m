Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C343F6D9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:53:49 +0200 (CEST)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKpo-00035v-D6
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdp-0002bz-Op
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:22 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdh-0000NK-Mz
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:19 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so6494341pjb.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y4xHy0fvt8edEZwuGcc2OkG2z52vT5Lj+p/53oH5sv8=;
 b=s3dVh2q/UwtplOVljTw1rKr53FhkuLqM5pSe08gaPjpq9c28wdccv1Z5Z0CRzW+CSi
 786G2t/IqPVyx9Tnw4sE29T8aiI29+gqE4iGNVPTuhKI0plHYnBVRqwblKQFi7/g+GVw
 C9ukJIcrW7v20ICVdy/aef4f0k9N3jgqKYPD76VhL1ggIcFw+U1/Ktaaui4x9MHjuHE6
 vvGZFMglfk8+0v8WCzCH2gCxGrzjzMizO1kCyJsAO2xR4lYhfALfM+4diFWW+m7TtOUh
 Z6zW/ZdejTOZ7RMo4Ut1ECCVOP6HGBS+S517iLhi4iL8iAa52SgVJZJFotn/Gd3BHAbo
 q1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y4xHy0fvt8edEZwuGcc2OkG2z52vT5Lj+p/53oH5sv8=;
 b=i0zZBFfMHATN/GW0xDD9AE766cYEncbRJ75dzode2ML2fC2DJjl4hyiJ4zmEMoHQJd
 xBsV/PaWv9zPVVujdVgRRTFateBa+Xdsk/S/Rnhr9FU8ZjRwAZ5y+DYVNbKHnzfSd3Ug
 aZhjgLVH8NlJEgnI4jcOaOxU4qnvqycTPQZQbz9yXISm8jUfU/wbdPxKsh/Qp/sI3SLV
 WZ3QFgmXOT9bDLi+CMgfUApBOk4mCVeLLi1bwY9z1hLZ97mJT0BybS0OVAB1knK9RMsE
 aRDvnE9fJdcpi8NTnBTix1mepgV4ccMSw4cuXKklXSMBpDKFY5LMsrrFsp2IvCwcTT6r
 3saw==
X-Gm-Message-State: AOAM530RD0kdb4tj4CZc3vuPMdo697OTD/sRDCGQ79dN0gXAeKATBfX8
 nFOd/lhaQtvFg+1R8ihATaN/385xRaP3sg==
X-Google-Smtp-Source: ABdhPJwMIbJTvUrfoX5Ahob24LiCyAobTozvEf6S62fC86c5r0QJcD+gylAgsEhFObSARE8WzX636w==
X-Received: by 2002:a17:902:7243:b0:13f:505b:5710 with SMTP id
 c3-20020a170902724300b0013f505b5710mr7730100pll.36.1635482230621; 
 Thu, 28 Oct 2021 21:37:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 49/60] tcg/optimize: Use fold_xx_to_i for orc
Date: Thu, 28 Oct 2021 21:33:18 -0700
Message-Id: <20211029043329.1518029-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recognize the constant function for or-complement.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e0abf769d0..6d795954f2 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1586,6 +1586,7 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
 static bool fold_orc(OptContext *ctx, TCGOp *op)
 {
     if (fold_const2(ctx, op) ||
+        fold_xx_to_i(ctx, op, -1) ||
         fold_xi_to_x(ctx, op, -1) ||
         fold_ix_to_not(ctx, op, 0)) {
         return true;
-- 
2.25.1


