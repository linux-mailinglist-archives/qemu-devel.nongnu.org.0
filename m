Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96517653901
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:50:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87nM-0002Ek-6f; Wed, 21 Dec 2022 17:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nJ-0002Bf-Px
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:37 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nI-0000bf-6K
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662555; x=1703198555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wy8uMlexCTLFy7zcIJSicrjiNVPO7dvX3ZUqTF3gE+Y=;
 b=nFRRoTZh4yiOmHDpHP2ndtZXTbQGdCwLp+qFQo1bdh9ubgDktd/z5HXe
 bBLJsFWExvJqFLCa4aA/F1IyMGDfmBJ57b0cL6BU7+itReDuLawziLzf3
 RMlBbXglERbyzcyouq0X3Dy8hiE0UmmnGvsS598OWo6+VQwFiaPoauS7F
 zzOc6M2QyMdaZzxzbwxVVLm7crSCgAN7RJNch931xSFba6Vy94s8Y79Jg
 wpunJzsLiGl62isi6khdEwdZ7E8wqEp3f98MvpsNfclM9EGSQNwIgqc92
 uVJ7eu+c7MmoTrq1dmuCH8Vek+/RrQXJsS8JaG1sAFuRSIoU7Kpn85kl8 A==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561414"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:35 +0800
IronPort-SDR: Memce6k+tlyS/EwWKx0EWjFlb071jYdiwx/ZsO1s44y/lx1KzjfkSim7NI+7MBmGwrMBcvTS4E
 87PwEsDRdLq3zv1oP8F3/iAjll/m6SMjWKwhjbJHge6pWKYPLud7wcFlIRxEFYzxyuFf0jtQzD
 W+47H3Pns2s8Y2EiexXWpEMoQQi4AwY4sjYhR5LjrfiNhhPhamKkX0TlkV3sXxwf0E8zxzN/FH
 zoL7Rifam8ywQ7D0QspqSH0dVrlqLiMIckmkRfKJwkJjOIoayEzt4EUZR/bkvs5LIfOZMvwB9X
 5Lk=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:04 -0800
IronPort-SDR: 8XPOYyyKwSCDzE0dWn3+QxB5K0/VEH0xKsGtYNZnXZYGlKC6pKCZhFLu90IRESbky5QRRLwpXv
 cRTPYT3WJi4ISuh4zpyhiGgEjsjWlgbk75LsI1Iyvni1iIcBGtIV95sGEPwNtZD0jH8HxVsPS/
 81KZOqoEVjx5sstAwSHvwhNZq9DUQITZB2k84FgWrdYDynNOpIA+Cff5n21H5lWiWJfahZGToP
 efKz/0pmlPm0PU7m16spoxfQCeHKLboWqSt5oljOzRR/XOYHD44LGWPxoaBQ+mUUM8DEwHG/B9
 1uo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:35 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMg1WL2z1RvTr
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:35 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671662494; x=1674254495; bh=wy8uMle
 xCTLFy7zcIJSicrjiNVPO7dvX3ZUqTF3gE+Y=; b=DmHzQXvQex8SJvaqgiyHpu/
 UgeHYFDvNK9Jb5F7s8Zz1QIB6lj+a6410Z18+MbsiC84QuGCg0THRCXEVRWuqHdb
 0uppMkzPJsdbXptRwmwA3NuOr4mKBafQERO0V5/moW0Eb6+ahVQspC8AkfA7pNOk
 Gc+2O92rvn6+QaTGol7NqZ/g77WwWrKspxUvP6NKstqKBbV51K5C+toXEJoHtMHI
 fDaKokcROO7F4IG5TAdbPn27w7jPKnyb62fsWj8sn8uAgH0BegjeOHwMVrADgNwp
 YRTXXexZn/Q3Jfm6u/VmB+xeQrM4wqkIVqsZLOqjbf4xsWT50UDmM5GY/l4YPmQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cNLwqIapRciT for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:34 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMd1Lxwz1Rwtl;
 Wed, 21 Dec 2022 14:41:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 31/45] hw/intc: Select MSI_NONBROKEN in RISC-V AIA interrupt
 controllers
Date: Thu, 22 Dec 2022 08:40:08 +1000
Message-Id: <20221221224022.425831-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

hw/pci/Kconfig says MSI_NONBROKEN should be selected by interrupt
controllers regardless of how MSI is implemented. msi_nonbroken is
initialized to true in both riscv_aplic_realize() and
riscv_imsic_realize().

Select MSI_NONBROKEN in RISCV_APLIC and RISCV_IMSIC.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Message-Id: <20221211030829.802437-2-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 1d4573e803..21441d0a0c 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -72,9 +72,11 @@ config RISCV_ACLINT
=20
 config RISCV_APLIC
     bool
+    select MSI_NONBROKEN
=20
 config RISCV_IMSIC
     bool
+    select MSI_NONBROKEN
=20
 config SIFIVE_PLIC
     bool
--=20
2.38.1


