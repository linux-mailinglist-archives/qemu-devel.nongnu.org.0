Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0239F244156
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 00:38:14 +0200 (CEST)
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6LrR-0005T4-1n
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 18:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k6LgR-0005KS-Lf
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:26:51 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51476
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k6LgO-0002sm-CZ
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597357607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bW/TDj4Wwb+ZkAGPhxWHIMNOAzcg2mMXGfEZTSU5OzE=;
 b=HQRHrCf6FobD5ihnC8pZmNX2bIdn6wgKa/gUkT/FPSqx3WM+4DJZMxy/5I2D5QVtwGB3nw
 4xhV0bRhmYvDLMBuzjGXDBc0gf/tE0v8XNo79v5ZmjGvWZBK/TrbvMZ34n2xaHzYhVXKui
 c3c2OGGb+3llI7LqXvFcvPoL/TwLwjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-f37nJICROIm8kizLwScOaw-1; Thu, 13 Aug 2020 18:26:46 -0400
X-MC-Unique: f37nJICROIm8kizLwScOaw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47CE51005504
 for <qemu-devel@nongnu.org>; Thu, 13 Aug 2020 22:26:45 +0000 (UTC)
Received: from localhost (ovpn-117-153.rdu2.redhat.com [10.10.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13D30610F3;
 Thu, 13 Aug 2020 22:26:44 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/41] tulip: Move TulipState typedef to header
Date: Thu, 13 Aug 2020 18:25:59 -0400
Message-Id: <20200813222625.243136-16-ehabkost@redhat.com>
In-Reply-To: <20200813222625.243136-1-ehabkost@redhat.com>
References: <20200813222625.243136-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 17:30:51
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move typedef closer to the type check macros, to make it easier
to convert the code to OBJECT_DEFINE_TYPE() in the future.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/tulip.h | 1 +
 hw/net/tulip.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/net/tulip.h b/hw/net/tulip.h
index 5271aad8d5..c3fcd4d4e1 100644
--- a/hw/net/tulip.h
+++ b/hw/net/tulip.h
@@ -5,6 +5,7 @@
 #include "net/net.h"
 
 #define TYPE_TULIP "tulip"
+typedef struct TULIPState TULIPState;
 #define TULIP(obj) OBJECT_CHECK(TULIPState, (obj), TYPE_TULIP)
 
 #define CSR(_x) ((_x) << 3)
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 4487fd61cf..ca69f7ea5e 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -18,7 +18,7 @@
 #include "trace.h"
 #include "net/eth.h"
 
-typedef struct TULIPState {
+struct TULIPState {
     PCIDevice dev;
     MemoryRegion io;
     MemoryRegion memory;
@@ -44,7 +44,7 @@ typedef struct TULIPState {
 
     uint32_t rx_status;
     uint8_t filter[16][6];
-} TULIPState;
+};
 
 static const VMStateDescription vmstate_pci_tulip = {
     .name = "tulip",
-- 
2.26.2


