Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C25F4AD4F0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:32:17 +0100 (CET)
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMr9-0003AV-Ty
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:32:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpp-0001tl-Nm
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:46 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpk-0001vT-Sv
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:45 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2186dmkm012748; 
 Tue, 8 Feb 2022 07:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=75zix5pcvfxhTthaVfOaxCn0SeQx/g1fvHEB8BH4CLw=;
 b=tvBj6tpv5Ez3Ql/XGhZq9Q3t5ZDX98Kn8cEMPVsu+B5Y73rU+UhT6fZiFCGDNWJ05Tau
 NjQzb7mRCP78E4rJppjtDY2yL8eO/4Yq4iO52UQjulpU85mW0BbevalfcNwaK8nVnnrQ
 puSSsamcQkMxfFjiUGx6TomHHJxvidBudRYxadM+TfCxzZxIuhsgWsPT1A6fXlR+HbFf
 oB6cve7gIPc5JasgLJtOsUchp/R6UVNp98RfOhQmlsB6SixhkJAVbeXRBP9sdZygdZo6
 5b3uAuhK2ygZ2AWOiCsRiN4r0szsIsYgsrMATGSzHdiTK1vMsIV4MoM6m6/ezVput8vJ Og== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3fpggk45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2187BlYr093365;
 Tue, 8 Feb 2022 07:22:35 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by userp3030.oracle.com with ESMTP id 3e1ebykknc-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw3W9LjKeigtk1gGUy1Z7cSibqnT+8Xs+14aNMxcKS/l7Eul88YG8V891GWpbTvixGuh6K7ZO2OuScJOL6K9P19RSAG0ByoaF95QxLDlXsciE2wiDFMFGdAQXXrqR307p35PgvzCUwhdVIXqvW+BPvW4XVhvYkSvo6oy7pK0KUm0NmkQbGcxjUeI2OpBINcFZ+QJ94hhJFB0yaCvEgsVgD85kYPI0eK8/rVqEdKRslrgIob3BoGKeKcU8q0iucZalmBbJEaMzbFAu4mzo2zfhGCRfYa5xWUkWO14RoXKBHY1rFY20gLGrit+99gFAS47QkSUuGHjJ+ZNAmsdfSzE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75zix5pcvfxhTthaVfOaxCn0SeQx/g1fvHEB8BH4CLw=;
 b=iGge5IMXYc8RV5DnXbmpAh8L40ithpFOizh0pOpAkjJjzfzAYDYn3dNlMKWBa9ptUUCgNlvTOpFhv//ShAryz739Jd4GcH+yfP2F2ckyCye6Z2BCP/mTrtrJ2mh3HnP7rL4b+tDspyKaAovNGhNxLsgP8JyxZqMiCU2+V2hx7rkITuLQrJvs0DmccYY6eXVF1ihP2tRrUKls/e+SDzUodhIf5ZABT9lJDFPrAwSCR2Vevw+Xl/uxyyYC12jCS2JMPLf1J8L/seO8T0mweR804LHKjyNCnhRxouwN1c22QislsL04hF2A8yYBK8nuA7dI6Hy1wz5bIywBX1aXMKG+Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75zix5pcvfxhTthaVfOaxCn0SeQx/g1fvHEB8BH4CLw=;
 b=syQQIQ4Sjm7Km4V1Z9PI5r8G9Bou26+VomWzec186jSOR1JFHHI7FE4dKNbeS9vuVU5QzMDJ1UJe0a4exwJPugCVro+wEl+y00oezzhvWclx38ujO3jQx9VxMD7PSYoXc9nrFFNDZXDEWS+CKIO+30Ax5ucwzb/WbT0cWQKmVY0=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:22:32 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:22:32 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 3/8] ioregionfd: introduce memory API functions
Date: Mon,  7 Feb 2022 23:22:17 -0800
Message-Id: <f0ca2f5797d938425d34517d7c0d9d97fdc0f52f.1644302411.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644302411.git.elena.ufimtseva@oracle.com>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d460a26-0e76-447b-f2ca-08d9ead3c5a2
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB5608EF76182C6A510C7F5E638C2D9@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:67;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sws4Y1rFvuvw+MR/Vm72p+1NYhZ1Fa06BsKHK2b8v5q5s9x5JSDCphykJBxcIlMe0zANDUBXb9uEgDJKV+NG7Jz8FsF5+IoM7tfS+0FXe0EWClajkreO3VGM2YLDVneDOpN0G2Cw7niPn+fVQgb4dY2zoxP9TZGY7Sio9KnVu2dDR8zpqAQUrzEq3kwreCndtTeS8xILgjiTJJWLjvTvqVOVoSo85CbQriofIYmo+Ck1dhrbTrMtyKB/Df5ndesTIv5VR4IoIBeEoy2Wxw23kADI7QXvPk/Rs3kPMdR6OwDYKlTqYcgylJlHjQS5fPt/xOtnEwJ52G/UTHyFEVjl4YAAVCdth4E6YLufAUsWZETQtMCQqC8e4F/HJ8IeE6UAKipAL0tjrxROKQnwvYBCEJtU94+ihx7/LtEUC9HHSK7Rl+t/ZIFwlazgS9npXJ4UbLqw1KxWbmEwumqvp5t3th1aaWjYeSbJcpvd1tvLty+GPlEXjvg8jM0mQ/xxguO1DSlmPeeQ0DN67e8n2nM8YgJcRe1/IBI39uN8Swub6Z0Lv2JeuW1lwVYeDog7t76i7lnlAveh+ZsDDmJ753lsE3GINfnVjL8CpIFk/jiF+lOXreTMr7YbS5wGbHvZ33nTncA6dUU+gPlpyy3bPxfeZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(36756003)(83380400001)(186003)(38100700002)(86362001)(5660300002)(7416002)(2616005)(6486002)(44832011)(508600001)(6666004)(8676002)(4326008)(52116002)(2906002)(66946007)(66476007)(6506007)(66556008)(6916009)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WRYzITfucctitW+2dN38A+RTxXl5zUVAWi7cIrNyvba1+Ll51t5Fg6wlUUOh?=
 =?us-ascii?Q?e25eKX43gNVwB4PlW/wQCdaxm2w5rZ6b+AtqDcr0AsTYtzAPwkGzFqSu9Os4?=
 =?us-ascii?Q?sqGDv9gw5TaB4jL5Q5bATd1ZUpwsOEFjZdyXpJvpH//YV7/vxi0C7caPhhPy?=
 =?us-ascii?Q?kDfqMMtZd1uPxE1/jBIZd1bo686pubjG7VeYZcq+nGx2LMDsM1DxrxSmHIxK?=
 =?us-ascii?Q?PP8zlumge1ToA0q5GvdG+oSTQtIv1cxOtbo41o6lO49GMF0lWPksnkdmFtCk?=
 =?us-ascii?Q?5FaNm4VrRumJN+bFUQK5nH+6E96F8Q1ZM6Gnsfp8ayVf6yOYYFKvfabxdaDt?=
 =?us-ascii?Q?uQtJc1vmG6faMmeM3X9bTH3iPk5MNAUdCJlr0+/gkzCwDw+UFQ/A//tD9hzp?=
 =?us-ascii?Q?Q1uwEORDT4Sa0B9MBavodtfdjcL8fiLget9R4nfL/zFNhtfrlS2lYRosMVfr?=
 =?us-ascii?Q?y0ENLFDnEkaRhlmI+0MF1D1yO4PgBd8G9bOR5JLlU5qBJkIU7PClnv0gh5XJ?=
 =?us-ascii?Q?S3t5SRV4nqj5Ir96A0zijhuIPq/ycTDEmGtIfxT7ayYt2ildKnzY214die0B?=
 =?us-ascii?Q?nF31YbnEHjvYDnRQHxIcksafP+CjESmVii3dvW2U4jU8r2wC1HJnTGBjp1Dd?=
 =?us-ascii?Q?v9qeEnzzkZwRT2ofGPiA9/PB37PrDjHnNDdERv7aV2rBqStlI6Ls6oudOkPq?=
 =?us-ascii?Q?GdGs9h0Xx7CR4fItRS8BHh2Wl0dL0kiefdxN8FQzyOdU5Wf3iXm6f18aeikm?=
 =?us-ascii?Q?i6rX+Tw/cqcCkXZMeHtTKg/aMTcKCxihN1wOjyV/SXkerXRftFso4nufA9S9?=
 =?us-ascii?Q?V7O5t8F25Mr8eZSYRUuybWBYU7njC+Wqm6/8ndfTV4LlY4b4kAT02IDF6Bcd?=
 =?us-ascii?Q?xK1q0CzC54GFAjTFclv0YYP+QCP4Z9GOHcg5p8rhDzeCZPEvaRyomxrTu2HL?=
 =?us-ascii?Q?weuRIcwEFrHdfJC5oUvewy+QYnshsX5zPmuSTlOjj++PLGdsLO9gacZNYq2F?=
 =?us-ascii?Q?N7Lyn9hjcplgnyvRGt31RQzSTzZbg3sodb/tO+dZVuCn895ZEQjA/nWvstwV?=
 =?us-ascii?Q?4pvsL3Bu7CpnJLE30fCkmw0q3ZrGfwG2564NEbkoapTg7W1EDBD01nOv1/Pd?=
 =?us-ascii?Q?DN65WnQn7hJApTfjCJXFg3Gtcme9yFt3gseR12ssXtPb57FEjIb53lO20lbK?=
 =?us-ascii?Q?O9svIPMB3XjOc/7x1YWoh4jqxJIFPy8ZtTCll/mUfCd6pBRDIRNESYv/kuMD?=
 =?us-ascii?Q?/rZxPX731c2ska4FMdZ0BaOc/sWiRD9YVNTkED7fq+CksUbnV0zbVc5v8udF?=
 =?us-ascii?Q?Z9gL/Xxy4cxcpTqSyvm4Fph25qYzkN5l+3Hl35OgS+a+CokI7N3SvB6Da69j?=
 =?us-ascii?Q?dbH3j0u2P1+7k/Sp58iPXID/PHUmCH9/QfKs5ALGGqwxtCM6KP7/5FiT4x1Y?=
 =?us-ascii?Q?GhhQfrpoI0ly/E6Cra7wUJVtXOWfXNusVRjcyqtMyWUsFQoH3eZ5aschUugh?=
 =?us-ascii?Q?VH3GjVXm52owl9Bds+b9/aIqfxr1Jy5jf+XloByX8MJ539FQr2ptWEnCj0iF?=
 =?us-ascii?Q?sUs/JAO8WYhEC3HcLJM5ZTSAfByQXy6tLD9XeU4NINiCsTRhfBAPICG5QOpM?=
 =?us-ascii?Q?NaShs/5Pzw+iTOsKJ2akNIL31AUS4P1e2KfZAx/WLy0y7tEPBZYW+osa49iY?=
 =?us-ascii?Q?ywj+PxZp0I9AI5Hts510HCvOGZf0ZJSCgnofZ840lWGe+u77Tz5kx/Cp67La?=
 =?us-ascii?Q?K69Yg05Udw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d460a26-0e76-447b-f2ca-08d9ead3c5a2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:22:32.5987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xIn8hh64K7SFOpD+oqvy5feUh84Rlz4OEKQSIabKdjk2+G/0HZwM+NDfQCsk2nZreOQN0IA+74vJlFrIfSPiSgyyA9L8hKliqUo9gPKKlQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080038
X-Proofpoint-GUID: 5LOI8oXfCN9dGdeZH-tHL0b4qVRj60cF
X-Proofpoint-ORIG-GUID: 5LOI8oXfCN9dGdeZH-tHL0b4qVRj60cF
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, armbru@redhat.com, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to ioeventfd, introduce the ioregionfd
functions to add and delete ioregionfds.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 softmmu/memory.c | 207 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 207 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7340e19ff5..3618c5d1cf 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -40,6 +40,7 @@ static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
 unsigned int global_dirty_tracking;
+static bool ioregionfd_update_pending;
 
 static QTAILQ_HEAD(, MemoryListener) memory_listeners
     = QTAILQ_HEAD_INITIALIZER(memory_listeners);
@@ -170,6 +171,13 @@ struct MemoryRegionIoeventfd {
     EventNotifier *e;
 };
 
+struct MemoryRegionIoregionfd {
+    AddrRange addr;
+    uint64_t data;
+    int fd;
+    bool pio;
+};
+
 static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
                                            MemoryRegionIoeventfd *b)
 {
@@ -214,6 +222,33 @@ static bool memory_region_ioeventfd_equal(MemoryRegionIoeventfd *a,
     return false;
 }
 
+static bool memory_region_ioregionfd_before(MemoryRegionIoregionfd *a,
+                                           MemoryRegionIoregionfd *b)
+{
+    if (int128_lt(a->addr.start, b->addr.start)) {
+        return true;
+    } else if (int128_gt(a->addr.start, b->addr.start)) {
+        return false;
+    } else if (int128_lt(a->addr.size, b->addr.size)) {
+        return true;
+    } else if (int128_gt(a->addr.size, b->addr.size)) {
+        return false;
+    }
+    return false;
+}
+
+static bool memory_region_ioregionfd_equal(MemoryRegionIoregionfd *a,
+                                          MemoryRegionIoregionfd *b)
+{
+    if (int128_eq(a->addr.start, b->addr.start) &&
+        (!int128_nz(a->addr.size) || !int128_nz(b->addr.size) ||
+         (int128_eq(a->addr.size, b->addr.size) &&
+          (a->fd == b->fd))))
+        return true;
+
+    return false;
+}
+
 /* Range of memory in the global map.  Addresses are absolute. */
 struct FlatRange {
     MemoryRegion *mr;
@@ -800,6 +835,52 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
     }
 }
 
+static void address_space_add_del_ioregionfds(AddressSpace *as,
+                                              MemoryRegionIoregionfd *fds_new,
+                                              unsigned fds_new_nb,
+                                              MemoryRegionIoregionfd *fds_old,
+                                              unsigned fds_old_nb)
+{
+    unsigned iold, inew;
+    MemoryRegionIoregionfd *fd;
+    MemoryRegionSection section;
+
+    iold = inew = 0;
+    while (iold < fds_old_nb || inew < fds_new_nb) {
+        if (iold < fds_old_nb
+            && (inew == fds_new_nb
+                || memory_region_ioregionfd_before(&fds_old[iold],
+                                                  &fds_new[inew]))) {
+            fd = &fds_old[iold];
+            section = (MemoryRegionSection) {
+                .fv = address_space_to_flatview(as),
+                .offset_within_address_space = int128_get64(fd->addr.start),
+                .size = fd->addr.size,
+            };
+            MEMORY_LISTENER_CALL(as, ioregionfd_del, Forward, &section,
+                                 fd->data, fd->fd);
+            ++iold;
+
+        } else if (inew < fds_new_nb
+                   && (iold == fds_old_nb
+                       || memory_region_ioregionfd_before(&fds_new[inew],
+                                                         &fds_old[iold]))) {
+            fd = &fds_new[inew];
+            section = (MemoryRegionSection) {
+                .fv = address_space_to_flatview(as),
+                .offset_within_address_space = int128_get64(fd->addr.start),
+                .size = fd->addr.size,
+            };
+            MEMORY_LISTENER_CALL(as, ioregionfd_add, Reverse, &section,
+                                 fd->data, fd->fd);
+            ++inew;
+        } else {
+            ++iold;
+            ++inew;
+        }
+    }
+}
+
 FlatView *address_space_get_flatview(AddressSpace *as)
 {
     FlatView *view;
@@ -814,6 +895,52 @@ FlatView *address_space_get_flatview(AddressSpace *as)
     return view;
 }
 
+static void address_space_update_ioregionfds(AddressSpace *as)
+{
+    FlatView *view;
+    FlatRange *fr;
+    unsigned ioregionfd_nb = 0;
+    unsigned ioregionfd_max;
+    MemoryRegionIoregionfd *ioregionfds;
+    AddrRange tmp;
+    unsigned i;
+
+    /*
+     * It is likely that the number of ioregionfds hasn't changed much, so use
+     * the previous size as the starting value, with some headroom to avoid
+     * gratuitous reallocations.
+     */
+    ioregionfd_max = QEMU_ALIGN_UP(as->ioregionfd_nb, 4);
+    ioregionfds = g_new(MemoryRegionIoregionfd, ioregionfd_max);
+
+    view = address_space_get_flatview(as);
+    FOR_EACH_FLAT_RANGE(fr, view) {
+        for (i = 0; i < fr->mr->ioregionfd_nb; ++i) {
+            tmp = addrrange_shift(fr->mr->ioregionfds[i].addr,
+                                  int128_sub(fr->addr.start,
+                                  int128_make64(fr->offset_in_region)));
+            if (addrrange_intersects(fr->addr, tmp)) {
+                ++ioregionfd_nb;
+                if (ioregionfd_nb > ioregionfd_max) {
+                    ioregionfd_max = MAX(ioregionfd_max * 2, 4);
+                    ioregionfds = g_realloc(ioregionfds,
+                            ioregionfd_max * sizeof(*ioregionfds));
+                }
+                ioregionfds[ioregionfd_nb - 1] = fr->mr->ioregionfds[i];
+                ioregionfds[ioregionfd_nb - 1].addr = tmp;
+            }
+        }
+    }
+
+    address_space_add_del_ioregionfds(as, ioregionfds, ioregionfd_nb,
+                                      as->ioregionfds, as->ioregionfd_nb);
+
+    g_free(as->ioregionfds);
+    as->ioregionfds = ioregionfds;
+    as->ioregionfd_nb = ioregionfd_nb;
+    flatview_unref(view);
+}
+
 static void address_space_update_ioeventfds(AddressSpace *as)
 {
     FlatView *view;
@@ -1102,15 +1229,22 @@ void memory_region_transaction_commit(void)
             QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
                 address_space_set_flatview(as);
                 address_space_update_ioeventfds(as);
+                address_space_update_ioregionfds(as);
             }
             memory_region_update_pending = false;
             ioeventfd_update_pending = false;
+            ioregionfd_update_pending = false;
             MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
         } else if (ioeventfd_update_pending) {
             QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
                 address_space_update_ioeventfds(as);
             }
             ioeventfd_update_pending = false;
+        } else if (ioregionfd_update_pending) {
+            QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
+                address_space_update_ioregionfds(as);
+            }
+            ioregionfd_update_pending = false;
         }
    }
 }
@@ -1757,6 +1891,7 @@ static void memory_region_finalize(Object *obj)
     memory_region_clear_coalescing(mr);
     g_free((char *)mr->name);
     g_free(mr->ioeventfds);
+    g_free(mr->ioregionfds);
 }
 
 Object *memory_region_owner(MemoryRegion *mr)
@@ -2434,6 +2569,42 @@ void memory_region_clear_flush_coalesced(MemoryRegion *mr)
 
 static bool userspace_eventfd_warning;
 
+void memory_region_add_ioregionfd(MemoryRegion *mr,
+                                  hwaddr addr,
+                                  unsigned size,
+                                  uint64_t data,
+                                  int fd,
+                                  bool pio)
+{
+    MemoryRegionIoregionfd mriofd = {
+        .addr.start = int128_make64(addr),
+        .addr.size = int128_make64(size),
+        .data = data,
+        .fd = fd,
+    };
+    unsigned i;
+
+    if (kvm_enabled() && !kvm_ioregionfds_enabled()) {
+        error_report("KVM does not support KVM_CAP_IOREGIONFD");
+    }
+
+    memory_region_transaction_begin();
+    for (i = 0; i < mr->ioregionfd_nb; ++i) {
+        if (memory_region_ioregionfd_before(&mriofd, &mr->ioregionfds[i])) {
+            break;
+        }
+    }
+    ++mr->ioregionfd_nb;
+    mr->ioregionfds = g_realloc(mr->ioregionfds,
+                                sizeof(*mr->ioregionfds) * mr->ioregionfd_nb);
+    memmove(&mr->ioregionfds[i + 1], &mr->ioregionfds[i],
+            sizeof(*mr->ioregionfds) * (mr->ioregionfd_nb - 1 - i));
+    mr->ioregionfds[i] = mriofd;
+
+    memory_region_transaction_commit();
+    ioregionfd_update_pending = true;
+}
+
 void memory_region_add_eventfd(MemoryRegion *mr,
                                hwaddr addr,
                                unsigned size,
@@ -2511,6 +2682,38 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     memory_region_transaction_commit();
 }
 
+void memory_region_del_ioregionfd(MemoryRegion *mr,
+                                  hwaddr addr,
+                                  unsigned size,
+                                  uint64_t data,
+                                  int fd)
+{
+    MemoryRegionIoregionfd mriofd = {
+        .addr.start = int128_make64(addr),
+        .addr.size = int128_make64(size),
+        .data = data,
+        .fd = fd,
+    };
+    unsigned i;
+
+    memory_region_transaction_begin();
+    for (i = 0; i < mr->ioregionfd_nb; ++i) {
+        if (memory_region_ioregionfd_equal(&mriofd, &mr->ioregionfds[i])) {
+            break;
+        }
+    }
+    assert(i != mr->ioregionfd_nb);
+    memmove(&mr->ioregionfds[i], &mr->ioregionfds[i + 1],
+            sizeof(*mr->ioregionfds) * (mr->ioregionfd_nb - (i + 1)));
+    --mr->ioregionfd_nb;
+    mr->ioregionfds = g_realloc(mr->ioregionfds,
+                                sizeof(*mr->ioregionfds) *
+                                mr->ioregionfd_nb + 1);
+    memory_region_transaction_commit();
+
+    ioregionfd_update_pending = true;
+}
+
 static void memory_region_update_container_subregions(MemoryRegion *subregion)
 {
     MemoryRegion *mr = subregion->container;
@@ -2956,11 +3159,14 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
     as->current_map = NULL;
     as->ioeventfd_nb = 0;
     as->ioeventfds = NULL;
+    as->ioregionfd_nb = 0;
+    as->ioregionfds = NULL;
     QTAILQ_INIT(&as->listeners);
     QTAILQ_INSERT_TAIL(&address_spaces, as, address_spaces_link);
     as->name = g_strdup(name ? name : "anonymous");
     address_space_update_topology(as);
     address_space_update_ioeventfds(as);
+    address_space_update_ioregionfds(as);
 }
 
 static void do_address_space_destroy(AddressSpace *as)
@@ -2970,6 +3176,7 @@ static void do_address_space_destroy(AddressSpace *as)
     flatview_unref(as->current_map);
     g_free(as->name);
     g_free(as->ioeventfds);
+    g_free(as->ioregionfds);
     memory_region_unref(as->root);
 }
 
-- 
2.25.1


