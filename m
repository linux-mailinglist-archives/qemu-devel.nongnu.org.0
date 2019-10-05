Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56501CCCDB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Oct 2019 23:28:41 +0200 (CEST)
Received: from localhost ([::1]:58880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGrbT-0005OM-Tx
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 17:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45910)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iGraO-0004wJ-Uh
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 17:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iGraM-0004C6-8Z
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 17:27:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57944)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iGraM-0004AH-0d
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 17:27:30 -0400
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2D17F85540
 for <qemu-devel@nongnu.org>; Sat,  5 Oct 2019 21:27:26 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id g62so10578437qkb.20
 for <qemu-devel@nongnu.org>; Sat, 05 Oct 2019 14:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Amj4PpRLJKQT0ZPCZm5InuKFsg1DBINwnumBQfGWOYY=;
 b=KMekIw3Us5MzRRlzwE61ChG3e5YpjOsXiHTUYvBtlQeZhbSqBwA2hmNF3HA+f+82Sq
 rKzty6ltkby5JUHDQe/VzpKu57nS8ZglF+bVK3w3z+0iPMVOTiwzbCv0NLftFnMz494z
 J5PthIeeFt8CX8re2sJCNSetWAmUxywsIuOEI2gmGHS6pm/2jlDO6JgbqKQVgLerQI9N
 3b3u7ulczH+pXwoBfPh86p8WORFGNKr6+as+4BSNOzFrIu451cmBgkM0LQbKAL3MbVmP
 qWk5rG6EUo5S0bu8x/hpXXBXn8LRjq3x5h8wQPK1+qbnnU1LXPr9cBvLiEX/pUJwlGnc
 KxMQ==
X-Gm-Message-State: APjAAAXRZIxFr7xXAPFjg8wLXM6f5Rhf2/fwV9jSySBVyg8qA8AcWZ/Y
 egHx3Z+Bz5ogCXj0Q3OByw1+U4oCMpFIvQkPBVAshwBPccwstsY5iLFNMMF5tt7uVYANXuKyBvi
 JNu3IfmhVCaU3oOI=
X-Received: by 2002:ae9:eb93:: with SMTP id b141mr17344067qkg.36.1570310845141; 
 Sat, 05 Oct 2019 14:27:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzapyES/49m8A9qZTlpCY8fuDBmSl389Yp/WaBf0dye3rfTPnCYXbkNJfwwwKX/hcURA20Xg==
X-Received: by 2002:ae9:eb93:: with SMTP id b141mr17344058qkg.36.1570310844870; 
 Sat, 05 Oct 2019 14:27:24 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 x55sm7561159qta.74.2019.10.05.14.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 14:27:23 -0700 (PDT)
Date: Sat, 5 Oct 2019 17:27:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: document how to update acpi tables
Message-ID: <20191005212709.26101-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like no one understands how to do it.
Document the process.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/bios-tables-test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 652a78773f..0b33fb265f 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -10,6 +10,33 @@
  * See the COPYING file in the top-level directory.
  */
 
+/*
+ * How to add or update the tests:
+ * Contributor:
+ * 1. add empty files for new tables, if any, under tests/data/acpi
+ * 2. list any changed files in tests/bios-tables-test-allowed-diff.h
+ * 3. commit the above *before* making changes that affect the tables
+ * Maintainer:
+ * After 1-3 above tests will pass but ignore differences with the expected files.
+ * You will also notice that tests/bios-tables-test-allowed-diff.h lists
+ * a bunch of files. This is your hint that you need to do the below:
+ * 4. Run
+ *      make check V=1
+ * this will produce a bunch of warnings about differences
+ * beween actual and expected ACPI tables. If you have IASL installed,
+ * they will also be disassembled so you can look at the disassembled
+ * output. If not - disassemble them yourself in any way you like.
+ * Look at the differences - make sure they make sense and match what the
+ * changes you are merging are supposed to do.
+ *
+ * 5. From build directory, run:
+ *      $(SRC_PATH)/tests/data/acpi/rebuild-expected-aml.sh
+ * 6. Now commit any changes.
+ * 7. Before doing a pull request, make sure tests/bios-tables-test-allowed-diff.h
+ *    is empty - this will ensure following changes to ACPI tables will
+ *    be noticed.
+ */
+
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
 #include "qemu-common.h"
-- 
MST

