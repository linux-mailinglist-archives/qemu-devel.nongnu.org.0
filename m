Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB773BED2F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:36:24 +0200 (CEST)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BTE-0003ne-0d
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKY-0000SX-U2
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:26 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKS-0006k6-Cy
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:26 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCNNP010636; Wed, 7 Jul 2021 17:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=+odAudg6fzmwU2d1k/Az+04Yen2lOttTvaitiX4jwAk=;
 b=mdYUsvlWQZyn6+zRsE9IWhC8Yh71Ka9sXmAApBzgsUMHbDb05tKAMNHMot4Ex0fdpUFx
 GB06UnHnyjji4GrMZqxFXuUhvj4L6Z1v6H8LiWXj21XdcaXVd1Ab73221TGImDuPS2Rv
 5SxqNyrN7wFsU/bPL+QopzQ3xxY5shTjoAeaNIuWgFhXFbPpTipH44US9Dfx0T1v1P12
 GrR2GuVdqf4LP2RPDLkRwPKRmMFp7mw14bIts/Z/7muGRHm4dMYxTWL98r5YxG2F6p/L
 1jKczVtK0bExhC9ABSJCgxIURitF2gfAOS4oJXlhsUoaQhxDBioEmQHmMcBcjxgbKX5V VQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m3mhcngx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HA7t8026057;
 Wed, 7 Jul 2021 17:27:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by userp3030.oracle.com with ESMTP id 39jd13ubc5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXx2KQnq5F7LoyR3pfGmd5sqMM/b/zRaTa0R8cWZOIHfmWrYXFTt7Q2EIAWRzVYT64Ysfy2GuH65PqFZo2bl5nlXKlhHgQDMGFbrcqdhZb1KFMcOgtD+L0owXUXvPwys2EY70IBHQJ87z1gmGfrzg3gOGQ6zICQFhajxP8Oan1W/4yNXs3S40IoDkPAs05aeTkDHUUZ1X6mBmGHV0uQIqK+KfgJH1XTIrsfQExH1Clo1Q93LF55/oWDJygu50Ig0QZ9GrhwngwPVaBYO0pkZMEkBodlTZtVE5NJgbdT30lUZz7uVcXCuYDaOPbW32JC3RFSRpTejyGrZSe6+lcLUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+odAudg6fzmwU2d1k/Az+04Yen2lOttTvaitiX4jwAk=;
 b=G0QecN4pZeZnKHJV1cUVKHeTMaseUgR1AWFyuddCu5MiewmcUpET4JtgV42fwUkUDFtfRQp1fhzWzapSpDIk9jCCzuVMHmHyY6KQ4ITuD5/qvkdwmH5kI4WCXq1t9golZsd4eNg+z4pns7rkf7MzGqLa11H0g8pfL67q/M+werujP9veEq5FecEo0TVafWfpzbkZ88H/YyOAuPS/AGnakjh7agsP5t4LPRwP0bfI97hGOEYVRS/ZWw9fxCSDWlgMZfxflOxqH716k4KUTkAFqof+vEHOiI1KlWW+IQRBZ/ETLrgE1awUYk+ouYE2LxizumQklQwFa0qU6kiO1QkdRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+odAudg6fzmwU2d1k/Az+04Yen2lOttTvaitiX4jwAk=;
 b=xo/ruztgPqQQjlpaZ9Ani2cyh0seipP0ZnNW19XVpRA/MNzeYUi2SR8OMl5rdbcw8+qOHiP/7SlO63IQABIkEyyOKnYMuCipBrphYvInrdLVjKsZrHRMeIONRBfU4qEfnlebUfLX6Bnke4mXDNxvZLF274F+B+1UDk18Kuj6SgE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2677.namprd10.prod.outlook.com (2603:10b6:a02:b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:13 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:13 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 09/25] string to strList
Date: Wed,  7 Jul 2021 10:20:18 -0700
Message-Id: <1625678434-240960-10-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70f0196d-24a6-4285-18f9-08d9416c7578
X-MS-TrafficTypeDiagnostic: BYAPR10MB2677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2677A7AB1A5A26689398FAF7F91A9@BYAPR10MB2677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+o30Sl+9A5qwNU04xaiRfRkxouA29uphQgLwL3cKwnmfIWx1PQ870fieQBKbhh9EXGY1EbveLXFoB2/H+YaVfOdWbK/fGZa3ue4FX6pANPxlo1qlGrRR7DjzIJNA4GUTlGakWB0Ip5JQmb+tqxLub6b9UA1NH6eIcm0x742qtUnZSB8ypK8NumkHSs7/DUJzIYRuFES5BiQRVQXBnquL+zgI8gsy86XNVNoT6Raz7jvWMV9/byuQoQ/ycpTcbPXnmfistKd1nnRVkKINY7VlcDPHr7N1dZOGAfw+5WWDPwkC2aIDJf70F7NBY11M2cfD6/7tFKRC5ts1lQRRXWj/8mbZyS9kgwhirVQOTwCNtbhVlgGbhYbnYdCKpc/+iilKmY9W1ihf0J/5GaCf1yrifvKiMPyAauUXoPU73fodNx955fFa+ic3XgKlp1UAiD1YvXHBAQWJs3ndf34z+kY4H3lW4suw96DGhZerWt5dsk9z13m5IBhvg8rUFoIg+153C40EC995RxLLCzaGYcNAbUpBG04P7QyadC8y08xQvt+57Zcxqk9VG6chIEsg62aNEqXQvDEk4mDSEPtoUpah9RACrP0UoqeSv3KLuXBrjbjhj4U3TdIjvCIAXJY4HOUZnHg9Tx+DHTNDA46Zj8sYnn8oxl3tJiWgGwFyQb+bvElb0Ev0fg132rdF+s7TDkM2VjAVZRVbIZxZvnDum+qcYadf9jBt3FZ5GoXgp4XnDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(376002)(39860400002)(366004)(346002)(6916009)(107886003)(38100700002)(66946007)(7416002)(4326008)(6486002)(478600001)(2616005)(7696005)(83380400001)(36756003)(52116002)(956004)(8936002)(2906002)(86362001)(186003)(8676002)(66556008)(54906003)(316002)(66476007)(5660300002)(38350700002)(26005)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I4who2b321tWoq4Y+ZAggMq82nSqrza/62B7EzIEDMDEpJ0xv4SRYGUkEWlh?=
 =?us-ascii?Q?9TVdqe/EBuDZ7umxzW1rXO1ldSTr9WdukMaxtJK3pki1qgPsRb+EOnNK2iPJ?=
 =?us-ascii?Q?/iEuPEr1hFDf04m3Xq/+YRUZr5VYeeVwvFcCGHKLqamGun6drtruA6wu/Siq?=
 =?us-ascii?Q?qF/mboqIK8JCpUR0XXbAmenotPa1jc9fKnQPdYaK8FeFNjcwaEGcni0IBe5g?=
 =?us-ascii?Q?YqbEBteHTZm6Gsn+FCPdz69NqM8pJFTJT1cVT0wKwQrNoUkVNx9W1JtupNqF?=
 =?us-ascii?Q?sgx5j9cwlrpSXFj8I+LJaSNPwS8DGsYvE69ay58ypPhi8Nv8y6qxHZSpAVne?=
 =?us-ascii?Q?0H4z9aEDxRMwMfkiV0ZjqnDd5fhyNlQX2uE8oAbGMBgIixKViCN9a/yI/Buf?=
 =?us-ascii?Q?tMYFtKmPoFnCnFAVReF3NDmq3b6mQ2FRz4m2Byzkazl4opNUlmHVUmuV9dzm?=
 =?us-ascii?Q?qQNyj4qEbKW+M0Mu6Z8dq1cSwnI8bBKj1iQiqEDp7xguzGrs5c6kW46IEdal?=
 =?us-ascii?Q?4NlHF8Dnkozo6zzVIv6auS/gre4oEII/6P/Sor9UzN/Z6cDmYAnsKlGlQlFW?=
 =?us-ascii?Q?D6lXxVUUR7tD2BF7brS6mi45jzEwbqA0Ya5SKRBXGb8Gq+RmA6QYHe29fh3o?=
 =?us-ascii?Q?NR0qjwvjISY5Ce03zl7RwLB83KNLyhcN0sDxxK+7ZZnT2bbb4GbovuPcrCjc?=
 =?us-ascii?Q?bRfQJfUih8AYiB/PyJ7hG2VHbIVZaQaRQ61gc87Ti9l49UXmaWxJvM8C99kp?=
 =?us-ascii?Q?gAnWMOyIOxgnqodP+Humq0WUa6YjDJOAPegU099jIUZWT+V6WahJgCby8vzG?=
 =?us-ascii?Q?t/CgzkIA9kt6nRTRtBX3hSVMd1m6YZeewvN1ZI445LJ5EzdS1MakTI1r3+MG?=
 =?us-ascii?Q?1TUuLh5qVrD44ghevWyfJBvEWLuirA+4HjVWEFDqKeYkb7+jda91toBxyg3E?=
 =?us-ascii?Q?K83+hi8KTOCl7eNg/0VyNLd0zyP6viKZQ03KuspIhOMTC35oulNE4qL0Ds9t?=
 =?us-ascii?Q?sTvW2NKXuwxo1YR78ol71ZTEhxbxdVUlVhKG2tKRXgXKvaQ0IegQWYatkuDm?=
 =?us-ascii?Q?BoCwTG49BY9CjalSLFdVIWxnXa34HbFPSvtk3VT/iRqxHLZaqJMVQ9iOnvhH?=
 =?us-ascii?Q?xPx26pF/K9S1aWl1U2ZAIaCBne+jUA3Hj16xRzgaXtK+WPz3Wp0WMxgtXtsH?=
 =?us-ascii?Q?3KfaN9g+F6sO9IurVO5E44f8+6sn2VxynuzzpGxwNdmcmwX2VK0yG5ShgA/9?=
 =?us-ascii?Q?AH4Rl0tP5datTzzXpF1qy75lVJnzToboOjCtzieWgOBZDlAoQDtJ/kpAsCht?=
 =?us-ascii?Q?Itri4I33ikETag2+PJvoNXbe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f0196d-24a6-4285-18f9-08d9416c7578
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:13.4823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ifHQmaRH8endDdba0FlLh5kPGx/jwRh+4AUVgzdF4F7cS3y09NXREyRlxk2ObEO40b9g/ZHSZQbztqDt/QiZePk75JFBiI1BHqJ1H6Eqj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2677
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-GUID: fgU8D3x1bmSGOKolMKFxT7vHbJ5wCr7_
X-Proofpoint-ORIG-GUID: fgU8D3x1bmSGOKolMKFxT7vHbJ5wCr7_
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generalize strList_from_comma_list to take any delimiter character.
No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 monitor/hmp-cmds.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8e80581..a56f83c 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -71,21 +71,21 @@ void hmp_handle_error(Monitor *mon, Error *err)
 }
 
 /*
- * Produce a strList from a comma separated list.
- * A NULL or empty input string return NULL.
+ * Produce a strList from a character delimited string.
+ * A NULL or empty input string returns NULL.
  */
-static strList *strList_from_comma_list(const char *in)
+static strList *strList_from_string(const char *in, char delim)
 {
     strList *res = NULL;
     strList **tail = &res;
 
     while (in && in[0]) {
-        char *comma = strchr(in, ',');
+        char *next = strchr(in, delim);
         char *value;
 
-        if (comma) {
-            value = g_strndup(in, comma - in);
-            in = comma + 1; /* skip the , */
+        if (next) {
+            value = g_strndup(in, next - in);
+            in = next + 1; /* skip the delim */
         } else {
             value = g_strdup(in);
             in = NULL;
@@ -1170,7 +1170,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
                                             migrate_announce_params());
 
     qapi_free_strList(params->interfaces);
-    params->interfaces = strList_from_comma_list(interfaces_str);
+    params->interfaces = strList_from_string(interfaces_str, ',');
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
     params->has_id = !!params->id;
-- 
1.8.3.1


