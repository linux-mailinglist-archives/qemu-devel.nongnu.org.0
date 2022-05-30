Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497825386BC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:25:29 +0200 (CEST)
Received: from localhost ([::1]:47134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj8q-00080p-I8
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvy-0003ff-Hy
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:58 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhvw-0007FZ-P1
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:07:58 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s24so7955976wrb.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aaYX10+l5LPXqOGE0Zl5DnPyS5jtgtfY1En8cg5a698=;
 b=Qlg/xqvwTbj1EotN+BkvPBtV/gm6H7XVZNnqd8NTOHVm+6znR7uqUDCKQMpRF9SNmu
 RmAOM7g+x8rkD8FJNxQOt3H2q15+F7aJE8Lvuw+9VCCFxDjcJuQRtObUpehm1vyFhi4c
 rkjrNtSdBeTBuxr3kSG/g8V/LaPzSQgu32E/jNxmETs2x87fkxTGy4v83ULRnRBxW+nM
 UTV1g5c4+PsfBMDaaNY2H7mb03hSGH6L7qQ0BqnY4JMq4C3RKTkVM8Oau3bNF+LQL7DN
 wvPNn4zB0kQG142MYE4f3ypyPqvwsZbrq/L8OV9kOfqa5DqiUtrCw32JgGqXSph8tR7R
 P5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aaYX10+l5LPXqOGE0Zl5DnPyS5jtgtfY1En8cg5a698=;
 b=7jw8/NBVo3zmvfgKFbF9Czn56zq8Vscl9BhU5NwRqwC7nWasWp1y5Yp3ucm+Nwbtj8
 ubx2K1kGsAXZ9eT0zwJp8IMrIOggeHSYQ7Irry6eUNzDXbSpOgI0QRcWa/Fk5Z4c2Pd0
 SCl8Viez7TMtx8Rs33/lCIu8Q4gyzAKrDdrC/OGYRfcTPxN4STRCYDIgh/QSMR12otdz
 7qMNlB26LgF9avgoIsmvyMJ4yO1ma8cN7OwpZ5ilEyBsMPHXd3hpd37ATjrsyHmEnbwc
 HMrQGG5dfK9/S1WqUFOaVG9KVNu+Q2dXorqNjZOyvmThX5OQ+MsPBTW3V7P2/y1vWfFt
 Kqlg==
X-Gm-Message-State: AOAM530Kj8ZpWHxfRTvTpkUlspvUAd00fOZjPHJEn42LSn4kmM/F5xp0
 PBdw3d4zIs9J8xexppUdx3rVmSWA1zulag==
X-Google-Smtp-Source: ABdhPJxSOuQ0TbFyOqdadgDizikzYmPmY7DfR45hAz7g2n/YK1QNl7DsRMpVk7a51qldwMoYu5PYCg==
X-Received: by 2002:a5d:5847:0:b0:20f:dc2d:d6c8 with SMTP id
 i7-20020a5d5847000000b0020fdc2dd6c8mr32474963wrf.644.1653926874136; 
 Mon, 30 May 2022 09:07:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.07.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:07:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 055/117] target/arm: Use TRANS_FEAT for RDFFR, WRFFR
Date: Mon, 30 May 2022 17:06:06 +0100
Message-Id: <20220530160708.726466-56-peter.maydell@linaro.org>
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
Message-id: 20220527181907.189259-53-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ce6e000f6ff..6fd9a42ef90 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1636,15 +1636,8 @@ static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
     return trans_AND_pppp(s, &alt_a);
 }
 
-static bool trans_RDFFR(DisasContext *s, arg_RDFFR *a)
-{
-    return do_mov_p(s, a->rd, FFR_PRED_NUM);
-}
-
-static bool trans_WRFFR(DisasContext *s, arg_WRFFR *a)
-{
-    return do_mov_p(s, FFR_PRED_NUM, a->rn);
-}
+TRANS_FEAT(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
+TRANS_FEAT(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
 
 static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
                             void (*gen_fn)(TCGv_i32, TCGv_ptr,
-- 
2.25.1


