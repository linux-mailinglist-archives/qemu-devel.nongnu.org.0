Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80991581AAC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:07:15 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQpm-0002or-0M
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQS-0006w6-4B
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQQ-00055W-8l
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6a3MW02k11wAmY93znZpNnBO7ZvESCIajRiQf6+imBs=;
 b=f4tZh/OTTWl/z1Y3qN8mBFBwksnRuAMxgNk5MU017bCJ5aaQ0PdJfJnQRw9djUEuCkkmWI
 4WrIJ97R3tYRd9jKufOpbGxT+w0VhUHp6mT95gmJb1nQRDdfBTo56TZojVctXpOA9IxozZ
 x8bRp8AEGbNnYngEEq5g6482in5qQK0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-Co05Ou64PTW9HsZgTBjNCA-1; Tue, 26 Jul 2022 15:41:00 -0400
X-MC-Unique: Co05Ou64PTW9HsZgTBjNCA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k27-20020a05600c1c9b00b003a2fee19a80so10672424wms.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=6a3MW02k11wAmY93znZpNnBO7ZvESCIajRiQf6+imBs=;
 b=5RVHmxyFoCs4voz+3+d3CeuX1nrn3iuu62BdWcSDrlNLneBioCKEpaDYYX/xzy9030
 mszcbGN6b/C09NexNTT2Juw8965C7SkWA96Oiy096SJ+2lCqEjKAX6gbAeC3uyhU9Yf8
 0UmmOCNWjXNr2GJgMCw9wyhHO8EzF6IRCmx+KTwOedW/jEeuwp9haEOfu5Q9dtmuuTnE
 PUDffcZAbMShrmDJLMYKY7UBuT+/BGnGKHfwCVpfpCQZndkLaIeYFTFi8JqZQAfdxaI8
 baWRHeR9O8Ah2+aYBo3eFjhAgsblUKGp+5i7tnH6EoIoCCO/tSjjVtzvyMZs2CFox0rO
 rPEw==
X-Gm-Message-State: AJIora8paMygiM+n52ICogTJ6UbGoFfx7U4jfBi4ojLty5hkKdMyf5oZ
 0frjgxzUcGAE5FURR+iWYydvzO0L64SIhejdYSzjtwt0LjAJzgAWM1/390s1LpRY8/32xbLGD0O
 PW8kZxP/GGCKQFSeChHGiDeDArz+wBN2BrAPOS3px2joDfTfoFQBFfXf0PKA2
X-Received: by 2002:a05:6000:511:b0:21e:503e:d964 with SMTP id
 a17-20020a056000051100b0021e503ed964mr11678342wrf.306.1658864458913; 
 Tue, 26 Jul 2022 12:40:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTvOcXfPMg1//GjWCRj8o8HJuCl08L7U6Le0m3Sxb88mHjjvU9Gc20+wX4+3gGZNnb//BLDA==
X-Received: by 2002:a05:6000:511:b0:21e:503e:d964 with SMTP id
 a17-20020a056000051100b0021e503ed964mr11678320wrf.306.1658864458549; 
 Tue, 26 Jul 2022 12:40:58 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 m184-20020a1c26c1000000b003a04722d745sm23188472wmm.23.2022.07.26.12.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:58 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 14/16] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220726193858.177462-15-mst@redhat.com>
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

It is assumed that the whole GPA space is available to be DMA
addressable, within a given address space limit, except for a
tiny region before the 4G. Since Linux v5.4, VFIO validates
whether the selected GPA is indeed valid i.e. not reserved by
IOMMU on behalf of some specific devices or platform-defined
restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
 -EINVAL.

AMD systems with an IOMMU are examples of such platforms and
particularly may only have these ranges as allowed:

        0000000000000000 - 00000000fedfffff (0      .. 3.982G)
        00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
        0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])

We already account for the 4G hole, albeit if the guest is big
enough we will fail to allocate a guest with  >1010G due to the
~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).

[*] there is another reserved region unrelated to HT that exists
in the 256T boundary in Fam 17h according to Errata #1286,
documeted also in "Open-Source Register Reference for AMD Family
17h Processors (PUB)"

When creating the region above 4G, take into account that on AMD
platforms the HyperTransport range is reserved and hence it
cannot be used either as GPAs. On those cases rather than
establishing the start of ram-above-4g to be 4G, relocate instead
to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
Topology", for more information on the underlying restriction of
IOVAs.

After accounting for the 1Tb hole on AMD hosts, mtree should
look like:

0000000000000000-000000007fffffff (prio 0, i/o):
         alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
0000010000000000-000001ff7fffffff (prio 0, i/o):
        alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff

If the relocation is done or the address space covers it, we
also add the the reserved HT e820 range as reserved.

Default phys-bits on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough
to address 1Tb (0xff ffff ffff). On AMD platforms, if a
ram-above-4g relocation is attempted and the CPU wasn't configured
with a big enough phys-bits, an error message will be printed
due to the maxphysaddr vs maxusedaddr check previously added.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220719170014.27028-11-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 56d8c179ea..1c5c9e17c6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -891,6 +891,40 @@ static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
     return pc_pci_hole64_start() + pci_hole64_size - 1;
 }
 
+/*
+ * AMD systems with an IOMMU have an additional hole close to the
+ * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
+ * on kernel version, VFIO may or may not let you DMA map those ranges.
+ * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
+ * with certain memory sizes. It's also wrong to use those IOVA ranges
+ * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
+ * The ranges reserved for Hyper-Transport are:
+ *
+ * FD_0000_0000h - FF_FFFF_FFFFh
+ *
+ * The ranges represent the following:
+ *
+ * Base Address   Top Address  Use
+ *
+ * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
+ * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
+ * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
+ * FD_F910_0000h FD_F91F_FFFFh System Management
+ * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
+ * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
+ * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
+ * FD_FE00_0000h FD_FFFF_FFFFh Configuration
+ * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
+ * FE_2000_0000h FF_FFFF_FFFFh Reserved
+ *
+ * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
+ * Table 3: Special Address Controls (GPA) for more information.
+ */
+#define AMD_HT_START         0xfd00000000UL
+#define AMD_HT_END           0xffffffffffUL
+#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
+#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -914,6 +948,26 @@ void pc_memory_init(PCMachineState *pcms,
 
     linux_boot = (machine->kernel_filename != NULL);
 
+    /*
+     * The HyperTransport range close to the 1T boundary is unique to AMD
+     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
+     * to above 1T to AMD vCPUs only.
+     */
+    if (IS_AMD_CPU(&cpu->env)) {
+        /* Bail out if max possible address does not cross HT range */
+        if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
+            x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
+        }
+
+        /*
+         * Advertise the HT region if address space covers the reserved
+         * region or if we relocate.
+         */
+        if (cpu->phys_bits >= 40) {
+            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
+        }
+    }
+
     /*
      * phys-bits is required to be appropriately configured
      * to make sure max used GPA is reachable.
-- 
MST


