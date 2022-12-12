Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777BA64A637
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:50:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4mv8-0008PW-Qi; Mon, 12 Dec 2022 12:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4mv6-0008P7-Ng
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:48:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4mv4-0003GT-O2
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670867329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WOW9Zon+awUoDJZ6fp7jle2QxCdJk2iYBOjv0ZKyl78=;
 b=CqoUqKT+Xx942/tA0G+SSvM/akFwXfw6EK8uXoeseXFM32BPAAx3lFrIwtSja/iNjKmTjr
 DJp+aN7rvlNaZGlaOQgPGDp7dZYFlnitw0WEODotA4udWYb3O4tmvKhQg/8DhIf6amWKW4
 zXWwQQaVCkuzQHerR01vqxxD0SSLU7s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-USyfkwoLPyCnzdKrr4NOLQ-1; Mon, 12 Dec 2022 12:48:46 -0500
X-MC-Unique: USyfkwoLPyCnzdKrr4NOLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F914185A79C;
 Mon, 12 Dec 2022 17:48:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 931791121331;
 Mon, 12 Dec 2022 17:48:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Add documentation files to the corresponding
 sections
Date: Mon, 12 Dec 2022 18:48:41 +0100
Message-Id: <20221212174841.201003-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

A lot of files in the docs directory do not have a maintainer according to
our MAINTAINERS file, though they can be clearly associated with one of the
sections in there. Add the files now so that our scripts/get_maintainer.pl
script can output the right maintainer for them.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4e0e2ba36f..a0d8e9b086 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -78,6 +78,7 @@ M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
 L: qemu-trivial@nongnu.org
 K: ^Subject:.*(?i)trivial
+F: docs/devel/trivial-patches.rst
 T: git git://git.corpit.ru/qemu.git trivial-patches
 T: git https://github.com/vivier/qemu.git trivial-patches
 
@@ -131,6 +132,7 @@ F: util/cacheinfo.c
 F: util/cacheflush.c
 F: scripts/decodetree.py
 F: docs/devel/decodetree.rst
+F: docs/devel/tcg*
 F: include/exec/cpu*.h
 F: include/exec/exec-all.h
 F: include/exec/helper*.h
@@ -256,6 +258,7 @@ F: tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
 OpenRISC TCG CPUs
 M: Stafford Horne <shorne@gmail.com>
 S: Odd Fixes
+F: docs/system/openrisc/cpu-features.rst
 F: target/openrisc/
 F: hw/openrisc/
 F: tests/tcg/openrisc/
@@ -334,6 +337,7 @@ F: target/i386/tcg/
 F: tests/tcg/i386/
 F: tests/tcg/x86_64/
 F: hw/i386/
+F: docs/system/i386/cpu.rst
 F: docs/system/cpu-models-x86*
 T: git https://gitlab.com/ehabkost/qemu.git x86-next
 
@@ -875,6 +879,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 R: Jean-Christophe Dubois <jcd@tribudubois.net>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
+F: docs/system/arm/sabrelite.rst
 F: hw/arm/sabrelite.c
 F: hw/arm/fsl-imx6.c
 F: hw/misc/imx6_*.c
@@ -1275,6 +1280,7 @@ OpenRISC Machines
 or1k-sim
 M: Jia Liu <proljc@gmail.com>
 S: Maintained
+F: docs/system/openrisc/or1k-sim.rst
 F: hw/openrisc/openrisc_sim.c
 
 PowerPC Machines
@@ -2018,6 +2024,7 @@ F: hw/virtio/trace-events
 F: qapi/virtio.json
 F: net/vhost-user.c
 F: include/hw/virtio/
+F: docs/devel/virtio*
 
 virtio-balloon
 M: Michael S. Tsirkin <mst@redhat.com>
@@ -2110,7 +2117,7 @@ F: tests/qtest/virtio-rng-test.c
 vhost-user-rng
 M: Mathieu Poirier <mathieu.poirier@linaro.org>
 S: Supported
-F: docs/tools/vhost-user-rng.rst
+F: docs/system/devices/vhost-user-rng.rst
 F: hw/virtio/vhost-user-rng.c
 F: hw/virtio/vhost-user-rng-pci.c
 F: include/hw/virtio/vhost-user-rng.h
@@ -2148,7 +2155,7 @@ S: Supported
 F: hw/nvme/*
 F: include/block/nvme.h
 F: tests/qtest/nvme-test.c
-F: docs/system/nvme.rst
+F: docs/system/devices/nvme.rst
 T: git git://git.infradead.org/qemu-nvme.git nvme-next
 
 megasas
@@ -2698,6 +2705,7 @@ GDB stub
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
+F: docs/system/gdb.rst
 F: gdbstub/*
 F: include/exec/gdbstub.h
 F: gdb-xml/
@@ -2755,6 +2763,7 @@ F: ui/
 F: include/ui/
 F: qapi/ui.json
 F: util/drm.c
+F: docs/devel/ui.rst
 
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -2932,6 +2941,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 R: Daniel P. Berrange <berrange@redhat.com>
 R: Eduardo Habkost <eduardo@habkost.net>
 S: Supported
+F: docs/devel/qom.rst
 F: docs/qdev-device-use.txt
 F: hw/core/qdev*
 F: hw/core/bus.c
@@ -2980,6 +2990,7 @@ F: softmmu/qtest.c
 F: accel/qtest/
 F: tests/qtest/
 F: docs/devel/qgraph.rst
+F: docs/devel/qtest.rst
 X: tests/qtest/bios-tables-test*
 
 Device Fuzzing
@@ -3046,6 +3057,7 @@ F: include/sysemu/tpm*
 F: qapi/tpm.json
 F: backends/tpm/
 F: tests/qtest/*tpm*
+F: docs/specs/tpm.rst
 T: git https://github.com/stefanberger/qemu-tpm.git tpm-next
 
 Checkpatch
@@ -3197,7 +3209,8 @@ F: replay/*
 F: block/blkreplay.c
 F: net/filter-replay.c
 F: include/sysemu/replay.h
-F: docs/replay.txt
+F: docs/devel/replay.rst
+F: docs/system/replay.rst
 F: stubs/replay.c
 F: tests/avocado/replay_kernel.py
 F: tests/avocado/replay_linux.py
@@ -3721,6 +3734,7 @@ F: tests/docker/
 F: tests/vm/
 F: tests/lcitool/
 F: scripts/archive-source.sh
+F: docs/devel/testing.rst
 W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
 
-- 
2.31.1


