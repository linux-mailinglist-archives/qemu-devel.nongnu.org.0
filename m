Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B733A475C20
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:47:13 +0100 (CET)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWUq-0003i8-RU
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWK4-0005Fl-Tv
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:06 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWK2-0008Sq-CV
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:04 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEYwBb008125; 
 Wed, 15 Dec 2021 15:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=ORTJgFGThi1I5c5bQEIkd0o1YYX+KOTuAhGQ4CaypUA=;
 b=OwB3wNxSfMC71nyFo6SA4hstMwKKtRTW0be0byFMdDXc1KGIugtdsgqVP7owTbYVhRJ/
 cGwWmwwkRcAGFB3aWkluv5H20lHG4mTnPZKZd8gcV4Uo2XJavWYEuRnanO/4egTXaH8f
 /a65EDDJbAEvNqwTtt44+pyyytNBCRBPACTDO/dzN7m1Bf3Mf5rkzNYmRd1dUrSTsMM2
 b+vAckAKzy8Gb6JMype1KIab2+XfOwscYV8XOT3RyTBNZFQj/ELdJxrpC/PZSTQkLAwS
 7eQU6du3Jfsd5/nr8ojUAt30o4h0EWKXbRFDiBksK5dYqMQmgIhypBaWc0JaEfk/rgx/ gQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx2nff72w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:00 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUTJp083868;
 Wed, 15 Dec 2021 15:35:59 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by userp3030.oracle.com with ESMTP id 3cvh40b2e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:35:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXoxKJlVFhZX2LNvyEao0xpbEA3I4tWms3obCQKOh9DQuZUycmrvKKOVtZ4FNpu+oP4RU8boVWIeOQRwCLeM5XMSYOzyfLLhDC9JUbzH1lnfg/yvHZh8fCZQIC5j2hpqCz7vWmwuqOVZKCf+PnlVjGmegJIzHhaZP+WPEvWlMxSR1jdgi4vMkHc4NJZLAN4+a/W/pAovnKpR9rcgNQZM6mlfZeX7UdpieNGlr4dbr6VwQO5/ROcYpv5HCv2FfHSLpd9we2e/42l+tYN/oFvNj1K0oCaF8IP1AOQjirJ6IPoumOLLjfYqwVP2XAuygWTFKynuRqswiMDp48DmpLxLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORTJgFGThi1I5c5bQEIkd0o1YYX+KOTuAhGQ4CaypUA=;
 b=Ixra35p4iQC5/QlCLhrH/lYXnoWPOXBqQwQ3tHKgP7/RsODtUcwYNrATm9oOx6rQwHdxsTxALbpznA80/v2lAUoFbHpsK0LF0C3mek5nfzrf9n5L+sCDCf/oZ8DApmTIq5q4EqHXjzsUyiZ+BFiKdFGVo34OicLbFrd57g8b34xC+XKvZs6Dmfq8M8XQsa4m66WVdP52FyPe72bfg0B5p+YbyvgwGyTx482/xTr5VDyNaszyPFCHH1T3DUlFHY6ViyiW/qr1uPbSXbM5xKyBotEfnBaXMUm3Jj+6i25ypbOa0vGBKa5btk1h8I267L7yzeaIMIw3VfzfNY1KTgbFGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORTJgFGThi1I5c5bQEIkd0o1YYX+KOTuAhGQ4CaypUA=;
 b=e323frkQNbnjb7g2QIDIT+2A+mv6x1QExyYJQHjCDYZ4xyi/xJbOBslOY/ffuLAnwhZpfahcgUS39halrc6pf3U9brIM3Vzs2OCrBxK7kYe57ROnkjgPZ0SCswMFc2Y5XoMnvU5VABiYCuMz8y84ZuWD2PcLjAYrJgi+jdrPLZM=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4094.namprd10.prod.outlook.com (2603:10b6:208:11e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:35:56 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:35:55 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/14] vfio-user: build library
Date: Wed, 15 Dec 2021 10:35:27 -0500
Message-Id: <2e3a3054ebc7ff9ce0d1cfeb42a73acdf84fcf9a.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7405f74c-200d-414d-6fea-08d9bfe095d5
X-MS-TrafficTypeDiagnostic: MN2PR10MB4094:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB40945E662964058BB8F5362790769@MN2PR10MB4094.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yeLLzUSMQavUJvbzqDGQYFqLlnkHb6/9oDFNsMnucPKkawwBSgvNm/I5TFiKVkOC9LIRXfTEbhYu6XkCQ5sVz9n0F5WrXIx2e+Nj7gbYRJTEVNQX7Ws7ImXAz3gRPZvWngq+1QTXOKDcfQiXUgNAhBoaLdgyqRSrls4qH3oTv1EuFtCJym2AuP1toraE7QbenoW6jFRHBps+r/PRmU6L+WRyGAIjUFvIndVM6/GhgaOL1MFGXk0NKBJDU3i8BKe8hgWhJWya2FgW0Hgaotg/8addHc1ppzKJ43KJlp/tNwkGtGUof033ij2k70qzS2kwA6zMMYhwcaGruCLZ2nhiLh60SXSAlQQW0B7uOALSXcN2pXpXPxlARfnUjWc7J6ScFwYwPTzlYbJaU0XD5OuRNm/n3qiJSJH6n8EqbklojjYBg52xFCN1z2TWhpDnq0UMr5IkPRL8jH2i2x0gRABtMDrJn1x/hRAYEDowMPA8zumgnawBV5Cyvo2RZLOhwkmrgstgViaDJvx6owtMhUmOE5LKozHvWLbcUx33SwvH++sRUAPyrXNXEc55xa9zE/4PwKzXqPUV8WXad8kz/FjOrMqP5gDgfveTxPPxPWfVok8pKUVtzaImTT2BUQCe701lO/+nfHdCvsAvz6wzoP/7KbTkTD3+e5g7kOtdgk2tNifJI/1Rhdo6b9C2RaORCmSSgTQXm0sArxXS4VsLuHj2HRU2vIiQmFoCyNmqP5yVVBT7VhJR1TFr/uuqdOoXdA/y3V4qpl+t9naS0+cWcsMgbu28utqr4AOrczr2dufIfDO9iVcUaDScBl8vNh8hnWNmFxQ6uncXCmwG4zq39eo3xkM22ZHd3mW+WqISHaP3K4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(6666004)(52116002)(4326008)(2616005)(6506007)(86362001)(8936002)(6512007)(5660300002)(966005)(6486002)(26005)(30864003)(2906002)(38350700002)(6916009)(38100700002)(316002)(186003)(107886003)(66946007)(83380400001)(8676002)(66476007)(508600001)(36756003)(7416002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9fEG8N/RLiiohmsjxVhlkSAITnJtR85p9dgvO2bu/7ylCHY3sEr8hN4rkTKQ?=
 =?us-ascii?Q?F9q96KzLkXkv1XThwo2+CfkxiF5jT3DafDY/O5GNXihhtnsKVyQjd7EKiYoD?=
 =?us-ascii?Q?vctNnsfxrIobAO5nPF2uoJxd1AZbQQJjbhgkI0griPPOz983DhfrcO5qbZbk?=
 =?us-ascii?Q?6YdgJsdHSOYdf3+TpPWis80ygZZbcTdaO91zV09gT14P4MBls2HvW975voy4?=
 =?us-ascii?Q?HONHi9drpmY4yYq5I1+gSQZ0fabfbSGo8umXhZehaAaumzVVfTqctJAPvzNW?=
 =?us-ascii?Q?ofjIttC1FAXEyuP95mOj7ZeDFzEdJrbXUnF+3MFJJa/ID01lFcxhFk3A3A70?=
 =?us-ascii?Q?MUuvkorLWns48CgIPHzTNlabzgYRZoof/u0gBQnuW6RjBdm4s117hEGmWqr7?=
 =?us-ascii?Q?pwtxiuNO0Fv7VytSQWq8RegjHV18T9IfGe3jVZP3/R6KwonSuG8QuX7910Fq?=
 =?us-ascii?Q?xYizMrnEsS62dM/8Ip1cZ+7W/BOWxpZLro4c5YEXNwXIrpviRdgjv8UVPWsk?=
 =?us-ascii?Q?f6SV/a+lqo3JcZZNPWfCPMLak5DiiXWSyEMoX4bLwofRAhQjXtYZvueJuyPM?=
 =?us-ascii?Q?XRd01/iJdOFcwPTQ/XRG7/63Alx2JdZm67ec/oGfead9/5kSxr4MprlMzn22?=
 =?us-ascii?Q?DYA7WdhNW45NIoGbuyb9oOc0m2BzM99O7x0UZMdUBb+KOY7gY+FxAo52vJ5G?=
 =?us-ascii?Q?tvZj7RxrHyjwzVjc6kTzPVY+Wts6T7etuN/e4b2ZpprkA8xzR0Zea5ERwUyZ?=
 =?us-ascii?Q?hs8Ax2slab8ZxcBvxKbPYrVaswZ8tyXPSbN6pdx9/03YhTLe57w9BdhtjxLU?=
 =?us-ascii?Q?zCh3482aP+oamF9Yx/QrIdeJt1xlVXCFqBWdophUe/pZJbsKgiDuXtgNcHti?=
 =?us-ascii?Q?O4TZKCxQP2xBXM2ShHnfjxG8x4Ag5tsg+gNRstdYcuvaknQsGc2uZwSvjvhe?=
 =?us-ascii?Q?4gMfuv5OxOOEBsyq8pZnOmUiKpEj/kVHMXf8lUzibD4ZTHj67/ahmszk8Jwi?=
 =?us-ascii?Q?+J7L0tGlvS/5rSgnUth9mkv0VEA2wryNwP9eg1VMi95+irh2jR50BYyX9mO/?=
 =?us-ascii?Q?k/IkjVQRvwhQTDWnBK+42koQ6TnjOqeofDjMrqhpzsq6Y4a00HnIKcHmZrdZ?=
 =?us-ascii?Q?HhpmIwjYaux8FMXho3aFGnS1aDrJLanH0Xcibye7jHUro72cysccpdLfSmPn?=
 =?us-ascii?Q?ubocVOKKjOLAdzJG9bKcHx/qQQ38SFM4x+MiiaaGgfW0OfKMTPsIOetaRhxe?=
 =?us-ascii?Q?elITwFDUxwtU9EpljMCMpdC3PdYKqz8sOMPx0p78rBas1XLQ45SZUVs3OZmj?=
 =?us-ascii?Q?RUpoGnRYn7qBBcgB/ToCE57s1RgTChWo+oCXuCzteQzuDBoA0006XmP1cGlb?=
 =?us-ascii?Q?QILhEA5i9G5fSD2JcbYUAhcRDpRt7q66RBb9B6BLFLh2P0PeCyReiFyvurJ4?=
 =?us-ascii?Q?sNV2wSvEPjDKYIearluLEohv2MmNSlz2C9ONIAUfq0sWrWXTGR7F0N1SC+dL?=
 =?us-ascii?Q?O9+QZduTQwDPw1Dk0r0zCR0dXQ6BItWFKPm1Fhd5B5xpYU1rsvJgBIBxD1vK?=
 =?us-ascii?Q?Kuylw2++PqRlNyeebNWd+6VWZAM0GHbt3QSHYqjfhPf1lzHTy89zzOq3nFxm?=
 =?us-ascii?Q?nXoKDO41/wcY1NcW0HBJ+d8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7405f74c-200d-414d-6fea-08d9bfe095d5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:35:55.8726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tTLZ4lRYS+4eF4t7BotQw5/oTANhuE2IpEdU9X6zqp/90msJsVbdPvbJlXGH6JfU06rw1LF2ZoaQ0Dwtz2hzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4094
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: 2GSTVXy06AbjaQ8ycClTu6W6t3wBJFai
X-Proofpoint-GUID: 2GSTVXy06AbjaQ8ycClTu6W6t3wBJFai
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add the libvfio-user library as a submodule. build it as a cmake
subproject.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure                                  | 19 +++++++++-
 meson.build                                | 44 +++++++++++++++++++++-
 .gitlab-ci.d/buildtest.yml                 |  2 +
 .gitmodules                                |  3 ++
 Kconfig.host                               |  4 ++
 MAINTAINERS                                |  1 +
 hw/remote/Kconfig                          |  4 ++
 hw/remote/meson.build                      |  2 +
 meson_options.txt                          |  2 +
 subprojects/libvfio-user                   |  1 +
 tests/docker/dockerfiles/centos8.docker    |  2 +
 tests/docker/dockerfiles/ubuntu2004.docker |  2 +
 12 files changed, 84 insertions(+), 2 deletions(-)
 create mode 160000 subprojects/libvfio-user

diff --git a/configure b/configure
index dd000ce299..7748802d11 100755
--- a/configure
+++ b/configure
@@ -366,6 +366,7 @@ ninja=""
 gio="$default_feature"
 skip_meson=no
 slirp_smbd="$default_feature"
+vfio_user_server="disabled"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -1190,6 +1191,10 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --enable-vfio-user-server) vfio_user_server="enabled"
+  ;;
+  --disable-vfio-user-server) vfio_user_server="disabled"
+  ;;
   --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
   ;;
   --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
@@ -1470,6 +1475,7 @@ cat << EOF
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   gio             libgio support
   slirp-smbd      use smbd (at path --smbd=*) in slirp networking
+  vfio-user-server    vfio-user server support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -3250,6 +3256,17 @@ but not implemented on your system"
     fi
 fi
 
+##########################################
+# check for vfio_user_server
+
+case "$vfio_user_server" in
+  auto | enabled )
+    if test "$git_submodules_action" != "ignore"; then
+      git_submodules="${git_submodules} subprojects/libvfio-user"
+    fi
+    ;;
+esac
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -3998,7 +4015,7 @@ if test "$skip_meson" = no; then
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
-        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
+        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp -Dvfio_user_server=$vfio_user_server \
         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
         "$@" $cross_arg "$PWD" "$source_path"
diff --git a/meson.build b/meson.build
index 9702fdce6d..339c28ee25 100644
--- a/meson.build
+++ b/meson.build
@@ -252,6 +252,11 @@ if targetos != 'linux' and get_option('multiprocess').enabled()
 endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
+if targetos != 'linux' and get_option('vfio_user_server').enabled()
+  error('vfio-user server is supported only on Linux')
+endif
+vfio_user_server_allowed = targetos == 'linux' and not get_option('vfio_user_server').disabled()
+
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
 util = cc.find_library('util', required: false)
@@ -1824,7 +1829,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2201,6 +2207,41 @@ if get_option('cfi') and slirp_opt == 'system'
          + ' Please configure with --enable-slirp=git')
 endif
 
+vfiouser = not_found
+if have_system and vfio_user_server_allowed
+  have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libvfio-user/Makefile')
+
+  if not have_internal
+    error('libvfio-user source not found - please pull git submodule')
+  endif
+
+  json_c = dependency('json-c', required: false)
+  if not json_c.found()
+    json_c = dependency('libjson-c', required: false)
+  endif
+  if not json_c.found()
+    json_c = dependency('libjson-c-dev', required: false)
+  endif
+
+  if not json_c.found()
+    error('Unable to find json-c package')
+  endif
+
+  cmake = import('cmake')
+
+  vfiouser_subproj = cmake.subproject('libvfio-user')
+
+  vfiouser_sl = vfiouser_subproj.dependency('vfio-user-static')
+
+  # Although cmake links the json-c library with vfio-user-static
+  # target, that info is not available to meson via cmake.subproject.
+  # As such, we have to separately declare the json-c dependency here.
+  # This appears to be a current limitation of using cmake inside meson.
+  # libvfio-user is planning a switch to meson in the future, which
+  # would address this item automatically.
+  vfiouser = declare_dependency(dependencies: [vfiouser_sl, json_c])
+endif
+
 fdt = not_found
 fdt_opt = get_option('fdt')
 if have_system
@@ -3301,6 +3342,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'vfio-user server': vfio_user_server_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 71d0f407ad..e29f8c1f13 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -42,6 +42,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
+                    --enable-vfio-user-server
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -142,6 +143,7 @@ build-system-centos:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
                     --enable-modules --enable-trace-backends=dtrace
+                    --enable-vfio-user-server
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitmodules b/.gitmodules
index 08b1b48a09..cfeea7cf20 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://gitlab.com/qemu-project/vbootrom.git
+[submodule "subprojects/libvfio-user"]
+	path = subprojects/libvfio-user
+	url = https://github.com/nutanix/libvfio-user.git
diff --git a/Kconfig.host b/Kconfig.host
index 60b9c07b5e..f2da8bcf8a 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -45,3 +45,7 @@ config MULTIPROCESS_ALLOWED
 config FUZZ
     bool
     select SPARSE_MEM
+
+config VFIO_USER_SERVER_ALLOWED
+    bool
+    imply VFIO_USER_SERVER
diff --git a/MAINTAINERS b/MAINTAINERS
index a8fa61a20d..e0daf349ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3464,6 +3464,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: subprojects/libvfio-user
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
index 08c16e235f..2d6b4f4cf4 100644
--- a/hw/remote/Kconfig
+++ b/hw/remote/Kconfig
@@ -2,3 +2,7 @@ config MULTIPROCESS
     bool
     depends on PCI && PCI_EXPRESS && KVM
     select REMOTE_PCIHOST
+
+config VFIO_USER_SERVER
+    bool
+    depends on MULTIPROCESS
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index e6a5574242..dfea6b533b 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,6 +7,8 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
+
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
diff --git a/meson_options.txt b/meson_options.txt
index e740dce2a5..3c2d73481a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -66,6 +66,8 @@ option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
+option('vfio_user_server', type: 'feature', value: 'auto',
+       description: 'vfio-user server support')
 
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000000..7056525da5
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 7056525da5399d00831e90bed4aedb4b8442c9b2
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 46398c61ee..646abcda1f 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -12,6 +12,7 @@ ENV PACKAGES \
     capstone-devel \
     ccache \
     clang \
+    cmake \
     ctags \
     cyrus-sasl-devel \
     daxctl-devel \
@@ -32,6 +33,7 @@ ENV PACKAGES \
     gtk3-devel \
     hostname \
     jemalloc-devel \
+    json-c-devel \
     libaio-devel \
     libasan \
     libattr-devel \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 39de63d012..ca4dff0e6b 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -6,6 +6,7 @@ ENV PACKAGES \
     ca-certificates \
     ccache \
     clang \
+    cmake \
     dbus \
     debianutils \
     diffutils \
@@ -44,6 +45,7 @@ ENV PACKAGES \
     libiscsi-dev \
     libjemalloc-dev \
     libjpeg-turbo8-dev \
+    libjson-c-dev \
     liblttng-ust-dev \
     liblzo2-dev \
     libncursesw5-dev \
-- 
2.20.1


