Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EF27B1A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 12:53:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTlM2-0003kC-FY
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 06:53:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hTl2o-0004Qm-JL
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:33:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hTl2n-0006el-HO
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:33:54 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hTl2k-0006bj-L3
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:33:50 -0400
Received: by mail-wr1-x444.google.com with SMTP id f10so5685835wre.7
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PsZHZmw3xAVptlffZztwV7zF9bHQW1aIOcTlgJe374I=;
	b=HvojMY9Cf7/Y6wOfRmYPD/U95c8vR+ouLycol6OmCvb0b3baeAG+VMqbHFcMijrwYz
	5W64RIp92X4UMV0ZL2VZAL8TF/u4LKQtlfGxyfHeYizS+ktu+aeN7O3ncv0SK++dgJGo
	lhhR8k5kQy6b/ZlLOiBKxVhdIoRmYkp3UNVN1aMYu0E+yMG736AxlbJ8alcDftYl5HTP
	dvQH/4hzeIqWsz4bJD9/qxb7qKbJpa0nMYMQWVfZ30yCphvT8BiFa0J7YhhIY+imOn5s
	1avT49dU1V+5/QYTEnZIe1RW28AmHCcgKpJwAEgtPv2buKo+ex11ZAGu2v3U5Ya5yyGA
	xB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PsZHZmw3xAVptlffZztwV7zF9bHQW1aIOcTlgJe374I=;
	b=IRDnZX0YT/SUL8nmPYtjK/PNgon7tXp99uLPhMSd5PgxJRGHJy6bJr3mHhWpw4XL3d
	A/GHW/aAo3TjTBUQ1hBCPqb1AB4GeqOjK91CDOkhW57M7DZ55s4QPnJn21asnjwBermh
	bqu+k2+JRaRhjalSm10qWR4dEMtn0PuhJ+BGFo2r2HQsDLHShnOAZpFrHjY2flDH3kMC
	OAQirRGvm8KtkvEuMkFEM16goaCaVycGiEF1wDD3z1JLa//FXqMQFeISWAzn9rc/S/Yy
	MsKJ3zdWmrGYW42CgsaXN0SGyM7CoMSc8Z6TLfjhaNQT49hKU8/1rCzh7pPI3eVjJbdk
	8KSQ==
X-Gm-Message-State: APjAAAXeGy2Sdsv3Helam/rVvDoROjob6ehUuqV6Fm85A+OAOrGeb/BY
	4GtX/0gEriykhjdTNav3aKxoEw==
X-Google-Smtp-Source: APXvYqzRwVqRb00beBwB1MQ2ARnC/AWeJn5RDgsEtzU/UCUUJcvFr5+XUl1/dZ6Gs0Xc5uz+rcf9JA==
X-Received: by 2002:adf:dc4a:: with SMTP id m10mr58839475wrj.0.1558607628719; 
	Thu, 23 May 2019 03:33:48 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	l16sm44115770wrb.40.2019.05.23.03.33.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 03:33:45 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8DEF01FF8F;
	Thu, 23 May 2019 11:25:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 11:25:28 +0100
Message-Id: <20190523102532.10486-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523102532.10486-1-alex.bennee@linaro.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v2 24/28] Makefile: include per-target build
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 40561993c40..e8a886aac79 100644
--- a/Makefile
+++ b/Makefile
@@ -998,7 +998,9 @@ $(filter %.1 %.7 %.8,$(DOCS)): scripts/texi2pod.pl
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


