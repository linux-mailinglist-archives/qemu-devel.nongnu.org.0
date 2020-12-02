Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837022CB706
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:26:27 +0100 (CET)
Received: from localhost ([::1]:55294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNT0-0005Ra-IV
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCE-0002dN-2G
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC8-0003bq-Fo
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DK3EIciZtVrRaH9+199/U0VTPd8qnV1yWpeYRRu5FgU=;
 b=f058FMhnTFVpBLza6HOqp+to/3w4segP1xjcDt9aOzZ4yKMGUzFAdQukD4m7NUDTOCAGH+
 gnP9P/p86LUOz0RfLqc9vgJl0jXssvQuMqCxxgDN8wd5CfjQp5Y2Q1pwJAcBpZ9qMVTOLb
 aZ/d71lJf7uUp4ZXlaY2Pr83TAqK9+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-IHFNpkn2NryoBjCwboZkmw-1; Wed, 02 Dec 2020 03:08:58 -0500
X-MC-Unique: IHFNpkn2NryoBjCwboZkmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41CA61074641
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E0E75D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 018/113] hw/core/stream: Rename StreamSlave as StreamSink
Date: Wed,  2 Dec 2020 03:07:14 -0500
Message-Id: <20201202080849.4125477-19-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In order to use inclusive terminology, rename 'slave stream'
as 'sink stream'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <20200910070131.435543-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/stream.c              | 20 ++++++++---------
 hw/dma/xilinx_axidma.c        | 32 +++++++++++++--------------
 hw/net/xilinx_axienet.c       | 20 ++++++++---------
 hw/ssi/xilinx_spips.c         |  2 +-
 include/hw/ssi/xilinx_spips.h |  2 +-
 include/hw/stream.h           | 41 +++++++++++++++++------------------
 6 files changed, 58 insertions(+), 59 deletions(-)

diff --git a/hw/core/stream.c b/hw/core/stream.c
index a65ad1208d..19477d0f2d 100644
--- a/hw/core/stream.c
+++ b/hw/core/stream.c
@@ -3,32 +3,32 @@
 #include "qemu/module.h"
 
 size_t
-stream_push(StreamSlave *sink, uint8_t *buf, size_t len, bool eop)
+stream_push(StreamSink *sink, uint8_t *buf, size_t len, bool eop)
 {
-    StreamSlaveClass *k =  STREAM_SLAVE_GET_CLASS(sink);
+    StreamSinkClass *k =  STREAM_SINK_GET_CLASS(sink);
 
     return k->push(sink, buf, len, eop);
 }
 
 bool
-stream_can_push(StreamSlave *sink, StreamCanPushNotifyFn notify,
+stream_can_push(StreamSink *sink, StreamCanPushNotifyFn notify,
                 void *notify_opaque)
 {
-    StreamSlaveClass *k =  STREAM_SLAVE_GET_CLASS(sink);
+    StreamSinkClass *k =  STREAM_SINK_GET_CLASS(sink);
 
     return k->can_push ? k->can_push(sink, notify, notify_opaque) : true;
 }
 
-static const TypeInfo stream_slave_info = {
-    .name          = TYPE_STREAM_SLAVE,
+static const TypeInfo stream_sink_info = {
+    .name          = TYPE_STREAM_SINK,
     .parent        = TYPE_INTERFACE,
-    .class_size = sizeof(StreamSlaveClass),
+    .class_size = sizeof(StreamSinkClass),
 };
 
 
-static void stream_slave_register_types(void)
+static void stream_sink_register_types(void)
 {
-    type_register_static(&stream_slave_info);
+    type_register_static(&stream_sink_info);
 }
 
-type_init(stream_slave_register_types)
+type_init(stream_sink_register_types)
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 0a7f5acb4b..306da46699 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -128,8 +128,8 @@ struct XilinxAXIDMA {
     AddressSpace as;
 
     uint32_t freqhz;
-    StreamSlave *tx_data_dev;
-    StreamSlave *tx_control_dev;
+    StreamSink *tx_data_dev;
+    StreamSink *tx_control_dev;
     XilinxAXIDMAStreamSlave rx_data_dev;
     XilinxAXIDMAStreamSlave rx_control_dev;
 
@@ -261,8 +261,8 @@ static void stream_complete(struct Stream *s)
     ptimer_transaction_commit(s->ptimer);
 }
 
-static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
-                                 StreamSlave *tx_control_dev)
+static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
+                                 StreamSink *tx_control_dev)
 {
     uint32_t prev_d;
     uint32_t txlen;
@@ -384,7 +384,7 @@ static void xilinx_axidma_reset(DeviceState *dev)
 }
 
 static size_t
-xilinx_axidma_control_stream_push(StreamSlave *obj, unsigned char *buf,
+xilinx_axidma_control_stream_push(StreamSink *obj, unsigned char *buf,
                                   size_t len, bool eop)
 {
     XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
@@ -400,7 +400,7 @@ xilinx_axidma_control_stream_push(StreamSlave *obj, unsigned char *buf,
 }
 
 static bool
-xilinx_axidma_data_stream_can_push(StreamSlave *obj,
+xilinx_axidma_data_stream_can_push(StreamSink *obj,
                                    StreamCanPushNotifyFn notify,
                                    void *notify_opaque)
 {
@@ -417,7 +417,7 @@ xilinx_axidma_data_stream_can_push(StreamSlave *obj,
 }
 
 static size_t
-xilinx_axidma_data_stream_push(StreamSlave *obj, unsigned char *buf, size_t len,
+xilinx_axidma_data_stream_push(StreamSink *obj, unsigned char *buf, size_t len,
                                bool eop)
 {
     XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
@@ -588,9 +588,9 @@ static void xilinx_axidma_init(Object *obj)
 static Property axidma_properties[] = {
     DEFINE_PROP_UINT32("freqhz", XilinxAXIDMA, freqhz, 50000000),
     DEFINE_PROP_LINK("axistream-connected", XilinxAXIDMA,
-                     tx_data_dev, TYPE_STREAM_SLAVE, StreamSlave *),
+                     tx_data_dev, TYPE_STREAM_SINK, StreamSink *),
     DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIDMA,
-                     tx_control_dev, TYPE_STREAM_SLAVE, StreamSlave *),
+                     tx_control_dev, TYPE_STREAM_SINK, StreamSink *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -603,21 +603,21 @@ static void axidma_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, axidma_properties);
 }
 
-static StreamSlaveClass xilinx_axidma_data_stream_class = {
+static StreamSinkClass xilinx_axidma_data_stream_class = {
     .push = xilinx_axidma_data_stream_push,
     .can_push = xilinx_axidma_data_stream_can_push,
 };
 
-static StreamSlaveClass xilinx_axidma_control_stream_class = {
+static StreamSinkClass xilinx_axidma_control_stream_class = {
     .push = xilinx_axidma_control_stream_push,
 };
 
 static void xilinx_axidma_stream_class_init(ObjectClass *klass, void *data)
 {
-    StreamSlaveClass *ssc = STREAM_SLAVE_CLASS(klass);
+    StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
 
-    ssc->push = ((StreamSlaveClass *)data)->push;
-    ssc->can_push = ((StreamSlaveClass *)data)->can_push;
+    ssc->push = ((StreamSinkClass *)data)->push;
+    ssc->can_push = ((StreamSinkClass *)data)->can_push;
 }
 
 static const TypeInfo axidma_info = {
@@ -635,7 +635,7 @@ static const TypeInfo xilinx_axidma_data_stream_info = {
     .class_init    = xilinx_axidma_stream_class_init,
     .class_data    = &xilinx_axidma_data_stream_class,
     .interfaces = (InterfaceInfo[]) {
-        { TYPE_STREAM_SLAVE },
+        { TYPE_STREAM_SINK },
         { }
     }
 };
@@ -647,7 +647,7 @@ static const TypeInfo xilinx_axidma_control_stream_info = {
     .class_init    = xilinx_axidma_stream_class_init,
     .class_data    = &xilinx_axidma_control_stream_class,
     .interfaces = (InterfaceInfo[]) {
-        { TYPE_STREAM_SLAVE },
+        { TYPE_STREAM_SINK },
         { }
     }
 };
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index f8cf5290e1..9bccbe9be3 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -320,8 +320,8 @@ struct XilinxAXIEnet {
     SysBusDevice busdev;
     MemoryRegion iomem;
     qemu_irq irq;
-    StreamSlave *tx_data_dev;
-    StreamSlave *tx_control_dev;
+    StreamSink *tx_data_dev;
+    StreamSink *tx_control_dev;
     XilinxAXIEnetStreamSlave rx_data_dev;
     XilinxAXIEnetStreamSlave rx_control_dev;
     NICState *nic;
@@ -852,7 +852,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
 }
 
 static size_t
-xilinx_axienet_control_stream_push(StreamSlave *obj, uint8_t *buf, size_t len,
+xilinx_axienet_control_stream_push(StreamSink *obj, uint8_t *buf, size_t len,
                                    bool eop)
 {
     int i;
@@ -874,7 +874,7 @@ xilinx_axienet_control_stream_push(StreamSlave *obj, uint8_t *buf, size_t len,
 }
 
 static size_t
-xilinx_axienet_data_stream_push(StreamSlave *obj, uint8_t *buf, size_t size,
+xilinx_axienet_data_stream_push(StreamSink *obj, uint8_t *buf, size_t size,
                                 bool eop)
 {
     XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
@@ -1002,9 +1002,9 @@ static Property xilinx_enet_properties[] = {
     DEFINE_PROP_UINT32("txmem", XilinxAXIEnet, c_txmem, 0x1000),
     DEFINE_NIC_PROPERTIES(XilinxAXIEnet, conf),
     DEFINE_PROP_LINK("axistream-connected", XilinxAXIEnet,
-                     tx_data_dev, TYPE_STREAM_SLAVE, StreamSlave *),
+                     tx_data_dev, TYPE_STREAM_SINK, StreamSink *),
     DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIEnet,
-                     tx_control_dev, TYPE_STREAM_SLAVE, StreamSlave *),
+                     tx_control_dev, TYPE_STREAM_SINK, StreamSink *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1020,14 +1020,14 @@ static void xilinx_enet_class_init(ObjectClass *klass, void *data)
 static void xilinx_enet_control_stream_class_init(ObjectClass *klass,
                                                   void *data)
 {
-    StreamSlaveClass *ssc = STREAM_SLAVE_CLASS(klass);
+    StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
 
     ssc->push = xilinx_axienet_control_stream_push;
 }
 
 static void xilinx_enet_data_stream_class_init(ObjectClass *klass, void *data)
 {
-    StreamSlaveClass *ssc = STREAM_SLAVE_CLASS(klass);
+    StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
 
     ssc->push = xilinx_axienet_data_stream_push;
 }
@@ -1046,7 +1046,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
     .instance_size = sizeof(XilinxAXIEnetStreamSlave),
     .class_init    = xilinx_enet_data_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
-            { TYPE_STREAM_SLAVE },
+            { TYPE_STREAM_SINK },
             { }
     }
 };
@@ -1057,7 +1057,7 @@ static const TypeInfo xilinx_enet_control_stream_info = {
     .instance_size = sizeof(XilinxAXIEnetStreamSlave),
     .class_init    = xilinx_enet_control_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
-            { TYPE_STREAM_SLAVE },
+            { TYPE_STREAM_SINK },
             { }
     }
 };
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index dd8df9daf4..a897034601 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1354,7 +1354,7 @@ static void xlnx_zynqmp_qspips_init(Object *obj)
 {
     XlnxZynqMPQSPIPS *rq = XLNX_ZYNQMP_QSPIPS(obj);
 
-    object_property_add_link(obj, "stream-connected-dma", TYPE_STREAM_SLAVE,
+    object_property_add_link(obj, "stream-connected-dma", TYPE_STREAM_SINK,
                              (Object **)&rq->dma,
                              object_property_allow_set_link,
                              OBJ_PROP_LINK_STRONG);
diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
index b96de21b34..3eae73480e 100644
--- a/include/hw/ssi/xilinx_spips.h
+++ b/include/hw/ssi/xilinx_spips.h
@@ -99,7 +99,7 @@ typedef struct XilinxQSPIPS XilinxQSPIPS;
 struct XlnxZynqMPQSPIPS {
     XilinxQSPIPS parent_obj;
 
-    StreamSlave *dma;
+    StreamSink *dma;
     int gqspi_irqline;
 
     uint32_t regs[XLNX_ZYNQMP_SPIPS_R_MAX];
diff --git a/include/hw/stream.h b/include/hw/stream.h
index e39d5a5b55..f166facb09 100644
--- a/include/hw/stream.h
+++ b/include/hw/stream.h
@@ -3,51 +3,50 @@
 
 #include "qom/object.h"
 
-/* stream slave. Used until qdev provides a generic way.  */
-#define TYPE_STREAM_SLAVE "stream-slave"
+#define TYPE_STREAM_SINK "stream-sink"
 
-typedef struct StreamSlaveClass StreamSlaveClass;
-DECLARE_CLASS_CHECKERS(StreamSlaveClass, STREAM_SLAVE,
-                       TYPE_STREAM_SLAVE)
-#define STREAM_SLAVE(obj) \
-     INTERFACE_CHECK(StreamSlave, (obj), TYPE_STREAM_SLAVE)
+typedef struct StreamSinkClass StreamSinkClass;
+DECLARE_CLASS_CHECKERS(StreamSinkClass, STREAM_SINK,
+                       TYPE_STREAM_SINK)
+#define STREAM_SINK(obj) \
+     INTERFACE_CHECK(StreamSink, (obj), TYPE_STREAM_SINK)
 
-typedef struct StreamSlave StreamSlave;
+typedef struct StreamSink StreamSink;
 
 typedef void (*StreamCanPushNotifyFn)(void *opaque);
 
-struct StreamSlaveClass {
+struct StreamSinkClass {
     InterfaceClass parent;
     /**
-     * can push - determine if a stream slave is capable of accepting at least
+     * can push - determine if a stream sink is capable of accepting at least
      * one byte of data. Returns false if cannot accept. If not implemented, the
-     * slave is assumed to always be capable of receiving.
-     * @notify: Optional callback that the slave will call when the slave is
+     * sink is assumed to always be capable of receiving.
+     * @notify: Optional callback that the sink will call when the sink is
      * capable of receiving again. Only called if false is returned.
      * @notify_opaque: opaque data to pass to notify call.
      */
-    bool (*can_push)(StreamSlave *obj, StreamCanPushNotifyFn notify,
+    bool (*can_push)(StreamSink *obj, StreamCanPushNotifyFn notify,
                      void *notify_opaque);
     /**
-     * push - push data to a Stream slave. The number of bytes pushed is
-     * returned. If the slave short returns, the master must wait before trying
-     * again, the slave may continue to just return 0 waiting for the vm time to
+     * push - push data to a Stream sink. The number of bytes pushed is
+     * returned. If the sink short returns, the master must wait before trying
+     * again, the sink may continue to just return 0 waiting for the vm time to
      * advance. The can_push() function can be used to trap the point in time
-     * where the slave is ready to receive again, otherwise polling on a QEMU
+     * where the sink is ready to receive again, otherwise polling on a QEMU
      * timer will work.
-     * @obj: Stream slave to push to
+     * @obj: Stream sink to push to
      * @buf: Data to write
      * @len: Maximum number of bytes to write
      * @eop: End of packet flag
      */
-    size_t (*push)(StreamSlave *obj, unsigned char *buf, size_t len, bool eop);
+    size_t (*push)(StreamSink *obj, unsigned char *buf, size_t len, bool eop);
 };
 
 size_t
-stream_push(StreamSlave *sink, uint8_t *buf, size_t len, bool eop);
+stream_push(StreamSink *sink, uint8_t *buf, size_t len, bool eop);
 
 bool
-stream_can_push(StreamSlave *sink, StreamCanPushNotifyFn notify,
+stream_can_push(StreamSink *sink, StreamCanPushNotifyFn notify,
                 void *notify_opaque);
 
 
-- 
2.26.2



