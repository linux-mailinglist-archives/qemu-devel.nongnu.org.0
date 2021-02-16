Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DDE31CBED
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:29:22 +0100 (CET)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1Lt-0004nh-WE
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lC1KG-0003Qv-3x; Tue, 16 Feb 2021 09:27:40 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:60688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lC1KC-00024e-4G; Tue, 16 Feb 2021 09:27:39 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GEOsF0150089;
 Tue, 16 Feb 2021 14:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=BT1qBXNvbCWr6Dl2wzL5WtzrR/imAt0aO+/Vl1qnl64=;
 b=zWfWM3meld3OMajXK2YDA8wQbUoGBWMx2eApuIgKJ0Yx8cTY507dDb0QJMmXk7wVd9UR
 j+zmje00RSheva56u0ryizz8DvbULUmJ8bkcYwnzRSWJBJnaqZSGQ0qL9ioF21EWbe9g
 MmALMa1QGkRj9yAINq2Xnkb4I9wSsobB1d0bXLpg2DLDziRUZcXrF1R6lz6Men2XEnCx
 6UTVqj+eXf3jRNEvm95KG5aBapwk94if1R2L+Fhvbe/N9hs9bC5+WFkQCuX9wyMjZfK9
 OnrryYw3EELiUr2ZL0EOH6flvP4vtFlAS/bW6wU//Q7dGFLahuV6pKVZCikAJUEbTe0e UQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 36p66qxykp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 14:27:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11GEQ8bN043164;
 Tue, 16 Feb 2021 14:27:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by aserp3020.oracle.com with ESMTP id 36prnxyq0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 14:27:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auTic7qXlDCmouCsUyHyTWiLIv+i2wsliRZI6sFDUzvKz6ec2WSfDG+3LsJH++JNNLxS9B69fcZw9au15mtwiru/ie8egN4zrjCIL+FOlo5pAAkYaRd+udryba8I9ahHVxtgMxPgwg9ce9sy86Hrtq7fyTH80roefk1yQx6a+H6/OuFS/reMhaUfQ72mvYjHyntj6f38eTBb8c4koE8o/gJKsP8ru0v1KMV53ClIunnWSToqqQNfngAnZ+khevQ2SM1opK9jNxq1Hm15RFyOj1VaJDmevvWS9dfV6/RK6c9IwhxEEX/C3KMFEZtaxalcGdj9Vw/Ay6Nkaav2kR/saw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BT1qBXNvbCWr6Dl2wzL5WtzrR/imAt0aO+/Vl1qnl64=;
 b=E+J9M6b/kH0hKAPW0U+OekvCemsKXI6FMDzM/R2I6Y2gpqW2L4eFfGvgIwalv/7PqMo3+kLwiLNGZhPuJdfj/9vQ1tmjRDr8FtBu1CJ3aBzK3S6H8Ve+PuA2USXvaqzq+Mv60YlGuqxWZ2rWW5WxyUKNGiPYU+XhLBuJYATYZyqseDNKmzUuPhhBygUz5TCFklPj+bZPtk9zGgxo2Zpm8gpGdUQEHBlUrqWVBHyYAbCbl9JK793vAV6h9zpkQPQhyaJA+VSQPwLN4w5H0GQ0BNlXQlkItDVQ1EXi2XfbJtv56S9EzVZhgRRkHyEuIDOOHZ7oua6Chc0M1gwGtNp+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BT1qBXNvbCWr6Dl2wzL5WtzrR/imAt0aO+/Vl1qnl64=;
 b=LY/yx28Fp/Sq+ZYCeZKS5Nuu2zK4FsfiVm2IltSeO3IC5e4NHgVF95160GZErzLLpg1Kc3/gN1dgvlIQhQZ3QUmM5gv2tp2bdzS+O3lub2sNoKgv+SlM/lUAtsh6RbbdT5z7Jol6yE2PI6sKcaN6V7L2eVzetnhl8bheCMrzyxE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DS7PR10MB5182.namprd10.prod.outlook.com (2603:10b6:5:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 14:27:29 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3846.027; Tue, 16 Feb 2021
 14:27:29 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/3] hw/pflash_cfi01: Correct the type of PFlashCFI01.ro
Date: Tue, 16 Feb 2021 14:27:19 +0000
Message-Id: <20210216142721.1985543-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216142721.1985543-1-david.edmondson@oracle.com>
References: <20210216142721.1985543-1-david.edmondson@oracle.com>
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
 15.20.3846.35 via Frontend Transport; Tue, 16 Feb 2021 14:27:27 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 429a69d9;
 Tue, 16 Feb 2021 14:27:21 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9303a80a-f9b0-442b-1cd3-08d8d286fd20
X-MS-TrafficTypeDiagnostic: DS7PR10MB5182:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB518286A21D831E31C4317CA788879@DS7PR10MB5182.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7r4RYvJZ424In9UQAVp0DnsacbZz7/ch651WlrDLfFznodv/h6jopy/gfkzI2ZY2W0IBIslzFIr8RQzbxDaroSQnEALnB79EDsfZZNvu3ZKda29obQNEHMPJRTIkIUC5DK9phvMNG6CNo7a+Q44bWtV4rUaUczEINlfJxTfUOtQSV6Vqb4eErbPFep/hy0/gTHNzE4WY/BKdONYJjw6Ut3XrRar/wMCW+wNDlhiVdHhJYm5DxeGoSehroO0rbf2FttOCQV5o7Gi89TZkYRRdi0tlGlc2q/tlxKNQO5otRTe6yBEv9lsOIPMZN/Ucv30JA1JhbiKvQmA59bG39xKjOw2qfmWxjEpzdlPrGONtcVg8qCD72OcrEWE8boU3vwMZ414E4wa58ZI0KFcou69Gi/zyuthcZJ5+P73b2y4eVS00maDx14G2awQQSvwIHguH645su2NokVtXOCLjV4lLDkQvXA25DoqQGF3UvzW3wQShEWCpjLm/GqOWKtX9pbKMQiowZ1f+rpXsHTV1bwOYAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39860400002)(376002)(366004)(136003)(4744005)(2906002)(86362001)(478600001)(44832011)(1076003)(316002)(54906003)(52116002)(66946007)(36756003)(66556008)(8676002)(6916009)(66476007)(8936002)(2616005)(5660300002)(107886003)(83380400001)(186003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NTg4JjrSEwk3ASxOUXX8fhsBY59H4GDfYMo/6k6T+n/1m7nr3y6Z/rki+edQ?=
 =?us-ascii?Q?F0Ft35ROvvP9h6YMyXB0o+W7h6K4W5Uxq8wvjl2bKuMzijRkGJzaj94ogq6v?=
 =?us-ascii?Q?Xw17rf70v9vN2u97ai1fPjsK9GbN71EvPhQae5xdlzW2FfK2HslR/S2akcRT?=
 =?us-ascii?Q?R2J/p/0qxYxDBQ1ITBlY1WCdxhofgy1rfEh6QQ4rZetwLAUTwGtRPi2jyy1u?=
 =?us-ascii?Q?d9EPHpf2q8R5q82UgDV+1stQ/LBj2aLQyp8Wcpnpo1+PScBl769icPc1XXfN?=
 =?us-ascii?Q?VklZ23yfjrzlXBz7tstVFqvgfgyE1pm+Hn2rVZp7deNvJaNbb1UkEF2ZEAWT?=
 =?us-ascii?Q?HBrVNugCUJykJGqRcgldzUJmP4E6e4GuZ/DUUT6HrtjgyAMnKITbEpCXIaaQ?=
 =?us-ascii?Q?nzTkJT9zJN4HLcUYs6XcXrmGO0IEEfVmqxkEIwDylF+CdoTfI3QLZF92Wx3s?=
 =?us-ascii?Q?xVeCcApb34pPpollHfOopOKe013Jk1fELL2QxUJAwsHUEWkEexUX9EEJZFN5?=
 =?us-ascii?Q?nezhnl51ri6w64HwDZ+7VqvQkbP2lpmwTSwRTL/yXUcYI71pfshdCIzBc4ig?=
 =?us-ascii?Q?lUsKKn7Ez+yFSfUKqsd648Hlawvssq6EFXK1+vSkjYRV7gSYCf9lKcboxkNM?=
 =?us-ascii?Q?NHwKVh31xUVs/vPMPNfj45/NcSS6c3+D07Bjcm/J9jPKzGPb9xx1qe3ovi2p?=
 =?us-ascii?Q?wPj+ImtxVdZjYaNUgXdBxJOb5D9NyUSYd8x8P5hGV029a39u6YrxX5t7K+3I?=
 =?us-ascii?Q?A3OTJ1gjzIQAPCL8l0DgxXzriebG7el8aQqt6SLCERm63t/KyGZlaXA9zKqI?=
 =?us-ascii?Q?uHzF7oACw4wCRqT8a0ynIso9BLpoRe+s+5hkQSCKWlQBEoePy/KVUOdVt/GT?=
 =?us-ascii?Q?o0JvRBi5PWDi8CexeHirPjeCBiUsc0j1YcdCUnCGXSDq0G2uYnlUuvLlMJoi?=
 =?us-ascii?Q?TRnWofPlHspE6HBMhh44TAJQGQ1QjvC/HRopRmvSH6esKQmcG2FvQxMOWH/v?=
 =?us-ascii?Q?h3CadWmSeSNIgsUF8LyPmTSJ5sR1Ur0jNnNKiNNaXBrcddUKI8K9vnizm8zg?=
 =?us-ascii?Q?NrvlhDk45EKYPHwaXlQMqRWeSch+lnA47sdAE7I43paHd+Z+sQVFK0H6apDs?=
 =?us-ascii?Q?bynmV/Jd0WXraz8slVZTxibL6VWMcFKDI0g3NCTIqSImzJVYaqyFFllgwkFE?=
 =?us-ascii?Q?VrhuTzqa3+MeXgn27CbLG7RljBcL2sTWyK8tvUCoJJ1LhIdyBLa+ZTyESAvq?=
 =?us-ascii?Q?tzvi2TGCpWs2e2EH7QUTBI5enGLGE/cl5iSUmWoDIgtspJhDMKHJFQW1FiV2?=
 =?us-ascii?Q?wvs8XnjdBBV6GNAx6AgJkYNQ9QLjH4LcHHTbU7OCM7X4i9t+kCk6aTJOK9Fd?=
 =?us-ascii?Q?i5WjxVs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9303a80a-f9b0-442b-1cd3-08d8d286fd20
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 14:27:29.1063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +a9y4wIsV4NCiZ5l1tplT9e0gmDaqJ9D2JX9B0tRWwAffSHXTafHj5MfE0+foyrGnl9oKr5cYEdrSqtgIFMHqmErdopOvTFQcZPCxpHGF44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5182
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160133
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9896
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102160133
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
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

PFlashCFI01.ro is a bool, declare it as such.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/pflash_cfi01.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 9e1f3b42c6..6b21b4af52 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -72,7 +72,7 @@ struct PFlashCFI01 {
     uint8_t max_device_width;  /* max device width in bytes */
     uint32_t features;
     uint8_t wcycle; /* if 0, the flash is read normally */
-    int ro;
+    bool ro;
     uint8_t cmd;
     uint8_t status;
     uint16_t ident0;
@@ -738,7 +738,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
             return;
         }
     } else {
-        pfl->ro = 0;
+        pfl->ro = false;
     }
 
     if (pfl->blk) {
-- 
2.30.0


