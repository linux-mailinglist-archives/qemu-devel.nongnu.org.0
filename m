Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCC65FA59
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:34:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCa-0001ks-M1; Thu, 05 Jan 2023 22:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCX-0001gm-HW
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:26 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCU-00088g-Ie
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974922; x=1704510922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cVNfEgL9diG7yMNI4ZgAOUErO/Nj1Kr9L+T4NPFyyd0=;
 b=bCtekKhHNjYz25DpOhIAw12nBR2T4QUwtfnZMv86QcTpvQX7M0ahf8um
 GVc2s+xLkKMjpTtiWLOVEQq3y/UL58mvZWrGrHsoiXQlY2/tJjIyz+0bM
 YFKF0wltB/XY6jkVuf+lbWn6uO3MytMNvTiZOXppPgnCIixAFJZZtiJ0N
 F+OwbbPHu706TWD02LO3DuE6O35EXcdfq5nnJy7kh5u9wFE4FAfpSBpFH
 KFa5bOmcyAel1Oau7Bcm9ZMQsbSccATZaWp0P8sx4GqvoyagShZLfQRVE
 iGZWJf4DVD1NGvxaYtqTDPUKsS1mf9BFGuREAsYWs+rNvXGO3lOXnc+x1 Q==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254800"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:43 +0800
IronPort-SDR: xpb8P1lzrQJXImUQbo2k3ZigRMpHIrLmFW+PdOdQm/9pAt455ejOm6AesjqecCHP4PdNFdJcRh
 zzXGnRnD1PobuVe+GHkSoapV5kMJHlwxY3Hltmbw50/pHG4HlS+HIv6oQNHUU0GqTfnfWMhU5t
 MDCdKujaBWbITOChfGF6oZRIeR4JOOIGzekMqdiWZkOuowdqolXyyuJ1UYDuGH0fCfnw9jKSZ6
 o3SSruu68D1raNPPVPUfwEELGh3/RsPDOpKivjWCNFh43Ps2MUaRzyGCdSGRuOEQLFcYr4JCyN
 OpI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:54 -0800
IronPort-SDR: 8LqABXPtl6mJqu1SsTPToSyO3wMrP2xLon5chzL7tRIXApAqwK8r+rDTim7NwRELAp4zehx4gm
 Rz59gnOech1jUqMf1d+bE9Z5waonJ7+eXpAZXixxwYAzTcY7apOTsLvDDxejgyQZlhNJ5pV4CZ
 810oOpEDQlY5QDDVzw19AYq0KSOCb5llqWEhsIiA4QQ2lZdo5+4rPtqvDPhCUWZmJjga8i69Ow
 P57xGK+q9T94hRxkwx/X5qYif6kiZxOMkoQExu7J+OY4xOeRw/owYyQsTOmT8zPtyJczmS1lxI
 ygM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jv058Dz1RvTr
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974882; x=1675566883; bh=cVNfEgL9diG7yMNI4Z
 gAOUErO/Nj1Kr9L+T4NPFyyd0=; b=ql9EXVZP5vRWl6o1Yu/1Y4O74vIlKtaUZM
 ej4ij2s8dHOsPBdKT1GOq6uFUUCGvvilqz2rH+Ofaf63p3mt0UVD4nap01WxMu0C
 /Wy8GBJorDtpV9nwl82ai7WjuV8jNJejXOIrXgZ2bmHcFQX2Zsjcp5nk78T9ZufD
 9b0YC7EVdX7jjecVK3sUqjY60N4qGFoDUwxEdwUAhKPZDyjUQ1iPCP6YCR2+TfOP
 KPqGga2JTEpsm1wf/awdxywIcQNTydmQ5xo+8AZZ385wTVfUVV8hrcsacQI21tdA
 Pmqt4wLsEjOeIjrt4QzLPEfHA2q9jAiP2uSxwjHJvNznQnWkYRUg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ixo__8DL-pmy for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:42 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7js1v3Vz1RvTp;
 Thu,  5 Jan 2023 19:14:40 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 22/43] hw/intc: sifive_plic: fix out-of-bound access of
 source_priority array
Date: Fri,  6 Jan 2023 13:13:36 +1000
Message-Id: <20230106031357.777790-23-alistair.francis@opensource.wdc.com>
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

From: Jim Shu <jim.shu@sifive.com>

If the number of interrupt is not multiple of 32, PLIC will have
out-of-bound access to source_priority array. Compute the number of
interrupt in the last word to avoid this out-of-bound access of array.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20221127165753.30533-1-jim.shu@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index b4949bef97..0c7696520d 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -78,6 +78,7 @@ static uint32_t sifive_plic_claimed(SiFivePLICState *pl=
ic, uint32_t addrid)
     uint32_t max_irq =3D 0;
     uint32_t max_prio =3D plic->target_priority[addrid];
     int i, j;
+    int num_irq_in_word =3D 32;
=20
     for (i =3D 0; i < plic->bitfield_words; i++) {
         uint32_t pending_enabled_not_claimed =3D
@@ -88,7 +89,16 @@ static uint32_t sifive_plic_claimed(SiFivePLICState *p=
lic, uint32_t addrid)
             continue;
         }
=20
-        for (j =3D 0; j < 32; j++) {
+        if (i =3D=3D (plic->bitfield_words - 1)) {
+            /*
+             * If plic->num_sources is not multiple of 32, num-of-irq in=
 last
+             * word is not 32. Compute the num-of-irq of last word to av=
oid
+             * out-of-bound access of source_priority array.
+             */
+            num_irq_in_word =3D plic->num_sources - ((plic->bitfield_wor=
ds - 1) << 5);
+        }
+
+        for (j =3D 0; j < num_irq_in_word; j++) {
             int irq =3D (i << 5) + j;
             uint32_t prio =3D plic->source_priority[irq];
             int enabled =3D pending_enabled_not_claimed & (1 << j);
--=20
2.39.0


