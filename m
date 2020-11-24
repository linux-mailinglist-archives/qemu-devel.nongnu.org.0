Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027762C2563
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:09:50 +0100 (CET)
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khX8n-0002hP-0I
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khX7R-0001l0-Pk
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:08:25 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:31874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khX7Q-00069y-A6
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:08:25 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-3JTApDPEPfmOnpNsr8_BsA-1; Tue, 24 Nov 2020 07:08:19 -0500
X-MC-Unique: 3JTApDPEPfmOnpNsr8_BsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BC941E640;
 Tue, 24 Nov 2020 12:08:18 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA9141057F59;
 Tue, 24 Nov 2020 12:08:15 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/1] tests/9pfs: Mark "local" tests as "slow"
Date: Tue, 24 Nov 2020 13:07:28 +0100
Message-Id: <20201124120728.1482792-2-groug@kaod.org>
In-Reply-To: <20201124120728.1482792-1-groug@kaod.org>
References: <20201124120728.1482792-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "local" tests can fail on some automated build systems as
reported here:

https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05510.html

This will need to be investigated and addressed later. Let's go for a
workaround in the meantime : mark the "local" tests as "slow" so that
they aren't executed with a simple "make check" like in the case above.

Reported-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <160620382310.1423262.7364287092069513483.stgit@bahia.lan>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tests/qtest/virtio-9p-test.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 21e340fa5f43..92a498f24925 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1456,6 +1456,15 @@ static void register_virtio_9p_test(void)
=20
=20
     /* 9pfs test cases using the 'local' filesystem driver */
+
+    /*
+     * XXX: Until we are sure that these tests can run everywhere,
+     * keep them as "slow" so that they aren't run with "make check".
+     */
+    if (!g_test_slow()) {
+        return;
+    }
+
     opts.before =3D assign_9p_local_driver;
     qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
     qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);
--=20
2.26.2


