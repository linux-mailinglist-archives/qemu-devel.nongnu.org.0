Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A272354E5A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:17:05 +0200 (CEST)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTgtU-0005dg-7B
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTgs3-0004QN-1r; Tue, 06 Apr 2021 04:15:35 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTgs1-0003vR-4c; Tue, 06 Apr 2021 04:15:34 -0400
Received: by mail-ed1-x52c.google.com with SMTP id o19so15449289edc.3;
 Tue, 06 Apr 2021 01:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EzXKNGO3cu89Ok3LHUuFc0KVg/611pb2Gmfj3dDVKwI=;
 b=aDsG8JmN0Jhvfkp6gbizyxt10Nss2/5IAfa7zICFysKgRgC7q5mvq7v5bS8/31JBzp
 KSfLMA/IlzqLIiAOBZIOleViNWBcIHtP18cE56+woWTnMmAy71txGTSpAnnRP6Nnxx3f
 tc2zR6ImCL0SxAmioR8UHv/vIl+zdjmwF9J7jzjVGopuN/DV4V9aeLk9OB3bAwORECbB
 D5FBDbb4huZIRWYsNgz/wAQyveA1CnZXx9iJVhgBHMf+RAhZ/QPE8RxyG4jkqvNngF1L
 S4XK1lrZwPdTZAGR9Uzb6QuN/dA5/q7TnEESOhtwZi7ucPuQV42SH4yDCx3/tS2UTcag
 M54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EzXKNGO3cu89Ok3LHUuFc0KVg/611pb2Gmfj3dDVKwI=;
 b=gNM1eZfiWFuW7oNd6Zr1ur1XiKMbcFjGErlUek7fVz/RLewJRA0i5TfG2tQEiboDw3
 O5yhYlOagv2i5RZI7L4Xk90d380KQL41NYqJ1UZSDnWXMgA2jmknHE6eJgVH0rxGqcIt
 LeXg5y8FSzO6tzTaLWZwXEgz76cBsRqEfzvVwd8kILwEneexg2b0aJFnNwt/hGskHXUV
 YwOy1PPNadw1eR3+MoqA7YgKhH09mThZIrtvH5ZNAeQ0Z5DqMepym+Osbdu5rGc3TB+/
 FxNqQOlfz4jMF/vyP+LK4t/qbp/J2Flzxub2X/cu7peBVBpLjjpAMnLCg99bJnMLinn2
 AS/w==
X-Gm-Message-State: AOAM531FV7rqREWEdcmLVzPRamKDCsv3gZTxjJqUQDEbWzB55X0pZp64
 b6gOyEFr5k5UTDBcsITXmJMvtr7OohM=
X-Google-Smtp-Source: ABdhPJzHsbhYHwwEFRRtjoKHQ2uUTu95hX8g+d40DHRQthT73tzdK3vWWN0R+aRTMy60L3P8Wg/6Yw==
X-Received: by 2002:aa7:c89a:: with SMTP id p26mr15616321eds.206.1617696930785; 
 Tue, 06 Apr 2021 01:15:30 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id h23sm2455213ejd.103.2021.04.06.01.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:15:30 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [for-6.0 PATCH 0/3] ppc: e500: Bump ppce500 u-boot to v2021.04
Date: Tue,  6 Apr 2021 16:15:10 +0800
Message-Id: <20210406081513.1013372-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This series bumps the u-boot.e500 to v2021.04, which fixed a long
overdue broken pci issue caused by QEMU changes since Nov 2014.

While we are here, add a reST documentation for the ppce500 machine.

Please pull the full contents (binary) from https://github.com/lbmeng/qemu/
ppc branch.


Bin Meng (3):
  roms/Makefile: Update ppce500 u-boot build directory name
  roms/u-boot: Bump ppce500 u-boot to v2021.04 to fix broken pci support
  docs/system: ppc: Add documentation for ppce500 machine

 docs/system/ppc/ppce500.rst | 156 ++++++++++++++++++++++++++++++++++++
 docs/system/target-ppc.rst  |   1 +
 pc-bios/u-boot.e500         | Bin 349148 -> 406920 bytes
 roms/Makefile               |   8 +-
 roms/u-boot                 |   2 +-
 5 files changed, 162 insertions(+), 5 deletions(-)
 create mode 100644 docs/system/ppc/ppce500.rst

-- 
2.25.1


