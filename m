Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B45424AC24
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:27:12 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YQB-0004iW-79
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDQ-000745-54
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:00 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39929
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDO-0002QW-Fl
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EE5wexaCPwpw1jfLyFsshxs7hIPwpQMh3YX80QeKA5g=;
 b=hkPCszTpQmST5YYJ2ZkJuc7tkQk9CHISVkGjak1Toqz/PXBFX1o/gnyIs8NR9EDJL0Rxk5
 MnLwPppsLR7o+Jr1MqHFlRXEFpjo9q2N0d2m1LPYVX+QOSucdpHnh8W5FBT/MBUf6ceED2
 Ia1pMrR7qtakCeESL8/O4qP7jBC0D4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-ic3uGyq4M76Hx8xgCkRzaQ-1; Wed, 19 Aug 2020 20:13:55 -0400
X-MC-Unique: ic3uGyq4M76Hx8xgCkRzaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2A2E8030A1;
 Thu, 20 Aug 2020 00:13:54 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFFE169C9D;
 Thu, 20 Aug 2020 00:13:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/58] ahci: Move QOM macro to header
Date: Wed, 19 Aug 2020 20:12:10 -0400
Message-Id: <20200820001236.1284548-33-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:12:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the ALLWINNER_AHCI macro close to the TYPE_ALLWINNER_AHCI
define.

This will make future conversion to OBJECT_DECLARE* easier.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v1 -> v2: new patch in series v2

Cc: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/ide/ahci.h   | 2 ++
 hw/ide/ahci-allwinner.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index ce2bf8a5f8..41bb517047 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -72,6 +72,8 @@ typedef struct SysbusAHCIState {
 } SysbusAHCIState;
 
 #define TYPE_ALLWINNER_AHCI "allwinner-ahci"
+#define ALLWINNER_AHCI(obj) \
+        OBJECT_CHECK(AllwinnerAHCIState, (obj), TYPE_ALLWINNER_AHCI)
 
 #define ALLWINNER_AHCI_MMIO_OFF  0x80
 #define ALLWINNER_AHCI_MMIO_SIZE 0x80
diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
index 8536b9eb5a..227e747ba7 100644
--- a/hw/ide/ahci-allwinner.c
+++ b/hw/ide/ahci-allwinner.c
@@ -25,9 +25,6 @@
 
 #include "trace.h"
 
-#define ALLWINNER_AHCI(obj) \
-        OBJECT_CHECK(AllwinnerAHCIState, (obj), TYPE_ALLWINNER_AHCI)
-
 #define ALLWINNER_AHCI_BISTAFR    ((0xa0 - ALLWINNER_AHCI_MMIO_OFF) / 4)
 #define ALLWINNER_AHCI_BISTCR     ((0xa4 - ALLWINNER_AHCI_MMIO_OFF) / 4)
 #define ALLWINNER_AHCI_BISTFCTR   ((0xa8 - ALLWINNER_AHCI_MMIO_OFF) / 4)
-- 
2.26.2


