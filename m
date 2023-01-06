Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C065FA47
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:30:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCZ-0001g4-PE; Thu, 05 Jan 2023 22:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCD-0001Pz-2c
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:06 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdC9-000892-Bm
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974901; x=1704510901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kG/494UAf9U/JhUmvvXPX22ajvB/WW5xUuegTO+amys=;
 b=PpMCnCVWeI7R7qBQRMSp4DiTEp9qaMjtJwaGY5xx1tudpZ/1IGiAi686
 1fweDbCk8ylpbEVR8L9Q2BNOj5UDysYeg/eFCTVU4k3VLBSB18Gf8tahv
 fHMDpi5c9KcWMGyXFbbaRO6y6Y5/bJ1GLY1XlGdKrP/V/prwosGEfqakH
 9CVT63k0GgJ2goUlAzx2SIK3Oue9szP3Y/LYvHAafqg+48wEk9HjhV017
 OiyezZ6PO+1c95WGehIc7LsaX2ExWK13Ba5qf5bbfGdvyUJP2wjk5o1nl
 zOGUOs34YkWN3ti7DO9MD9I+AaH+tTOm78+mdNS8Vhg42dcGVF4s4g20k w==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254789"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:35 +0800
IronPort-SDR: i7uarOIjLVsmLJsASrlSctOSEX1npsx3AvUOdNwZRXyVJ0OU/IYbGPuVsOPD08djTsX6yQwjDB
 MdBu2eDdnTgmXp3Ym3UVLRV25dM91dEIztcGBEHtrnXkWQaaMmK52fPf/EUYoLEmJ66Izc4azv
 RpdTm3TuafrShodXJFUweiS9rtRRaV/LGfAvNYQzfaqSN2yvfjW0pKPTiFGbRgyG7Pbx5pOLaq
 Dp+ihxzngmGhSs7qjXRNnauAkIic79hXCUFKFzl82r3pqP7uBeBFASdk0P0NZlTXwi3BdqI8dH
 5po=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:47 -0800
IronPort-SDR: cWCDobXzjwx/MYyMzEUx52Br7vUzwiC4ZrcXHstgT01smgF5Mmdgp5cFmBaxIGJipK9ilxRyv2
 U//kpu8Yj6co37ZNUlP2O4BQ36Qt6ychILKc5v370hTrDISIdT6FznV3eIudjOFwJPgPf9WT+U
 S71g5AT9IMyPsRc2pgdKQJCyEpVX+TFgoQoN9cvsDSsUlcpBrdIspT5/Uu78G2kyXEBs8V6mOP
 EirmSqZbm8rtpYlm+0tO05/p7cHtdfsqywHgge3I4w36G5yFbIBvesyw2kA+bLes1PgFjO+Xet
 ya0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:37 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jl6Ydhz1RvTp
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:35 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974875; x=1675566876; bh=kG/494UAf9U/JhUmvv
 XPX22ajvB/WW5xUuegTO+amys=; b=ZgGLXBCt578k95qpus6FgALH6WmgRbbdNr
 9Ub7ZoP+chR/8sEOmK7IWer7tn06X0k+6F1bDq9g1h4b5fikgTNdgSBV92a5TT1E
 Jy1SHxk7yu9fYZhc576t6Zg/cAoaa5CM31hrQezpnsyZ+aFWXTksdYx1tlEu3cb1
 4zLaSGPiEfRky/v/KRmrTBBgxA0843GpES29prSWWt5rTE2OGtymvCtCDz/2/wCj
 l86h6xBzRS7cCUG/41SR4owTsR1e9Y4aMKLBKxPDG/u+ih5UXKmAqdWiO2d7Nfrm
 OfGIeIsNhxvy8iAhWOMO9BYHtmuZ/AeCnilofUnOdERbtYN1v3/A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AQ5U_inyib7B for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:35 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jk2dwkz1Rwrq;
 Thu,  5 Jan 2023 19:14:34 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 18/43] target/riscv: Add some comments for sstatus CSR in
 riscv_cpu_dump_state()
Date: Fri,  6 Jan 2023 13:13:32 +1000
Message-Id: <20230106031357.777790-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

sstatus register dump is currently missing in riscv_cpu_dump_state().
As sstatus is a copy of mstatus, which is described in the priv spec,
it seems redundant to print the same information twice.

Add some comments for this to let people know this is intentional.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221125050354.3166023-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6fe176e483..b2c132e269 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -382,6 +382,10 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
*f, int flags)
             CSR_MHARTID,
             CSR_MSTATUS,
             CSR_MSTATUSH,
+            /*
+             * CSR_SSTATUS is intentionally omitted here as its value
+             * can be figured out by looking at CSR_MSTATUS
+             */
             CSR_HSTATUS,
             CSR_VSSTATUS,
             CSR_MIP,
--=20
2.39.0


