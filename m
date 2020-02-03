Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC031501AB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 07:22:42 +0100 (CET)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyV85-00066S-Iv
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 01:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxS-0002aj-1o
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxQ-0002gK-Lh
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:41 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:39167 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iyUxQ-0002ab-70; Mon, 03 Feb 2020 01:11:40 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 489yBp61Kkz9sSf; Mon,  3 Feb 2020 17:11:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580710290;
 bh=WU9R3afOTjODR8g0y3hMFx5ppOhc40ClXkWEmYxVJ98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a8dqiHdA5dLhQ6znqV5H3x9ZVH3GVWgGpg/Pxd3SKq3X0k829ZF8rHns0gd6OGDgy
 9no7p0btBsR0m0TqthTZYr/VNqRxTMq+l85qKZ/N8aiosjOwr9yqXtOgULi7FjtViW
 KXs1f6ezZnvEcz3n7878eW46bucx1ewT61KGWqNI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 17/35] hw/ppc/Kconfig: Enable TPM_SPAPR as part of PSERIES
 config
Date: Mon,  3 Feb 2020 17:11:05 +1100
Message-Id: <20200203061123.59150-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203061123.59150-1-david@gibson.dropbear.id.au>
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.vnet.ibm.com>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20200121152935.649898-6-stefanb@linux.ibm.com>
[dwg: Use default in Kconfig rather than select to avoid breaking
 Windows host build]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/tpm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
index 4d4ab0855c..9e67d990e8 100644
--- a/hw/tpm/Kconfig
+++ b/hw/tpm/Kconfig
@@ -25,6 +25,6 @@ config TPM_EMULATOR
=20
 config TPM_SPAPR
     bool
-    default n
+    default y
     depends on TPM && PSERIES
     select TPMDEV
--=20
2.24.1


