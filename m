Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3EF122404
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:46:57 +0100 (CET)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih5hA-0003zF-8L
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35833)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4kW-0002sw-Ea
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:46:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4kV-0000DU-Dz
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:46:20 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40095 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4kV-00083m-3f; Mon, 16 Dec 2019 23:46:19 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWk26l8z9sTk; Tue, 17 Dec 2019 15:43:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557826;
 bh=T4BYW9/N11n3L6izTyClhxscVQnqQ73DyXta2qSf7iY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SRX/8pUO8dhc96mjTvJRbSOEfbotiskh/4+uFbXm8FllXwaPvEGCduRyECibNB4Cb
 9blp7ibJ1uOe1r1jf342Fn5o8sJiwzqm5nZAKxx4UlNjx4pF4c/0V3Mq5sdJYzFfcE
 HG1bawy967gkBL8+QQoHzwEfg/jz0UN0vySF6X+Y=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 72/88] ppc/pnv: Make PnvXScomInterface an incomplete type
Date: Tue, 17 Dec 2019 15:43:06 +1100
Message-Id: <20191217044322.351838-73-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191217044322.351838-1-david@gibson.dropbear.id.au>
References: <20191217044322.351838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

PnvXScomInterface is an interface instance. It should never be
dereferenced. Drop the dummy type definition for extra safety,
which is the common practice with QOM interfaces.

While here also convert the bogus OBJECT_CHECK() to INTERFACE_CHECK().

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157608025541.186670.1577861507610404326.stgit@bahia.lan>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/ppc/pnv_xscom.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index a40d2a2a2a..5ad2735d1a 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -22,13 +22,11 @@
=20
 #include "qom/object.h"
=20
-typedef struct PnvXScomInterface {
-    Object parent;
-} PnvXScomInterface;
+typedef struct PnvXScomInterface PnvXScomInterface;
=20
 #define TYPE_PNV_XSCOM_INTERFACE "pnv-xscom-interface"
 #define PNV_XSCOM_INTERFACE(obj) \
-     OBJECT_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE)
+    INTERFACE_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE)
 #define PNV_XSCOM_INTERFACE_CLASS(klass)                \
     OBJECT_CLASS_CHECK(PnvXScomInterfaceClass, (klass), \
                        TYPE_PNV_XSCOM_INTERFACE)
--=20
2.23.0


