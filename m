Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB093F1AC9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:42:15 +0200 (CEST)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiJC-00009k-7m
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mGiHE-000638-Ku
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:40:13 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mGiHB-0004RD-7Q
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:40:12 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gr5Pp4DzWz8sbc;
 Thu, 19 Aug 2021 21:35:58 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 19 Aug 2021 21:40:02 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 19 Aug 2021 21:40:01 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH,updated 2/2] docs/about: Unify the subject format
Date: Thu, 19 Aug 2021 21:39:59 +0800
Message-ID: <20210819133959.179868-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210819031027.41104-2-wangyanan55@huawei.com>
References: <20210819031027.41104-2-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unify the subject format in deprecated.rst to "since X.Y".
Unify the subject format in removed-features.rst to "removed in X.Y".

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 docs/about/deprecated.rst       | 56 ++++++++++++++++-----------------
 docs/about/removed-features.rst | 28 ++++++++---------
 2 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 6d438f1c8d..8d4fd384a5 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -107,8 +107,8 @@ the process listing. This is replaced by the new ``password-secret``
 option which lets the password be securely provided on the command
 line using a ``secret`` object instance.
 
-``opened`` property of ``rng-*`` objects (since 6.0.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``opened`` property of ``rng-*`` objects (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The only effect of specifying ``opened=on`` in the command line or QMP
 ``object-add`` is that the device is opened immediately, possibly before all
@@ -116,8 +116,8 @@ other options have been processed.  This will either have no effect (if
 ``opened`` was the last option) or cause errors.  The property is therefore
 useless and should not be specified.
 
-``loaded`` property of ``secret`` and ``secret_keyring`` objects (since 6.0.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``loaded`` property of ``secret`` and ``secret_keyring`` objects (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The only effect of specifying ``loaded=on`` in the command line or QMP
 ``object-add`` is that the secret is loaded immediately, possibly before all
@@ -142,33 +142,33 @@ should be used instead.
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
-``blockdev-open-tray``, ``blockdev-close-tray`` argument ``device`` (since 2.8.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``blockdev-open-tray``, ``blockdev-close-tray`` argument ``device`` (since 2.8)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 Use argument ``id`` instead.
 
-``eject`` argument ``device`` (since 2.8.0)
-'''''''''''''''''''''''''''''''''''''''''''
+``eject`` argument ``device`` (since 2.8)
+'''''''''''''''''''''''''''''''''''''''''
 
 Use argument ``id`` instead.
 
-``blockdev-change-medium`` argument ``device`` (since 2.8.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``blockdev-change-medium`` argument ``device`` (since 2.8)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 Use argument ``id`` instead.
 
-``block_set_io_throttle`` argument ``device`` (since 2.8.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``block_set_io_throttle`` argument ``device`` (since 2.8)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 Use argument ``id`` instead.
 
-``blockdev-add`` empty string argument ``backing`` (since 2.10.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``blockdev-add`` empty string argument ``backing`` (since 2.10)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 Use argument value ``null`` instead.
 
-``block-commit`` arguments ``base`` and ``top`` (since 3.1.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``block-commit`` arguments ``base`` and ``top`` (since 3.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 Use arguments ``base-node`` and ``top-node`` instead.
 
@@ -191,8 +191,8 @@ from Linux upstream kernel, declare it deprecated.
 System emulator CPUS
 --------------------
 
-``Icelake-Client`` CPU Model (since 5.2.0)
-''''''''''''''''''''''''''''''''''''''''''
+``Icelake-Client`` CPU Model (since 5.2)
+''''''''''''''''''''''''''''''''''''''''
 
 ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CPU
 Models instead.
@@ -245,8 +245,8 @@ Device options
 Emulated device options
 '''''''''''''''''''''''
 
-``-device virtio-blk,scsi=on|off`` (since 5.0.0)
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+``-device virtio-blk,scsi=on|off`` (since 5.0)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The virtio-blk SCSI passthrough feature is a legacy VIRTIO feature.  VIRTIO 1.0
 and later do not support it because the virtio-scsi device was introduced for
@@ -258,14 +258,14 @@ alias.
 Block device options
 ''''''''''''''''''''
 
-``"backing": ""`` (since 2.12.0)
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+``"backing": ""`` (since 2.12)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 In order to prevent QEMU from automatically opening an image's backing
 chain, use ``"backing": null`` instead.
 
-``rbd`` keyvalue pair encoded filenames: ``""`` (since 3.1.0)
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+``rbd`` keyvalue pair encoded filenames: ``""`` (since 3.1)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Options for ``rbd`` should be specified according to its runtime options,
 like other block drivers.  Legacy parsing of keyvalue pair encoded
@@ -283,8 +283,8 @@ The above, converted to the current supported format::
 linux-user mode CPUs
 --------------------
 
-``ppc64abi32`` CPUs (since 5.2.0)
-'''''''''''''''''''''''''''''''''
+``ppc64abi32`` CPUs (since 5.2)
+'''''''''''''''''''''''''''''''
 
 The ``ppc64abi32`` architecture has a number of issues which regularly
 trip up our CI testing and is suspected to be quite broken. For that
@@ -303,8 +303,8 @@ Related binaries
 Backwards compatibility
 -----------------------
 
-Runnability guarantee of CPU models (since 4.1.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''
+Runnability guarantee of CPU models (since 4.1)
+'''''''''''''''''''''''''''''''''''''''''''''''
 
 Previous versions of QEMU never changed existing CPU models in
 ways that introduced additional host software or hardware
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 6a9c5bb484..1c926a8bc1 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -194,8 +194,8 @@ by the ``tls-authz`` and ``sasl-authz`` options.
 The ``pretty=on|off`` switch has no effect for HMP monitors and
 its use is rejected.
 
-``-drive file=json:{...{'driver':'file'}}`` (removed 6.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``-drive file=json:{...{'driver':'file'}}`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The 'file' driver for drives is no longer appropriate for character or host
 devices and will only accept regular files (S_IFREG). The correct driver
@@ -272,8 +272,8 @@ for the RISC-V ``virt`` machine and ``sifive_u`` machine.
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
-``block-dirty-bitmap-add`` "autoload" parameter (removed in 4.2.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``block-dirty-bitmap-add`` "autoload" parameter (removed in 4.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The "autoload" parameter has been ignored since 2.12.0. All bitmaps
 are automatically loaded from qcow2 images.
@@ -456,15 +456,15 @@ Nobody was using this CPU emulation in QEMU, and there were no test images
 available to make sure that the code is still working, so it has been removed
 without replacement.
 
-``lm32`` CPUs (removed in 6.1.0)
-''''''''''''''''''''''''''''''''
+``lm32`` CPUs (removed in 6.1)
+''''''''''''''''''''''''''''''
 
 The only public user of this architecture was the milkymist project,
 which has been dead for years; there was never an upstream Linux
 port.  Removed without replacement.
 
-``unicore32`` CPUs (since 6.1.0)
-''''''''''''''''''''''''''''''''
+``unicore32`` CPUs (removed in 6.1)
+'''''''''''''''''''''''''''''''''''
 
 Support for this CPU was removed from the upstream Linux kernel, and
 there is no available upstream toolchain to build binaries for it.
@@ -593,8 +593,8 @@ error when ``-u`` is not used.
 Command line options
 --------------------
 
-``-smp`` (invalid topologies) (removed 5.2)
-'''''''''''''''''''''''''''''''''''''''''''
+``-smp`` (invalid topologies) (removed in 5.2)
+''''''''''''''''''''''''''''''''''''''''''''''
 
 CPU topology properties should describe whole machine topology including
 possible CPUs.
@@ -606,8 +606,8 @@ Support for invalid topologies is removed, the user must ensure
 topologies described with -smp include all possible cpus, i.e.
 *sockets* * *cores* * *threads* = *maxcpus*.
 
-``-numa`` node (without memory specified) (removed 5.2)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``-numa`` node (without memory specified) (removed in 5.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 Splitting RAM by default between NUMA nodes had the same issues as ``mem``
 parameter with the difference that the role of the user plays QEMU using
@@ -647,8 +647,8 @@ as ignored. Currently, users are responsible for making sure the backing storage
 specified with ``-mem-path`` can actually provide the guest RAM configured with
 ``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
 
-``-machine enforce-config-section=on|off`` (removed 5.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``-machine enforce-config-section=on|off`` (removed in 5.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The ``enforce-config-section`` property was replaced by the
 ``-global migration.send-configuration={on|off}`` option.
-- 
2.19.1


