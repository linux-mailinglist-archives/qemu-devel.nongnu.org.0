Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229A92C3CE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 12:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVYui-0006PR-8n
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 06:01:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYkC-0006KW-HZ
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:50:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYkB-0000Dd-Lc
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:50:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hVYkB-0000Bx-G3
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:50:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t4so11188201wrx.7
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=79nJW5T4D7aoXIu5nhSS0urKMSp7LqAnS25nzREggJc=;
	b=wxLFo8ABdV6ZMu4Dr0uWkA0GSGOW7cpBVxanG6c10JuP6YRYI/2DBey02q1XL+1ko4
	EjYQYkRIiK+WE1wdkM75a2F08Lw26874wkslCpWAnVif2t2zYPz6ijgENNqyqLMWEXWs
	EziJyM1V1tK0/Ug6dcc+EpVfq/f1+Uiu9ZwUXiSNkPgV9SQrJ4cQSHzpmDswfFwkJ2Nt
	4Y4M6bNP2RuEcARtFuow5vZjvy9LS3Vh5KxQTDgnVF+D5/1aEr3ZIRHdien71TLBcbjF
	Mnzz7kTT0zc/ZsRk+8WL9dM0eIh7yzQ3kPoqI8WjLyFsq+2ERN3s5ZDYjcy/NBjewKpF
	3Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=79nJW5T4D7aoXIu5nhSS0urKMSp7LqAnS25nzREggJc=;
	b=LxvN5jIa3Op6/JiktaEjUS2ihV3evpVqX3TeB1ylhPD7ND+IVQHEvCxdxKZKSSTdYh
	Fpxp3ZjWHiXBv7mxrWto0XngPdOjyiURL/LyqfXR0KkVm1xtgNIHGbhThErGY4GsbgHJ
	zgXxDiPgF2Stpa9hZSmQeQlNRh6bOZrXaQdaONcRl0wdzd9CpoIKzNqW9qBJOwH2JPiL
	1/WbA6pJTnC723jMwdFshA8OrFsOi0jlsT9JX5SJA+/XaVumciDezFLWbH7OSLIfv9C7
	zDV8qXTfL+0wKWoTUGRL5xeFVazdGkAQ9hVZFezfBSY05ZbwhIAGnZveQVN70Ox+eO+W
	bZfw==
X-Gm-Message-State: APjAAAVEsZNrx9tmRyVvU9aYZdRC6Umtnu7KtdtGSeqYkCmMLDnmj7wo
	aJjXrttu4myko5/lXn724OZcKw==
X-Google-Smtp-Source: APXvYqzteNUuFJe0GPhhwFOgzPiz43pza6rlyqB7CDgZAtt6BFWP8b9Cak1AXKqTqnB0GP2NbjEl7A==
X-Received: by 2002:adf:dc04:: with SMTP id t4mr232230wri.126.1559037006369;
	Tue, 28 May 2019 02:50:06 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id 8sm2376798wmf.18.2019.05.28.02.49.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 02:50:03 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 909E01FFAB;
	Tue, 28 May 2019 10:49:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 28 May 2019 10:49:49 +0100
Message-Id: <20190528094953.14898-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528094953.14898-1-alex.bennee@linaro.org>
References: <20190528094953.14898-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42d
Subject: [Qemu-devel] [PULL 24/28] Makefile: include per-target build
 directories in coverage report
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/Makefile b/Makefile
index 73370874841..f0be624f471 100644
--- a/Makefile
+++ b/Makefile
@@ -1009,7 +1009,9 @@ $(filter %.1 %.7 %.8,$(DOCS)): scripts/texi2pod.pl
 %/coverage-report.html:
 	@mkdir -p $*
 	$(call quiet-command,\
-		gcovr -r $(SRC_PATH) --object-directory $(BUILD_DIR) \
+		gcovr -r $(SRC_PATH) \
+		$(foreach t, $(TARGET_DIRS), --object-directory $(BUILD_DIR)/$(t)) \
+		 --object-directory $(BUILD_DIR) \
 		-p --html --html-details -o $@, \
 		"GEN", "coverage-report.html")
 
-- 
2.20.1


