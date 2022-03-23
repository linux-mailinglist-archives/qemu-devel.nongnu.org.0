Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B34E57B4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:39:09 +0100 (CET)
Received: from localhost ([::1]:40922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4wu-0001vA-P3
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:39:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4u0-0008FO-Iq
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:36:10 -0400
Received: from [2607:f8b0:4864:20::62e] (port=42808
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4tx-0005Qv-TR
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:36:08 -0400
Received: by mail-pl1-x62e.google.com with SMTP id p17so2190509plo.9
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FRNHkk1Pw3SKExosP6UBvcvZg6kpiklzXJ7wxbktEDY=;
 b=mpcQF3/ruqLnmt1I4Rs09yf1lwvSrHDqfE4SqsaUbC/JG/GnLCcLclURVos0WtOd80
 RDVi9gC2NBV55mPYQWAaZvQBBNE2Y3aUcBucdHsFr50lLfrfLodNtrYfmEbH0/7gQp04
 k64aMOcK0u93yoqj71nXUrHDoJ/3X1eUe0hW1yktn6fGpJhzQ6y69Gd9W8G2XjC4Sq+7
 7hhRr2ycWiFaSBY3YRxnIefyDyyB5CL8QWDnyoeK7YbfB/tl7zb0DhxJNfBXPU+PoGQf
 FeVJ9+w9a2FSj18ZNNIc9vucjoutf+88viOhLpIl7gDa2D5AnSKwUsiNYlFYUMiiY/VF
 PH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FRNHkk1Pw3SKExosP6UBvcvZg6kpiklzXJ7wxbktEDY=;
 b=cOaBC5LuD5S1Q19/ge1KaVVsVlMFG88G4ZgPisI6YwXdn05q99ifP2JCjLHDwXAV9b
 Gm3RAfpGcOlItSk5AwHgzJjbj4LSM9XDuZNBYOIkTaXbtRlQSBG9LSvEPe26JDgTzl1p
 6q9+6c7Y1lpxC+yOXTHu6pUHsVNEUa+eqUvybSjhJA7BvuOdkvwOiQ5xsTK81wa6D3Y1
 AbbHxWsHuo+Kf+8wCRmYq5xq31bHrvi+rHACXO7o1X/lN5GfnxzVH0g5yvbvLunOiX9e
 4gXLhy6OjKTnr2YgE4+UQnSrQukvOJlljwjLEP4PnQBb9ToyqBS3sy2S3uvj8AK2m82k
 yOjg==
X-Gm-Message-State: AOAM533eAh4scxc9opyxEesH8WO85e1YyDAXzQGkftgaWv8qWacm0tdT
 kKfdcPifP/0t+vmp0i/f/HQ+hPkluJbdfw==
X-Google-Smtp-Source: ABdhPJzp8X/x8QOofYPLROaCW+WYEyb3frGE2iUSPYGJhZ0/vXgcQvIz9yqNElYehCT8NHroiqbdrQ==
X-Received: by 2002:a17:90a:aa84:b0:1c5:f4e3:c69d with SMTP id
 l4-20020a17090aaa8400b001c5f4e3c69dmr13031976pjq.169.1648056962760; 
 Wed, 23 Mar 2022 10:36:02 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm553239pfu.35.2022.03.23.10.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:36:01 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] Replace 'qemu_irq_split' with 'TYPE_SPLIT_IRQ'
Date: Thu, 24 Mar 2022 01:35:38 +0800
Message-Id: <20220323173543.146442-1-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set tries to replace 'qemu_irq_split' function with QOM
object 'TYPE_SPLIT_IRQ' and totally remove this call.

If this patch set is applied, issue:

https://gitlab.com/qemu-project/qemu/-/issues/811

can be closed.

Changes since rfc v2:

1. Replace all 'qemu_irq_split' calls in multiple boards
2. Remove 'qemu_irq_split' implementation and declaration

Zongyuan Li (5):
  hw/arm/realview: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
  hw/arm/stellaris: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
  hw/intc/exynos4210_combiner: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
  hw/intc/exynos4210_gic: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
  hw/core/irq: remove unused 'qemu_irq_split' function

 hw/arm/realview.c             | 41 +++++++++++++++++++++++++++--------
 hw/arm/stellaris.c            | 17 +++++++++++++--
 hw/core/irq.c                 | 15 -------------
 hw/intc/exynos4210_combiner.c | 32 +++++++++++++++++++++------
 hw/intc/exynos4210_gic.c      | 25 ++++++++++++++++++---
 include/hw/irq.h              |  5 -----
 6 files changed, 94 insertions(+), 41 deletions(-)

-- 
2.34.0


