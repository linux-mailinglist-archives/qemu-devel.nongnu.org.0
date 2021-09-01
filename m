Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AEB3FD11A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:13:54 +0200 (CEST)
Received: from localhost ([::1]:50912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFl1-0007N8-Gs
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFhr-0004nY-Dh
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:27 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFhp-0007dn-24
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462224; x=1661998224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ArkLKSlz3inR61qthiX7vTGJiuccH9vBHN3FXIRV9Bw=;
 b=bZ8VSUehtKSXHwQAyGtVTPDBiLnR09M1SPc5LkDJZFCzPikDut5DLf5i
 6Bmc2ebttxKqy9Kx4GVywa1khrmg+JrG12XQMZhqnsHbkhm1xbwolK4rU
 +GOIJKJK9e5pG4oJf6kuKVbPm20aOO5Dzbwh3R/rY/C9dgBgyTwVxprFt
 J7spSXr4o2miDGjw4OwuqbSkmFoaolpDAeUf+JH2DQY7nDC3IgsceJFqF
 BIiSeOa2te4yMy/QwTTa0Cqyw2ZzxH0LHzsy+NlNAy/SUTrsRwddkBXKc
 t6i/y8v1qY4i8xsGwHfgKh3llwfLCwP5z8yjOZ6ngJ2pBdlhE/Wx3cNR7 Q==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910714"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:10:22 +0800
IronPort-SDR: Ub/wi9UVTX2qOx42rJJLoyfA93YVdEZLZB63G3nRRulY0+t9L9Ash1b/zjyrORIgJVsx3ofF5j
 JnX4VMvvZAFlm/sJkUrvosMIafgsnCVDt/gcleHaQMrp3cJDS7jQ7XdOd7kSziPkIo/KJZLGKd
 288aNbP+IWJG5NvcztqsLu/R+B3l9LsEbH2pd1VcH9glzrLIaVF6rjeSaX1ALUtcGTfvMTqBzi
 r/QtkN++bo3yxAYurZl807xGcU7R07MSSLN+OIK0vuk+lnPD261oBPmi5UFTPmTLpOuQTMaCPJ
 0309eovYU9stz5cXmiqln5V2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:11 -0700
IronPort-SDR: qgpefxWNqFkK257+3NgUvrr0t9BzpVtgGmnw45YjYGDAZn0KIUBfr+mShOYunJYEcTrjNwESVx
 eriQWc9TJ6DGQT8MvLhaX1zRoS8ioP7YW4iPOFwW4Juj/B71cEXn9wz3eoC5yUrCUzf7+bVWSe
 id9TTCtuWi0cpXodGmlnCULlLy3hKnLv2iWHzDKJVhbbkrxqsO7b3dyPYKh79+/zwIapEbezUu
 V9OOeT3dcWgKfE5DXs6O2qphcMCvFAi0dEooSESQsxh980amhAwO7LaC89gI4hASvtvkEf5oBD
 0K4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:10:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GznZh3pC5z1RvlY
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:10:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462216; x=1633054217; bh=ArkLKSlz3inR61qthi
 X7vTGJiuccH9vBHN3FXIRV9Bw=; b=BwSBpfC0+e5tYUIHmwcyZWDsngUGIGGGNz
 5TVSFQC+91qznuanmsEMtRLLfv9G5/hTCOLxUydCpo2eShK26K8ruKqorhmtxQNL
 E3HFl9M7jwyiFEm065JWR9YxTqp45XsNeGBlQ6OQcTu2XJqNEBr0u2h8Bf0UaMw3
 /kiuxUcXLOs5gDA5+kYHJ5cr231pORmw0L9wKE1rxTaCcVeoMkK1euGkPrdBXjQG
 PTiwlfNoh+iiiPG17QlDjDcNR4mAO0rPQwS9vxyYvhAloZ+PA38o+nMPUolM7Rar
 ewkyHvzpvBD7H6D6LXMH3UhzZms7BAnceRsJ1FPFpbbkbUX1zKfw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cARIIMaMoCz2 for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:10:16 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GznZW5tfTz1RvlT;
 Tue, 31 Aug 2021 19:10:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Vijai Kumar K <vijai@behindbytes.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/33] hw/char: Add config for shakti uart
Date: Wed,  1 Sep 2021 12:09:26 +1000
Message-Id: <20210901020958.458454-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

Use a dedicated UART config(CONFIG_SHAKTI_UART) to select
shakti uart.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210731190229.137483-1-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/char/Kconfig     | 3 +++
 hw/char/meson.build | 2 +-
 hw/riscv/Kconfig    | 5 +----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 2e4f620b13..6b6cf2fc1d 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -68,3 +68,6 @@ config SIFIVE_UART
=20
 config GOLDFISH_TTY
     bool
+
+config SHAKTI_UART
+    bool
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 8361d0ab28..7b594f51b8 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -16,7 +16,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL', if_true: files('s=
erial.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c')=
)
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c')=
)
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-p=
ci-multi.c'))
-softmmu_ss.add(when: 'CONFIG_SHAKTI', if_true: files('shakti_uart.c'))
+softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c=
'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-cons=
ole.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'=
))
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 0590f443fd..ff75add6f3 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -22,13 +22,10 @@ config OPENTITAN
     select IBEX
     select UNIMP
=20
-config SHAKTI
-    bool
-
 config SHAKTI_C
     bool
     select UNIMP
-    select SHAKTI
+    select SHAKTI_UART
     select SIFIVE_CLINT
     select SIFIVE_PLIC
=20
--=20
2.31.1


