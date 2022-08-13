Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A65591C05
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 18:33:14 +0200 (CEST)
Received: from localhost ([::1]:44640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMu4X-0005md-AR
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 12:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oMtz4-00087V-0j
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 12:27:34 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oMtz2-0005TN-Ic
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 12:27:33 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E5A9F5C00D3;
 Sat, 13 Aug 2022 12:27:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 13 Aug 2022 12:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1660408050; x=1660494450; bh=RQ
 FP/Pb0CXD9g4rjGrPFNExo8/7xaOwQ2mU2NCkA/fo=; b=JKFLeUGa1UhUVBypwO
 KxqD4jkLIE+yYqvteNWC0Jt/s0X30tzM9QJKcye+68WS4T5Gl7hL/1sZxgZhk4iS
 8fNa1EqlVr/LESoEdO1iegf/XyOsMZmt9oOiQKUO/KrJE4myu2zI3onHBJ6Rekl1
 sNXffHnSjpUG5fVYdfjUnOsPjDW8vFnERP2E72igj2f+vKNGlUsUcXOXccTrwM/Q
 SdjRjHeouVv2sHFEtnRVWoZ9aYvETK1xs3AerkxITM1OVIE+ODopa9BO1nzaefEx
 tHpzNiQP0x9chLaDzMWV8VJwfZfE/jhi1DT6UPlyeN2KwDBsd3aQZDqMSlhg1/Yy
 QugA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1660408050; x=1660494450; bh=RQFP/Pb0CXD9g
 4rjGrPFNExo8/7xaOwQ2mU2NCkA/fo=; b=c6ftuq+++3EZEiMvHlfezMJmmwx22
 owxitqDtt0edN5Tjk39R0uasYR8CY4PKUlC2QzVpa64x83UX/E/13iHE1SOuOHQM
 wzakZdJ/+cPabzawkL+2aoV3+l5EfjrBScEL9uLaQiosMom0ly7vIucAFBvVnV/p
 HfMdr2D7Fu+McC40Yszz/AkXh+DWkXiapfjDElBLGlGe0fjVrn+6j9RW30qFyXM4
 6AB6/FJyhn6XAcPmmPBvOkwgrTjn1qtCj6HhSpyKR6igSUQWQALMNe45E5LZ2/TJ
 dmn2bHBcv5jhXQGEq6CCUohbOEV3+hWq6HLksfQQgcw81sfxCkF2+IR1g==
X-ME-Sender: <xms:8tD3Ykhl85Za9MuZ6WSaVYMmw5PD1KKhGpTOXEdJx-XIzMB28wTeMw>
 <xme:8tD3YtDr9gi6Fsee-rvPL24Ke9TLVroj7WT4CYj3t0aA81Ia9SWy8Ot4HmFWqErUj
 O8c0DvDVm4nuyYcDMk>
X-ME-Received: <xmr:8tD3YsGfH2Qb8ExjDw-cOuVGo1YEurLT1Uz73vCSocDjY4gOWwNov0NdH6oCID54ycx1N61GBPjHn4-0tw7WXW9Hmjt_gygtg-bhjzUZ4wmkMDNpsbXXq1K6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegkedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
 dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:8tD3YlTXzfOVxE4D6FIbNhiDf9POoWBq5_Y2ozRM7UuorvqVVJpgUQ>
 <xmx:8tD3YhzrzVM6fivZX0XdR2NqQQ_uTiBGqJyO3e3CXv6vdIWz-PvaDQ>
 <xmx:8tD3Yj7fnjY-IEE3959pxaqJwfBcQXCBgyHK89wSFozC6sQ1YjBTjw>
 <xmx:8tD3Yir5wKw0ya3KJFmPGSdrpZVpn0J-fXwCOUaI5ObhHfNJ-3Yo5g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Aug 2022 12:27:30 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: f4bug@amsat.org
Cc: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] hw/mips/boston: Support initrd for ELF kernel
Date: Sat, 13 Aug 2022 17:27:19 +0100
Message-Id: <20220813162720.60008-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220813162720.60008-1-jiaxun.yang@flygoat.com>
References: <20220813162720.60008-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

When loading ELF kernel we can just load out initrd after DTB
and append initrd information to DeviceTree's chosen node.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/boston.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index d2ab9da1a0..5145179951 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -73,6 +73,8 @@ struct BostonState {
 
     hwaddr kernel_entry;
     hwaddr fdt_base;
+    hwaddr initrd_base;
+    hwaddr initrd_end;
 };
 
 enum {
@@ -383,6 +385,14 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
         return NULL;
     }
 
+    if (s->initrd_base) {
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
+                             s->initrd_base);
+
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
+                             s->initrd_end);
+    }
+
     ram_low_sz = MIN(256 * MiB, machine->ram_size);
     ram_high_sz = machine->ram_size - ram_low_sz;
     qemu_fdt_setprop_sized_cells(fdt, "/memory@0", "reg",
@@ -804,6 +814,35 @@ static void boston_mach_init(MachineState *machine)
                 dtb_file_data = create_fdt(s, boston_memmap, &dt_size);
             }
 
+            if (machine->initrd_filename) {
+                /* We want to leave low 128 MiB memory for kernelrelocation */
+                hwaddr initrd_paddr = MAX(128 * MiB,
+                                         QEMU_ALIGN_UP(dtb_paddr + dt_size,
+                                         64 * KiB));
+                int maxsz = boston_memmap[BOSTON_LOWDDR].size - initrd_paddr;
+
+                if (maxsz <= 0) {
+                        error_report("no space left for ramdisk '%s'",
+                                     machine->initrd_filename);
+                        exit(1);
+                }
+
+                int size = load_ramdisk(machine->initrd_filename,
+                                        initrd_paddr, maxsz);
+                if (size < 0) {
+                    size = load_image_targphys(machine->initrd_filename,
+                                               initrd_paddr, maxsz);
+                    if (size < 0) {
+                        error_report("could not load ramdisk '%s'",
+                                     machine->initrd_filename);
+                        exit(1);
+                    }
+                }
+
+                s->initrd_base = initrd_paddr;
+                s->initrd_end = s->initrd_base + size;
+            }
+
             dtb_load_data = boston_fdt_filter(s, dtb_file_data,
                                               NULL, &dtb_vaddr);
 
-- 
2.32.1 (Apple Git-133)


