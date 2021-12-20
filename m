Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B15247A443
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:18:40 +0100 (CET)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzB4J-00041q-DK
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:18:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkW-0008Sy-1U
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:12 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:21732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkU-00085t-Fa
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976289; x=1671512289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NUz7MecwSZpbzVd7JLudOnVgbLjhjBVNJU/jAUxAtzA=;
 b=fRJdgHsVf4R6zWr+joPb2uGSLVFN/GQotjnHoLgmQ4tBgkF1MNGQYEyn
 vVLipzjbm+andwL3Kxma4P0/6wouwT101nvO3KvI3rEwfkf1AV4He0QH/
 tO8GVTrwyh0WQ+PqXZY0FHKqqDnkhBeonjEdaHOOXbCLxDOaIsa/rj38u
 DXPfpRhcpcub1OeY9zSbNV4AC7JRlWQ0ixsV1CLfZXtGSzPgxPZZVDXGg
 azoht69LYGRyPV7th1F7d9IYp64GXx+UB5DLrt0SnhUncWkUkX1BYQL8B
 T6w+UdFE/XDm9K0FLgY0FAjW5LnwSSVjj8LeQt0ujP/2X0Qks0lqf9SvE w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="193451989"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:08 +0800
IronPort-SDR: oc+PY/m4TfVGTQBl01lpGRSNE/gf30z2Lo2YQ1g7svkxF8oTeKkBs97d+T/LqIUZhs/KQuDwm3
 eOeEZK/PPkIoyArGU9QtvQtzXPSPXXA2Axv3TTA0Q2zPhGoSi/P4W8sVBnAizeZepkykM3KaxS
 DfkXUQ50nS9zrkt/tKek//UktksBHa/cjxKoRR1KN4RmbizNB+vc5Gp6f8aRqq7yejIT2cxI6I
 VnrgoTJKe81p9bL0tXA3mP1D56/DoG1Yi/agb+u25Xg5k4yk3ovjiYYQv84SZfVKynl6MrLQa1
 +icCeHVkeYds9Xc35AK+JSb4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:30:58 -0800
IronPort-SDR: hbfpftGxIr5v3Q4HKQ2DC0o74wkyF7xZczuHUuTPcIOdf/PiAEFidM8hPMPMtBD+WE229EPkRs
 TG9FN6avECGgCtN2yKmyBQpT8YWyqpyD+j2xRLVrcfFOPOylUPMB9Nq1brGSjPVmKL9vMoL65Y
 KwfNbCP1HfDnJvnZ2PZnt1g1GFhTb9QMqIZXrx8/zbdwtW/ahzLJmvhnULe2JXPfBim0DOVr2S
 Ogg64WCdBU/4R4iAQizisxOtjYyzKmVUTLvo2dOa4uqjDzGc0UYnVCDHpdFCCs75eUlVLBsBCL
 cWU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:10 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS5X4YV7z1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976288; x=1642568289; bh=NUz7MecwSZpbzVd7JL
 udOnVgbLjhjBVNJU/jAUxAtzA=; b=f9iMNB9E8Km0BVXWK3B7pTIG2zrgDLnqBG
 iGh63NQ3/cTcHqBVr8Ti1kDClcLl33m8Z4OnCXPZXkDn1BIHyVq46YVl2XzwH25o
 yUh/t1XU9r27xPUBUpFRGYS+XGBo8A/2EHwMo05403fnfiO4rFILmiBs146FrJj+
 KFZf3m3VYeESpIiW0LDpkioqzbsEBveL13zdkMah9empZbDhQJbkM1vGGjecnUHy
 hiaOyk4LGTfCz0evs0rZwKDXiDma40sprB7IfuAQmnA+FEUSNBqQ+E9CXbSk/q4j
 c+ueRcM1c1yYBLzBd4hLqn+SCDmu/pCx8y3xC66cj9bCSzWyAAVA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rfOADr5etEJM for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:08 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5T1fn4z1RtVG;
 Sun, 19 Dec 2021 20:58:04 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/88] target/riscv: rvv-1.0: set mstatus.SD bit if mstatus.VS
 is dirty
Date: Mon, 20 Dec 2021 14:55:49 +1000
Message-Id: <20211220045705.62174-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-5-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9b5bd5d7b4..bb500afdeb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -502,6 +502,7 @@ static RISCVException read_mhartid(CPURISCVState *env=
, int csrno,
 static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
 {
     if ((status & MSTATUS_FS) =3D=3D MSTATUS_FS ||
+        (status & MSTATUS_VS) =3D=3D MSTATUS_VS ||
         (status & MSTATUS_XS) =3D=3D MSTATUS_XS) {
         switch (xl) {
         case MXL_RV32:
--=20
2.31.1


