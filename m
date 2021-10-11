Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D21D42960F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:49:54 +0200 (CEST)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzQu-00018C-RK
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzMo-0005GT-89
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:45:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzMk-0001Qe-Al
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633974333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJZT7kZKsjzVFTbBDJjSNXKf9s3+cTG9pTvhqdd9ups=;
 b=arG83VfDgq7iepsWxnXfV7R0G7xYeNrsiYwZ/tGvfaNBBPFv6HE0C6vnWz8DlbAn5JnSWV
 kLg0Hk976TaMcYKX1T0F5Z0c7OIAzre1k9a34l4tSZR7SwZF6E2/D+53RW9yOBx/KOLFMy
 CTad/UL/t33l/gmcGT0cQaaXWABP/BM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-3uP3GOZ0Ov-t7UTTtJ_wiA-1; Mon, 11 Oct 2021 13:45:32 -0400
X-MC-Unique: 3uP3GOZ0Ov-t7UTTtJ_wiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5940618125DF;
 Mon, 11 Oct 2021 17:45:31 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AA63ADEB;
 Mon, 11 Oct 2021 17:45:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] memory: Update description of memory_region_is_mapped()
Date: Mon, 11 Oct 2021 19:45:21 +0200
Message-Id: <20211011174522.14351-3-david@redhat.com>
In-Reply-To: <20211011174522.14351-1-david@redhat.com>
References: <20211011174522.14351-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_is_mapped() only indicates if the memory region is mapped
into a different memory region, and only if it is mapped directly
(->container), not via an alias.

Update the documentation to make this clearer.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/memory.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index a185b6dcb8..abc17fc3c0 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2265,7 +2265,8 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
 
 /**
  * memory_region_is_mapped: returns true if #MemoryRegion is mapped
- * into any address space.
+ * into another #MemoryRegion directly. Will return false if the
+ * #MemoryRegion is mapped indirectly via an alias.
  *
  * @mr: a #MemoryRegion which should be checked if it's mapped
  */
-- 
2.31.1


