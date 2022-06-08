Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10157543216
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:01:42 +0200 (CEST)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywFh-0001Rb-2j
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8A-00014g-1u
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw88-0004KC-7n
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIR4X2xIdfxAIJB0SxOQJLJQgHmqPklerCbRLk+ujoI=;
 b=L9bwhLW5uOA8dypAs0h3dj7bffZNTHew8j0EcdtKGAPln0uq+Fj6wmjRGcLEwQwW5tMA8t
 h4pwsXRAjoT+4eFkCWrYP109Oy+4B7oDqlN90vkwyTbQ66rmsyHSwX0SWd/g1GLDfBwRPx
 HV9mG2t7c13WizoiTgAwpiWnUIykzsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-k--cpLRDNjSUoqEsdjCsUA-1; Wed, 08 Jun 2022 09:53:50 -0400
X-MC-Unique: k--cpLRDNjSUoqEsdjCsUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F397618E0044
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:49 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EF21C27E97;
 Wed,  8 Jun 2022 13:53:49 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 08/35] isa-bus: drop no longer used
 ISADeviceClass::build_aml
Date: Wed,  8 Jun 2022 09:53:13 -0400
Message-Id: <20220608135340.3304695-9-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/isa/isa.h |  1 -
 hw/isa/isa-bus.c     | 12 +-----------
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 034d706ba1..5c5a3d43a7 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -64,7 +64,6 @@ struct IsaDmaClass {
 
 struct ISADeviceClass {
     DeviceClass parent_class;
-    void (*build_aml)(ISADevice *dev, Aml *scope);
 };
 
 struct ISABus {
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 237e2cee12..1bee1a47f1 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -191,19 +191,9 @@ ISADevice *isa_vga_init(ISABus *bus)
 void isa_build_aml(ISABus *bus, Aml *scope)
 {
     BusChild *kid;
-    ISADevice *dev;
-    ISADeviceClass *dc;
 
     QTAILQ_FOREACH(kid, &bus->parent_obj.children, sibling) {
-        dev = ISA_DEVICE(kid->child);
-        dc = ISA_DEVICE_GET_CLASS(dev);
-        bool has_build_dev_aml = !!object_dynamic_cast(OBJECT(dev),
-                                                       TYPE_ACPI_DEV_AML_IF);
-        if (dc->build_aml) {
-            dc->build_aml(dev, scope);
-        } else if (has_build_dev_aml) {
-            call_dev_aml_func(DEVICE(dev), scope);
-        }
+        call_dev_aml_func(DEVICE(kid->child), scope);
     }
 }
 
-- 
2.31.1


