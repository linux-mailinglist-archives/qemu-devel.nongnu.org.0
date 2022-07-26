Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24470581ABE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:10:11 +0200 (CEST)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQsc-0006tM-0d
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQW-00075f-Fj
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQT-00055s-Jk
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V1IKCe7yIF2E/hPoISiqm0oVbyToOdynnJZQWYYPxCo=;
 b=Gu09TE4NrlRrMxPTuuLYRnHmcqX3VBldt+uwMnOyI1q7q4abG6zSARSlsKtPFQwDMUIYda
 FY+7NHJOdRq7emXSWUmc6gwWhGzDTjWoK8jcl3FAHF6Tr3p3kmHR4DJlyTZLJSD4eS2Koh
 dBB1U0hShbYc/cu8k/KSd2NXpNDDpvk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-h7emPvgKPbe0yI0ZnFgQoQ-1; Tue, 26 Jul 2022 15:41:02 -0400
X-MC-Unique: h7emPvgKPbe0yI0ZnFgQoQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k27-20020a05600c1c9b00b003a2fee19a80so10672461wms.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=V1IKCe7yIF2E/hPoISiqm0oVbyToOdynnJZQWYYPxCo=;
 b=7GvNe8maZm4eoHgzMNONtVwWkGliAQ63M1QEbjwAFFFhHzPKmEE2F4gMCrxGFeFVEl
 x2emmzAzdz1ho5sJUV2Eghm7eP3uBKQ2DSwAgtYU/B3YCtWjD/GN8lkkiqdvJnjqwIMF
 0q2Zc83P8LC0gsE0KQdjphHr9N/EXuNXcgtDLI7eanHWv7zy38f3iR0cPCRBegxJ1cuu
 SCO/EZbI5lH9PaOK9RGokPs0vwoHHWXjq8YasAXaNDBWPkJJRzsnP1zZ0wJ6EC2JDgSf
 02Hd0a7CLN1tcz2rOIBgRXeAlQNbFQ+Gl1tiUK5v2wOTUn6ntlXeRhWTWvcUAIrfvCeo
 joIw==
X-Gm-Message-State: AJIora8/mvzEAOvMf4FbcHOIp6wh4wxcuEJ21yDKKYtmTsr8VdsFNn6o
 phXwlvFAWkzmOkru7JttEE+J95wv5czL3FzezO79ik3CJEryYqJL0JBzRo5Ug7gAXBrtOABSjFQ
 PXYbwQ0YkAjMfGTHbmxNUumVEcGGwAzum3MWkGsHhMj0/mMf2/0D+pKj5PlLj
X-Received: by 2002:a05:6000:144f:b0:21d:a3cc:a6fa with SMTP id
 v15-20020a056000144f00b0021da3cca6famr11849264wrx.191.1658864461354; 
 Tue, 26 Jul 2022 12:41:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sDP7z54pSBf0Nhy0UfGhgWgcZd3N4FgwAeD5CLGYbPbNAHqHF3fhK5T/rsgvRDPyFGqb0i4g==
X-Received: by 2002:a05:6000:144f:b0:21d:a3cc:a6fa with SMTP id
 v15-20020a056000144f00b0021da3cca6famr11849243wrx.191.1658864460929; 
 Tue, 26 Jul 2022 12:41:00 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1c7903000000b003a320e6f011sm19980433wme.1.2022.07.26.12.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:41:00 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 15/16] i386/pc: restrict AMD only enforcing of 1Tb hole to new
 machine type
Message-ID: <20220726193858.177462-16-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joao Martins <joao.m.martins@oracle.com>

The added enforcing is only relevant in the case of AMD where the
range right before the 1TB is restricted and cannot be DMA mapped
by the kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST
or possibly other kinds of IOMMU events in the AMD IOMMU.

Although, there's a case where it may make sense to disable the
IOVA relocation/validation when migrating from a
non-amd-1tb-aware qemu to one that supports it.

Relocating RAM regions to after the 1Tb hole has consequences for
guest ABI because we are changing the memory mapping, so make
sure that only new machine enforce but not older ones.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220719170014.27028-12-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h | 1 +
 hw/i386/pc.c         | 6 ++++--
 hw/i386/pc_piix.c    | 1 +
 hw/i386/pc_q35.c     | 1 +
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 01938fce4c..8435733bd6 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -118,6 +118,7 @@ struct PCMachineClass {
     bool has_reserved_memory;
     bool enforce_aligned_dimm;
     bool broken_reserved_end;
+    bool enforce_amd_1tb_hole;
 
     /* generate legacy CPU hotplug AML */
     bool legacy_cpu_hotplug;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1c5c9e17c6..7280c02ce3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -951,9 +951,10 @@ void pc_memory_init(PCMachineState *pcms,
     /*
      * The HyperTransport range close to the 1T boundary is unique to AMD
      * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
-     * to above 1T to AMD vCPUs only.
+     * to above 1T to AMD vCPUs only. @enforce_amd_1tb_hole is only false in
+     * older machine types (<= 7.0) for compatibility purposes.
      */
-    if (IS_AMD_CPU(&cpu->env)) {
+    if (IS_AMD_CPU(&cpu->env) && pcmc->enforce_amd_1tb_hole) {
         /* Bail out if max possible address does not cross HT range */
         if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
             x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
@@ -1902,6 +1903,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->has_reserved_memory = true;
     pcmc->kvmclock_enabled = true;
     pcmc->enforce_aligned_dimm = true;
+    pcmc->enforce_amd_1tb_hole = true;
     /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
      * to be used at the moment, 32K should be enough for a while.  */
     pcmc->acpi_data_size = 0x20000 + 0x8000;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index aa191d405a..a5c65c1c35 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -451,6 +451,7 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
     m->alias = NULL;
     m->is_default = false;
     pcmc->legacy_no_rng_seed = true;
+    pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 307910b33c..3a35193ff7 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -387,6 +387,7 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
     pc_q35_7_1_machine_options(m);
     m->alias = NULL;
     pcmc->legacy_no_rng_seed = true;
+    pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
 }
-- 
MST


