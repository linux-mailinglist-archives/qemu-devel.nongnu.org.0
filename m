Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB52581B15
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:33:05 +0200 (CEST)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGREm-0000PD-2d
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQG-0006TE-Iu
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQE-00052k-TN
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RbFJ4IjlKg0vtuwmb/PSemNKVmNugGtzWH7AuT1jKw4=;
 b=fnNiOMmDxFhRNdPBwm+37DbN2xPSdydMDsm++GT2/xVE1Fa/I5WJJpRtnRUX/HXh4zzRI+
 D/1MNG4etCBqCf2tP+5vC5wynfGDhnbunwFUDzFpNp9+1TG2UzvVsnRLGtWoU2f82XVXn/
 BFDOMP+anpGbLk4Hn74sFHVaRxNYxpA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-fj2cXy-wMuaOA3le85idaQ-1; Tue, 26 Jul 2022 15:40:48 -0400
X-MC-Unique: fj2cXy-wMuaOA3le85idaQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c17-20020a7bc011000000b003a2bfaf8d3dso8060177wmb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=RbFJ4IjlKg0vtuwmb/PSemNKVmNugGtzWH7AuT1jKw4=;
 b=zlyMCOjwcNqruvvMbK+F80LfgXgyGDB8I4NVFNV3ug+Grm5SnYjyJKNGyx/VeTlJaC
 a/zryrt0FXNF8cidvPSe0NK33rYso0hWF3SVJMdFlO3KVh2bi987W6apgexM0GgxDUiL
 7umOH5o2DMCMvQj9i9ZSLGGCK+eNx8lMZ50KYtcvBrsQ8wcDuc7UsRrD2x57qwVXhMAg
 y2H4OMC8N1m/TpjQ9T7KnQprZPsg3AQ28ONTdJ3xLbFNQlspBawIUpduvPYUIJuYKKs+
 2PWJkt24VV/LzS362nSXrOfKx2T1C6O2xlz+A5oJyOn2RBWI5b9BfWuDfXQzd7Nxdhve
 R33Q==
X-Gm-Message-State: AJIora+LWT70TiwKNbFC3VqOByOFY1dOTqyHUvfv1S1oesNiCQHxRZSc
 ZiSU6eEGmRF70B+acyIkz3yD3WjoUIUm4jCz/SC+c/kqLM2yueXehB/whIB/cVzERlumSOIWwAu
 B38DTLP081zug4fjU8mhkcJ4JW3HtY0xFKAM8RdDeWMAD1zeNCnxv3ORiJmUN
X-Received: by 2002:a05:6000:16ce:b0:21e:8450:1b6a with SMTP id
 h14-20020a05600016ce00b0021e84501b6amr8840656wrf.372.1658864447323; 
 Tue, 26 Jul 2022 12:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v4pcY379Jncl+Sl8NgElkWGRXUb7E6Vpe0bznRnSsIcRb6TdF518+ZHJnvIHd2GvyLwF8WbQ==
X-Received: by 2002:a05:6000:16ce:b0:21e:8450:1b6a with SMTP id
 h14-20020a05600016ce00b0021e84501b6amr8840635wrf.372.1658864446864; 
 Tue, 26 Jul 2022 12:40:46 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a5d4fc9000000b0021e6277bc50sm14661858wrw.36.2022.07.26.12.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:46 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 09/16] i386/pc: factor out cxl range end to helper
Message-ID: <20220726193858.177462-10-mst@redhat.com>
References: <20220726193858.177462-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726193858.177462-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Move calculation of CXL memory region end to separate helper.

This is in preparation to a future change that removes CXL range
dependency on the CXL memory region, with the goal of allowing
pc_pci_hole64_start() to be called before any memory region are
initialized.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220719170014.27028-6-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d1e20ccb27..cb27309e76 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -825,6 +825,25 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
     return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 }
 
+static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
+{
+    uint64_t start = 0;
+
+    if (pcms->cxl_devices_state.host_mr.addr) {
+        start = pcms->cxl_devices_state.host_mr.addr +
+            memory_region_size(&pcms->cxl_devices_state.host_mr);
+        if (pcms->cxl_devices_state.fixed_windows) {
+            GList *it;
+            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
+                CXLFixedWindow *fw = it->data;
+                start = fw->mr.addr + memory_region_size(&fw->mr);
+            }
+        }
+    }
+
+    return start;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -1020,16 +1039,8 @@ uint64_t pc_pci_hole64_start(void)
     MachineState *ms = MACHINE(pcms);
     uint64_t hole64_start = 0;
 
-    if (pcms->cxl_devices_state.host_mr.addr) {
-        hole64_start = pcms->cxl_devices_state.host_mr.addr +
-            memory_region_size(&pcms->cxl_devices_state.host_mr);
-        if (pcms->cxl_devices_state.fixed_windows) {
-            GList *it;
-            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
-                CXLFixedWindow *fw = it->data;
-                hole64_start = fw->mr.addr + memory_region_size(&fw->mr);
-            }
-        }
+    if (pcms->cxl_devices_state.is_enabled) {
+        hole64_start = pc_get_cxl_range_end(pcms);
     } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
         hole64_start = ms->device_memory->base;
         if (!pcmc->broken_reserved_end) {
-- 
MST


