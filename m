Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836291408AC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 12:11:34 +0100 (CET)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isPXJ-0002L1-Bn
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 06:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1isPU7-0006it-PG
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:08:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1isPU4-0003kI-8i
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:08:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47257
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1isPU4-0003k6-5Q
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 06:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579259291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+TiDJI/noUOtbv6SI6j0jYg5aYPv0QyWMrO1+E9TRA=;
 b=c+BaenL6lCrHL0rpYACEcBmlV6k3hfNoKPn2M/YajSpawrWe4t/uH/z2FMZmOLU5Z3aBCb
 aMZjzti44/HcnM1sDMrUXg5Cz1sSrbKrY59gT76utPL92pb0CUP+Azif7Mcodmq1pR0zPS
 ZuF7sfgYd2jJdn6oILJpkHqFDoyTK94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-a_7J1ztGO6m7NqF5nQj-0Q-1; Fri, 17 Jan 2020 06:08:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39C2A190B2A0;
 Fri, 17 Jan 2020 11:08:04 +0000 (UTC)
Received: from thuth.com (ovpn-116-212.ams2.redhat.com [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0174460C87;
 Fri, 17 Jan 2020 11:08:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/4] tests: acpi: update path in rebuild-expected-aml
Date: Fri, 17 Jan 2020 12:07:55 +0100
Message-Id: <20200117110758.1995-2-thuth@redhat.com>
In-Reply-To: <20200117110758.1995-1-thuth@redhat.com>
References: <20200117110758.1995-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: a_7J1ztGO6m7NqF5nQj-0Q-1
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Since commit 1e8a1fae7464("test: Move qtests to a separate
directory") qtests are now placed in a separate folder and
this breaks the script used to rebuild the expected ACPI
tables for bios-tables-test. Update the script with correct
path.

Fixes: 1e8a1fae7464("test: Move qtests to a separate directory")
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20200114165138.15716-1-shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/data/acpi/rebuild-expected-aml.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/data/acpi/rebuild-expected-aml.sh b/tests/data/acpi/rebu=
ild-expected-aml.sh
index f89d4624bc..d44e511533 100755
--- a/tests/data/acpi/rebuild-expected-aml.sh
+++ b/tests/data/acpi/rebuild-expected-aml.sh
@@ -14,7 +14,7 @@
=20
 qemu_bins=3D"x86_64-softmmu/qemu-system-x86_64 aarch64-softmmu/qemu-system=
-aarch64"
=20
-if [ ! -e "tests/bios-tables-test" ]; then
+if [ ! -e "tests/qtest/bios-tables-test" ]; then
     echo "Test: bios-tables-test is required! Run make check before this s=
cript."
     echo "Run this script from the build directory."
     exit 1;
@@ -26,11 +26,11 @@ for qemu in $qemu_bins; do
         echo "Also, run this script from the build directory."
         exit 1;
     fi
-    TEST_ACPI_REBUILD_AML=3Dy QTEST_QEMU_BINARY=3D$qemu tests/bios-tables-=
test
+    TEST_ACPI_REBUILD_AML=3Dy QTEST_QEMU_BINARY=3D$qemu tests/qtest/bios-t=
ables-test
 done
=20
 eval `grep SRC_PATH=3D config-host.mak`
=20
-echo '/* List of comma-separated changed AML files to ignore */' > ${SRC_P=
ATH}/tests/bios-tables-test-allowed-diff.h
+echo '/* List of comma-separated changed AML files to ignore */' > ${SRC_P=
ATH}/tests/qtest/bios-tables-test-allowed-diff.h
=20
 echo "The files were rebuilt and can be added to git."
--=20
2.18.1


