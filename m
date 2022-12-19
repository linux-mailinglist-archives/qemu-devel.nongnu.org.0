Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FFD650665
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:28:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75kh-0002PY-7B; Sun, 18 Dec 2022 21:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75kT-0002H6-0A
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:25 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75kQ-0001CM-7U
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416361; x=1702952361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VhJier8Sfagp/2bmB4q0y6I9QpcKcN4XDbRExd/aw3w=;
 b=lWnXc1QzKt3RhXFCiE8NMGSkT24kQ92u0wNnBIKNXFLGlDrXNesghjUT
 iG967RBKU0+INkYaOYwKWYPJFkpi8xs/TJLbAQ5jvf2kh5hOkDDvFg7wi
 k5RnYFar6v3FDQkx76BwuUaRHV8jicR4MF/a8BP40g9M13bXG2452Fdz/
 W7bKp6NYYe3CQfssPnnvhuKseNDEstXxftol8A3NTLz4DD+KxucCQffmD
 uZaEZYdyh4JBRq36pSHkjNT/Rt0drhl0oraVv8WDr5Yt0voUYLFbtEG9U
 XL5SRbfSaml9aNJSEB92ekDe/Ot6Etw+o4aacRklU2n6Kb86H6NVAlVSX Q==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056846"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:19:02 +0800
IronPort-SDR: KTh9JM8Q3zg4bESiRCwCTB2Vpi2Mu3CRDpHpzoV/QxeT0Lm9AFv2CZa1Qp9f5PmInLPj/cjsWp
 p6VQLvhr+5a24vSAHITPHMWpiGVhi+3NLDpFIsJtiXyv7t4qtZvwr4BM6rITeAVrpgrxRMAGg3
 hF3k1a363AjRVSaGDo7raTAUm8EAggSf/UvMeX4Pq3BtnwRV3KOqdM60TLaShXqLe1ge9TScs+
 HazjpZTwLb0K7MdiE0PIdr8MSGA8wb25sN6kTLKvxH+FoyH31xl0UdgunWWibRA4Gc/1aIiGVN
 Py4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:37:19 -0800
IronPort-SDR: uk4EelR0yHWKsJirojzjU3MBlwCUknZk5sRPLOIQiyMr6UmG4TsHnKSCjMO3Ev6qfZeop0LIpm
 xPHWFJUCLonfvDrQNPqGKHTtSp5Wc6K4arDCyrbWwiGZrf2nsqWSeSj5K7jy6uA7ZfXEqMvdbI
 gYO6MfkDtc32yvCLN1hlTJa8MtOMHdcJeLbeFTobxaTyiJ7yGYVu9CTFdcycM88Ckoos5JakPV
 9K0wUbPbTujxPfoFrd1RKFSpBt4V1BYEm2Qg13D/HKlg/lOmniOqtKbZiPsdR1+Uuay7Zx7gzF
 6NA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:19:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Ky4XKzz1Rwrq
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:19:02 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416342; x=1674008343; bh=VhJier8Sfagp/2bmB4
 q0y6I9QpcKcN4XDbRExd/aw3w=; b=pXwB46a0Ajr/LdermCz2+dYUl3fRy4/TC8
 A5efY5spvx+VDoMW7KYjynpK7pMhz3CTHGpGPL6/obwxY9FmZNhhq2A0XQqGZGfP
 WFkBpryp9QV0mY5vcYCfZdX7Ex4niVBtG6ItlSy1UdfcnmWr4jwOwVUDtjKZ0lv7
 3VVU2Go1WawlKBUCdbnJE2lDmbebEF1L/M3iXMq7U7iciKR9v1bgT9/BXiF7vAQn
 WJGcITkEwXhD2Rm199Sh2VXFUJJMK5g2dTPaZutd5rUMRRtKuyeQGkLY0ZYoFLrP
 CmslU1uIye2GV7kqCjQzzEfpnSMD4lfaRowkTWrsmQmMUoqniMgA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QpTspKkyIJ1X for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:19:02 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Kw1Zkyz1RvLy;
 Sun, 18 Dec 2022 18:18:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 45/45] hw/intc: sifive_plic: Fix the pending register range
 check
Date: Mon, 19 Dec 2022 12:17:03 +1000
Message-Id: <20221219021703.20473-46-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

The pending register upper limit is currently set to
plic->num_sources >> 3, which is wrong, e.g.: considering
plic->num_sources is 7, the upper limit becomes 0 which fails
the range check if reading the pending register at pending_base.

Fixes: 1e24429e40df ("SiFive RISC-V PLIC Block")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-16-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 1a792cc3f5..5522ede2cf 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -143,7 +143,8 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr=
 addr, unsigned size)
         uint32_t irq =3D (addr - plic->priority_base) >> 2;
=20
         return plic->source_priority[irq];
-    } else if (addr_between(addr, plic->pending_base, plic->num_sources =
>> 3)) {
+    } else if (addr_between(addr, plic->pending_base,
+                            (plic->num_sources + 31) >> 3)) {
         uint32_t word =3D (addr - plic->pending_base) >> 2;
=20
         return plic->pending[word];
@@ -202,7 +203,7 @@ static void sifive_plic_write(void *opaque, hwaddr ad=
dr, uint64_t value,
             sifive_plic_update(plic);
         }
     } else if (addr_between(addr, plic->pending_base,
-                            plic->num_sources >> 3)) {
+                            (plic->num_sources + 31) >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid pending write: 0x%" HWADDR_PRIx "",
                       __func__, addr);
--=20
2.38.1


