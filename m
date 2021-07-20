Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC83D0560
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:29:07 +0200 (CEST)
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zAg-0005eb-Uo
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8p-000347-Ke
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8n-0005YH-HY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:11 -0400
Received: by mail-wr1-x431.google.com with SMTP id n1so149964wri.10
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cSNzURLi/UqmbeReG+Ko6sDpIzZd+5SCiyfXK4w5L5A=;
 b=HRIn9OEEkGJKptIArMjqsE933VyVaUX+7uoVVncLWGEqX5g1BM9qMP1uD2mqqPo3kY
 mmlSkZyOQPc2lrNrq031bfgUfvt9IlCHIpVvm27V3ybCG6u0vXWG5NEZotc/Clk/c/cB
 6Gqijppmf86MgCCEh4wIhlHspSxhbgP7Wcp/9RUWpUaZJE4xF/4T6DxXTfUqtQ0O1/HX
 7f2KNik16rZ37jhZ/wM0JmiOLvL0m7igpMe+L/6D1+rRGcsSRBRjA7V8/mABQ113D85F
 oMrnP2cEYCPWmjjBnkH3VZzIBCds/xqK5RmiWLBfZBQvFPF48L2ImyU+hMpMmvFd5rf3
 Gkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cSNzURLi/UqmbeReG+Ko6sDpIzZd+5SCiyfXK4w5L5A=;
 b=hpMTnkOQo3H1iWhLwkwjcWhJWJN40jDbvzFMSDV6umBr/kP7qWyHEJsyFKyZoJ3afK
 DH70Wek4LLt/dJb4Hldn2KJlFqI7mJ0trqceZi1i2aW/g6trDHJqoXAwebU5JJomyaZA
 dLDAvPFalAqWipnP/JivozrYKxaQOH30d2dMRAQac6e7QOeYJNTum1btDEsfNyLGRQkL
 kmZr7/v7U6SP1WRujl7jRtzYr41fS+KFPcvRgp/T+cQncSH+89KH85NWj2o3TwhFTHj1
 4VA2x4bJPcQvMtT6uWIqTFCLmS+jtO8xHYHpZhisOFc5v5JnOHgY+9y2FYrKVtgmsIO+
 o3jg==
X-Gm-Message-State: AOAM533WiJdRziYPiwffcSa1rmEFa1553Kk+muVX+5ULescqiHEopPam
 IPfFNrJ8R+DKkbUXuIZubpzIJA==
X-Google-Smtp-Source: ABdhPJywX3aT4d5hhkgN7d4NAci4Z3JdJe33JAF/+vxQis+ATr6PlEYrQf/HaHUhq71czpxMeGs4dQ==
X-Received: by 2002:a5d:4c50:: with SMTP id n16mr39304926wrt.249.1626823628167; 
 Tue, 20 Jul 2021 16:27:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s14sm10139572wmc.25.2021.07.20.16.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F09CE1FF8C;
 Wed, 21 Jul 2021 00:27:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/29] docs: collect the disparate device emulation docs
 into one section
Date: Wed, 21 Jul 2021 00:26:36 +0100
Message-Id: <20210720232703.10650-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 f4bug@amsat.org, Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we are at it add a brief preamble that explains some of the
common concepts in QEMU's device emulation which will hopefully lead
to less confusing about our dizzying command line options.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210714182056.25888-3-alex.bennee@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>

---
v2
  - be a bit more precise about necessity of a buses
  - add an example showing id/bus relations
---
 docs/system/device-emulation.rst          | 89 +++++++++++++++++++++++
 docs/system/{ => devices}/ivshmem.rst     |  0
 docs/system/{ => devices}/net.rst         |  0
 docs/system/{ => devices}/nvme.rst        |  0
 docs/system/{ => devices}/usb.rst         |  0
 docs/system/{ => devices}/virtio-pmem.rst |  0
 docs/system/index.rst                     |  6 +-
 7 files changed, 90 insertions(+), 5 deletions(-)
 create mode 100644 docs/system/device-emulation.rst
 rename docs/system/{ => devices}/ivshmem.rst (100%)
 rename docs/system/{ => devices}/net.rst (100%)
 rename docs/system/{ => devices}/nvme.rst (100%)
 rename docs/system/{ => devices}/usb.rst (100%)
 rename docs/system/{ => devices}/virtio-pmem.rst (100%)

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
new file mode 100644
index 0000000000..7af5dbefab
--- /dev/null
+++ b/docs/system/device-emulation.rst
@@ -0,0 +1,89 @@
+.. _device-emulation:
+
+Device Emulation
+----------------
+
+QEMU supports the emulation of a large number of devices from
+peripherals such network cards and USB devices to integrated systems
+on a chip (SoCs). Configuration of these is often a source of
+confusion so it helps to have an understanding of some of the terms
+used to describes devices within QEMU.
+
+Common Terms
+~~~~~~~~~~~~
+
+Device Front End
+================
+
+A device front end is how a device is presented to the guest. The type
+of device presented should match the hardware that the guest operating
+system is expecting to see. All devices can be specified with the
+``--device`` command line option. Running QEMU with the command line
+options ``--device help`` will list all devices it is aware of. Using
+the command line ``--device foo,help`` will list the additional
+configuration options available for that device.
+
+A front end is often paired with a back end, which describes how the
+host's resources are used in the emulation.
+
+Device Buses
+============
+
+Most devices will exist on a BUS of some sort. Depending on the
+machine model you choose (``-M foo``) a number of buses will have been
+automatically created. In most cases the BUS a device is attached to
+can be inferred, for example PCI devices are generally automatically
+allocated to the next free address of first PCI bus found. However in
+complicated configurations you can explicitly specify what bus
+(``bus=ID``) a device is attached to along with its address
+(``addr=N``).
+
+Some devices, for example a PCI SCSI host controller, will add an
+additional buses to the system that other devices can be attached to.
+A hypothetical chain of devices might look like:
+
+  --device foo,bus=pci.0,addr=0,id=foo
+  --device bar,bus=foo.0,addr=1,id=baz
+
+which would be a bar device (with the ID of baz) which is attached to
+the first foo bus (foo.0) at address 1. The foo device which provides
+that bus is itself is attached to the first PCI bus (pci.0).
+
+
+Device Back End
+===============
+
+The back end describes how the data from the emulated device will be
+processed by QEMU. The configuration of the back end is usually
+specific to the class of device being emulated. For example serial
+devices will be backed by a ``--chardev`` which can redirect the data
+to a file or socket or some other system. Storage devices are handled
+by ``--blockdev`` which will specify how blocks are handled, for
+example being stored in a qcow2 file or accessing a raw host disk
+partition. Back ends can sometimes be stacked to implement features
+like snapshots.
+
+While the choice of back end is generally transparent to the guest
+there are cases where features will not be reported to the guest if
+the back end is unable to support it.
+
+Device Pass Through
+===================
+
+Device pass through is where the device is actually given access to
+the underlying hardware. This can be as simple as exposing a single
+USB device on the host system to the guest or dedicating a video card
+in a PCI slot to the exclusive use of the guest.
+
+
+Emulated Devices
+~~~~~~~~~~~~~~~~
+
+.. toctree::
+   :maxdepth: 1
+
+   devices/ivshmem.rst
+   devices/net.rst
+   devices/nvme.rst
+   devices/usb.rst
+   devices/virtio-pmem.rst
diff --git a/docs/system/ivshmem.rst b/docs/system/devices/ivshmem.rst
similarity index 100%
rename from docs/system/ivshmem.rst
rename to docs/system/devices/ivshmem.rst
diff --git a/docs/system/net.rst b/docs/system/devices/net.rst
similarity index 100%
rename from docs/system/net.rst
rename to docs/system/devices/net.rst
diff --git a/docs/system/nvme.rst b/docs/system/devices/nvme.rst
similarity index 100%
rename from docs/system/nvme.rst
rename to docs/system/devices/nvme.rst
diff --git a/docs/system/usb.rst b/docs/system/devices/usb.rst
similarity index 100%
rename from docs/system/usb.rst
rename to docs/system/devices/usb.rst
diff --git a/docs/system/virtio-pmem.rst b/docs/system/devices/virtio-pmem.rst
similarity index 100%
rename from docs/system/virtio-pmem.rst
rename to docs/system/devices/virtio-pmem.rst
diff --git a/docs/system/index.rst b/docs/system/index.rst
index fda4b1b705..64a424ae99 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -11,15 +11,12 @@ or Hypervisor.Framework.
 
    quickstart
    invocation
+   device-emulation
    keys
    mux-chardev
    monitor
    images
-   net
    virtio-net-failover
-   usb
-   nvme
-   ivshmem
    linuxboot
    generic-loader
    guest-loader
@@ -30,7 +27,6 @@ or Hypervisor.Framework.
    gdb
    managed-startup
    cpu-hotplug
-   virtio-pmem
    pr-manager
    targets
    security
-- 
2.32.0.264.g75ae10bc75


