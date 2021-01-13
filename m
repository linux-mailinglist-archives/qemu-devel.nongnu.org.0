Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BEA2F4E61
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:21:35 +0100 (CET)
Received: from localhost ([::1]:56658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhxm-0002N3-Vb
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqo-0005aY-Ei
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:22 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqm-00004u-SR
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id 190so1927483wmz.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TH6OKEZmHHfZ5ewcQol0S5HIv7LFOYJgDKdN3Gq2+Rw=;
 b=MUx+JDPXGvp+LUWl6owupQDJoKYNfI8GTnSwmDWuVxKpetwIrqTYe0QpDjVb+HkJhb
 VAcv5uw1b2eX+Tu6SyUsiPo45WqmBRXWf4xRSQPTLeG9K9WyxW1wim8livP7DjCtofbQ
 LpRoKbYw/0zqfM4wsBlZnHiT7XscOTgs0zz64im50p6okWeqZKUTQFysjzNeee9RmOgC
 Tu5AZXC6+3Anny7iAqmZDx9y7GcVPw9+ynlYH6AkGUIWHszJaFyyQNbFb3HHHbti+taw
 CeymOD3T5ncoVN1CvsLx0cTXUmQXaaPRcnAXpB/l/c6R7C3I4TbM+PH8eHoz9wPNYfb6
 4HeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TH6OKEZmHHfZ5ewcQol0S5HIv7LFOYJgDKdN3Gq2+Rw=;
 b=kmpaxzM3j65tLhTK+Rpwdxf7DiR5DGjIfB4ccsnDqtf52QRZ412i/RDnuwyrIILbcd
 qL+fAfed/6dn7XML86eCW0oojlwGdKMjxsadV5uiB2JIccyP6CuMwWE+qZOD9CHy1W5I
 vHgJtcts2hdK6uXxvdsIRuqoGkYcXFv2chMMhSh1fhFBcsi8+96z0701zUD3IY5Wy9Nw
 /Xyeug0xT6275DuMrtlJve1P7h030AfbGVySIHv936d9hRV0mGO3Rk5qxshb+3chH4mp
 FzLAq+4KG/L3ChCHR6BbJsSfzHsLqfxTUWTlaop+y3ZbrcmVyGkqQJ5Y43nxD2uh5d5+
 zm2A==
X-Gm-Message-State: AOAM5308aWDj5yJRSrd/hqWLJLdFpNLj8W9K2m9FueFFH5Jz+GYWuAZf
 Tg2V04gYCmtNTtt2hQG52lV/dgsOFF0Xsg==
X-Google-Smtp-Source: ABdhPJyqsL+aMdeXE4Y731y+BBHP1R0YGp2VR8CtC3Az17cPuzrcPXPyi2PKOlmUNYCy7aYFG9bs/Q==
X-Received: by 2002:a1c:988f:: with SMTP id a137mr2657188wme.130.1610550859658; 
 Wed, 13 Jan 2021 07:14:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a12sm4153731wrh.71.2021.01.13.07.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:14:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EFDA1FF92;
 Wed, 13 Jan 2021 15:14:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/9] Makefile: wrap etags in quiet-command calls
Date: Wed, 13 Jan 2021 15:14:05 +0000
Message-Id: <20210113151408.27939-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113151408.27939-1-alex.bennee@linaro.org>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For prettier output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index bbab640b31..f7e9eb9f08 100644
--- a/Makefile
+++ b/Makefile
@@ -272,8 +272,13 @@ gtags:
 
 .PHONY: TAGS
 TAGS:
-	rm -f "$(SRC_PATH)/"TAGS
-	$(find-src-path) -exec etags -f "$(SRC_PATH)/"TAGS --append {} +
+	$(call quiet-command, 			\
+		rm -f "$(SRC_PATH)/"TAGS,	\
+		"TAGS", "Remove old $@")
+	$(call quiet-command, 				\
+		$(find-src-path) -exec etags 		\
+		-f "$(SRC_PATH)/"TAGS --append {} +, 	\
+		"TAGS", "Re-index $(SRC_PATH)")
 
 .PHONY: cscope
 cscope:
-- 
2.20.1


