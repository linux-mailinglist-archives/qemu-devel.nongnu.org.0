Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469B6538684
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:06:15 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nviqM-0005cl-D3
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwI-0003rA-Ee
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwF-0007Mm-Vz
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:17 -0400
Received: by mail-wr1-x429.google.com with SMTP id s24so7958985wrb.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=c+q5vO24GGsa56q9xbT6G/615HUPExTOfoQ1VCUsGhU=;
 b=wXMMv4/3WPLVS+THfCbHxuYsykQhG1N1Ou0p5mMjHvKrV4GU831NnnVlGuB70pXdA9
 djvH0Kmp+Qnnn83Dp0SUEC3y+I66g0Ry++efrpoMQjKL2D2EqklyHwwJvp6AJOPt2j4v
 PdsBskuIYJ9pZ2GqF/YgkxlfbHA4Pr1DAR48ErU+ltim39VTVD13riTxjzGYCHUA44AC
 wgk61Dbi1bY4kGQU70KNVNZJOkZeDi7CQukTzZUUge3XYIhL8oQ3HOlnPfOxfP/1lSOp
 6TlBsOGW8v6+SaoPhH3ZYnPlNix6iSmgG//WCmPu8gB5USPtMDAc30Wes6AnzjRw6JEc
 gKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+q5vO24GGsa56q9xbT6G/615HUPExTOfoQ1VCUsGhU=;
 b=Stt7RvVQhR0XutVbUrVfTpgnkToluN0YomSTguc+DHV1iRIS0/1iUjBcWJtVwrNzJo
 Uhzxb+x0TSPqpA2zc9wCoUPooMNObAeiZas/Ktri2EM8zyiOhbVem2TZrT0RmxJXWW7x
 +J8IqyUFjjP9amE/q0JdHmFMRYQe3lGGmSemP5/GedEckAoxtDe6N7nO2mDTEanWQTHO
 49MSsCz9gpwaXJQPJ8M6YFepqrfeCIzS0JI2G6pCGRyBV6A+ZpBH4QVJrajLgwOrWtJp
 HEuwSsTYiCZ4OBP2Lgfx6UUmivBwrkWWQc4dTn0GXXxkhoUE3+uavWXhm3EuOBQOjeE+
 qavQ==
X-Gm-Message-State: AOAM530bhtBi3AQjj9kMZSLsu+9cSDdjaofTXvxS+8reR7EP8+UosXWM
 LKmsBpvD7olP7/IkLKX4kFrRhLoJferRIw==
X-Google-Smtp-Source: ABdhPJw4i02HAzwieJxzJZ8PPz7Rqzy2lEmx47Ho9ZyOWJhDrES52ybGYq/AJNuiDtmwDqUNpMxUVw==
X-Received: by 2002:a5d:58c2:0:b0:210:2baa:52b8 with SMTP id
 o2-20020a5d58c2000000b002102baa52b8mr8198900wrf.20.1653926894038; 
 Mon, 30 May 2022 09:08:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 067/117] target/arm: Use TRANS_FEAT for do_last_general
Date: Mon, 30 May 2022 17:06:18 +0100
Message-Id: <20220530160708.726466-68-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Message-id: 20220527181907.189259-65-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 841c1b56449..caa587506c4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2622,15 +2622,8 @@ static bool do_last_general(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_LASTA_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_general(s, a, false);
-}
-
-static bool trans_LASTB_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_general(s, a, true);
-}
+TRANS_FEAT(LASTA_r, aa64_sve, do_last_general, a, false)
+TRANS_FEAT(LASTB_r, aa64_sve, do_last_general, a, true)
 
 static bool trans_CPY_m_r(DisasContext *s, arg_rpr_esz *a)
 {
-- 
2.25.1


