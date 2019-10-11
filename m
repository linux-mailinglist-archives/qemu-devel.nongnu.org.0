Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7DD3B1B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 10:29:19 +0200 (CEST)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqIX-0000Rs-RP
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 04:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luoyifan@cmss.chinamobile.com>) id 1iIqGh-000840-DA
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:27:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luoyifan@cmss.chinamobile.com>) id 1iIqGe-000446-Uk
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:27:22 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:13196)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <luoyifan@cmss.chinamobile.com>) id 1iIqGe-0003x6-5J
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:27:20 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb5da03cd4570-3460f;
 Fri, 11 Oct 2019 16:27:00 +0800 (CST)
X-RM-TRANSID: 2eeb5da03cd4570-3460f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOPBMTSOBR7 (unknown[10.42.68.12])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15da03cce38d-9225c;
 Fri, 11 Oct 2019 16:27:00 +0800 (CST)
X-RM-TRANSID: 2ee15da03cce38d-9225c
From: <luoyifan@cmss.chinamobile.com>
To: <qemu-devel@nongnu.org>
References: 
In-Reply-To: 
Subject: [Qemu-devel] [PATCH] tests/rebuild-expected-aml.sh: Modern shell
 scripting (use $() instead of ``)
Date: Fri, 11 Oct 2019 16:26:55 +0800
Message-ID: <02f501d5800d$a4a059c0$ede10d40$@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJjGx4Wa+Q6/sLIx9mtUtwwo82A/qY5420Q
Content-Language: zh-cn
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.81
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
Cc: imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various shell files contain a mix of obsolete `` and
modern $(); It would be nice to convert to use $()
everywhere.

Signed-off-by: Yifan Luo <luoyifan@cmss.chinamobile.com>
---
 tests/data/acpi/rebuild-expected-aml.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/data/acpi/rebuild-expected-aml.sh
b/tests/data/acpi/rebuild-expected-aml.sh
index f89d462..07c5814 100755
--- a/tests/data/acpi/rebuild-expected-aml.sh
+++ b/tests/data/acpi/rebuild-expected-aml.sh
@@ -29,7 +29,7 @@ for qemu in $qemu_bins; do
     TEST_ACPI_REBUILD_AML=y QTEST_QEMU_BINARY=$qemu tests/bios-tables-test
 done
 
-eval `grep SRC_PATH= config-host.mak`
+eval $(grep SRC_PATH= config-host.mak)
 
 echo '/* List of comma-separated changed AML files to ignore */' >
${SRC_PATH}/tests/bios-tables-test-allowed-diff.h
 
-- 
1.8.3.1




