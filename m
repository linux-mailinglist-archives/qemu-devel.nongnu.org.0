Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA532E05C6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 16:03:22 +0200 (CEST)
Received: from localhost ([::1]:58006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMukr-0003p3-M2
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 10:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMuHH-0003JQ-D6
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:32:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMuHG-0001UN-AM
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:32:47 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:32955)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMuHG-0001Tw-2o
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:32:46 -0400
Received: by mail-wr1-x441.google.com with SMTP id s1so9347779wro.0
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=btuVklyn5jdYvmT5eZen6ynTwp3atEoaC3ET/0yyHkk=;
 b=AAGS6PcH5i5GhLBuPsbq2N31XjVBoNao7t+B0p+4rppQ2f6Y1HPQVq4RFVY1R619bc
 3f0tS8Afs64qJi03/HNPjrmX6mQVfGv+pEdA4HezyeaDj8UxFeQr0r8uf8yZ01OhYWDD
 UJ5TGh0TtgPcJ0Kn9p5kISv2trsGeSzhKqarTBiEWUcluW3uArSxV9rNqnGM9plwlXiR
 YP8tg8zuB1/8qV1gXE08Qh6JrR1UREwfE6hljH5X6UYrLFE99T+HsSnjXL8nKuc75kn/
 1pcacBfAg2Yk4VJkIS7gi2KOODyZwbKTIm+kB0cYGdoaV0DZdJnpSBQPzhBoGEiEk+wP
 fLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btuVklyn5jdYvmT5eZen6ynTwp3atEoaC3ET/0yyHkk=;
 b=pKTTqchidCmoxQGmJOSUB1uv4ds2Wk2DkmM5vS0TnDF56BVQU6sWvs/F9PI7wDYw4t
 D2zHcdHA2fF/4HEXJqCehFW92JN/Myb2zQY0Ql03+yrNEgu7Xmr96ZQr7s4Lp0P/s4FP
 ZNDbynpDR0lM07iti5TGR43eUXz06WdUDeMO92JON+7AYGnxE5eigkDj4DzaUNqfIZ2u
 b+eW0mzK9oC4Jx0YtGCYlncIZKMc7ABT0xDUWVFA3wgkmj65kacAThOzWDsqa4ve+TGH
 8cdHHti6Pyi1rsj95LGlZoG/aZHLZB7JZM7Wc1tqwMCmmq+iFWRWqpJdorUXFTcmQCki
 qWWA==
X-Gm-Message-State: APjAAAXS+0oJLH8DY+NxDS3PmjXFfZcsQyVkKiZxzZRyspI7ulht4kT7
 rzxgzjh851Eb6FpUEFI45JjbpqGadFs=
X-Google-Smtp-Source: APXvYqydXAya8dE79HY+LIlOk43kEw8Is+CeDQpSPuyRv2Yogr2QB603oXNHPC5WipFS2iEIfSyS9w==
X-Received: by 2002:a5d:5392:: with SMTP id d18mr3857792wrv.382.1571751164620; 
 Tue, 22 Oct 2019 06:32:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm20263856wma.1.2019.10.22.06.32.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 06:32:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/41] target/arm: Rebuild hflags at Xscale SCTLR writes
Date: Tue, 22 Oct 2019 14:31:22 +0100
Message-Id: <20191022133134.14487-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022133134.14487-1-peter.maydell@linaro.org>
References: <20191022133134.14487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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

From: Richard Henderson <richard.henderson@linaro.org>

Continue setting, but not relying upon, env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20191018174431.1784-20-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index aae7b62458f..c55783e5406 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4174,6 +4174,16 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* ??? Lots of these bits are not implemented.  */
     /* This may enable/disable the MMU, so do a TLB flush.  */
     tlb_flush(CPU(cpu));
+
+    if (ri->type & ARM_CP_SUPPRESS_TB_END) {
+        /*
+         * Normally we would always end the TB on an SCTLR write; see the
+         * comment in ARMCPRegInfo sctlr initialization below for why Xscale
+         * is special.  Setting ARM_CP_SUPPRESS_TB_END also stops the rebuild
+         * of hflags from the translator, so do it here.
+         */
+        arm_rebuild_hflags(env);
+    }
 }
 
 static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.20.1


