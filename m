Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C9031CBF3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:30:50 +0100 (CET)
Received: from localhost ([::1]:59404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1NI-0007BU-Vy
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lC1KG-0003RC-HE; Tue, 16 Feb 2021 09:27:40 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:46504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lC1KC-00024f-Av; Tue, 16 Feb 2021 09:27:40 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GEOieL063927;
 Tue, 16 Feb 2021 14:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=i/qBn8aoph4obT03NtSoWix8aQJNq35fmzLtWnqUZMs=;
 b=Ln/panJeYsprI07r+ZOPv2QVy+37N7fK3wBxKS4rRemFy98vEnxMebzHwbfYOteF9R7h
 QJy53YTN051N9/k2BaJW4Rnv4LlbKUibClw1elXBKBFK97PHLtqENbLsqS73G+suEhJq
 CwSKVT9KqBye/zwNgD8mEWVFD4SyaH2UU5t0wr8BHEWzcpoC4b+s3+WOtoUgUORxGqLw
 v+TlTb9vuaQ0S1AuD0LGnUaOsYFZHrr3GzStOjEhxRmo3O362szv+DPG91/VJ4LbvCpf
 ctl5jzpSHQ7SZyscM7QV4d8T1bvxXZAC+uEjdC2TgMWLhKNLSuN/gcvQL6dfrwVzBaLx ZA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 36p49b74cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 14:27:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GEQJg9076540;
 Tue, 16 Feb 2021 14:27:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3030.oracle.com with ESMTP id 36prbn7vds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 14:27:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7v9JPYo9PHHWXQL3SX5CK3CWLFet50EZuW7lLXt63CbOHVfQULnXFcH0yPFUE0KulLo8CTgrwHJAjNEMemVCpkVver1qPUBoIJ4nE0aYtxw6bcniZxpg9CqxL9VIbMPW57DNnVMBeUYaOGQwvddAkAfJlhTnm0UiwsMZfmbWw18BSf4NrWIf/3FE6AAR1KMZQE0w6Hhq0v138uVLXLSsE4eluvaTQ0OpUDjDqhooroR1mN+EkWmi1IRNcriMeSmkrTu2L4VX4EaYSkzIV9/SO/A/lkRMBW7x1htDqTl6nlBU+THfMmcXBdp1KfoM2IQrLOxtEfeDOgipZx6lJcsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/qBn8aoph4obT03NtSoWix8aQJNq35fmzLtWnqUZMs=;
 b=TZhA61EQ2U7nsgetN+mf7YviJjgkRbSmZafaCBENEUhXFosv87PS18lpgzJLW/ch14rv3bwziKTamFXsOeng5AUzZkbX+hd9wKugEda+lsHqzDSO2dWyHhrcU29gNl16jCQ/QDzKTfFcqIm1VyYEY9vfDIxUCHP/YGoRjRdWmnUUG6QpU81tY2OO1KrGixkko/Q2T//U/AxWaj5K5lGfngEtjZZ/9gRKyTQx+10YF+jiOfejqbtyrTf1tEur7BMWnj2hL7Qpcb4Gtj7nHKNLLoYc06z3Y7VVaMKYzyjbAk82zS30OnAHkebHFrgXRzzVxK1MUp9kdpwH6/rue32EfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/qBn8aoph4obT03NtSoWix8aQJNq35fmzLtWnqUZMs=;
 b=tISAL8QeuoiBrv7/GFFkSzIsotu8guIjFAc72sGBOfngjGMD2fEEtRvMW7RMoy3YSjzCZ6hnofFBgzhA4acYZtU5mUi7IboTUZohXmVnfY9ov7i2YHcp56Pttm4EgbrHU4BF6Mao6hXYHgbKlgdGfUiDBc1po8OCQp9VrRLw1Yw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB5182.namprd10.prod.outlook.com (2603:10b6:5:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 14:27:27 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3846.027; Tue, 16 Feb 2021
 14:27:26 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/3] hw/pflash_cfi01: Reduce memory consumption when flash
 image is smaller than region
Date: Tue, 16 Feb 2021 14:27:17 +0000
Message-Id: <20210216142721.1985543-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::11) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0096.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.35 via Frontend Transport; Tue, 16 Feb 2021 14:27:25 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 06571195;
 Tue, 16 Feb 2021 14:27:21 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc53e8dd-7837-443b-b292-08d8d286fb92
X-MS-TrafficTypeDiagnostic: DS7PR10MB5182:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB51826E02C010600DD9E54D0088879@DS7PR10MB5182.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e01ALLWO974PVpbIFER8Q/e/RV+sSbjIbuhXX4bihTUBt37dLX1Dwz9hsQyfDgy4nUmo/L3xOwabh3AzmpQexT/kNKkTB3hMw/FT9FJXLoihtmp7Qi20zsUB7E3nK2sVcIvhJ+/qGuaLdNikR0ShhjIvIYvsgVPqinqxRk9l7zsr3F3QoYLtsTMEiP12QK+n+xWam7Iu7cJYPcL8vD+5tD2Y74tmG1EntkoPwp5nRPC3fcHQmIYsUck+GlvRkhmWlsZiFpGvEkco5opg+6kU3LyQZrJt3xN2jrETTnrqThui8cOqr8JlzqG4yvZuofDDGyf1zaVaUpP0oaQ7iPo/z5lmF8N81Kog6fZGQQNw6AcXBBVEl+9WgxjjYHBCAYbwUnRPMeOgw+CUwXNifLHxODWJmGO6qN04MsenD7dREJu0DXzfmCos4jBCd/YbDQcAAX83HxaMGKu1vJuiAVgwUxKs5Vi79ApsHU1S7HP9KDU/FmV9d6IfLFT/0s58wTf2i56TGfzdsTm3WbMvc/hTHwNXoK/Vha+v90Cv6DQmTx2FOytcMtNUz/TXHrRDsbjerwMXaC7TQP9D5kMe4iFrxKDFsOrXTtabQwQ/9A2E8Yw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39860400002)(376002)(366004)(136003)(2906002)(86362001)(478600001)(44832011)(1076003)(6966003)(316002)(54906003)(52116002)(6666004)(66946007)(36756003)(66556008)(8676002)(6916009)(66476007)(8936002)(2616005)(5660300002)(966005)(107886003)(83380400001)(186003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5KTgj3rDMf9Skgl8/yWfd/7QRbF0+NVBnZ0hLRdgdusv1x/TrG8n9sU4G0Ib?=
 =?us-ascii?Q?xbY+VbIR2EKMX36Oed+GSmkJlTBTs5nXtWmjUmwZYPpTxLKqiHvnWW7ybxAi?=
 =?us-ascii?Q?8zon/kNUGyGy8ZqCKIIyRQ+wapRUl1ForPTHEr65k1iUo0DHtMEVhEDi1Qp4?=
 =?us-ascii?Q?z5hwtQcjvjU0o6ySESplqQ9mBU/aXSYAAezCNpW3jVkijLatcteLtcf7xuUG?=
 =?us-ascii?Q?5qenDVKC1Raw+qMBXpSmkwQPKQqtNj/+5tpNQUMUIEXt19I2wjTpjuUMpJjy?=
 =?us-ascii?Q?AyeNOXlVYCSSdecIt8BTrT6guzXig3oRJVzhsk8kEMbuMeYT0U2it+woReAW?=
 =?us-ascii?Q?VGscMKaDvud9Za7h+3E4hUsm/wvuK0a3nM0hR5s2Sz69D66sRJEASLaLE2ts?=
 =?us-ascii?Q?hpynTpaa80LTjnfuYB2/wbSrpQlZ5Y9LodjGVGH1feSVg5z6L7jRl4/dfbVn?=
 =?us-ascii?Q?2Dq15RJzElOAJuAQ2ifCppB4hzceBySXx00LtgU6CH3IqdM6rmKhJV/2D2iA?=
 =?us-ascii?Q?Gi17bJwCYC+V80H0cEKkqWUDmPDdbxFg7vWlwy9o8trLtN20Nfl2wLH27bP8?=
 =?us-ascii?Q?FG+3jB0SdapLr8qcJHMCU23HSZ4DDXefceTuRH1i7TAyyjtSEr0kyHp3aqfS?=
 =?us-ascii?Q?tzdTY/kTFYBwSGoDWT5z/AYSvRzbk1k72IlV3Y/IyJ1wajVEmTxzO9InMefU?=
 =?us-ascii?Q?5tOmeHbJzpJe2NxGrPx/M/2h5I9Rfwktu5NjwBqvSuuM30qyjjy50buiQAyb?=
 =?us-ascii?Q?jr7VauJkyHz7DufErfrVAI5vKhtFsMYj4WQiYZersH1RDKVtxoB19l2Iu5lW?=
 =?us-ascii?Q?1t+g4OflAdnTMUjW7HZmS0RtldHFSM2/dsC0Ddr7uC8ZJPm8lC1ght7ZQIcE?=
 =?us-ascii?Q?Oy0zEmZXiDKz7hcCXQiAdGfpvBXUEvsxGX8ATy+2r1FxwPzG1HmhmMZu3hEV?=
 =?us-ascii?Q?ylIT5XzdtHHKqsTrD05dHGl/I7T0jHdOfbZFZR9Po0hPATmkP+PzVAI/6XyX?=
 =?us-ascii?Q?9FBJYOtKYnppvHnEZIVBUF70gOTbpuSMhzvkyD6xNT7ROvQthaTor0Oulnf5?=
 =?us-ascii?Q?VGNaKZ1h++r9RhIVxMIkG+HDfgBmFtbdTdWO82mLra9iQPd9ZFiBCM8s7/GI?=
 =?us-ascii?Q?ibaRI2HDx66k/jhzLWzV0wardtI+BxbJfWgj+SOmstTyMK8bOqZwum+Q6X1h?=
 =?us-ascii?Q?B3uvNS7/QOi3O5JBa2ug/DlOPUzARduML4W4vKGMJG7Po+02E2Ro4Hbh7A7u?=
 =?us-ascii?Q?FHQ7hCDENwxd+QHPMky/6sCyadAMcDXFcx0j+8JiodS+9nPEBlz7CC9UuJdF?=
 =?us-ascii?Q?QcHI57pFktSuXTVNqWuXY1HlBywbswZe6rg2HJFH7l5v3qPoHaOd1SJL6ayT?=
 =?us-ascii?Q?l3KFF3Q=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc53e8dd-7837-443b-b292-08d8d286fb92
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 14:27:26.8266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wn6PwAD9NJ1T1tzYtjREIjZud0XN9hcwvA88fiRArC3LCR2m1YfyrLOUC4AhHBIGP98JavR3Y7a0kGt6r+6OMqEHzZibSqdhBh9fOWjpBMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5182
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102160133
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1011 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160133
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As described in
https://lore.kernel.org/r/20201116104216.439650-1-david.edmondson@oracle.com,
I'd like to reduce the amount of memory consumed by QEMU mapping UEFI
images on aarch64.

To recap:

> Currently ARM UEFI images are typically built as 2MB/768kB flash
> images for code and variables respectively. These images are both
> then padded out to 64MB before being loaded by QEMU.
>
> Because the images are 64MB each, QEMU allocates 128MB of memory to
> read them, and then proceeds to read all 128MB from disk (dirtying
> the memory). Of this 128MB less than 3MB is useful - the rest is
> zero padding.
>
> On a machine with 100 VMs this wastes over 12GB of memory.

There were objections to my previous patch because it changed the size
of the regions reported to the guest via the memory map (the reported
size depended on the size of the image).

This is a smaller patch which only helps with read-only flash images,
as it does so by changing the memory region that covers the entire
region to be IO rather than RAM, and loads the flash image into a
smaller sub-region that is the more traditional mixed IO/ROMD type.

All read/write operations to areas outside of the underlying block
device are handled directly (reads return 0, writes fail (which is
okay, because this path only supports read-only devices)).

This reduces the memory consumption for the read-only AAVMF code image
from 64MB to around 2MB (presuming that the UEFI image is adjusted
accordingly). It does nothing to improve the memory consumption caused
by the read-write AAVMF vars image.

There was a suggestion in a previous thread that perhaps the pflash
driver could be re-worked to use the block IO interfaces to access the
underlying device "on demand" rather than reading in the entire image
at startup (at least, that's how I understood the comment).

I looked at implementing this and struggled to get it to work for all
of the required use cases. Specifically, there are several code paths
that expect to retrieve a pointer to the flat memory image of the
pflash device and manipulate it directly (examples include the Malta
board and encrypted memory support on x86), or write the entire image
to storage (after migration).

My implementation was based around mapping the flash region only for
IO, which meant that every read or write had to be handled directly by
the pflash driver (there was no ROMD style operation), which also made
booting an aarch64 VM noticeably slower - getting through the firmware
went from under 1 second to around 10 seconds.

Improving the writeable device support requires some more general
infrastructure, I think, but I'm not familiar with everything that
QEMU currently provides, and would be very happy to learn otherwise.

David Edmondson (3):
  hw/pflash_cfi*: Replace DPRINTF with trace events
  hw/pflash_cfi01: Correct the type of PFlashCFI01.ro
  hw/pflash_cfi01: Allow read-only devices to have a smaller backing
    device

 hw/block/pflash_cfi01.c | 197 +++++++++++++++++++++++++---------------
 hw/block/pflash_cfi02.c |  75 ++++++---------
 hw/block/trace-events   |  42 +++++++--
 3 files changed, 186 insertions(+), 128 deletions(-)

-- 
2.30.0


