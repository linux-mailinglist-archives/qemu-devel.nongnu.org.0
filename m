Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F913C901
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:17:29 +0100 (CET)
Received: from localhost ([::1]:56582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlMF-0001r7-Op
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkL5-00012L-JW
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkL4-0000WF-74
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:11 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54775
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkL4-0000Ve-1z
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yLT6Wb4rfEEOHhPyEl/fD8uDbM2zvqC6BV9fjjMQ8OY=;
 b=ib5H7RD9t1KKQBOS3E5Kot8yi1zPrMA2wA1dxG3dWn8iYMgTrXSzmqq4R8DSYDdGL4u8Ie
 E60lQOFvY/Iyo5vIpUUAOz5dKgeiMAbbg4/s0HoY4F9uCLi9dnZOTeUagMyQE911NAmH0h
 XWfQvcT/h4i2P4+/srLPr3OJZ7q2yO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-K4cgrd8BMtq5phu-Eec66A-1; Wed, 15 Jan 2020 10:12:06 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39F901147EFA;
 Wed, 15 Jan 2020 15:12:05 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F20D196AE;
 Wed, 15 Jan 2020 15:12:04 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 70/86] ppc:virtex_ml507: remove unused arguments
Date: Wed, 15 Jan 2020 16:07:25 +0100
Message-Id: <1579100861-73692-71-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: K4cgrd8BMtq5phu-Eec66A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: edgar.iglesias@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: david@gibson.dropbear.id.au
CC: qemu-ppc@nongnu.org
CC: edgar.iglesias@gmail.com
---
 hw/ppc/virtex_ml507.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 6862552..651d8db 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -89,10 +89,7 @@ static void mmubooke_create_initial_mapping(CPUPPCState =
*env,
     tlb->PID =3D 0;
 }
=20
-static PowerPCCPU *ppc440_init_xilinx(ram_addr_t *ram_size,
-                                      int do_init,
-                                      const char *cpu_type,
-                                      uint32_t sysclk)
+static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t syscl=
k)
 {
     PowerPCCPU *cpu;
     CPUPPCState *env;
@@ -213,7 +210,7 @@ static void virtex_init(MachineState *machine)
     int i;
=20
     /* init CPUs */
-    cpu =3D ppc440_init_xilinx(&ram_size, 1, machine->cpu_type, 400000000)=
;
+    cpu =3D ppc440_init_xilinx(machine->cpu_type, 400000000);
     env =3D &cpu->env;
=20
     if (env->mmu_model !=3D POWERPC_MMU_BOOKE) {
--=20
2.7.4


