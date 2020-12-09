Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5612D47B3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:19:06 +0100 (CET)
Received: from localhost ([::1]:52538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn37J-00058t-2v
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2q6-0006bZ-5I
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:18 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2pz-0000sB-Q2
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:17 -0500
Received: by mail-wr1-x433.google.com with SMTP id a12so2520319wrv.8
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nJvx+P2PZRrp618YFcEGq6gl+sZOUOOwd+CTLwUpasY=;
 b=bpjpT+1qbs42N1PlZCVHZ+VS4Ky1IUELh3emZiSRqrlhlc8At9ThP8npUzh0eJxk8b
 +BiPg5Q9eS+XPSFve9qtloEL8nZbl3Y16XZqTHL1mY8krH6X3tFRZSP/J+M9gjFPYh79
 qj+/r+fzsh/teRuLSbYx5DHwGzBOm+krbQVs1EcxYRcXot81OjjfVdeD/CPlJneCjjAC
 hShF9Plac0Cuijrvqli+Ibf3a/0EHqUS+ih+F4A1bx+EoCYEZGRboG4tTqQiphLF8vYC
 FmUCJWKbPvwoSR7v5kNF0HhPpN/Jep0l0rzbv5VmvqE+sOQxJouPtOiq/g+azKOk3Prj
 lF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nJvx+P2PZRrp618YFcEGq6gl+sZOUOOwd+CTLwUpasY=;
 b=R1Cm6NxBP3Mr8BiRv16c5pJ1ESAL8D4fUMXGzMoEQc4engQlTIjUpF/g03I6qbwgLO
 6nfee6dzidHz1hZ2nWVwaARgTMNvP5dweM3IXOeF8u7jPw+aIeZzhdcwCMJb+m1f1ILc
 eydkafbnKeuDjySur+/Pjzil9aabzWmW5bypUYtiyuFr936HX8J4eWk3+gcRmk7p/Wu2
 2UgKlUWzW3k1BEaJsYb3ej0x+v5Hzk4J0HWvFLEY1PZUU7moOHYxFZ5IecgRZ5SiSC/g
 MSYZymFG6CMAlYMVMuDnYmCGlNs4iXM1kBJPZpbFztk6teUUB8YyElbF65cG+Cfh5z7W
 lnuA==
X-Gm-Message-State: AOAM5324/33wB6/ICj9KtrKyxGBZqEbTjFyL97C1r8j4Q+lOqWZzWYfa
 CgxcUMEQqCYOQ9MQP0hAjm32iw==
X-Google-Smtp-Source: ABdhPJwM+Um8rFSqfDvO6aQSxjAkLumfm61o8WbLWugrlaPxHBJwrt751AKWZvq/Q1Im4Lj7Yx3B1Q==
X-Received: by 2002:a5d:558a:: with SMTP id i10mr3827663wrv.363.1607533270255; 
 Wed, 09 Dec 2020 09:01:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d15sm4401716wrx.93.2020.12.09.09.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 09:01:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A88F81FF91;
 Wed,  9 Dec 2020 17:00:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/6] gitlab: move --without-default-devices build from
 Travis
Date: Wed,  9 Dec 2020 17:00:58 +0000
Message-Id: <20201209170059.20742-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201209170059.20742-1-alex.bennee@linaro.org>
References: <20201209170059.20742-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
 stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 7 +++++++
 .travis.yml    | 8 --------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 21b01c0547..878d114d40 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -434,6 +434,13 @@ build-trace-ust-system:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
 
+# Check our reduced build configurations
+build-without-default-devices:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-amd64
+    CONFIGURE_ARGS: --without-default-devices --disable-user
+
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
diff --git a/.travis.yml b/.travis.yml
index 1f80bdb624..e89996c111 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -224,14 +224,6 @@ jobs:
         - ${SRC_DIR}/scripts/travis/coverage-summary.sh
 
 
-    # We manually include builds which we disable "make check" for
-    - name: "GCC without-default-devices (softmmu)"
-      env:
-        - CONFIG="--without-default-devices --disable-user"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-        - TEST_CMD=""
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
-- 
2.20.1


