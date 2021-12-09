Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B2346F2D3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:11:00 +0100 (CET)
Received: from localhost ([::1]:60078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNsf-0000r6-QT
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:10:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgd-00008D-NB
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:31 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:2254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgS-0002vz-DW
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:31 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HnbTA010796; 
 Thu, 9 Dec 2021 17:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=U4X+kP3CwRScn0nWtv3EslOHKR547J4qOgJuzP/6cSo=;
 b=uYKWou73mw0MtwBW21Ns5cE9ogJ8PmTOq1/QCuhO274pRC+P9/gSzLqDo2m+x3DnznoT
 pU2BYTIFs/W2ZmBy7b2mGpLn3Hpujjru7NRTEYjQ/IW41wD3HyOW/YSDz+9I8l8PmONA
 tPuo56hfz4P1Q3JcjqfxoY5OtCoOpcOUeW0k46oFrOyKjlN+reYf9FHwRCkpifCWcUTq
 EvmJJxQ9U0TKl1Hr87n+RoMokSXcqUJGadLla8x19UaVjDWoEWVnkuY8XdzE4c11+MLN
 naeuxK++2Oe9lYwObxo1TI2SYECSgSoWJXZV4lyZ8//inDEnubPJlB/ROruGK3b3hGT2 kw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctua7kqd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HpVE8189876;
 Thu, 9 Dec 2021 17:58:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3030.oracle.com with ESMTP id 3csc4whmjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSeUaPYnvddc2yiY3Sfg6waKnFvI7jdp3RiOMk7+7MLY2VoAR3tavpKDRSS99pUUAPLcwxj1SEh9uhGuvFEN9LHvT1xiuHGfGZBxr2vzWFOzzPmrrXfLbgOyYmhkfEFpV2PN4VoldZZP/hgABiQio8w0TICScrXyUr42BW5XpXsfCUSH2AmfqtkhmqogeDyXMizYt3mr/ziVhs4JZ2ze3Ja318DJ+B6Z6HMnGujUWgQ+CqBbigmKvENYLfw/fRLa1ckkSkTnPe9ufWD8KXgcBjAmE6TMREqLnfYXmODt06OH/YNwxVn8/6bfvsevzSPy4PwFsD/33FbeAO4Z5tIKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4X+kP3CwRScn0nWtv3EslOHKR547J4qOgJuzP/6cSo=;
 b=ijNgFWu20+fINakrnBvet1cLCKvVputTvAUnyIXwYqFLGucp2EBIv/BOy7edM2OMLLc+eNZqQGMHv4FgrB3M0LZdUPrONij8rPmtkQdlF4WvVhGmx+Q59Vrlhu9Y5vDGni7A/Pp2Tjp+XNO/Vm00Ui/Ll2Zb0OVZDH8Cvk+tFa2MP4n1Oo634xth2D8MssXdbC5Q9LxlC1xtgWLDb0sys7sebzKVMa5LwnbejVe9frX7F0WOhZPpZbw3H4YHF0GPvLzMLhrNkvY8jz97AFiCUYDv4axw+t2mO7+hsglZsu3EFPqV3ocvR+ios5YFOUBjEbqtIc8cjSitaFFhVZCCng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4X+kP3CwRScn0nWtv3EslOHKR547J4qOgJuzP/6cSo=;
 b=naMxiHxZYudTyROZsCPbpXpnGQtQoWoI2gTGWI8ebL7ussYmSZJEnp34yo/f2jPZ5lAMVg5ui4d7bgJQFCN1HWyg2AsZrjo6Hknruate3YsGEt7lpy7SU432qun02IMHe8Kef3qhPHRV/k41NTY2FvcnSqg2pnvBW4CxYp1m30c=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1503.namprd10.prod.outlook.com (2603:10b6:300:22::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:58:13 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:58:13 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
Date: Thu,  9 Dec 2021 12:57:32 -0500
Message-Id: <1639072655-19271-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:806:121::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 17:58:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 824d5e07-dde3-46d4-6688-08d9bb3d782b
X-MS-TrafficTypeDiagnostic: MWHPR10MB1503:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB150308FD27DF7B9C7241C31A97709@MWHPR10MB1503.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1OWgpc/o7DbgsL3ICtdYoXIU5ozfXqxRlKYZA8nPZULMbeoQ93ePsyE0U+KjLKVdRDDUBFYCqg3ZkAxsztSbyVrAzRHIGx8odh4wXy2E9oC15ylsj1M6nH4cjMesYBOsmrfsBb4B4hhFhd5fWtzZyOLSZQp8kfWd475Nu9H59dlb7MY7E8sjj/EzUBVlnFi9AEwp8NOLB6txU6nmN6scnzdxkjx2T0Xh3bxc+ToB1hjoquHfxDsiH/ynejad2tkf0gnTuccCMimUr0dN+fJbDGo8xZ0g43d3A82/G0q7Lgeiuo1KOJCCCEIcGVnFGzP01KvAsUoBRaR5cSBpE7iJ5sh4xWJDKniT2ib+s76zlQd3LGFCrZNkbQu6zgMqlx7wa3cbY428aj2is7CxSOohMAeuob6xIfylx2ESbc5oJMeFijDdqdP1ToVjcRT5V4yvKypLa0xxAfFz1H2cScQPAaXXZJxvHGBtWQhE5kB2PU78mBrBMx1NPPpZ1OByojI7xZNwIOkQZxS4cE/pFrTWP8xdGFE96/hRMCwMupIpePey1s/f3SoCrVNA1vwPj7MY5UgDXlaS7RScvsc5ZIPkL2UK6ajvopdUR24pA6kpG8ZV+se9AIJQpi1QLuci29dqGz9amAip3vU8UBOTx8z2V8bjyreSFErd1q7tm1dBwr2Sqha2c/cJwk9E/X7m4QeimFeVXPIPj4HFOzVRT633w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(5660300002)(4326008)(956004)(52116002)(66946007)(38350700002)(8676002)(7696005)(6486002)(107886003)(36756003)(38100700002)(66476007)(26005)(186003)(86362001)(66556008)(508600001)(6666004)(2906002)(8936002)(316002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?99Cqk514g++eic28s9Ev5AN6pLA58H+GHQaX6xxWXDcKHoB4+kPQv2HiFSfQ?=
 =?us-ascii?Q?brnzFx99jTBBsR+/uP7hSodRHo0V+hfjzx4mBxKds1L4bj0yDNV9/l5IykJY?=
 =?us-ascii?Q?HQyTUWUlgSNrpO/4fAeirSW4u7Tf3UJbJsKGIlRHPvE78X0vNznOD03pAg3d?=
 =?us-ascii?Q?CZJAwkXxIKY3uWLTyfC4Fih0d/lmr3l8Dp/Pn3z2EWLrzUoEij17/2rgzg3s?=
 =?us-ascii?Q?oG2JbOl38Gikw/Td+Z7FPxfFBChRJdPueA577kAUe1/pVoK7njUQjxyzCHrA?=
 =?us-ascii?Q?iE+z+HGNvuqSSI8o3kw6alynLPYnQuGiS7m0Gh2/zqg9VfyXKLfMcTM7apa8?=
 =?us-ascii?Q?zhfC25PiMq1C2WsTBFbvyk4e/f3NkmMBWswATSyp370aZxDS4nEZIflpcozv?=
 =?us-ascii?Q?vZQGTv2Tk2VjZHQnAr77LgnYbo2djpgp415/nxyAX6Ru11NuZIbOxQ1lVcCk?=
 =?us-ascii?Q?WY1TJ6AprZXTVHkBADb/MskqbFWCOMVAqCGMO9J5MkGzc3c4YYpEsQ4NeuaS?=
 =?us-ascii?Q?/69TcBOaWlGgByuMw+Mwk/gJDjD4yqfT1nqhdTCXOzL9Wy6Nik4gTbTdoWH8?=
 =?us-ascii?Q?Lf8UJNl8rYlYv+kg2qhHO8KXXAuMRw4CLYDWE2UwB9hade/XpjBtfksm3xSn?=
 =?us-ascii?Q?RRoSQAKMPhpjCOJBBUXLFyGreX2AG3up2Sq9x/85OTW68sDwSGGz2jmG1gXI?=
 =?us-ascii?Q?x4WIkQV8UQ4cgnoXyUAmcK1+t7RQL/4dzLSSLiCJn/QXrz1t3oUloqcmHeNE?=
 =?us-ascii?Q?AQe0pc5TwaOJvs2jiFZzJaYV/+zHVy7kIqb0aOtBRFlyfH94D3rKisKHz7oh?=
 =?us-ascii?Q?Uey8djHaWIM4euFIemDtFEo2/wYJkvUSM0ThtnhnEzvZECXHlSn0CbvZHDT7?=
 =?us-ascii?Q?GQLTqFo+KiALqOCYQ+kBH7CL5c5SLGYvq23396XfbqXkJ+zJHfmXGP4FvLjb?=
 =?us-ascii?Q?PaFVWpJV3XrmPQCcGakQ7TdKpYhLyaIuRFSuMlZKdUm+SegkjscoSSqY8OPS?=
 =?us-ascii?Q?vw2kQmjXnbB3HJJTKjwsFYMlLLYf/yRAlaBIvu/Ri7d48h8a5OTW6uUMpP5k?=
 =?us-ascii?Q?GuvZNdQT7wNHZyn1Dk323EEuRu9uqnYmsh5jPw7SDkeyKforWhqXLk8phv2g?=
 =?us-ascii?Q?o7kYDzdHnHyPk4mbkeFXrb36287UNVmO+oj0t44NMwwzJ6eYDUnJGQdZnHrB?=
 =?us-ascii?Q?KloRoEOVBBdAXV4xa1z18UxPjrCM+sQPWg2dEtb4ssrjsaeryoS23+Rz159+?=
 =?us-ascii?Q?9UIO6MXSNeFRyhbyjCQen2lAeq/xTrn7MHIG4nWqJtZKm6pF+zTxoB4BRYgT?=
 =?us-ascii?Q?ymPgoNyZf1aDHURW4WqIXtB36WqLcJwd7cNkNOgVWIxARR+lO3s1lMr2d/il?=
 =?us-ascii?Q?hMlkColv+ecpDsxk9sqxBmj+4OqI9duU8S9/pj+FbmpyE9v9013pRwFcKsjW?=
 =?us-ascii?Q?vm2fN2+l3VNBRCIc0DHJG4kc6hEVko73DkdegJkawxuv3xF3eTv1cOPCk5Lq?=
 =?us-ascii?Q?qZjSQi//6oyn2VLgHKLyyU2M5MuJzj5xNTQnFP76AMtZSMxGXWTrzR+Zx5gt?=
 =?us-ascii?Q?LHxCIgZ4/bT99Uwjn/fVmGbL9TOP609KDrOSKqOdgDeU+mNAMSXA8Rwv5jYo?=
 =?us-ascii?Q?Ql6FOFjBhq/BqszJ9lBdz9Sbl8c9R/FWT+3GpJD/3q9bivJmsj/LBNkqQzEN?=
 =?us-ascii?Q?aahda6wXoeRxp7pKPVokmRpNOIE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824d5e07-dde3-46d4-6688-08d9bb3d782b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:58:13.4863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Knrkcym5ps0qftH/jTnzjPausqmn2qBMYL8AplNFpCGTy20a1s6VrkRmwfrj4ouZQDIItjyWWgPaH7WOE0DXEOU0rJ2YbvR/AoPR1t5JP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1503
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090093
X-Proofpoint-ORIG-GUID: VQ00-E7lf3rLwLywlYAUONXAl3IIfU1d
X-Proofpoint-GUID: VQ00-E7lf3rLwLywlYAUONXAl3IIfU1d
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_NONE=0.001,
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
index a99c6e4..55bca28 100644
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
@@ -2566,6 +2569,18 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
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


