Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA6B4B322C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:44:29 +0100 (CET)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgWa-0007Jc-BG
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:44:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftA-0000Bg-4T
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:44 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIft6-0000Tu-Oa
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624220; x=1676160220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rV2iaVPAfXU1lnDTjEpqSmC5NLPM6XNsaS4bY//ucH8=;
 b=BRRO1e2W2vCZXMUMojOywukvZvh9gnkqMJE/ZChnIjpHalbOezxmz3Yh
 M47KrBRviVGLH3js2a7UUi5qtjJuJTg0VztHjHKss/UFUyrq5+q+wnSRk
 Yi5C0nMz4N/XsdbnD6w+lffzAna9KK7b4bKkq21o8jOu9R2wWUUF6YsoB
 pnWSzAA7LQHaHuPYyxvIuXuELG6eAJ6TX4GXOFZlYOuNfLVIj1vIoRTOy
 1jsS++EY80vvRfRi6cNlZoCn/Xc6tjvHSPBPUph+kJa3TmGRzbhh3cuj8
 a1uLf1/2KVaPvi5TSiTPg7JiuT1kvNWdDV1LU0msnEAPokeLllhMYtSES A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="304636504"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:03:39 +0800
IronPort-SDR: OClvU4sOYGiPeJSLy6av8ydZ7ByNy6IQIC7r61gKzTQnZ14/yOxtlF47CfSwAKpZprSq8pJPtG
 G8ZLx/f1yjm8JPpBb2USWG7pfYy38wiHHHktyzbYmcs0G8JkrmWMHm+t2ZS59h9EaSvKuV+95F
 E3Fvy4oedC0umsmF+HjXmDfY1z3keYdg4AdxUHpFKqpxmAz3h06oU6hm6QP1TSbL+03ZfyfHX4
 3WS8Omvoftc1KJjvR4FBPfRlAFLYZT4zAp1gAwxbo3e5KhW0ZZy7oztFeh0cgefmNbtDE4fb8Q
 9+W/VCelbQmVyxltePnM1iMy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:36:33 -0800
IronPort-SDR: G5q7yEVydGX0mx6rAdkL3pOlcbemuOI/XWEy6Gy+wtPcP1p7ArJpKwREwuFrRNouVk8wVHOj6D
 J1VsCyFqbN3pDJY21f2GXwTUsKLiy/3adxh1Z0PHDuOway9Zl0z8/vHcqeeeLoShhP5xZ/KIJG
 5xJDEwvV2FspsJKtC5ax8wU/V98cpAN/YbCR7HgPoS/PybQ2jjz7rF3YMY4UdSy07+lpfn4l3i
 CPNp+zdmHb+F6kzs8Y0kbuzN4julV0U6IKDXxBQTAX8j7G1HQWQPYwmAoYErPmDoFL0X+rvabR
 3yU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:03:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW0q05Vkz1SVnx
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:03:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624218; x=1647216219; bh=rV2iaVPAfXU1lnDTjE
 pqSmC5NLPM6XNsaS4bY//ucH8=; b=LHz0jcmx3+GgwU9lwpAPDRKdRKyrywbmGe
 AyqFs2kgem3mYis59pO8kX1O1qKZBRzVag+zuyzZxZO6l47iQFd6VJWlwBXYLnEl
 n4AJ1T8eFueICeuYWPVS3hC7WJhu8jdSaYVIvt881zAzLzwGF6uRCgxLsMIKFJFI
 s4tedZVLVks43b7p19NCBe3M6rRtzPXHrsEJtPJ4e5ne5mz34x1jp2t0LfTxEDif
 eD4Uudr8bcyWa4MhQhGymAjr+gs1OeVH+NgsnSqo4X65N3RX5CfzxKAUYlxshgKT
 4eSvkRapAnDNssIFXThg2HV2kMRTxLmPhvrSbzctDbRYDiXe6TLg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jyxXPNS-d-Az for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:03:38 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW0k3Hn9z1SHwl;
 Fri, 11 Feb 2022 16:03:33 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 33/40] docs/system: riscv: Document AIA options for virt machine
Date: Sat, 12 Feb 2022 10:00:24 +1000
Message-Id: <20220212000031.3946524-34-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Anup Patel <anup.patel@wdc.com>

We have two new machine options "aia" and "aia-guests" available
for the RISC-V virt machine so let's document these options.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-23-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index fa016584bf..373645513a 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -63,6 +63,22 @@ The following machine-specific options are supported:
   When this option is "on", ACLINT devices will be emulated instead of
   SiFive CLINT. When not specified, this option is assumed to be "off".
=20
+- aia=3D[none|aplic|aplic-imsic]
+
+  This option allows selecting interrupt controller defined by the AIA
+  (advanced interrupt architecture) specification. The "aia=3Daplic" sel=
ects
+  APLIC (advanced platform level interrupt controller) to handle wired
+  interrupts whereas the "aia=3Daplic-imsic" selects APLIC and IMSIC (in=
coming
+  message signaled interrupt controller) to handle both wired interrupts=
 and
+  MSIs. When not specified, this option is assumed to be "none" which se=
lects
+  SiFive PLIC to handle wired interrupts.
+
+- aia-guests=3Dnnn
+
+  The number of per-HART VS-level AIA IMSIC pages to be emulated for a g=
uest
+  having AIA IMSIC (i.e. "aia=3Daplic-imsic" selected). When not specifi=
ed,
+  the default number of per-HART VS-level AIA IMSIC pages is 0.
+
 Running Linux kernel
 --------------------
=20
--=20
2.34.1


