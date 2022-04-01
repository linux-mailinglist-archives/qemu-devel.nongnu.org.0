Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC844EEE3F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:36:15 +0200 (CEST)
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHRm-0000kI-Tw
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:36:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGf-0002QZ-GS; Fri, 01 Apr 2022 09:24:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGb-0007A3-00; Fri, 01 Apr 2022 09:24:45 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231CpucT031565; 
 Fri, 1 Apr 2022 13:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=+00VnBTJiBI+vfpchJnR0dW6JRbYuLt/8V6Ik5JW1TA=;
 b=CQj8i4ZtFxMs5uqednJtN2mZQivjBn7FJ3btUZ79GoagYpL8XyZx5Ig9oCZKnN1awxts
 uBJkXfqcrkM/mAWC9VwYWZcwRYT/6Qi/rGfmzZzUZOzFTjcNRmmnZbBynEy20/+QXMzG
 Uh6p7XL9hLHp2TCXyGXOOPXeKkTDQ5EzwUVmvZY7uDpkHKlodx9JDgSOoDpE+DmkSgcz
 S8OeS11Yze3A7jhPrrVTFCvPHG+T9lHdMwEvT25nLcMlXR6gcxHj9kOWyp8UrN1gHynV
 /Q891j6R9vgag+djlqgsPuiXKH72wuxZofs2VOuBa7MI2Lcg+J68ayjDPFVoVFa/WShG AQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1tes6ygy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:25 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231DGSNR011711; Fri, 1 Apr 2022 13:24:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s992mdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMrP8BihyK6moM44pvhUKdXdOaC2Mw3GjUwq1GgNxjHusIZqGhXd0biRHmAyvKzNQchL51CAKXwSJ8g59vGr1KA2V2fyvKajUIGkxYlXvR5UZuUtRUaQRmTrnofKGsXJJN5Wb/zHw15lPhPLcjNucK2vQzjtrbF9TNRpoEo7qf05+S2lz0tKAGsplzmOZSj64V3As0ZwZt1x+pQ4NSaHCyXM+i8s9yD9ey7XGNGGlNMJRRJmCybg1YLmXsDLWJsoyEWCrYXY7fsHYW0KJSWmaU3yE3vw7qiF/Yab5Yo2w6JA7bUsJfcAT9UsoU+jcIQSxof3PSaHhJIK9IVQv7mx0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+00VnBTJiBI+vfpchJnR0dW6JRbYuLt/8V6Ik5JW1TA=;
 b=a6FFXKclAh/crTo+PgJwqinr+L5B67xUse13NB3VmbwJJpUjkKd0+37XZsKooIXAZOxEnRAp77fIn1Zb636GCcwX+WTfWAVGsl4RwTnlB/2anZ7eOwTqDlUnY6Av2SuObk/1xLmFgvNKoqY61ZN2ZmyR6rAUsjonc++aHkdhFD5aKheiqW578l7aEGY3LR/mXwSCIhUMLMSBbEWhkiM4fjuux7CazsBQKOVgjiWcpvEHPyoSHoYbCCJ7v2DySHHaKcP2/rLGlMZYrgFt0892PCPF4Z8xV5Xj1mPg7KvSXyyCc6s941GxZ6u2cpNe85xa4+i6TsWV1ShYGG6DCptDWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+00VnBTJiBI+vfpchJnR0dW6JRbYuLt/8V6Ik5JW1TA=;
 b=qcHbgGqFpKr5+SrHo/DBFSMrDt7aq4qbWozde3TI8CqqRPtQtKlxZQCiqQwTIkVKHVY65LHYpHB9ySiW90oIxmpMpbw1+GYSIBf5J2dmaTuuAdLWptkNqpjPtQVb686ixDWRnyjI27/7H2BEwFZwa5tm7RU5jfpftS+iiRoDWUQ=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by MN2PR10MB4302.namprd10.prod.outlook.com (2603:10b6:208:199::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 13:24:23 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae%2]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:24:23 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 4/8] qmp: add QMP command x-query-virtio-status
Date: Fri,  1 Apr 2022 09:23:21 -0400
Message-Id: <1648819405-25696-5-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
References: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beeafc37-2d1c-43df-b8ef-08da13e2ef81
X-MS-TrafficTypeDiagnostic: MN2PR10MB4302:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB43029842BBC52C6B0C1ECA22E8E09@MN2PR10MB4302.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: or23BpfPQBgLrd7LEL8Oj7zfu51pzK09CU7tmAwisWnRVuv3GnDcVuuzhxCvasER0iv1XhhcwRuhm1+BTXI4ONw+vx6XqyTuSOZKaF6fMbL0MO/cE1+pvnccTN1qrbgvkHtkV01EOD33s47/t7q4ze1d0n7BX8qGQX9YZ75sZ9LnNTxOcSoWnryMP0fSjHKHWIQg5dXzI/oLOR2k/VIrqg4ycDHtgeNYhSkJW0zfDGC9VuJhADe1s3oNaz0weKfiF2CSlOepDJdxvPsRKjIJ0oSGvvG7vPpeEIPURkJ46sKcfvNtKzlEriPWT/CffqGBp+67UejcEJrWSdqKJCkO0gDWoAVYIuahHCih0lFoBLu0qw3CxiXR9SFsHlFrcxKWUAemA1mhD9LaTCb2uajBeecRIu/f2P1lDHj93BOe8e8Kpt7wIncVR8fCZjKIeYmN4zLWRPL8jFojxHLHCp1CvsyzNZw+g8XAIPVKVfNFH85ikh0ld8rL868sbCmdxH9C8FCbMT9PxmxDyEehWennQ9AnyiStkWtDH9l2vVe9xn8/f36WQZDeOD7JjXfTm+ZWmRZGyFrIGm46VbgzNf9uREjYoKgsqHF+Z4nsa7ORJ24MCWe+WzXcqcmOc1eG+Nw0JtaQY3GjpIwhmYCNL8rUQFcld8b/t23z9LOfm+78T+IrGxJmFi/s6AfPpve/QeX5U27ZN1ys3KHdOY5veDxchA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(4326008)(508600001)(66556008)(66476007)(2906002)(8676002)(6916009)(86362001)(36756003)(66946007)(38350700002)(38100700002)(6486002)(5660300002)(7416002)(30864003)(6506007)(52116002)(8936002)(44832011)(6512007)(26005)(186003)(83380400001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jEYQfmD+9ZMSNN+GQ74kbpg+LVC6/kUkuYdyTMwdp1vudmESohLE3JHSM8eg?=
 =?us-ascii?Q?mLQUT+DrBK/HNfUG7Dn3lKKg1bJfDuNOgdS0IaWVL4+ZefaP9xEJE3uEpmfJ?=
 =?us-ascii?Q?OFRL3OnPcTYrIVa65vKPgx8tH4Guc08JcHyiNQTmTrDJiG49/Bup6Pcrb3jC?=
 =?us-ascii?Q?hp/0p7zS8JlHAmEwR6E/jFNRbUED0/UBRJHo5MUacVyLvufYeweEkqpG+wzk?=
 =?us-ascii?Q?FRdj5JxsLWUqj0Rg+M+S/RiW9AcknwzK1e1OMv+3jDxujjEnjPX5mSXd9xEj?=
 =?us-ascii?Q?yk+fARnUGT6pHXBuDYkntZGf73b7/JWP13BP7JpPE6VgZGIkggd+BoxislUW?=
 =?us-ascii?Q?2ezJdi24/Ov5FxWWf+lQPGjxSQjM2hqXFcI7gX88WxHFBH4kVk0/cCTNOeYW?=
 =?us-ascii?Q?2nqjMdYVgOgN7/n1hCUpWVbiDbeBFSXyXqDOG183rJhnw6QyqCVoCPp5QG+C?=
 =?us-ascii?Q?A6JL/NHg4YSIgT77tYVgArhiIfjl/Fu2j+jdLt08YuRcJDr6YFg9bG34bR2u?=
 =?us-ascii?Q?G/3d6zAlUpYhb/e6ppEaLawGbxocC2M+Vibac8Nkxn6a9O1dCrTS+uxWQ0lo?=
 =?us-ascii?Q?3SByIkyvYjsuIrHoeD5CqqvlkdHxl0kYWvteWegIdt8LFy6Up0Oano6mlvbx?=
 =?us-ascii?Q?Q2m38r42xsNVjsOhql2jBAoJqZGZKfDY42r2jeFmm8rv1c0DGx4hUaZ3DBFi?=
 =?us-ascii?Q?0vb6MQvZbcc3Bh7RuWyxcxopXt+T5kHdb165LjSq07ofBzQtN2p31q9C/Xk9?=
 =?us-ascii?Q?XZgm3ptXlPo/e9Ph8wo6lSjBYQ7MORoUzn430lcqNue4b75BWo38iOt2awCn?=
 =?us-ascii?Q?77Or7Jpyc/D6kCeZLYEOM/WvG9MVaSE2ZS43lQIRmYe3/mSTVzovkV5/tU8N?=
 =?us-ascii?Q?jv5wetCKCZmgVLfb628XfRqIWqYp39pN1wTZf9XM6ojQcb1h/YQpbaXVPuwb?=
 =?us-ascii?Q?hZaHcun1XyxvAeqy4GkmeVjffSglJ5TNf3/zi0UOJk3VT4g4vCDebUE+NsuV?=
 =?us-ascii?Q?5qOM6GkS/iInCCVUXE5coDfrGEFPvYwjsKl8VJkWFIjrnEqCz7A+Og7F4dmr?=
 =?us-ascii?Q?x/Mn/1dvaEzQFDw9Bq127DGoWtyDkPeqVkuA+52bk0cQOszNWrw8VljwEhYq?=
 =?us-ascii?Q?z9j+4VCIOB8ZTEIH2hqs9xcBj4AOG/nSXBndN0jvCfknaOByK5buagqbgmng?=
 =?us-ascii?Q?vGTNCGLjucT5l3w1kKC2zxTmIVjO4SbdFiIZUDCe+Rg4b/6sshbHiaCbcJpO?=
 =?us-ascii?Q?TNzeiDTV10S/7Pu4uNt+uo28CmBYuL8yDa5xz9hY7z2S+lBlZSdjG+mBzva5?=
 =?us-ascii?Q?w9W9UFmz50bco8EIkhjsqwKap0Bh3Ws67S39xaL04qxBpH4whrISrw2oaGp2?=
 =?us-ascii?Q?KctSZr23Smc7ZsVz57syIjdslF2anD1foaGX6iYDyZDEPpSGYZ/HhFPaeQCp?=
 =?us-ascii?Q?KVsGSLhcWhlCZHX4ddkxUZR0LDA72fwyKSWG+9B2zX+6gkXa5jRrJaXIOLz8?=
 =?us-ascii?Q?WYax6c9bNRTDrJ2otyN7WeUbVI9ovXa1mlp2i/S+ORTre9ur168Qx/yAona5?=
 =?us-ascii?Q?tQlpuUMjeSpRt0cihWzKHGDq+0nzJ8SzCy0uJUj2glQ7L4O7s5xsMNJukgFF?=
 =?us-ascii?Q?9vysdyMUle7F8uU6qtXYkBPfSjj58gwSUNTYLNen+IWhv7L/oniFPIBOd32U?=
 =?us-ascii?Q?4nq8PLJQ1CoKucmcwt2Ek6RBJKwTzXrhRORGE9zigTVxLZ4G7wY9uEEmTqX6?=
 =?us-ascii?Q?ZiuYjB0/zYmQ8GEOOKdejD1kTecWrwY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beeafc37-2d1c-43df-b8ef-08da13e2ef81
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:24:22.9858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7VQPi5WmewO+3DmnlsqgXwekyZPWja/DEWmFTvQKOzgXtd9hEOHHfGwURGmUjmtJiPPAggu39s2zfOoUErVZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4302
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_04:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010062
X-Proofpoint-GUID: f8DQIQGkHejyNedjZ4hGdWVm7y4oBMp5
X-Proofpoint-ORIG-GUID: f8DQIQGkHejyNedjZ4hGdWVm7y4oBMp5
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
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

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the status of a VirtIODevice, including
its corresponding vhost device's status (if active).

Next patch will improve output by decoding feature bits, including
vhost device's feature bits (backend, protocol, acked, and features).
Also will decode status bits of a VirtIODevice.

[Jonah: From patch v12; added a check to @virtio_device_find
 to ensure synchronicity between @virtio_list and the devices in the QOM
 composition tree.]

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
index 28f25ff83a..7f8eb29ced 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3926,6 +3926,110 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
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
index aee0e40daa..ba61d83df7 100644
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
+# Since: 7.0
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
+# Since: 7.0
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
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend" }
+#    }
+# <- { "return": {
+#            "device-endian": "little",
+#            "bus-name": "",
+#            "disable-legacy-check": false,
+#            "name": "virtio-crypto",
+#            "started": true,
+#            "device-id": 20,
+#            "backend-features": 0,
+#            "start-on-kick": false,
+#            "isr": 1,
+#            "broken": false,
+#            "status": 15,
+#            "num-vqs": 2,
+#            "guest-features": 5100273664,
+#            "host-features": 6325010432,
+#            "use-guest-notifier-mask": true,
+#            "vm-running": true,
+#            "queue-sel": 1,
+#            "disabled": false,
+#            "vhost-started": false,
+#            "use-started": true
+#      }
+#    }
+#
+# 2. Poll for the status of virtio-net (vhost-net is active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend" }
+#    }
+# <- { "return": {
+#            "device-endian": "little",
+#            "bus-name": "",
+#            "disabled-legacy-check": false,
+#            "name": "virtio-net",
+#            "started": true,
+#            "device-id": 1,
+#            "vhost-dev": {
+#               "n-tmp-sections": 4,
+#               "n-mem-sections": 4,
+#               "max-queues": 1,
+#               "backend-cap": 2,
+#               "log-size": 0,
+#               "backend-features": 0,
+#               "nvqs": 2,
+#               "protocol-features": 0,
+#               "vq-index": 0,
+#               "log-enabled": false,
+#               "acked-features": 5100306432,
+#               "features": 13908344832
+#            },
+#            "backend-features": 6337593319,
+#            "start-on-kick": false,
+#            "isr": 1,
+#            "broken": false,
+#            "status": 15,
+#            "num-vqs": 3,
+#            "guest-features": 5111807911,
+#            "host-features": 6337593319,
+#            "use-guest-notifier-mask": true,
+#            "vm-running": true,
+#            "queue-sel": 2,
+#            "disabled": false,
+#            "vhost-started": true,
+#            "use-started": true
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
2.35.1


