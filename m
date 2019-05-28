Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B02C3F4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 12:08:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVZ2J-0004Mv-W1
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 06:08:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYtg-0006MZ-B1
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hVYtf-0005Xu-2A
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:56 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38501)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hVYtd-0005UJ-Q8
	for qemu-devel@nongnu.org; Tue, 28 May 2019 05:59:54 -0400
Received: by mail-wm1-x344.google.com with SMTP id t5so2126684wmh.3
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tMdbq3E1Luz0DkEOlhvxxv+uguLcXoXXlXySeiBWlSg=;
	b=VqYi1C0t0lGUV1dL44XxrhpFy4squdvxmCQkFTPVNc9tJcqHxKTd0V2EyDl05SLNt2
	gOqu948dCbPeV/ZcH9KrDGxgPYC1PMmunxa4XFdw9mcVyH03n3ACYJpbMLA5AZ96+8oT
	ZmQWHRLZc7Y66rzY2g/SDsV8ffAb0Hg8yYe+7EPHc95pbe9bvsgzzukM+WfyT3cP/+M5
	jwler63M/zVm+JIsPIpg1oWM41qaeakFKb3qdFb81A8FzMdZOpnMPotZtKXS5PWglnJX
	ywMwRxQoDDDsjvaTg7L7VtEa/1gBuKUlLpz7D8ApArWbKvrqCL4PkUkmxZ9EvKLCcg0o
	+P9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tMdbq3E1Luz0DkEOlhvxxv+uguLcXoXXlXySeiBWlSg=;
	b=m7pUINqXcaSQKjSBmdM0wQf+rqmgj7Gpm8qXJRjuKYoykNxazj/4ffS7R0z8O4VYIv
	ob1CWP4b+bbnmEzXImLu+IgecHFgMiSIqzY04cFTAEFK1UH/doVZeWONXqaIp9bRYsNU
	nTtRi9DyeFoYKvksC0HzMlGARXN8l6M7xePMmENsJmZiP5+R0UTKDzGlIabSPUvBqX1R
	LZTYGZkun3+k1zjZJcl5lUFtEJCnPHAVbGdP5k/PQgnXAmOAYlGFNf5fu+vRZAkucPpp
	ge4yFVc1txmGHcqLWXAOI72u069TxWqb9FJIbJPSRpxSxBTml/ankXXaWFQlXskP0Nzt
	nFkw==
X-Gm-Message-State: APjAAAUPMcT1AWx7Nbug+lKj7Z7mzaEP+BEtDJGP8FasK1EMzO1wx9U5
	AOhfRtbDhIg0nkNh8RoJuCea7A==
X-Google-Smtp-Source: APXvYqxT+6Ctebhb9mhT7Jeh+2y11ZsvLoYEX8srSkuH1iyXdHEE8jA3/wNSB15fArLukBu9mQhcWw==
X-Received: by 2002:a1c:9951:: with SMTP id b78mr2586995wme.96.1559037592148; 
	Tue, 28 May 2019 02:59:52 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id o6sm517496wmc.15.2019.05.28.02.59.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 02:59:51 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A31D91FFAC;
	Tue, 28 May 2019 10:49:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 28 May 2019 10:49:50 +0100
Message-Id: <20190528094953.14898-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528094953.14898-1-alex.bennee@linaro.org>
References: <20190528094953.14898-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PULL 25/28] Makefile.target: support per-target
 coverage reports
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

Add support for generating a single targets coverage report. Execute:

  make coverage-report

In the target build directory. This coverage report only cares about
target specific blobs so only searches the target build subdirectory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/Makefile.target b/Makefile.target
index 4ef4ce59969..ecd856e3a3f 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -238,3 +238,19 @@ endif
 
 generated-files-y += config-target.h
 Makefile: $(generated-files-y)
+
+# Reports/Analysis
+#
+# The target specific coverage report only cares about target specific
+# blobs and not the shared code.
+#
+
+%/coverage-report.html:
+	@mkdir -p $*
+	$(call quiet-command,\
+		gcovr -r $(SRC_PATH) --object-directory $(CURDIR) \
+		-p --html --html-details -o $@, \
+		"GEN", "coverage-report.html")
+
+.PHONY: coverage-report
+coverage-report: $(CURDIR)/reports/coverage/coverage-report.html
-- 
2.20.1


