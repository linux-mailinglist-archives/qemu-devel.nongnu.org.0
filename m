Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635C0433FD8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 22:34:59 +0200 (CEST)
Received: from localhost ([::1]:45594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcvp4-000795-HS
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 16:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mcvjb-00039X-1J
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 16:29:19 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mcvjX-0008CS-J9
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 16:29:18 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JKPnSW005524; 
 Tue, 19 Oct 2021 20:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=rpWiPpYoZLs1P/iG9UGWOlvpFHzz9smq7H+rUl3ZmHg=;
 b=AWFI8TsiIS3qNlSGbLKJWGlts5XtqZpZ5kqbI4KXnkoHNCqQpgyfZOQ2HwbFk334dltt
 MPvA7ShDSWEk7OA2KLNHEpCAdx/rtyisWuemjYZ+U9hB4CNRRTBDeGWvwQPEG/F71uhv
 g2oPR2YZwib3O1uFIY4kMHyNR2vDs30cQyh3Jvjs1B5FM+IpXVf+T7B7S1DVt8cKNE4d
 C/MYi/CLy+VWt9tcZ+TN2UhNrWIWyGnxjnBAVEQtgnJa+7MdQSEOWSYJooKjk1PH8LPm
 uTFKiRWtwpYcZB0gnbNTroX/yOWux5EC2sfL9XbFirTOF0Lw1LRP/zkEj+xDEPqkAIn5 OA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bsqgmn1g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 20:29:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19JKGn0U182179;
 Tue, 19 Oct 2021 20:29:10 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by aserp3030.oracle.com with ESMTP id 3bqmsfc8vm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 20:29:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIv+8JKSKnRbcX+AMzcrQkeChL/2SkwgVtpqa3LbkVVtofXmQQoNJFnQwHyOyd3T7bCClaBhQksl6I3jKkjWmt+6PcRvKtXLb2uw3Im6o1dATYMVe0Tv78neB/VbASPXH0kE+Y9L6Km935tqP1NFEQWZO07jbQgREWfMb7hSofIGfrOlW/bpj5xaZxO3pFHAmzidUxPh9Nx+PMpcLQed3fbpRGDD/tLaFehaVhwdEKD/eHxauR9nLGlVdGeQkiwE7TajI77HuEYrpveZNNnfdTjXqyTf8dSKuv1KpZZw6OixCfvLva2u+abPJ9k4zv4kar5Fmo5mF66k4CDctsbSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpWiPpYoZLs1P/iG9UGWOlvpFHzz9smq7H+rUl3ZmHg=;
 b=j5jzTxiXeB3Vy8o++rOz/YLxtFSYaWkbCJmT4+EbQJhDBneKvVnBs5Z7HBqc0iv7NIC/yExOFcSq3ANJaXA5cqy3Z0nRnpo4sF+upXYyOKU+GrnILyksj4RFX2+kalfnRCncsWbs9pGVTK+DheoES8GB3Gd99E68NCO4s6wZpsbmtZ6LrqnTay07QWVFOg2gwGIW0s3pAHNLje+NLZhEhscDN8EoIwCfXkWflbiPbPuXwh/OhcCsEuc9d41wnJSdcN2Ls20JKgPkgbbVYJSr1A3+BhmQdV9sWU9N4m15MUwZjWa39k5JyTqBj4mdoTvdz/5M/enp5bWmtFIdjAnXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpWiPpYoZLs1P/iG9UGWOlvpFHzz9smq7H+rUl3ZmHg=;
 b=MHhu/ZUy25G2nn6h4IL5jHNXe+yHMQ5RI7ZSG9sjGeK/Ce1Pw9BI/CVPT06YQqsftTChX/gnkWJosirNuKYWGbQbRJc+kX156pAoX2N00ZCwuAL0f2j6rCaO1Rlhzt2DOG9ctnnDICRl+YJYJGrGilPgqK7CiKXgT8I1o2vcbdE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SN6PR10MB2448.namprd10.prod.outlook.com (2603:10b6:805:41::18)
 by SA2PR10MB4681.namprd10.prod.outlook.com (2603:10b6:806:fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 20:29:09 +0000
Received: from SN6PR10MB2448.namprd10.prod.outlook.com
 ([fe80::2c40:de5b:9f20:4604]) by SN6PR10MB2448.namprd10.prod.outlook.com
 ([fe80::2c40:de5b:9f20:4604%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 20:29:09 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] qmp: Support fd-based KVM stats query
Date: Tue, 19 Oct 2021 15:29:03 -0500
Message-Id: <20211019202904.4857-2-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211019202904.4857-1-mark.kanda@oracle.com>
References: <20211019202904.4857-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::31) To SN6PR10MB2448.namprd10.prod.outlook.com
 (2603:10b6:805:41::18)
MIME-Version: 1.0
Received: from linux-1.us.oracle.com (137.254.7.181) by
 SN7P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15 via Frontend Transport; Tue, 19 Oct 2021 20:29:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6ee0c1c-5474-4bb0-687d-08d9933f1a96
X-MS-TrafficTypeDiagnostic: SA2PR10MB4681:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR10MB4681258A3E022674922656FEF9BD9@SA2PR10MB4681.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDRQdG6sMiUDwKuOTCSgxrvwTqWPvfxd2T+tGWQz4DM3oAZN26pZOdTo4SD5xAJBdAkh8s5SyXhuLqMzi0xBEmfD6orgiMv2zOZUvR3gppFlrikpT7exVWbpt+yvWH8OTDyaZBUdncs/XCK6Y3pcPzWYqIOUNSI28kjDG0zlGAZb+W8gqA/PaIi9Tf40YKOAhwrxa9nOUY9pxuImjj1Hc69n9mf+QLzlQ7upj6RcrpFZeksriexZuvbdKyZ0DZGtmMCvsplUkyeL6ZGYezHlFoIcoGxQ9myJ0QFKekpH0/fvEQ1hDhXYlSp3bxSIfGd0CqhnZgJe1W97PLJMNGosvSvWXAhzbFdpEb8JOvAZNoqASZLRnBzZr5b6r6KaJG240dFpVlx5Hvs9m4EFAX+4tqkcRTVde/0plF6E79bFfLgENrNmrxBwBbmbPspj2OcaW8JP7gNuYlOM1LW8iYuzCetD8oH9V+8MKRomPZdEB6Gw1Wc1WJQ12BVBQTb8x8PsGa/ztwGElHL+oPswkpvLGIGL5j6Ea7QBVCCNizxNaVGApPHntYEwo1x1HnCM7WgKoSRi+gG7ihyrTmaLU9uIOZTyCah3vHr5CBFFB5g8Z+Rej8KmnBuY33S4AQcW/Kr7kcDiBPs/ioJ4z9MZzGdW0XnY2qSyhFhEtGB5SXXOiJEwojP8ubuWzbGJnLr4IyvyMI+M/t/a4110UGplD0WTbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2448.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(86362001)(316002)(8936002)(52116002)(7696005)(956004)(66946007)(6666004)(83380400001)(186003)(6486002)(66476007)(2906002)(38350700002)(26005)(44832011)(30864003)(5660300002)(2616005)(4326008)(508600001)(36756003)(66556008)(107886003)(1076003)(38100700002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?42JlzrNq0NKP5t7TNaq7pH8yDRihuuCY8YnvNMGEDHuil1xn2ykLzbCUMITu?=
 =?us-ascii?Q?KM7b1XTphWglXkzycit4hNk4dNNPxfXwMSBPNudEZbWpi+atVcEL8XLyql6t?=
 =?us-ascii?Q?qDvSxxLe9KgPVXnQjGJK2FsaXn98SYebY7bm3p6vPP8bo32zGQU6SfnFDQjf?=
 =?us-ascii?Q?D3At6VpWzJGq9EChGQC8K60rlep7pQjeMgmfBmPbXC2yFRBKiGk9xHf9rdO/?=
 =?us-ascii?Q?//lPHbz+mTOpmbfHvqySA/HYCWTcl2NgvYrAC1vGjR8gjNox20rfprqH7lQg?=
 =?us-ascii?Q?yy/p4egLURP8zF7D57wPIVWGFPaGYNNqnZhaK0WVIteMiiupJecaer7J1RFV?=
 =?us-ascii?Q?qy3dCfxT6VW8kDOjvcl84KQp3MZHFus86IgYgQgX55uuCbm4NgwGmenCI2PO?=
 =?us-ascii?Q?xUkHajCASWTsosvrKkexq7ri++Xbimcac+PeZHANU9wQ2xE3IElzlXScmV71?=
 =?us-ascii?Q?3sNNUGxHLq3mG/o7owP6I7S7zF6GXlzpHaYOFlu/ZYzKLuhxzHsT9D+1efR9?=
 =?us-ascii?Q?afNnfRjh8IX+bqJutB6lTwejY2GiPYwM2Upo4KiJMZwsok30hCsso98efKu+?=
 =?us-ascii?Q?mQtBFJBxME4HOfUSGTi83a9b8DGdksPSJQtyzuO7WzfERnPxPCC655zThlSL?=
 =?us-ascii?Q?448fFNWUyAJu+5rDaAOINo5NwY0IHhOmTgzZZmXGKDRA1szRv3DeGrYupeGE?=
 =?us-ascii?Q?QkGfSeUP3Px66Nya7n0pxjMiLDgHIV2ZBt6YTZitnWOQ2Mq28A22xlaRKjCd?=
 =?us-ascii?Q?kBIB/utt7yQv2s8GiFu8EbRA1WxxKauEubpe4ZS8r5HmiQ3Nlzp1UzpJpbES?=
 =?us-ascii?Q?rskU6SEmvCKktVkAx8tjcA30DT1mLDp3h0vpwownl0PQBsmXbpkjsEg0CSJO?=
 =?us-ascii?Q?YfCwDuGzdaWL6pNpUOCM66RA9G4YIFpwng9/7zgISI0IN5hWK+T3s5/Td/9K?=
 =?us-ascii?Q?CRyMlnJcszCEjgHkAVXHVVpuoZQXLOR7yqdTnMsGnE+5cdFgIG0Tk3qC3D0+?=
 =?us-ascii?Q?lev+yEtM6jsB5e82Dj9TX4RbGO6E9IqJOmp4b0njhETQpBxaU4Yaozz+6iSp?=
 =?us-ascii?Q?/039nqEzkbEHDxMWY2YWJ/e7RcgsUjAzQaHy+s8BDPnkWXHeKldKfcUSFLn5?=
 =?us-ascii?Q?vbfU60umP1R2TX/2kAX8JrDTmCz/SL0zpNAz2ymNOjcAHf1RTNplf0iOZOm3?=
 =?us-ascii?Q?zEmHtSXn1s4G4Nl2tAEGyUuOnN0grI0GLQE66B6ZSi/VLT4RnjEzYfzwqI4S?=
 =?us-ascii?Q?WFQIVLzAOFogyWK73OyQWS8T5IHWoaFXnRAV2OIDSAGbORNmW2eONESfkaqZ?=
 =?us-ascii?Q?ZFfDzHwOvxRUzKh861QUWxI5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ee0c1c-5474-4bb0-687d-08d9933f1a96
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2448.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 20:29:09.0351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: japw0nEqwZoOED2hVONPv66v+rs4FquE2cBMDqQ3iNm7np3TujoBcJpgABFhSghwrGQ+IF6nzYDc1Ma4v10yYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4681
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10142
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110190117
X-Proofpoint-GUID: uluVTsuG2yTSg_wHgc4KXACnxryBOrDM
X-Proofpoint-ORIG-GUID: uluVTsuG2yTSg_wHgc4KXACnxryBOrDM
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a QMP command 'query-kvmstats' to query KVM for vm and vcpu
fd-based statistics. The kernel support is provided by commit:

cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")

The interface supports an optional 'filter' argument to specify a
particular stat to query.

Examples:
{ "execute": "query-kvmstats" }

{ "return": [
    { "name": "vm",
      "stats": [
        { "name": "max_mmu_page_hash_collisions",
          "unit": "none",
          "base": 10,
          "val": [ 0 ],
          "exponent": 0,
          "type": "peak" },
        { "name": "nx_lpage_splits",
          "unit": "none",
          "base": 10,
          "val": [ 120 ],
          "exponent": 0,
          "type": "instant" },
...
    } ] },
    { "name": "vcpu_0",
      "stats": [
        { "name": "req_event",
          "unit": "none",
          "base": 10,
          "val": [ 500 ],
          "exponent": 0,
          "type": "cumulative" },
...

{ "execute": "query-kvmstats", "arguments" : { "filter" : "req_event" } }

{ "return": [
    { "name": "vm",
      "stats": [] },
    { "name": "vcpu_0",
      "stats": [
        { "name": "req_event",
          "unit": "none",
          "base": 10,
          "val": [ 500 ],
          "exponent": 0,
          "type": "cumulative" }
    ] },
    { "name": "vcpu_1",
      "stats": [
        { "name": "req_event",
          "unit": "none",
          "base": 10,
          "val": [ 61 ],
          "exponent": 0,
          "type": "cumulative" }
] } ] }

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 accel/kvm/kvm-all.c | 246 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/misc.json      |  73 +++++++++++++
 2 files changed, 319 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index db8d83b137..597d0c7a09 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -47,6 +47,7 @@
 #include "kvm-cpus.h"
 
 #include "hw/boards.h"
+#include "qapi/qapi-commands-misc.h"
 
 /* This check must be after config-host.h is included */
 #ifdef CONFIG_EVENTFD
@@ -3406,6 +3407,251 @@ int kvm_on_sigbus(int code, void *addr)
 #endif
 }
 
+typedef struct KvmStatsArgs {
+    KvmStats *kvm_stat; /* QAPI auto-generated struct */
+    char *filter;
+    Error **errp;
+} KvmStatsArgs;
+
+static KvmStatDataList *add_kvmstat_entry(struct kvm_stats_desc *pdesc,
+                                          uint64_t *stats_data,
+                                          KvmStatDataList *data_list,
+                                          Error **errp)
+{
+    KvmStatDataList *data_entry;
+    uint64List *val_list = NULL;
+    Error *local_err = NULL;
+    int i;
+
+    data_entry = g_malloc0(sizeof(*data_entry));
+    data_entry->value = g_malloc0(sizeof(*data_entry->value));
+    data_entry->value->name = g_strdup(pdesc->name);
+
+    /* Convert flags to type, unit and base (QAPI auto-generated enums) */
+    switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
+    case KVM_STATS_TYPE_CUMULATIVE:
+        data_entry->value->type = KVM_STAT_TYPE_CUMULATIVE;
+        break;
+    case KVM_STATS_TYPE_INSTANT:
+        data_entry->value->type = KVM_STAT_TYPE_INSTANT;
+        break;
+    case KVM_STATS_TYPE_PEAK:
+        data_entry->value->type = KVM_STAT_TYPE_PEAK;
+        break;
+    default:
+        error_setg(&local_err, "KVM stats: invalid type %u",
+                   (pdesc->flags & KVM_STATS_TYPE_MASK)
+                   >> KVM_STATS_TYPE_SHIFT);
+        goto exit;
+    }
+
+    switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
+    case KVM_STATS_UNIT_NONE:
+        data_entry->value->unit = KVM_STAT_UNIT_NONE;
+        break;
+    case KVM_STATS_UNIT_BYTES:
+        data_entry->value->unit = KVM_STAT_UNIT_BYTES;
+        break;
+    case KVM_STATS_UNIT_CYCLES:
+        data_entry->value->unit = KVM_STAT_UNIT_CYCLES;
+        break;
+    case KVM_STATS_UNIT_SECONDS:
+        data_entry->value->unit = KVM_STAT_UNIT_SECONDS;
+        break;
+    default:
+        error_setg(&local_err, "KVM stats: invalid unit %u",
+                   (pdesc->flags & KVM_STATS_UNIT_MASK)
+                   >> KVM_STATS_UNIT_SHIFT);
+        goto exit;
+    }
+
+    switch (pdesc->flags & KVM_STATS_BASE_MASK) {
+    case KVM_STATS_BASE_POW10:
+        data_entry->value->base = 10;
+        break;
+    case  KVM_STATS_BASE_POW2:
+        data_entry->value->base = 2;
+        break;
+    default:
+        error_setg(&local_err, "KVM stats: invalid base %u",
+                   (pdesc->flags & KVM_STATS_BASE_MASK)
+                   >> KVM_STATS_BASE_SHIFT);
+        goto exit;
+    }
+
+    data_entry->value->exponent = pdesc->exponent;
+
+    /* Alloc and populate data list */
+    for (i = 0; i < pdesc->size; i++) {
+        uint64List *val_entry = g_malloc0(sizeof(*val_entry));
+        val_entry->value = stats_data[i];
+        val_entry->next = val_list;
+        val_list = val_entry;
+    }
+    data_entry->value->val = val_list;
+    data_entry->next = data_list;
+    data_list = data_entry;
+
+    return data_list;
+
+exit:
+    error_propagate(errp, local_err);
+    g_free(data_entry->value->name);
+    g_free(data_entry->value);
+    g_free(data_entry);
+
+    return data_list;
+}
+
+static void query_kvmstats(KvmStatsArgs *kvm_stat_args, int stats_fd)
+{
+    size_t size_desc, size_data;
+    struct kvm_stats_header *header;
+    char *id = NULL;
+    struct kvm_stats_desc *stats_desc = NULL;
+    Error *local_err = NULL;
+    ssize_t ret;
+    int i;
+    KvmStatDataList *data_list = NULL; /* QAPI auto-generated struct */
+
+    /* Read kvm stats header */
+    header = g_malloc(sizeof(*header));
+    ret = read(stats_fd, header, sizeof(*header));
+    if (ret != sizeof(*header)) {
+        error_setg(&local_err, "KVM stats: failed to read stats header: "
+                   "expected %zu actual %zu", sizeof(*header), ret);
+        goto exit;
+    }
+    size_desc = sizeof(*stats_desc) + header->name_size;
+
+    /* Read kvm stats id string */
+    id = g_malloc(header->name_size);
+    ret = read(stats_fd, id, header->name_size);
+    if (ret != header->name_size) {
+        error_setg(&local_err, "KVM stats: failed to read id string: "
+                   "expected %zu actual %zu", (size_t) header->name_size, ret);
+        goto exit;
+    }
+
+    /* Read kvm stats descriptors */
+    stats_desc = g_malloc0(header->num_desc * size_desc);
+    ret = pread(stats_fd, stats_desc,
+                size_desc * header->num_desc, header->desc_offset);
+
+    if (ret != size_desc * header->num_desc) {
+        error_setg(&local_err, "KVM stats: failed to read stats descriptors: "
+                   "expected %zu actual %zu",
+                   size_desc * header->num_desc, ret);
+        goto exit;
+    }
+
+    for (i = 0; i < header->num_desc; ++i) {
+        struct kvm_stats_desc *pdesc = (void *)stats_desc + i * size_desc;
+        size_data = pdesc->size * sizeof(uint64_t);
+        uint64_t *stats_data = g_malloc(size_data);
+
+        ret = pread(stats_fd, stats_data, size_data,
+                    header->data_offset + pdesc->offset);
+
+        if (ret != pdesc->size * sizeof(*stats_data)) {
+            error_setg(&local_err, "KVM stats: failed to read data: "
+                       "expected %zu actual %zu",
+                       pdesc->size * sizeof(*stats_data), ret);
+            g_free(stats_data);
+            goto exit;
+        }
+
+        if (kvm_stat_args->filter) {
+            if (g_strcmp0(kvm_stat_args->filter, pdesc->name)) {
+                g_free(stats_data);
+                continue;
+            }
+        }
+
+        /* Add stats entry to the list */
+        data_list = add_kvmstat_entry(pdesc, stats_data, data_list, &local_err);
+        g_free(stats_data);
+    }
+    kvm_stat_args->kvm_stat->stats = data_list;
+
+exit:
+    error_propagate(kvm_stat_args->errp, local_err);
+    g_free(stats_desc);
+    g_free(id);
+    g_free(header);
+}
+
+static void query_kvmstats_vcpu(CPUState *cpu, run_on_cpu_data data)
+{
+    KvmStatsArgs *kvm_stats_args = (KvmStatsArgs *) data.host_ptr;
+    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
+    Error *local_err = NULL;
+
+    if (stats_fd == -1) {
+        error_setg(&local_err, "KVM stats: ioctl failed");
+        error_propagate(kvm_stats_args->errp, local_err);
+        return;
+    }
+    query_kvmstats(kvm_stats_args, stats_fd);
+    close(stats_fd);
+}
+
+KvmStatsList *qmp_query_kvmstats(bool has_filter, const char *filter,
+                                 Error **errp)
+{
+    KvmStatsList *stats_list_head, **stats_list_tail = &stats_list_head;
+    KvmStatsArgs *stats_args;
+    CPUState *cpu;
+    KVMState *s = kvm_state;
+    KvmStats *value;
+    int stats_fd;
+
+    if (!kvm_enabled()) {
+        error_setg(errp, "KVM stats: KVM not enabled");
+        return NULL;
+    }
+
+    if (!kvm_check_extension(s, KVM_CAP_BINARY_STATS_FD)) {
+        error_setg(errp, "KVM stats: not supported");
+        return NULL;
+    }
+
+    stats_args = g_malloc0(sizeof(*stats_args));
+    stats_args->errp = errp;
+
+    if (has_filter) {
+        stats_args->filter = g_strdup(filter);
+    }
+
+    /* Query vm stats */
+    stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
+    if (stats_fd == -1) {
+        error_setg(errp, "KVM stats: ioctl failed");
+        g_free(stats_args);
+        return NULL;
+    }
+    value = g_malloc0(sizeof(*value));
+    value->name = g_strdup("vm");
+    QAPI_LIST_APPEND(stats_list_tail, value);
+
+    stats_args->kvm_stat = value;
+    query_kvmstats(stats_args, stats_fd);
+    close(stats_fd);
+
+    /* Query vcpu stats */
+    CPU_FOREACH(cpu) {
+        KvmStats *value = g_malloc0(sizeof(*value));
+        value->name = g_strdup_printf("vcpu_%d", cpu->cpu_index);
+        QAPI_LIST_APPEND(stats_list_tail, value);
+
+        stats_args->kvm_stat = value;
+        run_on_cpu(cpu, query_kvmstats_vcpu, RUN_ON_CPU_HOST_PTR(stats_args));
+    }
+
+    g_free(stats_args);
+    return stats_list_head;
+}
+
 int kvm_create_device(KVMState *s, uint64_t type, bool test)
 {
     int ret;
diff --git a/qapi/misc.json b/qapi/misc.json
index 5c2ca3b556..0ced6a856c 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -523,3 +523,76 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @KvmStatType:
+#
+# Enumeration of KVM stat types
+# @cumulative: stat is cumulative; value can only increase.
+# @instant: stat is instantaneous; value can increase or decrease.
+# @peak: stat is the peak value; value can only increase.
+#
+# Since: 6.2
+##
+{ 'enum' : 'KvmStatType',
+  'data' : [ 'cumulative', 'instant', 'peak' ] }
+
+##
+# @KvmStatUnit:
+#
+# Enumeration of KVM stat units
+# @bytes: stat reported in bytes.
+# @seconds: stat reported in seconds.
+# @cycles: stat reported in clock cycles.
+# @none: no unit for this stat.
+#
+# Since: 6.2
+##
+{ 'enum' : 'KvmStatUnit',
+  'data' : [ 'bytes', 'seconds', 'cycles', 'none' ] }
+
+##
+# @KvmStatData:
+#
+# Individual KVM stat
+# @name: Stat name
+# @type: @KvmStatType
+# @unit: @KvmStatUnit
+# @base: Exponent base (2 or 10)
+# @exponent: Used together with @base
+# @val: List of uint64 values
+#
+# Since: 6.2
+##
+{ 'struct': 'KvmStatData',
+  'data': { 'name': 'str',
+            'type': 'KvmStatType',
+            'unit': 'KvmStatUnit',
+            'base': 'uint8',
+            'exponent': 'int16',
+            'val': [ 'uint64' ] } }
+
+##
+# @KvmStats:
+#
+# KvmStats per vm or vcpu
+# @name: vm or vcpu_<number>
+# @stats: List of @KvmStatData
+#
+# Since: 6.2
+##
+{ 'struct': 'KvmStats',
+  'data': {'name': 'str',
+           'stats': [ 'KvmStatData' ] } }
+
+##
+# @query-kvmstats:
+#
+# @filter: KVM stat name (optional)
+# Returns: List of @KvmStats
+#
+# Since: 6.2
+##
+{ 'command': 'query-kvmstats',
+  'data': { '*filter': 'str' },
+  'returns': [ 'KvmStats' ] }
-- 
2.26.2


