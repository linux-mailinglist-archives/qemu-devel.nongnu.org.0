Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE919250B53
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 00:04:21 +0200 (CEST)
Received: from localhost ([::1]:43436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAKZg-0000qX-Rb
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 18:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVt-000723-VZ
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 18:00:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37201
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVq-0008Pr-EP
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 18:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598306421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcNxp53yekR481vFA4sH6Zr90u/ZpRn+Yyjgj1VxXWU=;
 b=L3CPTM2CbKE4+aBOxJqv23yiIJLjCEQhJ/EcDhbQlxBxCWOgSLQ3STlLo5mS9xiJ99Cwlb
 N5xGalywcXforDR8yADkQu8e5PcskoyYOI+IvVX3HIb/1egdqJ+1Em0pzR4JPC6hpRjeeE
 gyJDFVeIRUhEyHLJ/2FZVPVJXKhHvoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-TrNuOxSdPQKwYBO3Kd1Aow-1; Mon, 24 Aug 2020 18:00:18 -0400
X-MC-Unique: TrNuOxSdPQKwYBO3Kd1Aow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDE9B1006707;
 Mon, 24 Aug 2020 22:00:16 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBF3D18518;
 Mon, 24 Aug 2020 22:00:08 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] xilinx_axienet: Use typedef name for instance_size
Date: Mon, 24 Aug 2020 17:59:34 -0400
Message-Id: <20200824215936.2961951-5-ehabkost@redhat.com>
In-Reply-To: <20200824215936.2961951-1-ehabkost@redhat.com>
References: <20200824215936.2961951-1-ehabkost@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 16:48:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes the code consistent with the rest of QOM code in QEMU,
and will make automated conversion to type declaration macros
simpler.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/net/xilinx_axienet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 1e48eb70c9..ceb4652938 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -1069,7 +1069,7 @@ static const TypeInfo xilinx_enet_info = {
 static const TypeInfo xilinx_enet_data_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
+    .instance_size = sizeof(XilinxAXIEnetStreamSlave),
     .class_init    = xilinx_enet_data_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
             { TYPE_STREAM_SLAVE },
@@ -1080,7 +1080,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
 static const TypeInfo xilinx_enet_control_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
+    .instance_size = sizeof(XilinxAXIEnetStreamSlave),
     .class_init    = xilinx_enet_control_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
             { TYPE_STREAM_SLAVE },
-- 
2.26.2


