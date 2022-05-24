Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24C5333B5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:55:47 +0200 (CEST)
Received: from localhost ([::1]:60412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdRK-0005ap-3x
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGj-0007Za-5p
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGh-0002Yx-Dg
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432287; x=1684968287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DD4dVe9zkxuzLeIUX7LN21uNDa6PsKdrc8ZuIZwDwcI=;
 b=QP6eAvkzjoSLGiiNNB5FDAgLYcc9+VI3HLz4KL20gUFL+A0EE6GghUM3
 DwY3meSc9w1M9YYiHqm4rH6XFjR9nGwlfl7/qW77165Vw/69BIx/dIByO
 3t5O/whnunvpRgBuFGrAwuK8FkEJYMK3i4qleSVIWcpfU39p2DJbDoq2O
 LIApt3e24BDd+5Bxn4xfPbwi63SpdzClgSVVVkEIlDP3GxzSyAwWl/ER+
 b8yW5VKJnmE3GI0Bmlc4iv+cakKptoSs7AQ7caEYthwbmMvWLnGWTW1NJ
 5O/WkHexGMkhdIb5gljA1SFxOkYYrsLQQhV7ITfXwHlb88DfAHsIa2JYV g==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566656"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:44:46 +0800
IronPort-SDR: ujtLD1l/UN9OkcsTuiUIo7YKIITH1JrNrMxCu6Cq2BWo6ywC0/sd6tm8XKi5ltxBa6/7djywCn
 R5UGmSCC4yqqMeLjOy5/LQu6hjs7IGHWVVWnDp29F5q7I5gSkI+VMuuWH9To1cTUlOqxctmOoo
 bWEyxpw0o5uv7U//4AsO1UrizcYbcVGoHnS/edoYRQVDi0VYszrWT/4AE3kROmMz4UulaskFvD
 lUSCqwgO4FLVgtBUReKytICGCj3h9UoHNuizsC10w70lo4kayKfjwQSzOhAPidyan/3v66tWW8
 36CTrPvAD9Biswd7587mk9e7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:18 -0700
IronPort-SDR: wwzPxcU3wb+XCbT8cf7sN5rQm/qZgseW3DehPPaAYjR5175kY0MvRHlOAH9WBT0uekW2bWDri0
 ogGboNGP9nYtfLkYxPJE84wr1JtbqzPwyjZv5At5Tre0Acfwyb1yvfFd0fn81Jmsy47Mwiic22
 HBZqVw7l+eDAgPyS6inD4vuqZbl+q6CHtlV2cQkMZEXUS/bBjTLTI4jNawHKinRNQXq1z57k+a
 B1lGDnSpq2pgo+BkqMetbuxT5vV+zzuo6pn9opvekToT2mXtUzIT5rRt5PGw/DdztbFMUitbGA
 TlY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:44:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78Qk3kmYz1SVnx
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:44:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432286; x=1656024287; bh=DD4dVe9zkxuzLeIUX7
 LN21uNDa6PsKdrc8ZuIZwDwcI=; b=sfs9EoWFhQIxgurm3HHmAsESD+/dO39ALc
 cHmgGVNAWR2Ku8ldkKieA5kHGiUKivnpad8Y4kXtjCsmB2uvTfxZSkuHW0xUz1jO
 VjM47isEbABStx/I4Wh2IKCMlWXB506g0t87Vh9DfZxrd3/qy7axA9iEZaFEC9yH
 qEfYFxwx2u56rQYcbnC/QrNJGzFssYua0+W51yKvLIp86Td6YJLDt5bVXWbdJzee
 cMVz7sHIQfHapJWFMvxIgcmUyR/9bmRuvv50mUa+Qs5Xqu0Oo1KnbGXHpqd/ohVh
 q5DWw5vxwjOa071saVkclpqw1Kwjx89r7me9QBDZpXTOudrwfhXg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9GgCHJ0MkwkZ for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:44:46 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78Qh2NHBz1Rvlc;
 Tue, 24 May 2022 15:44:44 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/23] target/riscv: Move Zhinx* extensions on ISA string
Date: Wed, 25 May 2022 08:44:09 +1000
Message-Id: <20220524224428.552334-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

This commit moves ISA string conversion for Zhinx and Zhinxmin extensions=
.
Because extension category ordering of "H" is going to be after "V",
their ordering is going to be valid (on canonical order).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <7a988aedb249b6709f9ce5464ff359b60958ca54.1652181972.git.rese=
arch_trasio@irq.a4lg.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ccacdee215..9f38e56316 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -999,8 +999,6 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char =
**isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
-        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
-        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
         ISA_EDATA_ENTRY(zdinx, ext_zdinx),
         ISA_EDATA_ENTRY(zba, ext_zba),
         ISA_EDATA_ENTRY(zbb, ext_zbb),
@@ -1021,6 +1019,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zkt, ext_zkt),
         ISA_EDATA_ENTRY(zve32f, ext_zve32f),
         ISA_EDATA_ENTRY(zve64f, ext_zve64f),
+        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
+        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
         ISA_EDATA_ENTRY(svinval, ext_svinval),
         ISA_EDATA_ENTRY(svnapot, ext_svnapot),
         ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
--=20
2.35.3


