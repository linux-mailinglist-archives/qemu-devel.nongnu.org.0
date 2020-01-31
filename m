Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0214E8C9
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 07:27:19 +0100 (CET)
Received: from localhost ([::1]:49002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixPlu-0003pE-5u
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 01:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVI-0007jF-2M
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVH-00012K-0b
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:08 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52313 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ixPVG-0000WW-Lj; Fri, 31 Jan 2020 01:10:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4886Hv4zGPz9sSm; Fri, 31 Jan 2020 17:09:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580450971;
 bh=3GGHmTqGUj7+eFhoY9ratQw9EQ42IJhrwzVbsH3efOM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QtpeHT1C+tqWjIDSmibXFk3B2ebwLZehwa/5Khp8Ro+X3TYGVVzD9vNvmNogZM1LS
 yhaXUHh1cbrrK5R2g6g7P1COFnt0yn5GSyPwWXvRluKFsV8wYbNuCXsiujw7IzTTqr
 mgZxEzk6jNAOwwUbCin2jw0xPsy0vQDgBtJwIjIQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 23/34] target/ppc/cpu.h: Put macro parameter in parentheses
Date: Fri, 31 Jan 2020 17:09:13 +1100
Message-Id: <20200131060924.147449-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131060924.147449-1-david@gibson.dropbear.id.au>
References: <20200131060924.147449-1-david@gibson.dropbear.id.au>
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


