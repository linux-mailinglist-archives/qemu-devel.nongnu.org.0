Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE555333BA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:59:02 +0200 (CEST)
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdUT-0002gO-CM
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGo-0007kV-OV
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:55 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGn-0002Yx-0m
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432292; x=1684968292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=70fjyTOWmnjDkF7UHl0Z44we3+qZjsDgAiKfwoAr70Y=;
 b=KTCRO2Nkqpj3tk8klxFk44WE2X82bwY5pGm1t7A296xdCjbOSiulg2xI
 DsG1DXJxa3dCEU6QpLUh8HH0Tut4eweJtSARlEeMCjCdH2WdmW6lW315n
 XrW3uPKvHDV+Gw35PLHO9iI1dIVx/vOVbygFdP5uodMrHQOxCJ1rD2l/T
 ny2IToqAtPRDdapdp4fgxO+71e3RS0qVs3r1c7kceDsfusP4oaXvCQH3L
 c7EjnMLvZf4GRnR2jVcLmKblqASmzamrNlASZpOPpZLrbFOQHyuvYiCpG
 191bufPUfCs13xb+K7crr1nBJEWvJAr3+PFpZU+tTH4UxIzlrLasccT3x A==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566659"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:44:52 +0800
IronPort-SDR: XJnolJkRPTeilvsQD5E8n3lM0E0cn75Ol/j8tTrudtDd+1yQFcuGuElIFA8bSN1z5jF7ZqxzzX
 OjUY14FIA53OMAeNAv9R0GsDOlDUTVfZ67l3wPGapJBKbROR6sIRJHWcOXbRcBiVlNBqylqKFr
 G5dmxh8SLP9aksWwr/19W9liWmdx1pMfOqq0frWS+MnJR0bK+3hb3/kEpWG98clNo7ZH4Hn2jU
 Ty/KvbFpoylmPmwwtleFq6suST779m0A05jsDMqCXNRs3yDTFE6ej/UYFqAZTbCT+fRaR4PlCa
 L0/elAn1F3DbvWW5UgH5ugqE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:24 -0700
IronPort-SDR: gBxS1y9L/VGuTci7zvaUM4K/ZeZv9Cc6JC0l5GFG0RB8Zo0dcZdpISUgf+KUEm4vpQbYn4VQlM
 FdpqaTHhfypcgV+StWHLXh8gEL36ldQkvojOSKsW0Dnx1x8YqJmLZPH40KgPJO+JFtOXoIpl2I
 aaf/PCnSSpSg+BpoD2Lj9CrXOdXe/EOThtBGgOz+fhu6bpvPIS3yAF5eiS+WF/qEsJRoNWzBoW
 7BTFzRKI4ENwpAgzVlq7dLkXkqKvuIlp6U/bqdv2NoUGSgi7FN40DEaIWqj+0gQ4p82fVVp+Qf
 cnE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:44:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78Qr0b2Pz1Rvlx
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:44:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432291; x=1656024292; bh=70fjyTOWmnjDkF7UHl
 0Z44we3+qZjsDgAiKfwoAr70Y=; b=tmUyUcSp7yXQFoWydczPoW+9G8SGEIfqTz
 d6/83dEh7RZPR1XEEIroTv3FaGlfVor5VcgPlDob3PZx1QdeaQ+IV+UEi9Ar+vW/
 Nh7GoaBpcUpuZ/p9pvAHenohMsSQe7R98Er7C9Ls0dOQ532TjhnTiG5NPgiKad9v
 ihBOdksvSLQrPvC25zE/Xko7T/XSjWm8qSDvAfb3D3ANX054zp8LdPhWIkxioUUT
 4uUBiOyIhWb1pLaYsXB/2EVlg8oXNoWeLR2UNwq7NAIUfYuSHTAyfgvsHcBnSQrg
 LO6WIAlUO/MMcJDeuG+IDd1AjrPoyGQPsx5X0/z6bD5FUrTaMN5A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id r7LhMP0FEDFb for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:44:51 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78Qn4s20z1Rvlc;
 Tue, 24 May 2022 15:44:49 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/23] hw/riscv: Make CPU config error handling generous
 (virt/spike)
Date: Wed, 25 May 2022 08:44:11 +1000
Message-Id: <20220524224428.552334-7-alistair.francis@opensource.wdc.com>
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

If specified CPU configuration is not valid, not just it prints error
message, it aborts and generates core dumps (depends on the operating
system).  This kind of error handling should be used only when a serious
runtime error occurs.

This commit makes error handling on CPU configuration more generous on
virt/spike machines.  It now just prints error message and quits (without
coredumps and aborts).

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <d17381d3ea4992808cf1894f379ca67220f61b45.1652509778.git.rese=
arch_trasio@irq.a4lg.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 2 +-
 hw/riscv/virt.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 068ba3493e..e41b6aa9f0 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -230,7 +230,7 @@ static void spike_board_init(MachineState *machine)
                                 base_hartid, &error_abort);
         object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
                                 hart_count, &error_abort);
-        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
+        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
=20
         /* Core Local Interruptor (timer and IPI) for each socket */
         riscv_aclint_swi_create(
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3326f4db96..244d6408b5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1351,7 +1351,7 @@ static void virt_machine_init(MachineState *machine=
)
                                 base_hartid, &error_abort);
         object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
                                 hart_count, &error_abort);
-        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
+        sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
=20
         if (!kvm_enabled()) {
             if (s->have_aclint) {
--=20
2.35.3


