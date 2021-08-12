Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9273EA241
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:44:14 +0200 (CEST)
Received: from localhost ([::1]:57550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7G1-0001GU-OA
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76Y-00068Q-0C
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:26 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76T-00083l-AV
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:25 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so6605107wms.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S85mczGKeYB6Z3kjaTFVhQoQPK+mNif0lbrV6vtdZ2g=;
 b=A+niVkl7heApCx6WM+MSahWmhsNtnl/zzMMWg1nez2HXFsT13hGVvdF9Icp/kxXqF3
 x9W5AcMHV1fDHha3H+nDScX4Kr3vI2NAvx7xTVGSjfZg/S7COAcPLD5mSIInXmqRL7OA
 5nzn5xJvfbq8r6iR01HUtQPg0XjHfYrMUpxliOQynPGj7upG+3ClBjslku5/7BD69Zwq
 CoL3dgBpxIzFG0k+c235ZTwOKM/GYDjkate8beJ7TwJghjRkWsrlYdYfJbUWrFqINlkP
 z1tvAxzlPAjH6MgyvzHaoC3O6xj1omZCPi7kZdaJM0FvWczfWrdw7SvDbTYP41576mRh
 b/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S85mczGKeYB6Z3kjaTFVhQoQPK+mNif0lbrV6vtdZ2g=;
 b=doCxioYRLL5oLz4uhxf1K7jRbE8lzlLNT6h45dBhi7ANyEEU5CDcMlolhxIsU5xNBD
 jbL8LR6W9v99gZN9a1R0niH4tCmKxN2CpkvMpnmYdnndv8Jb1LwbgRirG/BFKTuBqC4e
 MptvI/SmkpHJVV2xN5seorPV7qTNlB5sR1JzHEs0VwzdC7aq/eC5LMnR2SR+CV+LUU3n
 asQ9BORZ8cj/ioK9qud7B8JrGlTm6YcnAT3gdFrySsgCJ4FqyMkAJCMoCLT2QfXDwPXl
 NqlzgFAGETQHCfRBfh7yTPGnjj3lGE6V1LPpcoNmeae9Cl8trwlEkIvbjqP8wSKrwDSd
 pAZg==
X-Gm-Message-State: AOAM531Jzy3VWNuySo3o0TaH5M+f+4TYX48uYr4yXcaf5lTDohyUl9ss
 uznYfLYxuG+99z/O3BhrWJSlgg==
X-Google-Smtp-Source: ABdhPJz6+xlg0KILbQe1/2JdIkwBzer8iw9QlwHhD1FHhXQlcGw1f/qvRQcP9GpN4zvhQ9zYzdx84w==
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr13057935wmq.159.1628760859973; 
 Thu, 12 Aug 2021 02:34:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 22/25] hw/arm/stellaris: Fix code style issues in GPTM
 code
Date: Thu, 12 Aug 2021 10:33:53 +0100
Message-Id: <20210812093356.1946-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the code style issues in the Stellaris general purpose timer
module code, so that when we move it to a different file in a
following patch checkpatch doesn't complain.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 8c8bd39e2fe..a32c567ce11 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -97,10 +97,11 @@ static void gptm_stop(gptm_state *s, int n)
 static void gptm_reload(gptm_state *s, int n, int reset)
 {
     int64_t tick;
-    if (reset)
+    if (reset) {
         tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    else
+    } else {
         tick = s->tick[n];
+    }
 
     if (s->config == 0) {
         /* 32-bit CountDown.  */
@@ -227,9 +228,11 @@ static void gptm_write(void *opaque, hwaddr offset,
     gptm_state *s = (gptm_state *)opaque;
     uint32_t oldval;
 
-    /* The timers should be disabled before changing the configuration.
-       We take advantage of this and defer everything until the timer
-       is enabled.  */
+    /*
+     * The timers should be disabled before changing the configuration.
+     * We take advantage of this and defer everything until the timer
+     * is enabled.
+     */
     switch (offset) {
     case 0x00: /* CFG */
         s->config = value;
-- 
2.20.1


