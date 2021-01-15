Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03752F7C39
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:13:00 +0100 (CET)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0OuR-00081s-MH
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqL-0006D7-EP
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:45 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqG-0006W8-EW
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id q18so9241562wrn.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4D3wzMWDLF+Xh5usy9XjNnUkkh3/qWiSO7HsVwcUfl0=;
 b=dRK0pVkKOBbor4UIrUBgXdI5gYE+kWZiRj7Lwc9EcSYQu670sfLuPdKSqufdYO1yxX
 649Ijtq0ONmcXj5Zm6IHSiWz9xMhBYdCWx107NBW/f57CqnqN6XCaogoJO4VEh8jPY6Q
 dzlHHkBWP4dY/ahfcwKxSWT/qzPxXUIXCaTO2UiZnojvpmH21Coh9r3ERur3Hi1Meo7V
 /pz35RfyfWK3FsNw0RVORKOxR6i2/1c/E2vjT8tEMit9OUTP5z2Cou7O93NiX6KBZnBQ
 ozg7mkjEXmWRa5eb3bC52+XLDpwKMXPQxFb5vgS2YTUMjzB3UFJmltcBw5Hcx4n8jFq0
 D/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4D3wzMWDLF+Xh5usy9XjNnUkkh3/qWiSO7HsVwcUfl0=;
 b=BEWm5zNbIXKe3le5it1i1f/4RKYhZcHghsXOYPTjfphd6aUbEY8bdgIqY4hKioaO6t
 hrB1f5oS1XoUPtegAtsegnvfqe2W0D0yE/Gqcrn/TnBlhSc0BUZSS7ObGxu9CYYabMsk
 WHrzH+d1z0ORjkR9K7OM9h18mDydiciX+HNixlrmZSzgbhwQx4/jk29yRQrUtSf2I9KF
 uxU7bJ/RKe/fr+Y7nTBL6SUIbwPHzrdiia4AQhrZkRbHnm+cxK0tEpnV0br1OEsgOCfo
 GD5M9yQ1q6C8keCYXMt2j9Wjc1uGgOC3AaU5H18UHfcVYuU2nfvfvI+dYoSMAW4xsCOU
 3NUw==
X-Gm-Message-State: AOAM533m5CGRSL7jXMeE9kTIw4CEfNGk/+ARo8SwE+cy03DN6TS8Xf1w
 UtDaWTkGPMuRE9lUEr2goRc8Bfm4DVQgCg==
X-Google-Smtp-Source: ABdhPJwtVoWIFuYWQHEmuEaYwAauD+WIR/Yu+ouuKyzcIvwHsLrhWJusWEual6o/GhJe7pkFN47X+A==
X-Received: by 2002:adf:dd92:: with SMTP id x18mr13258194wrl.311.1610716117508; 
 Fri, 15 Jan 2021 05:08:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a8sm12627339wmd.6.2021.01.15.05.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:08:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2AD8C1FF8C;
 Fri, 15 Jan 2021 13:08:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/30] Makefile: add GNU global tags support
Date: Fri, 15 Jan 2021 13:08:00 +0000
Message-Id: <20210115130828.23968-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GNU Global is another tags engine which is more like cscope in being
able to support finding both references and definitions. You will be
un-surprised to know it also integrates well with Emacs.

The main benefit of integrating it into find-src-path is it takes less
time to rebuild the database from scratch when you have a lot of build
directories under your source tree.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114165730.31607-3-alex.bennee@linaro.org>

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


