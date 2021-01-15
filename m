Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD28C2F7C74
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:24:25 +0100 (CET)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0P5U-0007Aw-Gx
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqL-0006DQ-MS
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:45 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqI-0006X4-Ef
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:45 -0500
Received: by mail-wr1-x433.google.com with SMTP id a9so5764131wrt.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8r4UKUDO6tEaLsLvzMsuoJjuo6O2hAvhV37rpchiL4=;
 b=e8beQF4JAPwIZnvk+22TWgTRcjWZSroi3yzbCoxz74EN3r7Khb04UfEw9lSiP2Kra7
 RftVPYSLAP3mb8h9AqxbyWJ47x60/Hy4Oj9SyW0Nh77prv/OkjcbFVfAYEVGCfj2kAJi
 r9eUwWbFuXajj59twieZwzvOgQTwZ3195R71kVeNHZLGg8qozrvR2HRzENyA2wRJJOG1
 yC22Wb5AtmSrgwo+bjwJxmcX+hkpd74UEo/cM4pD5OU6PwfnOWEtFuAHNE1kBaw8t8lR
 HwlDGyuirXzWBK0ln9KlfgwTOCEXhW9/AefG1bcGu4ZYz4hZ2gdBhxaztaLmjM+f0zku
 rymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8r4UKUDO6tEaLsLvzMsuoJjuo6O2hAvhV37rpchiL4=;
 b=HZJ7r+L5+4gfsY7XM1UBhc019sK8sFvG0afPDx63saUXrL/JpPYMPwf82U6etLk24i
 qVlLk/pIkkmDSubuuI+jomxlqcOnLEGjmz5vBXCx8hrNwDX+/1drZ40ATihpfuWHEobw
 5Bw2btoC50xOz/gx1Ts+sfbFIQ1uk1lF1opJ4HJ3I3wfIp6J78idY7lm1turSMtG9yxe
 q7ra2SnXUErdsKMrbWhPFKB3MLtuI8gpHmES4ato5J75RvSVdsyACN6Q5iCAFpEpmo2v
 8lGANHZN2Ca57aMeWZXUYXEkp6wGO0+32huq5qP4uLuLDTsOCXaYeefCS8ffeJVxpzAi
 eNOA==
X-Gm-Message-State: AOAM5330F5PJo4cMBzHsAPEN8r6DVhWH32XlBbJTa1fBVg3NmZvTfqiL
 xG+H9aUNxO3xJjhG7YWDtuh2rA==
X-Google-Smtp-Source: ABdhPJyHVPNzSUNI1+lybl/p6Dl1IJh1L+YSIjQSYM9UiKTHeji2YxRTSFq/4WuzNTWCarMsIyBm1A==
X-Received: by 2002:a5d:4dc6:: with SMTP id f6mr13346193wru.336.1610716121108; 
 Fri, 15 Jan 2021 05:08:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r20sm17106184wrg.66.2021.01.15.05.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:08:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB4FA1FF92;
 Fri, 15 Jan 2021 13:08:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/30] Makefile: wrap etags in quiet-command calls
Date: Fri, 15 Jan 2021 13:08:04 +0000
Message-Id: <20210115130828.23968-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For prettier output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114165730.31607-7-alex.bennee@linaro.org>

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


