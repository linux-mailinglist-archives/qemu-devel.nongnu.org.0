Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766C151D06D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:59:42 +0200 (CEST)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmq45-0002Wk-JL
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzU-0004tR-0C
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:65132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzR-0004Rg-Nj
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:55 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245Nd6p5027626;
 Fri, 6 May 2022 04:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=D2ClcG20RODJ8/B3gEdze2fdcqiapKpiiR/cDwXzYSM=;
 b=sgn0M845BezLAP9k4kFktd9J9FHo0VKZGvsIfkc7tZYFS1UYANH8MJcv/1eHH/5HR2mi
 z9u5fSlLFl57T/TXBmlr7PO98lRTeoORDo8YaEl1szJhXNsITwsWwaOMQYAg2mkC62Hz
 C/sRMi36+TtbQiobhm+BpxHoPjPQdSd+eokGM72WEIC2idsqU3VURK7x2X2e+BtmfurQ
 /Ry5d01v5/n40IWvvlXqJt83dHEy6moSjwBHh2hIXXsN9ZLFUEFC+QZZ74vCstNOI1Sg
 IAfNuHlJTN1G8jNsi94J55LFtG7x5vrwAS7FZXiH+9vtwx/8f3/fBRKVvFaRvldBrKn5 1Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruw2n3nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:50 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2464p5H2004871; Fri, 6 May 2022 04:54:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3frujbkqy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3Nh3baSkCrUUmmDLYI5HxAQ2dHtY7qofWG9huKmqbtW8rWvtRVTvXKTZqU9dGiqSpXAvNhcNOWitWKzGHbjG+yAWnCQQHzBIhaMGenfmuXgpXu03XG+vV8Nk5jzhF4JCYocATrhOCkS/SVfgasoXPRtavtYHXe/awj7uuLSfKfC/O4bylZdqFwmvjVuvXGVBZJMJ1VqrzZe6NY/B6rP7KRnDkoP4KkbNSShMZBe6NyGxOuz8841CbvEvBJ00IT7TGRvS6fw0P5urEAunrB69UCyWxosfU9M6Qw+Tn1sV5XT+C6IHwed2NaW2cLXkd5ghkFF43z484dgcrEiZz8W6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2ClcG20RODJ8/B3gEdze2fdcqiapKpiiR/cDwXzYSM=;
 b=nKgk88QokPQ/za3VxtzgemcN1Zs01kNEQMPqbN4UHNrPkK4hwO+kAU1i7FUEjQ7rg6GoYJE/9iMi5wqM0yj9fMDDmhJCxxn/B68Svf3ucH7zB547f0yOERzR04B+t7p2RZIiK7Yh+Fbk8cnJozdCFkNON1iks6ai8Nr8qFdqpIMVqA9O84KKIIq8WI4XtVueQKY7P8hqFMOW82rch6OIoh0KZonwD5gz4CK9Q71BAOVP+rVaq9U48Dd298+5uPdewDnf8c9fUFOAlI0Mc4uvbvzNUckjbtcOy8Xy1imFkTG+jCBCM2r8O+XwSN0YvAbJVqozPrlvmJpyfN7L/AWqGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2ClcG20RODJ8/B3gEdze2fdcqiapKpiiR/cDwXzYSM=;
 b=JQHKdZo/3HMavibZ/Ax+uP0VAC54SBx9IwJ0NABADJt8U8UUxvKz8dHnrNITN9ksYYgGMHlhd5+1I4/iu+ILTSRyXJq3KwSPAFJMjvJrEY1lDVMTD8Dg7M15fa/bSdwmdwn/dyeS/07hk1sv/G5uHS7dF8qspTQoKQ4ygMvyyz0=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB1416.namprd10.prod.outlook.com (2603:10b6:903:29::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 04:54:47 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 04:54:47 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v3 6/6] virtio-net: don't handle mq request in userspace
 handler for vhost-vdpa
Date: Thu,  5 May 2022 21:54:34 -0700
Message-Id: <1651812874-31967-7-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
References: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc1e9220-34e3-463b-f55d-08da2f1c8b5d
X-MS-TrafficTypeDiagnostic: CY4PR10MB1416:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB141687A310F8AB57018F7B67B1C59@CY4PR10MB1416.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x8MJLwrpWkRBwhtP+ADH+dAwl8F78QBF4qgMS++AUi284N7eAchOYGE6W9TVOXW2gDn5sKccjNP/8zobQ4Y1AbVld1fML4FmOAa2g1WMN+yHEPoLXrGV9aTcao5i49tZTwea1wEoukQqWNqTN8yaUrSqEAiLDpSEZmur/KCPJDHv1q8PYJu4Wybw8i30hSMm4yCYCXlThzLyJdQRK18S/lGv4D4jw2kO/9D6JzbGK8cR3McajrLD6U3hk9zOsEgKRwGVOzntPC+Ck2cBnycorfDN6QbRSWfZXJdods2VqtheVT5XIs9SD1Pr1bxr89JGETd1LHKn6zxrjw33VkrfeER39HlN4fVUiL/2aSp/hS9/6Jxe1WzwYymV/3vOoCNRL6zzegRiA6xQcro0a9So7kcZzCbOTj9Yspm9TOSqxSl9Ju/7HDsoHWKzA93BBHFQOsRpVk//vKEPtMEAOAOmiom9cfyz8oCW2cQIZVUzGaIcXQKyO41jnUau8Q3fVb4FCkZEdXdzn11eBJtIAWA5i6xMuwk/tdbgwkeE8B0OkVhzVZV9XuSBpPPAVrepCVKKXk40UFW7Ag0FaFF9NFbKxIwXbLF7/w2IgUkJPH313uZ/F2xyg29KSMy0j5zTHcbWX9n8mOrxERat48+0sYibqefeO24iivCAfww/9rMjg1+qVPNn3NMDzjZ8/COScRWrLyq3Yoyxwr9o6UCKufAIsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(316002)(6916009)(5660300002)(8936002)(186003)(2616005)(38350700002)(38100700002)(107886003)(6486002)(52116002)(6666004)(6506007)(36756003)(66476007)(66946007)(66556008)(83380400001)(4326008)(8676002)(508600001)(86362001)(6512007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hd9U33B17tUjghLw7b79rlXql/uvmkJWaI0Olz3ooLgWaSW7iHIfCMa54V/y?=
 =?us-ascii?Q?Bri2ntKQltgCcATfi1KbtT/iTNWkkVIdkdz/DR12GMiwMCAJ5d0dVpbpaCQs?=
 =?us-ascii?Q?ppPV6OFwocLRJun3Y59eFnMXJLOdCaCJtjgma87rmtmOQs5uqTGiJlDagYHB?=
 =?us-ascii?Q?2VMcqXLQDfntI8/4vWEqzGQDlDv2Pm8thwt9jdwnMaK4At4k+AaDtp04dLyx?=
 =?us-ascii?Q?0hIf8FReL1oLvUhHwX0abuED4JNk0FcPGmVPA066b+S83ZYTO8Z0Zd255Oed?=
 =?us-ascii?Q?R1uZXe6mo4glrywpngipOeWdSGpmjG1ZIfrgwR5qLaBnmKiU0jy6AqURdlXb?=
 =?us-ascii?Q?TtuxeJmwkHaCnOXaV7JChHSRqb5CVwvqmkpnROcm17Mk7NjuTW27SBYRUiK1?=
 =?us-ascii?Q?OAIgtShXt+GqfyDHYtr43DR1p6l+YsZd9moPZ0VKVKu/lxS3buMojossHsas?=
 =?us-ascii?Q?a2ADnIjvq+199LEigaT3PGOaT/phZZv4XUQM6lA/gpC2oKJYeegfql2BgZVq?=
 =?us-ascii?Q?42Zr0PFiQ1JQzGLyZ4NUMHUFJPvkb64sBjauZMW+SyxQWGja6nw0vQ7tANzf?=
 =?us-ascii?Q?Sjx99nv4fWE2xXHv/EksD6a4KvOnVEYhoZCdba/YVyX1/X0qGAe9n62vZ7sh?=
 =?us-ascii?Q?F+ULSv/zGysscSH6jE8r8tOlhqg0FJenOYAE+BoYSFxPz/GomUeRgOKrMt+Y?=
 =?us-ascii?Q?Xae1Gv6oSb6onix60meXUtxsVEY9FFQP12Db03bLUBGR3sHgPDzUiNcm3cFs?=
 =?us-ascii?Q?f4xMvebSCkt/T3SCA40v973I3HPLPHCzdRfwBivxN25Pc/EXY4Cdt9bLjcTN?=
 =?us-ascii?Q?KM2/5uQiA/wmiX796Yd0g02YcyPZ6JXdB9E3N+JbtAB0p6zld/gd+Y39xex2?=
 =?us-ascii?Q?YkFa38xOP0vCFTa7BC0/Iw+wgS8dVb43Tj7UMC6u6GI8YwDwPz+kawqgIA0l?=
 =?us-ascii?Q?bNlVyRqGw7jFjeFVITu8PH2qm+y2uhyU2qwhdj9Fpz7zmrUTBDZ95MRGgdY3?=
 =?us-ascii?Q?tnrpf6N/5bR+F7A7H1aCEiDn8PDtiGXx7uKPepnuzrFfwXcvJdPLrQZuiFSY?=
 =?us-ascii?Q?h5MULsp+EkiiwTcP95HJT/eEeXXvBzab0ilqy8sTyeaKTzeOZk4oLihd8Mkf?=
 =?us-ascii?Q?Mw/x8vfehTpSQadrECfATc9OCa6uvjxl+o9MvpAwWe0tBaBaXvZ2OG7FS9ck?=
 =?us-ascii?Q?/eTt/VHIzu4A3ZLArQBZAoFXM1t42L7E663tXWFVqSyPugyyMVu7PSe3IMse?=
 =?us-ascii?Q?GC6iBc9Q11VDF/YECaNYI+Mv2UPjxAKDB6aloKNcatZJWh6zabHd0vuXRb/G?=
 =?us-ascii?Q?AMpQDFv61DESFql+b7198ftH7FEBO33TJV3+hPNh9unjRhbflFW3pV/6ZmCE?=
 =?us-ascii?Q?yBfSDKVSrPp5xY5udQGyliGH56D4MijuWGUkRm3yOoLK7v5ZruVru18N55Bi?=
 =?us-ascii?Q?c4nDuQnu+hhIY7aCxyf+F+emaa151vkP3re5JXSUZyWVFO3F0XPXBXSSyulL?=
 =?us-ascii?Q?4Kz9CrznMdV4ED0QIOSNuWIAlITIiMzZNUdywEb0yWbl+qCZKqGedF3n7u6t?=
 =?us-ascii?Q?giW75YIixjCyV+qISQwCoDWgAVKV4kP6wSBbzfQqXqAwmfOgp2mz5bXGUZrc?=
 =?us-ascii?Q?adyRPHUcYkr4DHFfSEJ5/WcgStrAYZL8eQgbQ+4DOyoEBxl3D/wyl7k6afbM?=
 =?us-ascii?Q?UhrLyOLj76/PDLfLsnEWXYB/EWUNTgPbaVbBJWiw4dIghX07JenfsMFJvBpm?=
 =?us-ascii?Q?jquFn9UyHdpuKn0egdI+SD/uyOHbzuQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1e9220-34e3-463b-f55d-08da2f1c8b5d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 04:54:47.2470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pt1VbNjNEaELF4P6H2Kz5Q2zqlVUMQhQ1SOZq7G6AmyD2PuSGLluHHwQmToyPfnvU04sAOCV2l1QH9qSXa42kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1416
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_01:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060023
X-Proofpoint-GUID: YqdkC8QRHldMgTg1xA2kftDOnyU4JyQW
X-Proofpoint-ORIG-GUID: YqdkC8QRHldMgTg1xA2kftDOnyU4JyQW
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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

virtio_queue_host_notifier_read() tends to read pending event
left behind on ioeventfd in the vhost_net_stop() path, and
attempts to handle outstanding kicks from userspace vq handler.
However, in the ctrl_vq handler, virtio_net_handle_mq() has a
recursive call into virtio_net_set_status(), which may lead to
segmentation fault as shown in below stack trace:

0  0x000055f800df1780 in qdev_get_parent_bus (dev=0x0) at ../hw/core/qdev.c:376
1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled (vdev=vdev@entry=0x0) at ../hw/virtio/virtio-bus.c:331
2  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>) at ../hw/virtio/vhost.c:318
3  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>, buffer=0x7fc19bec5240, len=2052, is_write=1, access_len=2052) at ../hw/virtio/vhost.c:336
4  0x000055f800d71867 in vhost_virtqueue_stop (dev=dev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590, vq=0x55f8037cceb0, idx=0) at ../hw/virtio/vhost.c:1241
5  0x000055f800d7406c in vhost_dev_stop (hdev=hdev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590) at ../hw/virtio/vhost.c:1839
6  0x000055f800bf00a7 in vhost_net_stop_one (net=0x55f8037ccc30, dev=0x55f8044ec590) at ../hw/net/vhost_net.c:315
7  0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590, ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:423
8  0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>, n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
9  0x000055f800d4e628 in virtio_net_set_status (vdev=vdev@entry=0x55f8044ec590, status=15 '\017') at ../hw/net/virtio-net.c:370
10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=<optimized out>, iov=<optimized out>, cmd=0 '\000', n=0x55f8044ec590) at ../hw/net/virtio-net.c:1408
11 0x000055f800d534d8 in virtio_net_handle_ctrl (vdev=0x55f8044ec590, vq=0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
12 0x000055f800d69f37 in virtio_queue_host_notifier_read (vq=0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
13 0x000055f800d69f37 in virtio_queue_host_notifier_read (n=n@entry=0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier (bus=<optimized out>, n=n@entry=14) at ../hw/virtio/virtio-bus.c:312
15 0x000055f800d73106 in vhost_dev_disable_notifiers (hdev=hdev@entry=0x55f8035b51b0, vdev=vdev@entry=0x55f8044ec590)
   at ../../../include/hw/virtio/virtio-bus.h:35
16 0x000055f800bf00b2 in vhost_net_stop_one (net=0x55f8035b51b0, dev=0x55f8044ec590) at ../hw/net/vhost_net.c:316
17 0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590, ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:423
18 0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>, n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
19 0x000055f800d4e628 in virtio_net_set_status (vdev=0x55f8044ec590, status=15 '\017') at ../hw/net/virtio-net.c:370
20 0x000055f800d6c4b2 in virtio_set_status (vdev=0x55f8044ec590, val=<optimized out>) at ../hw/virtio/virtio.c:1945
21 0x000055f800d11d9d in vm_state_notify (running=running@entry=false, state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:333
22 0x000055f800d04e7a in do_vm_stop (state=state@entry=RUN_STATE_SHUTDOWN, send_stop=send_stop@entry=false) at ../softmmu/cpus.c:262
23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
24 0x000055f800d126af in qemu_cleanup () at ../softmmu/runstate.c:812
25 0x000055f800ad5b13 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:51

For now, temporarily disable handling MQ request from the ctrl_vq
userspace hanlder to avoid the recursive virtio_net_set_status()
call. Some rework is needed to allow changing the number of
queues without going through a full virtio_net_set_status cycle,
particularly for vhost-vdpa backend.

This patch will need to be reverted as soon as future patches of
having the change of #queues handled in userspace is merged.

Fixes: 402378407db ("vhost-vdpa: multiqueue support")
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 hw/net/virtio-net.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f0bb29c..e263116 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1381,6 +1381,7 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     uint16_t queue_pairs;
+    NetClientState *nc = qemu_get_queue(n->nic);
 
     virtio_net_disable_rss(n);
     if (cmd == VIRTIO_NET_CTRL_MQ_HASH_CONFIG) {
@@ -1412,6 +1413,18 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
         return VIRTIO_NET_ERR;
     }
 
+    /* Avoid changing the number of queue_pairs for vdpa device in
+     * userspace handler. A future fix is needed to handle the mq
+     * change in userspace handler with vhost-vdpa. Let's disable
+     * the mq handling from userspace for now and only allow get
+     * done through the kernel. Ripples may be seen when falling
+     * back to userspace, but without doing it qemu process would
+     * crash on a recursive entry to virtio_net_set_status().
+     */ 
+    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        return VIRTIO_NET_ERR;
+    }
+
     n->curr_queue_pairs = queue_pairs;
     /* stop the backend before changing the number of queue_pairs to avoid handling a
      * disabled queue */
-- 
1.8.3.1


