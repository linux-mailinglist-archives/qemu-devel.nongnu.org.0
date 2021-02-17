Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDD331D94C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:21:59 +0100 (CET)
Received: from localhost ([::1]:42244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLqA-0004dA-2W
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLoI-0002nB-E1
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:20:02 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLoG-0000QX-N5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:20:02 -0500
Received: by mail-wm1-x32b.google.com with SMTP id l17so1965463wmq.2
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qV5waBAMdWO3qnrnlPn9ZalPBhAFNnkmRpjSD/pQcHQ=;
 b=jHu82T4jI+IN7ZMMKtBmJUv7mJqpGkgyAfCthwMieDOyedwKate0CryRRjO8vF29Vx
 x6grVfSGH+IMo0rJsVAOSdkdBKGEgJCwu7z3ZCqV3HnpwIVjmr4IISUBwZNHEHK3SZTe
 mW4G5rd4UfxaQ+TwtRIGheZQfrDbmGQ9ggfiwWFYqYXS9GB5X6TZyrp5pvPQgwu5A5u0
 57vYKLDGLbNQKPkllpqwWlRQ6HSfBUfAK7UjuDlx1yJOCwn2YaA5cM9T1HfA7hZuj0QH
 7ystz/nKvTGiIuJ3DqTAcjr135tbtPk8T3ZkYCWZnfa58ZAfj/FH3dMTeq0Fr1jBpUFk
 Pkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qV5waBAMdWO3qnrnlPn9ZalPBhAFNnkmRpjSD/pQcHQ=;
 b=sSe0T4sreuyeG1JTulqnIWWoPCljp+F14HhQWUF0e8aXlabEypu0KWdvmcxUuGAwY6
 qqrK5nXyIaSV5ae0wK85TPaMZIRLUac8ucyPGdpTGOMTuX145Wg/c9nD03gX+EOTb//z
 kI9W9pmByb4/ul4Ds+lKyVa0CciqVZfVlg9poiawONxUucIcwZdrMDQNeLpfQUfuobEy
 4UusAp6Q6CEUmgcBiRy+3AiTniaQtuCILSVqW8uv/1nXlebWohU6E8SlVV1lk57A4xGu
 RL2aemJaqCRMAARFQ+DdBo0BF/Bj19mYOuqN68wPrE3nroYqiD54YN6MZxe+Sx6AjUIQ
 G/2w==
X-Gm-Message-State: AOAM530vtzc3fY1Vrh5+1vZE6hr67hsVEvrWr0Qr4mVO697F6rFWJgh2
 PDyJQuxT1O0DCCa1hk86dMF2Cg==
X-Google-Smtp-Source: ABdhPJybSFw9CcP13WnzEyN2EiGXVY2FuCAn9+9URFXH//BvHudCTclg2VYUBbh7Vrhm1rkQwir0aQ==
X-Received: by 2002:a1c:545d:: with SMTP id p29mr6831187wmi.54.1613564377972; 
 Wed, 17 Feb 2021 04:19:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k81sm2752534wmf.10.2021.02.17.04.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:19:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BAC1C1FF8F;
 Wed, 17 Feb 2021 12:19:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/6] gitlab-ci.yml: Run check-tcg with TCI
Date: Wed, 17 Feb 2021 12:19:29 +0000
Message-Id: <20210217121932.19986-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210217121932.19986-1-alex.bennee@linaro.org>
References: <20210217121932.19986-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

It's now possible to also run the non-x86 TCG tests with TCI.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210127055903.40148-1-thuth@redhat.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 234cead60c..ec327d0a85 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -520,7 +520,7 @@ build-oss-fuzz:
 build-tci:
   <<: *native_build_job_definition
   variables:
-    IMAGE: fedora
+    IMAGE: debian-all-test-cross
   script:
     - TARGETS="aarch64 alpha arm hppa m68k microblaze moxie ppc64 s390x x86_64"
     - mkdir build
@@ -528,7 +528,6 @@ build-tci:
     - ../configure --enable-tcg-interpreter
         --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)" || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
-    - make run-tcg-tests-x86_64-softmmu
     - make tests/qtest/boot-serial-test tests/qtest/cdrom-test tests/qtest/pxe-test
     - for tg in $TARGETS ; do
         export QTEST_QEMU_BINARY="./qemu-system-${tg}" ;
@@ -537,6 +536,7 @@ build-tci:
       done
     - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
     - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
+    - make check-tcg
 
 # Alternate coroutines implementations are only really of interest to KVM users
 # However we can't test against KVM on Gitlab-CI so we can only run unit tests
-- 
2.20.1


