Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91C42F4E88
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:29:01 +0100 (CET)
Received: from localhost ([::1]:48236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzi4y-0002L4-Mv
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqn-0005YT-Jk
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:21 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqm-0008Vt-0k
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id a12so2480638wrv.8
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7r+PDMNStM+VkqcytyyPMRMX/yoouFQ9lhvxclzqDA=;
 b=M32bixmh1up+vsVD6tZICnNeloVqgfvy28pgeFHUQ1pzwwAzUMmbxCnvrCp6i7oUDP
 YYQTvPxDwjRW032D/40duHUyr4jnbEguq4C2V7rf1B0W4P1bCWFMzkNh3tlqBCVMBdIW
 x78STwTU+LalAUBDpRlUi2QUDrOCxxnG9CVH0htABCSAwWWqTplL2ofr0pfO7209uQh+
 yiz/6AyUtd3rtm7Lg7Yrjp3KwFZOAwAUHjY2MoyvZ4aaVMOwbByuLlt4KW1Cwf6jN2+V
 HnAv7GHvlaRCk6+M6x4bEVCVHiUTMcK9Iy6FHGXUWTKMPzBwR6NKj7zBc8kDme4WqI/j
 ahCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7r+PDMNStM+VkqcytyyPMRMX/yoouFQ9lhvxclzqDA=;
 b=FPzsUL+2sgOexpYx8cObwcljXbl5SV7xbb6gN1NbmSvjkVqa06VieWN5bE0Qb+u8O8
 6YmU4NC/MmzceWemprU8h4IB5+qncCbFGU9kjGGvwh/ZLDSAQpT1V4Uc2qInqIfs7Nrf
 P9ZkxwloaOpm/MrTtScOR/MNGmvBtX8/XEeo+1zMK6vaLwGGodW6naz/OyafeTPX4bnF
 l+YvrHgSa8cpu7KhcXdwr7aB3eEV2ohVK/7NFW7FzP6XqyWUW0LL8PfwV5YFlafi8iZ8
 ULigCtbfIPH8vbMY9y0alEdc3Azws9baE1FVDj2wpIaUu0OArd/FeUlGULCuu6GHphlt
 ADEQ==
X-Gm-Message-State: AOAM533M0lWgMLb841Auf9crynwy3akhkJOw8NjfBvumnwdortYmURdb
 AOgRknzeBw8k0AZpd89na5T7UlAhEyvb+A==
X-Google-Smtp-Source: ABdhPJytVVpylmH1XDeujVhAk2jB4zZM1rL3tsseYVbypH4IknoxOOEthzUyHcuJBKPFrmL8VNOBaw==
X-Received: by 2002:adf:9546:: with SMTP id 64mr3158837wrs.343.1610550858741; 
 Wed, 13 Jan 2021 07:14:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v20sm3371849wml.34.2021.01.13.07.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:14:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C2581FF91;
 Wed, 13 Jan 2021 15:14:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 5/9] Makefile: wrap ctags in quiet-command calls
Date: Wed, 13 Jan 2021 15:14:04 +0000
Message-Id: <20210113151408.27939-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113151408.27939-1-alex.bennee@linaro.org>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
index 0c509a7704..bbab640b31 100644
--- a/Makefile
+++ b/Makefile
@@ -250,8 +250,13 @@ find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o \( -name
 
 .PHONY: ctags
 ctags:
-	rm -f "$(SRC_PATH)/"tags
-	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
+	$(call quiet-command, 			\
+		rm -f "$(SRC_PATH)/"tags, 	\
+		"CTAGS", "Remove old tags")
+	$(call quiet-command, \
+		$(find-src-path) -exec ctags 		\
+		-f "$(SRC_PATH)/"tags --append {} +,	\
+		"CTAGS", "Re-index $(SRC_PATH)")
 
 .PHONY: gtags
 gtags:
-- 
2.20.1


