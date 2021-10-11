Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32942863A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:33:58 +0200 (CEST)
Received: from localhost ([::1]:39604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZnwj-0004yI-39
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuS-0002Rr-Eg
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuQ-0003q1-AZ
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:36 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iPBL030032; 
 Mon, 11 Oct 2021 05:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Zyim9QuNHEqDVlxVK7EPfZw+NgSgJcYDNm2FKNOnaXk=;
 b=v1tj6ZH79mkwlzaDmBRCoi35aJ3XX5yvMhYslla4qhEmVV1Hn49QPeavGmx75UVQUU74
 B+wjTFcya+G/YK7TPzzXycGSSrcOp4Yj/9bONd9aNUKKotjX5ZN8VB7KD65BXesduAZz
 VaS3EANSjSaAcekh0U2pT0EbGO1ezvg4b5Hr7wUpqmacOfScbOczmYjCKWFMqFgJQ+qc
 ZFbQvo+i8BmpNBmAEw8voGnPA2oIR04tcCtsCH6bFNjntn0n+c1xPoNaFheFXGEr+ixy
 vHSxIu25EMSTiBRAF4bm/JuNG8yd/JT5reGa/qrsGDlhwgaCT6PtSgi8NDOJT4SOH5qN SA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkwyuhw13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5V2Es123636;
 Mon, 11 Oct 2021 05:31:29 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3020.oracle.com with ESMTP id 3bkyv7nt3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L52DAoI+Pr7WBgQH6X8QjmsvqcgTs4dUf24GEavkYUisiBw/a99K+sTA5PF+V19xb1kSjNXEOqXOJgdjVu1lbRLaHk6C81QpM/xsQdhZE+Py8mlNqPqODVBS2JasNFA3FdOaA+05XofIKO0FfahDI0Tn3sssUC1cW3zKD3NwgNbbsnCz2V9F6Qn5PZxEz0pLXCJMyQ9f6zMQFAikfra4gbUn30YH6K8eWFOp2rquqQ58ZNU+h9Cr1xuBaYQdGJGAC1X+CYAUDRcEZZmHAIE8EctohqN0ENt30IXsu0sifBukP0mPYZy42ULaH+dE+tv4raoBskMgMUi+zuZBhVZ4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zyim9QuNHEqDVlxVK7EPfZw+NgSgJcYDNm2FKNOnaXk=;
 b=WcAfFgCWqvGCGgPLBvdJXrr609n+lVuTgk5pN6jFBlfrpFPMMNvWILZTIy61gOsgVB+TIE9wBftcYJGCCsVOHdO+TU2srHBHbuL8QMbhcVC1V5o6/hDbkYmqIbobPUYlAjpmNovuq5AUNJhCD0kywHNqIx+t8AhGav5QyhzF6MuFApxW9VoxkHeHKf6DaUSweldlurGLNE7X1Xz4tydD4+UZXcALWJ3SbhtUTZSPnfO+tYPN8JXlrLKTGIR4B3Dxeq6NvGL+qGxnqaDboZqaIgSrb8IJy631gdEjU9UZX7Zy/Kn1KUYHN0HJmPcy96Pbe5Wft6o8JmQJlKwMU07aOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zyim9QuNHEqDVlxVK7EPfZw+NgSgJcYDNm2FKNOnaXk=;
 b=P+OX1yHjULACoIw9rHsdRrbJ2MS3mZNEYst7AAyBV0+HRXo5VtuaCy5zKW7Hpy/MskKuZUZpTrPFs0fqST2D00RWC+VApMyWikTXFJy0eOLwsCtc0Hgbc/ySLbfaf9X6YfzU9N9hyWoLwIsmZPakFYFikT6QhGTiFRAL15RZks0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3902.namprd10.prod.outlook.com (2603:10b6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 05:31:27 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:27 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/12] configure, meson: override C compiler for cmake
Date: Mon, 11 Oct 2021 01:31:06 -0400
Message-Id: <e903ca2df5d9bd22438ceeab9ae1a48083bb0db4.1633929457.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1633929457.git.jag.raman@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
Received: from jaraman-bur-1.us.oracle.com (209.17.40.40) by
 BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:31:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ac2dd62-acb3-4fea-998a-08d98c785f0c
X-MS-TrafficTypeDiagnostic: MN2PR10MB3902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3902EA3C7011D9F87884828A90B59@MN2PR10MB3902.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pqf+WmSiBYS4J57eOE7+1ywkn57I/WzeBUGh1tmj+RJ9fcX2vJdY2KJJmGAyXVjQsY31mGshzMaG1HLqkVVAr2UT+EoimoZLFEc4rVbeUz5euwnlNqAPjxVuSWJA9m8RBTOMMLKXNR0OtatJ+YHqESQe2rafEZ2Jnc1ufVXrPJqCuWDWcjHLwrhJfouOynA0XcMc+hAke6wOVm56Q27QHrq5X3OO32nrCaGSUop5qNHK7oDcdZ2Ngbxi5P8w66Bq8KDFHf0om00xZtANr44c4WVfWqhvGMY7sDAek8aImIOUiH4kG7yzlHHZf3gTxEl+215WR9rX8auRuGHa3848M7cr3TeF6dFriasSIIZ9PGF2/G5ZIg5AUbBewqHV+DDi+2624tEc5edozOtIDkLNIe4PGulJMeaF02g0yyDCkCu3dIYTgLDYrHT8pxe+Bzm9gcm1OpzTLycQ1skEkB9U2ytWZcrc4eLV2Ushy7C4jS1xISkeZhEacKjBrzvh5rMe/syISVGSFDbjYfWBMjNYFM48p+QRBMgR+19uIaxIKRfB6rsyn8WT3Za0AzQm9eAdOskzDN7HD9KE2vfffeoVYpYRXICwnGRkG+jXEYVpmjjzqxhCwVGZZ3OK5snZjWCUyx4jTvSDliK3qUDDT4PsH27Hj8KUARp8Z3H9deAIg5UbAT9f/KSniw6wJGDMdeY4WoB4y2FSWeRbHfDKojOqnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(6916009)(6486002)(186003)(508600001)(8676002)(7696005)(26005)(2906002)(107886003)(52116002)(316002)(38350700002)(6666004)(38100700002)(5660300002)(8936002)(86362001)(66556008)(66476007)(66946007)(36756003)(7416002)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gvijXIEJ3RYvpnApzIM/usWseq1U1d4pOp1Sfp98iZ731qSbrqxlBVH16Fb7?=
 =?us-ascii?Q?8xmwPt+CtyPfsY0ILFupAzpKyCFVKxDqjOPMpYYmpSh/+VZnc1E/yLC70vOR?=
 =?us-ascii?Q?+aHpFClcmpVucnF7Syk5fVbWSn6PHTst2pGO5390p32kJWwDZGIXFXE+HXwV?=
 =?us-ascii?Q?5LbUzlJl9yfWA6DNUJGfzzKDbgzTilZJlbEdQqNZw5u/dc4vA5ti5rNQtFtr?=
 =?us-ascii?Q?JrLE77QozRyPF0iNblGIEvTTgzL7GJKRc6/6e4+xilMVnsgT+Ly0XoOyBiw1?=
 =?us-ascii?Q?5OrMYqc1pZEYZMZHnuXH+vRv94vjoTH/GLWwN+swJ0pc7hOOlDXxumIJ2FIu?=
 =?us-ascii?Q?6JV1bU5elIlWNHH95HTGW7lFLovu1S96+zpR8cz6B+kFHcJwyrh3TVzTiO0c?=
 =?us-ascii?Q?alTwF6Vomv82oP1AuPsyhi1J2+qFVaOrRPduFS+s7hW5BcOD4Yorfs5mgb2b?=
 =?us-ascii?Q?rrDoQoIXTMmVu/o/pHNM9VJYGYcJFYSF2PHGDIKuCpo0L1OKHak38IuMgzm/?=
 =?us-ascii?Q?+50F0Ami1bxun0cMNV3K/MsbPYY6218hmVauxhIasbEyhDhm4o+5M8UGkpVl?=
 =?us-ascii?Q?qYGB2TSVvxqAlaYRf4Y8f/qvB4AMn1ViyaOTmJDiKdWFAieIE0IhJQuA1g8D?=
 =?us-ascii?Q?GbX3+LMxwn0p6UodvjTyQUxoozss78owXk/VkXZL3SjdUCFExIyW9IGIvZo7?=
 =?us-ascii?Q?/Hy3JtLv2xcirjRrthEStmeCaWOvc47JseP1oJNzX9weXTZ+dRFhFNxNHfe1?=
 =?us-ascii?Q?AZWuyHKLcCB78AfyPr+449TmiZshWJYfazdkaoZMKUsVnoE6+wl5kSRODod1?=
 =?us-ascii?Q?9m7gR11OgKx4M+gCuthf/yIR2uXqbae7k9xYbKisJCphmQSUH0LUVTVt1SeP?=
 =?us-ascii?Q?TKHCzSY23PUOOfbzmzVYOCEfk/yQ7v5fKagmItEhWn4hD+IZl+tZ5p2mhkgs?=
 =?us-ascii?Q?2eOJyRNv/EGzlMbBlDbC0h77G5OH2/m+54dLP28gPHBJc23+oo/jA6tAXjyE?=
 =?us-ascii?Q?XlrXSqAtNsc+vZ87o3uLAdkAHhyeLklUn5G2im/97/lYA/lTXrup36e8EA3u?=
 =?us-ascii?Q?+VKO3aQ3RtLNz/n4C1aygBUNs35i0DhTIvU96NVxSnm8wRcQvGY5/Bj43JXI?=
 =?us-ascii?Q?QDBCmZr1QCw2anvqFsfZ2tJmJ6cOdeETPUaXwaTlyMHnYF60XXXpseL0MjQO?=
 =?us-ascii?Q?3uwQAOA+4JAQqWCVYbzFbZ/7sD0r9LCS2p93RqQBrAtVEm1NqK6eoj3MY9v5?=
 =?us-ascii?Q?dbSqe8qHkAL4HFwiNybsIg6W8cV7v9wpPyfx4pYkekO+eObStGmu3DMwTx5l?=
 =?us-ascii?Q?riYdssD4L/2AIIV2X2ecTmUH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac2dd62-acb3-4fea-998a-08d98c785f0c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:27.1099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vb8DY5LQvHCZ21JNH4rWr5lI+KTuz4L5qChNhkwNYbuwrbRQKtXjoUFXDkXLPjKxXzsmn1N9yR3PN+banmeZ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3902
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110032
X-Proofpoint-ORIG-GUID: gIVzPhTL7bPOz0X4tveL38FSYeOxX43M
X-Proofpoint-GUID: gIVzPhTL7bPOz0X4tveL38FSYeOxX43M
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler path that cmake gets from meson is corrupted. It results in
the following error:
| -- The C compiler identification is unknown
| CMake Error at CMakeLists.txt:35 (project):
| The CMAKE_C_COMPILER:
| /opt/rh/devtoolset-9/root/bin/cc;-m64;-mcx16
| is not a full path to an existing compiler tool.

Explicitly specify the C compiler for cmake to avoid this error

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 877bf3d76a..e804dfba2f 100755
--- a/configure
+++ b/configure
@@ -5112,6 +5112,8 @@ if test "$skip_meson" = no; then
   echo "cpp_args = [${CXXFLAGS:+$(meson_quote $CXXFLAGS)}]" >> $cross
   echo "c_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
   echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
+  echo "[cmake]" >> $cross
+  echo "CMAKE_C_COMPILER = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
-- 
2.20.1


