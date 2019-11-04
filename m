Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A71EE387
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 16:20:18 +0100 (CET)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRe9P-0000mJ-Ol
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 10:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iRe3B-0002Zw-UY
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:13:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iRe3A-0002e1-Ph
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:13:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41235
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iRe3A-0002dV-ME
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572880427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UW+Kyz+S6mkxjDRzeRSye6W+beJmVisKQT4ldis/Gso=;
 b=edFrVwloSF1GgYzudtdGdz3AVq/8xYqShdKD4F9gHacW5lGe/XlSviAuJqUgcmOk079CF8
 pbZ7e8qa2UCPV15IiieLp6/mdGp1ayC3pDdM+bWbr9Jd4GX/uW9Oy32chIQ4U5hTX6VueM
 phzklA708CaG/xypZ8uh94iZZozXFrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-jrda1f0dOQm11SGtHtUfKQ-1; Mon, 04 Nov 2019 10:13:45 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C8011800D53;
 Mon,  4 Nov 2019 15:13:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D18A35D6C5;
 Mon,  4 Nov 2019 15:13:42 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 4/8] Acceptance tests: use relative location for tests
Date: Mon,  4 Nov 2019 10:13:19 -0500
Message-Id: <20191104151323.9883-5-crosa@redhat.com>
In-Reply-To: <20191104151323.9883-1-crosa@redhat.com>
References: <20191104151323.9883-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: jrda1f0dOQm11SGtHtUfKQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Beraldo Leal <bleal@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An Avocado Test ID[1] is composed by a number of components, but it
starts with the Test Name, usually a file system location that was
given to the loader.

Because the source directory is being given as a prefix to the
"tests/acceptance" directory containing the acceptance tests, the test
names will needlessly include the directory the user is using to host
the QEMU sources (and/or build tree).

Let's remove the source dir (or a build dir) from the path given to
the test loader.  This should give more constant names, and when using
result servers and databases, it should give the same test names
across executions from different people or from different directories.

[1] - https://avocado-framework.readthedocs.io/en/69.0/ReferenceGuide.html#=
test-id

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 56f73b46e2..65e85f5275 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -1180,7 +1180,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR)
             --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RESUL=
TS_DIR) \
             --filter-by-tags-include-empty --filter-by-tags-include-empty-=
key \
             $(AVOCADO_TAGS) \
-            --failfast=3Don $(SRC_PATH)/tests/acceptance, \
+            --failfast=3Don tests/acceptance, \
             "AVOCADO", "tests/acceptance")
=20
 # Consolidated targets
--=20
2.21.0


