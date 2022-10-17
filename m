Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6C601DE0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 01:48:58 +0200 (CEST)
Received: from localhost ([::1]:42096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okZqq-00007S-NO
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 19:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1okZmC-000699-Oe
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 19:44:08 -0400
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:35362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1okZmB-0007uB-3h
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 19:44:08 -0400
Received: by mail-qv1-xf44.google.com with SMTP id i12so8384757qvs.2
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 16:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sy9tv1vwouL5wVhECQge7xWZ+qNM1LObFiN/5x/fMFM=;
 b=FIri2iF5j+kvwS6svlaLz2nUebvPOpilYZ79rghjpIxUpv9wvIhQR9M78yVUsLgDzN
 tW7j+BG3oPV/a0ejDAbiq/2VuyhvfsjzEGHcOD5MQ6i+MsJon0t/LlVrd0PS5GQ5k5Sp
 ysqotUx7w/D9n9KLea2dF8Q5PWbHuwSlgHN4oeYIbVD+T0fHzTS0/s1fZD0fs4BlKV9O
 +EGyjvaaC+iyud7nmPho+MN1mCoj+drfD50YjVkTuE55nD7JoqhNy/B9DUUkKYd726SB
 NqhVyTiBnlIAbQUG5majwejJhZ0nvmgmolDOEtOk2O6e58UHlt0h4YzAW2+Iq/PqujPU
 cROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sy9tv1vwouL5wVhECQge7xWZ+qNM1LObFiN/5x/fMFM=;
 b=6mj05RcLYiXNKOnf80KdVVwWD6FdzhDT1BFTdUK0ckadQQ3AwT7hS0nJirqxRYZMqU
 eXmG06LBAxiLOYSzpQjAHsAzcEGxGYVP0DqLR1msjSqcW1VtabXBgtHDno1rQkX3DUUf
 XkvXN2YB5DwxsNwX40a6NrDkrvMl98ScztPU3UA4E9TbmE376Va6ko2NoamvPx1t3p/v
 X5+qo9ElDHPxaa6C3yQ7P5nA+UyzoWTtSka8DeMKm+nJe/hD2YMsxIfwnlFCty4puHE2
 fhgVAGAf+A8tOXP4kWdCo8BV6siCE/icaKI2YLwJ2VZwzWiMdkjTuKJEK2zlCzfOUVEh
 uSNw==
X-Gm-Message-State: ACrzQf2RjFkgOqOMtnG+UK8UDBLHjazIXCLO2jKahtzpSDIwxajK4A9k
 G+LmjKplqtGNgKrEtHzpZQaDNg3Kew==
X-Google-Smtp-Source: AMsMyM4quy6AxXzTx9DblcWGeAySQBU3NbJ+ozk26GaG36plRJmcjSL3nf0X1bU37A8LksBdp+IoHg==
X-Received: by 2002:ad4:5d68:0:b0:4af:af07:580b with SMTP id
 fn8-20020ad45d68000000b004afaf07580bmr37946qvb.14.1666050245643; 
 Mon, 17 Oct 2022 16:44:05 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 m10-20020ac8444a000000b0039b03ac2f72sm790520qtn.46.2022.10.17.16.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 16:44:05 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, imammedo@redhat.com,
 ani@anisinha.ca, jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [BUG] hw/i386/pc.c: CXL Fixed Memory Window should not reserve e820
 in bios
Date: Mon, 17 Oct 2022 19:40:02 -0400
Message-Id: <20221017234001.53297-1-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f44;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qv1-xf44.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
the CXL Fixed Memory Window.  The use of `insert_resource_conflict`
retains the RESERVED region and makes it a child of the new region.

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
index 566accf7e6..5bf5465a21 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1061,7 +1061,6 @@ void pc_memory_init(PCMachineState *pcms,
         hwaddr cxl_size = MiB;
 
         cxl_base = pc_get_cxl_range_start(pcms);
-        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
         cxl_resv_end = cxl_base + cxl_size;
@@ -1077,7 +1076,6 @@ void pc_memory_init(PCMachineState *pcms,
                 memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
                                       "cxl-fixed-memory-region", fw->size);
                 memory_region_add_subregion(system_memory, fw->base, &fw->mr);
-                e820_add_entry(fw->base, fw->size, E820_RESERVED);
                 cxl_fmw_base += fw->size;
                 cxl_resv_end = cxl_fmw_base;
             }
-- 
2.37.3


