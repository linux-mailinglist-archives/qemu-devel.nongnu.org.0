Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D7F370D78
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:53:14 +0200 (CEST)
Received: from localhost ([::1]:43230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDT7-0002lJ-CL
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKg-0001Hw-5d
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:30 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKb-0005Az-Cv
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:29 -0400
Received: by mail-pg1-x532.google.com with SMTP id m37so1907480pgb.8
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i5rMc+7tkRmty/Z8ETHm8OuACyQrJr38+SoOSY+AtiA=;
 b=W3JGFCgO7UUrgh161ep+75gPLxZ3tUpSAfycVaXWPiK9hSf0A9Ffaqfi4Yj27QYuJI
 3S6grkXibZzo/rSdeXMf+DAohnzsq9tnSU+/smdmr4DJj8jGqojoTckqe3MjTUFBS1B3
 f6wEnD75c7RlUqcUTgA9FBeTYv+27f0Cisvv3niz6/kL3vfu4UHUT/tpeH3g1bv704YL
 NiBghy9NAqVO9Db0/2BmcH2eV7RSw5bMbzdxrioxzLCTolDmYY3pKwIW5LkQ6RK4/C/5
 sY1QkI3xBFmtzyx7pehBY4812m/MQq2VaFv1o/4+a/yhzkdzoG1Ye9GjKrgzsQ8WtSD/
 mwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i5rMc+7tkRmty/Z8ETHm8OuACyQrJr38+SoOSY+AtiA=;
 b=XwaxY3ESB64vfB0pLeP65F5R92rQYBR8BBw9/pOmcYXYhObh76xyLW/2hqvpD7yLPG
 O+DAkN7XgTRNbp/0l72+qBPC67S/SHAtC0hz7nLH9FCLiyEfkdwpZ6e1rfna87AS5HQi
 kqc4HRAxbr1Vsr7oU5i1i24d/g+2MGCI7MF1S3/IM1cYfbkXQsYbiEw1UXP1Khm8tdIH
 lOKzqcMTfzoI1DUWcmNZRjNxhVmRbt84iR5BX2GYCrV4ahBiHsHPRtyIMZowwdSEJowO
 2oDxfZXZowYI2s5Ce1vg07/GlPQC4+Zud+CK0BiQ1GInSlobnrVrJfV/vPENTVMaCjbI
 p3AQ==
X-Gm-Message-State: AOAM530MqkwltAPuO7GEAkfQlGEjHa3ODg/VHbJuPfxO1kj2oe+VgeQM
 gciE0QAJNbSIZwiiDJd4Yom5bXQKWAWdWQ==
X-Google-Smtp-Source: ABdhPJy7xTyM+4ekr+LzO8BvBTcBdRxqpqWvo+/YN7uLtBxjkkK/I+DAuOW0lsi7yKsVwaLTNkF+Cw==
X-Received: by 2002:a63:a70b:: with SMTP id d11mr13920613pgf.26.1619966664169; 
 Sun, 02 May 2021 07:44:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/31] target/hexagon: remove unnecessary semicolons
Date: Sun,  2 May 2021 07:43:53 -0700
Message-Id: <20210502144419.1659844-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reported-by: Richard Henderson <<richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1615784100-26459-1-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index e044deaff2..a30048ee57 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -83,9 +83,9 @@
 #define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
-#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE;
+#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE
 #define fGEN_TCG_L2_loadruh_pr(SHORTCODE)      SHORTCODE
-#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE;
+#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrh_pr(SHORTCODE)       SHORTCODE
 #define fGEN_TCG_L2_loadrh_pi(SHORTCODE)       SHORTCODE
 #define fGEN_TCG_L2_loadri_pr(SHORTCODE)       SHORTCODE
-- 
2.25.1


