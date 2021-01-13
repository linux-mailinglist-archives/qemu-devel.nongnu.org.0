Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C102F4E6D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:22:45 +0100 (CET)
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhyu-0003hy-ME
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqi-0005OY-Kd
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:16 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqh-0008Si-0b
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a12so2480325wrv.8
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EvR0AZKqAEJE1jZSnKHKNZ6eUSpG9JBFccb7SlwK3GI=;
 b=N67YEKZh6dPCedDsZb77/n70kqFPI1dY35eSq+5lI3asL9DcqO3uYOmr66/j420wpp
 UbQJmM1DvVq+rsD6hNEoSz54NfnO72xrg5+WrKtJou5s/JB2XEWhslBRkx+PWrhoJLT3
 41GxpcSHeTaZJ38AZf+B+DavEECJz6QrMTUdt5xGz2iNMkBibFEL7Q5pbdch3XKcKA3W
 IZQmbD/LBHRxaRfNQ/XKAReOYrIctYmweZQy2AwZhd1nDQPEDHvn01M20lyZ0J1KHGZ2
 y/54aweYopGqn5Km/W+JqYxfuU+UDDPZkN+xlpiFMEYsCXSLYwo3STBXcF8P8bMqsmTZ
 e/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EvR0AZKqAEJE1jZSnKHKNZ6eUSpG9JBFccb7SlwK3GI=;
 b=BW0mGxtnBQBSYYd1iPh6ltOpOr1I1aF8lb83JBO0DQavtsj2IgLvfkjAmR/SMj4riQ
 yOXmSCy7outr2ou/ArNwXlT8ezhzuLjoL6qoFrjb80aUvBer/Ak1gO2EKg88tVJ7s6DD
 xn45kuJh5rqKw+jj0KUMVrxKZFyoHTtnoGD2vVWb7cUW04bDB5ig3eCZuQpTJkazQuiJ
 Grbb7/Qu1koB6vzum4qlAuJIThiQqsp8jf3NUIUISSDy0vlnV10sVRYy8IwTjXh1GPe9
 3pMxdPM1SGvZzR6rbzKX2XvsN7BvYHdBXlw69F0U/3ahFWbiizGB+TpEaQVH7rIPRuFe
 XzuQ==
X-Gm-Message-State: AOAM531FvPK8xoisQWaeCYDI4QlvAcugTeiRXEKWDaR4PmSDDxXArPd6
 pI+kdSMcM4gBPER5mknE1MfFLHDq3Y7kVw==
X-Google-Smtp-Source: ABdhPJzqAHAD5UaHMMadMi10q40eRuj2AQQIRE5KY45UV3/IqxrZV4l6X6c3pdiDmBZRW24e3I7e4Q==
X-Received: by 2002:a5d:6983:: with SMTP id g3mr3138060wru.168.1610550853624; 
 Wed, 13 Jan 2021 07:14:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l11sm3591958wrt.23.2021.01.13.07.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:14:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF1381FF8C;
 Wed, 13 Jan 2021 15:14:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/9] Makefile: add GNU global tags support
Date: Wed, 13 Jan 2021 15:14:01 +0000
Message-Id: <20210113151408.27939-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113151408.27939-1-alex.bennee@linaro.org>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

GNU Global is another tags engine which is more like cscope in being
able to support finding both references and definitions. You will be
un-surprised to know it also integrates well with Emacs.

The main benefit of integrating it into find-src-path is it takes less
time to rebuild the database from scratch when you have a lot of build
directories under your source tree.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - run in SRC_PATH
  - wrap in quiet-command
---
 Makefile   | 14 +++++++++++++-
 .gitignore |  3 +++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fb9923ff22..0c509a7704 100644
--- a/Makefile
+++ b/Makefile
@@ -253,6 +253,18 @@ ctags:
 	rm -f "$(SRC_PATH)/"tags
 	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
 
+.PHONY: gtags
+gtags:
+	$(call quiet-command, 			\
+		rm -f "$(SRC_PATH)/"GTAGS; 	\
+		rm -f "$(SRC_PATH)/"GRTAGS; 	\
+		rm -f "$(SRC_PATH)/"GPATH, 	\
+		"GTAGS", "Remove old $@ files")
+	$(call quiet-command, 				\
+	        (cd $(SRC_PATH) && 			\
+		 $(find-src-path) | gtags -f -), 	\
+		"GTAGS", "Re-index $(SRC_PATH)")
+
 .PHONY: TAGS
 TAGS:
 	rm -f "$(SRC_PATH)/"TAGS
@@ -279,7 +291,7 @@ help:
 	$(call print-help,all,Build all)
 	$(call print-help,dir/file.o,Build specified target only)
 	$(call print-help,install,Install QEMU, documentation and tools)
-	$(call print-help,ctags/TAGS,Generate tags file for editors)
+	$(call print-help,ctags/gtags/TAGS,Generate tags file for editors)
 	$(call print-help,cscope,Generate cscope index)
 	$(call print-help,sparse,Run sparse on the QEMU source)
 	@echo  ''
diff --git a/.gitignore b/.gitignore
index b32bca1315..75a4be0724 100644
--- a/.gitignore
+++ b/.gitignore
@@ -7,6 +7,9 @@
 cscope.*
 tags
 TAGS
+GPATH
+GRTAGS
+GTAGS
 *~
 *.ast_raw
 *.depend_raw
-- 
2.20.1


