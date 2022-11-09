Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D9C622F1F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 16:36:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osn7d-0001g3-HN; Wed, 09 Nov 2022 10:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1osn7W-0001Rm-NT
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:36:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1osn7S-0003Qn-Ca
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668008161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vSuInugaHb7iDUwPWG8qny7rJgK5hQFf24QZuRvxpxk=;
 b=akiSSrr/LvuU2fDPZBIAwGSHSl7Yv3xTQySkDYAPJXe0YHN+GkOJGHrOh06qNejg8YgPd2
 lU/0BthVl0aShqPwiewXUI4SWxSRlMSz13xYSn+Iu5p60q/mhLzdjruU/XxzXCe3mpN/Bx
 BRtZe92tiZ5ddMBVNppEOkYtZB+X6Y4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-Xdq4d3IbPJ6QeN0eiRr_yw-1; Wed, 09 Nov 2022 10:34:19 -0500
X-MC-Unique: Xdq4d3IbPJ6QeN0eiRr_yw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7E9D101A528
 for <qemu-devel@nongnu.org>; Wed,  9 Nov 2022 15:34:18 +0000 (UTC)
Received: from wi2021.rezanina.moe.rezanina.moe (ovpn-193-213.brq.redhat.com
 [10.40.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E9C3140EBF5;
 Wed,  9 Nov 2022 15:34:17 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com,
	Miroslav Rezanina <mrezanin@redhat.com>
Subject: [PATCH] Add missing pixman dependecy
Date: Wed,  9 Nov 2022 10:34:16 -0500
Message-Id: <20221109153417.49132-1-mrezanin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Miroslav Rezanina <mrezanin@redhat.com>

Commit cfead31326 'acpi: pc: vga: use AcpiDevAmlIf interface to build VGA device descriptors' added
a new file - acpi-vga.c. This file (indirectly) includes pixman.h file so we need to ensure pixman
is available when file is compiled.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 hw/display/meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 7a725ed80e..c8e84e9707 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -43,7 +43,7 @@ if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
     config_all_devices.has_key('CONFIG_VMWARE_VGA') or
     config_all_devices.has_key('CONFIG_ATI_VGA')
    )
-  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
+  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: [files('acpi-vga.c'), pixman],
                                       if_false: files('acpi-vga-stub.c'))
 endif
 
@@ -51,7 +51,7 @@ if config_all_devices.has_key('CONFIG_QXL')
   qxl_ss = ss.source_set()
   qxl_ss.add(when: 'CONFIG_QXL', if_true: [files('qxl.c', 'qxl-logger.c', 'qxl-render.c'),
                                            pixman, spice])
-  qxl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
+  qxl_ss.add(when: 'CONFIG_ACPI', if_true: [files('acpi-vga.c'), pixman],
                                   if_false: files('acpi-vga-stub.c'))
   hw_display_modules += {'qxl': qxl_ss}
 endif
@@ -99,14 +99,14 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
                     if_true: [files('virtio-vga.c'), pixman])
   virtio_vga_ss.add(when: 'CONFIG_VHOST_USER_VGA',
                     if_true: files('vhost-user-vga.c'))
-  virtio_vga_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
+  virtio_vga_ss.add(when: 'CONFIG_ACPI', if_true: [files('acpi-vga.c'), pixman],
                                          if_false: files('acpi-vga-stub.c'))
   hw_display_modules += {'virtio-vga': virtio_vga_ss}
 
   virtio_vga_gl_ss = ss.source_set()
   virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', virgl, opengl],
                        if_true: [files('virtio-vga-gl.c'), pixman])
-  virtio_vga_gl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
+  virtio_vga_gl_ss.add(when: 'CONFIG_ACPI', if_true: [files('acpi-vga.c'), pixman],
                                             if_false: files('acpi-vga-stub.c'))
   hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
 endif
-- 
2.31.1


