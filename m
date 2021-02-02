Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B330BFDF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:45:16 +0100 (CET)
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vzX-00007O-4o
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuc-0003LV-BV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:10 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuZ-0007CW-9y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:10 -0500
Received: by mail-wr1-x432.google.com with SMTP id a1so20508926wrq.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sE2rw1O4u9cYqn0FvywReTtt3n/OCFCQyRnzm4hokb8=;
 b=uAafp6Y7638pA3v8xP3GJROc835hBiks+hL0+AAGj1PikuOwlfGrsG3I8bwklAXL73
 fXYXMUhhGBC0498L3g5a4H9qwzdZTweOKkOSmSNtPugJixpUSMf2EuiNfIBhiOyegvs1
 Oduzp1ZSe+wTI8ALij0bauneFiNR5vASIYbGe3JD43sicBYZ8GJx3ezy0ocxartDlBey
 4PrYtEU71ilW26xpDYfd1+I41LsR3TlXSMzrdVSXzRPdsXzTVQ4+r1E8j66kLX9yjAB0
 pOQnxsN/Or/etoRa5Rgz1Z/fCKHS67vAK5G7XCV5Y5WROEz5TrmB39KtUh6xu/TkJI0D
 NH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sE2rw1O4u9cYqn0FvywReTtt3n/OCFCQyRnzm4hokb8=;
 b=TkxwnDYJFHfJ7j87KLXZRthPrzkxnQ6FTfnt+Gu3YD5/XmDLmkrhnvUfHLZQ97eCec
 ddQt3yUEEthoEZ9GDC1CS6lxU8z6n+xKbef7BdDPqhnTf69yzcBGnMdjSfITbTSELDQp
 /TX5dhbOk2q9kBZjnY3Q06e+xxr0nb63LAQ5lGroe2gr1KexmNrVwMT8tr3z+ReXKNYX
 NCRVImv5nYhY7awBsDavrFYPD9wtj2YIlHdpsZ3oUPQ6ph68rzBnociL8qpneuI+zAsi
 9pHz7f+qn+kVinS1UfX3nUp4L6+j9ptBmeESXhFdO8HPIS2T3MRn+uvZU0dP5DO5eeiN
 nILw==
X-Gm-Message-State: AOAM530bhWlD9jVFmauZWtzjMnN2coi4b0olhmtuIvUCt++lxeavGcBo
 IMcmIYHalGUKDZRktVEXP2g1O+ZXTTOQXXJM
X-Google-Smtp-Source: ABdhPJxLbYnHNWlbghEN5jt0+e90xkI3FhkjV8yln3CRNIWKjgLMVBceX3zxl9AjMKVlVTRBgJJCqQ==
X-Received: by 2002:adf:c6c1:: with SMTP id c1mr23812396wrh.326.1612273205867; 
 Tue, 02 Feb 2021 05:40:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q9sm3585131wme.18.2021.02.02.05.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E56E1FF8C;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/15] tests/docker: Fix typo in help message
Date: Tue,  2 Feb 2021 13:39:47 +0000
Message-Id: <20210202134001.25738-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

To have the variable properly passed, we need to set it,
ie. NOUSER=1. Fix the message displayed by 'make docker'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210119052120.522069-1-f4bug@amsat.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 0779dab5b9..bdc53ddfcf 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -209,7 +209,7 @@ endif
 	@echo '                         before running the command.'
 	@echo '    NETWORK=1            Enable virtual network interface with default backend.'
 	@echo '    NETWORK=$$BACKEND     Enable virtual network interface with $$BACKEND.'
-	@echo '    NOUSER               Define to disable adding current user to containers passwd.'
+	@echo '    NOUSER=1             Define to disable adding current user to containers passwd.'
 	@echo '    NOCACHE=1            Ignore cache when build images.'
 	@echo '    EXECUTABLE=<path>    Include executable in image.'
 	@echo '    EXTRA_FILES="<path> [... <path>]"'
-- 
2.20.1


