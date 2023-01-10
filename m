Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66F664607
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:27:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6Y-0003Wg-Nv; Tue, 10 Jan 2023 11:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5t-00037e-31
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5r-00052S-3y
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mz+9V6TK5S6+W3L8zAGE/ylgLN+mHyjmSzm4zgt8mIk=;
 b=PcJ4Z/MYp8FHQ4lQ5DfeaBFKzXu2u4F48xkUxKVuOkDw1jOGNs86cJT9oKA0n2eN48jrV8
 cCN8nLpt7golJecquOjIILyJV0KVUOWHzIy1FUiKgSEJ7k8xE7DkcFSk45KUez7aEoYHZj
 yrfHmpKWLHkZi+Z2dv8qd8bn7dypvK0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-3jLWExeXO1yHzed0wl-YKQ-1; Tue, 10 Jan 2023 11:03:17 -0500
X-MC-Unique: 3jLWExeXO1yHzed0wl-YKQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m7-20020a05600c4f4700b003d971a5e770so6489344wmq.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mz+9V6TK5S6+W3L8zAGE/ylgLN+mHyjmSzm4zgt8mIk=;
 b=UIjV5Q2TLxY+uR93pEaIr+U86pgpn4K0o/11aE7w23c6QnAxDy4tZyG1AlheVUUSXs
 0INZRhaYND/rwkvCNezuxQjOREBbjkXUSOGcogIgYghjXUefww0TO8q+vYyvBrPKUQoL
 yUxFOX28lOQ3dWwoOqgDqgWJqefc1RFvmV0/FcynrIag04oeswjZbaBQ8YMudAEv+vWV
 O4z1er7rZItrR5h+kUOvbZKEg+PprSIQid5wJ4+iyi/PZuQ++GznDZjGUo2SzuIzpD++
 Bs6f3kdvsGCTTyjMPh/iwUENzigjOww7sfB3k1nOy9v4GPNva1ISNacj40g7ZKlUvEQR
 kT6w==
X-Gm-Message-State: AFqh2ko0y8O9AetBL0/WgjD6W099C5sQMDa+jxaEYU5qY3cC1LrYTqBJ
 63gXZ7kfRWiflTWhlgKutbiR27AJ0JDXavA1WNRSwtt7TIWZkL9wR33grosWi475D89iz4t3KJb
 /LMoL0Qwj+3FMZs5CiUy6X/XtCwNWkIF/pAmj4H2/SzeT9Oy9C7cRkUDyA8aAaf6E2u4=
X-Received: by 2002:adf:df06:0:b0:292:27d:9647 with SMTP id
 y6-20020adfdf06000000b00292027d9647mr25396317wrl.10.1673366595630; 
 Tue, 10 Jan 2023 08:03:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvP4fWWg4wEekNZGrxRWeOeh7iNfGsXj5Dbz4QTwFUGI/ptCre8Q6TO/CfTetXcO+gKXuChEw==
X-Received: by 2002:adf:df06:0:b0:292:27d:9647 with SMTP id
 y6-20020adfdf06000000b00292027d9647mr25396295wrl.10.1673366595290; 
 Tue, 10 Jan 2023 08:03:15 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b0027cb20605e3sm11414986wrk.105.2023.01.10.08.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 15/29] hw/display: avoid creating empty loadable modules
Date: Tue, 10 Jan 2023 17:02:19 +0100
Message-Id: <20230110160233.339771-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

When using --disable-virglrenderer, QEMU still creates

  hw-display-virtio-gpu-gl.so
  hw-display-virtio-vga-gl.so
  hw-display-virtio-gpu-pci-gl.so

but when these are loaded, they provide no functionality as the code
which registers types is not compiled in. Funtionally this is
relatively harmless, because QEMU is fine loading a module with no
types.

This is rather confusing for users and OS distro maintainers though,
as they think they have the GL functionality built, but in fact the
module they are looking at provides nothing of value.

The root cause is the use of 'when/if_true' rules when adding sources
to the module source set. If all the rules evaluate to false, then we
have declared the module, but not added anything to it.  We need to
put declaration of the entire module inside a condition based on
existance of the 3rd party library deps that are mandatory.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1352
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221219125830.2369169-1-berrange@redhat.com>
[Do not check for pixman. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/display/meson.build | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 7a725ed80eb5..f860c2c562ac 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -73,10 +73,12 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 
-  virtio_gpu_gl_ss = ss.source_set()
-  virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', virgl, opengl],
-                       if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
-  hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
+  if virgl.found() and opengl.found()
+    virtio_gpu_gl_ss = ss.source_set()
+    virtio_gpu_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', virgl, opengl],
+                         if_true: [files('virtio-gpu-gl.c', 'virtio-gpu-virgl.c'), pixman, virgl])
+    hw_display_modules += {'virtio-gpu-gl': virtio_gpu_gl_ss}
+  endif
 endif
 
 if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
@@ -87,10 +89,12 @@ if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
                         if_true: files('vhost-user-gpu-pci.c'))
   hw_display_modules += {'virtio-gpu-pci': virtio_gpu_pci_ss}
 
-  virtio_gpu_pci_gl_ss = ss.source_set()
-  virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', virgl, opengl],
-                           if_true: [files('virtio-gpu-pci-gl.c'), pixman])
-  hw_display_modules += {'virtio-gpu-pci-gl': virtio_gpu_pci_gl_ss}
+  if virgl.found() and opengl.found()
+    virtio_gpu_pci_gl_ss = ss.source_set()
+    virtio_gpu_pci_gl_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRTIO_PCI', virgl, opengl],
+                             if_true: [files('virtio-gpu-pci-gl.c'), pixman])
+    hw_display_modules += {'virtio-gpu-pci-gl': virtio_gpu_pci_gl_ss}
+  endif
 endif
 
 if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
-- 
2.38.1


