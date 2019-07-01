Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A8630CF5
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 12:57:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWfDt-0007vv-Ep
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 06:57:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hWf2a-0007kq-QE
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:45:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hWf2Z-0002WL-W1
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:45:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>) id 1hWf2Y-00021w-1i
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:45:38 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFD81302451A;
	Fri, 31 May 2019 10:45:19 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-233.ams2.redhat.com [10.36.116.233])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE377271AE;
	Fri, 31 May 2019 10:45:18 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 12:44:31 +0200
Message-Id: <20190531104432.29379-23-david@redhat.com>
In-Reply-To: <20190531104432.29379-1-david@redhat.com>
References: <20190531104432.29379-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 31 May 2019 10:45:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 22/23] s390x/tcg: We support the Vector
 Facility
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
	Denys Vlasenko <dvlasenk@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's add it to the max model, so we can enable it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/gen-features.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index c346b76bdf..a818c80332 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -702,6 +702,7 @@ static uint16_t qemu_LATEST[] =3D {
 static uint16_t qemu_MAX[] =3D {
     /* z13+ features */
     S390_FEAT_STFLE_53,
+    S390_FEAT_VECTOR,
     /* generates a dependency warning, leave it out for now */
     S390_FEAT_MSA_EXT_5,
 };
--=20
2.20.1


