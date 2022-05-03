Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A52D5186B7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:30:49 +0200 (CEST)
Received: from localhost ([::1]:41246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltY8-0002ND-7J
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLD-0007qE-0B
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:27 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLB-0001OJ-5A
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:26 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243CDxw9018740;
 Tue, 3 May 2022 14:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=onV3Igl2TI+BzyyyLln/oXxujPwDe5TMz1+dKgoQ9H8=;
 b=boB84zhyrkCDIHDRVobZrvnWF3SRLsXLRpsRYEdlOBPyABP2DpXtPlOsWEw82pVHA7Wk
 yitzpEmHwOgYGruIVJ/NIRbCzd44KNl3nQgOg6MYrPuGgCw+9VBlsH5Si/tGmn/urFsx
 HNTGzRuPGxwvPG85Ft1L4cKXZBewaLjIY8a26i6VMOAw1zpnroHoL2hXuVELPMMhWpZn
 mlrGvxX8pCs4pb+4GUGZzu+AkBv6ij0JpmWclnPV4/bMZ8Ors1m+0aQbzILeBBa3CQdj
 EquIGir7KtKl8+czyl47jDk252uUvsxa5t3qHJ2aLs7AOTqLr28Sd/+Bk/rth2DcfMsG Jw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwnt5rw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:20 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EG2GS032480; Tue, 3 May 2022 14:17:19 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fsvbmd2tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPIxUZOUKaZSjvVgUXaY99XHWsSVYv/fZicuI/5n0rPwN4yAiM50oXEuZeMfcU/Vf+IbYgHymIcxCfb73CHPwH9OQGCujhkkeccHFpcBaVv18QR767p9+7hT4arVCuAMtq4qYPW2RBnKTctm2bDLKFDqFl4nAD25lQvVincDNNke9NpRkiwxalG+JwEEBosrc/BhWhhDwWiSYkrAT1TOYkVnDOs98cxqeS8sEJiVCNcZYhcYyOL6FV61ezfga858DprMavtouawMtjWOhpKG+VHyIqH6DgEzLtkqlP5pCjdbu4WAbS4KW+aIwRAbaw96cbUgGrsB9AQVs03VRCrxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onV3Igl2TI+BzyyyLln/oXxujPwDe5TMz1+dKgoQ9H8=;
 b=V1ZNiqK8iV7LDjGFP0vvsWODAx1Q7BtCpD3Iaju1weXY3sP6qvGdHcSEdRuo2PV5EMoLhYmp2SUJXmtqmQ6s9NdvK3mXNqssW60X7E69V4si46SvxcE2h+IXe/4c32fsn3gtgBkk/n7rMbDB0CwXxF5eJE3yhJnVsneMlILGK0HjkW5UKB8br8QF49stVaWeOas5QqKAP0ElxtIyICybkVXIVeMingychmBQSJQA34kJIaPEtOcm/iehsMSn1ihDN51SX7zgVu+/9Px8zb/o8kYpxzt6heHpi4jL64ot1TFC5oKrAgUBpthDwXtR2supuIvJAR9VNH2ea1EY5MCvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onV3Igl2TI+BzyyyLln/oXxujPwDe5TMz1+dKgoQ9H8=;
 b=s+ecmMCqHibXe4fgQpUFmP7p2Np5C+WzhGnwuidtGKZ7079mZEs+22ePtwUAwlctyKZiUoW2mvoN2qcW7oaHVBjw5PF45pQsc5cEOOxabz2jbJ8kj9PnwEsF1/LPoQ50Y7S/0xLOH4kmR1V1RKYD6TbbJGbwekJyX1hW0khpA4Q=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:16 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:16 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 05/17] configure: require cmake 3.19 or newer
Date: Tue,  3 May 2022 10:16:46 -0400
Message-Id: <c5ddf3cc02486a0dbc965c8bebab79aa75383a4f.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1228a370-6f4d-4f17-c648-08da2d0fa05e
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB33584AC318D2A6280AEE7CB390C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uiUws35EiAC2J2tbjELMzGRXDH5hzEDaxI6lHR2dzsRZAmOM/DUkKwfpAm/x2fi2sPM/VE2zL6hOvOJ8pffsSAa4N+NX1NWM12mOFLoNKdZxSHi3qLmr7BZM+mqCLLmmN3jQj1b//3Izg/buSczeqaWfgraeSALq1mED+bpzNzbr6l4UBwuSRxGcl7+uhFRHMs1+qsp1nvncHO1YbWKTrBmR0w88Xkggs2Bsj/esMei6qLScWSGStXtECLzXPxiFxedzXpKe+iVnEHNSww5YO9lmrEj3n/e5bzGsb/tW7WIC8Y/t/slAyuWWwQDM2w/QfPvgYuhaqwOf5EiuR98zOiBdJ04Z1q6o303rOO+iZLJWqdZm91Rs1HalVo/bosKafba+dZGkPBYwDGi8VMvDhvxcrlWzzraYQf8meHEfWqId7VzahDR91wircsswZkDJINa6IltTWjJZNugBmMFPYYSv3R8fbSVJt2nLdFC/q0lxAFnItzfjhzQfpEByMx3/02ScBblA6KdmviPNuL0VddWVLkvLZJqLEdaJ4AoocJEBFuFF/bEcPR4/hQVBgGojIAnW6zce3Mv6wOVXTxR8J27Jc+FsUFcYFQ5OR92z0Bgeq4D0ep5LgQVMPXmCRlSDMcx4RYnM5nnoRXDyrMN+TI6o/HpYYb0RJdvflAvNaukiQQMYh6vHBO4ZUQkDHjajas63W/aWo/qWy2uPQ9f8Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zVpQpHGjoTueqyoMvGBcDqimxaCGv/6j12WalfeFIuTULtfyEnux1kRzdonn?=
 =?us-ascii?Q?Cui3cGVCItCOIFfzMcUyrEqZRZU295UGIa7qMZGskw5Nabv1p8MfOrfXL6/3?=
 =?us-ascii?Q?cibyGd5UVScSZkf0bbkVwjVTERhJuava+ktCpl0WT67+rQVJnspu/93ulNu3?=
 =?us-ascii?Q?2LlaiyFhQz4lFaxuqO9sEL7+4/07+E3KuPGewQTzG+o2gu29Pkh+CRvu9a/s?=
 =?us-ascii?Q?Y8zZr+dwXlaGifpHfJezj/HZCsrVdWGCTERUONuNto/KPQ/l9s9GeJig+6uO?=
 =?us-ascii?Q?e901dcbsAWEANPGQnJ70KGvIL85ANAou7MiVl+60y6doPWjhKjkvGyn/jlDR?=
 =?us-ascii?Q?YZ0lQPyF2+HQ+WF8CtztNIqwFzRCqFYuwtn4Pu20Ac8y5K2FmwPZ399J4HRS?=
 =?us-ascii?Q?Anwd/78SvTWd0gQep8s2bxiLKTrBRPUYceWN6ciqG22pC7S+0vUCi1KoHk5U?=
 =?us-ascii?Q?4lyZW4tnIUR40GHhqLpUD3XrB9JM1Yty7pzefUgp5+UUcnEsL1TIemtqmHoU?=
 =?us-ascii?Q?+UuPZeGkwej8guMIGvXvmhqQCQ70qkrhc9SrFAC5T1duvq++SZlfNF6RIQkA?=
 =?us-ascii?Q?nVWIVW1wBoMy+Q9MjctLB5PncZ2kmjpsax4QE+iSu1FgjlXbSo4LFTu1G71M?=
 =?us-ascii?Q?ph+LXl4bOpMlblmRCOZHuTGLLP8MwQcF9eeRvnPbqcmu0S1vWXsq9coHKb9q?=
 =?us-ascii?Q?13+co9YLvYB5zjgzhAjafWisnpdq+o1rUN11tjISosZcCQVA88EKqko6srWC?=
 =?us-ascii?Q?QkKKegwnFKfxfU/XJ5knJ1IBqnYPqeo68gASkOgtFnd7RmA3JfKWFouhd+3W?=
 =?us-ascii?Q?Zno2KHKkUtr/eeNTFi/34CH5VJum1iPuEmV6Fb8EhbVhLHL93LsQPryNRkzM?=
 =?us-ascii?Q?nRSO5cZCYblAYqO3bMhsGx8IhhNeYjIbpUjH4ype+KZ4Wn0L0qICzHcyEZz8?=
 =?us-ascii?Q?R3NRZU7MF4vG4q7F0IIMtWkkTsiJ51TMgtboRDd/uEXW+bGlyKNJg3KNR+Ap?=
 =?us-ascii?Q?JiFuQmYFVs5ATzDrzrhN/q2v5wBEx1okH5fl/jwG37sM9DP9pd6coa8wd9DH?=
 =?us-ascii?Q?qBiXMuuHCanP3PTpUin3soqNRJiYNJvkj1pumaDxAlCQS+ARBoDW9xhUYmXT?=
 =?us-ascii?Q?CfZCQNsDeYaR6FwUB18sB8qKCB/wtsjGw7HeZXaDn9x4CFgYdp2lI1PjxNt0?=
 =?us-ascii?Q?8JbwjxhgDpq1gQ2aZZxIpJXhZFkreKikZwrT5eBW36u8qzFM2XdehgwGgD9+?=
 =?us-ascii?Q?LEMwd/zKzdgw7r8CVL2q4XsNyj1L7hsMD5OcFAD143hEgMkt4jEupDW3G0cP?=
 =?us-ascii?Q?yUQrJECJXY9tW9crBgpEcHzleNRb8WHj7deNnjGoJDCGktgesF56Wo8fajWP?=
 =?us-ascii?Q?R5KLu5M/4YhmgaWv+m8uK76aF6UksxAqC2akhXnELR35HRdySvug1eogpGCp?=
 =?us-ascii?Q?s8fbmGVizGOIdM/Y7fay4yjZzlYvBgTsk1+CpjzcZOPxlu/R9cPLCrx2inxH?=
 =?us-ascii?Q?tOm7bEx/5ivYkdo1m1pOEVm9tjr2OvKpUGstgVuxfU34PAv4AZlR8bW2MIMP?=
 =?us-ascii?Q?LQ9HdqQBCherFVHp5UoLauGXk7nRKWIZ0mGmFKuUH7mFDGATJZSeooJl/hvQ?=
 =?us-ascii?Q?bBbjXV2qhV6G1XXSMLyikHVGS/vclC56uSFbydBjGQm+1AkoYp3RbEOwqUsr?=
 =?us-ascii?Q?Bt7iGgV49yxAZ+R9XP4edB8FRhkZjaH7zqnhZ4MhvTBbdiN2vWvqW0aHswxm?=
 =?us-ascii?Q?KR/I8/o9fg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1228a370-6f4d-4f17-c648-08da2d0fa05e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:16.6702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENjeAAPasvzNCOXFYPXbeyAYtA7QbuduX4/BokWfwr6ztT3gbSuz0Bdokm8TLq9bYtxU0UBpr4NWgqU5B8UwQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: 5yRIilnZvv0l2irsf232ItpOisny4Kg4
X-Proofpoint-GUID: 5yRIilnZvv0l2irsf232ItpOisny4Kg4
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cmake needs to accept the compiler flags specified with
CMAKE_<LANG>_COMPILER variable. It does so starting with
version 3.19

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/configure b/configure
index 59c43bea05..7cefab289d 100755
--- a/configure
+++ b/configure
@@ -249,6 +249,7 @@ stack_protector=""
 safe_stack=""
 use_containers="yes"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
+cmake_required="no"
 
 if test -e "$source_path/.git"
 then
@@ -2503,6 +2504,21 @@ if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action"
     exit 1
 fi
 
+# Per cmake spec, CMAKE_<LANG>_COMPILER variable may include "mandatory" compiler
+# flags. QEMU needs to specify these flags to correctly configure the build
+# environment. cmake 3.19 allows specifying these mandatory compiler flags,
+# and as such 3.19 or newer is required to build QEMU.
+if test "$cmake_required" = "yes" ; then
+    cmake_bin=$(command -v "cmake")
+    if [ -z "$cmake_bin" ]; then
+        error_exit "cmake not found"
+    fi
+    cmake_version=$($cmake_bin --version | head -n 1)
+    if ! version_ge ${cmake_version##* } 3.19; then
+        error_exit "QEMU needs cmake 3.19 or newer"
+    fi
+fi
+
 config_host_mak="config-host.mak"
 
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
-- 
2.20.1


