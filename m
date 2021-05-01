Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1057370882
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:51:47 +0200 (CEST)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcuiQ-0005Q6-OF
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuag-0008G1-Aa
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:47 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaS-0008Uh-2d
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:44 -0400
Received: by mail-pf1-x42d.google.com with SMTP id e15so1308097pfv.10
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i5rMc+7tkRmty/Z8ETHm8OuACyQrJr38+SoOSY+AtiA=;
 b=XcM/7uVgmfAwgnC+RPc8cLdJzujP/UpPuujvMeabUNVSRFxWqXa2RU1ArDwapup9Qm
 0z/EWgk/4zmRv2rOQ+TmtfeGHLFzd1a3jHP/jTHVg0QhXxwhZm15KM0zFoc2alagYWrc
 fksqf4Qw9UHeonJ6A0ENx8SCCYqqBT8NYIC1nrdNl84fOpxivFgicIKUPn+dH7K8ThDT
 eLb/LQlx9KVMKg8z4PmMrT5g15ujXK5I9AtC38yeQrJ85TjoyIXNlcYpCl6tsg5jn7+k
 bBDmyrEj522whSq9j1JJAaXq0V2/9QSKjYzQiJUpps0lvkTg9qqPrtmle1QVDvy50byK
 3ERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i5rMc+7tkRmty/Z8ETHm8OuACyQrJr38+SoOSY+AtiA=;
 b=fIsRo6QxNPai8C9msCz/os/PKhN2QyoX3UzaIjvAov54+6y4yB8Hyp2y1GLU94OWR+
 WkIS9qcBV/SD5tMepcBpP9p3z8NiTz8gHcrgRksd24RTc0uShD906OR22wyfSqefh++d
 FnA3qr80nqs4LuStHiVBrVEP6u/kmNKzSq33MG+LJzP9DCxfnf7EYxCdB61ZbyzEjHWk
 KkceDgVy6YPDCJgnCwoZNogFfI41r6GSciyeNZMJxdiYeteuneIwrjjUok0SkIpL7ybD
 uF4Pmdya5TaXHyYGSEgdzcef+r9eSKyqNwyWqaX4Oz83c9x+mpfA0heoJ2AIBu6dHFaa
 Lucg==
X-Gm-Message-State: AOAM530ag1KJkhEfJ+bEPR8e0v0Te0fB0YZghJ9wGcMKcbtYOwjw9VWq
 ZkESKnw4Uljbq/0hL9Yeh11YmWkBSvkVqQ==
X-Google-Smtp-Source: ABdhPJw1YWJtebPN0qTPgGVlASCo/ZkyOi0/cWK57ublxbsuXVnVFSB9qAmz3EpNzzk67yX6Qlb06w==
X-Received: by 2002:a63:1d06:: with SMTP id d6mr10233870pgd.202.1619894608707; 
 Sat, 01 May 2021 11:43:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/31] target/hexagon: remove unnecessary semicolons
Date: Sat,  1 May 2021 11:42:58 -0700
Message-Id: <20210501184324.1338186-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=unavailable autolearn_force=no
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


