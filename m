Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747663A48C9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:39:54 +0200 (CEST)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrm4M-0001QO-KU
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwn-0006hg-HC
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:32:01 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwg-0007i9-9I
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:32:01 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BIM6vT003206; Fri, 11 Jun 2021 18:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=XPPEVQ94uEm3VjXlv03rrTzIl6c42tja0FootmscntU=;
 b=HW6fcivSrcwFimeio6fb/1sEXtpUdjdbQOkmFJz+f38aQZs7E10U3s4nGcizkOJy60wJ
 BxQ+JM9y3gbstor9WrVZ1lHgxSCY1kdewWCCKQP4JG+vCXbvw23Ebyzm5lXdSjjTqfUf
 PaJLa2HZAMOfFIidWsSn8qBRoCi0RpkzT05lrQ5oNsLNGpZ2LzMV59Nb/ykoJrnyLB+X
 POIOWecYn+aHQinSAdsYp5HRXSSL3tukottzjPdVTrXJLn65dkKuA4uHnzr/yVGm1B/N
 AVeDKSQtLvmtY1sJ2yi4jnyltV4l+vv24ifDrdXguapP3zzDkjXF9PqNMGl55gUbNmIK bA== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3944a1g5qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:49 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15BITjXd011790;
 Fri, 11 Jun 2021 18:31:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3030.oracle.com with ESMTP id 3949cw8h3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tj0xzAyHF5ZYH1rXDoJYIZTRbRAmihD+WiQ92rn8bwUHbeKkQXiV7gOJSohMa+wf1mBOYVtG/R4xsRxkiH+oxdTOjn38sT9ikbx0NjU/AkDpy9KB1zvahWWlm+m79EWbZHkzGRfZ3390VzqtgxeQuLwKfYyi6okVotAg4HnzhbvRYL4VoIR9+/Rjz/dyE6Pxr4vCsudSEIbNRMz8VtqeIuDtRW/3BtyN2EA76UNKfh4WFsIRG8dxBU3U5klIM/P1mFxYzBZHYizb2iaqvn3MpuAHrfpQ8zCRiTyfQ2NiqsZi3vvbAjry+zKCHlSq7jxbEYJKMhvoSuAR75Td9sS34w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPPEVQ94uEm3VjXlv03rrTzIl6c42tja0FootmscntU=;
 b=imWKNlRXFUkoht83IpQnbtEyA02TqzRYSdsB2JTl7PEAw/tu5+JkyrMr5WvCqZl3KE6GrByF1cwC5FIGhMFYAQru9J5XGTu4iNX+Kf/pWf7mcbJcPGwlx/hLr+QqIbkeKi83RhZ+K0yxda3b1DXE3A7A0ur67Qnh991TJ4Rk9A9NLibdwAOM6excd+adFN0YUypYMRIgh6YN1JP/H9ZpVnLp/g3nuMyRBZRjRvuCniuf1SZSPQOiuxnkweWJoiu+LLOI7mD+7suviJD6bJPhU4SRtHm8iMPhAjzpKp3y+wOPkuGb/g6UfHbKymuuWoBKUEzaEL39L0PHl6CSNBvHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPPEVQ94uEm3VjXlv03rrTzIl6c42tja0FootmscntU=;
 b=f+6N9Am7fl9y8BHUC98HzUSstFiJyqCOjp6MQb1uaNXdH81kZMzVhzBRnoWSM8FxutKo7I+cojWovVzQZg1EfzwKfon5r7wzfVlt2+GiVeEGNROOT+gM01/uwxNr2QSs8lrSTXJ1LPBvubOc2KalAmfz3dkaPz5Ibx9jSKO+diQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5457.namprd10.prod.outlook.com (2603:10b6:303:13f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 18:31:46 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 18:31:46 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/6] ACPI ERST: support for ACPI ERST feature
Date: Fri, 11 Jun 2021 14:31:20 -0400
Message-Id: <1623436283-20213-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
References: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: SA9PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:806:24::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0097.namprd13.prod.outlook.com (2603:10b6:806:24::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 18:31:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20e00ba1-163a-4fbf-af97-08d92d072afb
X-MS-TrafficTypeDiagnostic: CO6PR10MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5457696DA6B4ABAA6242117597349@CO6PR10MB5457.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVPhh42T6S9fC9pWugvz2FsIQiWod0FIZTp4TU7G1mkCvifrWoJxm2ZeRsiMRz7WW4ed/5axfsQwwXtjsfwSQyhvGdM8l/jWxEPKhcCKlaDFyx92GBQpyMl0Kaldkgdg+1JzqfwRWmH+XmdilzrMBWX0G6lOzhbNLJXfl3yLVW0AcPIQTjGKfoO+4DDHu2Ru1XAgVcKOyZNYoTmNHreCBLDdrAuBeIL77NMGxZ350b0AcxxXMJj6sSoXlKS7dv6N2a82WRTRW8QXXLo/X1SaNghQcVmHgXG7kocWu1/OeZ5bjDIpl2jHrOO72JmcpaP/ZbCIAAmtXvtnD0LBTMaMmW6Lms3GnRWLjyi05NrNEQsW7a72TxnE6EZWoX1AIHKEIsK1VVpphnw8yttWaFQ9I+p9CzgPlXfNsPSMoIEKcwW/3Y+19b1/58yqOgvfjrf1XmmwCGC3YbfYhmdCr9QdFf1Am79xwnGOeG6Vx5w1+R+VeCemmMcpwxEZPuttOBD7N11dk0+uBBxDnMaxnAE7jIUQrslgGCL0dbJBPXx5ynaMy+VNBr7kJH/nAZQK5Oiu0Ci6TROcxAIdFxHWbwXM9La3FOV0bR1pNotUds8QHXKalwrD0mcyLZELP72KE6nE5ff1wVS2hRoZtke4tsPA1nfHoOE2/bY8sTsvbjBiWNq+5e5Bra9Evn1KHqbiLathmIghSru0nPuDKiFpUDQevsg8hyNrTu1TxG01ibY9BUr593JlYuXN3J+xBUbWE+zgWW5DHnAUCSKm9rfnVRxGd4Xv1xf5seLvDVTWG2kvGiErh3GLrmVgFMDvXX06cdgNj59gYql4XIczXWM/F7wlVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(83380400001)(7696005)(8936002)(26005)(36756003)(30864003)(52116002)(6666004)(66556008)(186003)(6486002)(966005)(478600001)(66476007)(4326008)(66946007)(316002)(5660300002)(86362001)(16526019)(2616005)(2906002)(6916009)(38350700002)(956004)(8676002)(38100700002)(107886003)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zlD76kHIEUKAZ/frwMbSgYtfRtfW3PclpdeVMeArc3KgtbnPlsDwN/HIei3A?=
 =?us-ascii?Q?Aaz0KWxovA5wOVPdYMQ+9WnfX0Y3GejKU0Q6UfRTlbEwnMRyJwLMVbFmE68F?=
 =?us-ascii?Q?4ktAbJzlklkeq6RueACYasanQKIWvfAvVK2TJod55ZdU9DEjgGbnWOOb4wFI?=
 =?us-ascii?Q?rfcjM35lXDgfbDbFQ8RPUM5EZ+mIlYxboTFeKqyXtEsp77ewXDRs3BZH/pVU?=
 =?us-ascii?Q?arPuVotwwgutwnc/uDwfCGcYSLzJDpi454QkHfMhpqdlVhv3rnkJGG638I+8?=
 =?us-ascii?Q?oNQObTkkajpOknxhckauLYNjITEct/vwNw8VfMUkzWPpIXwWPijItVgNxUXA?=
 =?us-ascii?Q?5nI2K6YaAOpW6s6IEg0f2sSeNMsrdX6m2bIy7Svz10kjZfKz+ij92NXmXCCv?=
 =?us-ascii?Q?680waUPNYKgo3PnpY4HrUu7z90PQx/t0i88yQsQZ37bVbMxHx6swWSJESAwJ?=
 =?us-ascii?Q?bgMfjItgGgWxMdgu7VT3nAGUwx81Z8dyFLF1OCtjSD8DtEg8ellE9O8YQS7q?=
 =?us-ascii?Q?oXi9R1xaxK0aIAbc0+Eu0Lo0BGMOJUF5bViSDb1c48XdLCDxwckk7VOiGU4I?=
 =?us-ascii?Q?n/Ombpdh98w8ZRkCYpL7GVhP5Vp5IWdjndO0AFnJG9gHRf8ZTEUPbZMU35U2?=
 =?us-ascii?Q?A/yVuunrv/LCOoGvAUCal6KmqPFdxUWst9d8YMnXx91QvHkymO/IUz73ZkN0?=
 =?us-ascii?Q?wV5Homdw9at07iZePn2BDLeczLrnl8C7T0kDH2G11no/mDM6jE6565xBdKx0?=
 =?us-ascii?Q?Tcgq22Q1RL1FWsP2WBscbRO8O6+LmamMht1x7B8PKbrc8UctSacVpMJsf42v?=
 =?us-ascii?Q?TxHQq06dAQMUJ2ddJpI+K+FFAeIGaF/W8s+oycfsYBlcHqwDTt6JY+s2ORdm?=
 =?us-ascii?Q?Nfb/sIvAmNyb9wBXNQ2iGAAclLGvY7UrKLPsFy8a4utqIM6aTYzyzULAQfBg?=
 =?us-ascii?Q?8dDF6uov9+g//Fd299RpMoN3EbqieTu5/rA6ZaeI8iweIp4n8ydu+wW+zFmW?=
 =?us-ascii?Q?pbZh1gSYOcST5FYWYMLd8Zt/1DuSlWAZTS0HU5alQyKh13jpzIIkf0/XNktT?=
 =?us-ascii?Q?TIkFB6/h4ChU3S7PEd8BcMBKFMZ5oETZ/fvTW3F4DU1nzQE1Ql6iHKd0TItM?=
 =?us-ascii?Q?l+qyLh09oGpPYrqGGhtIenoYZZxFii27iRbX2KFoLt2D8U/CwNi+ATd52LJk?=
 =?us-ascii?Q?e7cHFHmM4rCS0ZzStEmnyRyoGtml/SIafJotRI68n2+aFYv2rPnD4D0m/33K?=
 =?us-ascii?Q?GU62rsrXBLu6N/0/DJ4jYN+/N9wl6jdrATCZAZtppxxECsI+wU2phCJ4MCQX?=
 =?us-ascii?Q?BLHTXKAYmHaiY+n3dOxLfO+A?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e00ba1-163a-4fbf-af97-08d92d072afb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 18:31:46.0466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7VeKz0f7qsw4+E71FpcoGbAip+dvfESocXnYi5UF9HERhAOFxf1A4ruT403PX4s75KI8ICCa+vZO2wBR5nRr/x79YDoj78quTWMwCDtQ7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5457
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10012
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110115
X-Proofpoint-ORIG-GUID: 3hJUVYZJ5Ono--OAk0RWIdcCdWWLdG4e
X-Proofpoint-GUID: 3hJUVYZJ5Ono--OAk0RWIdcCdWWLdG4e
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

This change implements the support for the ACPI ERST feature[1,2].

To utilize ACPI ERST, a memory-backend-file object and acpi-erst
device must be created, for example:

 qemu ...
 -object memory-backend-file,id=erstram,mem-path=acpi-erst.backing,
  size=0x10000,shared=on
 -device acpi-erst,memdev=erstram,bus=pcie.0

For proper operation, the ACPI ERST device needs a memory-backend-file
object with the following parameters mem-path, size, and shared.

 - id: The id of the memory-backend-file object is used to associate
   this memory with the acpi-erst device.

 - size: The size of the ACPI ERST backing storage. This parameter is
   required.
 - mem-path: The location of the ACPI ERST backing storage file. This
   parameter is also required.

 - shared: The shared=on parameter is required so that updates to the
   ERST back store are written to the file immediately as well. Without
   it, updates the the backing file are unpredictable and may not
   properly persist (eg. if qemu should crash).

The ACPI ERST device is a simple PCI device, and requires these two
parameters:

 - memdev: Is the object id of the memory-backend-file.

 - bus: The name of the pci bus to which to connect.

This change also includes erst.c in the build of general ACPI support.

[1] "Advanced Configuration and Power Interface Specification",
    version 6.2, May 2017.
    https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf

[2] "Unified Extensible Firmware Interface Specification",
    version 2.8, March 2019.
    https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/erst.c      | 880 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build |   1 +
 2 files changed, 881 insertions(+)
 create mode 100644 hw/acpi/erst.c

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
new file mode 100644
index 0000000..1a72fad
--- /dev/null
+++ b/hw/acpi/erst.c
@@ -0,0 +1,880 @@
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
+#include "hw/qdev-core.h"
+#include "exec/memory.h"
+#include "qom/object.h"
+#include "hw/pci/pci.h"
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
+    PCIDevice parent_obj;
+    HostMemoryBackend *hostmem;
+
+    MemoryRegion iomem;
+    uint32_t prop_size;
+    hwaddr prop_base;
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
+        pcibus_t addr = pci_get_bar_addr(PCI_DEVICE(obj), 0);
+        ACPIERST(obj)->prop_base = base = (hwaddr)addr;
+        erst_debug("ERST PCI BAR 0: %016llx\n", (unsigned long long)addr);
+    } else {
+        return;
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
+    erst_debug("+erst_post_load(%d)\n", version_id);
+    /*
+     * Ensure nvram persists into backing file.
+     * The vmstate_register_ram_global() puts the memory in
+     * migration stream, where it is written back to the memory
+     * upon reaching the destination, which causes the backing
+     * file to be updated (with shared=on).
+     */
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
+static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
+{
+    ERSTDeviceState *s = ACPIERST(pci_dev);
+    unsigned index = 0;
+
+    erst_debug("+erst_realizefn()\n");
+    if (!s->hostmem) {
+        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
+        return;
+    } else if (host_memory_backend_is_mapped(s->hostmem)) {
+        error_setg(errp, "can't use already busy memdev: %s",
+                   object_get_canonical_path_component(OBJECT(s->hostmem)));
+        return;
+    }
+
+    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
+    s->prop_size = object_property_get_int(OBJECT(s->hostmem), "size", &error_fatal);
+
+    /* Convert prop_size to integer multiple of ERST_RECORD_SIZE */
+    s->prop_size -= (s->prop_size % ERST_RECORD_SIZE);
+
+    /*
+     * MemoryBackend initializes contents to zero, but we actually
+     * want contents initialized to 0xFF, ERST_INVALID_RECORD_ID.
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
+    memory_region_init_io(&s->iomem, OBJECT(pci_dev), &erst_rw_ops, s,
+                          TYPE_ACPI_ERST, ERST_IOMEM_SIZE);
+    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
+    vmstate_register_ram_global(host_memory_backend_get_memory(s->hostmem));
+
+    erst_debug("size %x\n", s->prop_size);
+
+    erst_debug("-erst_realizefn()\n");
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
+static Property erst_properties[] = {
+    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void erst_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    erst_debug("+erst_class_init()\n");
+    k->realize = erst_realizefn;
+    k->vendor_id = 0x1337;
+    k->device_id = 0x0001;
+    k->revision = 0x00;
+    k->class_id = PCI_CLASS_OTHERS;
+    dc->reset = erst_reset;
+    dc->vmsd = &erst_vmstate;
+    dc->user_creatable = true;
+    device_class_set_props(dc, erst_properties);
+    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    erst_debug("-erst_class_init()\n");
+}
+
+static const TypeInfo erst_type_info = {
+    .name          = TYPE_ACPI_ERST,
+    .parent        = TYPE_PCI_DEVICE,
+    .class_init    = erst_class_init,
+    .instance_size = sizeof(ERSTDeviceState),
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    }
+};
+
+static void erst_register_types(void)
+{
+    type_register_static(&erst_type_info);
+}
+
+type_init(erst_register_types)
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index dd69577..262a8ee 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -4,6 +4,7 @@ acpi_ss.add(files(
   'aml-build.c',
   'bios-linker-loader.c',
   'utils.c',
+  'erst.c',
 ))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))
-- 
1.8.3.1


