Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCDB37BA9C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:32:29 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmAG-0000b1-1g
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzE-0003N5-Sv
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzD-0003co-7r
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id m9so23058990wrx.3
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7CQ/6kaWzCVdnPOK3LKkrtiffwfVdv2ArDXooaU7BUU=;
 b=QrJw/wShCkY0h46YkkVeNQ5HovIuaVxZwYmBjr0fmL3jUH3Za6rnw8c5kLOD1pfYCq
 HHcZ1almp2cygzHWTxVa65ftVedFNLQe3uxd7EtUY0Pn1S0bDD0yMc9d173eJpTSmVUq
 wA2kgQFUUNr3xno6Pxw3GlWIwnZjoB5ZC4YjvJkhBU0hQD3+B+JnenYDbuLCsponR8zc
 uK4Kdy/TBGQUzHyV9p87/i5YP1y4BkHRMp5riyjKI3tM1QP3o8mgLRZMouF6be3a48BL
 ZoHNKmIA/lPy8Yg9UfnZDWAA88u7J16uVPTbWskFhhTL9+YzyAoCcAyyRb+8vruIcwvo
 PAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7CQ/6kaWzCVdnPOK3LKkrtiffwfVdv2ArDXooaU7BUU=;
 b=PABPY+zzbUE66b6ad14Esg+fvokTPZefN7uSS36J5ncAz4cqa0nNnLV32GXF7IspTo
 N4bDYQcgIqgjxuqNq7Wq4DHLXP/kE3Pb/LsHpQbTXK+vru+7gWt/qliDOEsbG4o5oX3b
 yzKcm6aqgzraVQcFyWkkLCj7p5EupyDWQmfyMNB6QgdFjWGB0Sjll19djcSrHJGSLyUg
 68obcmSoPVPJgbG2xaClWBNoHcAedxjED4wVShhYSEtNE2FJAZ/QfCQDmKL0UOqTNLbd
 jI1Gf1AVyaG/SoIsCHNauXtJWkuI8TxNVGdMY1pVf65vSCXebzSTkmOqARwiiqO7UmEZ
 27ow==
X-Gm-Message-State: AOAM533HsviTJQT4o8tPA94cH+gAZFJ2XO35bRVARwfeb2+iJNzE4/Uk
 BdRtRhj1MpnmF1khr+1WGgvbaA==
X-Google-Smtp-Source: ABdhPJwoHg3P9QRnxRHvZvtfqnwFLQ1LPKY/LyZTJwmsxPeczbVidEWBeE1lNwVQKUGnA36Cd9ZAqQ==
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr2804018wrn.255.1620814861920; 
 Wed, 12 May 2021 03:21:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w22sm5394957wmc.13.2021.05.12.03.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E11841FF96;
 Wed, 12 May 2021 11:20:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 08/31] gitlab: add build-user-hexagon test
Date: Wed, 12 May 2021 11:20:28 +0100
Message-Id: <20210512102051.12134-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
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
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We special case this as the container with the cross compiler for the
tests takes so long to build it is manually uploaded into the
registry.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210305092328.31792-7-alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index dcb6317aac..aa3f1dbdef 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -417,6 +417,17 @@ build-user-static:
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
+# Because the hexagon cross-compiler takes so long to build we don't rely
+# on the CI system to build it and hence this job has no dependency
+# declared. The image is manually uploaded.
+build-user-hexagon:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-hexagon-cross
+    TARGETS: hexagon-linux-user
+    CONFIGURE_ARGS: --disable-tools --disable-docs --enable-debug-tcg
+    MAKE_CHECK_ARGS: check-tcg
+
 # Only build the softmmu targets we have check-tcg tests for
 build-some-softmmu:
   <<: *native_build_job_definition
-- 
2.20.1


