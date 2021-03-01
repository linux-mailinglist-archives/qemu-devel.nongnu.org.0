Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27DB327C9A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:52:04 +0100 (CET)
Received: from localhost ([::1]:44864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGg9j-0008Sl-Lf
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lGg6e-0005Vc-AL
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:48:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lGg6b-0001ud-R7
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614595728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rWoewBUSSLDMPov80zzzO/46AQpKReIXBFuCoaWuaU0=;
 b=OzKGuXgFpxEHnlsH90fjMa03WfUJtBud2LmmlBv1EO9YNX2CGQOy2++lJJsDiN2tlQ1BdE
 C9Tf0YxJOt1rMuOw4Gd+jnf8zzxLjz2+qbSIztuoZ7z+QzAM7hVn6YFmoxEctZq+V3JzSB
 I6LznCUKnH1A+yYW2eWz1UGbmTUN2FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-S1E4nv12NFmUW2DyMlArMg-1; Mon, 01 Mar 2021 05:48:47 -0500
X-MC-Unique: S1E4nv12NFmUW2DyMlArMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C2AF8030C2;
 Mon,  1 Mar 2021 10:48:45 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B2AB5D9E2;
 Mon,  1 Mar 2021 10:48:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Date: Mon,  1 Mar 2021 11:48:33 +0100
Message-Id: <20210301104833.45580-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The resizeable memory region that is created for the cmd blob has a maximum
size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,
as we try fitting in additional data (e.g., vmgenid, nvdimm, intel-iommu),
we require more than 4k and can crash QEMU when trying to resize the
resizeable memory region beyond its maximum size:
  $ build/qemu-system-x86_64 --enable-kvm \
      -machine q35,nvdimm=on \
      -smp 1 \
      -cpu host \
      -m size=2G,slots=8,maxmem=4G \
      -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
      -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
      -nodefaults \
      -device vmgenid \
      -device intel-iommu

Results in:
  Unexpected error in qemu_ram_resize() at ../softmmu/physmem.c:1850:
  qemu-system-x86_64: Size too large: /rom@etc/table-loader:
    0x2000 > 0x1000: Invalid argument

We try growing the resizeable memory region (resizeable RAMBlock) beyond
its maximum size. Let's increase the maximum size from 4k to 64k, which
should be good enough for the near future.

Migration is not concerned with the maximum size of a RAMBlock, only
with the used size - so existing setups are not affected. Of course, we
cannot migrate a VM that would have crash when started on older QEMU from
new QEMU to older QEMU without failing early on the destination when
synchronizing the RAM state:
    qemu-system-x86_64: Size too large: /rom@etc/table-loader: 0x2000 > 0x1000: Invalid argument
    qemu-system-x86_64: error while loading state for instance 0x0 of device 'ram'
    qemu-system-x86_64: load of migration failed: Invalid argument

While at it, replace "etc/table-loader" by ACPI_BUILD_LOADER_FILE in
the microvm.

Note: we could warn for problematic setups that migration might not
always be possible - similar to how we handle the table blob; or we
could disallow setups that would have crashed until now for compat
machines. But I am not sure if the effort (messing compat machine
properties) is worth it as we fail migration in a safe way early.

Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/arm/virt-acpi-build.c    | 3 ++-
 hw/i386/acpi-build.c        | 3 ++-
 hw/i386/acpi-microvm.c      | 3 ++-
 include/hw/acpi/aml-build.h | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f9c9df916c..a91550de6f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -865,7 +865,8 @@ void virt_acpi_setup(VirtMachineState *vms)
 
     build_state->linker_mr =
         acpi_add_rom_blob(virt_acpi_build_update, build_state,
-                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
+                          ACPI_BUILD_LOADER_MAX_SIZE);
 
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 31a5f6f4a5..a75138ea5a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2524,7 +2524,8 @@ void acpi_setup(void)
 
     build_state->linker_mr =
         acpi_add_rom_blob(acpi_build_update, build_state,
-                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
+                          ACPI_BUILD_LOADER_MAX_SIZE);
 
     fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 54b3af478a..fe8a965fe6 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -255,7 +255,8 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
                       ACPI_BUILD_TABLE_MAX_SIZE);
     acpi_add_rom_blob(acpi_build_no_update, NULL,
                       tables.linker->cmd_blob,
-                      "etc/table-loader", 0);
+                      ACPI_BUILD_LOADER_FILE,
+                      ACPI_BUILD_LOADER_MAX_SIZE);
     acpi_add_rom_blob(acpi_build_no_update, NULL,
                       tables.rsdp,
                       ACPI_BUILD_RSDP_FILE, 0);
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 380d3e3924..93cdfd4006 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -6,6 +6,7 @@
 
 /* Reserve RAM space for tables: add another order of magnitude. */
 #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
+#define ACPI_BUILD_LOADER_MAX_SIZE        0x40000
 
 #define ACPI_BUILD_APPNAME6 "BOCHS "
 #define ACPI_BUILD_APPNAME8 "BXPC    "
-- 
2.29.2


