Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03DB560D74
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 01:33:07 +0200 (CEST)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6hBC-0004pj-7y
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 19:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9Y-0003PZ-Lb
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 19:31:26 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9V-0004OD-TD
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 19:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656545481; x=1688081481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xQvE5TkYu0BMIfKgSMMAq+k4C1izUhUSYHPNBq9gtLo=;
 b=pAgja2gUW+aSAzUgqHH54BmydOTqsnl8H42jLFgNMHac4ZrDBWXQBkwx
 xjNWS7zqEp+TC+kOFTdFG5zWZqkd7WfcPPjJFCkeXCXWnN3Z+YXPjdr/n
 mJ26ALs+owkzAzB/rW0ZTfK2qtCN0u9xpJfYK+dyNjTDRHPCOFEbKHviP
 IIAvWf8GpOSwzWCSgHYZnjiQqre8TeBo/0zbf3W/9QWkbremlyIBiNZZr
 ajniI6gNxoH/FAEECZc4Q8XFH9RnVcLrHsQEIWmL3J0CqaJNzmVyqD4lo
 VWZDYkWdHoaKRDOuabUVqKOADqRPHAjuARDTT/cmyHy9Umqy0lfMdX1qA w==;
X-IronPort-AV: E=Sophos;i="5.92,232,1650902400"; d="scan'208";a="205161715"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2022 07:31:15 +0800
IronPort-SDR: qoNxI9CQJl/r6/tXvYOQjYw9RlMDJnKfELxKsurpUIgojq1sN7mt689oYTUE9flv5C4Ch/7xR6
 MU45kFL82+qXI8qm20SmeSMxqGm2slefdh3jH8TmFdHkxNQkDVfFk4lWJdrDzhMXnweyzb+4VA
 +SsvbSIdPZkuM3LvnvsLI60Xp9r9zA0ea5W3C/LT0ORHlud5bWQ0iczJyNf0isQk2cIcCof7bd
 CKem+TeBRBOROVPBaa5Pgn0docn2kSJZzFd/+QhVxo86KDf+dooHEgvk3CN5Jl6tUKY3hQ36c0
 xgVBDqEhIq4VhpTTUGwMkY1e
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 15:53:35 -0700
IronPort-SDR: kWjSa4PxKFo71iCZKj2LkOKD7puc0Uymjz8vAQwlPEScwJyJMKDPSvLbQSHKA/epjCeV3GYfgp
 v3zFEkiuLfZjE00WCrdtloln20uTxfTl2hQ4pe62pWFNgqnZbm27dSl2lNzhgUhSq9POL6ckvP
 wdWCdgDfsqCx6GxvHm14QcyUods+f98kAgZPLozEzDYcbc9Wg4oc+97u65AMZoScqfyuBwlzHu
 ia33G54NhEbPaJ8eug7fiQ0Uae7q64qY85ESQ3CC5HdVAiiQCe9c35Q6ECl07Us/zgEwmWN1Zz
 hpE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 16:31:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LYHll0r66z1Rwnm
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 16:31:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656545469; x=1659137470; bh=xQvE5TkYu0BMIfKgSM
 MAq+k4C1izUhUSYHPNBq9gtLo=; b=db2eD4WoNQ8SQERhz0ETM8LXjtIyaWwshm
 c0xhUYCEROXCHsQFVaA1NMNL32TO2z/olrwnAYAHbFEEbEbvJ+huqjNl6TjMLF6p
 PPuKyCR91VSGZPlkNmZvcelUapMkO+jVJySmHBdD0qe8w9C+HlX//znPvkrivheN
 hhJnHJaYY7F4fGN0GjenYy+lWYTsoO9T3unqoFbz5wuejiB/GNfhM+LIMX5befl0
 s1HtSXPlTZKGQb7DtYARIBP5yVZyz4GScOBgqR7SQ9k5CJ/7T0P0Bz37qNwXnvB4
 uwqtuvbWLIQhdFVgxMAmbnQnWvdbkJAb8avJ80QeeyDiD38pl9tA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4xGFLiFpNNaf for <qemu-devel@nongnu.org>;
 Wed, 29 Jun 2022 16:31:09 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.111])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LYHlb6kWQz1Rw4L;
 Wed, 29 Jun 2022 16:31:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 alistair23@gmail.com, bmeng.cn@gmail.com
Subject: [PATCH 1/2] target/riscv: Fixup MSECCFG minimum priv check
Date: Thu, 30 Jun 2022 09:31:01 +1000
Message-Id: <20220629233102.275181-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
References: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1723d02fc=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

Fixes: a4b2fa433125af0305b0695d7f8dda61db3364b0 target/riscv: Introduce p=
rivilege version field in the CSR ops.
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6dbe9b541f..6379bef5a5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3561,7 +3561,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
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


