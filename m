Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4B17AAC9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 17:46:06 +0100 (CET)
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9tdM-0001CU-UZ
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 11:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tPA-0003Zh-BB
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tP9-0002Nw-BG
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:24 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39604)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9tP9-0002MW-4l
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:31:23 -0500
Received: by mail-wr1-x443.google.com with SMTP id y17so7803820wrn.6
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 08:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0aKaSC1tIGjmTucsvZx242kXm6MS2aF5ZGRxydydp3c=;
 b=iLOpK0V7p7XkQhMc19TOEnR2C+eS58GVXtZ936frjgdCDkvZzQvP5pj9ghXmnsA5Rr
 7mC1BYpzXzrdiHRSRuhzeR9ymyWxeRHhKvAxFe7f32eECBP7GMx7ARZLFdf9v1lKhMbg
 EuULyqu80gdL98bT4sD35bPMX+CZX+3C7pR3UUIPZlCeUkQOAhU2sGwS7ZlatNXqBFrM
 wkk+zxIFPvFJkeQY0MeU3AE2SLwlqIaDVItg52hQsXki/nedfLlOmLhJH6ULGUiRmaZd
 HSHYf92VDhrr5vlR+JxC+ninDFGHNEOg2Z82Qd5EWuFFH4ejS/p3s4ZAXnBI4s0JI9r4
 JJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0aKaSC1tIGjmTucsvZx242kXm6MS2aF5ZGRxydydp3c=;
 b=RRorK6uEARHDTVRkZhzqZ5eemQWIOjoSjHfoi0pxlpwWcty/0GE63JLrnU7i/7PGKP
 u1NOnMafzXzBSuDuznU4aDybf9CRd/Xl5E1vzHk4Z/N4ghvPGdA0WwjT4oW2nHTfuMIQ
 OcwS2h8MqpMhRPxglwcdrcr071iUnfxqN37BZIilZp26pqLzhkn8FDv3qPlputK/nJEO
 D0FM9/y5njqrVBiFgaTpkToFwGSaWEM1vd5d2Y0hCfkrit7fWPVGM0oB8xiKm70MP7yT
 xJC4WVMGKf+cWXvxvlcz100an8DkZGgs7wyYJubQW7WTzMHfoKdqPA6fBqEBarnPVRrQ
 mFAw==
X-Gm-Message-State: ANhLgQ3UIfqtl1cwvns6bhmNbd4ZIzzwNZ3f3s8yZxPSFYmOZeRnGdbr
 GZKmNp9bp4t3AOHFRkR/L8Z8Tyi3XNnmow==
X-Google-Smtp-Source: ADFU+vt0JZWt6LZ3HKpnyfwT+tSYbqCB/0vt7pl/rEMQIKdBxt7ubhw42Q2c+ul1eE7zEZs5pkmLkw==
X-Received: by 2002:a5d:4404:: with SMTP id z4mr11119807wrq.228.1583425881911; 
 Thu, 05 Mar 2020 08:31:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w22sm10310729wmk.34.2020.03.05.08.31.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 08:31:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/37] target/arm: Remove EL2 and EL3 setup from user-only
Date: Thu,  5 Mar 2020 16:30:41 +0000
Message-Id: <20200305163100.22912-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305163100.22912-1-peter.maydell@linaro.org>
References: <20200305163100.22912-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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

We have disabled EL2 and EL3 for user-only, which means that these
registers "don't exist" and should not be set.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200229012811.24129-5-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 185a46f5abd..3623ecefbd9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -191,19 +191,13 @@ static void arm_cpu_reset(CPUState *s)
         /* Enable all PAC keys.  */
         env->cp15.sctlr_el[1] |= (SCTLR_EnIA | SCTLR_EnIB |
                                   SCTLR_EnDA | SCTLR_EnDB);
-        /* Enable all PAC instructions */
-        env->cp15.hcr_el2 |= HCR_API;
-        env->cp15.scr_el3 |= SCR_API;
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 2, 3);
         /* and to the SVE instructions */
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
-        env->cp15.cptr_el[3] |= CPTR_EZ;
         /* with maximum vector length */
         env->vfp.zcr_el[1] = cpu_isar_feature(aa64_sve, cpu) ?
                              cpu->sve_max_vq - 1 : 0;
-        env->vfp.zcr_el[2] = env->vfp.zcr_el[1];
-        env->vfp.zcr_el[3] = env->vfp.zcr_el[1];
         /*
          * Enable TBI0 and TBI1.  While the real kernel only enables TBI0,
          * turning on both here will produce smaller code and otherwise
-- 
2.20.1


