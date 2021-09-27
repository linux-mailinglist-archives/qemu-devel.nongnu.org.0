Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADB741955D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:48:16 +0200 (CEST)
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqzP-0003PZ-S1
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mUqWI-0005AW-LB
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:18:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mUqWG-0002bK-Vf
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UF3tXFX/C0ARKDZ6oAL6a/PJdnT7KdiG/33xvqq9Vs=;
 b=HTsX+H/DuSA2mlraC9JaNHp4vGz44G37oawwDrYQEpI6jh+PwtGUorEqcufbI+irwXIAL6
 JE156z6Y2MkQf1DH6PaOmKw5wBIxH39+WBqdjXrG42e4zfwZuefZB0ElkiLI/0a8BU+p88
 E5vpuCchEBuPiQDKGr8hpr4bkcvn0o8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-fxQeIfPiNJauYHrZ2FXY1A-1; Mon, 27 Sep 2021 09:18:07 -0400
X-MC-Unique: fxQeIfPiNJauYHrZ2FXY1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D0B10C9C60;
 Mon, 27 Sep 2021 13:18:05 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 422A919D9D;
 Mon, 27 Sep 2021 13:17:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v3 1/3] tests/acpi: Add void table for virt/DBG2
 bios-tables-test
Date: Mon, 27 Sep 2021 15:17:30 +0200
Message-Id: <20210927131732.63801-2-eric.auger@redhat.com>
In-Reply-To: <20210927131732.63801-1-eric.auger@redhat.com>
References: <20210927131732.63801-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add placeholders for DBG2 reference table for
virt tests and ignore till reference blob is added.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>

---
v2 -> v3:
- commit msg rewording according to Igor's suggestion and
  added Igor's A-b.
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/virt/DBG2                   | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/virt/DBG2

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1910d154c2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DBG2",
diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.26.3


