Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16663624B4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:57:12 +0200 (CEST)
Received: from localhost ([::1]:38996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQqF-0001Es-Uk
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lXQio-0002uf-Ju
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:49:37 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lXQih-0008QI-D8
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:49:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so4493778wmf.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AI9N8NiuzvX1k08dymPLlv0UQaigdUfb8OAicHGe1DU=;
 b=sJedW5/YQvjqdyBS289OWEtwdoHUtu5zoEREJqF+Lz6aXP5P2UDZ1rzRTWoc+3L8jM
 0/7bOWA5xRC/rMVNal1GxPVIl/xka3fuOiRhpdz7W42gWUM9NO1d/t3rA8VIEcLUUwNB
 DWNBFHLKJJSZLqz/iYtViHG0EYZelTttMMulJAKOuOTRsDqk1M8ccX8ypRronvef4f5B
 jmeZoXzAeN6uGt49nUDfLi0HXDeqsP9p+0AbmFmvEP5pTZGIh8xdlnV9AUgySvpw5N9+
 bY8AubfsXl5iP3e2/jFEW9WUR7Zxo3aqbMM5wGZFN3GXETzzzWJmAzaV4BOuHA+Do+VE
 3MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AI9N8NiuzvX1k08dymPLlv0UQaigdUfb8OAicHGe1DU=;
 b=GtVbWCjvKQEykNlIUxt27vDcRd7LtSas1rwNyMP9hhxDFdn/nH2C9WIFk1yVEJiiNs
 RORePxPwHmmLhlybz6rJrxHn4qchTP7VfyC+76jQHauNUf+SYMTorzn4yaBJqXTEXQko
 2JwJCcX45UyuGQn1iumyj+MBKRHftndQIkIH8NsLCQwirxOXnbEXVSaJaJFuEB9IbCs1
 K8W419Sal4kmHPqaFGWbrIzccUxj/FxpyWA732F6q1Gi4o0jWWj09Wqs2TDyC4xJNOGw
 L2sUPo6RIAhRXWZ318AlV6wzfQcATjxOpQX8odcDoie9k+hEp7PE0L3YZicz5N7mJCvw
 6LZQ==
X-Gm-Message-State: AOAM533mpKyDHRa8V3ujyN2zWYbmtT7nIviJvjUZZ9WdvhP/2tbZ9Orv
 EoLtASHFABjb8NdWp990CJZTRg==
X-Google-Smtp-Source: ABdhPJxV/7cwLP1w6ubSOc0zNQX9YtlsMU4icARRVRbTxUyn6O4btpnNlBXf02V/rxAHzNxl3tLJ6A==
X-Received: by 2002:a7b:cc10:: with SMTP id f16mr8649993wmh.131.1618588159673; 
 Fri, 16 Apr 2021 08:49:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a15sm10832774wrr.53.2021.04.16.08.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 08:49:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 321D61FF7E;
 Fri, 16 Apr 2021 16:49:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/arm: drop CF_LAST_IO/dc->condjump check
Date: Fri, 16 Apr 2021 16:49:08 +0100
Message-Id: <20210416154908.21673-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: peter.maydell@linaro.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a left over erroneous check from the days front-ends handled
io start/end themselves. Regardless just because IO could be performed
on the last instruction doesn't obligate the front end to do so.

This fixes an abort faced by the aspeed execute-in-place support which
will necessarily trigger this state (even before the one-shot
CF_LAST_IO fix). The test still seems to hang once it attempts to boot
the Linux kernel but I suspect this is an unrelated issue with icount
and the timer handling code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>
---
 target/arm/translate.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62b1c2081b..7103da2d7a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9199,11 +9199,6 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (tb_cflags(dc->base.tb) & CF_LAST_IO && dc->condjmp) {
-        /* FIXME: This can theoretically happen with self-modifying code. */
-        cpu_abort(cpu, "IO on conditional branch instruction");
-    }
-
     /* At this stage dc->condjmp will only be set when the skipped
        instruction was a conditional branch or trap, and the PC has
        already been written.  */
-- 
2.20.1


