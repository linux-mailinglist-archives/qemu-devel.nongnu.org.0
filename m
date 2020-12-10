Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069D2D664A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:22:51 +0100 (CET)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRWb-0006YA-NZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knRN7-0002Gi-1Y
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:13:07 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knRN4-0005wm-Gt
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:13:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id q75so6419291wme.2
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fOr0XArySi+Z0qeK90fLBYF/Fy8ZvCV112uZ64g+PY0=;
 b=Hz+Q4xBT8Brp6EzB5j2JvG9q3m/CDRWzGkT7U61Nq5UYufXb3UJ98vtpUX2YMRi8de
 TVmHm5Qng4yjAVMJj+EUJDhLk+RB0GVBEQbgQ5ZMvOTVdxK736CYfFgKRHunf36tdzlq
 zXluHyDcrkLIpK+0xgw4iEXJSeQrive++lH9lRhuTWV13/yIyGoOOguy7Cgn8n8kNdYY
 DnHiX7ZSWYV2AjIhxpq1hZwo9ATtpf7YD1B0P+xFttIX0oCMc8gvPA1id3Eqsqd0vyLQ
 7zUZGlIJZFeDprEjhutNiz/zfPgs1Ei5335AyK5DbSMvXcWgwYZLAiRgFgkGPPfGtgpH
 t8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fOr0XArySi+Z0qeK90fLBYF/Fy8ZvCV112uZ64g+PY0=;
 b=r6JnflMAhk/bW75oPQ+ZQnPtLkh0EhgVO2ntsNDrgKlJePbLQYUjjLIhW89A4OZNiH
 j72ya5u432oFcXYQRhKDHbJv++19BlOvjQ4J8ICyp+6C3xzsmpr1Qt1oU14XU4+scTV3
 GAPc5whJk2hev+PjxU2bNEpFi0kv6PNme+WnL5nMMI6mH6wCzS3dhmNAvLQJEUxp6v2A
 e+hGXk4Lyot0Duaf9WRX04XT1Pmj0zAFrS7XMK2o993fGYZ2V1GVsOBwvP6YPq74tF8I
 m7IOF+0z8xDRZQN1f3MP3cyevaZaw5ZqW3B/OZuyZgvs5yE9Nc9XJ3KUcjEXb938b1Z/
 YGmA==
X-Gm-Message-State: AOAM531hO3aYli94OUyuKL1OKMLQpWhwxMrEPQyFBgk1oH9sG995OqF3
 5syrFVblu2E9ZmuvufCbEaBg0g==
X-Google-Smtp-Source: ABdhPJzn2e3nZ39EghMZAY0i36i30gksM2DeBhPclwIJOcFfSuUjD9EI04+ra5AavLcbrFJ3k11TAg==
X-Received: by 2002:a1c:f715:: with SMTP id v21mr9964274wmh.2.1607627576943;
 Thu, 10 Dec 2020 11:12:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m4sm10504135wmi.41.2020.12.10.11.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 11:12:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 97A521FF93;
 Thu, 10 Dec 2020 19:04:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 7/8] gitlab: add --without-default-features build
Date: Thu, 10 Dec 2020 19:04:16 +0000
Message-Id: <20201210190417.31673-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210190417.31673-1-alex.bennee@linaro.org>
References: <20201210190417.31673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
v2
  - swap with centos8, don't include --without-default-devuces
---
 .gitlab-ci.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2134453717..229545bc03 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -521,6 +521,13 @@ build-without-default-devices:
     IMAGE: centos8
     CONFIGURE_ARGS: --without-default-devices --disable-user
 
+build-without-default-features:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-amd64
+    CONFIGURE_ARGS: --without-default-features --disable-user
+    MAKE_CHECK_ARGS: check-unit
+
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-- 
2.20.1


