Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA39B3CCE09
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:39:10 +0200 (CEST)
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mvl-0000m4-IW
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlH-0004BU-Rr
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlC-0002I0-I5
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:19 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GLnx029074; Mon, 19 Jul 2021 06:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=C9ZLxtfUWYwDgZJWWzfKcWuF4VObv81neoVJim6Ryfk=;
 b=ZXQ6K+LDZg103tJe5tcOwP66/ySyyWxgjm/XxyFCd/jsWqHSkgMZKzkGQ59qZ5AinjAC
 2LmOXKkM18t2bawTiItLdIeo2dCNIRUInrV2nzRbeB/jzanK8dmkiNbT+NdplJMvyroZ
 Ba5kGBUw0FispYi3zVWd3yByvkwDZvQfVweoOWeYrv6bN1gYHNXtGWO4dTa0CuP4Qsxj
 kf2rFbFYZxkS3v5vvsupkVUCzKrjGGY3iWsYHx2lZmhbi6PNps1ZKQeFoOcnvvdMJIZb
 XFnDNyuGFNEc9ahFo3wbWzbtEnujzienho+EHGOr5uJqGLsL+c1wglQERkYEC0MRMf41 zQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=C9ZLxtfUWYwDgZJWWzfKcWuF4VObv81neoVJim6Ryfk=;
 b=fqgLXU+p/6l9Q75I2MMGjgjwJ32Taq7RCIyDkJHV7pCUB7h6l8eCHV/3bs6y6LWVTiNZ
 rdJz5i0aWWCcp8LixhSNtnMeAJqw6kOiIuqFv4/AL7jIP5gld8WDqJ1oBGoinBd0F21k
 avFzg6MBwWuwQeBEAAWHk7XXK7ZXgIsvSSGgVCWspBQwwgKE3RrRVNWMojlTpwRWyURN
 XMr+aQ4CWTNsKoFLkMjAQZKM+/ZJ8NGYQPd0VMn8fb9910E4O3qLWnM4E6RGZbdoIhO8
 U25wCYZdQ1vabRMhDbNmOGuwvC1ifDTfLZlmxZOfd0tE/10P41MkIcZxE1HbTajKThI0 sQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwrnjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9TA086873;
 Mon, 19 Jul 2021 06:28:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3aGPE4fQ9+KkTZlGVXVvPca57NF1T4Idnn/0uasSNmBftVXeate7uhhlt319N6YkVvLHGOM8ZAx7EMVM3tOMn+xL7WZpdXnFjbtVCPMO1PQ5PVfhzgU/Dpksx5C0Ll3qzJKDK+49W5QhheRDQnZafEmNJfbW2p6hwNmKqzTeNOCprtGAcNZjuQEtk6gnRe9kVs9jsSnrMW23sbxtvaMt0zX0w0jIQRVxKoWycfu6ViotxFmz3tRWHMc/e9luyqONmNi7hTHiukMj4du/w7OQoSMkff1D0Rj6+q9Txv6wqdBvnybVnBI+aMLCo+qr++Ahb5zgZSJca4LnE2Fa7UVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9ZLxtfUWYwDgZJWWzfKcWuF4VObv81neoVJim6Ryfk=;
 b=bot0Z8xVSIuKcrrAbXwTSKHZSFakR4f3W+Hr3KCpLzmaObu8ZpXHn5Cm8AsI8qsk0u4AOr1xDZ2t9Q9V4aP6Gy16tUNPNV6YceId694WomZB8H4IfZoixfLDYpqrRPmfRGbw9+84fFpWRa4Hy1kyJAN0RByCaPHgcJcPMnSX8lECcVENlVof16V4wPVXrdJHCmC/PszydfS8/Wy6AE4WiFi9A1bsEIHZvzShXBlW+Ts1iT7TPMdHyxHiOoMUU8BgxjwSCOYjRUa8hQPusUS6NVisTkEoTCKzO6KfJz1a5Ao2uA2e2PbHPGhQu0PneyDkt/lSRcqPzPvF2HBSxri99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9ZLxtfUWYwDgZJWWzfKcWuF4VObv81neoVJim6Ryfk=;
 b=hqgFAcKiKsCbsyaNtf4NxnAZLKudkLnZWs9o2yhSlr30kG3vwCTPBuaML9Cbo1T0B6j3/bUEVgfHQxvq9iFwAR2/T2HOp5tshM8rjHedw6+GAnmiogkPt/rNePMQNSAGQa5eYszautv2PX0C/UXB/xSJUlM5EPhc9w0hhN1/iFM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:09 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:09 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 11/19] vfio-user: get region and DMA map/unmap operations
Date: Sun, 18 Jul 2021 23:27:50 -0700
Message-Id: <7774798805f2a30ef47364976461fa1b1eabaae0.1626675354.git.elena.ufimtseva@oracle.com>
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
 Transport; Mon, 19 Jul 2021 06:28:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97b7a7dd-2c6f-4441-2946-08d94a7e608f
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB48147206356F6BB7D421C3128CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oG9BnZLBIKVUYxdLDEV3K4exTJjb947iB6SrLRDN5yiSw97pWFS066KgQGU/lte0Vbvy6SjWrhXhnsdBn7XXtYb0gFdgy/Xg0C1NFpZICHktSueS4I2b/CoE/pyzeyyVbqGa2aBeufD/rZ2IjVIInQ7qAu7IkHp715D1XU2g0FLBTTdKwi8lxeneJE+HsOmlsNcBFH+0knzUG8Rqf0NMGOSDmk4+Hq6UwdUGTslAgAA18oi9Yrefc/gW4S8p5LlMjzlx0QpTKVH/FfaHfNe3qmPOFxPeDi35Sgho4LZaI+Z7Bw4zZf7uV1imqBR9Zeo+W8ikFdeeWSUMFhaPcpu8ycKqIVxFbgbv/H3JrBOkGXV1y7GV5tVUI9JaFU7OGlBiPgTQj6IHoPNl5jO/0bi6/syZ/2B4EIFzBzHMHmtDirIEkMaw6bJL4aHnzd/E9/bfxoSbjjoc/DYe4qQ8Oct0Tz0FzEEmLlDPCuPStbz9rVRERwdSP8rqDFQco4EHAZDKnXL2cwHc6D1GUlbbh8W2aKwdy3hXqzr7mZ6To+KDw66DXn3OlVH4GhbI0hpNuUFYY14sA1qn79SwV3lWsRw2gvPmZmwpfrnjnjorzyuQKV6ntb0xDTWuaW0kS+L8F5Rg79NGRXxsAArdbU2WTuXjeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(30864003)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LNPEcTWHkNj4xQ3g+dmbooNmsdwnyETwyxv314rXy9E49bMiVgBSogfbL41/?=
 =?us-ascii?Q?jmXayZ8q46QbrEKl/hGGbJwpt+xgL+PHdEYtV1e6Qm9dSeQ63A7NGXXEEDLr?=
 =?us-ascii?Q?UD0GTLJKKFlrD5ssPvShQKHzoyzceJRz+3I9q3w1cRppRp65QTSKQNMJa1cF?=
 =?us-ascii?Q?gPIOCzgTlGcbJU6Kbeamj9DxJTs2Uuy/V7CcYgVgFgYQqFTTMQL/NWq4uUQj?=
 =?us-ascii?Q?oqTbch5lmeM138z2yiSAU8CQvo+7/Z8segduQeo7JqeMrtGfURUOI8ygdkWW?=
 =?us-ascii?Q?bjzNXoHJ5/6fv6/NtWWsEGnX5+vKUd9SUyBK7H//UdxrXIyQ+egnB9wHKd7a?=
 =?us-ascii?Q?TdNvGoNdb6gSStH6hpADO6fLBYzhMG2E15LdWobNTvjvdGOW819hJ/LNCHTn?=
 =?us-ascii?Q?6ATtKw5cjsUIe67jvkmX7jvQahARz3MqyZ4MkFHU0z26A6IuGHG5QOM+I+St?=
 =?us-ascii?Q?i6yLTHB4V8ix9tCkKWNPjQxZAzKjIVANLTMnXBga1jWwebS0PRC1uOEzm9F4?=
 =?us-ascii?Q?h/e6xvVLefdGBXBx7yvuO/wncUN+gC3Y7Oe7FFiohbqXGjjZj6e5bBTCIL8D?=
 =?us-ascii?Q?bQzY/IrHT9tR3CucIaEGMFKgzG7/7W7RggEoJqIMlSKqGK8OkBW9qVUFR38r?=
 =?us-ascii?Q?EQsgaXQeL5XT+Jc2F6tCx6x0BIuUXCefwpWZm04XtZnZijQfQXQmlZJ/Co1b?=
 =?us-ascii?Q?ACqX69MwqKuW+vuhS/lz81GDJN0ia0kHgWOEA/HwpUTFFA8Suf4wHHw2tRYn?=
 =?us-ascii?Q?QxwYJGaOtFBlymAvtysVuAcJI38L7NbmUeadcgiH3NCMqgXWxoZYZb8IQk9b?=
 =?us-ascii?Q?ddBlawnNAeQkH6BHP9dohPZDkEDqjIxs/INdd2qDiSJzsRNqkyfmKipUSv6B?=
 =?us-ascii?Q?3kkSsHhyajF8dyT/+WCHq1d8J6BrCmArYmzsemjHaJNvkPsiasY5AAOeXqrC?=
 =?us-ascii?Q?WVawn4C5h6wVxqE7lDw1lwVmeGaxTx6/2NweyKj5Y1BM/ZY8e6s8keu4CXYH?=
 =?us-ascii?Q?vDBGsh9D1y8s4W8KKBygkNHxqHqO76BZnKClIPpWdHTSfivfwGP2sjHxj/Um?=
 =?us-ascii?Q?CnPedIbLmrmtBADJZxBQY0TagwwTPot50ooBZC8HTCuei1Oda3DzTYkYgBN/?=
 =?us-ascii?Q?wNy3GWwSLZ3A0m8Pv8NiYQxSyKaAr9Lupx1jAWhE6ugyvi+dQuS6Ga87tCDg?=
 =?us-ascii?Q?f0E8dRzt+MNYuvIf3bD29OYgcbS5+TdHE4HRzVc2Di67QWUfvIF0N4EEYYDC?=
 =?us-ascii?Q?n/YAEMA/VrIaHQFOL/LqKUbCHAnLMN/PQ53rLb6pbhKtnosiPV8XxxC2bPZX?=
 =?us-ascii?Q?uZW6S1b1WauDpU0wiPItVWc7Bk/FrSwOe6AalOUHjVB7qn0KWm4MKigUlA3I?=
 =?us-ascii?Q?haKOV37DMxBxF0LnniswhctIHwMp?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b7a7dd-2c6f-4441-2946-08d94a7e608f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:09.7214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsDi2ejFbuKlOBEAeudwnPyH/GVc5weQaMMECVU+hP5PhCZHxr16zLrAf3Z8IJtEtuABzkU834cI+uEnzF2EZkZQXqUc/QnBNndCOkuflmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: bh_ZZimwEgeL0dKrRo4ZkTK8AF2kvFnK
X-Proofpoint-GUID: bh_ZZimwEgeL0dKrRo4ZkTK8AF2kvFnK
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

Send VFIO_USER_DEVICE_GET_REGION_INFO to get device
regions and VFIO_USER_DMA_MAP/UNMAP to tell remote
server the DMA addresses it can access.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/user.h                |  54 ++++++++++++++++++
 include/hw/vfio/vfio-common.h |   2 +
 hw/vfio/common.c              |  84 +++++++++++++++++++++++++---
 hw/vfio/pci.c                 |   4 ++
 hw/vfio/user.c                | 100 ++++++++++++++++++++++++++++++++++
 5 files changed, 236 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 17c4d90ef1..351fdb3ee1 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -121,6 +121,7 @@ typedef struct VFIOProxy {
 } VFIOProxy;
 
 #define VFIO_PROXY_CLIENT       0x1
+#define VFIO_PROXY_SECURE       0x2
 
 /*
  * VFIO_USER_DEVICE_GET_INFO
@@ -159,6 +160,52 @@ struct vfio_user_region_rw {
     char data[];
 };
 
+/*
+ * VFIO_USER_DMA_MAP
+ * imported from struct vfio_iommu_type1_dma_map
+ */
+struct vfio_user_dma_map {
+    vfio_user_hdr_t hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint64_t offset;    /* FD offset */
+    uint64_t iova;
+    uint64_t size;
+};
+
+/*imported from struct vfio_bitmap */
+struct vfio_user_bitmap {
+    uint64_t pgsize;
+    uint64_t size;
+    char data[];
+};
+
+/*
+ * VFIO_USER_DMA_UNMAP
+ * imported from struct vfio_iommu_type1_dma_unmap
+ */
+struct vfio_user_dma_unmap {
+    vfio_user_hdr_t hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint64_t iova;
+    uint64_t size;
+};
+
+/*
+ * VFIO_USER_DEVICE_GET_REGION_INFO
+ * imported from struct_vfio_region_info
+ */
+struct vfio_user_region_info {
+    vfio_user_hdr_t hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t cap_offset;
+    uint64_t size;
+    uint64_t offset;
+};
+
 void vfio_user_recv(void *opaque);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 VFIOProxy *vfio_user_connect_dev(char *sockname, Error **errp);
@@ -170,4 +217,11 @@ int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t offset,
                           uint32_t count, void *data);
 int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
                            uint64_t offset, uint32_t count, void *data);
+int vfio_user_dma_map(VFIOProxy *proxy, struct vfio_iommu_type1_dma_map *map,
+                      VFIOUserFDs *fds);
+int vfio_user_dma_unmap(VFIOProxy *proxy,
+                        struct vfio_iommu_type1_dma_unmap *unmap,
+                        struct vfio_bitmap *bitmap);
+int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
+                              struct vfio_region_info *info, VFIOUserFDs *fds);
 #endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 491a92b4f5..d7b717594b 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -146,6 +146,8 @@ typedef struct VFIODevice {
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
     VFIOProxy *proxy;
+    struct vfio_region_info **regions;
+    int *regfds;
 } VFIODevice;
 
 struct VFIODeviceOps {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 74041cc438..52a092e168 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -477,6 +477,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
+    if (container->proxy != NULL) {
+        return vfio_user_dma_unmap(container->proxy, &unmap, NULL);
+    }
+
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
         /*
          * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
@@ -503,7 +507,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return 0;
 }
 
-static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
+static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
                         ram_addr_t size, void *vaddr, bool readonly)
 {
     struct vfio_iommu_type1_dma_map map = {
@@ -518,6 +522,24 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
 
+    if (container->proxy != NULL) {
+        VFIOUserFDs fds;
+        int fd;
+
+        fd = memory_region_get_fd(mr);
+        if (fd != -1 && !(container->proxy->flags & VFIO_PROXY_SECURE)) {
+            fds.send_fds = 1;
+            fds.recv_fds = 0;
+            fds.fds = &fd;
+            map.vaddr = qemu_ram_block_host_offset(mr->ram_block, vaddr);
+
+            return vfio_user_dma_map(container->proxy, &map, &fds);
+        } else {
+            map.vaddr = 0;
+            return vfio_user_dma_map(container->proxy, &map, NULL);
+        }
+    }
+
     /*
      * Try the mapping, if it fails with EBUSY, unmap the region and try
      * again.  This shouldn't be necessary, but we sometimes see it in
@@ -586,7 +608,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 
 /* Called with rcu_read_lock held.  */
 static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
-                               ram_addr_t *ram_addr, bool *read_only)
+                               ram_addr_t *ram_addr, bool *read_only,
+                               MemoryRegion **mrp)
 {
     MemoryRegion *mr;
     hwaddr xlat;
@@ -667,6 +690,10 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
         *read_only = !writable || mr->readonly;
     }
 
+    if (mrp != NULL) {
+        *mrp = mr;
+    }
+
     return true;
 }
 
@@ -674,6 +701,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
     VFIOContainer *container = giommu->container;
+    MemoryRegion *mr;
     hwaddr iova = iotlb->iova + giommu->iommu_offset;
     void *vaddr;
     int ret;
@@ -692,7 +720,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
         bool read_only;
 
-        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
+        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, &mr)) {
             goto out;
         }
         /*
@@ -702,7 +730,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
          * of vaddr will always be there, even if the memory object is
          * destroyed and its backing memory munmap-ed.
          */
-        ret = vfio_dma_map(container, iova,
+        ret = vfio_dma_map(container, mr, iova,
                            iotlb->addr_mask + 1, vaddr,
                            read_only);
         if (ret) {
@@ -764,7 +792,7 @@ static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
                section->offset_within_address_space;
         vaddr = memory_region_get_ram_ptr(section->mr) + start;
 
-        ret = vfio_dma_map(vrdl->container, iova, next - start,
+        ret = vfio_dma_map(vrdl->container, section->mr, iova, next - start,
                            vaddr, section->readonly);
         if (ret) {
             /* Rollback */
@@ -1064,7 +1092,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
         }
     }
 
-    ret = vfio_dma_map(container, iova, int128_get64(llsize),
+    ret = vfio_dma_map(container, section->mr, iova, int128_get64(llsize),
                        vaddr, section->readonly);
     if (ret) {
         error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
@@ -1330,7 +1358,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     }
 
     rcu_read_lock();
-    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
+    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL, NULL)) {
         int ret;
 
         ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
@@ -2493,6 +2521,24 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info)
 {
     size_t argsz = sizeof(struct vfio_region_info);
+    int fd = -1;
+    int ret;
+
+    /* create region cache */
+    if (vbasedev->regions == NULL) {
+        vbasedev->regions = g_new0(struct vfio_region_info *,
+                                   vbasedev->num_regions);
+        if (vbasedev->proxy != NULL) {
+            vbasedev->regfds = g_new0(int, vbasedev->num_regions);
+        }
+    }
+    /* check cache */
+    if (vbasedev->regions[index] != NULL) {
+        *info = g_malloc0(vbasedev->regions[index]->argsz);
+        memcpy(*info, vbasedev->regions[index],
+               vbasedev->regions[index]->argsz);
+        return 0;
+    }
 
     *info = g_malloc0(argsz);
 
@@ -2500,7 +2546,17 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 retry:
     (*info)->argsz = argsz;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info)) {
+    if (vbasedev->proxy != NULL) {
+        VFIOUserFDs fds = { 0, 1, &fd};
+
+        ret = vfio_user_get_region_info(vbasedev, index, *info, &fds);
+    } else {
+        ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info);
+        if (ret < 0) {
+            ret = -errno;
+        }
+    }
+    if (ret != 0) {
         g_free(*info);
         *info = NULL;
         return -errno;
@@ -2509,10 +2565,22 @@ retry:
     if ((*info)->argsz > argsz) {
         argsz = (*info)->argsz;
         *info = g_realloc(*info, argsz);
+        if (fd != -1) {
+            close(fd);
+            fd = -1;
+        }
 
         goto retry;
     }
 
+    /* fill cache */
+    vbasedev->regions[index] = g_malloc0(argsz);
+    memcpy(vbasedev->regions[index], *info, argsz);
+    *vbasedev->regions[index] = **info;
+    if (vbasedev->regfds != NULL) {
+        vbasedev->regfds[index] = fd;
+    }
+
     return 0;
 }
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1054978e5e..054e673552 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3387,6 +3387,10 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     }
     vbasedev->proxy = proxy;
 
+    if (udev->secure) {
+        proxy->flags |= VFIO_PROXY_SECURE;
+    }
+
     vfio_user_validate_version(vbasedev, &err);
     if (err != NULL) {
         error_propagate(errp, err);
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 2bb6f8650e..eea8b9b402 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -679,3 +679,103 @@ int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
 
     return count;
 }
+
+int vfio_user_dma_map(VFIOProxy *proxy, struct vfio_iommu_type1_dma_map *map,
+                      VFIOUserFDs *fds)
+{
+    struct vfio_user_dma_map msg;
+    int ret;
+
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DMA_MAP, sizeof(msg), 0);
+    msg.argsz = map->argsz;
+    msg.flags = map->flags;
+    msg.offset = map->vaddr;
+    msg.iova = map->iova;
+    msg.size = map->size;
+
+    vfio_user_send_recv(proxy, &msg.hdr, fds, 0);
+    ret = (msg.hdr.flags & VFIO_USER_ERROR) ? -msg.hdr.error_reply : 0;
+    return ret;
+}
+
+int vfio_user_dma_unmap(VFIOProxy *proxy,
+                        struct vfio_iommu_type1_dma_unmap *unmap,
+                        struct vfio_bitmap *bitmap)
+{
+    g_autofree struct {
+        struct vfio_user_dma_unmap msg;
+        struct vfio_user_bitmap bitmap;
+    } *msgp = NULL;
+    int msize, rsize;
+
+    if (bitmap == NULL && (unmap->flags &
+                           VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)) {
+        error_printf("vfio_user_dma_unmap mismatched flags and bitmap\n");
+        return -EINVAL;
+    }
+
+    /*
+     * If a dirty bitmap is returned, allocate extra space for it
+     * otherwise, just send the unmap request
+     */
+    if (bitmap != NULL) {
+        msize = sizeof(*msgp);
+        rsize = msize + bitmap->size;
+        msgp = g_malloc0(rsize);
+        msgp->bitmap.pgsize = bitmap->pgsize;
+        msgp->bitmap.size = bitmap->size;
+    } else {
+        msize = rsize = sizeof(struct vfio_user_dma_unmap);
+        msgp = g_malloc0(rsize);
+    }
+
+    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DMA_UNMAP, msize, 0);
+    msgp->msg.argsz = unmap->argsz;
+    msgp->msg.flags = unmap->flags;
+    msgp->msg.iova = unmap->iova;
+    msgp->msg.size = unmap->size;
+
+    vfio_user_send_recv(proxy, &msgp->msg.hdr, NULL, rsize);
+    if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->msg.hdr.error_reply;
+    }
+
+    if (bitmap != NULL) {
+        memcpy(bitmap->data, &msgp->bitmap.data, bitmap->size);
+    }
+
+    return 0;
+}
+
+int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
+                              struct vfio_region_info *info, VFIOUserFDs *fds)
+{
+    g_autofree struct vfio_user_region_info *msgp = NULL;
+    int size;
+
+    /* data returned can be larger than vfio_region_info */
+    if (info->argsz < sizeof(*info)) {
+        error_printf("vfio_user_get_region_info argsz too small\n");
+        return -EINVAL;
+    }
+    if (fds != NULL && fds->send_fds != 0) {
+        error_printf("vfio_user_get_region_info can't send FDs\n");
+        return -EINVAL;
+    }
+
+    size = info->argsz + sizeof(vfio_user_hdr_t);
+    msgp = g_malloc0(size);
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_GET_REGION_INFO,
+                          sizeof(*msgp), 0);
+    msgp->argsz = info->argsz;
+    msgp->index = info->index;
+
+    vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, fds, size);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->hdr.error_reply;
+    }
+
+    memcpy(info, &msgp->argsz, info->argsz);
+    return 0;
+}
-- 
2.25.1


