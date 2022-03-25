Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6224E7A70
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:28:24 +0100 (CET)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpbj-0007Cl-Uz
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:28:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTs-0007TK-BN
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:16 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:3564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTp-00035N-SW
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:16 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHPWQC031192; 
 Fri, 25 Mar 2022 19:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=nytIBXWM6DcG2I5/3fupTRGVmzImYALmd0Jniuu/czI=;
 b=OnOHAIJgU4H999I75X+vLpAgBdakAR2bChlxI3JTlMW9la3Npg72mhTlkpN6JLOa3U6m
 KutZ97aWPlq35Hc0wyqkqVKBsrYVM1hAC5sTSpARW/DTJH2g3n6uoXgYJGxlgj3eHOMr
 PgZIAVeKvbjfFTf38LlKI14KsYhHgZYfo4j3m6pV655irN0nm69g0laAmgLQ8vZPuxCu
 muEpk5FFUY2Vrudot5kcI5d6r+1pxNSvMZMo3UOENNOtCK/7VJ9BkoFoaSh3egnWTom9
 aHRDJ6Rkx536pL99IOpeQo6LcRV6w4z3G9O5pQmMQtxrC9QnoOJhTv/qUZrSIF2HvYAn qQ== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5s10507-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGUm7013953;
 Fri, 25 Mar 2022 19:20:08 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
 by aserp3030.oracle.com with ESMTP id 3ew5793v0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfOu2upvTmzAwBHMERGzRt+cuNz4cUbEerpQbJaInKKYL+u/URZ1bnQaZhlu+rSBLqeF1NyvNBgqC+VdgtpzAXFypcj0s4c+NJfWpw5FvP27aRHi38fZB0q3IRn3fwBjyXXzUVVMMDOeGvNyI3ng1zebsK3df+2FLzCXy52eCnCiT7fA86UhJdYLkWW+pJJaR4jKJ6iJ0ZO3QvRW4wFIz3EqCpoglzBFLKAg8a41T1YEvohw7/8Tsav0q9eMG8g+2aXrGnIXYwv8e9QzQf1gcJAxh8U9tlN83jjc2pgj3eQDR37mlGz+2lGzQuKS3p6KfRDizydx7BVbWOa2BDdvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nytIBXWM6DcG2I5/3fupTRGVmzImYALmd0Jniuu/czI=;
 b=FAXxkxAsv0LU2XrTKpGiXmSTEVCnyX2oVPRzFirCByBzmSVjU61kIQMLPcOCe9OB52h9e8vB1pa7acTOoiKMLTWWPTIwbjzghIpH/7jRveScpYJ1Rz5V8B/vY+P7MxWnVeFOE6dkLihCkCKYoaCo6Y0k8TnlqYERDUkG+zXROwMzATnAV7lLq5m2/Xb6sauQ32HVophyD3qFTBUW1HIihCyAO2rHifGJf+OSI82+gtZgvqD4Yx+vbOt5Ca6bX+GoDuMEl1CfsF+9GbBmcAulqaTwmXAX5fOwGIm+p0N12eP87+MzS3aceb50U+n/OCVy+oyvecYD8DOinLizMQFzBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nytIBXWM6DcG2I5/3fupTRGVmzImYALmd0Jniuu/czI=;
 b=WiwBFeAJkYuEfS4VSCs+a1/QRZl1QNtOhwpGOMtCH8xd23XyKq5JKpjFcthqyUwGNMBxOY+Lbvf5d1E3YBO9GgxaqMRzg9p9poKd1Guax+vM1BOGjF0aDPeCydUSj9zp0sAGNlWdS+iGB8eXnoKoMHNAQia2JXcEryRpNwVzHTg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:06 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:06 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/17] vfio-user: build library
Date: Fri, 25 Mar 2022 15:19:35 -0400
Message-Id: <55c83bb6e4550d58fcc53b7e83a7d0de6ce825b1.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73430611-0abb-4632-4ad0-08da0e947839
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB5206891286AE721DDFAEBCF2901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLrXl8PBl7L48SCVKQSBjQIGWrG53dfEOhSnAPsts2NOXqfKA0WIfeICpUaZR8IdzMEMzS2+jZIxfSMCdGJ+df99znLNhyUWozx4+k5oz0iyLmcZ4X0yD4slvhTzY3BtPeTAdK7cHid/Gu/m1MaEDl/TCK9SqrIpClVa1gAYs4GrJW1uUHEETAj94MUMvjziP2mgNuu89Bj9c4C1NFle43EF0HxTvztKdBopMoZAKAD9SDPxoagvA0WAJ1bG7xWlRVQXwgBICpB85pMFMf2aOAE1To5WcbtQfM3+WjjIfW5BtMr6yn3yHe1AK6ynVK52krIbRsjm5YzWhUvlzOpe62i47FnXFQuBPagp8to2qkSE11eCj4xcU2IXh8wZ22xvTtFLIZh2nTCSlBOf7U0N2TefHz2sDWiyU8upw28phh5VVX/ucikSu34koneGs+Cuhnp/Hv6e41Cg41Zidbke1no5jftJNBxLjoiXfvGNkCRx/ZxcujOQlg7mg83cs1gTmRQyBk/mdj9Yn9O6SoaOkVdPADRRUEEirpznuSJpZ7/C+7/rdyBMG2mKCCIXP7+KEXT5O2ZxztK8dykWdx508a/Qn/n+AD5hGVthOrn9JcLrO7ymLh+ngT1bgnoxVNRnHM9hj81dEdq3AqbZdi5SCPrSpUoYEdHv3C3Q66kXC8j5AapaXEax1BM28IN68BwrjT88ZFkfC9fs7ucEhoi5/T+uNBNsIKcdWiehmc6CoOulOvrKae8MoEh+o0aQ876rZdtOZKa/1XyxLWV6KcqoYAtSMVPWkxGTTwylk/UV7eF6WrWf4xsddhtBb8sSS04Inji0CmRyRrOUqYcqe1YpcpE4ONVuXY8c2nn06TrP+98=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(30864003)(66946007)(2906002)(86362001)(508600001)(966005)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1AkcuxWYTC+Y0yhBd6LrSEnWLm1FCscuyKtrwRHgElluafa04pN4+AJXbo02?=
 =?us-ascii?Q?Wp96X/SGpIovp8v9QpkPfQyHfgXTEfKFSg1nUv/e7cAYmTrZ8Du+LCT1o1rX?=
 =?us-ascii?Q?+7vCK58hZa35wHBKNnSdsRlH10bkP7FJ6L/BkgfqUpzap4VVigxKh2uxHX8g?=
 =?us-ascii?Q?Lx+hRgjwAOn2i+Vg7WJ1AEmvv97JNsEtDHIHqAO2o0+2tUYVaq5G/sQsSMHA?=
 =?us-ascii?Q?PKzSeAwuYFZ+owSpB2vCdo7Sohz8hWr1Up+yjINl8jsAP5a4EFSV1Q0Teuwf?=
 =?us-ascii?Q?4aLNRQQxfT34/zKNAA7xaDsDuQ79EvXygVBDtV4r73IR1/js3QT0BTHe+g9G?=
 =?us-ascii?Q?zvXFotdk2gBuiT1kTxOlsAekT/EvWjG7PNEM37lH0CKtmgkfDVwX/05s4Suf?=
 =?us-ascii?Q?AzHY+RfJgx9L82K2IshBpAGngxd55TSr+qTMg8Kl0Isne+0Oql7u4Ann93l0?=
 =?us-ascii?Q?mApI/oRkdsfIFWgL+JhI3qBA2bJrs3JcQ/Dm+wZKZJh81ZYCfrcv6sxhjs9m?=
 =?us-ascii?Q?zJnY9E5jcE0TEPER9wsWYRhFcFK0er1LtUznYCkFPHZ44UaEgKJlmOF1KACM?=
 =?us-ascii?Q?WLB+4PVF8flTdl1Lak2MPHMEyE6w2ZwueY2kvVlT3DSwsa9X78glFGImaHDX?=
 =?us-ascii?Q?uZxn0sHaCr4G91/sPfYYA59SxBmViu+IbmCq2dK3OwoXRWGdAD9CuL8dMvtJ?=
 =?us-ascii?Q?HL413yzON9KkYb/s0qE4KbhveuVuYhwujmIfpwyCJFIbnlDuZP3Ok/OpVOfL?=
 =?us-ascii?Q?EHDVPj3LO/SgBddfCa+fvpRwhfYz38DNO4okl1yx56IcJ4YcaoOWSR3F+XL2?=
 =?us-ascii?Q?AZxITSh72a+2rneGOEL5Uxng4ifJoTM6nTytXOyUlNDYburlycPR0yEeBkn9?=
 =?us-ascii?Q?F8iCrsNG+hpJ2QuK+jyb9SRBctrdb9pd7CDEPEg4fdg8TFAiN6I/RtnXyozW?=
 =?us-ascii?Q?a3+C++FxRLDMdEbIx34T6Pn1P9do6isAzk6jsMlJSxcwUary51j8ECDPlHiR?=
 =?us-ascii?Q?vZAWu8ytB24y7uhyg8pnbdO6vZ6+Li48hlB9hydNLxWqnM1iZBhjNPp4pRQE?=
 =?us-ascii?Q?KR2ePKodDCs6cgDwZxPm7VV8roiWqkcqhiaoYJNl23PKe/sScuhIIGSrZ6bT?=
 =?us-ascii?Q?jvxyLsW83YpIfso/EgZafPWYH0GNroWCMJbYd6VHWpOilg9SRKDboTWLMVK5?=
 =?us-ascii?Q?aAYikr7rg08Pxu+3Ud3gvMxrqeh7x/hKBCOglQcaD/PT6ivecblJyWwgNWpt?=
 =?us-ascii?Q?bnSMLvCK0BDz6xTIYliF1NfyCQzLrazJiMM4FYbU6I3E9VCebDjc4h34tOev?=
 =?us-ascii?Q?OSLyW1mf7xEIYXolRtn/KHaIrLQryP9bi5kSjwhwbjXqlyNZagMFHvaQKKwq?=
 =?us-ascii?Q?FENYlIVPhu+3mxMtMd1Iff9D9jmhLeRz0sTVIW2VvAhfYeny5W9AUO5+N0LA?=
 =?us-ascii?Q?OLXB7MNcHLxAsi3wtvs5zutP8wy/j1PDYdI+BgBHTa74O+FnXX2kMUe3fDG1?=
 =?us-ascii?Q?azUnE3pWN5lU9u5uSmzr49nHYScN/6sXj0sApo5LD4SeeO2VzyXJcUpwTJqS?=
 =?us-ascii?Q?siShqKAjqVEC91M7fL2AQXq/WZSFoYCvnuG4cPWqXx2/OnyO5HMVe7x25qrh?=
 =?us-ascii?Q?eJjZik39uSuIxewDSvGD38xZHiYOd8ebrjclJkW3Rv1ZYNF20D/OzD9VobD8?=
 =?us-ascii?Q?s6dRgMqN1NVUCtG5QMtEhm/GCX8/w+brQoEdXnHazv6akK0NGAMX+62TPFLB?=
 =?us-ascii?Q?mNf65joK3g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73430611-0abb-4632-4ad0-08da0e947839
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:06.3815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFFeULSNZzlECUYqAA6JftJRuUfDh/ZYoSWzZRsjoQLH+dnZB6eMCC2OCy9IdhfkpjRgbfFQzvFvKTNtw5aZOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: CPHcUWi7FzjjqnRMI4X_b0YSygLv2PPZ
X-Proofpoint-ORIG-GUID: CPHcUWi7FzjjqnRMI4X_b0YSygLv2PPZ
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add the libvfio-user library as a submodule. build it as a cmake
subproject.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure                                  | 20 +++++++++-
 meson.build                                | 44 +++++++++++++++++++++-
 .gitlab-ci.d/buildtest.yml                 |  2 +
 .gitmodules                                |  3 ++
 Kconfig.host                               |  4 ++
 MAINTAINERS                                |  1 +
 hw/remote/Kconfig                          |  4 ++
 hw/remote/meson.build                      |  2 +
 meson_options.txt                          |  3 ++
 subprojects/libvfio-user                   |  1 +
 tests/docker/dockerfiles/centos8.docker    |  2 +
 tests/docker/dockerfiles/ubuntu2004.docker |  2 +
 12 files changed, 86 insertions(+), 2 deletions(-)
 create mode 160000 subprojects/libvfio-user

diff --git a/configure b/configure
index 7a1a98bddf..c4fd7a42d4 100755
--- a/configure
+++ b/configure
@@ -333,6 +333,7 @@ meson_args=""
 ninja=""
 gio="$default_feature"
 skip_meson=no
+vfio_user_server="disabled"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -1044,6 +1045,11 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --enable-vfio-user-server) vfio_user_server="enabled"
+                             cmake_required="yes"
+  ;;
+  --disable-vfio-user-server) vfio_user_server="disabled"
+  ;;
   --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
   ;;
   --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
@@ -1267,6 +1273,7 @@ cat << EOF
   vhost-vdpa      vhost-vdpa kernel backend support
   opengl          opengl support
   gio             libgio support
+  vfio-user-server    vfio-user server support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -2622,6 +2629,17 @@ but not implemented on your system"
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
@@ -3185,7 +3203,7 @@ if test "$skip_meson" = no; then
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
-        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
+        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp -Dvfio_user_server=$vfio_user_server \
         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
         "$@" $cross_arg "$PWD" "$source_path"
diff --git a/meson.build b/meson.build
index aef724ad3c..5ae87b8f86 100644
--- a/meson.build
+++ b/meson.build
@@ -298,6 +298,11 @@ have_tpm = get_option('tpm') \
   .require(targetos != 'windows', error_message: 'TPM emulation only available on POSIX systems') \
   .allowed()
 
+if targetos != 'linux' and get_option('vfio_user_server').enabled()
+  error('vfio-user server is supported only on Linux')
+endif
+vfio_user_server_allowed = targetos == 'linux' and not get_option('vfio_user_server').disabled()
+
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
@@ -2111,7 +2116,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2500,6 +2506,41 @@ if get_option('cfi') and slirp_opt == 'system'
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
 if have_system
   fdt_opt = get_option('fdt')
@@ -3612,6 +3653,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'vfio-user server': vfio_user_server_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 0aea7ab84c..671a5d8fa4 100644
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
@@ -165,6 +166,7 @@ build-system-centos:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
       --enable-modules --enable-trace-backends=dtrace --enable-docs
+      --enable-vfio-user-server
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitmodules b/.gitmodules
index f4b6a9b401..d66af96dc9 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -67,3 +67,6 @@
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
 	url = https://gitlab.com/libvirt/libvirt-ci.git
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
index cc364afef7..0488bae9d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3597,6 +3597,7 @@ F: hw/remote/proxy-memory-listener.c
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
index 52b11cead4..bd531fd545 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -91,6 +91,9 @@ option('avx2', type: 'feature', value: 'auto',
 option('avx512f', type: 'feature', value: 'disabled',
        description: 'AVX512F optimizations')
 
+option('vfio_user_server', type: 'feature', value: 'auto',
+       description: 'vfio-user server support')
+
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
 option('auth_pam', type : 'feature', value : 'auto',
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000000..7056525da5
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 7056525da5399d00831e90bed4aedb4b8442c9b2
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 3ede55d09b..b6b4aa9626 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -23,6 +23,7 @@ RUN dnf update -y && \
         capstone-devel \
         ccache \
         clang \
+        cmake \
         ctags \
         cyrus-sasl-devel \
         daxctl-devel \
@@ -45,6 +46,7 @@ RUN dnf update -y && \
         gtk3-devel \
         hostname \
         jemalloc-devel \
+        json-c-devel \
         libaio-devel \
         libasan \
         libattr-devel \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index b9d06cb040..2422cc5574 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -18,6 +18,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             ca-certificates \
             ccache \
             clang \
+            cmake \
             dbus \
             debianutils \
             diffutils \
@@ -58,6 +59,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev \
             libjemalloc-dev \
             libjpeg-turbo8-dev \
+            libjson-c-dev \
             liblttng-ust-dev \
             liblzo2-dev \
             libncursesw5-dev \
-- 
2.20.1


