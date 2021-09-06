Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A7F401B43
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 14:36:49 +0200 (CEST)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNDrl-0008J6-05
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 08:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDp5-0006JM-R7
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDn8-00020K-Rx
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630931521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LK6aUScJjJPwZ8zofjWt0AwCUuJ5xKj9bLlJfK1d/s4=;
 b=VgooU4+whK5paTblLmbt7TZKu2CLbP3L50ZIL/MKq+M6FAY9O5pF23czEeqOUJWqcMsMo2
 p8Sw34Yrko8QuUO839seCOk0ej6T5fD+zAJgDcXigySWNIPzSQvtOE2gmK9hZkR/6azegj
 9ZkoSK2EAaPuPo55TP9wAqSxDC6sqZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-k999USvkMp-GucyJo4X4OA-1; Mon, 06 Sep 2021 08:32:00 -0400
X-MC-Unique: k999USvkMp-GucyJo4X4OA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CEC7188352B;
 Mon,  6 Sep 2021 12:31:59 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 128AD1B42C;
 Mon,  6 Sep 2021 12:31:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v2 1/3] tests/acpi: Add void table for virt/DBG2
 bios-tables-test
Date: Mon,  6 Sep 2021 14:31:37 +0200
Message-Id: <20210906123139.93593-2-eric.auger@redhat.com>
In-Reply-To: <20210906123139.93593-1-eric.auger@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add placeholders for DBG2 reference table for
virt tests and ignore this later for the time being.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/data/acpi/virt/DBG2                   | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/virt/DBG2

diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf..1910d154c27 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DBG2",
-- 
2.26.3


