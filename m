Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA22F3F742C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:14:39 +0200 (CEST)
Received: from localhost ([::1]:33502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqrZ-00058J-U4
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqe3-0007su-Pl
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqe1-0004ja-E8
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629889232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tuoUgT7RjMCkI5dtCkxWPhJrJoCi2Db56YGJzBnAGzY=;
 b=Mh5HdoFAGwjsDFp6e7WCnGjCRWxz2sGNcTteBEVlhizHZ1cvDMm0M7J14N+Bm6EcqgkxG+
 QO/DNFjgyd2vKfr7H0/KCo+qXkQ6qAgNNS6XPagW0501rqX7hDPtjTZ4pwpJoiK48ewcK4
 KMccCCjfpKQGBO7gYquwNKLTrJGEqv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-PAgn9wASMCqTvx9GMZu8uA-1; Wed, 25 Aug 2021 07:00:30 -0400
X-MC-Unique: PAgn9wASMCqTvx9GMZu8uA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7685992500;
 Wed, 25 Aug 2021 11:00:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DF765D741;
 Wed, 25 Aug 2021 11:00:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/6] docs/about: Unify the subject format
Date: Wed, 25 Aug 2021 13:00:14 +0200
Message-Id: <20210825110018.100913-3-thuth@redhat.com>
In-Reply-To: <20210825110018.100913-1-thuth@redhat.com>
References: <20210825110018.100913-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

There is a mixture of "since/removed in X.Y" vs "since/removed in X.Y.Z"
in the subjects in deprecated.rst/removed-features.rst. It will be better
to use an unified format. It seems unlikely that we will ever deprecate
something in a stable release, and even more unlikely that we'll remove
something in one, so the short versions look like the thing we want to
standardize on.

So here we unify the subject format in deprecated.rst to "since X.Y", and
unify the subject format in removed-features.rst to "removed in X.Y".

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210823030005.165668-3-wangyanan55@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.27.0


