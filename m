Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967A243B6A7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:14:01 +0200 (CEST)
Received: from localhost ([::1]:41238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfP5M-0008JR-Mv
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfOzQ-0007nI-Tj
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:07:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfOzP-00045T-GN
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635264470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NUxClgXVzXxQ9wiBVvGBoiHLiTm7ErAfHpHd5AdOaCI=;
 b=Bvk/ZweZjobdEzBDCMkqtdegd1xw/HaAuXyNZOzKKTlE8GjKoO6yGPrh67HtHBHeFECT1W
 DfC+NF8GbyB2PJWeeSrc+j9npazH/2k3Eurt6ogmw3xUnG2uTSWAUVP20XqT8svqWklHP6
 pUjmzuflCm7vZTY2ybVsm/M6hewFSzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-NzvdDdX-Mly4Li1LNbVGRg-1; Tue, 26 Oct 2021 12:07:47 -0400
X-MC-Unique: NzvdDdX-Mly4Li1LNbVGRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 836C4362F8;
 Tue, 26 Oct 2021 16:07:46 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5417916A35;
 Tue, 26 Oct 2021 16:07:41 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] memory: Update description of memory_region_is_mapped()
Date: Tue, 26 Oct 2021 18:06:49 +0200
Message-Id: <20211026160649.47545-4-david@redhat.com>
In-Reply-To: <20211026160649.47545-1-david@redhat.com>
References: <20211026160649.47545-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's update the documentation, making it clearer what the semantics
of memory_region_is_mapped() actually are.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/memory.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 35382d9870..bab9349b60 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2266,7 +2266,8 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
 
 /**
  * memory_region_is_mapped: returns true if #MemoryRegion is mapped
- * into any address space.
+ * into another memory region, which does not necessarily imply that it is
+ * mapped into an address space.
  *
  * @mr: a #MemoryRegion which should be checked if it's mapped
  */
-- 
2.31.1


