Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C2B3A2444
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:08:44 +0200 (CEST)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDrv-0003q3-Mt
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDiP-0002yb-HH
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDiL-0001cl-Ao
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623304728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2N0mgQnSR8oAerjxg2YBYHZ3p88z8Ru0HgqydZqU+xg=;
 b=VpsoBE6+zN+8YLul/IDfbHzfwZO+/aRfh38MHQO6pyFWoBgnvOyAjUGnbEiQauVeDcUqs+
 yxkNCRVU4/O10hldy8GSf0SW/C1ISdxDuuRyxrRulfhKlS1DXATdeGRdiqWkBxzd/wr/dh
 ruahH+V46Dr8B3QswtJLJKDGAn0gsbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-lGi-i7rIMsinFhH2JSRMrw-1; Thu, 10 Jun 2021 01:58:47 -0400
X-MC-Unique: lGi-i7rIMsinFhH2JSRMrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7536801B19;
 Thu, 10 Jun 2021 05:58:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE9C018A69;
 Thu, 10 Jun 2021 05:58:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7F9D918009C4; Thu, 10 Jun 2021 07:57:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/18] modules: add virtio-gpu module annotations
Date: Thu, 10 Jun 2021 07:57:41 +0200
Message-Id: <20210610055755.538119-5-kraxel@redhat.com>
In-Reply-To: <20210610055755.538119-1-kraxel@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/vhost-user-gpu-pci.c | 1 +
 hw/display/vhost-user-gpu.c     | 1 +
 hw/display/vhost-user-vga.c     | 1 +
 hw/display/virtio-gpu-base.c    | 1 +
 hw/display/virtio-gpu-gl.c      | 3 +++
 hw/display/virtio-gpu-pci-gl.c  | 3 +++
 hw/display/virtio-gpu-pci.c     | 2 ++
 hw/display/virtio-gpu.c         | 1 +
 hw/display/virtio-vga-gl.c      | 3 +++
 hw/display/virtio-vga.c         | 2 ++
 10 files changed, 18 insertions(+)

diff --git a/hw/display/vhost-user-gpu-pci.c b/hw/display/vhost-user-gpu-pci.c
index a02b23ecaf11..daefcf710159 100644
--- a/hw/display/vhost-user-gpu-pci.c
+++ b/hw/display/vhost-user-gpu-pci.c
@@ -43,6 +43,7 @@ static const VirtioPCIDeviceTypeInfo vhost_user_gpu_pci_info = {
     .instance_size = sizeof(VhostUserGPUPCI),
     .instance_init = vhost_user_gpu_pci_initfn,
 };
+module_obj(TYPE_VHOST_USER_GPU_PCI);
 
 static void vhost_user_gpu_pci_register_types(void)
 {
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 6cdaa1c73b9b..32ef0061f924 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -596,6 +596,7 @@ static const TypeInfo vhost_user_gpu_info = {
     .instance_finalize = vhost_user_gpu_instance_finalize,
     .class_init = vhost_user_gpu_class_init,
 };
+module_obj(TYPE_VHOST_USER_GPU);
 
 static void vhost_user_gpu_register_types(void)
 {
diff --git a/hw/display/vhost-user-vga.c b/hw/display/vhost-user-vga.c
index a34a99856d73..072c9c65bc75 100644
--- a/hw/display/vhost-user-vga.c
+++ b/hw/display/vhost-user-vga.c
@@ -44,6 +44,7 @@ static const VirtioPCIDeviceTypeInfo vhost_user_vga_info = {
     .instance_size = sizeof(VhostUserVGA),
     .instance_init = vhost_user_vga_inst_initfn,
 };
+module_obj(TYPE_VHOST_USER_VGA);
 
 static void vhost_user_vga_register_types(void)
 {
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index dd294276cb38..c8da4806e0bb 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -256,6 +256,7 @@ static const TypeInfo virtio_gpu_base_info = {
     .class_init = virtio_gpu_base_class_init,
     .abstract = true
 };
+module_obj(TYPE_VIRTIO_GPU_BASE);
 
 static void
 virtio_register_types(void)
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index d971b480806a..7ab93bf8c829 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -154,6 +154,7 @@ static const TypeInfo virtio_gpu_gl_info = {
     .instance_size = sizeof(VirtIOGPUGL),
     .class_init = virtio_gpu_gl_class_init,
 };
+module_obj(TYPE_VIRTIO_GPU_GL);
 
 static void virtio_register_types(void)
 {
@@ -161,3 +162,5 @@ static void virtio_register_types(void)
 }
 
 type_init(virtio_register_types)
+
+module_dep("hw-display-virtio-gpu");
diff --git a/hw/display/virtio-gpu-pci-gl.c b/hw/display/virtio-gpu-pci-gl.c
index 902dda345275..99b14a07185e 100644
--- a/hw/display/virtio-gpu-pci-gl.c
+++ b/hw/display/virtio-gpu-pci-gl.c
@@ -46,6 +46,7 @@ static const VirtioPCIDeviceTypeInfo virtio_gpu_gl_pci_info = {
     .instance_size = sizeof(VirtIOGPUGLPCI),
     .instance_init = virtio_gpu_gl_initfn,
 };
+module_obj(TYPE_VIRTIO_GPU_GL_PCI);
 
 static void virtio_gpu_gl_pci_register_types(void)
 {
@@ -53,3 +54,5 @@ static void virtio_gpu_gl_pci_register_types(void)
 }
 
 type_init(virtio_gpu_gl_pci_register_types)
+
+module_dep("hw-display-virtio-gpu-pci");
diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index d742a30aecf7..e36eee0c409b 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -64,6 +64,7 @@ static const TypeInfo virtio_gpu_pci_base_info = {
     .class_init = virtio_gpu_pci_base_class_init,
     .abstract = true
 };
+module_obj(TYPE_VIRTIO_GPU_PCI_BASE);
 
 #define TYPE_VIRTIO_GPU_PCI "virtio-gpu-pci"
 typedef struct VirtIOGPUPCI VirtIOGPUPCI;
@@ -90,6 +91,7 @@ static const VirtioPCIDeviceTypeInfo virtio_gpu_pci_info = {
     .instance_size = sizeof(VirtIOGPUPCI),
     .instance_init = virtio_gpu_initfn,
 };
+module_obj(TYPE_VIRTIO_GPU_PCI);
 
 static void virtio_gpu_pci_register_types(void)
 {
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 4d549377cbc1..68fd607c2711 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1419,6 +1419,7 @@ static const TypeInfo virtio_gpu_info = {
     .class_size = sizeof(VirtIOGPUClass),
     .class_init = virtio_gpu_class_init,
 };
+module_obj(TYPE_VIRTIO_GPU);
 
 static void virtio_register_types(void)
 {
diff --git a/hw/display/virtio-vga-gl.c b/hw/display/virtio-vga-gl.c
index c971340ebb1a..f22549097c5e 100644
--- a/hw/display/virtio-vga-gl.c
+++ b/hw/display/virtio-vga-gl.c
@@ -36,6 +36,7 @@ static VirtioPCIDeviceTypeInfo virtio_vga_gl_info = {
     .instance_size = sizeof(VirtIOVGAGL),
     .instance_init = virtio_vga_gl_inst_initfn,
 };
+module_obj(TYPE_VIRTIO_VGA_GL);
 
 static void virtio_vga_register_types(void)
 {
@@ -45,3 +46,5 @@ static void virtio_vga_register_types(void)
 }
 
 type_init(virtio_vga_register_types)
+
+module_dep("hw-display-virtio-vga");
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index d3c640406152..9e57f61e9edb 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -239,6 +239,7 @@ static TypeInfo virtio_vga_base_info = {
     .class_init    = virtio_vga_base_class_init,
     .abstract      = true,
 };
+module_obj(TYPE_VIRTIO_VGA_BASE);
 
 #define TYPE_VIRTIO_VGA "virtio-vga"
 
@@ -268,6 +269,7 @@ static VirtioPCIDeviceTypeInfo virtio_vga_info = {
     .instance_size = sizeof(VirtIOVGA),
     .instance_init = virtio_vga_inst_initfn,
 };
+module_obj(TYPE_VIRTIO_VGA);
 
 static void virtio_vga_register_types(void)
 {
-- 
2.31.1


