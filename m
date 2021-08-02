Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006BF3DD516
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:03:37 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWfQ-0000Dz-0e
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaJ-0000Kr-Fv
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:43744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaH-0003YQ-Tz
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so10839424wmq.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YZEAZ8C/Pl2yg429OjaxJSx9EOz84JN+Qm8dDccl3Ms=;
 b=Irz4OFsojbhxLzThid+SKbF3G8qjpKc7nYpEYgVh89X3EX9Eh3Wb9Kyma7XS2wYJ/6
 Eft9qZFCEe3eqWrjecwbsnOirqd4Fg/2w8qA0H3OG/BQFxhf4F4/DVtJdqix+G1Bz7ZB
 YxrxGFEOhbH3UJiZYbMtCNTWfxbP2YkXDQLEt4wdIdDKh8cNK73udWNu8X5S9swMSR1e
 UWNtFNGjtyeoX98483Kkfp9ho8ZX3GS4hWJ54bVGifiHfJvgByDupTHA8bJigRPJoWXn
 kLb35Z0F2CQh19nYJR9fbSNTb70nQZJUCayVDkjhOYt7fX4q93/cB0nbePXLpXLwpUnD
 mp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YZEAZ8C/Pl2yg429OjaxJSx9EOz84JN+Qm8dDccl3Ms=;
 b=emk8314fdYiE0nXWG1r0rdWfmvk48EgNNKuBfuQz/A+Hm4hIX9b/3bj7zUqdSNtpLF
 qixZzc0sgPO7W3cPo8nB0l3t19+KcnCLRSlDmdIjgYQ0iyXL5TlnU5yBAWuiIlku4cAA
 EohrZ961llD+YB7KELn9D+KJmLpXAeyhIwkZsOB3FfKvYTyI+P+Iw9ZXwTnkSBsWZFeK
 mAiDIJzGg/ztesBDMTF5UEfMi36VgtYLVVx7u0/M4bUWTQRhJ9zJV6a9lTnZfcnP9hyb
 Xf073m8lSo27VoeU83K6jNdAQ4gHRCQDqyVC4tsBgG9DP8uiAS+2v1mRnOhRUiVN0c/f
 6S9Q==
X-Gm-Message-State: AOAM5326yM8yU4K1lskOmaN9iZ+Cjp+b/ahO4JS8qQjuu4NCVNvzCNEm
 AR/E9IAy1GD2467Au3mJxWsgj7o5gHppEA==
X-Google-Smtp-Source: ABdhPJzsk9PURc4DYSy6ojQSWTwb24on3dlMKjzFXNZDheuXg1FTtPg4ZOAk+jJbU+XTJ9tyb+Jh9A==
X-Received: by 2002:a7b:cb53:: with SMTP id v19mr15989592wmj.127.1627905496640; 
 Mon, 02 Aug 2021 04:58:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] MAINTAINERS: Don't list Andrzej Zaborowski for various
 components
Date: Mon,  2 Aug 2021 12:57:55 +0100
Message-Id: <20210802115812.10731-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrzej Zaborowski is listed as an "Odd Fixes" maintainer for the
nSeries, Palm and PXA2XX boards, as well as the "Maintained" status
Arm 32-bit TCG backend.

Andrzej's last email to qemu-devel was back in 2017, and the email
before that was all the way back in 2013.  We don't really need to
fill his email up with CCs on QEMU patches any more...

Remove Andrzej from the various boards sections (leaving them still
Odd Fixes with me as the backup patch reviewer).  Add Richard
Henderson as the maintainer for the Arm TCG backend, since removing
Andrzej would otherwise leave that section with no M: line at all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210722180951.29802-1-peter.maydell@linaro.org
---
 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bda08356d46..37b1a8e4428 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -788,7 +788,6 @@ F: roms/vbootrom
 F: docs/system/arm/nuvoton.rst
 
 nSeries
-M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
@@ -806,7 +805,6 @@ F: tests/acceptance/machine_arm_n8x0.py
 F: docs/system/arm/nseries.rst
 
 Palm
-M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
@@ -839,7 +837,6 @@ F: include/hw/intc/realview_gic.h
 F: docs/system/arm/realview.rst
 
 PXA2XX
-M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
@@ -3043,7 +3040,7 @@ F: disas/arm-a64.cc
 F: disas/libvixl/
 
 ARM TCG target
-M: Andrzej Zaborowski <balrogg@gmail.com>
+M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 L: qemu-arm@nongnu.org
 F: tcg/arm/
-- 
2.20.1


