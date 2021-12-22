Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4F747D7EE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:45:06 +0100 (CET)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07Xs-0007Ne-Q7
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:45:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V4-0004Xb-TA
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:10 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V2-0008K2-Ou
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:10 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXxQE028537; 
 Wed, 22 Dec 2021 19:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=F64+w3YSvZefRGfkU0pckjcMStMA3dKNyLg47J/KXEA=;
 b=xzO0F2s1/71OifgBpJ2KX5owiACgUyKIVwD9k7jvwtolJ4UlISeG3gE/T7U6+SWj+Wsi
 N+OgNoi81fcImwIjwhajPbAoez8x+az4jfj0m7KwZbNRkGmdl1ozo4O2FrwJQZykMyN/
 RMQqHBgHCZos/FJvmQj9EgCSP3BIJDUjmt1zT9fKRdoK3EYq2AEqfRe5c40h7iV90GLV
 GZncQjHF9kLjtxCh20nSA3PO3Zse5DsmVx8SYs8sgqwiDNdKjCgC+EiNUut0/+0WHXFU
 vuTyV5oqlSL/vltHC+M2eGPOMx7jUZSfsfZTJwHrgEulLSPaB6DAoFquLW8xflYSh2C+ pA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397jg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:41:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCeU049074;
 Wed, 22 Dec 2021 19:41:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:41:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wnz/MtqqkVT3digNXFppAqFEXbhPOaXQN1w/QCQPBC2M+HObeiuDWhZUI1+bSMiEWDId4zMPdqZc74SO5ftD3GGHkGZiX48RpweJIef6jsu8Bs2e3qyhUabyCO64ta17hi791qah3175riUuCUUEa6FCOuIBdENfzjzskdaQ89iZXbqCHud9VIfdzxuprXmzfqoPYEdukazKDvWe8KcXE3OwELcjvQOILm1xqp/DSamunAFopuQwe0l6m+DwKy1oFIKtdRXlUntlj78WQoZt9C3X+8/VB6oDgVY1zFzj5LkGcvKwT+2UKlPXt+4APXHvkTFGZCT1+lok0G6wlAFDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F64+w3YSvZefRGfkU0pckjcMStMA3dKNyLg47J/KXEA=;
 b=NL4dddmlmhuvSS8TKGH4dd62L5Ve8f3W5fyOjjEW1FEEGvrUXRgBzpYuefdt2C2sfJgIzGkB77wowh7fAnCaAhWx3m3fjnsCNbvLUDwXDSB/pysamgDp58ymMKaaK820BVyxfrWSkd0u8K5B9yBcTgq4aVGTeREjD08jP4DLg0eZZ+5N8GXiKJnskMwIB1s2sf0/P6hJZ+WbzxAGLvq9QCv9+S+cDHOpkb16IQ7xkflYu6iF2BXW4VnP1O8bg6NbcrsyUl3HWHw3dnjjn7ryKYrsfwOMjbgOFyKNxVURhszSWs35MTLpi8NTd9s0lUAs0ymN0ROhG6wzsUKCvdagrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F64+w3YSvZefRGfkU0pckjcMStMA3dKNyLg47J/KXEA=;
 b=eLk5Aziv4LxVGjR3A99OYwVC5rGRExdc/kkxcWqrsDB4tsuRZyCaBMRRyfZF3EY2snG15/zgC7/ztuc5vEjps7Q3ihVWt0dFxaaM6Oh68QBW9XhyOaZ8sFbk9uHflete8BSxywEvFXZK1bRDKc0ACae+RqS0RaolSaL7eWqeHYA=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:41:55 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:41:55 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 02/29] migration: fix populate_vfio_info
Date: Wed, 22 Dec 2021 11:05:07 -0800
Message-Id: <1640199934-455149-3-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9d42eb7-caea-4320-14a5-08d9c5831bdc
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB28883A979F6EDDB955059C5FF97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YnZBHpV5Rgn9FMvHOaZXmbttBwQJh7yFkDo4LLyR8AlwD5TVVTIeraiV83lqnTb8Bt9lD4I0SXgK/hVdQiv2dXRN0Tjg+dBMtAJxx/ZndZ0KNsSaJmVgHYDxVcdMB0VMWGAaGtpbrJ0qhL+yX7VdOcxmGtHQK7Nri31PSBsb7B/0dgqNEvC6SHJTWtNSn7Zfvnd0x5yls0+UBKl91uRIiZ1NWcMerSvYy1Be4KHaV/XD+7G9iB0gideWFKot9WlmJFSaNP5xsLpzR1rbVamDMAhilWO0nRouVzbXSj//I5XPnL8yu9RJl44ZEIcIqHnPtI1R8md90zxMOcRcjeqkot7Ws2N/HknoXy9FMTGgEBwZ9GPBPEanqGMWAlNrJMw4UwQkxZAmx1Np7wo7jFTqc4EN5n8PbvhBM0IR/s2f3W4AqkzPXBN4iMwqdQfBVpj5ecIXtl7/xzjfF2p08sA8g1BsdwdR/pB6ALzkYIhIdn5Twp81icZEfqz1WbZnk3qaUl+j1SIvHKha2fpLRiIQTBUIykkFHmqMEAwZ9i2O5IAzR6o/lxmEw4bFCIrTOJ3h0anLBWsMHY0CRi4QgyNL5YKQg+z42Ee5lNogP/i2Iei7HPet8oup1vuVXL2RbIbDdwi9x9n65n9bbd/BIyDDYDHItiajI01tiR7lNgd2PSFkonypDrZwTJ6Lk+F1Ey1zzdDuQRL6JZjVkb/NCk6dHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(4744005)(316002)(52116002)(6506007)(186003)(26005)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(83380400001)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kE12COeYuZNsaujI8MNnefLIDG3rBEd61SM9EN8nAh+YDWyOdPUJXXZ6u8OI?=
 =?us-ascii?Q?IU9dGgRkjDDFW9KsCy+2KQY67H5tzLfLaAPXSnl5FaemXpyx2NuAXaV8wpxs?=
 =?us-ascii?Q?PU7J5ck37k4Pak2L29xWikoA2XofgrRsILIyWL/LLJP1vtgA71MgJ1E21VrI?=
 =?us-ascii?Q?oucnl1LC4nlOumYJw0JwVXARhMB68o/XlbpHxFk3rF/ociGlQqk+GDJ6f9TD?=
 =?us-ascii?Q?ly9+iF+x1p3G7yl8Q8E8HgB9XiAYX6RvUhuA4xG6dTbXwdNTCXgOGMy5WdjL?=
 =?us-ascii?Q?8JY+W+J1mEKFet9y+QNxG42YpGVXcI2kDzLn/wWTfajoUK8u7WiM7Tpl9VUv?=
 =?us-ascii?Q?NcgusIkmJjk9MyI45NmL2I6el3hDIpKgTzaJaLckpHemLb9vvbIghQaYYSHt?=
 =?us-ascii?Q?8hrVnv/t+hNnA+DprhXVcWyRWU3H1Ke/hI33A5XziBcBGbehDJYuwiq/imHl?=
 =?us-ascii?Q?//Q7WI3sMKlupiE8513lfQuEcnXZNg7Slxz4azpDi5mFg+sAb9dyvvq133oo?=
 =?us-ascii?Q?OTgwxDc2xmLB039xc/lmQEH5E4VrR0qQIVYzzj+eHTvK7+ffCkXiXrs3SjQD?=
 =?us-ascii?Q?VcJo+K+iV/X1UG3vl99AlsL7BdOr2h/b7gsOg7kt/DMerOYpP1AfuayYJf+u?=
 =?us-ascii?Q?FnYiYCHG4+Bv82aN9EPawmDphS0JASfEZ6wkw/BSiR3rCDh0iTxbW4VNScn7?=
 =?us-ascii?Q?y/ToCw3041swKs98PduzbP/3F2H4hjFsVaPrQym6mlMbLfR1lowS4wrgC7KX?=
 =?us-ascii?Q?Orr/Xis5Hqtq7vB5DbvhdLQFKOem4mCZc0JibadN/c42TwHxWYuoQxSqV8sf?=
 =?us-ascii?Q?AYohyNTv15bieV6v6DwAKpU4QXTmZqFUyT80Gbyi5YXBOE45WDxERcj7D0Gs?=
 =?us-ascii?Q?mnbfiu3K3QyaGBaPak+/YZrnFXbIgXemxYWM5wKQUJy6U1bmnGvojoZcRXa4?=
 =?us-ascii?Q?sfpmy1j37uIJvT/Csx6D7vVBN2WpBKhwdFx5Eeb5Gi3m8vRw7HlBRG6HnYUH?=
 =?us-ascii?Q?Lq5wMLPYM9mE3fsQXHkR9uREjtgWo73ljxBxzV0jJYbjaJZakYbDW//bkmrg?=
 =?us-ascii?Q?0YaAxJSmPpwFBNzOSB+XvRA1CDxVBGgzN755c+4BdgrPn4MlAYb/U4OtUf2J?=
 =?us-ascii?Q?LkUgvfhrVGj2m9QDKGgjt8qNBCcR6/YGX0xwMh94i1JgHNb64Eu0DgWjLoKr?=
 =?us-ascii?Q?FKt/2kdE/khT/k/5I1ACZAFODX/npWnXfN8PU8mUIrghEO9JIJFyqX4ZXjoD?=
 =?us-ascii?Q?KaHbjvg5cHXn6vWorF3fIbWTMa7oqsT3FIAe7FUVTgA3gaiInPReRpuzXpNK?=
 =?us-ascii?Q?kjZSytXXm8QB83ILbsZ9K+3fVZUxNLv0sm8bzKd2U67AJPJUMctVjrgydn/c?=
 =?us-ascii?Q?NMOIHvNagPs7+68fXImTcZl6R/HGn5PN2CMhe/2Evwuj50HT2iyaPQ0HEYbP?=
 =?us-ascii?Q?MvCdnPQrd0NmrrBe2bJsnA/d8LAmq3nQRoH58OwnjgK2pZefZGmJg1D53exp?=
 =?us-ascii?Q?7xRr9nMa8IlDABADNNS2U+ufsULrybBnc9/4aZac0pcDALu9qyMrmfVI+evy?=
 =?us-ascii?Q?P1UOw3wfdcOalKS4gwTzvBXHG1VDBkw6rIjiM+xZ9/A9oqQusVR9zLVd1Ijn?=
 =?us-ascii?Q?WiWc5y5wZFYpeFvw03P+4ZHbmPru9iPqG4B3ZoRoUlY7866qKK71ReGBa3A+?=
 =?us-ascii?Q?a/X5uQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d42eb7-caea-4320-14a5-08d9c5831bdc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:41:55.0150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1e+Jm2EPvpZo9TtRuEiQf9NZcnAh09fwmZcNo7IivvGuyzfAxZDzUWSvm8H1V+9PyzflHWMLX1J2UyfovTB/I7FyMU5pya1w9z0qiBeKvTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: 1ev9GNW14HSrkuiPhTqAbVaW1fi6bYax
X-Proofpoint-GUID: 1ev9GNW14HSrkuiPhTqAbVaW1fi6bYax
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
CONFIG_VFIO.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/target.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/migration/target.c b/migration/target.c
index 907ebf0..4390bf0 100644
--- a/migration/target.c
+++ b/migration/target.c
@@ -8,18 +8,22 @@
 #include "qemu/osdep.h"
 #include "qapi/qapi-types-migration.h"
 #include "migration.h"
+#include CONFIG_DEVICES
 
 #ifdef CONFIG_VFIO
+
 #include "hw/vfio/vfio-common.h"
-#endif
 
 void populate_vfio_info(MigrationInfo *info)
 {
-#ifdef CONFIG_VFIO
     if (vfio_mig_active()) {
         info->has_vfio = true;
         info->vfio = g_malloc0(sizeof(*info->vfio));
         info->vfio->transferred = vfio_mig_bytes_transferred();
     }
-#endif
 }
+#else
+
+void populate_vfio_info(MigrationInfo *info) {}
+
+#endif /* CONFIG_VFIO */
-- 
1.8.3.1


