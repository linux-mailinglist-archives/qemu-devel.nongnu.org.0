Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBD52C0501
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:55:27 +0100 (CET)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khARJ-0004LA-6Y
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFk-0004Ih-Ax
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFi-0002gm-PG
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:28 -0500
Received: by mail-wr1-x433.google.com with SMTP id z7so2449892wrn.3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BWyPOb+H0I71tWGsMyPd+nfhG7gtf2Z6z/CFcaJuWXE=;
 b=z87aCT4zqU4+VMz0Qs8dfMKFx5ST6g7VqES7fjHrLxNuDrHiFjRH34vtBFP7ARUpgp
 6j4VAzLZ/McG4CY4mhJEXjmE6EMkIjagQxSa+rDox+EUHKRrH2LT/0mtLV6GBxJ+fJL8
 Wh8gy43+vgx0FDWEh0tgOIMHXbGnUIRTgnpH7wdm7f+uUprcFYsRUZGFU+du1l88LzSc
 tIFhEfcaaudry0rPMhHQNYDfu5+t86ZHBCHEB3+46U0GZgrxKkYohtderCF+rWm4yieO
 p/qoX9rZ9JbWaFn00LP1FJs/o2jWtxzO2yzMBUPp3vliy3QN+NO3mLQJzicZ5t4lbS5O
 8FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BWyPOb+H0I71tWGsMyPd+nfhG7gtf2Z6z/CFcaJuWXE=;
 b=klL1/qU9gb6N5STF98uogeih3d2AqzcGVVpKH7uWIqgfmd5LT0YeKmAk/s0hqkZaVZ
 YTa1WK/G7anNSRiTaDlEngEvxyUb7GxqG3NyzXyinH26E4OWftzX0OTVXc3iG7YFOUpe
 0q/BCrAqqfHmDdbr1HAqNBmchnLx/XAixyAJmjPNdQlQsalxA6ABkYOxax8wfjN03Iwa
 tFuQJDKW+ip/iJBI1J+O3MnGua1F5TPvyHmPiYULBJaD2a5L5yOSkEmBRqEK5hBHvaoD
 wEusxQadqPPDgwCcpXJfje45XA/u32B6jkQUIhyat/yKy7JSJYG7t89bnC7m7kblImYC
 /7Mw==
X-Gm-Message-State: AOAM530Iz559kSCeJ1KFXhT8y4q4z8UYE01ErN5qj+HoPBWEr1elco/V
 5f/CFrkWQ4dnCh4j81Cn/NG9KU9LY7DZTA==
X-Google-Smtp-Source: ABdhPJy2DP1UXK1HbgCQu2EjAzEagPl8DDCE+2PQTZS+Gf+eJcTbDtNgmB4buREcMsf4dNCNQe19pQ==
X-Received: by 2002:adf:fb06:: with SMTP id c6mr32192616wrr.117.1606131805251; 
 Mon, 23 Nov 2020 03:43:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/24] MAINTAINERS: Fix system/arm/orangepi.rst path
Date: Mon, 23 Nov 2020 11:42:58 +0000
Message-Id: <20201123114315.13372-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fixes: 0553ef42571 ("docs: add Orange Pi PC document")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20201120154545.2504625-5-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e478f9a26d..e653ff70d9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -559,7 +559,7 @@ S: Maintained
 F: hw/*/allwinner-h3*
 F: include/hw/*/allwinner-h3*
 F: hw/arm/orangepi.c
-F: docs/system/orangepi.rst
+F: docs/system/arm/orangepi.rst
 
 ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1


