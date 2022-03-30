Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E814EBB05
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:47:10 +0200 (CEST)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZS6n-0008FU-3Q
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:47:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRtk-0007Ye-Uy
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:4678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRti-0005NV-Dh
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:40 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22U2x7p0016620; 
 Wed, 30 Mar 2022 06:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=JExKC+xPfGEK9iQTGCK+Tq9CMVSmwwriPO9ppJMjhcQ=;
 b=eFQVouyE53hZNMjzffeiJsHzdV7CKL0RKVt8GO7xOPkkWMw7hMc1WPeoBUUYuKE4H7R7
 BicnSh4OojI1KmRbrYS4WvOZodZmCHDokjEJUa7uxWEBvrrltElYQRxWjgSFU+pDflIR
 5ShJFLM5evluiQkhoNY8ltRXghGxBYl4l+O0PTeIE4KK9XwCzmrxQnyOWCL5CUTH41Ps
 CasUHo96w+qNYQ+krQnqHD8a0m9w/j0IrxRnEPC3NMaj/ztHyma7+SxgqLlVDdQFzdSj
 6n4u3XXNOg3BQKeS9nNOiNKpaqFGUhQ41HNuiMBUhCs1b74QfUGNPOFvLUwes0MZ4FPB 0Q== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1uctrp2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22U6Gxc0113214;
 Wed, 30 Mar 2022 06:33:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3f1rv8egk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJZ4G308wAD1inSTqoUJYH2EUvPWGr0BerI1YyCCJk9z5UCuClhkTeLQFLVlEJmGZ/4GcaWmyuZ+ofSsGmBuu7NzdUn7t9oMiiH3aBT2IhZBhXY6Pus6kOaqJG0d0QSZdpaPaVwOVHFIPagwDeP4b8kUvlosEjiWB8WVFuH2m6n+rGyembOLp3bW5Wo/caKLjl8RqEiypt9qVPGuIdZ00fUja5JYJmbKV+boAEMYiqLI4divDjnYhM/CKoiyDn4l76tWsoa9KajODSPqZCRAUn1vVhTbDCgPBfbrzf+XEkrHJoLGbTTm16QNp99+gxXaOYpnpJNQYUEaBu5OM4cyzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JExKC+xPfGEK9iQTGCK+Tq9CMVSmwwriPO9ppJMjhcQ=;
 b=K9F4mUzUKrzl88N3hw1NZyFP0ap8ytupu0nVwtcrUj5Fr9Z9H9xikcfAVjQuVl6k1OZ2CRNhq0pdg569UVtuw574WtfqfiMXdbMhYhRExB3mjyG3ucZNu2u1g+8tOCAMk73dsNbjZ5y2a3oh6IesFn1XqCSGwi58E65+VnLgGtmzuy+8ORMgdn9weJYdWKaRaxmJG7r9ALq5FQkIpgsvm5V8pwQ3U6+P1rda27KNVCKihSFOh32bv1s9UZFuQ3e95o8kHyxNio0MTazBNlQRw4YoGIPatDc1T7n9eGi6OKE8/WepftEPPdU9UYOvAkrqb5dljqx+VUgc/HEYSuZtqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JExKC+xPfGEK9iQTGCK+Tq9CMVSmwwriPO9ppJMjhcQ=;
 b=FLP84Z6ZB0fj9spnRvELCzuyZ4UHtzYqd2405dRGrjFgob7kaejJ5OQ/QgAmLOXcN3qKu1IDdRP0I2vYgFE6g1cLNFPgW/5V/Sg3d+apYgjCoLbx+qSmTDgm/xRNV68tJJSb67ti30HXe9MwCtqvuTa/bT6XN9hc7ZpjbLHyX1o=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB3130.namprd10.prod.outlook.com (2603:10b6:5:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 06:33:33 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:33:32 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] virtio: don't read pending event on host notifier if
 disabled
Date: Tue, 29 Mar 2022 23:33:14 -0700
Message-Id: <1648621997-22416-5-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:5:190::19) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba91b7c8-c283-416c-b237-08da1217361a
X-MS-TrafficTypeDiagnostic: DM6PR10MB3130:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3130BFDF70C1CB0F35999986B11F9@DM6PR10MB3130.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7NnLmkHICcYEXStLy0QaopA9uU3FHgPsdWCm6sj3ziEQiyVC2gvTvvjjvrQ+Sl3bsKGuKnB9huHcEfJh/nd5brKO8ca1GlVV618j09I/SZyki+63LAytZoaKOJylgTx3vIQ8q8g7qtabWW/NIifjjdu8n8p6ELtuGKwzPs2qj/eDOeah90jghqRKyXSVh8+iuQEE1qOVeXQJrQCiG8o6GN8pcazYl9WDVINChg3YMHY+kgjpr/4y9LIgLp6SvKq3/QMshmEwBTTQUkCgSCygloKIrvWvEjTdBZKvVwp9CifwiX5KD26ehL0mB70N8IkcHkoJd/t/hGRRp8voo5rELuSuKB6KeecPM5ToNLXg2UCUfF5C6mJDU1OF+s77WuTZ5uvEWZTbZPzoFKSxq8XiaAkfwsXwxXhAo8EQBJnHOpYC+MBQOiEPmprka+4v9hS/6MP9RjkgPyHxGq+AQBmKz6IRD0wDoEYUScFgOU+Tb9luR6bepvwkj1WIKdhfULlWgYwl2Ce18xK9NXvZ5ymMBM8wu/Ud5TN+MGvwGuAO6512fUQumoxNaujFNlGnhxWF9PuOLAs7m2tGMJpBa3WqP1lCopKku0K6NyaeiXK9VoyruwTrdDNjehb4UalYpc5GaUsIZ5ogf0tV5oWTII0KubkhoJZNqh4N5ohHumTCalL6BisdW7QXNZjbeogt33mlMixg0Dq4NuIfdAtzJ3tTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(36756003)(2906002)(66946007)(66556008)(508600001)(8676002)(6486002)(6666004)(6512007)(4326008)(38350700002)(66476007)(52116002)(38100700002)(26005)(186003)(2616005)(316002)(6916009)(107886003)(86362001)(5660300002)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ly/X3uU2Z7hBefKdUY75CbQnw1BXPcB+shDD0Nt556/XzaJzumphAkIpQXg2?=
 =?us-ascii?Q?RUrKs24ML4BH7NNKZz+3EIYqVhMXwYdn96192y+KfDeBnYNqXR0SmfGaiXjO?=
 =?us-ascii?Q?XrH45xyCfuVuS6DHNObh244vq/JSEsPEkB8LTD+sna1Xac1lSOVueFctyEo9?=
 =?us-ascii?Q?RvVoEItM4lhzZg6RG/iaFpWEGoodkPonifgCjWS2ahj1NoiUtjO483PkxSNf?=
 =?us-ascii?Q?YD6WGTxQMXULGxTEMbEs6NoojTMvnyhUfT7xWUMxrsMi8JXmMT/03x8S0HnK?=
 =?us-ascii?Q?+pU1Qkq0dDBN9xJx8pstMvLPTZjmJlLk2THp1qZIowfSHgZDNHjr3nVY8uS7?=
 =?us-ascii?Q?YCi5ztY0B9rMDlIzY3MJwQb9NFLFZu17sLCxOINDeUJw2055iMc6xALhINx6?=
 =?us-ascii?Q?U8vqcQUyG2e0NrXidMnp9qNg8ixd7WGvydgM9ErmMQVZgt6v7ii4N2eeTFpu?=
 =?us-ascii?Q?hPKwXwIW+S2l0i+omo25jKYJ0WOzU4DMEVTAX0+OIU53ZcAa1wV0uOOWeWHo?=
 =?us-ascii?Q?un2ykzrnPNAi6UNpQplGVfGUCvhH6H4n3+/WM8iRwJbMAlZNrCQCewZDwBIi?=
 =?us-ascii?Q?f/aYVPxSDGhaj6calb8KO6iatPI/T6PDCJfLQYGm94g3q2mv+v8vQ8tz15Y9?=
 =?us-ascii?Q?J8Rzo1eqowsS55++P+ynTthZbI6BoY2f5W4dAX3NMuNO+Bgw6KPcsnxxWNJ6?=
 =?us-ascii?Q?24b0kjpnrIE8mGaSzU7BsYBwrhtI+kGfCHZiMvvq9Dj+GxI9jI7wOO95JNZh?=
 =?us-ascii?Q?fkzSl7ovCSlMXWbjBwQKzwzmQc9Ni6C0HCKKN9c5Mccmhd0s+NwA76sN2DAk?=
 =?us-ascii?Q?zm2aYZ8qybECQMy5LrjDW5psmvGznjYkiThNQ7s+65U/LZ0nAI52vInDIGiF?=
 =?us-ascii?Q?aEFUCqFohelF1gSkVnqzBHzu0y6OAEvCWbkH/erQlZ+Q+VBSms3s/EJ7rBfN?=
 =?us-ascii?Q?we1DnM/UPacFd8ukUtaprjmuYuJY1Ewv3ED2orByvXVen3hlDrT4NAnfecbU?=
 =?us-ascii?Q?MKdVtjc2Z7NMe7nyExYMZNJlIdunA0a77ayo9QD1B88wbhVY3HIwTxNoTWER?=
 =?us-ascii?Q?LMnr8ju60qQPHCFIdYc7ohXHe7I8RAFAyw6giGIS3X9DB5e1b3ZDsjyhBUbp?=
 =?us-ascii?Q?N3KXYQQNU5006GQnS6R3EUK+kdbeUvHHB14HbHSdT0CoaLZkjYsPVBxYr4vV?=
 =?us-ascii?Q?dUpcXqN6rLsuYLORD9DEZg5gxvzBAV9e9ibUNKKBRC2ydIfAk0NVaBOT4hPf?=
 =?us-ascii?Q?5X3Wo7H7XxTgLGWKqHG94GG9kyGQu5LnvSRxFUT0uSRTfV1ujYP+1GrMLuHS?=
 =?us-ascii?Q?qSbXdyhtoatlpIV11uh3+odoaIvESkTGnXj05Bgu9F875BuU/wztroCoFybd?=
 =?us-ascii?Q?Qmquvn3VpTYomOZwkdSnBkcvJpApnTjF6x8Oi37DgNGPe6CotKzci6qgbLr5?=
 =?us-ascii?Q?V5AQs1IoqLfBOc68tWONYoXQAisQqoCrIt6jeTQWWUJv+ezbWOxAnWxgTtLv?=
 =?us-ascii?Q?zutbg4fJ/HaWOEzV0ykeg9BFGk1jpWatFq4kBrRVSO4sxwF/DnBMZAnC5Nc4?=
 =?us-ascii?Q?9Q/anNwW5uOtrKY87AQJx3+iyxrPNb+zjvnPlfksFkW/3h8nQYn4337kxkfU?=
 =?us-ascii?Q?x56zHCjo5JofHIPaYx6QB3C7DUkZ6147UdUXzrgWxyu4lm/1qc8ze71wJ1ol?=
 =?us-ascii?Q?OTvf+kE7DEA+D9G7oTXRX91fJfJxAcmri9jax+m4tnbmPAaqFBet7CUFsRXd?=
 =?us-ascii?Q?1uSCzSkF43b1qbzwbF+0MVGDy7dL3ac=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba91b7c8-c283-416c-b237-08da1217361a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:33:32.8863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgmdF7/4rn2zKMvPIpdDJvDe2oAV0XE74hs2FXT4086/vT73xhAqQ7hschnnR5Ybhm6XEz92hu/kNCAysJfJDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3130
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300030
X-Proofpoint-ORIG-GUID: WuvlXlTiQ3QAbKC7RalA0u8MCB-GuQvM
X-Proofpoint-GUID: WuvlXlTiQ3QAbKC7RalA0u8MCB-GuQvM
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: si-wei.liu@oracle.com, eperezma@redhat.com, jasowang@redhat.com,
 eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previous commit prevents vhost-user and vhost-vdpa from using
userland vq handler via disable_ioeventfd_handler. The same
needs to be done for host notifier cleanup too, as the
virtio_queue_host_notifier_read handler still tends to read
pending event left behind on ioeventfd and attempts to handle
outstanding kicks from QEMU userland vq.

If vq handler is not disabled on cleanup, it may lead to sigsegv
with recursive virtio_net_set_status call on the control vq:

0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
   at ../hw/virtio/virtio-pci.c:974
8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:361
10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
   at ../softmmu/memory.c:492
15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
   at ../softmmu/memory.c:1504
17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at ../../../include/qemu/host-utils.h:165
18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
   at ../softmmu/physmem.c:2914
20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
   attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6

Fixes: 4023784 ("vhost-vdpa: multiqueue support")
Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 hw/virtio/virtio-bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 0f69d1c..3159b58 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -311,7 +311,8 @@ void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n)
     /* Test and clear notifier after disabling event,
      * in case poll callback didn't have time to run.
      */
-    virtio_queue_host_notifier_read(notifier);
+    if (!vdev->disable_ioeventfd_handler)
+        virtio_queue_host_notifier_read(notifier);
     event_notifier_cleanup(notifier);
 }
 
-- 
1.8.3.1


