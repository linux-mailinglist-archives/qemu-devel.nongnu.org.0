Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7BDC09AB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 18:37:40 +0200 (CEST)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDtFR-0002lu-G2
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 12:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDrSd-0002UY-9A
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:43:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDrSa-00088z-Hl
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:43:07 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45045)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDrSa-00087m-26
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:43:04 -0400
Received: by mail-wr1-x442.google.com with SMTP id i18so3101968wru.11
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 07:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tg04vn7yvauAGcqWHSm/m+dscKKQD3PSH2AqCWQBvX8=;
 b=HywYgJiQU4R1DCM9kzSzmmqXMqRNIyzh+W3kSs/gCx5uj1QAyhTbRwcwXyBViPsLN2
 qZUurYOorCRYUnpcfrvjgF0iYsOzy1kI3NCDqpOBDxYhSicGKmHOD4j65/FqEAvgQUGo
 gHOw1daUEFtj1wdEdJxLsctUmk7veccf4fOX4W5VpAVct1zKcCh6CfA/9WDNesfmpi9k
 W/mLPGu7QYitK+cCHClqEkrGJH0KMfZcg7agjUJ1N7ykokUAuIQkvd+Y6ADMCBqxd4Lu
 VDD7RKvL8JdQvNAHN2V8lfD4wAJxVykViQKGQMBgtqfsvrXrPFVCqIRbc0+NYe9ovI+s
 9qXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tg04vn7yvauAGcqWHSm/m+dscKKQD3PSH2AqCWQBvX8=;
 b=GygqKyIoDiEh0IEjxhaQx7z7/mjjRpDsyYVDB1WRq4ZczJ4bApfSltLT3bs76NpZ+v
 rSivXlotUfZb79j19fTFlbUviZZ2vxcEmiF+WwpY/COGXBZAb2iWZ4gKYfktMI22CuoL
 SuAUWbxg28y2jKvK9y/t8/9H50Seexp4My+mFXhqYPwBWWXOVAL0ZWeDM448olySyA7z
 /XYj3LRMBIsW/f4hpz7FrO3gjDE0hoxRMxaL+4Xiq0ST39H5sARLStsaO6SI/Qtmidpl
 Iw//N3+8/jVtz7xVuGRmFOtMtEuAxfXutsPCM+hf+C+vKrTU7wbstJKrxn9o0niiM5hz
 vx0Q==
X-Gm-Message-State: APjAAAULJvwaXHpKKLMzXeRWXVH+SQ3tfw1dYF40R05+bZCPU8L/U273
 gWdmIviwL9N8k1apwhmURb3voBwaUbf1Vw==
X-Google-Smtp-Source: APXvYqzUDauMZEpML/GWZVmvoUg480iInGvKebe3WOgjhsK+UnJUHMs6T1/1b12ZLq4Vhn8k4y9y/Q==
X-Received: by 2002:a1c:9d0b:: with SMTP id g11mr7161069wme.22.1569595379455; 
 Fri, 27 Sep 2019 07:42:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y12sm2874539wrn.74.2019.09.27.07.42.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 07:42:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] hw/arm/boot.c: Set NSACR.{CP11,CP10} for NS kernel boots
Date: Fri, 27 Sep 2019 15:42:48 +0100
Message-Id: <20190927144249.29999-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927144249.29999-1-peter.maydell@linaro.org>
References: <20190927144249.29999-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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

If we're booting a Linux kernel directly into Non-Secure
state on a CPU which has Secure state, then make sure we
set the NSACR CP11 and CP10 bits, so that Non-Secure is allowed
to access the FPU. Otherwise an AArch32 kernel will UNDEF as
soon as it tries to use the FPU.

It used to not matter that we didn't do this until commit
fc1120a7f5f2d4b6, where we implemented actually honouring
these NSACR bits.

The problem only exists for CPUs where EL3 is AArch32; the
equivalent AArch64 trap bits are in CPTR_EL3 and are "0 to
not trap, 1 to trap", so the reset value of the register
permits NS access, unlike NSACR.

Fixes: fc1120a7f5
Fixes: https://bugs.launchpad.net/qemu/+bug/1844597
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20190920174039.3916-1-peter.maydell@linaro.org
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index bf97ef3e339..25422660545 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -754,6 +754,8 @@ static void do_cpu_reset(void *opaque)
                     (cs != first_cpu || !info->secure_board_setup)) {
                     /* Linux expects non-secure state */
                     env->cp15.scr_el3 |= SCR_NS;
+                    /* Set NSACR.{CP11,CP10} so NS can access the FPU */
+                    env->cp15.nsacr |= 3 << 10;
                 }
             }
 
-- 
2.20.1


