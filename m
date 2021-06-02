Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E98398EC2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 17:35:04 +0200 (CEST)
Received: from localhost ([::1]:37300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loStb-0000F1-1r
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 11:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loSrg-0006tW-B4
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:33:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loSrb-0007yx-Cl
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:33:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 h5-20020a05600c3505b029019f0654f6f1so3513703wmq.0
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7Z6gy5HbRUI8Ld0Vo5ZA1FnXhzciAYrFzuK5QPfkXw=;
 b=Nj4tdHrzTrYhLnvp7waOFvDPt3hVE/c2SM7AdaD71Aii2zeAlb1Fgf5iqA26I2s883
 j2JUhShhAA0bmpgC/UMOLpFCs5ZH6qovxqtnK/80NVhlDJTuD2KZXbsUiqN5zm11zjLY
 XfQ3k1DCYzJveUd5rBSMXJ6GC/KnBAIRogrsf7izAEHRfcdVapSY/0cFsevxVLsLVKeu
 4oVyejEwdGr2rTVWz9L0xefXHZ3KbrpIqpMaCq9JiaGqu89Oo/ETGCWe4xd2ivIAJavc
 n8Q0tRQeoTcxiZqk5rmD2fPNlr16Zmalj/xxgWaQfwUVDH0lhy/DNj1ZHuUUotM3X8F7
 deCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7Z6gy5HbRUI8Ld0Vo5ZA1FnXhzciAYrFzuK5QPfkXw=;
 b=Czth9sjQsgt4YT1TFjEJ3LGz1d/H+/MN78GPW7zmF4PkR4OMv6xNnAGD1YDOf4gvI4
 tYdmF0fRC0B3S5hW1TblYEiCL0pjnbCSyZIXsDe0TLmEajFEgFJQmfB8ZeuxqXleyH6G
 OumpI4Cw5IVlsniL0YJYYHxBv9Q81BppOM9FjPbfJX9CAs9s52gmcIYF9iv5KCfsK1au
 WyXaYA2ntmgdylyuBVEDraAnjiNddzE5sEi9rbh2WnEh76c1dxDN7v+Fzzcn9N0gUPxd
 hwbiikPl54WmRtod4GxguTXG5VPDgNiT+Aiomo06zzjNlThEDJ3XF31uzhiQ0+acPgCK
 ZX1A==
X-Gm-Message-State: AOAM532Oc7QBOCjBBpYzLBPG1WUdn9wrGHwHfhnO1evxwc8BMaBjjt8U
 6q/pS48SlT/CGq2LxrDnp8WmOg==
X-Google-Smtp-Source: ABdhPJzRb/LMRY1oLuo5EqsRkrwaEB6iS8VJPHgCr7qaO38YGlNiUUZN1r70mfuf0jcCZQszpnMDsA==
X-Received: by 2002:a05:600c:3786:: with SMTP id
 o6mr13652972wmr.170.1622647978067; 
 Wed, 02 Jun 2021 08:32:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s128sm90537wme.6.2021.06.02.08.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 08:32:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 062A51FF7E;
 Wed,  2 Jun 2021 16:32:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] gitlab: work harder to avoid false positives in checkpatch
Date: Wed,  2 Jun 2021 16:32:47 +0100
Message-Id: <20210602153247.27651-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This copies the behaviour of patchew's configuration to make the diff
algorithm generate a minimal diff.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/static_checks.yml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 91247a6f67..ec09da799d 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -3,7 +3,11 @@ check-patch:
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
   needs:
     job: amd64-centos8-container
-  script: .gitlab-ci.d/check-patch.py
+  script:
+    - git config --local diff.renamelimit 0
+    - git config --local diff.renames True
+    - git config --local diff.algorithm histogram
+    - .gitlab-ci.d/check-patch.py
   variables:
     GIT_DEPTH: 1000
   rules:
-- 
2.20.1


