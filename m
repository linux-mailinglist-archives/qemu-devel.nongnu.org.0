Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C8C63617
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 14:42:08 +0200 (CEST)
Received: from localhost ([::1]:49662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkpRf-0001Ep-7R
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 08:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60398)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hkpLg-0004EO-O4
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 08:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hkpLe-0006nu-Er
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 08:35:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40152)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hkpLd-0006ak-RP; Tue, 09 Jul 2019 08:35:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 40AE83002738;
 Tue,  9 Jul 2019 12:26:03 +0000 (UTC)
Received: from localhost (unknown [10.40.205.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3D4B84904;
 Tue,  9 Jul 2019 12:26:02 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  9 Jul 2019 14:25:45 +0200
Message-Id: <20190709122546.12373-4-cohuck@redhat.com>
In-Reply-To: <20190709122546.12373-1-cohuck@redhat.com>
References: <20190709122546.12373-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 09 Jul 2019 12:26:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL for-4.1 3/4] s390: cpumodel: fix description for
 the new vector facility
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Borntraeger <borntraeger@de.ibm.com>

The new facility is called "Vector-Packed-Decimal-Enhancement Facility"
and not "Vector BCD enhancements facility 1". As the shortname might
have already found its way into some backports, let's keep vxbeh.

Fixes: 54d65de0b525 ("s390x/cpumodel: vector enhancements")
Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
Message-Id: <20190708150931.93448-1-borntraeger@de.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu_features_def.inc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/cpu_features_def.inc.h b/target/s390x/cpu_featu=
res_def.inc.h
index ef190e2fc783..3118a9f89228 100644
--- a/target/s390x/cpu_features_def.inc.h
+++ b/target/s390x/cpu_features_def.inc.h
@@ -104,7 +104,7 @@ DEF_FEAT(CMM_NT, "cmmnt", STFL, 147, "CMM: ESSA-enhan=
cement (no translate) facil
 DEF_FEAT(VECTOR_ENH2, "vxeh2", STFL, 148, "Vector Enhancements facility =
2")
 DEF_FEAT(ESORT_BASE, "esort-base", STFL, 150, "Enhanced-sort facility (e=
xcluding subfunctions)")
 DEF_FEAT(DEFLATE_BASE, "deflate-base", STFL, 151, "Deflate-conversion fa=
cility (excluding subfunctions)")
-DEF_FEAT(VECTOR_BCD_ENH, "vxbeh", STFL, 152, "Vector BCD enhancements fa=
cility 1")
+DEF_FEAT(VECTOR_BCD_ENH, "vxbeh", STFL, 152, "Vector-Packed-Decimal-Enha=
ncement Facility")
 DEF_FEAT(MSA_EXT_9, "msa9-base", STFL, 155, "Message-security-assist-ext=
ension-9 facility (excluding subfunctions)")
 DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
=20
--=20
2.20.1


