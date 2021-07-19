Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64813CCDF5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:32:51 +0200 (CEST)
Received: from localhost ([::1]:37728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mpe-00049D-Jj
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlF-000441-7v
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:17 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:9156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlA-0002EH-Hl
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:16 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GRNK009287; Mon, 19 Jul 2021 06:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=xikYxdDBMphjgwUL3W8+0CRy9R1jKeEBwNoTvL20p28=;
 b=WpDZDGODUXgXtGvWy1JOOu3NDxzzoWVlnKupI8vsX7Bt4ZK/SlKhJydIe7F6mQjcjVDL
 ZmKOuKZQOCR5RqsS8cjlrnTbHB2t8B2Ke5zxYOeEwpb3kWv6lgqCC2YxfX7bsGX7EPua
 /eLPJauuM7B/WkoklhABd/o1AfKXOxkCVGteG8hdHYrlq/dV8Jj9J1osCxhAc7/zRqsY
 nGh2cQ0IKQC/a+dxdbm8pv1B0lnlrfw3QrSJ2W6eLikpAAu11vsHwEro6QbFE2uQ28I5
 nIgcdS94pm2O0X7RozYd+iI5iADpVCfwG4s4ixGsee2MCQ6g9jsRBbVB8LdlZxnfY02D 2Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=xikYxdDBMphjgwUL3W8+0CRy9R1jKeEBwNoTvL20p28=;
 b=BlWRgcBOCDMBNNY2XKzhXWma6spKjupswYexvgnDdroRbZN3hE0nfwqft8m3m1kjreUv
 eNvXvFHtEh0ZpYClCkwgG5hOqnxLIyt477AvhmzLlcGH/94CWkZDhXREaMCX6Q+ZHq5V
 OL/jqp/8KCkbabqTA8cR8VBQ1Xm6QlJrKFcuZrp1ifOJNS3Tfwz86rACj/+eMg5eceJp
 KAN6Wb1suJUV+A4xc5HR9mRgXxt42KQ0tgzHJAqnGj4TScBHuRWu3qyFIrhbw310Jac8
 /YLka1vJoUMNpmBqxBT4eI1E/3KuGElE+Mt5eADRQ3W1mQw/1/uaKJTnRQftmq2BTYVx sg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vrn5gkjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9T0086873;
 Mon, 19 Jul 2021 06:28:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eelXm0hLM0f7Mc6+OnkUUUDIwADeiVnq8PbRyVoirGfyarNow7ir1OiXW8gCUgN4MSPAzOFwIIz0n43LdrQNZKOLU5uFqJra1XSKvZuN1X0qL3bAGOcoB2Xmm5zYEjU/1+y0SKaPhoXzaR24G5zgO3I16DbKv2rG5htMqLbnlSafjxHSHxn0EcyUaSkftcVETvElYpriNxB9aoLn7dTjMTfv3sL/swmCYPMEdAb/O4oAlmbkhtfNqf8QhnnWByL7LNVO8Qa8rFMCaLMR9iovnMT4eAkH0UzRQMSnXCvK68eYe3E1amtsTvOZN8EFkAQroTwg8jGZG1K691AaIEf8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xikYxdDBMphjgwUL3W8+0CRy9R1jKeEBwNoTvL20p28=;
 b=abqgY9AIagstfbL4JkEPBcaficF1GyWPs1W+lQbwVkI/IK+UU4U1YUCH04VEL9T2ZjVpuMXKChr4Dvm3J64O2R36YSBj5fTRCzQR7/Ce4b+TT/RNyMfqw4RY8ZOHTh6htOwEWGvoExzp4ptAY8mqPP/A2/IB+gNGxKiduGzYVx36vF1elpRVXVbRp/Uz4JRl3XVZs6OMP+M2QttKfxcDHHMzKzh7p6NYccEQtTFqQnNYP3vfdR/04og7IyjlfixCrLaNNj4oETi8h4lYTEnDQt8Dl1lxYxLsNIUE8aSdlgLh3O1gEzXLEzbpdVlHZYUScf2yAQkPLQKNKBGsO8dmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xikYxdDBMphjgwUL3W8+0CRy9R1jKeEBwNoTvL20p28=;
 b=zLzyp7g8UQngK7yzFjpwszrj7SRjwFkKDH4DpHDf5elyxcw6mtSyBFPKD8pXif16pthhpAnn6LC8MGe/WXSpIMgIq+FSenv/ecgWTR/1OfVPCgBNY1b+eGVEDdGXa8jqIcQsF/A9ZYqA+6TNnJTPQvxY5hhFYipglXzS74H1R3I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:05 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:05 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 02/19] vfio-user: add VFIO base abstract class
Date: Sun, 18 Jul 2021 23:27:41 -0700
Message-Id: <fcd8d4030d1cda0c8a10e077d690bed6476056db.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7e294cc-2b53-4931-55f9-08d94a7e5dd3
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB481455D6CFA9EBD7A8BDA2838CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7KJcxxHZ42wUMSJNXwnn0UQa9NkhKfnAZxT7++fv39q150KzxWKd5wlFZCOzBlQGXu+3JE60s3ExUx3VS5wx6IWxYBqyyqjJ0bTVh4nZFFHvjvlGTpE5LUeOd+CI3vFzogVmGNHsDsEkcGM8Q9ybeZ88FQ2Pokq+9m4WWRb+TWj2TmVjhLWFYqjJ8cY9d5tHEU0psS8ZZX5nexutMiKN1hdwSiZjYJev5RiVvkNeKle++BNZ3ODoQZL3L2MrCU73bLyLTMDqTqpPVYsQB8TAOFI8QOoYm7wUFUDnX72Yba4HODJY3yTjYKCj1/sabR5IW/SLNt485dmm8T+GfsmQgdPYkGJcgS1bh0rtMUlZpWofHtyAKSaP/FuVpUC0n0ec/KI1s0Qy5Jv8JGJibZq1+X5G79Mr1N+VpQdasCUiabB77T7ETZG9FiuTeX/GRuVnCs4ntLyRf6lr6QtE3t7Lvxl17slk2ieNEX/F4pf7wkjnEjR5bz9WWWQjTnUd24oB3v3gT0QUoFACVNjLHcFtHAG6MVlKn1rFU2M1ZCqgmecV3pRWkFFKsJiZvbdOs+LU5L2LdbEMxLZ9iG+j1Q/R/K0mAkyRZrh5wZv5R4eFMv3Lpu0Esf8hBmcBZmUUrW1Ayijif+gnkvzrnQPJTM1iAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/6aoCFs3VaScgOoWG5+RHTKDNRg5pznbdRPAApczWesVEK1lsPj7Jt5hBmGb?=
 =?us-ascii?Q?IzrbIXEddDSAlGuHmYBkiIH8fhsSAEWbdRqfRR1b27s4nmttOGjaLDRmILDf?=
 =?us-ascii?Q?6wMeVO2NYu0O3AipoAlSx8v0ETxSRZxl7xv2GDW9bLVfhFdSGwXxHkvPqPFc?=
 =?us-ascii?Q?wJJbPsRejgkQ0kR/piYiMSX6YtzijUI4c6G0sUmMSe4InJIruxK+CP3j1o2J?=
 =?us-ascii?Q?4waz2r/mVVxr0RgIyQWnRu3d9cPlAZT3C3LeZ+Wx8FibTSERjUlEcyk3eXVO?=
 =?us-ascii?Q?hIygL99Te5enSrQRUSl6QO6vGlGbg+WD97tTlzmgxva92HAbmbEAuB8ev2C2?=
 =?us-ascii?Q?4ija7kQFOYToB4vQSThBWuzqRB9zZvfZUDhh4zNMYIvql/Vw5ZkLLpJHxrWJ?=
 =?us-ascii?Q?/SiP2MDkrWyeGrfygrI+edc/XM3JFDFst0uHGjuxxpEzXdC9xM6q+/8RxeOk?=
 =?us-ascii?Q?Bvi+gjqfZYCxYhdDgg4lWvEOeyvWI6gewgRoD1Rxusc71rKl2OrI57WoZgsL?=
 =?us-ascii?Q?LMcw5nxoT0Ji+7To+5Ks2Bom2K+7o7Bw3cotSjZQvzT4r+RWkwFcGQkt90nt?=
 =?us-ascii?Q?/NT8z2m/nbfHPciv/HrbIsu1xNux1EDk7IZQTZK9xO9W4LVbNfYxicNlw/f1?=
 =?us-ascii?Q?oIOgO8DCAmlcWlb9mO9Olzgg/XM+zExJ33na2A/RPqhdXP0ydjNiHyyZ0RRp?=
 =?us-ascii?Q?zLe5LpyuAsTOGPshw+pDE8uCSlMsvHT4vy9O2/2befrffQCtt+HUV2pd/QFI?=
 =?us-ascii?Q?CST5eWOHxStvx1mfCAE7pW/9jeLloUJB/pJ9wBocoNFZFM4YiBoTfqzXlNLb?=
 =?us-ascii?Q?cGX9t6FojLol0W3H6RT1U/DngFsFYXrfOdIK3JiCP2AbXOI3kKlnjafGvVJE?=
 =?us-ascii?Q?3pvBg3lHuUDdd4butQnsoOZj1e/9j5hFcgdN1B43Q4BBa6G0U/C49RpbIcPX?=
 =?us-ascii?Q?piCr/9eTJZMMRxIpwQmmGn5/CMF+FP00JPrf2N10BNcFRw3qMmUJQoO/JZIn?=
 =?us-ascii?Q?oqiaiRaww1aaDkTruMdmPlj1iYz9jR0VZprVkqojcp+IaBAbaWDSO17J0YeC?=
 =?us-ascii?Q?JWHaAha9456Q+qGLO6IVpCJXQav17IsiaXU/rtiN5wteMEnCXmTu1JFm7Qav?=
 =?us-ascii?Q?JaogMbtg2kx3vOqPRTMLHtyapGZR1M+XhDNbON4yYrDNqtAJr5rXRrOWTt/k?=
 =?us-ascii?Q?W5gsxN75O+ZPUUMXtCyffgq+zIMIlcnmeW3WoJmTKX1ajj97mALw9WTe7a5/?=
 =?us-ascii?Q?wv0pyPZ2geGH1md6/VvxwthAMICI8pCUs63K6OXsVvPepOo4/pcrWfrbImHE?=
 =?us-ascii?Q?pxKD1oT0NQOzQONm5eUKcZsODENFZWIKJP3h9UTwk4CtZamYoa/868tGsdwt?=
 =?us-ascii?Q?i+8UFc65kQ/vXpgINCGwt5O33qvk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e294cc-2b53-4931-55f9-08d94a7e5dd3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:05.1121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etS1tMTIwGOiM/pKB0UPjTsYkdsXqjA1dyDqMCJ8XyyzJjjufHbmIc7soqINk+tfiSZfP00WfpZDAVmzw5gVhOiAEhdH3nPZzIdIN5bQFYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-GUID: HZt7GIvIrfYIFqtCsjMWfQAlco5Z8ZtP
X-Proofpoint-ORIG-GUID: HZt7GIvIrfYIFqtCsjMWfQAlco5Z8ZtP
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Add an abstract base class both the kernel driver
and user socket implementations can use to share code.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h | 25 ++++++++++++++++++--
 hw/vfio/pci.c | 63 ++++++++++++++++++++++++++++++++-------------------
 2 files changed, 63 insertions(+), 25 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 64777516d1..ba2f51d98f 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -114,8 +114,13 @@ typedef struct VFIOMSIXInfo {
     unsigned long *pending;
 } VFIOMSIXInfo;
 
-#define TYPE_VFIO_PCI "vfio-pci"
-OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI)
+/*
+ * TYPE_VFIO_PCI_BASE is an abstract type used to share code
+ * between VFIO implementations that use a kernel driver
+ * with those that use user sockers.
+ */
+#define TYPE_VFIO_PCI_BASE "vfio-pci-base"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI_BASE)
 
 struct VFIOPCIDevice {
     PCIDevice pdev;
@@ -175,6 +180,22 @@ struct VFIOPCIDevice {
     Notifier irqchip_change_notifier;
 };
 
+#define TYPE_VFIO_PCI "vfio-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOKernPCIDevice, VFIO_PCI)
+
+struct VFIOKernPCIDevice {
+    VFIOPCIDevice device;
+};
+
+#define TYPE_VFIO_USER_PCI "vfio-user-pci"
+OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
+
+struct VFIOUserPCIDevice {
+    VFIOPCIDevice device;
+    char *sock_name;
+    bool secure;
+};
+
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
 static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
 {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8a23..bea95efc33 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -231,7 +231,7 @@ static void vfio_intx_update(VFIOPCIDevice *vdev, PCIINTxRoute *route)
 
 static void vfio_intx_routing_notifier(PCIDevice *pdev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     PCIINTxRoute route;
 
     if (vdev->interrupt != VFIO_INT_INTx) {
@@ -457,7 +457,7 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector;
     int ret;
 
@@ -542,7 +542,7 @@ static int vfio_msix_vector_use(PCIDevice *pdev,
 
 static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIOMSIVector *vector = &vdev->msi_vectors[nr];
 
     trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
@@ -1063,7 +1063,7 @@ static const MemoryRegionOps vfio_vga_ops = {
  */
 static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIORegion *region = &vdev->bars[bar].region;
     MemoryRegion *mmap_mr, *region_mr, *base_mr;
     PCIIORegion *r;
@@ -1109,7 +1109,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
  */
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
 
     memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
@@ -1142,7 +1142,7 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 void vfio_pci_write_config(PCIDevice *pdev,
                            uint32_t addr, uint32_t val, int len)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     uint32_t val_le = cpu_to_le32(val);
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
@@ -2782,7 +2782,7 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
 
 static void vfio_realize(PCIDevice *pdev, Error **errp)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIODevice *vbasedev_iter;
     VFIOGroup *group;
     char *tmp, *subsys, group_path[PATH_MAX], *group_name;
@@ -3105,7 +3105,7 @@ error:
 
 static void vfio_instance_finalize(Object *obj)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIOGroup *group = vdev->vbasedev.group;
 
     vfio_display_finalize(vdev);
@@ -3125,7 +3125,7 @@ static void vfio_instance_finalize(Object *obj)
 
 static void vfio_exitfn(PCIDevice *pdev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
 
     vfio_unregister_req_notifier(vdev);
     vfio_unregister_err_notifier(vdev);
@@ -3144,7 +3144,7 @@ static void vfio_exitfn(PCIDevice *pdev)
 
 static void vfio_pci_reset(DeviceState *dev)
 {
-    VFIOPCIDevice *vdev = VFIO_PCI(dev);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
 
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
@@ -3184,7 +3184,7 @@ post_reset:
 static void vfio_instance_init(Object *obj)
 {
     PCIDevice *pci_dev = PCI_DEVICE(obj);
-    VFIOPCIDevice *vdev = VFIO_PCI(obj);
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
 
     device_add_bootindex_property(obj, &vdev->bootindex,
                                   "bootindex", NULL,
@@ -3253,28 +3253,24 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
+static void vfio_pci_base_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
 
-    dc->reset = vfio_pci_reset;
-    device_class_set_props(dc, vfio_pci_dev_properties);
-    dc->desc = "VFIO-based PCI device assignment";
+    dc->desc = "VFIO PCI base device";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    pdc->realize = vfio_realize;
     pdc->exit = vfio_exitfn;
     pdc->config_read = vfio_pci_read_config;
     pdc->config_write = vfio_pci_write_config;
 }
 
-static const TypeInfo vfio_pci_dev_info = {
-    .name = TYPE_VFIO_PCI,
+static const TypeInfo vfio_pci_base_dev_info = {
+    .name = TYPE_VFIO_PCI_BASE,
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VFIOPCIDevice),
-    .class_init = vfio_pci_dev_class_init,
-    .instance_init = vfio_instance_init,
-    .instance_finalize = vfio_instance_finalize,
+    .instance_size = 0,
+    .abstract = true,
+    .class_init = vfio_pci_base_dev_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -3282,6 +3278,26 @@ static const TypeInfo vfio_pci_dev_info = {
     },
 };
 
+static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
+
+    dc->reset = vfio_pci_reset;
+    device_class_set_props(dc, vfio_pci_dev_properties);
+    dc->desc = "VFIO-based PCI device assignment";
+    pdc->realize = vfio_realize;
+}
+
+static const TypeInfo vfio_pci_dev_info = {
+    .name = TYPE_VFIO_PCI,
+    .parent = TYPE_VFIO_PCI_BASE,
+    .instance_size = sizeof(VFIOKernPCIDevice),
+    .class_init = vfio_pci_dev_class_init,
+    .instance_init = vfio_instance_init,
+    .instance_finalize = vfio_instance_finalize,
+};
+
 static Property vfio_pci_dev_nohotplug_properties[] = {
     DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
     DEFINE_PROP_END_OF_LIST(),
@@ -3298,12 +3314,13 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
 static const TypeInfo vfio_pci_nohotplug_dev_info = {
     .name = TYPE_VFIO_PCI_NOHOTPLUG,
     .parent = TYPE_VFIO_PCI,
-    .instance_size = sizeof(VFIOPCIDevice),
+    .instance_size = sizeof(VFIOKernPCIDevice),
     .class_init = vfio_pci_nohotplug_dev_class_init,
 };
 
 static void register_vfio_pci_dev_type(void)
 {
+    type_register_static(&vfio_pci_base_dev_info);
     type_register_static(&vfio_pci_dev_info);
     type_register_static(&vfio_pci_nohotplug_dev_info);
 }
-- 
2.25.1


