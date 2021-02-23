Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CE7322E67
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:10:08 +0100 (CET)
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaGF-0003GA-SM
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaDM-0008Nw-P5
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaDK-00055f-L7
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NrrvOn2GdC903n9L0Q1WcYL9sqmxTBW1FrCpeOujpdA=;
 b=D/r16JJVdTgzmwwZLbGPW2ART9FcG7AUYv1xtxzPxEvlE3c5hClh/EzuSLzaztvGRZL8ma
 dMaPccwFf5VTbSRt2BgO8YI1vqFDLdVRP0jhPwsJaXkgGzXhH0gYI3OjZ06Lk9nWRo7BJ3
 eL1mrZq2Pnc/kmaf6kpqRZf0S0AYbKo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-lmt0FB8JOneMySmi3INsTQ-1; Tue, 23 Feb 2021 11:04:13 -0500
X-MC-Unique: lmt0FB8JOneMySmi3INsTQ-1
Received: by mail-wm1-f72.google.com with SMTP id 13so827186wmk.0
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NrrvOn2GdC903n9L0Q1WcYL9sqmxTBW1FrCpeOujpdA=;
 b=VlW/0xYd1AnMFIsK5kTnCeuZyrgzqG1bXBebMt8oUwWAuIZKjD5/lxNJk9GvIlqVRI
 qcEMh1MDY7sEp8z7/IKbUP7PSBhQWsiSkRUxV0/p3RlgDgd/rwaJgKd4cHZecqYhaNfJ
 V+JC/VE+QChQqSg7WuFOhEte97AHVJYEphgNZQ35p/eWKLVSqqAC6ATCFsPt8GDbTqWR
 4edJ2Fe/1ly1wrhv07HPu+GRUuKl/ALGBJAsQ/JbMItyLy9Az5kGz0ZlVjSLLTlrpP2+
 48j5N91QlegFxqxBogCG1bcYVtNJofOIy46pWOu/L/TAIgZQh9LSoZqoue+/nJrhULwk
 cjeQ==
X-Gm-Message-State: AOAM530aN7oi+UmB4bM8vNPSLl31OJX+Zfdf0TLH2sjxonkMl6x3J4Z6
 X+cou7qgiRABzLiQuoD8CzHrJhA3O61QpRyVvNKLSm0UQwA3TdfhAnMNBJ52ybJWQPRiTphyw1K
 VTyaNqFCQ1MpCevfw8SDlTWArzj0er+rcMHYHyQ25uWUWnVCsxc/MHsUBSPK9
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr24396560wrr.217.1614096249798; 
 Tue, 23 Feb 2021 08:04:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLHVKg16w0boMAQctQSwzyNRoVN2kay1bhy6Kn1H2bMpMS7ohLyR5swIwIX3KiidC8JfsyCg==
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr24396524wrr.217.1614096249565; 
 Tue, 23 Feb 2021 08:04:09 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id d29sm26593645wra.51.2021.02.23.08.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:04:09 -0800 (PST)
Date: Tue, 23 Feb 2021 11:04:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/17] acpi/core: always set SCI_EN when SMM isn't supported
Message-ID: <20210223160144.1507082-12-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

If SMM is not supported, ACPI fixed hardware doesn't support
legacy-mode. ACPI-only platform. Where SCI_EN in PM1_CNT register is
always set.
The bit tells OS legacy mode(SCI_EN cleared) or ACPI mode(SCI_EN set).

With the next patch (setting fadt.smi_cmd = 0 when smm isn't enabled),
guest Linux tries to switch to ACPI mode, finds smi_cmd = 0, and then
fails to initialize acpi subsystem. This patch proactively fixes it.

This patch changes guest ABI. To keep compatibility, use
"smm-compat" introduced by earlier patch. If the property is true,
disable new behavior.

ACPI spec 4.8.10.1 PM1 Event Grouping
PM1 Eanble Registers
> For ACPI-only platforms (where SCI_EN is always set)

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <500f62081626997e46f96377393d3662211763a8.1613615732.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi.h |  4 +++-
 hw/acpi/core.c         | 11 ++++++++++-
 hw/acpi/ich9.c         |  2 +-
 hw/acpi/piix4.c        |  3 ++-
 hw/core/machine.c      |  5 ++++-
 hw/isa/vt82c686.c      |  2 +-
 6 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 22b0b65bb2..9e8a76f2e2 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -128,6 +128,7 @@ struct ACPIPM1CNT {
     MemoryRegion io;
     uint16_t cnt;
     uint8_t s4_val;
+    bool acpi_only;
 };
 
 struct ACPIGPE {
@@ -163,7 +164,8 @@ void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
 
 /* PM1a_CNT: piix and ich9 don't implement PM1b CNT. */
 void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
-                       bool disable_s3, bool disable_s4, uint8_t s4_val);
+                       bool disable_s3, bool disable_s4, uint8_t s4_val,
+                       bool acpi_only);
 void acpi_pm1_cnt_update(ACPIREGS *ar,
                          bool sci_enable, bool sci_disable);
 void acpi_pm1_cnt_reset(ACPIREGS *ar);
diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 7170bff657..1e004d0078 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -579,6 +579,10 @@ void acpi_pm1_cnt_update(ACPIREGS *ar,
                          bool sci_enable, bool sci_disable)
 {
     /* ACPI specs 3.0, 4.7.2.5 */
+    if (ar->pm1.cnt.acpi_only) {
+        return;
+    }
+
     if (sci_enable) {
         ar->pm1.cnt.cnt |= ACPI_BITMASK_SCI_ENABLE;
     } else if (sci_disable) {
@@ -608,11 +612,13 @@ static const MemoryRegionOps acpi_pm_cnt_ops = {
 };
 
 void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
-                       bool disable_s3, bool disable_s4, uint8_t s4_val)
+                       bool disable_s3, bool disable_s4, uint8_t s4_val,
+                       bool acpi_only)
 {
     FWCfgState *fw_cfg;
 
     ar->pm1.cnt.s4_val = s4_val;
+    ar->pm1.cnt.acpi_only = acpi_only;
     ar->wakeup.notify = acpi_notify_wakeup;
     qemu_register_wakeup_notifier(&ar->wakeup);
 
@@ -638,6 +644,9 @@ void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
 void acpi_pm1_cnt_reset(ACPIREGS *ar)
 {
     ar->pm1.cnt.cnt = 0;
+    if (ar->pm1.cnt.acpi_only) {
+        ar->pm1.cnt.cnt |= ACPI_BITMASK_SCI_ENABLE;
+    }
 }
 
 /* ACPI GPE */
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 5ff4e01c36..853447cf9d 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -282,7 +282,7 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
     acpi_pm_tmr_init(&pm->acpi_regs, ich9_pm_update_sci_fn, &pm->io);
     acpi_pm1_evt_init(&pm->acpi_regs, ich9_pm_update_sci_fn, &pm->io);
     acpi_pm1_cnt_init(&pm->acpi_regs, &pm->io, pm->disable_s3, pm->disable_s4,
-                      pm->s4_val);
+                      pm->s4_val, !pm->smm_compat && !smm_enabled);
 
     acpi_gpe_init(&pm->acpi_regs, ICH9_PMIO_GPE0_LEN);
     memory_region_init_io(&pm->io_gpe, OBJECT(lpc_pci), &ich9_gpe_ops, pm,
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 30dd9b2309..1efc0ded9f 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -497,7 +497,8 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
 
     acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
     acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
-    acpi_pm1_cnt_init(&s->ar, &s->io, s->disable_s3, s->disable_s4, s->s4_val);
+    acpi_pm1_cnt_init(&s->ar, &s->io, s->disable_s3, s->disable_s4, s->s4_val,
+                      !s->smm_compat && !s->smm_enabled);
     acpi_gpe_init(&s->ar, GPE_LEN);
 
     s->powerdown_notifier.notify = piix4_pm_powerdown_req;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 970046f438..4386f57b5c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -36,7 +36,10 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_5_2[] = {};
+GlobalProperty hw_compat_5_2[] = {
+    { "ICH9-LPC", "smm-compat", "on"},
+    { "PIIX4_PM", "smm-compat", "on"},
+};
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
 GlobalProperty hw_compat_5_1[] = {
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 5db9b1706c..05d084f698 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -190,7 +190,7 @@ static void via_pm_realize(PCIDevice *dev, Error **errp)
 
     acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
     acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
-    acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2);
+    acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2, false);
 }
 
 typedef struct via_pm_init_info {
-- 
MST


