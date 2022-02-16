Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E665C4B8392
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:04:02 +0100 (CET)
Received: from localhost ([::1]:40260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGEA-0006Fm-CE
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:03:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDrO-0007Uu-RZ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:32:20 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:51237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDrH-0006vQ-OC
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993131; x=1676529131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lGagEk2V70JnLYrJSWPxoeD7YvAzgDmHU8MPmIJXlz8=;
 b=hOGhberkKorXmgcHnpNQsRh1fT8m+d4WhMKqeuu8oZCdIdvfmxSrwttW
 HlesCSCDwlMFMX0AYPX06mKzVjKV9T+485+zNGD8HyOnTgawPraydASiP
 4OvTvmEZeWWx1K3LU4kfOfrtC52OyNsMfuCMu5iExOAAzZ/R5OmGa+rFg
 c7ORVVE06FSYRh+CIdAcg/bG426vB2meSzaR9++8mQssYiaG8n87IuLM9
 4GNMBGaIzQWv5b9z8IYv0xn5bpMbZlGt4Q4BrzHj7Sbem9LUXf7w07QZf
 HuB9E9HgkskhnZwOCQ23l5urZgNd87iF3LlmUs0tqx1bM4H+RgSOE97Rd g==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="192004593"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:32:06 +0800
IronPort-SDR: 5MDv36xQwm+sbFCexRmFoXCidG8vE0QvsxYLR/Z24wp1J1m962SIeq6rWQoCpdTRKW1yXCmpYV
 MqbblbkoCxDi586nsxkTKd6AHhLvcs+Q1QFABmM8UkcPmWReq7WJN/DMBYox691i6dcf8YBu6w
 dOmsaKSXTmgPe1TtEvRRvAS0axg5MoXb72KtuSTdm3BGzrKgoDjevzhfiBy4K/Zj8uzhJr5UDX
 00Pa7mQUm9GQL4avzlV+StvBdIFLJuHczvxrIbvgJn3pW51wWp5hnFAl6nHNteGsrrp/QIW9RP
 WDiVna0cZ+mNZNmnBhN+dTzu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:04:55 -0800
IronPort-SDR: m1Wr94LMgJcTSpjDkP/PZnfFGNgM01TIAjEb7//sSZ+HKHyFyDaSHB4NWaYhJpI+nSWvGLz00t
 0HHk6RIhFBrWWjacumigWxxrqovXqZ+xDhFD9IH1hIw3yiMocPVHEARE3SOik6oEXkCKqJUgug
 q5UdZKd3NxAWgZzAfon4VebuT+ZedOrmSMJK1TJiItJ/RnAKBTJYe+juHl5toS5H0RQ0EYyRgs
 /1iBD/NNCVM+xq7CF1g2+rJANrxLzh7BXRlyTmZ5AVnpj0n+HjigxjkMzqHKEbcZyzfXLK2x17
 UR8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:32:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7RB4WgQz1SHwl
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:32:06 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993126; x=1647585127; bh=lGagEk2V70JnLYrJSW
 PxoeD7YvAzgDmHU8MPmIJXlz8=; b=PhHPCPjhxQavoiiNcdwqLvuisxO9aK1ck7
 KxLA8wIwqXTOEmg4oxOxLpYG+Lbgaa5eHNmo+DgVKML14T9wtgFNH5jeVd50aZa4
 s2a7fkZDReCrR6pUmzRVxF/+4LgY1zVZX4NUIwSz6JXXzEQveB2ncHyeCOi/5TYp
 gfMXrhZnKOFGVo4QQEH1137a8l0QhYOa23W/OfvPyb3i/OCVsWMCDj5EGjPE+0o1
 AX1TfAbiQ2O83WiIwkGSR+GmcBFaIrZ5/R9/SoDNcAP+8zMbR0nWrdORccUjsvIk
 xC3ktZ8WZEQh/h2g5+9jPCG9O9sHOYV3wMCT9jUyd6Fsb+xFmGaQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id W3Psu-4sMsW3 for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:32:06 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7R746rzz1Rwrw;
 Tue, 15 Feb 2022 22:32:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yu Li <liyu.yukiteru@bytedance.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 35/35] docs/system: riscv: Update description of CPU
Date: Wed, 16 Feb 2022 16:29:12 +1000
Message-Id: <20220216062912.319738-36-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Yu Li <liyu.yukiteru@bytedance.com>

Since the hypervisor extension been non experimental and enabled for
default CPU, the previous command is no longer available and the
option `x-h=3Dtrue` or `h=3Dtrue` is also no longer required.

Signed-off-by: Yu Li <liyu.yukiteru@bytedance.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <9040401e-8f87-ef4a-d840-6703f08d068c@bytedance.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index fa016584bf..08ce3c4177 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -23,9 +23,9 @@ The ``virt`` machine supports the following devices:
 * 1 generic PCIe host bridge
 * The fw_cfg device that allows a guest to obtain data from QEMU
=20
-Note that the default CPU is a generic RV32GC/RV64GC. Optional extension=
s
-can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=3Dtrue=
``
-enables the hypervisor extension for RV64.
+The hypervisor extension has been enabled for the default CPU, so virtua=
l
+machines with hypervisor extension can simply be used without explicitly
+declaring.
=20
 Hardware configuration information
 ----------------------------------
--=20
2.34.1


