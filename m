Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078EDA0ECA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 03:07:14 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i38u8-0004Iz-UN
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 21:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1i38rb-0002nQ-AL
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 21:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1i38rZ-0004s9-BA
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 21:04:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40488)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1i38rV-0004oM-G3
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 21:04:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 34CF2106E288;
 Thu, 29 Aug 2019 01:04:26 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-242.rdu2.redhat.com
 [10.10.123.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EE7D60BF7;
 Thu, 29 Aug 2019 01:04:24 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Date: Wed, 28 Aug 2019 21:03:38 -0400
Message-Id: <20190829010340.28873-4-crosa@redhat.com>
In-Reply-To: <20190829010340.28873-1-crosa@redhat.com>
References: <20190829010340.28873-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 29 Aug 2019 01:04:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/5] Acceptance tests: drop left over usage of
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9531d26c10 removed all of ":avocado: enable" tags, but then
a new entry was added with the introduction of migration.py.

Let's remove it for consistency.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190607152223.9467-4-crosa@redhat.com>
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


