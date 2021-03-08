Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F1B330B4B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:34:57 +0100 (CET)
Received: from localhost ([::1]:60312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDE0-0005k6-Co
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJD9j-0001uA-AM; Mon, 08 Mar 2021 05:30:31 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:44792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJD9c-0006Gj-8X; Mon, 08 Mar 2021 05:30:31 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 128APBgF183720;
 Mon, 8 Mar 2021 10:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=LnAEENlf81My2GV3qzF9fdFSW+RL6FoYL0sTsRT517w=;
 b=FMjvmIFDAmYVTH4/7rcTVdrbUo3Ybl7/7gYLknT9ayN1S9O9A/KJNZSHyq6tKMalbA2r
 whqwbe4rvkdatibkuDtw/EZPx2KKxeeslfTVirKF/xRG1XgqLLALs7ArdZp1/C7Ww329
 K42ZvWbawM7ZZEK1Xc7F8A6d0VpoHooG57j7EHuqfYwYPk23zWHqE2LAIlh/kmFMRPgf
 YsGYNhsNIs3JRP/cLnLix6TEsMg4qruIICUncWLUbvMlIYj8YjZGK2hmpwmUCNShTwFL
 Nd1roYImMWEypMSj8sLyti/8jQ/vHDvLSjUYrw1eS/XS+fSSHqzmJ75LcLrLNJtkDV9R yQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 3742cn33q7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Mar 2021 10:30:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 128APKLS029357;
 Mon, 8 Mar 2021 10:30:19 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by aserp3030.oracle.com with ESMTP id 374kam3242-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Mar 2021 10:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9Waky9AVZ+DU8WweCNqqB3VW+VH3J+xZKGx9BZk5VP7/KdC9DZCDfyOogkmH7Yaup8LmCcm34of/sPEqxzvP67CvPQag4tKt6jIY+ZZDsekcALnfpQi7e01wUiFUQYsCurUK75d41160jB7i1YJxQLsSGw+wye5qRw0mivWOOtSv/CQP2iXNBupc2nzIyZCLwOo9dhs64Yu7D7LP8mMc/3Dp6YmjEWzoyETAgXlRYYeDAawGuRE7H7OTpQy7eNLJGyqQMbHN8UI8JyW+kbZPBYHjOg6O1y8XusBJI9JzpnJewZI+WvZEueoo31rwMaNMsnARdJSwQPIAdY2xBRYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnAEENlf81My2GV3qzF9fdFSW+RL6FoYL0sTsRT517w=;
 b=Ej9aoVLG3vEkS2LXK/ZlO+SmFyWykMmTBcwdY0cujiaLAsCNQ5WvQr+DavtRLrYilaStUqi87Z+e6oXIzfZ03Pu8Mvxv9mb8VhWlyJcoODO4LaP2zM8dX16g6mG8pddHK81AV7MmeNQuUItzQ5Bki6GXkM6JIhdbhUOE3ls0dMP/dGh8zOJ6KWo0Mg0puldvz7zH8CfwiesIL1sG/60sp0b7JEtpTI7nHKaqRLJ3ErYZUe73G9/b0Xt4e/7/EKQNaWzSiz/WxCqPx7lWCWhK3Js1IpKcsTpqH8QYyAFHx9ItMvnRi61I9OzSmP0mw3Atyjtlrdev+k1F8b1sHJGTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnAEENlf81My2GV3qzF9fdFSW+RL6FoYL0sTsRT517w=;
 b=O/Kcs7xmOlGkXHu40gEmLPgj/miICu+0YBq6gybmV9+IvdcQMTXtjOCnNDGPXhJaXphssCZ8Rtj2q88BSilsuCnCfnsANazQGe5nKoUQBq8nJvNX8zplGKuEWNAJSNW4oAJ/bKWNBUddXiz+8tyK7lzmj4zNKHKIXusZPuhX+74=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3705.namprd10.prod.outlook.com (2603:10b6:5:155::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.26; Mon, 8 Mar
 2021 10:30:16 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Mon, 8 Mar 2021
 10:30:16 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] hw/pflash_cfi*: Replace DPRINTF with trace events
Date: Mon,  8 Mar 2021 10:30:08 +0000
Message-Id: <20210308103009.3295532-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210308103009.3295532-1-david.edmondson@oracle.com>
References: <20210308103009.3295532-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::34) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Mon, 8 Mar 2021 10:30:14 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 32e442ea;
 Mon, 8 Mar 2021 10:30:09 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0426839-eec7-480e-3630-08d8e21d29ee
X-MS-TrafficTypeDiagnostic: DM6PR10MB3705:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB370511E0BE6D1313D9A073FE88939@DM6PR10MB3705.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wa9qA5+7I4bfoWLeZdkqznXGvBd6Mrc5L4i81qJQAE3TBZRpGHhhr+dioZxyMft4GdY+IiE2fqTVBifv0fz82OwwW55nxT/GotCKQi612Zcmru31HPQFpQYZ+kabgCXpijjWt7y72eBo8TlOgBJT3olw2r9VGzE7zTDavhyPa8dM07x+Fo8/8VloVokrd3sIIzE6i03sgY1fqMXrWH6nXSaesRWvJfnKDweIh6YmO6ZtfuxkY3JYn2UP021ma0ntGBgIZGkvZM7gV282RL1T3fhVKDH/amON6LPmbTKpfd5nyKbEa2BB3+m74QvcjTDtpa7WwyRpO6j+GWVMRdz7+cB6DbnTpZTT3SsTbvVsxmtX6l2bh5bhhyYypr2pNSVKfrW426Ms0nVz58bQRBtVviiIIDjfRSgzBjnWhsraxkiuHHBzAoy3qUwqTl5XrKlDq8zijOhzWigPqoC80kzmmQ1w56OTx8Xu7AM2FU2ytD6f+a9t12bPjg02av9UCKfnmWW+I70O1lelNbpdHgt+zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(136003)(376002)(39860400002)(2616005)(1076003)(66556008)(4326008)(30864003)(8676002)(66476007)(478600001)(66946007)(316002)(36756003)(44832011)(86362001)(5660300002)(186003)(107886003)(2906002)(6916009)(54906003)(52116002)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VU4yUmpyRzRib1BNenI4QWFPWllMc2Z0bXd2Y0ZUNFF5Njc0NHBtNzdHbUtU?=
 =?utf-8?B?WU5QVW1CR2pEUmU1UGlaK0Z4R29Kc3dDVG9Gemlic0ZuaEJoamx3bTZlTWlj?=
 =?utf-8?B?dHQ5V1pvbFRJTGJlSFJYbHZ3T0N5c0Z5elhTZG54VDNXNXN4eVMxWkViQmFB?=
 =?utf-8?B?aTlLcHhDbVN2ZCtzcWczZ0h4YTlpaUVBYVRsTjBvRWhQcU1Yejl5bVpDaWRp?=
 =?utf-8?B?enhJY2lyWHRwZ0NiSUQ3ZkhYc2FyZjU1dk9QQjU3OVh3aVpIb2VBMC9RZUdV?=
 =?utf-8?B?TTBNaFduQ0NWUmlEM0F5M3BCL1BJOVlYajNDcWxTcndtaG83UTVtaHFRMVdS?=
 =?utf-8?B?SkVZb0w3UG9HckZucmYxeWJWcW1MN3dQUlQwNDJZcnJJbXdZMHBaSnZUTTF3?=
 =?utf-8?B?c1FyQ3NERFVzNUE3SWpjTnFNbVVqWDhsUkZpK053RXdLNWl5aXJFVS9lM1JP?=
 =?utf-8?B?eG5LS0dra2ZHeU5mZFZPRDVtTFhEdk1USDNsbzl1T1NXQ2NTbmdPQlQwTVp1?=
 =?utf-8?B?RENXVVdpZHo0NVJLOTJ1V2pwWkU1ZlVQQjZpK2x5V1oxMGxiNmgvS05UL21p?=
 =?utf-8?B?ejQ4OTBkam0rSU5yUHhiODlkNnZSaWVoMGd3aHhQMEwvNzIweXUwZnhaR0tX?=
 =?utf-8?B?Mkx4MUc4bzdybXd5YU9uUjBkZVRoODBFQmlZcWtSMitGZjErL3doRk5NUTZJ?=
 =?utf-8?B?UDYxdk5UcWNFY2pxNzBSYkx1cEllRlBnUUZjaHV5REZabmt2QlNXckxXc09O?=
 =?utf-8?B?Y1VVUVNHOGFvUUlCcE5WY0hneWcxRHNmY1o0NWV3VDZXeVhva3dPWTN4Wjkw?=
 =?utf-8?B?V1Bsbnc3bDQxbEdGZmRuZDhvYmh6UGpsTDVHR1JIRm41cFgxZmh4b2pmc3ho?=
 =?utf-8?B?YjBobXBGR0dLalBLUUFxdGgxZEN6R0duY241VXA0TlVMSkNaa3llelhtMGlq?=
 =?utf-8?B?NTJLQ2Y3WGdIRC85Q3RsOTBZTkxTODJsRjJHazhzSjlPKyszTStUc00vRXJT?=
 =?utf-8?B?eUVVd2NpRFhFRWJyb1IyZ28wRk1xM0pkcVBGQ0RmbFpMUXk5QkVQc2hyYmF2?=
 =?utf-8?B?aXMzMjZleU9Qa25tZmxrWjMyWWVtbXZ4R29BajdoejJQbG5zeG11a0duN1Rs?=
 =?utf-8?B?OFoxWGFZcy8vWXR2S1BMNi9QVlpIUUZITHQ1WFdkRnoxMEZvVDEyNkFjaEJB?=
 =?utf-8?B?NUpJWGZLZDVnT0U5R3RDZ3ZxVys3N1hRWkJ4bjI0c2NOVFhOVDVTK1JHRXNF?=
 =?utf-8?B?dDhtU05udi9tRkFHelM2d0swVUNpenJpQ09sQ2IxQzg4YkFFbGdCQUt4RVJN?=
 =?utf-8?B?L0ovVC9jakU4YkVRcWdyclZ0UEZIVmtCSFdtTDYwbDkyTU54OW41cWRRQ1Qy?=
 =?utf-8?B?Nm0wbFB5VmdoUS9jb3dHeWRYckE0b3pDL1Nxd1lSTDFxTnZHV08wMlNvRHkv?=
 =?utf-8?B?N2tDems5MFlwNjZCaTlLRysvNmpMY0NjNXRQdW93N1NjN3plWGloTVBrSUc2?=
 =?utf-8?B?OWtsa0FBYXZvWmdFUTIvVVlsTEJuMitLdGF5R0gvN1BveTA2dGhsOFgzREV1?=
 =?utf-8?B?aHVuSjFISzlyK0NYditmNnBJTjRTT1BJMjRBQXpidXRJTW5RSEFncnFRWDhu?=
 =?utf-8?B?Y3RiQkxkL2dxckF4c1hsUlNFWWpURVJVYmdob09lU2d1OElLT0lISU1BUE5j?=
 =?utf-8?B?RFdOK3A1UzRTQXJZU3JKeUR6TWQ4ZEtUWm82NFFreUxaclBJdVRqQUFJOUtR?=
 =?utf-8?B?WXJMM2tkV05NODRhM3dycTN4cmJSNW9vSmtRZVpmRkM3Q09CT3pPL1pqWWdQ?=
 =?utf-8?B?V0lOVGp5S3NLQWJ2REVDUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0426839-eec7-480e-3630-08d8e21d29ee
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 10:30:16.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlGRJdp1yEGQ4fBSVZoMmO0h08cnfBMwZSf6Qj4Fszk0w6ryhH4RLJdW/Zj1oZFQHkl1TtuCWqVpXIbML3LkOkr8jtXJU8HiUU9lagTchsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3705
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9916
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080054
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9916
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103080054
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=david.edmondson@oracle.com; helo=userp2120.oracle.com
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

Rather than having a device specific debug implementation in
pflash_cfi01.c and pflash_cfi02.c, use the standard tracing facility.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/pflash_cfi01.c | 78 +++++++++++++++++------------------------
 hw/block/pflash_cfi02.c | 75 +++++++++++++++------------------------
 hw/block/trace-events   | 39 ++++++++++++++++-----
 3 files changed, 91 insertions(+), 101 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 22287a1522..9e1f3b42c6 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -56,16 +56,6 @@
 #include "sysemu/runstate.h"
 #include "trace.h"
 
-/* #define PFLASH_DEBUG */
-#ifdef PFLASH_DEBUG
-#define DPRINTF(fmt, ...)                                   \
-do {                                                        \
-    fprintf(stderr, "PFLASH: " fmt , ## __VA_ARGS__);       \
-} while (0)
-#else
-#define DPRINTF(fmt, ...) do { } while (0)
-#endif
-
 #define PFLASH_BE          0
 #define PFLASH_SECURE      1
 
@@ -152,10 +142,8 @@ static uint32_t pflash_cfi_query(PFlashCFI01 *pfl, hwaddr offset)
          * wider part.
          */
         if (pfl->device_width != 1 || pfl->bank_width > 4) {
-            DPRINTF("%s: Unsupported device configuration: "
-                    "device_width=%d, max_device_width=%d\n",
-                    __func__, pfl->device_width,
-                    pfl->max_device_width);
+            trace_pflash_unsupported_device_configuration(
+                pfl->name, pfl->device_width, pfl->max_device_width);
             return 0;
         }
         /* CFI query data is repeated, rather than zero padded for
@@ -205,14 +193,14 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl, hwaddr offset)
     switch (boff & 0xFF) {
     case 0:
         resp = pfl->ident0;
-        trace_pflash_manufacturer_id(resp);
+        trace_pflash_manufacturer_id(pfl->name, resp);
         break;
     case 1:
         resp = pfl->ident1;
-        trace_pflash_device_id(resp);
+        trace_pflash_device_id(pfl->name, resp);
         break;
     default:
-        trace_pflash_device_info(offset);
+        trace_pflash_device_info(pfl->name, offset);
         return 0;
     }
     /* Replicate responses for each device in bank. */
@@ -260,10 +248,9 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hwaddr offset,
         }
         break;
     default:
-        DPRINTF("BUG in %s\n", __func__);
         abort();
     }
-    trace_pflash_data_read(offset, width, ret);
+    trace_pflash_data_read(pfl->name, offset, width, ret);
     return ret;
 }
 
@@ -277,7 +264,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read */
-        DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
+        trace_pflash_read_unknown_state(pfl->name, pfl->cmd);
         pfl->wcycle = 0;
         /*
          * The command 0x00 is not assigned by the CFI open standard,
@@ -313,7 +300,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
              */
             ret |= pfl->status << 16;
         }
-        DPRINTF("%s: status %x\n", __func__, ret);
+        trace_pflash_read_status(pfl->name, ret);
         break;
     case 0x90:
         if (!pfl->device_width) {
@@ -328,14 +315,14 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
             switch (boff) {
             case 0:
                 ret = pfl->ident0 << 8 | pfl->ident1;
-                trace_pflash_manufacturer_id(ret);
+                trace_pflash_manufacturer_id(pfl->name, ret);
                 break;
             case 1:
                 ret = pfl->ident2 << 8 | pfl->ident3;
-                trace_pflash_device_id(ret);
+                trace_pflash_device_id(pfl->name, ret);
                 break;
             default:
-                trace_pflash_device_info(boff);
+                trace_pflash_device_info(pfl->name, boff);
                 ret = 0;
                 break;
             }
@@ -380,7 +367,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
 
         break;
     }
-    trace_pflash_io_read(offset, width, ret, pfl->cmd, pfl->wcycle);
+    trace_pflash_io_read(pfl->name, offset, width, ret, pfl->cmd, pfl->wcycle);
 
     return ret;
 }
@@ -410,7 +397,7 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
 {
     uint8_t *p = pfl->storage;
 
-    trace_pflash_data_write(offset, width, value, pfl->counter);
+    trace_pflash_data_write(pfl->name, offset, width, value, pfl->counter);
     switch (width) {
     case 1:
         p[offset] = value;
@@ -449,7 +436,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 
     cmd = value;
 
-    trace_pflash_io_write(offset, width, value, pfl->wcycle);
+    trace_pflash_io_write(pfl->name, offset, width, value, pfl->wcycle);
     if (!pfl->wcycle) {
         /* Set the device in I/O access mode */
         memory_region_rom_device_set_romd(&pfl->mem, false);
@@ -463,14 +450,13 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             goto mode_read_array;
         case 0x10: /* Single Byte Program */
         case 0x40: /* Single Byte Program */
-            DPRINTF("%s: Single Byte Program\n", __func__);
+            trace_pflash_write(pfl->name, "single byte program (0)");
             break;
         case 0x20: /* Block erase */
             p = pfl->storage;
             offset &= ~(pfl->sector_len - 1);
 
-            DPRINTF("%s: block erase at " TARGET_FMT_plx " bytes %x\n",
-                    __func__, offset, (unsigned)pfl->sector_len);
+            trace_pflash_write_block_erase(pfl->name, offset, pfl->sector_len);
 
             if (!pfl->ro) {
                 memset(p + offset, 0xff, pfl->sector_len);
@@ -481,25 +467,25 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             pfl->status |= 0x80; /* Ready! */
             break;
         case 0x50: /* Clear status bits */
-            DPRINTF("%s: Clear status bits\n", __func__);
+            trace_pflash_write(pfl->name, "clear status bits");
             pfl->status = 0x0;
             goto mode_read_array;
         case 0x60: /* Block (un)lock */
-            DPRINTF("%s: Block unlock\n", __func__);
+            trace_pflash_write(pfl->name, "block unlock");
             break;
         case 0x70: /* Status Register */
-            DPRINTF("%s: Read status register\n", __func__);
+            trace_pflash_write(pfl->name, "read status register");
             pfl->cmd = cmd;
             return;
         case 0x90: /* Read Device ID */
-            DPRINTF("%s: Read Device information\n", __func__);
+            trace_pflash_write(pfl->name, "read device information");
             pfl->cmd = cmd;
             return;
         case 0x98: /* CFI query */
-            DPRINTF("%s: CFI query\n", __func__);
+            trace_pflash_write(pfl->name, "CFI query");
             break;
         case 0xe8: /* Write to buffer */
-            DPRINTF("%s: Write to buffer\n", __func__);
+            trace_pflash_write(pfl->name, "write to buffer");
             /* FIXME should save @offset, @width for case 1+ */
             qemu_log_mask(LOG_UNIMP,
                           "%s: Write to buffer emulation is flawed\n",
@@ -507,10 +493,10 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             pfl->status |= 0x80; /* Ready! */
             break;
         case 0xf0: /* Probe for AMD flash */
-            DPRINTF("%s: Probe for AMD flash\n", __func__);
+            trace_pflash_write(pfl->name, "probe for AMD flash");
             goto mode_read_array;
         case 0xff: /* Read Array */
-            DPRINTF("%s: Read array mode\n", __func__);
+            trace_pflash_write(pfl->name, "read array mode");
             goto mode_read_array;
         default:
             goto error_flash;
@@ -522,7 +508,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
         switch (pfl->cmd) {
         case 0x10: /* Single Byte Program */
         case 0x40: /* Single Byte Program */
-            DPRINTF("%s: Single Byte Program\n", __func__);
+            trace_pflash_write(pfl->name, "single byte program (1)");
             if (!pfl->ro) {
                 pflash_data_write(pfl, offset, value, width, be);
                 pflash_update(pfl, offset, width);
@@ -553,7 +539,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             } else {
                 value = extract32(value, 0, pfl->bank_width * 8);
             }
-            DPRINTF("%s: block write of %x bytes\n", __func__, value);
+            trace_pflash_write_block(pfl->name, value);
             pfl->counter = value;
             pfl->wcycle++;
             break;
@@ -567,7 +553,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             } else if (cmd == 0xff) { /* Read Array */
                 goto mode_read_array;
             } else {
-                DPRINTF("%s: Unknown (un)locking command\n", __func__);
+                trace_pflash_write(pfl->name, "unknown (un)locking command");
                 goto mode_read_array;
             }
             break;
@@ -575,7 +561,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             if (cmd == 0xff) { /* Read Array */
                 goto mode_read_array;
             } else {
-                DPRINTF("%s: leaving query mode\n", __func__);
+                trace_pflash_write(pfl->name, "leaving query mode");
             }
             break;
         default:
@@ -603,7 +589,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                 hwaddr mask = pfl->writeblock_size - 1;
                 mask = ~mask;
 
-                DPRINTF("%s: block write finished\n", __func__);
+                trace_pflash_write(pfl->name, "block write finished");
                 pfl->wcycle++;
                 if (!pfl->ro) {
                     /* Flush the entire write buffer onto backing storage.  */
@@ -642,7 +628,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
         break;
     default:
         /* Should never happen */
-        DPRINTF("%s: invalid write state\n",  __func__);
+        trace_pflash_write(pfl->name, "invalid write state");
         goto mode_read_array;
     }
     return;
@@ -653,7 +639,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  mode_read_array:
-    trace_pflash_reset();
+    trace_pflash_reset(pfl->name);
     memory_region_rom_device_set_romd(&pfl->mem, true);
     pfl->wcycle = 0;
     pfl->cmd = 0x00; /* This model reset value for READ_ARRAY (not CFI) */
@@ -1022,7 +1008,7 @@ static void postload_update_cb(void *opaque, int running, RunState state)
     qemu_del_vm_change_state_handler(pfl->vmstate);
     pfl->vmstate = NULL;
 
-    DPRINTF("%s: updating bdrv for %s\n", __func__, pfl->name);
+    trace_pflash_postload_cb(pfl->name);
     pflash_update(pfl, 0, pfl->sector_len * pfl->nb_blocs);
 }
 
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 7962cff745..b6de18d3ad 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -48,14 +48,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-#define PFLASH_DEBUG false
-#define DPRINTF(fmt, ...)                                  \
-do {                                                       \
-    if (PFLASH_DEBUG) {                                    \
-        fprintf(stderr, "PFLASH: " fmt, ## __VA_ARGS__);   \
-    }                                                      \
-} while (0)
-
 #define PFLASH_LAZY_ROMD_THRESHOLD 42
 
 /*
@@ -220,7 +212,7 @@ static void pflash_timer(void *opaque)
 {
     PFlashCFI02 *pfl = opaque;
 
-    trace_pflash_timer_expired(pfl->cmd);
+    trace_pflash_timer_expired(pfl->name, pfl->cmd);
     if (pfl->cmd == 0x30) {
         /*
          * Sector erase. If DQ3 is 0 when the timer expires, then the 50
@@ -233,11 +225,10 @@ static void pflash_timer(void *opaque)
             uint64_t timeout = pflash_erase_time(pfl);
             timer_mod(&pfl->timer,
                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + timeout);
-            DPRINTF("%s: erase timeout fired; erasing %d sectors\n",
-                    __func__, pfl->sectors_to_erase);
+            trace_pflash_erase_timeout(pfl->name, pfl->sectors_to_erase);
             return;
         }
-        DPRINTF("%s: sector erase complete\n", __func__);
+        trace_pflash_erase_complete(pfl->name);
         bitmap_zero(pfl->sector_erase_map, pfl->total_sectors);
         pfl->sectors_to_erase = 0;
         reset_dq3(pfl);
@@ -262,7 +253,7 @@ static uint64_t pflash_data_read(PFlashCFI02 *pfl, hwaddr offset,
 {
     uint8_t *p = (uint8_t *)pfl->storage + offset;
     uint64_t ret = pfl->be ? ldn_be_p(p, width) : ldn_le_p(p, width);
-    trace_pflash_data_read(offset, width, ret);
+    trace_pflash_data_read(pfl->name, offset, width, ret);
     return ret;
 }
 
@@ -325,7 +316,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read*/
-        DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
+        trace_pflash_read_unknown_state(pfl->name, pfl->cmd);
         pfl->wcycle = 0;
         pfl->cmd = 0;
         /* fall through to the read code */
@@ -338,7 +329,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
             toggle_dq2(pfl);
             /* Status register read */
             ret = pfl->status;
-            DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
+            trace_pflash_read_status(pfl->name, ret);
             break;
         }
         /* Flash area read */
@@ -363,7 +354,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         default:
             ret = pflash_data_read(pfl, offset, width);
         }
-        DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx64 "\n", __func__, boff, ret);
+        trace_pflash_read_done(pfl->name, boff, ret);
         break;
     case 0x10: /* Chip Erase */
     case 0x30: /* Sector Erase */
@@ -375,7 +366,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         toggle_dq6(pfl);
         /* Status register read */
         ret = pfl->status;
-        DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
+        trace_pflash_read_status(pfl->name, ret);
         break;
     case 0x98:
         /* CFI query mode */
@@ -386,7 +377,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         }
         break;
     }
-    trace_pflash_io_read(offset, width, ret, pfl->cmd, pfl->wcycle);
+    trace_pflash_io_read(pfl->name, offset, width, ret, pfl->cmd, pfl->wcycle);
 
     return ret;
 }
@@ -415,9 +406,8 @@ static void pflash_sector_erase(PFlashCFI02 *pfl, hwaddr offset)
     SectorInfo sector_info = pflash_sector_info(pfl, offset);
     uint64_t sector_len = sector_info.len;
     offset &= ~(sector_len - 1);
-    DPRINTF("%s: start sector erase at %0*" PRIx64 "-%0*" PRIx64 "\n",
-            __func__, pfl->width * 2, offset,
-            pfl->width * 2, offset + sector_len - 1);
+    trace_pflash_sector_erase_start(pfl->name, pfl->width * 2, offset,
+                                    pfl->width * 2, offset + sector_len - 1);
     if (!pfl->ro) {
         uint8_t *p = pfl->storage;
         memset(p + offset, 0xff, sector_len);
@@ -438,7 +428,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
     uint8_t *p;
     uint8_t cmd;
 
-    trace_pflash_io_write(offset, width, value, pfl->wcycle);
+    trace_pflash_io_write(pfl->name, offset, width, value, pfl->wcycle);
     cmd = value;
     if (pfl->cmd != 0xA0) {
         /* Reset does nothing during chip erase and sector erase. */
@@ -496,27 +486,24 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         }
         if (boff != pfl->unlock_addr0 || cmd != 0xAA) {
-            DPRINTF("%s: unlock0 failed " TARGET_FMT_plx " %02x %04x\n",
-                    __func__, boff, cmd, pfl->unlock_addr0);
+            trace_pflash_unlock0_failed(pfl->name, boff, cmd, pfl->unlock_addr0);
             goto reset_flash;
         }
-        DPRINTF("%s: unlock sequence started\n", __func__);
+        trace_pflash_write(pfl->name, "unlock sequence started");
         break;
     case 1:
         /* We started an unlock sequence */
     check_unlock1:
         if (boff != pfl->unlock_addr1 || cmd != 0x55) {
-            DPRINTF("%s: unlock1 failed " TARGET_FMT_plx " %02x\n", __func__,
-                    boff, cmd);
+            trace_pflash_unlock1_failed(pfl->name, boff, cmd);
             goto reset_flash;
         }
-        DPRINTF("%s: unlock sequence done\n", __func__);
+        trace_pflash_write(pfl->name, "unlock sequence done");
         break;
     case 2:
         /* We finished an unlock sequence */
         if (!pfl->bypass && boff != pfl->unlock_addr0) {
-            DPRINTF("%s: command failed " TARGET_FMT_plx " %02x\n", __func__,
-                    boff, cmd);
+            trace_pflash_write_failed(pfl->name, boff, cmd);
             goto reset_flash;
         }
         switch (cmd) {
@@ -527,10 +514,10 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         case 0x90: /* Autoselect */
         case 0xA0: /* Program */
             pfl->cmd = cmd;
-            DPRINTF("%s: starting command %02x\n", __func__, cmd);
+            trace_pflash_write_start(pfl->name, cmd);
             break;
         default:
-            DPRINTF("%s: unknown command %02x\n", __func__, cmd);
+            trace_pflash_write_unknown(pfl->name, cmd);
             goto reset_flash;
         }
         break;
@@ -548,7 +535,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
                 }
                 goto reset_flash;
             }
-            trace_pflash_data_write(offset, width, value, 0);
+            trace_pflash_data_write(pfl->name, offset, width, value, 0);
             if (!pfl->ro) {
                 p = (uint8_t *)pfl->storage + offset;
                 if (pfl->be) {
@@ -586,8 +573,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             }
             /* fall through */
         default:
-            DPRINTF("%s: invalid write for command %02x\n",
-                    __func__, pfl->cmd);
+            trace_pflash_write_invalid(pfl->name, pfl->cmd);
             goto reset_flash;
         }
     case 4:
@@ -600,8 +586,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             goto check_unlock1;
         default:
             /* Should never happen */
-            DPRINTF("%s: invalid command state %02x (wc 4)\n",
-                    __func__, pfl->cmd);
+            trace_pflash_write_invalid_state(pfl->name, pfl->cmd, 5);
             goto reset_flash;
         }
         break;
@@ -613,12 +598,11 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         switch (cmd) {
         case 0x10: /* Chip Erase */
             if (boff != pfl->unlock_addr0) {
-                DPRINTF("%s: chip erase: invalid address " TARGET_FMT_plx "\n",
-                        __func__, offset);
+                trace_pflash_chip_erase_invalid(pfl->name, offset);
                 goto reset_flash;
             }
             /* Chip erase */
-            DPRINTF("%s: start chip erase\n", __func__);
+            trace_pflash_chip_erase_start(pfl->name);
             if (!pfl->ro) {
                 memset(pfl->storage, 0xff, pfl->chip_len);
                 pflash_update(pfl, 0, pfl->chip_len);
@@ -632,7 +616,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             pflash_sector_erase(pfl, offset);
             break;
         default:
-            DPRINTF("%s: invalid command %02x (wc 5)\n", __func__, cmd);
+            trace_pflash_write_invalid_command(pfl->name, cmd);
             goto reset_flash;
         }
         pfl->cmd = cmd;
@@ -683,19 +667,18 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         default:
             /* Should never happen */
-            DPRINTF("%s: invalid command state %02x (wc 6)\n",
-                    __func__, pfl->cmd);
+            trace_pflash_write_invalid_state(pfl->name, pfl->cmd, 6);
             goto reset_flash;
         }
         break;
     /* Special values for CFI queries */
     case WCYCLE_CFI:
     case WCYCLE_AUTOSELECT_CFI:
-        DPRINTF("%s: invalid write in CFI query mode\n", __func__);
+        trace_pflash_write(pfl->name, "invalid write in CFI query mode");
         goto reset_flash;
     default:
         /* Should never happen */
-        DPRINTF("%s: invalid write state (wc 7)\n",  __func__);
+        trace_pflash_write(pfl->name, "invalid write state (wc 7)");
         goto reset_flash;
     }
     pfl->wcycle++;
@@ -704,7 +687,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
 
     /* Reset flash */
  reset_flash:
-    trace_pflash_reset();
+    trace_pflash_reset(pfl->name);
     pfl->bypass = 0;
     pfl->wcycle = 0;
     pfl->cmd = 0;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index d32475c398..b66afd1593 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -6,15 +6,36 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
 
 # pflash_cfi01.c
 # pflash_cfi02.c
-pflash_reset(void) "reset"
-pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
-pflash_io_read(uint64_t offset, unsigned size, uint32_t value, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x cmd:0x%02x wcycle:%u"
-pflash_io_write(uint64_t offset, unsigned size, uint32_t value, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
-pflash_data_read(uint64_t offset, unsigned size, uint32_t value) "data offset:0x%04"PRIx64" size:%u value:0x%04x"
-pflash_data_write(uint64_t offset, unsigned size, uint32_t value, uint64_t counter) "data offset:0x%04"PRIx64" size:%u value:0x%04x counter:0x%016"PRIx64
-pflash_manufacturer_id(uint16_t id) "Read Manufacturer ID: 0x%04x"
-pflash_device_id(uint16_t id) "Read Device ID: 0x%04x"
-pflash_device_info(uint64_t offset) "Read Device Information offset:0x%04"PRIx64
+pflash_chip_erase_invalid(const char *name, uint64_t offset) "%s: chip erase: invalid address 0x%" PRIx64
+pflash_chip_erase_start(const char *name) "%s: start chip erase"
+pflash_data_read(const char *name, uint64_t offset, unsigned size, uint32_t value) "%s: data offset:0x%04"PRIx64" size:%u value:0x%04x"
+pflash_data_write(const char *name, uint64_t offset, unsigned size, uint32_t value, uint64_t counter) "%s: data offset:0x%04"PRIx64" size:%u value:0x%04x counter:0x%016"PRIx64
+pflash_device_id(const char *name, uint16_t id) "%s: read device ID: 0x%04x"
+pflash_device_info(const char *name, uint64_t offset) "%s: read device information offset:0x%04" PRIx64
+pflash_erase_complete(const char *name) "%s: sector erase complete"
+pflash_erase_timeout(const char *name, int count) "%s: erase timeout fired; erasing %d sectors"
+pflash_io_read(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t cmd, uint8_t wcycle) "%s: offset:0x%04" PRIx64 " size:%u value:0x%04x cmd:0x%02x wcycle:%u"
+pflash_io_write(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t wcycle) "%s: offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
+pflash_manufacturer_id(const char *name, uint16_t id) "%s: read manufacturer ID: 0x%04x"
+pflash_postload_cb(const char *name)  "%s: updating bdrv"
+pflash_read_done(const char *name, uint64_t offset, uint64_t ret) "%s: ID:0x%" PRIx64 " ret:0x%" PRIx64
+pflash_read_status(const char *name, uint32_t ret) "%s: status:0x%x"
+pflash_read_unknown_state(const char *name, uint8_t cmd) "%s: unknown command state:0x%x"
+pflash_reset(const char *name) "%s: reset"
+pflash_sector_erase_start(const char *name, int width1, uint64_t start, int width2, uint64_t end) "%s: start sector erase at: 0x%0*" PRIx64 "-0x%0*" PRIx64
+pflash_timer_expired(const char *name, uint8_t cmd) "%s: command 0x%02x done"
+pflash_unlock0_failed(const char *name, uint64_t offset, uint8_t cmd, uint16_t addr0) "%s: unlock0 failed 0x%" PRIx64 " 0x%02x 0x%04x"
+pflash_unlock1_failed(const char *name, uint64_t offset, uint8_t cmd) "%s: unlock0 failed 0x%" PRIx64 " 0x%02x"
+pflash_unsupported_device_configuration(const char *name, uint8_t width, uint8_t max) "%s: unsupported device configuration: device_width:%d max_device_width:%d"
+pflash_write(const char *name, const char *str) "%s: %s"
+pflash_write_block(const char *name, uint32_t value) "%s: block write: bytes:0x%x"
+pflash_write_block_erase(const char *name, uint64_t offset, uint64_t len) "%s: block erase offset:0x%" PRIx64 " bytes:0x%lx"
+pflash_write_failed(const char *name, uint64_t offset, uint8_t cmd) "%s: command failed 0x%" PRIx64 " 0x%02x"
+pflash_write_invalid(const char *name, uint8_t cmd) "%s: invalid write for command 0x%02x"
+pflash_write_invalid_command(const char *name, uint8_t cmd) "%s: invalid command 0x%02x (wc 5)"
+pflash_write_invalid_state(const char *name, uint8_t cmd, int wc) "%s: invalid command state 0x%02x (wc %d)"
+pflash_write_start(const char *name, uint8_t cmd) "%s: starting command 0x%02x"
+pflash_write_unknown(const char *name, uint8_t cmd) "%s: unknown command 0x%02x"
 
 # virtio-blk.c
 virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p req %p status %d"
-- 
2.30.0


