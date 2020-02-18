Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0266B1624D4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:44:33 +0100 (CET)
Received: from localhost ([::1]:60728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j40Mi-0002Nf-1U
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j40EJ-0002Kv-6L
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j40EI-0007fS-1u
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54853
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j40EH-0007fH-Um
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582022149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVmhVcx1utaWa+od2sk93VEg73HvGcMJgHxX4QbcIqk=;
 b=GCRZ6skweXRATqruydg+KLZq2wiBC13bApE9sO2pqEK2m/OpQNw6B7F4iDR3DhzKncVv0D
 EF/EcpkqMABOiZOFOmELdjGvwHgatJDiO/P1qKfQbZYz7UH0eT9nCLxqc5U6IaXJ/sAWGZ
 vkEd3hJnX47KOdcRqlGkRDLl+o6EpV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-gwrvP7x5OuKJfCpFnLcPdw-1; Tue, 18 Feb 2020 05:35:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3918107ACC7;
 Tue, 18 Feb 2020 10:35:44 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA9119E9C;
 Tue, 18 Feb 2020 10:35:43 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 16/19] iotests: Resolve TODOs in 041
Date: Tue, 18 Feb 2020 11:34:51 +0100
Message-Id: <20200218103454.296704-17-mreitz@redhat.com>
In-Reply-To: <20200218103454.296704-1-mreitz@redhat.com>
References: <20200218103454.296704-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: gwrvP7x5OuKJfCpFnLcPdw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/041 | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 7b2cf5c2f8..084da6baf3 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -909,8 +909,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
=20
         self.complete_and_wait(drive=3D"job0")
         self.assert_has_block_node("repair0", quorum_repair_img)
-        # TODO: a better test requiring some QEMU infrastructure will be a=
dded
-        #       to check that this file is really driven by quorum
+        self.vm.assert_block_path('quorum0', '/children.1', 'repair0')
         self.vm.shutdown()
         self.assertTrue(iotests.compare_images(quorum_img2, quorum_repair_=
img),
                         'target image does not match source after mirrorin=
g')
@@ -1031,8 +1030,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
=20
         self.complete_and_wait('job0')
         self.assert_has_block_node("repair0", quorum_repair_img)
-        # TODO: a better test requiring some QEMU infrastructure will be a=
dded
-        #       to check that this file is really driven by quorum
+        self.vm.assert_block_path('quorum0', '/children.1', 'repair0')
=20
 # Test mirroring with a source that does not have any parents (not even a
 # BlockBackend)
--=20
2.24.1


