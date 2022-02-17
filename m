Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6894B9AC9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:20:39 +0100 (CET)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKc1m-0002wn-JD
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:20:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXo-0003mx-1P
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:41 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXg-0004Re-2l
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:36 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4S7Z0005179; 
 Thu, 17 Feb 2022 07:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=2BWrF50odGZYGfK4+kVbrwSRqiTtKmoGxp7R6Kq0DD0=;
 b=sJJyARIQqR6xm8iEgBVHzXLhHd+oewvWrfxGtJ0/UbsFM2YaTMnSpSX3P8LyOpxJMrxv
 QmJ0xJicDn+owBIUdxRUWHfN7xsgnykCTij4Ykv6KuxSEuNqAmcvWYNLlVFN5LlM+ofc
 DDN9CkJ5DH+uVe2Rew16UWPCx1+ZMAXGxtba8l6JW/sHptX4vXW/zGh1MMB6x61uTcL+
 t9zV1KavkCalL53Hpf7wQm0RSJC7Ih+pIwSCn9+IKOCD1IDuVsdIUy0VHK/4P/RKhA22
 AGfWIscKdNvkNjeXFlY29ChCnJJ/YYpx7DeqxQqghmpWdHH+I6Ch9O/ocDDUz8TSMS3p 3A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8ncavqx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gVhO135637;
 Thu, 17 Feb 2022 07:49:28 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by userp3020.oracle.com with ESMTP id 3e8n4vjdxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLSJzVa1Uxo/+Vtns6szN+VJZk/BsvNj6JaD3BuW275SsUsD6RyWiGwEHfOKKmOGv3W4xsOEC9EmdrNWlZezwkesINIreCmxVNnCchAY4rnU3zfpHMjusnanYsK33YMAYvksN6KV3ShVT4QWnPMTgS3ibLNX/CvfG+HZXYBndoKJAyExltkoL7GD9qkESv1kVcGPb1A5lykljzBP6TlfmQsxbLV6GNLsAVJxmiOEKyzWuqSQFb0wylabBsN3IH8C2vvRvOV05Tr2tdFhqildma/J/J0UijSER9giUB07AnN9D/qzQns6abWxJbXv9WTvdKbhzLGuN/5SLWqzdbqa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BWrF50odGZYGfK4+kVbrwSRqiTtKmoGxp7R6Kq0DD0=;
 b=NeN3zz1l+DyO+SoXNrQzzyv4S2LJ8R/khvLMfUqBtgtvqTZ+T7KPXaT72ecYrSSkMZUpZLd221KAssQlJhi8dEbyUegwP4yzcl5SbNrcmbMzlq/BLBbmR2bG7RXNYcHPK60uHKCt5PKtY9EG3NKRsPH0moLLJsITq3Jiv0vdobLJpq7osXKwjBXCy7LJyu6+GjedTJWdu5WJp84KPmxBT5cdpSqrJx/ra6kgoedxxqqerCSU9/fLZlVE+HwtMgvuEaXcsjCGkEm7k58vDxS94obYLldaihD+rm1xc/6nXPY3hdAwlozo7RPV24M5kORC4VFFzGuWG7BqMy1ByCPZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BWrF50odGZYGfK4+kVbrwSRqiTtKmoGxp7R6Kq0DD0=;
 b=ZNcfhdSfnAplIsTFZS3/8vmn8Zh+yXcjyQd4RfvfL1SKD97s/37o+p776mAlDM+4WAk6LVv6T/ayHJ0t/22aWDzQ6c1E8nYFffPsuiPXexZUFnrR5SeGaUXYz7mF3/Bmu29FJTAg3Os6OR/dL5/C92mcYIZX+oxTQ7URmw2Qus8=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by BL0PR10MB3009.namprd10.prod.outlook.com (2603:10b6:208:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Thu, 17 Feb
 2022 07:49:25 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:25 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/19] vfio-user: build library
Date: Thu, 17 Feb 2022 02:48:53 -0500
Message-Id: <a38e60c8d79b2d2aa90f34dd5af6bcffd63a5cfc.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94c3a5b1-7d95-41a5-52e8-08d9f1ea04a1
X-MS-TrafficTypeDiagnostic: BL0PR10MB3009:EE_
X-Microsoft-Antispam-PRVS: <BL0PR10MB3009AC8569A33BAEB5092D6F90369@BL0PR10MB3009.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uO7GQW9wVAYPsv2YR8ENWS+KfKsE8SGKFMXz6h1mBHar8kzvaoLkwE97qdSuI1+rC36kZUjxFAm+suqC5v6spaqtoUapXUZkNNjM5ClpKxNGPknyVBsdkjA/nguEizihlRmBVE07KjRZmY/f0Iwa/w+QYV1h9NSPgjj4brLqAl1tLhy3netduG/ua4lTnxn5eODfDn1kkWXB6Lie+cEAlc2lhWC3Ov9nv8lGzlWyBaznaZVhNQvLmHnL7748ONZ3Z9ko6p6oSIKX3oSfD/pq1dryZ4mk7rj0GwwmF5sYVD6AVM52DuhfX2UToundEvOjQ527aIVbcDZ3IdboR9CYAfc+76DjkxiFB2Uc1fDJTwWkuuQl0vXEYyZSZg0X5XvP/EGLAiyfYoYe9VSx9wpG6md14nP/B7/SbFkMMDkSnkSrHgOiERI9HEAsyW5u3mUf4X2C38XM7Ir/MUONX7w7EcDWpQSDzc8fJVzMAyvuX69chrSeEWIUoQR1SAabAFcS+L22/ZZZ12tyDRNyHYaXaF7y7EiGVcoSQANxMBf9W7GeBxJNeTw1fq/MOPscvi2kg+nxpBLv2ML4bQsGIw0pBQ+QVsN7A1Nb7T4z5JONkmLO4hw3wF+m9DEs1FxcQ9ahty70obDRIMmhaxffG88JW/VOES2LludiAPcAUOwDS1fZzjNov7I/4KTe8pQ+3Fvj19jESF80AGRs3oQhICsh54krocsIRFy9t3VEUFrGRDYqN3hAksyehJZAr/XOv1XcTejfk+9VvHttfNS0ELwES+PQ0NAyi92Sm7bqHzNgWPLspLgad3dwXrK1gH1MjxX+AU1XreTm2yjRl4R41lX2OGbO9OM9cG7rOfn+t95o/MU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(66946007)(30864003)(6916009)(66476007)(4326008)(38350700002)(316002)(36756003)(38100700002)(2616005)(6486002)(508600001)(966005)(66556008)(6506007)(8676002)(107886003)(26005)(2906002)(83380400001)(5660300002)(86362001)(7416002)(8936002)(6512007)(186003)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SkXkCYVFKb4aJbWLmgfmZAKnYjqsHfIlCr+/I5OVXlwXixshe/VpcgsdDrVL?=
 =?us-ascii?Q?qnO4OOYYrjjouq34JgPCh6EhEgGQ8ZkNTVLMpws3xl4DXHUfR61TUFi8p4Vh?=
 =?us-ascii?Q?81beLmF1NrVs9E0ZLaa1bPuDNFt5Cov3zZsTRdtkgm1JvJ4VCqK5iaLbULd7?=
 =?us-ascii?Q?KmbDj/5t5kBoG+i6uwR4hf9l771WrOZZqamJQOxehVz9WH83xbA/AZ0f5qgq?=
 =?us-ascii?Q?HolpCSDXfb5WBX+jFwokJX6GXfO5SJfX4eXPv0pjxhUCBmjRPwHmGP708KJA?=
 =?us-ascii?Q?nXTWXjBqTLldOJx0Z4dmo7keWgoDHTDW474AKhhF/iD5RIgOVZpj7xzzinT0?=
 =?us-ascii?Q?rEDfvW3oY5anukWjwBSuQwwZlfyIRGu3wM35YKyUo4e0faHKTqhrHh5KTCJb?=
 =?us-ascii?Q?5+pzydzQfg/9PzSCACaM832VWb5y54DP4ZElXmj6ZhqXb9MFWv1ANIfMU+Uz?=
 =?us-ascii?Q?9jefyc1tgRxJDPcqtM3AqBCIH4ajbIyfcbMg7hyVx52Dn1VmU9i5HMJNvN/h?=
 =?us-ascii?Q?QHMfgKfaK5Wse0IHBIIxwhDSKiA4dXyDBk0E296xZStHC0pre6nPv3P9NRCC?=
 =?us-ascii?Q?XaU5ULEpc/39oZNuOrgvfTE2OMAJfPF02L6eopdJdfxUwiyQg8UZKjBHOsZp?=
 =?us-ascii?Q?2Nn+LCNicn4FfUw7csx8QmbyibbsGgIV3DchBAFMRmwoFlIUhN7eveuBi1SL?=
 =?us-ascii?Q?vOIKqRoDuYesc+jgU4PBV7hMw91wvUqf9G+IhCw982xzQ/648w2HZQb2P6wX?=
 =?us-ascii?Q?xvnDDB8/G1okOJR7o8F6bi31lGPcTeGOP9cOIv26P0QnKsN2vLJ8V6ClO6sG?=
 =?us-ascii?Q?1rlbW6jEXfEUM57Ug0gtpbKwa+u4Tz9hSrNpin5WHRRs/VATKFjZf9/PKucZ?=
 =?us-ascii?Q?JmOg1ewKExZV2XPkEABSmzTXUkoLkGyOMXadLAmrflSncin5fomIQhKtPQLZ?=
 =?us-ascii?Q?dqdBeieuvCXsxjhVFoQwRvMmw9BwpMuttZvyt/8ple+82UK40Uhw+dYE8KR0?=
 =?us-ascii?Q?bHLoIFR/gn3G/0Q2z3HsznT/ZuM71+yjwM0Ro36IWL7w5RPHJAcir3iM+i7R?=
 =?us-ascii?Q?SE6dVTckJ6n/NPktgHWdN2//gpbeSw9DefGi0VWXJWSAUlfHlH8ebGr/gF9P?=
 =?us-ascii?Q?YvNAOpr0ChCY4IsYupGsFdMF+1nz5piMTX0FfOwF3Ahoyr4FxiXboitQCSzv?=
 =?us-ascii?Q?OiQ9EmC9uOiw7KVLSdeDAbzlgiLHDxT616ZaQP3tcvWBvNGmGvOYxwa1qSbP?=
 =?us-ascii?Q?WkBRM8Pk3zwix8mk6GwFCCVf+wL6NFmEQq07HMim3QzEeZLItfM5fgtFFVz0?=
 =?us-ascii?Q?svxF+210Nj0pDQA3uq9F2V6IpWal9hHKmCqYgNtteAgYIuOY6eBQfdV5gDB6?=
 =?us-ascii?Q?j5gsehglqOiSW4WOpwYoojlfdhX+oL3ZWFuPHbpTsT1HK6N5Ynzb3FrSmLos?=
 =?us-ascii?Q?mRKcZmXoewpeWbfBrupdG+U9ahMAkUSpH75QbV13Gsoxb5lZZvoPUdlQVV+O?=
 =?us-ascii?Q?q9RK/MgqeAihnKHH0oy+N1Iku0ZIja1yOEvpoN3By4DXX/qZrV6C5Kmk5cCA?=
 =?us-ascii?Q?vcUuIkkcm3IeS115H2ITEfUk029i+ylMBOnailQKBIOUv5ME1F99+4GuViVn?=
 =?us-ascii?Q?q8hMqFo+ymtexIzQxCv5z8o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c3a5b1-7d95-41a5-52e8-08d9f1ea04a1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:25.3208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lopi0gxxx7fYEkCOAzizPLCKWAY5Uz+GTQf0gN+1qSQEwCIhWTk+KLPw0Ut+038BXA5Irw924/GNPfuW0ZTxdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3009
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: 8_gaL5-zNHOosWSN3S39TucLqxmyAmxh
X-Proofpoint-GUID: 8_gaL5-zNHOosWSN3S39TucLqxmyAmxh
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
index 9a326eda1e..2acb2604c2 100755
--- a/configure
+++ b/configure
@@ -356,6 +356,7 @@ ninja=""
 gio="$default_feature"
 skip_meson=no
 slirp_smbd="$default_feature"
+vfio_user_server="disabled"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -1172,6 +1173,10 @@ for opt do
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
@@ -1425,6 +1430,7 @@ cat << EOF
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   gio             libgio support
   slirp-smbd      use smbd (at path --smbd=*) in slirp networking
+  vfio-user-server    vfio-user server support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -3100,6 +3106,17 @@ but not implemented on your system"
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
@@ -3790,7 +3807,7 @@ if test "$skip_meson" = no; then
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
-        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
+        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp -Dvfio_user_server=$vfio_user_server \
         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
         "$@" $cross_arg "$PWD" "$source_path"
diff --git a/meson.build b/meson.build
index ae5f7eec6e..5111b6fed8 100644
--- a/meson.build
+++ b/meson.build
@@ -278,6 +278,11 @@ if targetos != 'linux' and get_option('multiprocess').enabled()
 endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
+if targetos != 'linux' and get_option('vfio_user_server').enabled()
+  error('vfio-user server is supported only on Linux')
+endif
+vfio_user_server_allowed = targetos == 'linux' and not get_option('vfio_user_server').disabled()
+
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
@@ -1876,7 +1881,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2265,6 +2271,41 @@ if get_option('cfi') and slirp_opt == 'system'
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
@@ -3366,6 +3407,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'vfio-user server': vfio_user_server_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 0aa70213fb..e52391ec5c 100644
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
index 81aa31b5e1..9af3e96d63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3567,6 +3567,7 @@ F: hw/remote/proxy-memory-listener.c
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
index 95d527f773..0713ef508c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -68,6 +68,8 @@ option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
 option('dbus_display', type: 'feature', value: 'auto',
        description: '-display dbus support')
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
index 87513125b8..22468d01e7 100644
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


