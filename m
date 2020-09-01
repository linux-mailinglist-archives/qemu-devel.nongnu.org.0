Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF53259801
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 18:22:20 +0200 (CEST)
Received: from localhost ([::1]:39352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD935-0000i9-Kw
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 12:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD91h-0007Fw-E6
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 12:20:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD91f-0006s2-SV
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 12:20:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id k15so2203974wrn.10
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6n4leECUwl2iEi0R9v+99s9eMqL6GE90my6qz6/blA=;
 b=pMrUX+RGvIfAmXXSIfxIZSCitTwPrTSmpsS7BGs1vAQ6E7FPeTpK5tYqKEGTexbZv9
 ML+tPsYQBB87jhzJnSpgioZV6RRxbqVsPN8Kuq8Jn7LDusbNT8/sFBFRNSDfZu4c4/pb
 YZfQh6OeL/2SSVm4W1vBWihM1pwuFypPGMAIvanwkseWFa71oamRS9vFlRyvljp+KWli
 yMm+tWlV33J4orCRp2LzyqrhT1J3UhShCmlNH2GHJHvVVFNCab9x8807GOfSlbLuNpb/
 peioBGuLOHxa05ycSKj4Hqlg/LXRUhnTvtELrqwLppG+fm8ECA9WNA2kwOVzQ7fZctAX
 O9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6n4leECUwl2iEi0R9v+99s9eMqL6GE90my6qz6/blA=;
 b=F5zXCSOLA7V+9csQ/ds8VbnrkUCeZqXi0Oo84tvghKcI+ndsk1zCnwa9mhN6ZTLZYv
 6sjlODbrMGPaMqygsNYUlnU0Q0SrMKSS6rgeEo6iH3tiL+BXU3/an3Y2vB1Mmu1gwxlZ
 yK1JLITRlqWQe51OZYPYmctD+3uyn4sm1HgtoPh2U8YkCX0eXl5YtCaRfNKYOt/cL6AS
 XOcx7jt5KkQteK3zxVwM+Z/kfdd35RyiQv8k0gEhUfe37TEUWp4CWeIoxbaMEroTzQzn
 758h8R3TyRNNxg6UaE7lqaSuJIz6+u4cxe8wx/ZQMuH3zO90+t7eGZ6+EXpaGYGq53y8
 Y+cQ==
X-Gm-Message-State: AOAM530pNLmCAMZrtxnbpEXNuF36g9e8rHaSuSWiBJtdRuUcBVcGU/4r
 mw9DEks1RjnSn7flvjXcCsf6pwYYAHSkugZf
X-Google-Smtp-Source: ABdhPJwYt/uKVRbNZ0WSQ2pgTNe9S87QCx+kCR+ihVAqCoHDUIHOm+kp4FgbpjCXdF01ceborQOXlw==
X-Received: by 2002:a5d:6051:: with SMTP id j17mr2928093wrt.81.1598977250596; 
 Tue, 01 Sep 2020 09:20:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c10sm3145097wrn.24.2020.09.01.09.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:20:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] arm.risu: Fix typo in VCVT_B_TT pattern name
Date: Tue,  1 Sep 2020 17:20:46 +0100
Message-Id: <20200901162046.32670-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200901162046.32670-1-peter.maydell@linaro.org>
References: <20200901162046.32670-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix typo in VCVT_B_TT pattern name.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 arm.risu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arm.risu b/arm.risu
index 43a72ae..048215b 100644
--- a/arm.risu
+++ b/arm.risu
@@ -669,7 +669,7 @@ VABS A2 cond:4 11101 d 11 0000 vd:4 101 sz 1 1 m 0 vm:4
 VNEG A2 cond:4 11101 d 11 0001 vd:4 101 sz 0 1 m 0 vm:4
 VSQRT A1 cond:4 11101 d 11 0001 vd:4 101 sz 1 1 m 0 vm:4
 # VCVTB, VCVTT (A8.6.300) [requires half-precision extension]
-VCTV_B_TT A1 cond:4 1110 1 d 11 001 op vd:4 101 0 t 1 m 0 vm:4
+VCVT_B_TT A1 cond:4 1110 1 d 11 001 op vd:4 101 0 t 1 m 0 vm:4
 VCMP A1 cond:4 11101 d 11 0100 vd:4 101 sz e 1 m 0 vm:4
 VCMP A2 cond:4 11101 d 11 0101 vd:4 101 sz e 1 0 0 0000
 
-- 
2.20.1


