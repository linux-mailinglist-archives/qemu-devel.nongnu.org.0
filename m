Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BC44B29D4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:13:10 +0100 (CET)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYXl-0000hM-6T
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:13:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOY-0007OX-VJ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:39 -0500
Received: from [2a00:1450:4864:20::52c] (port=43605
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOT-0005CB-2t
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:37 -0500
Received: by mail-ed1-x52c.google.com with SMTP id y17so15254900edd.10
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nsg6iN0TxVUYy9wfwn7Nl3aLnZ8BcKzvxieM1PeZndE=;
 b=bw2Y0G/k2cn0jwtqkvcOji9Kq7kj2TMbIA1WFfe+4Sg95zOC8Rm23qUSUj7m+/KXr6
 tXLROioQVZX256IXVcVhJ/qxfhxEWnYEjdk97Pqq9BkDg9gb+Q3McuzgbQ6TzaIqbVak
 YXu45F4FFnxB8tU4AJ3DSbtP3D0x7B/SiAE+Zv8KWX6cdn7t6unZ26WIzm7D5Kufer2t
 4Sxh21Yh2b7goNFD/r9VAKOF8wzxtb/VPC3mNcRVDiUxsJQr5qf9aktGrsXYkkHtfgom
 i3mI24eRhrLV2Va5HczppIrHjnWFYtIsdzMpFYfDjobjnZQ9Zx74a8cCizlAfRMFcDIj
 RPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nsg6iN0TxVUYy9wfwn7Nl3aLnZ8BcKzvxieM1PeZndE=;
 b=GFAelVX6IMsbkEvdPQBEDkj05Ys48sWNariapTNoo4+thNksW3KW3V4ifQb9PZJKHi
 fGMHi+HZtvA3CvWt9pUHGdrJJg2Aar/6me6qcWnYhV4QQdYEMVlFIWhlg+G6eVyAgoOP
 FzBMMR23jopkqEZC2jZlvH2JetL3DYPlkqMln9sXDMLe7G6ybQYcUQvmEboFuJ1MNgkG
 DkK4m50F2zkglZKKU5Zpjh+Rz53hKwOanM44popvrbUcZUfqLCbSE1kFDE5KpQB0Uz56
 4txHuNVQA/jNaFPpWWvegYkwBZtGzDxua2QbwhP8SahM4tWGGoMEI3uJYnzBNRidEWEX
 rdDA==
X-Gm-Message-State: AOAM532fTYb/2kN1u27iS0GKxzanFFQPaBGYgxBV+/I/lkCL2GNtv2nN
 4CHiCC5x4xwHJXfsdBEgwohwHg==
X-Google-Smtp-Source: ABdhPJyARBnFSPG+U7s8FDeNNH6AReHLmo8t3wdhO/7ZOrUYV7vltVLCFqvrEl+jYnAF2OZk42enSQ==
X-Received: by 2002:a05:6402:1a52:: with SMTP id
 bf18mr2647127edb.428.1644595404313; 
 Fri, 11 Feb 2022 08:03:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c10sm6891142edr.6.2022.02.11.08.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:03:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92E321FFC1;
 Fri, 11 Feb 2022 16:03:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 09/11] tests/tcg: build sha1-vector with O3 and compare
Date: Fri, 11 Feb 2022 16:03:07 +0000
Message-Id: <20220211160309.335014-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aim of this is to test code generation for vectorised operations.
Unfortunately gcc struggles to do much with the messy sha1 code (try
-fopt-info-vec-missed to see why). However it's better than nothing.

We assume the non-vectorised output is gold and baring compiler bugs
the outputs should match.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220202191242.652607-3-alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 10 ++++++++++
 tests/tcg/arm/Makefile.target     |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 1d967901bd..df3f8e9438 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -50,6 +50,16 @@ sysregs: CFLAGS+=-march=armv8.1-a+sve
 AARCH64_TESTS += sve-ioctls
 sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
 
+# Vector SHA1
+sha1-vector: CFLAGS=-O3
+sha1-vector: sha1.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+run-sha1-vector: sha1-vector run-sha1
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call diff-out, sha1-vector, sha1.out)
+
+TESTS += sha1-vector
+
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
 
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index f509d823d4..2dc94931c3 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -70,6 +70,15 @@ endif
 
 ARM_TESTS += commpage
 
+# Vector SHA1
+sha1-vector: CFLAGS=-O3
+sha1-vector: sha1.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+run-sha1-vector: sha1-vector run-sha1
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call diff-out, sha1-vector, sha1.out)
+
+ARM_TESTS += sha1-vector
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
-- 
2.30.2


