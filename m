Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAF433DE46
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:57:01 +0100 (CET)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFoK-0005Ni-AR
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMFIU-0000Fj-Sz
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 15:24:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMFIL-0002PZ-S8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 15:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615922637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JE/tqTvZoOH/GVxHC51i4E32EYW5v/nu75RJpuw3R4o=;
 b=a+O0/4ajZ7L6Vwil/+fm/F6TXGsBiT0geoGcjRszjan3y6c6npM9nuixuNxuZpJG/xY6u9
 rHbhTnLoXjKXpWaVC0LRH7gnJtQxk+BvllvFVRMqsobBaqoFRtV+P5vE3uQevnTB5ajUDl
 I0F5oqjW+hkhk3gFX8WA2ShpM45Wjd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-PwoYSRqtObKII3xUN6XKtw-1; Tue, 16 Mar 2021 15:23:51 -0400
X-MC-Unique: PwoYSRqtObKII3xUN6XKtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B64B8881276;
 Tue, 16 Mar 2021 19:23:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 797CB5D9D3;
 Tue, 16 Mar 2021 19:23:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4052B114423C; Tue, 16 Mar 2021 20:23:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 6/6] memory: Drop "qemu:" prefix from QOM memory region type
 names
Date: Tue, 16 Mar 2021 20:23:47 +0100
Message-Id: <20210316192347.3918857-7-armbru@redhat.com>
In-Reply-To: <20210316192347.3918857-1-armbru@redhat.com>
References: <20210316192347.3918857-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Almost all QOM type names consist only of letters, digits, '-', '_',
and '.'.  Just two contain ':': "qemu:memory-region" and
"qemu:iommu-memory-region".  Neither can be plugged with -object.
Rename them to "memory-region" and "iommu-memory-region".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210304140229.575481-3-armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/memory.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 54ccf1a5f0..260ddd8ade 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -33,11 +33,11 @@
 #define MAX_PHYS_ADDR_SPACE_BITS 62
 #define MAX_PHYS_ADDR            (((hwaddr)1 << MAX_PHYS_ADDR_SPACE_BITS) - 1)
 
-#define TYPE_MEMORY_REGION "qemu:memory-region"
+#define TYPE_MEMORY_REGION "memory-region"
 DECLARE_INSTANCE_CHECKER(MemoryRegion, MEMORY_REGION,
                          TYPE_MEMORY_REGION)
 
-#define TYPE_IOMMU_MEMORY_REGION "qemu:iommu-memory-region"
+#define TYPE_IOMMU_MEMORY_REGION "iommu-memory-region"
 typedef struct IOMMUMemoryRegionClass IOMMUMemoryRegionClass;
 DECLARE_OBJ_CHECKERS(IOMMUMemoryRegion, IOMMUMemoryRegionClass,
                      IOMMU_MEMORY_REGION, TYPE_IOMMU_MEMORY_REGION)
-- 
2.26.2


