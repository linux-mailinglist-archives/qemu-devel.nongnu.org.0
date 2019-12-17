Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6BE122337
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 05:46:35 +0100 (CET)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih4kk-0001Wp-30
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 23:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4hq-0007ue-Oh
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:43:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4hp-0005CI-S9
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:43:34 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36051 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4hp-00059E-IJ; Mon, 16 Dec 2019 23:43:33 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWN2rnTz9sRm; Tue, 17 Dec 2019 15:43:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557808;
 bh=7WtGCoSP4LSJ5xm86Y5S5hA1ZYwNk3CokkO9wz5Tx4w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cg6ETgnhI5UCaIXjNxWuuJXXX+oBvZ6WxTm3a6AeceP5TdoUcRozAywauDBJSMFxf
 +iHG1gXJfm1cFH8OGyxvP61Fx7+rJO9+AkQvjZ936EByh40eyO+YK30nh/YJhJHXc9
 lziEipqhe6R0NPWatfEDr4A1dEUiNLWxgWTHqC24=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/88] ppc/pnv: Drop "chip" link from POWER9 PSI object
Date: Tue, 17 Dec 2019 15:41:57 +1100
Message-Id: <20191217044322.351838-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

It has no apparent user.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157383383118.166856.2588933416368211047.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 416caab6f6..4e9ddc05ad 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1096,8 +1096,6 @@ static void pnv_chip_power9_instance_init(Object *o=
bj)
=20
     object_initialize_child(obj, "psi",  &chip9->psi, sizeof(chip9->psi)=
,
                             TYPE_PNV9_PSI, &error_abort, NULL);
-    object_property_add_const_link(OBJECT(&chip9->psi), "chip", obj,
-                                   &error_abort);
=20
     object_initialize_child(obj, "lpc",  &chip9->lpc, sizeof(chip9->lpc)=
,
                             TYPE_PNV9_LPC, &error_abort, NULL);
--=20
2.23.0


