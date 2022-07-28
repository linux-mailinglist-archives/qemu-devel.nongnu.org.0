Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C07583623
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 03:06:31 +0200 (CEST)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGryw-0005rB-Fj
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 21:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2015eeb89=alistair.francis@opensource.wdc.com>)
 id 1oGrsw-0001Tl-DX
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 21:00:18 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:38260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2015eeb89=alistair.francis@opensource.wdc.com>)
 id 1oGrss-00019x-MV
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 21:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1658970014; x=1690506014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dUWi1ZHzGMH90lfUXo2/B4CEK4V2LINxYOaJx+iIO24=;
 b=YtDGHPXkfTbhx8hTKrn7MXrO2xtYHSPTavsbqxeCMozotWoeJdoxmYxH
 r8tiU4JwFpteavDxWWTgX+0miyzXJUAqYBvhDd0QnzC4w8kOGElTP44b0
 LggQozHOcShXniemYq9Bbm8cA11+3GslvO42qSSmg6ZeipKGFDm4oJDOQ
 fmiZfpuSVW41GCo3Sve/bTp1bFLYM+4Ycve042j34gSeZVd0rQMuyWscA
 S5UDE7Li6UW20cq+AZhdjZH0xEV3yk31c4MQUuZRNIYDfC1UzmkLfOgbx
 6tTq+r9yQgUtpJHTK8eq17Puh4fypUuJWpqsNCQYvf7yIAE7SI+oNrsdt w==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654531200"; d="scan'208";a="207719370"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2022 09:00:11 +0800
IronPort-SDR: 9uANjdHtHVWikp2bDjwRWoBVwCX7Qw4/v7oEukMwe56D8AjvcPfcp5xwA6TGOsigpabMEs8wJ2
 slRP5CDXORH1UYeo7O1f1JydWukkRHBcQ1aPtjEs77eh0N1w6tEy2JPbhNOa+QK5i93p1rzTKO
 rMjXzNCoIEniqvI1s5IY3cp5K3tc1o1qiab91B7eDcz/fcWLY9SeBVctZlm05o033oRguUKIkW
 2xVeb+k8XK2Ox3YBLYhvZdJRx/DdYGXMUj8Rossq95oEWqy1XWLYYluUwqsxnefB0XkR4YDyAm
 vnt2UrxmRCqTi76edxybgfne
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 17:16:18 -0700
IronPort-SDR: ksHz4VFD99tXn4+0/1ioyBeDT19/djZUlVjuKJ2sv4Lu6sqSOc/gJ+r8g2Ho8s7s7WOJaFars9
 CgrpnOoUIsZomAYNJpabPSFS1s8PAx78UqnRmmG5lxymTalO8RioYXJr+zWsa1+QpbCp+NiK0E
 NWF6ItMuOvd0/yEfm4gMXrXooZTonkQ60BT2YP1wBvfG7Wxb83b+d2lu9skkMlt5ZzM2RObNcL
 jn8EJ18SvcX5lMb0NRL6QDlDMpVVfx4A/H8U71STrvdyE4MWr/gSi/tjQPGESae4nUErRigThn
 2jM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 18:00:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LtXPQ6Gk8z1Rw4L
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 18:00:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1658970010; x=1661562011; bh=dUWi1ZHzGMH90lfUXo
 2/B4CEK4V2LINxYOaJx+iIO24=; b=n5ipI/FMqwlhkR8D+RVkDl595OHwi6Sbs2
 Ehruot+3U4R4gC7oFqoCe7wXAsHdQlEACZ/XKJmdvi0Bzuzv99WbaiXQ/MLO/wi+
 SghiV0BJTrHVDimJeR4q75+dybEayur5ZR3vr+uzMTr6So/cH78PFm7tFEZbN2r8
 0KrYOuSoIHU9Gyo45/0Sj3bCV1JfIdGl+RQIDppIjwqbgz+NlFG0XX7vqtn1y6iJ
 7xIf2OFc5C5cnagl4JRd9OR2SA+hKGswzwzJ5Mg7S5qoreaxaVOHQ7B2FwByLbIJ
 ErGgmG9908Ipp3tbzTuQrOzGK1aDVJF6dX0uHrPChxzJjVALaydQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id V9tW5-8sfxyD for <qemu-devel@nongnu.org>;
 Wed, 27 Jul 2022 18:00:10 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.18])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LtXPN2V7Xz1RtVk;
 Wed, 27 Jul 2022 18:00:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Palmer Dabbelt <palmer@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 1/2] RISC-V: Allow both Zmmul and M
Date: Thu, 28 Jul 2022 10:59:59 +1000
Message-Id: <20220728010000.2764631-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728010000.2764631-1-alistair.francis@opensource.wdc.com>
References: <20220728010000.2764631-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2015eeb89=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Palmer Dabbelt <palmer@rivosinc.com>

We got to talking about how Zmmul and M interact with each other
https://github.com/riscv/riscv-isa-manual/issues/869 , and it turns out
that QEMU's behavior is slightly wrong: having Zmmul and M is a legal
combination, it just means that the multiplication instructions are
supported even when M is disabled at runtime via misa.

This just stops overriding M from Zmmul, with that the other checks for
the multiplication instructions work as per the ISA.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220714180033.22385-1-palmer@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1bb3973806..ac6f82ebd0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -619,11 +619,6 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
             cpu->cfg.ext_ifencei =3D true;
         }
=20
-        if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
-            warn_report("Zmmul will override M");
-            cpu->cfg.ext_m =3D false;
-        }
-
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
                        "I and E extensions are incompatible");
--=20
2.37.1


