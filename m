Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98EB51C694
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:54:17 +0200 (CEST)
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfg8-0002Y5-PS
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf12-0006Ge-D5
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf10-0002Ha-Cc
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:48 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FtOQI030616
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=b7OdG0hmnODjgrUuFXmmyj24v2fvWXCjGM6zfw2PkaA=;
 b=g9gBFQSJeFUjF8MOzAEq1Ucgx2dKqAicKGloiakBtMfHt5oZQuuPn7BvcVH6lJmEVMtP
 kGvj2kxX/TlJxe3BFlj4lPTOzfQioSNcXBGlFq9+b3mISAH8mxxr8U/6cs8h0kFLembO
 yK/zlzUdB5Bk8DBCx/A3tjNKZZkgvJEvmDRFxVL67xZeoH6LHSqOQmPLi4Es565Uj8Hb
 9fIg3lUzQoe7QIK76X3PX00RdzKSZiYqNRZ1I1RDKxZju7ldvLvoyfBgK2XJWUIL0/Rj
 JXCshu5Vlb7ox4iabXVhl36byTJc+U8UFKgQU3FBeTqtqgJt/B6iWDYzRcQGpVDbga+t +A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0m37g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:34 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1bxo018989
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusah2ed7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUs3zl1ZO4DDVj/xN64x7KbUFE6oQjSYNXICPyD4NotTSjhR5cZ0pDyYnoa1/Rg15bR/9sLYG3ZSEe5ow4HmB+ELiwE73pVYocNXty8Xf4dkZREOaClSr/ySWfwGwhGAZF4LFDGa+8qOm+secFoIZJ6nzhnLPmdGTqg61fV+R/G7uPxNDaKrpBFpxDc5p/BHLkkiEnaO48DUmifSVFiZRO4BOxpvnxL8QDm93CCDgdR/uyq4EcnqWdEn2jSVUr6ixbEI2dDPz+6UtW2MfckoYeWVrAeDJF4UHqxVTsOWHWJWyJv8tlShwkc755EwteoSjEW8eD3oQXBKMNX+2lcLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7OdG0hmnODjgrUuFXmmyj24v2fvWXCjGM6zfw2PkaA=;
 b=h7E75MDo63mc+QBrsfS2Ni6Dct04TZDb4YCyBpskHz7ryzUfuqKX5KDhzNXk+Fn+TRG39bXNxhIeAT8xrmTbC9clfuyWiPid/44lMkLxt2r7cUuOmlfLKoHhFj6JDrAs3XUdnKJ52ExJR8cWdJa0eOzkPqEzIeO+MMzazUHn4cawZjczEeMSqF5Dx1Cvn9ou4Ak5dKuK0JVv2hgRMlxP31u5oZZ8gQHV1N59uEUQkYnMvc5nD0/kkJ5Kz5Aw5+CJIfTIMn0lZzCXWJ/AJNqPzUTWHJ86L/IbssOnYFg5vehAo7tQ/TREsd5pzio55Gq6jEM2+HlzcKXH4I2syJ7HsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7OdG0hmnODjgrUuFXmmyj24v2fvWXCjGM6zfw2PkaA=;
 b=gW7wjK3lWBo0eFJBepnhX33IkdfMYMPH/hwU3mqjnnzCfp/NjfXK98i9w6Pb/P/Vbr+/twQF4ahxGkJFqGpjv29yg4DBkTNjo8Aa6fR/COSqgHRDE5OS33APzS4GinSbs5nkqcFGYlg/HfU04TkTJQxCZr6niyNFHzsIcE3sy0E=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by BN7PR10MB2689.namprd10.prod.outlook.com (2603:10b6:406:c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 17:11:26 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:26 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 20/23] vfio-user: pci reset
Date: Thu,  5 May 2022 10:20:03 -0700
Message-Id: <89e5b8641ab7781a7704056bf793e80cefe73b27.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9296a9d-e499-4cd2-58bc-08da2eba4773
X-MS-TrafficTypeDiagnostic: BN7PR10MB2689:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB2689D876775D13979E0A3CD0B6C29@BN7PR10MB2689.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymml3Wc6zx10l2HPNpRWQJ2KeZp5if9MOoNRmffptis6VJfGDhfzShSIV+TlsYppRAXJhi6OY4TCHPUhAtrEKJpeDJIR/4mjP/B4LxVsEMCHfexlAzePmHB/B1uPfDJ1W3uHdE6itrPGrVy1HeFECzRgDmyZQy8W1WgdPpKe+RPGQ7D7p5Db2/9TSaS3DtAazq6v6amdn9kZWocIUDJbGhHdbhvVD7IcP8TMYDwQZn+x02l77f3A8ca0Vz9fxMJ60FmtJguhhgRUiP9U5IU4pi9mipdisJdha/lWX0cT4PB4krflDs9nXPiyn876lpRdwJkkm13XULVx7dTrSzQVmIFri3QcHFpK258hltCKX2vxn6P2ElANOv8BUG4YLvZUamavh7KNxi23yPhMUQMnAIHKuae7iO+MCeYVymJPxgM1bZeeJeghmn2EqZkPYjaRIkymG/1LqciGaD6uAqDGTsdLPb7/0xZMfce+5ljceDMz8htBWGcMDdJKkt+hQRTJRUmDFio5Vb98UJ6BLox71UVZnCO7WsNdqJTeiZjekOvukjNlmy/pi+veq1OU9HWUJ9OqVPPLvQ81QNBCl6AcZyfEZ6RzDa5RVkHvGBn2zyBl+ML9xNBfuBCBDLWEyqyelFtm7isWg+/bu76Hz9ErhDoVBcs82KKq6VEAazTdo9uhpOcq/0L3iz0Stus7FXtrj+26Nj5eOxJyVvK33D0RsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(83380400001)(6916009)(6506007)(6512007)(38350700002)(316002)(36756003)(2906002)(2616005)(26005)(66476007)(8676002)(86362001)(186003)(66556008)(66946007)(6666004)(52116002)(6486002)(5660300002)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?umQuP0KUULS9VP1KhCTaQdRO6zlrIDcPIw6MmBvHG740vKEflCk/54hhaSu9?=
 =?us-ascii?Q?YC9087GvPjkqU1XrYm3MO6vc1aCw5tbgh1RQZNeZNapfnot2w1HvF8aSJCHQ?=
 =?us-ascii?Q?pjWMgjSTLzYo/yTangOrpq8jQSwWavvagKIJEkY4+L+XK457ARBKHVqgHE3m?=
 =?us-ascii?Q?DwsuTq5cH78b6hNv+cMRdsNLRXJ51t+ou/WAt+C6cfUzk+zmdDfwbLGT1ITB?=
 =?us-ascii?Q?1jXV3zCgKECcAWWPPcac1OX5uNQdGF1cKxlteE839L9ReEwHyRthOJI1HMeW?=
 =?us-ascii?Q?GmnaXK+BczQEfUeXkvMqKr1GumkpUSsuGo4pHoOPWlFLL9txm996J7SmKdi+?=
 =?us-ascii?Q?uRC/8lLtWTdiiMCC5csCN7D78xo91Z7lLUSxnKnfVKkamKcRx3AkjVeyck9V?=
 =?us-ascii?Q?3/OxzsGoJFpRa6mqQcXDb3EhgxPbeEOJxDlRV4dFEkLDrGhe5+lX3C49tmuF?=
 =?us-ascii?Q?HA2BqfzSJzEDmitr8biII6TwS5792zo2mdccwoz69gMcE0zpAkMlVhmzxIfp?=
 =?us-ascii?Q?agbtS98I3Sn10DKj0h5dj7ZQoIbqKQuV18bRnAD1U+aqrWz7dltIVHIj8fEa?=
 =?us-ascii?Q?xYfk9rBfVXUFk4psqG59UDy/PtLcVfEBE1VMTfiq0IHNVpbnk3A8njq6Zxis?=
 =?us-ascii?Q?f/zLerV8/ILOf5ij3c8iPOaJFqiUzAOUYwfmLI8qsehU5ttXkHvfqyVLBjQe?=
 =?us-ascii?Q?s+HIUBswu4RmofYtAFzIQ+JvTSXEDcQRYhWJIr4Mjg1qbWujqCZHZSGYMI8s?=
 =?us-ascii?Q?SdIiRijHvOmV8QqMcPD40p2LYlb82jbOx6KLBuiHENizb7rl1vu+aNryVjcS?=
 =?us-ascii?Q?n402RslAwPLAOqGU9RNCQcw9f9EcP3CoiJIK/SdxiFfi8LoS5GEc9swgVbBR?=
 =?us-ascii?Q?8dlU2p372hrt5fvxgW94LYMw1UoDOY82WzNPJ9CyyY/7T1/1zmHfjde94JBl?=
 =?us-ascii?Q?9waI95XA+9Zqlirpq7/smNgq5YMpiAObYTw4q8MHFjxFLVR96xZJoVvicHWU?=
 =?us-ascii?Q?wyjqvk16i/RkXQapNbcqUhOrlEJUWLLEeLcJlxJJzrqkrNW8Cl3pwS2PqVgG?=
 =?us-ascii?Q?WpzwKVVs/AzT9Tz/ndsYotQ6k4iWIH/hHv6kySCWwVAhnXpe0/ljS8aZLAZV?=
 =?us-ascii?Q?ITUcZ/ZNTtPU77zJJVKDbsVWW6vILoUvfpRaGHCxcktGoK2sb8E+Vy4SqO7M?=
 =?us-ascii?Q?IJVg6nhdbNLnxAPfZBSA4vsyZshVHqm0ExfJRlJb4OHrEfYikO8q6jC99jSZ?=
 =?us-ascii?Q?sew7d4n4W67378yWdUaKOs7NLhp4jytYYbMveeNO/3BDWWXmbmnAW+SHgH/R?=
 =?us-ascii?Q?yaTUg036ybRRcoIDQfiuSHNTDaohO3Mu8nkMdR+6/2GDrHg6Tr55KZSuuWky?=
 =?us-ascii?Q?8XiQE2P8SdtCBFWRypoOTJ9M1BpMIGfB5aHNpbHif+jP3al+o2USKWVXiaLh?=
 =?us-ascii?Q?CwEyVTUsTzpxoDw5isKAQKBlOxYnJ0eMDvT83wDj1HWpe2nVG8mLtJ3ewums?=
 =?us-ascii?Q?aq6KRB55nVQ//zBZJxU2srbWKu7OCczZ5sXl8vNvi/Df1G3m3EhIse2mwfgM?=
 =?us-ascii?Q?xZ02A1hpqBQ6EjACQ3VZq+EcGQntJLyyYXlkT+YyUQUhbkYW5d/ITEt2voa7?=
 =?us-ascii?Q?TesW6JBSqzvy+ab9ou4pFk4Ax+n9OWNY+uXnli/K59ew3mvwjG9Uz7+TSZ6v?=
 =?us-ascii?Q?Ix13Z2aKXA8s8vMSLSdJ5TqZB3hzECHwxQCmXXXIgJ9yM+aT586wQO0Vm7Td?=
 =?us-ascii?Q?FhYVFDmFDniVT+ma5wz+0AFqY468ZG4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9296a9d-e499-4cd2-58bc-08da2eba4773
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:22.5132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIuqAlDkyZChl6wO1O6Fkdra/pLGkg70XLxkSdJBIAVLnCnXBz/aBrmNSN0qoUEqhh8HET6C4zMZrgMSenzFsYq4xE+bMmEl1Ky5aqvPzWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2689
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-ORIG-GUID: JFgDuEf0LSBZ4c_UEnKo_bB0ZNUtVXBZ
X-Proofpoint-GUID: JFgDuEf0LSBZ4c_UEnKo_bB0ZNUtVXBZ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Message to tell the server to reset the device.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h |  1 +
 hw/vfio/pci.c  | 15 +++++++++++++++
 hw/vfio/user.c | 12 ++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 412c77a..902facf 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -90,6 +90,7 @@ void vfio_user_send_reply(VFIOProxy *proxy, VFIOUserHdr *hdr, int size);
 void vfio_user_send_error(VFIOProxy *proxy, VFIOUserHdr *hdr, int error);
 void vfio_user_putfds(VFIOUserMsg *msg);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
+void vfio_user_reset(VFIOProxy *proxy);
 
 extern VFIODevIO vfio_dev_io_sock;
 extern VFIOContIO vfio_cont_io_sock;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 25b3ebb..f4b4a30 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3821,6 +3821,20 @@ static void vfio_user_instance_finalize(Object *obj)
     }
 }
 
+static void vfio_user_pci_reset(DeviceState *dev)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    vfio_pci_pre_reset(vdev);
+
+    if (vbasedev->reset_works) {
+        vfio_user_reset(vbasedev->proxy);
+    }
+
+    vfio_pci_post_reset(vdev);
+}
+
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
@@ -3834,6 +3848,7 @@ static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
 
+    dc->reset = vfio_user_pci_reset;
     device_class_set_props(dc, vfio_user_pci_dev_properties);
     dc->desc = "VFIO over socket PCI device assignment";
     pdc->realize = vfio_user_pci_realize;
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 1a0d002..262d1a7 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1482,6 +1482,18 @@ static int vfio_user_region_write(VFIOProxy *proxy, uint8_t index, off_t offset,
     return ret;
 }
 
+void vfio_user_reset(VFIOProxy *proxy)
+{
+    VFIOUserHdr msg;
+
+    vfio_user_request_msg(&msg, VFIO_USER_DEVICE_RESET, sizeof(msg), 0);
+
+    vfio_user_send_wait(proxy, &msg, NULL, 0, false);
+    if (msg.flags & VFIO_USER_ERROR) {
+        error_printf("reset reply error %d\n", msg.error_reply);
+    }
+}
+
 
 /*
  * Socket-based io_ops
-- 
1.8.3.1


