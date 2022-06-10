Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEC6546DC6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 21:57:42 +0200 (CEST)
Received: from localhost ([::1]:45768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzklJ-0000Pj-EY
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 15:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf4-0000GP-PS
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkf2-0000Un-Ur
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:14 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhws5021178;
 Fri, 10 Jun 2022 19:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=og3us9aVU7yjthCZgrvB6Da6iAnNXBLh7W3BZoEvEMY=;
 b=kjuvSOXShuWtOj+Tn15twgPzLKHCZVlNrylsXvHuLRVbC1cakABeDvdl4Mre7gJr9cII
 dfgqNBV4jKAoB7eML2meQjOM+0+GaY1CbBwXZC6isMgRcQifE/B81i/+oEEcMa3Obcy/
 5rUQZJeybwHh3L3Rj+vyO7psZ/LGwiahJwKahHsAG9QE0cjBpPZ0ZWzbTeR08zDkb3vy
 4XSMLCu8vus6PqcsLeSaFCDcORmhyLqsc0AOhkTxomdhmc/uMwPgnBvsnHQ2OnuLndAl
 1aEAyjlAMfKwdb4/yVxn9zu7U54F3iEDGlHPFGmf9EK3nZvxJiiJqPYkEt2ONqosZd9k xw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyxsprdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:07 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJkb7i009322; Fri, 10 Jun 2022 19:51:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gfwu6bb18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMkyQAz5lUiJm7cybccCJodilXthSDEyw3NfSEC7zTxvxV13npHj/IO7BClFk8o5SRoCfNSaUBq/+9oL8GDqs6SuZcU4JL+cyo76rbDrvGIZMhPShQu8g+UawKkpUdlEzIawpzLrhTXJKQD12as+b48dWzygxq4w2fuFi3cTWFXtL4yeqClrKfdk7TWomtzhDe4Zi45WxF3hGFx19oKX2veNenHTVECDGWm1XhsC0l5ARRBeNM00jz68ia00++OQWeuUO7ohneNTBAdsMhlgDspqF4sYmYFYfRLS+mx3GdGPk5l+G8SqeMfY+dDPLX3y7FhwKOzbR1yTcbpiRpI1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=og3us9aVU7yjthCZgrvB6Da6iAnNXBLh7W3BZoEvEMY=;
 b=WQYrHF3zuYpJQ+TKDfaSB5aBxAVYgVdecmxsXJqZXytxSF9wL/5yvxz99orBZT7jjsdRXkutVfCdizlQME7f+I/GYVxEXhj/9SOfuyHqIYHBQMMcaUbE/88qDYlRExg/oj2meVUiPoWhwLj8HSooVwjeMhw0OPKSJ8EWiZIbl2sLgjniZhXdxcGKKjL1iP9xzn2ksMmUCxk0yA4OGWa3aScHXxYblfFi9BVFbLkq7HA/tvVPZSbWMN4QqTV47R+NFW36NH/OkblZpUIWvjniYA+P2OOc0xZdfjFZ1CE82rBc52KXBEvCI4TEtYOrcexgcViU2qOZQWBcpSXlIApttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=og3us9aVU7yjthCZgrvB6Da6iAnNXBLh7W3BZoEvEMY=;
 b=gZOgiDQzeGDJl/CPq3GEGE8Y/wV6HathsQEU3oQau0xQavNUEOqosNUHUSAeiSXhbhUk/EKvt8KU08HmFrjFG3bLu2qcqFz+WjnqDIW9ASrgb5fI3CSdf4zdrbJuEDTMNiTbXcKZFODj+xHa4Kt5EfyF8d2ZmKNiBX6TsHhHLUk=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1915.namprd10.prod.outlook.com (2603:10b6:3:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 19:51:04 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:51:04 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 07/14] vfio-user: find and init PCI device
Date: Fri, 10 Jun 2022 15:50:34 -0400
Message-Id: <aadf94ce4574f07a88fd96f9cc37be8c9387f98d.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 579c9a13-f984-4b89-2d40-08da4b1a8d99
X-MS-TrafficTypeDiagnostic: DM5PR10MB1915:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1915AF768A7F9D9F92221B1D90A69@DM5PR10MB1915.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxLN3U7y9d8mZkEfngwYjAeZ7VAXO7jPWK0v3za4nfWh5ayMY9P3fOOTRQOWreDwMRRgiXUytpsk8+B/EOaqG6OY0+J2eXaH3zv97go0bHKVatlC9ASuQWCIHmPtQ+f9+Wz0C2PMPAR/gVmnZE/RmtJzvxes6Y7PcB/meGKWCU67630ulpskagc4r4God/WT/SomCdZE5NDAmbCoo1rYPH83sJwN36SKkku3lm3pNTjlPGDeq6mDJPI55KBw67mg6xXmJ3/xnObhr+r++1X7D93Qnx6faf5o1XgxLZ9v2k8s34MoiYWE7TufrP2XgZ1EArsEoNKWec27Z5JwNrJTru13NC6nYnL7P6RGd2WA69aNdujLKAd1mW/Y/4+L4jcuhEG8vW2n4YEHDUprWvKoYBWClRU0f+vxxdEoPBvjEv29jGP8ih4tS4n1MrbRqhlzRvOsAND5AGiLSgdRV5niU8haaI8UKJ89nX6LY5v78V1V6RqHkTMxQy6uCLnqevBeJg/xcIpfJK8FlnWcLVH5G1Wdi0SHGs95fPiWTgT+mG11R89RONhugtjlyGtZea6NU6rft0Yvaw/sytOuuNAMcZJOfvwH5ELI3Bpp5VNecUt8Yek/EVJSsMNgM+wNezIB/I+eT1/nResXjpSqOTWVt/x/1Jdv/r4G9SrszlqAyQEjzuSDxdqUkq2K43Mtke4Iejt3amWkOWw0WIW0P361qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6506007)(6916009)(2906002)(107886003)(38100700002)(38350700002)(6512007)(26005)(8936002)(2616005)(86362001)(52116002)(186003)(36756003)(66556008)(66476007)(7416002)(6666004)(8676002)(508600001)(6486002)(316002)(83380400001)(66946007)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jObRkgS0cjSi80ENR0DsPCFmHQRUKSbthd1DfVpl1pVQV/9bL+yi85ZNq/q+?=
 =?us-ascii?Q?MiB4rlndEkKPOV/zcPzVCsDSn2+mfDl36iJmoJGKG/iS5mY7iM8QNEoHZx7W?=
 =?us-ascii?Q?wKIVYssiG676nVjm4G9GdGeORfuAp2R53ppTYVIjdqBW722Sx8fUGOW+aBt4?=
 =?us-ascii?Q?vG8a6rNJDHcUPJuuKVyr3HOaLWUUDfkM5wkz/juMaJy+hy7rQxVHM9CD5vod?=
 =?us-ascii?Q?d2DJQP8/1NhMYmtxId1/caAisG19HR4G5JD0aOiReVF6DXvkYG7v+zrGVTLU?=
 =?us-ascii?Q?z2pTf5G8duofSQrO+YXpfsBBxKYMWElbHjHCRAGgWAT2SL9dd6BskXxmMx5y?=
 =?us-ascii?Q?OHwLytnbb/Cv/vTiQPLgcq8MjFIx1uwux4lIMQ89Hi+UDIFTQ9i6oJnfPab4?=
 =?us-ascii?Q?rORZ7nXlS/KQJo6j7ULhL9Pao5JKnn0ADGYcXLEQRsCK9l1AiJEuNSnKqLPm?=
 =?us-ascii?Q?ryaGdNR4wT/we5qXMJ9YiCsGV9xcVX/FX81BTu3smcJw9/fiX7VeBkGAYLGL?=
 =?us-ascii?Q?qQIY7FWcudWsQixqTWn1yDufw8pvfXU1i1me3orWi7MS91m8jF6t92GBDPdS?=
 =?us-ascii?Q?BGSCOb97YG0AzdbRX/c6o5DCmtviosvIEyWc3vV2Op0MYJQ++An/ET7GqH4B?=
 =?us-ascii?Q?RqfqCstpV/WbkqRe9K7DZ5sOd/Or2122PFYkkvxEiy4geSYR5QT+uugaC4MF?=
 =?us-ascii?Q?VKTtYYJHAJhysKactn6HzbvIQsnm4ijyzAEmOvSYfSCEZhloRuQm7omOx2BO?=
 =?us-ascii?Q?OD+9x/eBjtnA4rzfBLjgjpUMgm8usJ5XuQcQvsKGZmuG5gSwSBXXce4icHFi?=
 =?us-ascii?Q?nohGBGbeVYcz9o4Y+Y4+uAOhI3y5L/T0EaKXeYF6enM2j2xFC9T2toxuMv9u?=
 =?us-ascii?Q?sJByIlYmTghUwBaN/lntYnIr8OM/+Ojhlc4/dLBu2y+KIWyNB0i+dhursuk5?=
 =?us-ascii?Q?6sjsGHnEccm6V4ZzG9kOpUGaMQg4LJq+y+pWqcBoKsQQwz5aU5yqcJ3M+Zka?=
 =?us-ascii?Q?OMfVbXQNuc+vmTXUgL8umhKZRm/oopc4RKMRPhiI8GR3C1GJRV2RLtJF+gZ2?=
 =?us-ascii?Q?bJtj/XCSK0Oo4HLNAxH/80lJuMqQGXXsI8uY/lwACjoZGHA1nVTP6q/XOGkc?=
 =?us-ascii?Q?8/UleSSQk4pM/DWWcfsUmXuYm+SL98mArHEleDr2YHuL3iUmeJIF9EOySW1p?=
 =?us-ascii?Q?IfGVZRUJ/8azNr9tOowggw0jVjd0cASTje48oKA2UxfdNyUjPTMz7meqmB0f?=
 =?us-ascii?Q?+JUl4XX66SuECoBYEHQt/kJpK25D8OZf8vYhzb0jzj7dWWFQKA1baygckVpR?=
 =?us-ascii?Q?ic9pPGKIqhC3iSNCEHENR8ZwNzT1d2MMmX2CDGuPElP/dAhRha7FdDm4LANf?=
 =?us-ascii?Q?YsU79bQLuWhQbCXE/y+PfXy89GWwyH8tMyXiKQ6sIXdh+YxiBKrmc2IknLkX?=
 =?us-ascii?Q?Q8mJYAA0+3Oc8A8dBprNJJ7Yf0laOHkHNgRQXj1nbFvH6Oc0MgvYRyy2ToYv?=
 =?us-ascii?Q?0ChJd1slyIq1djQHh+tiKPrs/lNgeOGISWYBlu30XBk4V7UFQM19ruVg3QJL?=
 =?us-ascii?Q?A+LOYBwQwGiFo+LaXKceZKD75c835nXLGBVMHEpcqQlmibXpwGiYvhuaChez?=
 =?us-ascii?Q?HnA2+up5H8XnLuPBpA8f4sWwEM+QiomvILQcS+OAYEQ2HSa4ylklh8Ipxc0X?=
 =?us-ascii?Q?9t0nSwv/0He0FcO5nSng0V/Fhr3ke7dc6/LKMnvZI7ulxNvE7GtITOcTWDRw?=
 =?us-ascii?Q?C6o+a0Xy/A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579c9a13-f984-4b89-2d40-08da4b1a8d99
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:51:04.4767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2gppwRYBX9kiqx0bjKfygekmyhbT5AaLXbERLrtFsDJf5jDVJz1tahLo+Q+E/yWOKyYW2ZNOggwEm1d52/SwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1915
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100076
X-Proofpoint-ORIG-GUID: gtK1etmBd8nd4II2dQ-iwwHvM2hTPE7m
X-Proofpoint-GUID: gtK1etmBd8nd4II2dQ-iwwHvM2hTPE7m
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 68f8a9dfa9..3ca6aa2b45 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -43,6 +43,8 @@
 #include "qemu/notify.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -80,6 +82,10 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
+
+    Error *unplug_blocker;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -181,6 +187,9 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
+    DeviceState *dev = NULL;
+    vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
             !phase_check(PHASE_MACHINE_READY)) {
@@ -199,6 +208,53 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->device);
+    if (dev == NULL) {
+        error_setg(errp, "vfu: Device %s not found", o->device);
+        goto fail;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(errp, "vfu: %s not a PCI device", o->device);
+        goto fail;
+    }
+
+    o->pci_dev = PCI_DEVICE(dev);
+
+    object_ref(OBJECT(o->pci_dev));
+
+    if (pci_is_express(o->pci_dev)) {
+        pci_type = VFU_PCI_TYPE_EXPRESS;
+    }
+
+    ret = vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    error_setg(&o->unplug_blocker,
+               "vfu: %s for %s must be deleted before unplugging",
+               TYPE_VFU_OBJECT, o->device);
+    qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+
+    return;
+
+fail:
+    vfu_destroy_ctx(o->vfu_ctx);
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+    o->vfu_ctx = NULL;
 }
 
 static void vfu_object_init(Object *obj)
@@ -241,6 +297,17 @@ static void vfu_object_finalize(Object *obj)
 
     o->device = NULL;
 
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+
     if (!k->nr_devs && vfu_object_auto_shutdown()) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
-- 
2.20.1


