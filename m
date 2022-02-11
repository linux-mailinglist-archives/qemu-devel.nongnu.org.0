Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A834B29B0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:08:23 +0100 (CET)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYT8-0002Em-V2
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:08:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOY-0007OT-TU
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:39 -0500
Received: from [2a00:1450:4864:20::529] (port=45608
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOS-0005Bp-C6
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:35 -0500
Received: by mail-ed1-x529.google.com with SMTP id ch26so17055927edb.12
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VXFQUYvPfMrD6ElMMpTu3MsKFqVvKrPYQNG+wDG/hYw=;
 b=xg+l1GBxMTGg1zmz+xor1Tl8qimil1O8lmbvpHU6pwO3U3kVco+GlOhWwBjzEvWARw
 WXWeBUYNQJ/yZOeFq8MYgodwW1EWIZ1a+zrDMydjr1keAshCHZJEKCNj8Ofm+QEnHqXl
 LgC8QXYfEkBMg/di45dtQg/TKwimO3ipsT3trl0pvl41l1ZAx39KAcPxrxKjotCmb/G9
 6U1+En7/gyhhqOzq+dWCzE112SKlIfiJSJCnN4o684kAqRWjw61n7sIakd/PMQFJWTdr
 3hXl8Sz0U9hgIFJO1tWBomnnjbzzoFkoDE7W43ZX36TJLjkDTE0fUbLdsNO8C6b0CFeh
 PWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXFQUYvPfMrD6ElMMpTu3MsKFqVvKrPYQNG+wDG/hYw=;
 b=vvwyWmUYetml/C3226SCeWjP2+YWwETmEaahZZ1+7b9c0cAqieoFQ0KDWaJxZObTln
 73murts2Hxsbp40MnvUzS3GjUT86nt6IO/Q1nP8FKz1VQqpvmV8Q66EMSCAWK46sT32r
 CdHc7V2XbdQb7wbnsyT93hTnG1jjQpTbWhCxrK1X+pyLIKVlOUDFVcrI2UNw7psvgk57
 zMAHsal2GV8Ojkv+s5PYid61vN2pwnSaq7r2LfPVcfHMYzYWmYTqn4LUQ6diiQQeoqGr
 vlSkgi8p+DzJ90TdpNNhrmjJ++QLWGwWVokevuMGP6qOKGB999ETDJ4eq41QHQOUTVEO
 mj4A==
X-Gm-Message-State: AOAM533bWv2hlkCwlDk4Sn73Eib5+93VDvFNuDIne9c0KpUc3aw8uZMh
 C6YkWTj/koGroHG4z2dqEGjvhw==
X-Google-Smtp-Source: ABdhPJzljRWBnpGozyt+R+AwtRPN8GPMm+gwb0DPt5K/CNRDObfbis6FpopMgN6pd3wMKEoPff0KzA==
X-Received: by 2002:a05:6402:4392:: with SMTP id
 o18mr2691493edc.338.1644595402014; 
 Fri, 11 Feb 2022 08:03:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e8sm1499948ejm.117.2022.02.11.08.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:03:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7AF251FFC0;
 Fri, 11 Feb 2022 16:03:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 08/11] gitlab: add a new aarch32 custom runner definition
Date: Fri, 11 Feb 2022 16:03:06 +0000
Message-Id: <20220211160309.335014-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although running on aarch64 hardware we can still target 32bit builds
with a cross compiler and run the resulting binaries.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci-jobs.rst.inc                    |  7 ++++++
 .../custom-runners/ubuntu-20.40-aarch32.yml   | 23 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index db3f571d5f..92e25872aa 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -44,6 +44,13 @@ If you've got access to an aarch64 host that can be used as a gitlab-CI
 runner, you can set this variable to enable the tests that require this
 kind of host. The runner should be tagged with "aarch64".
 
+AARCH32_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to an armhf host or an arch64 host that can run
+aarch32 EL0 code to be used as a gitlab-CI runner, you can set this
+variable to enable the tests that require this kind of host. The
+runner should be tagged with "aarch32".
+
 S390X_RUNNER_AVAILABLE
 ~~~~~~~~~~~~~~~~~~~~~~
 If you've got access to an IBM Z host that can be used as a gitlab-CI
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
new file mode 100644
index 0000000000..9c589bc4cf
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
@@ -0,0 +1,23 @@
+# All ubuntu-20.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+
+ubuntu-20.04-aarch32-all:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch32
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH32_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --cross-prefix=arm-linux-gnueabihf-
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
-- 
2.30.2


