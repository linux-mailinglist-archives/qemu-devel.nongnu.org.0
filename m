Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF0581B2B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:38:14 +0200 (CEST)
Received: from localhost ([::1]:44082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGRJk-00050W-Tr
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQN-0006hp-9G
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQL-00053k-Jz
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zRD3eNODHvhKMSWjHVPxp/ZWAeCDc7dW3wSL1DOx364=;
 b=G2EDTig4S/mDkVXzfzaRo36H9d2ERK7ete5XmbPBnE6cJ5XbiRzAvk/IOVoF3Ync5naF+x
 r5cIl8MVkBj6yT8DnIororhZgVwMVW6YZylxpVKPo9ib03om7NOgmjeab1yLvap3GTUT1c
 ORefitNUAiXvQ5WoMg9jb25Kg0ePybo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-8oeMV62lMfym5pwEH50Y1w-1; Tue, 26 Jul 2022 15:40:53 -0400
X-MC-Unique: 8oeMV62lMfym5pwEH50Y1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so8030028wma.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=zRD3eNODHvhKMSWjHVPxp/ZWAeCDc7dW3wSL1DOx364=;
 b=QU+B1jM89ZQygsLWwbfUVe1T9llB4QeksUDaPPUEsKtH5lGI/oJsWoBkZLSfaTfoJZ
 5R6bzw4SzMUn3aqU1Gi8CXy97uGL0RdgaBKdGHg0rbIG2IZgLAL+8euN6PNdoYfHOcki
 eJqjwYPtbvxeLmM2AbBF//m7WrvfyiQoa8IH0/5JxEd2YaXK2AV/T6ByoFAdW7Jl1L8U
 Re46D67Jy7yfvPzwpPIuBXM7hqGS7byeCvRSVQiQIIZGYNpaoPzcNNRy+s7QU0C9Vnzu
 f+GsHyw+0D6e/8HzbFYePwxRJIQdR7Y5x8iDwESIgLA8lgmN0c5kfIMqtP3tq4EgO6N+
 kWTA==
X-Gm-Message-State: AJIora98FOxlKidWyuIAN8PyPZXKNZbobPJdmZBdu2IXcx022InobqmN
 NybMJzhia6Im0JBoha2ibX5A1hvOd/dbzZYmSSdjcmkPO9DjvkHAgyia3r1eWrL/J9XptJBe6xz
 fL1XIQEx+rh4oVJwO8UpeOtn6Y+MIzGZRF+rkQYFyhfrcTaPKFtWctfDb9zkY
X-Received: by 2002:a05:600c:4110:b0:3a3:33cd:3984 with SMTP id
 j16-20020a05600c411000b003a333cd3984mr502965wmi.128.1658864451904; 
 Tue, 26 Jul 2022 12:40:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u56eiiD+vtpR6T392sG2r8SK3E7GiMkCu3blIKkzGWSWYPBG+8DCoTOTd/kMNEDU20yIcCdA==
X-Received: by 2002:a05:600c:4110:b0:3a3:33cd:3984 with SMTP id
 j16-20020a05600c411000b003a333cd3984mr502947wmi.128.1658864451537; 
 Tue, 26 Jul 2022 12:40:51 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 c23-20020a05600c4a1700b003a3170a7af9sm17493277wmp.4.2022.07.26.12.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:51 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 11/16] i386/pc: handle unitialized mr in pc_get_cxl_range_end()
Message-ID: <20220726193858.177462-12-mst@redhat.com>
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

Remove pc_get_cxl_range_end() dependency on the CXL memory region,
and replace with one that does not require the CXL host_mr to determine
the start of CXL start.

This in preparation to allow pc_pci_hole64_start() to be called early
in pc_memory_init(), handle CXL memory region end when its underlying
memory region isn't yet initialized.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Message-Id: <20220719170014.27028-8-joao.m.martins@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9e1a067c41..611eb197da 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -843,17 +843,15 @@ static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
 
 static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
 {
-    uint64_t start = 0;
+    uint64_t start = pc_get_cxl_range_start(pcms) + MiB;
 
-    if (pcms->cxl_devices_state.host_mr.addr) {
-        start = pcms->cxl_devices_state.host_mr.addr +
-            memory_region_size(&pcms->cxl_devices_state.host_mr);
-        if (pcms->cxl_devices_state.fixed_windows) {
-            GList *it;
-            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
-                CXLFixedWindow *fw = it->data;
-                start = fw->mr.addr + memory_region_size(&fw->mr);
-            }
+    if (pcms->cxl_devices_state.fixed_windows) {
+        GList *it;
+
+        start = ROUND_UP(start, 256 * MiB);
+        for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
+            CXLFixedWindow *fw = it->data;
+            start += fw->size;
         }
     }
 
-- 
MST


