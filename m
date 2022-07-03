Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B2564372
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:23:12 +0200 (CEST)
Received: from localhost ([::1]:43902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nOJ-0001kx-6L
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEP-0008HP-Ku
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:57 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEL-0001pZ-DP
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807172; x=1688343172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Keur84s81dftzm7jD69JDIbb8De9fx2cMQzJdkPZ2LE=;
 b=E14vGwEP7N1YKOPrZFNguKP/BTX5xOqSlLzPkZaY0ulLL8tqcqxs5iTY
 RIjsPwyHxV0ApP0JPQ1+aIkn06yVLZ9Ywj5UBw1AYZCT3KRmCqSzxjFzA
 h3emXfWuglhSv2v1xSyFll7zZ+MLLIuM2Zw94ky9iyz+pGMV02u9tnCnN
 LdxNzOAwIq6A4S93YaiCZEl2uTcxvn9H8UJ+G6UoE3eC+W3TOkKttMNmS
 eLx4vv5sEV7+wRYY9EyFffEiIcpJ7V3fxxj15RQiMUSgyCOKzT3UlC0WY
 cEEwCNZmuOK8rpZThbRNDyvbvig8e95sJUlyFygyTCUfdnnMJBy4Qe9hb A==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667225"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:12:49 +0800
IronPort-SDR: wMXL38Kdgx+LTbbAfxh01K8602cNdPzSF59mH1pjwZbmJw4PBsXbQnVS7AUP7SKDsMyM3HWUFg
 1gTtmDxWxcaQOVkWLKYXAptRqotJB7vRhLAEV9sujMQzXzE0+hxg8rRzf0HpAOIH+IyyqQCElo
 C0tJNL9DeQkZJjJqBJtLQ+GubpqEo5QVjIqCCIiZCugoH70iVqTBi0qbn6Y8bwLuLjzedk62S/
 enbZ5Dv5Cxe2NfogwkbAvm0aZuDDoHx+MjnapNNDQUI6sskdjCPbt//quQSElirsjYdfBNBpew
 vNegQjs1UYZ/jeTUN63u5LFL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:11 -0700
IronPort-SDR: iFYAcw5D5UkGugvVR29FwIwBENjdRWpMIhCGs2EahHwQkx2/1kYMnqhl8r35nNI5SGAigTjZ/r
 XWe9jzxoP3GdU2KffTX5/Ap650+bzu5PbKeRTjrrRJi14xjgA/tSVoy8Zns6G52w3Cl3IvJzNU
 3FRD3f4fC5Y844RFK+PqJanbZgWsCagrxIaDQPVXMPQOuWzQC+1J3O1kr1szgJCj+rgDffR6OW
 BnrlJxDIh2dvOYGi5246XIAoKNWXPUZPdBjFc4RJCtZXRga9O2PVGlSvZkNBvieGtVV2cmwLDm
 kwU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:12:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8XK3TF4z1Rwnm
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:12:49 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807169; x=1659399170; bh=Keur84s81dftzm7jD6
 9JDIbb8De9fx2cMQzJdkPZ2LE=; b=YJ23VrhtB2dU2JRKyIPqwyQsyigXQH0FNM
 hgHF2AvrBj92WE8JZETiNJkAHvju/SjiX+Q+natTglrr5bwIoHT5SyqS12n88JMh
 /vTXCweNz3XAZY283NTbx3oCLV7Wf1XLFInjCtVfvUK3yR0EYCp2yVWqvJzTP/d5
 61gnZJDGBJBtFGRYJXVXeU02Egtgxfv8TRBNBw/aRWWHUIPDcHPzGmZ34CQUrHBB
 kCBeKbVmU48kw6X1w6vC0au8ENTArBUs7aoEmPKPHOSriEqHQBHNcd3lCkqhp9kA
 hR0iibVoW7YhI8oE+KZ1/w7D6gQlqeFhwhgB1pxTPyYhjRt1L7xA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id dBrKIqrnUwFU for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:12:49 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8XH0XbKz1RtVk;
 Sat,  2 Jul 2022 17:12:46 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Nicolas Pitre <nico@fluxnic.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 05/19] target/riscv/pmp: guard against PMP ranges with a
 negative size
Date: Sun,  3 Jul 2022 10:12:20 +1000
Message-Id: <20220703001234.439716-6-alistair.francis@opensource.wdc.com>
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


