Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C744433F6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:51:37 +0100 (CET)
Received: from localhost ([::1]:59680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhx0a-0005Tm-KH
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhwuw-00076A-JK
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mhwuu-0005Gw-Rp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635871543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OALXN0vv4w2PCzb8tR40n+V/PUs5YRi9RQ+che7QlwU=;
 b=J0fwGH2glgvjs4dc8iEaZalPWaFBQj4e7aKilyAv6nQuktym/3pq5kyOm3kRgVckusf2SV
 4bQs+VAEd/gIakCHA1Db304bmfJCryZZuhtn9tAFRmnqZ7mzFgNEo9zye9c2pFebrh8NWj
 4cDmmyeIDqRjd9ouE/AqBBHAKDnsHJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-lHBP-BYqNgST0YcK8M8RBA-1; Tue, 02 Nov 2021 12:45:40 -0400
X-MC-Unique: lHBP-BYqNgST0YcK8M8RBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D44371926DA8;
 Tue,  2 Nov 2021 16:45:39 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BC64100E12C;
 Tue,  2 Nov 2021 16:45:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] memory: Update description of memory_region_is_mapped()
Date: Tue,  2 Nov 2021 17:43:17 +0100
Message-Id: <20211102164317.45658-4-david@redhat.com>
In-Reply-To: <20211102164317.45658-1-david@redhat.com>
References: <20211102164317.45658-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/exec/memory.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index fea1a493b9..63be794a06 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2297,7 +2297,8 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
 
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


