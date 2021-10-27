Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E27A43C8FE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 13:56:41 +0200 (CEST)
Received: from localhost ([::1]:37476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfhXs-0002m8-Lv
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 07:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKs-0001RI-6N; Wed, 27 Oct 2021 07:43:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mfhKo-00072a-Dr; Wed, 27 Oct 2021 07:43:13 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RBgGBn013553; 
 Wed, 27 Oct 2021 11:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kfwqhX9OWBYs3eENysnrf2nl3OWZ3DYXgUqbge+DHE4=;
 b=hUvEXpdtQYp96T1DC3x/brR3uRjaZ4NTzpLy2qLQZYzMdWcywuWveOpzCgwEG9fBpldI
 xzPUbEoiXAYPjGllEpdWb14myzSeXtJlb24F6EpDD56MVjOJ0StJI52xDf72VZcZpXe0
 pwzVqJPB70QP2OyjSpDmaY5RkK4fhs5pwhRvYSjjGTYMHao+MUJsoFRTTyzTRgwkKzuv
 KfI1nFWc0lQJuXGT+H+5btu/bpfaaVLuf0Dy3Rehxvs7dtJtcQNTV5mo9LuhGZw/k5sE
 6Sa70j6XQlzAC6yYjlKxXUJn6TZJ17HVxsIgE8fxLi5zhBGA0JVRmuMg68sa0iLCut6Y aA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fyj9sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RBfw2o067645;
 Wed, 27 Oct 2021 11:42:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by userp3020.oracle.com with ESMTP id 3bx4gqx3rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 11:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1xlkpk21YR1ZdwDrRdAlIPX/fSefEozCsbZVWS5SWoOlTvWmgbNDl80IML/BvPNxkekHyvvJhlzH0LdeWd75VGcVHa0AH/aTdlve6qMlW+Nc/CDVyn8RqhySVGzS4VqXS5Y8Cjus0BZNcns+cbtaLEhQOtHuFAV2ZU9kJ7tvSAos1922eDPdleg0xzGJkg1qdmr86an6DetnkeVniw7+XnbEAWhLPAgj6VYOWlQPDpOz1E/EIXDC/QMPiJ/75pFserCGnDLrB5EhmcSzvsgXCyPoRhuwqQ4I7VND6iCk/P3uT0II+j0IMIAlgs/mlm6jkvzp/Ilr9nmrBr2ufH4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfwqhX9OWBYs3eENysnrf2nl3OWZ3DYXgUqbge+DHE4=;
 b=hzYsYy2NtItrsfC/dMoJs1v+VjpQ1ifVtkUiZbnIXQrng1/R5klIsRVfmv7SBNpNJ2AlyHPSpK60R/bbb+lLqwDJoispb4TUw+HojqYFQMBVqZSi8PgZGPVkVpsjDpCGagPey82xeRhL8u48t69Im5fE5GEh68OToUGNNtSohFhgQBLseijQmPuaoLa1Fn0clq4L2Rsp9sQeF4aGG9s/1Ot8wYnW6M1Tdl3VmLfhzoqfKkA4byl8V7ADijNPxgg5EpzLxlLCywY7GAqaRFdfRiXiLx/imQ6q9rvA0Kn8DEBRs+eiLqpBe+/SylHBL/sN4jID4i/a1ctQIOD3gIJInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfwqhX9OWBYs3eENysnrf2nl3OWZ3DYXgUqbge+DHE4=;
 b=qSvods8iiQ7xZE1jK567okq0hzZQVPap8qnwOG+NklER+FoXRCgDfmIv49xBJPJS7jRnM3sY249rfbt0Pbv7hvSJ6H223x36TXoh9Uz/AUSf2v868Bc9EJYFHhjVkhssvUl/fZKwdCAVJT4o4K32bab+iEsGvDk2O/rKOucdW7k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4744.namprd10.prod.outlook.com (2603:10b6:510:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 11:42:48 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%6]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 11:42:48 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 6/8] qmp: add QMP commands for virtio/vhost queue-status
Date: Wed, 27 Oct 2021 07:41:47 -0400
Message-Id: <1635334909-31614-7-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.40) by
 SJ0PR13CA0088.namprd13.prod.outlook.com (2603:10b6:a03:2c4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Wed, 27 Oct 2021 11:42:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 041c12f4-c97c-4519-8537-08d9993ee68a
X-MS-TrafficTypeDiagnostic: PH0PR10MB4744:
X-Microsoft-Antispam-PRVS: <PH0PR10MB47448B3A0B4ABFBE9CC18ADCE8859@PH0PR10MB4744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:206;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQkRz1NWnY9u6GyTy1zUZmwAahMAb7yucnsgNH78rhiad3CcFd6BWfVhA/ORXUzRWpRomo5Ng1KkAhzFxeEw9iUWmQtJ1gNeez17++KAAXlD96CqbQC3GfCeK3sS5NnDDcRDydu9+fICDOoVJSBRqZj5AnxGtDuCX7fKNE+NKY+Pk0QYIkEgprt5v9GMe7/NCpSW5LvD64R3SgOvN3SB2NkTxaDVGMFP1YxshxfzSCqJjDXADJJKHkPu3siZwsaSh080ENXaP/OBq1DTAV72xt53jO0YkaIxrtInNlzsoB7s2KyanNKHUvuILDn/pCDjFchq6QRVB7aOnI4li+Pgf8hS57qRO6ITZteFU2h3ty6DTQ10d957EbuWgon1+Nmk+hmufvvNeX9BcZvOTl9LgGZSMjezZRfevgEiOJBZ3xbknUzLwEeyfWQRi0SraZAbwPvLBqomrjfJyTiGEV8xywRU9vI5EaZYyW32bx08aUaqurY7yXjhh82IOmxAPPqQ8LU7HrErqu//Wjn95+uatfIjWp1ujkLYaVOh6jNXWPoxlLh+Clo1t4CnaVSZljyP7Jj2ea5SI3eqPzIxlpRMvK+YrDJaQXPl1cI8p4umJiu+zGYnlmSB8PZTAW9QFaXeWAaqUC+PqnNCXDLgpoqVb0frtiDMCApr0jU1JIp8qf40WAA07JnTuwidfOrtn8DM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(44832011)(26005)(4326008)(316002)(38350700002)(38100700002)(8936002)(6916009)(956004)(36756003)(2616005)(2906002)(30864003)(86362001)(7416002)(5660300002)(52116002)(508600001)(8676002)(186003)(66946007)(6486002)(7696005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?atD2GMKVAL39VuEXvmCIYKxke9z1PtBgnenYrsKtVrTmUZoZmDrKx3748cQx?=
 =?us-ascii?Q?FXtIiMHTMLtnYwhwxqzEDYQ7l4MaQrPd/8h3b8q7OV9bt8WGBEL/RnuzUV9a?=
 =?us-ascii?Q?3YvuW9MSH205dBNfgBF+gMG5XsH22wTTH/fOLzoo7OSyVw72aUvtErRlH+7K?=
 =?us-ascii?Q?YSdX+/7Ow3C4WC/LK1ZaciY8vw76NoFWgqlPqBW05EZBnMZCslnmUOHa37Uj?=
 =?us-ascii?Q?7VAwgYAylFCfBnOK7wbMshKnZtWWTb0EV+6nwO22Gi/ZbeEgX6YV8C+TnuYt?=
 =?us-ascii?Q?Z9lYAD1aOLdLWqw+2zfZWN3V5aC/Vk22/tZ/zM9RUlM/AHj21CMzFHAQCCvj?=
 =?us-ascii?Q?AAnNMhTNajPUajOtC9jZYZx61Ku/NOEG4xwi/thhSqkeWeR+tpQpNMZlr9qb?=
 =?us-ascii?Q?Uy04Zta68GnFjF59wQtoSaIIAe/JNDsOwSYmiFLjHsnpRemMYlu9ErAS88Ub?=
 =?us-ascii?Q?NIKh8pm2Juusy8DZWwraXR1lfDL/o3yHU+m1/ekQ6FeRzwcsNtOUIhK1AKEK?=
 =?us-ascii?Q?SmzkPQKl10wxoGvDEBUUZTA9JnoTUyaVwDR7DEk7E+f9nrSfp4Y8hxApxrSP?=
 =?us-ascii?Q?6KI1OA48sIac/ntZNMXaP9MeE4pJe/7fJ0uGNgFG+9QvRQPh2tM5/pkZFUNA?=
 =?us-ascii?Q?uUl2h81R0SuKVh2elzhwv0QFnK8keFc2B/pLaktjEvvGM4GvX/gucEJ7aU/I?=
 =?us-ascii?Q?hRuarobSio/cJhcgEH0HHLUd2M9LFn9fVUSueJOCbK37g/elWOgRxEuCOTUV?=
 =?us-ascii?Q?3qXVfWIDu6aLihvddpaa6eWQfdD761krD+o5fQH9EffE7RAFwvKxuC6+K1/N?=
 =?us-ascii?Q?DYaYn2OQJxSdcpnwB4FGRJbGzu8mU+qirIPtXR9ZGh8OwDxje3YOMIVMmuhT?=
 =?us-ascii?Q?7oL5tOGjUFqXAP2Z/MvgloWmoQ6FDiTkrRUeZqT4NGpSZFyen/kJvRIIrIEk?=
 =?us-ascii?Q?iUeCVzVYdH9PgVqsUJ4VvmXBGCWgUsZMk4nP9CVaCZCr/ZlBUY2h1LwJqWxx?=
 =?us-ascii?Q?xr0T0KnzBesV2d0YPnLi/09WY8gnGrcbOmrmOroTOeKqOs3FJnFntN3tRyz5?=
 =?us-ascii?Q?TxI3IewhUqpK0jwzYnXuxrxsZsNfulQm8XwWYDDHVot701xi8gf1DKq0NTzk?=
 =?us-ascii?Q?tWnxTx8Kc9E4Cj8oOTITqTpS5Om0XiVFPP8xj90sP45A1DblxNvwTysa0WFh?=
 =?us-ascii?Q?fRq2LVjX7pcwATIS2HxlAPLFnkomaTH7P1PDLQSD8TPZTc0OHrFmquklrxHR?=
 =?us-ascii?Q?H0ySpRGGZY8g1r6qYvk7lkWAMzSRZdlUI0jnwwJXaUjJi0jLRa1JCR6YYmzN?=
 =?us-ascii?Q?Io7ftoctRhbaPtjrWSlvRRNbAjdkeWKmyx3Ct8aAAVKXk/uLqZwBVxrbxC3p?=
 =?us-ascii?Q?VZY0toMyN1JuWj1nemXqN9mFRyhHAOaI8UKM4VzMsVLC6UxDvLswdk7BiqUY?=
 =?us-ascii?Q?AedWM0WVMf3dmErw15AiS0J+wveh7oyEV1+M4S2IJQ5TyBOZU5o0mxvm2cHN?=
 =?us-ascii?Q?e50d+vY+ZmCAMHl2TQA4GfzCiSRLE4Bq6viefzGSqypGIb24l5BbsnsfjywK?=
 =?us-ascii?Q?pAAkiNXS10X+91xteNPodRofIeyBW5ncKMkG7bmTGRFY5/lfvzQMl9KVdt0g?=
 =?us-ascii?Q?zEQV6uyLT24tpFk9OT9sVWs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041c12f4-c97c-4519-8537-08d9993ee68a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 11:42:48.5879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dh4kja23V3Euxpu4TWFjKq2SvO7ITSNXrD83C1mzBe9ROPG1YDI+JCY3BlkQ7eAtpYshzmcmv2zepLA2V1f5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4744
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270071
X-Proofpoint-GUID: voLZRcYvdpUKG3ReVLu96hZulFK8C4io
X-Proofpoint-ORIG-GUID: voLZRcYvdpUKG3ReVLu96hZulFK8C4io
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These new commands show the internal status of a VirtIODevice's
VirtQueue and a vhost device's vhost_virtqueue (if active).

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  14 +++
 hw/virtio/virtio.c      | 103 +++++++++++++++++++
 qapi/virtio.json        | 268 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 385 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index ddb592f..387803d 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -17,3 +17,17 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtVhostQueueStatus *qmp_x_debug_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
+
+VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5bac549..7fd98c5 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4284,6 +4284,109 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
     return status;
 }
 
+VirtVhostQueueStatus *qmp_x_debug_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtVhostQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (!vdev->vhost_started) {
+        error_setg(errp, "Error: vhost device has not started yet");
+        return NULL;
+    }
+
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+    if (queue < hdev->vq_index || queue >= hdev->vq_index + hdev->nvqs) {
+        error_setg(errp, "Invalid vhost virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtVhostQueueStatus, 1);
+    status->device_name = g_strdup(vdev->name);
+    status->kick = hdev->vqs[queue].kick;
+    status->call = hdev->vqs[queue].call;
+    status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
+    status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
+    status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
+    status->num = hdev->vqs[queue].num;
+    status->desc_phys = hdev->vqs[queue].desc_phys;
+    status->desc_size = hdev->vqs[queue].desc_size;
+    status->avail_phys = hdev->vqs[queue].avail_phys;
+    status->avail_size = hdev->vqs[queue].avail_size;
+    status->used_phys = hdev->vqs[queue].used_phys;
+    status->used_size = hdev->vqs[queue].used_size;
+
+    return status;
+}
+
+VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtQueueStatus, 1);
+    status->device_name = g_strdup(vdev->name);
+    status->queue_index = vdev->vq[queue].queue_index;
+    status->inuse = vdev->vq[queue].inuse;
+    status->vring_num = vdev->vq[queue].vring.num;
+    status->vring_num_default = vdev->vq[queue].vring.num_default;
+    status->vring_align = vdev->vq[queue].vring.align;
+    status->vring_desc = vdev->vq[queue].vring.desc;
+    status->vring_avail = vdev->vq[queue].vring.avail;
+    status->vring_used = vdev->vq[queue].vring.used;
+    status->used_idx = vdev->vq[queue].used_idx;
+    status->signalled_used = vdev->vq[queue].signalled_used;
+    status->signalled_used_valid = vdev->vq[queue].signalled_used_valid;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        /* check if vq index exists for vhost as well  */
+        if (queue >= hdev->vq_index && queue < hdev->vq_index + hdev->nvqs) {
+            status->has_last_avail_idx = true;
+
+            int vhost_vq_index =
+                hdev->vhost_ops->vhost_get_vq_index(hdev, queue);
+            struct vhost_vring_state state = {
+                .index = vhost_vq_index,
+            };
+
+            status->last_avail_idx =
+                hdev->vhost_ops->vhost_get_vring_base(hdev, &state);
+        }
+    } else {
+        status->has_shadow_avail_idx = true;
+        status->has_last_avail_idx = true;
+        status->last_avail_idx = vdev->vq[queue].last_avail_idx;
+        status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index c820001..7b67235 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -829,3 +829,271 @@
   'data': { 'path': 'str' },
   'returns': 'VirtioStatus'
 }
+
+##
+# @VirtQueueStatus:
+#
+# Information of a VirtIODevice VirtQueue, including most members of
+# VirtQueue data structure.
+#
+# @device-name: Name of the VirtIODevice which this VirtQueue belongs
+#               to
+#
+# @queue-index: VirtQueue queue_index
+#
+# @inuse: VirtQueue inuse
+#
+# @vring-num: VirtQueue vring.num
+#
+# @vring-num-default: VirtQueue vring.num_default
+#
+# @vring-align: VirtQueue vring.align
+#
+# @vring-desc: VirtQueue vring.desc (descriptor area)
+#
+# @vring-avail: VirtQueue vring.avail (driver area)
+#
+# @vring-used: VirtQueue vring.used (device area)
+#
+# @last-avail-idx: VirtQueue last_avail_idx or return of vhost_dev
+#                  vhost_get_vring_base (if vhost active)
+#
+# @shadow-avail-idx: VirtQueue shadow_avail_idx
+#
+# @used-idx: VirtQueue used_idx
+#
+# @signalled-used: VirtQueue signalled_used
+#
+# @signalled-used-valid: VirtQueue signalled_used_valid flag
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+    'data': {
+      'device-name': 'str',
+      'queue-index': 'uint16',
+      'inuse': 'uint32',
+      'vring-num': 'uint32',
+      'vring-num-default': 'uint32',
+      'vring-align': 'uint32',
+      'vring-desc': 'uint64',
+      'vring-avail': 'uint64',
+      'vring-used': 'uint64',
+      '*last-avail-idx': 'uint16',
+      '*shadow-avail-idx': 'uint16',
+      'used-idx': 'uint16',
+      'signalled-used': 'uint16',
+      'signalled-used-valid': 'bool'
+    }
+}
+
+##
+# @x-debug-virtio-queue-status:
+#
+# Return the status of a given VirtIODevice VirtQueue
+#
+# @path: VirtIO device canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# Returns: VirtQueueStatus of the VirtQueue
+#
+# Notes: last_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device
+#        and the VirtIODevice VirtQueue index (queue) does not
+#        exist for the corresponding vhost device vhost_virtqueue.
+#        Also, shadow_avail_idx will not be displayed in the case
+#        where the selected VirtIODevice has a running vhost device.
+#
+# Since: 6.2
+#
+# Examples:
+#
+# 1. Get VirtQueue status for virtio-vsock (vhost-vsock running)
+#
+# -> { "execute": "x-debug-virtio-queue-status",
+#      "arguments": {
+#          "path": "/machine/peripheral/vsock0/virtio-backend",
+#          "queue": 1
+#      }
+#    }
+# <- { "return": {
+#          "signalled-used": 0,
+#          "inuse": 0,
+#          "vring-align": 4096,
+#          "vring-desc": 5217370112,
+#          "signalled-used-valid": false,
+#          "vring-num-default": 128,
+#          "vring-avail": 5217372160,
+#          "queue-index": 1,
+#          "last-avail-idx": 0,
+#          "vring-used": 5217372480,
+#          "used-idx": 0,
+#          "device-name": "vhost-vsock",
+#          "vring-num": 128
+#      }
+#    }
+#
+# 2. Get VirtQueue status for virtio-serial (no vhost)
+#
+# -> { "execute": "x-debug-virtio-queue-status",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#          "queue": 20
+#       }
+#    }
+# <- { "return": {
+#          "signalled-used": 0,
+#          "inuse": 0,
+#          "vring-align": 4096,
+#          "vring-desc": 5182074880,
+#          "signalled-used-valid": false,
+#          "vring-num-default": 128,
+#          "vring-avail": 5182076928,
+#          "queue-index": 20,
+#          "last-avail-idx": 0,
+#          "vring-used": 5182077248,
+#          "used-idx": 0,
+#          "device-name": "virtio-serial",
+#          "shadow-avail-idx": 0,
+#          "vring-num": 128
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus'
+}
+
+##
+# @VirtVhostQueueStatus:
+#
+# Information of a vhost device vhost_virtqueue, including most members of
+# the vhost_dev vhost_virtqueue data structure.
+#
+# @device-name: Name of the VirtIODevice which this vhost_virtqueue
+#               belongs to
+#
+# @kick: vhost_virtqueue kick
+#
+# @call: vhost_virtqueue call
+#
+# @desc: vhost_virtqueue desc
+#
+# @avail: vhost_virtqueue avail
+#
+# @used: vhost_virtqueue used
+#
+# @num: vhost_virtqueue num
+#
+# @desc-phys: vhost_virtqueue desc_phys (descriptor area physical
+#             address)
+#
+# @desc-size: vhost_virtqueue desc_size (descriptor size)
+#
+# @avail-phys: vhost_virtqueue avail_phys (driver area physical
+#              address)
+#
+# @avail-size: vhost_virtqueue avail_size
+#
+# @used-phys: vhost_virtqueue used_phys (device area physical address)
+#
+# @used-size: vhost_virtqueue used_size
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtVhostQueueStatus',
+    'data': {
+      'device-name': 'str',
+      'kick': 'int',
+      'call': 'int',
+      'desc': 'uint64',
+      'avail': 'uint64',
+      'used': 'uint64',
+      'num': 'int',
+      'desc-phys': 'uint64',
+      'desc-size': 'uint32',
+      'avail-phys': 'uint64',
+      'avail-size': 'uint32',
+      'used-phys': 'uint64',
+      'used-size': 'uint32'
+    }
+}
+
+##
+# @x-debug-virtio-vhost-queue-status:
+#
+# Return information of a given vhost device vhost_virtqueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: vhost_virtqueue index to examine
+#
+# Returns: VirtVhostQueueStatus of the vhost_virtqueue
+#
+# Since: 6.2
+#
+# Examples:
+#
+# 1. Get vhost_virtqueue status for vhost-crypto
+#
+# -> { "execute": "x-debug-virtio-vhost-queue-status",
+#      "arguments": {
+#          "path": "/machine/peripheral/crypto0/virtio-backend",
+#          "queue": 0
+#      }
+#    }
+# <- { "return": {
+#          "avail-phys": 5216124928,
+#          "used-phys": 5216127040,
+#          "avail-size": 2054,
+#          "desc-size": 16384,
+#          "used-size": 8198,
+#          "desc": 140141447430144,
+#          "num": 1024,
+#          "device-name": "virtio-crypto",
+#          "call": 0,
+#          "avail": 140141447446528,
+#          "desc-phys": 5216108544,
+#          "used": 140141447448640,
+#          "kick": 0
+#      }
+#    }
+#
+# 2. Get vhost_virtqueue status for vhost-vsock
+#
+# -> { "execute": "x-debug-virtio-vhost-queue-status",
+#      "arguments": {
+#          "path": "/machine/peripheral/vsock0/virtio-backend",
+#          "queue": 0
+#      }
+#    }
+# <- { "return": {
+#          "avail-phys": 5182261248,
+#          "used-phys": 5182261568,
+#          "avail-size": 262,
+#          "desc-size": 2048,
+#          "used-size": 1030,
+#          "desc": 140141413580800,
+#          "num": 128,
+#          "device-name": "vhost-vsock",
+#          "call": 0,
+#          "avail": 140141413582848,
+#          "desc-phys": 5182259200,
+#          "used": 140141413583168,
+#          "kick": 0
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-vhost-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtVhostQueueStatus'
+}
-- 
1.8.3.1


