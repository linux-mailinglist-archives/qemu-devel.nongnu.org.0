Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B159850ACDF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:40:14 +0200 (CEST)
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhLJ-0000yy-QC
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIj-0006Wn-7l
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:33 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIh-0005IK-Iy
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587851; x=1682123851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mIE9dCUX/jW+hjEy3ZZiVtVl9b76i9LoJDy8JKCEnJQ=;
 b=gMRBbxpoZ2A0GJkKCURgPSl0Gcy5TPfVD55fKoxSBts/5KqiSlS5WEZB
 +0JcMqzWQt2zUTbPd1LhUZtB4rjhR79M9OJmnaI6+fmbKSTEqBQ/zPR1Z
 2S/I6LWy5wabC+aCRD2GTU0wdEysEo62jJF75is92bio1UXWJHtaH95a4
 vmSw16z5suwyha6OWeNUgMajCQumN6pHYM7s/QCxu6b2w41CVmHCJoWwE
 f2YQUZICUHXRexmxC4mbEp50D0rGD93DqG5EckCElIS/vpMQ/GU1ACyKb
 e9JGAlNBRFS01NMxIVJFdE9k1LHSGioZHpd6awHMmPYwqAokG7AuT2p85 g==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="302715731"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:28 +0800
IronPort-SDR: JqtsQu+o/83XZlSXJHAqwAW1SPxvFDHAN3R25K43/eqVNCndEEzr1CIzF5DncpFQkLyrpP/6qR
 kMTMXX4pamrXUCRS4+Ti+szGDLrMiFoxHUVoQAr7j5n+SCCzwH8iorSaV0Fy9Hm21GbDvZBUuZ
 Ox/6g8hVEjL/8J8o1301AJbIwPy82uCbMq4RmIk0fa8Gv+NwbsGptMZH96vRzSoR4SY3PMCOvc
 5HDMTPDmZdHeZd8uLYZ2OeSmzVx1H6jKlAEtrLgBt2hCM+hoqJfR7O6VgYhUlVL5xl2KjG2SLJ
 iwjAq3IUD6zuHDO+KJu8jpMU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:07:45 -0700
IronPort-SDR: wl+fGPLEOIQ8WcIBooaMIYutdz/OvjUKytJQjA6QniKmzp4JtEfW4neQ4TPpZpByc5NS7C2TuV
 g/QrgNwiVZ6vjNuE03SBemOhx7djETcOgKAV181i3AqSVJOLSnAFYp4tN0ePrg/Okwg2NyIyk2
 ODS2yT6NZLz7BtW1mRCsTBbaH6z2QIzMbE5oiINbEp7XgI7hYBEfX1QlT2yc3ckwa1nlxvgfer
 sIHjztgKC+qA4dR7YWqka3UuKl8uz+mpRYkFnOBGJQWO/A67CYS7dxrOrRaly+US+TPdIt6ef9
 Fhs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwV02MWfz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:28 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587847; x=1653179848; bh=mIE9dCUX/jW+hjEy3Z
 ZiVtVl9b76i9LoJDy8JKCEnJQ=; b=lf2JT+FWMCQpWDPwdvEfhnUwhUGW1Qif9w
 502TGfvMFQLWeSLdcLw7z6MsNuOQLrCfbkGB1Nx1eYAS+hPt/guDayK9gXy773RC
 PFOCzJJqkum5SAIPnhfeGqqLRe3M30zgf2g3NjE8AN2WSXWZ9+hKbtUrJ+RsKAzM
 Gw8GVOzIjHbqMGydzjE+rx2+YVrZBLY0Xx9KR7zJq9aFC/zDYdyP0xIUEADuR2YU
 LOpx5FDilEWdjyy5VKBK4cG41F092SYa819QvG8fLBholZ2Vt79Bg9g1pT5lJVkl
 kwWx4incohiDx4M/8MQlTGjrhX15ppgumBJxhuamneuHed+l/8ow==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YuwuMMX0UD0J for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:27 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwTx6Fz0z1Rvlx;
 Thu, 21 Apr 2022 17:37:25 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 06/31] target/riscv: Add support for mconfigptr
Date: Fri, 22 Apr 2022 10:36:31 +1000
Message-Id: <20220422003656.1648121-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Atish Patra <atishp@rivosinc.com>

RISC-V privileged specification v1.12 introduced a mconfigptr
which will hold the physical address of a configuration data
structure. As Qemu doesn't have a configuration data structure,
is read as zero which is valid as per the priv spec.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220303185440.512391-5-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 0fe01d7da5..48d92a81c3 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -148,6 +148,7 @@
 #define CSR_MARCHID         0xf12
 #define CSR_MIMPID          0xf13
 #define CSR_MHARTID         0xf14
+#define CSR_MCONFIGPTR      0xf15
=20
 /* Machine Trap Setup */
 #define CSR_MSTATUS         0x300
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1400027158..6590cc8aa7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3110,6 +3110,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MIMPID]    =3D { "mimpid",    any,   read_zero    },
     [CSR_MHARTID]   =3D { "mhartid",   any,   read_mhartid },
=20
+    [CSR_MCONFIGPTR]  =3D { "mconfigptr", any,   read_zero,
+                                        .min_priv_ver =3D PRIV_VERSION_1=
_12_0 },
     /* Machine Trap Setup */
     [CSR_MSTATUS]     =3D { "mstatus",    any,   read_mstatus,     write=
_mstatus, NULL,
                                                read_mstatus_i128        =
           },
--=20
2.35.1


