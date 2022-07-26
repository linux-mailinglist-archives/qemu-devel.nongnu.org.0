Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B5581A9D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 21:59:35 +0200 (CEST)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQiM-0005c1-V0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 15:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQL-0006bq-B9
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQI-00053G-Ly
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LppvYmBYIc3J2UR5ly1bIdgZ+ZbkH9f8vVFSDz8MN2g=;
 b=hbjOwhGLQDXeB9svywgtQxx40pjh4zEuvjZU9V7+EfGH6ufv3skG4x7H+VQql7hRaxBxGG
 s3id//WywjE6vgw/3CoK2kiGnbV0XAyIMOdfjz+byBWyhRNl4FI95boV280bvdko8EuF1q
 hC8SRgJIfRCeXewNO70ulLwgW+gMr8I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-EJ3lkLt-PLSHxTqrKQW24Q-1; Tue, 26 Jul 2022 15:40:50 -0400
X-MC-Unique: EJ3lkLt-PLSHxTqrKQW24Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 n30-20020a05600c501e00b003a3264465ebso982870wmr.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=LppvYmBYIc3J2UR5ly1bIdgZ+ZbkH9f8vVFSDz8MN2g=;
 b=s2ZS3PkLXEf34aRvZ1QDECozP98eBvArPDJZ/pUxU0wJP9ToHG6ETbcGdFRkovuFz2
 2FlKe2pKzHvh7hWk3Xk4h56Rr0+dGP+pyAGcOdCvZr9E5hGZ9wdhPDp5kOUeVLQg1aq3
 BvkctloIpTh4EJMbKATLxLKNaVx5zKXH725FZhLqwmmdO/wDrddGY1BZKVuu4SyhEW42
 2Oo6irD2b11Pfu504KcikLfiQc8ljh/jBHgPJes0LpygMkASOjBZuTH4d3EP/Th3/wuQ
 /fmAIFx8vOrNhVU438bQpeYUMlMBLSzX5PnPyQwEFi3uyl6s6XWtmKppnw2UWJSeVk1i
 525w==
X-Gm-Message-State: AJIora8hUQKoM17tX8oo8fRMoQvM0xHQ52T+acnTJ7fAp3/A2R7gnU8o
 vlAgdUV9iE9LjyzGY6RmpcYb5tyc9w/K/CWYtw9IeYLatONSrYo8xF0yP/FBuQJiIYwEEKZrf5P
 E+r6LU0CM+eRAmUnoMFEzIke0EzWQYcgApWRIp9D6LkD+qWYwNV0ZcYqi0tOj
X-Received: by 2002:adf:fd09:0:b0:21e:c912:151f with SMTP id
 e9-20020adffd09000000b0021ec912151fmr91560wrr.302.1658864449449; 
 Tue, 26 Jul 2022 12:40:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vS/T5d2cVpJD6Nml4MxpUuHncOK9Zp0vukuF3t6aw4hes5yiethlii5G62svae1GvIok9drg==
X-Received: by 2002:adf:fd09:0:b0:21e:c912:151f with SMTP id
 e9-20020adffd09000000b0021ec912151fmr91537wrr.302.1658864449180; 
 Tue, 26 Jul 2022 12:40:49 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 o27-20020a5d58db000000b0021d80f53324sm15047873wrf.7.2022.07.26.12.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:48 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:47 -0400
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
Subject: [PULL 10/16] i386/pc: factor out cxl range start to helper
Message-ID: <20220726193858.177462-11-mst@redhat.com>
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

Factor out the calculation of the base address of the memory region.
It will be used later on for the cxl range end counterpart calculation
and as well in pc_memory_init() CXL memory region initialization, thus
avoiding duplication.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220719170014.27028-7-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index cb27309e76..9e1a067c41 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -825,6 +825,22 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
     return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 }
 
+static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    MachineState *machine = MACHINE(pcms);
+    hwaddr cxl_base;
+
+    if (pcmc->has_reserved_memory && machine->device_memory->base) {
+        cxl_base = machine->device_memory->base
+            + memory_region_size(&machine->device_memory->mr);
+    } else {
+        cxl_base = pc_above_4g_end(pcms);
+    }
+
+    return cxl_base;
+}
+
 static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
 {
     uint64_t start = 0;
@@ -946,13 +962,7 @@ void pc_memory_init(PCMachineState *pcms,
         MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
         hwaddr cxl_size = MiB;
 
-        if (pcmc->has_reserved_memory && machine->device_memory->base) {
-            cxl_base = machine->device_memory->base
-                + memory_region_size(&machine->device_memory->mr);
-        } else {
-            cxl_base = pc_above_4g_end(pcms);
-        }
-
+        cxl_base = pc_get_cxl_range_start(pcms);
         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
-- 
MST


