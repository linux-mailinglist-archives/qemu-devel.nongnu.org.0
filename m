Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8269156437B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:30:00 +0200 (CEST)
Received: from localhost ([::1]:59448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nUt-00045F-JT
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEr-0000U7-GJ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:25 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEm-00021g-QQ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807199; x=1688343199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KjDePeIKI821vT6seFNfS6IPOF15yN0jaOy7uSzvrr0=;
 b=WUjLJUdXVO62fds2eRFi7nX9XGiG7VYZlBEsB56bwGZkVEqBXAr7YN+E
 DKSeJKKKI8l0TLOmmKOTEwr67o0ZSkZMN2e2A97UdSTtbNn5PZC5J1m0X
 FiLDzRqWp81RzhNx3qyZystxCx9QfwDGkogHqmiGgvkf5HuP6QeoB+ser
 VaTwFDVtSxjD7dFHfd5awse53lO+UaDj3pE1mrZ1O1Xb32TlXImV3T8k5
 EX0Kpqb663PCnhKGqO+MPyg6/9DtPe+nSqKXPtRiNzp3zL0GO10J9U23j
 BjnxfQ6dSNQUlqUcBAgsbpLjRFv3a5sHInUdMWIXujjQOQ/saMSLGW9lJ Q==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667257"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:13:08 +0800
IronPort-SDR: VFJKuwqJDyG/cqyN4GQ+z3jaZP6f8MIGGqhFfOK5kXxnSO6hVImo6KINag/I5O/bLi4Ow/4jqS
 alfTVHALzs2+TlQ1WGeKyi5HlSpMhF2Z2YGgBuvZ3o0Av9OlENqYuMy9O3ukZ4mF4GiJDH+7Yp
 srNFFcwgdOAhA78QXa3oBsMJvfg/HDO21DM2ZtQIelLwGxqKPZRUfmbOUAbKf8Ef5//jsSsftt
 SjaL+grniSJsDHe42wNL6OWNU1/7EKOxkmju0yzxGIvbWIPBLqjDYZEpee24fhUM0/pYC8f48S
 l+T5UupJ52Eusvr0cNu3rUtS
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:31 -0700
IronPort-SDR: bjRa3v4OJiCOEs8L/9WueTrGB4hFqQ79+HMURcUMO79vAqZr+WRtP5re+ihaQs++PxM2o/tD45
 0qDJMyBbrCvxsuEhPtOnjje2u1eqM4U0xrDCXaUMAFYU2IhFOBglsrtc7bo6HypAKX/uOFLnec
 G3MQ3fr06F0maFqhQ0SQcJUU51OwWi5X7+gCNIqc1hBK1ZHbOMbD+/BBiToRlvUKXi1OlsQjBy
 ta8F48dBxysWV0MHx+SwPHnFD1n8YTNa56hrNqoZpNogkgSha2FDGqn0HKIAQH2SLOg7j9KuLO
 vII=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:13:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Xh6vk9z1Rw4L
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:13:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807188; x=1659399189; bh=KjDePeIKI821vT6seF
 NfS6IPOF15yN0jaOy7uSzvrr0=; b=ILGGr2ViSffMCTbODARLdZ+19DcLocoRBX
 POrOIHC7LvVDZkJnK58Okq3pnxHrIrVcETm2WXXavzEak+YSGYEnm3vjuHBEiSBW
 8RR1BnN0UH1mwOcV313tOl718vRYJoZlaKzox4v8gVmneRfxOAC0/eK/wQkV2UWB
 TVJLAhtxeAewvvHVff5hUMrjY3vOBbRnN83Ai/2Kvh8e+Yzgoti8be+EJBQ6G2eE
 Dzw5UBkjlNOXvBm1ghS2TwijXCLQuhvplDK4y4PoOQ0r2uJOSo20WdM997QkstVy
 qZv+QUQ+tsryZXweBaRpSjIOWqplJuq0Klc11m1eLQpFM/oBaYtQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LzTfSnyJ_qjT for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:13:08 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Xf4sHFz1RtVk;
 Sat,  2 Jul 2022 17:13:06 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 13/19] target/riscv: Fixup MSECCFG minimum priv check
Date: Sun,  3 Jul 2022 10:12:28 +1000
Message-Id: <20220703001234.439716-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
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

There is nothing in the RISC-V spec that mandates version 1.12 is
required for ePMP and there is currently hardware [1] that implements
ePMP (a draft version though) with the 1.11 priv spec.

1: https://ibex-core.readthedocs.io/en/latest/01_overview/compliance.html

Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in =
the CSR ops.")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220629233102.275181-2-alistair.francis@opensource.wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d65318dcc6..d14a0cb0a0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3812,7 +3812,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
=20
     /* Physical Memory Protection */
     [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_mseccfg=
,
-                                     .min_priv_ver =3D PRIV_VERSION_1_12=
_0 },
+                                     .min_priv_ver =3D PRIV_VERSION_1_11=
_0 },
     [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg =
 },
     [CSR_PMPCFG1]    =3D { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg =
 },
     [CSR_PMPCFG2]    =3D { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg =
 },
--=20
2.36.1


