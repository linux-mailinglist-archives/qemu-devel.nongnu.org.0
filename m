Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA673C8203
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:47:59 +0200 (CEST)
Received: from localhost ([::1]:48340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bUk-0005Ca-BG
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKY-00032c-TJ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKW-0004fJ-PC
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id t5so2352656wrw.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O7eiCiiOA1Sqqm1FgUzdGWyHxXgBgMmn6hDxRrW6WnA=;
 b=Q0PXoyCmfli6eyNXCgsXg6XIhFVCc4JSYP1WDikxi0o/oYzJpNl/XgdMXgzs0XVNdG
 HWKeRhfznVP6btbB2CK9fz6txkaKp3vkZ+CXgbeHCYgUmO24I8tN9/wdzzgpdlnk87PH
 T5nyg11OEIfwHcbJuy0akugM6IrjXeLR5h1yeYA4NcpGOnbyLxg9WXhUjbfjTyrf0hmU
 2Bq7LRAbIc05anxvFPzKb+y/FwrS+4IW/kkXwsBMMY9EVzLHNiiywfZSs281NWbeDyHS
 kVbMMa+DgHX0zTy8nVmKR2U2UGN+1dsYHYYEv7yQ9B6C1xUdvjk0rWrEuEcq5nfp/0FC
 4SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O7eiCiiOA1Sqqm1FgUzdGWyHxXgBgMmn6hDxRrW6WnA=;
 b=JQBDdOn8NC7+DFU9HncJeoqJIUoJ7vFR5ca+AXgjVEXPsd1zChMYa3/3Vb6va20prz
 MZH1KdEoVxmgt9YLrSdxMkhE4FFNQYkMqeCPWTbL5yveD6Fncq4zPVboeG3jJ6yL1IR8
 JXbfdVPKo0wBQzrbruusYg2HbI9nVOMEDSAlbI88Izb+0QF4+9dTTxA+GztnIBGAy4OO
 sxwnr0w5h9xVq3SQr5P5P2LV8FwPj+ZKPd52UM58OcUQ9W0K/Ohi5GpAzSsVqjuk6Ahx
 zOowuomyz3/G2i6hj+hV8FU6dJaEZ1ffm0UK9b42fSMjVkt8e2Z7jDszRXUCIT+Ogu4q
 lBEA==
X-Gm-Message-State: AOAM531ATOr7jQNNL8/pe6bfTxxfTo2P4gSmwA9g5CtkUYqsP9VcT8BL
 u1fw0T9Bh3aW9EtO7jsc/MQ6WQ==
X-Google-Smtp-Source: ABdhPJxm/rC/dln0RQtpBWqRUrMR+uXwef0QlVi+fTrlobtmT87gg8Almj4UK9tIWyiorH3OZgye8w==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr11951135wrx.268.1626255443564; 
 Wed, 14 Jul 2021 02:37:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d8sm1854280wrv.20.2021.07.14.02.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CCC1D1FF93;
 Wed, 14 Jul 2021 10:37:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/21] docs: collect the disparate device emulation docs
 into one section
Date: Wed, 14 Jul 2021 10:37:00 +0100
Message-Id: <20210714093719.21429-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we are at it add a brief preamble that explains some of the
common concepts in QEMU's device emulation which will hopefully lead
to less confusing about our dizzying command line options.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/device-emulation.rst          | 78 +++++++++++++++++++++++
 docs/system/{ => devices}/ivshmem.rst     |  0
 docs/system/{ => devices}/net.rst         |  0
 docs/system/{ => devices}/nvme.rst        |  0
 docs/system/{ => devices}/usb.rst         |  0
 docs/system/{ => devices}/virtio-pmem.rst |  0
 docs/system/index.rst                     |  6 +-
 7 files changed, 79 insertions(+), 5 deletions(-)
 create mode 100644 docs/system/device-emulation.rst
 rename docs/system/{ => devices}/ivshmem.rst (100%)
 rename docs/system/{ => devices}/net.rst (100%)
 rename docs/system/{ => devices}/nvme.rst (100%)
 rename docs/system/{ => devices}/usb.rst (100%)
 rename docs/system/{ => devices}/virtio-pmem.rst (100%)

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
new file mode 100644
index 0000000000..a0f00bc340
--- /dev/null
+++ b/docs/system/device-emulation.rst
@@ -0,0 +1,78 @@
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
+All devices exist on a BUS. Depending on the machine model you choose
+(``-M foo``) a number of buses will have been automatically created.
+In most cases the BUS a device is attached to can be inferred, for
+example PCI devices are generally automatically allocated to the next
+free slot of the PCI bus. However in complicated configurations you
+can explicitly specify what bus a device is attached to and its
+address. Some devices, for example a PCI SCSI host controller, will
+add an additional bus to the system that other devices can be attached
+to.
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
index 6092eb2d91..641d243ba4 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -16,15 +16,12 @@ Contents:
 
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
@@ -35,7 +32,6 @@ Contents:
    gdb
    managed-startup
    cpu-hotplug
-   virtio-pmem
    pr-manager
    targets
    security
-- 
2.20.1


