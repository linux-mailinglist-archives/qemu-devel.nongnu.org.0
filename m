Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC97120B829
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 20:24:52 +0200 (CEST)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jot1v-0006UJ-Rr
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 14:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jot0D-0003kB-RM
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 14:23:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jot0C-000574-3Y
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 14:23:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id 22so9670312wmg.1
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 11:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vbgKfgzF0oNn2074SqLFMYEK1X+QIMzjn//YRC3OJSQ=;
 b=Ly/I8LaGFwdn3atTS2Vp1SEpTemt9xGPPNb2xmHIeAZ3JHwFSNpxBPw8RWq196afHF
 0Q/6Xik3ZVKabIbuuG/CW2lTET7x25nXWXYx76yuzzmGT/eo5beZtoTFV81zUCsz+5Q1
 TPofBITU9+5N6MGYoIbirqS+4hKy3czG+aNu6wwgap91sMSHWXKqVDtgYY+iL+OEISbe
 y13qaVIsXJ2AM8CgQIGg2V/mH9JxJGGasbHYWbWdOCG3KiO5XCJTtwWQ28aZFJyh4+tl
 o8KYmqczlhcrShGP6Hm6lZgs1x6DPpW5XYzP8Fai+zqRaAH8GQMWzFtyuXoIlm2q8Dy+
 mOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vbgKfgzF0oNn2074SqLFMYEK1X+QIMzjn//YRC3OJSQ=;
 b=KniArJOK0tPtqBirOk3ps6DOQuE8frFQ1BB1U4s9KjGAhQguMd/7EVkVbDRl4KM/7F
 uYg6rE7ikHbNplV3A4ttsry/ZGSOmzwdoahKf7vPMSeuFhgMvAHsY+4P3o29LIv5zp14
 YsBUqpplMNLtKzY/Hgw9gy068Y3TQLYcxcE/q3nxoSBcuz7ztkV85v7qO7TwnuSf+ke8
 TJ6HFMtHykW7pYjz+4a+OmWFl+IcK2a9ZR9e+CBSuVbgCWkm1OOhfW2uHp6GySQxxoc1
 EfaF+EGBMzhsXefxvxiLgB3/ARhf5js+2/kPpyFRtcYM6LxZhy7U2FcjDAM1ySRfFw21
 smWQ==
X-Gm-Message-State: AOAM532eMm+RWdt7ajGjy2N5HVf1t/W9+ZqziCFrVyQULYlaeo1GF99l
 fRr+rArTn7rIidcMc+auX4bRXA==
X-Google-Smtp-Source: ABdhPJwvcbLh7ydLb7v+IjdCTgL+lqjDDGQknIQjP0H7mz70ptkKFEKgtDGTajU/Z5gOfxrWw1hNAw==
X-Received: by 2002:a7b:ce97:: with SMTP id q23mr4784657wmj.89.1593195782665; 
 Fri, 26 Jun 2020 11:23:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g14sm4615026wrm.93.2020.06.26.11.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 11:22:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF6761FFB1;
 Fri, 26 Jun 2020 19:14:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 28/30] gitlab: split build-disabled into two phases
Date: Fri, 26 Jun 2020 19:13:55 +0100
Message-Id: <20200626181357.26211-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626181357.26211-1-alex.bennee@linaro.org>
References: <20200626181357.26211-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we run check-qtest in "SLOW" mode this can timeout so split into
two jobs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index eb5b335c1e9..c6f1addc2f3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -110,7 +110,7 @@ check:system-fedora-alt:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
 
-build-disabled:
+build:system-fedora-disabled:
   <<: *native_build_job_definition
   variables:
     IMAGE: fedora
@@ -121,6 +121,17 @@ build-disabled:
       --disable-qom-cast-debug --disable-spice --disable-vhost-vsock
       --disable-vhost-net --disable-vhost-crypto --disable-vhost-user
     TARGETS: i386-softmmu ppc64-softmmu mips64-softmmu i386-linux-user
+  artifacts:
+    paths:
+      - build
+
+qtest:system-fedora-disabled:
+  <<: *native_test_job_definition
+  needs:
+    - job: build:system-fedora-disabled
+      artifacts: true
+  variables:
+    IMAGE: fedora
     MAKE_CHECK_ARGS: check-qtest SPEED=slow
 
 build-tcg-disabled:
-- 
2.20.1


