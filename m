Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B1C318A99
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:32:29 +0100 (CET)
Received: from localhost ([::1]:33074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAB92-0008Oa-3T
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4h-0002nn-Uz
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:27:59 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4g-0003pU-98
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:27:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id g10so4031376wrx.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2We8/sZtwq1DlmSucW+0kgZWs16c1Ki/Zxoxb1J6gc0=;
 b=rTigV/4nIJQmbGvpMU0jexg2SzipcVZiJUdP0HQUiWz2ksFW8Wf4p8QAY1qZyLLHky
 BXqvcXxqZM3OZhrKKiw4tPuMwXp44xZHfB7vlfUyeuRv0dUBz6MayYBQnp3UDDSDrmte
 DlkLi/DtnHSKA2dnF7Wc82jmbxD09W5CkTx8e0XjNmyWF3f7DjNvW649qt3FO5LNNdA4
 pa93ki8o8xoOspZfQ1UjgJDB9HONymPPHYcrqNoLC879SVhueTk/ryDOY/LlKhcBiPed
 CgDEtV7NOhcRzFZ5ctWInb5EABq5fCwsx6kqJZCso6v/VGFXdW2UT+A9ystSz49rD5f/
 asaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2We8/sZtwq1DlmSucW+0kgZWs16c1Ki/Zxoxb1J6gc0=;
 b=Zdo8ctX/uaUvWbm050FXTmVQJcnTpqLpdc1znn296+uMR079frJs8nOBx5wvzE6aNR
 1ZYHZFYdo6v5iynBj7qalN0fQtF6WDXO55SmQto3RHR5lx5pmuuE21goOjTabZu5i28h
 QqaSvGE/F/DaHUVYIA4yD21gdCu5nJGp3T8no97j/8jUogiEBBPnmZ8Nsdl09RVs0pH2
 q57zKl4U6gCJKI0018azPho8Z6FH2uwx8kVVSxP6m9Slg2erkduysB878vqIblpbOliD
 le5jEJ02CSfu2TQxJZIeuPD8qJY6NFsHte9jXwiLfZ8RyJxghcZPSXBEGS1D7wBRoaEH
 n9+w==
X-Gm-Message-State: AOAM5314elRFm2fzRxUTlhPeA3r+zcDeiAPBMBwzyZYRjMJPCAz4LfAR
 Lcm8UlI9MTLtnugE/6Fu6ft0ag==
X-Google-Smtp-Source: ABdhPJxd4xo1NXsQkXVOT1BHeTWYHpr3Iy5ia2OMGLVMb8gjhVufAeblvc5fLRf1LXupcROax9Qexg==
X-Received: by 2002:a5d:4e09:: with SMTP id p9mr5533945wrt.346.1613046477048; 
 Thu, 11 Feb 2021 04:27:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x15sm4814336wro.66.2021.02.11.04.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:27:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4989F1FF8F;
 Thu, 11 Feb 2021 12:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/15] travis.yml: Move the --enable-modules test to the
 gitlab-CI
Date: Thu, 11 Feb 2021 12:27:38 +0000
Message-Id: <20210211122750.22645-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Simply add the flag to an existing job, no need for yet another
job here.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210211045455.456371-4-thuth@redhat.com>
---
 .gitlab-ci.yml | 1 +
 .travis.yml    | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

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


