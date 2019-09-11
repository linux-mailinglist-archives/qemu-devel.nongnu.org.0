Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A008AF3C4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 02:46:24 +0200 (CEST)
Received: from localhost ([::1]:45690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7qm7-0002ct-EW
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 20:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1i7qi9-0007XZ-Lp
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 20:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1i7qi8-00080u-SJ
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 20:42:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1i7qi8-00080l-Mz
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 20:42:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1939B197BCEF
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 00:42:16 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-121-171.rdu2.redhat.com
 [10.10.121.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54653601A5;
 Wed, 11 Sep 2019 00:42:15 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 20:42:03 -0400
Message-Id: <20190911004204.29286-4-crosa@redhat.com>
In-Reply-To: <20190911004204.29286-1-crosa@redhat.com>
References: <20190911004204.29286-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 11 Sep 2019 00:42:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/4] tests/acceptance/cpu_queries.py: add
 machine tag
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is for informational / filtering purposes only, that is, allows
one to run all tests with machine model "none".

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/cpu_queries.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queri=
es.py
index 1028588920..9cd6f553ff 100644
--- a/tests/acceptance/cpu_queries.py
+++ b/tests/acceptance/cpu_queries.py
@@ -15,6 +15,7 @@ class QueryCPUModelExpansion(Test):
     Run query-cpu-model-expansion for each CPU model, and validate resul=
ts
=20
     :avocado: tags=3Darch:x86_64
+    :avocado: tags=3Dmachine:none
     """
=20
     def test(self):
--=20
2.21.0


