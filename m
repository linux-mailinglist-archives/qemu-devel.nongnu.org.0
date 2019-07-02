Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081EC5C993
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:52:47 +0200 (CEST)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiCek-0004Yl-7g
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58815)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiBzK-0005Nb-EL
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:10:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiBzI-0003GI-KU
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43821 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiBzH-0002wU-Cu; Tue, 02 Jul 2019 02:09:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMk7296z9sPl; Tue,  2 Jul 2019 16:09:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047746;
 bh=2eYaeiU17YguOqoaVrcEi5nyyJwpXaox9TnRyZ/YpBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MkxvYtQR8iMNqtO+e0bgXDI2FvqQ/J/Ceb1vOpOvaVcniHr+6YTRePXFYZCriioio
 V1rLZrFUpCZcRtqlw1hXA250fig7Xhw41BFuL/xyufYJi3p+ve0qaQ5SZqJ4f2/BjD
 UpcetP/2Kb3GbjyuQ/Md+GGJfRQmX0zGS9lycUd0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:29 +1000
Message-Id: <20190702060857.3926-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 21/49] xics/spapr: Drop unused function
 declaration
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Commit 9fb6eb7ca50c added the declaration of xics_spapr_connect(), which
has no implementation and no users.

This is a leftover from a previous iteration of this patch. Drop it.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156077919546.433243.8748677531446035746.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/ppc/xics_spapr.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
index d968f2499c..3304481262 100644
--- a/include/hw/ppc/xics_spapr.h
+++ b/include/hw/ppc/xics_spapr.h
@@ -37,6 +37,5 @@ int xics_kvm_init(SpaprMachineState *spapr, Error **err=
p);
 void xics_kvm_disconnect(SpaprMachineState *spapr, Error **errp);
 bool xics_kvm_has_broken_disconnect(SpaprMachineState *spapr);
 void xics_spapr_init(SpaprMachineState *spapr);
-void xics_spapr_connect(SpaprMachineState *spapr);
=20
 #endif /* XICS_SPAPR_H */
--=20
2.21.0


