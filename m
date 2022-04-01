Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9253E4EE54C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 02:23:04 +0200 (CEST)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na54A-0003dO-UN
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 20:23:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=083ec5d20=alistair.francis@opensource.wdc.com>)
 id 1na50c-0002iA-EA
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 20:19:25 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:48129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=083ec5d20=alistair.francis@opensource.wdc.com>)
 id 1na50Z-0007FC-Qz
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 20:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648772358; x=1680308358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zjf/rkpNgyjimgM6fecK37xXhvCXdQFaoc4ojq4+dJo=;
 b=SM6XtD++Wy3eoOd0MOjQBf2T1JURiLg8LOfT3BPIAEWLbOmJGwq/f1XS
 k4RLvbjHM/2PqWVE1jB9tfHSwOBhVfpXyT3fmW1s8qpn1MBpGJNyCZu2O
 moyhHfL935qImT4E39ZaHQ/1AHqKCTWP/SWCCqkurDDsUWfHOaqDvSlsY
 BNkJ0iNmuEdhpeintpD8A11+oS59fS8aNSKgF7k0Kg39jFvXuKH8JtZ4l
 TdVbV9DVUXG5K9pT0WBQ6WiC6nHihygtR6pxwl/ktySr+xIUnWPInQQ/+
 5N+PmbH0mydl8b7eFCxfArRjy/5tgoUe3ZSDdBUniuZQocRPwH1TvImwV Q==;
X-IronPort-AV: E=Sophos;i="5.90,225,1643644800"; d="scan'208";a="196788803"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2022 08:19:15 +0800
IronPort-SDR: 4sioDhELjZQAyvENc3qCL0KKwl7VNZs0bWttJVGzJPqa0iv1j6GFW+Y7uI4TuuzdoBGhcknYL+
 h9soutr7xtmtBC+MEJzvem61EMUqwVHtK5Vx1t+CgjDra8PT8LxA+isAxmJrg13o3qHvmU6fpD
 Hv4jji9VcS9VnrTbFsTjxP827/ORmNmTTazZgkYrVwkpE2s8ovyXjQf+DURFRPCyp5Xm80HJok
 wnF5Yds1ILQOPkFXV/aN+KCZJ3L8J3vc/a3qgfOsVYTNMV5uVl6/jJoQYXsU/XZ2/M1wPeqnzE
 hRk39CfX9jr5S1GV5FiSL5Eo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 16:50:04 -0700
IronPort-SDR: 8iRju8HIb4MsBQXHn6OyyGDWvZi6/ftk2n4CpfyYiMOiD5WiTygTGOgVqEsvO/w6XrKlEQdbWf
 WXhD3Albb26A3dRxONhC4gaeFw5EczHQIoWQq4EPk20YJ3U6UhJQ50523Y5fp4fLJAaA9NhO5r
 bgnz+8f/8XizFwI6lOZBH1ybAztaPC8pUyQK0gHSLmUZz95v8TGJXjdbDI0nWuqDQqCimBq18i
 sF/UO9bGUHp5C09twwNdGAl0n3zu9XuwuWyb2hBm89I+cEopZFKp0m+ZLlyHusQGX3SjepjjM/
 4lw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2022 17:19:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KV14g3Z97z1SVnx
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 17:19:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1648772355;
 x=1651364356; bh=Zjf/rkpNgyjimgM6fecK37xXhvCXdQFaoc4ojq4+dJo=; b=
 QJHYjjgZ5lLKDaOS0patmgyfn88W9FCK9JPcFCbttIWqYRnoL0O3+DNurNPlvSeY
 Q+Ev1rj6wdB28/PN74ht3wwuNuSWG4Fa8ILsijgmEO8HNkjaxR38dEVEuZQtjhtR
 oSklLDZ5Zx8kF2NxS2QYNI8Pnkzw2D2TMOR+20Qrvq40NdbdeGBSAR/1AbL60ble
 hMmQ/MBFQkZIssPtG/9SYGQE7AD/B1gFLbo7gJ5ph0TAahUFky7nSBdZNHsMDGnT
 7g6ZDI+lAj2aRagsFMQjizesl5ZqDg9aInJFoa0D8BO8nsetUQQAsc1lhy5gMVY9
 zJHUkev18DMq7pT5l327vQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BxXEAoJvotT1 for <qemu-devel@nongnu.org>;
 Thu, 31 Mar 2022 17:19:15 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KV14b2hw9z1Rvlx;
 Thu, 31 Mar 2022 17:19:10 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: [PATCH] hw/riscv: Enable TPM backends
Date: Fri,  1 Apr 2022 10:19:04 +1000
Message-Id: <20220401001904.415226-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=083ec5d20=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Imply the TPM sysbus devices. This allows users to add TPM devices to
the RISC-V virt board.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 91bb9d21c4..fccc14ca0b 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -34,6 +34,7 @@ config RISCV_VIRT
     imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    imply TPM_TIS_SYSBUS
     select RISCV_NUMA
     select GOLDFISH_RTC
     select MSI_NONBROKEN
--=20
2.35.1


