Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE2940FDFC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:36:30 +0200 (CEST)
Received: from localhost ([::1]:54406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGqj-0006yy-9T
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeU-0003ZW-GZ
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:52 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeR-0005Y1-3r
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:49 -0400
Received: by mail-wr1-x431.google.com with SMTP id t8so9079748wri.1
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1NbYVxtWF/zYfxwuek6jd8ckhiFWufAXDeqjCWqUsbg=;
 b=SIbv10lVcAuqGYxPeMygWxQTm/+I8LQ6OeHmnqLtneZZTm/V6+RkMs/6GMtTTWeJ83
 UWZi5K9VkEWp//miIBrwi1zIhdSErQ4iP05Lp4Ne7x3tihqeCJnuqr+I9AaBDxWG/sib
 KVCMNYN/WSbF/B+tFm2CfksggdCRzTj3bdOO3oXKb6s/abnJzN26nfugOOalt8BxI+y0
 jMYjeCLeHqdifUn3vQsTZT1uN+X0mPeMMYicBEb5an/ieIxsU6m3KN4upKd0bwLa163b
 GYAOnsV9BN30PlgioipXyH/e4ZbXBF8TPrJN7+WKoUSUMXHUKVJc/ZqtpwcEKDtSR1yw
 gx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1NbYVxtWF/zYfxwuek6jd8ckhiFWufAXDeqjCWqUsbg=;
 b=nux4rsjU07w1v+15GJ2RH9cFRfvj4h4pVvCcBkPghNLJDsLVmw2wB0svjymEZpIQcm
 VHnD6USVoGSkKyg5LHElJtFor7NVkXYcKOake9By8o3JE3AeSTO6a5TfvM6xaQHG0I0O
 AGx7BxtPbjdtuiWm8imFvTn4YNL+J+hJO2zdPXmwznoGFldAq39vl9iTaRDm8r7cCJFg
 9Yy92/KXHT02B0jjbbV8y923NA7ExuROeaCzU5IvX/R9yxesA+c+NOz9OH/RFWkX1bri
 fbcSyQcafoa8vcV4JZ6DCMI78fm3cmlZ5pUBH7Yj2mM6wxVivdfvC9ZGC8FMHgdthiYC
 pVjg==
X-Gm-Message-State: AOAM532GjrUMKkIshjerEA6v2c4hxa29VyhPm5ICZMeo6DKb2lDRuDqC
 6NiIEKM0NxVAAPV2+GUEhX9/vBqpu2bsMQ==
X-Google-Smtp-Source: ABdhPJxVCzsKwalRvR5SRqMGQze/V7kfMpfF1+lgJLPwQiUWqXJZZ+XOnbonnH1QRJjjl8svUgnTCg==
X-Received: by 2002:adf:f48b:: with SMTP id l11mr13136697wro.254.1631895825755; 
 Fri, 17 Sep 2021 09:23:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l7sm10455746wmp.48.2021.09.17.09.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C81FC1FF9E;
 Fri, 17 Sep 2021 17:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 07/11] travis.yml: Remove the "Release tarball" job
Date: Fri, 17 Sep 2021 17:23:28 +0100
Message-Id: <20210917162332.3511179-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

This is a leftover from the days when we were using Travis excessively,
but since x86 jobs are not really usable there anymore, this job has
likely never been used since many months. Let's simply remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210917094826.466047-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 0faddf7b4e..41010ebe6b 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -305,26 +305,3 @@ jobs:
         - CONFIG="--disable-containers --disable-tcg --enable-kvm
                   --disable-tools --host-cc=clang --cxx=clang++"
         - UNRELIABLE=true
-
-    # Release builds
-    # The make-release script expect a QEMU version, so our tag must start with a 'v'.
-    # This is the case when release candidate tags are created.
-    - name: "Release tarball"
-      if: tag IS present AND tag =~ /^v\d+\.\d+(\.\d+)?(-\S*)?$/
-      env:
-        # We want to build from the release tarball
-        - BUILD_DIR="release/build/dir" SRC_DIR="../../.."
-        - BASE_CONFIG="--prefix=$PWD/dist"
-        - CONFIG="--target-list=x86_64-softmmu,aarch64-softmmu,armeb-linux-user,ppc-linux-user"
-        - TEST_CMD="make install -j${JOBS}"
-        - QEMU_VERSION="${TRAVIS_TAG:1}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-      script:
-        - make -C ${SRC_DIR} qemu-${QEMU_VERSION}.tar.bz2
-        - ls -l ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2
-        - tar -xf ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2 && cd qemu-${QEMU_VERSION}
-        - mkdir -p release-build && cd release-build
-        - ../configure ${BASE_CONFIG} ${CONFIG} || { cat config.log meson-logs/meson-log.txt && exit 1; }
-        - make install
-  allow_failures:
-    - env: UNRELIABLE=true
-- 
2.30.2


