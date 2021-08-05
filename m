Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8B3E1EE5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:35:52 +0200 (CEST)
Received: from localhost ([::1]:46420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBlxv-00057E-HD
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltc-00020Y-2j
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:24 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mBltZ-0006hS-Ol
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:31:23 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175MUwld021793; Thu, 5 Aug 2021 22:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ZHXJaNKj4fCaogHdBrI5ZQIy+iW/ldFMEXjCMwtrbJo=;
 b=1FeFJLhJZg4Z3S7TieAVGHYPkWb7BqpS3G3Zfe6xYseSHHXa9CciKvvqS/p6pZzRgnXg
 n5YlSAGiOGoUWQWVWHiCGek4oC2dsH+GiBIZtODO0fWaArky1P7tzDpajjhqTmx92rsN
 ZON6YOeaq+9SxCkHLKqTCucX7iPTjk10QDfk4Ryacw4E3St4S5wNkbSHkxYP+RUikggm
 wgKa10GhkKcwbQHfNrHLUTDpFYKjHSfZpn1QYULoj8l30zaoi1sT1Gp2bEHfU5lCUivf
 EBNryHYS/yX9lO3kwn7rDMsxkOYBrtnZUDZQNDHDKiQ/65ciHj5jT+ExRNVW1k0ss97q YA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ZHXJaNKj4fCaogHdBrI5ZQIy+iW/ldFMEXjCMwtrbJo=;
 b=uxbkj5poSt7HGAZraO1IJ64JJJNPvo7Yi5wbQQjv/gB9owflzQFXyUnqVbDjAk61d7fc
 esG9PTRlGYrYnV+d6GmoxjP5oUtAszVTltGiXMc8V0Nr4Yqp9R4p9CqL4z/KeJG3Ih45
 afBNTlmLzVlkhsRka8xwra4oj8vc/APNjCng9aD1iywYLNq3hEt3gzww7EnotjunmayR
 XFwUr1nnRq8Cg7GnpkDztW2Z4XDCW31l30see00xm4fhLNI3fV7hk4a95aZd0SSxc4qw
 IyVuXPsuRcd8v5+QPtEQbYeGQG2dL+tTfkCdNJaQsmHzjgY3jjcRM7SczJEkIM0wQzmn Lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7hxpna3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175M9mfl150466;
 Thu, 5 Aug 2021 22:31:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by userp3020.oracle.com with ESMTP id 3a5ga1217e-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Aug 2021 22:31:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWA62pPP3DyjBW8Vuv6/g7uC9xjF5xllsiqXrnnuYXzxUcXIJoC11KdU6n0oTmGTff0CA+YXe2MrlJZSknbftPDSx6NjLwvn9Uh4TuG+s2CwCNIME2xwX2JTrcuPrjsso0alydvbdikC0v6oYDiWGWpa7m9Vgo1DDCMbr5jpkqUnj9D673CpvF51EJbMFtXUU+aL9TRA30FYsi5kv0dgwvepkL50NFTCYIitBBumIES3wwn8EpIpt5zHX0+B1itul/gXoZonGC/sWFgWtN1swv3a4uUMTCV+xy/fBUH4Yv7yAG+pGsLl2C73PkPjtogXW4ishKKJpa28oK+dLR6E6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHXJaNKj4fCaogHdBrI5ZQIy+iW/ldFMEXjCMwtrbJo=;
 b=mniBTE57/jpQQqBA3dHaKVZZW1WXvihrzEz0XyHGpfC5Yl3t5S8eHFs1JGCkEPx+TrF1FAwvezUZyYLUqTPFZf0XhzAhWdLeyH8mFRJf8zhcar0aRTzLd1MKP5UxjkgRgi4jAKTyM9CEj1vTYOvqLzRgnWvVkPx2L1/+YkJPDjlAeDw1IkUJlB6FKemnOP0swTrVTXsk9L6MA1lTY4kDfXRVyu5DcdYH/BqA+cbdPq5s85TvUUCB/yfpFOqtYJHbPWPyNsNIG2KoAkuuoYcZpA/GgwQsifkfHH22S834fhnN/cLbGrPpCMlV1Vj6Aceo6G5cFN747PE16gr2CoSw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHXJaNKj4fCaogHdBrI5ZQIy+iW/ldFMEXjCMwtrbJo=;
 b=Wg7TCOa3QbZHbc6K2aQiBW2i5StOM6s3858icqM3UKP2mSu5neusR/sqI3qmN28EPYbaTgW1ePeC1Zd502nGYpd6ZXZZT/yr0JUvdMeKxAcuXcW6FyU3+7YL5t1H/PCwbca5xXJLn40wflSjTMoNFR2wBJPjTNSygkaaOpIfqSk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2221.namprd10.prod.outlook.com (2603:10b6:301:2c::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 22:31:15 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d23:ea44:5df6:2bbb%2]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 22:31:15 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com
Subject: [PATCH v6 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Thu,  5 Aug 2021 18:30:30 -0400
Message-Id: <1628202639-16361-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BY3PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:217::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Thu, 5 Aug 2021 22:31:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cb64716-8ca5-40bd-1cd1-08d95860bc39
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB22218790F1641F759AA2B2B197F29@MWHPR1001MB2221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q3v9Nqi072ByHHsi4MgvcJPzPG9vV9pqXLQs8PmFA104OBrgnHO7y2407WzRGhRG/ZlNueEQXKoxxarkvrBGAHBmFtbNRqgRcExCKoH8POnCrdyzoqhrBLpoMWCShkzz9D32c1iWPVHgt3PxH1wzn/wkj/gZRxh7BA/2FXD4W/gebu7TDM4d+FWj++p8bkwC3I4kqH2eHCB3U6CXRlVHWAg3Qxdl2V1lzNiNzKbn+p6pwCGsoxqLCdQeSE7XdF1Gew/i1lAWsDABqCnQbpWhDKyAp4Y/1o+avucMcgCMb3PJzznjS8oDTej3fiDLJ3KNbHXP0sdqHk2wShbR1GGF/hl5///3cWQ0OU+fih6K++2A7NtjbB5u1+UxFP5/e2HPRhiDp2M+QsiwlxCel0XSNFaL+qKoxl4jmLsqruO8VYgiWTLrIz66tMgZ1j3ngzDOn3kuQ2/wwSe0bZSVtFACv7Qor4irQsARFW6Bb+eHCCB/gUjbw4T6HOfuiSvkvPpXSVg95QXS/uv8R5HCGKnhQaggRTN8KvJptPSRhB45V+49UGKohYSW68Lhvk6LM1yHtI+v0afPiPPejEjSsr9Yzd6eRoUTLl35VMPARtXWVu6z3yLgt2VJ76iXejkN5gGXjV2fHM8LzClCyyzIiS++a8n8F6N5Nyw2C4QBSwsI1OEO6C+Gg6N2qWdrAtVyBolfbzqYYSlw1tpqnzsGy/pUXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(8676002)(6486002)(38100700002)(38350700002)(107886003)(66946007)(8936002)(66476007)(66556008)(316002)(2616005)(36756003)(956004)(186003)(5660300002)(52116002)(478600001)(7696005)(86362001)(4326008)(2906002)(26005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Cf7GX+n/WWKZYrRmCYB/tXxLWPGnOiBHqNps37tPvVvOq086iIgHsEUFs+T?=
 =?us-ascii?Q?pVcFzovXRpkHS0uMlDRoHdu9TBAERNYRA26uDuIZcA3b0nwEHDfLV0GMtaPw?=
 =?us-ascii?Q?aavOxDzSeRW10j1S6Sfnat4ZI8+lz0hbgTdZOZZDUNgyb32ttxjvTW1HkXfk?=
 =?us-ascii?Q?tZXlqEWFy8vBBf0GvQC2sBKvAae8LFOFf8S9d2kjwYUEUsf1Uj0a2VN0eabq?=
 =?us-ascii?Q?FoVIHmdAjpTOLKDzdKbbCtR6nYwJsveQQspzrJQagPYtRejpShmjBKaMJeBx?=
 =?us-ascii?Q?pp9lxTTcGsl6mhUeH8grIivavyRh51N148C2fglRRvSTEkOY5Rmrl20mKKac?=
 =?us-ascii?Q?RLjuXPRO86+gKYRankkgh038FG/S/0NU0BCu6dV5izm3SjQ0nHjAvfE5EVdV?=
 =?us-ascii?Q?hVRGWFFi2qk1JZRQvINyq7sx2qEHeLpVMgOtex58iVbs6lMmE7tQpwmdazlz?=
 =?us-ascii?Q?1j6zISOzbWXTF50Xs6IiLbjJaz2Ye7HRsm/XZ+VDqhMoDZlSUsnHilVq8CGu?=
 =?us-ascii?Q?VdwGLXrVEgecpHTqL9HOc/jg6pRbAoWmvbiGeZBFPktUq3hE3wzyjGdpf8Lj?=
 =?us-ascii?Q?GKycPjjevFpYTyto58v3SgnxHas4xycMXugQXaA5UzUSnKTG43nbd4+RmJuv?=
 =?us-ascii?Q?B5W3Hg3DHpBRULe2bynXGrx8kbiQu2JTgf2ZnJ5CGgN+ThRvN/wjWiO607cC?=
 =?us-ascii?Q?SRUYtzj8G3rNFfxWhRHRKXO0+7gYNNe4fbMY7riVRnMWK+cfHJ7ju8DmcpSe?=
 =?us-ascii?Q?Eige4H6+7goSHun551TmHDbrOHqZgrDs5hbTxzCE0a8aMUhIrvurESdd6e57?=
 =?us-ascii?Q?eqUYeNpSTjjG5oBaSGIl7HIgEPQ/lEMqtJB6raFKQpfUle3YbJh2sFiUzDo2?=
 =?us-ascii?Q?B1Zs1I8HClfi9rlLvfDVw4YtRyAqG4AXDUqygrDaeyk4QJSBz8vNTta1oKTD?=
 =?us-ascii?Q?drAaNggS4GwsfCJUcJiG6XerjZqPOfayg63oHC/BPDMgx6kF7KKp7jQe8Qth?=
 =?us-ascii?Q?T2xZmag0phq00xGWNAycH7MaXIWoDz/H0tHRHGkw9ZeANqnF3kietJIbLcv9?=
 =?us-ascii?Q?6j2Wd46dh7RVfIo6/VNrR09/IMpBC5doPxVGOrmGlIBkQYpMoHxVIHtzcbSd?=
 =?us-ascii?Q?ahpmgMh62kpKkOabt345k0RCHRVniixG/YV8Qz+b2B2VMbtg2dGYDZlTefSM?=
 =?us-ascii?Q?U4I2IpCeIQbetcJXL+h19fVvP1bNZciDbLqJQmobKkP/OP+g4ykYtBB1ecev?=
 =?us-ascii?Q?YNOPbGbDYI8F6evvS3BFMhcniGi1z9c5ZQuaw6RvU4vpYdr6OjXAwE776tjF?=
 =?us-ascii?Q?ALYpVfQcDVhhL8mFLbxe33Wd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb64716-8ca5-40bd-1cd1-08d95860bc39
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 22:31:14.9322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPpyJGlj9LbRrCj1aeO153pA/5U8v0+8H8Vfe+ymDX5rv1Wsa3sR8O77i2CjdnjBtyXeNWLOxYdywOMFakOS8n0JkmDW+0RbyFp2vyqEOV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10067
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050130
X-Proofpoint-GUID: jUeVEI7xjLVCziJbcZXSWlrKzYPdKaJO
X-Proofpoint-ORIG-GUID: jUeVEI7xjLVCziJbcZXSWlrKzYPdKaJO
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, mst@redhat.com,
 pbonzini@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
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
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 4 files changed, 6 insertions(+)
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
index dfb8523..b3aaf76 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/ERST",
+"tests/data/acpi/q35/ERST",
+"tests/data/acpi/microvm/ERST",
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/microvm/DSDT",
-- 
1.8.3.1


