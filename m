Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1543946E5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 20:17:18 +0200 (CEST)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmh2r-0003jo-H9
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 14:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0H-0001Yv-Bi
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:37 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0F-0007O8-3S
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:37 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SIDr0f032286; Fri, 28 May 2021 18:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=FNVW32VzPFIFi3mxHn2iu6hXQyNhX6HnN6KC7WAQD3nUhE3zMc3InP1hOFoT01LiIRc/
 bRGRPX4Rdw72w7j9wactcpC2t5kidoo0ACZBT+sXx+pQ5SFhWC734Sqisn5b6RO1N16W
 YWtV9Iz4XwocFmp1f9qCE3j/zh8TnxKIhvMZiplFbHz5tog4m/Rp65p/NKFpbmKcIDsg
 Z4sqsWTcXtnNMxIbOy3DR9x2fdpmu3HHoJe08ZnPmgkfrC1YJtUJbNm8r6Uzxzi9QlTS
 UJN0HRJ2U5t3+MaDo7VKTyaRIvox5KM6qWuPqObKxPGcoc6DNmRUFhOxJ9jLbz+19lQf kg== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38u54vg08g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:30 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SIANNV098628;
 Fri, 28 May 2021 18:14:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by userp3020.oracle.com with ESMTP id 38qbqvpqc4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfUu02SnsEaVKHgRkQ1YWPhEX3ZI8mPge/fKTKqluvSlmuTR030rXz6NgknG/H3EqyM8ZgaCQ4Y74H73uTb9ajcsdU3CRzW0t+Zkf2NrM/3aaP1thywn8aHiWu+s9p7cMYA6YVyn/MJgN16wVpMdQ1l3utzRbG2uyYjPcvRmcT+KBfGpvb8YMP1t2TAqDITibrQySaqrTQE1jreA4GdHhXePRsWqunDr8a1/BPAPKL92v7wBX7ptcIs6HlNgtW1dxyLwsYSYirulGgs96R8PjI8XeySZAlVQdVKT1vLJMBxYGNZz72Ajz30cPEJHD6xie29KBnKfK3WTjmY+uq+ntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=ln7bJUy+TZ/OKhJIHM6YgayYOBM4NxT2O3LGAAE5MCceA2lbM0EuDunzmwDlA1Ubb2eWqFTRByaiaSyQV+Ef9zXHn+UMdnvI2MHSay84SMnWgJL3/c6Sk0UznChWVQ42Yo107zN/3WcADnfs64uVhs4lMbNNtWiBoJmDV+4K9sGn9t3ZnwNgYi5A7UDUb7JeIlOV1kMA3vcKhDDGs0RQWuVPugaTNksgEbSZeupF6xlKjDGsao+UYDExIhMGn1EPNcifo+Xi2VqvmO1Rw9ji82nBrCFJKFjlHvrti07hj2NoTZQpscHW2kkLpq0tFXgChHpVuTLadz55OrSGsOWtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=kWmzMKqqGH7CpnwAvgVtAH/uq7VeYjzEruXfX+2lIcsJ+VL9iRyFzATx8J76O9/JH7iio6qtdq59DR3GGurYTaPJURzpNQCn4wHig6zyzWPJGwXsZ2PwpVa0Kdu2iUBykFboRKGlzCBESbYK2g4MC+eP9uR+cWxUlOe0Wci2amU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 28 May
 2021 18:14:27 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 18:14:27 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Fri, 28 May 2021 14:14:13 -0400
Message-Id: <1622225659-16847-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
References: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: SN7PR04CA0201.namprd04.prod.outlook.com
 (2603:10b6:806:126::26) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0201.namprd04.prod.outlook.com (2603:10b6:806:126::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21 via Frontend
 Transport; Fri, 28 May 2021 18:14:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44293343-ee0c-44e5-91aa-08d922046e5d
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB204522CC9D9DFEB660901BB197229@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tl1IzfQV0P7zue7EH4k6Hu7Ig/psQhQBy6NiMTiPCx+0YkbaB5zlT/f7cQz8jXc84rusLvOFtXQWztsZChUHRLTPc8P+poQ4q9iicf2lI5axCIdQOxR50HI1YPrRGHJl+R9QTiALfyA9DG7jJZAkK0HZOzlTg6KtRnpFS2h0VHOYX7SAOpYFaiRoDIQOC4tCpayvs3F/eQ1X5+jJOno71Xm65P8rD7FIxlZ8UhBnET/lP3hczVpP2vM4eZ37MFlAPuTY58nvuMJ3cA9FlGoerjgV1vE3RSeA/k2tfIvpCaHbcY3X/YwrSGuLZ7nuuCLARBRO4W9vt1enrXW1BLfB9yYQBulucWj8qm6c2hO2Gw8peMSKZ5fWaFJh3atraHqyz9NviE1/J88IHePOQnnH6O5Qkxr7YOLhnbyM1YvlMtI/KWCbXwyR2IWPjO2HusdSDeELHbWZdGYBICdduVL5Wgjv7ANkl4w/Equkj6RiCcLTGZeDMiQZrfJRJYBh6hLvpe1ShIYrrMBP0Ck6EmDvLDZiILA5L7lgpuV4UB9xBXDox84TyGgaZwR5XQkryyCOHYCadQuHfYhVYy5frloiiHudOqkyMQFmcbZLuzuHB8Z/aFFlKKX/clxkz5Rfe7Sa2sAYuldW3ggViZ5z8LBCrd6BzN6mIsq5Fe6ztYzotnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(6916009)(38350700002)(956004)(7696005)(38100700002)(52116002)(36756003)(2616005)(8936002)(66556008)(16526019)(186003)(8676002)(478600001)(26005)(66946007)(66476007)(316002)(4326008)(107886003)(2906002)(86362001)(6666004)(5660300002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RzxXSSwX79KLGRTj7Kax3nshB13BPAnTk1IY7t54DxpNyKBx2MNaVLIJVgXC?=
 =?us-ascii?Q?wQcthzkp4AroNKmKJXq7GMOnGgGL/UfY9/k9IUcEC6Lpt6HFKCtJze9zXhM9?=
 =?us-ascii?Q?eYCwVwUNZ5wCAA8iFeu311N+H5GuSkVloSwxQVdTRm0BDy1XFbpb+g/oYV5A?=
 =?us-ascii?Q?NP3YOOyljyN9hPuDjsoGcU4NN3pQHCODWRCr82bXi3oEzusMTS6nBiHU3EEn?=
 =?us-ascii?Q?zltA+T7ORRepC2BPdBTtg+dxKRH3GOSI6me7ofu/OPcsggdGofNNcDvgzg1r?=
 =?us-ascii?Q?VSY+UqUHiT62twtPxG1zFGRfTifNO/jzIZfnSbQ32Rf0MJHgPyJUQrxO7jlE?=
 =?us-ascii?Q?KoHczrHVWpjp9EK3kUlO/cvZNrMWVzNqwLyPlIRBPDYR7sLle8fDuYMPXbKS?=
 =?us-ascii?Q?6/orp1/v9ioTcNTLvpExDlaSfPxFh7+6zs5Ha5es9bvNLrpel2NBoHPcoKeK?=
 =?us-ascii?Q?eSqkHnXkAOBKQmhfzRydWEnQuwu1tZalF5WpNrd3fBb2C4amsRuMoXwjqykB?=
 =?us-ascii?Q?psndcAFGJyu+iuc81rWLUtzJLHP0me/A7qOrw8Ljqo2kmHY/vnMeQiWUSERE?=
 =?us-ascii?Q?2H8e6MHtBMpIIeqBJkwdfNwo2jijofmnuzuczP7VH5Kq8gHP2YY8tJCxiLB8?=
 =?us-ascii?Q?VdLbTeOto/ZevtVg5Bs0XJz6rnqoWzg4dE7hkcjinmf3CJ1tMr3KcKPXSwWR?=
 =?us-ascii?Q?BqDoIp+N9AOmlO3EPoDdgvGRwC7hbENzm1llqwtBkT9vZd5KwVU43nytMikz?=
 =?us-ascii?Q?kOOULG/O5OwsLWi1t1mTQg6lnAxb8PZSZF7SApj4WI2yy1kjodrIWqcLq1FB?=
 =?us-ascii?Q?f6PsIQxEddTO/L43mAH4HHk1rMySYi6P/qxs8a+ghwGy7/fxWz3xHOtDzD7t?=
 =?us-ascii?Q?0GHTA+Vj5prsZ0sk/TTP/Os2AxLj1I9yp+HP9YGnDb2pOSUqkZ4A7fEFRHPj?=
 =?us-ascii?Q?xzwBu6Wi8BFpoTtLncch2gSi500zi0b0MkJH1gvvo98iZr/ysSq8B9tPPsAQ?=
 =?us-ascii?Q?vJsZT0MjCa0uxe8yhR/NkEf0UlGYXLuuwSSRlOqxSZ3dHfFFZ4GMqPD6PDxf?=
 =?us-ascii?Q?lboZee29R5K1ljYdHLfnCOdnkV8bbuNaI+yk92M+t8ZG2hdVelR7IeEIdcuM?=
 =?us-ascii?Q?sJKyHpz8Zzt0wR31ZWWD8dWp0Umu/mo5xPffg8BZdDy3cz182rn1Ge3KYiP0?=
 =?us-ascii?Q?lZyFSOLVu+DTvP4A9jYK/T+1yJXAQPj4qXbFpM3CgaO6usvvRJ97wklcmfGC?=
 =?us-ascii?Q?n//C1YYco/dK9ndwNwUEmTOso6iy7QmHPxZtuvIYB13E0424ZEcEhDIXjwcr?=
 =?us-ascii?Q?YBSK8SVkWoCyQtlYvm9ZyGIU?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44293343-ee0c-44e5-91aa-08d922046e5d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 18:14:27.8098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a15/+lxV7M2aScBsR5TQtO+1v+UQkXWoVmTXR72s4Gxpy4yqKQK6DnjzsZjRDf1Wma0ep1tpYGyGx5NUfhZzMSUOx4wekCfwJUDou/mlaxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9998
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105280119
X-Proofpoint-ORIG-GUID: AeZ4BC91Y-9my_ZtaSmLSxCEbZ8tT-a_
X-Proofpoint-GUID: AeZ4BC91Y-9my_ZtaSmLSxCEbZ8tT-a_
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the guidelines in tests/qtest/bios-tables-test.c, this
change adds empty placeholder files per step 1 for the new ERST
table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/microvm/ERST                | 0
 tests/data/acpi/pc/ERST                     | 0
 tests/data/acpi/q35/ERST                    | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 4 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/ERST

diff --git a/tests/data/acpi/microvm/ERST b/tests/data/acpi/microvm/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523..e004c71 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/ERST",
+"tests/data/acpi/q35/ERST",
+"tests/data/acpi/microvm/ERST",
+
-- 
1.8.3.1


