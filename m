Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA02520C0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 21:38:52 +0200 (CEST)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAemR-00083l-Qc
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 15:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWf-0000gD-QY
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:22:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWd-0006F0-2L
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0jc4y3pzQBp649mI+dEINndj2MNwTHkwFwmNAlFfKM=;
 b=ib+xYkgeBGrY69sAoYDfUmnbLGMh8PQF2l/z/Y5AE/Q8CgVBEtpmxOC7pAC17DCNgaUFi0
 DUrgau7h8lnOp+VfFoRawyq6Nrca1luOFuWjJaQPzR7Oall4FVjPcyc0WBM5FWINxZwjin
 +QwIsIvuOu/CXhU3cHWHRmrY6IyUIts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337--4R6HDb9MIG57e5q69B4-Q-1; Tue, 25 Aug 2020 15:22:28 -0400
X-MC-Unique: -4R6HDb9MIG57e5q69B4-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C638801AB5
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 19:22:27 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B477A6F936;
 Tue, 25 Aug 2020 19:22:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 33/74] pckbd: Move QOM macro to header
Date: Tue, 25 Aug 2020 15:20:29 -0400
Message-Id: <20200825192110.3528606-34-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 02:03:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the I8042 macro close to the TYPE_I8042 define.

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
 include/hw/input/i8042.h | 1 +
 hw/input/pckbd.c         | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 8eaebf50ce..4569dfddd9 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -11,6 +11,7 @@
 #include "hw/isa/isa.h"
 
 #define TYPE_I8042 "i8042"
+#define I8042(obj) OBJECT_CHECK(ISAKBDState, (obj), TYPE_I8042)
 
 #define I8042_A20_LINE "a20"
 
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 29d633ca94..dde85ba6c6 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -481,8 +481,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     qemu_register_reset(kbd_reset, s);
 }
 
-#define I8042(obj) OBJECT_CHECK(ISAKBDState, (obj), TYPE_I8042)
-
 struct ISAKBDState {
     ISADevice parent_obj;
 
-- 
2.26.2


