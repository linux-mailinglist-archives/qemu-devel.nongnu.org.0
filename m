Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C86581B20
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:35:16 +0200 (CEST)
Received: from localhost ([::1]:40242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGRGt-0001yY-57
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQL-0006bi-9f
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQC-00052V-Cv
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MoGeQiAuFZ8Z23BNRj6nOmHSXjKjntgr2SuKM6ucXaE=;
 b=Aq+s4ExHFyt6ok341fQr45dYcKw3Gv734YZJB8X3kgrbn+0vVcp7DL2JcviG3HdM/iuMLG
 vm4TIxHOoJF4e7KBgwo/u9lS2WW+bgRmEtXtebSW9TEFYwU16pWRWdnNonpjmL6Jdzhao/
 QcMZNNLb7tWWyjxbDtvCvmIpj/V0yto=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-4jGweiDuOiaV5huRB6AzqQ-1; Tue, 26 Jul 2022 15:40:46 -0400
X-MC-Unique: 4jGweiDuOiaV5huRB6AzqQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 n7-20020adfc607000000b0021a37d8f93aso2397893wrg.21
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=MoGeQiAuFZ8Z23BNRj6nOmHSXjKjntgr2SuKM6ucXaE=;
 b=dpkzPOOhATYbGlZna83HSlRPagrEo7bfAe+W0bB42xq8jt4cFZD7809y4wM2Pz8bm1
 bxbkBo5bXrE5cuGhrIkKTRfXeYaRNiPTUITPWu1RH2K9bpu3Y+Mrotym4os6EqY+JFb6
 LIuQGxMKmdqHIKURaJPqusjwzTw6odUkblZRrrxg+GeelCli9exlrdEdq9TSY2l1wdk2
 ZtC/u++IIIjO28SBWASVpD7+bt6e49UAzn1jXdylj1MJJZUggTip9XE9d1TT+77ilGkd
 Ph6Bauwpd9apKn2lzFv6ELm+mpwGYRgRBlEk56Z366LnYFs0/qIwcHKjV7FBXq9UTQTx
 tUig==
X-Gm-Message-State: AJIora8x5746Ea2adoDFWxl9WXkOhR0NvGbMB6R9nVGG8CF3nsQLzRaO
 tROkeHWU7oNzHPm+OvQEVM3jHHfVyJWuB7s4BK7b6BSc+Xp2naZiJN+xo5s0jo3wEJlDDSZ4guL
 35fcC6g+3I4IJr3Vc0MaiTSvNnZiJ/VW5N+cs/ZJsxyqobosM4z2CDFQlfBl3
X-Received: by 2002:a05:600c:17d5:b0:3a3:576:21ba with SMTP id
 y21-20020a05600c17d500b003a3057621bamr490718wmo.176.1658864444939; 
 Tue, 26 Jul 2022 12:40:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vdnUc9RHJLeetoEsW5MJdMWBjyK2nx96hhonaBNS6lBq/bhALf3TPexa4fOaVUvOKg6PkpOw==
X-Received: by 2002:a05:600c:17d5:b0:3a3:576:21ba with SMTP id
 y21-20020a05600c17d500b003a3057621bamr490695wmo.176.1658864444660; 
 Tue, 26 Jul 2022 12:40:44 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a056000137a00b0021e0147da47sm15126160wrz.96.2022.07.26.12.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:44 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 08/16] i386/pc: factor out above-4g end to an helper
Message-ID: <20220726193858.177462-9-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

There's a couple of places that seem to duplicate this calculation
of RAM size above the 4G boundary. Move all those to a helper function.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220719170014.27028-5-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f4d5b25fdd..d1e20ccb27 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -814,6 +814,17 @@ void xen_load_linux(PCMachineState *pcms)
 #define PC_ROM_ALIGN       0x800
 #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
 
+static hwaddr pc_above_4g_end(PCMachineState *pcms)
+{
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+
+    if (pcms->sgx_epc.size != 0) {
+        return sgx_epc_above_4g_end(&pcms->sgx_epc);
+    }
+
+    return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -891,15 +902,8 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }
 
-        if (pcms->sgx_epc.size != 0) {
-            machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
-        } else {
-            machine->device_memory->base =
-                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
-        }
-
         machine->device_memory->base =
-            ROUND_UP(machine->device_memory->base, 1 * GiB);
+            ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
 
         if (pcmc->enforce_aligned_dimm) {
             /* size device region assuming 1G page max alignment per slot */
@@ -926,10 +930,8 @@ void pc_memory_init(PCMachineState *pcms,
         if (pcmc->has_reserved_memory && machine->device_memory->base) {
             cxl_base = machine->device_memory->base
                 + memory_region_size(&machine->device_memory->mr);
-        } else if (pcms->sgx_epc.size != 0) {
-            cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
-            cxl_base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+            cxl_base = pc_above_4g_end(pcms);
         }
 
         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
@@ -1016,7 +1018,6 @@ uint64_t pc_pci_hole64_start(void)
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *ms = MACHINE(pcms);
-    X86MachineState *x86ms = X86_MACHINE(pcms);
     uint64_t hole64_start = 0;
 
     if (pcms->cxl_devices_state.host_mr.addr) {
@@ -1034,10 +1035,8 @@ uint64_t pc_pci_hole64_start(void)
         if (!pcmc->broken_reserved_end) {
             hole64_start += memory_region_size(&ms->device_memory->mr);
         }
-    } else if (pcms->sgx_epc.size != 0) {
-            hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
     } else {
-        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+        hole64_start = pc_above_4g_end(pcms);
     }
 
     return ROUND_UP(hole64_start, 1 * GiB);
-- 
MST


