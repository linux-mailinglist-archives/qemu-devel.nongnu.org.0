Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C56581A9F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:00:03 +0200 (CEST)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQim-0005xE-Hd
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQQ-0006qc-HH
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQO-00055S-VN
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0OE3WOnbj80jVhzsEcSnnThUB452X76K0rxqRQpD39Y=;
 b=AO7FpbcMq273N6FLzGKZMIM6dGgXuAwPacDbrr1wRsJ9uvB1LbCVaOOnk1ASpdwrtwSGoM
 lToO1WZXIMa4Jxi16gHZuNHbJtBCzPHZgE/3TpPfQuNtQV+2wK8rutJbC4tK6Iign6crBF
 JU6AZudcDSETQP5Vcwb3C68B4khhJVs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-ZmSYtJBxNPCDWlx_oxEevQ-1; Tue, 26 Jul 2022 15:40:59 -0400
X-MC-Unique: ZmSYtJBxNPCDWlx_oxEevQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v18-20020a05600c215200b003a2fea66b7cso5689658wml.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=0OE3WOnbj80jVhzsEcSnnThUB452X76K0rxqRQpD39Y=;
 b=yC0y7yNvCd/NlqgjI1H6ifrHFd0/TvZSpp/e5srf9Ju6qCkRK3Xwy0Y6SFEhiKATJJ
 s+PVTVONbIO1z6vhtVU+qZrsetKOswv8YzMNn0ytFEO7eusm2JA+z9KSRrXHyJtvHKns
 nCuy0odBVBDSq5OpCVxfTWykLY7yygVpdikpAs5A6KjS8iu5gf2CC/b9W5aGrjaWt9TY
 /CtaP04yYAn9QAK26jbq6f1JV7dXOhK4jBracMmqXLhshmeDLGDgVGUyU7GpgG+r+MkX
 s22Kx+WzI7l1vFWk5VcQc8wJDoEKOrsuNLey/U3tvKkqoI/85TAcB3FkD2AtShspZFwW
 NkLQ==
X-Gm-Message-State: AJIora9gPe+59iVVHm+xq4zzF3lCGBDKJD+2m2J/9NDcwsHwBUIg/mgR
 DxR51OJoHbI0LRIb2ZruOgdvBJ6JKO3HVJwlet096Fp+faj8x1Guy8f71VMreHCgVnRcELamnvR
 gj7vkD45IDt4yntLSPvVB2n5qWQ+s3yAwFRu5PK8MUovjLiJsuG7XVZCVFKU0
X-Received: by 2002:adf:e652:0:b0:21d:6e43:3ec4 with SMTP id
 b18-20020adfe652000000b0021d6e433ec4mr12753248wrn.358.1658864456658; 
 Tue, 26 Jul 2022 12:40:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vYveOIjUwsEIYmbQ3KIkgMWjSQN1oLJUYPgUgnbVCdbOubH7qFzJ7kqSczMgS3L2wrpvxerA==
X-Received: by 2002:adf:e652:0:b0:21d:6e43:3ec4 with SMTP id
 b18-20020adfe652000000b0021d6e433ec4mr12753227wrn.358.1658864456259; 
 Tue, 26 Jul 2022 12:40:56 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003a2d6f26babsm20044682wms.3.2022.07.26.12.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:55 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 13/16] i386/pc: bounds check phys-bits against max used GPA
Message-ID: <20220726193858.177462-14-mst@redhat.com>
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

Calculate max *used* GPA against the CPU maximum possible address
and error out if the former surprasses the latter. This ensures
max used GPA is reacheable by configured phys-bits. Default phys-bits
on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough for the CPU to
address 1Tb (0xff ffff ffff) or 1010G (0xfc ffff ffff) in AMD hosts
with IOMMU.

This is preparation for AMD guests with >1010G, where it will want relocate
ram-above-4g to be after 1Tb instead of 4G.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220719170014.27028-10-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ebc27e4cb7..56d8c179ea 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -879,6 +879,18 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
     return start;
 }
 
+static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
+{
+    X86CPU *cpu = X86_CPU(first_cpu);
+
+    /* 32-bit systems don't have hole64 thus return max CPU address */
+    if (cpu->phys_bits <= 32) {
+        return ((hwaddr)1 << cpu->phys_bits) - 1;
+    }
+
+    return pc_pci_hole64_start() + pci_hole64_size - 1;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -893,13 +905,28 @@ void pc_memory_init(PCMachineState *pcms,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    hwaddr maxphysaddr, maxusedaddr;
     hwaddr cxl_base, cxl_resv_end = 0;
+    X86CPU *cpu = X86_CPU(first_cpu);
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
 
     linux_boot = (machine->kernel_filename != NULL);
 
+    /*
+     * phys-bits is required to be appropriately configured
+     * to make sure max used GPA is reachable.
+     */
+    maxusedaddr = pc_max_used_gpa(pcms, pci_hole64_size);
+    maxphysaddr = ((hwaddr)1 << cpu->phys_bits) - 1;
+    if (maxphysaddr < maxusedaddr) {
+        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
+                     " phys-bits too low (%u)",
+                     maxphysaddr, maxusedaddr, cpu->phys_bits);
+        exit(EXIT_FAILURE);
+    }
+
     /*
      * Split single memory region and use aliases to address portions of it,
      * done for backwards compatibility with older qemus.
-- 
MST


