Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108228C28F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 22:38:16 +0200 (CEST)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS4aF-0007rt-Hf
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 16:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kS4WD-0002l9-7m
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kS4WB-0002fk-AF
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602534842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqtkvJn/koXtv1XWNJBim3+2Iy6z8DCvQCk2D5rEgi0=;
 b=A4dox/fPqwCpmBTUT+jVM1Wdfad0OPCmhHkDEHegcS9R/RfsiQ2R/QJ645kOmv7kP/xoMj
 Xj2fQZ81shr/KhNQ2XOm4aXBCCaxXcAg4m/jv81Mf/CHWrNyWTIp6J+WuRGIPQaXKUycL6
 WYREv3xB3MTYX8iHINLHp8UsGI4+cLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-DPihSqHiPVekkB27sxFp3w-1; Mon, 12 Oct 2020 16:33:59 -0400
X-MC-Unique: DPihSqHiPVekkB27sxFp3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3296C8B8D1E
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 20:33:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF5A85D9CD
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 20:33:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/38] softmmu: move more files to softmmu/
Date: Mon, 12 Oct 2020 16:33:16 -0400
Message-Id: <20201012203343.1105018-12-pbonzini@redhat.com>
In-Reply-To: <20201012203343.1105018-1-pbonzini@redhat.com>
References: <20201012203343.1105018-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep most softmmu_ss files into the system-emulation-specific
directory.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS                              |  9 +++++----
 meson.build                              | 10 ----------
 bootdevice.c => softmmu/bootdevice.c     |  0
 device_tree.c => softmmu/device_tree.c   |  0
 dma-helpers.c => softmmu/dma-helpers.c   |  0
 softmmu/meson.build                      | 10 ++++++++++
 qdev-monitor.c => softmmu/qdev-monitor.c |  0
 qemu-seccomp.c => softmmu/qemu-seccomp.c |  0
 tpm.c => softmmu/tpm.c                   |  0
 9 files changed, 15 insertions(+), 14 deletions(-)
 rename bootdevice.c => softmmu/bootdevice.c (100%)
 rename device_tree.c => softmmu/device_tree.c (100%)
 rename dma-helpers.c => softmmu/dma-helpers.c (100%)
 rename qdev-monitor.c => softmmu/qdev-monitor.c (100%)
 rename qemu-seccomp.c => softmmu/qemu-seccomp.c (100%)
 rename tpm.c => softmmu/tpm.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d50b96c33..dda54f000d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2235,7 +2235,7 @@ Device Tree
 M: Alistair Francis <alistair.francis@wdc.com>
 R: David Gibson <david@gibson.dropbear.id.au>
 S: Maintained
-F: device_tree.c
+F: softmmu/device_tree.c
 F: include/sysemu/device_tree.h
 
 Dump
@@ -2281,6 +2281,7 @@ F: include/exec/memop.h
 F: include/exec/memory.h
 F: include/exec/ram_addr.h
 F: include/exec/ramblock.h
+F: softmmu/dma-helpers.c
 F: softmmu/ioport.c
 F: softmmu/memory.c
 F: include/exec/memory-internal.h
@@ -2461,7 +2462,7 @@ F: include/monitor/qdev.h
 F: include/qom/
 F: qapi/qom.json
 F: qapi/qdev.json
-F: qdev-monitor.c
+F: softmmu/qdev-monitor.c
 F: qom/
 F: tests/check-qom-interface.c
 F: tests/check-qom-proplist.c
@@ -2591,7 +2592,7 @@ F: docs/interop/dbus-vmstate.rst
 Seccomp
 M: Eduardo Otubo <otubo@redhat.com>
 S: Supported
-F: qemu-seccomp.c
+F: softmmu/qemu-seccomp.c
 F: include/sysemu/seccomp.h
 
 Cryptography
@@ -2957,7 +2958,7 @@ T: git https://github.com/stefanha/qemu.git block
 Bootdevice
 M: Gonglei <arei.gonglei@huawei.com>
 S: Maintained
-F: bootdevice.c
+F: softmmu/bootdevice.c
 
 Quorum
 M: Alberto Garcia <berto@igalia.com>
diff --git a/meson.build b/meson.build
index f4ef3b83f3..a280e4cf21 100644
--- a/meson.build
+++ b/meson.build
@@ -1365,17 +1365,7 @@ blockdev_ss.add(files(
 # os-win32.c does not
 blockdev_ss.add(when: 'CONFIG_POSIX', if_true: files('os-posix.c'))
 softmmu_ss.add(when: 'CONFIG_WIN32', if_true: [files('os-win32.c')])
-
 softmmu_ss.add_all(blockdev_ss)
-softmmu_ss.add(files(
-  'bootdevice.c',
-  'dma-helpers.c',
-  'qdev-monitor.c',
-), sdl)
-
-softmmu_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
-softmmu_ss.add(when: 'CONFIG_SECCOMP', if_true: [files('qemu-seccomp.c'), seccomp])
-softmmu_ss.add(when: fdt, if_true: files('device_tree.c'))
 
 common_ss.add(files('cpus-common.c'))
 
diff --git a/bootdevice.c b/softmmu/bootdevice.c
similarity index 100%
rename from bootdevice.c
rename to softmmu/bootdevice.c
diff --git a/device_tree.c b/softmmu/device_tree.c
similarity index 100%
rename from device_tree.c
rename to softmmu/device_tree.c
diff --git a/dma-helpers.c b/softmmu/dma-helpers.c
similarity index 100%
rename from dma-helpers.c
rename to softmmu/dma-helpers.c
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 36c96e7b15..862ab24878 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -14,3 +14,13 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
   'icount.c'
 )])
+
+softmmu_ss.add(files(
+  'bootdevice.c',
+  'dma-helpers.c',
+  'qdev-monitor.c',
+), sdl)
+
+softmmu_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
+softmmu_ss.add(when: 'CONFIG_SECCOMP', if_true: [files('qemu-seccomp.c'), seccomp])
+softmmu_ss.add(when: fdt, if_true: files('device_tree.c'))
diff --git a/qdev-monitor.c b/softmmu/qdev-monitor.c
similarity index 100%
rename from qdev-monitor.c
rename to softmmu/qdev-monitor.c
diff --git a/qemu-seccomp.c b/softmmu/qemu-seccomp.c
similarity index 100%
rename from qemu-seccomp.c
rename to softmmu/qemu-seccomp.c
diff --git a/tpm.c b/softmmu/tpm.c
similarity index 100%
rename from tpm.c
rename to softmmu/tpm.c
-- 
2.26.2



