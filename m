Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B853FE49
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 19:00:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLW7P-00080X-84
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 13:00:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLW27-000491-0y
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:55:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLVzq-0000q3-T1
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:52:47 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hLVzq-0000pD-Lz
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:52:46 -0400
Received: by mail-wm1-x344.google.com with SMTP id n25so4588964wmk.4
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 09:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wZWYsS060hsAv0hcVng0aTY1nyv7SpuxTkdVT9m0hYA=;
	b=cJ7JBAThq59DcGlYEYT0hkikYdfNKSnodyjWN6r5G5laALGyzmT2he1aO7nuKfdox2
	X0V5BWx87m+c5FMyO8lEBfGQuCa7yCyjQTenrSKtJUBThdA0CnetXh5UeiM1m32ydFBx
	AnWVpP9Z3BcrRIPyePK0LQQM4PyO694DPFAlrx2+zc65dDvTSJGxROMUzXwmLObw0p4M
	uXN2oY7ksZhPHamFP4HVg/W2qNneLgLJwgKUwlIkp5hShXI/a29i/sl4H6JiaojOjpV/
	6kzxakJZsewVG5zVdJvawS+qPCpcut6RBQtNNJ6UDH3OaAkMoCtElgSWWTj+uJtbptCs
	CDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wZWYsS060hsAv0hcVng0aTY1nyv7SpuxTkdVT9m0hYA=;
	b=OMZ6GnhGg8OPPbeM0TSVJjJejBOycjE3OWRo/0olGN7OdHIJO0Ef2xv3naOe8UqJXT
	JVt1rhe68SrRLn3YJL6fyvYCjxOjM6Qf00+OESXUAJ/xU9yUs4PC3AD4onlFenIS65gk
	eLagA63LYTgviucfiOn+BJ9ktKFo7QXci8ieHB43aCQdbdU2+Q8ncGHeNvjGS8J1umny
	YfYRkYg1v1xPWC0MZIWSiOcA5COirpyEVZXTQU3FzALL4PwYxjybWmbGsZDl2mNxdGvu
	c1OyVpZxOzDn7d1/CwC8GKo1EEI4GwHNOkzFfYR1lyyqXW6KfLT1idy1tVbLAMhClliL
	Ag0w==
X-Gm-Message-State: APjAAAVoxFdeTsjwQ9wKp932LLC+Palt7RZyztovpMYD3IRJ5KrrPWR2
	ZLceBxOhbYFXs7w6dEKXzD51Dw==
X-Google-Smtp-Source: APXvYqwcG3A0Umk7aZ/TDdbmUlAVXCljPeL8UOGZUhNeB63qwWfVPuVAXzmLcfTpj65XiIzgrJlWyw==
X-Received: by 2002:a1c:7005:: with SMTP id l5mr3848619wmc.149.1556643165639; 
	Tue, 30 Apr 2019 09:52:45 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	k206sm5305271wmk.16.2019.04.30.09.52.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 09:52:43 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3283F1FF9E;
	Tue, 30 Apr 2019 17:52:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 17:52:33 +0100
Message-Id: <20190430165234.32272-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430165234.32272-1-alex.bennee@linaro.org>
References: <20190430165234.32272-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH v5 14/15] Makefile: include per-target build
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 45dfe1b585..bb17b0d692 100644
--- a/Makefile
+++ b/Makefile
@@ -992,7 +992,9 @@ $(filter %.1 %.7 %.8,$(DOCS)): scripts/texi2pod.pl
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


