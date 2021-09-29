Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6441C818
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:14:15 +0200 (CEST)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbHj-00073D-0H
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mVbFu-0005ZQ-2i
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:12:22 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:37177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mVbFq-0006Ok-FH
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:12:21 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 0583C5C0176;
 Wed, 29 Sep 2021 11:12:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 29 Sep 2021 11:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 Ew84LfeC3U/hJ6Dh1ix6cgvPSMEKPr0Lx8XE19sjUn0=; b=JhDapszvO55kVaXQ
 D5duyX9DRZJYd6+raMLqdvS1KnmHQIRwg3E4JfVj1FjkPHJpgdo3nfgye4c/95ug
 wV6f73aCKLSKyqIZ0dWyvEoksi6vXn5lWJGBdTQnkmx9OLU5bl7U8Hg9BV74Dkko
 0LS9tQZ0Uiwpn+19qnAdQ+xJTOpYviHM5kGZZrMLlHC9EmqU4C1cCKaj9Q4Ee7fJ
 +2RPIC86JV+q0OSZ6RAVlJfiZPvkGRjclB75WaMK3AggEtR0Pv22ghqqVErcZLNh
 tcfo4VMyNCGocVOy5Twr8sfigpoaMgg5zeGGQi1RBaj5QlA0MQHWXs3/EH5wlL8c
 i3W3dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Ew84LfeC3U/hJ6Dh1ix6cgvPSMEKPr0Lx8XE19sjU
 n0=; b=hKWNhbali5SwUpkvsclH8hPqnJK4ZeECUC4VMOZ/R1HmZfIivDfyh+v6L
 ja2URk5a7le82si0tkHHwei5DBVIS4bkGHE/esEbOUzGZCHYz7cKagbXLK+wGUoP
 MVV+TzgQoG8ASjaecOVeDTQ4RArVA+w/x/e0WstU8gszyPEbxr3Xd+na/K+XC/fV
 OWl4TXlle5Kj4Tn345dZVVaAj+v6l32yQlPAXq/v9ocuc94jzEMfnr/QN6s9re0F
 GL8lOWSHfpCB1HFe8JndFFix9xFLP02mF0owsB6w9Yd/iPihslkG2Sp4anR6KADS
 9hzBB3vULPc5f0n+aYFUEc5mixSSQ==
X-ME-Sender: <xms:UYJUYR34VUKEU79eD9yzOhamROlu6C2sSuPKGmFHqL3sOmGqWhwRGQ>
 <xme:UYJUYYHONqSUz5NXR05IIPbhPA3NUmsxWQpsidiZe5dea57jhVV6FgzbsB5ypvGyz
 s5Q7dMyl3fubMpsy0k>
X-ME-Received: <xmr:UYJUYR4rKl3FuNrPdz_I1rbTCFgQmPRl-7wrYLS8Y5D3qfhzV0HrpJGnTp1M-YF2b9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhggtgfgsehtke
 ertdertdejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepheduvdettdelheehgf
 egveetkeekhfejvdejtdfguefgkeejtddvveeujeevkeelnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:UYJUYe27PJYjFzEnE3uF8rqGpBnYGtaNfs7z_DnJ7JlrBH_d3OkK0g>
 <xmx:UYJUYUG2col2av25IiSFfgI2P2j60kLVGpJECNa_Hq9EaihNW9nNfQ>
 <xmx:UYJUYf-baHhyvohg-8qXTnqZnb2b8J0Wel8PGtaLmYDoMOAeM33VKw>
 <xmx:UoJUYYDi4lDM4i-D3dpi7Dx7Im7y-D5AQmfyVrli8_wwvLw0Ih4TGw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 11:12:17 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] hw/mips/boston: Allow loading elf kernel and dtb
Date: Wed, 29 Sep 2021 16:12:10 +0100
Message-Id: <20210929151211.108-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929151211.108-1-jiaxun.yang@flygoat.com>
References: <20210929151211.108-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aleksandar.rikalo@syrmia.com, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ELF kernel allows us debugging much easier with DWARF symbols.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
--
v2: Use g_autofree
---
 hw/mips/boston.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 5c720440fb..5d3f054a3e 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 
+#include "elf.h"
 #include "hw/boards.h"
 #include "hw/char/serial.h"
 #include "hw/ide/pci.h"
@@ -546,10 +547,37 @@ static void boston_mach_init(MachineState *machine)
             exit(1);
         }
     } else if (machine->kernel_filename) {
-        fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
-        if (fit_err) {
-            error_report("unable to load FIT image");
-            exit(1);
+        uint64_t kernel_entry, kernel_low, kernel_high, kernel_size;
+
+        kernel_size = load_elf(machine->kernel_filename, NULL,
+                           cpu_mips_kseg0_to_phys, NULL,
+                           (uint64_t *)&kernel_entry,
+                           (uint64_t *)&kernel_low, (uint64_t *)&kernel_high,
+                           NULL, 0, EM_MIPS, 1, 0);
+
+        if (kernel_size) {
+            hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
+            hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
+
+            s->kernel_entry = kernel_entry;
+            if (machine->dtb) {
+                int dt_size;
+                g_autofree const void *dtb_file_data, *dtb_load_data;
+
+                dtb_file_data = load_device_tree(machine->dtb, &dt_size);
+                dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
+
+                /* Calculate real fdt size after filter */
+                dt_size = fdt_totalsize(dtb_load_data);
+                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
+            }
+        } else {
+            /* Try to load file as FIT */
+            fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
+            if (fit_err) {
+                error_report("unable to load kernel image");
+                exit(1);
+            }
         }
 
         gen_firmware(memory_region_get_ram_ptr(flash) + 0x7c00000,
-- 
2.30.2


