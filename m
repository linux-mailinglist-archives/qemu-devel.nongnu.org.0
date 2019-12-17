Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD40122406
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:48:34 +0100 (CET)
Received: from localhost ([::1]:36158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih5ij-0006fE-DV
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4kX-0002u4-8A
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:46:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ih4kW-0000EJ-14
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 23:46:21 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38431 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ih4kV-00084z-NI; Mon, 16 Dec 2019 23:46:19 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47cQWk3ZZXz9sRm; Tue, 17 Dec 2019 15:43:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1576557826;
 bh=TnBNdG+3SdShSrmyjXjRpG/CG/lHE/VGGq3tKwTGdB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gBsv/bXivXwIWmCNu8NVW82d7l7Nqu3ees1WwMIGa6u3sEMEHzlBtyjstjXDWn+aD
 zKSeWt3GDLtwAnBIRyYfCBkrt8mfmJEnLm0r589Y/FEjOEfCEoMokHiqiVaBRK2bMn
 UrTc87sZrGnc3dU54HnItORHMnTRipb8Km9iVr00=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 80/88] ppc/pnv: Drop pnv_is_power9() and pnv_is_power10()
 helpers
Date: Tue, 17 Dec 2019 15:43:14 +1100
Message-Id: <20191217044322.351838-81-david@gibson.dropbear.id.au>
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
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

They aren't used anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157623840200.360005.1300941274565357363.stgit@bahia.lan>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/ppc/pnv.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 8a42c199b6..c213bdd5ec 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -227,11 +227,6 @@ static inline bool pnv_chip_is_power9(const PnvChip =
*chip)
     return PNV_CHIP_GET_CLASS(chip)->chip_type =3D=3D PNV_CHIP_POWER9;
 }
=20
-static inline bool pnv_is_power9(PnvMachineState *pnv)
-{
-    return pnv_chip_is_power9(pnv->chips[0]);
-}
-
 PnvChip *pnv_get_chip(uint32_t chip_id);
=20
 #define PNV_FDT_ADDR          0x01000000
@@ -242,11 +237,6 @@ static inline bool pnv_chip_is_power10(const PnvChip=
 *chip)
     return PNV_CHIP_GET_CLASS(chip)->chip_type =3D=3D PNV_CHIP_POWER10;
 }
=20
-static inline bool pnv_is_power10(PnvMachineState *pnv)
-{
-    return pnv_chip_is_power10(pnv->chips[0]);
-}
-
 /*
  * BMC helpers
  */
--=20
2.23.0


