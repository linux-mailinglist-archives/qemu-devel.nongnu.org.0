Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C6653908
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87nv-00037M-V4; Wed, 21 Dec 2022 17:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nt-00035s-8F
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:13 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nq-0000bf-EG
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662590; x=1703198590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nlKcnGFnnezn/uyVuR1UsLHc6jl6EbJxpvVfxGJcUTE=;
 b=ruXEuZD6E6/9rj+wJu+cWxbLdVYxh5epyIvX0dXdWDbnFI4V98iHG+EK
 aZEhQ5o5SQ5Ig77C0RmQNQZlCbwc4njFPH9W210Og3Adn8xSavjsF45FG
 H22KZrwUIMP7lgMDzt5rKv2eo0giIlDwC9Q2XrnHy5CzKRn8JH2VcF+DH
 5jNKMjdwhnM5tC04nzCq4L/P59OqOoooedk0YAEAiEjB+ZH9fiIBd4WlG
 rSPZMudfOhOTl5Ps7R5uKZIG4/OgAZF/pbn67+SIIJYM0JR+8K6Y4KFKi
 gLa5LH+8RjPZx1hLHu6DFUE0ga30XE/k9C0G6uCGH1gpwjLec5Kj83GhK g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561444"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:47 +0800
IronPort-SDR: +K21h8SAwPYFHxD0tCQYkoBpoVXKLSsK07pLWiWuEsTm3b6wu0fnDvNNCNLX7q+ag0UDlk7Azm
 mw5cY6i9CCkeK7wahUdkaFw+Qne2l+nDBcEACoxxEpIvJmmGo1aG6Ep8dc4V/mS3QfcZrsXqyC
 ++6CeboFCt7Lgg2qp5k9uFXClvHA/q5iv5Xul17fpp9jCCCKP5Dnjk1gq83Ehq824Kb6x76CqR
 5cvEjtm1OaP6ruDEk7/G1x1q99f2PFdamvGnvgo03+otJyuv0nFgH4QUZoiCBbUt01k+PKLgSi
 9Ho=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:16 -0800
IronPort-SDR: IqohX79GpIJiNCom6ULZGx+XewGd/XBcGZpcHXjacZsWTFbqxOTLoZWLrCBUbtKTxtWjaV3tCd
 wlSrSM9TkZVGYrB77MEkCrzmG70WdrxsJh/KPa+Z8CYspDPwAUIozmFyXiKgsyIMkUbqa1Jq+q
 trCF8Hgq6VvXrkojB9CZjG2Kl7/HyT5gvtayYFlFCqU0kwTzlIWhtbWA19K8vyadatIyTYakLv
 UOYNAtrb3/nLcJq6LLkTT1HlWaq8qc0IFWHbP1zUa+CDseslYmAktTkYGX50IB9QQPfPGQO/FY
 lCg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMw0DXgz1RwqL
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671662507; x=1674254508; bh=nlKcnGF
 nnezn/uyVuR1UsLHc6jl6EbJxpvVfxGJcUTE=; b=ZwaibLiwJjqLT++aaacvqhX
 SsQl6DIjTtMqECqRY+b+ei+AV1uNhIcGJUbaeiyU8nfTzAcvowMz7Vi/k0R6XgJS
 eitg3EK52rY+OtnALPgygIYAqlk43XM9a8z9XE8Hj401TBGHpY/Bbv9hvW8bu08d
 6sW2Nb2ZgEb78GpocyRFIxeUl1Prb7HymqqdsnltHlyAA4HAt7vvig1npDsus6np
 7Q2GY1DAGD0yEqkQgRwoaOOJ6cRH12+BzUndTZwg7wvySUKJjP74LGYby7+Iz/b6
 9xLvTHRCqtkcW5BCfSZxCIqtOQLKtA3Sf547NOSizaFxfLxyxLdEkwlG7n5qR2Q=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XY4C-0-NKSF4 for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:47 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMs6GcZz1Rwrq;
 Wed, 21 Dec 2022 14:41:45 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 37/45] hw/intc: sifive_plic: Use error_setg() to propagate
 the error up via errp in sifive_plic_realize()
Date: Thu, 22 Dec 2022 08:40:14 +1000
Message-Id: <20221221224022.425831-38-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

The realize() callback has an errp for us to propagate the error up.
While we are here, correct the wrong multi-line comment format.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Message-Id: <20221211030829.802437-8-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c9af94a888..9cb4c6d6d4 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -379,7 +379,8 @@ static void sifive_plic_realize(DeviceState *dev, Err=
or **errp)
     s->m_external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
     qdev_init_gpio_out(dev, s->m_external_irqs, s->num_harts);
=20
-    /* We can't allow the supervisor to control SEIP as this would allow=
 the
+    /*
+     * We can't allow the supervisor to control SEIP as this would allow=
 the
      * supervisor to clear a pending external interrupt which will resul=
t in
      * lost a interrupt in the case a PLIC is attached. The SEIP bit mus=
t be
      * hardware controlled when a PLIC is attached.
@@ -387,8 +388,8 @@ static void sifive_plic_realize(DeviceState *dev, Err=
or **errp)
     for (i =3D 0; i < s->num_harts; i++) {
         RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
         if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
-            error_report("SEIP already claimed");
-            exit(1);
+            error_setg(errp, "SEIP already claimed");
+            return;
         }
     }
=20
--=20
2.38.1


