Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AF348BC05
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:49:51 +0100 (CET)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Rpl-0004sv-Sd
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:49:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdZ-0000hK-1C
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdW-0005ft-7r
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:12 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMYZlX025152
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=FKUFH3OBCp8sl9cGeIlRHiVQQSmZXkqSsXXzAOwbJKo=;
 b=dsNSUWsAG/3oc1QlbOK6Ub4hqhPz4P4o+R8Zj2Urq/lHBb+OGExMmDCTz+SjM0OKlf02
 i8gIhk+0bH8z0XgG22WcJX6qxNVVD/jqbIYkViltabljiHnJ6dmuG/2Hqwvlmq9KWYmb
 oHOfpUMlojl8Um5nvYX4kLsU2mXCZfPlMzr3alppbLtZVRcx6MzAYM4aDBsAVCEv/22i
 QEDTk8jT1e5aWMcMmUQrWAMr1oZsUhe9Vgip+1fhzGm29jTLtmU4Px2b4CCFzC3Rx/Gn
 kvyHg692R6l37NBAN5cvriwfFZ45gpZf0op2IPubhPpfZrg1mPl5LL4kgXjoPWrxt4Wd qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgmk9crnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTB8196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9iQcyI9v3SNTGdHVyGMc8ES43ajoZhd4Gl9TIYFTdSTX/LBOn/wRqCneEB1+YfUdJ8wPXY+p/3RV2i6lb3C7bImFyU9/qJtSS8YvDfDRB0S9lF4JvCa64i3v7ANzSlvcQsnrPcV0VcLTGPortpOZM6NHwq3ifkKxFji4JQoYjoDZgG8URZPsAfQ2N0El2057MResEbrL7ulWPDVz1OdyrVBo6s6cEzRLWFqKgs2a+GZKnzZpnGPACzNZddCMHkPRF8fbuHVAHS6bj6voRcCLhjS8FPrs+bbF7ifsdbfiqZ8zmGI60dRtDFY0rbFdPr812Cc03mOXqUgWFdySouPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKUFH3OBCp8sl9cGeIlRHiVQQSmZXkqSsXXzAOwbJKo=;
 b=Wy6JjQBun24d8QGBokJdrqfNAGWxZJ9nijlZENKmTrYyI096STZyFmQG6DZDh/BH6eN7tNpfJdnz8ZGra80sb0c1d+rFzNcvTnOEp6D+qJ9OOlB4h5qZ3RZGG3ZNqLiv4t4AMaPB11/HOWUuIl6pEEHHjySpb76/J/jqLHrX9sfVysRLqKwQjUjYt72aYJkyIhNpPqWrZ3XY+T9jmemC+nSeF292F/ByLm24t0fnNF++xSPXgKf8Lu0tK/0WGeTMCK7GphK6cJyctaoCaLDodiuuFok7DISsaZHlXHAkPPpSGT5FSDJrxH+kFHYfJFbr6Wrud4EexaHZEqTi/Mwxfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKUFH3OBCp8sl9cGeIlRHiVQQSmZXkqSsXXzAOwbJKo=;
 b=c1rteGpAGFRTJJPqgL3LOF04X8KHwvb/vsv/3AG3EAN+h/kki2akfZuAj1blbrIxwnrw5VPC7cYE2XcBc6AbXLIcMVvkEoTm77gcGVtMaaDYcasOz1N8QxV4NjBbRFX42yKDqCX+NyTYjaR3pUb6+BlOXA9gcIzuKBxDR+6HTY4=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:05 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:04 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 06/21] vfio-user: Define type vfio_user_pci_dev_info
Date: Tue, 11 Jan 2022 16:43:42 -0800
Message-Id: <d67f56b9d3fe601db82d0df73dbdcb97294dbc8a.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9271c530-e6ee-464a-72e8-08d9d563a812
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742FA4096825B546E22AA44B6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O5RjGHGS6TvPBR0cTLeCtVlFwVy+JzDM/ndXE1WLyx9fV1a8JtYjUv2nQwo/1FbN/Ukj/jhtkLTtQ1K/hGrEsXGl9opc4Igzuv55rrJ9Z/MCAtYqo/6sioKhQldOCpnaK/0M74tAviTEbv/PoPz6AQBOGzzsHJ2K0o+5JCpT9KCpvAaqet140hmwl37x7OX0K4nLvRRdAP+dmDRA2ZwrPCy+Blyry0Wuw9NG3LgXUB4qnH8q0LKIeaanBCvIaRWQg5DpayzTzFUz6XwiMwQgZX0jtH7PJrML1kGk/qBsUzfFntdoHfZtMIvBLnekCxVzXIHsplyFC9v7IxFfcuakgNaG1R54y8xNXXXGIFEdanyXYi3hv2zGs+GDH1D/xQb4a7Fslb9HCYPxEnw75T/f7OZDdIB9CRqf3XrT3i0W7CdXHeouth7fONjthlUGTvoajuyow9hxFnFMU0cRHouexDILaimhUxTsRjnee+D+0YQpmcFQl//te5C1cr9ctjQ0lsbPqWTZSvyCwP0XQ1OGrU/wYqr8rdoTmQRu7zn6IXT3RgwDklwnAodYaGQSXXy5CoquWHQtvt4mtPUdJOhDsIn+JOyeJVPgI0qYwe93GRJObKMVRT46f6dr0Ngxr4dvwiQVZSM/Vvz3l3kfGw3VyOWl60BesEH4Hev3pzcfksgUUTDP7KCYCcZqHFKmKXf/Q7LmIcsb//nQtkKy1o+1OA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WdltT0m9yrSA2P87AAEQ5E4L6aiL5L0Lf/1QKhfsuvt83VRtRvsCu4Ng7HR0?=
 =?us-ascii?Q?mWWh9dsD8G7quM2FKxzrfHdro64K26sg9GB7tS2VQlrz+nRXJMr/J0Pj8WtQ?=
 =?us-ascii?Q?i71+xHynypdYiEL7af+9ow6HRqLYw4xTHj/Q9t8WRULoRgh1+Y8V4dOtjen9?=
 =?us-ascii?Q?v7ad+rR4aQFcbv0S2RUHR/Pyk0BaAZ511XnLjqW7S3UArQ78XN+TnwOoZ3Z7?=
 =?us-ascii?Q?ryfxO149Qtzn71C61+Ejsw78Tgdjj3L4la22xHDA22wgYUrcAyihFlMTafjD?=
 =?us-ascii?Q?m5oKKsJ0jvjbfyREYycJKZYC7WJrCzBWMURaTbjUrnzSXrWCYlPw6GG08y18?=
 =?us-ascii?Q?y56+uW449FQ2JGp+9X4sUepaxc+gwirN3eFl5+3QOeJ5vNhQvRj6g1GSy1y6?=
 =?us-ascii?Q?msn5Iyl6HeblaTRK1FoZYyWfPPnS7Xl3G7qwH4run4mWHbjQAQQdiynCctO/?=
 =?us-ascii?Q?290HzExyvMBuF47NBgHa/Hai24ojbdNJqC6z8giI+M3h7U6rqj/pp7APj+xG?=
 =?us-ascii?Q?TwVmw/Ocse2F9280pg694GLd6hmBHjP1uMx8Apf8RDxdaIWg5IlfGoW5YyHy?=
 =?us-ascii?Q?ZGwJSEX7CcsuaTMLJBn5j2Sgut2TOhO9t7sPQdylc80D60CGKvVp/GjdFqrW?=
 =?us-ascii?Q?haxLxI26VPHX0a1k7HCVC4nyiWhT0cquXnqIxi+xiNrg8jPtVKD22ZG3rJkh?=
 =?us-ascii?Q?7eWzZ8EUD6tOgVKkfpPYy1x22HkKtVHcReIH57cCuvy5cvXdRA3+wsIMPjMe?=
 =?us-ascii?Q?FVvQgRCyvxesiUSwkRA0WgAHXcV+A3ONop6AyP3Gkrcq+x0pOYzJIlbzsaYR?=
 =?us-ascii?Q?HKS+clJrpciJagn8D1waM0fMqEEGg3TYf0zbFuoEV0DT1ITypWUvpvBqJlDi?=
 =?us-ascii?Q?YsZCoz4WBZesh65uCcl+wGiriThD7vVjA9lfcbUCjwwv9rOoA7dEWYPJN5Ae?=
 =?us-ascii?Q?Yj1ySuQPl3rtueyRa0hureyRMiXyRzAMRzfYFVOS1Nl1AB1E/KUsoM4Ytrxg?=
 =?us-ascii?Q?2OcNnH2PnsYxtVSZQssXruWMFw+cK6wp5t9mBofq99/vH5ip+vIJbodpxlWg?=
 =?us-ascii?Q?C2on+20gSqqsrU05LooRUyo+bUSqbE4yGIZTrIhj3bsdMDm/T/eUZ+fZCvtb?=
 =?us-ascii?Q?MAHGcwZPffZKqV5M5Cyh95wsXpv/w5OCkhiIQXQj9RhJTeCG3AkFdXsxGSM0?=
 =?us-ascii?Q?SGuzmcMoetiNur5XxY0EhDqCvbyarZn/4fuT/EJIRmT1JR5zGXF+/N+yssdy?=
 =?us-ascii?Q?HXyPAaLuGecuP+PRec/Q79RzM6ncZvanWHLtoaC2Zz6YD126bzx0lwPTS+cF?=
 =?us-ascii?Q?AEY+qVmHFiRNg15Dgu1f9Uiel0Yvw6qk72yooCWgZ4+frRSleYB3usxoCRmn?=
 =?us-ascii?Q?Zh6Ijb4JkO7GK/DOHUmJfISNaEceywCMdYOZLcojXE+o/AhYC6yfT1qpJOXg?=
 =?us-ascii?Q?rG5Ka6bcHLhrnHpc2OSBEky32lXSumRTJzx0PgC5KfMZnUCXfehJIELMRJqz?=
 =?us-ascii?Q?Czjh7xN+nSXB+zUYNMNYUwk1EEHZy74xApA2ybS7WEJmyS13XDLJeJtosQQU?=
 =?us-ascii?Q?9WQB0Q+X6P3zXTh6r5szK8XYHsi+sI9UnQmIME/DxNZ5X+/70cHBdruD2bKR?=
 =?us-ascii?Q?lNUfPg8I2v+rHQ0LdoTUhvPRqsbj5bSUXnnqaA6KdvAdpjRIWqrMoKFJa8VF?=
 =?us-ascii?Q?5QmlAA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9271c530-e6ee-464a-72e8-08d9d563a812
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:04.8832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04qVhDvvf1HPJ/ATXkeC3iPcG7UNQQRsjGJzi8/UJX/dXrr63IvpbSoi2/xVjLdUNabdk5bWB8bosHpS+mmNz9RVe+jr+CtlxpnfUaPKwG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: vZRcBXP9mp03st0zqzY9hsgdOMYVjuC0
X-Proofpoint-ORIG-GUID: vZRcBXP9mp03st0zqzY9hsgdOMYVjuC0
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

New class for vfio-user with its class and instance
constructors and destructors, and its pci ops.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h    |  8 +++++
 hw/vfio/common.c |  5 ++++
 hw/vfio/pci.c    | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/Kconfig  | 10 +++++++
 4 files changed, 113 insertions(+)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index bbc78aa..59e636c 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -187,6 +187,14 @@ struct VFIOKernPCIDevice {
     VFIOPCIDevice device;
 };
 
+#define TYPE_VFIO_USER_PCI "vfio-user-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
+
+struct VFIOUserPCIDevice {
+    VFIOPCIDevice device;
+    char *sock_name;
+};
+
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
 static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
 {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index cce38d8..f07023c 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1742,6 +1742,11 @@ void vfio_reset_handler(void *opaque)
     QLIST_FOREACH(group, &vfio_group_list, next) {
         QLIST_FOREACH(vbasedev, &group->device_list, next) {
             if (vbasedev->dev->realized && vbasedev->needs_reset) {
+                if (vbasedev->ops->vfio_hot_reset_multi == NULL) {
+                    error_printf("%s: No hot reset handler specified\n",
+                                 vbasedev->name);
+                    continue;
+                }
                 vbasedev->ops->vfio_hot_reset_multi(vbasedev);
             }
         }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 63a42ae..6abe474 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include <linux/vfio.h>
 #include <sys/ioctl.h>
 
@@ -3376,3 +3377,92 @@ static void register_vfio_pci_dev_type(void)
 }
 
 type_init(register_vfio_pci_dev_type)
+
+
+#ifdef CONFIG_VFIO_USER_PCI
+
+/*
+ * vfio-user routines.
+ */
+
+/*
+ * Emulated devices don't use host hot reset
+ */
+static void vfio_user_compute_needs_reset(VFIODevice *vbasedev)
+{
+    vbasedev->needs_reset = false;
+}
+
+static VFIODeviceOps vfio_user_pci_ops = {
+    .vfio_compute_needs_reset = vfio_user_compute_needs_reset,
+    .vfio_eoi = vfio_intx_eoi,
+    .vfio_get_object = vfio_pci_get_object,
+    .vfio_save_config = vfio_pci_save_config,
+    .vfio_load_config = vfio_pci_load_config,
+};
+
+static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
+{
+    ERRP_GUARD();
+    VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    /*
+     * TODO: make option parser understand SocketAddress
+     * and use that instead of having scalar options
+     * for each socket type.
+     */
+    if (!udev->sock_name) {
+        error_setg(errp, "No socket specified");
+        error_append_hint(errp, "Use -device vfio-user-pci,socket=<name>\n");
+        return;
+    }
+
+    vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
+    vbasedev->dev = DEVICE(vdev);
+    vbasedev->fd = -1;
+    vbasedev->type = VFIO_DEVICE_TYPE_PCI;
+    vbasedev->ops = &vfio_user_pci_ops;
+
+}
+
+static void vfio_user_instance_finalize(Object *obj)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
+
+    vfio_put_device(vdev);
+}
+
+static Property vfio_user_pci_dev_properties[] = {
+    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, vfio_user_pci_dev_properties);
+    dc->desc = "VFIO over socket PCI device assignment";
+    pdc->realize = vfio_user_pci_realize;
+}
+
+static const TypeInfo vfio_user_pci_dev_info = {
+    .name = TYPE_VFIO_USER_PCI,
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOUserPCIDevice),
+    .class_init = vfio_user_pci_dev_class_init,
+    .instance_init = vfio_instance_init,
+    .instance_finalize = vfio_user_instance_finalize,
+};
+
+static void register_vfio_user_dev_type(void)
+{
+    type_register_static(&vfio_user_pci_dev_info);
+}
+
+type_init(register_vfio_user_dev_type)
+
+#endif /* VFIO_USER_PCI */
diff --git a/hw/vfio/Kconfig b/hw/vfio/Kconfig
index 7cdba05..301894e 100644
--- a/hw/vfio/Kconfig
+++ b/hw/vfio/Kconfig
@@ -2,6 +2,10 @@ config VFIO
     bool
     depends on LINUX
 
+config VFIO_USER
+    bool
+    depends on VFIO
+
 config VFIO_PCI
     bool
     default y
@@ -9,6 +13,12 @@ config VFIO_PCI
     select EDID
     depends on LINUX && PCI
 
+config VFIO_USER_PCI
+    bool
+    default y
+    select VFIO_USER
+    depends on VFIO_PCI
+
 config VFIO_CCW
     bool
     default y
-- 
1.8.3.1


