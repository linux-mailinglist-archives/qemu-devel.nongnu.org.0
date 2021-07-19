Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C0A3CCE02
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:35:51 +0200 (CEST)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5MsX-0003Or-Od
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlF-00044h-N5
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:17 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:30916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlB-0002HD-3d
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:17 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6Gf3b029140; Mon, 19 Jul 2021 06:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=C1cl8+/Z64RxlRrnft/e5lkanWrnkZHPQtG7ZHNBckQ=;
 b=KAAojAByOBTPmRQBpWvLWgKzIbs86sPXffxYBKjndr2tqdg199HDN0UI3DqiP0ahKHAY
 9FtnecHM5gwsOfWQtxy1WztA8iKviI1gKDgIvEEJO+K0ozmeU2X26B/Kcz/fnyHxx5W1
 eHlZqJlvg0AtzaUQ8m54kr+gMVpcH8YFrQMF+jo9a/1juw83ad96/na0dsrvQFIo1BH/
 0dShaL2KMXDZtigegleOJcor07RlbOCrgQAmN6DF32dQM1r+PzaeYTxNLoLqT80iliuR
 yIZiKdvQ+D+n90EmlGtv/SVmDT1iIVyspJ8bu4HSuubgrEeTObFyKyKek2sm3fNVQqhJ Kg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=C1cl8+/Z64RxlRrnft/e5lkanWrnkZHPQtG7ZHNBckQ=;
 b=bsxa4XK9adkO7zCGNDbe7AHOQjw9cIHbfC+8XfF7D+EzhAtW6JZpYvIiNv5bSFOhVFjo
 ZMXKtQO0dWJrtdZGdvi2cmutXZnDq9qU6IzZ75lZamIa86g+vDadS2C9lypD4OnpezUU
 qFT514qjeStdyyt0hX10l3I21k9Lfvx+i6Girt2E9swlKRNBuff1sv3/UjjMUrdouNz2
 XYrpEwIgPctWUgR35qHRJwyGlQLjRcylfsGL60XLPHhBEwC42qXdMJUJ8qMIc88c5MGO
 xldAzOia+NyrWH369ZIYSmPKBACXZfM0uaflytrtnYSP85JyUnjBMd3M3vSUGzbYMTdL dA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwrnjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9T8086873;
 Mon, 19 Jul 2021 06:28:11 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg5f9EykGaxyLvzmfmE2mWypqLdVdwVs0mdGtPG9UkfRx6tEgVlUELHFmI9ZZ6R9kRfBAheMe6mfcQ8qOK3cqUo+l7EVu4bgM4Dzfk+Njl9fQhj8dco7oxcPY8gcBxG9Gf4It1txVX9WdH+SS98bKQiLWnq+KIDcQvN5xZh2mwbeFX7F68MIeF4AbWk6kJOOMDlnq78Twe3JbCRUQv/rmriAT5xpfU+OiifneTNS4vSGcU+nvbdNOvQKbZ5eyxIwj78cUYTlYGwD21Fh3B96mHQxyODMLJot6db0wujI3f2o+SflOD7v4cHsEDtpuEuNVLtm+2NV53m6ObQghpZc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1cl8+/Z64RxlRrnft/e5lkanWrnkZHPQtG7ZHNBckQ=;
 b=ivrjcOO6F+1RCFWwQ4UygtIXBUcxiop59kIYMx3qRoobolC86lQE9E3tt6mBZsIXspXtP8Q0QTzMHRGl5jPp3TqKmxvx4WzStRbKGneaC6gVDJuJhATcZA5lErywKyIP3mD0qx81z14+t//ixFWB+sLLAhLYv6b4ej/htBzUnxRM/H6QEcWfi/ZDUbINxERYLSOXqMKkAxsv9iW+Ccyj3dG8uKm6pLRZ58GJH0C4pAkV9vKFevYL0txBxtgZZnFofGKUNbVjuHdz8ZBQx3Ul4e9fMASAOeK/mtq9ZbeLG5wH0mQuu7Xzr+wzdPIvtGV6mBfOGsQZzDvy5AjT3TWXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1cl8+/Z64RxlRrnft/e5lkanWrnkZHPQtG7ZHNBckQ=;
 b=y1AwQ1JChlRuiMZM6EaN5hLZWcz9dgz125GpZz+04FUACWZS4nULeqp5nQ9NQg0AeMklyzkclWx9lM/Pq9xLYQDXSVtR9jfZikfPJRXlXc+Tn8b1S7i2z7y7By14PVzkNQGPze+nC5/rlhzHuIz40HbxSYrvmOrjtI6/CaTQs8A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:08 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:08 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 09/19] vfio-user: get device info and get irq info
Date: Sun, 18 Jul 2021 23:27:48 -0700
Message-Id: <ef734d2a2b58cb07e0fdffdba6e28b1e52594998.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7def8d77-fd8c-44ef-ba46-08d94a7e5ff7
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB48141AABAD4119ED87515A1A8CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ryx7rZREAlxpvQN40puchhb35caYxOjqGuxDr6eGO4pdP9GezCM84TfbwOXSgJuGKHBzCnPuCiYquhUM7/0BqBWI7+k9K+iBguDa3l0uyl26ary9ZZWkGEpQA8wcW0N9EoL51i9tZQGWoy0UwRZDHyqtt52C2wiThVQ1TBeF8vGvVI1/K6j1mbxOh8fcgYPNApr4ciF31oa2MEp3OZLw5Cy1EPl8Svz+Z2DFawfsJ8u453fRCUqdu1u/8nDaW1BjQdDjeo3KTyNIv4n+9JDx7uKb2N3C17Goqn46VgGSOjlK1sLxI7tDESHbu0jsAyDTxwFOKI6nO1w6tVkV0DkqI5/w1ssno6w8ftPo+ZncEw0YNrNbEeCEXrLFeUrdVQRw1z3Kmle/oUywgMPXd24QVIez08K211Gzq6GRHjKe6kDuEohHMtMlY/+cc0yzqX7wfGGoSgmi9Uqr+nEo5mz6X/pdj6xt8PULQ6RKWn8QDJHf2dz+C32LFGMV9GCjChNd8eQrfNTWO6KjoSAcTgDzMGdyLqHLN3kb8Il8tPO06QB1SyNHs7lXLMBAyirrp4mauUszTHr82F3AwzjE2xv8HjMjnvVhJm8RVnXvrH8ufSWajIKvqJGV+FE0kNaYYfYGtxuO0p3frhmvDTmuB5b27Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?trpmdXfbNReZ/kxo3EI6iJLAmifzAA/qaAPS5eV5BwLROzLXqIt4GBP43fAo?=
 =?us-ascii?Q?ErlOvYBgR99JG7dncHfmXHFRszK1EsjiFZDIiXsjcGSATGColJEodLLmDyiP?=
 =?us-ascii?Q?U6z0wSnPC5m8J/yKb0pkq2xVTXjzmG+QOqhaG1uAnmRicuIaNK9Pe6szj78M?=
 =?us-ascii?Q?WhlOfrvuJoBeh9ZHkw7OX8iRm4t03yqAaNrzGtF8PVPGSDudznqn35d1pp9n?=
 =?us-ascii?Q?qA0xL87ArmFjBlnH8qyXPnd9X+TOuNT5EOVF0svsKTrZ0NPoXW10kzHZF+qD?=
 =?us-ascii?Q?HGiP9/1JUmajmVIBiw60WCV8hw7yMVjL4lKQ08yfu161gFVM55L9jnNMw70c?=
 =?us-ascii?Q?SLQ7wyoxvC9iu8z9H4Kg+IORZE4keyfMQQ2wy6TR+pAbXoNe0Q5xsK8Xo355?=
 =?us-ascii?Q?JTlfPPZOlW7U5EuZCsO+cFDDjDPZ2UuQeCFhAd1qLkvcFPgdOxtvEsQ3nG79?=
 =?us-ascii?Q?8gwQAQCKoGDc5odsyxwVWgp6YxZBAU1QHDE6X91JU7PTIJImP3a/HdsbV0YG?=
 =?us-ascii?Q?4gJS0SVAntmf3wZupv95Oybjep3++GTIll4LwRolfhnKjGBvYV/P6XyURuh2?=
 =?us-ascii?Q?x9NljJ5D+UTylgJB7lwVVbKJPNe/njsOkirHcoZ6qvqWzgg8W4G2jAQ39Eyh?=
 =?us-ascii?Q?UMUHmOrCNMZkIP+xBb/8kBMuT0Fp3jjEBmdxhV2J1K7iRXN92s+YFGjdNSlw?=
 =?us-ascii?Q?DG3+2nbMEhve9b8qnCcPna4Nfhvdx7HZZX5/wAqzS3W5wAWJwYkk/kl6jz83?=
 =?us-ascii?Q?0W/hG+voY8qGGDo9uBeOOJ+/SkWLgFwL2dOeiwGnv2uQC/SxUi2MLtMYxfMa?=
 =?us-ascii?Q?s8pqWd3buEp4uMaefpz13NKSckhGGVN7COlJlYdfT2WYRgSbYEKSxY2EWFn3?=
 =?us-ascii?Q?AsqU3LkSQweYn/SiEvugfx0nxhTX1IJsfKFVp0/ziKLD/Q2u8U80xPxIvh6+?=
 =?us-ascii?Q?QgtVtNmTylrTepd/Qp/Xh4Y2S/+nlKS3DJGWE8cNkOLh1yqrnLJLm2++2MIC?=
 =?us-ascii?Q?9g+CjOsqtR2qoIR8oYdy+lPN33leRhxfUOgznOLqWSnbo/6+HGX66Peogh6x?=
 =?us-ascii?Q?5r9eX1uxx6SMHOqpUjSw6dBdmoz8EL89FPEExa13Qjvpp6PbMQxipqZi3TRW?=
 =?us-ascii?Q?86ZL99yLrCePmQ9mEnwrXjAgEUALSnPmYPXnHsBgFNzlDJNqbcCbPtp8Y5zr?=
 =?us-ascii?Q?7uFnYVN6QXJgL+wsNZ/aiyc5aSdvCn1me/Wa/QhOB3oJtcjNZhGltJ50kImk?=
 =?us-ascii?Q?yYXAGoXtp1R45mFlEJ1honLAgobh2bChgVg8D956Z7bTvKrg+N+MMaTPxJuR?=
 =?us-ascii?Q?lCIzr1dLvZUT3RiddK66CTWinciB4sYGKsGf8/Zdguehg97R0R1ChpCQm38n?=
 =?us-ascii?Q?SitlFdwb69gQ/nXwSaOXzgqWjJP8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7def8d77-fd8c-44ef-ba46-08d94a7e5ff7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:08.7010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmg2wRBbzC98e9t8Fv5WZM5gajb09AekjCp5vJEH3IytF16HUXmOoc7OXm5CuOWn1I5Hk66+5g+RQ0bWLJTptwUxuBskRr1BCsvrKRNN3pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: s9Ej_hLG7WcGqDoWiAs6f6b58iRrzyWm
X-Proofpoint-GUID: s9Ej_hLG7WcGqDoWiAs6f6b58iRrzyWm
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Send VFIO_USER_DEVICE_GET_INFO and
VFIO_USER_DEVICE_GET_IRQ_INFO commands.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h | 27 +++++++++++++++++++++++++++
 hw/vfio/pci.c  | 32 +++++++++++++++++++++++++++++---
 hw/vfio/user.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 844496ef82..9f51e14c7c 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -122,9 +122,36 @@ typedef struct VFIOProxy {
 
 #define VFIO_PROXY_CLIENT       0x1
 
+/*
+ * VFIO_USER_DEVICE_GET_INFO
+ * imported from struct_device_info
+ */
+struct vfio_user_device_info {
+    vfio_user_hdr_t hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t num_regions;
+    uint32_t num_irqs;
+    uint32_t cap_offset;
+};
+
+/*
+ * VFIO_USER_DEVICE_GET_IRQ_INFO
+ * imported from struct vfio_irq_info
+ */
+struct vfio_user_irq_info {
+    vfio_user_hdr_t hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t count;
+};
+
 void vfio_user_recv(void *opaque);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 VFIOProxy *vfio_user_connect_dev(char *sockname, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
+int vfio_user_get_info(VFIODevice *vbasedev);
+int vfio_user_get_irq_info(VFIODevice *vbasedev, struct vfio_irq_info *info);
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5ed42ad858..029a191bcb 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2620,7 +2620,12 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
+    if (vbasedev->proxy != NULL) {
+        ret = vfio_user_get_irq_info(vbasedev, &irq_info);
+    } else {
+        ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
+    }
+
     if (ret) {
         /* This can fail for an old kernel or legacy PCI dev */
         trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
@@ -2739,8 +2744,16 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (ioctl(vdev->vbasedev.fd,
-              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.count < 1) {
+    if (vdev->vbasedev.proxy != NULL) {
+        if (vfio_user_get_irq_info(&vdev->vbasedev, &irq_info) < 0) {
+            return;
+        }
+    } else {
+        if (ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0) {
+            return;
+        }
+    }
+    if (irq_info.count < 1) {
         return;
     }
 
@@ -3359,6 +3372,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     VFIOProxy *proxy;
     VFIOGroup *group = NULL;
+    int ret;
     Error *err = NULL;
 
     if (!udev->sock_name) {
@@ -3399,6 +3413,18 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
 
     vfio_connect_proxy(proxy, group, pci_device_iommu_address_space(pdev));
 
+    ret = vfio_user_get_info(&vdev->vbasedev);
+    if (ret) {
+        error_setg_errno(errp, -ret, "get info failure");
+        goto error;
+    }
+
+    vfio_populate_device(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
     return;
 
  error:
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 24dd45b55d..a282b7b7b8 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -508,6 +508,27 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
     return 0;
 }
 
+int vfio_user_get_info(VFIODevice *vbasedev)
+{
+    struct vfio_user_device_info msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_INFO, sizeof(msg), 0);
+    msg.argsz = sizeof(struct vfio_device_info);
+
+    vfio_user_send_recv(vbasedev->proxy, &msg.hdr, NULL, 0);
+    if (msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msg.hdr.error_reply;
+    }
+
+    vbasedev->num_irqs = msg.num_irqs;
+    vbasedev->num_regions = msg.num_regions;
+    vbasedev->flags = msg.flags;
+    vbasedev->reset_works = !!(msg.flags & VFIO_DEVICE_FLAGS_RESET);
+    return 0;
+
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -594,3 +615,22 @@ void vfio_user_disconnect(VFIOProxy *proxy)
 
     g_free(proxy);
 }
+
+int vfio_user_get_irq_info(VFIODevice *vbasedev, struct vfio_irq_info *info)
+{
+    struct vfio_user_irq_info msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_IRQ_INFO,
+                          sizeof(msg), 0);
+    msg.argsz = info->argsz;
+    msg.index = info->index;
+
+    vfio_user_send_recv(vbasedev->proxy, &msg.hdr, NULL, 0);
+    if (msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msg.hdr.error_reply;
+    }
+
+    memcpy(info, &msg.argsz, sizeof(*info));
+    return 0;
+}
-- 
2.25.1


