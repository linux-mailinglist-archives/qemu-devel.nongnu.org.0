Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8367A25B6AC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:49:16 +0200 (CEST)
Received: from localhost ([::1]:59990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbZ5-0002An-J2
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbUC-0002F1-JW
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:44:12 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37079
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbUA-0008LW-RJ
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwtDvCHQzjINymb31Ge9PCZIU0/FWVcz5SJd4ITY3yk=;
 b=RL1h9WMNgVUn5qFO+G21wn6tcG5Wd2gKo3ukkIi1z58p97FH8VhkZjBQKgq+1+faUrdIWu
 afg1zCmwct9ZLg//fGPcyDziFSeTEcwONG7e0tfQQWgny9Vz6iCGDioQAgj63xTWOK6l0y
 SLV9eNhWIKcuseuI+g+q38rYmnsLdrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-um_Uo9j-MziSkLKhsX_KCQ-1; Wed, 02 Sep 2020 18:44:08 -0400
X-MC-Unique: um_Uo9j-MziSkLKhsX_KCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E680801AB3
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 22:44:07 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DAAE5C1C4;
 Wed,  2 Sep 2020 22:44:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/63] i8259: Rename TYPE_I8259 to TYPE_PIC
Date: Wed,  2 Sep 2020 18:42:23 -0400
Message-Id: <20200902224311.1321159-16-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 17:54:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make the type name constant consistent with the name of
the type checking macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/intc/i8259.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 344fd04db1..e536cc90be 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -37,10 +37,10 @@
 
 //#define DEBUG_IRQ_LATENCY
 
-#define TYPE_I8259 "isa-i8259"
+#define TYPE_PIC "isa-i8259"
 typedef struct PICClass PICClass;
 DECLARE_CLASS_CHECKERS(PICClass, PIC,
-                       TYPE_I8259)
+                       TYPE_PIC)
 
 /**
  * PICClass:
@@ -418,7 +418,7 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
 
     irq_set = g_new0(qemu_irq, ISA_NUM_IRQS);
 
-    isadev = i8259_init_chip(TYPE_I8259, bus, true);
+    isadev = i8259_init_chip(TYPE_PIC, bus, true);
     dev = DEVICE(isadev);
 
     qdev_connect_gpio_out(dev, 0, parent_irq);
@@ -428,7 +428,7 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
 
     isa_pic = dev;
 
-    isadev = i8259_init_chip(TYPE_I8259, bus, false);
+    isadev = i8259_init_chip(TYPE_PIC, bus, false);
     dev = DEVICE(isadev);
 
     qdev_connect_gpio_out(dev, 0, irq_set[2]);
@@ -451,7 +451,7 @@ static void i8259_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo i8259_info = {
-    .name       = TYPE_I8259,
+    .name       = TYPE_PIC,
     .instance_size = sizeof(PICCommonState),
     .parent     = TYPE_PIC_COMMON,
     .class_init = i8259_class_init,
-- 
2.26.2


