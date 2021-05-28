Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED23946EF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 20:20:46 +0200 (CEST)
Received: from localhost ([::1]:48984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmh6D-000833-WA
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 14:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0L-0001dd-6Y
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:41 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0G-0007Q2-BR
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:40 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SIEYrp010576; Fri, 28 May 2021 18:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=81j9b3A1n2bOAoM0IiGPxEofWt0oB4G3AGLbL0AbUfI=;
 b=aIi+GSPVSvKXPcGvwb/w38UYysPal9s85kYXYPQJbstPy2Iidq9hPMJhlVo7HY2/z31e
 S8zGEjN8lhGcuV3nzYhEcKtSeGVs8YYMzGOb3l2X3L9QCWvY4iqa+2krGZyhZ4PDN8X+
 qZ87Uk7s66n6CbirQByCnkHMypW+N6LYDqQDdIFf82CkrW3ZTp9gS3Ac2mZOrGmylckI
 ozjR5aKiC0m1ha9P74naxd/fTL8XfHr3CM1XTxV2jrX85odZKHajZzfUWiwBorYDMDeU
 YSAENibE1nTQGPtUlk2nLcZgYYCK00iZlritqp0snlSLFRpddTHA8SCGkhvfi3jEshgb Sw== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38u1meg2qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:34 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SIBXbb088913;
 Fri, 28 May 2021 18:14:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by aserp3030.oracle.com with ESMTP id 38pr0es1jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQQ95QGCWCSyUkqOKYT8LtigP2SN5Wnf+455WsK8gBdPXzrJS/KYepa0gVov1Jo7cmHX1NAp7Dxr9WVgrj81ihnajviF96zElYSpgMzqbxG6/r92GDK/zgi+fQCsbTb7i78xRC0C1iug5pQ14sA5Ng++TsfdRySwRTUhCUgQw2KgPdBVWLgeypg+dymGWrm4j31DNeAYL57MV8c7NgBACYgOFnS0YP7bXtXbwmUyYE6lwU8c83gOUcAb22e2ViM7kGgXa9xUaOOZyoNrznHPaKMr2JmA+1ELG6ygzEPsd4TDad1kzy0isCOioSXbocSCmzoeCWv2CJ+6fLez4+ylYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81j9b3A1n2bOAoM0IiGPxEofWt0oB4G3AGLbL0AbUfI=;
 b=VUWb+ojddRUMenVrnAb2qEF7Y5jVzyTIO+YUgYUH7N6pu0RGorneMaRcFBJNlSTIS7DOPtfp/bhurDwi/R6IwOatcd+jxU/7zr7CtqEX2SJd7OvdZB3UaVYswNGEQdI8+df0nL/JcZu0GpizMJwIBhup2YH0FYe9FCAAKTgk/XiJo4+xOSrFmEZyoZOl6ggR3ThXJ9QUQOf0zA3+KGj4p7l0uh6HPJXKRRMyaGrr3eEuluW0Q8GE083i6Cv8/H7p0VV6ksG9/wxUSk1SXXLSsDVv/UTc9YqwvBYxTV8efcMBB4VVETbmrBAKr+tActadAcw+mwnHmJq6YmScrEv4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81j9b3A1n2bOAoM0IiGPxEofWt0oB4G3AGLbL0AbUfI=;
 b=JGr1tblJiNtt5/ZUtIpbphKfYhXHtCC26c1tUexCX2spP6TX2aoWZCZKiZ4ZBBc66EDy9KYnLf6VZPp51Bnvu+Tnxl6Jl1PT1rUp+899To7/L+QTzIqC8zhWD/YbH8aLzzzutJx5DIp8YrgZCSuRiKWkRdzBWaqFPFyIuvRfKVM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 28 May
 2021 18:14:31 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 18:14:31 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] ACPI ERST: support for ACPI ERST feature
Date: Fri, 28 May 2021 14:14:15 -0400
Message-Id: <1622225659-16847-4-git-send-email-eric.devolder@oracle.com>
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
 Transport; Fri, 28 May 2021 18:14:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea56eae4-079f-48cf-edd3-08d922047050
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB2045F2614C878DAC2C5B9ED997229@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Noyxf46Yk03vjg512eM5zVZtXuhU8s9vpwm2+gpBscd2xtZJUrX6PooDGMsmySBI6XAsxEFmp1P6EnjwtNo86crMwEye+n8/G3daoIQFWwPKM6t8e2vxyxH7BW5DeLZ7u+nTghZojlxyR25TR7DXF4dUbwIQZAJHADbBxKbOSNYruy8mZ8Tmi0u0YeBpbcOJCmquxq40IB7V4ctv5MY667Cnd/3JrmumwpeNzr1fuiXHZ2U79n1KOxgbm6PfEzT7RoKDCIo2N2YdkTe9V+R6rFHn6U1ZQVuuNEzxlh1PyBlVg8qhSXcaLji8nYeHwwNoym2qe9L2WnT43PH3ERHx7bqFNTe+wUFlqmuVqeJiskDDIcZYkG4FFAXibqH9+sgRtdktJtEofrVbwEz230NTdxUgsZ1LliwlpvzbTV6+cRXtEQppEozZW0WtTqMD5BBJhnfb3dMKGtOIwYDNFQnhcPGgKULHUQp20oVeVUp6kB8/FGTbF93cNXg32BQZDYGbhPIm89idTTboyBrhR7dmWQfnWwkscnJCxszuZ2zkZVLVk7UYGnyB+Xn6nPAx7PuNGUuZFHSG00p93VD1aG1LswEzdYVgaPSC9TmNE52BgfOeZdUIw+aMbDncTE/9Fo/EYa7sqHeN7rC10X2TcLPiOXi+Hlm7BzkIKJY4w7URm2QVwh7UcsJQvHTjBw6x7ZzpRMcsa9577OPJGl7eTVViBIrH+jRiTJZGER34tNybTtynve4W5BmCLupUqVCkUo9xB1E4DQIXx4mQH3DLn8QDVunWbfJ92e0i/vSODsuHJG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(6916009)(38350700002)(956004)(7696005)(38100700002)(52116002)(36756003)(2616005)(8936002)(30864003)(66556008)(16526019)(186003)(8676002)(478600001)(26005)(66946007)(66476007)(316002)(4326008)(107886003)(2906002)(86362001)(6666004)(966005)(5660300002)(83380400001)(6486002)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?azoDYgeZ61LcatZHBctyA6qZ2sP3pHA4gGcZl1UYsCWlpP/V9jO8UMocIYy2?=
 =?us-ascii?Q?ORHYoi8u5eDKO59reZx86EtezKadFmjqSKypYvWQltmz6oMAJKDuqb+GH+Dl?=
 =?us-ascii?Q?sOT7iuJrhc0yl07wA06xXf4/mc0uZEui0gOGwftaepFFMdndwaCvQlj3dGHX?=
 =?us-ascii?Q?CctopkroDCezdtDJvz0LmqctJ+vdiwH/i+DjR4c2zbw3wo93qcLoc1SJFBZi?=
 =?us-ascii?Q?FmIms8jd+7/pSsPRvUuVqB5TDjyfj7cUs0q2fcqLCr5pzaRAhuHhJrIxp/A4?=
 =?us-ascii?Q?0f+yFt3ztQbKsrUwRAFUVw8xM2cZidWAIdM2RIjGzEnjsb2Ct7lZ53+KMBId?=
 =?us-ascii?Q?4b6wDjv0+TlJLcyEnjddfgCNVXfQHjofBAYH2nl4TBkCiYI97X2lcnCjP0v1?=
 =?us-ascii?Q?+rjTNpWOAlvqgZ8U3ySng7wTv4BtYxAruJTnIE4DebhVZsltNNlYR2mF6ZRy?=
 =?us-ascii?Q?VMy1ywrM+nZ7Uc4jCBLrboYw8QFxdiSvWE0l5buiKNzWjjFFqKTutFYZAi2r?=
 =?us-ascii?Q?LGsdxV9T0AfFRChejpZeK7jlzPGI61TWJTQMOAuo+kYzH4oESKqs7l67LWDs?=
 =?us-ascii?Q?AfM2NxG9oW7PAKzQSjcmUliEIeL/yJ9JNcbbGrYl3dTGcVSDCnR0gRDQiiMj?=
 =?us-ascii?Q?b87NCCR8XP7aTP+Kn+7WAUSMk25cV7eqZb+vkEmXvFBoLVWGDvtWUcZHZu34?=
 =?us-ascii?Q?hLyS3tBPfF1kOuTZuin99ypwyH0OGAb0vAurI3mACbMRkg7jktTQqZeUzs3u?=
 =?us-ascii?Q?hpmI9ey1neQi7EdQRouZOwDoNGNA/o5mbn7ONLF7/8mYM08DQT29jmt1vkxx?=
 =?us-ascii?Q?VVlijU/NIqFc3ICBLY/D8jxM9dzuJGKHm2PREzWnPx0E7z8y3eHv3MPAymWu?=
 =?us-ascii?Q?zByyw2Ihuzk2JjBlDYnMH+58ykqHZHJWZpslbv9CSq3goxd5gh2lis4wIxyz?=
 =?us-ascii?Q?9Ek3deVZtKtEYvm2sT6aTwodmWt6+OkMOfZcQEeeoVH6vqfi+dN4CVuN0cSC?=
 =?us-ascii?Q?z8AJxbOlQ1o7sTv+9aLaFd9Bvfce2URgSDq4St+q5gq3VeCOGVDgiL8LpNfj?=
 =?us-ascii?Q?Z9LoRIeTW/rki62BFFnwKDNuSbCPky93AKSS0cHEE+MSxnQQt7Nfgx94Oo+c?=
 =?us-ascii?Q?oHlkQOQjPYUlT6EtTwpehaz9Nx9r2cc8JYLdGjq9v+UMqrH0V/eunAeeagMH?=
 =?us-ascii?Q?QugfgMKGq5BU86kazd7rMTogGOujmoTzlUsAbtprpXjRBoLq1+wNYxibeZHz?=
 =?us-ascii?Q?5b4Eb2wv7kSgGPjdZwYzj2c79QFSXqUcu1cs3TvS6urUpDh1kfOpSYrMYRa/?=
 =?us-ascii?Q?itQw+bTSrOc1SecbP5/FgL6d?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea56eae4-079f-48cf-edd3-08d922047050
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 18:14:31.0555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xA5mzXqRM5djKVyBjAnPQ7rgi/Eudihuiw9/uzVUbYKIp8N/fd5HpCSlg0MwCzllDRovvX60ptmRTKkoguXARoScvaByv3aWUT7Vv2Hovk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9998
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105280119
X-Proofpoint-GUID: LNPq5pId2HYPISudr_gK41ChM9GQvZ4C
X-Proofpoint-ORIG-GUID: LNPq5pId2HYPISudr_gK41ChM9GQvZ4C
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

This change implements the support for the ACPI ERST feature[1,2].

The size of the ACPI ERST storage is declared via the QEMU
global parameter acpi-erst.size. The size can range from 64KiB
to to 64MiB. The default is 64KiB.

The location of the ACPI ERST storage backing file is declared
via the QEMU global parameter acpi-erst.file. The default
is acpi-erst.backing.

[1] "Advanced Configuration and Power Interface Specification",
    version 6.2, May 2017.
    https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf

[2] "Unified Extensible Firmware Interface Specification",
    version 2.8, March 2019.
    https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c | 902 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 902 insertions(+)
 create mode 100644 hw/acpi/erst.c

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
new file mode 100644
index 0000000..645a904
--- /dev/null
+++ b/hw/acpi/erst.c
@@ -0,0 +1,902 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * See ACPI specification,
+ * "ACPI Platform Error Interfaces" : "Error Serialization"
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/sysbus.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "exec/address-spaces.h"
+#include "sysemu/hostmem.h"
+#include "hw/acpi/erst.h"
+
+#ifdef _ERST_DEBUG
+#define erst_debug(fmt, ...) \
+    do { fprintf(stderr, fmt, ## __VA_ARGS__); fflush(stderr); } while (0)
+#else
+#define erst_debug(fmt, ...) do { } while (0)
+#endif
+
+/* See UEFI spec, Appendix N Common Platform Error Record */
+/* UEFI CPER allows for an OSPM book keeping area in the record */
+#define UEFI_CPER_RECORD_MIN_SIZE 128U
+#define UEFI_CPER_SIZE_OFFSET 20U
+#define UEFI_CPER_RECORD_ID_OFFSET 96U
+#define IS_UEFI_CPER_RECORD(ptr) \
+    (((ptr)[0] == 'C') && \
+     ((ptr)[1] == 'P') && \
+     ((ptr)[2] == 'E') && \
+     ((ptr)[3] == 'R'))
+#define THE_UEFI_CPER_RECORD_ID(ptr) \
+    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
+
+#define ERST_INVALID_RECORD_ID (~0UL)
+#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
+#define ERST_CSR_ACTION (0UL << 3) /* action (cmd) */
+#define ERST_CSR_VALUE  (1UL << 3) /* argument/value (data) */
+
+/*
+ * As ERST_IOMEM_SIZE is used to map the ERST into the guest,
+ * it should/must be an integer multiple of PAGE_SIZE.
+ * NOTE that any change to this value will make any pre-
+ * existing backing files, not of the same ERST_IOMEM_SIZE,
+ * unusable to the guest.
+ */
+#define ERST_IOMEM_SIZE (2UL * 4096)
+
+/*
+ * This implementation is an ACTION (cmd) and VALUE (data)
+ * interface consisting of just two 64-bit registers.
+ */
+#define ERST_REG_LEN (2UL * sizeof(uint64_t))
+
+/*
+ * The space not utilized by the register interface is the
+ * buffer for exchanging ERST record contents.
+ */
+#define ERST_RECORD_SIZE (ERST_IOMEM_SIZE - ERST_REG_LEN)
+
+/*
+ * Mode to be used for backing file
+ */
+#define ACPIERST(obj) \
+    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
+#define ACPIERST_CLASS(oc) \
+    OBJECT_CLASS_CHECK(ERSTDeviceStateClass, (oc), TYPE_ACPI_ERST)
+#define ACPIERST_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(ERSTDeviceStateClass, (obj), TYPE_ACPI_ERST)
+
+typedef struct {
+    SysBusDevice parent_obj;
+    Object *hostmem_obj;
+    HostMemoryBackend *hostmem;
+
+    MemoryRegion iomem;
+    uint32_t prop_size;
+    hwaddr prop_base;
+    char *prop_path;
+
+    uint8_t operation;
+    uint8_t busy_status;
+    uint8_t command_status;
+    uint32_t record_offset;
+    uint32_t record_count;
+    uint64_t reg_action;
+    uint64_t reg_value;
+    uint64_t record_identifier;
+
+    unsigned next_record_index;
+    uint8_t record[ERST_RECORD_SIZE]; /* read/written directly by guest */
+    uint8_t tmp_record[ERST_RECORD_SIZE]; /* intermediate manipulation buffer */
+
+} ERSTDeviceState;
+
+static unsigned copy_from_nvram_by_index(ERSTDeviceState *s, unsigned index)
+{
+    /* Read an nvram entry into tmp_record */
+    unsigned rc = ACPI_ERST_STATUS_FAILED;
+    off_t offset = (index * ERST_RECORD_SIZE);
+
+    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
+        MemoryRegion *mr;
+        mr = host_memory_backend_get_memory(s->hostmem);
+        if (mr) {
+            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(mr);
+            memcpy(s->tmp_record, p + offset, ERST_RECORD_SIZE);
+            rc = ACPI_ERST_STATUS_SUCCESS;
+        }
+    }
+    return rc;
+}
+
+static unsigned copy_to_nvram_by_index(ERSTDeviceState *s, unsigned index)
+{
+    /* Write entry in tmp_record into nvram, and backing file */
+    unsigned rc = ACPI_ERST_STATUS_FAILED;
+    off_t offset = (index * ERST_RECORD_SIZE);
+
+    if ((offset + ERST_RECORD_SIZE) <= s->prop_size) {
+        MemoryRegion *mr;
+        mr = host_memory_backend_get_memory(s->hostmem);
+        if (mr) {
+            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(mr);
+            memcpy(p + offset, s->tmp_record, ERST_RECORD_SIZE);
+            rc = ACPI_ERST_STATUS_SUCCESS;
+        }
+    }
+    return rc;
+}
+
+static int lookup_erst_record_by_identifier(ERSTDeviceState *s,
+    uint64_t record_identifier, bool *record_found, bool alloc_for_write)
+{
+    int rc = -1;
+    int empty_index = -1;
+    int index = 0;
+    unsigned rrc;
+
+    *record_found = 0;
+
+    do {
+        rrc = copy_from_nvram_by_index(s, (unsigned)index);
+        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
+            uint64_t this_identifier;
+            this_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
+            if (IS_UEFI_CPER_RECORD(s->tmp_record) &&
+                (this_identifier == record_identifier)) {
+                rc = index;
+                *record_found = 1;
+                break;
+            }
+            if ((this_identifier == ERST_INVALID_RECORD_ID) &&
+                (empty_index < 0)) {
+                empty_index = index; /* first available for write */
+            }
+        }
+        ++index;
+    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
+
+    /* Record not found, allocate for writing */
+    if ((rc < 0) && alloc_for_write) {
+        rc = empty_index;
+    }
+
+    return rc;
+}
+
+static unsigned clear_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
+    bool record_found;
+    int index;
+
+    index = lookup_erst_record_by_identifier(s,
+        s->record_identifier, &record_found, 0);
+    if (record_found) {
+        memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
+        rc = copy_to_nvram_by_index(s, (unsigned)index);
+        if (rc == ACPI_ERST_STATUS_SUCCESS) {
+            s->record_count -= 1;
+        }
+    }
+
+    return rc;
+}
+
+static unsigned write_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = ACPI_ERST_STATUS_FAILED;
+
+    if (s->record_offset < (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE)) {
+        uint64_t record_identifier;
+        uint8_t *record = &s->record[s->record_offset];
+        bool record_found;
+        int index;
+
+        record_identifier = (s->record_identifier == ERST_INVALID_RECORD_ID)
+            ? THE_UEFI_CPER_RECORD_ID(record) : s->record_identifier;
+
+        index = lookup_erst_record_by_identifier(s,
+            record_identifier, &record_found, 1);
+        if (index < 0) {
+            rc = ACPI_ERST_STATUS_NOT_ENOUGH_SPACE;
+        } else {
+            if (0 != s->record_offset) {
+                memset(&s->tmp_record[ERST_RECORD_SIZE - s->record_offset],
+                    0xFF, s->record_offset);
+            }
+            memcpy(s->tmp_record, record, ERST_RECORD_SIZE - s->record_offset);
+            rc = copy_to_nvram_by_index(s, (unsigned)index);
+            if (rc == ACPI_ERST_STATUS_SUCCESS) {
+                if (!record_found) { /* not overwriting existing record */
+                    s->record_count += 1; /* writing new record */
+                }
+            }
+        }
+    }
+
+    return rc;
+}
+
+static unsigned next_erst_record(ERSTDeviceState *s,
+    uint64_t *record_identifier)
+{
+    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
+    unsigned index;
+    unsigned rrc;
+
+    *record_identifier = ERST_INVALID_RECORD_ID;
+
+    index = s->next_record_index;
+    do {
+        rrc = copy_from_nvram_by_index(s, (unsigned)index);
+        if (rrc == ACPI_ERST_STATUS_SUCCESS) {
+            if (IS_UEFI_CPER_RECORD(s->tmp_record)) {
+                s->next_record_index = index + 1; /* where to start next time */
+                *record_identifier = THE_UEFI_CPER_RECORD_ID(s->tmp_record);
+                rc = ACPI_ERST_STATUS_SUCCESS;
+                break;
+            }
+            ++index;
+        } else {
+            if (s->next_record_index == 0) {
+                rc = ACPI_ERST_STATUS_RECORD_STORE_EMPTY;
+            }
+            s->next_record_index = 0; /* at end, reset */
+        }
+    } while (rrc == ACPI_ERST_STATUS_SUCCESS);
+
+    return rc;
+}
+
+static unsigned read_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = ACPI_ERST_STATUS_RECORD_NOT_FOUND;
+    bool record_found;
+    int index;
+
+    index = lookup_erst_record_by_identifier(s,
+        s->record_identifier, &record_found, 0);
+    if (record_found) {
+        rc = copy_from_nvram_by_index(s, (unsigned)index);
+        if (rc == ACPI_ERST_STATUS_SUCCESS) {
+            if (s->record_offset < ERST_RECORD_SIZE) {
+                memcpy(&s->record[s->record_offset], s->tmp_record,
+                    ERST_RECORD_SIZE - s->record_offset);
+            }
+        }
+    }
+
+    return rc;
+}
+
+static unsigned get_erst_record_count(ERSTDeviceState *s)
+{
+    /* Compute record_count */
+    unsigned index = 0;
+
+    s->record_count = 0;
+    while (copy_from_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
+        uint8_t *ptr = &s->tmp_record[0];
+        uint64_t record_identifier = THE_UEFI_CPER_RECORD_ID(ptr);
+        if (IS_UEFI_CPER_RECORD(ptr) &&
+            (ERST_INVALID_RECORD_ID != record_identifier)) {
+            s->record_count += 1;
+        }
+        ++index;
+    }
+    return s->record_count;
+}
+
+static uint64_t erst_rd_reg64(hwaddr addr,
+    uint64_t reg, unsigned size)
+{
+    uint64_t rdval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    rdval = reg;
+    rdval >>= shift;
+    rdval &= mask;
+
+    return rdval;
+}
+
+static uint64_t erst_wr_reg64(hwaddr addr,
+    uint64_t reg, uint64_t val, unsigned size)
+{
+    uint64_t wrval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    val &= mask;
+    val <<= shift;
+    mask <<= shift;
+    wrval = reg;
+    wrval &= ~mask;
+    wrval |= val;
+
+    return wrval;
+}
+
+static void erst_write(void *opaque, hwaddr addr,
+    uint64_t val, unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+
+    if (addr < ERST_REG_LEN) {
+        /*
+         * NOTE: All actions/operations/side effects happen on the WRITE,
+         * by design. The READs simply return the reg_value contents.
+         */
+        erst_debug("ERST write %016lx: val %016lx sz %u\n", addr, val, size);
+        /* The REGISTER region */
+        switch (addr) {
+        case ERST_CSR_VALUE + 0:
+        case ERST_CSR_VALUE + 4:
+            s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
+            break;
+        case ERST_CSR_ACTION + 0:
+/*      case ERST_CSR_ACTION+4: as coded, not really a 64b register */
+            switch (val) {
+            case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
+            case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
+            case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
+            case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+            case ACPI_ERST_ACTION_END_OPERATION:
+                s->operation = val;
+                break;
+            case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
+                s->record_offset = s->reg_value;
+                break;
+            case ACPI_ERST_ACTION_EXECUTE_OPERATION:
+                if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
+                    s->busy_status = 1;
+                    switch (s->operation) {
+                    case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
+                        s->command_status = write_erst_record(s);
+                        break;
+                    case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
+                        s->command_status = read_erst_record(s);
+                        break;
+                    case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
+                        s->command_status = clear_erst_record(s);
+                        break;
+                    case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+                        s->command_status = ACPI_ERST_STATUS_SUCCESS;
+                        break;
+                    case ACPI_ERST_ACTION_END_OPERATION:
+                        s->command_status = ACPI_ERST_STATUS_SUCCESS;
+                        break;
+                    default:
+                        s->command_status = ACPI_ERST_STATUS_FAILED;
+                        break;
+                    }
+                    s->record_identifier = ERST_INVALID_RECORD_ID;
+                    s->busy_status = 0;
+                }
+                break;
+            case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
+                s->reg_value = s->busy_status;
+                break;
+            case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
+                s->reg_value = s->command_status;
+                break;
+            case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
+                s->command_status = next_erst_record(s, &s->reg_value);
+                break;
+            case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
+                s->record_identifier = s->reg_value;
+                break;
+            case ACPI_ERST_ACTION_GET_RECORD_COUNT:
+                s->reg_value = s->record_count;
+                break;
+            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
+                s->reg_value = s->prop_base + ERST_REG_LEN;
+                break;
+            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
+                s->reg_value = ERST_RECORD_SIZE;
+                break;
+            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
+                s->reg_value = 0; /* correct/intended value */
+                break;
+            case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
+                /*
+                 * 100UL is max, 10UL is nominal
+                 */
+                s->reg_value = ((100UL << 32) | (10UL << 0));
+                break;
+            case ACPI_ERST_ACTION_RESERVED:
+            default:
+                /*
+                 * NOP
+                 */
+                break;
+            }
+            break;
+        default:
+            /*
+             * All other register writes are NO-OPs
+             */
+            break;
+        }
+    } else {
+        /* The RECORD region */
+        unsigned offset = addr - ERST_REG_LEN;
+        uint8_t *ptr = &s->record[offset];
+        switch (size) {
+        default:
+        case sizeof(uint8_t):
+            *(uint8_t *)ptr = (uint8_t)val;
+            break;
+        case sizeof(uint16_t):
+            *(uint16_t *)ptr = (uint16_t)val;
+            break;
+        case sizeof(uint32_t):
+            *(uint32_t *)ptr = (uint32_t)val;
+            break;
+        case sizeof(uint64_t):
+            *(uint64_t *)ptr = (uint64_t)val;
+            break;
+        }
+    }
+}
+
+static uint64_t erst_read(void *opaque, hwaddr addr,
+                                unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+    uint64_t val = 0;
+
+    if (addr < ERST_REG_LEN) {
+        switch (addr) {
+        case ERST_CSR_ACTION + 0:
+        case ERST_CSR_ACTION + 4:
+            val = erst_rd_reg64(addr, s->reg_action, size);
+            break;
+        case ERST_CSR_VALUE + 0:
+        case ERST_CSR_VALUE + 4:
+            val = erst_rd_reg64(addr, s->reg_value, size);
+            break;
+        default:
+            break;
+        }
+    } else {
+        /*
+         * The RECORD region
+         */
+        uint8_t *ptr = &s->record[addr - ERST_REG_LEN];
+        switch (size) {
+        default:
+        case sizeof(uint8_t):
+            val = *(uint8_t *)ptr;
+            break;
+        case sizeof(uint16_t):
+            val = *(uint16_t *)ptr;
+            break;
+        case sizeof(uint32_t):
+            val = *(uint32_t *)ptr;
+            break;
+        case sizeof(uint64_t):
+            val = *(uint64_t *)ptr;
+            break;
+        }
+    }
+    erst_debug("ERST read  %016lx: val %016lx sz %u\n", addr, val, size);
+    return val;
+}
+
+static size_t build_erst_action(GArray *table_data,
+    uint8_t serialization_action,
+    uint8_t instruction,
+    uint8_t flags,
+    uint8_t width,
+    uint64_t address,
+    uint64_t value,
+    uint64_t mask)
+{
+    /* See ACPI spec, Error Serialization */
+    uint8_t access_width = 0;
+    build_append_int_noprefix(table_data, serialization_action, 1);
+    build_append_int_noprefix(table_data, instruction         , 1);
+    build_append_int_noprefix(table_data, flags               , 1);
+    build_append_int_noprefix(table_data, 0                   , 1);
+    /* GAS space_id */
+    build_append_int_noprefix(table_data, AML_SYSTEM_MEMORY   , 1);
+    /* GAS bit_width */
+    build_append_int_noprefix(table_data, width               , 1);
+    /* GAS bit_offset */
+    build_append_int_noprefix(table_data, 0                   , 1);
+    /* GAS access_width */
+    switch (width) {
+    case 8:
+        access_width = 1;
+        break;
+    case 16:
+        access_width = 2;
+        break;
+    case 32:
+        access_width = 3;
+        break;
+    case 64:
+        access_width = 4;
+        break;
+    default:
+        access_width = 0;
+        break;
+    }
+    build_append_int_noprefix(table_data, access_width        , 1);
+    /* GAS address */
+    build_append_int_noprefix(table_data, address, 8);
+    /* value */
+    build_append_int_noprefix(table_data, value  , 8);
+    /* mask */
+    build_append_int_noprefix(table_data, mask   , 8);
+
+    return 1;
+}
+
+static const MemoryRegionOps erst_rw_ops = {
+    .read = erst_read,
+    .write = erst_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+void build_erst(GArray *table_data, BIOSLinker *linker,
+    const char *oem_id, const char *oem_table_id)
+{
+    unsigned action, insns = 0;
+    unsigned erst_start = table_data->len;
+    unsigned iec_offset = 0;
+    Object *obj;
+    hwaddr base = 0x0UL;
+
+    obj = object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
+    if (obj) {
+        base = ACPIERST(obj)->prop_base;
+    }
+
+    /* See ACPI spec, Error Serialization */
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    /* serialization_header_length */
+    build_append_int_noprefix(table_data, 48, 4);
+    /* reserved */
+    build_append_int_noprefix(table_data,  0, 4);
+    iec_offset = table_data->len;
+    /* instruction_entry_count (placeholder) */
+    build_append_int_noprefix(table_data,  0, 4);
+
+#define BEA(I, F, W, ADDR, VAL, MASK) \
+    build_erst_action(table_data, action, \
+        ACPI_ERST_INST_##I, F, W, base + ADDR, VAL, MASK)
+#define MASK8  0x00000000000000FFUL
+#define MASK16 0x000000000000FFFFUL
+#define MASK32 0x00000000FFFFFFFFUL
+#define MASK64 0xFFFFFFFFFFFFFFFFUL
+
+    for (action = 0; action < ACPI_ERST_MAX_ACTIONS; ++action) {
+        switch (action) {
+        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_END_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
+            insns += BEA(WRITE_REGISTER      , 0, 32,
+                ERST_CSR_VALUE , 0, MASK32);
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER_VALUE , 0, 32,
+                ERST_CSR_VALUE, 0x01, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 32,
+                ERST_CSR_VALUE, 0, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 64,
+                ERST_CSR_VALUE, 0, MASK64);
+            break;
+        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
+            insns += BEA(WRITE_REGISTER      , 0, 64,
+                ERST_CSR_VALUE , 0, MASK64);
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 32,
+                ERST_CSR_VALUE, 0, MASK32);
+            break;
+        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_RESERVED:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 64,
+                ERST_CSR_VALUE, 0, MASK64);
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 64,
+                ERST_CSR_VALUE, 0, MASK32);
+            break;
+        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 32,
+                ERST_CSR_VALUE, 0, MASK32);
+            break;
+        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
+            insns += BEA(WRITE_REGISTER_VALUE, 0, 32,
+                ERST_CSR_ACTION, action, MASK8);
+            insns += BEA(READ_REGISTER       , 0, 64,
+                ERST_CSR_VALUE, 0, MASK64);
+        default:
+            insns += BEA(NOOP, 0, 0, 0, action, 0);
+            break;
+        }
+    }
+
+    /* acpi_data_push() within BEA() can result in new GArray pointer */
+    *(uint32_t *)(table_data->data + iec_offset) = cpu_to_le32(insns);
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + erst_start),
+                 "ERST", table_data->len - erst_start,
+                 1, oem_id, oem_table_id);
+}
+
+/*******************************************************************/
+/*******************************************************************/
+static int erst_post_load(void *opaque, int version_id)
+{
+    /*ERSTDeviceState *s = opaque;*/
+    erst_debug("+erst_post_load(%d)\n", version_id);
+    /* Ensure nvram persists into backing file */
+    erst_debug("-erst_post_load()\n");
+    return 0;
+}
+
+static const VMStateDescription erst_vmstate  = {
+    .name = "acpi-erst",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = erst_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(operation, ERSTDeviceState),
+        VMSTATE_UINT8(busy_status, ERSTDeviceState),
+        VMSTATE_UINT8(command_status, ERSTDeviceState),
+        VMSTATE_UINT32(record_offset, ERSTDeviceState),
+        VMSTATE_UINT32(record_count, ERSTDeviceState),
+        VMSTATE_UINT64(reg_action, ERSTDeviceState),
+        VMSTATE_UINT64(reg_value, ERSTDeviceState),
+        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
+        VMSTATE_UINT8_ARRAY(record, ERSTDeviceState, ERST_RECORD_SIZE),
+        VMSTATE_UINT8_ARRAY(tmp_record, ERSTDeviceState, ERST_RECORD_SIZE),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void erst_realizefn(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *d = SYS_BUS_DEVICE(dev);
+    ERSTDeviceState *s = ACPIERST(dev);
+    unsigned index = 0;
+
+    erst_debug("+erst_realizefn()\n");
+
+    if (!(s->prop_size > ERST_RECORD_SIZE) &&
+        (s->prop_size <= 0x04000000)) {
+        error_setg(errp, "'size' property %d is not set properly",
+            s->prop_size);
+        return;
+    }
+
+    if (!s->prop_path) {
+        s->prop_path = (char *)(TYPE_ACPI_ERST ".backing");
+    }
+
+    s->hostmem = NULL;
+    s->hostmem_obj = object_new(TYPE_MEMORY_BACKEND_FILE);
+    object_property_set_str(s->hostmem_obj, "mem-path", s->prop_path, &error_fatal);
+    object_property_set_bool(s->hostmem_obj, "share", true, &error_fatal);
+
+    /* MemoryBackend upsizes to a PAGE_SIZE multiple for prop_size */
+    object_property_set_int(s->hostmem_obj, "size", s->prop_size, &error_fatal);
+    user_creatable_complete(USER_CREATABLE(s->hostmem_obj), &error_fatal);
+    s->hostmem = MEMORY_BACKEND(s->hostmem_obj);
+
+    /* Convert prop_size to integer multiple of ERST_RECORD_SIZE */
+    s->prop_size -= (s->prop_size % ERST_RECORD_SIZE);
+
+    /*
+     * MemoryBackend initializes contents to zero, but we actually
+     * want contents initialized to 0xFF.
+     */
+    if (copy_from_nvram_by_index(s, 0) == ACPI_ERST_STATUS_SUCCESS) {
+        if (s->tmp_record[0] == 0x00) {
+            memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
+            index = 0;
+            while (copy_to_nvram_by_index(s, index) == ACPI_ERST_STATUS_SUCCESS) {
+                ++index;
+            }
+        }
+    }
+
+    /* Initialize record_count */
+    get_erst_record_count(s);
+
+    erst_debug(ACPI_ERST_BASE_PROP" %016llx\n", (unsigned long long)s->prop_base);
+    erst_debug(ACPI_ERST_SIZE_PROP" %x\n", s->prop_size);
+    erst_debug(ACPI_ERST_FILE_PROP" %s\n", s->prop_path);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &erst_rw_ops, s,
+                          TYPE_ACPI_ERST, ERST_IOMEM_SIZE);
+    sysbus_init_mmio(d, &s->iomem);
+    erst_debug("-erst_realizefn()\n");
+}
+
+static void erst_unrealizefn(DeviceState *dev)
+{
+    ERSTDeviceState *s = ACPIERST(dev);
+
+    erst_debug("+erst_unrealizefn()\n");
+
+    if (s->hostmem_obj) {
+        object_unref(s->hostmem_obj);
+    }
+
+    erst_debug("-erst_unrealizefn()\n");
+}
+
+static void erst_reset(DeviceState *dev)
+{
+    ERSTDeviceState *s = ACPIERST(dev);
+
+    erst_debug("+erst_reset(%p) %d\n", s, s->record_count);
+    s->operation = 0;
+    s->busy_status = 0;
+    s->command_status = ACPI_ERST_STATUS_SUCCESS;
+    /* indicate empty/no-more until further notice */
+    s->record_identifier = ERST_INVALID_RECORD_ID;
+    s->record_offset = 0;
+    s->next_record_index = 0;
+    /* NOTE: record_count and nvram are initialized elsewhere */
+    erst_debug("-erst_reset()\n");
+}
+
+void setup_erst_dev(hwaddr base, Error *error_fatal)
+{
+    SysBusDevice *s;
+    DeviceState *dev;
+    ERSTDeviceState *e;
+
+    dev = qdev_try_new(TYPE_ACPI_ERST);
+    if (!dev) {
+        error_report("couldn't create ERST device");
+        exit(1);
+    }
+    e = ACPIERST(dev);
+    e->prop_base = base;
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, base);
+}
+
+static Property erst_properties[] = {
+    DEFINE_PROP_UINT32(ACPI_ERST_SIZE_PROP, ERSTDeviceState, prop_size, 0x00010000),
+    DEFINE_PROP_STRING(ACPI_ERST_FILE_PROP, ERSTDeviceState, prop_path),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void erst_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    erst_debug("+erst_class_init()\n");
+    dc->realize = erst_realizefn;
+    dc->unrealize = erst_unrealizefn;
+    dc->reset = erst_reset;
+    dc->vmsd = &erst_vmstate;
+    device_class_set_props(dc, erst_properties);
+    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    erst_debug("-erst_class_init()\n");
+}
+
+static const TypeInfo erst_type_info = {
+    .name          = TYPE_ACPI_ERST,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .class_init    = erst_class_init,
+    .instance_size = sizeof(ERSTDeviceState),
+};
+
+static void erst_register_types(void)
+{
+    type_register_static(&erst_type_info);
+}
+
+type_init(erst_register_types)
-- 
1.8.3.1


