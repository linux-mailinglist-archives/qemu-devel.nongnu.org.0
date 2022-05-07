Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAEA51E3A1
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:38:00 +0200 (CEST)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnAKV-0000F2-Ed
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABW-0004vX-B7
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABU-0002U1-4R
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:42 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246Kvhxg013502;
 Sat, 7 May 2022 02:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=1TcG3CKuNgf2xLxnkMMxY4oTXSOROuq/QliJJdBu0NY=;
 b=Yp3AzGll0NpXoF+K+CaPN5zl0UOscGyVzJ2EzCvm/Q50rHIKMoe5JNMYKzDnJsmGGq6b
 aJ0zDbSifrTJZzICp7QzLFJo6HJssjvtoJaQF58OCi87S+m5iTeDCmjH+7wZU/1teh0T
 X5KRpILC/GwgE7jlriWDBlil10tGCIOWn1Ym6yha/eS58cgII1HKR+vt+zrW22Jix3nD
 4UV62fwyoT4w0+Lh38pWzJhOHqoaY5bhNJUuj7sYgxqNLIFBm7Ei4i4w4YXK0P89tLvZ
 0q4sumBzU8uIqQeo4KrJGoxAVQtav62MpP0qJHiNeUbg0ld0sw3RqNjuj0rC044+Dh9X Fw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frvqsqg0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:38 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2472BGk8002863; Sat, 7 May 2022 02:28:37 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fwf76gu6a-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQ9+eC0yBAtp2A0JzGwI1yFhemDolvzR53R4yEji9YDyuxX5OLCglyUO3153/ghIBWOrBk8jGdZR9iUSxK1HNTMW/dUdvWn2c3bALw3RRoXIXHhBWAyGHjchGMMFYj9H2go5dju+FMUuj950aY5PJlQbuZL0QRRDbCiAx4XcPEJf4gldqbWIengTYUdVlZpwBXPg5g8zc8Md9yFYKpDReK3xdU6VNYLfRoZivVPBiRwfjdqkt8kzlBW9OwlOhwlw7sdRhcmkvfw2T8u1Hs9sQZkpmf/Ugpg86GLl9csLuZeGsBU0D1u2AzSQUKP4v+XbAgl2GDYI+CCdUUXZEFDwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TcG3CKuNgf2xLxnkMMxY4oTXSOROuq/QliJJdBu0NY=;
 b=VYVaNQd1xJXEmx4CbVlPfxFyoJR2CsU71Y4Gt7/A95jxo2hb+5TECv0AJvJ2C2nWsHC13UoEvgZPohwboVYApEhBcg2CpE/kKC3b63XcCezrvNiY1Hh4r33zmBGZKYIB0SwwLCtkC/+qyXBAfd0ZIYj63Ys2e8wZIRUyh0IbM88WUeMVagetmQLJXW7MWn+/SbftG75OsSvk+198UgukZmcEapMQGHaNHmh1l3fzpGnc5wyQ8hyf11VtXmnuIC44qnGQqN456TIIWL6IyKZA4LoDAh0Rm4dc7+14+PqK9Qvb/0BbrMT+th23PzIHs7yxC2+n05aGSzkeiI7scEePUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TcG3CKuNgf2xLxnkMMxY4oTXSOROuq/QliJJdBu0NY=;
 b=d+n3VUcsh4Hr3TXWZgoqam81Zom2iSvVKvtlvmPS7yj4pOvIclXqM8Em/fQrSw4M5x/h8akL8e1f5Gbt/6uzLBcvvtyBp0XxMcDS3g/b1+Jviur0dHzLlXMiKN/lTvE525oVRIzcqVqt+1vAMt/v8XQHuFUb4AWGiA2SwHdqW0U=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM5PR10MB1370.namprd10.prod.outlook.com (2603:10b6:3:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Sat, 7 May 2022 02:28:36 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 02:28:35 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v4 7/7] virtio-net: don't handle mq request in userspace
 handler for vhost-vdpa
Date: Fri,  6 May 2022 19:28:18 -0700
Message-Id: <1651890498-24478-8-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
References: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:5:100::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 509de388-304f-4438-4729-08da2fd149ab
X-MS-TrafficTypeDiagnostic: DM5PR10MB1370:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1370399CAE96FB2DE57C381AB1C49@DM5PR10MB1370.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eJd7gwMK1+KQMLBSoKdDhNQpbQDQIWGR4Kk7phbBMFfET5ccm5HKkUsnBg3Vz5ho0SXm6n3ZP6EB6zLKyfDCUSJgPfV/NE4/hI13jHL57FS5MQ2dhK5G3q3dc17B3bIAEZboYcydg56WodsrRZLs23ZBgQZ6r8luBpXedGdKAh7Xw5rJuMeNgZ8VyJevwkwFseTzxZD+HwzKK9pyEQYwgSv4JIXG1GS+X7PhUllXQFq+b3xdK+z132FejJL/hAbUNyvzCYe54kI8r3Jwlw2BwsHuIi/IMjfaxbIBduCSQ41K6htStjbzRqENV8Q6ne0OkbZErgZ91Vlm2JHVbimeEiKF80Bche1L0Pc9Y3w76wqVj81xMXbd0XoAYb7qPGO3jG+t+TgA5H4p5RM2OibRMJvNAK1/OXmzweX6UEJzKYSkmxriw5tRnl+gceKLNplwhDF3Ajt0wmcoiT8a3Kdo0IV8s/IB2+KLJLLd1KOl4/TaihDGIO7yEmvZIQGpiftaghn8bTJTe4A1JXzLFcPY+0K+bDsXZz0DQ0jujyVpJvW0q11GoTQ+3ghtcBYO4Hh08fbk9Euy/CIgOKjMvLY3rOnKehWsdhziP/TJ+DSm7JwI/VCyC/SjIVNEukKhMiv64GK6UqE16LbiMZ7IuqwaQ/ri2owqRV4KQiEq6hFtgLESHfglOBqWz/UHLoyT2cbZxL/WoH81CmnFcQN/MyM5rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(52116002)(6666004)(508600001)(5660300002)(6506007)(6486002)(8936002)(186003)(86362001)(38100700002)(38350700002)(2616005)(316002)(8676002)(6916009)(66476007)(4326008)(66556008)(2906002)(66946007)(26005)(6512007)(107886003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LLM1fnQR/eX4wUp1IvHTL/va0Udrw4TwKie4h8XqeL8YkqCS6MkERwhJQ9F0?=
 =?us-ascii?Q?Il8v44woDREraQb/6lmagZ7+S2vbUD62DCkn3AyCia8PTbBcWfTPx4bFVeZu?=
 =?us-ascii?Q?M9b5ad9YtR13aAnwrXPaS65IY92OZ4vFhESuRRl4y7p1ZrXpQr8/EVoFibcz?=
 =?us-ascii?Q?C8uQ6hh3DaEPRyAqvNuo8kUibEOpvhP7PpaCok5/HZoQ9ZuutxgsrglRe84U?=
 =?us-ascii?Q?J46hMebuxCHmoI8PyIYi19x/K4WNy6TAhNbBUJWZh4GiPMEaVJGVpDRlv/l0?=
 =?us-ascii?Q?Q9QeH9aQhC84eKLKBZiEqvnzZsBzUAnYY1oBywahFO2xE5TBjimdS3Q2FmLw?=
 =?us-ascii?Q?YYlktCkxSpxAplWrv7R7gMftZDoWOnHjPLSYFSxRMu9oWpVdF+dJCXwhoGyD?=
 =?us-ascii?Q?H7+Tco8BL9kKtz+lw0RX9Q30e1w3SSKegG4G7LbMM0cTjhyc1z8JnU+0mck8?=
 =?us-ascii?Q?Cy6zk6i6dgU7FrGRRN9V27NvhaujC4ctYOsrlnM/vpFFzTmlvGq9ePFeREpq?=
 =?us-ascii?Q?om2y57FuF91Mm2PzITKY/yowCVPNRoy83E8F4a/rC16Fcknd300vsz6xzxQe?=
 =?us-ascii?Q?u2sb8PlqQuXzjxEoL+1VTIIjbVXNfcKC1dCqa2blAMdE9Dm6CD+ezrKzAjKG?=
 =?us-ascii?Q?tfBKq8QaZt0CnrQeKJxqmi63WTLLWz6KKUIT9ErvU/bkyH2S0HPKWhnOpkhd?=
 =?us-ascii?Q?7m/uekbLqObYkJDNTFmmspHAPW8j3iqFkT4BZLG/1cr2dZyXGnJWNpEGnCTt?=
 =?us-ascii?Q?E13b0wg229UZwHYd+3+vo+LFOtZjRVF93NZtnivyBmkIVQZnJKtCnM+zn5H1?=
 =?us-ascii?Q?YojsnJX6Ra9AquVNTW9DDHpP5I1zDWRaEZhBqSes59ttJ4MdHkrEgibxUOqb?=
 =?us-ascii?Q?u/Srw/j4SnW+SuGmMQN6e2jr3czYfkL5SccCCe9WB5Frdd1grWzcBwU87Tlg?=
 =?us-ascii?Q?DS0LzbOcq5bL7rR/NLlmzEliE4E6XUAn2L/PtAQPg/bbmqafmZk2WkVd0yAr?=
 =?us-ascii?Q?KMcfE4pqS02VklnL5+qp7EZW6U+spl81ThmLbdsJj4Pg/BNfrUqOJliON3HP?=
 =?us-ascii?Q?tIbxiMkcGN8H6vQrHXP5kqbLXCCaLmhfj8otqjHyWXu31cp0uvS3GWFjc7Wi?=
 =?us-ascii?Q?U33EN/3kfdpdlJfvKg9fBK6u7cKaTZuJh9dYlXjDwhL5TvK3wZISRJ0dUJ0N?=
 =?us-ascii?Q?ho0b3nToKiq2PsjMDuzXoRl6JJAHpHBB4NgLy55YQqjtpxfnHQmnC1Hns7y1?=
 =?us-ascii?Q?aPA63vg6hnRgiA3n9djZ1DSgWeEUU8SAeTNy7Qj4W4yOXcec8MY24Sj0/w/E?=
 =?us-ascii?Q?h6NdRCZZAmRHHClXRtx0a9vaGCHJ6c7Np9Txlxz/eqyr1zXi6/4LqW7ssa1P?=
 =?us-ascii?Q?iinNWiBMYi/nrtxeAw+CtlRoeUDX4DWcpmx9aYOO8R3P+DQ3MB65kS11ixI0?=
 =?us-ascii?Q?Op+MmR+tnfeaK14szJGfOM9hc/GViQtKP3VjMjc78IdeWbrFPCAPAYL5346l?=
 =?us-ascii?Q?ZCqWuBrVDj1zFdxL1+7CgfxUHY0ckDLR9ut0nuNNJ/Fm8c1958PgIgfa8YzW?=
 =?us-ascii?Q?izSsGfz+WXV4u74VG6P51dSHmnq0gauOHmvyhesLac7R4hkQMjunXekhrtf1?=
 =?us-ascii?Q?S6coAkJQD89bjb8Y/3zUmdAEJdquJLoSQxbT2ceHOe0dnBJT2r8Zf4OIn15U?=
 =?us-ascii?Q?kbI6sM02Ond3ATg1gO90453tmYQUxpL/gkvPQLvLuoekCskF9aHRqCcSL0UQ?=
 =?us-ascii?Q?MgRcMKg9JHENyloDabfldDTI8y21gls=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509de388-304f-4438-4729-08da2fd149ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 02:28:35.8384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQr1FG0kBhpjGwjxWpD49kSwNyZ3AyIpsJ1WzmptaLnwJpcNdugCZxDDeooJ9oC9zWtWxkKUdokW8Rmpn/rvfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1370
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_07:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070012
X-Proofpoint-GUID: c5C7gTWWEa4uP4CfhOE8iOrStC6LmtI5
X-Proofpoint-ORIG-GUID: c5C7gTWWEa4uP4CfhOE8iOrStC6LmtI5
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
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f0bb29c..099e650 100644
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


