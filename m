Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA96AA41
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 16:06:35 +0200 (CEST)
Received: from localhost ([::1]:49400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnO6E-0003H9-AC
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 10:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35027)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hnO5e-0001ZQ-1p
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hnO5d-0000Fe-54
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:05:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49337)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hnO5c-0000ES-Vo; Tue, 16 Jul 2019 10:05:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F237308338E;
 Tue, 16 Jul 2019 14:05:56 +0000 (UTC)
Received: from localhost (ovpn-117-180.ams2.redhat.com [10.36.117.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86BD75DAAC;
 Tue, 16 Jul 2019 14:05:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2019 16:05:44 +0200
Message-Id: <20190716140546.6661-2-cohuck@redhat.com>
In-Reply-To: <20190716140546.6661-1-cohuck@redhat.com>
References: <20190716140546.6661-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 16 Jul 2019 14:05:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL for-4.1 1/3] s390x/cpumodel: remove esort from
 the default model
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Borntraeger <borntraeger@de.ibm.com>

esort might not be available on all models.

Fixes: caef62430fed6e73 ("s390x/cpumodel: add gen15 defintions")
Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
Message-Id: <20190715142304.215018-2-borntraeger@de.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/gen-features.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 9f216219ff53..6debfc1d217e 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -642,7 +642,6 @@ static uint16_t default_GEN14_GA1[] =3D {
=20
 static uint16_t default_GEN15_GA1[] =3D {
     S390_FEAT_VECTOR_ENH2,
-    S390_FEAT_GROUP_ENH_SORT,
     S390_FEAT_GROUP_DEFLATE_CONVERSION,
     S390_FEAT_VECTOR_BCD_ENH,
     S390_FEAT_GROUP_MSA_EXT_9,
--=20
2.20.1


