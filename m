Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0463B09F8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 18:10:05 +0200 (CEST)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviyS-0001AV-6a
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 12:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvieh-00077d-1x
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lviee-0005wp-TZ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:38 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MFem77028105; Tue, 22 Jun 2021 15:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=r6kbZRxLO19IIaWjEAk+ksQuNNvSN5d+kF5PBRU5Tvs=;
 b=hoJVB4aYSv0QpT729ZZ4c1NrVkJJunjoArTj/wVzr03+dlR9z+7/EL1NiNK0+wnLfP4i
 PkZqJw9wpny2uNdV0HECxcj4EbStbyAwyYHv+naXTHvWyR+cLXTF76gUWSHW+MJlw0fl
 Usr4UwHM0wDc3j0FjCAn7oBfyH/rGf6o26+ySzXZlZF5MULV9QjuvVX+5NKsrVr9LTXX
 mJQumqPmTOaXrBSICDWMwNHiCheH4vFdxRXwdCQAHigUrk2VzfCXosdo5GeI+RqGce9+
 uN47H0n4rcVKznHhGcLTn/Jf1C5Qc5JrfNgK8f3tLWQ8Nv90CUItc0JSxRuBtgV1OTsn CA== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39anpuuub3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:32 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15MFnVRZ187027;
 Tue, 22 Jun 2021 15:49:31 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
 by aserp3030.oracle.com with ESMTP id 3996mdpsft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjlBEIa2tOm9DfruhKFNB5tO1kvNjwe63KdMnEACJf68MjSTSwXZEtetGHL45JuvkvRDPilDcMbYCa+ta8ps2XihADY65ghV8Ev3EIqH5ykZuZez/ASiifXNFVDQzdVhT9mGVaTIGLCauhdeXm70KRwyQon+sJ9GFx2Y7pj1SBor24+eAvoGgHa/i7qVc+EeZBYg0ndX/LisNSBueNDh1n8E3rcqxP2gvUikpjD1GLuo4ZrLzxgIaxJR3Zy2ir/njH3iEFkvELFfb/RlLuEQuGz+WycQFhtIITkB0S68dKtu4aoh8BsjQzDRLA4EjrJbOpcyOqwKGuW6j6XbCEvBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6kbZRxLO19IIaWjEAk+ksQuNNvSN5d+kF5PBRU5Tvs=;
 b=Jqcdnt9RgmfQ+jwgYxJNflDRM+RAHz6M5cI1P2W1XWYDCVye992KPqlvEq84W6JqdIUfiR6fkM0e/pAwAPmpOekllnAd152vcv+i6MMgT3TCrKFEDexzStrJpxBWtZcVFqKdBSGbyOYYjUPnqGGAzVITEiQs7eKy9iUkFCbzH4w5Gnq8QXfQyhlCm4fKqC8rjqKWqaCdlQ7qZphJR0aVrnqQZKLCudnajqp9BoVzE3yg1guwI7l95JYs9MiKqRROS/W04jdrI5MLj52YfVAP35FQFRaXpX0NbK/FZmAOXqX3XpVeeeyutJVkeupZn+nmOOlFuGV0ORHgLkATlkgWHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6kbZRxLO19IIaWjEAk+ksQuNNvSN5d+kF5PBRU5Tvs=;
 b=Hbt6768W5+diA58NcEzW+DPki309+pTL1Q64Drdf9j/K9aNhEyb/f7ShmTt1sZqRd70aHqQp2N/t4rDMFabkeHWoB08S0XEUkTprwMGd/uxRlSDZFVgai3ZRzC+kOdqfWyu0QfMVMGZvLzR4SxJkDsIDq1TkN+KIlT96TtJBVX0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5204.namprd10.prod.outlook.com (2603:10b6:208:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Tue, 22 Jun
 2021 15:49:29 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:49:29 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 5/6] i386/acpi: Fix SRAT ranges in accordance to usable
 IOVA
Date: Tue, 22 Jun 2021 16:49:04 +0100
Message-Id: <20210622154905.30858-6-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210622154905.30858-1-joao.m.martins@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from paddy.uk.oracle.com (94.61.1.144) by
 LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 15:49:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01d75430-b11a-4035-0240-08d935955246
X-MS-TrafficTypeDiagnostic: BLAPR10MB5204:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB52043F8777C656AB95977C36BB099@BLAPR10MB5204.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50Npe0rof9Bzc96dkE+CNcP3yINuBdZ/1yeK79ytcLY82gfVoP6BZRi3qaWDL3CoNkepnWER5w/Qe/IgrQjbGrB12m5wtdG8zH2zXBVE9CKBmfrSjZugnONX62ZpL3ZPVfmy9VIbrvtwtpQ8dSNt7oAA12XDbl8Xo6SeGKHc0rGv3JLTgBSYLmOMy3sHQ2cczjMAKiB4kz/stfF9g/TOUcDrquTTcV3rFs9wxslPOCUlS2YDrzeg3UrnVBzDZ5tRuULi2+jUhq8+WWQxkAUlLmajEy30VYVzOK6ExObIUbKnez/c8AI+7eaZHwYoTt98ivxQGIgqf4Di3wGjNwDYKlrly3huaXQxCk/GSFbm2wBMrB2t1ugjAFvGMA8nWE6oH3T4t0W28ZQdMSoUWl67QVCF21aHe3q6+gqu0heWbZHrmB7HmaABz8YXpIss7z6tAjxSeJcBC3nioGrLMJ+r2GGM+GHAZx7B3Jiof4aWTe2GSHJCy+AnG2bgGwyJiwPRMb4w2MA5mSMVo0n/aROkH9scgXa9KYycM/t00vJHIMRrxBHp1VPgAZ998/8cZh6eYo7gc3n/ezE+Mwl41OxbhXnaVd6ZaZze1njCZ/vJarTpzCVfW8QJ7NkCzuTOSJdrSepsYoCAQQXdltdRDwvhZJ3CjbN66I+rIUmsWJCcK9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(39860400002)(376002)(366004)(5660300002)(4326008)(8676002)(956004)(7696005)(1076003)(8936002)(52116002)(2616005)(83380400001)(6486002)(316002)(66556008)(2906002)(38350700002)(38100700002)(6666004)(66946007)(107886003)(86362001)(66476007)(36756003)(478600001)(54906003)(26005)(6916009)(103116003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T9cI3rzFh6nBCSoQyHoxcpsss1boHTqk+PykXPMp4jYlwPdQXqzxZAYwnZpO?=
 =?us-ascii?Q?638oaWv0AEZ05YzNDmxHkAtH+7oD3134yAChovRmVpYdFAHbhxQCwk2VB6ns?=
 =?us-ascii?Q?2/ox52zfV4IUigHlQVuGVS8+LMnIiYwOUXwdPS27KwyJrApp6bBMuv92VC5L?=
 =?us-ascii?Q?mwL2BfsBkV12H+xHAAHqIX+lU+IGwLAmppt+2yaHd6tn4rEpyYYXPq+ZQIba?=
 =?us-ascii?Q?inifX/vNYpXmmU3sbee0INAeEUtMRpUCBSbYzybw135XNyNqcgd7TF6ofjq6?=
 =?us-ascii?Q?nZfe42g+QpiCujbWZVfx5jdqCcbc8NjVsd70QXtd/txFoNx99AbKmuHIBNw5?=
 =?us-ascii?Q?YhNM+NDf4lJ5cJnCaSj/eD7LNHvgH5wPc+fVNV61icKwdemvyBEVTMVvP1eL?=
 =?us-ascii?Q?DqE5NQVnpzsRim3TEPdXWy8WjkNv7Cps6u2oG1eEE/aA0SMKmUX6cw22awm3?=
 =?us-ascii?Q?aZ9P6sUukExAX15l/W/OHqKAj2o8nAlmvMdeCnspmrzr6OL0SRehcpXk86AM?=
 =?us-ascii?Q?C2aY4pkrClpOo7PR9yzplOrZLWau3Ej6578WOxOMPQCSONodJVrbj7gFjWXx?=
 =?us-ascii?Q?LQbIE/aYqHK2OWWKFzenTXGZdcfZAnLjuIFnFl5v3YkD0AeSTBdbj9d/rFU7?=
 =?us-ascii?Q?4EXaJWYoMGZ7l514lCvOZ1Pp4evjzOjCmaL+6fngLj4e4zZrdkTHXap6viUO?=
 =?us-ascii?Q?xW+vf7tWMxBz0siFmuDYuHQmFfwBWdemYuWdtFexftl/MMZ7z7Oq3TLiA+D5?=
 =?us-ascii?Q?XdHLWGuM4SXJebpqYxcd0/u/rjxNdD7FbL4lZQ6JkBgLHCAEGB1oL98p6fYA?=
 =?us-ascii?Q?W1wWthaQjNpR3AqVK4/b6QABDNZ22T00LO+qa8tO4mFVzIXfHUE+HXL3I7ra?=
 =?us-ascii?Q?iZCTdpseAXCj7o2bub0fNztGPO7UBF7fvFz+8kZfPSTUkZPgXgnxXpwTJKng?=
 =?us-ascii?Q?Z/UFZ0s79ePauAax6vFqnpsiqLPwT939ycfT10Qb7DamL6JRKLkCDeNYKF/o?=
 =?us-ascii?Q?MLLg7qooCAwnrqDqRlT8B22i1irbYwlI//pWMOkIVJian1PXhdFyBFY9dDz5?=
 =?us-ascii?Q?v4zkpna0LTftUniKT37Smz4XZb3P5slMcD/LZ9Fc030GlP71XQZis0WDzE/i?=
 =?us-ascii?Q?bR0hrcbN8+S7ljT4QsZXt3A1WcYwEzqj18pm84zaowMbY5MoQwTLDmq8p//P?=
 =?us-ascii?Q?YptNyR9r3Tt7pb/CwJ2xc/0IS76IV5vqIxnlV7ouNRlUaucG1GkzJsQnV6ON?=
 =?us-ascii?Q?3ftDX/AsQ4vNA70BRzFGYKfepReVV4/A3EgcIvuFgFb83izdtODNwX83qhIk?=
 =?us-ascii?Q?70M5nFLYNccpldjUqr8fKTw7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d75430-b11a-4035-0240-08d935955246
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:49:29.7987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fNG3MAV+SY0lnrnJ7Xm3c1JzOVG8HvYJI3vv1rKzz8ogJ9o77nh8N4NzQZB0trq5zDah1dgKDrf4cCAv9Ci2Afg1tJrgIfPGv8EyjB3UvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5204
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220098
X-Proofpoint-GUID: QxHN230zCJwR6hIGDwhirono0tYKTLtK
X-Proofpoint-ORIG-GUID: QxHN230zCJwR6hIGDwhirono0tYKTLtK
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On configurations that lead to the creation of an SRAT with PXM entries
(-numa ...) because E820 and SRAT do not match, Linux tends to ignore
the ranges from SRAT, thus breaking NUMA topology in the guest.

When we start adding the ranges after 4G hole, use the newly added
iterator in add_srat_region() to create the SRAT PXM entries for the
usable GPA regions.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/acpi-build.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 796ffc6f5c40..bb0918025296 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -57,6 +57,7 @@
 #include "hw/acpi/pcihp.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/ich9.h"
+#include "hw/i386/pc.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/q35.h"
 #include "hw/i386/x86-iommu.h"
@@ -1872,6 +1873,23 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
 #define HOLE_640K_START  (640 * KiB)
 #define HOLE_640K_END   (1 * MiB)
 
+static hwaddr add_srat_memory(hwaddr base, hwaddr size, GArray *table_data,
+                              int pxm)
+{
+    AcpiSratMemoryAffinity *numamem;
+    hwaddr start, region_size;
+    struct GPARange *range;
+    uint32_t index;
+
+    for_each_usable_range(index, base, size, range, start, region_size) {
+        numamem = acpi_data_push(table_data, sizeof *numamem);
+        build_srat_memory(numamem, start, region_size, pxm,
+                          MEM_AFFINITY_ENABLED);
+    }
+
+    return start + region_size;
+}
+
 static void
 build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 {
@@ -1967,9 +1985,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
         }
 
         if (mem_len > 0) {
-            numamem = acpi_data_push(table_data, sizeof *numamem);
-            build_srat_memory(numamem, mem_base, mem_len, i - 1,
-                              MEM_AFFINITY_ENABLED);
+            next_base = add_srat_memory(mem_base, mem_len, table_data, i - 1);
         }
     }
 
-- 
2.17.1


