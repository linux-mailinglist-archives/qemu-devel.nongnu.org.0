Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A753B187E16
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 11:20:17 +0100 (CET)
Received: from localhost ([::1]:55778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE9Ka-0003Tw-KQ
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 06:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jE966-0001hX-Rc
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:05:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jE965-0005XC-Lk
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:05:18 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36045 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jE965-0002ok-6a; Tue, 17 Mar 2020 06:05:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48hTKx5Wz3z9sSq; Tue, 17 Mar 2020 21:04:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584439477;
 bh=fAXtD2ODA0a0KuawsYUHly3XdUAn7S9stTBG9ajl/f0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YOvlYcBR80ry/r+wVskSQNXw2csxa7hC40Nu6Jf4IOipJgsSxO3d2DnZ4EJwf1wvb
 Of8zKiI+fPz+XwgOKetCmATs1FcBrPaEhf9TL6qU7NKSBVBPJw4yIa7iT9B7y8ltvs
 Nu7jVdIQKINdx0wKmSpvEleYimvoAJp99cvk6mvA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 22/45] hw/scsi/viosrp: Add missing 'hw/scsi/srp.h' include
Date: Tue, 17 Mar 2020 21:04:00 +1100
Message-Id: <20200317100423.622643-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317100423.622643-1-david@gibson.dropbear.id.au>
References: <20200317100423.622643-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

This header use the srp_* structures declared in "hw/scsi/srp.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20200305121253.19078-2-philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/scsi/viosrp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/scsi/viosrp.h b/hw/scsi/viosrp.h
index d8e365db1e..25676c2383 100644
--- a/hw/scsi/viosrp.h
+++ b/hw/scsi/viosrp.h
@@ -34,6 +34,8 @@
 #ifndef PPC_VIOSRP_H
 #define PPC_VIOSRP_H
=20
+#include "hw/scsi/srp.h"
+
 #define SRP_VERSION "16.a"
 #define SRP_MAX_IU_LEN    256
 #define SRP_MAX_LOC_LEN 32
--=20
2.24.1


