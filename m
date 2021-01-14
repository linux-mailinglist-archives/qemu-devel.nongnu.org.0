Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F82F6747
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:17:54 +0100 (CET)
Received: from localhost ([::1]:39470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06Ft-0003qd-GL
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wR-0003fh-44
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:47 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wG-0004vv-Uo
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:46 -0500
Received: by mail-wr1-x436.google.com with SMTP id t30so6544835wrb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EvR0AZKqAEJE1jZSnKHKNZ6eUSpG9JBFccb7SlwK3GI=;
 b=qANiLp6ZCcSgr2MdBgJCAitpdEJTgM6p75TeCnCGI+44OQnf1vJ8QVTFtLHnctjeUK
 GckdnIz8i6KtC3EvFNl4KTtr6+EFVlpAwdFNxg4dDZOVG3C6EQksXk2I3yePCxFQXESX
 CWsKAQbc32efRHu4Bmfj+j36k18Gk+Z0QZ0PDQUjzk5sqsYRMnxqAIUcyk4vM/qODNhO
 QzeW3QxOs6G2knivtyW+8Weql03BZEnnz1IhDygt8gijA7NPw6yQULVSSbQwsfOSFGbD
 SfAMFSdUYsW1uVPX+k/ohvDz/Re+W6gWUb+Nfkevr5phVIReKOLicz28b5tjhtwrvf9W
 uOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EvR0AZKqAEJE1jZSnKHKNZ6eUSpG9JBFccb7SlwK3GI=;
 b=UylJz38rSVoszyyEmapq4AfNxuLjxTXGyi+bboWZw52t/nu/2LcjwUEEVO4x/IZtBH
 XeaNHGjoFj5i0O7N3W7VdP3jNJi1+rFEdYUjHiJ3xCpHjOPnUNmWjbj/WdRACgxuqF3p
 sCoaTQq8y4t8qYhxrW3p4V5D1EtlQuuQunxvfD1HZWYY5rt/dAYvHKGm9/ZTM4XLET6I
 DfUswilVvvlK/2yz6kvrmIxomvgPYSGCUS3KDtg/wV87nuTPCSdDJWdjlpp/mlr9DthG
 g9Gs2zBCiyE4OnXC+ajRAjMTy5bkwKrZQp7cRN8NpKWvkeRqkovgqYWP5/wLEOw5ajHk
 tW3w==
X-Gm-Message-State: AOAM5317sq6SVmhxxHm3lbVt4W0fvKtap/wwBWYRlRCATqY9udkGlM0h
 qABfP94Kr4ZI/4VWPTp3GcxBtw==
X-Google-Smtp-Source: ABdhPJwPxxSAoGRqlHtrUaq+mz5k2Nf7/Dw0mYFOhDD8upiMgSb4+4opQbgZHkbreFKAcbE53YTdDg==
X-Received: by 2002:adf:d843:: with SMTP id k3mr8945412wrl.346.1610643455473; 
 Thu, 14 Jan 2021 08:57:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k1sm10590808wrn.46.2021.01.14.08.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4978F1FF8C;
 Thu, 14 Jan 2021 16:57:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 02/12] Makefile: add GNU global tags support
Date: Thu, 14 Jan 2021 16:57:20 +0000
Message-Id: <20210114165730.31607-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


