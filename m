Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD6FEE3A4
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 16:23:01 +0100 (CET)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iReC4-0004tV-Dz
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 10:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iRe3O-0002tZ-4H
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:14:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iRe3M-0002kx-RM
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:14:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36440
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iRe3M-0002kY-NE
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572880440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INfjw1qCk+h2J7ucp9qgPVBHDffQeOkDjh6/dYBD0yo=;
 b=d8R6k3UYIMpGAlB62GYEc7DWDCtSU7ji2kElOEJ/v5eQNJhnxHEWWS8MqRSMAbskHUFZ4a
 KchyJ32FFmvKpqRpVZe3IofzVVvGoY+KKFeDzVqOJOlV1lvUE5a609G0b1OLCl0LbgKlft
 PjbD4YPM3V03+nmtUabxMaQpYLOLZNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-U5cZyhnzMVi6iI2K4jBKCw-1; Mon, 04 Nov 2019 10:13:57 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADB418017DD;
 Mon,  4 Nov 2019 15:13:55 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1D885D6C5;
 Mon,  4 Nov 2019 15:13:53 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 7/8] Acceptance tests: depend on qemu-img
Date: Mon,  4 Nov 2019 10:13:22 -0500
Message-Id: <20191104151323.9883-8-crosa@redhat.com>
In-Reply-To: <20191104151323.9883-1-crosa@redhat.com>
References: <20191104151323.9883-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: U5cZyhnzMVi6iI2K4jBKCw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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

Tests using the avocado.utils.vmimage library make use of qemu-img,
and because it makes sense to use the version matching the rest of the
source code, let's make sure it gets built.

Its selection, instead of a possible qemu-img binary installed system
wide, is already dealt with by the change that adds the build dir to
the PATH during the test execution.

This is based on the same work for qemu-iotests, and suggested by its
author:

  - https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg00951.html

CC: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 65e85f5275..559c3e6375 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -1174,7 +1174,7 @@ $(TESTS_RESULTS_DIR):
=20
 check-venv: $(TESTS_VENV_DIR)
=20
-check-acceptance: check-venv $(TESTS_RESULTS_DIR)
+check-acceptance: check-venv $(TESTS_RESULTS_DIR) qemu-img$(EXESUF)
 =09$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RESUL=
TS_DIR) \
--=20
2.21.0


