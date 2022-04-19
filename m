Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCA6507B32
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 22:48:36 +0200 (CEST)
Received: from localhost ([::1]:53778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngum3-0000U9-7s
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 16:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nguj6-00065i-7z
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:32 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nguj4-0003Q4-AQ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:31 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JKITEb011972; 
 Tue, 19 Apr 2022 20:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=arQWPv032LXzJ8HdI3RUsukdFOD5fxl1fsIRn1gjTLg=;
 b=MgupnLnn5/rPBamLMl0L829aREKFfDiAtK2ijhblafqwxoHADncAx1F4LviLVePJrtd/
 Q23CAVTxVuVg5pFJHtQZigWi2e26c/GCEeiYqXgBRCnC8WUXQuMb0rm3Q13QG+ehIEWu
 qPyY74uWlC9LuYm+bk8GrJvXSLQsEYu/sypi/ik/85Gz/JQg/Fy3dy1rylvhvaIGWD1P
 FX5IlmTD+S3WkLxXDlPoq3/Q8MKZ4n3xrva5edCvF8u53Q6E721zSSm1s9clPYvH5dMr
 qzO59P/YCdoJXeV/sB+Im+erGLh+L9F8YygjccabZpkLX0/51BVzN7ifs/7Y2egu06/5 hg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffpbv79pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:25 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKai3V013505; Tue, 19 Apr 2022 20:45:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm83hhuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elBgIIpZUA229p+H1pADKOKb2Cp0iein64srMFyqettfpreoIzv0WWDHH0laJI7JhhyoAwYBDpk89M4KBN/CIM0AW6TMu4x+227xSBuYgkYf4WgjqD4YjLgx8IMfMM46b2ukSSeSW8BXRJLuRGdzId2z/LlG1y/IYWXLzvJbOivf+l1N2veiodFeRbvYc5n/9N0RCciP1LST7G1yJllMdDrMt9Wv+39GddpwipCeGfMB/i+nk3iZk/PE6sCAUEctDWho7ElgqqaFNgEkN9fsvBZY0EA9IEq4ZksuuLwzXyxByjLHcz4LCMBjzza/IizEqpFkIjvZaSLExS0E7fg1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arQWPv032LXzJ8HdI3RUsukdFOD5fxl1fsIRn1gjTLg=;
 b=DECgI82uT9I0uAOggwPSxn6mW5kBLEIJ6Gbpdl5OMsGqNT+BNhWGBmgc8c1XMPR58z1arrsQ1PB+fvHq5yrUYByApxdwby5FU+7Hlm55vxet3Jz2V3Th8BthymmWhhO6Pux7VoTAXQZLlhExFT+lLKsAgSxwTWvo31IM50Z0Qyzrzz+W3J2Zba7U+EeD/QLo0KckvNykf7mHCVl0G42QYI9WixHR7qViJ+42DLbW4yQJhu3fHTbA3viKHe3jsvMYc8ufi0oa2PA7y1aekE7bVRX4EWPEkQl3Q/Hb+nDc4vedLXHfEAsnYFTPt095dlPe+VGBBOLhDV7JCKLyUeC/2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arQWPv032LXzJ8HdI3RUsukdFOD5fxl1fsIRn1gjTLg=;
 b=ka/Un3zJ+JmvW5TfPMMTNHgTSKwUshq7TcAPlYFTqWcxAxiki8YRrzFicE9MNP6njn5Pzdxf9EXgDTHR2OCjTPkxa8OdW872lxILUNnf35Aaovn1PhE0QgWI0USg6bxlpTMbj85Sfg6C1UAKA/nwLXVOC3fj8XnloQoRsACHDVA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB3290.namprd10.prod.outlook.com (2603:10b6:5:1aa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:45:23 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:45:23 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 13/17] vfio-user: handle DMA mappings
Date: Tue, 19 Apr 2022 16:44:18 -0400
Message-Id: <e786c5991ac8b5830624305acaec31d8072716ee.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c380484-9d40-4762-b4e4-08da22458661
X-MS-TrafficTypeDiagnostic: DM6PR10MB3290:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB32903AF81E522822C0CA15D790F29@DM6PR10MB3290.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qBjsJXtq62KFMLFE3UrsByDoW+8yFNGPPgfiDX3aBb0oX9xMSXpb/um3r201N1jTm1AhYKTWtH03yF6JZOzrDqVPFVDaPnRBkiq/wd+NL/hD4EvIfOn2Av1AKNWG0y4CvJX4Gd8q2WYUPlzW2eJfgeA1P9/xmN+pehizdzLlPACG979o+FLjit2Xz74NGhph4n7D64Hp9qHU3gI9aiQ+W5YScv/rJJ+cXKOCV9T4DYmTBbPEeDwDQ/NEkD0cKR9vvGpXKGP7UC7uNPut7MghW0dvcvszQIDw2qQDEbM8ay7+RqOAL368aQOsk+2/005Wiuk1q9Fi082spz8s6WJWE49RukbousdDlFhJkdY+MD6jO5ZONNiiZtaVn7PxGG3WuaxN0tm/oVpRY5kTJ1Z98ZnfArgSMaJyHyRTHnwJs087OR0WgLo/RajOj4U6B+/e8F94JfwP71JKkFEpPCu8AIi7V54C8oSHbe3ro81ZBQbsyZn0GeLZPfsnFZHCvEjeAJUykCFhURxGkO36d62V+EaFsx22ZkCfpw4+MszPXTsJRMQSdq/FPZ/04cko+NBZoanW49DAPHcAdkv8Z55hPbmfzbBWVYR4r+t6DEBT5uXCYZH3pn/soXH5XUJWW8+OIYpPXTewM1V9B4lmgr3HNMDIAIvtaJYOVBfb0PH+TCPlZUfyDbgn66Ng7JRDbk+ZpvuGFBbL2qXzM5FAQ6/PxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(8936002)(186003)(83380400001)(38100700002)(7416002)(6916009)(2616005)(107886003)(6486002)(36756003)(66946007)(8676002)(66476007)(66556008)(4326008)(52116002)(6512007)(86362001)(508600001)(38350700002)(5660300002)(26005)(316002)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x2vxdheI8NWEG1UEnIadeDd3c1+O4CndsOnLXq0uOTIEFMok5j3dYxa17O6j?=
 =?us-ascii?Q?coYcKSfxMI3HGL69QMyig/sFxRlQAejNng+DULjOLxGG7z+C2YO5IbrOKOPw?=
 =?us-ascii?Q?nxVlpJKNzvNUZo32Or4LebYwiJ98tqs5Bi2mrkB3lpjpY8IWN3kJjUFLCKPx?=
 =?us-ascii?Q?O9gzSZ60WaJmu99jFxHVEuKzry4qhvgFUyxDcMHdeuAuZz3q8T8ZHquEiF5C?=
 =?us-ascii?Q?wmji/7e1QzQM5QjYZv/ORzVQh7pK29ZsUm0Hhp2RMSdDqUoiyU5JzL+qoUSL?=
 =?us-ascii?Q?cOVlM8RAQXzyKk1fleIqsDqFFSVfhu4diNoTwaUxx19/hQxE7SfP+VuOwjv6?=
 =?us-ascii?Q?jarWMG1pWl3eKHmNkGAi0i6Nz8bFaGiILP3x0y2mffWFomHFK9UA0zmzptYT?=
 =?us-ascii?Q?Pk+A0/UF3k4T20aIWnWLk1yaZ6velSEgk48cDIM7yl+arS0Z034gP9SaKAD+?=
 =?us-ascii?Q?kclvdHKbOGlsBrx9GkzStqdXkNDP9Qo7FH24PCmjp/YiHahIsDvYHHDQ0PJS?=
 =?us-ascii?Q?xpxnhblo4cGD0TyWAP71VjpFFYCPyQeXWojO1v29NYjWL1niRgXwApvo2OZF?=
 =?us-ascii?Q?mzzxaw3+VtqbO8VzVLlxUoe+Jf5L1sTHtU2Ty2m+UQx3WLDR0qtT9PsgkeQg?=
 =?us-ascii?Q?rIb5i7y3Icr2UrUvdsKH/n5vUtTdr6kRFHz/KqCvD59rExBmWfUglEIYvDHd?=
 =?us-ascii?Q?zWI0xIZKkf7tghF4zZUYv16kmyQBuQ013wY5aXzh1vZzWD3bzBsmENLLNYdf?=
 =?us-ascii?Q?svZHrTlTSkfy3CE3E4LA0Jhaj33HdtYDGCTNBHkhrAqRim91qIk/ekzqCOqP?=
 =?us-ascii?Q?v6Hcup+S4sgZlKJBpAqZaYxis5O/lgCftMiP1t0MWSC0edVQjRkCJ8fzsa5b?=
 =?us-ascii?Q?vXk6LvS5cEdqtzX/VweOTGunS5h/MunkEb1rUi7Kp2cTyAFjuX0QFoXCxmbx?=
 =?us-ascii?Q?Rz5QPfoNMchkoT44Nf/FRPf7tfJ88m6AnI/+TleFiHOKFItBy0rQKeGc82GE?=
 =?us-ascii?Q?K1iRdcn6KQyURyJriXaittW+DUXEaqmnhRpsoYHatt4IwLUjawxkHEdrAku6?=
 =?us-ascii?Q?oiz6RdjoxsLLh/lFkyFm6mlvukBiGnv0kXK1llx9DIurTZ+rdTn1NPoJdMpn?=
 =?us-ascii?Q?Rgz2xX0JK5XRpt6ZAySrOojaG8fPxmAvphgKkPja+ocb1Ui+ihokPrMuDnCW?=
 =?us-ascii?Q?x5oX6ra0FA1M2spj1z/q/yavf/asDnGGT9emjZGV8R0JDZlVVIlbjwDtcPzv?=
 =?us-ascii?Q?HZtY2HRqaNL5THST0l/z1O7Xwi3vBsuhtiuLI1N7NwuGYJoRtKSo6cfYKVYc?=
 =?us-ascii?Q?0+ctj4Dz4c2F5C1GHH/nAKk2UFTH3EjTHt/R9F2e0Q1P0GKFshjfmENgMa2q?=
 =?us-ascii?Q?JBt/wuauhXwyamVc447WmtykE2yqZCqLMV49jh+YX+693UXESg7o8hfy/oev?=
 =?us-ascii?Q?+q8DzQt+ssOojkbe7UCQDOQM37tD3ZgRD896lSSEm13ACCPGLS18mHS4LMiF?=
 =?us-ascii?Q?F2GzLUWZTNcx7Vpk4NmHajkG1ueZypzGSGFbkPzaafeu476BCjHq2bcboaH+?=
 =?us-ascii?Q?tA4Ia6ccTsTxuY3Rp3Vofgx6OH37VFn65pBU99ZxOv4/SZF6/DKXtZ/IK18D?=
 =?us-ascii?Q?CVy5v9lZjqYyYvTa8upswz7aPk+m7q5qi5RHGU9kcuk+hnzuVQDaFBCtpR29?=
 =?us-ascii?Q?lK+S+IdSaOPaa9jSalDXXj6S7earaGRGWfejbjZMmoDekUkvqxzgTvFHspwv?=
 =?us-ascii?Q?z7jNA0krTA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c380484-9d40-4762-b4e4-08da22458661
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:45:23.2265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmMCoPHIiRsdIfMhxSab958GIGy51tddNMX+hK4rnnu8dSsa2cGOOqMlx8hvM6//cIIfnOsztonPgGu8uDBS8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3290
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-GUID: aumAeAD_mASn1GXt3hkr8sdPwOhxXlrg
X-Proofpoint-ORIG-GUID: aumAeAD_mASn1GXt3hkr8sdPwOhxXlrg
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define and register callbacks to manage the RAM regions used for
device DMA

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c       |  5 ++++
 hw/remote/vfio-user-obj.c | 55 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 3 files changed, 62 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index cca5d25f50..7002d46980 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -23,6 +23,7 @@
 #include "hw/remote/iohub.h"
 #include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
+#include "hw/remote/iommu.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -52,6 +53,10 @@ static void remote_machine_init(MachineState *machine)
 
     pci_host = PCI_HOST_BRIDGE(rem_host);
 
+    if (s->vfio_user) {
+        remote_iommu_setup(pci_host->bus);
+    }
+
     remote_iohub_init(&s->iohub);
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 7b863dec4f..425e45e8b2 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -276,6 +276,54 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
     return count;
 }
 
+static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    AddressSpace *dma_as = NULL;
+    MemoryRegion *subregion = NULL;
+    g_autofree char *name = NULL;
+    struct iovec *iov = &info->iova;
+
+    if (!info->vaddr) {
+        return;
+    }
+
+    name = g_strdup_printf("mem-%s-%"PRIx64"", o->device,
+                           (uint64_t)info->vaddr);
+
+    subregion = g_new0(MemoryRegion, 1);
+
+    memory_region_init_ram_ptr(subregion, NULL, name,
+                               iov->iov_len, info->vaddr);
+
+    dma_as = pci_device_iommu_address_space(o->pci_dev);
+
+    memory_region_add_subregion(dma_as->root, (hwaddr)iov->iov_base, subregion);
+
+    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
+}
+
+static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    AddressSpace *dma_as = NULL;
+    MemoryRegion *mr = NULL;
+    ram_addr_t offset;
+
+    mr = memory_region_from_host(info->vaddr, &offset);
+    if (!mr) {
+        return;
+    }
+
+    dma_as = pci_device_iommu_address_space(o->pci_dev);
+
+    memory_region_del_subregion(dma_as->root, mr);
+
+    object_unparent((OBJECT(mr)));
+
+    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -365,6 +413,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_dma(o->vfu_ctx, &dma_register, &dma_unregister);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup DMA handlers for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 2ef7884346..f945c7e33b 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -7,3 +7,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
 vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
+vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
+vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
-- 
2.20.1


