Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A940F32BC79
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:04:07 +0100 (CET)
Received: from localhost ([::1]:51152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZbC-0001vF-NO
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMZ-0005v9-Hi; Wed, 03 Mar 2021 16:48:59 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMX-0002Wb-Vc; Wed, 03 Mar 2021 16:48:59 -0500
Received: by mail-wm1-x329.google.com with SMTP id o2so7155414wme.5;
 Wed, 03 Mar 2021 13:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YsyyPNDoTwAkeJjoy+M+xRx5h1vPHUVYHrANL4+RWD0=;
 b=V/SuZJ8SpGBxAstY6hDc0Qslhzv+bxiUGIKZv11yfSVv7Oxd7fKaGon1PaSAP2m3cl
 5IIZaFPA/PVQXdFegc9eeUxYDN3lmW/xaGkEK0XXE7dKas2ciX2wixCe4HtcyPuD+mp8
 nCiX14pCTeT/e8JakRCTYzembpCE31pZZwbB4kluwZfCdbYhw51dKrY48iV3pp9v1ZFC
 /fe8ThcxwPjexlTiPuuRltaw9TAQ4v7ft7Df1777KNAaM8BOXgLWCrRer+SPoqexmpJu
 L8MBJnoT9Q+6C1o7pXYwGGWjtzl+miEnSnLz5ois7+0QKF75aMlomznLo5pC3b61AnvJ
 NJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YsyyPNDoTwAkeJjoy+M+xRx5h1vPHUVYHrANL4+RWD0=;
 b=IxrtmKHki1JCIK6a4knDsGzrqnGU4X7jVtyY44AQ/t4/ySZjSHH1ieLZ2y0w0Bc5ks
 ffjqf4rwRQoUzjgaehR4mU9pEgtT8Eao1B+sZYvgialj2bsqyQnnYwahVFtWAo9hBwCa
 MK31TMpv7yuai5MZXEN/k5vByAiLX1w6KF5IbPtdXdK6iq5dxJxQFUw5IoyOjA5FV2fA
 dAt7meEOukjH7Xk/T9F0U92L1ANG409cpwuMM7ctkh4P11l+BZKOJ+HTliwq4jFKNGbO
 5kj6+JlZOBGpOB1FQq5TmYmNr8AIXja3EvXlcSFyhyAwkWc0A4I32LhSQKTJsLR62MEw
 Am4A==
X-Gm-Message-State: AOAM530cVYWl9Dw//sBkNWoBqY48My+YkbnXjCU6N3U9JQW0VY7hjYRo
 WlglaMuY0L51SFfKT8Bnylw390yn7hY=
X-Google-Smtp-Source: ABdhPJxZiYOlxTknALOe29KozWDyUp8ZjfKR71R0FW3hcWVdTXcU0Psr2cH26dTTPkD9n+nyIs/Kig==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr852297wmi.88.1614808135219; 
 Wed, 03 Mar 2021 13:48:55 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z13sm33854690wrh.65.2021.03.03.13.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:48:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/28] target/arm/internals: Fix code style for
 checkpatch.pl
Date: Wed,  3 Mar 2021 22:46:59 +0100
Message-Id: <20210303214708.1727801-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 05cebc8597c..d6ace004855 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -251,7 +251,8 @@ static inline unsigned int arm_pamax(ARMCPU *cpu)
     return pamax_map[parange];
 }
 
-/* Return true if extended addresses are enabled.
+/*
+ * Return true if extended addresses are enabled.
  * This is always the case if our translation regime is 64 bit,
  * but depends on TTBCR.EAE for 32 bit.
  */
@@ -262,20 +263,24 @@ static inline bool extended_addresses_enabled(CPUARMState *env)
            (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
 }
 
-/* Update a QEMU watchpoint based on the information the guest has set in the
+/*
+ * Update a QEMU watchpoint based on the information the guest has set in the
  * DBGWCR<n>_EL1 and DBGWVR<n>_EL1 registers.
  */
 void hw_watchpoint_update(ARMCPU *cpu, int n);
-/* Update the QEMU watchpoints for every guest watchpoint. This does a
+/*
+ * Update the QEMU watchpoints for every guest watchpoint. This does a
  * complete delete-and-reinstate of the QEMU watchpoint list and so is
  * suitable for use after migration or on reset.
  */
 void hw_watchpoint_update_all(ARMCPU *cpu);
-/* Update a QEMU breakpoint based on the information the guest has set in the
+/*
+ * Update a QEMU breakpoint based on the information the guest has set in the
  * DBGBCR<n>_EL1 and DBGBVR<n>_EL1 registers.
  */
 void hw_breakpoint_update(ARMCPU *cpu, int n);
-/* Update the QEMU breakpoints for every guest breakpoint. This does a
+/*
+ * Update the QEMU breakpoints for every guest breakpoint. This does a
  * complete delete-and-reinstate of the QEMU breakpoint list and so is
  * suitable for use after migration or on reset.
  */
@@ -284,7 +289,8 @@ void hw_breakpoint_update_all(ARMCPU *cpu);
 /* Callback function for checking if a watchpoint should trigger. */
 bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
-/* Adjust addresses (in BE32 mode) before testing against watchpoint
+/*
+ * Adjust addresses (in BE32 mode) before testing against watchpoint
  * addresses.
  */
 vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
-- 
2.26.2


