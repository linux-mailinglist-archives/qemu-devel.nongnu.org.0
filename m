Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9679433B993
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:08:41 +0100 (CET)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLntg-0007mY-IL
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLnqc-0005XF-R2
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:05:34 -0400
Received: from mail-bn7nam10on2096.outbound.protection.outlook.com
 ([40.107.92.96]:14270 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLnqZ-0001cT-Pa
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:05:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve3yK6Bhk5xdoBabkeix5ofDlqGHvs4nHrskd5qzAJSZHtT2x8TTV3SIiM143PRnhA2bN1TqmhTRAk5S8VtJgbvHhCFKfGorbpAYnB2vifFk3XfHdXkh+zERdE331zSigv1pNGT6qKydz6SUx2paWUutRTI9XefWf3dQqBI4comLndMcKNWGC4wExJBPAmA4GfWEoUYrjBNcyuiKDnA1nyxnWD2/FnVj0jnh209myUolgdu/QTjG+oKbtT802uWbuL14XQKTUTajd60eoyy+fdEuOxnJz2CUB8gLOBfNH7fDtiAErhhx3brc+Jx3rE3mnTCNnYqU7y7uPRImhv179g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MyzeVpnOt2cZ9heXNp2aoFRsblo45wu3Ergk2PWCwY=;
 b=ZI93mrIDm2SaTwphJTi+4+eOJxwleqBL1ZwDC1bkh/KuLYQn3B1ZalgPk9I6v9pViQvqgSEureIIxH9oiOxh2iDsxy5HvGj7VuzAh6ELqFLAh2ECtgL+gInasQsxV2j6cUG9jQ1fxqCTWaOq6SOueBIrz53p2Vc3nWeTT1pROJS75BlrMI4pc28JzTNjEKZlHZX6tRo9q5262cTBXZf2a8OMIdqq52Zl0kxUHt/L024+JsnAv4EDo0Tmgtdz5t/+Kal1xYJ/LiPHijbMgVweiBSUJPtWLXHnxL4k0956Fsp/zfzdWSNIZ30jqLdZVdwq7c6t2NYijkD7NBbsNAwTOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MyzeVpnOt2cZ9heXNp2aoFRsblo45wu3Ergk2PWCwY=;
 b=Re2fqp342KjnuyBdV838o6Sd9J1MZPBOnO485cjfA4wTrHUJYwIq5npIXwVkBNM7I5UgyZZ5MHVbuYqGKE7m1c94DhOzyihfpI3hUX3rFrcqLCl8Maya03C9qyTQH5qqlytFFI0fn66iWhW2GWJuMwRaiFHK2ayXCc7yHBW8Nj4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3933.namprd03.prod.outlook.com (2603:10b6:805:6c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 14:05:25 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:05:25 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] memory: add a sparse memory device for fuzzing
Date: Mon, 15 Mar 2021 10:05:10 -0400
Message-Id: <20210315140512.8357-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315140512.8357-1-alxndr@bu.edu>
References: <20210315140512.8357-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0336.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::11) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0336.namprd13.prod.outlook.com (2603:10b6:208:2c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 14:05:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bc3aae9-071c-4ea2-e309-08d8e7bb60a9
X-MS-TrafficTypeDiagnostic: SN6PR03MB3933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3933D666B6B3F72BD5FF25F1BA6C9@SN6PR03MB3933.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dA8aWutLyu1dDn3KQY+tYU85d2UpMHMYz/qjKNU2gP9qLsEMGgIgmcvD6cQIycDyKgSwcGcMm0KFrYzyghBLPYuz5IHZqjQUv8xv1pjbvyoTBGbYI89DcRDutxeN+5RP7igYzKq2lMmGXI99MbMu7F6yqjLDlLFTBjMTA2eAplcU8iHgBvbvMhRjbBeTy2t4u2J+v2iOOEGSDhytCeVYasfsZfkZNaXkk3f14YW2Ts8C4lwmULkHOQECmh55gjnqQ0YuU+/Bd9JyRY5T1lBx3vr/mn77yc6MpjvWE/j6+wvZuEBlUE5iMYLXn0AmiEAaCQFB7igZ2HN9aenz0QzRn5FXgsW9lG3NKI9iood+bqw0Z9b5shSGoLFxcl40HldFtYRxYAoB4OOPdWG3uqDNrSpV8p8PfMEPG76Ef7SScno3BCTsvpUVpdSM1gAV3i3mc/Y65lpPbE+jgUye385dMUm2QT8fUQGQgyP69yC32z/hLIC52VdwPTY9vZL3MU0vKByFWPX1nBYOF6sRLRHbIC1TZ4D9gUv5zHZx/KMsY8ymdSgEiBlOZba4xwd5hBT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(66476007)(8676002)(36756003)(66556008)(66946007)(83380400001)(75432002)(8936002)(316002)(86362001)(6666004)(4326008)(7696005)(52116002)(6486002)(54906003)(2906002)(186003)(956004)(786003)(6916009)(26005)(478600001)(1076003)(5660300002)(2616005)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+RBU5MpCMrRr/Uf90uO952NGYSxz/+h1KszxwfVv5M0SU0YenRV4C/P0lBuq?=
 =?us-ascii?Q?xpUy7vcVSPUFCnbVSKKm4gUGjnEVnpfF3MzLk9Dmg9tVPGddSo+Wsz5k24zq?=
 =?us-ascii?Q?nneiRESlDuN8ph7d/2d/KntjIH/B2wqhJ42j8wDfPi/CRZleKyftsovpSe2Y?=
 =?us-ascii?Q?Q3gOPfYUUPsakaCqRVxvLEORb+EvHy3JLiM190dH7hHuVXuwhofUJsY0fVTQ?=
 =?us-ascii?Q?2xoItnxautOhxRjUhgho+5AHgfeBbC6x55UIun0n5ukY4JJeEdpu9pzyuZp4?=
 =?us-ascii?Q?7sN3WqjycObc3yc9WwO8sqJakwbDU69kTKinllKGWW60KWht7y4yZKuXTwbp?=
 =?us-ascii?Q?scMLrsdrUEbQP+8XFlN3kYhtMsNW7/eDrrK9A/E3D6HfLwd+bIqYsrZssKO3?=
 =?us-ascii?Q?Bmp2fmGcKlqz+KFwpdVBOKZeyqS9mwZiBKyEnz+q0ENSNkXYMd+sSJ6Pua7/?=
 =?us-ascii?Q?8FqsFldeTm0YYDPLzqfZqFnQ+JIfybybzcyfTa+2RXvyF7yLe5sJx3rvG9h1?=
 =?us-ascii?Q?QF69aanb05SPcgx5JTXZf3kSG3neemInDIxhGFp4TAD5MRLAcyEVcciCSv3J?=
 =?us-ascii?Q?DVziDyRqC2zhUwo90HCE856LbMfrCiLm3V8Tyg4701ZXdbndxAXXwVYrUAns?=
 =?us-ascii?Q?FNEN3BiYxL83iKiJfO1HVcoWyc9cpr9gwPNCprMWkBUbNhRBYWCPfn4sqrdd?=
 =?us-ascii?Q?5ZJ8jbzxD4L0+D6KLXOAT4pfYcbMOl0lMCNpIXxzi8opNGggvPGcB6TT4s0i?=
 =?us-ascii?Q?NOLp2/BTrVlLc3t0GAyB0Yyy6e63mksRv02U7vLVteHAAoZDnhLWgz9wKHK0?=
 =?us-ascii?Q?kjDc8hReyTuFSbg51fVRIwBBwc9JA/rwnvzzNvLMTrT8niEv/0L/tBIw035M?=
 =?us-ascii?Q?bETlfRPBZL/FDZRotR3f0i/YkgA0THEGkTSEOIauVuVKh29a9enNw80hZpUS?=
 =?us-ascii?Q?86Jd/RgrT3qAgnumFnMvi749uS0bxP/K6o3sC9/isKilj2KiCvPCjVOjK2WJ?=
 =?us-ascii?Q?ZJctqgSkaptQZSpSlheQGBaD6gWZCZXoIKZ65CXTypsFDyS+c+lVFkGgjkzc?=
 =?us-ascii?Q?dCduN98KlkUD+5j5MsEy7iI+q/iLvLuQ0u9tf7pkqT+sad9orodWuATOhXuw?=
 =?us-ascii?Q?in128YLrOlZBgqI80CuiHpqeFDtkFUNK89CIvS/wqINZelcp3dUL/KzBASS9?=
 =?us-ascii?Q?mc+KKXZ7jj+On8YmHXq5RK3N7YNrFVDoNTJkWJqEsLo7SH+e1N1MlirFlSYf?=
 =?us-ascii?Q?wq1J8PdUujAiI5XM+agbewcl3CvTp79Ukn23bQ2Y5F59b8b8eTgp/rb0L4DP?=
 =?us-ascii?Q?mhrzZo08N2gJDBfB6SRdLaQw?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc3aae9-071c-4ea2-e309-08d8e7bb60a9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 14:05:24.1151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkwgKf/WB01OgRZLpJp/UAqOBGvv3RjB0fjWixqWMrirjhVQ2lcmOcoSZwqYtanJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3933
Received-SPF: pass client-ip=40.107.92.96; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, f4bug@amsat.org,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For testing, it can be useful to simulate an enormous amount of memory
(e.g. 2^64 RAM). This adds an MMIO device that acts as sparse memory.
When something writes a nonzero value to a sparse-mem address, we
allocate a block of memory. For now, since the only user of this device
is the fuzzer, we do not track and free zeroed blocks. The device has a
very low priority (so it can be mapped beneath actual RAM, and virtual
device MMIO regions).

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 MAINTAINERS                 |   1 +
 hw/mem/meson.build          |   1 +
 hw/mem/sparse-mem.c         | 151 ++++++++++++++++++++++++++++++++++++
 include/hw/mem/sparse-mem.h |  19 +++++
 4 files changed, 172 insertions(+)
 create mode 100644 hw/mem/sparse-mem.c
 create mode 100644 include/hw/mem/sparse-mem.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ca3c9f851..2d25210edf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2633,6 +2633,7 @@ R: Thomas Huth <thuth@redhat.com>
 S: Maintained
 F: tests/qtest/fuzz/
 F: scripts/oss-fuzz/
+F: hw/mem/sparse-mem.c
 F: docs/devel/fuzzing.rst
 
 Register API
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 0d22f2b572..ef79e04678 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -1,5 +1,6 @@
 mem_ss = ss.source_set()
 mem_ss.add(files('memory-device.c'))
+mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
 mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
 mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
 mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
new file mode 100644
index 0000000000..a13ac74dd9
--- /dev/null
+++ b/hw/mem/sparse-mem.c
@@ -0,0 +1,151 @@
+/*
+ * A sparse memory device. Useful for fuzzing
+ *
+ * Copyright Red Hat Inc., 2021
+ *
+ * Authors:
+ *  Alexander Bulekov   <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "exec/address-spaces.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+#include "qemu/units.h"
+#include "sysemu/qtest.h"
+#include "hw/mem/sparse-mem.h"
+
+#define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
+#define SPARSE_BLOCK_SIZE 0x1000
+
+typedef struct SparseMemState {
+    SysBusDevice parent_obj;
+    MemoryRegion mmio;
+    uint64_t baseaddr;
+    uint64_t length;
+    uint64_t size_used;
+    uint64_t maxsize;
+    GHashTable *mapped;
+} SparseMemState;
+
+typedef struct sparse_mem_block {
+    uint8_t data[SPARSE_BLOCK_SIZE];
+} sparse_mem_block;
+
+static uint64_t sparse_mem_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SparseMemState *s = opaque;
+    uint64_t ret = 0;
+    size_t pfn = addr / SPARSE_BLOCK_SIZE;
+    size_t offset = addr % SPARSE_BLOCK_SIZE;
+    sparse_mem_block *block;
+
+    block = g_hash_table_lookup(s->mapped, (void *)pfn);
+    if (block) {
+        assert(offset + size <= sizeof(block->data));
+        memcpy(&ret, block->data + offset, size);
+    }
+    return ret;
+}
+
+static void sparse_mem_write(void *opaque, hwaddr addr, uint64_t v,
+                             unsigned int size)
+{
+    SparseMemState *s = opaque;
+    size_t pfn = addr / SPARSE_BLOCK_SIZE;
+    size_t offset = addr % SPARSE_BLOCK_SIZE;
+    sparse_mem_block *block;
+
+    if (!g_hash_table_lookup(s->mapped, (void *)pfn) &&
+        s->size_used + SPARSE_BLOCK_SIZE < s->maxsize && v) {
+        g_hash_table_insert(s->mapped, (void *)pfn,
+                            g_new0(sparse_mem_block, 1));
+        s->size_used += sizeof(block->data);
+    }
+    block = g_hash_table_lookup(s->mapped, (void *)pfn);
+    if (!block) {
+        return;
+    }
+
+    assert(offset + size <= sizeof(block->data));
+
+    memcpy(block->data + offset, &v, size);
+
+}
+
+static const MemoryRegionOps sparse_mem_ops = {
+    .read = sparse_mem_read,
+    .write = sparse_mem_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+            .min_access_size = 1,
+            .max_access_size = 8,
+            .unaligned = false,
+        },
+};
+
+static Property sparse_mem_properties[] = {
+    /* The base address of the memory */
+    DEFINE_PROP_UINT64("baseaddr", SparseMemState, baseaddr, 0x0),
+    /* The length of the sparse memory region */
+    DEFINE_PROP_UINT64("length", SparseMemState, length, UINT64_MAX),
+    /* Max amount of actual memory that can be used to back the sparse memory */
+    DEFINE_PROP_UINT64("maxsize", SparseMemState, maxsize, 10 * MiB),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+MemoryRegion *sparse_mem_init(uint64_t addr, uint64_t length)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_SPARSE_MEM);
+    qdev_prop_set_uint64(dev, "baseaddr", addr);
+    qdev_prop_set_uint64(dev, "length", length);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(dev), 0, addr, -10000);
+    return &SPARSE_MEM(dev)->mmio;
+}
+
+static void sparse_mem_realize(DeviceState *dev, Error **errp)
+{
+    SparseMemState *s = SPARSE_MEM(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    if (!qtest_enabled()) {
+        error_setg(errp, "sparse_mem device should only be used "
+                         "for testing with QTest");
+        return;
+    }
+
+    assert(s->baseaddr + s->length > s->baseaddr);
+
+    s->mapped = g_hash_table_new(NULL, NULL);
+    memory_region_init_io(&s->mmio, OBJECT(s), &sparse_mem_ops, s,
+                          "sparse-mem", s->length);
+    sysbus_init_mmio(sbd, &s->mmio);
+}
+
+static void sparse_mem_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, sparse_mem_properties);
+
+    dc->desc = "Sparse Memory Device";
+    dc->realize = sparse_mem_realize;
+}
+
+static const TypeInfo sparse_mem_types[] = {
+    {
+        .name = TYPE_SPARSE_MEM,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(SparseMemState),
+        .class_init = sparse_mem_class_init,
+    },
+};
+DEFINE_TYPES(sparse_mem_types);
diff --git a/include/hw/mem/sparse-mem.h b/include/hw/mem/sparse-mem.h
new file mode 100644
index 0000000000..f9863b154b
--- /dev/null
+++ b/include/hw/mem/sparse-mem.h
@@ -0,0 +1,19 @@
+/*
+ * A sparse memory device. Useful for fuzzing
+ *
+ * Copyright Red Hat Inc., 2021
+ *
+ * Authors:
+ *  Alexander Bulekov   <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef SPARSE_MEM_H
+#define SPARSE_MEM_H
+#define TYPE_SPARSE_MEM "sparse-mem"
+
+MemoryRegion *sparse_mem_init(uint64_t addr, uint64_t length);
+
+#endif
-- 
2.27.0


