Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEDD24AC1C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:25:22 +0200 (CEST)
Received: from localhost ([::1]:58884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YOP-0000b8-Dl
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDg-0007ft-LP
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20297
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YDe-0002TJ-Tk
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gB3FlwEyN+zkD4aAVdZIQg0j2M3c4bun4Jat7foOH/k=;
 b=hE767j6lK1BNmitpDxOUF/QdR6oGv2Wc+0xMZV6/QnJJDmihFz2/5KMztYxKTcblEGkppN
 WFhyePCOAW0tlSQy9JnqY89/lnRB0lDCRH7QdGAcrjhEYjXUeFWP9Vnvs+QpNzrvIkJT6r
 GhmyuQTIgwnIchMWQNC8PkMAy1QSbAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-wRWBvVdXOAiyNenSJAma2Q-1; Wed, 19 Aug 2020 20:14:12 -0400
X-MC-Unique: wRWBvVdXOAiyNenSJAma2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D4A71084CA1;
 Thu, 20 Aug 2020 00:14:11 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 915E87AEC4;
 Thu, 20 Aug 2020 00:14:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/58] piix: Move QOM macros to header
Date: Wed, 19 Aug 2020 20:12:14 -0400
Message-Id: <20200820001236.1284548-37-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:13:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make future conversion to OBJECT_DECLARE* easier.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v1 -> v2: new patch in series v2

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: "Hervé Poussineau" <hpoussin@reactos.org>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: qemu-devel@nongnu.org
---
 include/hw/southbridge/piix.h | 4 ++++
 hw/isa/piix3.c                | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 02bd741209..ac1d04ddc2 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -64,6 +64,10 @@ typedef struct PIIXState {
     MemoryRegion rcr_mem;
 } PIIX3State;
 
+#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
+#define PIIX3_PCI_DEVICE(obj) \
+    OBJECT_CHECK(PIIX3State, (obj), TYPE_PIIX3_PCI_DEVICE)
+
 extern PCIDevice *piix4_dev;
 
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 1a5267e19f..587850b888 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -36,10 +36,6 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
-#define PIIX3_PCI_DEVICE(obj) \
-    OBJECT_CHECK(PIIX3State, (obj), TYPE_PIIX3_PCI_DEVICE)
-
 #define TYPE_PIIX3_DEVICE "PIIX3"
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 
-- 
2.26.2


