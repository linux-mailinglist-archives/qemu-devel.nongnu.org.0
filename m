Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D55143BAF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 12:09:35 +0100 (CET)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itrPa-0000PM-DD
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 06:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itrKt-00038c-0w
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:04:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itrKp-0002T4-6k
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:04:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38267
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itrKp-0002Sa-2s
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579604678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2FdyuOddDgduFYXe6Y137A4VQhs5udzN82HFgwEGmO0=;
 b=hDx8lR0tRpO94giY/ESCypACsFA2LQV3MT1p27Upk3eD5OToqrzihFNYAsAYiF0BAHVMCm
 uYuNnTT4DN3xt2nQcIxezYclTJwnxUaFIeiYDuZqdo9EhpE2rGzlWDOT8A/Mto2yOGYxKL
 WB9+DgIi/UQH+xYCOoTaXIdrHZYuEnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-uWSQThgZPmChLebSa4X5wg-1; Tue, 21 Jan 2020 06:04:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBD1B800D41;
 Tue, 21 Jan 2020 11:04:34 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92039811F8;
 Tue, 21 Jan 2020 11:04:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/10] hw/ppc/spapr_rtas: Remove local variable
Date: Tue, 21 Jan 2020 12:03:42 +0100
Message-Id: <20200121110349.25842-4-philmd@redhat.com>
In-Reply-To: <20200121110349.25842-1-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: uWSQThgZPmChLebSa4X5wg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We only access this variable in the RTAS_SYSPARM_SPLPAR_CHARACTERISTICS
case. Use it in place and remove the local declaration.

Suggested-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Do not reduce MachineState variable scope (David Gibson)
---
 hw/ppc/spapr_rtas.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 6f06e9d7fe..85135e0e1a 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -268,7 +268,6 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *c=
pu,
 {
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
     MachineState *ms =3D MACHINE(spapr);
-    unsigned int max_cpus =3D ms->smp.max_cpus;
     target_ulong parameter =3D rtas_ld(args, 0);
     target_ulong buffer =3D rtas_ld(args, 1);
     target_ulong length =3D rtas_ld(args, 2);
@@ -280,10 +279,10 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
                                           "DesMem=3D%" PRIu64 ","
                                           "DesProcs=3D%d,"
                                           "MaxPlatProcs=3D%d",
-                                          max_cpus,
+                                          ms->smp.max_cpus,
                                           ms->ram_size / MiB,
                                           ms->smp.cpus,
-                                          max_cpus);
+                                          ms->smp.max_cpus);
         if (pcc->n_host_threads > 0) {
             char *hostthr_val, *old =3D param_val;
=20
--=20
2.21.1


