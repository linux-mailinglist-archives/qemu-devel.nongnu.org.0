Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223B2D6623
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:16:33 +0100 (CET)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRQV-0002g6-Uh
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knRFI-0005ey-Gp
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:04:56 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knRFG-0003YS-Ml
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:04:56 -0500
Received: by mail-wm1-x32e.google.com with SMTP id q75so6399518wme.2
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Ljxk/uXQM3bsoRQvRjoyvCq8yL7VEKoW4ANVKJfZB8=;
 b=Cyok9wxoNfiOOghhFxdz8R28FOPfz/TjtFzC8jQmai/6YN7o6NrdS8xlDfZL5JDsKb
 sMM4qQIeuqGPfi4xeCjY5qNLKaYbMol7vAP+N+yj2gVdMIhYjCajipgyEwZ3v99jpwq0
 cUe2fs+4cfEM7ZrbO6csxnRI4qEqg5anAYJ0HekkgvSGigOjA6amRhuXG2wZV3BMvfsZ
 wvM6OmMfL+H+HKxUk0oabjDINSAfD5p4zuMIOj6F+U1pFxKhoemH41gVoxHrzTu7K+ZW
 mi4x9VPOmMYu19RVbtiGLpRb//fplCTl/Ktjd6xhtJWbmWtEVfba/iHVQQXic/y8hYiv
 p5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Ljxk/uXQM3bsoRQvRjoyvCq8yL7VEKoW4ANVKJfZB8=;
 b=CCSNB34wBOpVelxnsrKLv7yF+y5XhiVN9OgRPm43Nw4ewqg+/zJeUPhHwdSleYPQyp
 adrxllen2Rm9nM0C6OELyLPCCockrHKiFt5tZXRUMp7sSGwFwK9xpx8N1Wshbgs3MoNk
 xqSrwCVYmoAnCvWAjycTLLQRAH0kPgG11MmQjvIhYuhVE9trRL3UwAneStFUm0oyo1ze
 kGj+k3M+HLr3eeFWiRwgL51cZl22+GbuwE8X2VND1PAtnhSjOZ1k65c12x5Au1fEWH5d
 mbO2uFPbZD+hvTQ1vdZYeq5lsValbMhpW/quvAo98IMNXDi9nvak9y6cfcNFPIhNxhUk
 +tlg==
X-Gm-Message-State: AOAM532ekKfharPil4rBn2DxGY/7C5wIwvFnK8fBzvns41V+3fT2nGEs
 tv0rZAGudVXv569ABm/GGdEPIw==
X-Google-Smtp-Source: ABdhPJwYRoF30Walg7UB6QNzpWbZ3bvg8GO8eV7V21ygJ8o5A1xoP2sW0BzXeYDbz3nGz43+496NLg==
X-Received: by 2002:a1c:6856:: with SMTP id d83mr10082175wmc.119.1607627092508; 
 Thu, 10 Dec 2020 11:04:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m4sm10471605wmi.41.2020.12.10.11.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 11:04:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B8C21FF87;
 Thu, 10 Dec 2020 19:04:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] configure: include moxie-softmmu in
 deprecated_targets_list
Date: Thu, 10 Dec 2020 19:04:10 +0000
Message-Id: <20201210190417.31673-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210190417.31673-1-alex.bennee@linaro.org>
References: <20201210190417.31673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

We still build it but there is no point including it in the normal
builds as it is ushered out of the door.

Fixes: 4258c8e221 ("docs/system/deprecated: Mark the 'moxie' CPU as deprecated")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure      | 2 +-
 .gitlab-ci.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 18c26e0389..8f2095a2db 100755
--- a/configure
+++ b/configure
@@ -1610,7 +1610,7 @@ if [ "$ARCH" = "unknown" ]; then
 fi
 
 default_target_list=""
-deprecated_targets_list=ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
+deprecated_targets_list=moxie-softmmu,ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
 deprecated_features=""
 mak_wilds=""
 
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98bff03b47..b3bcaacf7b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -355,7 +355,7 @@ build-deprecated:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-docs --disable-tools
     MAKE_CHECK_ARGS: build-tcg
-    TARGETS: ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
+    TARGETS: moxie-softmmu ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
       unicore32-softmmu
   artifacts:
     expire_in: 2 days
-- 
2.20.1


