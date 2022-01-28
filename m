Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1279F4A024F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:52:23 +0100 (CET)
Received: from localhost ([::1]:38638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYEF-0003Oc-Co
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:52:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY11-0004X4-FM
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:39 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0z-0002hZ-Ds
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:39 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SK3r2i028573; 
 Fri, 28 Jan 2022 20:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=0xsaNGiJbORarg2uER/iI6ZVlTfM+WDGiu+5bhaMIzu656hIwgqFpfcCpyMzcIRg1gIn
 spi62BS1QzpT+o/+BKg3P32lAGoVgPaTtiy92Rs0iB8AsKV6wcGWiWhCwYbSZphUwuko
 4qC9wkhq5DGzb9XhIIEBIl/8KgMadKvz9h8wz5htTG8y/aqX7zpp2KdPUxkkkP2oJL+0
 /EMhLaLwoBglCLgCt2cZ1+A53uOWBQXwONeLkkYSEDSQqDeFdOP1+xgS9tdqHz4pa4oN
 c4SZ1Yt2b8x/qb0UFBIumishIiZ+BAqaPmCGZlOpQIY7tVOmMhIy+HV5ALl3h1SvV1m4 vg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duwrxmear-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SKQxG3139572;
 Fri, 28 Jan 2022 20:38:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by aserp3020.oracle.com with ESMTP id 3dtaxd4knf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpuPqvo4/92JCnIPN9lU9HlHforDupESzcbHbWwE3YHNNRc6WO/TCSlfGAmuE+w10bEbz1FWbs7GK37ftGTCWboeEhadvQ+YodhZmFsWWdFF5k3dmTCOWPhNO98HmOLigUw+c7UmHdSWr/fgi/AngltaJ9zHgxK1ARosMySsbLN06ZqUHAsXoTfIsc9z3SfaRIkq58oAa8/Wfd9AEIfD66ljOm+NgO6ydcuRwV4b4JHmAsee2b8hiP3q/hMspDwOf8hrWL7lDJ2hyeCkZ31KXZGYv2fbFgbrEvP30jPBU29+JUxZUjihF3O8kXvICqkh6UGYMGRWzJ6i1DYioEckPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=CHqH6tVtRHRGtWgSfhQwOfgTB6iOPma0epvzbRBQIw0pzDYuQrGaccUoNFzyfNxWexa107osd/OAvi6pZJM2SRQLX29wh8gyaFqXIrVCr9YKpaTw2lOqvEs5HNE3zpORuB/+4azRnG2mjtHkqIhQmU4bhhqB0h3gmejr1BdOM039BhM30S8vRMEas1pZLmTLaVerv1G6dFf0H9fkyhHZmAAJQR25YNIhqG7SlZN0ssrqgHj9ed+aUznxwEXdd9AQ8dpddOuHnKxZXkHmb4KQHWpJQoKOu+mFH4v/i1PRlSkAxkGVupHc85Wa3stb4vODdIGedfsLiuHuqqGmKjKwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4WojR4pPgZM7ReGPbmzFpfQeLKcgV8YM5y77IDNGc8=;
 b=FotZ2D6vBLulYBv/A6L42XPe/vUZGZO4YcImz98yWeePGXDAiCfcrB0aWAHvYOXdyPKuPxqXwZHjVHm3s5CUJ2VETyBPRFdZtZjaU6F8V1LkyHPtGPX9h8wA0c0DUCJbCal/Wpj8gpQ83bRaWMng2XoYdX7dZUtuBL8Pni427qk=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH0PR10MB5530.namprd10.prod.outlook.com (2603:10b6:510:10c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 20:38:31 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 20:38:31 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v15 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
Date: Fri, 28 Jan 2022 15:38:06 -0500
Message-Id: <1643402289-22216-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
References: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 285573fb-c353-4dde-1452-08d9e29e253e
X-MS-TrafficTypeDiagnostic: PH0PR10MB5530:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5530488A5B173962A4DF461F97229@PH0PR10MB5530.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wxnf45wEa6z22SZLaPDw+gGqWjwoNwC/uo3jlegaJIjiQ0BTSB3A8yCpNtayae20TnF9uecsuKD0AoPpM8Sq578AITIhu+UjxOzdQW0Qyw+wXT8bz2VmY89foZM3K0/e7m8+HTUALniDj1EXlMwBsw1pwbNy8dNT/CiE0WNaueJzMJVu9n117H2GDPWvNfNxti00g6evA4wg5F5wJqCozP72Un3jRrs5CM/W/b/7kFazXthLf2YSbBoic8B8q1KLL53Q2s7wWkU48p3KneLK6P5yjFI/NTrjReNNGQuJL+N9ut73/HuyRFnlY678k4xpqZ4mCyz2lMv8BO1kKHkbW+61P39Flc9Hqs+kWcJe927ETW4MLkgIV9wCwcz92vdtCk5fw59wvc4FAuE/8/6ggHqgtpPgualxGLZM35ezLl0ES7wiKepFcTruO+3zyeOJwVKOvtQ4O6XSxavnNRexXWtX469tnPQ2VAF2yNQwSxeLUGYS5jiGyDcnN6locgAjNaxHYgBkCWspVScOAvRojqvhwGy8EH9ZCTnOkmvg5TKgBhs1eMwREL5nsoalP0oMd6uZEwO7VwjHzhSpaF+dWMDxUXfJ+IylPgDjtEdx+N/1HNmFD2qAutV0kuO30uGym10f+g65AK33Pvj1ELlslEjg3S6EWSqa2uwBXvO+1N0AySfLgzGfyJaajcYwcPFy/G3/Khk9IfrJk77u0Rt1+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(52116002)(66476007)(26005)(66946007)(6666004)(38350700002)(6486002)(5660300002)(8676002)(6506007)(508600001)(6916009)(186003)(36756003)(2906002)(4326008)(107886003)(86362001)(6512007)(316002)(2616005)(38100700002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fkjYZMb88rkWbO3klbYreOVzGEg2OHeWZLHBESEKM00eNtYRUSGa6kuO5/CU?=
 =?us-ascii?Q?mhlBhFgtF2DEfIDpssVw5sLlPogi9gX+g2N17Sz28y90HIIcHUQioJ5RvrVe?=
 =?us-ascii?Q?zedbKepgEEA6BaTjmrL78hDO3YWBKtgG1POm5QE+aO+AajQiB/giVBfxe9LR?=
 =?us-ascii?Q?O5UySc1mC/qh6ZNLPBxx+2gOE7Z6O/7tO3NAUwrz8IvEYfGx+OJHheyKqKrM?=
 =?us-ascii?Q?hCOwds0+EC3F9UndciG+lyJ8C3F88Q0S51IBEU1SM5qoG5IU2RDSu4CMHYUV?=
 =?us-ascii?Q?Rhgq3lR75wqKr74hY4k1XJ16VH3HENFwknWRL887dfAHBa5E1Trj70lqz8WY?=
 =?us-ascii?Q?sgko9fCMO2EAvTs6n5yfVpynZkZ0PCDR2GVKcOczsIMiu89Pfr5RFm+mkNDY?=
 =?us-ascii?Q?Lc+125ye+s5BLrouKt4nu9Cs09NosbpFpPn9ldeZ3Q0VKC5eFcxpGt/FWxlr?=
 =?us-ascii?Q?rMDCMRoKbPaGPCq2AGio/4VWewnSwScz4pLGTOLP/Th5+a8kAKXXSFJwjGJ8?=
 =?us-ascii?Q?SSP0gcJI0yz7AANoGPA6ffmXKOVG6a3Ba14b1W8VtCJu9gS1ct9TSK/XLr7g?=
 =?us-ascii?Q?jocPBxAIFvYxp4aIDUVR/uoZxqOd80WNOoOv66pHjYJg6UGmMmGRxvcF923B?=
 =?us-ascii?Q?c2ldEzg77aNYiZd4FYJMzP8SeKTX2raDgLfIVJQiNcaHGEMqFPV2Mb/DAZTn?=
 =?us-ascii?Q?NL7Jra1yp3FtyqBfjOZh4T29AZcpknMgjR7rF+p04FObSkrfaZG5fVYLZiz8?=
 =?us-ascii?Q?k1KevuWOiZPGs9M5OnSRF3vC6DYOrL1iHt8Yb8rstTrcUGtDERQ0PxaqOfrT?=
 =?us-ascii?Q?ulRczhtqy/7lNc6vqa78NMU5hXEDFb8Pp1nyROW822VoJKSdSl//dXWFp4aK?=
 =?us-ascii?Q?Eb6o55IvAv8N6ab4y3Bv5RtR60GbZ+OHc72yjBK9Z4Cb2I5N6oOZqK+aGzEM?=
 =?us-ascii?Q?K91rhhrO9he+9gJKwN36YGHRsSAljzi/e3nTV+SFH5Ux5yvGfLLe1aveHAMZ?=
 =?us-ascii?Q?E5h6Sir2RiESBCuNuXDz3QljPSYt7ZRlfLHECSG3uWX01WyGJaPDQHYLSEbu?=
 =?us-ascii?Q?eF91W7JfR9KoOBJw0Kx6CyaehK/2UIuz15DUCzsdhETcNk412VK/hyUHwqfa?=
 =?us-ascii?Q?kNvLm1AId5/3fFp64AhZ2qWKQiUdOoCqV3IRT87/BjvpPErbQaVv9/rE6y2d?=
 =?us-ascii?Q?Z8K40l94OFo4vneQhhdvHuCAZ6VQk9tAoiMu09dW5sa8jMpkO6vjgHw/duYg?=
 =?us-ascii?Q?xwXC05A1UWWARm8iM3awUYPKTKeQJuYy63XvZPz6i8aJDCtpPtvvGFcVm4eP?=
 =?us-ascii?Q?8n294Zcbg0XIIgPJ/do+/veAXTkD5mswFm78x5tcjVfWJg73ZfNQlkgwDDs9?=
 =?us-ascii?Q?IaBvoecDaw41zCA/zW8g9GkudOuUJkwPULyBd9nhpjFVArRjncV1mpo7NIpZ?=
 =?us-ascii?Q?yxtVo23q6Ey74qTurZliYSVaHIgFq2dx2LIBP3uBnH+dXMpcIzEvqg/9TYEr?=
 =?us-ascii?Q?jpa8OM/+/jK/t4tEkBDIS3Onyth0Qe4MrCRUDP4AlSKRUcDZhzZZSH/3OhVd?=
 =?us-ascii?Q?/l9UA2i02cYUhXl7iYI+4hds0Ci9bvyFYkZ7PugTpmF8S5vQVduo4lzFbr6E?=
 =?us-ascii?Q?+Kjw2pSOS94HQ5nnNVqtk6+V7LmTZyanoebY11HmQof+krchc2s4zKXbgPzP?=
 =?us-ascii?Q?CKmM6w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285573fb-c353-4dde-1452-08d9e29e253e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:38:30.9046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmT1HisLnwP2plkBZHdZ3aNWrEn/IBIUcE5IaRXf6e8ZYwwwqUu5w3EaQt26iEJr9jF4qvXCOcboKH4A8ut5AtjaNVofE2d+vNV880Ue20c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5530
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10241
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280118
X-Proofpoint-GUID: ixyQNlMEReLL-I7gE-AyYCaa2r1oMlWu
X-Proofpoint-ORIG-GUID: ixyQNlMEReLL-I7gE-AyYCaa2r1oMlWu
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change exposes ACPI ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/i386/acpi-build.c   | 15 +++++++++++++++
 hw/i386/acpi-microvm.c | 15 +++++++++++++++
 include/hw/acpi/erst.h |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ce823e8..ebd47aa 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -43,6 +43,7 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
+#include "hw/acpi/erst.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
@@ -74,6 +75,8 @@
 #include "hw/acpi/hmat.h"
 #include "hw/acpi/viot.h"
 
+#include CONFIG_DEVICES
+
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
  * a little bit, there should be plenty of free space since the DSDT
@@ -2575,6 +2578,18 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+#ifdef CONFIG_ACPI_ERST
+    {
+        Object *erst_dev;
+        erst_dev = find_erst_dev();
+        if (erst_dev) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_erst(tables_blob, tables->linker, erst_dev,
+                       x86ms->oem_id, x86ms->oem_table_id);
+        }
+    }
+#endif
+
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 196d318..68ca7e7 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -30,6 +30,7 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/utils.h"
+#include "hw/acpi/erst.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
 #include "hw/pci/pci.h"
@@ -40,6 +41,8 @@
 #include "acpi-common.h"
 #include "acpi-microvm.h"
 
+#include CONFIG_DEVICES
+
 static void acpi_dsdt_add_virtio(Aml *scope,
                                  MicrovmMachineState *mms)
 {
@@ -207,6 +210,18 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+#ifdef CONFIG_ACPI_ERST
+    {
+        Object *erst_dev;
+        erst_dev = find_erst_dev();
+        if (erst_dev) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_erst(tables_blob, tables->linker, erst_dev,
+                       x86ms->oem_id, x86ms->oem_table_id);
+        }
+    }
+#endif
+
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
                x86ms->oem_table_id);
diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
index 9d63717..b747fe7 100644
--- a/include/hw/acpi/erst.h
+++ b/include/hw/acpi/erst.h
@@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
 
 #define TYPE_ACPI_ERST "acpi-erst"
 
+/* returns NULL unless there is exactly one device */
+static inline Object *find_erst_dev(void)
+{
+    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
+}
 #endif
-- 
1.8.3.1


