Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D3325D75
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:16:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJbg-0003Zp-TU
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:16:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9L-0003kR-Do
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9K-0006y5-BW
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:47 -0400
Received: from ozlabs.org ([203.11.71.1]:38881)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ9K-0006wU-0i; Wed, 22 May 2019 00:46:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580T113LGz9sPY; Wed, 22 May 2019 14:46:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500373;
	bh=Vfl8iaj2UXBKYIR6axFGslC1xVyEFFzzrybLIkgJ0p4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RmbUysy/faLFvATihfmICLFG4/ur5A9IQhSgCCfxtUOpxzBT3kG16BqapG2ddguxZ
	VwLoxYQIf74Cyuao1klD4vQ1uGfVDVsbMDoqF/jPUWXBk3hoAemGvznfuUpQYN2DYQ
	2gU59/mf0B5ayEb4AY0zbmf60t3pyRVfL2mo5J3o=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:23 +1000
Message-Id: <20190522044600.16534-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 01/38] target/ppc/kvm: Fix trace typo
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	Boxuan Li <liboxuan@connect.hku.hk>, qemu-ppc@nongnu.org,
	clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Boxuan Li <liboxuan@connect.hku.hk>

Signed-off-by: Boxuan Li <liboxuan@connect.hku.hk>
Message-Id: <20190430172842.27369-1-liboxuan@connect.hku.hk>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/kvm.c        | 2 +-
 target/ppc/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 02e22e2017..1a9caf8f40 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1721,7 +1721,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_r=
un *run)
             trace_kvm_handle_dcr_write();
             ret =3D kvmppc_handle_dcr_write(env, run->dcr.dcrn, run->dcr=
.data);
         } else {
-            trace_kvm_handle_drc_read();
+            trace_kvm_handle_dcr_read();
             ret =3D kvmppc_handle_dcr_read(env, run->dcr.dcrn, &run->dcr=
.data);
         }
         break;
diff --git a/target/ppc/trace-events b/target/ppc/trace-events
index 7b3cfe11fd..3dc6740706 100644
--- a/target/ppc/trace-events
+++ b/target/ppc/trace-events
@@ -22,7 +22,7 @@ kvm_failed_put_vpa(void) "Warning: Unable to set VPA in=
formation to KVM"
 kvm_failed_get_vpa(void) "Warning: Unable to get VPA information from KV=
M"
 kvm_injected_interrupt(int irq) "injected interrupt %d"
 kvm_handle_dcr_write(void) "handle dcr write"
-kvm_handle_drc_read(void) "handle dcr read"
+kvm_handle_dcr_read(void) "handle dcr read"
 kvm_handle_halt(void) "handle halt"
 kvm_handle_papr_hcall(void) "handle PAPR hypercall"
 kvm_handle_epr(void) "handle epr"
--=20
2.21.0


