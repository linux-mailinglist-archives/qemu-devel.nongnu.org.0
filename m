Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8283C15DD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:21:58 +0200 (CEST)
Received: from localhost ([::1]:51986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vqf-0000MS-Qt
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmt-00009C-Ha
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:03 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmp-0008AB-CU
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:02 -0400
Received: by mail-ej1-x62c.google.com with SMTP id c17so10204102ejk.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=94LCAE4ceYQlyXBVtpM8bDwMiwPhoV4FVrQoWyiA45s=;
 b=mN8OXGLhMWvb91/Vfor+jPKCjZNlikZ6nwaPGAitAxniEQrcCQBM8C/sFwMvgYq3Uo
 KqDkfSeLoobJl3DzR2i5ZI0e4XUpmPGka3Ioc7meVIMz1VnCm+65fjmV4BOXFirlDhCV
 v0Wff38xfIh3Iibbv0ZpwkFTs4IPIVw8CBwN0OwHRkkPoCtjbZ8/78r7QQxGyoKhNadE
 tJ3sFPnJam6lRW9iBX6U8AdOhaUkMf1Igi9GUZyPVS2APRfsVM3xFF4F6HN8gJbfpvbd
 Y526pU7ywUgIKSbwgAmNekucn1tsAueya2AnYzKW7iRCAf60pQfpg8BC/GED45F66j9p
 H6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=94LCAE4ceYQlyXBVtpM8bDwMiwPhoV4FVrQoWyiA45s=;
 b=dlI/RHNJ5wsrxyP8uY92vYoX5MstlClLDeJbZybSyq43cBRh3f2rzRDTjw0+Nsg3Ui
 gcy7QFDdSon/eD6ZJctY8rZ1OYxMZ/u2lUMskEZsNbKaV0jyg6BQIraY2KJJI0FHFxln
 Qrzdncd7HD5H7xxp7LSmN6kmtTBh7oobNS0ny+cDPMsLcyrnLej1Jl0NGmFhFNUWfdKA
 Kbv5GlA3CD+zMBHnRBIkIYA1ZPO1iYEWc8XERtU6YBZqmlHDFwS/qLxqdVZ6ulTVAE70
 kUM7I05CBZl3bl4z+133fYCt61l4Y6iBUKox/74Uvxla8EBJaa6ZbWHyG6jwu81OB/j+
 JRtQ==
X-Gm-Message-State: AOAM530MGuopc6ioNYb8aNLT8zGyFknQwfidN4ooU8bz05CAzdVOgx4C
 KdPmGwM7sZlig9dFZ8VrV2z/7QqvbYs=
X-Google-Smtp-Source: ABdhPJywG7UuJwRZ5CQgTfFcvUp92fMoMNoNRYEuE3kSu1VPXNHzK8RAUzUUbL0LWpKfGVgOYfycXw==
X-Received: by 2002:a17:907:7808:: with SMTP id
 la8mr31956696ejc.13.1625757476980; 
 Thu, 08 Jul 2021 08:17:56 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/48] modules: add virtio-gpu module annotations
Date: Thu,  8 Jul 2021 17:17:10 +0200
Message-Id: <20210708151748.408754-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-7-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index a02b23ecaf..daefcf7101 100644
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
index 389199e6ca..49df56cd14 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -598,6 +598,7 @@ static const TypeInfo vhost_user_gpu_info = {
     .instance_finalize = vhost_user_gpu_instance_finalize,
     .class_init = vhost_user_gpu_class_init,
 };
+module_obj(TYPE_VHOST_USER_GPU);
 
 static void vhost_user_gpu_register_types(void)
 {
diff --git a/hw/display/vhost-user-vga.c b/hw/display/vhost-user-vga.c
index a34a99856d..072c9c65bc 100644
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
index dd294276cb..c8da4806e0 100644
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
index d971b48080..7ab93bf8c8 100644
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
index 902dda3452..99b14a0718 100644
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
index d742a30aec..e36eee0c40 100644
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
index e183f4ecda..6b7f643951 100644
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
index c971340ebb..f22549097c 100644
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
index d3c6404061..9e57f61e9e 100644
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



