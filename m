Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C0963613
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 14:41:43 +0200 (CEST)
Received: from localhost ([::1]:49656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkpRG-0008V4-Ai
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 08:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60591)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hkpMP-0004TL-AA
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 08:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hkpMN-0007EZ-74
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 08:36:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38770)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hkpML-00076D-MQ; Tue, 09 Jul 2019 08:36:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 407EA308C389;
 Tue,  9 Jul 2019 12:26:10 +0000 (UTC)
Received: from localhost (unknown [10.40.205.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56512848DD;
 Tue,  9 Jul 2019 12:26:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  9 Jul 2019 14:25:46 +0200
Message-Id: <20190709122546.12373-5-cohuck@redhat.com>
In-Reply-To: <20190709122546.12373-1-cohuck@redhat.com>
References: <20190709122546.12373-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 09 Jul 2019 12:26:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL for-4.1 4/4] s390x/tcg: move fallthrough
 annotation
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

...so that the compiler properly recognizes it.

Reported-by: Stefan Weil <sw@weilnetz.de>
Fixes: f180da83c039 ("s390x/tcg: Implement VECTOR LOAD LOGICAL ELEMENT AN=
D ZERO")
Message-Id: <20190708125433.16927-3-cohuck@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/translate_vx.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 7b1d31cba5cf..41d5cf869f94 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -577,8 +577,8 @@ static DisasJumpType op_vllez(DisasContext *s, DisasO=
ps *o)
             enr =3D 0;
             break;
         }
-    default:
         /* fallthrough */
+    default:
         gen_program_exception(s, PGM_SPECIFICATION);
         return DISAS_NORETURN;
     }
--=20
2.20.1


