Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B3048BC18
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:59:54 +0100 (CET)
Received: from localhost ([::1]:44406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7RzV-00083a-Cp
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:59:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdn-0000yR-FS
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdj-0005gr-E8
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:26 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMCaHt005865
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=8U+TJxKfg7P6wRj8IxiNsXhQQaoswMn74qsiuEySTpE=;
 b=WmmMjXhIeUS9s5CnaX+Ydw6SxD1G+oOap4t9Si8UqvG4F8vKCGsevGJKmhV8KiymfHFt
 GHb6dh8yHi0YTIIQGTtleZkSedxRJT4IIPp6OxQ2tyX4i9HPd7TKzFtYFt+ajRlluT3G
 9CI36arB4ytgJ/9dGR+KG0yygW6z+t+rcsooIAfQHph85KV50vauQOEore1Lhd0omCop
 T9KfvNoHTj0upoDeYwBHx4cwmrjktLfnc3KMhmA5+Tj1O0SFTVaqqdJEeDXe4stMdvzG
 ldY+biRDo22tRlGsAcQZQpCKCuPz0vfHLpNcrI6INSAJbBxQ66t0n2fUcUv5dZqBgzr3 Pw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtgd1v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBI196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTYJnWr6bEamFaKhkyebuMmNOczBMi6RNhPgZmJrF7FxCDAXqhbTiONaEOHxcjCTOJePvTTu91kpEylOUaCCg3XopHw7goGCUrsed6doW7vz2MOPEXQDJctmJgtWJjfmsYw4X+3h9lDuiFEMsb2CPx+87hgWICtS87dB4Gd+jWXHlFq5lT3mGl25hpCjjyl/kpZTu0L1Yf/x4DpoNkEkqseLJV8FqYBBOdSIo99uU75rxCDeHINkSCzeGZgvrJ9usq04JG2XODQFUXpUHyD7FXuJ/fU/jEa+8RFdDJtULU6gAjFvmY/BwzIpXYoWC2mPADCh9bZSOZ1wHupTT52ZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U+TJxKfg7P6wRj8IxiNsXhQQaoswMn74qsiuEySTpE=;
 b=OfyFUbj/bXvz+5Hxwyo+ITY4DO6P8HVvL0kOGyH0/TZfrbBec7ppr6OghW+vsrMt4MFFEOrMmBVCNgfXvWuE7ffXcuBT+agKgCDUSfLN7p2Es9ig6Dz7PCZH25dVQfr9IncCyK3bNi1AMVfVDEVvi+i8UHRUyZql42mTaNu73ur7OaAThhhv9KqzM87ONZ+wUY9Sp92fP0sUuqpmL99vLnbFpqE54pSL40pweDV+rdF8htBUV5FchXnMa1Nr33P705Xwc4tkMBSYeaUEXYpzNaXVmD0PQn9y6j7RD5BkNmIbH27F2F3/fkCBCxlk79zcHPoBgBYxgI+J+Qu1ui1aCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U+TJxKfg7P6wRj8IxiNsXhQQaoswMn74qsiuEySTpE=;
 b=Eqn4epSTsiafaoptTXMiis34MqGdPbUsOxicgIv35f5dlpuq84RSwsaES0Sn/D2tyQXeZxJtrrFlx35zWHGlbfTJJ892GQk41BdSyypMPiTCEwo/cNJAkWN7IU13LIFpvyBOYGO8+eloR3uKNZ+P3TmxsPq6w+MtrwBLjUQdBU4=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:07 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:07 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 13/21] vfio-user: pci_user_realize PCI setup
Date: Tue, 11 Jan 2022 16:43:49 -0800
Message-Id: <6d8ae21cbade8f4bb7eaca4da29e57f0cb1a03f3.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ea80908-97c1-493d-e09c-08d9d563a969
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB474291D27A9AB3F06E0836E2B6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: No0ebLNgIgKnfALr2Ztp4y9FhaWVAyRlafGUr3Sn60fVP9Os0Eexfjt6juJfRx0QWAqd+gw9fmQOOuYDN4ZK6bQ5W8fCEAeL5q88EbZoPIwt95Qobayrpkxz/zQb/hpPulQQAw5wmA1KLz/Y3HKovgO5SvCEf9QuPRDX/N9F0RlwMOWo9qeIEQl2vBv4h9x0kmflh3COopUUoiZk/VnlhW+OHyp7+pz/iv7MTr/KERp9EvOcYOAzizbz4/44enyqX40FY1yMXNdRNuj73uPgF8qtL3bs7YlG4mCDs0vKFD1YVbRAA8LUFd1s3akZQnKEAjn/NuN3ERfl2ue47IEiiKz/APiKXhTvpfbuKg/GTSZe1YrIgOWEWWzHhHr6iyWp1qPKptXxuen7s/LAzpYiMMKeFtqLOyXzgdtHaqIzVhk3PBNAaT/PwjaAttxX0SOC8wSNvbouQd0FrJ6TQ0qScn+s2s/CenosllJy5z+eIWrXeld1o5DCu6a3KfIhDe8w4s4jc3eOxLZfvgPk/FAXHKIp2GrWFyodogR3gOmtelBiDgtMAZpGnJHNLSDuDEyXQXHvr4aozbwtQ9k2Pq3sakmON2nQ/vMW8ECQhft0haje6hke6of9rvJ8QPqkS9bMGf9k4pxCQUvN1IEXqd+lv+veO6e70L2AOszKbo/WPLOAEdLyoHqRFQ6j2vgQdzFKtR48cfD23QfFiJz50z0Ncg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(30864003)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AUMl/ExOzIA4uw9/T7dD7gygpYO3JHHhzP+ESn4hURp1dCFOsvB5sNONHncr?=
 =?us-ascii?Q?K6krdYbmwRPzFNHkxiktdp3eEd0zWVMkIIDoJGuCiXkdqN2EUZdIG8eCPzyF?=
 =?us-ascii?Q?yFtuxPjuq1AToH4Jkb+t/qa4/JbB1rSxcn3bndnO1nFaX5kcIcI2nFsFriCS?=
 =?us-ascii?Q?4XS/8JFumXer8+D8OTLF7ZtN1wiWRwTBF5YjKB8XWikj+7IduoqxL8Id+8nd?=
 =?us-ascii?Q?kWeq2WdkhuIkeMToiUUinG4bShpL51+3zQ/Nt9PtOlV7YxxVQXN+9PGeoetu?=
 =?us-ascii?Q?Ss7X7q0A7XgmQvWiMLcJSWKIWOE5DdgD2eAyn9AvrEXTiMShaJOOEZ1AJ+SI?=
 =?us-ascii?Q?a9c2L71lBiSNKZvkze69jmnY4u0376L8lLJL5OVTwi1AXjRRmgZOGWNXEnUn?=
 =?us-ascii?Q?DyENCmgJoB9BV2JzWvLroFPvJAbtD/dk3bvW0Br2MgxrgU+er7MEyw7X0xvT?=
 =?us-ascii?Q?jTxyxbtbnxEF5bKRBdsG20Vwfl33wdMJyoNETv4xLEhFCEdsCxuiphC/GE6I?=
 =?us-ascii?Q?jlk/YyYj0dbkX6LGjy0BriyF2ChueJXTrn/TnR8mQ1jyLMZ9DzbqkXri/eyj?=
 =?us-ascii?Q?uQRmO0cQ2StzExFXciwidvf/hWKeRWC3WnK2Jtca1QO8fRMCc/qgz5nbzAwB?=
 =?us-ascii?Q?/SqmNO4XN30n+VgWpQ38LfjTziTrGC65snajp8Xq4ao7y6GRk6od5shZL4Yb?=
 =?us-ascii?Q?en6T07szCuDLTQYXPqjUKPCHUfSVPoDYe7lA4NjeA4X4Z15sQMCi8X5Sq4p9?=
 =?us-ascii?Q?rcbssL6zhAXCHTLPoDc5uGrXajtUUZ+/GO1KkT5P+XK48i4eMtQ+0YJUXZk7?=
 =?us-ascii?Q?liZfpEfpV2dwUL3AiGC6ia4PM+ttuO/xBGcHTiEpIGdi6VZFTgK5PdGwAIyN?=
 =?us-ascii?Q?lo/NdmQExYN2k6hDub4i75nDBk46P+E2P5RZpOE3Qi7400qTOyXzSLfacRJ3?=
 =?us-ascii?Q?FC7xOXQF4+dwYO+2dPAfvrFNugurXglI5G8EbtVXOSs8rZX0KSeMd3E7n/q5?=
 =?us-ascii?Q?7/5gh+8dwINCAr5iBdz5GEdBWDX+L/od5VYVFx0nUErnlI+XYB5KYYLKiLTm?=
 =?us-ascii?Q?jQB3b4aLg+//ghCo0fozS9YW4DbjgNjqWG0V4q/WJmde2i1S8ARkjbfjviiY?=
 =?us-ascii?Q?oB+p3lgrt4OIrPoAmelYgsceu3sDylUo0U3KVzGtWdTnhb21UYZbM+SoOEXo?=
 =?us-ascii?Q?hKQamFVX/688Q6VPRAZKK9nVZrCw1wHbtLKMdZ7j+8W5cBu/311l4vyQuMdV?=
 =?us-ascii?Q?jYY7X8PEvV1tp9OiNhaDfk4ZGeFdNlAXlJrsQs6dCtlXxXk9aHuQV5sme/fA?=
 =?us-ascii?Q?s/x0//tQPkaA7AgQzxmkC275xG0qoIXmRymNYWRmAeg9TAwAAsg5M/4/+X0o?=
 =?us-ascii?Q?yiTYuEtfR8Ap8scVed/r639cknSy00TVhEuraxMX6L+vIIrG26j8Wsj+iH0m?=
 =?us-ascii?Q?2M2URBR4TD/FsRy14QGYsM61sMYg+2l2tJmVr3PAgU6rBGWr/muC2JqEW0Pr?=
 =?us-ascii?Q?H8EWG0vYhOJNJbWAO3ImBp9JvdlqO3tlStvqAYaJNr6Cjs97Evp3iQ6Vu/aF?=
 =?us-ascii?Q?+2JoVgvOVW88u8BBwedoEGqTzH6ASoUpGHoADJdmteoYpvlcsLt3efBmdZXG?=
 =?us-ascii?Q?JgXuvLkjr99jJw1ku3eWTQHXQuYRZOvrxB/tFdGG1k87zjc/tRBbxRT5G/mS?=
 =?us-ascii?Q?0SV7tA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea80908-97c1-493d-e09c-08d9d563a969
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:07.1496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeuQOJ3uwWLUoIhoeczd1m7UkdeyX5RQPIQ01l05jpSXguLriap10Mw/7hFpSfE67SV2YW9L4pRQxU3TCoCmUbuj4QiPFrIROpojrncVf3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: 6qfUkeO1z5UY0hfbqpQJv1xMT0nTMyJX
X-Proofpoint-ORIG-GUID: 6qfUkeO1z5UY0hfbqpQJv1xMT0nTMyJX
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

PCI BARs read from remote device
PCI config reads/writes sent to remote server

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.c | 275 ++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 172 insertions(+), 103 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index a4fd5e2..5c519ee 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2830,6 +2830,132 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
     vdev->req_enabled = false;
 }
 
+static void vfio_pci_config_setup(VFIOPCIDevice *vdev, Error **errp)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    Error *err = NULL;
+
+    /* vfio emulates a lot for us, but some bits need extra love */
+    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
+
+    /* QEMU can choose to expose the ROM or not */
+    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
+    /* QEMU can also add or extend BARs */
+    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
+
+    /*
+     * The PCI spec reserves vendor ID 0xffff as an invalid value.  The
+     * device ID is managed by the vendor and need only be a 16-bit value.
+     * Allow any 16-bit value for subsystem so they can be hidden or changed.
+     */
+    if (vdev->vendor_id != PCI_ANY_ID) {
+        if (vdev->vendor_id >= 0xffff) {
+            error_setg(errp, "invalid PCI vendor ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_VENDOR_ID, vdev->vendor_id, ~0);
+        trace_vfio_pci_emulated_vendor_id(vdev->vbasedev.name, vdev->vendor_id);
+    } else {
+        vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
+    }
+
+    if (vdev->device_id != PCI_ANY_ID) {
+        if (vdev->device_id > 0xffff) {
+            error_setg(errp, "invalid PCI device ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_DEVICE_ID, vdev->device_id, ~0);
+        trace_vfio_pci_emulated_device_id(vdev->vbasedev.name, vdev->device_id);
+    } else {
+        vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
+    }
+
+    if (vdev->sub_vendor_id != PCI_ANY_ID) {
+        if (vdev->sub_vendor_id > 0xffff) {
+            error_setg(errp, "invalid PCI subsystem vendor ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_VENDOR_ID,
+                               vdev->sub_vendor_id, ~0);
+        trace_vfio_pci_emulated_sub_vendor_id(vdev->vbasedev.name,
+                                              vdev->sub_vendor_id);
+    }
+
+    if (vdev->sub_device_id != PCI_ANY_ID) {
+        if (vdev->sub_device_id > 0xffff) {
+            error_setg(errp, "invalid PCI subsystem device ID provided");
+            return;
+        }
+        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_ID, vdev->sub_device_id, ~0);
+        trace_vfio_pci_emulated_sub_device_id(vdev->vbasedev.name,
+                                              vdev->sub_device_id);
+    }
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
+        return;
+    }
+
+    vfio_bars_register(vdev);
+}
+
+static int vfio_interrupt_setup(VFIOPCIDevice *vdev, Error **errp)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    int ret;
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
+    if (vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1)) {
+        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                                  vfio_intx_mmap_enable, vdev);
+        pci_device_set_intx_routing_notifier(&vdev->pdev,
+                                             vfio_intx_routing_notifier);
+        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
+        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
+        ret = vfio_intx_enable(vdev, errp);
+        if (ret) {
+            pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
+            kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
+            return ret;
+        }
+    }
+    return 0;
+}
+
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
@@ -2945,92 +3071,16 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
-    /* vfio emulates a lot for us, but some bits need extra love */
-    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
-
-    /* QEMU can choose to expose the ROM or not */
-    memset(vdev->emulated_config_bits + PCI_ROM_ADDRESS, 0xff, 4);
-    /* QEMU can also add or extend BARs */
-    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
-
-    /*
-     * The PCI spec reserves vendor ID 0xffff as an invalid value.  The
-     * device ID is managed by the vendor and need only be a 16-bit value.
-     * Allow any 16-bit value for subsystem so they can be hidden or changed.
-     */
-    if (vdev->vendor_id != PCI_ANY_ID) {
-        if (vdev->vendor_id >= 0xffff) {
-            error_setg(errp, "invalid PCI vendor ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_VENDOR_ID, vdev->vendor_id, ~0);
-        trace_vfio_pci_emulated_vendor_id(vdev->vbasedev.name, vdev->vendor_id);
-    } else {
-        vdev->vendor_id = pci_get_word(pdev->config + PCI_VENDOR_ID);
-    }
-
-    if (vdev->device_id != PCI_ANY_ID) {
-        if (vdev->device_id > 0xffff) {
-            error_setg(errp, "invalid PCI device ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_DEVICE_ID, vdev->device_id, ~0);
-        trace_vfio_pci_emulated_device_id(vdev->vbasedev.name, vdev->device_id);
-    } else {
-        vdev->device_id = pci_get_word(pdev->config + PCI_DEVICE_ID);
-    }
-
-    if (vdev->sub_vendor_id != PCI_ANY_ID) {
-        if (vdev->sub_vendor_id > 0xffff) {
-            error_setg(errp, "invalid PCI subsystem vendor ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_VENDOR_ID,
-                               vdev->sub_vendor_id, ~0);
-        trace_vfio_pci_emulated_sub_vendor_id(vdev->vbasedev.name,
-                                              vdev->sub_vendor_id);
-    }
-
-    if (vdev->sub_device_id != PCI_ANY_ID) {
-        if (vdev->sub_device_id > 0xffff) {
-            error_setg(errp, "invalid PCI subsystem device ID provided");
-            goto error;
-        }
-        vfio_add_emulated_word(vdev, PCI_SUBSYSTEM_ID, vdev->sub_device_id, ~0);
-        trace_vfio_pci_emulated_sub_device_id(vdev->vbasedev.name,
-                                              vdev->sub_device_id);
-    }
-
-    /* QEMU can change multi-function devices to single function, or reverse */
-    vdev->emulated_config_bits[PCI_HEADER_TYPE] =
-                                              PCI_HEADER_TYPE_MULTI_FUNCTION;
-
-    /* Restore or clear multifunction, this is always controlled by QEMU */
-    if (vdev->pdev.cap_present & QEMU_PCI_CAP_MULTIFUNCTION) {
-        vdev->pdev.config[PCI_HEADER_TYPE] |= PCI_HEADER_TYPE_MULTI_FUNCTION;
-    } else {
-        vdev->pdev.config[PCI_HEADER_TYPE] &= ~PCI_HEADER_TYPE_MULTI_FUNCTION;
-    }
-
-    /*
-     * Clear host resource mapping info.  If we choose not to register a
-     * BAR, such as might be the case with the option ROM, we can get
-     * confusing, unwritable, residual addresses from the host here.
-     */
-    memset(&vdev->pdev.config[PCI_BASE_ADDRESS_0], 0, 24);
-    memset(&vdev->pdev.config[PCI_ROM_ADDRESS], 0, 4);
-
-    vfio_pci_size_rom(vdev);
-
-    vfio_bars_prepare(vdev);
-
-    vfio_msix_early_setup(vdev, &err);
+    vfio_pci_config_setup(vdev, &err);
     if (err) {
-        error_propagate(errp, err);
         goto error;
     }
 
-    vfio_bars_register(vdev);
+    /*
+     * vfio_pci_config_setup will have registered the device's BARs
+     * and setup any MSIX BARs, so errors after it succeeds must
+     * use out_teardown
+     */
 
     ret = vfio_add_capabilities(vdev, errp);
     if (ret) {
@@ -3071,29 +3121,15 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
-    /* QEMU emulates all of MSI & MSIX */
-    if (pdev->cap_present & QEMU_PCI_CAP_MSIX) {
-        memset(vdev->emulated_config_bits + pdev->msix_cap, 0xff,
-               MSIX_CAP_LENGTH);
-    }
-
-    if (pdev->cap_present & QEMU_PCI_CAP_MSI) {
-        memset(vdev->emulated_config_bits + pdev->msi_cap, 0xff,
-               vdev->msi_cap_size);
+    ret = vfio_interrupt_setup(vdev, errp);
+    if (ret) {
+        goto out_teardown;
     }
 
-    if (vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1)) {
-        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
-                                                  vfio_intx_mmap_enable, vdev);
-        pci_device_set_intx_routing_notifier(&vdev->pdev,
-                                             vfio_intx_routing_notifier);
-        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
-        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
-        ret = vfio_intx_enable(vdev, errp);
-        if (ret) {
-            goto out_deregister;
-        }
-    }
+    /*
+     * vfio_interrupt_setup will have setup INTx's KVM routing
+     * so errors after it succeeds must use out_deregister
+     */
 
     if (vdev->display != ON_OFF_AUTO_OFF) {
         ret = vfio_display_probe(vdev, errp);
@@ -3487,8 +3523,41 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
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
+    vfio_pci_config_setup(vdev, &err);
+    if (err) {
+        goto error;
+    }
+
+    /*
+     * vfio_pci_config_setup will have registered the device's BARs
+     * and setup any MSIX BARs, so errors after it succeeds must
+     * use out_teardown
+     */
+
+    ret = vfio_add_capabilities(vdev, errp);
+    if (ret) {
+        goto out_teardown;
+    }
+
+    ret = vfio_interrupt_setup(vdev, errp);
+    if (ret) {
+        goto out_teardown;
+    }
+
     return;
 
+out_teardown:
+    vfio_teardown_msi(vdev);
+    vfio_bars_exit(vdev);
 error:
     vfio_user_disconnect(proxy);
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
-- 
1.8.3.1


