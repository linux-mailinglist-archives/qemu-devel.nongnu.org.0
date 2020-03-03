Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E0F177E28
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 18:52:39 +0100 (CET)
Received: from localhost ([::1]:51280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9Big-0003JO-J6
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 12:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg6-0007Wm-QE
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 12:49:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg5-0006LE-Rf
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 12:49:58 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52652)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9Bg5-0006Km-Lk
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 12:49:57 -0500
Received: by mail-wm1-x342.google.com with SMTP id p9so4296698wmc.2
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 09:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WjgOJgBdYSXtQmeNwF9DoqEimVF3dYdv8tsIBaWzzNA=;
 b=zFrEHhWJBoRbD4SyQnI007OXIaxcomKTDOAW99kVGSTurKjqjxiDvRLAEXusDS8zhd
 YOEt9wkyxlWDz+ovbqi914IssmmEHx+x2CSjt8CHhSacHeqTST22rMBwDe57/pjIDGc+
 /7w9sAOkTEQiY2j+YjxASst0rW5uhLntesWgjPb4Yqrny/142hFAzu+tPYXOlYt8YU5n
 Bro93hyC3FQoktYTPKHeI9xxAWkVfAAq7ddm1Mz671OvjxPreHx9dtaYQ0ESGFJ38UkM
 +pqj9Tag4e2M0O6JSlNrnOrtXu9kZcG8605AReiHV1WDEOQE9S0Tyck67A4v5gxQtE0d
 UFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WjgOJgBdYSXtQmeNwF9DoqEimVF3dYdv8tsIBaWzzNA=;
 b=Id/wlx4ZB+bGTzbjV7ZZmopj1M7ZYas6S6QOCwnIWDPC0MwI5mjuqkFPiE2F2624aF
 GVJ8KCAdUX9uV3tZGyt41gVMd98TvzA0Q4NCmnvC9itKyupjLpDrpnzB6WubtpK+EmMu
 c5OfLrwoU5tj6aEeNi+HaaT8GdInClrKQ5WpuY2iCwhNpOviDiLjBlmF+LNCWGfQ5AiS
 jv1ZUjjXVPMXvFqVRP02909yJiFFE/GxjCkH7uCqebOZlEyXrJ/pW7MfI4dYJmljb0qO
 DrRejdugPhrdLtwmX0UC5S/4Wo+seYcS+LhoW7J1wski5ypuWAf5tHsTjJ0OuDfqel0v
 ZzRQ==
X-Gm-Message-State: ANhLgQ28yDcEvZUBqWXTLxi/hwxcVYgTRIeKpabt5ybtlH9+mhIX+jxF
 dYUAfQKZAWkMmFxNtVB7k62PSA==
X-Google-Smtp-Source: ADFU+vtVxvtiXXsWjXTUbqTPz38XOuLoRzA/ON4DmwuQ1uYBwJYghuWC+WhxJ29IvnpCw4aeCAmnrw==
X-Received: by 2002:a1c:1bd6:: with SMTP id b205mr5307915wmb.186.1583257796764; 
 Tue, 03 Mar 2020 09:49:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d63sm4867576wmd.44.2020.03.03.09.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 09:49:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Fix some comment typos
Date: Tue,  3 Mar 2020 17:49:50 +0000
Message-Id: <20200303174950.3298-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303174950.3298-1-peter.maydell@linaro.org>
References: <20200303174950.3298-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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

Fix a couple of comment typos.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Noticed these while writing the other patches...
---
 target/arm/helper.c    | 2 +-
 target/arm/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2eec812b80b..3fa9c0cc861 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12347,7 +12347,7 @@ void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
 
 /*
  * If we have triggered a EL state change we can't rely on the
- * translator having passed it too us, we need to recompute.
+ * translator having passed it to us, we need to recompute.
  */
 void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4715ca0d2ad..9f9f4e19e04 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7296,7 +7296,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
 
         if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
             /*
-             * A write to any coprocessor regiser that ends a TB
+             * A write to any coprocessor register that ends a TB
              * must rebuild the hflags for the next TB.
              */
             TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
-- 
2.20.1


