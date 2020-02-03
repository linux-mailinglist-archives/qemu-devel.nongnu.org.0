Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96463150193
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 07:13:27 +0100 (CET)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyUz8-0004Ju-Is
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 01:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxJ-0002Jm-Kw
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxI-0002Sq-AM
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:33 -0500
Received: from ozlabs.org ([203.11.71.1]:56769)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iyUxH-0002Ot-IB; Mon, 03 Feb 2020 01:11:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 489yBm1rtpz9sSF; Mon,  3 Feb 2020 17:11:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580710288;
 bh=D2iE052k9EXhXkYXfeTQ/9LCOnws/v30qvtz2LFm1W8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xm7rl5kuu2w0HxK2HvNiehlIN+2nOcn0PSmjKLxAKaIBRNS4O9FUB2AJz7wuSSEMD
 Xr6bNcFdWakqgbhsktV8I9IkqZnF8sSYPNVF+Rw+ncmTj5OmQevp0ajDrf0aaxM/94
 +HIFewqGNcoEdQmauWhW03THd5xnSmIyCotVDxRY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/35] ppc:virtex_ml507: remove unused arguments
Date: Mon,  3 Feb 2020 17:10:51 +1100
Message-Id: <20200203061123.59150-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203061123.59150-1-david@gibson.dropbear.id.au>
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1579100861-73692-71-git-send-email-imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/virtex_ml507.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 7526947ea7..91dd00ee91 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -89,10 +89,7 @@ static void mmubooke_create_initial_mapping(CPUPPCStat=
e *env,
     tlb->PID =3D 0;
 }
=20
-static PowerPCCPU *ppc440_init_xilinx(ram_addr_t *ram_size,
-                                      int do_init,
-                                      const char *cpu_type,
-                                      uint32_t sysclk)
+static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sys=
clk)
 {
     PowerPCCPU *cpu;
     CPUPPCState *env;
@@ -213,7 +210,7 @@ static void virtex_init(MachineState *machine)
     int i;
=20
     /* init CPUs */
-    cpu =3D ppc440_init_xilinx(&ram_size, 1, machine->cpu_type, 40000000=
0);
+    cpu =3D ppc440_init_xilinx(machine->cpu_type, 400000000);
     env =3D &cpu->env;
=20
     if (env->mmu_model !=3D POWERPC_MMU_BOOKE) {
--=20
2.24.1


