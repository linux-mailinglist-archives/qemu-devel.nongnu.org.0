Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19905532EB3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:14:36 +0200 (CEST)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXB4-0001IS-UK
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVQ-0008JT-CK
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVN-0003ZU-HL
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:32 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFJ4l9018983;
 Tue, 24 May 2022 15:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=oA3buILgr1opUPXBGKpMa2LPGfj42Ra/K46zYSugDbM=;
 b=RhsFS8wwVRpssQdantQxdtgvN9TJg6kgKzCcGor3Tw18rW3n8hnKDTv+yTbOjjVT7Vu3
 hbASdXAA09jGOgZUWBS26LrQLUgxJaOMHBZw8f+Jpc5IA6tCG00Fkl5semkZT+Ms6vh0
 57BTlUpUR2bJ42zv86CJHxrZApDGdPkhRfKvwxNHRa33udimSMSlKDdaWif0fPRhkbYP
 biGYWPe67rLcYMSnwj/3SNTvCwak9KmR6LVhymA+fUqUJji/dODYwIw55t0LGUFh9ZnV
 yv6hVLc8vvyMg4Qt2Av5Tv8hVIf4qnFD5j4mC4NPxfNiykpDFIqtVPfTkiui/ZcQWoR+ yA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6pp06scc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:23 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFGNNJ026316; Tue, 24 May 2022 15:31:22 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph8drdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpP88F3nz1C4KqM3DL4rggpLPD66vl7feXPZl6TYAt+OgauhuvQJVlIhEdJlqapjdpc9jdhKjT4xVavd7awBgxXc/WiCgI8SHwoAU0tUTG+pa2lWLjBYKsDhYKFqVc6JNAsXs02RrZDQfSJI/POZtNXqWrVBZ8FHh89gBleDmJSV9TfU00aaoJA5SYWZUOkhsfFd0dyH3Tr7u093SISNe4gIZlPh8ake9YdcDZv1DkEDA9vjsM2GMraYJi8qV8TodKDdNUR1il/TeUP8cy0bcCTRUxCqx62FbT4lpoubKNSyHzCm0BAzSHP4UhjmIuZVCk0l93d/vk5JqMoxAkzS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA3buILgr1opUPXBGKpMa2LPGfj42Ra/K46zYSugDbM=;
 b=lohEj2oXdtjCOTZTewT3mPbB/Vb0jlijF9c7/AZmWyDvGyvFVf5E8kqpucX+MaElAgsqOBhZrxPLZeiV3xaJyp8jw6qkYariU0ImbsOGItDor3hBuBDCwKlPRWuL0AkERG0GWEFUgqVHFpy8fN1Footd6QYlhQPz4pAgaeuiecrwRq5YcdEELK65/oF2dQF1JFIZuF4Ba14rz0geXLHT1WPZv6/4oKRGSmFute9SgYaD59E/2ACUrnkjug1QAVXufVXc4Wm50Jr//F8M61NpqEdMxVz8RpwV9UvL6TC1m8+iRsIewpNPVhlDnqAiKkJEplbq+O8MpJwceZ4u5sigUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA3buILgr1opUPXBGKpMa2LPGfj42Ra/K46zYSugDbM=;
 b=js4OcV4zHEHvDM30blVup6+7oqVdgb6+CdAtQ+r5oHKUfbl1EamXA9dwEXh31HQ/JkATWWePATZNwWf9qX0hM5mQju0jRUKRO5Wc86jZ07MHPB99oKqkUJRf3iw5iRmkTj8lhIpit0wL8tpM+VmfOU5wL0Ajw5Za+FaKr5qV8Q8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:31:20 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:31:20 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 13/14] vfio-user: handle device interrupts
Date: Tue, 24 May 2022 11:30:32 -0400
Message-Id: <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86a064a3-157e-4def-68b9-08da3d9a7378
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3117005ABD41945726BA76C390D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ILZiBBPIMUG1bfbOe73cCF77WXdFUWbQYebJp1k6lk6HdLyw7YbIdKCUolepOxVWqRqJ/bXLVAKQhTYmYohcJIpaZQri72jbC+S1+41isfH9O3DeU78hcVInTys7GvaQKoV3Vg7pEEPvPYmMsgkR6O9hoQWFDXvTIQvEbAk86bcGQPrd4bsTtKNgmrZ8HW74aEvxI9gcVmkCYwi9RCvvBKU5b1Cb96ozrNeP39bUJyJLR69upO4a83EqzVZbCTcbwigxcJzZLwdcmuBYhT9NQCdsKdDrh0Wbd9E1GP6STvNvqbeFBQe5m21SIL8Viazwyt8s9qUS66+mDRumXtgbtem51tf/Ls4L/XLe+6v3p3Mf/pW3n0FrNISxd2xPCwNd3S1F8cGZFGqIrWi0fx7PfLPs6ZCBurkaxZSx8DhQsgUI4SDT99IigEszyZsL6nKjViMRb9GktusgZs4LqSw/qdzwWj40xyQQf8jIxvgifPibhAA86aGvgnozuPoKmathA99Zmz2fLJlnumblmR5BJgPd0e0td56mGboIGY+y2iVfOUGiF3V1LfAYrY2eKEJ9Mg9ldMLC7bIQpd6dIKXFa3IKSa5t5ByTORXRb5VZ8is4tj+JJ69E0/IFD4SW1pbryUPnxuZJkWb5jQdkl7IvnsaT0S9cDma7pYTT2WD8GbutkVj4HLYr3SiJpZ3VRiVJZFqccOLQdRvDu2HU2hRxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(30864003)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yn/SGMVJ3II3PPZJcDPg3Bst9tmkpJXlYPl7U0FF2P16t3zAkAXy3Ke+WEG+?=
 =?us-ascii?Q?eNz2AMG7HLCGQu9JNc3vsVeEX3/I4zDBYFiK8oAJ+I01le3SdpVjKiWJsmTg?=
 =?us-ascii?Q?251IyqKbiI5G0Z9UL0p/d4C/cFVoq+HOmsfw0b0L2TXm/SLsk2UwPg9bZvnd?=
 =?us-ascii?Q?fqtmIxeG5Yq9+04o2xmPpSsGVNothwa6+VruDgxDvbekMnoSinqRt+e4/mce?=
 =?us-ascii?Q?SSz1y1CiE8ADRDU7BE636e9v3eOzQSzAyVbFubBaSWlGvnYCUiL63FWKJ8JY?=
 =?us-ascii?Q?6u/AN1y2jQwoLrsUqFv8Z0i4vNfyVJp/11P1Bs2SxinhSD3iw6rRJ7uPvXx4?=
 =?us-ascii?Q?noQRJm0TWmx/zoZrS2IbQLifC1BsuEOKdIx5cTYWjsJCpjC+KD529vPG455X?=
 =?us-ascii?Q?WAbg+jLJQUEIp8S/p3Lh/z8CmM4zJJ+dJvwnwoBMR5G0aVFVIXUJ9A8vKS2j?=
 =?us-ascii?Q?CxVFsq5RqgQ9FFWvbGtCeCRff1EDR2uUbWoH39Uf0HyeOuyLcdmT08KiQcdM?=
 =?us-ascii?Q?FPPudSNxBn2NnL3sRd7umib02zZAiQFLrHmXHqrfdWG5xvNRYXxEXqzDwP0k?=
 =?us-ascii?Q?s7+/tUVvEnmn25xxyx6yCmq3e0I9uaYv5bJoRcUyaRqJ0lyb/Sdq5twC09Of?=
 =?us-ascii?Q?OY0hL5Us9B6zLNSzk2lwFus5E3TsV9aqzrEboPd9L/3a+C/NsI5WSZzu3kLz?=
 =?us-ascii?Q?gvZE1YXyk7m+F2sYXYGThpU6H3++60Bp0wC4k03A3T6qGy4DfNaVQEB9WIVF?=
 =?us-ascii?Q?Dr+X+OaJd5VurkH48PiozoE2w+XvKj9hCa1oAW7S2xKUqZc705RLh5rW2K2z?=
 =?us-ascii?Q?I6R1mUgeOBv40ZB6rIwkIAgRoVKqnFBkXfleNpz6eBoPsN/C7Z025H/jDgxJ?=
 =?us-ascii?Q?UxrZMIpwHyL1J8gviEiGQEyUFJ8dgo5ZG0QSgbH/apn6KWEFIBM3aYb+doBd?=
 =?us-ascii?Q?knu+uLAyA4QKFWot2IrCL2MjprUNTko8CQsIiwyo7rnEDkP3iNb3wxo5IbAW?=
 =?us-ascii?Q?Vx/V4+O+T4EwJ4D68wHqzXIgaNeM2dW/Ngsf6xSi7zLqQXwMK/8uDfUPZqFf?=
 =?us-ascii?Q?boUgYZPRBce9cPTSGz250Ab4kuxuUPGvI12lJy8A84P+17gPw0CBwp4Rw1hE?=
 =?us-ascii?Q?wb4vxD/LelMlF6EjdtYeizYKEd5WQXJykZDmh2YzG/Akne+9r/OJca+si/Wr?=
 =?us-ascii?Q?nVJmAjLXYuhn3S4Fx1qLv8X4Ll5zCFunqmJ0OjC5NdYOQEIUeWUBx2dW+IBS?=
 =?us-ascii?Q?9mzTzaz6eNlglr/CgteoeCgWBTUe++kFZjxD9lZDPVsTWo2KW6mRg5yeUU8+?=
 =?us-ascii?Q?DXJiuFqqj1vll6919u8bLl0NxG9kxojN9EWTAK3vKb0pu8t7JCmwDw4wGSmv?=
 =?us-ascii?Q?fDc1/CoApGO0gDj6s3gsyfJg93QHuLTYMaPoKEkjJ23FuVe65yA7yOcEyjl3?=
 =?us-ascii?Q?qsdojcI22coBdEhkBbGt7wE8K78+jtxHlPWTbBTrnU63YRemGB8LXPFzz9jQ?=
 =?us-ascii?Q?wpsI3J3VviBl5o7/ut03n2wEVAGW3bOeGUIegTDLBJvIPOPqjUthOLFTUvAF?=
 =?us-ascii?Q?xgpQI/WzVgKKHqRSa2pJU2j5rC8QQQGM3UipR0KX3sv+51TjcdEK6Zvfvkii?=
 =?us-ascii?Q?N29CwrKnGubMfldq2eFiZNsG271bK8WLdZptNAYM+lJKuWDucfOjq4I38hDu?=
 =?us-ascii?Q?1AuMhAK0miFozUz5nYj2eRXhNp9162v3IlsUkTd6SUfTJgqH21HrT1ZGQmQk?=
 =?us-ascii?Q?2HUjbqlpug=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a064a3-157e-4def-68b9-08da3d9a7378
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:31:20.0687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtsraG8Hx25jt8L+h/j7YwsiF4bYRpW46hVwDeYRZu483BQk/4D93IPJOVp5KZHHhfIOYc96HpWm65q4Vd8Btg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240079
X-Proofpoint-ORIG-GUID: 7lttbeJv89BJa6CbBFP-zEeDsF2wLgap
X-Proofpoint-GUID: 7lttbeJv89BJa6CbBFP-zEeDsF2wLgap
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

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/pci.h              |  13 ++++
 include/hw/remote/vfio-user-obj.h |   6 ++
 hw/pci/msi.c                      |  16 ++--
 hw/pci/msix.c                     |  10 ++-
 hw/pci/pci.c                      |  13 ++++
 hw/remote/machine.c               |  14 +++-
 hw/remote/vfio-user-obj.c         | 123 ++++++++++++++++++++++++++++++
 stubs/vfio-user-obj.c             |   6 ++
 MAINTAINERS                       |   1 +
 hw/remote/trace-events            |   1 +
 stubs/meson.build                 |   1 +
 11 files changed, 193 insertions(+), 11 deletions(-)
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 stubs/vfio-user-obj.c

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 44dacfa224..b54b6ef88f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -16,6 +16,7 @@ extern bool pci_available;
 #define PCI_SLOT(devfn)         (((devfn) >> 3) & 0x1f)
 #define PCI_FUNC(devfn)         ((devfn) & 0x07)
 #define PCI_BUILD_BDF(bus, devfn)     ((bus << 8) | (devfn))
+#define PCI_BDF_TO_DEVFN(x)     ((x) & 0xff)
 #define PCI_BUS_MAX             256
 #define PCI_DEVFN_MAX           256
 #define PCI_SLOT_MAX            32
@@ -127,6 +128,10 @@ typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
 
+typedef void MSITriggerFunc(PCIDevice *dev, MSIMessage msg);
+typedef MSIMessage MSIPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+typedef MSIMessage MSIxPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
 #define PCI_BAR_UNMAPPED (~(pcibus_t)0)
@@ -329,6 +334,14 @@ struct PCIDevice {
     /* Space to store MSIX table & pending bit array */
     uint8_t *msix_table;
     uint8_t *msix_pba;
+
+    /* May be used by INTx or MSI during interrupt notification */
+    void *irq_opaque;
+
+    MSITriggerFunc *msi_trigger;
+    MSIPrepareMessageFunc *msi_prepare_message;
+    MSIxPrepareMessageFunc *msix_prepare_message;
+
     /* MemoryRegion container for msix exclusive BAR setup */
     MemoryRegion msix_exclusive_bar;
     /* Memory Regions for MSIX table and pending bit entries. */
diff --git a/include/hw/remote/vfio-user-obj.h b/include/hw/remote/vfio-user-obj.h
new file mode 100644
index 0000000000..87ab78b875
--- /dev/null
+++ b/include/hw/remote/vfio-user-obj.h
@@ -0,0 +1,6 @@
+#ifndef VFIO_USER_OBJ_H
+#define VFIO_USER_OBJ_H
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus);
+
+#endif
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 47d2b0f33c..d556e17a09 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -134,7 +134,7 @@ void msi_set_message(PCIDevice *dev, MSIMessage msg)
     pci_set_word(dev->config + msi_data_off(dev, msi64bit), msg.data);
 }
 
-MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+static MSIMessage msi_prepare_message(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
@@ -159,6 +159,11 @@ MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
     return msg;
 }
 
+MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+{
+    return dev->msi_prepare_message(dev, vector);
+}
+
 bool msi_enabled(const PCIDevice *dev)
 {
     return msi_present(dev) &&
@@ -241,6 +246,8 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
                      0xffffffff >> (PCI_MSI_VECTORS_MAX - nr_vectors));
     }
 
+    dev->msi_prepare_message = msi_prepare_message;
+
     return 0;
 }
 
@@ -256,6 +263,7 @@ void msi_uninit(struct PCIDevice *dev)
     cap_size = msi_cap_sizeof(flags);
     pci_del_capability(dev, PCI_CAP_ID_MSI, cap_size);
     dev->cap_present &= ~QEMU_PCI_CAP_MSI;
+    dev->msi_prepare_message = NULL;
 
     MSI_DEV_PRINTF(dev, "uninit\n");
 }
@@ -334,11 +342,7 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
 
 void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
-    MemTxAttrs attrs = {};
-
-    attrs.requester_id = pci_requester_id(dev);
-    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
-                         attrs, NULL);
+    dev->msi_trigger(dev, msg);
 }
 
 /* Normally called by pci_default_write_config(). */
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..6f85192d6f 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -31,7 +31,7 @@
 #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
 #define MSIX_MASKALL_MASK (PCI_MSIX_FLAGS_MASKALL >> 8)
 
-MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+static MSIMessage msix_prepare_message(PCIDevice *dev, unsigned vector)
 {
     uint8_t *table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
     MSIMessage msg;
@@ -41,6 +41,11 @@ MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
     return msg;
 }
 
+MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+{
+    return dev->msix_prepare_message(dev, vector);
+}
+
 /*
  * Special API for POWER to configure the vectors through
  * a side channel. Should never be used by devices.
@@ -344,6 +349,8 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
                           "msix-pba", pba_size);
     memory_region_add_subregion(pba_bar, pba_offset, &dev->msix_pba_mmio);
 
+    dev->msix_prepare_message = msix_prepare_message;
+
     return 0;
 }
 
@@ -429,6 +436,7 @@ void msix_uninit(PCIDevice *dev, MemoryRegion *table_bar, MemoryRegion *pba_bar)
     g_free(dev->msix_entry_used);
     dev->msix_entry_used = NULL;
     dev->cap_present &= ~QEMU_PCI_CAP_MSIX;
+    dev->msix_prepare_message = NULL;
 }
 
 void msix_uninit_exclusive_bar(PCIDevice *dev)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a9b37f8000..435f84393c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -317,6 +317,15 @@ void pci_device_deassert_intx(PCIDevice *dev)
     }
 }
 
+static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
+{
+    MemTxAttrs attrs = {};
+
+    attrs.requester_id = pci_requester_id(dev);
+    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
+                         attrs, NULL);
+}
+
 static void pci_reset_regions(PCIDevice *dev)
 {
     int r;
@@ -1212,6 +1221,8 @@ static void pci_qdev_unrealize(DeviceState *dev)
 
     pci_device_deassert_intx(pci_dev);
     do_pci_unregister_device(pci_dev);
+
+    pci_dev->msi_trigger = NULL;
 }
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -2251,6 +2262,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     }
 
     pci_set_power(pci_dev, true);
+
+    pci_dev->msi_trigger = pci_msi_trigger;
 }
 
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 645b54343d..75d550daae 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -23,6 +23,8 @@
 #include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 #include "hw/remote/iommu.h"
+#include "hw/remote/vfio-user-obj.h"
+#include "hw/pci/msi.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -54,12 +56,16 @@ static void remote_machine_init(MachineState *machine)
 
     if (s->vfio_user) {
         remote_iommu_setup(pci_host->bus);
-    }
 
-    remote_iohub_init(&s->iohub);
+        msi_nonbroken = true;
+
+        vfu_object_set_bus_irq(pci_host->bus);
+    } else {
+        remote_iohub_init(&s->iohub);
 
-    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
-                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+        pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                     &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+    }
 
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index ee28a93782..eeb165a805 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -53,6 +53,9 @@
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/remote/vfio-user-obj.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -96,6 +99,10 @@ struct VfuObject {
     Error *unplug_blocker;
 
     int vfu_poll_fd;
+
+    MSITriggerFunc *default_msi_trigger;
+    MSIPrepareMessageFunc *default_msi_prepare_message;
+    MSIxPrepareMessageFunc *default_msix_prepare_message;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -520,6 +527,111 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static int vfu_object_map_irq(PCIDevice *pci_dev, int intx)
+{
+    int pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
+                                pci_dev->devfn);
+
+    return pci_bdf;
+}
+
+static void vfu_object_set_irq(void *opaque, int pirq, int level)
+{
+    PCIBus *pci_bus = opaque;
+    PCIDevice *pci_dev = NULL;
+    vfu_ctx_t *vfu_ctx = NULL;
+    int pci_bus_num, devfn;
+
+    if (level) {
+        pci_bus_num = PCI_BUS_NUM(pirq);
+        devfn = PCI_BDF_TO_DEVFN(pirq);
+
+        /*
+         * pci_find_device() performs at O(1) if the device is attached
+         * to the root PCI bus. Whereas, if the device is attached to a
+         * secondary PCI bus (such as when a root port is involved),
+         * finding the parent PCI bus could take O(n)
+         */
+        pci_dev = pci_find_device(pci_bus, pci_bus_num, devfn);
+
+        vfu_ctx = pci_dev->irq_opaque;
+
+        g_assert(vfu_ctx);
+
+        vfu_irq_trigger(vfu_ctx, 0);
+    }
+}
+
+static MSIMessage vfu_object_msi_prepare_msg(PCIDevice *pci_dev,
+                                             unsigned int vector)
+{
+    MSIMessage msg;
+
+    msg.address = 0;
+    msg.data = vector;
+
+    return msg;
+}
+
+static void vfu_object_msi_trigger(PCIDevice *pci_dev, MSIMessage msg)
+{
+    vfu_ctx_t *vfu_ctx = pci_dev->irq_opaque;
+
+    vfu_irq_trigger(vfu_ctx, msg.data);
+}
+
+static void vfu_object_setup_msi_cbs(VfuObject *o)
+{
+    o->default_msi_trigger = o->pci_dev->msi_trigger;
+    o->default_msi_prepare_message = o->pci_dev->msi_prepare_message;
+    o->default_msix_prepare_message = o->pci_dev->msix_prepare_message;
+
+    o->pci_dev->msi_trigger = vfu_object_msi_trigger;
+    o->pci_dev->msi_prepare_message = vfu_object_msi_prepare_msg;
+    o->pci_dev->msix_prepare_message = vfu_object_msi_prepare_msg;
+}
+
+static void vfu_object_restore_msi_cbs(VfuObject *o)
+{
+    o->pci_dev->msi_trigger = o->default_msi_trigger;
+    o->pci_dev->msi_prepare_message = o->default_msi_prepare_message;
+    o->pci_dev->msix_prepare_message = o->default_msix_prepare_message;
+}
+
+static int vfu_object_setup_irqs(VfuObject *o, PCIDevice *pci_dev)
+{
+    vfu_ctx_t *vfu_ctx = o->vfu_ctx;
+    int ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (msix_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                       msix_nr_vectors_allocated(pci_dev));
+    } else if (msi_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                       msi_nr_vectors_allocated(pci_dev));
+    }
+
+    if (ret < 0) {
+        return ret;
+    }
+
+    vfu_object_setup_msi_cbs(o);
+
+    pci_dev->irq_opaque = vfu_ctx;
+
+    return 0;
+}
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus, 1);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -632,6 +744,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o, o->pci_dev);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup interrupts for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
@@ -657,6 +776,8 @@ fail:
         o->unplug_blocker = NULL;
     }
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
@@ -716,6 +837,8 @@ static void vfu_object_finalize(Object *obj)
     }
 
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
diff --git a/stubs/vfio-user-obj.c b/stubs/vfio-user-obj.c
new file mode 100644
index 0000000000..79100d768e
--- /dev/null
+++ b/stubs/vfio-user-obj.c
@@ -0,0 +1,6 @@
+#include "qemu/osdep.h"
+#include "hw/remote/vfio-user-obj.h"
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 9d8695b68d..844ed75834 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3604,6 +3604,7 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 847d50d88f..c167b3c7a5 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -12,3 +12,4 @@ vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
 vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
 vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
+vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
diff --git a/stubs/meson.build b/stubs/meson.build
index 6f80fec761..d8f3fd5c44 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -60,3 +60,4 @@ if have_system
 else
   stub_ss.add(files('qdev.c'))
 endif
+stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
-- 
2.20.1


