Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350DA3E1CE2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:40:09 +0200 (CEST)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBjDs-000453-9R
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBj8r-0002KF-2k
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBj8p-0001y9-IS
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628192095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGw8Y2OllXWk7YmdMrYe/QzYgAXekcvmitSuVTHAMOQ=;
 b=XXLCQykNpYwVS7P/tKqN73uhtIZEQzi5tO4/Q/GZT9wGHBC7L0DKx5i/3eCWVxj+AY7rTX
 XPh+YdWepNWHUxK3gyufOYB4w5yvpOEJ+sjN7f+21JIURtGgyFg8OmgEvh60ZYzOSmHN6I
 fUEsQ7LNF7aOqCjHHMwzVKWefaNbfy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-GofwPpVTOmC68xN_JwP9yg-1; Thu, 05 Aug 2021 15:34:54 -0400
X-MC-Unique: GofwPpVTOmC68xN_JwP9yg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C89211800D41;
 Thu,  5 Aug 2021 19:34:52 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87EF267899;
 Thu,  5 Aug 2021 19:34:52 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 6/6] Use PCI_HOST_BRIDGE macro
Date: Thu,  5 Aug 2021 15:34:31 -0400
Message-Id: <20210805193431.307761-7-ehabkost@redhat.com>
In-Reply-To: <20210805193431.307761-1-ehabkost@redhat.com>
References: <20210805193431.307761-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OBJECT_CHECK(PciHostState, ..., TYPE_PCI_HOST_BRIDGE) is exactly
what the PCI_HOST_BRIDGE macro does.  We can just use the macro
instead of using OBJECT_CHECK manually.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org
---
 hw/i386/acpi-build.c | 8 ++------
 hw/pci-host/i440fx.c | 4 +---
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a33ac8b91e1..3c6bbb1beb3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -303,13 +303,9 @@ Object *acpi_get_i386_pci_host(void)
 {
     PCIHostState *host;
 
-    host = OBJECT_CHECK(PCIHostState,
-                        object_resolve_path("/machine/i440fx", NULL),
-                        TYPE_PCI_HOST_BRIDGE);
+    host = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
     if (!host) {
-        host = OBJECT_CHECK(PCIHostState,
-                            object_resolve_path("/machine/q35", NULL),
-                            TYPE_PCI_HOST_BRIDGE);
+        host = PCI_HOST_BRIDGE(object_resolve_path("/machine/q35", NULL));
     }
 
     return OBJECT(host);
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 28c9bae8994..cd87e21a9b2 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -316,9 +316,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
 
 PCIBus *find_i440fx(void)
 {
-    PCIHostState *s = OBJECT_CHECK(PCIHostState,
-                                   object_resolve_path("/machine/i440fx", NULL),
-                                   TYPE_PCI_HOST_BRIDGE);
+    PCIHostState *s = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
     return s ? s->bus : NULL;
 }
 
-- 
2.31.1


