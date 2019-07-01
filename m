Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE11B1DA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 10:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ6Ht-00029f-JS
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 04:26:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQ6Ab-0004e5-FW
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQ6Aa-0007cs-Dm
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32968)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQ6Aa-0007c9-6a
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:48 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 950DC81DF5
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 08:18:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 606236929B
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 08:18:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D36A511385D0; Mon, 13 May 2019 10:18:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 10:18:38 +0200
Message-Id: <20190513081844.26699-4-armbru@redhat.com>
In-Reply-To: <20190513081844.26699-1-armbru@redhat.com>
References: <20190513081844.26699-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 13 May 2019 08:18:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/9] authz: Normalize #include "authz/trace.h"
 to "trace.h"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include the generated trace.h the same way as we do everywhere else.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190315145123.28030-3-armbru@redhat.com>
Acked-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 authz/base.c     | 2 +-
 authz/list.c     | 2 +-
 authz/listfile.c | 2 +-
 authz/pamacct.c  | 2 +-
 authz/simple.c   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/authz/base.c b/authz/base.c
index 110dfa4195..baf39fff25 100644
--- a/authz/base.c
+++ b/authz/base.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "authz/base.h"
-#include "authz/trace.h"
+#include "trace.h"
=20
 bool qauthz_is_allowed(QAuthZ *authz,
                        const char *identity,
diff --git a/authz/list.c b/authz/list.c
index dc6b0fec13..831da936fe 100644
--- a/authz/list.c
+++ b/authz/list.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "authz/list.h"
-#include "authz/trace.h"
+#include "trace.h"
 #include "qom/object_interfaces.h"
 #include "qapi/qapi-visit-authz.h"
=20
diff --git a/authz/listfile.c b/authz/listfile.c
index bc2b58ef6d..d74bbd1048 100644
--- a/authz/listfile.c
+++ b/authz/listfile.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "authz/listfile.h"
-#include "authz/trace.h"
+#include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/sockets.h"
diff --git a/authz/pamacct.c b/authz/pamacct.c
index 5038358cdc..7539867923 100644
--- a/authz/pamacct.c
+++ b/authz/pamacct.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "authz/pamacct.h"
-#include "authz/trace.h"
+#include "trace.h"
 #include "qom/object_interfaces.h"
=20
 #include <security/pam_appl.h>
diff --git a/authz/simple.c b/authz/simple.c
index 8ab718803e..c409ce7efc 100644
--- a/authz/simple.c
+++ b/authz/simple.c
@@ -20,7 +20,7 @@
=20
 #include "qemu/osdep.h"
 #include "authz/simple.h"
-#include "authz/trace.h"
+#include "trace.h"
 #include "qom/object_interfaces.h"
=20
 static bool qauthz_simple_is_allowed(QAuthZ *authz,
--=20
2.17.2


