Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C555B581AF1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:22:28 +0200 (CEST)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGR4V-0007d8-SF
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQ6-0006Bi-LS
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGQQ1-00050o-EH
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658864436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G9GtfjSnubwWAoKua062+95+jZrn536PmQaJRk9riwk=;
 b=hz6eacp6+RWGLLjhJIMpnOJHqXtcoMjB27ZbyLRPBIBmvPdBZlkJvrWZzIZNPOnmDQ7Dl8
 0FdmmHkvFOijL+eghlGie9J6xNayaFZIV2iIvU6zB4Ywztw11dSixW+KTcrjHOaBcuvtkL
 7jn0warx4H7bUHFnk02Z1ESSBAAed+4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-NNJ3yS4WMlu_8FuRpsVCjw-1; Tue, 26 Jul 2022 15:40:35 -0400
X-MC-Unique: NNJ3yS4WMlu_8FuRpsVCjw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z20-20020a1c4c14000000b003a3020da654so5683630wmf.5
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=G9GtfjSnubwWAoKua062+95+jZrn536PmQaJRk9riwk=;
 b=CI/4+P7FTQLNy/+K4sMbpyhFs5K9UJ9GqU1NV+Wk+I6DyJ5D4mf7+cFU594Q6HfRtU
 ZYLYOlQL7WUqmhHRKthwr6RSeRgj31CkGW3HaiKeYPnpXaV0doOIxwHypSQGseH62Kj3
 vkQk83Tkb5JnVyp8GcRKmeBefb+IrQn5jg1opxn1LF2xqhpRYXqX8sefVBDuz14BFPr6
 x/Gq74u+dfoeqeBhT/ufxqfxRDPYYu24dbFMbsEdbmI2OpLy1zRA9y+4fZ0pWKy6AI8H
 vs/RBwIt3m5lKTCabY8sfsbCrkaZGsQrCTJ9IabGzxzLwtvPvGkmwMhT7yrjrwhOnHn/
 wtKg==
X-Gm-Message-State: AJIora9gyCqRDItP8XKtKlFa3+F505M951FjrruxMvBxl7XOQzWwKnAC
 05aY/hD+HkLFqO1bM7YKIsZJCSWXEnjCb53FAbaYfkYAm1hiZ5AHUYzU08tS4FaSszOvkbhF8Do
 citcDxurHjEexUJFYUT3pdr+HfBXSty2o6ao0jxlRkrjOjkGsS8Y8nPSzuYSb
X-Received: by 2002:a05:600c:410c:b0:3a3:2d78:f07f with SMTP id
 j12-20020a05600c410c00b003a32d78f07fmr504511wmi.130.1658864434148; 
 Tue, 26 Jul 2022 12:40:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1td4ym9h1Ravk2UhVMAZZ3tP8vBdWbsKD+crjk4cXeiD210lmOY4dylDRJ2peVb3cqQVfWPYA==
X-Received: by 2002:a05:600c:410c:b0:3a3:2d78:f07f with SMTP id
 j12-20020a05600c410c00b003a32d78f07fmr504495wmi.130.1658864433843; 
 Tue, 26 Jul 2022 12:40:33 -0700 (PDT)
Received: from redhat.com ([2a06:c701:7424:0:3d16:86dc:de54:5671])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a7bc382000000b003a3253b705dsm18798300wmj.35.2022.07.26.12.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:40:33 -0700 (PDT)
Date: Tue, 26 Jul 2022 15:40:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 03/16] hw/i386/pc: Always place CXL Memory Regions after
 device_memory
Message-ID: <20220726193858.177462-4-mst@redhat.com>
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Previously broken_reserved_end was taken into account, but Igor Mammedov
identified that this could lead to a clash between potential RAM being
mapped in the region and CXL usage. Hence always add the size of the
device_memory memory region.  This only affects the case where the
broken_reserved_end flag was set.

Fixes: 6e4e3ae936e6 ("hw/cxl/component: Implement host bridge MMIO (8.2.5, table 142)")
Reported-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220701132300.2264-3-Jonathan.Cameron@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d2b5823ffb..46ab1dcb47 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -922,10 +922,8 @@ void pc_memory_init(PCMachineState *pcms,
         hwaddr cxl_size = MiB;
 
         if (pcmc->has_reserved_memory && machine->device_memory->base) {
-            cxl_base = machine->device_memory->base;
-            if (!pcmc->broken_reserved_end) {
-                cxl_base += memory_region_size(&machine->device_memory->mr);
-            }
+            cxl_base = machine->device_memory->base
+                + memory_region_size(&machine->device_memory->mr);
         } else if (pcms->sgx_epc.size != 0) {
             cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
-- 
MST


