Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE2C3D2BD9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:23:12 +0200 (CEST)
Received: from localhost ([::1]:40946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6dLj-0003pF-CH
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6d8v-0006z8-5L
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 14:09:57 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6d8s-0004zE-HU
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 14:09:56 -0400
Received: by mail-wr1-x433.google.com with SMTP id c15so6882368wrs.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CXVfymAfVkltRwBq4Zm7LccAFojVqmx4XsEN39Q8M6I=;
 b=aGL4tWAj6qeKPYijZ4Kh9kGGACwBB5xNYfI9U32/KQbbDgaN2cBsoLs7Ax7tIDtnW5
 fRKZy4Q0cSbCrSusdGjQ/+0+Ri3Je1Xjl8uwVVgSA+O/ur9z/zCjF67oFEkR16CXsReN
 BhTYQ6/tTychaaiLhn+qEuOOORj+l63klTmKmQ7SUc+8auvKru2u/0pdBzKOPPGQ6OtJ
 7Onq8cytUGJWpn+2iHYEmi1E1FiG4WZ+Y2SH4oZjQpuZ5xge6hMaqHjoXjIQWgEkKbBL
 CCOkY2lKZhQo3a/BWH8KHoVS0OzXrxmKFT0QBpiREIs37s5HRxmJOcHr/Ob6JvzKPg4X
 MiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CXVfymAfVkltRwBq4Zm7LccAFojVqmx4XsEN39Q8M6I=;
 b=TyL21pfWOSlP0bAVVz550bFwPrrx13Blne9GKHNrnajHkSgZnZyIQiCJq0EhyQFJGp
 GwOOJ2RfDgIOkRdWMyllDLfM5f/UyRzZFgjG/QiHIZ9231QVTVBD3x+PzMjrtEClRrij
 0eLKzi8rSNmxNRerZIwOt4ZP/ecqXzvB0WAFLHb6l2j8KyD0ecRE6x4v8lEx67NxTbrX
 VKuBj+qSiE8Dja08TpqiNRYVuGzXaiLQhrcg4PxOb4JyRDKVvTznRcg9PZfQ4yWhqgFH
 EwvT5JRAfXO+GRuWRoXq87GB3+rh4ecjDa/cvFBDXV9CQB7h88uv4HmrteubO/t5xKwf
 nzew==
X-Gm-Message-State: AOAM533lwYaL02jAenjFi6dzuayI5CFpUSuSb1t5uv6fdKzNetB8T+ox
 zmaPVaj6JbDgWndSFqUoi3Nhgw==
X-Google-Smtp-Source: ABdhPJxaWTrWzn+SZ5NYbdhwSPS9oUYMwbD5URE+QEqyX8WU1ikzWICiOpXcDyg+yszt3hevQzYS3g==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr1252819wrp.254.1626977392941; 
 Thu, 22 Jul 2021 11:09:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v15sm3394080wmj.39.2021.07.22.11.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 11:09:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Don't list Andrzej Zaborowski for various
 components
Date: Thu, 22 Jul 2021 19:09:51 +0100
Message-Id: <20210722180951.29802-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
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
---
Andrzej: if you're reading this, thanks for all the work you did
on QEMU back in the day; and if you do want to still be CCd on
patches let me know and I'll happily drop this MAINTAINERS update.

Richard: are you happy with (a) being listed for Arm TCG and
(b) it being "Maintained" status?
---
 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4256ad1adbb..8c44a26bcce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -786,7 +786,6 @@ F: roms/vbootrom
 F: docs/system/arm/nuvoton.rst
 
 nSeries
-M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
@@ -804,7 +803,6 @@ F: tests/acceptance/machine_arm_n8x0.py
 F: docs/system/arm/nseries.rst
 
 Palm
-M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
@@ -837,7 +835,6 @@ F: include/hw/intc/realview_gic.h
 F: docs/system/arm/realview.rst
 
 PXA2XX
-M: Andrzej Zaborowski <balrogg@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
@@ -3037,7 +3034,7 @@ F: disas/arm-a64.cc
 F: disas/libvixl/
 
 ARM TCG target
-M: Andrzej Zaborowski <balrogg@gmail.com>
+M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 L: qemu-arm@nongnu.org
 F: tcg/arm/
-- 
2.20.1


