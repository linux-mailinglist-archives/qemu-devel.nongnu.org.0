Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36D0216D7A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 15:09:59 +0200 (CEST)
Received: from localhost ([::1]:41702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsnME-0003zW-SY
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 09:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7g-0008Bc-Ck
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 08:54:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31408
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7e-0004rt-JV
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 08:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594126493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=yIBA7QMbjRBBosF8Z/aCMKZ6+Ye92UgyjrSu7U7xbDM=;
 b=GtWM3KlU+y/ZpUKNtTYOSZOTn4mQHVaMDGslM2MILCU2oAPbtTrGYviOMGiAbbHztAiefS
 t2pNBgkCL5J2ObLLQM1XvE+ZVC38l1yy67WOxnJpJTCSk9GFgryhDoHnQOjqeArm/nEmen
 PT6d7uwaMJQ+ir6owyILWqp2LPltoWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-wzx07mdZMDKl64AUVcbilw-1; Tue, 07 Jul 2020 08:54:47 -0400
X-MC-Unique: wzx07mdZMDKl64AUVcbilw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF2CA80DAF3;
 Tue,  7 Jul 2020 12:54:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 511EDC007C;
 Tue,  7 Jul 2020 12:54:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC44E31F9A; Tue,  7 Jul 2020 14:53:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/20] tests/acpi: allow microvm test data updates.
Date: Tue,  7 Jul 2020 14:53:53 +0200
Message-Id: <20200707125356.32450-18-kraxel@redhat.com>
In-Reply-To: <20200707125356.32450-1-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 06:04:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also add empty test data files.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 tests/data/acpi/microvm/APIC                | 0
 tests/data/acpi/microvm/DSDT                | 0
 tests/data/acpi/microvm/FACP                | 0
 4 files changed, 3 insertions(+)
 create mode 100644 tests/data/acpi/microvm/APIC
 create mode 100644 tests/data/acpi/microvm/DSDT
 create mode 100644 tests/data/acpi/microvm/FACP

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..97c3fa621b7f 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/microvm/APIC",
+"tests/data/acpi/microvm/DSDT",
+"tests/data/acpi/microvm/FACP",
diff --git a/tests/data/acpi/microvm/APIC b/tests/data/acpi/microvm/APIC
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/data/acpi/microvm/DSDT b/tests/data/acpi/microvm/DSDT
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/data/acpi/microvm/FACP b/tests/data/acpi/microvm/FACP
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.18.4


