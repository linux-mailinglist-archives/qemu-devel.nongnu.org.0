Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4917449FEA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:45:59 +0100 (CET)
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFGv-0000Dn-Pl
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:45:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAc-0005eq-Fz
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-00046y-0O
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:23 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A905Fj0019127
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=/Aa9qzXVUHvq/NOMR4G6DWxTTdoh5zu1dO1ABUGeHDw=;
 b=YyAAJZpgImAKgXwzdf7D/DoynyHsugKlv4acIs/QStHktCURFz+llQJoyAxnU4JQBmHO
 LGBL+EfHK97oA8KZE+rKKSl03o4bPeZBVIKBb/Fj9dtk2kF7G9FXjEoeTqrNpnov9zZL
 eBIvI2BEYnbNYDdkpHBU5KwsnurwvFEECOrnJew2cWNwg91dExO3WzOr3WhtERi5l5Eu
 bNkQGHKs55h0uZdTKsAyjBxJJf/ijXGDRu9TverRySGdfs+w9EM4kbgWCHcQcccfLAcH
 8JJsgUtI+rWtHHJPpwp2sldwFR6jJM7Vvt2TJscNj0b4GVAKKeuVwcvKyu4v4hQXBKRI TQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6sbk7c8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90Zxm6132637
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3030.oracle.com with ESMTP id 3c5frd6sqb-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hw0zt7jAMl9KyjyZzrBKgCWcBVthi2FzT2hCG6pF/wI0uwemu6mcZJwQtMDQF1mJ7IR7LOhsteozUc1TCjwsw7c3+5Jj7E2BcNYovReK/la6T4m5SnF4Em7QyhbG/72V8n4pOF8rnWdbM7STkaxKpzJoHV8yhSGsi0nvJPS7YC+jEr3hsFDXgGfoTGvwCGEP4GysYWQzIWOjh+9BcxJvEA2g+Ndyoz9lV6jRJX8EJeX87d0nMh+FMfhJqyF6ZMjYEsT8e1jxRcegMXgcP++fAoIReE0Q7a/EMRSf+bZA7RJjP60LuBz3/8NP+mSOaJjRDPZnl5oYEs1RaNbZxH/8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Aa9qzXVUHvq/NOMR4G6DWxTTdoh5zu1dO1ABUGeHDw=;
 b=gmkBQkNSdA+9JlwPAAj1QmtifXyM/lfx3bXHmjsRU6uLGA6stXSs2CipOQa0qTQdmKx8SP+ojLzWgBdvErzuLtr7T3F+ZjYdH+6Xrhylg9eEC5t1/aLkcZIX+IS2X+KeIzXeTfOvg8M0GEamBvPvLCWNpFvfR+gWhlO9UOC+txR20gzJyMye85Y8o7iwErcI0hI1Ce+DBY/DrfVbttDwCZBvbnbiSKI8ZyL2QwB/EBBLzKmMgKdqCZmK+mYqp6xdMmXE781Z7n9+2MzSj+jTX5MzICTw9Qd9mmKmh35p3/84Mqafu59sa1pHSmG8+q4cAX5H3JKt78h+ggyKCL0wPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Aa9qzXVUHvq/NOMR4G6DWxTTdoh5zu1dO1ABUGeHDw=;
 b=DsnI1Wm/+QA1ooPBJ2hFWU3Ev+FwL1fxUGW9maW9PgdrsQAmej3gqmaHYCJTs1gwhTguRsOV5bUKoiHsuaFjMj9l5xza2dOIL15XSLb91Z2QvDldlrEliWQeDHtAW2jWQtkGkoiualuOSdNQmmX+WyFQ7ZqRlcMtVs4MaA8q6uQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:15 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:15 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 13/19] vfio-user: pci_user_realize PCI setup
Date: Mon,  8 Nov 2021 16:46:41 -0800
Message-Id: <faab1fd983815a5563b246849d68d57884d3fb41.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ba3db70-5917-4244-1acd-08d9a3195a45
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB406844A25DEE0A11F8A0A3C4B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MHXdcYaaDINNBQerjg4H+3GXwe2Srox6QXKUKFY1A3J3au9SXOqL9oQKKQiKE12b4YYlrq8n4llOc7rUdXqwMx2wDhxZt2oeeDRKLHs0OKGKTdq0ePsSKVgE3zwX9+LIuvMm9ij61llcQS55ZpJqXeUX4g4V4ERveFsmg4P40fiLuM0dCKKnorDiW2hm3bZsEVTUdDUOjwHHl58dGji6bY+Du3uZoF98FBotvQNU5WUpsXGG0OxZHq/6SAbixqoJZzIo62j3uFUheU1x2vd6wp3PLeAseshS1pV6s7V1qCi9m/QESNtc0Wa2NGsGlxt8E0pUf/sMcbrO9T7FwfEc8rBweyPzhW0ObJf2cNNwzDLggGnVqZIgrtnz4m4ut2FU480SlLXTJOWL6h+d2tjyLPlnrep8kF4VNpoCq85gOhLJYcPWdbougrPVreIBhMkpu+on33I4w69ViACSPdGNkPwIqy9WLqPFy6///j1iFqUiaB6n4ojrm0zTAZnplBN9+2vQb7NnZDZsm0Myy4sV2+gTofL98sEDQb0Gnt+9FCN36BE3k/DiS8esJo3xkEKy6QXypCiJd3QSBXO9VhNBRZEziQVdQvUC2eL8LqDKyeYD3WwueIpLHIy0V7KYNZ07YEttMJDUmDtIwGD1KALFQSErpHmdMcaKv8VExm4TcDtZOWnBaKO2B5Q8Bmil/fsMtGMMDEwFcGuAqAMsgLODQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XKwwgSpCQ/xjvbJlTmFyQfoIjvXPObzrdaNWQa+Mimk+tTw8xvwTcvfXnDCX?=
 =?us-ascii?Q?BuNKR+DSTrpM4/MheF65+WJ0juzsa1CgRaXwTs1KSVQ278J1Rz2Y/gHgtm1y?=
 =?us-ascii?Q?dWdHV4S4pNCFv3pG5cUcD6XVZKvVXSJBq9lHnPN9h5qDxixhYCHWQh30TTcH?=
 =?us-ascii?Q?C++wldROLRmKCkFsvveC6sRNT5bW3rqDvrB5Xl/7r9Z+lhkpQsOZ7t7uEAP4?=
 =?us-ascii?Q?bShavxnuCSis5hr9YC/mi6EXI2GRGoYAeiDHcUkcPC15YZUzi7AWg8/HWVj0?=
 =?us-ascii?Q?9+vHfmzqJCFUW/gbqabVjzv5IdPeLrpMQBqGjLAzIpAThCyUg2imxP1k6umx?=
 =?us-ascii?Q?S05epV5S9ZOuIFpKUMA8JCoynpQg10K+oyU2bDfBfxggU/ZkdMMPN/48O2ft?=
 =?us-ascii?Q?sIQRS0Djpac7XkTdvbZQi3btmP0yZ4x3Hm+To2vvTaKZNRAP6B3SczePzxsI?=
 =?us-ascii?Q?/SAz2nOnGJ1klYF/lcvV+qY4uD8PkKEVVQN8jSyQoW4mRypVcI636BJRsZRM?=
 =?us-ascii?Q?2q4r2QzF+/PINIAVb1kllQFN/Wd6SxKl08cgIkX43XjhGL5YIf1idWTuYZhZ?=
 =?us-ascii?Q?ja6nq3hncqy288HCQq3BZN4TfK+QY5L1rai6lvM1bJu7ndI0aFxETJkyXmi/?=
 =?us-ascii?Q?7nGU6NbwEQc4b38b6DdirGKXG0XiL5iyFEAkM6QxDA1TtxxdPjzMdonu/WDv?=
 =?us-ascii?Q?kHTzVXi69ZNPHzGJ1Q10rVQD9KpFt9UWrRFFQWgR+N4X2uc1BZs9YBQyh4za?=
 =?us-ascii?Q?1dmWbf0XYJISbsAYeM/Ul/yvxWQZ+5e6jiFI6GgO66IGdI+9xht87Gi7slQG?=
 =?us-ascii?Q?4/b/kpHlRVXyCO+uVw3Wr7UQf3C1GA+QOxO61+R7WLoVMdUIIjC0IeHQNEGt?=
 =?us-ascii?Q?ScnmXOZw75MYliV0iosK1gcs8E6ofSUP/r/Uw4VSYJ/sCD2eXtuvKkWPHytW?=
 =?us-ascii?Q?jQ77u7r8T4uAMI9O+SnscDvsEX9kRFsiPhyUUXqDJYboGOFo7tskky4SRp5K?=
 =?us-ascii?Q?Ppp5ptUmQQfmjETMiU+SCyLp3dJo42BJbnsab4vwz9/MOsxVuZWQNYlaa8Ub?=
 =?us-ascii?Q?bMdJvzB5fSGwa01bQG6XtktIQohhdh+OdYZlyZa9voVx2lzCuWSQB9i1/31C?=
 =?us-ascii?Q?XePtuOPksXDMqqoBQDt3q8o6CZWks76V5qPh0kwaJZ9UL7Lmsxez01RIeySw?=
 =?us-ascii?Q?aXN1DY/DeRbzw7PXy4iPv4shncqr33IiAd5yhTKrThT7jFLLHZvZyprJxa5o?=
 =?us-ascii?Q?yNVaR5n/29xfzQCAO59eZ43hxXO5LzDWmRqQUUxL3RDl/04bE8Pu6qRD0FcW?=
 =?us-ascii?Q?2c4OG63Ky+1PI1Mnr2F7ehB86K4FkWI2QJHGb9Gj/K/V5QwtS7FedIs5BGHL?=
 =?us-ascii?Q?9ZY11x5iCVU2AqdyTW5Pi5CgUBtEQRZOOuMunZ+//DGWCrAXjZMRPUQ2JgBg?=
 =?us-ascii?Q?XaHbZOWwrGDT9RtyPzoQeaedMX8BGcqNiEqjjGGFHAFl1tgvYVPz4+Y0N1nL?=
 =?us-ascii?Q?WC9GQ+C/ybnKdzUj8kOQZGyXMsMbMV3HN3UPmZSaJePvnYm7DXExfNeV/bTV?=
 =?us-ascii?Q?ei4jmK8ihjnKGrPTGjFjzGJA6sWAOBrN3ewFyYTRkmz1yOjuWy9gcQN9BBwZ?=
 =?us-ascii?Q?bHAqMSTjGpu5/02xkJyRxTxfwevPVy3zYzOMsIdCb/+V4ra4eDLOaeLNEZdI?=
 =?us-ascii?Q?pI7fEg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba3db70-5917-4244-1acd-08d9a3195a45
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:13.4549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Tr2lsSSrdhHXJhRf3Ul4w1Hg8hEpJXQQq/L5p+AUH7r5yhNFDh8AXssbmnsDzqSq8sid/GzhWIHwTdK7MwNF3XYzJqmUltO/KX+p+xP+oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: ogx7WL_bMmWg-7UN-gRUz45t5yVUlr2x
X-Proofpoint-ORIG-GUID: ogx7WL_bMmWg-7UN-gRUz45t5yVUlr2x
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PCI BARs read from remote device
PCI config reads/writes sent to remote server

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index d5f9987..f8729b2 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3551,8 +3551,93 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
+    /* Get a copy of config space */
+    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, 0,
+                           MIN(pci_config_size(pdev), vdev->config_size),
+                           pdev->config);
+    if (ret < (int)MIN(pci_config_size(&vdev->pdev), vdev->config_size)) {
+        error_setg_errno(errp, -ret, "failed to read device config space");
+        goto error;
+    }
+
+    /* vfio emulates a lot for us, but some bits need extra love */
+    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
+
+    /* QEMU can choose to expose the ROM or not */
+    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
+    /* QEMU can also add or extend BARs */
+    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
+    vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
+    vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
+
+    /* QEMU can change multi-function devices to single function, or reverse */
+    vdev->emulated_config_bits[PCI_HEADER_TYPE] =
+                                              PCI_HEADER_TYPE_MULTI_FUNCTION;
+
+    /* Restore or clear multifunction, this is always controlled by QEMU */
+    if (vdev->pdev.cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
+        vdev->pdev.config[PCI_HEADER_TYPE] |= PCI_HEADER_TYPE_MULTI_FUNCTION;
+    } else {
+        vdev->pdev.config[PCI_HEADER_TYPE] &= ~PCI_HEADER_TYPE_MULTI_FUNCTION;
+    }
+
+    /*
+     * Clear host resource mapping info.  If we choose not to register a
+     * BAR, such as might be the case with the option ROM, we can get
+     * confusing, unwritable, residual addresses from the host here.
+     */
+    memset(&vdev->pdev.config[PCI_BASE_ADDRESS_0], 0, 24);
+    memset(&vdev->pdev.config[PCI_ROM_ADDRESS], 0, 4);
+
+    vfio_pci_size_rom(vdev);
+
+    vfio_bars_prepare(vdev);
+
+    vfio_msix_early_setup(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
+    vfio_bars_register(vdev);
+
+    ret = vfio_add_capabilities(vdev, errp);
+    if (ret) {
+        goto out_teardown;
+    }
+
+    /* QEMU emulates all of MSI & MSIX */
+    if (pdev->cap_present & QEMU_PCI_CAP_MSIX) {
+        memset(vdev->emulated_config_bits + pdev->msix_cap, 0xff,
+               MSIX_CAP_LENGTH);
+    }
+
+    if (pdev->cap_present & QEMU_PCI_CAP_MSI) {
+        memset(vdev->emulated_config_bits + pdev->msi_cap, 0xff,
+               vdev->msi_cap_size);
+    }
+
+    if (vdev->pdev.config[PCI_INTERRUPT_PIN] != 0) {
+        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                             vfio_intx_mmap_enable, vdev);
+        pci_device_set_intx_routing_notifier(&vdev->pdev,
+                                             vfio_intx_routing_notifier);
+        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
+        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
+        ret = vfio_intx_enable(vdev, errp);
+        if (ret) {
+            goto out_deregister;
+        }
+    }
+
     return;
 
+out_deregister:
+    pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
+    kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
+out_teardown:
+    vfio_teardown_msi(vdev);
+    vfio_bars_exit(vdev);
 error:
     vfio_user_disconnect(proxy);
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
@@ -3565,7 +3650,9 @@ static void vfio_user_instance_finalize(Object *obj)
 
     vfio_put_device(vdev);
 
-    vfio_user_disconnect(vbasedev->proxy);
+    if (vbasedev->proxy != NULL) {
+        vfio_user_disconnect(vbasedev->proxy);
+    }
 }
 
 static Property vfio_user_pci_dev_properties[] = {
-- 
1.8.3.1


