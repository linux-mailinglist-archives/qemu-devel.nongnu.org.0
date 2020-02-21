Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F18166DF1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 04:42:59 +0100 (CET)
Received: from localhost ([::1]:51768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4zDO-0002Ym-4s
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 22:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7t-00028X-OV
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z7s-0008FE-Kc
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:17 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59091 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4z7s-0007yo-8W; Thu, 20 Feb 2020 22:37:16 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NxwF49NWz9sSQ; Fri, 21 Feb 2020 14:37:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582256221;
 bh=VHIoi9FLGrk+PIzLBolIqntm255sHndLBN6fVSUxh1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IKM18RfgB4ZdUZKje1D1QGAq/qzvhCWbZUcPi+yoLvkOs/oMh5w1g4N+fBK1/vQqR
 SJWXiVXEg5ryL/hucHc1+Q+3nRI2rUr5I5G4baBaW+PtkWtXE2YCBfvpkdXrUT97AK
 XdImbZXSl+QecnDrdSKjzlpQfQJQl5MUuOeB4nuw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 09/20] target/ppc/cpu.h: Remove duplicate includes
Date: Fri, 21 Feb 2020 14:36:39 +1100
Message-Id: <20200221033650.444386-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221033650.444386-1-david@gibson.dropbear.id.au>
References: <20200221033650.444386-1-david@gibson.dropbear.id.au>
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Commit 74433bf083b added some includes but added them twice. Since
these are guarded against multiple inclusion including them once is
enough.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20200212223207.5A37574637F@zero.eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3a1eb76004..07dd2b4da7 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -23,8 +23,6 @@
 #include "qemu/int128.h"
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
-#include "exec/cpu-defs.h"
-#include "cpu-qom.h"
=20
 /* #define PPC_EMULATE_32BITS_HYPV */
=20
--=20
2.24.1


