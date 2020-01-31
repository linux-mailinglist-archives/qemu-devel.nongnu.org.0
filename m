Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E214E8C0
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 07:23:36 +0100 (CET)
Received: from localhost ([::1]:48928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixPiJ-0005L3-9E
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 01:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVE-0007at-Jh
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ixPVD-0000wD-MX
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 01:10:04 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35627 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ixPVD-0000RJ-Br; Fri, 31 Jan 2020 01:10:03 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4886Ht1tR9z9sSZ; Fri, 31 Jan 2020 17:09:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580450970;
 bh=WU9R3afOTjODR8g0y3hMFx5ppOhc40ClXkWEmYxVJ98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DGKr9Uo8zkUBK5zUDPm71R0Rm45V3ZvmI1Hnuw84Q5hbowJ9vIRj6ye/oVblatkin
 H1ZTKdnLbb9e/AujGrOtcAd0Yc9cqF5lktfYncd0kIzNhkbMjS7Qvn6d7VbOy7NhXF
 +d3nq8iFYOCV/KLCvvgqviA9r+YceBwz6mDkGaSg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 17/34] hw/ppc/Kconfig: Enable TPM_SPAPR as part of PSERIES
 config
Date: Fri, 31 Jan 2020 17:09:07 +1100
Message-Id: <20200131060924.147449-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131060924.147449-1-david@gibson.dropbear.id.au>
References: <20200131060924.147449-1-david@gibson.dropbear.id.au>
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


