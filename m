Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8D03A6B6E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:14:57 +0200 (CEST)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspEm-0003qK-RJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lspCi-0001j5-Ev
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:12:48 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lspCg-0003T0-S7
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:12:48 -0400
Received: by mail-wr1-x429.google.com with SMTP id a11so15136632wrt.13
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gZIF6OjJ/C1UlNCQ7gF25oE0cLecKb9GfSwfw+NYLbo=;
 b=UcAdhQJV544LXW/UHAIf4vOj4UTkamJp6IcdgCqoK9sQb+IG1BTMHUmzJJsqIIEdRN
 nhXUuiH4rgOxA6/kR1ycI6JmB6VS8iirIKrC8uboqIc4rwjaQMjADmckiwPjEGjbKQ2x
 NCf0O2urXJuBFR+gb2+D5I30thWsl2UHgSjEHNvMK1gNi+ctAhOxQ0GB+oZOhO8BU5/y
 K/eEiUyBV2X1aQyv6don0nGqy/PVYhhpnFmmNm0HHgZp7qnVU1Vc2VL54UVhiYI7NMpL
 qhabzI/4HQatpQfSUFb+hKOGLo5MpPNEO2Z+1o9pD6k4X58Co6hgPDteg0REsxraIBfl
 N+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gZIF6OjJ/C1UlNCQ7gF25oE0cLecKb9GfSwfw+NYLbo=;
 b=PpB9h7nrs747fPYx7kPXHPApBanqpQXt2Cz2zFRsaj7Z778/nW4xBbpz4kqdMpIKma
 iZIvTBE93SGk2QvAMfkmbx6WTZjCnKMrl6RXq6NSMEBnzY5N0wG0Zt1IhZ2sJWKJckAE
 BsmX9odGQnSekaTlvFPPl8XGVJQvdPBchGl18yje6Gcp40hzjNPkw8BP2wk2QcMoULHn
 6C7Plpl4Xckl6OfTpu4MMA+n20NJP2EFGdVEQ6zKHcrXYP8EwxMrvgKswpR4AwQOov9j
 5hesLmucbtiHeOLrMdhU/dy9XUXfvx7JTJ1tb0WtnMBfgvGpeFv3sKtZREOl0/VpbxNa
 zbhg==
X-Gm-Message-State: AOAM533UMxZKDurYpjKFLotJF1r/vN3r5kAL6LeASXzHv/4qSVkITya1
 L8QerAqUFlGvs0y6FZAHyPzT/g==
X-Google-Smtp-Source: ABdhPJylM0L1TGR+yG67Q04ectGDmcHoDJAie4k7Tpeq6QPgFKPtDzajSZjbrtLl+J5Q2NQ9fh9LBg==
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr19701361wrd.405.1623687165229; 
 Mon, 14 Jun 2021 09:12:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f18sm13415491wmj.13.2021.06.14.09.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 09:12:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/armv7m_nvic: Remove stale comment
Date: Mon, 14 Jun 2021 17:12:43 +0100
Message-Id: <20210614161243.14211-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

In commit da6d674e509f0939b we split the NVIC code out from the GIC.
This allowed us to specify the NVIC's default value for the num-irq
property (64) in the usual way in its property list, and we deleted
the previous hack where we updated the value in the state struct in
the instance init function.  Remove a stale comment about that hack
which we forgot to delete at that time.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index c4287d82d81..94fe00235af 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2941,12 +2941,6 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
 
 static void armv7m_nvic_instance_init(Object *obj)
 {
-    /* We have a different default value for the num-irq property
-     * than our superclass. This function runs after qdev init
-     * has set the defaults from the Property array and before
-     * any user-specified property setting, so just modify the
-     * value in the GICState struct.
-     */
     DeviceState *dev = DEVICE(obj);
     NVICState *nvic = NVIC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-- 
2.20.1


