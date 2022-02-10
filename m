Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634124B0A84
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 11:27:08 +0100 (CET)
Received: from localhost ([::1]:44576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI6fL-0003T6-16
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 05:27:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6be-0000XS-GX; Thu, 10 Feb 2022 05:23:19 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nI6bb-0000tC-1N; Thu, 10 Feb 2022 05:23:18 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21A7kmNY017470; 
 Thu, 10 Feb 2022 10:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=BUXFREAqAKuRVB7lMR6s0ykbf0NT9PN0zv4rMofMPU0=;
 b=0CfkirmBFVZJgklxB9UM0gI++9aqoP/pU1nSI4Nz2R0O/Cp3MWobG/a56LdF85+29W55
 R+4Jkqcztb6drRAVo+t2vkvRURVYwLSoqep2YR1gZHpwt0COXanphM3Fxc67ljYl/pRn
 MysSiLncLorEI+/1o+5wT5qq5gCSYQfjoGP3AK1O8bCcPGpeldcSwNhRrIhC0rmqJNgW
 3ic5wvRjr9ZtfoK0LXUUbFt4HJXsMyRqTyQhUyaW/gYH8uKvlTZCOn0bHCcn7kWe1sk1
 uZjkILofd1t+OWU8M+SESUwKZPlC6XZo0tSh4Y9hFNeSscvOuBbtN2Qq/HRhMjJl/1XY VA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e3h28qj1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:22:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21AAACOp142945;
 Thu, 10 Feb 2022 10:22:52 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by aserp3030.oracle.com with ESMTP id 3e1f9k0vac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 10:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3G6SlGn7Zp2TSoVbO8J3AWqKmRAIBOAavHtkCezVCpls2F+M2WnA9g3v88IHGSCoyrAILzJgNelZYxbMUHlohb5hf5KCl8dbY3IUuI9yO0eak4DPDmKe6FI/c33LzpgDJcA9xkS7GY+GwEV4x3AbKk++6hoL8hYkKGZ7NT0yfi1w7ZVwWKRw3yE2Nk09JdLf1ILRwwM98qOdJ1BkWemfSww/VULKzcBNXktb/aoDyck5to97Pezkj07/jmc9ZtPchdWy6q40v6KBGEurEiJfZQBohO15ks3izq/ovdma0uVqdLN6FtyEB20ytiaJY1NdN99THnuJ7Z3BkDYWkr88w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUXFREAqAKuRVB7lMR6s0ykbf0NT9PN0zv4rMofMPU0=;
 b=X/1QapcV072L1nPsps1lSigU8ku994PY4CEN3Qm9ZJcInlnGdwoagkVOE39636KGrS2vejJ7CBVrwAif6/lDMEY5/tj0g9KX3100tjHGaqPihhb9f6YfND8k+wEk+/7Chozr+BEMMXfGPh0C5FnMGW9gX9q/7FwUFItmNJJwVApvzb7kbB6fsi4/SlUHyYYhp7ZX+NXCtRj5ksQJs/NNhfipws/KuYR7PosWsraC21AlVuMhyO3Ipb37nLItwEtckJ0Csln4gQBEnJ5KtU0opwVJ+55YPxvnR7uclzmNUNDwznVL0GVBK03G6e7af8GA68IvMRlTa7ePE6tXxXtE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUXFREAqAKuRVB7lMR6s0ykbf0NT9PN0zv4rMofMPU0=;
 b=fVBi5ojmOKuNHdAfCsPhaNR9FJ0xlaAzOp9v/MZyk7ZP2fD1Jz4z6GBPVu7fyZVoXGRbYK7vH/8Yzo4dAjd4I8R1vDybl6l0tBOcmSVtphQE3XS3jNnqh1OSfeUP3JIkbw0p1ScxGuQgox8We/5n7xTpaZMsQim7hyw+/aXROrY=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by SA2PR10MB4809.namprd10.prod.outlook.com (2603:10b6:806:113::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 10:22:49 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::b8e3:f092:c0ea:9ddf%4]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 10:22:49 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 1/8] virtio: drop name parameter for virtio_init()
Date: Thu, 10 Feb 2022 05:21:53 -0500
Message-Id: <1644488520-21604-2-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
References: <1644488520-21604-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28b943d6-3844-43bc-b151-08d9ec7f49ff
X-MS-TrafficTypeDiagnostic: SA2PR10MB4809:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB48097DBB5EE2C9EEB7BDA05AE82F9@SA2PR10MB4809.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a5HKSUCZPJFeDKoYPFz4l4rfoi9qmwTmJHT0Qisu3Ivm5U3QdEWjtNjkCdSjNSg6TF0cw2rVgtv3SsZgs6zGtnptSa1Rev41eU6JDKHC1mb0gFNQ3V8mktp366O+d/KcAY8FU0lwxmpcYJRIrCEH7G/Gy05aXl1F0eK87OAdmxrEr2FY7lP6MUytyWzRaKTkcY61xiTSN5hGxXltQ7JM7sBPZKvXVcUVO7LGgXqiE2LQQGZOa31ySytPRtmrDrdjrVEOsNchpjJJFxwcr5Pj0pbTwDXWccqxL/Iok+EuiWO9vzd+8BpvjaKPhx3Rqs+/POd03cRnPeKSY20BCkRMMDFa3DAtJtb0ewSAEKiVAXZefH1kcfFwVFyY5zAuIsBKq3S8NmvHl54ZODZllxGmxL8hV1HCqi/ZU6LZkEn0J7dPtUCDPhyRBJUcLf/K++GMmtIPUdkLZ9wgImrRNboPAAoyOXt1xxL+oQ5+CKveXjszSdUw7XaQ1wA9hpfH3VUCBCp1r5puVYYQMyUzMG9F75E47Z0iFLEJ4hmrmxfrGuQFLSvs+eEhd+rb3Ji1qk74zPag9v0rHivjpvsZrpZRNSVUDhZxNvH1b8d2/40kW0f7f3cVMxekfNypIFjSTY7L3ypD4CQAzjpxmZ7tEGAi0rp7nrXoEBi9+A1h2m8aPR0HOe5wWq543tNICTe2Biyk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(8936002)(26005)(66556008)(4326008)(66476007)(186003)(8676002)(66946007)(316002)(86362001)(38100700002)(38350700002)(6506007)(52116002)(2616005)(6512007)(6666004)(6486002)(508600001)(83380400001)(44832011)(2906002)(5660300002)(7416002)(36756003)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YoDQlRAl3t6aPZW2+GxYtBI57FkgNYs3x1TiNA/M9dJZ9AcDxRXlvbplOZJB?=
 =?us-ascii?Q?DA6tbS1/NrCwYet13NrHlav9cYYGw2GTpvcI9BKQpXG9Qa9j0gQn9TrogyA2?=
 =?us-ascii?Q?O+OgjXDeGM1aeUrAvys34KjFAbZWAW4s4Lw3NcYFJJ1cqKp8Y+8RK2Tn1TYu?=
 =?us-ascii?Q?Z0lOciT9sMAA140ej9MwBqE7UQQ8vC4H1+oX1b6JQfxwU/PyFVZ5TCKAS2+J?=
 =?us-ascii?Q?y6BXg1CVQIEZ/Iw3jR49+wjzBul6pbC8WSlzYXYrBlry5mysPFXoqnibR+RW?=
 =?us-ascii?Q?29DV67OowRt43HWCqn7zdqY+vGrpBzFzu2tr9ueU40mTDjnWXVfGw/p+qj6z?=
 =?us-ascii?Q?iJmkgqK8+1YIfVQYoJnThJgTd4ra/eY2c+PXLVhmgdlPmP136P9bKN3AjR6c?=
 =?us-ascii?Q?z3kQsHSCV+Hsf/b4X1QdKCsrUisBfpJPUT44NCZflM6IYupaHHXcLKT44C7n?=
 =?us-ascii?Q?pzbUkHokuxH/nfDftUiZTF3m8TX6O8QMyrjkJNAgppkG6M0bw1QzzTEooAQk?=
 =?us-ascii?Q?2Ldr0bLy6n8qmXkhqWAk3/9RDZb+bHLXfTIXCxMf3klUxMnPpO6zJmf9wcxv?=
 =?us-ascii?Q?d9vxxHOA9YdebQke0wUnNhDlaTKf0AJ7XN43D9kpn0LyStd0/VpryYLqX4bu?=
 =?us-ascii?Q?LeKLv49zEvTD8ZGDjgbg0V1byTizM+5Q5OiU/5WYu8S38e+EOYrhqZlaTKjW?=
 =?us-ascii?Q?60RL88mv9UKlAqp2+m1Nipw1nqRv4shEDWNb2EmyxgKa2m/be1q8xuSgLQkD?=
 =?us-ascii?Q?kyRdCak4fyb3dPCVxCVxYi1AJi0DD5Q2f97TngkUAP7A6jqxoVDfbe2hNLVQ?=
 =?us-ascii?Q?OfKC4bbfFo0lYBz4qFkZB2vgf8ATyIS3BNtoNpF/IOMNWtDKQ2lLjidBS6IW?=
 =?us-ascii?Q?7v3aUYLbXLcR/Ne9PABcRzqiknvc7vjNS8ItEKLUQvV0q5SGfHrlm/DR8z4Z?=
 =?us-ascii?Q?ExU07b1aGVxS94JSlz3gDFJorTdUSdSHjrGZsD0H0xkztY3WCB87YJVrYbAm?=
 =?us-ascii?Q?SRacemgthfID4Bs2chmeMu5DdQ3A4HEAv94OpIuxve/majjzZXiB2Jc7dfHL?=
 =?us-ascii?Q?Bsaugi7VyUOPrEZ8WLZyicoObcJ8uYxBoNIdksmfWkfAzBKPzd+VGb0v0TPq?=
 =?us-ascii?Q?ZW3Dl85ZQjVWe8g/BZSDAwKsfWrrmCQEIx6Q5QwL87Ab7EKo2FkIfjmJqx9C?=
 =?us-ascii?Q?N5Gp5JUszMgl05h0flKTv0XtNfLGwO6fdeITXZRp+1T/NFLM0N0O7ihesJCX?=
 =?us-ascii?Q?tLlldx5rfU2Kau/oMRSKOMwacXwi6WjDj1rlQFEdcGGWamO3MLryaOztMv8Q?=
 =?us-ascii?Q?V+uIlEVLuFgjLlZlZbLC+HSMi44g4LyjJe6RJi1CDZe1tewBe7uSWwOtAumv?=
 =?us-ascii?Q?gdLbHgGQHIfUo+9FKMlNYyjy0XVCGpdinJUJlTxmPnI1fS3pvWAYuiOJT2Y8?=
 =?us-ascii?Q?ZvEENDpOX9amy6QuUIbUJtDycLMwvuJ1ytcT/K36mXKN2SiaoxPMETPZMSfn?=
 =?us-ascii?Q?gTxWZZ8eTHAYT5mSzLgo8s0aOb3KtzcF6FGBVnOqEAH7JqkWLhvBdwcxEO8B?=
 =?us-ascii?Q?rSAwuZfzwhkUBxnXL3rHMGOdLclP4y5YGmkFlBvawHiOkc3F/AaIW2NUF8Qn?=
 =?us-ascii?Q?Sx+BensUkwjjEw3wBaE24Es=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b943d6-3844-43bc-b151-08d9ec7f49ff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:22:49.7381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeWmERmMWSgn+9JZPOKLnzpVLzW+5So7S+fChipJ55e7Hlc2LJk3/LzYvUgAWJcfYAvQ7qK37ND0Ol6v/HOLTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4809
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10253
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100056
X-Proofpoint-ORIG-GUID: 8xwZ-shrHitB_eN5W-EGetsxxw_Hbgrg
X-Proofpoint-GUID: 8xwZ-shrHitB_eN5W-EGetsxxw_Hbgrg
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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

This patch drops the name parameter for the virtio_init function.

The pair between the numeric device ID and the string device ID
(name) of a virtio device already exists, but not in a way that
lets us map between them.

This patch lets us do this and removes the need for the name
parameter in the virtio_init function.

[Jonah: added new virtio IDs to virtio device list from rebase].

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/9pfs/virtio-9p-device.c             |  2 +-
 hw/block/vhost-user-blk.c              |  2 +-
 hw/block/virtio-blk.c                  |  2 +-
 hw/char/virtio-serial-bus.c            |  3 +-
 hw/display/virtio-gpu-base.c           |  2 +-
 hw/input/virtio-input.c                |  3 +-
 hw/net/virtio-net.c                    |  2 +-
 hw/scsi/virtio-scsi.c                  |  3 +-
 hw/virtio/vhost-user-fs.c              |  3 +-
 hw/virtio/vhost-user-i2c.c             |  7 +----
 hw/virtio/vhost-user-rng.c             |  2 +-
 hw/virtio/vhost-user-vsock.c           |  2 +-
 hw/virtio/vhost-vsock-common.c         |  5 ++--
 hw/virtio/vhost-vsock.c                |  2 +-
 hw/virtio/virtio-balloon.c             |  3 +-
 hw/virtio/virtio-crypto.c              |  2 +-
 hw/virtio/virtio-iommu.c               |  3 +-
 hw/virtio/virtio-mem.c                 |  3 +-
 hw/virtio/virtio-pmem.c                |  3 +-
 hw/virtio/virtio-rng.c                 |  2 +-
 hw/virtio/virtio.c                     | 55 ++++++++++++++++++++++++++++++++--
 include/hw/virtio/vhost-vsock-common.h |  2 +-
 include/hw/virtio/virtio-gpu.h         |  3 +-
 include/hw/virtio/virtio.h             |  4 +--
 24 files changed, 77 insertions(+), 43 deletions(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 54ee93b..5f522e6 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -216,7 +216,7 @@ static void virtio_9p_device_realize(DeviceState *dev, Error **errp)
     }
 
     v->config_size = sizeof(struct virtio_9p_config) + strlen(s->fsconf.tag);
-    virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size);
+    virtio_init(vdev, VIRTIO_ID_9P, v->config_size);
     v->vq = virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
 }
 
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 1a42ae9..e8cb170 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -491,7 +491,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
+    virtio_init(vdev, VIRTIO_ID_BLOCK,
                 sizeof(struct virtio_blk_config));
 
     s->virtqs = g_new(VirtQueue *, s->num_queues);
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 82676cd..2e3809d 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1205,7 +1205,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 
     virtio_blk_set_config_size(s, s->host_features);
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
+    virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
     s->blk = conf->conf.blk;
     s->rq = NULL;
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index f01ec21..9f19fd0 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1044,8 +1044,7 @@ static void virtio_serial_device_realize(DeviceState *dev, Error **errp)
                             VIRTIO_CONSOLE_F_EMERG_WRITE)) {
         config_size = offsetof(struct virtio_console_config, emerg_wr);
     }
-    virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
-                config_size);
+    virtio_init(vdev, VIRTIO_ID_CONSOLE, config_size);
 
     /* Spawn a new virtio-serial bus on which the ports will ride as devices */
     qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index fff0fb4..8ba5da4 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -173,7 +173,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     }
 
     g->virtio_config.num_scanouts = cpu_to_le32(g->conf.max_outputs);
-    virtio_init(VIRTIO_DEVICE(g), "virtio-gpu", VIRTIO_ID_GPU,
+    virtio_init(VIRTIO_DEVICE(g), VIRTIO_ID_GPU,
                 sizeof(struct virtio_gpu_config));
 
     if (virtio_gpu_virgl_enabled(g->conf)) {
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 54bcb46..5b5398b 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -257,8 +257,7 @@ static void virtio_input_device_realize(DeviceState *dev, Error **errp)
     vinput->cfg_size += 8;
     assert(vinput->cfg_size <= sizeof(virtio_input_config));
 
-    virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
-                vinput->cfg_size);
+    virtio_init(vdev, VIRTIO_ID_INPUT, vinput->cfg_size);
     vinput->evt = virtio_add_queue(vdev, 64, virtio_input_handle_evt);
     vinput->sts = virtio_add_queue(vdev, 64, virtio_input_handle_sts);
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index cf8ab0f..25f494c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3388,7 +3388,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     }
 
     virtio_net_set_config_size(n, n->host_features);
-    virtio_init(vdev, "virtio-net", VIRTIO_ID_NET, n->config_size);
+    virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
 
     /*
      * We set a lower limit on RX queue size to what it always was.
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 34a968e..2a6141d 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -972,8 +972,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
     VirtIOSCSICommon *s = VIRTIO_SCSI_COMMON(dev);
     int i;
 
-    virtio_init(vdev, "virtio-scsi", VIRTIO_ID_SCSI,
-                sizeof(VirtIOSCSIConfig));
+    virtio_init(vdev, VIRTIO_ID_SCSI, sizeof(VirtIOSCSIConfig));
 
     if (s->conf.num_queues == VIRTIO_SCSI_AUTO_NUM_QUEUES) {
         s->conf.num_queues = 1;
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index c595957..b875640 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -219,8 +219,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
-                sizeof(struct virtio_fs_config));
+    virtio_init(vdev, VIRTIO_ID_FS, sizeof(struct virtio_fs_config));
 
     /* Hiprio queue */
     fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index d172632..58fd729 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -14,11 +14,6 @@
 #include "qemu/error-report.h"
 #include "standard-headers/linux/virtio_ids.h"
 
-/* Remove this once the header is updated in Linux kernel */
-#ifndef VIRTIO_ID_I2C_ADAPTER
-#define VIRTIO_ID_I2C_ADAPTER                34
-#endif
-
 static void vu_i2c_start(VirtIODevice *vdev)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
@@ -220,7 +215,7 @@ static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0);
+    virtio_init(vdev, VIRTIO_ID_I2C_ADAPTER, 0);
 
     i2c->vhost_dev.nvqs = 1;
     i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 209ee5b..08bccba 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -203,7 +203,7 @@ static void vu_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     rng->req_vq = virtio_add_queue(vdev, 4, vu_rng_handle_output);
     if (!rng->req_vq) {
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 52bd682..0f8ff99 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -107,7 +107,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
+    vhost_vsock_common_realize(vdev);
 
     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 3f37712..6146d25 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -220,12 +220,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
+void vhost_vsock_common_realize(VirtIODevice *vdev)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
-    virtio_init(vdev, name, VIRTIO_ID_VSOCK,
-                sizeof(struct virtio_vsock_config));
+    virtio_init(vdev, VIRTIO_ID_VSOCK, sizeof(struct virtio_vsock_config));
 
     /* Receive and transmit queues belong to vhost */
     vvc->recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 433d42d..696635b 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -166,7 +166,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
         qemu_set_nonblock(vhostfd);
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-vsock");
+    vhost_vsock_common_realize(vdev);
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 9a4f491..236542f 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -888,8 +888,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
     VirtIOBalloon *s = VIRTIO_BALLOON(dev);
     int ret;
 
-    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
-                virtio_balloon_config_size(s));
+    virtio_init(vdev, VIRTIO_ID_BALLOON, virtio_balloon_config_size(s));
 
     ret = qemu_add_balloon_handler(virtio_balloon_to_target,
                                    virtio_balloon_stat, s);
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb..cca5237 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -810,7 +810,7 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-crypto", VIRTIO_ID_CRYPTO, vcrypto->config_size);
+    virtio_init(vdev, VIRTIO_ID_CRYPTO, vcrypto->config_size);
     vcrypto->curr_queues = 1;
     vcrypto->vqs = g_malloc0(sizeof(VirtIOCryptoQueue) * vcrypto->max_queues);
     for (i = 0; i < vcrypto->max_queues; i++) {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index aa9c16a..15b3fa0 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -968,8 +968,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
-    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
-                sizeof(struct virtio_iommu_config));
+    virtio_init(vdev, VIRTIO_ID_IOMMU, sizeof(struct virtio_iommu_config));
 
     memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 04c223b..e886e5b 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -858,8 +858,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
                         vmem->block_size;
     vmem->bitmap = bitmap_new(vmem->bitmap_size);
 
-    virtio_init(vdev, TYPE_VIRTIO_MEM, VIRTIO_ID_MEM,
-                sizeof(struct virtio_mem_config));
+    virtio_init(vdev, VIRTIO_ID_MEM, sizeof(struct virtio_mem_config));
     vmem->vq = virtio_add_queue(vdev, 128, virtio_mem_handle_request);
 
     host_memory_backend_set_mapped(vmem->memdev, true);
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index d1aeb90..8cbbd78 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -123,8 +123,7 @@ static void virtio_pmem_realize(DeviceState *dev, Error **errp)
     }
 
     host_memory_backend_set_mapped(pmem->memdev, true);
-    virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
-                sizeof(struct virtio_pmem_config));
+    virtio_init(vdev, VIRTIO_ID_PMEM, sizeof(struct virtio_pmem_config));
     pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
 }
 
diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index cc8e9f7..7e12fc0 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -215,7 +215,7 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     vrng->vq = virtio_add_queue(vdev, 8, handle_input);
     vrng->quota_remaining = vrng->conf.max_bytes;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index aae72fb..734b7fb 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -132,6 +132,56 @@ struct VirtQueue
     QLIST_ENTRY(VirtQueue) node;
 };
 
+const char *virtio_device_names[] = {
+    [VIRTIO_ID_NET] = "virtio-net",
+    [VIRTIO_ID_BLOCK] = "virtio-blk",
+    [VIRTIO_ID_CONSOLE] = "virtio-serial",
+    [VIRTIO_ID_RNG] = "virtio-rng",
+    [VIRTIO_ID_BALLOON] = "virtio-balloon",
+    [VIRTIO_ID_IOMEM] = "virtio-iomem",
+    [VIRTIO_ID_RPMSG] = "virtio-rpmsg",
+    [VIRTIO_ID_SCSI] = "virtio-scsi",
+    [VIRTIO_ID_9P] = "virtio-9p",
+    [VIRTIO_ID_MAC80211_WLAN] = "virtio-mac-wlan",
+    [VIRTIO_ID_RPROC_SERIAL] = "virtio-rproc-serial",
+    [VIRTIO_ID_CAIF] = "virtio-caif",
+    [VIRTIO_ID_MEMORY_BALLOON] = "virtio-mem-balloon",
+    [VIRTIO_ID_GPU] = "virtio-gpu",
+    [VIRTIO_ID_CLOCK] = "virtio-clk",
+    [VIRTIO_ID_INPUT] = "virtio-input",
+    [VIRTIO_ID_VSOCK] = "vhost-vsock",
+    [VIRTIO_ID_CRYPTO] = "virtio-crypto",
+    [VIRTIO_ID_SIGNAL_DIST] = "virtio-signal",
+    [VIRTIO_ID_PSTORE] = "virtio-pstore",
+    [VIRTIO_ID_IOMMU] = "virtio-iommu",
+    [VIRTIO_ID_MEM] = "virtio-mem",
+    [VIRTIO_ID_SOUND] = "virtio-sound",
+    [VIRTIO_ID_FS] = "virtio-user-fs",
+    [VIRTIO_ID_PMEM] = "virtio-pmem",
+    [VIRTIO_ID_RPMB] = "virtio-rpmb",
+    [VIRTIO_ID_MAC80211_HWSIM] = "virtio-mac-hwsim",
+    [VIRTIO_ID_VIDEO_ENCODER] = "virtio-vid-encoder",
+    [VIRTIO_ID_VIDEO_DECODER] = "virtio-vid-decoder",
+    [VIRTIO_ID_SCMI] = "virtio-scmi",
+    [VIRTIO_ID_NITRO_SEC_MOD] = "virtio-nitro-sec-mod",
+    [VIRTIO_ID_I2C_ADAPTER] = "vhost-user-i2c",
+    [VIRTIO_ID_WATCHDOG] = "virtio-watchdog",
+    [VIRTIO_ID_CAN] = "virtio-can",
+    [VIRTIO_ID_DMABUF] = "virtio-dmabuf",
+    [VIRTIO_ID_PARAM_SERV] = "virtio-param-serv",
+    [VIRTIO_ID_AUDIO_POLICY] = "virtio-audio-pol",
+    [VIRTIO_ID_BT] = "virtio-bluetooth",
+    [VIRTIO_ID_GPIO] = "virtio-gpio"
+};
+
+static const char *virtio_id_to_name(uint16_t device_id)
+{
+    assert(device_id < G_N_ELEMENTS(virtio_device_names));
+    const char *name = virtio_device_names[device_id];
+    assert(name != NULL);
+    return name;
+}
+
 /* Called within call_rcu().  */
 static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
 {
@@ -3209,8 +3259,7 @@ void virtio_instance_init_common(Object *proxy_obj, void *data,
     qdev_alias_all_properties(vdev, proxy_obj);
 }
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                 uint16_t device_id, size_t config_size)
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
@@ -3239,7 +3288,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
         vdev->vq[i].host_notifier_enabled = false;
     }
 
-    vdev->name = name;
+    vdev->name = virtio_id_to_name(device_id);
     vdev->config_len = config_size;
     if (vdev->config_len) {
         vdev->config = g_malloc0(config_size);
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index d8b565b..076b7ab 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -44,7 +44,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
 void vhost_vsock_common_stop(VirtIODevice *vdev);
 int vhost_vsock_common_pre_save(void *opaque);
 int vhost_vsock_common_post_load(void *opaque, int version_id);
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
+void vhost_vsock_common_realize(VirtIODevice *vdev);
 void vhost_vsock_common_unrealize(VirtIODevice *vdev);
 uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
                                          Error **errp);
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2179b75..afff9e1 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -22,6 +22,7 @@
 #include "sysemu/vhost-user-backend.h"
 
 #include "standard-headers/linux/virtio_gpu.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
@@ -37,8 +38,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUGL, VIRTIO_GPU_GL)
 #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
 OBJECT_DECLARE_SIMPLE_TYPE(VhostUserGPU, VHOST_USER_GPU)
 
-#define VIRTIO_ID_GPU 16
-
 struct virtio_gpu_simple_resource {
     uint32_t resource_id;
     uint32_t width;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f095637..2a0be70 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -165,8 +165,8 @@ struct VirtioDeviceClass {
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                         uint16_t device_id, size_t config_size);
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
+
 void virtio_cleanup(VirtIODevice *vdev);
 
 void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
-- 
1.8.3.1


