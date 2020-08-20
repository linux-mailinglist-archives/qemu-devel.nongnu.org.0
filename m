Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987724ABDD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:14:16 +0200 (CEST)
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YDe-0006Kn-TH
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YCG-0004ja-Qn
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:12:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34018
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YCE-0002GR-IH
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pe2EyVBdF44qbW+lbiXXqIUsq6GST8x6uPgPEGKk2t8=;
 b=Fb5hIToc7rWhUWYKshn+Fn+fGYz1B8Rb+pLV2mL79th6UbXPrIKiCbxbFPT9N+fZ/1EeCt
 uQ8U1vVhVlTajst+hak5tbsYAnfn4+A2brbHnhjwmFbGCJlNb1+qAjEBFBIURT6StAAStI
 bpyqLNqngltpCmIsw8Ayp8x1Poez7XU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-eWdTxSxrMIORwgw-_hcR0A-1; Wed, 19 Aug 2020 20:12:42 -0400
X-MC-Unique: eWdTxSxrMIORwgw-_hcR0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3B9E186A574
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 00:12:41 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FCF15C1D0;
 Thu, 20 Aug 2020 00:12:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/58] e1000: Rename QOM class cast macros
Date: Wed, 19 Aug 2020 20:11:39 -0400
Message-Id: <20200820001236.1284548-2-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the E1000_DEVICE_CLASS() and E1000_DEVICE_GET_CLASS()
macros to be consistent with the E1000() instance cast macro.

This will allow us to register the type cast macros using
OBJECT_DECLARE_TYPE later.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2: none

---
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/net/e1000.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index a18f80e369..c4d896a9e6 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -151,9 +151,9 @@ typedef struct E1000BaseClass {
 #define E1000(obj) \
     OBJECT_CHECK(E1000State, (obj), TYPE_E1000_BASE)
 
-#define E1000_DEVICE_CLASS(klass) \
+#define E1000_CLASS(klass) \
      OBJECT_CLASS_CHECK(E1000BaseClass, (klass), TYPE_E1000_BASE)
-#define E1000_DEVICE_GET_CLASS(obj) \
+#define E1000_GET_CLASS(obj) \
     OBJECT_GET_CLASS(E1000BaseClass, (obj), TYPE_E1000_BASE)
 
 static void
@@ -365,7 +365,7 @@ e1000_autoneg_timer(void *opaque)
 static void e1000_reset(void *opaque)
 {
     E1000State *d = opaque;
-    E1000BaseClass *edc = E1000_DEVICE_GET_CLASS(d);
+    E1000BaseClass *edc = E1000_GET_CLASS(d);
     uint8_t *macaddr = d->conf.macaddr.a;
 
     timer_del(d->autoneg_timer);
@@ -1751,7 +1751,7 @@ static void e1000_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-    E1000BaseClass *e = E1000_DEVICE_CLASS(klass);
+    E1000BaseClass *e = E1000_CLASS(klass);
     const E1000Info *info = data;
 
     k->realize = pci_e1000_realize;
-- 
2.26.2


