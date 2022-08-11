Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8560258FCDF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:54:06 +0200 (CEST)
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7hN-0002eY-JB
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7H2-0002Cn-FF; Thu, 11 Aug 2022 08:26:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7Gz-0002WV-Gw; Thu, 11 Aug 2022 08:26:52 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BCNBxF009377;
 Thu, 11 Aug 2022 12:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2022-7-12;
 bh=ltmkdgwklAJjdo/AcRs6lKIt0h6tLjJw0RRzBD/K5NU=;
 b=r2Lpc8/MzAFIIifIohHjqcMSzH2HeNzxELnwdscXjUg2lNQvtQrkEY9SFKLgvEKV9MgR
 +hV/5fNbpe1DootzxfoVN798soRLMwV9kZOzaeAZcOPpLZ4o4JsklI6i2+4RQa84lU0W
 EDgCYLls1ElNlA68ZNjOG4WYk+lfTmGnD5B/BcGPkVxdCQg422gg3k/VHetjadBmD3dY
 B/dHfHzUl4YU7bcx57aaJoHVgDtSznex76utPLm050GB1lDZt4z2oKPNXkgGZ9LHm0f6
 CvKWbsfN5RXe3ocTtLt2c4CBycAUEvDbJKmzoLH/Qse4B06eyrI23pJUjVR+rr7FgtLr mw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqgmecr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:34 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27B9KXjx004979; Thu, 11 Aug 2022 12:26:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqjk2kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrNYbXtnfZbQ4PUEuQdXI/+UPlpzrT7swBOCXb+qBYECCnF2uuVTdmimucHcnZCLssucIlhA+XLPodYtOhjuKEpji5LZrQ0DV2N+QuI2bJWD42eSfbM6rOloMje0iuJSdlpDthGVLcWx/QdEF1hL7LhagkdAdAccul4yHBP8K31olPKnjbmLiI1a1q+FC9vzbIsOtvetXNhfcrbW8GZ/iSKjqgC/UEd9xppQLyEg+N5xpN6UovKh9kd8uZlEYFQR8IlrAOjThAc/RVy6OZQ6srRY279LhTdrO684h/1EgvdgmyuewDg/odKocIUN20CXE+4EXxhPBdvfguJDhwHRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltmkdgwklAJjdo/AcRs6lKIt0h6tLjJw0RRzBD/K5NU=;
 b=MEJ4kt/rJlkXXXiTZcuozQ86uELoPhH48Cw50jxkjbX6Qy+NpEwG7bDgE2nyfk0vHY7zwwgiinW7QGxSEO0LTtN/9G5PoJQiH7MKSqK9/5cC62hyEQvb6p4eR1Xvc7z9Fsoj+q9cv1IsEGNcU5dlBaSCOYTCNuoSpRtw1la+fUD08Xz3bavNj/+jTcCIG7Xrtr5hIBjHibHr2zt6QpXUnGFsvbH6kvPNJskclh/BcQtAaQ926v0Lg6jaRCTABRHrsNuo4MzsOVsYLnOtrzcCqGrPK8wHW+iQirhiOXoGPU4emCrUMLI84cO9SXj8qTu7KJu/w2qImHSsRLvNzIe5Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltmkdgwklAJjdo/AcRs6lKIt0h6tLjJw0RRzBD/K5NU=;
 b=k7+tTZbbeq6YgzFYjr9ez+5nTUdkjP1/gxkYJgymMRhooRAf1W0/s1Cua5OQnbBLBBMXna2Re0hFxCXIxIbIlqQFpaHcPy0UNDd8l+QeEaX9AAUbFLB76HC2D/Z3R8Rc5Jjz4nP9UYTSL4VrkmYvRsEUJ6OhAaQw7gXuAF9V/gg=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM5PR10MB1770.namprd10.prod.outlook.com (2603:10b6:4:c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Thu, 11 Aug 2022 12:26:30 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789%9]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 12:26:29 +0000
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
Subject: [PATCH v15 2/6] qmp: add QMP command x-query-virtio-status
Date: Thu, 11 Aug 2022 08:24:40 -0400
Message-Id: <1660220684-24909-3-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:5:333::10) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d54d753d-bdaf-4e63-a062-08da7b94b77f
X-MS-TrafficTypeDiagnostic: DM5PR10MB1770:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j5fIhjV2Rjju74c8DruwNT9nVmH+8KgBDFLHMQMwEm+HRMNzcjzktsfYtzRGjoWhuzJ2zpXRTBzP5Cb+AvXKxz9TwTK0cCjssqyc7XSVqiLfZ+Gq58QNk09vNeguhc1mFmscDNHYNKh9fzm3YJjsMFbmWHZ4IVqpBY4MvOis+/lDH4idXaG26WwJor5rV9HL0/EqPdLAzTCMv4r7+rlS5GdICumuBrr5DWqxE+LJtDDNF2kZ0+5X8hPoFLFZ6I4PPo+xc2KOEFlMgij79jzCmHJrxxhMQ0xgHIEzrZEWt4AI1MMdFHfSvZJ1Bl6X1ffujnWNhko47XnnQS9Styy3c51w2kxDVFSbJZ3Lzq/+uQ+V/YPonlZHVzC8iawTFh+JtAYZeAvJNUXUH8Z07NOey/6eTfdQlvZIaJYnoG1irHdB8x86WZc3Bm7AnyUJKmqWPN9gDzDIVtxJ5fSsBHKEGgVjVAWCrRMv+gz8PzhlpAft2617le1kYXsrcM3fsc/GmK0tiqiEjq4HSrphhIXq5Ox7GZfJ0WKSmQlQd8+ot9lNgBh8IX+v8z9zcIBfqCfZPsensl5mMW2bFOiEmxuOvQhBkcNnKbkNmmfyQcJkpuX5yU0Y3gdqD2PYn4AHDV5u2ifW5JdOQ3t8RYO1IoweFayvByIqW0u2Owm8nhkMTuGGqtClteELh5osWbkYjhNgFeSpl6Riat5v6fG9o6yceidPfSbY2WXMR8724wp5XJ9W7e8ht9by9o3wG3yyKVi41a9YQuh2Z06GCUVbqo78Fwk0cLuEDf1IBOfrF2hYWaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(366004)(396003)(39860400002)(6916009)(8936002)(2906002)(186003)(7416002)(44832011)(316002)(30864003)(66556008)(8676002)(4326008)(2616005)(66476007)(5660300002)(66946007)(478600001)(38100700002)(6486002)(6666004)(38350700002)(36756003)(41300700001)(26005)(6512007)(86362001)(6506007)(52116002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgH0uupqTDUHBCY1CljOIF53LvDgmAo5IB3162Z9fNc3r90X8NhFDWfJo0YB?=
 =?us-ascii?Q?aliaR4E8yVcDiVYR1H05a7/n2YndQn1hdn1puRNW1+sUamFpjbHTaQ2WBlsC?=
 =?us-ascii?Q?YApQUbw2VfcoRSVLOixpRMFafXcYwOd4Gunw1eWHXH9BYmOOIkSH1GZHQAjB?=
 =?us-ascii?Q?/35zG8rxMAd0vpEy+8PK2ia2zaDxpGze26rnBA4zmXqDMJDqmoQTCHXKymAC?=
 =?us-ascii?Q?KcD0M16z80rrt8bh1czWU/8nFPDtPacZuP80klCscl4MJ4RWWj+UTEp4dA7P?=
 =?us-ascii?Q?3Mms2JQSzOnh5BsAlnTnez5mqgrDlwNdQZFvhw0qyyu5Yj8y5MPxj4V3NeoG?=
 =?us-ascii?Q?2Hfa49wlwBdMGd6W2BWURlGKKRD/V77gbTj9n7GKHI5vBOSxdOcv6TVXxjlE?=
 =?us-ascii?Q?seiTlZChmZwvaYyk9HIfT4zqlb0uqRu8zkSOXVjudpLmR5tgvEVPuY3w9oZT?=
 =?us-ascii?Q?o94MU0BEcHNG1LT5RFzAy1iVZiaoQB76iUcBzBIgKf8NZ6gGRLa5zaVC/f9T?=
 =?us-ascii?Q?kTui1xjpsLpnObD/PzD7JA2jCMKzfZ31gd/zpxFqTwiXaQUXaWSFxGsEpdf3?=
 =?us-ascii?Q?oPnVCXoSd64G2EFGCkcSvR0cDoMsWpbhRfIZ2xmbbrsjudTl5EQXP3105McT?=
 =?us-ascii?Q?HBOPbtvgSJ0UH7Z4Qx7UXZ/iVjwu5+N+DapVm7bF0b1QpFx4XES3sHcXRjgP?=
 =?us-ascii?Q?l6rohT6Bw0mOh1EbuKVqf+PplVD6VPrMcC5k8RWZs6Tl09VwkrTFhrlNkMZe?=
 =?us-ascii?Q?PE6EaDRywYDUSFQGU+ypiY+u/9nxyXDWztL0cRial5f74eBDP+vY5lgUAw2x?=
 =?us-ascii?Q?OkIGQMwh92eamzC0vgjcprJBy1mpoZcfupsy54kSjEg3OhuSg6/9lmFHa2PT?=
 =?us-ascii?Q?pMzxRKtS9R2N1nZorFafEFElzZTLvlKFeKqPOU71YO2TywnlnhGVsxMDdhlA?=
 =?us-ascii?Q?DBbYC/Pc7GqfkAoxE+cq0mln1zsjNyTBIUPpA3GrQVi/yVnc0bNSQpbgZHhR?=
 =?us-ascii?Q?vIXrBJImJWC8+dcXUq5wWuJEW5XVG3VtjibT1wwLO1K/kQS7urnu/ax0SEH9?=
 =?us-ascii?Q?HB5kR8pITSVzMrnhSn1X/wji/VNDhf5iTTvCbCdi1IeLbpBXJXYDiY0pzWpq?=
 =?us-ascii?Q?+fbJxwmXR9Lse+J5sQDPyPFIc6ClBkrUCNcC535eT+lqgUsaRyJ/IxWrEwiV?=
 =?us-ascii?Q?tpyZwmvA93YIWvksRWM6fb1cZA3lUPQukU2n9P5syUN9YJRz1iRmu6ribEyL?=
 =?us-ascii?Q?KJAq7TfjgwE6Yl4UwZ0jKNjeeN0pFmXVRQ3+M5RF4Apm5dzU8r4Rff2mdaJZ?=
 =?us-ascii?Q?Y3pcBRIdqEtt2xYWBncmcXtiZcSp6V+XXh2Rz9d1SmBheFf+c5iGumLAIAST?=
 =?us-ascii?Q?yeuzj1eiqbsESjRlO0lZEAB7/oMnZ2IJu8um9kC5XroHTJLSW2J0IkSbYaov?=
 =?us-ascii?Q?dMmI/EH4Y/regIoIDwWUgSp44/R+bW5/3rK3Y5XQCOjrf0JSCh5UwPusxp+H?=
 =?us-ascii?Q?crvmyehmfKbJhiuL0p4bcK+9mFH6vogxBZOTZnimKi5q+wLddynKPN5PmeDa?=
 =?us-ascii?Q?PJvGiwqCCpu2qAxpga21hH7ArbSO0J5YJ128WByH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54d753d-bdaf-4e63-a062-08da7b94b77f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:26:29.2348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7edCI4/t4bRIP1OA5jC0aqFKgEKX18lCAnhI9u8svL3nsnqlaGvu+VT1Io2kmMP6FZ/6/dfZYiKiIXNfG5b+8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1770
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110038
X-Proofpoint-GUID: t-L5PNBxpk-6XC2UxAMCexA6w9423EX0
X-Proofpoint-ORIG-GUID: t-L5PNBxpk-6XC2UxAMCexA6w9423EX0
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

This new command shows the status of a VirtIODevice, including
its corresponding vhost device's status (if active).

Next patch will improve output by decoding feature bits, including
vhost device's feature bits (backend, protocol, acked, and features).
Also will decode status bits of a VirtIODevice.

[Jonah: From patch v12; added a check to @virtio_device_find to ensure
 synchronicity between @virtio_list and the devices in the QOM
 composition tree.]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   5 +
 hw/virtio/virtio.c      | 104 +++++++++++++++++++
 qapi/virtio.json        | 222 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 331 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 05a81edc92..0b432e8de7 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -12,3 +12,8 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index bdfa82e9c0..3e0a484660 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3939,6 +3939,110 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
     return list;
 }
 
+static VirtIODevice *virtio_device_find(const char *path)
+{
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+
+        if (strcmp(dev->canonical_path, path) != 0) {
+            continue;
+        }
+
+        Error *err = NULL;
+        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
+        if (err == NULL) {
+            GString *is_realized = qobject_to_json_pretty(obj, true);
+            /* virtio device is NOT realized, remove it from list */
+            if (!strncmp(is_realized->str, "false", 4)) {
+                g_string_free(is_realized, true);
+                qobject_unref(obj);
+                QTAILQ_REMOVE(&virtio_list, vdev, next);
+                return NULL;
+            }
+            g_string_free(is_realized, true);
+        } else {
+            /* virtio device doesn't exist in QOM tree */
+            QTAILQ_REMOVE(&virtio_list, vdev, next);
+            qobject_unref(obj);
+            return NULL;
+        }
+        /* device exists in QOM tree & is realized */
+        qobject_unref(obj);
+        return vdev;
+    }
+    return NULL;
+}
+
+VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtioStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    status = g_new0(VirtioStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->device_id = vdev->device_id;
+    status->vhost_started = vdev->vhost_started;
+    status->guest_features = vdev->guest_features;
+    status->host_features = vdev->host_features;
+    status->backend_features = vdev->backend_features;
+
+    switch (vdev->device_endian) {
+    case VIRTIO_DEVICE_ENDIAN_LITTLE:
+        status->device_endian = g_strdup("little");
+        break;
+    case VIRTIO_DEVICE_ENDIAN_BIG:
+        status->device_endian = g_strdup("big");
+        break;
+    default:
+        status->device_endian = g_strdup("unknown");
+        break;
+    }
+
+    status->num_vqs = virtio_get_num_queues(vdev);
+    status->status = vdev->status;
+    status->isr = vdev->isr;
+    status->queue_sel = vdev->queue_sel;
+    status->vm_running = vdev->vm_running;
+    status->broken = vdev->broken;
+    status->disabled = vdev->disabled;
+    status->use_started = vdev->use_started;
+    status->started = vdev->started;
+    status->start_on_kick = vdev->start_on_kick;
+    status->disable_legacy_check = vdev->disable_legacy_check;
+    status->bus_name = g_strdup(vdev->bus_name);
+    status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
+    status->has_vhost_dev = vdev->vhost_started;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        status->vhost_dev = g_new0(VhostStatus, 1);
+        status->vhost_dev->n_mem_sections = hdev->n_mem_sections;
+        status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
+        status->vhost_dev->nvqs = hdev->nvqs;
+        status->vhost_dev->vq_index = hdev->vq_index;
+        status->vhost_dev->features = hdev->features;
+        status->vhost_dev->acked_features = hdev->acked_features;
+        status->vhost_dev->backend_features = hdev->backend_features;
+        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->max_queues = hdev->max_queues;
+        status->vhost_dev->backend_cap = hdev->backend_cap;
+        status->vhost_dev->log_enabled = hdev->log_enabled;
+        status->vhost_dev->log_size = hdev->log_size;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 03896e423f..c86b3bc635 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -66,3 +66,225 @@
 { 'command': 'x-query-virtio',
   'returns': [ 'VirtioInfo' ],
   'features': [ 'unstable' ] }
+
+##
+# @VhostStatus:
+#
+# Information about a vhost device. This information will only be
+# displayed if the vhost device is active.
+#
+# @n-mem-sections: vhost_dev n_mem_sections
+#
+# @n-tmp-sections: vhost_dev n_tmp_sections
+#
+# @nvqs: vhost_dev nvqs (number of virtqueues being used)
+#
+# @vq-index: vhost_dev vq_index
+#
+# @features: vhost_dev features
+#
+# @acked-features: vhost_dev acked_features
+#
+# @backend-features: vhost_dev backend_features
+#
+# @protocol-features: vhost_dev protocol_features
+#
+# @max-queues: vhost_dev max_queues
+#
+# @backend-cap: vhost_dev backend_cap
+#
+# @log-enabled: vhost_dev log_enabled flag
+#
+# @log-size: vhost_dev log_size
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VhostStatus',
+  'data': { 'n-mem-sections': 'int',
+            'n-tmp-sections': 'int',
+            'nvqs': 'uint32',
+            'vq-index': 'int',
+            'features': 'uint64',
+            'acked-features': 'uint64',
+            'backend-features': 'uint64',
+            'protocol-features': 'uint64',
+            'max-queues': 'uint64',
+            'backend-cap': 'uint64',
+            'log-enabled': 'bool',
+            'log-size': 'uint64' } }
+
+##
+# @VirtioStatus:
+#
+# Full status of the virtio device with most VirtIODevice members.
+# Also includes the full status of the corresponding vhost device
+# if the vhost device is active.
+#
+# @name: VirtIODevice name
+#
+# @device-id: VirtIODevice ID
+#
+# @vhost-started: VirtIODevice vhost_started flag
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @device-endian: VirtIODevice device_endian
+#
+# @num-vqs: VirtIODevice virtqueue count. This is the number of active
+#           virtqueues being used by the VirtIODevice.
+#
+# @status: VirtIODevice configuration status (VirtioDeviceStatus)
+#
+# @isr: VirtIODevice ISR
+#
+# @queue-sel: VirtIODevice queue_sel
+#
+# @vm-running: VirtIODevice vm_running flag
+#
+# @broken: VirtIODevice broken flag
+#
+# @disabled: VirtIODevice disabled flag
+#
+# @use-started: VirtIODevice use_started flag
+#
+# @started: VirtIODevice started flag
+#
+# @start-on-kick: VirtIODevice start_on_kick flag
+#
+# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
+#
+# @bus-name: VirtIODevice bus_name
+#
+# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
+#
+# @vhost-dev: Corresponding vhost device info for a given VirtIODevice.
+#             Present if the given VirtIODevice has an active vhost
+#             device.
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtioStatus',
+  'data': { 'name': 'str',
+            'device-id': 'uint16',
+            'vhost-started': 'bool',
+            'device-endian': 'str',
+            'guest-features': 'uint64',
+            'host-features': 'uint64',
+            'backend-features': 'uint64',
+            'num-vqs': 'int',
+            'status': 'uint8',
+            'isr': 'uint8',
+            'queue-sel': 'uint16',
+            'vm-running': 'bool',
+            'broken': 'bool',
+            'disabled': 'bool',
+            'use-started': 'bool',
+            'started': 'bool',
+            'start-on-kick': 'bool',
+            'disable-legacy-check': 'bool',
+            'bus-name': 'str',
+            'use-guest-notifier-mask': 'bool',
+            '*vhost-dev': 'VhostStatus' } }
+
+##
+# @x-query-virtio-status:
+#
+# Poll for a comprehensive status of a given virtio device
+#
+# @path: Canonical QOM path of the VirtIODevice
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioStatus of the virtio device
+#
+# Since: 7.1
+#
+# Examples:
+#
+# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend" }
+#    }
+# <- { "return": {
+#          "device-endian": "little",
+#          "bus-name": "",
+#          "disable-legacy-check": false,
+#          "name": "virtio-crypto",
+#          "started": true,
+#          "device-id": 20,
+#          "backend-features": 0,
+#          "start-on-kick": false,
+#          "isr": 1,
+#          "broken": false,
+#          "status": 15,
+#          "num-vqs": 2,
+#          "guest-features": 5100273664,
+#          "host-features": 6325010432,
+#          "use-guest-notifier-mask": true,
+#          "vm-running": true,
+#          "queue-sel": 1,
+#          "disabled": false,
+#          "vhost-started": false,
+#          "use-started": true
+#      }
+#    }
+#
+# 2. Poll for the status of virtio-net (vhost-net is active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend" }
+#    }
+# <- { "return": {
+#          "device-endian": "little",
+#          "bus-name": "",
+#          "disabled-legacy-check": false,
+#          "name": "virtio-net",
+#          "started": true,
+#          "device-id": 1,
+#          "vhost-dev": {
+#              "n-tmp-sections": 4,
+#              "n-mem-sections": 4,
+#              "max-queues": 1,
+#              "backend-cap": 2,
+#              "log-size": 0,
+#              "backend-features": 0,
+#              "nvqs": 2,
+#              "protocol-features": 0,
+#              "vq-index": 0,
+#              "log-enabled": false,
+#              "acked-features": 5100306432,
+#              "features": 13908344832
+#          },
+#          "backend-features": 6337593319,
+#          "start-on-kick": false,
+#          "isr": 1,
+#          "broken": false,
+#          "status": 15,
+#          "num-vqs": 3,
+#          "guest-features": 5111807911,
+#          "host-features": 6337593319,
+#          "use-guest-notifier-mask": true,
+#          "vm-running": true,
+#          "queue-sel": 2,
+#          "disabled": false,
+#          "vhost-started": true,
+#          "use-started": true
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-status',
+  'data': { 'path': 'str' },
+  'returns': 'VirtioStatus',
+  'features': [ 'unstable' ] }
-- 
2.31.1


