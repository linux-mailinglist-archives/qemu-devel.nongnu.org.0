Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D14EBAFA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:45:44 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZS5O-0007dj-S4
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:45:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRtm-0007ao-43
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRtk-0005NZ-6K
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:41 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22U3TIS9011958; 
 Wed, 30 Mar 2022 06:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=BQluA8nwLy6ChiMUU9vmCoCIIykSptreDP5LxK4z2HY=;
 b=0PfvapEmP8tIRllRIlAgpCp/F0uEMJpojI/k9PH4lV5etBIXBPvh+AcHsAvrmlCFkpCJ
 eocA5Dp5EqWwhSRrRaCNei2Lt5I8mDe3ML67Ov5dXUwFPDXP4tyHJDYaSpYXKcukBhW/
 /3Ys372PFfu1Dkj0J0ecc/4KAhG5RhXgffVYQzOjO01orFlrYY+7VK6PpPkcAsfQUYYX
 g9lMMQiop6ralXIZphJgfuuvDnYfGF48V4FfrEaCr7pK4FGGd/veE25UShO2NDDhtrpm
 AddpKqctBlImQFO5jWMj/xj7NGepwRb/dk603flgtC316muHz6DW4e98i92ibw90sG4J Lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1sm2gkk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22U6IZE8013655;
 Wed, 30 Mar 2022 06:33:36 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by userp3020.oracle.com with ESMTP id 3f1v9fk5v1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvRI0t8Jvu3T9k+k2IQE2g2QcbC3CzuGWhhJ7DX6b8z4xw6Qp9VWgG6mNbDGicneKoFduMXej/IMv+meoRDlAV3fU4c08POiwfJE9JlHpllWHRSt8ShDSLzLs+NNLPOp7/L18lq+B1oW9kpeVPrd+WJwzBZBy4LhAQRmj3b6f+ZJhLcKc8JJ8uOVirPb6a4qL3rfhuN17AX20PmBPRz0kSwGkIMcNIUa2H/s8PMhzUWO1bAl8UyTAs+5qQNjeeZfjpj14lWykKVUKfmZrsqSL6VkkCmjeJNwyOaTiG4kWdebiFpx/LyTMi5NWGSl173CW5U0QWh5GVVYk8iWhcKTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQluA8nwLy6ChiMUU9vmCoCIIykSptreDP5LxK4z2HY=;
 b=mm/9xGfIlhGcuq7OHlrxuiVhybV2zsJAgevhq1NCQnMihH7DRVh6k7eGlDk9Rm9fIsUZlDE4N8X4bSKBaE9+FKuA/b+GWM9Q88H4eBnpKpU7mbsvm6RVZkw82Ge76QCFaJm0sC7xNhfwB6+bLk8u5Xgd26xqtYlPEP+rRbgQuqXVWXVu6khCEdxnQH2q88C1ZRYBEdBrpUIeDbQEODh2hmJv85JnjduBT+k+lvQPuK2tB33IOP6De5v+BSnL09MeuTD3as+k7CU8RcRGq0IY9NAZhOo8L/L5Jdo9B0H7kuczDJa9HMB0Ibs08GB3Pz/yoQxKC2lWZu+sPD9y5kWC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQluA8nwLy6ChiMUU9vmCoCIIykSptreDP5LxK4z2HY=;
 b=jGgo/3DeqbNM7QpJQ7HWPOqbqapr+uWkG1vledg4gwF37VtpMZ5LmNzoZh4CAFVNSs3VXVH2NHf1QvnAtH4Roef/fLl+s7pXoLcmJc4uWvlxO/OVab3xBIeW+1i+63oMBhxqFCw1kwDTJpxRMMNL63WVonSauc1ExUXSNIFHUZg=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB3130.namprd10.prod.outlook.com (2603:10b6:5:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 06:33:34 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:33:34 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
Date: Tue, 29 Mar 2022 23:33:15 -0700
Message-Id: <1648621997-22416-6-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:5:190::19) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e172e2da-1326-4d35-1d4e-08da121736cb
X-MS-TrafficTypeDiagnostic: DM6PR10MB3130:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB31309ECDD3C7B8B0855428BEB11F9@DM6PR10MB3130.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SKtD8xfE+nkz4iTbBKo1amkgBcgozwcHpK5xiNPhOGCl4gBWR8mchtWzf1bnYa+1GFm35SWwfW8cu0w0KTPv8BiOGkUXA8MwrCgXPY9Bb0a1INal2UY0GOYdK6RUmy7tha35WL4xkddwv8ZOLOnikXgfb2jxExYi5oP5rs48ub+EEcpvyGUNS2Bb630vQ7jcCD/t0yJlXtEJJBPivfdXh2qqDnQpQxMpAsFxUuWdHjRoThuF9LzfieBXUVgg/BJbO/4ROEQoUQHEC8K24CyQYKzWyrF7viw8smlnl+hArgIL89dIAj9QblKnaHyUWt0v3du8btqXM0pkzXTj/YLM0LenAJC0Opwml22y6U6/08hgSpPm6f+Mln2d9M7a6dfRcgOqtcXniT4WVq3zHYH+9fNiSwUYHet9VlpSVayx8g20F1p3QSgUBZGCu5OvWW7MD2o9ax0cLXWdwlzY/Jqi1XUYlFlgA/uK00V50X9gGPq74gT2muoybkH6l/kJopABmiMie0QMZX5Clz+O6DV3M4sSJQxV9ZwNb0bm2jCc/k9P3Y+G+bdkg/PeMWKUlpirvqQb+8Hj110+dLf3L5LX6jSLJ/bNO1PiJl10XGn6S+V0+Md/yZat3XFfxKrKjlfMIsJJVYPV+XGAtETLz66ND1qz6mqhkgd4ETAbGAJX57xCNUzEuUzai0dZJVywIVbXRCn2wkK1DSmxLldkNLHvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(36756003)(2906002)(66946007)(66556008)(508600001)(8676002)(6486002)(6666004)(6512007)(4326008)(38350700002)(66476007)(52116002)(38100700002)(26005)(186003)(2616005)(316002)(6916009)(107886003)(86362001)(5660300002)(8936002)(83380400001)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4zzAkBt40KnnEobdP3Vno4plPVXyGU9x3xQjHzPzFFYg/3dcxcx6Glb5WesH?=
 =?us-ascii?Q?EODbV7UQkJuQUUgPE1ZXOwvnlO42IIcwbe/67Vd6QxVu+8TDwiRoBkJwzLQL?=
 =?us-ascii?Q?FywcG1u3E8RK7QidKeeY/3ePGcy7yTFU9RB+KYZ+FgsMbbUyEDtLUTpMGzKx?=
 =?us-ascii?Q?xX1qctE0KvDSlxT7sCJ13NY8z1egbMwUYeo+lOSn3zbxEF4L7ON8Ip9vSATI?=
 =?us-ascii?Q?6CJEeH1sbkP57Rdfus5Se747czCM7ihuMb/oPEvV4za/VZUWSIWympq5yRfO?=
 =?us-ascii?Q?wITkcJXsTb63rjBUGbdImhG1bZNcG695HsAzKvshQZU4lQYn41U8jiJ02So5?=
 =?us-ascii?Q?ahUjdcio7dTu9R993Gr8FDE1JIE2F81DIVHq1WE0w6g+DJKu5lrhudd2JkIX?=
 =?us-ascii?Q?03tBd2We37KDfADg8hTa/6DGqS8c1QPkcfsbDuRZy2m9podjnG8cuFjbEBH6?=
 =?us-ascii?Q?0HxAOxpGxuT2iSONQswqBUoWq4NzAhn9b33AEnDhyYbkhKW0rnEfq2c0LHxk?=
 =?us-ascii?Q?jpDhbPHtqpuOe/1sUlu3JiCQPLveg89JyzES5YeGk4/dTZQf0hTM0Gh0O6G+?=
 =?us-ascii?Q?Oc36nmwYN75HMcoxxkfLxXk0mopQmmB+0iI4Rh3169KWlNtTEwLX70FkYM42?=
 =?us-ascii?Q?MSax/TkmDH+sJuaX/atdOHWdGwD7E83i3t9eNAH9ZN6Zp39jaxRGnQ530qJu?=
 =?us-ascii?Q?K0brqh3DRpUpy1o5Dyubo+eMeqxCj6TNwuKfvQ6fhswp/nYeCtbVS5xSSMMI?=
 =?us-ascii?Q?c20T42PZ0O/8mWNjtCNFbBSLtZfuqFnk7/VWGEon5uW3pJf/SEo212rodbxU?=
 =?us-ascii?Q?1V/vUHfNOfr+NZgb9Yvhjspd56b2lCfPtFUmHJufePPP8wWM8ubaw9RMwUkW?=
 =?us-ascii?Q?3s1HTmIiJWIQNYwkbTzPqvVFNnqcsMXoGbjhmj26bBQOeXpy3m9TzxCEB+Fo?=
 =?us-ascii?Q?Ktkor6pMteUDdfMfHkrudCK/lEwm2gHB3HYJiiS6VdAvMsym3fhf0Sce9ygH?=
 =?us-ascii?Q?+SDAd8c7UgCSaN51W983cALO+zgMHR5Pl6C60ywjhx1aBtHFr5Ym6PucDAdi?=
 =?us-ascii?Q?HLKbkJc9xkCDQJRxStiDMr8eKeN5WWjt8I6qP0VH8hpi0eU4OjwMbFvfcu86?=
 =?us-ascii?Q?UKuSO5V0yKPRQ7Tg/5yDTz+zyjkYG9WW8ka0uGtEFtouE4RH7txsbG+QiGlh?=
 =?us-ascii?Q?8lLxUA3cDQhZsyLlYK/z/e5GvR9t/zOw13Glh7M/02Z4kSjZvKHgwDc/tMFR?=
 =?us-ascii?Q?73hiPumn6J1qDDwO0avkhD2HYq6c3Z9Z9vnuzRvxb44azRmrTSSfcV95h6fy?=
 =?us-ascii?Q?jMQ7UVl2QPh4p+sD+rGb63gBUpr8hPCKmox2SkZyDguPZPVxDuW/Y/Kwbxn4?=
 =?us-ascii?Q?1rUuZ+ibFBzv4JIIrptXcNqQo4W390t3zWAwXvoT8YU36+OIWbbb1l1E/8H4?=
 =?us-ascii?Q?IOYdWoDqKx8aocAl2vqxU90ziL3ydNvHfRBKvSnUjTk9jkc++wQwM67C3iv/?=
 =?us-ascii?Q?jFe+uNHFZty43Q2mFitzv0IGI4BgQNd5Axx46GIhfWzWeTQxttTodlTftNN9?=
 =?us-ascii?Q?D78pP25WybMblB+eNVSzwfaarLvRbP6RROB7sITBLE1i2AeOt6Ua6WsjQ/LG?=
 =?us-ascii?Q?YAguisiiifB9HOf7/w0M3I9p/turbLO3qp7bv4D/imiQHruHHa8NN6Bv4I39?=
 =?us-ascii?Q?cbgtlfY847kM0q3Gm+C4qVARKJITBegXJqF+VRlZH9hZMe37msXP8PjU4ehs?=
 =?us-ascii?Q?gfq8rSlojcdEacDdDDo8zs+TydeVKzw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e172e2da-1326-4d35-1d4e-08da121736cb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:33:34.1050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+NyDyWbGBkeFFqIQlT+phBWBWiwOmt3oTMbx7IxCu1RZPEF/2QzKXyE1Ybp0cwScH6HAFk44OFQrbw4uS4oKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3130
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300030
X-Proofpoint-ORIG-GUID: J9oXvlKwtSokl4829iNNyMP460nrDEsd
X-Proofpoint-GUID: J9oXvlKwtSokl4829iNNyMP460nrDEsd
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: si-wei.liu@oracle.com, eperezma@redhat.com, jasowang@redhat.com,
 eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

... such that no memory leaks on dangling net clients in case of
error.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 net/vhost-vdpa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1e9fe47..df1e69e 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -306,7 +306,9 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
 err:
     if (i) {
-        qemu_del_net_client(ncs[0]);
+        for (i--; i >= 0; i--) {
+            qemu_del_net_client(ncs[i]);
+        }
     }
     qemu_close(vdpa_device_fd);
 
-- 
1.8.3.1


