Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80310476E4F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:53:05 +0100 (CET)
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnRg-0008Ar-Jz
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:53:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxnK7-0004aW-H1
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:45:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxnK4-0001N6-NT
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639647908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YbYmoRmG8XiSMDSihXDic8sQ+eeEe+s1WV84LmoTjdg=;
 b=XMJzlKZwByuJ/sr2DQ0c0XG2s62gznM23faYV6KS7u6fjYfq8AqoOMS8uEv2o0544euZbT
 sGc0iOGnwrmAwdq0SihXoLO9e/tWnW4fkxKr6CNRi28cVmcacDe9Cj8XT2ekYUE4bwEGTX
 6/BXiwQgOphqPA2z0G1Y7FKUrSVvpZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-U_Q758LqMW6mpj9JnhCwFg-1; Thu, 16 Dec 2021 04:45:00 -0500
X-MC-Unique: U_Q758LqMW6mpj9JnhCwFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 817FF801B0C;
 Thu, 16 Dec 2021 09:44:58 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68DDA10A403A;
 Thu, 16 Dec 2021 09:44:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] s390x/pci: add supported DT information to clp response
Date: Thu, 16 Dec 2021 10:44:45 +0100
Message-Id: <20211216094447.58496-7-thuth@redhat.com>
In-Reply-To: <20211216094447.58496-1-thuth@redhat.com>
References: <20211216094447.58496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

The DTSM is a mask that specifies which I/O Address Translation designation
types are supported.  Today QEMU only supports DT=1.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Message-Id: <20211203142706.427279-5-mjrosato@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-pci-bus.c         | 1 +
 hw/s390x/s390-pci-inst.c        | 1 +
 hw/s390x/s390-pci-vfio.c        | 1 +
 include/hw/s390x/s390-pci-bus.h | 1 +
 include/hw/s390x/s390-pci-clp.h | 3 ++-
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 1b51a72838..01b58ebc70 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -782,6 +782,7 @@ static void s390_pci_init_default_group(void)
     resgrp->i = 128;
     resgrp->maxstbl = 128;
     resgrp->version = 0;
+    resgrp->dtsm = ZPCI_DTSM;
 }
 
 static void set_pbdev_info(S390PCIBusDevice *pbdev)
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 07bab85ce5..6d400d4147 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -329,6 +329,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
         stw_p(&resgrp->i, group->zpci_group.i);
         stw_p(&resgrp->maxstbl, group->zpci_group.maxstbl);
         resgrp->version = group->zpci_group.version;
+        resgrp->dtsm = group->zpci_group.dtsm;
         stw_p(&resgrp->hdr.rsp, CLP_RC_OK);
         break;
     }
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 2a153fa8c9..6f80a47e29 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -160,6 +160,7 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
         resgrp->i = cap->noi;
         resgrp->maxstbl = cap->maxstbl;
         resgrp->version = cap->version;
+        resgrp->dtsm = ZPCI_DTSM;
     }
 }
 
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 2727e7bdef..da3cde2bb4 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -37,6 +37,7 @@
 #define ZPCI_MAX_UID 0xffff
 #define UID_UNDEFINED 0
 #define UID_CHECKING_ENABLED 0x01
+#define ZPCI_DTSM 0x40
 
 OBJECT_DECLARE_SIMPLE_TYPE(S390pciState, S390_PCI_HOST_BRIDGE)
 OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBus, S390_PCI_BUS)
diff --git a/include/hw/s390x/s390-pci-clp.h b/include/hw/s390x/s390-pci-clp.h
index 96b8e3f133..cc8c8662b8 100644
--- a/include/hw/s390x/s390-pci-clp.h
+++ b/include/hw/s390x/s390-pci-clp.h
@@ -163,7 +163,8 @@ typedef struct ClpRspQueryPciGrp {
     uint8_t fr;
     uint16_t maxstbl;
     uint16_t mui;
-    uint64_t reserved3;
+    uint8_t dtsm;
+    uint8_t reserved3[7];
     uint64_t dasm; /* dma address space mask */
     uint64_t msia; /* MSI address */
     uint64_t reserved4;
-- 
2.27.0


