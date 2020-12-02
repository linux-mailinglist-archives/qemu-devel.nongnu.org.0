Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECBF2CB6FE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:24:35 +0100 (CET)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNRB-0003E8-PM
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCD-0002ce-Ja
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC8-0003cQ-TP
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWs2M5k9MSBHbsukGasGcnZzCIKnS2VFmg41YjLrWf0=;
 b=L31NQidJtpRLabOeSBCK1jkN4IX5pkAPkGLb0Rpf0uhxRPSXGec8y4GoVONgb3PshQpAV9
 nafq3BY8OLTFZWZHI00TVOU52IfSUYy/4yy9MnIHrvIowxX36g6YftvwOsn0nCfY+CDE2C
 +B0HMjo6UkiDCLZKy7rLfa7ADqXyx5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-ihp7_tPiNIGw9fPNTPjKvg-1; Wed, 02 Dec 2020 03:08:58 -0500
X-MC-Unique: ihp7_tPiNIGw9fPNTPjKvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90D775708E
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E1035D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 019/113] hw/dma/xilinx_axidma: Rename StreamSlave as StreamSink
Date: Wed,  2 Dec 2020 03:07:15 -0500
Message-Id: <20201202080849.4125477-20-pbonzini@redhat.com>
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
Message-Id: <20200910070131.435543-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/dma/xilinx_axidma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 306da46699..bc383f53cc 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -45,11 +45,11 @@
 
 OBJECT_DECLARE_SIMPLE_TYPE(XilinxAXIDMA, XILINX_AXI_DMA)
 
-typedef struct XilinxAXIDMAStreamSlave XilinxAXIDMAStreamSlave;
-DECLARE_INSTANCE_CHECKER(XilinxAXIDMAStreamSlave, XILINX_AXI_DMA_DATA_STREAM,
+typedef struct XilinxAXIDMAStreamSink XilinxAXIDMAStreamSink;
+DECLARE_INSTANCE_CHECKER(XilinxAXIDMAStreamSink, XILINX_AXI_DMA_DATA_STREAM,
                          TYPE_XILINX_AXI_DMA_DATA_STREAM)
 
-DECLARE_INSTANCE_CHECKER(XilinxAXIDMAStreamSlave, XILINX_AXI_DMA_CONTROL_STREAM,
+DECLARE_INSTANCE_CHECKER(XilinxAXIDMAStreamSink, XILINX_AXI_DMA_CONTROL_STREAM,
                          TYPE_XILINX_AXI_DMA_CONTROL_STREAM)
 
 #define R_DMACR             (0x00 / 4)
@@ -115,7 +115,7 @@ struct Stream {
     unsigned char txbuf[16 * 1024];
 };
 
-struct XilinxAXIDMAStreamSlave {
+struct XilinxAXIDMAStreamSink {
     Object parent;
 
     struct XilinxAXIDMA *dma;
@@ -130,8 +130,8 @@ struct XilinxAXIDMA {
     uint32_t freqhz;
     StreamSink *tx_data_dev;
     StreamSink *tx_control_dev;
-    XilinxAXIDMAStreamSlave rx_data_dev;
-    XilinxAXIDMAStreamSlave rx_control_dev;
+    XilinxAXIDMAStreamSink rx_data_dev;
+    XilinxAXIDMAStreamSink rx_control_dev;
 
     struct Stream streams[2];
 
@@ -387,7 +387,7 @@ static size_t
 xilinx_axidma_control_stream_push(StreamSink *obj, unsigned char *buf,
                                   size_t len, bool eop)
 {
-    XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
+    XilinxAXIDMAStreamSink *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
     struct Stream *s = &cs->dma->streams[1];
 
     if (len != CONTROL_PAYLOAD_SIZE) {
@@ -404,7 +404,7 @@ xilinx_axidma_data_stream_can_push(StreamSink *obj,
                                    StreamCanPushNotifyFn notify,
                                    void *notify_opaque)
 {
-    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
+    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
     struct Stream *s = &ds->dma->streams[1];
 
     if (!stream_running(s) || stream_idle(s)) {
@@ -420,7 +420,7 @@ static size_t
 xilinx_axidma_data_stream_push(StreamSink *obj, unsigned char *buf, size_t len,
                                bool eop)
 {
-    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
+    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
     struct Stream *s = &ds->dma->streams[1];
     size_t ret;
 
@@ -531,8 +531,8 @@ static const MemoryRegionOps axidma_ops = {
 static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
 {
     XilinxAXIDMA *s = XILINX_AXI_DMA(dev);
-    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
-    XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(
+    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
+    XilinxAXIDMAStreamSink *cs = XILINX_AXI_DMA_CONTROL_STREAM(
                                                             &s->rx_control_dev);
     int i;
 
@@ -631,7 +631,7 @@ static const TypeInfo axidma_info = {
 static const TypeInfo xilinx_axidma_data_stream_info = {
     .name          = TYPE_XILINX_AXI_DMA_DATA_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(XilinxAXIDMAStreamSlave),
+    .instance_size = sizeof(XilinxAXIDMAStreamSink),
     .class_init    = xilinx_axidma_stream_class_init,
     .class_data    = &xilinx_axidma_data_stream_class,
     .interfaces = (InterfaceInfo[]) {
@@ -643,7 +643,7 @@ static const TypeInfo xilinx_axidma_data_stream_info = {
 static const TypeInfo xilinx_axidma_control_stream_info = {
     .name          = TYPE_XILINX_AXI_DMA_CONTROL_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(XilinxAXIDMAStreamSlave),
+    .instance_size = sizeof(XilinxAXIDMAStreamSink),
     .class_init    = xilinx_axidma_stream_class_init,
     .class_data    = &xilinx_axidma_control_stream_class,
     .interfaces = (InterfaceInfo[]) {
-- 
2.26.2



