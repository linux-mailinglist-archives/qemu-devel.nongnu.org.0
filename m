Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3071211D0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 18:35:55 +0100 (CET)
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iguHh-0006Am-Kd
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 12:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1igtrq-00054v-OB
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 12:09:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1igtrp-0004QE-Nl
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 12:09:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22903
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1igtrp-0004Pe-Ko
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 12:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576516149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3YS1dY+lpd5KH2FgvI5OuVMODij5wmEAcrLZPNNxw8o=;
 b=DQfrnsECOYld6mtM0EeLQZMyVmIOtk/Th+kU2MxPghdjCSi7CdVrJLhk3kRkKutKSqsn9r
 Kaf0z+vZu3B/Tqb8keV0mfP9IneCOeAaO5w3VN8QFP5pcvYfAfOtsvUlnXq062UUohW19V
 krR5hncay67qMUiOKtzMtGeMvOaQC1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-lt6hyDsfPgm6tY2WQf24Bg-1; Mon, 16 Dec 2019 12:09:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F10C1005510;
 Mon, 16 Dec 2019 17:09:04 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-54.ams2.redhat.com [10.36.117.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AC5D7C835;
 Mon, 16 Dec 2019 17:09:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 02/10] iotests: 255: Drop blockdev_create()
Date: Mon, 16 Dec 2019 18:08:49 +0100
Message-Id: <20191216170857.11880-3-kwolf@redhat.com>
In-Reply-To: <20191216170857.11880-1-kwolf@redhat.com>
References: <20191216170857.11880-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: lt6hyDsfPgm6tY2WQf24Bg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

blockdev_create() is completely unused in this test case, so we can just
drop it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/255 | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tests/qemu-iotests/255 b/tests/qemu-iotests/255
index 3632d507d0..0ba03d9e61 100755
--- a/tests/qemu-iotests/255
+++ b/tests/qemu-iotests/255
@@ -25,16 +25,6 @@ from iotests import imgfmt
=20
 iotests.verify_image_format(supported_fmts=3D['qcow2'])
=20
-def blockdev_create(vm, options):
-    result =3D vm.qmp_log('blockdev-create',
-                        filters=3D[iotests.filter_qmp_testfiles],
-                        job_id=3D'job0', options=3Doptions)
-
-    if 'return' in result:
-        assert result['return'] =3D=3D {}
-        vm.run_job('job0')
-    iotests.log("")
-
 iotests.log('Finishing a commit job with background reads')
 iotests.log('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D')
 iotests.log('')
--=20
2.20.1


