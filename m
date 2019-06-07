Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A590F391DE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 18:24:45 +0200 (CEST)
Received: from localhost ([::1]:49348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZHfX-0001gm-Ix
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 12:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48729)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <crosa@redhat.com>) id 1hZGhf-0004yZ-Ge
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:22:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1hZGhe-0005gy-JV
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:22:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60704)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hZGhe-0005f1-EJ
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:22:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 93B02306E5FA;
 Fri,  7 Jun 2019 15:22:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-62.rdu2.redhat.com
 [10.10.122.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 892A382708;
 Fri,  7 Jun 2019 15:22:42 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 11:22:18 -0400
Message-Id: <20190607152223.9467-4-crosa@redhat.com>
In-Reply-To: <20190607152223.9467-1-crosa@redhat.com>
References: <20190607152223.9467-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 07 Jun 2019 15:22:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/8] Acceptance tests: drop left over usage of
 ":avocado: enable"
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9531d26c10 removed all of ":avocado: enable" tags, but then
a new entry was added with the introduction of migration.py.

Let's remove it for consistency.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/migration.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.p=
y
index 6115cf6c24..a44c1ae58f 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -17,9 +17,6 @@ from avocado.utils import wait
=20
=20
 class Migration(Test):
-    """
-    :avocado: enable
-    """
=20
     timeout =3D 10
=20
--=20
2.21.0


