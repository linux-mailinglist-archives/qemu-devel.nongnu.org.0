Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8664B9B4A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:40:13 +0100 (CET)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcKi-0002st-6I
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:40:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbYM-0004Os-D2
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:50:14 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbYJ-0004h2-Sz
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:50:14 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4NP7R027719; 
 Thu, 17 Feb 2022 07:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=nXThYHpchnLLASRjX99W4MtY+r3DIhAqrtlPgKqa37I=;
 b=fRNvWqakMiPqDUv+6vqj1BSNbDA5InfYZHkr+6KaQGZQOcmWKtndAR8VyaUkdiNj3uvw
 nKRsVa7pQp7hMPJiL5+h/t7f5bShkINSvKGbLQa8vgUHU6xTvZg1wPmgwdT4QElrupFa
 0NGGUPVxQ3j1cJnqXxs4IO0DgJfyMjkSZfOw20c3axhrnCJx5ikJLUDvgE0/7DE1cxYm
 KTjGu5L6YoafaJMvkFOTWIk/JucFERq60hzfiJPRf0zWirFnp/+/+N8IIvN91KkYiWUO
 WJMg9WcsPHQGmC5HASUXMc+wWGGMqxCRzEa1CD2G5R41b4cqgGMvWHONv/EgHyMoMSjI gQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nr94whb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7fJKh142772;
 Thu, 17 Feb 2022 07:49:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3030.oracle.com with ESMTP id 3e8nkyqrwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSS6odCtwT1bE1Sqr6UNIfoRcFU9euH2cL8m79MD6Sy8PwLhIXylwRkOuPSof9zxIfEN2W/uO0yfwCxgeRL8Vn7awru1akK2S97J79wF5SnT2uBfdtDf755BZdn3hxLKXR0P63WBxPFnBokf7HovvTWXu8mDH5UFFDTq0PNB0Pm6wWdGkuNFi7v03qchRVD2xPwXPPJY7StJk5rBwLQJc45hVHrEb9TqQQPevqMYfhvCwiukOTc90lDTUkgXu7J+B7XoQhB86HOSGYCrde6LoW0bMsxPDO9wgIWWu3rdKl/z43bops7e2xv9UTdmz8NGtlifK0gQLSMECL9Dt+AuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXThYHpchnLLASRjX99W4MtY+r3DIhAqrtlPgKqa37I=;
 b=VNsYmJ41e96+tyfJyGVYqln1ghrMruBITiGlC8O3P3BY3xMfnUwikoFUF6Oobiogr/OsUQX4FuBFxsz9kJlMMujI929CgGPw5l+F4UoIOlead2DddGfiODsAx9y90pa6I9MRbOZ3vzLu3L/+zHFbfBBw1AXNcqhcly1G85ev+zCygfIGv7DXAHpGIV2RHNgoRnu+DqjW88yaksMUk60GvjUqXiAbO2UFJocIiC83Cyq/bHIo+D0535B18ayGVOBVESSKvnziSQBoHtxjgh64qODUea58TS41EuyT9BoCb8yAGZyqO3ewWcqc9yzc0cNgTticyJ/fI5mp0+tD+SuSeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXThYHpchnLLASRjX99W4MtY+r3DIhAqrtlPgKqa37I=;
 b=KnZiXA4oZS60V++EEYcwiw6AFEp+Tld8TjMcMmGL6qhBxE53+EtpzHlPF+762w597PNRZgTIQU1INpJr3r/f2fukcELEeWax2xX4kcsiKRrId4N41qdbjCxRoqGM5savtacFPJgQ41tbDhmLjIUhzsUXQE6bHJiitlM0Vg08Gco=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3211.namprd10.prod.outlook.com (2603:10b6:5:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:49:53 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:53 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 19/19] vfio-user: avocado tests for vfio-user
Date: Thu, 17 Feb 2022 02:49:06 -0500
Message-Id: <4f17aa680216dfe7a226553ebfe164b59fa3cf2d.1645079934.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: d8922d47-0d13-45b0-b818-08d9f1ea154c
X-MS-TrafficTypeDiagnostic: DM6PR10MB3211:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB32116E4B501D51D3E7A6774990369@DM6PR10MB3211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GBwydnxyCBSHh+l+g7Y5mboYWUR7OVGScLUJJmGaNMh6tNmDSav3GXwem22fyfz8etXk7KI0Tk8HKwdA3LmGGjt9+cDmI2cdc13PAe9WIxbji5Ex16OtGLhNtyH9m6iStFz+W3+cq9uQywMK/WVhemFlwaaHkG5ZFH4bpGJexdvGmf6f22Iv0hZ648QpieLcihFnH7Q77BSG9CLrpdJXQCBBlYTpupx0f8hv7le8rZ85bMHMVcnE5UvFLUESE8H7n3NeslvsC/CtiRDEsdUcILjVZPtiRbGtYEFZ6LkoslOunJ27lIrgnKUV1bJ0FELClNU3KT2ur7s8iTLYzsD9H72G4nU+Pr8uUnnimCVYdUdpk+giIfchA4eQMnJek4FCgaEEQcq0Lygvv7tFx0BICa3m4XXK3CgE2XO/iN11nd/dXkYb7Sr/LN45UuYZ9Sw7rgPW+zGS2afqILV54mjs6D4aBsFU2sMkeVbu21aGlKs0AqGmgqcarm607LlwOs3VqGuEnU1ndObn5N+jx44fnCDyRSQGahXd3IoBANsv7GhdqiwcgLI18pOFtxEXYk4tyEyyLuDqI7d2y0AYQq2tyaw4RcuF5290Jsb/sMcVBNi0VVw9NJoLUI4az/rQR87sOciZeIWHhDscQEfhW8RD3/4HCKxA/6G+RyfVLPD1Yhzc1sTBtmmIZf6gCHEl5+4zPRFqoV+fAHhXdPBjY7VJk4HNIPkxJWyrC6zAuV5UoxABPPpFeWx5CFPcbQBaGgXd5qukCBlA4HxwQEfKxRyfqM1T3gKa9O9SXL7CrwaQDdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(66946007)(38350700002)(7416002)(4326008)(107886003)(26005)(66556008)(6916009)(8676002)(5660300002)(2616005)(8936002)(86362001)(38100700002)(66476007)(36756003)(316002)(508600001)(52116002)(6512007)(6506007)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JFSv2fHHTRLQO+NFKO3K4gg/GOO9uGciIJ/kUpcw3JZiC+a+jpeiaN83dViu?=
 =?us-ascii?Q?d3njGjgYuttYer1TlGfVy4aKoeeq2hMMclzq7Ht8b6MY+ccykzMtChFaqcZ+?=
 =?us-ascii?Q?4idbtdRsRYYbHbJ7LuIIcDFyipSIAmG8qbEeCQUmEH0oL1YODHY+REB4Bv1F?=
 =?us-ascii?Q?OvwtwxM14YeLzkENuEEn8vC+JR5SLwD0BbGAHCE/BZ5ubqN/hQUzYfRt3u52?=
 =?us-ascii?Q?SNxWbMqGYwkJAz4T690xbsHfRS3KzEqdggskP8ZaezBLukVjiJO8KNa4cOMl?=
 =?us-ascii?Q?dKHgejGL/9mxTULDzoqXhB9uoCBt2d9JMtjoz3vch/9ltF2ZxtIi4aK9s6KU?=
 =?us-ascii?Q?ClAwZ0GXGcXgjL3T+vi1pNoGuP21HPphEXaAhPajuE/O0um/GCMHVo1wqZ0d?=
 =?us-ascii?Q?HRACpDpp9esnTh1/xNdy1entfn9He7AQRBLejz7fRr4BYZbUXlWTXOLaao/m?=
 =?us-ascii?Q?K8L0cVtuvk3RnP0ucR16RR65lMabogl1I4lIAaZGUN2VZbKQIcy+3NRA+pGd?=
 =?us-ascii?Q?qvKqkOrudFUa7xnSMPRMzgXWNn7zCUWsi8lWB4PEno5Zkqa0vVGsXrxk/n0o?=
 =?us-ascii?Q?jdGfpA0FGF17AjJTPzHAaPsJWtqTgADVsvOEErjFltBKQoyOkUYM6MbqW6Dt?=
 =?us-ascii?Q?7U80Bmpms9Cyk/oZU597q49uVHWbXx5Eh97E/XKmU+/EbE3O3Lt1H4MBcFPS?=
 =?us-ascii?Q?cERSNuYelosaKOIp0vyo/lEOrOWneJ8WzSryif/Zg7hJ9ubwRxH2d6HtY2uR?=
 =?us-ascii?Q?DKx0Mun1hmZ//LxW3khaDaGQ5OPdJfgsz9YApshmNml/02Do9LbKp5FsKzCA?=
 =?us-ascii?Q?XBGUgZn2EITIBUjX4EsO6ON7vZygxhEqHCKfWBcS6TvAOJcRRemY/7ZIhSSo?=
 =?us-ascii?Q?nrbC2ZeKWYmALJ9kPhGM2F4tisTB9F9tVRmEJXmzouQBxS3EUGRSEgYYg6Bp?=
 =?us-ascii?Q?ngLDypZugUjVjxlfJOxGzueMJ88Ht/UEFtNqmgAkmkFBSHSjdKiI7tnxAm66?=
 =?us-ascii?Q?tlFD+uxYTrxAwHt2UcrekASTNAhQ02GgWnBq41znu23pJlq0doIdmfqhyKO9?=
 =?us-ascii?Q?u/Nf8QG+h3oOD9kbHK0a1SzIj6KUWIscoDYWCQwZwg92OAa9v1Sg8CnFFH6p?=
 =?us-ascii?Q?NT6eoi4C29TL8M/8h4bZvj1zBvFB7xJoqVj9I/WLdKx+pYvIQkJfb4Nq31lZ?=
 =?us-ascii?Q?dsykU+v46fB57+KPP5L0XRD2HAHpEexv8OIjk6tfA+XMrlO3Rqj52sUMY2lE?=
 =?us-ascii?Q?CFRfWaiKHKPKHRLA3DVojNh8birjsTH25cyVZBe3Eptsu72HoNUh3Uey0jC9?=
 =?us-ascii?Q?yXtwvXMtdflgFkZM5zsOYAGlywgnOzx4DyD8ayJNztqc7YKoxO2wNCsx/O+i?=
 =?us-ascii?Q?9m39pyP0f/mAOJApKvdKLdF5pii8t9ohytlN8Iy0ustweyPGaOVy7hGTrY1G?=
 =?us-ascii?Q?vCDDrjWeLkGgvSgPAls1AxtuA4p15l7TL6d7LbL/MphuK9I6mwyZxTmC8YBy?=
 =?us-ascii?Q?IdXTeEhg0BO59l5/X6PpvR7Yfh82/7gOBFioXMGRzwqlobWLgGmmvnQmL0nh?=
 =?us-ascii?Q?xJaXWv3wc68LoqERY/nmVN8cThnPpShL88Fw6jQO49oPplLrA8qwN1Gjm396?=
 =?us-ascii?Q?I98T16UJhvoP9ZdD7ggAttk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8922d47-0d13-45b0-b818-08d9f1ea154c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:53.2876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4Xq1ymMUIZ/RDCrwLoX5wh561KFpp6KJw5ZlTLudSxn6RgXcxnZia3FIG4Tz9DMPjZeI0vrFTRZ37E/zSwhFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3211
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-GUID: f1hSi6Nfn4MqGMUg8AFP57FE2zRsfMJT
X-Proofpoint-ORIG-GUID: f1hSi6Nfn4MqGMUg8AFP57FE2zRsfMJT
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

Avocado tests for libvfio-user in QEMU - tests startup,
hotplug and migration of the server object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 MAINTAINERS                |   1 +
 tests/avocado/vfio-user.py | 234 +++++++++++++++++++++++++++++++++++++
 2 files changed, 235 insertions(+)
 create mode 100644 tests/avocado/vfio-user.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f55d04ce6..02728eb8b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3573,6 +3573,7 @@ F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
 F: stubs/defer-backend-init.c
+F: tests/avocado/vfio-user.py
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/tests/avocado/vfio-user.py b/tests/avocado/vfio-user.py
new file mode 100644
index 0000000000..3f13d9895d
--- /dev/null
+++ b/tests/avocado/vfio-user.py
@@ -0,0 +1,234 @@
+# vfio-user protocol sanity test
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+import os
+import socket
+import uuid
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+from avocado.utils import network
+from avocado.utils import wait
+
+class VfioUser(QemuSystemTest):
+    """
+    :avocado: tags=vfiouser
+    """
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    timeout = 20
+
+    @staticmethod
+    def migration_finished(vm):
+        res = vm.command('query-migrate')
+        if 'status' in res:
+            return res['status'] in ('completed', 'failed')
+        else:
+            return False
+
+    def _get_free_port(self):
+        port = network.find_free_port()
+        if port is None:
+            self.cancel('Failed to find a free port')
+        return port
+
+    def validate_vm_launch(self, vm):
+        wait_for_console_pattern(self, 'as init process',
+                                 'Kernel panic - not syncing', vm=vm)
+        exec_command(self, 'mount -t sysfs sysfs /sys', vm=vm)
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/*/uevent',
+                                          'PCI_ID=1000:0060', vm=vm)
+
+    def launch_server_startup(self, socket, *opts):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote,vfio-user=on')
+        server_vm.add_args('-nodefaults')
+        server_vm.add_args('-device', 'megasas,id=sas1')
+        server_vm.add_args('-object', 'x-vfio-user-server,id=vfioobj1,'
+                           'type=unix,path='+socket+',device=sas1')
+        for opt in opts:
+            server_vm.add_args(opt)
+        server_vm.launch()
+        return server_vm
+
+    def launch_server_hotplug(self, socket):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote,vfio-user=on')
+        server_vm.add_args('-nodefaults')
+        server_vm.launch()
+        server_vm.qmp('device_add', args_dict=None, conv_keys=None,
+                      driver='megasas', id='sas1')
+        obj_add_opts = {'qom-type': 'x-vfio-user-server',
+                        'id': 'vfioobj', 'device': 'sas1',
+                        'socket': {'type': 'unix', 'path': socket}}
+        server_vm.qmp('object-add', args_dict=obj_add_opts)
+        return server_vm
+
+    def launch_client(self, kernel_path, initrd_path, kernel_command_line,
+                      machine_type, socket, *opts):
+        client_vm = self.get_vm()
+        client_vm.set_console()
+        client_vm.add_args('-machine', machine_type)
+        client_vm.add_args('-accel', 'kvm')
+        client_vm.add_args('-cpu', 'host')
+        client_vm.add_args('-object',
+                           'memory-backend-memfd,id=sysmem-file,size=2G')
+        client_vm.add_args('--numa', 'node,memdev=sysmem-file')
+        client_vm.add_args('-m', '2048')
+        client_vm.add_args('-kernel', kernel_path,
+                           '-initrd', initrd_path,
+                           '-append', kernel_command_line)
+        client_vm.add_args('-device',
+                           'vfio-user-pci,x-enable-migration=true,'
+                           'socket='+socket)
+        for opt in opts:
+            client_vm.add_args(opt)
+        client_vm.launch()
+        return client_vm
+
+    def do_test_startup(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+        self.launch_server_startup(socket)
+        client = self.launch_client(kernel_path, initrd_path,
+                                    kernel_command_line, machine_type, socket)
+        self.validate_vm_launch(client)
+
+    def do_test_hotplug(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+        self.launch_server_hotplug(socket)
+        client = self.launch_client(kernel_path, initrd_path,
+                                    kernel_command_line, machine_type, socket)
+        self.validate_vm_launch(client)
+
+    def do_test_migrate(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        srv_socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(srv_socket):
+            os.remove(srv_socket)
+        dst_socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(dst_socket):
+            os.remove(dst_socket)
+        client_uri = 'tcp:localhost:%u' % self._get_free_port()
+
+        """ Launch destination VM """
+        self.launch_server_startup(dst_socket)
+        dst_client = self.launch_client(kernel_path, initrd_path,
+                                        kernel_command_line, machine_type,
+                                        dst_socket, '-incoming', client_uri)
+
+        """ Launch source VM """
+        self.launch_server_startup(srv_socket)
+        src_client = self.launch_client(kernel_path, initrd_path,
+                                        kernel_command_line, machine_type,
+                                        srv_socket)
+        self.validate_vm_launch(src_client)
+
+        """ Kick off migration """
+        src_client.qmp('migrate', uri=client_uri)
+
+        wait.wait_for(self.migration_finished,
+                      timeout=self.timeout,
+                      step=0.1,
+                      args=(dst_client,))
+
+        self.assertEqual(src_client.command('query-migrate')['status'], \
+                         'completed')
+        self.assertEqual(dst_client.command('query-migrate')['status'], \
+                         'completed')
+        self.assertEqual(src_client.command('query-status')['status'], \
+                         'postmigrate')
+        self.assertEqual(dst_client.command('query-status')['status'], \
+                         'running')
+
+    def test_vfio_user_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_startup(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_aarch64(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=distro:ubuntu
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'rdinit=/bin/bash console=ttyAMA0')
+        machine_type = 'virt,gic-version=3'
+        self.do_test_startup(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_hotplug_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_hotplug(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_migrate_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_migrate(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
-- 
2.20.1


