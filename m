Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC872CB71C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:29:19 +0100 (CET)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNVm-0000cg-SM
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCE-0002dq-9C
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC9-0003cX-Fs
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MXjDOXHDIyBqwYCJpRrsniTCCq9tpSl6Jq6PfcwZO4=;
 b=e8bJqsBFPGExQkqKnfM1K2AsC9ghQVK0Ebp3b4o1O/bmw4kf/BZ3HNQoQY2cPUsZQnslmv
 hzQrbMm0MEWHQqGMrXcNH7KkSKnwH30eGnvsAfA3tFYUFgEGhcOvN3PMS4md7FKc6F/le5
 1ikiLp7KlKWj0Uv1AIuOiosZDaGrH9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-6J0Nxw3tOJSw1HfG4NdAIg-1; Wed, 02 Dec 2020 03:08:59 -0500
X-MC-Unique: 6J0Nxw3tOJSw1HfG4NdAIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25C2F1006C83
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E88125C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 020/113] hw/net/xilinx_axienet: Rename StreamSlave as StreamSink
Date: Wed,  2 Dec 2020 03:07:16 -0500
Message-Id: <20201202080849.4125477-21-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Message-Id: <20200910070131.435543-5-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/net/xilinx_axienet.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 9bccbe9be3..990ff3a1c2 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -45,11 +45,11 @@
 
 OBJECT_DECLARE_SIMPLE_TYPE(XilinxAXIEnet, XILINX_AXI_ENET)
 
-typedef struct XilinxAXIEnetStreamSlave XilinxAXIEnetStreamSlave;
-DECLARE_INSTANCE_CHECKER(XilinxAXIEnetStreamSlave, XILINX_AXI_ENET_DATA_STREAM,
+typedef struct XilinxAXIEnetStreamSink XilinxAXIEnetStreamSink;
+DECLARE_INSTANCE_CHECKER(XilinxAXIEnetStreamSink, XILINX_AXI_ENET_DATA_STREAM,
                          TYPE_XILINX_AXI_ENET_DATA_STREAM)
 
-DECLARE_INSTANCE_CHECKER(XilinxAXIEnetStreamSlave, XILINX_AXI_ENET_CONTROL_STREAM,
+DECLARE_INSTANCE_CHECKER(XilinxAXIEnetStreamSink, XILINX_AXI_ENET_CONTROL_STREAM,
                          TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
 
 /* Advertisement control register. */
@@ -310,7 +310,7 @@ struct TEMAC  {
 };
 
 
-struct XilinxAXIEnetStreamSlave {
+struct XilinxAXIEnetStreamSink {
     Object parent;
 
     struct XilinxAXIEnet *enet;
@@ -322,8 +322,8 @@ struct XilinxAXIEnet {
     qemu_irq irq;
     StreamSink *tx_data_dev;
     StreamSink *tx_control_dev;
-    XilinxAXIEnetStreamSlave rx_data_dev;
-    XilinxAXIEnetStreamSlave rx_control_dev;
+    XilinxAXIEnetStreamSink rx_data_dev;
+    XilinxAXIEnetStreamSink rx_control_dev;
     NICState *nic;
     NICConf conf;
 
@@ -856,7 +856,7 @@ xilinx_axienet_control_stream_push(StreamSink *obj, uint8_t *buf, size_t len,
                                    bool eop)
 {
     int i;
-    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
+    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
     XilinxAXIEnet *s = cs->enet;
 
     assert(eop);
@@ -877,7 +877,7 @@ static size_t
 xilinx_axienet_data_stream_push(StreamSink *obj, uint8_t *buf, size_t size,
                                 bool eop)
 {
-    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
+    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
     XilinxAXIEnet *s = ds->enet;
 
     /* TX enable ?  */
@@ -951,8 +951,8 @@ static NetClientInfo net_xilinx_enet_info = {
 static void xilinx_enet_realize(DeviceState *dev, Error **errp)
 {
     XilinxAXIEnet *s = XILINX_AXI_ENET(dev);
-    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
-    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(
+    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
+    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(
                                                             &s->rx_control_dev);
 
     object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
@@ -1043,7 +1043,7 @@ static const TypeInfo xilinx_enet_info = {
 static const TypeInfo xilinx_enet_data_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(XilinxAXIEnetStreamSlave),
+    .instance_size = sizeof(XilinxAXIEnetStreamSink),
     .class_init    = xilinx_enet_data_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
             { TYPE_STREAM_SINK },
@@ -1054,7 +1054,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
 static const TypeInfo xilinx_enet_control_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(XilinxAXIEnetStreamSlave),
+    .instance_size = sizeof(XilinxAXIEnetStreamSink),
     .class_init    = xilinx_enet_control_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
             { TYPE_STREAM_SINK },
-- 
2.26.2



