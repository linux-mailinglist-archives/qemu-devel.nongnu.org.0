Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255131B699
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:45:17 +0100 (CET)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaRQ-0001bx-E8
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:45:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP7-0008OB-Vf
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:53 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:32852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaP5-0004Lg-UD
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:53 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 7so8138443wrz.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z3pa4zoA0QLeQIb88aJBr7/2NL8DRg1wJKXvKguSThY=;
 b=viTPelVkSd0uMaUYHCw2oIEoEyNQ0VigFl+FlhpuKKtguAiJ0xk2pnp0uGlSrhWgk6
 IBOlIOTGk1qUKFAFL85nqaMe7Qm4+Mym17AiHYOP96mcoeaECYE5ioHjKrthMB5ewo0H
 AetPVYdbYYcVBbBRyrLUaHHZsVcLA9OawAX92TJ9g45bBG5Iz+auhFx19bUVc1+Vkorb
 /Ric9I0Q1AcAY41J0hJqdhV8Xh4FCT+L9zwaEuckMxWTwjdO/qMQvDlLNyk3RrF9MsRu
 Rn9yBP5tYQa2IbXq+82Eu600fxjMpZ0g8UKHrlFP2M8vUScx3XDvpKCCzO1wM7/nrECn
 vnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z3pa4zoA0QLeQIb88aJBr7/2NL8DRg1wJKXvKguSThY=;
 b=kcIcaZXA8NqNZz3LU9tfGpJm2LcHSEUgZUyJgbf+TTz35YJk5tIn1I8xARPIZ/Y4Fu
 WaJ9wwMuMbYqK1MEDUS4et2GrLr3dUm4JlzQrPMfrY9ufQoEUMxFzHWZSatXXhIQdilw
 11W4xu0GnLrNxN1m6K5cIoOGd6DVMZhId7oNN5RP1Xa6Cg7OPPBETsTpcfVcPnc/QIlW
 1UrdMTNVPoObaGCMIDOTPYMTXiaUT0qrgMRl05mq3Sqlz8T5cbADpLcEW4o65hha7Uqu
 m23sRhSQdoaogPQ91tgFuwHBSlTVqQ20IczNw6W2Oz3C3BlPdGkVaYYDMkpSBE86+DAP
 0yCg==
X-Gm-Message-State: AOAM533lYjShMuMh7hG145s6eDsAOAYi31HvKl3ZTVeG+dS7V8mKt8K+
 9F1hcFzqxTIn6/ILUCOEGFd1cw==
X-Google-Smtp-Source: ABdhPJw/kjgtRKUOP6QDasjqxoMD2UGrPOYOc+j0d9IwWgCLA/XvLDZPP9x7U95d3cdEip8sux0SkQ==
X-Received: by 2002:adf:c54a:: with SMTP id s10mr7117836wrf.58.1613382170632; 
 Mon, 15 Feb 2021 01:42:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm11038298wrs.72.2021.02.15.01.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3ED7A1FF8F;
 Mon, 15 Feb 2021 09:42:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/15] travis.yml: Move the --enable-modules test to the
 gitlab-CI
Date: Mon, 15 Feb 2021 09:42:32 +0000
Message-Id: <20210215094244.12716-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Simply add the flag to an existing job, no need for yet another
job here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210211045455.456371-4-thuth@redhat.com>
Message-Id: <20210211122750.22645-4-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5f3d42221a..da2fad1249 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -222,6 +222,7 @@ build-system-centos:
   variables:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
+                    --enable-modules
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.travis.yml b/.travis.yml
index 533a60c130..7744ec3a2f 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -131,12 +131,6 @@ jobs:
         - CONFIG="--enable-debug-tcg --disable-system"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
-    # Module builds are mostly of interest to major distros
-    - name: "GCC modules (main-softmmu)"
-      env:
-        - CONFIG="--enable-modules --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-
 
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
-- 
2.20.1


