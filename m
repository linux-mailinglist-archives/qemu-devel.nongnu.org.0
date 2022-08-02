Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85BC58750D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 03:29:36 +0200 (CEST)
Received: from localhost ([::1]:49182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIgis-0007rT-0D
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 21:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1oIgdx-0002z1-8o
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 21:24:23 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1oIgdu-0006HF-Ez
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 21:24:20 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271NxGMc013644;
 Tue, 2 Aug 2022 01:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=6LgnMK/4u0TFO6cB7UqK2IKD2kRJJgBpoO243rvlCFY=;
 b=2sUFB6fjBGD3xwWRNSayV6AJYOekXvAPbqynD7Bi3VpUntSOlk1yGQPHNgAU96FVO4EJ
 RI+VzignIQGfzGh7rE2W3ur+G+QxswKCzR1rG8IgZOhzq66nZyH0v18zrPHiLIn+TejY
 BJxm12eEZjCog6JtQX9kyguhqC7z3AtvnTncAsT4KtBipiYFhDKULqYWdv/pHs6umrfS
 CGlOxkWaR22g6EKkyqCQjJZpBD+gkgSygY/BYgp73NrKjaVD7IumkrtuB9BVHhuxoWUp
 IFJwe1ZUE8wLeFnKfJnpxGFT9JvdJ2NXMUF7nDet8y//tttKyjJYrVxAddNrYxNaRSJc gA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hmu2c59c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Aug 2022 01:24:13 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 271MbwYl007447; Tue, 2 Aug 2022 01:24:12 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hmu31kayd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Aug 2022 01:24:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNgD3sSSqorShUC+pFrMgrg0+ibR8o9q6ZZ0pbcfjHn8FB8YdID/dh5mx8S20Ju0/ua7Xwx1Z3UuWQMXdeyT11M46tiroEHNM2Q+Sy+bBfUmRN+bVW28Cg5Emuq4kOEGMR/0Tjs/qNx8NyxB0vSGeQkJTCK/4Mq+BHMa/adgq2R8zyGoDU7I2Hr84gH+Wb3+/8Yh4TtPUyaU1d0+RAoCb3AfJqmyBQysV06wbqcba9P09su4mBtEkdTeVk4YpS1xlAtFE0UlpQ4oM6NpHOMGcVEvmS5Ty/aA2Rzn3xuBzJ+T1rXa5/fbNQel4f0gB7zBASrxHVKbbuuhzarxm5nbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LgnMK/4u0TFO6cB7UqK2IKD2kRJJgBpoO243rvlCFY=;
 b=F5QiB07dQJfr+oWLic3PmqZWH4rv7fgmoyC6IWvwahBKiZ9hM184Y9QS0iXUvONyNbp1B3a4u3koMzMnA3ivhCeYyy1BZuST6LUAziCBQs+zhmi/kzpX+AD7EqatZdCIMQhgUnqa06+sGggArSJgS/FPiBu2rzcI3wj6WhlTTyTePESgEp6CF10dyt8pYiLwvqhXgO8wPjoRCxwEUEq9VFaaM7uUgSGHTZARtFw/VamYOQESymDBxaPCtCwsnJm7eXHL/XOvWTptL8COdeRpviZ854LGwyP4wVsoHNM61wDGO9/4S71s2Qz3Rz6Z/KLV0qg3IDrxmzNoJ3bRJTJ3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LgnMK/4u0TFO6cB7UqK2IKD2kRJJgBpoO243rvlCFY=;
 b=YXQmPyFFV4nxElKnDJzObzf6RXi/Ik3I8qSt+WpHxmUDVD8PecCkkS2R9qXEiMTVFbaHyXYoGrF2MbzRrPSMuggPCVR8MqTZYsYylsqEzls7g6g0GxL7mqqjf4IdVcIKYSU9zrdusQjITa4j97rR6VVCYaNrwWMKJZ0QwNvBteI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3487.namprd10.prod.outlook.com (2603:10b6:208:119::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Tue, 2 Aug
 2022 01:24:11 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b5fb:1a47:c4b:a83f]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b5fb:1a47:c4b:a83f%6]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 01:24:10 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com, berrange@redhat.com
Subject: [PATCH 1/1] vfio-user: update submodule to latest
Date: Mon,  1 Aug 2022 21:24:04 -0400
Message-Id: <6b9dc37842ea533622c09d0ca7462f77c18cd67d.1659403195.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1659403195.git.jag.raman@oracle.com>
References: <cover.1659403195.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6f7615c-c577-4106-2291-08da7425b3d0
X-MS-TrafficTypeDiagnostic: MN2PR10MB3487:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: REwyvS4K0M53YelLo/Z47cp+Wf/Ao7xrXYreZBLptqUPjNTf6SBq0BQ2AzRYLM9CuQ29yt8b8HhJorBsaxDqwIMWful21ed9OFwaY6gdD3H6+kWXRCGliijt+xF7wPxb3Hd4eCtF2x0AhedWfLHkbX8I7Ysf+74d7W8BYdYrGlHoGYAZEwV4KuDZ2CTE46D7ZoOoA5QtjgJ5mEbEAg04/mzqDpkbpuf6vWCTd+NoVmnRMr2wPa9TlfyjgkPCIRdYm3Uo8W1OhSJr0/ydMnzqPuNrVwuHHoowUyjHHRWdWk5PzZ22KZYRZGjxhC+2KJzEbhgYLslEoBbhVULxYnArsuYyZTMX3mwEC1f78IMxFvBU1AG//bW4O0TUHtc2xVCerhpt5rKhvnpjzg/L51IN1NaXCIaWjBjWl/pbuT4ZtMioj4lL3FP8VINlzfCW551v/YQEFNoTiqdeg6/kRdvDoQSjyuYiR2EbGmi6DJsWPSsmZaYeJ97AKxo55vZWN44VXBEZ7w1N0pQ2ziBtpAJvjyMPgDloK1Fq66wHBIkR7vc6ML9AlgVjJgjKd6Vn0Y3FUufGRfFs1Zj38up/6vkzcMABKxaK1bBh931gj8PxfsuISBqrNDOO66SrgGNiNbVJTJqEi5SKpTKGGCmM2wEvXlbAY720PefXv2EWUmcuIrZUeh+1ZMrByPHKtgqrXYuzqWcOqMQcjzWJCcyOdAXM0z57omWaa1BkraMBVj9ULFucvd9AdhCMQXhFRaLz5hN/rYWim+br3ggrLNhqKD5aed08YVyYhlL5m4g7y/rAKl7FqSXga9iskjfxZS3NDdXR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(366004)(136003)(346002)(2906002)(38100700002)(38350700002)(6916009)(6666004)(6506007)(26005)(36756003)(316002)(41300700001)(6512007)(15650500001)(86362001)(6486002)(478600001)(5660300002)(66556008)(8936002)(66476007)(66946007)(83380400001)(186003)(4744005)(52116002)(4326008)(2616005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z02TNzwD6K2LNsnll+ud0UwOH4Fh4LGH+nQ7ls1Ma140bWQXxxaMdFHV2O8X?=
 =?us-ascii?Q?r62yoTlmKK/vbCwPF+aV/K2exIVE6GAAR3H73n7WHK5v/zyJJatjRnFlQfgD?=
 =?us-ascii?Q?pn5RCRorG+8NGXCEHUJy2KiMBWSq0CFSiM8UqEccZGLqOBX/Z3st5U6zjhll?=
 =?us-ascii?Q?HxqVin2viij1f5M5t/h6KQuECk3nEvScMxXxjuCkKv1WmIDj5ewdBCN/H66x?=
 =?us-ascii?Q?qZvCJHG576Ph/8xBxCH3RFFufC986/56YDqflc4cnaGPMf9bL3Sjv2epNdkq?=
 =?us-ascii?Q?MWSfUct+a3fT8K+RSKIuk7T11ilMGt01+EcVl4fOaOKg3WYI+Acjfa4djCvM?=
 =?us-ascii?Q?51DW/N3IKr6TSVvb5hmHLUB/vGVpj5Yh8d+7A1noRIZp3wBPHQUNnqEl7/w4?=
 =?us-ascii?Q?rA7SkuWDLOqvXr1DPcXz4dffTdWuoIFyh+45vBRUjulFXjYGbiHO97eI+KrU?=
 =?us-ascii?Q?Kke+GHuA9HEfufBIudbSg0mCL9xQt1g2GiP28PV0MGsRwlJQJ0hBjC8hirgW?=
 =?us-ascii?Q?u921jC3qM0YR0B1IdCgEjK89jVCH27C3rmkiXRhQsebpo90IAcZpt/8agZ5g?=
 =?us-ascii?Q?gZ/23aU6fbHvbFBqeRqgF+Mhh2sOn2hangcokWojRhlFSQWJcKrgYh/6E70f?=
 =?us-ascii?Q?2ykCpln1D1A1mqf8o/lIxcCDmV5JBSKbzciIfoeJyfACewtCuQlzb2F6cyge?=
 =?us-ascii?Q?4vvGDUl5UaGMAKEaOJ6knT52LqYkNbYlQXN8+MVqNKzDds7AGyh0snuzvdFJ?=
 =?us-ascii?Q?CsITPprqIcLhTAlRdT1A+dT4lxdKFPLEvMvHD20Ps5iaSQpvVBPaemktU7u9?=
 =?us-ascii?Q?jqTQPOfmc1kCi6GODWl/jdtAwsq+83RgWpOQc7h8STffyavZcAEyv+R4Tums?=
 =?us-ascii?Q?wJXyhNmXxscjMHXTT+gvbxyLG8+oliXuaty9mOeg3VynPLE9DaXVw4FzbL3g?=
 =?us-ascii?Q?I2Qnp054EFp2rzlQDfGq2KSOqcBkoPzW4z6OkSs3nsI/IluaqvEilD1vA7Se?=
 =?us-ascii?Q?2cpzQTxLFhyjPQAzp10w2uibjDYyqhxWJIk4d+3uM4jffCIJHMNK35tEFkZk?=
 =?us-ascii?Q?RFOeOfMJFyzND54+QIuTefdcYEIo0ZgQJ8NRZAwF2UAJFGGZUCrWaSy/I5uc?=
 =?us-ascii?Q?qPU6r+du3imJk8pBNNmTU22jxi2DA0ncj37zislwzuzzb3wx24YypQdfCiFh?=
 =?us-ascii?Q?+EvB1aV9H4yVJLEcLgbCJnStQrQHoUxpVxdOKdXUvelZwcNx3vrdVDSg2C26?=
 =?us-ascii?Q?hHQdsODOJrkhATnOy+U1ChbBJVSElR3rLHAhRxUFHx7eSj56AIqiUnefMTSH?=
 =?us-ascii?Q?KNE2mG5gMnyA3ODbGsOgdLPOF1jFgo3xzzWNWdLE2kKYI/QOioIhREUF07il?=
 =?us-ascii?Q?kRFkFkVfb+Hk/8rA14kbeMy4MWKuxc5TX5/HK7GhP5sGI/FLlKZtpC8SbNDo?=
 =?us-ascii?Q?ZUWk72+AiiPcCdffLtvxFKVpWmRUOKR5HpQIuhIxWWC8BqkH16m0PSP/2ari?=
 =?us-ascii?Q?ghNd8oOmpZFnl7RQy4Al/Px+NPCIdfokDrzB5AB7SPxtUNMDFpjknZQMIfip?=
 =?us-ascii?Q?PeuQ2A0am6/GNpLczvpYrjYRJG5C3E2Rz/sM/p+4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f7615c-c577-4106-2291-08da7425b3d0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 01:24:10.8532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUmiqbIL08xiDNqrXfqHrcsi+iQMORc+5v8TMpkyKyoEDB6iC/Gn+HYjdUWUF7VzHow/a96ieVNjOdPssA+dVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3487
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_12,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208020004
X-Proofpoint-GUID: Yd8YqlQIsA1X0SGkulFuP5k9h5wozS4Y
X-Proofpoint-ORIG-GUID: Yd8YqlQIsA1X0SGkulFuP5k9h5wozS4Y
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Update libvfio-user submodule to the latest

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 subprojects/libvfio-user | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
index 0b28d20557..1305f161b7 160000
--- a/subprojects/libvfio-user
+++ b/subprojects/libvfio-user
@@ -1 +1 @@
-Subproject commit 0b28d205572c80b568a1003db2c8f37ca333e4d7
+Subproject commit 1305f161b7e0dd2c2a420c17efcb0bd49b94dad4
-- 
2.20.1


