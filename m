Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F18564362
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:14:42 +0200 (CEST)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nG5-0001cp-Tz
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nBX-0001vj-0j
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:09:59 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:56105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nBU-0000vI-3Z
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656806995; x=1688342995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Keur84s81dftzm7jD69JDIbb8De9fx2cMQzJdkPZ2LE=;
 b=CvuPTpgI+ctz0dNO3pohCtN+qu5EDtFP/Bgvedga3U0CbIUhzQ3jn8GQ
 4Sv36miTQ2PwclOqZ8usBvay1giE6fqvWitYTLZd7sZpDtHJMq6VnZxO7
 yBbFSXS/Va5dn1Qu86s6Ts7zF1e1Sz+BT5wnkEShk2gwIHhS1IFaXmWMi
 NcAA4RFhdiyNKQtUlLh9a0NJAq9d4seBZRuudSXxOdK8i+jBYdBuXmS4M
 SRoqMhVaL1Ks1JHzqR+w0TmaejAwcMvr0NDpkCEymngiqDKZMRmHGj2k9
 GlkgBi6C+5R6iTV92AaZjT9XkhBz3HoSmbX0qO7TjNSm4TJClQ6bgf8MI Q==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="308989620"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:09:55 +0800
IronPort-SDR: CYGJnKB3RCGOCaAjDxOax6JIncMyvWts6mGqOx3Fl237ROB4+b8v1/G4u6lcVgwM1ISZRzfTwf
 CzfFvj07+LVjzg3vT04D/hc/6luCHzT6lNgeOk4k2M/ibWToYOhBbiwcoODQhzyPtb2ZLEhXkq
 ZNX/apMZtiZfpkMz4nq61TKv2QE61EML0GF1xVAVpKuM5+jLuXh5RFM7ScZOC5AIF68+80xbgo
 YsjCZv54B6Z6sykJ0Kz1kmMWQaabHdigNNuadCGOX8fYv65H54QGy/sthova/c5kYS6Tgj4oav
 aQEjPy0ZRVE2CbhHSDJVdq6Z
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:27:17 -0700
IronPort-SDR: xv3Kpjipw9zX8y936oBrSltpRIP26z2V/8ymoQpP5t4gLXWhhVTN0kVUlUkEELEtHOAYprLkR+
 uMe/c/7YvhA5MvebiHT2xZ/LkxR2wf68NCHTFAwsJ2caY+NwuN82l5ibYbpoKGG4TbSDs5x8RD
 LzZOpNnXjfRV6fpqoFQ3FOkCqOirRLNHpFLuyv67n1dYIIQChaFI1EQnVKUQTUnvgldaq5rGCW
 SgZGn5gIvbYjuxTFIFeIwJjvd0A9pWR8NW4u5vSqsCHLqpkPYZ/tvGuOkjWsP4ezb8slhiUjzB
 508=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:09:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Sz1fZrz1Rwnx
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:09:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656806994; x=1659398995; bh=Keur84s81dftzm7jD6
 9JDIbb8De9fx2cMQzJdkPZ2LE=; b=RPkxY7LoEFvNvRNwTZNIASCZm/Ocj9pTDv
 t5igZyW/pkKFt/W+vLOO0kUz9uvo1iC75e+Krb+kFdIhwBjHohUl3vJlAZx36HgZ
 nxTvg2i34K6pKN7HJzLzv5CiPxbcOQQu6D+wflzAplajhsimsdk9sllZYRquHy2t
 IeJq+Pttr7rEjw/Pvv7UKNgJctM8nrpyqNwuWvdj23BCcQWMAhqcuXAAKtolHIxA
 Fe+3YLVqpj/EAwau/CEK0GfvYS8wSEultyHW3QT6CIY+/VSt49V4+l2hUP9nsP0z
 JINhCBTR6d0EIxi7LWlbWlHF7e+71A+ryO0xaFHuUpiFGACUM53A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id he758oaMXQwb for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:09:54 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Sx3GDjz1RtVk;
 Sat,  2 Jul 2022 17:09:53 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Nicolas Pitre <nico@fluxnic.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/19] target/riscv/pmp: guard against PMP ranges with a
 negative size
Date: Sun,  3 Jul 2022 10:09:24 +1000
Message-Id: <20220703000938.437765-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
References: <20220703000938.437765-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
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

From: Nicolas Pitre <nico@fluxnic.net>

For a TOR entry to match, the stard address must be lower than the end
address. Normally this is always the case, but correct code might still
run into the following scenario:

Initial state:

	pmpaddr3 =3D 0x2000	pmp3cfg =3D OFF
	pmpaddr4 =3D 0x3000	pmp4cfg =3D TOR

Execution:

	1. write 0x40ff to pmpaddr3
	2. write 0x32ff to pmpaddr4
	3. set pmp3cfg to NAPOT with a read-modify-write on pmpcfg0
	4. set pmp4cfg to NAPOT with a read-modify-write on pmpcfg1

When (2) is emulated, a call to pmp_update_rule() creates a negative
range for pmp4 as pmp4cfg is still set to TOR. And when (3) is emulated,
a call to tlb_flush() is performed, causing pmp_get_tlb_size() to return
a very creatively large TLB size for pmp4. This, in turn, may result in
accesses to non-existent/unitialized memory regions and a fault, so that
(4) ends up never being executed.

This is in m-mode with MPRV unset, meaning that unlocked PMP entries
should have no effect. Therefore such a behavior based on PMP content
is very unexpected.

Make sure no negative PMP range can be created, whether explicitly by
the emulated code or implicitly like the above.

Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <3oq0sqs1-67o0-145-5n1s-453o118804q@syhkavp.arg>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 151da3fa08..ea2b67d947 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -167,6 +167,9 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_=
t pmp_index)
     case PMP_AMATCH_TOR:
         sa =3D prev_addr << 2; /* shift up from [xx:0] to [xx+2:2] */
         ea =3D (this_addr << 2) - 1u;
+        if (sa > ea) {
+            sa =3D ea =3D 0u;
+        }
         break;
=20
     case PMP_AMATCH_NA4:
--=20
2.36.1


