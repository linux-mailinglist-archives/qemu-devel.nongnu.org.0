Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCE258FD02
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:03:06 +0200 (CEST)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7q3-0005cd-QN
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7HC-0002dZ-Or; Thu, 11 Aug 2022 08:27:02 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:60966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7HA-0002Xk-BD; Thu, 11 Aug 2022 08:27:02 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BCMwd1007994;
 Thu, 11 Aug 2022 12:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2022-7-12;
 bh=ICqDxdBHBzczb5LL1j7e+UR/tPOA3oOeU5rbzAZcRv0=;
 b=CwQtE05Es7NlgukfB5ynO4Ae6Dliu57H51yl63N7pxJq0AiLGzA7vjhr/YQhaNWc76It
 MVQByi5c+H2NFrZDJx4Ixo0iNmoyvOCIVbXQn6O0gGhKrgbtbdq2s5XTOV0gx1Pbdc+2
 nu4IJ4lPgrQh/lfYaA9Oez2VmmW0BBkWoTFhgesQnThV2a/S0eFXGQMdF3XXAlxrncTu
 pqpsJm4XrXS9YFgUbwEv0tdXx2uz1NbVW5GGgayhG2qWjSdksFxR7f+AXHvlrHPy1uwT
 14KswR2tGnY22O97MgHnmfm6AzAz/07/WNQxtFudz11as17M7QurUv6Hg31HK7ClmXGH FA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqj4fug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:46 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27B9AthN005040; Thu, 11 Aug 2022 12:26:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqjk2qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpfDjcrRJKRQzjQMQUUagiEXi/yLaLBnBPcieZYTMfQEQWz9pzieSAWPGgd+qs+YuK8onPu4UAAFA5SG3NrLAHfsZX6DibExNv8cTqWEH1Oely71gSQ9EvmGNAp+s6aK9QHd1to/mRkUmR/BwxmUQE9ZMfqH6T7cxsLGQ3sNCS/biyGwKWkFetr+P14s32QTB0OWI1cVrj9OMKaAFaUEbvp697LuFQBLBwYG7ZgvnKHxDAO1iCLyzvyunWsq+H4j77rmOzkbz86ujhUOlkk6VTlXXfrI8yg4IwW73uzovE/IJTSV0UTqwjFmiKoZKwQOl/nYr/hODEhGgO52hsdo5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICqDxdBHBzczb5LL1j7e+UR/tPOA3oOeU5rbzAZcRv0=;
 b=kxX+8mXQ2rfLl9FZiGQAWqot81jS3p9fJILzm6ROCYa71wwORpsCOOZGYCKOyJGDsmyVWeqKOLhKVHMUZKWhN6TfePshaTDx2kR1SG3SUtB5MYTVMYB0NJ7p1apUZ0z09blHl+JO/vZfntxOlGlv6sn9eUxnNH7PbccJWLVlP2T6MepTtqjizAnpPb12CwN1cKBascrgJyIXpgF12taGF8A8W3r5WLE2SyRDkX6XFqRwinHWJM8SBjBkkmH63JMxnY/Flt3iyiCz+DM0iv2DwzRHXxtnI7qEyoYtgrfwgWpHg5OAuYuuWmGJmLggapsWcqWRbgNXH4c7QULO4zzMyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICqDxdBHBzczb5LL1j7e+UR/tPOA3oOeU5rbzAZcRv0=;
 b=MKwZn91iRE6nxhRTCtYyBBRqsq0KFJbTmWWM+//LRTrqmFOVvT3pL1gcU1SdjtbdTd0oijFZTL8uf0mYcBD5vr0YOju+zmdP++u9cQb8O90RyieV9v+zPHkJJ/vUMdEnTfpxoYsAIAlYD8Cq1mCjVeqci2gymJu9eoKWv2Q3g/0=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM5PR10MB1770.namprd10.prod.outlook.com (2603:10b6:4:c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Thu, 11 Aug 2022 12:26:42 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789%9]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 12:26:42 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com,
 lvivier@redhat.com, thuth@redhat.com, michael.roth@amd.com,
 groug@kaod.org, dgilbert@redhat.com, eric.auger@redhat.com,
 stefanha@redhat.com, boris.ostrovsky@oracle.com, kwolf@redhat.com,
 mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Subject: [PATCH v15 4/6] qmp: add QMP commands for virtio/vhost queue-status
Date: Thu, 11 Aug 2022 08:24:42 -0400
Message-Id: <1660220684-24909-5-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:5:333::10) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2ad972f-0b1a-4391-80a9-08da7b94bf36
X-MS-TrafficTypeDiagnostic: DM5PR10MB1770:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SIG5hP2FN3sH2RfuDcJGdN0WqRkCidStUVh9Qjq69TbbJ21Q2wvr4T0rOexgo0YPm0f1IMAMPeRaDJFbmvj7POSMxuC2yZSWfo/fGp0+3ufEbegv2jf+zlDC9Ayo5CTqlPaoCFJmrmaZJYVOSrvfEt3SGmEQAwPChmFJz3z901nX+44IPJgpbwPnNwJiMVpXvdKnyz6DLU+Pny0m+EUjcdZYp6/TyKFRiJas8mtYkdzYwZAPiJWFKceghKzBSQQJoTlF2F+AAJKwum6ew5hTQ/pUWeQw+wSP1kOqcVeRwuiteYDe7rtnYcQ+YXq2KC9pPEMuKjgHcLF3LU4FuuyY7ogSB4Rr6/z3Wjfl4kYg+myYwnTTKzQau7ewj3xEvaW/S90Y95kUgIxPBzU4eDvEiiETNhX7cxonSaMbALYjBvk+q2CwUpymnhuUQ489O725S0RievGkpHeicFppyff872eoAzQj/T5JCucs0NcyQzUJXx7LShYaP8acXAILFs0q/fvAqSz4XoDTL8nsYSnXQuY6ivZPmKh4Cd04PzdjGnU60jZ/eq12x1Hcf2rTuw3g90mWzlzBv7AfJGK6PpuSkQLqTFD85yEzRsbPjEawrULKWZ5eeVRwAoPC2veVQ9h6iHtgUeJBET7L6DW6gNx+eGOoLaxKLfNPcwYRZLGg2KrpVgSxm2nOaGraD2yIOnJggtcxJCe7EHTBEf6LNjMsf6VzlnEnLHB9O4P7BHPM8AsCz93y81s1/hW1V8M+cu8+0o51FYpjAG42aJv1v72TXMXe9uLGonk9vBBaPqn2uKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(366004)(396003)(39860400002)(6916009)(8936002)(2906002)(186003)(7416002)(44832011)(316002)(30864003)(66556008)(8676002)(4326008)(2616005)(66476007)(5660300002)(66946007)(478600001)(38100700002)(6486002)(38350700002)(36756003)(41300700001)(26005)(6512007)(86362001)(6506007)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RnZZ4OSNJjePBWO3JFDOt1gAXyjRYj51kOsmkOeLALMRuw5aVN30Vn2pyoLi?=
 =?us-ascii?Q?qfCKBruVlfBYTf9A3Y3+fJ4+YzQVXGrhe0is3SdpMDeMl16VXeAGEwM/njBx?=
 =?us-ascii?Q?lwGHTj04UsNO9CftiYn2bTs3W5H1umNWNGy1b/ZgOdZ8wF6nXfqIu9KttSwF?=
 =?us-ascii?Q?s0YMJJM5MbrrbmlTq+HIdCujz4E4UUpc4aOq+aXZ6NHI8P6IVbHji++PuXEi?=
 =?us-ascii?Q?M5FP2RE3oiBX2+ir3kgktoyGnUfed3yV26MyVtgRTir03Mpw1l16QOR+UQlj?=
 =?us-ascii?Q?Sb9Pz86/CjFwZL93dE/aZBvQKo1kLdpLDQQyydt5xIeT1thaw7CDUAXH+m/E?=
 =?us-ascii?Q?p3XXkqgp6kBuof2WSHqMros3d02MfnyoTRk63G9eK1XI+ps0mFM+HJOjndGN?=
 =?us-ascii?Q?jHB9k5lDGbx3VdE+RhWVV5dcnjXLEnnObycuLA+K4riXi4IsUP/hz64QWYpN?=
 =?us-ascii?Q?DXhIZcLWiG3IHUt5Shqoq1UWNo7WZKJHkqmGZm3k5HrpzgPjuyUCdZL7W1AE?=
 =?us-ascii?Q?zi8j84wyS0eaN2s8f2VVSUGA2gaWKL97YLpOCRMM0B63KD9VBlXLzSlh11Tf?=
 =?us-ascii?Q?eCqyoAc0KNccSeI5SPYzyN5UW9tdtN4hVAZ7HeVn8eJove+Okgs3LounoNOO?=
 =?us-ascii?Q?yClJoISgHGGrCrsMkthwJiymmjvqGa8Ytr5lWKkKrg01dcclqj3PtVPTv2qV?=
 =?us-ascii?Q?4cICTVaRxDPjjQgQEdwWSI8N9TwSF7GyLBMbGCRUR57LrQI1DKVf1el/fww2?=
 =?us-ascii?Q?rxuH347uPPp2v+pEs/YRysprO+j3BFjoJyR/5CTu68ZnRQag4/3YYP/+wy2Q?=
 =?us-ascii?Q?V7E7sKnVI4iW1L+2bLoIgjnLo6GFlMFpoy6RGAEBHwkbKpGtZpWTL/IiJYos?=
 =?us-ascii?Q?DsMF+0qlq7nQlC+WljMMrTL20W4U8aA3Q39/SIau66bc80dbxu8wWvtZAYmD?=
 =?us-ascii?Q?zWG4I/2QEo2w109686LPVuvbWpkVxgT3JvPIRbFsYgE1hsXblb+IcnquRwHT?=
 =?us-ascii?Q?qOMxsxDSmJUf5M1qDHbjj7h7rTYhtpHcvcHyrghS4yfJzwzHGijuwYaBb6qd?=
 =?us-ascii?Q?qlVqlhufn5u1RKsL8lfuqad6brUEXUrGx1eOpptSdpyrK2g1SnbopsJZzNkT?=
 =?us-ascii?Q?1up0rqZOQeL58EG8PEx8nXqolS37fJLdH3HOgm53S/BB6QUXTeh5ehJ3R9JN?=
 =?us-ascii?Q?XK7k1D6awdWPbVaUUTGs2QxXCHpgaJli6RU8NPzCMUsbDNDyhbVC0vORmHj8?=
 =?us-ascii?Q?uc25+agAbcftPnWMYm2ef/XKhTpNlfpWCgcRd06Ze55V+dl3nPpWzCqoxk3z?=
 =?us-ascii?Q?umotuDUaP33V2j3II6seIXZ/hR2Vw7K4VmEfT5G3RihCMs71pCFo1xTlrPzI?=
 =?us-ascii?Q?FbvEuTiauASkE1BYwJxwcv2qZu+hmSVUrRrbj4DL+GzNOXNP/Z4ivKIo/gIx?=
 =?us-ascii?Q?JfWKG2GRVt7FzurA6e1sHNy/tnJkxpIGfPDyZEyQEAYi6ZUD3ySl1DF/6clZ?=
 =?us-ascii?Q?DS9zHVWgFhWLVwxn5p2zHIy+PDRGBvAGGZkhCEdZ76eOzqxOMVTrKDxfN9RY?=
 =?us-ascii?Q?ztZqxiyLxm8nPqRgAauvhZZ3XQWO2YhMBmg1QKg9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ad972f-0b1a-4391-80a9-08da7b94bf36
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:26:42.1617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDpoTKJNeN5CYdDYECEy98H8TE1aPdH+gPT3FuMjNiktCr/ON83RSM4fZ5L/CGrKX+Cj1L8HEsd24gzYyNf0iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1770
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110038
X-Proofpoint-ORIG-GUID: 9C8X689G7uO9imfoxttY7XkrF_9EqADN
X-Proofpoint-GUID: 9C8X689G7uO9imfoxttY7XkrF_9EqADN
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Laurent Vivier <lvivier@redhat.com>

These new commands show the internal status of a VirtIODevice's
VirtQueue and a vhost device's vhost_virtqueue (if active).

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  14 +++
 hw/virtio/virtio.c      | 103 ++++++++++++++++
 qapi/virtio.json        | 256 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 373 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 0b432e8de7..13e5f93652 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -17,3 +17,17 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 23bdc77a95..dc73b82b38 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4670,6 +4670,109 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     return status;
 }
 
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
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
+    status->name = g_strdup(vdev->name);
+    status->kick = hdev->vqs[queue].kick;
+    status->call = hdev->vqs[queue].call;
+    status->desc = (uintptr_t)hdev->vqs[queue].desc;
+    status->avail = (uintptr_t)hdev->vqs[queue].avail;
+    status->used = (uintptr_t)hdev->vqs[queue].used;
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
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
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
+    status->name = g_strdup(vdev->name);
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
index c9c8201e66..d9050f3584 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -499,3 +499,259 @@
   'data': { 'transports': [ 'str' ],
             '*dev-features': [ 'str' ],
             '*unknown-dev-features': 'uint64' } }
+
+##
+# @VirtQueueStatus:
+#
+# Information of a VirtIODevice VirtQueue, including most members of
+# the VirtQueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this VirtQueue
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
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+  'data': { 'name': 'str',
+            'queue-index': 'uint16',
+            'inuse': 'uint32',
+            'vring-num': 'uint32',
+            'vring-num-default': 'uint32',
+            'vring-align': 'uint32',
+            'vring-desc': 'uint64',
+            'vring-avail': 'uint64',
+            'vring-used': 'uint64',
+            '*last-avail-idx': 'uint16',
+            '*shadow-avail-idx': 'uint16',
+            'used-idx': 'uint16',
+            'signalled-used': 'uint16',
+            'signalled-used-valid': 'bool' } }
+
+##
+# @x-query-virtio-queue-status:
+#
+# Return the status of a given VirtIODevice's VirtQueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtQueueStatus of the VirtQueue
+#
+# Notes: last_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device and
+#        the VirtIODevice VirtQueue index (queue) does not exist for
+#        the corresponding vhost device vhost_virtqueue. Also,
+#        shadow_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device.
+#
+# Since: 7.1
+#
+# Examples:
+#
+# 1. Get VirtQueueStatus for virtio-vsock (vhost-vsock running)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#          "signalled-used": 0,
+#          "inuse": 0,
+#          "name": "vhost-vsock",
+#          "vring-align": 4096,
+#          "vring-desc": 5217370112,
+#          "signalled-used-valid": false,
+#          "vring-num-default": 128,
+#          "vring-avail": 5217372160,
+#          "queue-index": 1,
+#          "last-avail-idx": 0,
+#          "vring-used": 5217372480,
+#          "used-idx": 0,
+#          "vring-num": 128
+#      }
+#    }
+#
+# 2. Get VirtQueueStatus for virtio-serial (no vhost)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#                     "queue": 20 }
+#    }
+# <- { "return": {
+#          "signalled-used": 0,
+#          "inuse": 0,
+#          "name": "virtio-serial",
+#          "vring-align": 4096,
+#          "vring-desc": 5182074880,
+#          "signalled-used-valid": false,
+#          "vring-num-default": 128,
+#          "vring-avail": 5182076928,
+#          "queue-index": 20,
+#          "last-avail-idx": 0,
+#          "vring-used": 5182077248,
+#          "used-idx": 0,
+#          "shadow-avail-idx": 0,
+#          "vring-num": 128
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus',
+  'features': [ 'unstable' ] }
+
+##
+# @VirtVhostQueueStatus:
+#
+# Information of a vhost device's vhost_virtqueue, including most
+# members of the vhost_dev vhost_virtqueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this vhost_virtqueue
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
+# @desc-phys: vhost_virtqueue desc_phys (descriptor area phys. addr.)
+#
+# @desc-size: vhost_virtqueue desc_size
+#
+# @avail-phys: vhost_virtqueue avail_phys (driver area phys. addr.)
+#
+# @avail-size: vhost_virtqueue avail_size
+#
+# @used-phys: vhost_virtqueue used_phys (device area phys. addr.)
+#
+# @used-size: vhost_virtqueue used_size
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtVhostQueueStatus',
+  'data': { 'name': 'str',
+            'kick': 'int',
+            'call': 'int',
+            'desc': 'uint64',
+            'avail': 'uint64',
+            'used': 'uint64',
+            'num': 'int',
+            'desc-phys': 'uint64',
+            'desc-size': 'uint32',
+            'avail-phys': 'uint64',
+            'avail-size': 'uint32',
+            'used-phys': 'uint64',
+            'used-size': 'uint32' } }
+
+##
+# @x-query-virtio-vhost-queue-status:
+#
+# Return information of a given vhost device's vhost_virtqueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: vhost_virtqueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtVhostQueueStatus of the vhost_virtqueue
+#
+# Since: 7.1
+#
+# Examples:
+#
+# 1. Get vhost_virtqueue status for vhost-crypto
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#          "avail-phys": 5216124928,
+#          "name": "virtio-crypto",
+#          "used-phys": 5216127040,
+#          "avail-size": 2054,
+#          "desc-size": 16384,
+#          "used-size": 8198,
+#          "desc": 140141447430144,
+#          "num": 1024,
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
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#          "avail-phys": 5182261248,
+#          "name": "vhost-vsock",
+#          "used-phys": 5182261568,
+#          "avail-size": 262,
+#          "desc-size": 2048,
+#          "used-size": 1030,
+#          "desc": 140141413580800,
+#          "num": 128,
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
+{ 'command': 'x-query-virtio-vhost-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtVhostQueueStatus',
+  'features': [ 'unstable' ] }
-- 
2.31.1


