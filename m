Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B71228CC1B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 13:01:09 +0200 (CEST)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSI3I-0002MP-5j
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 07:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kSHyP-0005WB-Rp
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 06:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kSHyK-0006E9-Bx
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 06:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602586558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=XF62iRFOOfTd6EN5BZ0SHkzCzlzIasMoV19lLSWcopE=;
 b=igL4LoFlZoqgMYfziMPTTqgW5zVKg+NloEpmNF9A8AsphRGMMb8FOmnTNrL/en29RAwWk5
 vkoodDUnlJjOsR5Cu2mnw9gkZL729q2rh1GCaH44iEnWFxLJgR5NUN3NzAAJteYNicjF1y
 iVLCaZHoC4FD0yEZuh95wiBcJVeHa0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-Dvn1APodN6mJzUScL0UtFg-1; Tue, 13 Oct 2020 06:55:56 -0400
X-MC-Unique: Dvn1APodN6mJzUScL0UtFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA08718829D3;
 Tue, 13 Oct 2020 10:55:55 +0000 (UTC)
Received: from thuth.com (ovpn-112-151.ams2.redhat.com [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25CA46EF67;
 Tue, 13 Oct 2020 10:55:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/23] Add a comment in bios-tables-test.c to clarify the
 reason behind approach
Date: Tue, 13 Oct 2020 12:55:13 +0200
Message-Id: <20201013105527.20088-10-thuth@redhat.com>
In-Reply-To: <20201013105527.20088-1-thuth@redhat.com>
References: <20201013105527.20088-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

A comment is added in bios-tables-test.c that explains the reasoning
behind the process of updating the ACPI table blobs when new tests are added
or old tests are modified or code is committed that affect tests. The
explanation would help future contributors follow the correct process when
making code changes that affect ACPI tables.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200929142501.1057-1-ani@anisinha.ca>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/bios-tables-test.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e15f36c8c7..5647624492 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -11,7 +11,7 @@
  */
 
 /*
- * How to add or update the tests:
+ * How to add or update the tests or commit changes that affect ACPI tables:
  * Contributor:
  * 1. add empty files for new tables, if any, under tests/data/acpi
  * 2. list any changed files in tests/qtest/bios-tables-test-allowed-diff.h
@@ -38,6 +38,11 @@
  *      $(SRC_PATH)/tests/data/acpi/rebuild-expected-aml.sh
  * 6. Now commit any changes to the expected binary, include diff from step 4
  *    in commit log.
+ *    Expected binary updates needs to be a separate patch from the code that
+ *    introduces changes to ACPI tables. It lets the maintainer drop
+ *    and regenerate binary updates in case of merge conflicts. Further, a code
+ *    change is easily reviewable but a binary blob is not (without doing a
+ *    disassembly).
  * 7. Before sending patches to the list (Contributor)
  *    or before doing a pull request (Maintainer), make sure
  *    tests/qtest/bios-tables-test-allowed-diff.h is empty - this will ensure
-- 
2.18.2


