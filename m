Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1088B2DB360
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:13:47 +0100 (CET)
Received: from localhost ([::1]:46200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEpW-00034V-1e
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXS-0003DB-8n
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXK-0001VF-MI
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZcFLlCJU+rWQV2CVKWneMTw0bFPqXqP3Iv5grExNmw=;
 b=MqqW4JRH+fKbblfIWdhRT36gngps8wTVMDPQB3TYF8qh6a4dvc+3DmTUsGPCRj9UtH5/3n
 Rwz056QZ+lbSwlVgJjsAWPsLhQZkLzfRYjN7aDwIfKkv+T3IL5qbYT8MpYQNGssr3MWrLC
 sU0/DkFyT+V228nkejuoQ0Bo4Y004RM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-yYQLUA7XNxCIcZwUGlNnvA-1; Tue, 15 Dec 2020 12:54:56 -0500
X-MC-Unique: yYQLUA7XNxCIcZwUGlNnvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D2931005504
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F02B55C1C4;
 Tue, 15 Dec 2020 17:54:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/45] docs/system: Move the list of removed features to a
 separate file
Date: Tue, 15 Dec 2020 12:54:21 -0500
Message-Id: <20201215175445.1272776-22-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Otherwise there is a chance that new deprecated features get added
to the list of removed features at the end of the file by accident.
It's way less confusing if the removed features reside in a separate
file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201210155808.233895-3-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst       | 232 -------------------------------
 docs/system/index.rst            |   1 +
 docs/system/removed-features.rst | 231 ++++++++++++++++++++++++++++++
 3 files changed, 232 insertions(+), 232 deletions(-)
 create mode 100644 docs/system/removed-features.rst

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 0b22812434..b0d44a06cb 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -486,235 +486,3 @@ nanoMIPS ISA
 
 The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
 As it is hard to generate binaries for it, declare it deprecated.
-
-
-Recently removed features
-=========================
-
-What follows is a record of recently removed, formerly deprecated
-features that serves as a record for users who have encountered
-trouble after a recent upgrade.
-
-System emulator command line arguments
---------------------------------------
-
-``-net ...,name=``\ *name* (removed in 5.1)
-'''''''''''''''''''''''''''''''''''''''''''
-
-The ``name`` parameter of the ``-net`` option was a synonym
-for the ``id`` parameter, which should now be used instead.
-
-``-no-kvm`` (removed in 5.2)
-''''''''''''''''''''''''''''
-
-The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
-
-``-tb-size`` option (removed in 6.0)
-''''''''''''''''''''''''''''''''''''
-
-QEMU 5.0 introduced an alternative syntax to specify the size of the translation
-block cache, ``-accel tcg,tb-size=``.
-
-QEMU Machine Protocol (QMP) commands
-------------------------------------
-
-``block-dirty-bitmap-add`` "autoload" parameter (since 4.2.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The "autoload" parameter has been ignored since 2.12.0. All bitmaps
-are automatically loaded from qcow2 images.
-
-``cpu-add`` (removed in 5.2)
-''''''''''''''''''''''''''''
-
-Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
-documentation of ``query-hotpluggable-cpus`` for additional details.
-
-Human Monitor Protocol (HMP) commands
--------------------------------------
-
-The ``hub_id`` parameter of ``hostfwd_add`` / ``hostfwd_remove`` (removed in 5.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``[hub_id name]`` parameter tuple of the 'hostfwd_add' and
-'hostfwd_remove' HMP commands has been replaced by ``netdev_id``.
-
-``cpu-add`` (removed in 5.2)
-''''''''''''''''''''''''''''
-
-Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
-documentation of ``query-hotpluggable-cpus`` for additional details.
-
-Guest Emulator ISAs
--------------------
-
-RISC-V ISA privilege specification version 1.09.1 (removed in 5.1)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The RISC-V ISA privilege specification version 1.09.1 has been removed.
-QEMU supports both the newer version 1.10.0 and the ratified version 1.11.0, these
-should be used instead of the 1.09.1 version.
-
-System emulator CPUS
---------------------
-
-KVM guest support on 32-bit Arm hosts (removed in 5.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The Linux kernel has dropped support for allowing 32-bit Arm systems
-to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecating
-its support for this configuration and will remove it in a future version.
-Running 32-bit guests on a 64-bit Arm host remains supported.
-
-RISC-V ISA Specific CPUs (removed in 5.1)
-'''''''''''''''''''''''''''''''''''''''''
-
-The RISC-V cpus with the ISA version in the CPU name have been removed. The
-four CPUs are: ``rv32gcsu-v1.9.1``, ``rv32gcsu-v1.10.0``, ``rv64gcsu-v1.9.1`` and
-``rv64gcsu-v1.10.0``. Instead the version can be specified via the CPU ``priv_spec``
-option when using the ``rv32`` or ``rv64`` CPUs.
-
-RISC-V no MMU CPUs (removed in 5.1)
-'''''''''''''''''''''''''''''''''''
-
-The RISC-V no MMU cpus have been removed. The two CPUs: ``rv32imacu-nommu`` and
-``rv64imacu-nommu`` can no longer be used. Instead the MMU status can be specified
-via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
-
-System emulator machines
-------------------------
-
-``spike_v1.9.1`` and ``spike_v1.10`` (removed in 5.1)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The version specific Spike machines have been removed in favour of the
-generic ``spike`` machine. If you need to specify an older version of the RISC-V
-spec you can use the ``-cpu rv64gcsu,priv_spec=v1.10.0`` command line argument.
-
-mips ``r4k`` platform (removed in 5.2)
-''''''''''''''''''''''''''''''''''''''
-
-This machine type was very old and unmaintained. Users should use the ``malta``
-machine type instead.
-
-Related binaries
-----------------
-
-``qemu-nbd --partition`` (removed in 5.0)
-'''''''''''''''''''''''''''''''''''''''''
-
-The ``qemu-nbd --partition $digit`` code (also spelled ``-P``)
-could only handle MBR partitions, and never correctly handled logical
-partitions beyond partition 5.  Exporting a partition can still be
-done by utilizing the ``--image-opts`` option with a raw blockdev
-using the ``offset`` and ``size`` parameters layered on top of
-any other existing blockdev. For example, if partition 1 is 100MiB
-long starting at 1MiB, the old command::
-
-  qemu-nbd -t -P 1 -f qcow2 file.qcow2
-
-can be rewritten as::
-
-  qemu-nbd -t --image-opts driver=raw,offset=1M,size=100M,file.driver=qcow2,file.file.driver=file,file.file.filename=file.qcow2
-
-``qemu-img convert -n -o`` (removed in 5.1)
-'''''''''''''''''''''''''''''''''''''''''''
-
-All options specified in ``-o`` are image creation options, so
-they are now rejected when used with ``-n`` to skip image creation.
-
-
-``qemu-img create -b bad file $size`` (removed in 5.1)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-When creating an image with a backing file that could not be opened,
-``qemu-img create`` used to issue a warning about the failure but
-proceed with the image creation if an explicit size was provided.
-However, as the ``-u`` option exists for this purpose, it is safer to
-enforce that any failure to open the backing image (including if the
-backing file is missing or an incorrect format was specified) is an
-error when ``-u`` is not used.
-
-Command line options
---------------------
-
-``-smp`` (invalid topologies) (removed 5.2)
-'''''''''''''''''''''''''''''''''''''''''''
-
-CPU topology properties should describe whole machine topology including
-possible CPUs.
-
-However, historically it was possible to start QEMU with an incorrect topology
-where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
-which could lead to an incorrect topology enumeration by the guest.
-Support for invalid topologies is removed, the user must ensure
-topologies described with -smp include all possible cpus, i.e.
-*sockets* * *cores* * *threads* = *maxcpus*.
-
-``-numa`` node (without memory specified) (removed 5.2)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Splitting RAM by default between NUMA nodes had the same issues as ``mem``
-parameter with the difference that the role of the user plays QEMU using
-implicit generic or board specific splitting rule.
-Use ``memdev`` with *memory-backend-ram* backend or ``mem`` (if
-it's supported by used machine type) to define mapping explicitly instead.
-Users of existing VMs, wishing to preserve the same RAM distribution, should
-configure it explicitly using ``-numa node,memdev`` options. Current RAM
-distribution can be retrieved using HMP command ``info numa`` and if separate
-memory devices (pc|nv-dimm) are present use ``info memory-device`` and subtract
-device memory from output of ``info numa``.
-
-``-numa node,mem=``\ *size* (removed in 5.1)
-''''''''''''''''''''''''''''''''''''''''''''
-
-The parameter ``mem`` of ``-numa node`` was used to assign a part of
-guest RAM to a NUMA node. But when using it, it's impossible to manage a specified
-RAM chunk on the host side (like bind it to a host node, setting bind policy, ...),
-so the guest ends up with the fake NUMA configuration with suboptiomal performance.
-However since 2014 there is an alternative way to assign RAM to a NUMA node
-using parameter ``memdev``, which does the same as ``mem`` and adds
-means to actually manage node RAM on the host side. Use parameter ``memdev``
-with *memory-backend-ram* backend as replacement for parameter ``mem``
-to achieve the same fake NUMA effect or a properly configured
-*memory-backend-file* backend to actually benefit from NUMA configuration.
-New machine versions (since 5.1) will not accept the option but it will still
-work with old machine types. User can check the QAPI schema to see if the legacy
-option is supported by looking at MachineInfo::numa-mem-supported property.
-
-``-mem-path`` fallback to RAM (removed in 5.0)
-''''''''''''''''''''''''''''''''''''''''''''''
-
-If guest RAM allocation from file pointed by ``mem-path`` failed,
-QEMU was falling back to allocating from RAM, which might have resulted
-in unpredictable behavior since the backing file specified by the user
-as ignored. Currently, users are responsible for making sure the backing storage
-specified with ``-mem-path`` can actually provide the guest RAM configured with
-``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
-
-``-smp`` (invalid topologies) (removed 5.2)
-'''''''''''''''''''''''''''''''''''''''''''
-
-CPU topology properties should describe whole machine topology including
-possible CPUs.
-
-However, historically it was possible to start QEMU with an incorrect topology
-where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
-which could lead to an incorrect topology enumeration by the guest.
-Support for invalid topologies is removed, the user must ensure
-topologies described with -smp include all possible cpus, i.e.
-*sockets* * *cores* * *threads* = *maxcpus*.
-
-``-machine enforce-config-section=on|off`` (removed 5.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``enforce-config-section`` property was replaced by the
-``-global migration.send-configuration={on|off}`` option.
-
-Block devices
--------------
-
-VXHS backend (removed in 5.1)
-'''''''''''''''''''''''''''''
-
-The VXHS code does not compile since v2.12.0. It was removed in 5.1.
diff --git a/docs/system/index.rst b/docs/system/index.rst
index e5a35817a2..d40f72c92b 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -35,5 +35,6 @@ Contents:
    targets
    security
    deprecated
+   removed-features
    build-platforms
    license
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
new file mode 100644
index 0000000000..8a974f7acd
--- /dev/null
+++ b/docs/system/removed-features.rst
@@ -0,0 +1,231 @@
+
+Removed features
+================
+
+What follows is a record of recently removed, formerly deprecated
+features that serves as a record for users who have encountered
+trouble after a recent upgrade.
+
+System emulator command line arguments
+--------------------------------------
+
+``-net ...,name=``\ *name* (removed in 5.1)
+'''''''''''''''''''''''''''''''''''''''''''
+
+The ``name`` parameter of the ``-net`` option was a synonym
+for the ``id`` parameter, which should now be used instead.
+
+``-no-kvm`` (removed in 5.2)
+''''''''''''''''''''''''''''
+
+The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
+
+``-tb-size`` option (removed in 6.0)
+''''''''''''''''''''''''''''''''''''
+
+QEMU 5.0 introduced an alternative syntax to specify the size of the translation
+block cache, ``-accel tcg,tb-size=``.
+
+QEMU Machine Protocol (QMP) commands
+------------------------------------
+
+``block-dirty-bitmap-add`` "autoload" parameter (removed in 4.2.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The "autoload" parameter has been ignored since 2.12.0. All bitmaps
+are automatically loaded from qcow2 images.
+
+``cpu-add`` (removed in 5.2)
+''''''''''''''''''''''''''''
+
+Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
+documentation of ``query-hotpluggable-cpus`` for additional details.
+
+Human Monitor Protocol (HMP) commands
+-------------------------------------
+
+The ``hub_id`` parameter of ``hostfwd_add`` / ``hostfwd_remove`` (removed in 5.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``[hub_id name]`` parameter tuple of the 'hostfwd_add' and
+'hostfwd_remove' HMP commands has been replaced by ``netdev_id``.
+
+``cpu-add`` (removed in 5.2)
+''''''''''''''''''''''''''''
+
+Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
+documentation of ``query-hotpluggable-cpus`` for additional details.
+
+Guest Emulator ISAs
+-------------------
+
+RISC-V ISA privilege specification version 1.09.1 (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The RISC-V ISA privilege specification version 1.09.1 has been removed.
+QEMU supports both the newer version 1.10.0 and the ratified version 1.11.0, these
+should be used instead of the 1.09.1 version.
+
+System emulator CPUS
+--------------------
+
+KVM guest support on 32-bit Arm hosts (removed in 5.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Linux kernel has dropped support for allowing 32-bit Arm systems
+to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecating
+its support for this configuration and will remove it in a future version.
+Running 32-bit guests on a 64-bit Arm host remains supported.
+
+RISC-V ISA Specific CPUs (removed in 5.1)
+'''''''''''''''''''''''''''''''''''''''''
+
+The RISC-V cpus with the ISA version in the CPU name have been removed. The
+four CPUs are: ``rv32gcsu-v1.9.1``, ``rv32gcsu-v1.10.0``, ``rv64gcsu-v1.9.1`` and
+``rv64gcsu-v1.10.0``. Instead the version can be specified via the CPU ``priv_spec``
+option when using the ``rv32`` or ``rv64`` CPUs.
+
+RISC-V no MMU CPUs (removed in 5.1)
+'''''''''''''''''''''''''''''''''''
+
+The RISC-V no MMU cpus have been removed. The two CPUs: ``rv32imacu-nommu`` and
+``rv64imacu-nommu`` can no longer be used. Instead the MMU status can be specified
+via the CPU ``mmu`` option when using the ``rv32`` or ``rv64`` CPUs.
+
+System emulator machines
+------------------------
+
+``spike_v1.9.1`` and ``spike_v1.10`` (removed in 5.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The version specific Spike machines have been removed in favour of the
+generic ``spike`` machine. If you need to specify an older version of the RISC-V
+spec you can use the ``-cpu rv64gcsu,priv_spec=v1.10.0`` command line argument.
+
+mips ``r4k`` platform (removed in 5.2)
+''''''''''''''''''''''''''''''''''''''
+
+This machine type was very old and unmaintained. Users should use the ``malta``
+machine type instead.
+
+Related binaries
+----------------
+
+``qemu-nbd --partition`` (removed in 5.0)
+'''''''''''''''''''''''''''''''''''''''''
+
+The ``qemu-nbd --partition $digit`` code (also spelled ``-P``)
+could only handle MBR partitions, and never correctly handled logical
+partitions beyond partition 5.  Exporting a partition can still be
+done by utilizing the ``--image-opts`` option with a raw blockdev
+using the ``offset`` and ``size`` parameters layered on top of
+any other existing blockdev. For example, if partition 1 is 100MiB
+long starting at 1MiB, the old command::
+
+  qemu-nbd -t -P 1 -f qcow2 file.qcow2
+
+can be rewritten as::
+
+  qemu-nbd -t --image-opts driver=raw,offset=1M,size=100M,file.driver=qcow2,file.file.driver=file,file.file.filename=file.qcow2
+
+``qemu-img convert -n -o`` (removed in 5.1)
+'''''''''''''''''''''''''''''''''''''''''''
+
+All options specified in ``-o`` are image creation options, so
+they are now rejected when used with ``-n`` to skip image creation.
+
+
+``qemu-img create -b bad file $size`` (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+When creating an image with a backing file that could not be opened,
+``qemu-img create`` used to issue a warning about the failure but
+proceed with the image creation if an explicit size was provided.
+However, as the ``-u`` option exists for this purpose, it is safer to
+enforce that any failure to open the backing image (including if the
+backing file is missing or an incorrect format was specified) is an
+error when ``-u`` is not used.
+
+Command line options
+--------------------
+
+``-smp`` (invalid topologies) (removed 5.2)
+'''''''''''''''''''''''''''''''''''''''''''
+
+CPU topology properties should describe whole machine topology including
+possible CPUs.
+
+However, historically it was possible to start QEMU with an incorrect topology
+where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
+which could lead to an incorrect topology enumeration by the guest.
+Support for invalid topologies is removed, the user must ensure
+topologies described with -smp include all possible cpus, i.e.
+*sockets* * *cores* * *threads* = *maxcpus*.
+
+``-numa`` node (without memory specified) (removed 5.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Splitting RAM by default between NUMA nodes had the same issues as ``mem``
+parameter with the difference that the role of the user plays QEMU using
+implicit generic or board specific splitting rule.
+Use ``memdev`` with *memory-backend-ram* backend or ``mem`` (if
+it's supported by used machine type) to define mapping explicitly instead.
+Users of existing VMs, wishing to preserve the same RAM distribution, should
+configure it explicitly using ``-numa node,memdev`` options. Current RAM
+distribution can be retrieved using HMP command ``info numa`` and if separate
+memory devices (pc|nv-dimm) are present use ``info memory-device`` and subtract
+device memory from output of ``info numa``.
+
+``-numa node,mem=``\ *size* (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''''''''
+
+The parameter ``mem`` of ``-numa node`` was used to assign a part of
+guest RAM to a NUMA node. But when using it, it's impossible to manage a specified
+RAM chunk on the host side (like bind it to a host node, setting bind policy, ...),
+so the guest ends up with the fake NUMA configuration with suboptiomal performance.
+However since 2014 there is an alternative way to assign RAM to a NUMA node
+using parameter ``memdev``, which does the same as ``mem`` and adds
+means to actually manage node RAM on the host side. Use parameter ``memdev``
+with *memory-backend-ram* backend as replacement for parameter ``mem``
+to achieve the same fake NUMA effect or a properly configured
+*memory-backend-file* backend to actually benefit from NUMA configuration.
+New machine versions (since 5.1) will not accept the option but it will still
+work with old machine types. User can check the QAPI schema to see if the legacy
+option is supported by looking at MachineInfo::numa-mem-supported property.
+
+``-mem-path`` fallback to RAM (removed in 5.0)
+''''''''''''''''''''''''''''''''''''''''''''''
+
+If guest RAM allocation from file pointed by ``mem-path`` failed,
+QEMU was falling back to allocating from RAM, which might have resulted
+in unpredictable behavior since the backing file specified by the user
+as ignored. Currently, users are responsible for making sure the backing storage
+specified with ``-mem-path`` can actually provide the guest RAM configured with
+``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
+
+``-smp`` (invalid topologies) (removed 5.2)
+'''''''''''''''''''''''''''''''''''''''''''
+
+CPU topology properties should describe whole machine topology including
+possible CPUs.
+
+However, historically it was possible to start QEMU with an incorrect topology
+where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
+which could lead to an incorrect topology enumeration by the guest.
+Support for invalid topologies is removed, the user must ensure
+topologies described with -smp include all possible cpus, i.e.
+*sockets* * *cores* * *threads* = *maxcpus*.
+
+``-machine enforce-config-section=on|off`` (removed 5.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``enforce-config-section`` property was replaced by the
+``-global migration.send-configuration={on|off}`` option.
+
+Block devices
+-------------
+
+VXHS backend (removed in 5.1)
+'''''''''''''''''''''''''''''
+
+The VXHS code did not compile since v2.12.0. It was removed in 5.1.
-- 
2.26.2



