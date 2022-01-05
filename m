Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093FD4853E3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:57:04 +0100 (CET)
Received: from localhost ([::1]:48956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56mj-0004YH-PM
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:57:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gQ-0008Bp-BH
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:32 -0500
Received: from [2a00:1450:4864:20::530] (port=46922
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gM-0004Cj-Ra
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:30 -0500
Received: by mail-ed1-x530.google.com with SMTP id n30so50121071eda.13
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9rEXAQ0TEcSesUFcERkx8CpzKvMkuXgvL0VoFPLCQg=;
 b=D5wLseYZMPI91len9ShY7FRLxhKMRsdz+bI80aDQyf1ZtRV0o9qy9FwLOErQjm9JmT
 KpUA01aBK7jx2CLOfXkb0QoizpVCbGRgdkCKS5JODW8qNLkb9LIl5itsiiZvemilG4t3
 QdeODufi+QMGbWDoBkGz6QWYGMfWwO5A4mrWhF+Zk5l53XGNb8qIdLkvKsZb2AYSX+Nx
 wztNywRYImvlYT1E/SL1+TiVQCPoEx8HokRYtazBTNtSy0+SmIwv9HUcL4ubgqwpDhkS
 hN5QgmmQLjvgKcgBv992kpcKqOsWQtkjN1ZLoQzNjsjjjfbIkySdOuf8qGtXSILEpNZc
 6D2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9rEXAQ0TEcSesUFcERkx8CpzKvMkuXgvL0VoFPLCQg=;
 b=CLSR9LD8pLWq8uwtZE9EEi/edYJHflwG2DtpRNEYTkfK7Wyony+KcnFd3nSM3Nms7c
 VQ3grxUZ2wjBtP7181nl24fFJAdDle5K+aWymTQM0nFduMzjiUGQTZ2MW3Ky55wMOzoa
 XChZx0RDtknaxxEZcjogPuH6oO0Nnp263y3RSpV7v4EBc9Z889sgUPkRNUMGtMPZPtHS
 wf0WRbnnAwYvhdw3Hn3uEBzqdiFN082a7in7K7/1A4+CLT9usbA5G2bUUYymz5b7qLCc
 KjncGblyIycftpeKcmXVobYWCycIV075oKtRwyTYw+607h7QSaXUhxMjcNCeS2okD4+B
 ybfQ==
X-Gm-Message-State: AOAM531ocTHq3ik3Awyb8HFDnRXXJQcsnLvlLKim413Xd2+2DveOG5yF
 01wqJXtYdnMwoHvouJ0MuqDRZA==
X-Google-Smtp-Source: ABdhPJyV/SCoGe3OnMlmngNGVaZwz9mo74gqi/vpl2gDZ5ZAZ2KK7duswlcAusRlR9FnyKVCD4XRYg==
X-Received: by 2002:a17:906:729a:: with SMTP id
 b26mr42345791ejl.504.1641390619056; 
 Wed, 05 Jan 2022 05:50:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q14sm16048359edd.40.2022.01.05.05.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80D2C1FFBD;
 Wed,  5 Jan 2022 13:50:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 05/34] ci: explicitly skip I/O tests on alpine
Date: Wed,  5 Jan 2022 13:49:40 +0000
Message-Id: <20220105135009.1584676-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The block I/O tests don't work on Alpine because their alternative libc
impl emits different strings for errnos, which breaks the expected
output matching. e.g.

=== IO: pattern 102
 wrote 512/512 bytes at offset 512
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-qemu-img: Error while reading offset 0 of blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: Input/output error
+qemu-img: Error while reading offset 0 of blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: I/O error
 4
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 Formatting 'TEST_DIR/t.IMGFMT.2', fmt=IMGFMT size=0

Currently the I/O tests are skipped as a side effect of the Alpine image
containing a minimal busybox 'sed' binary, rather than GNU sed. This is
a fragile assumption that will be invalidated when the dockerfile is
changed to be autogenerated from a standardized package list that
includes GNU sed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-6-berrange@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 7e1cb0b3c2..e77aec873e 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -24,7 +24,7 @@ check-system-alpine:
       artifacts: true
   variables:
     IMAGE: alpine
-    MAKE_CHECK_ARGS: check
+    MAKE_CHECK_ARGS: check-unit check-qtest
 
 avocado-system-alpine:
   extends: .avocado_test_job_template
-- 
2.30.2


