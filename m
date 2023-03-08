Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F26AFC17
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:19:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMQ-0006ki-G3; Tue, 07 Mar 2023 20:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMN-0006ZC-MU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiML-0001h0-UK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PlWCxBVoNHan2SX2kTcXYxvUjOFyDeTDnartL4mlgHo=;
 b=KX3akl/9itOLFE/L6jeo241Wcc7cQA9fVTl2TwYSbPLmuKH/tJF5a+6ZW77nxteAs2bNCa
 Tv23VjGMB8ZhMY31X8cTzAc+nSFb1v+vbdNbRP1sZfvfhrs5MkSKGf9wFmGlOBDfmCbPKU
 TFK+t0AROsj8I4dAZJfrA5BnuWZMn9c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-U3dNjJORNN2fSFCse5cIzQ-1; Tue, 07 Mar 2023 20:12:48 -0500
X-MC-Unique: U3dNjJORNN2fSFCse5cIzQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 h15-20020a056402280f00b004bf9e193c23so21674763ede.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PlWCxBVoNHan2SX2kTcXYxvUjOFyDeTDnartL4mlgHo=;
 b=QgumIlJsEzcLdG6V05KUnxN6HjG5y/eGm1+SQIlBr2C9bo7Ick6PBhb619JwEpqCFS
 GEBof3tnBQOzRf9aceYo4/9WK5Vbw8U9rvPTWfrUohxbBnHeChrJWUgUT/xiE4RYAbsA
 xdjgJSSoNLE/JcnzEmi/0MqtSlilwts/cyUqMLfMOOlPdwF8S0x+0KhNkwhDCmSr6n1U
 eywMSZanAvjnovDYbO/M2YXFHzhXWHN/TYlMWQk6vMr7slJhrGVft53cY8puBSNmz+le
 6au22OfgLna5KCzR+Qh4wXqeSRp6tXqHoSElWDuCnfEQI3whURIByjHS/trHxH1qFLdY
 lQCQ==
X-Gm-Message-State: AO0yUKWDcX+v0AbE/BYZOg9tF9gHnDYYR6qJPE+iiznhKRb5sbtokODq
 9oN7SCZmsBbyrhTcbYc0crgXTs7N/1/3xwjvHgqNmmV4+k5Apu/50ntEAyQbu0QTCRCXIcce7Za
 H0WXcZdUZ+VWisvqbrDgK5iFcl2496gngGCtucPxpqDcNOEBSZ0Py3HAGpz1PftqH0nwQ
X-Received: by 2002:a17:906:398a:b0:88d:d700:fe15 with SMTP id
 h10-20020a170906398a00b0088dd700fe15mr17185794eje.0.1678237966570; 
 Tue, 07 Mar 2023 17:12:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/CH/d/L+jYdGYP17viXUEFkNE5kBE5acnIQEE3+qopU9eT89gkmuw8lvV6YYYFVM9dIovbKA==
X-Received: by 2002:a17:906:398a:b0:88d:d700:fe15 with SMTP id
 h10-20020a170906398a00b0088dd700fe15mr17185781eje.0.1678237966322; 
 Tue, 07 Mar 2023 17:12:46 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 d26-20020a50f69a000000b004c0239e41d8sm7401286edn.81.2023.03.07.17.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:45 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 38/73] pci: fix 'hotplugglable' property behavior
Message-ID: <ceefa0b74674f32aeedb1e93bcb6ec9cb12842b1.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Currently the property may flip its state
during VM bring up or just doesn't work as
the name implies.

In particular with PCIE root port that has
'hotplug={on|off}' property, and when it's
turned off, one would expect
  'hotpluggable' == false
for any devices attached to it.
Which is not the case since qbus_is_hotpluggable()
used by the property just checks for presence
of any hotplug_handler set on bus.

The problem is that name BusState::hotplug_handler
from its inception is misnomer, as it handles
not only hotplug but also in many cases coldplug
as well (i.e. generic wiring interface), and
it's fine to have hotplug_handler set on bus
while it doesn't support hotplug (ex. pcie-slot
with hotplug=off).

Another case of root port flipping 'hotpluggable'
state when ACPI PCI hotplug is enabled in this
case root port with 'hotplug=off' starts as
hotpluggable and then later on, pcihp
hotplug_handler clears hotplug_handler
explicitly after checking root port's 'hotplug'
property.

So root-port hotpluggablity check sort of works
if pcihp is enabled but is broken if pcihp is
disabled.

One way to deal with the issue is to ask
hotplug_handler if bus it controls is hotpluggable
or not. To do that add is_hotpluggable_bus()
hook to HotplugHandler interface and use it in
'hotpluggable' property + teach pcie-slot to
actually look into 'hotplug' property state
before deciding if bus is hotpluggable.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-13-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/hotplug.h   |  2 ++
 include/hw/qdev-core.h | 13 ++++++++++++-
 hw/pci/pcie_port.c     |  8 ++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index e15f59c8b3..a9840ed485 100644
--- a/include/hw/hotplug.h
+++ b/include/hw/hotplug.h
@@ -48,6 +48,7 @@ typedef void (*hotplug_fn)(HotplugHandler *plug_handler,
  * @unplug: unplug callback.
  *          Used for device removal with devices that implement
  *          asynchronous and synchronous (surprise) removal.
+ * @is_hotpluggable_bus: called to check if bus/its parent allow hotplug on bus
  */
 struct HotplugHandlerClass {
     /* <private> */
@@ -58,6 +59,7 @@ struct HotplugHandlerClass {
     hotplug_fn plug;
     hotplug_fn unplug_request;
     hotplug_fn unplug;
+    bool (*is_hotpluggable_bus)(HotplugHandler *plug_handler, BusState *bus);
 };
 
 /**
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index f5b3b2f89a..bd50ad5ee1 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -812,7 +812,18 @@ void qbus_set_bus_hotplug_handler(BusState *bus);
 
 static inline bool qbus_is_hotpluggable(BusState *bus)
 {
-   return bus->hotplug_handler;
+    HotplugHandler *plug_handler = bus->hotplug_handler;
+    bool ret = !!plug_handler;
+
+    if (plug_handler) {
+        HotplugHandlerClass *hdc;
+
+        hdc = HOTPLUG_HANDLER_GET_CLASS(plug_handler);
+        if (hdc->is_hotpluggable_bus) {
+            ret = hdc->is_hotpluggable_bus(plug_handler, bus);
+        }
+    }
+    return ret;
 }
 
 /**
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index 65a397ad23..000633fec1 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -161,6 +161,13 @@ PCIDevice *pcie_find_port_by_pn(PCIBus *bus, uint8_t pn)
     return NULL;
 }
 
+static bool pcie_slot_is_hotpluggbale_bus(HotplugHandler *plug_handler,
+                                          BusState *bus)
+{
+    PCIESlot *s = PCIE_SLOT(bus->parent);
+    return s->hotplug;
+}
+
 static const TypeInfo pcie_port_type_info = {
     .name = TYPE_PCIE_PORT,
     .parent = TYPE_PCI_BRIDGE,
@@ -188,6 +195,7 @@ static void pcie_slot_class_init(ObjectClass *oc, void *data)
     hc->plug = pcie_cap_slot_plug_cb;
     hc->unplug = pcie_cap_slot_unplug_cb;
     hc->unplug_request = pcie_cap_slot_unplug_request_cb;
+    hc->is_hotpluggable_bus = pcie_slot_is_hotpluggbale_bus;
 }
 
 static const TypeInfo pcie_slot_type_info = {
-- 
MST


