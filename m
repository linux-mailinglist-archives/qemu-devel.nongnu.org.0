Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177E82520CA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 21:42:46 +0200 (CEST)
Received: from localhost ([::1]:51248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAeqD-0000HJ-3e
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 15:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWZ-0000O2-56
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:22:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20187
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWX-0006Dz-IJ
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edMutzq5OmtHf/JIvaLPBCyM1fIeU0raQMI7jFi/+WU=;
 b=YGST/iZ+c/2SzpnELF1ZvZdKd6gOiJpu243AwT7vxHXlwQlOACO9iQRl+yAM49ovWFOia5
 cKkpSHYt8yRco22t2O8d4EsBfPWhubQoDIirzNVJgNARwym8UAXzogm4phzTqkCZEBj8P4
 FU9huTw7wPNGzBzkrfwidVcsUA4+U80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-9mL7j893NCOwzEASF6YQZQ-1; Tue, 25 Aug 2020 15:22:22 -0400
X-MC-Unique: 9mL7j893NCOwzEASF6YQZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F321E1074648
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 19:22:21 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B0D010013C2;
 Tue, 25 Aug 2020 19:22:18 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/74] i8257: Move QOM macro to header
Date: Tue, 25 Aug 2020 15:20:27 -0400
Message-Id: <20200825192110.3528606-32-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 10:39:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the I8257 macro to i8257.h, close to the TYPE_I8257 define.

This will make future conversion to OBJECT_DECLARE* easier.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3: none

Changes series v1 -> v2: new patch in series v2

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/dma/i8257.h | 2 ++
 hw/dma/i8257.c         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/dma/i8257.h b/include/hw/dma/i8257.h
index 03e2c166be..ee06371699 100644
--- a/include/hw/dma/i8257.h
+++ b/include/hw/dma/i8257.h
@@ -5,6 +5,8 @@
 #include "exec/ioport.h"
 
 #define TYPE_I8257 "i8257"
+#define I8257(obj) \
+    OBJECT_CHECK(I8257State, (obj), TYPE_I8257)
 
 typedef struct I8257Regs {
     int now[2];
diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
index db808029b0..de5f696919 100644
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -33,8 +33,6 @@
 #include "qemu/log.h"
 #include "trace.h"
 
-#define I8257(obj) \
-    OBJECT_CHECK(I8257State, (obj), TYPE_I8257)
 
 /* #define DEBUG_DMA */
 
-- 
2.26.2


