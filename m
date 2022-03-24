Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2814E6896
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:22:19 +0100 (CET)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXS6E-00087G-Gz
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:22:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0J-0005qd-7v
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:16:12 -0400
Received: from [2607:f8b0:4864:20::530] (port=41628
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0D-00032n-Bj
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:16:10 -0400
Received: by mail-pg1-x530.google.com with SMTP id t13so3234130pgn.8
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 11:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lz2iZCindmNGBgTpaEDXEWro/Uln/h07YBEqsYXSHCM=;
 b=nLx1I0rH1nXOTf7t/5rtSdKNeKF2/NJ5ecZB/B7Yr/6Tlw0zHbU+sGDpNd449Vjlo/
 RRMwkizz1GaIM2MFcbWddNk15cnYw4qN5nQag9eKOjksk6PrUCPUoZSrdVUw14pCbM6s
 PlUlQrnLn9kCIO0UaDqfN0cRTx9cOurgN9PF6iyUcNKTe0Q1Jf2S5Guhz9Ar7zNvQKLg
 ir1vem40pXOribNqr404mP2edtuLLfUVlOq8moBWkkylYghgB7e+Y9v5JYxlTWQYZDBB
 MSXVHlo64mHEM1ZHtKX5gGMqdcnU0ukvFSzNAfHBvX1FWc6YMg0G83qE9nKb+SALz2VW
 P+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lz2iZCindmNGBgTpaEDXEWro/Uln/h07YBEqsYXSHCM=;
 b=IxK1QPDJf5QHaGK3fHcrMSZ68YUpHgQNf/rY+McKfngr8+f1Pva1iDM0ZHTt5NUFT1
 if0UYooNub7g7QaMgZ1bIQB8HvrNgDuNA5A5aPqRorDzmOyMgFgmOk9vD0cG6qg3T6oG
 ziFnI/e7ZZHc2iMgWuE4+UHsWv0sRpZ2qLFV+56aQCOeHoYwWq1GXT+RAd/FWjuusOg9
 H3P6lKc1/ElbAo7rrByY8Y566zyWW7qXo6BwSknrqvLQ1SQg9T2hIUez6ahCoHVf+8Me
 yMeCPY+fl6IvUB67u66CTul/balOK7V4nJnC51fNyH7o7Gv2mGwKKIEgOJFoJ0MT4cbA
 V6bg==
X-Gm-Message-State: AOAM530iQXJ+MGXBw/6Byq2tDPA7TeNAZ8joYrg/nURok8QG2GStwlCh
 oiuG/whvjC3Wl8RnuC0Ir6LqIR9tltj79Q==
X-Google-Smtp-Source: ABdhPJwB0ZDTDmj3cOKDVQ+GxIIs0Hy+7wsOdK8JjXXcLzLh3XKs0Gk7jd+uAMoXV7+XUuGpxO/XIA==
X-Received: by 2002:a05:6a00:1488:b0:4fa:ac61:8b11 with SMTP id
 v8-20020a056a00148800b004faac618b11mr6564208pfu.58.1648145761468; 
 Thu, 24 Mar 2022 11:16:01 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.101])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm3577725pjd.15.2022.03.24.11.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 11:16:00 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/4] Replace 'qemu_irq_split' with 'TYPE_SPLIT_IRQ'
Date: Fri, 25 Mar 2022 02:15:53 +0800
Message-Id: <20220324181557.203805-1-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: 29
X-Spam_score: 2.9
X-Spam_bar: ++
X-Spam_report: (2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
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

Changes since v3:

1. Squash Patch 3 & 4 into one, since they would affect each other.
2. Use `object_initialize_with_child` and `qdev_realize` for device code.
3. Code style fixes.
4. Remove unnecessary `if` statement used with `qdev_realize_and_unref.
5. Narrow scope of some variables.

Changes since v4

1. Code style fixes.

Zongyuan Li (4):
  hw/arm/realview: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
  hw/arm/stellaris: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
  hw/intc/exynos4210: replace 'qemu_split_irq' in combiner and gic
  hw/core/irq: remove unused 'qemu_irq_split' function

 hw/arm/exynos4210.c           | 26 +++++++++++
 hw/arm/realview.c             | 33 ++++++++++----
 hw/arm/stellaris.c            | 15 ++++++-
 hw/core/irq.c                 | 15 -------
 hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
 hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
 include/hw/arm/exynos4210.h   | 11 ++---
 include/hw/core/split-irq.h   |  5 +--
 include/hw/irq.h              |  5 ---
 9 files changed, 163 insertions(+), 64 deletions(-)

-- 
2.34.0


