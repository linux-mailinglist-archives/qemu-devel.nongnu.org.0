Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA144BEC4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:35:49 +0100 (CET)
Received: from localhost ([::1]:60646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkxH-0003CX-C5
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:35:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkmG-0002cf-Vw; Wed, 10 Nov 2021 05:24:25 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkmB-0005Ex-Kj; Wed, 10 Nov 2021 05:24:24 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AA9Sx5b002048; 
 Wed, 10 Nov 2021 10:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Xl9Z4HnN3zsmjcnUDPVbIFGY/THLbGE4VE9vFt5wPiQ=;
 b=hF0Ng7qIvfIpfQZMqwqHbJiFAlxcacxMO/xdgwe0xEDq3V2ZPNLVuRZBVAZ0beQVZ3rL
 2mRl98a/kfSPtQIopWfZvxrj69cQy4eFdMq42lMXELDbR6KBNSOEnZFx5drNEtm2Ux4o
 pUcK2ZAuqFPutA8aKm2cwpCWi5cOR/Dj49PN/r5z9hyKQfNKXni+3/1cccNEfaO6nsGT
 1dqJiQiZP/dgpxfyXp4IO9jVITL1XHC6G2FcOVTwwNh4Pk3pUP9EYd6vEeL1tSIjojKI
 YkSLB0WncIPU8eFNm+W8CsIeS5rBWDYBHH8XfqzYxGUtYUy9zg0yBRtCLSTn5/Y6WSDM Qw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c880rsemq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAGOCU034660;
 Wed, 10 Nov 2021 10:23:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3c5frfd2wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rxq1DqV7Te2wOWnu+X6xx03ua2ILOLccAefYCAk2eYo8MvB68ypnq/cqwL0q8QiGnneioZLGzgNgb8HTTWBRaGgdKeTWvki+aAGKR7QcTOEe0Zu3qL4T422iMtpUFOaiUf5B6+Gxl4XE7V6cqAtb4KsY7NPec/JuiJPeHrVkY8U77bSlm10k2taa9jkeoGQL+HVa2AFhFse1wl7oeSHC0FLNswGWcp8p4bnNxFovlxanxFCqKfRMSR43+lt5YfFkUC4jwzrSLOwcxzxY1JDfPF5yb414YEiGuxtgJPlcwTzPZZYVU5KIba6AEMSEAhU0PQCWAHVjwU4FCX4RZtiIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xl9Z4HnN3zsmjcnUDPVbIFGY/THLbGE4VE9vFt5wPiQ=;
 b=Y5TFk43ynZ+iqceWI2yJ+6U63rZpb0tOFEK+zrBIrYcgishYcmFayyUyVyOKK46qG86T/vw6x6mDfITwC2pjig6zZCSMVSbdVxhmgS6KmDgrPbTRQUhq+DElUHXOxLSq0FNR5tmw/Wg28M6Oru9Thh3f1ijpHNKEN8OsuXsTPOzgAmMTrD4bVnH3kk+WDNzCwsD/eRduFQxrwXRTR2maZmhbT33VX87sXxMEaQP6MX4HTfXGDK7c6lo1SNxTvV3YaPIX0iYnRFyPQSS7bJk7+vQx54phk41XKIHwbgjXdUY47JtjtwwV1A4ygQEGTxc1wt65PiyytP6LlZ7eHUbaDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xl9Z4HnN3zsmjcnUDPVbIFGY/THLbGE4VE9vFt5wPiQ=;
 b=BKs0sEBT3hxxt3DXzUTsqbf5bOqRn+Dgn0FqDIa2WY08aodcW7r0sBWyPBbJY4/vzZov3trMk6f9T8NGiYGqgCBtaXFzphIcKp4Z95y7FNdz7SEuXivysBFdvg9ifOVY2DEkj4aqJKY/LHc6b7oraJ7PPb65g9nWVVyZUaYvaqA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5895.namprd10.prod.outlook.com (2603:10b6:510:14c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 10 Nov
 2021 10:23:51 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:23:51 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 5/8] qmp: decode feature & status bits in virtio-status
Date: Wed, 10 Nov 2021 05:23:09 -0500
Message-Id: <1636539792-20967-6-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.43) by
 SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Wed, 10 Nov 2021 10:23:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d51235c-4b19-476a-276b-08d9a43430c2
X-MS-TrafficTypeDiagnostic: PH0PR10MB5895:
X-Microsoft-Antispam-PRVS: <PH0PR10MB5895ADBFC2EED65239402B93E8939@PH0PR10MB5895.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aTvXsM7iG+7n/l8yU5+UmA4amE6mvXTSXF5o4rIDm8lHI4YvNtc9yryT3BGLI+LQ9wvdvLwMa+Gpv8Y3Y8cyGzeALfXHJHfe9gju0wTwYd5LHBlvh/LEfJzxT0VVAN7++shI7mmDOZkFVV/pQPL4MpGRajG/hHWAFLgZCvGjMujI5pvsdND+DpF5yQKhkmYJQSDxVE5ngyh9PiaUGccKAgoImjQnRIC5V/y5AOPpCwq+9GsVj84lMCJwm2dgs6oNl/oyuum4V5oAa1lqo7FP9I2OKPesxV0dcqUi+yRMDBSiqmVlG/yAfuf5W0j7r+QYDEAc2MdhfTiH0gFC3quQ11SzxLalCOtIUQvSyxxYOni1rpxubHRCMEQhD7UIuLio086/Mce6l3Ll80hb9+eTyPfOKpDJCe0Cf4UoOAIJvu39G88uQA3jAkW1afCb2lowqbh/tXqbLPwWCK68VLVvl8J3VqZQphTtpZIDczrdz7/QFbWVThQWu3wgp8NdrMg7bPCs2yHrJQUMYzVoUha4xc/3XKCJqoaQkrYSB2D5KSAmIZPTzz4pPvlNKLjZFEKlaAW6er1DhzLyR04i4NA8SDZCR7R+LEYFwl9I779PwRKkfOoYcmtqUbewWUZoAA9PG2fhSSFDoaAeOB9080ghpUysLifGtP2aESUhPuI2rP17PKIgZqzIqFQBqcqse5cOQLeQR+hdTenIUusoGl3qaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(7696005)(44832011)(83380400001)(956004)(2616005)(7416002)(5660300002)(6666004)(36756003)(2906002)(26005)(186003)(30864003)(86362001)(4326008)(8676002)(38100700002)(8936002)(52116002)(6916009)(38350700002)(6486002)(66556008)(508600001)(66476007)(66946007)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sfkolZKOHj+Lc4FId5sUf/+Mapaijft6DMaGrtp6wzvVsXWsNgEkKv9e7yT1?=
 =?us-ascii?Q?y3Wjck7NySIt2jJ77jJJPX5I/DTBzXINUavGq51VMuH2j+BDSv6NaJNqWu7v?=
 =?us-ascii?Q?xFf4PJThLiAIlC+TshHAoVsaZZIp/iCLzooFLFUrF6ux+Tj6U1uiN3jbDjWK?=
 =?us-ascii?Q?452en6Kbvmu49vkJdrWT95qJkkEYhya/09+i5P2FQeO/cdNWVzUVHPMJJk/i?=
 =?us-ascii?Q?I8mg4zSNIsgEHbMhCEzmr1PnZl/i9nmYZKs13vHCf1zK0r6+8NsTyvAeBhwR?=
 =?us-ascii?Q?WvttxswqqDaPg7tS79qRoNFUPtYddgnQRgcbbZGj2GCvSgW4Gc7cwXmMysGJ?=
 =?us-ascii?Q?I+2inPPmsSotXrBoAFl+Otpu6qtxkD0Y2iLw7/UzoSa7nbBywaZygZh9963c?=
 =?us-ascii?Q?+d+5K7Cr9U5ouRa43AkfShkY45iIMqIjOpAngwUlWE8/1NYg3cPjiYK7PqIM?=
 =?us-ascii?Q?xNYu6VSZG4G4l/gYGZcq6TrEt1SWjydvUpgnrqrOJQCv8ggmiQ6s7wM5Gm0n?=
 =?us-ascii?Q?X3LXPfUZ7kBEuolGzI8pa47TjprM7DTSAMimCmPZ9hfzEDxHQ9eSetNKjjdu?=
 =?us-ascii?Q?ubpnR3GipIGuGfhVWYwaAG74UBZfG1X6sI32zrCpo8oKOUkxxMLjh87apzpu?=
 =?us-ascii?Q?JU5WE48zw4OZ67muE+WUTGyLcWXExZzHZ/D4n45MBMcP5B9Xds7l2KBzSBPd?=
 =?us-ascii?Q?eA0v5klknzZZT/WN/7u+sqFYE0HDr4zuO4HgX49Sc9dxLA6z4QwkIT9ZHsud?=
 =?us-ascii?Q?retEvcEO71VLIsNLNcJhwhpxsMX4uP5vAPF8ShOVdWKzZ+QVqb1rDtyQnnM4?=
 =?us-ascii?Q?w+3+4K0xmW6zZdDzRAq/C3B8xgRGsOgwPoKbkThPc0BhpH1WbW2j+Je/jwK3?=
 =?us-ascii?Q?Q7n6zzZ8nuGvgSEgQyPPRyiGGwsL6kaDYHinKlHHY+C0KzKlXulUdI3ooYVU?=
 =?us-ascii?Q?szcTc0r0qcmzTxPl1Gt82KtTogw87HruKf2VOzvr1DTeokKXaa5p3giuPk0I?=
 =?us-ascii?Q?eh9GZkbX1pY558YTLD7NX+DUZ+grTWS/P1m0GclWfdrASIhpS/e751EWwhrc?=
 =?us-ascii?Q?lu2eyTFlYWT99jumyoxl0e//kZOKUjJyiBGOk2A4Opfj/gYL3rQs+vD7pUTa?=
 =?us-ascii?Q?4FEBd55XpCKR7fWQqhk7NcHzs6ZhzbwEcwZ8NkVTzd4SgCv+8s3zdWkAj4DZ?=
 =?us-ascii?Q?v+542lqEE3fv2UlqyQgNowZ2so3Mf1nWKnFXaureP9n5bioPOqfzcXOKAxKW?=
 =?us-ascii?Q?9r8TP0SSgpJOwXRJVm8NBarwuwqv3hh5q2G5ew2fdprPutxgRKtvnySyCwwF?=
 =?us-ascii?Q?oTVRqculWgalE/fyr/MwDVhM3oWqSThDQQLHpfVmwffBVE4p3z+7l/SW9W3Z?=
 =?us-ascii?Q?bT1tifKVnLS+pCtdgnkqLvHNUd7uzU+32/i9qGv7j9ypOlCpJXaJJD257Wy5?=
 =?us-ascii?Q?ax4MKZKqT7EEDP9OJaMVxOcg+L08tj1GtwUJdYxcLLHyVGBxRzqRyAfihLnC?=
 =?us-ascii?Q?DGtuynQeURI6DuRCraBq9I69U9rIbt0vxF4q/O8uu/Uf1HN4bWjzt8FLOjb7?=
 =?us-ascii?Q?sBH5s/3XqSjfh08Pkhi1SkT4hFApCpo88/lS07LyR3XMX2F3OKRujguJ31yp?=
 =?us-ascii?Q?e3d/sKwaqqbFgsy/+P+5Ox0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d51235c-4b19-476a-276b-08d9a43430c2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:23:51.4484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PD3Tq5JyRU/ynuZnEQwI3brrF3cmSxAdfmrPaPc6qx6zDFUGEiAxxxOaVcAX9eBH2AK9mDjulwuJFEzdrpgVVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5895
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100056
X-Proofpoint-GUID: TVae1cjczjo3fm2mDLln1SvNiVhQ1veB
X-Proofpoint-ORIG-GUID: TVae1cjczjo3fm2mDLln1SvNiVhQ1veB
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

Display feature names instead of bitmaps for host, guest, and
backend for VirtIODevice.

Display status names instead of bitmaps for VirtIODevice.

Display feature names instead of bitmaps for backend, protocol,
acked, and features (hdev->features) for vhost devices.

Decode features according to device type. Decode status
according to configuration status bitmap (config_status_map).
Decode vhost user protocol features according to vhost user
protocol bitmap (vhost_user_protocol_map).

Transport features are on the first line. Undecoded bits
(if any) are stored in a separate field. Vhost device field
wont show if there's no vhost active for a given VirtIODevice.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/block/virtio-blk.c          |  28 ++
 hw/char/virtio-serial-bus.c    |  11 +
 hw/display/virtio-gpu-base.c   |  18 +-
 hw/input/virtio-input.c        |  11 +-
 hw/net/virtio-net.c            |  47 ++++
 hw/scsi/virtio-scsi.c          |  17 ++
 hw/virtio/vhost-user-fs.c      |  10 +
 hw/virtio/vhost-vsock-common.c |  10 +
 hw/virtio/virtio-balloon.c     |  14 +
 hw/virtio/virtio-crypto.c      |  10 +
 hw/virtio/virtio-iommu.c       |  14 +
 hw/virtio/virtio-mem.c         |  11 +
 hw/virtio/virtio.c             | 278 +++++++++++++++++++-
 include/hw/virtio/vhost.h      |   3 +
 include/hw/virtio/virtio.h     |  18 ++
 qapi/virtio.json               | 580 ++++++++++++++++++++++++++++++++++++++---
 16 files changed, 1035 insertions(+), 45 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 505e574..c2e901f 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
@@ -32,6 +33,7 @@
 #include "hw/virtio/virtio-bus.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-access.h"
+#include "standard-headers/linux/vhost_types.h"
 
 /* Config size before the discard support (hide associated config fields) */
 #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
@@ -48,6 +50,32 @@ static const VirtIOFeature feature_sizes[] = {
     {}
 };
 
+qmp_virtio_feature_map_t blk_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BLK_F_##name, VIRTIO_BLK_FEATURE_##name }
+    FEATURE_ENTRY(SIZE_MAX),
+    FEATURE_ENTRY(SEG_MAX),
+    FEATURE_ENTRY(GEOMETRY),
+    FEATURE_ENTRY(RO),
+    FEATURE_ENTRY(BLK_SIZE),
+    FEATURE_ENTRY(TOPOLOGY),
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(DISCARD),
+    FEATURE_ENTRY(WRITE_ZEROES),
+#ifndef VIRTIO_BLK_NO_LEGACY
+    FEATURE_ENTRY(BARRIER),
+    FEATURE_ENTRY(SCSI),
+    FEATURE_ENTRY(FLUSH),
+    FEATURE_ENTRY(CONFIG_WCE),
+#endif /* !VIRTIO_BLK_NO_LEGACY */
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_BLK_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_features)
 {
     s->config_size = MAX(VIRTIO_BLK_CFG_SIZE,
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 232f4c9..fa57059 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -32,6 +33,16 @@
 #include "hw/virtio/virtio-serial.h"
 #include "hw/virtio/virtio-access.h"
 
+qmp_virtio_feature_map_t serial_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_CONSOLE_F_##name, VIRTIO_SERIAL_FEATURE_##name }
+    FEATURE_ENTRY(SIZE),
+    FEATURE_ENTRY(MULTIPORT),
+    FEATURE_ENTRY(EMERG_WRITE),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static struct VirtIOSerialDevices {
     QLIST_HEAD(, VirtIOSerial) devices;
 } vserdevices;
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 5411a7b..a322349 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -12,13 +12,29 @@
  */
 
 #include "qemu/osdep.h"
-
+#include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-gpu.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
+qmp_virtio_feature_map_t gpu_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_GPU_F_##name, VIRTIO_GPU_FEATURE_##name }
+    FEATURE_ENTRY(VIRGL),
+    FEATURE_ENTRY(EDID),
+    FEATURE_ENTRY(RESOURCE_UUID),
+    FEATURE_ENTRY(RESOURCE_BLOB),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_GPU_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 void
 virtio_gpu_base_reset(VirtIOGPUBase *g)
 {
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 5b5398b..b4562a3 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -6,6 +6,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -13,11 +14,19 @@
 #include "hw/virtio/virtio.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-input.h"
-
+#include "standard-headers/linux/vhost_types.h"
 #include "standard-headers/linux/input.h"
 
 #define VIRTIO_INPUT_VM_VERSION 1
 
+qmp_virtio_feature_map_t input_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_INPUT_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 /* ----------------------------------------------------------------- */
 
 void virtio_input_send(VirtIOInput *vinput, virtio_input_event *event)
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 2449b9c..ece871a 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -35,9 +35,11 @@
 #include "hw/qdev-properties.h"
 #include "qapi/qapi-types-migration.h"
 #include "qapi/qapi-events-migration.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/virtio/virtio-access.h"
 #include "migration/misc.h"
 #include "standard-headers/linux/ethtool.h"
+#include "standard-headers/linux/vhost_types.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "monitor/qdev.h"
@@ -89,6 +91,51 @@
                                          VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
                                          VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
 
+qmp_virtio_feature_map_t net_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_NET_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(CSUM),
+    FEATURE_ENTRY(GUEST_CSUM),
+    FEATURE_ENTRY(CTRL_GUEST_OFFLOADS),
+    FEATURE_ENTRY(MTU),
+    FEATURE_ENTRY(MAC),
+    FEATURE_ENTRY(GUEST_TSO4),
+    FEATURE_ENTRY(GUEST_TSO6),
+    FEATURE_ENTRY(GUEST_ECN),
+    FEATURE_ENTRY(GUEST_UFO),
+    FEATURE_ENTRY(HOST_TSO4),
+    FEATURE_ENTRY(HOST_TSO6),
+    FEATURE_ENTRY(HOST_ECN),
+    FEATURE_ENTRY(HOST_UFO),
+    FEATURE_ENTRY(MRG_RXBUF),
+    FEATURE_ENTRY(STATUS),
+    FEATURE_ENTRY(CTRL_VQ),
+    FEATURE_ENTRY(CTRL_RX),
+    FEATURE_ENTRY(CTRL_VLAN),
+    FEATURE_ENTRY(CTRL_RX_EXTRA),
+    FEATURE_ENTRY(GUEST_ANNOUNCE),
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(CTRL_MAC_ADDR),
+    FEATURE_ENTRY(HASH_REPORT),
+    FEATURE_ENTRY(RSS),
+    FEATURE_ENTRY(RSC_EXT),
+    FEATURE_ENTRY(STANDBY),
+    FEATURE_ENTRY(SPEED_DUPLEX),
+#ifndef VIRTIO_NET_NO_LEGACY
+    FEATURE_ENTRY(GSO),
+#endif /* VIRTIO_NET_NO_LEGACY */
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_NET_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(VIRTIO_NET_HDR),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_NET_F_MAC,
      .end = endof(struct virtio_net_config, mac)},
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index ce71939..9a62d6e 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -15,7 +15,9 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-scsi.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/error-report.h"
@@ -29,6 +31,21 @@
 #include "hw/virtio/virtio-access.h"
 #include "trace.h"
 
+qmp_virtio_feature_map_t scsi_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_SCSI_F_##name, VIRTIO_SCSI_FEATURE_##name }
+    FEATURE_ENTRY(INOUT),
+    FEATURE_ENTRY(HOTPLUG),
+    FEATURE_ENTRY(CHANGE),
+    FEATURE_ENTRY(T10_PI),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_SCSI_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static inline int virtio_scsi_get_lun(uint8_t *lun)
 {
     return ((lun[2] << 8) | lun[3]) & 0x3FFF;
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index e513e4f..092c3fa 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -15,6 +15,7 @@
 #include <sys/ioctl.h>
 #include "standard-headers/linux/virtio_fs.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/virtio/virtio-bus.h"
@@ -23,6 +24,15 @@
 #include "hw/virtio/vhost-user-fs.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
+#include "standard-headers/linux/vhost_types.h"
+
+qmp_virtio_feature_map_t fs_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VHOST_USER_FS_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
 
 static const int user_feature_bits[] = {
     VIRTIO_F_VERSION_1,
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 665a0df..32feb69 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -11,12 +11,22 @@
 #include "qemu/osdep.h"
 #include "standard-headers/linux/virtio_vsock.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/virtio/virtio-access.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-vsock.h"
 #include "qemu/iov.h"
 #include "monitor/monitor.h"
+#include "standard-headers/linux/vhost_types.h"
+
+qmp_virtio_feature_map_t vsock_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VHOST_VSOCK_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
 
 const int feature_bits[] = {
     VIRTIO_VSOCK_F_SEQPACKET,
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 641a394..532016c 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -27,6 +27,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-machine.h"
 #include "qapi/visitor.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "migration/misc.h"
@@ -37,6 +38,19 @@
 
 #define BALLOON_PAGE_SIZE  (1 << VIRTIO_BALLOON_PFN_SHIFT)
 
+qmp_virtio_feature_map_t balloon_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BALLOON_F_##name, VIRTIO_BALLOON_FEATURE_##name }
+    FEATURE_ENTRY(MUST_TELL_HOST),
+    FEATURE_ENTRY(STATS_VQ),
+    FEATURE_ENTRY(DEFLATE_ON_OOM),
+    FEATURE_ENTRY(FREE_PAGE_HINT),
+    FEATURE_ENTRY(PAGE_POISON),
+    FEATURE_ENTRY(REPORTING),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 typedef struct PartiallyBalloonedPage {
     ram_addr_t base_gpa;
     unsigned long *bitmap;
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 7d63b8c..f626ba8 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -16,6 +16,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 
 #include "hw/virtio/virtio.h"
@@ -23,10 +24,19 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-access.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
 #include "sysemu/cryptodev-vhost.h"
 
 #define VIRTIO_CRYPTO_VM_VERSION 1
 
+qmp_virtio_feature_map_t crypto_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_CRYPTO_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 /*
  * Transfer virtqueue index to crypto queue index.
  * The control virtqueue is after the data virtqueues
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 92c5eb7..9a09293 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -25,6 +25,7 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
@@ -40,6 +41,19 @@
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
 
+qmp_virtio_feature_map_t iommu_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_IOMMU_F_##name, VIRTIO_IOMMU_FEATURE_##name }
+    FEATURE_ENTRY(INPUT_RANGE),
+    FEATURE_ENTRY(DOMAIN_RANGE),
+    FEATURE_ENTRY(MAP_UNMAP),
+    FEATURE_ENTRY(BYPASS),
+    FEATURE_ENTRY(PROBE),
+    FEATURE_ENTRY(MMIO),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 typedef struct VirtIOIOMMUDomain {
     uint32_t id;
     GTree *mappings;
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index e217520..eb62104 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -25,6 +25,7 @@
 #include "hw/virtio/virtio-mem.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "exec/ram_addr.h"
 #include "migration/misc.h"
 #include "hw/boards.h"
@@ -46,6 +47,16 @@
 #define VIRTIO_MEM_DEFAULT_THP_SIZE VIRTIO_MEM_MIN_BLOCK_SIZE
 #endif
 
+qmp_virtio_feature_map_t mem_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_MEM_F_##name, VIRTIO_MEM_FEATURE_##name  }
+#ifndef CONFIG_ACPI
+    FEATURE_ENTRY(ACPI_PXM),
+#endif /* CONFIG_ACPI */
+#undef FEATURE_ENTRY
+    { -1, -1  }
+};
+
 /*
  * We want to have a reasonable default block size such that
  * 1. We avoid splitting THPs when unplugging memory, which degrades
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 580d9a8..b3b3578 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -30,11 +30,100 @@
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
+#include CONFIG_DEVICES
 
 /* QAPI list of VirtIODevices */
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
 
 /*
+ * Maximum size of virtio device config space
+ */
+#define VHOST_USER_MAX_CONFIG_SIZE 256
+
+enum VhostUserProtocolFeature {
+    VHOST_USER_PROTOCOL_F_MQ = 0,
+    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
+    VHOST_USER_PROTOCOL_F_RARP = 2,
+    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
+    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
+    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
+    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
+    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
+    VHOST_USER_PROTOCOL_F_CONFIG = 9,
+    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
+    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
+    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
+    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
+    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_MAX
+};
+
+static qmp_virtio_feature_map_t transport_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+#ifndef VIRTIO_CONFIG_NO_LEGACY
+    FEATURE_ENTRY(NOTIFY_ON_EMPTY),
+    FEATURE_ENTRY(ANY_LAYOUT),
+#endif /* VIRTIO_CONFIG_NO_LEGACY */
+    FEATURE_ENTRY(VERSION_1),
+    FEATURE_ENTRY(IOMMU_PLATFORM),
+    FEATURE_ENTRY(RING_PACKED),
+    FEATURE_ENTRY(ORDER_PLATFORM),
+    FEATURE_ENTRY(SR_IOV),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_RING_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+    FEATURE_ENTRY(INDIRECT_DESC),
+    FEATURE_ENTRY(EVENT_IDX),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_USER_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+    FEATURE_ENTRY(PROTOCOL_FEATURES),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
+static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_USER_PROTOCOL_F_##name, VHOST_PROTOCOL_FEATURE_##name }
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(LOG_SHMFD),
+    FEATURE_ENTRY(RARP),
+    FEATURE_ENTRY(REPLY_ACK),
+    FEATURE_ENTRY(NET_MTU),
+    FEATURE_ENTRY(SLAVE_REQ),
+    FEATURE_ENTRY(CROSS_ENDIAN),
+    FEATURE_ENTRY(CRYPTO_SESSION),
+    FEATURE_ENTRY(PAGEFAULT),
+    FEATURE_ENTRY(CONFIG),
+    FEATURE_ENTRY(SLAVE_SEND_FD),
+    FEATURE_ENTRY(HOST_NOTIFIER),
+    FEATURE_ENTRY(INFLIGHT_SHMFD),
+    FEATURE_ENTRY(RESET_DEVICE),
+    FEATURE_ENTRY(INBAND_NOTIFICATIONS),
+    FEATURE_ENTRY(CONFIGURE_MEM_SLOTS),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
+/* virtio device configuration statuses */
+static qmp_virtio_feature_map_t config_status_map[] = {
+#define STATUS_ENTRY(name) \
+    { VIRTIO_CONFIG_S_##name, VIRTIO_CONFIG_STATUS_##name }
+    STATUS_ENTRY(DRIVER_OK),
+    STATUS_ENTRY(FEATURES_OK),
+    STATUS_ENTRY(DRIVER),
+    STATUS_ENTRY(NEEDS_RESET),
+    STATUS_ENTRY(FAILED),
+    STATUS_ENTRY(ACKNOWLEDGE),
+#undef STATUS_ENTRY
+    { -1, -1 }
+};
+
+/*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
  * which don't provide a means for the guest to tell the host the alignment.
@@ -3949,6 +4038,169 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
+#define CONVERT_FEATURES(type, map, is_status)      \
+    ({                                              \
+        type *list = NULL;                          \
+        type *node;                                 \
+        for (i = 0; map[i].virtio_bit != -1; i++) { \
+            if (is_status) {                        \
+                bit = map[i].virtio_bit;            \
+            }                                       \
+            else {                                  \
+                bit = 1ULL << map[i].virtio_bit;    \
+            }                                       \
+            if ((bitmap & bit) == 0) {              \
+                continue;                           \
+            }                                       \
+            node = g_new0(type, 1);                 \
+            node->value = map[i].qapi_virtio_enum;  \
+            node->next = list;                      \
+            list = node;                            \
+            bitmap ^= bit;                          \
+        }                                           \
+        list;                                       \
+    })
+
+static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
+{
+    VirtioDeviceStatus *status;
+    uint8_t bit;
+    int i;
+
+    status = g_new0(VirtioDeviceStatus, 1);
+    status->dev_status = CONVERT_FEATURES(VirtioConfigStatusList, \
+                                          config_status_map, 1);
+    status->has_unknown_statuses = bitmap != 0;
+    if (status->has_unknown_statuses) {
+        status->unknown_statuses = bitmap;
+    }
+
+    return status;
+}
+
+static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
+{
+    VhostDeviceProtocols *vhu_protocols;
+    uint64_t bit;
+    int i;
+
+    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
+    vhu_protocols->features =
+                    CONVERT_FEATURES(VhostProtocolFeatureList,
+                                     vhost_user_protocol_map, 0);
+    vhu_protocols->has_unknown_protocols = bitmap != 0;
+    if (vhu_protocols->has_unknown_protocols) {
+        vhu_protocols->unknown_protocols = bitmap;
+    }
+
+    return vhu_protocols;
+}
+
+static VirtioDeviceFeatures *qmp_decode_features(const char *name,
+                                                 uint64_t bitmap)
+{
+    VirtioDeviceFeatures *features;
+    uint64_t bit;
+    int i;
+
+    features = g_new0(VirtioDeviceFeatures, 1);
+
+    /* transport features */
+    features->transport = CONVERT_FEATURES(VirtioTransportFeatureList, \
+                                           transport_map, 0);
+    /* device features */
+    features->type = qapi_enum_parse(&VirtioType_lookup, name, -1, NULL);
+
+    switch (features->type) {
+#ifdef CONFIG_VIRTIO_SERIAL
+    case VIRTIO_TYPE_VIRTIO_SERIAL:
+        features->u.virtio_serial.features =
+                CONVERT_FEATURES(VirtioSerialFeatureList, serial_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BLK
+    case VIRTIO_TYPE_VIRTIO_BLK:
+        features->u.virtio_blk.features =
+                CONVERT_FEATURES(VirtioBlkFeatureList, blk_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_GPU
+    case VIRTIO_TYPE_VIRTIO_GPU:
+        features->u.virtio_gpu.features =
+            CONVERT_FEATURES(VirtioGpuFeatureList, gpu_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_NET
+    case VIRTIO_TYPE_VIRTIO_NET:
+        features->u.virtio_net.features =
+            CONVERT_FEATURES(VirtioNetFeatureList, net_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_SCSI
+    case VIRTIO_TYPE_VIRTIO_SCSI:
+        features->u.virtio_scsi.features =
+            CONVERT_FEATURES(VirtioScsiFeatureList, scsi_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BALLOON
+    case VIRTIO_TYPE_VIRTIO_BALLOON:
+        features->u.virtio_balloon.features =
+            CONVERT_FEATURES(VirtioBalloonFeatureList, balloon_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_IOMMU
+    case VIRTIO_TYPE_VIRTIO_IOMMU:
+        features->u.virtio_iommu.features =
+            CONVERT_FEATURES(VirtioIommuFeatureList, iommu_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_INPUT
+    case VIRTIO_TYPE_VIRTIO_INPUT:
+        features->u.virtio_input.features =
+            CONVERT_FEATURES(VirtioInputFeatureList, input_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VHOST_USER_FS
+    case VIRTIO_TYPE_VHOST_USER_FS:
+        features->u.vhost_user_fs.features =
+            CONVERT_FEATURES(VhostUserFsFeatureList, fs_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VHOST_VSOCK
+    case VIRTIO_TYPE_VHOST_VSOCK:
+        features->u.vhost_vsock.features =
+            CONVERT_FEATURES(VhostVsockFeatureList, vsock_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_CRYPTO
+    case VIRTIO_TYPE_VIRTIO_CRYPTO:
+        features->u.virtio_crypto.features =
+            CONVERT_FEATURES(VirtioCryptoFeatureList, crypto_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_MEM
+    case VIRTIO_TYPE_VIRTIO_MEM:
+        features->u.virtio_mem.features =
+            CONVERT_FEATURES(VirtioMemFeatureList, mem_map, 0);
+        break;
+#endif
+    /* No features */
+    case VIRTIO_TYPE_VIRTIO_9P:
+    case VIRTIO_TYPE_VIRTIO_PMEM:
+    case VIRTIO_TYPE_VIRTIO_RNG:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    features->has_unknown_features = bitmap != 0;
+    if (features->has_unknown_features) {
+        features->unknown_features = bitmap;
+    }
+
+    return features;
+}
+
 VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     VirtIODevice *vdev;
@@ -3965,9 +4217,12 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     status->name = g_strdup(vdev->name);
     status->device_id = vdev->device_id;
     status->vhost_started = vdev->vhost_started;
-    status->guest_features = vdev->guest_features;
-    status->host_features = vdev->host_features;
-    status->backend_features = vdev->backend_features;
+    status->guest_features = qmp_decode_features(vdev->name,
+                                                 vdev->guest_features);
+    status->host_features = qmp_decode_features(vdev->name,
+                                                vdev->host_features);
+    status->backend_features = qmp_decode_features(vdev->name,
+                                                   vdev->backend_features);
 
     switch (vdev->device_endian) {
     case VIRTIO_DEVICE_ENDIAN_LITTLE:
@@ -3982,7 +4237,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     }
 
     status->num_vqs = virtio_get_num_queues(vdev);
-    status->status = vdev->status;
+    status->status = qmp_decode_status(vdev->status);
     status->isr = vdev->isr;
     status->queue_sel = vdev->queue_sel;
     status->vm_running = vdev->vm_running;
@@ -3995,7 +4250,8 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     status->bus_name = g_strdup(vdev->bus_name);
     status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
 
-    if (vdev->vhost_started) {
+    status->has_vhost_dev = vdev->vhost_started;
+    if (status->has_vhost_dev) {
         VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
         struct vhost_dev *hdev = vdc->get_vhost(vdev);
 
@@ -4003,10 +4259,14 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
         status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
         status->vhost_dev->nvqs = hdev->nvqs;
         status->vhost_dev->vq_index = hdev->vq_index;
-        status->vhost_dev->features = hdev->features;
-        status->vhost_dev->acked_features = hdev->acked_features;
-        status->vhost_dev->backend_features = hdev->backend_features;
-        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->features =
+            qmp_decode_features(vdev->name, hdev->features);
+        status->vhost_dev->acked_features =
+            qmp_decode_features(vdev->name, hdev->acked_features);
+        status->vhost_dev->backend_features =
+            qmp_decode_features(vdev->name, hdev->backend_features);
+        status->vhost_dev->protocol_features =
+            qmp_decode_protocols(hdev->protocol_features);
         status->vhost_dev->max_queues = hdev->max_queues;
         status->vhost_dev->backend_cap = hdev->backend_cap;
         status->vhost_dev->log_enabled = hdev->log_enabled;
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 3fa0b55..2c34cff 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -5,6 +5,9 @@
 #include "hw/virtio/virtio.h"
 #include "exec/memory.h"
 
+#define VHOST_F_DEVICE_IOTLB 63
+#define VHOST_USER_F_PROTOCOL_FEATURES 30
+
 /* Generic structures common for any vhost based device. */
 
 struct vhost_inflight {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index eceaafc..b5f9c95 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -71,6 +71,24 @@ typedef struct VirtQueueElement
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
+typedef struct {
+    int virtio_bit;
+    int qapi_virtio_enum;
+} qmp_virtio_feature_map_t;
+
+extern qmp_virtio_feature_map_t serial_map[];
+extern qmp_virtio_feature_map_t blk_map[];
+extern qmp_virtio_feature_map_t gpu_map[];
+extern qmp_virtio_feature_map_t net_map[];
+extern qmp_virtio_feature_map_t scsi_map[];
+extern qmp_virtio_feature_map_t balloon_map[];
+extern qmp_virtio_feature_map_t iommu_map[];
+extern qmp_virtio_feature_map_t input_map[];
+extern qmp_virtio_feature_map_t fs_map[];
+extern qmp_virtio_feature_map_t vsock_map[];
+extern qmp_virtio_feature_map_t crypto_map[];
+extern qmp_virtio_feature_map_t mem_map[];
+
 enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_UNKNOWN,
     VIRTIO_DEVICE_ENDIAN_LITTLE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 54212f2..6b11d52 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -67,6 +67,466 @@
 }
 
 ##
+# @VirtioType:
+#
+# An enumeration of Virtio device types (or names)
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioType',
+  'data': [ 'virtio-net', 'virtio-blk', 'virtio-serial', 'virtio-rng',
+            'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
+            'virtio-scsi', 'virtio-9p', 'virtio-mac-wlan',
+            'virtio-rproc-serial', 'virtio-caif', 'virtio-mem-balloon',
+            'virtio-gpu', 'virtio-clk', 'virtio-input', 'vhost-vsock',
+            'virtio-crypto', 'virtio-signal', 'virtio-pstore',
+            'virtio-iommu', 'virtio-mem', 'virtio-sound', 'vhost-user-fs',
+            'virtio-pmem', 'virtio-mac-hwsim', 'vhost-user-i2c',
+            'virtio-bluetooth' ]
+}
+
+##
+# @VirtioConfigStatus:
+#
+# An enumeration of Virtio device configuration statuses
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioConfigStatus',
+  'data': [ 'driver-ok', 'features-ok', 'driver', 'needs-reset',
+            'failed', 'acknowledge' ]
+}
+
+##
+# @VirtioDeviceStatus:
+#
+# A structure defined to list the configuration statuses of a virtio
+# device
+#
+# @dev-status: List of decoded configuration statuses of the virtio
+#              device
+#
+# @unknown-statuses: virtio device statuses bitmap that have not been decoded
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceStatus',
+  'data': { 'dev-status': [ 'VirtioConfigStatus' ],
+            '*unknown-statuses': 'uint8' } }
+
+##
+# @VhostProtocolFeature:
+#
+# An enumeration of Vhost User protocol features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VhostProtocolFeature',
+  'data': [ 'mq', 'log-shmfd', 'rarp', 'reply-ack', 'net-mtu',
+            'slave-req', 'cross-endian', 'crypto-session', 'pagefault',
+            'config', 'slave-send-fd', 'host-notifier',
+            'inflight-shmfd', 'reset-device', 'inband-notifications',
+            'configure-mem-slots' ]
+}
+
+##
+# @VhostDeviceProtocols:
+#
+# A structure defined to list the vhost user protocol features of a
+# Vhost User device
+#
+# @features: List of decoded vhost user protocol features of a vhost
+#            user device
+#
+# @unknown-protocols: vhost user device protocol features bitmap that
+#                     have not been decoded
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VhostDeviceProtocols',
+  'data': { 'features': [ 'VhostProtocolFeature' ],
+            '*unknown-protocols': 'uint64' } }
+
+##
+# @VirtioTransportFeature:
+#
+# An enumeration of Virtio device transport features, including virtio-ring
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioTransportFeature',
+  'data': [ 'notify-on-empty', 'any-layout', 'protocol-features',
+            'version-1', 'iommu-platform', 'ring-packed', 'order-platform',
+            'sr-iov', 'indirect-desc', 'event-idx' ]
+}
+
+##
+# @VirtioMemFeature:
+#
+# An enumeration of Virtio mem features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioMemFeature',
+  'data': [ 'acpi-pxm' ]
+}
+
+##
+# @VirtioSerialFeature:
+#
+# An enumeration of Virtio serial/console features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioSerialFeature',
+  'data': [ 'size', 'multiport', 'emerg-write' ]
+}
+
+##
+# @VirtioBlkFeature:
+#
+# An enumeration of Virtio block features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioBlkFeature',
+  'data': [ 'size-max', 'seg-max', 'geometry', 'ro', 'blk-size',
+            'topology', 'mq', 'discard', 'write-zeroes', 'barrier',
+            'scsi', 'flush', 'config-wce', 'log-all' ]
+}
+
+##
+# @VirtioGpuFeature:
+#
+# An enumeration of Virtio gpu features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioGpuFeature',
+  'data': [ 'virgl', 'edid', 'resource-uuid', 'resource-blob',
+            'log-all' ]
+}
+
+##
+# @VirtioNetFeature:
+#
+# An enumeration of Virtio net features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioNetFeature',
+  'data': [ 'csum', 'guest-csum', 'ctrl-guest-offloads', 'mtu', 'mac',
+            'guest-tso4', 'guest-tso6', 'guest-ecn', 'guest-ufo',
+            'host-tso4', 'host-tso6', 'host-ecn', 'host-ufo',
+            'mrg-rxbuf', 'status', 'ctrl-vq', 'ctrl-rx', 'ctrl-vlan',
+            'ctrl-rx-extra', 'guest-announce', 'mq', 'ctrl-mac-addr',
+            'hash-report', 'rss', 'rsc-ext', 'standby', 'speed-duplex',
+            'gso', 'virtio-net-hdr', 'log-all' ]
+}
+
+##
+# @VirtioScsiFeature:
+#
+# An enumeration of Virtio scsi features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioScsiFeature',
+  'data': [ 'inout', 'hotplug', 'change', 't10-pi', 'log-all' ]
+}
+
+##
+# @VirtioBalloonFeature:
+#
+# An enumeration of Virtio balloon features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioBalloonFeature',
+  'data': [ 'must-tell-host', 'stats-vq', 'deflate-on-oom',
+            'free-page-hint', 'page-poison', 'reporting' ]
+}
+
+##
+# @VirtioIommuFeature:
+#
+# An enumeration of Virtio iommu features
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioIommuFeature',
+  'data': [ 'input-range', 'domain-range', 'map-unmap', 'bypass',
+            'probe', 'mmio' ]
+}
+
+##
+# @VirtioInputFeature:
+#
+# An enumeration of Virtio input features. Note that virtio-input
+# has no device-specific features except when its vhost is active,
+# then it may have the VHOST_F_LOG_ALL feature.
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioInputFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VhostUserFsFeature:
+#
+# An enumeration of vhost user FS features. Note that vhost-user-fs
+# has no device-specific features other than the vhost-common
+# VHOST_F_LOG_ALL feature.
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VhostUserFsFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VhostVsockFeature:
+#
+# An enumeration of vhost vsock features. Note that vhost-vsock has
+# no device-specific features other than the vhost-common
+# VHOST_F_LOG_ALL feature.
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VhostVsockFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VirtioCryptoFeature:
+#
+# An enumeration of virtio crypto features. Not that virtio-crypto
+# has no device-specific features other than when it is a vhost
+# device, then it may have the VHOST_F_LOG_ALL feature.
+#
+# Since: 6.3
+##
+
+{ 'enum': 'VirtioCryptoFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VirtioDeviceFeaturesBase:
+#
+# The common fields that apply to all Virtio devices
+#
+# @type: virtio device name
+# @transport: the list of transport features of the virtio device
+# @unknown-features: virtio device features bitmap that have not been decoded
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesBase',
+  'data': { 'type': 'VirtioType',
+            'transport': [ 'VirtioTransportFeature' ],
+            '*unknown-features': 'uint64' } }
+
+##
+# @VirtioDeviceFeaturesOptionsMem:
+#
+# The options that apply to Virtio mem devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsMem',
+  'data': { 'features': [ 'VirtioMemFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsSerial:
+#
+# The options that apply to Virtio serial devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsSerial',
+  'data': { 'features': [ 'VirtioSerialFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsBlk:
+#
+# The options that apply to Virtio block devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBlk',
+  'data': { 'features': [ 'VirtioBlkFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsGpu:
+#
+# The options that apply to Virtio GPU devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsGpu',
+  'data': { 'features': [ 'VirtioGpuFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsNet:
+#
+# The options that apply to Virtio net devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsNet',
+  'data': { 'features': [ 'VirtioNetFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsScsi:
+#
+# The options that apply to Virtio SCSI devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsScsi',
+  'data': { 'features': [ 'VirtioScsiFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsBalloon:
+#
+# The options that apply to Virtio balloon devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBalloon',
+  'data': { 'features': [ 'VirtioBalloonFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsIommu:
+#
+# The options that apply to Virtio IOMMU devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsIommu',
+  'data': { 'features': [ 'VirtioIommuFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsInput:
+#
+# The options that apply to Virtio input devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsInput',
+  'data': { 'features': [ 'VirtioInputFeature' ] } }
+
+##
+# @VhostDeviceFeaturesOptionsFs:
+#
+# The options that apply to vhost-user-fs devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VhostDeviceFeaturesOptionsFs',
+  'data': { 'features': [ 'VhostUserFsFeature' ] } }
+
+##
+# @VhostDeviceFeaturesOptionsVsock:
+#
+# The options that apply to vhost-vsock devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VhostDeviceFeaturesOptionsVsock',
+  'data': { 'features': [ 'VhostVsockFeature' ] } }
+
+##
+# @VirtioDeviceFeaturesOptionsCrypto:
+#
+# The options that apply to virtio-crypto devices
+#
+# @features: List of device features
+#
+# Since: 6.3
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsCrypto',
+  'data': { 'features': [ 'VirtioCryptoFeature' ] } }
+
+##
+# @VirtioDeviceFeatures:
+#
+# A union to define the list of features for a virtio device
+#
+# Since: 6.3
+##
+
+{ 'union': 'VirtioDeviceFeatures',
+  'base': 'VirtioDeviceFeaturesBase',
+  'discriminator': 'type',
+  'data': { 'virtio-serial': 'VirtioDeviceFeaturesOptionsSerial',
+            'virtio-blk': 'VirtioDeviceFeaturesOptionsBlk',
+            'virtio-gpu': 'VirtioDeviceFeaturesOptionsGpu',
+            'virtio-net': 'VirtioDeviceFeaturesOptionsNet',
+            'virtio-scsi': 'VirtioDeviceFeaturesOptionsScsi',
+            'virtio-balloon': 'VirtioDeviceFeaturesOptionsBalloon',
+            'virtio-iommu': 'VirtioDeviceFeaturesOptionsIommu',
+            'virtio-input': 'VirtioDeviceFeaturesOptionsInput',
+            'vhost-user-fs': 'VhostDeviceFeaturesOptionsFs',
+            'vhost-vsock': 'VhostDeviceFeaturesOptionsVsock',
+            'virtio-crypto': 'VirtioDeviceFeaturesOptionsCrypto',
+            'virtio-mem': 'VirtioDeviceFeaturesOptionsMem' } }
+
+##
 # @VhostStatus:
 #
 # Information about a vhost device. This information will only be
@@ -106,10 +566,10 @@
             'n-tmp-sections': 'int',
             'nvqs': 'uint32',
             'vq-index': 'int',
-            'features': 'uint64',
-            'acked-features': 'uint64',
-            'backend-features': 'uint64',
-            'protocol-features': 'uint64',
+            'features': 'VirtioDeviceFeatures',
+            'acked-features': 'VirtioDeviceFeatures',
+            'backend-features': 'VirtioDeviceFeatures',
+            'protocol-features': 'VhostDeviceProtocols',
             'max-queues': 'uint64',
             'backend-cap': 'uint64',
             'log-enabled': 'bool',
@@ -174,12 +634,12 @@
   'data': { 'name': 'str',
             'device-id': 'uint16',
             'vhost-started': 'bool',
-            'guest-features': 'uint64',
-            'host-features': 'uint64',
-            'backend-features': 'uint64',
+            'guest-features': 'VirtioDeviceFeatures',
+            'host-features': 'VirtioDeviceFeatures',
+            'backend-features': 'VirtioDeviceFeatures',
             'device-endian': 'VirtioStatusEndianness',
             'num-vqs': 'int',
-            'status': 'uint8',
+            'status': 'VirtioDeviceStatus',
             'isr': 'uint8',
             'queue-sel': 'uint16',
             'vm-running': 'bool',
@@ -191,7 +651,7 @@
             'disable-legacy-check': 'bool',
             'bus-name': 'str',
             'use-guest-notifier-mask': 'bool',
-            'vhost-dev': 'VhostStatus' } }
+            '*vhost-dev': 'VhostStatus' } }
 
 ##
 # @x-query-virtio-status:
@@ -221,28 +681,31 @@
 #          "name": "virtio-crypto",
 #          "started": true,
 #          "device-id": 20,
-#          "vhost-dev": {
-#               "n-tmp-sections": 0,
-#               "n-mem-sections": 0,
-#               "max-queues": 0,
-#               "backend-cap": 0,
-#               "log-size": 0,
-#               "backend-features": 0,
-#               "nvqs": 0,
-#               "protocol-features": 0,
-#               "vq-index": 0,
-#               "log-enabled": false,
-#               "acked-features": 0,
-#               "features": 0
+#          "backend-features": {
+#               "transport": [],
+#               "type": "virtio-crypto",
+#               "features": []
 #          },
-#          "backend-features": 0,
 #          "start-on-kick": false,
 #          "isr": 1,
 #          "broken": false,
-#          "status": 15,
+#          "status": {
+#               "dev-status": ["acknowledge", "driver", "features-ok",
+#                              "driver-ok"]
+#          },
 #          "num-vqs": 2,
-#          "guest-features": 5100273664,
-#          "host-features": 6325010432,
+#          "guest-features": {
+#               "transport": ["event-idx", "indirect-desc", "version-1"],
+#               "type": "virtio-crypto",
+#               "features": []
+#          },
+#          "host-features": {
+#               "transport": ["protocol-features", "event-idx",
+#                             "indirect-desc", "version-1", "any-layout",
+#                             "notify-on-empty"],
+#               "type": "virtio-crypto",
+#               "features": []
+#          },
 #          "use-guest-notifier-mask": true,
 #          "vm-running": true,
 #          "queue-sel": 1,
@@ -270,22 +733,71 @@
 #               "max-queues": 1,
 #               "backend-cap": 2,
 #               "log-size": 0,
-#               "backend-features": 0,
+#               "backend-features": {
+#                       "transport": [],
+#                       "type": "virtio-net",
+#                       "features": []
+#               },
 #               "nvqs": 2,
-#               "protocol-features": 0,
+#               "protocol-features": {
+#                       "features": []
+#               },
 #               "vq-index": 0,
 #               "log-enabled": false,
-#               "acked-features": 5100306432,
-#               "features": 13908344832
+#               "acked-features": {
+#                       "transport": ["event-idx", "indirect-desc", "version-1",
+#                                     "any-layout", "notify-on-empty"],
+#                       "type": "virtio-net",
+#                       "features": ["mrg-rxbuf"]
+#               },
+#               "features": {
+#                       "transport": ["event-idx", "indirect-desc",
+#                                     "iommu-platform", "version-1", "any-layout",
+#                                     "notify-on-empty"],
+#                       "type": "virtio-net",
+#                       "features": ["log-all", "mrg-rxbuf"]
+#               }
+#          },
+#          "backend-features": {
+#               "transport": ["protocol-features", "event-idx", "indirect-desc",
+#                             "version-1", "any-layout", "notify-on-empty"],
+#               "type": "virtio-net",
+#               "features": ["gso", "ctrl-mac-addr", "guest-announce", "ctrl-rx-extra",
+#                            "ctrl-vlan", "ctrl-rx", "ctrl-vq", "status", "mrg-rxbuf",
+#                            "host-ufo", "host-ecn", "host-tso6", "host-tso4",
+#                            "guest-ufo", "guest-ecn", "guest-tso6", "guest-tso4",
+#                            "mac", "ctrl-guest-offloads", "guest-csum", "csum"]
 #          },
-#          "backend-features": 6337593319,
 #          "start-on-kick": false,
 #          "isr": 1,
 #          "broken": false,
-#          "status": 15,
+#          "status": {
+#               "dev-status": ["acknowledge", "driver", "features-ok", "driver-ok"]
+#          },
 #          "num-vqs": 3,
-#          "guest-features": 5111807911,
-#          "host-features": 6337593319,
+#          "guest-features": {
+#               "transport": ["event-idx", "indirect-desc", "version-1"],
+#               "type": "virtio-net",
+#               "features": ["ctrl-mac-addr", "guest-announce", "ctrl-vlan",
+#                            "ctrl-rx", "ctrl-vq", "status", "mrg-rxbuf",
+#                            "host-ufo", "host-ecn", "host-tso6",
+#                            "host-tso4", "guest-ufo", "guest-ecn",
+#                            "guest-tso6", "guest-tso4", "mac",
+#                            "ctrl-guest-offloads", "guest-csum", "csum"]
+#          },
+#          "host-features": {
+#               "transport": ["protocol-features", "event-idx",
+#                             "indirect-desc", "version-1", "any-layout",
+#                             "notify-on-empty"],
+#               "type": "virtio-net",
+#               "features": ["gso", "ctrl-mac-addr", "guest-announce",
+#                            "ctrl-rx-extra", "ctrl-vlan", "ctrl-rx",
+#                            "ctrl-vq", "status", "mrg-rxbuf", "host-ufo",
+#                            "host-ecn", "host-tso6", "host-tso4",
+#                            "guest-ufo", "guest-ecn", "guest-tso6",
+#                            "guest-tso4", "mac", "ctrl-guest-offloads",
+#                            "guest-csum", "csum"]
+#          },
 #          "use-guest-notifier-mask": true,
 #          "vm-running": true,
 #          "queue-sel": 2,
-- 
1.8.3.1


