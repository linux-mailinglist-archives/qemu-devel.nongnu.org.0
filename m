Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5792382AAD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:14:51 +0200 (CEST)
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libD0-00014w-Rg
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libAF-0004jv-Ss
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libAD-0000hb-NE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h4so5916503wrt.12
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qLnUMc2y6eDRItTW4VeORDdidVMiw8X3B7SFgMR2mX8=;
 b=t0cxv2irox1PvUN9N+cagqlKZ+LGoup/6zb8xTF3QRdh1nvuVWedfm4Tz/xqZAkFAS
 gf2ixGh+TKuxRNrau3HCE9KbiygO5a5dkxY+bsIJnUzsmUenQ1UVj4trFkBXzs+8/sIG
 ZOla/u+0Tdf7sMN1T1Hg07Q7FQcL0NZ+omUpcGlNtx1TPst3aIvO4y6vtOZz7SWUytDE
 +LsUgkrsig8r/oERwseGwk7//PzH9peYhs460uAs/pxnzc24sfRPsX5Tmkz3Qa0HH1Hd
 Ei0JxCeQHPv2r8lNt1PO01iRwiiFlXxQfs8jHp+TuQg+eC2G7AyElK8ksdHVKq9HuUGY
 +hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qLnUMc2y6eDRItTW4VeORDdidVMiw8X3B7SFgMR2mX8=;
 b=ZHwp/L155xRjO1oEKybIwBTj5bzi7NnO/HQYDNjY+NahCCNmaDzDiPP41/spW2EXO8
 IgAXitotDXs4CKYN+iDpY3plK4MTLAc98y+iaMBtPycqVjD2WCaK5k6GINwSrAT6Huk3
 nzsPL+pxa0T9HggSM1qA1JADPcf0vqo9oWeLl8XzIKGpi66Ku4ClXAe5s9Jlpm+o3AuR
 hZcQFX15aMtz9WmvYuUGQxqbnp+TeRRBTVoC5+zGFUqsbW82QhUvN5E757wp/GFb5SF6
 0qCrY2PWgmFeHymUOHMDKs2CQvo/MmYvXZUHgEqX5RPG772NW7qQkHD0u5ECetZ7izfB
 ChAg==
X-Gm-Message-State: AOAM5302FvW6FHi03qiAfbQt7RbLQ/a/2m5dt1Uf2ALLsCVAQaPAjKZZ
 iMa0bBJ5osxZFjwK1B+X44QJWNyWtB+eCQ==
X-Google-Smtp-Source: ABdhPJwx1h2JI2XyVSUkbV0MdI3189JgVHF6ayHy3VYTbRQUbCObeIfXVGYffNnVNGkH6T0VxrF2bg==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr5078022wrs.276.1621249916083; 
 Mon, 17 May 2021 04:11:56 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id o21sm17467904wrf.91.2021.05.17.04.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:11:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] exec: Restrict ram_addr.h to sysemu/
Date: Mon, 17 May 2021 13:11:09 +0200
Message-Id: <20210517111111.1068153-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make it clearer the ram_addr.h header is sysemu specific,
move it to the sysemu/ directory.

Patch created mechanically using:

  $ sed -i s,exec/ram_addr.h,sysemu/ram_addr.h, $(git grep -l exec/ram_addr.h)

Then the #ifdef'ry conditional on CONFIG_USER_ONLY has
been replaced by an #error.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/{exec => sysemu}/ram_addr.h | 11 +++++++----
 accel/kvm/kvm-all.c                 |  2 +-
 accel/tcg/cputlb.c                  |  2 +-
 accel/tcg/translate-all.c           |  2 +-
 hw/ppc/spapr.c                      |  2 +-
 hw/ppc/spapr_caps.c                 |  2 +-
 hw/ppc/spapr_pci.c                  |  2 +-
 hw/remote/memory.c                  |  2 +-
 hw/remote/proxy-memory-listener.c   |  2 +-
 hw/s390x/s390-stattrib-kvm.c        |  2 +-
 hw/s390x/s390-stattrib.c            |  2 +-
 hw/s390x/s390-virtio-ccw.c          |  2 +-
 hw/vfio/common.c                    |  2 +-
 hw/vfio/migration.c                 |  2 +-
 hw/vfio/spapr.c                     |  2 +-
 hw/virtio/virtio-mem.c              |  2 +-
 migration/ram.c                     |  2 +-
 plugins/api.c                       |  2 +-
 softmmu/memory.c                    |  2 +-
 softmmu/physmem.c                   |  2 +-
 target/arm/mte_helper.c             |  2 +-
 target/ppc/kvm.c                    |  2 +-
 target/s390x/kvm.c                  |  2 +-
 MAINTAINERS                         |  2 +-
 24 files changed, 30 insertions(+), 27 deletions(-)
 rename include/{exec => sysemu}/ram_addr.h (99%)

diff --git a/include/exec/ram_addr.h b/include/sysemu/ram_addr.h
similarity index 99%
rename from include/exec/ram_addr.h
rename to include/sysemu/ram_addr.h
index 3cb9791df3b..d495c969f9f 100644
--- a/include/exec/ram_addr.h
+++ b/include/sysemu/ram_addr.h
@@ -16,10 +16,13 @@
  * The functions declared here will be removed soon.
  */
 
-#ifndef RAM_ADDR_H
-#define RAM_ADDR_H
+#ifndef SYSEMU_RAM_ADDR_H
+#define SYSEMU_RAM_ADDR_H
+
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu specific header from user emulation
+#endif
 
-#ifndef CONFIG_USER_ONLY
 #include "cpu.h"
 #include "sysemu/xen.h"
 #include "sysemu/tcg.h"
@@ -513,5 +516,5 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
 
     return num_dirty;
 }
-#endif
+
 #endif
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 204fc0403ca..bc40fa4fee7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -32,7 +32,7 @@
 #include "sysemu/cpus.h"
 #include "qemu/bswap.h"
 #include "exec/sysemu/memory.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "qemu/event_notifier.h"
 #include "qemu/main-loop.h"
 #include "trace.h"
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 14a4ee4ed63..d93e37c9c3e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -26,7 +26,7 @@
 #include "exec/sysemu/cputlb.h"
 #include "exec/tb-hash.h"
 #include "exec/sysemu/memory-internal.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "tcg/tcg.h"
 #include "qemu/error-report.h"
 #include "exec/log.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 98a07ce4e4e..86340e4989b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -44,7 +44,7 @@
 #endif
 #else /* !CONFIG_USER_ONLY */
 #include "exec/sysemu/cputlb.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #endif /* CONFIG_USER_ONLY */
 
 #include "exec/tb-hash.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8f40319aee8..bf8f0a4b347 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -69,7 +69,7 @@
 #include "hw/virtio/virtio-scsi.h"
 #include "hw/virtio/vhost-scsi-common.h"
 
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "hw/usb.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 9ea7ddd1e9a..97f2b5aafa3 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -27,7 +27,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "sysemu/hw_accel.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "target/ppc/cpu.h"
 #include "target/ppc/mmu-hash64.h"
 #include "cpu-models.h"
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7a725855f91..b0b6204870f 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -34,7 +34,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/ppc/spapr.h"
 #include "hw/pci-host/spapr.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include <libfdt.h>
 #include "trace.h"
 #include "qemu/error-report.h"
diff --git a/hw/remote/memory.c b/hw/remote/memory.c
index 2d4174614af..8606ae15eb5 100644
--- a/hw/remote/memory.c
+++ b/hw/remote/memory.c
@@ -12,7 +12,7 @@
 #include "qemu-common.h"
 
 #include "hw/remote/memory.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "qapi/error.h"
 
 static void remote_sysmem_reset(void)
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index d9bed35fa2f..25779463523 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -14,7 +14,7 @@
 #include "qemu/range.h"
 #include "exec/sysemu/memory.h"
 #include "exec/cpu-common.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "qapi/error.h"
 #include "hw/remote/mpqemu-link.h"
 #include "hw/remote/proxy-memory-listener.h"
diff --git a/hw/s390x/s390-stattrib-kvm.c b/hw/s390x/s390-stattrib-kvm.c
index f0b11a74e49..8354c4bc750 100644
--- a/hw/s390x/s390-stattrib-kvm.c
+++ b/hw/s390x/s390-stattrib-kvm.c
@@ -15,7 +15,7 @@
 #include "hw/s390x/storage-attributes.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "kvm_s390x.h"
 
 Object *kvm_s390_stattrib_create(void)
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 9eda1c3b2a2..4bc34fbd069 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -15,7 +15,7 @@
 #include "migration/register.h"
 #include "hw/s390x/storage-attributes.h"
 #include "qemu/error-report.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 7af27ca3057..9a8d6405a13 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "hw/s390x/s390-virtio-hcall.h"
 #include "hw/s390x/sclp.h"
 #include "hw/s390x/s390_flic.h"
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 91171e4f658..66ecb1f458a 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -29,7 +29,7 @@
 #include "hw/vfio/vfio.h"
 #include "exec/sysemu/address-spaces.h"
 #include "exec/sysemu/memory.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "hw/hw.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 201642d75e6..343069065e8 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -23,7 +23,7 @@
 #include "migration/misc.h"
 #include "qapi/error.h"
 #include "exec/ramlist.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "pci.h"
 #include "trace.h"
 #include "hw/hw.h"
diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c
index ea3f70bd2fa..7db2901db86 100644
--- a/hw/vfio/spapr.c
+++ b/hw/vfio/spapr.c
@@ -14,7 +14,7 @@
 
 #include "hw/vfio/vfio-common.h"
 #include "hw/hw.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "trace.h"
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 75aa7d6f1b1..b09cd5001ea 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -25,7 +25,7 @@
 #include "hw/virtio/virtio-mem.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "migration/misc.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
diff --git a/migration/ram.c b/migration/ram.c
index 60ea913c543..1a92983fb50 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -45,7 +45,7 @@
 #include "qapi/qapi-events-migration.h"
 #include "qapi/qmp/qerror.h"
 #include "trace.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "exec/target_page.h"
 #include "qemu/rcu_queue.h"
 #include "migration/colo.h"
diff --git a/plugins/api.c b/plugins/api.c
index 817c9b6b69c..b114246c357 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -38,7 +38,7 @@
 #include "qemu/plugin.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "disas/disas.h"
 #include "plugin.h"
 #ifndef CONFIG_USER_ONLY
diff --git a/softmmu/memory.c b/softmmu/memory.c
index cdc935cdd27..411f6f9ac25 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -26,7 +26,7 @@
 #include "trace.h"
 
 #include "exec/sysemu/memory-internal.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/tcg.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 51f05eb989c..d8a5deb18ea 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -59,7 +59,7 @@
 #include "sysemu/replay.h"
 
 #include "exec/sysemu/memory-internal.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "exec/log.h"
 
 #include "qemu/pmem.h"
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index a6fccc6e69e..455c2e80d31 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "qapi/error.h"
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb5..5b9ce0a25a5 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -43,7 +43,7 @@
 #include "trace.h"
 #include "exec/gdbstub.h"
 #include "exec/memattrs.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "sysemu/hostmem.h"
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 4fb3bbfef50..aa135acb7aa 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -42,7 +42,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/device_tree.h"
 #include "exec/gdbstub.h"
-#include "exec/ram_addr.h"
+#include "sysemu/ram_addr.h"
 #include "trace.h"
 #include "hw/s390x/s390-pci-inst.h"
 #include "hw/s390x/s390-pci-bus.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index ca8d0feb2bd..8caf3891dba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2401,7 +2401,7 @@ S: Supported
 F: include/sysemu/ioport.h
 F: include/exec/memop.h
 F: include/exec/sysemu/memory.h
-F: include/exec/ram_addr.h
+F: include/sysemu/ram_addr.h
 F: include/exec/ramblock.h
 F: softmmu/dma-helpers.c
 F: softmmu/ioport.c
-- 
2.26.3


