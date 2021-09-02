Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BCB3FED9F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:16:23 +0200 (CEST)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLldl-0004Zn-SF
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0m-0000E5-EL
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0k-0004zT-R6
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630582561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jzSorC934c+iG7Zenf/zCUMuJqKMivpJkaaF+j/4Fg=;
 b=ZktHpE7FLkvJybVq951eOeDWaFK/sEVImuFdbe8Y/GxPBzQyXx+IJp8NMC9tM9/p91UPxM
 jkPKd9L8h48JBc91ceW3oLiY3AqqnA2sYQH/0X12uBz9jOJqviE47Xxh1SLVQygsRcqHVq
 YmnCq6FRxqDIpwdvPWlqnWifFMvngqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-lqbPcPXcMeC6J_zGaFZeow-1; Thu, 02 Sep 2021 07:36:00 -0400
X-MC-Unique: lqbPcPXcMeC6J_zGaFZeow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27D6F801AFC
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 11:36:00 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80CAB6A8F8;
 Thu,  2 Sep 2021 11:35:59 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] tests: acpi: whitelist new expected table
 tests/data/acpi/q35/DMAR.dmar
Date: Thu,  2 Sep 2021 07:35:42 -0400
Message-Id: <20210902113551.461632-7-imammedo@redhat.com>
In-Reply-To: <20210902113551.461632-1-imammedo@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/q35/DMAR.dmar               | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/q35/DMAR.dmar

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a2843335c8 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DMAR.dmar",
diff --git a/tests/data/acpi/q35/DMAR.dmar b/tests/data/acpi/q35/DMAR.dmar
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.27.0


