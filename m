Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6166164B73
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 19:26:24 +0200 (CEST)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlGMJ-0007Rc-J5
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 13:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49760)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hlGKv-0006S1-16
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 13:24:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hlGKs-0000UP-Vr
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 13:24:56 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33888)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hlGKr-0000JL-20
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 13:24:53 -0400
Received: by mail-wr1-x443.google.com with SMTP id 31so3347707wrm.1
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 10:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pI51qUuYMNuCIGtjJGv9IDjxGvT0HEL9i8PHYLxPiPU=;
 b=mc0SrmA3CEPOAaWd8WW67OhLQ6gjJobJb+3Clu0NRovNPu53Qo8OnsCSHZ1tHQjwke
 4LM4zlh9geQj2uJm3Bey74L/UJMDFKK/7HxXOshHZ0AlQ3xNa2jBmTeU+VnvPfrtelb+
 BzWi5LbBWk8J7Vs7d//TZtpV0SFewsSEtu8Jta0gZf8qXyP8oklTGpMdnlEwMD950a/g
 SIoFwntUYrVv0mG95nStjlkxEM62OiY29hNw/wSqr3rUXo1BYoHs11MXY+k/nwGfmkQQ
 V3wod8z+ud7V/2uNnEqyjClnh5pWJ3lBQh2t+kjUz9RiWnRV4R8ZLA+yVxlGTEN8RiIW
 DrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pI51qUuYMNuCIGtjJGv9IDjxGvT0HEL9i8PHYLxPiPU=;
 b=WHIeyvtIVRqtc2aFwgGXjbCxxa7Bv3aFCoRshdw7HcGbH39nJHDBT8V8UDeXIblzCm
 2nBPvv1BhAn6z7qSetK4iQ2XQhbPYLFUqLvDzcW74RJMHnSgCor4yV2/dmrp5uQ1kt38
 ofSt0UlMy0QckHrk+OodMVWqBMOMTc1b4HZMWzgUYEPEDmiwdKstDBEh2LCAWK/eViie
 9erZ7J09VSPc1jmQoX3RTkbJrT1jZu2foXcDxmpJUhW9oXwPhN2M2TQnYOQQlkgtgN4G
 /acxhyjMEoc8Wi0HmvURN5oKS/RGY4Nv3ifAqhhtY96EN4zgA/zYVwDT5a0Gp0V686Qr
 Bxog==
X-Gm-Message-State: APjAAAU6onPl//Ez7FfztjbuPCUG6srNs8iy3X2dpL6/y1FUFV0KVeit
 4hhBXVBIkQzWzvvRF9zEoQ2nLA==
X-Google-Smtp-Source: APXvYqy0LrvpP53773Fiuohz3glMa5n5jsbD6kk+/Ln9UyAYXcdaF9uKGV8PtAeBz1eAsuvMApv1mQ==
X-Received: by 2002:a5d:4642:: with SMTP id j2mr30492556wrs.211.1562779487471; 
 Wed, 10 Jul 2019 10:24:47 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id x18sm3047130wmi.12.2019.07.10.10.24.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 10:24:46 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 810B31FF87;
 Wed, 10 Jul 2019 18:24:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 10 Jul 2019 18:24:37 +0100
Message-Id: <20190710172437.628-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH for 4.1] target/arm: report ARMv8.2 FP16 for
 ARM -cpu max
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 1836078@bugs.launchpad.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we converted to using feature bits in 602f6e42cfbf we missed out
the fact (dp && arm_dc_feature(s, ARM_FEATURE_V8)) was supported for
-cpu max configurations. This caused a regression in the GCC test
suite. Fix this by setting the appropriate FP16 bits in mvfr1.FPHP.

Fixes: https://bugs.launchpad.net/qemu/+bug/1836078
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e75a64a25a..0a0a202fe3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2452,6 +2452,10 @@ static void arm_max_initfn(Object *obj)
             t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
             cpu->isar.id_isar6 = t;
 
+            t = cpu->isar.mvfr1;
+            t = FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.2 FP16 */
+            cpu->isar.mvfr1 = t;
+
             t = cpu->isar.mvfr2;
             t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
             t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-- 
2.20.1


