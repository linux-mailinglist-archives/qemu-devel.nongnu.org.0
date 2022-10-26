Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A760EAA8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 23:03:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onnYL-0006AE-S1; Wed, 26 Oct 2022 17:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1onnYF-0005Ac-Sx
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 17:03:04 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1onnYE-0004rG-2O
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 17:03:03 -0400
Received: by mail-qk1-x741.google.com with SMTP id l9so9137912qkk.11
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 14:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d7/73U88aWKwNDfroPuUtEdVueHFIV0vL1R64OOolus=;
 b=MLL6rHHFzlTIlFjnX45D5dWzOTzb7hjWEd9LjdjkkrHD1PRnmPagXf7TnDurZkzP+U
 R3WkGfgLWcI4nPWBgOLemAI3FG1PPLghS/ePBF9ai2JDHtHa+NAMYGoOlCdBSTyq/GVI
 VNFj6aHyV6YOEtXGOx0MFELJVxwe8BxVQ7xutdCd+QmRajvnkIs5W8UjLnwUVW9Luk4+
 i39pI6srbvm8ZEqUyi10qB0taIxmlR4gvM8Gu/npBJEjQo0lp20C4KTR3HQiBOldgJR0
 QPlDhMbteAXrd4wS85xKctWJyW5QE35aK93gLx0jeBo9p3i+r+Z25bU5IHH4F82lE1HL
 ql4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d7/73U88aWKwNDfroPuUtEdVueHFIV0vL1R64OOolus=;
 b=zlDgSOvFEC+bqjXyNjuHno+ZLNq/pYkVmxAEpUlQ9IjDMlIXmOM2tiTKuwkw76n+uW
 9Il1PFTUtWhdhsqrdA9sf1nWfthw4EDWHzAS+sWXq51sAgSjXYDfNBB/pjbi00Ap+w6N
 TNykVqreW453a43KhL0IXB20jwc4nFjp/c35lzOzOGduTfVYqoXUtpjN4AtJhyx46Sgm
 rf3mSrIsq28KPmVlXIT1Eng5NgDm7irIYErJp44BZywMRcM3OPl7lkwb2IA70UE2vW3p
 eZ2O/sBGgw8fifQ4NQj1XIDmJxPXLsdM9s17o+66zBcTN8scE6hFMveC0ZQmYA4FYrh8
 tkNg==
X-Gm-Message-State: ACrzQf2sm2g7/eSNtJEP6lHB4dd6hrqmHKOWRTufYgulByWUBZyc4ehV
 Rx5sWUOQiKpMlEJYnXqtMZn0RB68Jg==
X-Google-Smtp-Source: AMsMyM7VyTdk/Wn3qoOTlb9Al2zqipCfyiurRTHWSirl4Cd1LBW6/x+6OhstOtIN2i9JM0/p439LrQ==
X-Received: by 2002:a05:620a:2587:b0:6cf:7ece:e1f9 with SMTP id
 x7-20020a05620a258700b006cf7ecee1f9mr31770925qko.182.1666818180277; 
 Wed, 26 Oct 2022 14:03:00 -0700 (PDT)
Received: from fedora.mshome.net ([104.184.156.161])
 by smtp.gmail.com with ESMTPSA id
 e12-20020ac8130c000000b003a4efd59754sm1325020qtj.12.2022.10.26.14.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 14:02:58 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, linux-cxl@vger.kernel.org, jonathan.cameron@huawei.com,
 dave@stgolabs.net, a.manzanares@samsung.com,
 Gregory Price <gregory.price@memverge.com>
Subject: [PATCH] hw/i386/pc.c: CXL Fixed Memory Window should not reserve e820
 in bios
Date: Wed, 26 Oct 2022 16:59:13 -0400
Message-Id: <20221026205912.8579-1-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qk1-x741.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Early-boot e820 records will be inserted by the bios/efi/early boot
software and be reported to the kernel via insert_resource.  Later, when
CXL drivers iterate through the regions again, they will insert another
resource and make the RESERVED memory area a child.

This RESERVED memory area causes the memory region to become unusable,
and as a result attempting to create memory regions with

    `cxl create-region ...`

Will fail due to the RESERVED area intersecting with the CXL window.

During boot the following traceback is observed:

0xffffffff81101650 in insert_resource_expand_to_fit ()
0xffffffff83d964c5 in e820__reserve_resources_late ()
0xffffffff83e03210 in pcibios_resource_survey ()
0xffffffff83e04f4a in pcibios_init ()

Which produces a call to reserve the CFMWS area:

(gdb) p *new
$54 = {start = 0x290000000, end = 0x2cfffffff, name = "Reserved",
       flags = 0x200, desc = 0x7, parent = 0x0, sibling = 0x0,
       child = 0x0}

Later the Kernel parses ACPI tables and reserves the exact same area as
the CXL Fixed Memory Window:

0xffffffff811016a4 in insert_resource_conflict ()
                      insert_resource ()
0xffffffff81a81389 in cxl_parse_cfmws ()
0xffffffff818c4a81 in call_handler ()
                      acpi_parse_entries_array ()

(gdb) p/x *new
$59 = {start = 0x290000000, end = 0x2cfffffff, name = "CXL Window 0",
       flags = 0x200, desc = 0x0, parent = 0x0, sibling = 0x0,
       child = 0x0}

This produces the following output in /proc/iomem:

590000000-68fffffff : CXL Window 0
  590000000-68fffffff : Reserved

This reserved area causes `get_free_mem_region()` to fail due to a check
against `__region_intersects()`.  Due to this reserved area, the
intersect check will only ever return REGION_INTERSECTS, which causes
`cxl create-region` to always fail.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
---
 hw/i386/pc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 768982ae9a..203c90fedb 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1062,7 +1062,6 @@ void pc_memory_init(PCMachineState *pcms,
         hwaddr cxl_size = MiB;
 
         cxl_base = pc_get_cxl_range_start(pcms);
-        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
         cxl_resv_end = cxl_base + cxl_size;
@@ -1078,7 +1077,6 @@ void pc_memory_init(PCMachineState *pcms,
                 memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
                                       "cxl-fixed-memory-region", fw->size);
                 memory_region_add_subregion(system_memory, fw->base, &fw->mr);
-                e820_add_entry(fw->base, fw->size, E820_RESERVED);
                 cxl_fmw_base += fw->size;
                 cxl_resv_end = cxl_fmw_base;
             }
-- 
2.37.3


