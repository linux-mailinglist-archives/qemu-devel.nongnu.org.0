Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DBE495036
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:34:33 +0100 (CET)
Received: from localhost ([::1]:37866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYWF-0002Hw-VD
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:34:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVey-0005cC-SL; Thu, 20 Jan 2022 06:31:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVep-0006bW-QP; Thu, 20 Jan 2022 06:31:19 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K8wxKX010641; 
 Thu, 20 Jan 2022 11:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=jVfDpx8m+kaH2KUNUQ7sr7n46fAnoFaQ1nov9PbMJC4=;
 b=ddxgC+0Ol0u09uCYBWnAOjzRhShApLa8scsWlydyVrygU50cVP7KqO5fVpzh8qONYKqy
 yKzASv0PyWLTKL7okkJz8gLwFJRB4795B91goE7l7XH5hHjYVJY5+dmVtJHT50DD2fRh
 kpvT2U9vVs7yy95tqzMZ4BxtdEStfsTNVzejXwVTqMuPQ75hNBJ2X6Bs3jRjYG1gsFNs
 mZMlxHewi9Oi/PmAOBKnARy4b7axG0pD41SlH0rc1O5qFh1ub3KPOVmdSlIaEWoDJabO
 Dpu821BpKNl/wgjrTV4fvhuhFs71OWq6kB0A1qaI1Yfmb0gOsD/Pv5gST0RbZhq6qdHe Rw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc5301tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KBG83x069913;
 Thu, 20 Jan 2022 11:30:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3020.oracle.com with ESMTP id 3dkqqs8hys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUIYR1C5e/d0j2Cy2WrnIznuoVgfV6X2EZpxEtMlPnBKsVQgEsNKPgGXkwxF7stqVpcpJ8FRymIzi9mYobnV6GAZU5CT2Ks21HwrqdSrIbM3afCponszD7hb+y0XCUIBfeHU9R0DoTJitlZg00P18tnExJ0PR6KcrDFzQcE9PlUas/8upP86N3U+gUNOCkmrlmgMc+M91+Oex2FZmUmzJCIRtxNJECbgYjzaInxDjHEW4e1maQ5YOJJo0zgXHlsCpxz6PcLHu+htVANU5py1Dix8gGIdlu94RoSfRclGcvSeT9Nj0Dx7d1LHjHJl3g/MfGwljLeHdY3/xX+dBLyY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVfDpx8m+kaH2KUNUQ7sr7n46fAnoFaQ1nov9PbMJC4=;
 b=aWFyucTfo1O/qerunKIkpzgq1MH9QuTmEuCDI79UAuf1xHI5JDTXxMh6RKAkHQSqwyj6t2h6FJ7LIbFJvHCI+ZX8r7KZgXx/wQ9m58SGMIm/pz3HqEWEoUY+YwC9pFbMb/+n4y5qeAbPxlA+kcGaUWsuMAvp2CXvXDi6/dEQXwbvP6yalSsauUwyFZm57CdzaZx/LLnv6HceY6Q5JwluhDx/U/5RBW8W/+LHm1APqtQfzU7RIWiSudPwwVe7d1wSIX2r4mTxOIzwp2QQl0bVJUY8CZLOdLFXs6zpebATdEpdOXUDugxFV7GOSzwXMA7+ExYoK+Q6ROAcRQZ0UUmYyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVfDpx8m+kaH2KUNUQ7sr7n46fAnoFaQ1nov9PbMJC4=;
 b=iVUdMOmfohQwc0PQ7gHnk0do4i/GE1/S70uSGXkBrauQmx1F08jNL43v/Fm+iHBjWyIBDbQDtDpoqcbPBwDbw5reWWv+6KYyIMaxRP9Bd1hoKhoa595H/quiLjaEkL+0sSaHO4SPM5zbMBuJFU2bLzPzM9fjt3qq6QyvevFiqT4=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by CH0PR10MB5052.namprd10.prod.outlook.com (2603:10b6:610:de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 11:30:24 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb%9]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 11:30:24 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 8/8] hmp: add virtio commands
Date: Thu, 20 Jan 2022 06:29:28 -0500
Message-Id: <1642678168-20447-9-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
References: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68cbbf2c-c166-4876-a850-08d9dc084010
X-MS-TrafficTypeDiagnostic: CH0PR10MB5052:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB5052A084D8F564E1016ECD7FE85A9@CH0PR10MB5052.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:120;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmQXaAx1GLCOpJ7kXACeVAo67NQSm40pCt5rXk7tTzByXxfvC0LS6fDKgtmkwwJTGAedDBQ752o1EmZ/oBl+TRaZgxWmioQKPawysVeJo9YDeBciZ1QC7bV5t1K3oBf4BONEPjQnG5D4ZEO8MHz51xLpo7AcSrF1ABGKvTE8MZfLfB1gD7urejcng1NA/QXDDysgxMx5QfuRfVYePIdWawbojmhvtq6esimJY4Q1Ynt2h8+jqo1MZDuqoZOVmh3L8em7Pze82qAsNKjB6r4gQKUd01gqQ7y5c6SFgWV07dyusRdPq5Vlgu1NiHVPFZcpHUYyXXknbrawj4CDQ5NvZSlM9kYEtrTwsFbyPj249/J42f8TeXltYawT0ids6UGoCa1HoMQYnDJzVQEWu6deClj5rL8ow2WEcFrD+uVoL4V2+6aHvokAsxGpLbMsYogttwqcqoLURSycFS4MnzkoIYA8VuHFfTXpckM/fJ844lAVkq1mDvGE1D9BHgPHmc4krvFyZHHhKYNPgY3xiBnB4D2suAVB5JKajAtSlnrLcBIs9FBPnOf3PJI+ETjmOOLoOdFft+BodEyYKrhYHEEU3NijDZvBzqNogXwxupb0VbiaA1Co3Wjvdyx7zuusCBQlFdMAvLeuamEFlBwQTkMQWY6+g385ZxBhWmil+/+Gxq0+r09ORMwYZfEaxrDGxC15f4kT/HdkrzWsSjIyY+ps1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(7416002)(30864003)(52116002)(6512007)(316002)(38100700002)(38350700002)(5660300002)(4326008)(86362001)(66476007)(66556008)(66946007)(44832011)(2906002)(508600001)(8936002)(36756003)(6916009)(8676002)(26005)(186003)(83380400001)(6486002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bbAF6SsWlujmgwWN5MvYs4MnXGy9+dQceQUwBLOxwwku+uA3Iir5RR3r5Ir/?=
 =?us-ascii?Q?iYvg6Sg1IcAs3LQxvK/e/V0yppKdLc3m3oUINh3OgQ8uXJI+1VqheO2irJ6t?=
 =?us-ascii?Q?KmkZPqqbWh06OjCTVX89mXNcXL9hymL/K8HFNRF89NosPffHH+hX4UF1uh8d?=
 =?us-ascii?Q?J5vH4YDncgv5bBOkXiUZCcX0o+/quIeDQbRa2JlbkkV8/2KrAPLECKOy5hbE?=
 =?us-ascii?Q?fcxa/kKg0+gSPtSFTFpeqJ5IZYUFaJolXKxSsnuebjC+qiDavwipfu83OFyR?=
 =?us-ascii?Q?J8jU69ZchhJ6YLppW4gCgyzEDZkm+c4xNodQtFlEHugGr7aDUAziP364cNGX?=
 =?us-ascii?Q?Zr5jYugtVx5YZYkYs0PSIvQazZRWWhsTVaKHjAsTjD8ffc1IIjSO8Z3idK7X?=
 =?us-ascii?Q?D48rmfY8m+DxY31iD315OHi+00nZnVqhOm2CKWi9TyG8SIaPnK1xX7/7areS?=
 =?us-ascii?Q?fZ7xjG2Up0rY5ddBvYyN0hvNdzioCaRLdAWMHgkXcPwRAi08JvRaPUgcRscE?=
 =?us-ascii?Q?pNY5wgG7GVPvL/2Rp/VCqdV9ongcvINH0ogJv2axnS91HMQDtm46Rt78xKmd?=
 =?us-ascii?Q?g5oXbYUwtFhE/De3SCwgkshJDAD9zHg71FBDwY4raY+4qvUxaRE5aPHWXixU?=
 =?us-ascii?Q?5W0pEfAWGj04tYMiblpt9EmtN8yYJFMJrNdbBevDb0UrHKd3JhRDVs5/thex?=
 =?us-ascii?Q?UfGbXTJbd6rtYnOc22M31pkbdS367rLqcDxGwHYqSCnDkvATeOQ2lqlnzQCx?=
 =?us-ascii?Q?y9xGY8+tDvqOkWmi9vIUKZk/frSV9kzzlFaNxvllDkislEEhmm0n7onZGhU4?=
 =?us-ascii?Q?x95ueMPDMl0+0JBKvslBFn4vYlKnWrrzkTG8TYqlDzJrv8gO6ip+XnX+tdSN?=
 =?us-ascii?Q?fqtZLsuF3f/h6dy0o9D3rGIVqjynyC1eIOyZxhvbalk6npARAdRicu8pI8mh?=
 =?us-ascii?Q?6rFM85pMO+1YccWzq0fX//Gc0BBznCDnlEZxYO6WfM5XwRc+YR3+4BqoJzya?=
 =?us-ascii?Q?vOGxpr6oPvHWiDORsq1XpKj2AwOAYxyN+m97Iigx9j4rGIG5L5Wen66UmfLs?=
 =?us-ascii?Q?NDDx8F4XxGA5KlJCHk2fPSqHTxIbz2gfum9mJkL64MJtjGpUshttmbJkpyb+?=
 =?us-ascii?Q?Z3yiQzNYZT1V60mcopMIvtN0w0+DVy7GEAEcjw5wPI50kFV60T75gQMKPwnh?=
 =?us-ascii?Q?T3m+4Iw12qvn00XnPwEQjaQyLqhhev5a5X9IXBphCwSdhCVOMJJxsFj0QsH8?=
 =?us-ascii?Q?N5cenaTZK46WbxIemm4Z1P8EHsqomnVZLjOnFixvznNGDdyTRHonYvpireW4?=
 =?us-ascii?Q?FJObmb7a2ydOoPMTEr6HyDthpBsyXbL6r2PfNDhxtcPbm13wrfVuA9YfUctm?=
 =?us-ascii?Q?Twsb63u/u/7w1YkOG26Xafa0lXFtFV1Qcxf4wSps/XbLxtjbvignrC9AU0gB?=
 =?us-ascii?Q?UFyBxPhuiajdi+EpypwmWWnekDvWR5Ea8V1w7cy84qmrnldRt5FkGttZPme2?=
 =?us-ascii?Q?uXg5kQwiSzVKQ9zaQ5KuB8wmv+L/EysZfA667JaKGVQXEV7zaaj7bx5iWwf6?=
 =?us-ascii?Q?6oiktIXscEJsd/5gMW2xtPysVHnupW7sgjdGXXttB+rYRn+5/hW7a+daOSQ/?=
 =?us-ascii?Q?NBdzYq2ZA5hHjOASUN0U/so=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68cbbf2c-c166-4876-a850-08d9dc084010
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 11:30:24.3724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibqomZuLwWN+3KtbkEPHoDv3fVwNN8sa0aVq1SFe9bh89JHpIVHCSjfS92xCfhHmvr1iVhP7JKQ/5eXjsSKhYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5052
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200058
X-Proofpoint-GUID: AKkC8t4QuRto1_DP5DUzufiyh6Puu8iE
X-Proofpoint-ORIG-GUID: AKkC8t4QuRto1_DP5DUzufiyh6Puu8iE
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This patch implements the HMP versions of the virtio QMP commands.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hmp-commands-info.hx  |  70 ++++++++++++
 include/monitor/hmp.h |   5 +
 monitor/hmp-cmds.c    | 311 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 386 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da..e49d852 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -877,3 +877,73 @@ SRST
   ``info sgx``
     Show intel SGX information.
 ERST
+
+    {
+        .name      = "virtio",
+        .args_type = "",
+        .params    = "",
+        .help      = "List all available virtio devices",
+        .cmd       = hmp_virtio_query,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio``
+    List all available virtio devices
+ERST
+
+    {
+        .name      = "virtio-status",
+        .args_type = "path:s",
+        .params    = "path",
+        .help      = "Display status of a given virtio device",
+        .cmd       = hmp_virtio_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-status`` *path*
+    Display status of a given virtio device
+ERST
+
+    {
+        .name      = "virtio-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given virtio queue",
+        .cmd       = hmp_virtio_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-queue-status`` *path* *queue*
+    Display status of a given virtio queue
+ERST
+
+    {
+        .name      = "virtio-vhost-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given vhost queue",
+        .cmd       = hmp_vhost_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-vhost-queue-status`` *path* *queue*
+    Display status of a given vhost queue
+ERST
+
+    {
+        .name       = "virtio-queue-element",
+        .args_type  = "path:s,queue:i,index:i?",
+        .params     = "path queue [index]",
+        .help       = "Display element of a given virtio queue",
+        .cmd        = hmp_virtio_queue_element,
+        .flags      = "p",
+    },
+
+SRST
+  ``info virtio-queue-element`` *path* *queue* [*index*]
+    Display element of a given virtio queue
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d0148..47446d8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -95,6 +95,11 @@ void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_get(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict);
+void hmp_virtio_query(Monitor *mon, const QDict *qdict);
+void hmp_virtio_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2669156..be3b7c0 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -42,6 +42,8 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -2166,3 +2168,312 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    strList *pcol_list = pcol->protocols;
+    while (pcol_list) {
+        monitor_printf(mon, "%s", pcol_list->value);
+        pcol_list = pcol_list->next;
+        if (pcol_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (pcol->has_unknown_protocols) {
+        monitor_printf(mon, "  unknown-protocols(0x%016"PRIx64")\n",
+                       pcol->unknown_protocols);
+    }
+}
+
+static void hmp_virtio_dump_status(Monitor *mon,
+                                   VirtioDeviceStatus *status)
+{
+    strList *status_list = status->statuses;
+    while (status_list) {
+        monitor_printf(mon, "%s", status_list->value);
+        status_list = status_list->next;
+        if (status_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (status->has_unknown_statuses) {
+        monitor_printf(mon, "  unknown-statuses(0x%016"PRIx32")\n",
+                       status->unknown_statuses);
+    }
+}
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    strList *transport_list = features->transports;
+    while (transport_list) {
+        monitor_printf(mon, "%s", transport_list->value);
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+
+    monitor_printf(mon, "\n");
+    strList *list = features->dev_features;
+    if (list) {
+        monitor_printf(mon, "                    ");
+        while (list) {
+            monitor_printf(mon, "%s", list->value);
+            list = list->next;
+            if (list != NULL) {
+                monitor_printf(mon, ", ");
+            }
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    if (features->has_unknown_dev_features) {
+        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_dev_features);
+    }
+}
+
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_query_virtio(&err);
+    VirtioInfoList *node;
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    if (list == NULL) {
+        monitor_printf(mon, "No VirtIO devices\n");
+        return;
+    }
+
+    node = list;
+    while (node) {
+        monitor_printf(mon, "%s [%s]\n", node->value->path,
+                       node->value->name);
+        node = node->next;
+    }
+    qapi_free_VirtioInfoList(list);
+}
+
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_query_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:             %s %s\n",
+                   s->name, s->has_vhost_dev ? "(vhost)" : "");
+    monitor_printf(mon, "  device_id:               %d\n", s->device_id);
+    monitor_printf(mon, "  vhost_started:           %s\n",
+                   s->vhost_started ? "true" : "false");
+    monitor_printf(mon, "  bus_name:                %s\n", s->bus_name);
+    monitor_printf(mon, "  broken:                  %s\n",
+                   s->broken ? "true" : "false");
+    monitor_printf(mon, "  disabled:                %s\n",
+                   s->disabled ? "true" : "false");
+    monitor_printf(mon, "  disable_legacy_check:    %s\n",
+                   s->disable_legacy_check ? "true" : "false");
+    monitor_printf(mon, "  started:                 %s\n",
+                   s->started ? "true" : "false");
+    monitor_printf(mon, "  use_started:             %s\n",
+                   s->use_started ? "true" : "false");
+    monitor_printf(mon, "  start_on_kick:           %s\n",
+                   s->start_on_kick ? "true" : "false");
+    monitor_printf(mon, "  use_guest_notifier_mask: %s\n",
+                   s->use_guest_notifier_mask ? "true" : "false");
+    monitor_printf(mon, "  vm_running:              %s\n",
+                   s->vm_running ? "true" : "false");
+    monitor_printf(mon, "  num_vqs:                 %ld\n", s->num_vqs);
+    monitor_printf(mon, "  queue_sel:               %d\n",
+                   s->queue_sel);
+    monitor_printf(mon, "  isr:                     %d\n", s->isr);
+    monitor_printf(mon, "  endianness:              %s\n",
+                   s->device_endian);
+    monitor_printf(mon, "  status: ");
+    hmp_virtio_dump_status(mon, s->status);
+    monitor_printf(mon, "  Guest features:   ");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:    ");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features: ");
+    hmp_virtio_dump_features(mon, s->backend_features);
+
+    if (s->has_vhost_dev) {
+        monitor_printf(mon, "  VHost:\n");
+        monitor_printf(mon, "    nvqs:           %d\n",
+                       s->vhost_dev->nvqs);
+        monitor_printf(mon, "    vq_index:       %ld\n",
+                       s->vhost_dev->vq_index);
+        monitor_printf(mon, "    max_queues:     %lu\n",
+                       s->vhost_dev->max_queues);
+        monitor_printf(mon, "    n_mem_sections: %ld\n",
+                       s->vhost_dev->n_mem_sections);
+        monitor_printf(mon, "    n_tmp_sections: %ld\n",
+                       s->vhost_dev->n_tmp_sections);
+        monitor_printf(mon, "    backend_cap:    %lu\n",
+                       s->vhost_dev->backend_cap);
+        monitor_printf(mon, "    log_enabled:    %s\n",
+                       s->vhost_dev->log_enabled ? "true" : "false");
+        monitor_printf(mon, "    log_size:       %lu\n",
+                       s->vhost_dev->log_size);
+        monitor_printf(mon, "    Features:          ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->features);
+        monitor_printf(mon, "    Acked features:    ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
+        monitor_printf(mon, "    Backend features:  ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
+        monitor_printf(mon, "    Protocol features: ");
+        hmp_virtio_dump_protocols(mon, s->vhost_dev->protocol_features);
+    }
+
+    qapi_free_VirtioStatus(s);
+}
+
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtVhostQueueStatus *s =
+        qmp_x_query_virtio_vhost_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s (vhost)\n",
+                   s->name);
+    monitor_printf(mon, "  kick:                 %ld\n", s->kick);
+    monitor_printf(mon, "  call:                 %ld\n", s->call);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %ld\n", s->num);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->desc);
+    monitor_printf(mon, "    desc_phys:   0x%016"PRIx64"\n",
+                   s->desc_phys);
+    monitor_printf(mon, "    desc_size:   %"PRId32"\n", s->desc_size);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->avail);
+    monitor_printf(mon, "    avail_phys:  0x%016"PRIx64"\n",
+                   s->avail_phys);
+    monitor_printf(mon, "    avail_size:  %"PRId32"\n", s->avail_size);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->used);
+    monitor_printf(mon, "    used_phys:   0x%016"PRIx64"\n",
+                   s->used_phys);
+    monitor_printf(mon, "    used_size:   %"PRId32"\n", s->used_size);
+
+    qapi_free_VirtVhostQueueStatus(s);
+}
+
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_query_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s\n", s->name);
+    monitor_printf(mon, "  queue_index:          %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  used_idx:             %d\n", s->used_idx);
+    monitor_printf(mon, "  signalled_used:       %d\n",
+                   s->signalled_used);
+    monitor_printf(mon, "  signalled_used_valid: %s\n",
+                   s->signalled_used_valid ? "true" : "false");
+    if (s->has_last_avail_idx) {
+        monitor_printf(mon, "  last_avail_idx:       %d\n",
+                       s->last_avail_idx);
+    }
+    if (s->has_shadow_avail_idx) {
+        monitor_printf(mon, "  shadow_avail_idx:     %d\n",
+                       s->shadow_avail_idx);
+    }
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:          %"PRId32"\n", s->vring_num);
+    monitor_printf(mon, "    num_default:  %"PRId32"\n",
+                   s->vring_num_default);
+    monitor_printf(mon, "    align:        %"PRId32"\n",
+                   s->vring_align);
+    monitor_printf(mon, "    desc:         0x%016"PRIx64"\n",
+                   s->vring_desc);
+    monitor_printf(mon, "    avail:        0x%016"PRIx64"\n",
+                   s->vring_avail);
+    monitor_printf(mon, "    used:         0x%016"PRIx64"\n",
+                   s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *e;
+    VirtioRingDescList *list;
+
+    e = qmp_x_query_virtio_queue_element(path, queue, index != -1,
+                                         index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name: %s\n", e->name);
+    monitor_printf(mon, "  index:       %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    descs:   ");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "addr 0x%"PRIx64" len %d", list->value->addr,
+                       list->value->len);
+        if (list->value->flags) {
+            strList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s", flag->value);
+                flag = flag->next;
+                if (flag) {
+                    monitor_printf(mon, ", ");
+                }
+            }
+            monitor_printf(mon, ")");
+        }
+        list = list->next;
+        if (list) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    monitor_printf(mon, "  avail:\n");
+    monitor_printf(mon, "    flags: %d\n", e->avail->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->avail->idx);
+    monitor_printf(mon, "    ring:  %d\n", e->avail->ring);
+    monitor_printf(mon, "  used:\n");
+    monitor_printf(mon, "    flags: %d\n", e->used->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->used->idx);
+
+    qapi_free_VirtioQueueElement(e);
+}
-- 
1.8.3.1


