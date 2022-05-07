Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D047351E38A
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:31:07 +0200 (CEST)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnADq-0007WJ-Df
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABT-0004ss-96
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABQ-0002Sx-BG
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:38 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246LJ7Pu004092;
 Sat, 7 May 2022 02:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=JkuGtdkhWInQjhsrba3R2eZc81RwUAjT6pVbwusNPQA=;
 b=x3lFK0PJnE08aEqQ2yCrz1HW6kbRu7M6jQ5p80WZHImg332sBtchA9L151yOgRxtu4P7
 jiTKFPmqzc/0U5mQVsVgMpq4R8ppJuUKLzfI9uxefBlfFsPNfpLYdUZfhaCAIFY1VDun
 n5VPtjw8/8J6UICB1DgAas8KfMazJNUa9WOvw06NgBKsktyXREceerwRk1N0dW3TsDsL
 PJmxDK3Of5vwnPhJm6n2gkh9tl9WBiDYf7WzAAPyVqxb1kk+g/FCSHO/ICzhiRlp3M5z
 grYAvojQV+9XSZ02U7rccIS8n37Xytm2t1G5WQN32t51/1/Pj79grgZGTISWg2LeWMxl 0A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frw0ay1e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:31 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2472B11O033723; Sat, 7 May 2022 02:28:31 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf6y8vjm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KL+tWIqagxyww+UO8ADlVkb7tlF+5Uzp3YZRzyv319arktqz36EowKAJl4JZq8AA+AdScOBZj0ltnBuzeU44La++3k+bScBMlKQWunfMtQJPuJTMyB9cLbkA7IP5suqrf9KQVEmmDYyN+yDDxuhjEKnL6OYpIhUiPATjRxGMzZpLU0yDZpMGX6ePNTT6stO30aaPBsX8D0ZU0iiKZ0SB77r8A13zguLhpRZjE/vSpO4h7g9ZE6c8LcbW2ma5i9mt4t4IimP32PyitntZHdIMShehh+Bxpc7kO7+ea24u3wfL6t0uCFS+mFPkDoXKEiCl9dJvUKLkidwovQKcTbQU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkuGtdkhWInQjhsrba3R2eZc81RwUAjT6pVbwusNPQA=;
 b=mmAMQJrHYxQDAySXRt5wiZItG/Dfw481+s2vYvoQe1Fz4VaeKOJ/acPHKbcHvmCAAed8exs+RiSkv6fiDd7xo2ipjnpV2B5fd4wWImDIOUaN39c7IKhOkkVjGWZX74D15Id+g1IRV9dVrrHdpTdQqxtfYGopeLqUSdNfC8vnkpZu9YNZCXGs9bB7iUYkgDLbB8SsQRo2B4A7M9sR/aYoaCqmEadC1msrpyx0CD8uC8yc1JOgADMTwVvF1YCV5cZOUnYv8sTfpAGWDChojTiHa1yUk/JdXvj0mTiG725xUsyVHioTKwxCMr0Q3b7+LqVAjE7F37541nH9BQesSN27Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkuGtdkhWInQjhsrba3R2eZc81RwUAjT6pVbwusNPQA=;
 b=cmRObCetkqTvr7jyzq78Q8P4W3TWkefS61ZgQoEeWS7N1lnEAA55wDMjmuF39w0Q3E7VBVlMOzGcIPrVONt0rXe6posCJdrGO5TfU2/I8tG2PnWn138wUyAkzQexwbuwxJGx5ri169KInl9W5KeVlbD5461VFP+I1rC+9eEuzbY=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM5PR10MB1370.namprd10.prod.outlook.com (2603:10b6:3:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Sat, 7 May 2022 02:28:29 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 02:28:29 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v4 1/7] virtio-net: setup vhost_dev and notifiers for cvq only
 when feature is negotiated
Date: Fri,  6 May 2022 19:28:12 -0700
Message-Id: <1651890498-24478-2-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
References: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:5:100::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa333451-e916-4f4e-379a-08da2fd145bd
X-MS-TrafficTypeDiagnostic: DM5PR10MB1370:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1370642FE696AAF756A3BF0DB1C49@DM5PR10MB1370.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUPjxK9oXZ0I3JDNkKhoty6ua/5u5ujr1SSPR4OBymvPAC5Ev5LTNqwp84WIYPN6Yz35QQEsL2MdQcxeI0m9/vogCg2r8FfB85f6JM3MNSj39pZaxt1imjHkrf15IvwKHwv2cgMaLMUg2eoRoDWVVrmeV0V+Xj7ChNQjiGRuSxv+POI1mN0RfiAAQl792uIJHyYp2zGky9lkEITH/woC8JUFGc/4rmO1zmGJAuNjZ3kXhV6rpCs8BFgXH+8rzn4H5Q2NsygzLA3t/6ElW15QTTHTZMevg1rVHoc28ieMmeHUCmka+0bqJn5Tu1e88ut2CSsdtFJYPzd2D8sD/zzMK9kJfrqh+DGW68hxL8JFWmRbBOblmO7ay+LfQLLh1jZtwGqqbrnGpTVxKS0FHGgiO+Zlt6l69gu39uNveIh1qztb16zDJAsdTBMMeZ/LoQBH4ixsirbrVtoABBAXD8sN0M4u7ohXeorlSFjIogkmvwadIifon+iZjSwd9mZdyDCd2RfjlP1tZ67Y6KIzYkbrGJh0R+uHVPzQQ7XSvErT1bVg2sCZBMz77yGUfJxp1nQL6XK5/vLH9F5TzHGkRnAx3Dg8rZOuqeSV/rmm4ZQ16qMpvwWwH3mBLmThzZ/yGn2pzELdubEIxWbTwwJDhqqn2dAHBbheu+XYk6V18pWdhgolXHmn7OteaReKCM7oroB46SnBZlfefD42nLDcFMscrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(52116002)(6666004)(508600001)(5660300002)(6506007)(6486002)(8936002)(186003)(86362001)(38100700002)(38350700002)(2616005)(316002)(8676002)(6916009)(66476007)(4326008)(66556008)(2906002)(66946007)(26005)(6512007)(107886003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KBMTai1pQ9yyjEbyeWmq4WB97yVxE+2Cg15ylEu2Zcx4ZB7cbaajSwGl62ym?=
 =?us-ascii?Q?hKb/qADJSgjsOy4pAiwdTyahzn36SRGuTcsdxG3gE0hXx4rzRlHOHbINmuuL?=
 =?us-ascii?Q?gfyLR31ANtSVNYXC823U90VobdcV7d1XBV0MP3EbTQTMIMjRdaRP5w4rir4o?=
 =?us-ascii?Q?3pHy8Gc2uzN/iuvdlY3GRug+UVKBS6bzJYD+kEbYaz7656zwMohU7plTVXF6?=
 =?us-ascii?Q?yTHk0/zQlJpWBcahIUDwCL8Y1fTXILqbnt5MTR8JsZ1Brk8OKUxQqVeB+cH4?=
 =?us-ascii?Q?f14YGQDbpzcI6HZmxc9HCgREMUfd1sgEXuIMJ+dljvdQ7vFrgAVbvGJUtGp1?=
 =?us-ascii?Q?1AcIS2OZZjis9kFBzxEJBtn8xxxKBHulrZ0DZwMU7mIE5x18oyB80PWI3xox?=
 =?us-ascii?Q?RRrIChHMGCTZhqqNWVvmQ7DTnsdV2MQ/HQrfLANw8UT3xAytdENEnsFdUnK7?=
 =?us-ascii?Q?0NMC1FfIbOWL9cMkCwxaFDH88iYo3ddsFGHSs+e87NdLZx/2ZdnG9OriO26n?=
 =?us-ascii?Q?KV5R+1y3p583UHgqpHdhD8l8upAZdrfOotuOQL4qtslbU4gp2TvlRTZJlJ+I?=
 =?us-ascii?Q?YYy0zow7vhsd6Akrqqb3vNo0BA45SiCZA5r1byO2JpYGp7tNEitGzLVJc//a?=
 =?us-ascii?Q?uznJ0d++vwpUJLo0Sj5ztRY4GceJVvSFndOe9iC/T6sKcBtbJJlSBSz29EWe?=
 =?us-ascii?Q?UcgkSA5aJ9+7Bn1Uid4qEzQBjyF5uv+Pj7gmZdsvXbOpnWF3wg7+ca3ONP54?=
 =?us-ascii?Q?4CkBt3+VdGwecm8q/RiPVuLDo0/RUTYdfMSQGlwYvNsPjXvZGCCLCT53kAkp?=
 =?us-ascii?Q?rbttUkCxe8CB3n3eJ5c9RIh4QuovIfBAZmSgj0NlwwlJ1HwSTQ2N0+PqXhhM?=
 =?us-ascii?Q?AF58eusUBzIlT4Lg5WKTM0GH3c7H1C8g1jpNYDZuK68Pp1FJm1PdFmBRrOmP?=
 =?us-ascii?Q?JPQdtAYCnLrBw7xOVb8QyDs0gC9ESWvT8COVYAeQ8cDHu1cXTyK4cmo+8RJn?=
 =?us-ascii?Q?1OKD2PLT+u2Ni7dbTXol7BpKSp8Qa/tQYAoAAdMJV22jahB2KMjJ24lC0H0/?=
 =?us-ascii?Q?n34sxVWgO6kg+C7RWfijof0XWnEYQbVf/mmaHDpE7FbI80JTdGuuUE3WbYKx?=
 =?us-ascii?Q?vr9q26FjA8o66vQXXeS/9zmbcDGf2fQUpomDclPrnmahMC89TJbg3FuFR+XG?=
 =?us-ascii?Q?1+Jfrt1Y+MKMhYXSQ4n1Kw0fa4M9kIkxI0CcV1n94UF2peqKFA8VnJ/7/JHV?=
 =?us-ascii?Q?5mGO+gqaWLyz1bg1oyCrYL8y1NkvKMMNo9bcivc58Mo26NybaKIQk4sKyMbA?=
 =?us-ascii?Q?bqfi7XEBf/Ujh5cG2a7oV9acdYGooC15rjUvDq35+aln9sx9moG3HKZJ5TMz?=
 =?us-ascii?Q?F9LrNM5JZYtMtCxr/Y58C9MF+VQqS0QX01hDy6COF3PSnOqUq9xNvwEJGzVP?=
 =?us-ascii?Q?iiRtlp5xivFu6MRN71Z2En2pxW6hGIRdjBmE0F+NKpm/UgruAdhiMg46pjvE?=
 =?us-ascii?Q?FOc9Av6artes6est4aQoivfiZ/BZz5E+Lw0f9Co5vzeCW9+cI70NKTI0rHC+?=
 =?us-ascii?Q?khDQxH/CGdm5KtY5CzcZA8MHXMJKbxzvwgrIXZ2g9IbZ3Y/KW5I1YyuB8W3T?=
 =?us-ascii?Q?h5jEhgjEDLa7Y6EPEGqRWQYwS1T5UVxwtuTplozMNG2hCBZJ8rWLVzAh6xnZ?=
 =?us-ascii?Q?ddI09aSJ6tH2/3WTpbRup01V9JZPj12IKYG52pSnha+L0rzzzQ/4QQ/SthSd?=
 =?us-ascii?Q?EQeMsGWTA2fYVs/DLQTeH8ZJVsFqMmI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa333451-e916-4f4e-379a-08da2fd145bd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 02:28:29.2763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6fPjqNuhQDhP6l8zSuVSooM2Yt5nqHVcA/A5RxOlAmro728SDRcqBQQqAAbiR0LNoudHUobtQ7JIcM6cDAdWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1370
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_07:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070012
X-Proofpoint-GUID: b4li6udNC4gLGIOGL2Pyf1pJqhXCKtbi
X-Proofpoint-ORIG-GUID: b4li6udNC4gLGIOGL2Pyf1pJqhXCKtbi
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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

When the control virtqueue feature is absent or not negotiated,
vhost_net_start() still tries to set up vhost_dev and install
vhost notifiers for the control virtqueue, which results in
erroneous ioctl calls with incorrect queue index sending down
to driver. Do that only when needed.

Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1067e72..ffb3475 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     NetClientState *nc = qemu_get_queue(n->nic);
     int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
-    int cvq = n->max_ncs - n->max_queue_pairs;
+    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
+              n->max_ncs - n->max_queue_pairs : 0;
 
     if (!get_vhost_net(nc->peer)) {
         return;
-- 
1.8.3.1


