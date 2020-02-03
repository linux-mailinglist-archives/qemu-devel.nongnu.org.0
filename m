Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7833150647
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 13:41:33 +0100 (CET)
Received: from localhost ([::1]:39375 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyb2j-0000Tw-03
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 07:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56445)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iyazl-0004Db-RD
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:38:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iyazk-0005vd-ON
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:38:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30646
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iyazk-0005vM-Kv
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580733508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jvNIvJNOvgqKCmAOhgSNVoFRz83zRgIq0oQyVrP6NSA=;
 b=ZvIgMAcn3ZUkTsfZjU/M1VimL6BYJbfa/n4Su5U4vylmEQFiZucmTl5nayDx+/oJ9xkHK+
 4bCFfvFDbCYDA5oH+trQ9Y/r29wZRG/8++iNu9JUA+ljINui5vLfx8pCG8o0PAJ/KbfJ+8
 mkp6z3JGr1bX5TIDhG+H08816iYv/6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-LLtTCEODMpmxMqH5OmdkGw-1; Mon, 03 Feb 2020 07:38:25 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E47B913E6;
 Mon,  3 Feb 2020 12:38:24 +0000 (UTC)
Received: from thuth.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D63C461070;
 Mon,  3 Feb 2020 12:38:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/13] tests/qtest: update comments about
 bios-tables-test-allowed-diff.h
Date: Mon,  3 Feb 2020 13:38:04 +0100
Message-Id: <20200203123811.8651-7-thuth@redhat.com>
In-Reply-To: <20200203123811.8651-1-thuth@redhat.com>
References: <20200203123811.8651-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: LLtTCEODMpmxMqH5OmdkGw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Heyi Guo <guoheyi@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Heyi Guo <guoheyi@huawei.com>

Update comments in tests/qtest/bios-tables-test.c to reflect the
current path of bios-tables-test-allowed-diff.h, which is now under
tests/qtest/ as well.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Message-Id: <20200202110009.51479-1-guoheyi@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/bios-tables-test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.=
c
index 3ab4872bd7..b4752c644c 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -14,14 +14,14 @@
  * How to add or update the tests:
  * Contributor:
  * 1. add empty files for new tables, if any, under tests/data/acpi
- * 2. list any changed files in tests/bios-tables-test-allowed-diff.h
+ * 2. list any changed files in tests/qtest/bios-tables-test-allowed-diff.=
h
  * 3. commit the above *before* making changes that affect the tables
  *
  * Contributor or ACPI Maintainer (steps 4-7 need to be redone to resolve =
conflicts
  * in binary commit created in step 6):
  *
  * After 1-3 above tests will pass but ignore differences with the expecte=
d files.
- * You will also notice that tests/bios-tables-test-allowed-diff.h lists
+ * You will also notice that tests/qtest/bios-tables-test-allowed-diff.h l=
ists
  * a bunch of files. This is your hint that you need to do the below:
  * 4. Run
  *      make check V=3D1
@@ -40,14 +40,14 @@
  *    in commit log.
  * 7. Before sending patches to the list (Contributor)
  *    or before doing a pull request (Maintainer), make sure
- *    tests/bios-tables-test-allowed-diff.h is empty - this will ensure
+ *    tests/qtest/bios-tables-test-allowed-diff.h is empty - this will ens=
ure
  *    following changes to ACPI tables will be noticed.
  *
  * The resulting patchset/pull request then looks like this:
- * - patch 1: list changed files in tests/bios-tables-test-allowed-diff.h.
+ * - patch 1: list changed files in tests/qtest/bios-tables-test-allowed-d=
iff.h.
  * - patches 2 - n: real changes, may contain multiple patches.
  * - patch n + 1: update golden master binaries and empty
- *   tests/bios-tables-test-allowed-diff.h
+ *   tests/qtest/bios-tables-test-allowed-diff.h
  */
=20
 #include "qemu/osdep.h"
--=20
2.18.1


