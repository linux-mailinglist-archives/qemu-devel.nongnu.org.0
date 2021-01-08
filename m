Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BB72EF275
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 13:22:11 +0100 (CET)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxqmQ-0005xZ-OO
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 07:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxqk6-0005Ex-Rd
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:19:46 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxqk5-0007u0-78
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:19:46 -0500
Received: by mail-wr1-x432.google.com with SMTP id d13so8758008wrc.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+tNfZXks0AfgGeVgRmCcNJ5lvfvk4oLjTnHoH0ByjE=;
 b=HarohGQOi5qZ/544EIpev7qVzZqcgpFMcQl/DHeJhEtkE4ohahEV/kgfBykl/g1D6W
 kiY372en3shZ5RK2pUiaYzDTwysPS9UAPZ2sMjH1+Aq18aFjZ5vz7GN4KdGhNcIlzVQH
 c5nLWMpHmWQ/4YHNKUCn/MJAyAGaU5AR2AN0Kefh8xYiv5BubSuzQc897BN7qLrEwCKX
 g+VqzGpE3KrolkYqhvdYf+oVlk+fD+BR9iTj0cwV3gHxLpiVn4JETUAEFhZ8P4V0oPuT
 FMmjkmcbGi1UF/8sJmzXbbWLVgzTmNwNpFQrrOmTQlX3DZoBGR79Y4QBW0PUq5KzJcDF
 2KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+tNfZXks0AfgGeVgRmCcNJ5lvfvk4oLjTnHoH0ByjE=;
 b=NSunpjfoS+k0lQ5QuKW1ufBNTEEwo73fPUp3hAeKiqsR6AMNAaNbzhEjYVEXh5vfTT
 Kl8ihYnqp6ei5WNxeo8rEWI9nUVn8YPujgC6BLvcvbbeeIi+97Fr9BcbQMpNRYlebG1J
 6u6MkodELMuQiCJZ687eApZjMuaFeBdL/lSNHpTOUWpQw9SdhtKWTDS9OtFntrkLRqNX
 aURdtthW3KE6xdwZfp9qT1YP+YLcZyXMSB8bOZTj2nt5EVqSDUkdJwCxfu4EmrCg7VCx
 3SSlOSxROpnxl1ECk7XlM1er+pqVCxb+6cUMaKmnYibWxuUMUY3AwuTyyztr3+BirIHw
 JeSA==
X-Gm-Message-State: AOAM531xgSBaHON/LNQYOKz5qQNnfwAyIEXk7kqWvBySl9xvEH2qC/jx
 Xi3SfqreZZH28rVelaZkoN8Y2Q==
X-Google-Smtp-Source: ABdhPJzd0DDeuGDP/cc2wBdtcTf/lqDHFBDd+3SHHadL08F8yxLQo/0GirDDOW0cDCXDAVdxF1LY+A==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr3389604wrn.88.1610108383374;
 Fri, 08 Jan 2021 04:19:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m17sm15009629wrn.0.2021.01.08.04.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 04:19:42 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D134E1FF7E;
 Fri,  8 Jan 2021 12:19:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] Makefile: add GNU global tags support
Date: Fri,  8 Jan 2021 12:19:35 +0000
Message-Id: <20210108121935.640-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
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
 Makefile   | 9 ++++++++-
 .gitignore | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fb9923ff22..66eec99685 100644
--- a/Makefile
+++ b/Makefile
@@ -253,6 +253,13 @@ ctags:
 	rm -f "$(SRC_PATH)/"tags
 	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
 
+.PHONY: gtags
+gtags:
+	rm -f "$(SRC_PATH)/"GTAGS
+	rm -f "$(SRC_PATH)/"GRTAGS
+	rm -f "$(SRC_PATH)/"GPATH
+	$(find-src-path) | gtags -f -
+
 .PHONY: TAGS
 TAGS:
 	rm -f "$(SRC_PATH)/"TAGS
@@ -279,7 +286,7 @@ help:
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


