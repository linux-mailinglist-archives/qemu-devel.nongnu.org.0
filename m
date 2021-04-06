Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C2F355766
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:10:45 +0200 (CEST)
Received: from localhost ([::1]:47564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnLo-0006fM-6C
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCR-0006Vl-4v
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:03 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCP-00058y-8x
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id f12so8600752wro.0
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PJghT1u+mp84Ea7Ui7/AalITSsrw07UnoILstoAi4rE=;
 b=n0/p/XQ4vjcT7+oDY4e63rldkC8hu3gwPeD0KqKDy2ZNJ86FjeVXvtoslvh29oztc8
 K4EOkBISVPNcqXoRwlirW37vgZYgdDkQLbXYMyhBoGtZdh2dw3IPQkXyCVxiA2RZN4Vy
 QtmODggwefvw80bBpkmif8N7I/zJlUFibor9w6DBrpmI3dfaSV257k8geP9JwPKQyBb7
 orHpm8C2avASVhN7iCPOF5y5jUtox5P0jeYeVvHPm55WLWzR56jRu0ASpusWwir3bKOA
 TI5wL0luLMOGnRboG4rWJOksIcV81W4Wgto3xu+XiNRz8lMqIOqsssZSO3Wu2Vb/AV5B
 J7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJghT1u+mp84Ea7Ui7/AalITSsrw07UnoILstoAi4rE=;
 b=kz0Le4dpQ1Hy6f69vvvmfHo9sUzRdGJplTNaru7LQtjk4WXRrJltzf1JIQwawZCsGM
 DgqwW/cLrFWBs9ndxOPDCz1JvSgQiD+eLvFu/NHFoYvBSBsaCn1bzlwHp50rLLjXxhGC
 3eOE2lmFP4fhIbK3RnSIczgL1n06jljg80qjFAZpX77UC0feqZwuTWwGHtvspanQ614c
 N494oU0Kp/LLGrEkNG2idM9CALblFQRMoHSAFDPDxeEOEDZ4rN4Y4d/5KmBAYOpIWDGz
 3ruKClakDeJl9Ng5kG8z6KhdBMqEEOgBrTt+HAgduMLS8rAKId9ZSlNVoAffZD9M3x2n
 aDZw==
X-Gm-Message-State: AOAM5326C6tgKMOrpDzigz8Ac5FcoOCmjEWYWcmBwyUcgUwanA2RkVQU
 QKKp7E97IVCnK77BIhl1kSMOoA==
X-Google-Smtp-Source: ABdhPJybz5jk1RVobOmiFupQu912qPlt156tV9tbMeXfJuLQ5kA7u8wkKDEJ2lw2eh2Kon11T2PNQA==
X-Received: by 2002:adf:a15e:: with SMTP id r30mr17287378wrr.101.1617721259931; 
 Tue, 06 Apr 2021 08:00:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g5sm33210970wrq.30.2021.04.06.08.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9A8B1FF99;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/11] gitlab-ci.yml: Fix the filtering for the git submodules
Date: Tue,  6 Apr 2021 16:00:40 +0100
Message-Id: <20210406150041.28753-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Commit 7d7dbf9dc15be6e introduced a new line starting with
"GIT_SUBMODULES_ACTION=" in the config-host.mak file. The grep that
tries to determine the submodules in the gitlab-ci.yml file matches
this new line, too, causing a warning message when updating the modules:

 warn: ignoring non-existent submodule GIT_SUBMODULES_ACTION=update

Fix it by matching the "GIT_SUBMODULES=..." line only.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210331073316.2965928-1-thuth@redhat.com>
Message-Id: <20210401102530.12030-11-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3480d79db3..85b8e10b84 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -42,7 +42,7 @@ include:
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
     - scripts/git-submodule.sh update
-        $(grep GIT_SUBMODULES build/config-host.mak | sed 's/GIT_SUBMODULES=//')
+        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
     - cd build
     - find . -type f -exec touch {} +
     # Avoid recompiling by hiding ninja with NINJA=":"
-- 
2.20.1


