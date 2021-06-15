Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2653A858C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:54:13 +0200 (CEST)
Received: from localhost ([::1]:36138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBOG-0004mX-8q
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBF6-000619-E9
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEd-0000xf-IG
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:44 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c9so18861900wrt.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kXIsKDgX9ssnsNbMo4rVBql93KsOaMtjTcs6nFhPTv0=;
 b=wTWhorC2Mi/M5zj1OeH0Zot59wbl8RdJLLmxXZN75Ny3JzSJcwmzhpYUUbm+XLzNJJ
 oCY1mDizSWoDS6ZODU2hjlInBJoBsvsZvBsCz9gxGUPs4xsc4zSd5ujkfcFWZb2D3JAE
 5bwHhrJzU9fCw27mrcfUL/1GX+en39opeR5KUc8Qr62Li8igQ0HgDenUOMOnZetW9SDG
 xP1wdPQLa77p9uJEnqMvgKAjp0clGTpaPz18OkZCA5izvoOMu46r8xac2FedvWGJsK8K
 H4Xb3uuqMWN691rnRLvU+1yfJJUjS2L1fQ+Hb5+aVqaJyzztkVSDYIGLy6aUgZiqxY3W
 aGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kXIsKDgX9ssnsNbMo4rVBql93KsOaMtjTcs6nFhPTv0=;
 b=NUGnROoiGi3S6wqVFjEQkEGiqF4gGjQ2DUA5MaA2PcSc+1KVKjRdR/1/FccBIkpopZ
 dZc3b30orW17VwB5aDQJdnDb7mvVx49MRZxjmZLu36xo+1I3YuOC3B39zAz3VJ29MeWi
 e2Wyqc/0vzchTY39uCxjZ8oINOn14cC9MIiXlywigwwovv6kAeVOpbPoDRLn2cURHhYG
 38nfOudJzwTANtZlb/QyAHyfggm3PNUCSxdktYCNGML4iw/m0Tw1XEyZI0XMuH99LoBw
 IKSuma5U5jgCbxH5MOuTIXVTU5Q4NhIO78jp+0zm3htSttsZSH3PIf1TeLYUO+p2vBxJ
 5dyA==
X-Gm-Message-State: AOAM5329ffL6LIdF8c1dnuCDVQQf7iv9vPRPNvPadlKGC8RB4Mdaw921
 C1w3lRJMTUUyA7kwVIPsPqTE1H7/axFk8g==
X-Google-Smtp-Source: ABdhPJwCsVIBES18eqDIKoWf3yo6kLMEnoYCMx7yXZEjHwdfxV9bnlevWR3Cx+JIQ9lPolYW8f1whA==
X-Received: by 2002:a5d:4c83:: with SMTP id z3mr26394549wrs.344.1623771854291; 
 Tue, 15 Jun 2021 08:44:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/28] hw/intc/armv7m_nvic: Remove stale comment
Date: Tue, 15 Jun 2021 16:43:45 +0100
Message-Id: <20210615154405.21399-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210614161243.14211-1-peter.maydell@linaro.org
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


