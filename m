Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C0158FB4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 14:21:30 +0100 (CET)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1VTl-0008Se-6p
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 08:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1VSS-0007b9-9a
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:20:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1VSQ-0008M5-FY
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:20:07 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27732
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1VSQ-0008LZ-9O
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581427205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=caTRycrEYs+U5q73Kv4o7WZs3KXzKqalCNp3oCCBHX8=;
 b=LvPkDxeMiKcQzeOPMYzIkOMtId3v3I9Up9An7BuEeATE7X6nHrRGHYQ+kXdMZdYTuP8Voi
 8RtgUME0dC73BsdPJ1ip/fosb+I6V8VCLdo8GXXLfclSfezoJ9bXpJ7kECu2LbhCm+BdsG
 /Rz+FWhZipOSBlyW4U5QaPdKmjdQtlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-rb31e-MvPQCRhi6CPYEtjw-1; Tue, 11 Feb 2020 08:20:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 623E61800D42;
 Tue, 11 Feb 2020 13:20:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-81.brq.redhat.com [10.40.205.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F1CF5C1B2;
 Tue, 11 Feb 2020 13:19:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance/ppc_prep_40p: Do not run NetBSD test by
 default
Date: Tue, 11 Feb 2020 14:19:48 +0100
Message-Id: <20200211131948.26142-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: rb31e-MvPQCRhi6CPYEtjw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ftp.netbsd.org server is slow and downloading the NetBSD ISO
takes too long. Do not include this test in the default suite.

Similarly to commit 471c97a69b:

  Currently the Avocado framework does not distinct the time spent
  downloading assets vs. the time spent running a test. With big
  assets (like a full VM image) the tests likely fail.

  This is a limitation known by the Avocado team.
  Until this issue get fixed, do not run this tests automatically.

  Tests can still be run setting the AVOCADO_TIMEOUT_EXPECTED
  environment variable.

Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/ppc_prep_40p.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_4=
0p.py
index b27572f212..efe06037ba 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/acceptance/ppc_prep_40p.py
@@ -61,6 +61,7 @@ def test_openbios_192m(self):
         wait_for_console_pattern(self, '>> CPU type PowerPC,604')
=20
     @skipIf(os.getenv('CONTINUOUS_INTEGRATION'), 'Running on Travis-CI')
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout=
')
     def test_openbios_and_netbsd(self):
         """
         :avocado: tags=3Darch:ppc
--=20
2.21.1


