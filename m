Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2535C424DF0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:12:27 +0200 (CEST)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNZq-000894-6Y
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEY-0005IA-1G
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:29 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:14679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEV-0007Fc-Ne
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589424; x=1665125424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pE4cUODrAhWSvvxVxExRTcx6HNb4wfGjorkME61/oFM=;
 b=MvencvjdxcfLihJBYTvAFmdBBZib2/PH2FyC9VCDzUgQuerr4IRM/7QL
 DkvEFnI8zLIz+m6r+D3JT/k675oCpUMrGd4C8+wNKJ+bm7hIqqHP23OBZ
 tus/e1UAzTbRcWSKC4VrxoLzenkp3DbfeSLX5K+JlaonWSYK75trnMWbg
 xKbTBDpFz4P4yntXRG27Hy1KgPbtuyrEi08Rxp66qLeF54HsmflHc55UJ
 f5Ks/FK97q99hbQoc6kBHW9QyAqPJcmqb8QMsMbegUpg0AFjkSAf1qm8N
 75WWfAIXMHnzxteY4aFfYNxTXETAhdu7TCwkgOMKtEzow45IRm4U0c8EF w==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="182849434"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:50:22 +0800
IronPort-SDR: 0JcTHSO+8iNzuvp/j/LMIW3itrtCyATI/NdENS3aKBeRsg3BnGkm5KR9XQQ8wr125iynhYRCaF
 i+1olaexIF1cpopre/dlb53Sh05vSweB8zbmERRWq02tjr4fWBVZUYzs1rgnW2+nEt/4I8eei+
 us1dfBK/U4n6lBjBCxzmSzTVnlYyue2fbQGOso70kDFJH4T6oxwQUXRqgEMyxXWDAsn0GPbdlF
 tQime3bLiF7JHyNsKtbxL9ipnMPIW66uEiRDX7WBgIyEy4mFm2vw0cYSMPnQ819eZt3/cIa2VI
 xd+J7tuaREprK8BCOZbua4D5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:26:15 -0700
IronPort-SDR: 1XiIzfeTLlf3UIL1rqp/lw8IU0082PnTtmKnjOt3fcL2kXpCQztt/asTyScBNQifwTGfbKvJvZ
 frOaAk9LuW55JYrdPt/lHsMBGUzVEJMlKPhFMTG4x1ELqhfwmsAdfWVau5lPcEY+5AJZbOpgE+
 9l6ivb9/19lU7q+0ZWfs5GFRUKmZEvntu27gNJ6vFRbPnlJ8zL6wLAwbFKZjnKBOR/yEssJ+hy
 ao8v8wt9jlB+43nOJBcTpn7k83QiRIEJjslhW3pGv2s5RLxoK3J4EoOT0N5DzO/IZLRYhvV2vy
 4M0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:50:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ2585bLZz1RvmL
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:50:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1633589420; x=1636181421; bh=pE4cUOD
 rAhWSvvxVxExRTcx6HNb4wfGjorkME61/oFM=; b=M4dfMJCOkcjHQ0s949jYiDp
 PZXPO9mX7eAzhu+zfhOb1oWVip8yTGLT4RSnNuan6QlscEAWKPWI/tYFRDLj0x77
 0TSTbD0jzTgAmjOFv4LUjMqHASb4rG812h71fCKAGhtjpAwrc7c7fwHb26PhgWmC
 wyT/L0DMiJ2ZlM466+mrFwNWhPb3OjFVwckfqBbFoFCf77+5LIA54FEObqTc7GjJ
 PDTiia1qR3WmpxyI2Mof25reuaMulRBuHr4tymJOOlhu9ogMLmZMdn9qWQlneSWg
 IIx663Op+ExmA9lWtTpj1jBDRL5QsnYqqodJd69KdxZqqO8NmcW9m6qj/pvpQpw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QILgMBH4Mu5R for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:50:20 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ2535S1qz1RvTg;
 Wed,  6 Oct 2021 23:50:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 24/26] hw/dma: sifive_pdma: Fix Control.claim bit detection
Date: Thu,  7 Oct 2021 16:47:49 +1000
Message-Id: <20211007064751.608580-25-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
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

From: Bin Meng <bmeng.cn@gmail.com>

At present the codes detect whether the DMA channel is claimed by:

  claimed =3D !!s->chan[ch].control & CONTROL_CLAIM;

As ! has higher precedence over & (bitwise and), this is essentially

  claimed =3D (!!s->chan[ch].control) & CONTROL_CLAIM;

which is wrong, as any non-zero bit set in the control register will
produce a result of a claimed channel.

Fixes: de7c7988d25d ("hw/dma: sifive_pdma: reset Next* registers when Con=
trol.claim is set")
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-id: 20210927072124.1564129-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/dma/sifive_pdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index b4fd40573a..b8ec7621f3 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -243,7 +243,7 @@ static void sifive_pdma_write(void *opaque, hwaddr of=
fset,
     offset &=3D 0xfff;
     switch (offset) {
     case DMA_CONTROL:
-        claimed =3D !!s->chan[ch].control & CONTROL_CLAIM;
+        claimed =3D !!(s->chan[ch].control & CONTROL_CLAIM);
=20
         if (!claimed && (value & CONTROL_CLAIM)) {
             /* reset Next* registers */
--=20
2.31.1


