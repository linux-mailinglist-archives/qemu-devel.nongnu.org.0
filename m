Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D905254F08
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 21:46:04 +0200 (CEST)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBNqV-0001vF-7F
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 15:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNU9-0008Aj-9S
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:22:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37470
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNU7-0000Wi-Ft
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598556174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZR2VgKuOzprKdj8I22bOLa1+1WcP7oX7JoHwTS66XwI=;
 b=Cc39FhfdNe8osWwJl3dUYtZIHd0l290Wz7K5s396FnLp+/xyZEMkSGEIYvpmEljqV+CJO2
 3fck0G/1bxCFuSDEvBJ1pq5BY87ui5uxoLEp2voEcXlhFz372v9917ci90kChYFdO/ngtI
 2U5REOjcnrxME2wfsqeWVgHMwPPV6c8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-9yK4OVMGNFiDff8fqwoo8Q-1; Thu, 27 Aug 2020 15:22:52 -0400
X-MC-Unique: 9yK4OVMGNFiDff8fqwoo8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FDAB101C2E0;
 Thu, 27 Aug 2020 19:22:51 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04358101417D;
 Thu, 27 Aug 2020 19:22:50 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 41/53] vfio/pci: Move QOM macros to header
Date: Thu, 27 Aug 2020 15:21:10 -0400
Message-Id: <20200827192122.658035-42-ehabkost@redhat.com>
In-Reply-To: <20200827192122.658035-1-ehabkost@redhat.com>
References: <20200827192122.658035-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:56:52
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make future conversion to OBJECT_DECLARE* easier.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Tested-By: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20200825192110.3528606-43-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/vfio/pci.h | 3 +++
 hw/vfio/pci.c | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 0da7a20a7e..3c0dca024b 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -113,6 +113,9 @@ typedef struct VFIOMSIXInfo {
     unsigned long *pending;
 } VFIOMSIXInfo;
 
+#define TYPE_VFIO_PCI "vfio-pci"
+#define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
+
 typedef struct VFIOPCIDevice {
     PCIDevice pdev;
     VFIODevice vbasedev;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 2e561c06d6..3611dcd38b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -42,9 +42,6 @@
 #include "qapi/error.h"
 #include "migration/blocker.h"
 
-#define TYPE_VFIO_PCI "vfio-pci"
-#define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
-
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
-- 
2.26.2


