Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4176430DEE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 04:42:55 +0200 (CEST)
Received: from localhost ([::1]:49020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcIc2-0007j6-Vf
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 22:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIZE-00053F-MW
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:40:00 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIZB-0006jq-L6
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524797; x=1666060797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dOJHT33AmvBuAavfWO+VDGYYMhs/3tDBqE4/z6LbhPY=;
 b=Yk3luTRPmMVy613PkU3VhnKwW/CH9QAhhMPJW/4SLbEFiA1vqLqqicK9
 cV6Pn66A1piVnQf8/QWYZdMuEXUSeJhB7on4ECtV4yxcIINRskGKnylJ8
 Zpr4cQ0j1M3Y1JoX7mj33OmP7+dOpaaMeVy4mkvwxc9l2JbVpCPD/vh7O
 KvNremBmP4k/F48/3BVbLuc9GGsKw8oaSaiCf6nYIOpKwOs1plgqyCO0/
 6YrTwr7D7NZ1t04tWpujV+5YUy0WOUBIDtPfqO6cJ1UP++KRdmNc/AEjt
 awH78pgByPk0nW0+L2Bj0+jefWIRPOPvu7AqmIC8Mq6fiDEQ63L1jh+Mz Q==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="183138071"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:39:54 +0800
IronPort-SDR: mRwqHSbUEvohB53KLA3tJdJBNEi2us+vnjRZkH7d9gal4qB+i3F6bG7QrXdDxSqmv3qX6kuM/B
 piI3GAzj2t/+PzDX0Vkwkdq/cHU3bD8Ulxm0mee0CL2b24kQGBJDLtzsZ60LPUi6Sv00vXWu1K
 tWKANJqXUPuuYecb7DQ55k/gUBEIPoZKG7Fm1FISem9TMaG0Uy5xAlX/W6K0Zi4ohzrOWfUnNr
 tLGL73npTNPfhHwbz0LjSeOp+79ZA0aTkFozKbp0fJn/YmbvcCMtT6srrlCiUb7Qxsi5khYaYp
 NyqRoPBa/tL6ZhHODfw0aJIG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:14:02 -0700
IronPort-SDR: BH5irjmN62tRBbOpZ37UwOr+RyCpeFdmbGFl/4WSaakW190D+UdVzoztPWpvJul5Meg9v7Yud4
 jcuIIaqjoAug/ZxA6y3B7j0SD31cqKbJ5fo2IOY2LAfk6KG8eV8rVhgEdPyzmODlLPjMkxWgCj
 uCPV1+ErFAPloAA5EHG702rbZWGF8GPyR9g7MxNOyUo9PC5H4n3w11l7Ug/qC8JowaSlCJqf3s
 Z3WTAPrEzllMtbrOa8+4LBOY7Onb6KGEgnFk86JTAzC12HIdPy7EqNpv7jGMy6TI0V3csjARka
 23s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:39:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh164Lbdz1Rvm1
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 19:39:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524794; x=1637116795; bh=dOJHT33AmvBuAavfWO
 +VDGYYMhs/3tDBqE4/z6LbhPY=; b=H4u6UKzp/+edaa17fJVTjIQmVm1j9ncMDC
 hRglJ3rXr4gGK/fLtmmR9djiOfQJ4Zmhgiy9K9VKytDkp4dFT4kB9s1ggu54FZUo
 NDK0mHwYNoa34vf4nTMvU7YPRrbwAlE7qBzFINzKZV9mjfonnlCIQtAnHo+JTang
 oORLgcsOSyX43WP6n6rlNdmtX4zGEsHh8h+afQ26BSlRYVS2WQ1WSQbB/8BsYSuv
 Z+kaKBmUadmzf3TrNliO36H7qWOiF5NmbI5uEz3I7K0QYaisEsha5YgyAYem53b9
 VZ/lVyc9TkQe9uJLibrzI2tyMoivCzDOUx8fIC32T3i2OZWiL69w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CeouNppOUPSo for <qemu-devel@nongnu.org>;
 Sun, 17 Oct 2021 19:39:54 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh112r7wz1RvlJ;
 Sun, 17 Oct 2021 19:39:48 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 5/9] hw/intc: sifive_plic: Cleanup the irq_request function
Date: Mon, 18 Oct 2021 12:39:41 +1000
Message-Id: <4200da222a65c89ed1ba35f754dcca7fdd9f08d6.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index d77a5ced23..877e76877c 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -412,12 +412,10 @@ static void parse_hart_config(SiFivePLICState *plic=
)
=20
 static void sifive_plic_irq_request(void *opaque, int irq, int level)
 {
-    SiFivePLICState *plic =3D opaque;
-    if (RISCV_DEBUG_PLIC) {
-        qemu_log("sifive_plic_irq_request: irq=3D%d level=3D%d\n", irq, =
level);
-    }
-    sifive_plic_set_pending(plic, irq, level > 0);
-    sifive_plic_update(plic);
+    SiFivePLICState *s =3D opaque;
+
+    sifive_plic_set_pending(s, irq, level > 0);
+    sifive_plic_update(s);
 }
=20
 static void sifive_plic_realize(DeviceState *dev, Error **errp)
--=20
2.31.1


