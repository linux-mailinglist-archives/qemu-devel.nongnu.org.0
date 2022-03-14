Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CC84D884D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:38:48 +0100 (CET)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmmV-0005rB-7r
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:38:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTlyK-0006vk-6t
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:46:56 -0400
Received: from [2607:f8b0:4864:20::1033] (port=47100
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTljX-0003OF-0y
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:31:40 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso14746980pjo.5
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FYL+LkLxs4Z2PgrcW/dEQ3VTA5KvjJzMDgm7bH/Tmtw=;
 b=KP4MjbsOtiDefOi2Byngi/NtD19/dNLcfm32riwHch/+LDRTb5kz9KNFd77VR4hH9X
 sFNX5YqsWnSr3sclSppUIRwEzI4ImJRRYq8pMLyDVXhS58L9NiEWtLl54sdvLC8A+bjw
 0zZ+ONS9ahI9C5fbCTE7j+1+zP2HoZL8wvVZ+AQ5IJCKNxDYi1ForsHl9WntH66mfg50
 lC1+wbTq7bn3v1VjyXCTFVP8WFjoM3/U/jLNJGIytsiXh8LZbFR1euv3INoMVYoIrspj
 dWgRHywLlZHSbqRFlljMkau8a6ZaYfWPefi1awRGuXFyv604T9jwqqsMZ9rjySXJVwHd
 sw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FYL+LkLxs4Z2PgrcW/dEQ3VTA5KvjJzMDgm7bH/Tmtw=;
 b=l51yw9CflK3RB4sEo0fkznVL68Ukrm7Z3PIsdgKRQiOpFX8NSfjK0zcb5Xr+Sd1DoO
 hOphpkJmtGffosp4myIkoWu2UA9zX6O6QRZFmhTWc55VoXwaOabwyaeD83PgZyWMm40d
 L6UDoFLa1Y3znw+5G8NPyFZq0ZhV2iqyrTIiyn4X5kvmLhw5F2xZgLxmKjq8K0sDDC9H
 7U29ZQjI0juyPrQml70yqOf7djmjlOrgtIiFxDE+BOMviuMpEagC7Gt0Lpge+nxt23h6
 b90qe0BGpWPhv3e2nEIQGeXvmD//mcU9Z3r0b/WTXi62foS6xU7az+LTwTIDFA0f6VXk
 u7KA==
X-Gm-Message-State: AOAM531FpgSK+ZF3YRWwLu/Ol+jRV2OEI1nx2/YiXyzNnT5Sx2kTtvId
 7fnSzQAD2TkpnLAqLL1fptt+J2LEMAI=
X-Google-Smtp-Source: ABdhPJxdmNXVsxTPHSCIUlUvN+UE/qNcT6h3k6lZNHMWKBFTFC52ifU4lkcqzpdqKK3zO23EXQchEQ==
X-Received: by 2002:a17:90a:ccd:b0:1bc:76eb:ea73 with SMTP id
 13-20020a17090a0ccd00b001bc76ebea73mr36189566pjt.178.1647268297387; 
 Mon, 14 Mar 2022 07:31:37 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a17090a1f8700b001bf1db72189sm18019123pja.23.2022.03.14.07.31.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Mar 2022 07:31:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Allow adding manual jobs on cirrus-ci
Date: Mon, 14 Mar 2022 15:31:30 +0100
Message-Id: <20220314143130.28503-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

By default, all Cirrus-CI jobs are added as 'on_success' (the
default value). Add a ${MANUAL_JOB} variable (default to 0)
to be able to add manual jobs.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/cirrus.yml       | 2 ++
 .gitlab-ci.d/cirrus/build.yml | 1 +
 2 files changed, 3 insertions(+)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index b96b22e269..9e640019dd 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -44,6 +44,8 @@
     # Allow on 'staging' branch and 'stable-X.Y-staging' branches only
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH !~ /staging/'
       when: never
+    - if: '$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN && $MANUAL_JOB == "1"'
+      when: manual
     - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
 
 x64-freebsd-12-build:
diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index c555f5d36e..c58dc86855 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -14,6 +14,7 @@ env:
   MAKE: "@MAKE@"
   CONFIGURE_ARGS: "@CONFIGURE_ARGS@"
   TEST_TARGETS: "@TEST_TARGETS@"
+  MANUAL_JOB: 0
 
 build_task:
   install_script:
-- 
2.34.1


