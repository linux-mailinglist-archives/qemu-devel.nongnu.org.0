Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E91C1501B4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 07:24:52 +0100 (CET)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyVAB-0002Mu-8s
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 01:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxo-0003ZF-3o
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:12:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxn-0003Qn-3A
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:12:04 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:57141 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iyUxm-0002go-OJ; Mon, 03 Feb 2020 01:12:03 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 489yBr3B2Qz9sT0; Mon,  3 Feb 2020 17:11:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580710292;
 bh=3GGHmTqGUj7+eFhoY9ratQw9EQ42IJhrwzVbsH3efOM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g6Pb6f49JYd64GRsKyz6m+88Xtzpd2TJm4Ya421El0OtgW9XLNIoXkFpWkiWBVS6I
 UvyzxuW23K0NP02XqRJE1MP1Yttihte+iMiILnduZk9NgpgwkaT6mEpNEOdpNfCOP8
 G3GWbLUQPiGlbHS/f9/rixzalVQ0yhCCVsndn+eQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 23/35] target/ppc/cpu.h: Put macro parameter in parentheses
Date: Mon,  3 Feb 2020 17:11:11 +1100
Message-Id: <20200203061123.59150-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203061123.59150-1-david@gibson.dropbear.id.au>
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Fix PPC_INPUT macro to work with more complex expressions by
protecting its argument with parentheses.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20200130021619.65FAB747871@zero.eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 96aeea1934..3a1eb76004 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -180,7 +180,7 @@ enum {
     POWERPC_EXCP_TRAP          =3D 0x40,
 };
=20
-#define PPC_INPUT(env) (env->bus_model)
+#define PPC_INPUT(env) ((env)->bus_model)
=20
 /***********************************************************************=
******/
 typedef struct opc_handler_t opc_handler_t;
--=20
2.24.1


