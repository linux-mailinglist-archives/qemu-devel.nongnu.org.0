Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E393946F6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 20:23:54 +0200 (CEST)
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmh9F-0003jc-3g
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 14:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0O-0001n3-1h
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:44 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0M-0007Tv-5u
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:43 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SIEfWc015210; Fri, 28 May 2021 18:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=5jaI4k+d0YHnBYchMwZ+GUpIEEBMe/FodXUxkK7dRJs=;
 b=p3sJ/LyqlPnA0+P0ANfHuinC9vnUnUSUVHKL4BF0SbR4Y2IPr7i4gCATBGRD7WoeBvWd
 Go456PQGYBP7W0MwAhQUqByGAJdYdpEFKrc9o8n1f5yZFm4QQenuttwh+onXoxMXunmC
 DyAKEA8BiBSo3SMS+7lWGqb1OeEvcvR450SgweXIO6IkssshM+dR9Rx9dibwSXFEfF47
 sYIqXtZBcJNJTw4OMYiI15rLzNFcJKWQy5uBLJvYKnCKTUGlv984x6DbwK9ReyJjZeio
 YOe1b3fVk5oPYAVcs1srdMWmX62/R5KIEe7nZ3DJSm8EwNU6/VtY4Bkb5+cEnspezhPs rw== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38u31br1r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:40 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SIEdJR108682;
 Fri, 28 May 2021 18:14:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by userp3020.oracle.com with ESMTP id 38qbqvpqe5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8XdSldp1uifLRTQI5DRpKHt6mgK20RfZjY1MTZbCy1OGK3QGDZexPiutj5BPH3y8jni2rPP7UFzOVxtFhwwOnlCrEx5bdpVn9YDP59UOdpWQ+AD6+q7ceiWjnyCKP7BSUSTKOF1POgdOLQUjecFI8m4gowI2xPNO0DpDAJRzJOHbz+gL2DyPhBxZJZYyKF/9ystUbBt6xex408GyVja2iq0kpfAJ9wmktI2eKXwU/p7tAfOwzm90LbAlu7j4asFCW5XYMMoG2mflxWawnWxMKcduZwyp3aNLvQvAMLc5kTvoOQPMhg+24PR30vubzzylaTzpIvIhlkVkKfZq6RWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jaI4k+d0YHnBYchMwZ+GUpIEEBMe/FodXUxkK7dRJs=;
 b=jOgcgvJp9tIRisdXdVUuQMOeW/nOxFtuoSmvX8RviZ2Wh2mHhFaTu9SGhfKQy+YjkCFshv5TpEHnvbY1B9eTsR929cRFxuqWsoIi5E+UrpcW7b9GvIN2wg8Sl1X75qTsyfPm5WXqqpDPC4VFowNziynY4X7kyuCqv7MolnZcRFv4WvmvQCQuS2Sg2yT2E7zOS4H4oh/F5YxwGWbSVEk/dTRxbum8KKRy0xwJJVQW7Ov5j7Q/VqNjL4FqdH4VszBNgE8nqNtm7N+tA2Ai8LoZmUwqrh6TEWjtdQoTxRWWCmwVdEYHHZ2AttxEe2LCZRfv+26/a5ap5SxCx9SgptuUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jaI4k+d0YHnBYchMwZ+GUpIEEBMe/FodXUxkK7dRJs=;
 b=0OCYqJwFK9ieyJpjz1zlsm3e/wVZQiZ5IQk+xR5QYJPnMVkYy+l/zA29q5mOIwtr/YQD1/xzSAO0j5ZgPlpl2CSEEDezqzSH0KSPXIzXqHjblthlrZBP4REKtZABYeXONP9DJotXzoUOoJlzXou3mciwNIkVC4X0bsYJhYpaHLE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4723.namprd10.prod.outlook.com (2603:10b6:303:9c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 18:14:38 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 18:14:38 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] ACPI ERST: step 6 of bios-tables-test.c
Date: Fri, 28 May 2021 14:14:19 -0400
Message-Id: <1622225659-16847-8-git-send-email-eric.devolder@oracle.com>
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
 Transport; Fri, 28 May 2021 18:14:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9ba06ed-0b95-451a-b4a2-08d922047463
X-MS-TrafficTypeDiagnostic: CO1PR10MB4723:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4723091967C009D75F5A31F297229@CO1PR10MB4723.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VBOZq75PocDhwEHQDrMDGuWkl99NcRBR2HiiwFh+0ajkbNVBwYp+IxH6l/ouWMHdoZfalpg2B+YXXuj0F6S7b3dGFgdOinZwuXPkgB+bvuwBnwq54Swq1Uao1HTPOov3dEBaghbZgimLBkX1Eb9MdHziUxszV6OHR+5Xh6ihggZexgSbUCsa505bW3Z1lb5ydNhzjcCQVo6MDZFxvxyaGlgL6GyGFzNg8Dfw8mYvw+NxE9Tw4MHF4N/mB3sYlFSY2MgUXTFoo395XMnENwMM02KhF+3FBL6bfQTWjs6vF9+45ruvIEet9VXd1nuWgvB7oAZmkag/aiR6sgpps9Xjh+kU786A0uc4ee7Vo02JkMyvQs1mkMIQUYjj9qioxDHiCqNmc7yFDh8vImPA2bJKl4fgYtDqlahquPpmMwPJRjkxaCrwTtQ9soY7cw4uTduQBfmhax2fpZu24lIaWTk77wkguwkx1B511NgnoE+1W7SMsTlN3rLgEF8bBfdTG0A45IigGwlj8qx7glMP2JTYdx+EUW8BqHc2rTFt/BWSkU1ApcNLfUF4mzW6T/GVFQwaMuGvcmwtBsmEFsi2KPV0WkNzYVqoL3+Y+c5VmRBQPRdk82K69reQbNogC+O2vMa2/S+F3TeFXb2e6DYYAqiMaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(39860400002)(136003)(376002)(6666004)(316002)(478600001)(36756003)(38100700002)(38350700002)(83380400001)(186003)(16526019)(6486002)(8676002)(86362001)(8936002)(6916009)(5660300002)(52116002)(2616005)(66556008)(107886003)(2906002)(4326008)(26005)(66946007)(66476007)(956004)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vofURnIitdEakCsMtdTvms6gzRIauoeIxvF5sCoxEl23r8jf/PBK8JXw/iI/?=
 =?us-ascii?Q?FxssCvY9Dh070SvJHBUpYBPaE92wdygtlWvDdS0jLPC6UN+/STk9E//PJMZa?=
 =?us-ascii?Q?XJJFwHSiyCwgc0minxoo2uQjcnK5MHjZpyYit/h8KvHPhxsAcFYmfk4bN180?=
 =?us-ascii?Q?C+gyjeGqJlzB5agWZEkTOCkaJ/14ncZxFM2z4itBdJ+rdXxQHSxn3yZs/RiD?=
 =?us-ascii?Q?Hc6D/D4gnSCyMJKAhbNP0vMcAZRrMT3zcmbMRFfEl26YXtIXpx0m+coFvbjf?=
 =?us-ascii?Q?Eryg3rlJvSaw0JfTG3QQz9h+PhQqc7evm3j+QdjUCUNDrwz77GQ6c8awDdHe?=
 =?us-ascii?Q?Y+954vbvA4+mUBgT0PrRL4WwOdipJtVI3TBynobm11zXlRjlwVxPf0O2QjVR?=
 =?us-ascii?Q?aIA1UyHFUV6xbdy2t03VuPMN25MGjLOQ7and90hlO8VeCTHDGSfQGlMbgZE4?=
 =?us-ascii?Q?rAH4K6V3tAXOGuU0ZEc4adrNVsXklt71m2q+jDr5uab8e9ZgRggPLEQwRojK?=
 =?us-ascii?Q?FMfB+Nz1gpPp/XVzu+J4cqSh7641duZszEeiAuqwHZP2cSjKzngdVAz90vJA?=
 =?us-ascii?Q?lVcndR+GNkJDtT2GHx9YwA8M4MRipV7l0dfFKh9hEnZqYmfMNFBCyl2stNBM?=
 =?us-ascii?Q?ex9Kd9oFEFFrKIhTqm7YmXdHztnfIzuGVMgiJz81lpPqpIsuotyZxGToQwVK?=
 =?us-ascii?Q?+5QBp8NoGGbwM9Zhx3xt8M5ciVtoKAkr9df5XL0U8qFYfQfi1LVL2HRwCC0X?=
 =?us-ascii?Q?n35NkmPGX+Bz7jOJ4OsgrNKNbMd9DQtnvoH8BBq4ulUcHjtEtuNodt76mnZj?=
 =?us-ascii?Q?nyHjuKhanchROjarJgf4zxa0ZZEDAhbRPX7OKg8tdc47JXtMR01R0LLiBXR+?=
 =?us-ascii?Q?xQ6pdQ8AtQA2QFZbkxvOEFldwi3YIkSHxto4qzE6OznaFWXgukPBpzUEGH14?=
 =?us-ascii?Q?cwYnXQvf/jscf+689FjSfZ5Uf87qcawkgN85u1UvMdrRiDILr7lXm99NJ98V?=
 =?us-ascii?Q?LMxk4epVkuOpBsWy6kXmmuoh+e0lkFBLt/+MrpxKvH4uQgysennySvQSPv4z?=
 =?us-ascii?Q?FMnLTc1Zhiz60HjoOCH1YVed1Iw2V0NRdmZqkl7uns/0SyyNZAFh3++3RUHR?=
 =?us-ascii?Q?ddhXAhXUNNzvKyDdJXzO8reafsDrztXx2z/6XcFmGMPft0iC+kpKgwub1eRO?=
 =?us-ascii?Q?/I6bpu3qUoc6qElpL9+SUVBZx51JH8AOfGP/2u/FmgxYGuCKvNtJVaViBNw6?=
 =?us-ascii?Q?fgbth8NM550E3ObuZWCrg0ijQsGti5lQ8sazHwroH3O3DUv5OQWzBxa+ecvL?=
 =?us-ascii?Q?g/neiB83MlCf4tFO53iqEYcv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ba06ed-0b95-451a-b4a2-08d922047463
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 18:14:37.9790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUfVdNsR57qRPxmS0vqTzTLllNdDfmsRxZrsEaW/8iF1oYOaD6C8v5HISOo9HC+anjIm28hLbQJ7jkyup2QD2X0r9Lqxt5lWUjU2yChf6zM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4723
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9998
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105280119
X-Proofpoint-ORIG-GUID: pOM92uW7UbHUNREUlFCLCYkGCppSkdjd
X-Proofpoint-GUID: pOM92uW7UbHUNREUlFCLCYkGCppSkdjd
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/pc/ERST                     | Bin 0 -> 976 bytes
 tests/data/acpi/q35/ERST                    | Bin 0 -> 976 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 3 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7236018951f9d111d8cacaa93ee07a8dc3294f18 100644
GIT binary patch
literal 976
zcmaKqSq_3Q6h#Y^dE9^rOK=GWV&b1h{BUvZ#VzQD#NN_}<VJW2!{zj}Jj(Gp++KlF
z-m^RRr=jicm%cUSDW!0a>)srw9ZqJfYH@yl5T!<U;}M6C67CcCCp`0jI3h}X4Z*CR
z@cQFuhiLM(wSRu-xcHA1F8zhXBbq;Aj)oWS$Nk6T$K>0*@ExA}PsmTmxA~y7^f&wF
z`=C;Mzb#Jlr!;>?JY$ah@BPi%Ksot29-5N<Er=Hro_R^UWRASiUqyaJzRfE>hSucQ
c<lDT_e?xvlzRfG^WB(fYq22#4zMDpU0r#ed0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7236018951f9d111d8cacaa93ee07a8dc3294f18 100644
GIT binary patch
literal 976
zcmaKqSq_3Q6h#Y^dE9^rOK=GWV&b1h{BUvZ#VzQD#NN_}<VJW2!{zj}Jj(Gp++KlF
z-m^RRr=jicm%cUSDW!0a>)srw9ZqJfYH@yl5T!<U;}M6C67CcCCp`0jI3h}X4Z*CR
z@cQFuhiLM(wSRu-xcHA1F8zhXBbq;Aj)oWS$Nk6T$K>0*@ExA}PsmTmxA~y7^f&wF
z`=C;Mzb#Jlr!;>?JY$ah@BPi%Ksot29-5N<Er=Hro_R^UWRASiUqyaJzRfE>hSucQ
c<lDT_e?xvlzRfG^WB(fYq22#4zMDpU0r#ed0RR91

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index e004c71..dfb8523 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/ERST",
-"tests/data/acpi/q35/ERST",
-"tests/data/acpi/microvm/ERST",
-
-- 
1.8.3.1


