Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCAE253792
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 20:51:53 +0200 (CEST)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kB0WW-00009f-Cg
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 14:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kB0Oo-0007Lm-F6
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 14:43:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29172
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kB0Om-0001FX-TB
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 14:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598467432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yUF21lID5frTeFIkxW7esBOgNiYWjKfb8DS+qbDs9Lw=;
 b=PO81X7uviC0vUAwrlbl2leuFibwqGLzaQMq6ni0dNOmvuFew7zHjESW4Qw4pKqSwvknjJl
 DcGL4fuY05AsuQjwBTg6r/z2ojlHEZ9pd1egDsBAo6AVzQKfGeJx+xDxD8sEHqyr0hrzmO
 nmGFpkHSqHxf0gRxDTqJnfgysDWLonk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-E755Vm6LPS6Obukdh_oO-g-1; Wed, 26 Aug 2020 14:43:50 -0400
X-MC-Unique: E755Vm6LPS6Obukdh_oO-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E6BA801FDD;
 Wed, 26 Aug 2020 18:43:49 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D943419C58;
 Wed, 26 Aug 2020 18:43:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] ppce500: Use TYPE_PPC_E500_PCI_BRIDGE constant
Date: Wed, 26 Aug 2020 14:43:33 -0400
Message-Id: <20200826184334.4120620-8-ehabkost@redhat.com>
In-Reply-To: <20200826184334.4120620-1-ehabkost@redhat.com>
References: <20200826184334.4120620-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
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
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make future conversion to use OBJECT_DECLARE* easier.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/pci-host/ppce500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index d71072731d..1a62b2f8cc 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -509,7 +509,7 @@ static void e500_host_bridge_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo e500_host_bridge_info = {
-    .name          = "e500-host-bridge",
+    .name          = TYPE_PPC_E500_PCI_BRIDGE,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PPCE500PCIBridgeState),
     .class_init    = e500_host_bridge_class_init,
-- 
2.26.2


