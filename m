Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AB53AC2BE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:03:30 +0200 (CEST)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6fB-00005I-NO
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6Wd-0003q5-SS
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6WY-0003jd-UZ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCfphQnaNiqR1/QATqQu0QjJBywC8Yh+FbFnjQ/wVks=;
 b=MlIzcWyEg56xNPWsJ++FMb0MsO8kGFH1HqcKa6jUIA0ECgzwxAOIxOYfBnfbCmT6h+tucc
 54aJBlcZLFxXlV/YipiUE83X8MKE0AgInarjG6kzU4ZFYYF4VVyy+fBQCTEeiw+lb8R0H0
 arngmv6OevxxauCPco17i3h2bvHdXx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-mQ3JwwOTOnmmwx4TQnU8Yw-1; Fri, 18 Jun 2021 00:54:33 -0400
X-MC-Unique: mQ3JwwOTOnmmwx4TQnU8Yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7231210C1ADC;
 Fri, 18 Jun 2021 04:54:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93BDA5D9CD;
 Fri, 18 Jun 2021 04:54:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4558F18017CC; Fri, 18 Jun 2021 06:53:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/24] modules: add virtio-gpu module annotations
Date: Fri, 18 Jun 2021 06:53:34 +0200
Message-Id: <20210618045353.2510174-6-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
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
index e183f4ecdaa5..6b7f643951fe 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1427,6 +1427,7 @@ static const TypeInfo virtio_gpu_info = {
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


