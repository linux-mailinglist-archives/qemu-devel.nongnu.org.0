Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620F647A43D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:17:15 +0100 (CET)
Received: from localhost ([::1]:56086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzB2w-0002Bj-CG
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:17:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkL-0008Oi-Cf
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkI-00082a-6q
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976278; x=1671512278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e9UhzwaVDzAOGnfAm4EFELyUCLHnA145WJhRBdE2BL4=;
 b=ChpfLfeAbxuYJCG9tRtPLE2qfmKgGQDOtp6ktfwxbG2s96vemU8VLLF0
 z7QBi7y3ZQ9OixTh80vKmD4EGosY19DqypP1Ow0Kp6vh0rI9PtNtRjRxG
 JVe5x2g/xocpo9ZUSLMQx4dYZeMJSGRvOESBFIkClQ03RuEBD2shMy42+
 9z+scOBYT9tXuEsQmJ4nJsk9KJUc/cjyierJyHJ9H1HjovdFsdKBlGdhg
 pJcA+s6+QELPiR0AahdgCQBVNNzcsuMVRlLQE4oefKOJP7xA+a4KOwKLP
 AY9bJLRKT7MdNF1Dps+J4zL8TtxCiBRBmBB7fFhCdOQXsfDy2jzFxVtO6 g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661891"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:51 +0800
IronPort-SDR: M3iqIbw3WBGvrOkJVFhfQnDi/8qvB7qm+Vw09KcIFVhO8/L7/OWvsfq4pQ95hzlQnWecAHZBtP
 VZ8f3363HCgOhgNQdGqivS5KB0zRabrZNeadUbl0BRFFrTuI3VsE9AEjlXHL5iSA7B2hK02GnC
 +eiBVdY/JjAkGmCh5e3Bxv/PN6QHp8FtTlEmOVo/gp7xfp943oqxGjdTjReVztc7Mn1509Chdt
 +whjaFUvLGdwgWlUgqz32fLfVY0M9G8sljXYv5h0GPDL4A+Vkq69L+ouldpOE7d2BL9bVJ6spz
 dh/DhP4NuLSpbyiJroxYiBad
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:30:41 -0800
IronPort-SDR: rIq52hum8GdJGFA7voRQ6wGkwyk3iXv5LawRSK1+4bNnyWlTL8Jv7NDqMHtfmPSkEifmmFt09H
 vGbNaK1GYdrze4tTHRzINdCleZqdfubzN5j9IK5KCyGRvTCRdLIh+e17TsIMyh5c+byrmDJ9rY
 q2A7Ppcn06KMy0EZR3SeS12FyZoiKmKPF9wGbusT0N0gWaEY/74KQUWFsiNN4HcuufzT+qcU92
 3L0hPk7BFqpItY1kxHaiPE6eK5cMnJSRDwUuO+2tzhFIBrJeyexAN6UOIBDLAKSDlcRmmxHO65
 390=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:57:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS5C3jB9z1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976271; x=1642568272; bh=e9UhzwaVDzAOGnfAm4
 EFELyUCLHnA145WJhRBdE2BL4=; b=FlB6/ruVof4b/RHWb46GTpCYM9DZCCoWUB
 OS4mzH8vKVlCle/QVXz2xjxQPeR9Ks9L3HyzZcZsx8YTkOUE+r5NRNmI1xUsBSBM
 9f7LnjFKHVuDqKbtVI/NrwDFr1JWwA03HeSNPL21mRJ9+Pgak0FOPONfWUvT54Dl
 Us+KcOzEBaiNWDtI/C1AipGrQzsRDdezFzb/rZ1A3NTVyDAuwbVoS2ego+gEEQD2
 MJ0aYeyuCIZhsAMFOwm/dzr6vX8fVvsCkjArMXyd4V4mDewYFfdbdvxn4MTdM2AE
 vfNew6L+JrVrHOYsIzua1hSfdXwe1O8pVtXC3BkZ87mWU7ZMiNHg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id uMZ_O3mwmT4L for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:51 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS584tgNz1RtVG;
 Sun, 19 Dec 2021 20:57:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/88] target/riscv: zfh: add Zfhmin cpu property
Date: Mon, 20 Dec 2021 14:55:45 +1000
Message-Id: <20211220045705.62174-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211210074329.5775-9-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0f808a5bee..9835829588 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -630,6 +630,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
+    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
=20
--=20
2.31.1


