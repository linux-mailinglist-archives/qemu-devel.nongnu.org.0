Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD96154FA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 23:30:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opzlR-0002IV-V5; Tue, 01 Nov 2022 18:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opzlP-0002HA-3O
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 18:29:43 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opzlM-0007Xs-8Q
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 18:29:42 -0400
Received: by mail-wr1-x42f.google.com with SMTP id l14so22088004wrw.2
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 15:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g6rhK7yvsnjAuR8A29XQuRoooNELJ46uLdG+RZPnCco=;
 b=DvhwBol6cU42uhwpzKrXUVO+erbh7639tgu3UeaRQ1WTBHDIddLMU8SwhovL+puzSm
 fFOeH4ETn3aX/EbvffAmoBu95P6L8BQATf0UNZqGAEYqk6F6RnnTgVkZpWncw6WVHZBp
 FnuHCi2JzUOsGywoR4OJJnvfmdFPp4XpM7hBe8B4LTK/M7qAHS1gfEQRF5pon31zwPHl
 YQ5XexYp7UXG/wpznPCP+5Xk/vjbmI0HozyUNap9TJZdV4Y5ptT5E01MVuqFDPUj1V1H
 LdwwB0uLA+/bkKKzd36ttlV+rtaw/F3rtVI5XCPs116n2LhOEBmLJYRWB6s1jbHz3Lbk
 ScZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g6rhK7yvsnjAuR8A29XQuRoooNELJ46uLdG+RZPnCco=;
 b=VXPNNfUM9BzFYnMFCiInbyzRMNb5mzC4Arof4Rqy4NBGCY3GshRC3tVONlJKjoRPo5
 9Up+bep4bSyd2MnQ/1fa6mDNmyEOY2MbaJa2VE6OBoTtpuVdCAZm/jCYS7/WY6RFQsvQ
 1tG/4olPy8mOaKK7gjqGJRA4R+OCV1/z0MwTZCwka6uVvabqRthl9RkaFW6e+IW5uQBo
 5ZTrOlNLsBl1U0Ah8Hj0TaREIHTgbUD2siac9Rs1XmNI9zsmIJXfsdC8ZXAKVN7lJvaR
 fwM1axNxsvj6c2z0ho1ZYM0xEcK4iGUTAAz6/h3eyVMd5PN5L3WZCbYQACxHyw5iwDoq
 MyPw==
X-Gm-Message-State: ACrzQf0PPqgHE6NScmCfaULslsQG9DXQrK2+3fXLrTJyn0Se0AynwVRZ
 JWnPwSDok35O91N8wpVmrTT0/bnHm9djyw==
X-Google-Smtp-Source: AMsMyM5H6o3uHZn18GKrQ/GCz2tiqacnkRKAwu4XNJo6EVaef8t3Lrl+s7FJ8hWYO8kidx4KCAH2/Q==
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id
 r11-20020a5d6c6b000000b002250ddeab40mr13138156wrz.690.1667341777807; 
 Tue, 01 Nov 2022 15:29:37 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 az24-20020adfe198000000b0022e035a4e93sm11406428wrb.87.2022.11.01.15.29.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Nov 2022 15:29:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v6 0/3] ppc/e500: Add support for eSDHC
Date: Tue,  1 Nov 2022 23:29:31 +0100
Message-Id: <20221101222934.52444-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a respin of Bernhard's v4 with Freescale eSDHC implemented
as an 'UNIMP' region. See v4 cover here:
https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.com/

Since v5:
- Rebased (ppc-next merged)
- Properly handle big-endian

Since v4:
- Do not rename ESDHC_* definitions to USDHC_*
- Do not modify SDHCIState structure

Supersedes: <20221031115402.91912-1-philmd@linaro.org>

Philippe Mathieu-Daudé (3):
  hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
  hw/sd/sdhci: Support big endian SD host controller interfaces
  hw/ppc/e500: Add Freescale eSDHC to e500plat

 docs/system/ppc/ppce500.rst | 13 ++++++++++
 hw/ppc/Kconfig              |  2 ++
 hw/ppc/e500.c               | 48 ++++++++++++++++++++++++++++++++++++-
 hw/ppc/e500.h               |  1 +
 hw/ppc/e500plat.c           |  1 +
 hw/sd/sdhci-internal.h      |  1 +
 hw/sd/sdhci.c               | 36 +++++++++++++++++++++++++---
 include/hw/sd/sdhci.h       |  1 +
 8 files changed, 99 insertions(+), 4 deletions(-)

-- 
2.38.1


