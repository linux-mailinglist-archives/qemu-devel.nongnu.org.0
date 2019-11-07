Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96FF34C9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 17:42:15 +0100 (CET)
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSkrO-0008Kz-9j
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 11:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iSkmm-0002rK-Q5
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iSkml-0005b2-R2
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24267
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iSkml-0005aY-My
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573144647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zXgxqGLvdsxG4kqkxGAYIUlz7jkC3cwLiKb8JUAVdH4=;
 b=PFtaStvo7awuvT1FB+Us1FM8sKotNrcGELzqWEg1NhIyPCqgETaEkJ7nlQEn0xIWILhon5
 ER/k+oOdKI5RLnms7rScazPNzoUkh7aHu/x25NWCrnqjrbyvPnzyaSA+oXOFlwyoC2QlWw
 CZ0/5eqcBlJzUTfLWfZckbb2sJvy/IY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-dbOIeBQbPlSNZwSTvWiQEA-1; Thu, 07 Nov 2019 11:37:25 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 150E28017E0;
 Thu,  7 Nov 2019 16:37:25 +0000 (UTC)
Received: from localhost (ovpn-117-149.ams2.redhat.com [10.36.117.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC6CC600D1;
 Thu,  7 Nov 2019 16:37:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 07/22] iotests: Drop compat=1.1 in 050
Date: Thu,  7 Nov 2019 17:36:53 +0100
Message-Id: <20191107163708.833192-8-mreitz@redhat.com>
In-Reply-To: <20191107163708.833192-1-mreitz@redhat.com>
References: <20191107163708.833192-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: dbOIeBQbPlSNZwSTvWiQEA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IMGOPTS can never be empty for qcow2, because the check scripts adds
compat=3D1.1 unless the user specified any compat option themselves.
Thus, this block does not do anything and can be dropped.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 tests/qemu-iotests/050 | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/qemu-iotests/050 b/tests/qemu-iotests/050
index 211fc00797..272ecab195 100755
--- a/tests/qemu-iotests/050
+++ b/tests/qemu-iotests/050
@@ -41,10 +41,6 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2 qed
 _supported_proto file
=20
-if test "$IMGFMT" =3D qcow2 && test $IMGOPTS =3D ""; then
-  IMGOPTS=3Dcompat=3D1.1
-fi
-
 echo
 echo "=3D=3D Creating images =3D=3D"
=20
--=20
2.23.0


