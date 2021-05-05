Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A2B374BEC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:31:14 +0200 (CEST)
Received: from localhost ([::1]:38612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQz3-0001bY-BF
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsI-0007oz-FC
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:14 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsG-0000Yl-M7
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257052; x=1651793052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=otQOSwcYVr7RAj/nWvFHEWoMMJh10b7Yi4YNSpL0/3M=;
 b=qz79AI2vv+BNlkHbcdB1x3TrY1S5ZFlzvCqRN39sL+GQtNvNxMZe4cRu
 U7dpZoxfWxN0SpR6uI4bKuOzv718jDloxX4znZdHLC3mIq44ng1pt+QfL
 lwtjj5M+cRY2y7m8u/vakWb84pCUi3IZEXoyX1P/P/x3vxWCVbJFKb3eM
 q4YjGxfB3uOoSB/N/Nv2PeHkdNUWHgmJHZcIVEdB3mMRwixOob32jxtzc
 zh5bbXDw9kxvcqGQzItyx/R27hFqwcxLn8Z6ZUFh8K+GHEaROxuLpm954
 1W2MhkqpD3S83i0t+69Ku1NfV8AMMwxsX/t+gnjE2+acP1fyegRiEx/tl Q==;
IronPort-SDR: sdfrMPf2wd3dJxiWUST+bofnMRVlVaA/L5JOvYcVIyqBeWehJMPdCM09t2gi7R2RktUrKAcRI8
 kQv4GUjbbNoES0JQnyMfFPdho/Cx1HT3uEx7gba16QhhiiMW15PwEOgewJA3ZQD7B8k9yQDjOi
 3o9OsMRd9GWT8IhYycv7s1oHfv0E7msYOLU0hSESmGOLrsmB0RRbDO99h+635HUNafnpNHOe/C
 xRG2sW31+mljzEeU+mrkcXdL1Sg7Lg1qgCmuo/Yrso8nAaXBIea7jJh5NrZdYAp+CBmoThqiAh
 5Kc=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585923"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:11 +0800
IronPort-SDR: wCNuT2eJ/KahV8j9T1HRCpKBg5JM1xZZgSEWYWbfq8SdayVgFgQYg5sitoHEL0mwz2z5XaALW6
 L+zXDPZuQ/NGoxGtEeRgGWk98A4edYEvOE014LEYse4K+avUVtaAW4WUWulC9xcjTKcl35qZow
 UHGtg07B7GJksC5TCbpOls8br+KcjLsF2IzoQhX8HR6xz0SlyndnAFBVMY3Y8OWtkYJWtp4P5a
 QFiO0jUfdc662H47k8J49edWX1frn+tkPzF2Lyd/slGr1jGvvBiiNsHmWK1CDyNDFjnkL3/Kv9
 QtO2nQDU7huYF5YtZsq5UiSU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:52 -0700
IronPort-SDR: sS1tlxgHbLWoZg+tJX67kLfkCBSuyv/fTkeSyxDGjk4Mqb35nyoDIfQ3MunXMY2+MiLAtLm6Jk
 zWr2RrrfsTOe0NWN5zg7rdee5zDxB6s9uwdIqWbPgSHLgl2MzZ/iBIWrqGcocaqDb9yxXgxIac
 xMo19RYFt1dV1zErIPsOMFPfJk7CHBBsXywQXS2T3mEpAwQIFGxbJQHyAwH6NFuE5OdkNJhFvS
 HnFn1ansS4OG384xSNOEBRz1J9mSR0iCYopk+Gf1ntBdiSYkAVWW70F7vZwCWpDFxo5wx8mqnc
 u3c=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:09 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 16/42] hw/riscv: Enable VIRTIO_VGA for RISC-V virt machine
Date: Thu,  6 May 2021 09:22:46 +1000
Message-Id: <20210505232312.4175486-17-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

imply VIRTIO_VGA for the virt machine, this fixes the following error
when specifying `-vga virtio` as a command line argument:

qemu-system-riscv64: Virtio VGA not available

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 7ac26fafee8bd59d2a0640f3233f8ad1ab270e1e.1617367317.git.alistair.francis@wdc.com
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index a0225716b5..86957ec7b0 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -32,6 +32,7 @@ config SHAKTI_C
 config RISCV_VIRT
     bool
     imply PCI_DEVICES
+    imply VIRTIO_VGA
     imply TEST_DEVICES
     select GOLDFISH_RTC
     select MSI_NONBROKEN
-- 
2.31.1


