Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2BA56436E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:21:29 +0200 (CEST)
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nMe-0005Qy-Tw
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nF6-0000zs-9h
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:40 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nF4-0001p4-KK
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807218; x=1688343218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ehQPeXVDCRNJyyAM0xISShVT9BsMx2tyfiNeoIZKpY=;
 b=OoJg7OZ9KsJvI5XNtLG8B5tQLHzWiX8xExx656TBI2KjLFeRRNbHRkMI
 x8XhHfE2amAYWELIHQgsWElrj9+gbziHVsw4zCpPWifL65MnAz37pVBwk
 Ou+7QqrEllgsinwGnijsY55ZyS3LjKedIwV7gpuIPzw8VxAGd6ubaaRR0
 /cb8WnjRvii9Ihe+pek1zyOuwYThWamKZshHYSaJkCrUnUcUfiwC/iIC3
 3g5i05Xb5IieKKIYrFaSiz7raL7wHyYP/EXROPMMkpm3NiqSFEABMF4hw
 ZSYmKnyDEKpk+bfSxyiYIxi7n0qL8kvSG5mCakbsLm95cI7JFy9pZHs+r g==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667267"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:13:17 +0800
IronPort-SDR: 4Jj3mRpCs7vh9Xrt6bhwxuUPoZgS+iEuzFiqyJtQpShNx5NkX/aiKflo/3WhBXrlFhCRzZYfwg
 fBLcZAAJOaYpJ39n5LuteztIfny0xzKLVtp8D5dF1ZP9NLjOMsuWpd3h/VgPFqQ63LZSPQicAl
 WbC0z0oAgG2seKR+vXIic/CWCv5Q1Pa4PJkccxSG+pKmTp78Gjf9Lbj2dUvKrXlZEXGcyVg3It
 N20bvKyCgRCYXQuwKdHFIyx/VPk3C4orla2s/ERx/su2s2pSBKU6Rp2f/5DvX/6s3RZ6QfDug5
 G8fCS2gz0w1/+jxPkR67pHJK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:40 -0700
IronPort-SDR: 88LRsagqZEkYDYoZwhHKC4qAEGsn+YL5n4jtwukht0DuAIJLS3MhPNcYKJ3X7xsq4QJe0SdcN2
 BNlRAXVcD0wk0zAtlPYEUx3GyDJ1U28e1TZT3dAP3XeDM+ouw8obhXCaKUTy1xuMIHs4YOvVek
 5ZcnNm7e9LChdxFFC2PKRwyfWT00C4+1OQK2xm/5Yqfr5kC05jtzOf6zWcitzXtvEO3Gnys5XQ
 36LxGqabc2vQOwdj6BD+MNmvBRVici/eSkR0i1CQbYhI0mVAk6n4fUyRvMsCXpvE7E2jaOgwF+
 cQQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:13:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Xt1H56z1Rwnl
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:13:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807197; x=1659399198; bh=1ehQPeXVDCRNJyyAM0
 xISShVT9BsMx2tyfiNeoIZKpY=; b=ZiRYlnlNxRCmib36xqhNd87XbItrBeV8Ew
 OIcAFXA64Be+E+ZkVG4gLBPGKLjK7cYVXsCAThefH2EBL7i0bTS7uSoxY6NLeDhN
 566+Ga67eLbKS3Jp0K2X1ijBVwlckqHD4sDqkM2vXI8bDCEISSbGKxC+vN0ixA/B
 qBqXojhp3Ip6AyrMRQ1YhdssvHtXHK65cyKAnVp9gsdROG+R42qcscOAY/riz7v+
 4xndWJqRdcdI3zWskK4mnZLVyy3ix0BZIAlw3BKZBrlRT0d4VVTd33BdGP8ONtaH
 A4hpY16sYHtLGgzT2IhHLrM9rCwh8idcd3xEAL6VZoK0xBXJTT8g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bOYlZ0t_PwKN for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:13:17 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Xr1RBGz1RtVk;
 Sat,  2 Jul 2022 17:13:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 17/19] target/riscv: Set minumum priv spec version for
 mcountinhibit
Date: Sun,  3 Jul 2022 10:12:32 +1000
Message-Id: <20220703001234.439716-18-alistair.francis@opensource.wdc.com>
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

From: Anup Patel <apatel@ventanamicro.com>

The minimum priv spec versino for mcountinhibit to v1.11 so that it
is not available for v1.10 (or lower).

Fixes: eab4776b2bad ("target/riscv: Add support for hpmcounters/hpmevents=
")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220628101737.786681-3-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d14a0cb0a0..4982e98735 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3944,7 +3944,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
                                                        write_mhpmcounter=
 },
=20
     [CSR_MCOUNTINHIBIT]  =3D { "mcountinhibit",  any, read_mcountinhibit=
,
-                                                    write_mcountinhibit =
},
+               write_mcountinhibit, .min_priv_ver =3D PRIV_VERSION_1_11_=
0  },
=20
     [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_mhpmevent,
                                                        write_mhpmevent }=
,
--=20
2.36.1


