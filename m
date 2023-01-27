Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1325867DD4F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 06:59:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLHkm-0002TJ-8c; Fri, 27 Jan 2023 00:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pLHkk-0002Sr-5I
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 00:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pLHki-0007qL-Ej
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 00:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674799098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QJIiFLXVSc6xvuTVAdZfxxIrRKLkpzjWlWUCtReLMTE=;
 b=i/8qrELgJd6DLycJVT3OG5q0wKXbEw02iR1lGPue4UN97U2m4OBG/7gwRS6sZpO8PJLEh1
 xX11BmwhR7hn4Moxov2jXKmoVGHXkH6/ZV3VyaM2d9GKDA1yrsBSY1c1xlqqvR7qPVNmEH
 ZJuxkDKqpBv7XHPbGNhK3h6lyGar/88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-y_R2Ee15NvyXl1qJvGJlXA-1; Fri, 27 Jan 2023 00:58:13 -0500
X-MC-Unique: y_R2Ee15NvyXl1qJvGJlXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E52FF8588E0;
 Fri, 27 Jan 2023 05:58:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A402026D4B;
 Fri, 27 Jan 2023 05:58:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2D601180060F; Fri, 27 Jan 2023 06:58:11 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
Subject: [PATCH] microvm: update outdated docs
Date: Fri, 27 Jan 2023 06:58:11 +0100
Message-Id: <20230127055811.3468268-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

Cc: Sergio Lopez <slp@redhat.com>
Suggested-by: Stefan Hajnoczi <stefanha@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/system/i386/microvm.rst | 52 +++++++++++++-----------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/docs/system/i386/microvm.rst b/docs/system/i386/microvm.rst
index 1675e37d3e73..2baa68719c1d 100644
--- a/docs/system/i386/microvm.rst
+++ b/docs/system/i386/microvm.rst
@@ -4,10 +4,10 @@
 ``microvm`` is a machine type inspired by ``Firecracker`` and
 constructed after its machine model.
 
-It's a minimalist machine type without ``PCI`` nor ``ACPI`` support,
-designed for short-lived guests. microvm also establishes a baseline
-for benchmarking and optimizing both QEMU and guest operating systems,
-since it is optimized for both boot time and footprint.
+It's a minimalist machine type designed for short-lived
+guests. microvm also establishes a baseline for benchmarking and
+optimizing both QEMU and guest operating systems, since it is
+optimized for both boot time and footprint.
 
 
 Supported devices
@@ -24,7 +24,9 @@ The microvm machine type supports the following devices:
 - IOAPIC (with kernel-irqchip=split by default)
 - kvmclock (if using KVM)
 - fw_cfg
-- Up to eight virtio-mmio devices (configured by the user)
+- Up to 24 virtio-mmio devices (configured by the user).
+- PCIe devices (optional).
+- USB devices (optional).
 
 
 Limitations
@@ -32,7 +34,6 @@ Limitations
 
 Currently, microvm does *not* support the following features:
 
-- PCI-only devices.
 - Hotplug of any kind.
 - Live migration across QEMU versions.
 
@@ -50,18 +51,24 @@ It supports the following machine-specific options:
 - microvm.isa-serial=bool (Set off to disable the instantiation an ISA serial port)
 - microvm.pic=OnOffAuto (Enable i8259 PIC)
 - microvm.rtc=OnOffAuto (Enable MC146818 RTC)
-- microvm.auto-kernel-cmdline=bool (Set off to disable adding virtio-mmio devices to the kernel cmdline)
+- microvm.acpi=OnOff (Enable ACPI support, default On)
+- microvm.auto-kernel-cmdline=bool (Set off to disable adding
+  virtio-mmio devices to the kernel cmdline, enabling ACPI support
+  disables this too).
+- microvm.pcie=OnOff (Enable PCIe host adapter, default Off)
+- microvm.usb=OnOff (Enable USB host adapter, default Off)
+- microvm.ioapic2=OnOff (Enable second IOAPIC for virtio-mmio devices,
+  required for more than eight virtio-mmio devices, default On)
 
 
 Boot options
 ~~~~~~~~~~~~
 
-By default, microvm uses ``qboot`` as its BIOS, to obtain better boot
-times, but it's also compatible with ``SeaBIOS``.
+By default, microvm uses ``SeaBIOS`` as its firmware. ``SeaBIOS``
+supports booting from virtio-mmio devices.
 
-As no current FW is able to boot from a block device using
-``virtio-mmio`` as its transport, a microvm-based VM needs to be run
-using a host-side kernel and, optionally, an initrd image.
+edk2 has full support for microvm, including support for the PCIe host
+adapter. so you can boot from both virtio-mmio and PCIe devices.
 
 
 Running a microvm-based VM
@@ -105,24 +112,3 @@ disabled::
      -device virtio-blk-device,drive=test \
      -netdev tap,id=tap0,script=no,downscript=no \
      -device virtio-net-device,netdev=tap0
-
-
-Triggering a guest-initiated shut down
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-As the microvm machine type includes just a small set of system
-devices, some x86 mechanisms for rebooting or shutting down the
-system, like sending a key sequence to the keyboard or writing to an
-ACPI register, doesn't have any effect in the VM.
-
-The recommended way to trigger a guest-initiated shut down is by
-generating a ``triple-fault``, which will cause the VM to initiate a
-reboot. Additionally, if the ``-no-reboot`` argument is present in the
-command line, QEMU will detect this event and terminate its own
-execution gracefully.
-
-Linux does support this mechanism, but by default will only be used
-after other options have been tried and failed, causing the reboot to
-be delayed by a small number of seconds. It's possible to instruct it
-to try the triple-fault mechanism first, by adding ``reboot=t`` to the
-kernel's command line.
-- 
2.39.1


