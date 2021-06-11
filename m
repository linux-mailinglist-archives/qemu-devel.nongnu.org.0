Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A955C3A48BF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:37:06 +0200 (CEST)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrm1h-0004QO-N5
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwi-0006V2-Tb
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:56 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwb-0007h8-QD
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:56 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BINE22001571; Fri, 11 Jun 2021 18:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=LWyBhLI4gVSl1BnA35ms+70L524JOlUTHq93xbXgYAw=;
 b=bxy3Hrs0In10uVUDEv1Khn1f5YMna9vzfqXj0RkQeEmHNwg3amQ7X3gPatiA9n7WepZF
 xsf1yTMclBNR/5i2XvCgDdSfoi9Yan3L47kb1Z9EJp6g6cJ5JdvqNp5Inh5GrqONkIhU
 ehmgqISm5B0HZR4kpBuBRJZJrFx+ak1+7/HlMhcanyKXGrEo5U3w0TUr1W+hqDfk6bN4
 4RHigZ+VeIiuKWmGk+oOi+AN3YHbf2gp3G1WpROkE5mw8lRHZClA/HIHcvXUn+td2v6v
 K3ktpMtpD4YEDVXTnm499Vm3hlChUN1Yos3id3z3QclIBqVrZyx/oo9HynmKGbY9f2QR pQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 394a04r291-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:47 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15BIVknL015909;
 Fri, 11 Jun 2021 18:31:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by userp3030.oracle.com with ESMTP id 3949cw8h3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2B+i9et4WEloQpm/GlW87c+RHlGUUdms0Ha+IqUzuXYcqPqCCaMSz2as1zvkiPxKFNfTeWKkVeJZJm2tlHGBTELK25b37OKqPXkTZ5/CAvJCzwW9RJyaNC4NIT6XVOT0h3n7vmf4lMDnQiLStBz3XoGVJdsK2uyC5dT9HcV4ihl3q6b3ZQJieUR4e4CLauAnsAO2PI8PmJuTayR7sbL3EAlDgaO/noBwOTyIddKQPxrlg/wfV2sEdWWkMUvgjJFQQKBe2gpsHa5r0BQEm/g1o5tuoUxMHyL6jRUxbrt2k9zleF8XdwnELNwpjTiT5wHdHZ83Yxhrx5KMub4qbpuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWyBhLI4gVSl1BnA35ms+70L524JOlUTHq93xbXgYAw=;
 b=GbO0SG1H4G+pOaHJ0dm/8jLJ7hLcoYsc5etytdl2451K+WQMG7TEs9BrdPbf1J55GCyMCH4a1siF6aQL0XOXG66v3eI5l+xjDFj6VhENRoDbAMVzOE52NS32TtS13Nv0rQoVPSaRKDO17POmDSXqWjt1r5zW89uiRpNY2Vt12vlsF6LFNvYM44pt/5P5JTPsIMm4QTFx9Rlvb6ZhQqIqgWYhRoCI+FqtKRbCb56AUAC+TsROIgrLD9RPtW5Q2xGaXRHBbjUyzbQY6U6KKMgT1MkE/xIFaiNyIN5ocoheBRkUtmyRWzY9Rb8CvwRSGSRAfDjwmdO4rdsEQ5qNwsl85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWyBhLI4gVSl1BnA35ms+70L524JOlUTHq93xbXgYAw=;
 b=qWsGuwk+diGJLa78cLqSYg/NDs89+tZfvMqKRjsNm9kMmZ2bYQWmxa84EoxtT6hxVo/bH99me62xoG7F6L1mT2daOoWi962G+Wxc3zuo7P8ULX5EcvdKWSyCM3oaOZC/Bnja+oCfNb3cMfLenex6rlcn/1ytNHjI8f6NQkRwzww=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5457.namprd10.prod.outlook.com (2603:10b6:303:13f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 18:31:44 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 18:31:44 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/6] ACPI ERST: header file for ERST
Date: Fri, 11 Jun 2021 14:31:19 -0400
Message-Id: <1623436283-20213-3-git-send-email-eric.devolder@oracle.com>
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
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 18:31:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 603d5121-7a0b-4a21-6f47-08d92d072a05
X-MS-TrafficTypeDiagnostic: CO6PR10MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54570B3C809B76D0412E2D2D97349@CO6PR10MB5457.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tzn3lXvhP1Tcyop2gOTi4Nu/BGnsccTRAjIHFhFV+ej1FSU3QTaw0McE88ahEVUeAgCRyv0w9yl7Z5n4ie75hJ2G/p18WJRlrnLMDdiXlwyyL7qvZdFD0UovdIKTQZXuLcuWpTgy5rFyafZRQuLBEV/Dd0/35kMbNK/KHvkRulw0tkOexZRhbKhWenkvr2BZVm7+gpU2SwbYzxZr57w3E5b0NRQP//dstR19k14EzsNF+7uSj/15V/Hym5A6xohCiOnqRRzW+zxD/iirn1s8HxgcmFoalrPzCYsjjTJZAx60n/BeG/Q8YuJpO/KnAtbdnBt2fqkkDzk+rHFljpgygb9nxc4bWwM82jCQgOaSJYnNERlW6lHEPH/vZkmilavU+Py+Jo2k2B4A+kkJB2ncyAl8OWad3fn3qNX8J1Y3Jx+gRthsNM8ewO3UJA8NVqkeeiTpA5EJs0zOUYeSsqLlpUupla/m9coT4ZA1UeGFit3AlQnBNv9r2hBKgC98qJEvQRmOJXC049MQVMrMji5fyOBgqmx2XjPBYv0dcmqSNUvI5XtITQV0hxNe8GJpu8IjZlNclwazDCz4JIblYaviXwMdRcfYg3pE2R8hf/SO1ApLoPae9D8Hyv39pE6VP1V2vA38bKdan/nIs0Ok5Fce7OeV4rMJHJh65OYIErKPmdijJayvGVYcx77KLCBclJncLcFV+wTsaZhdqaTZF22tosnGkUil9nSUorO2ZVEicRoY6i6PRxcAoB3By/GrsRuniO1hQ/qb1sPrtM7LTJE3cA6MBeMlaMSbVR5SgXV11Rk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(7696005)(8936002)(26005)(36756003)(52116002)(6666004)(66556008)(186003)(6486002)(478600001)(66476007)(4326008)(66946007)(316002)(5660300002)(86362001)(16526019)(2616005)(2906002)(6916009)(38350700002)(956004)(8676002)(38100700002)(107886003)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TsAGMK0NVEhpjO1SPEJCAA+ND2QO3p4+a2CTg2lCJS2AlfHfD2BXgzL5Yr6s?=
 =?us-ascii?Q?w1ZKI70tWLr1Y+eUvw06/bob79gLeor0jDm9LZnVSC1lP87+I47+pgRIYjWJ?=
 =?us-ascii?Q?JWZQkbyflGee9dxJll9z2KqSNSuk6yg0ZbKLaxHK8eyLOK2dgaJ/vFPPiO0e?=
 =?us-ascii?Q?1KG+zrfh0mMw8qo36z0qnQrqzeXofQ0C6oVrx7/G3cJDA3Wz4ROdmJSRi/u6?=
 =?us-ascii?Q?e6yQyqDs8fnKDn6c+IWS0JnLHwDQiIsXDA86QPC1qZgpuF1ZuFaHAqYaaVNW?=
 =?us-ascii?Q?5yPTDX9nvOp01Y3rEMcsWrz6rna25dvycKvRID9usoRE7a+6kyA2ooIDAPrD?=
 =?us-ascii?Q?/EUXNKj/4zpxyIbbOEYfc0aXsbFKISkKkCApCB6rExv5Y3opeQoIISEEPZqk?=
 =?us-ascii?Q?/NyHxaNK7YpAglISAO0Gwdh6HzeJgC1Us+O+z9wfn3iY1xssAMH4yjAmsORI?=
 =?us-ascii?Q?rFJPUqDrgQ/Ax1SI/ja6/v7MZN8jABZ0AZjn7WqsUSaSHivJMDB55HI92iOQ?=
 =?us-ascii?Q?aKuQRUU5ed0xhJ/slpT0+NXRZMxhPsA5EoNKhUHUgp1Z7AfHwGJDuDsSjoS3?=
 =?us-ascii?Q?6QhnAJjULblOj/Tdqk+7HAPWweTixox56y5Il88ljOzoYsG5NEe2TlhtgBS2?=
 =?us-ascii?Q?L4bw1X/pc+006mw9dJajgdE+Ddi5OaY4wJg8Kbrd6Hx+gh/3yas6cQ82XYXe?=
 =?us-ascii?Q?Nq7xIK8S1oKB+Go4HYjGMn2SzNXsSJ7HQNOH8I4SjTJP9mj5pjgXUxvgdNgL?=
 =?us-ascii?Q?b7NwjtQRS0V1O1/iCgAh2kZaHDEsQf/FsUBIShtiYUA4j8CDfqkBq0+mTRda?=
 =?us-ascii?Q?jQck43bkno0sQ9CNreACwIb/pY2R6w04wTMStc+Q0TMXbc+qK7G1ewNtxp6s?=
 =?us-ascii?Q?gPK0K/DR669W4NeNHbcL9+1aOd1xgJx1Ed5Qx3fVtEkw4/eq2LOtPpNuxbsJ?=
 =?us-ascii?Q?ZImGeSHVY5X/Faa/ccuGwaAu03FzmG2oUQzay6wCme4ny0g6aViwbfidcTyK?=
 =?us-ascii?Q?0LpzrojrdoBPM6YpRMx24Lny2+Wy1lB54vrYHEIqT7+xchun0L9lfOXQAC+p?=
 =?us-ascii?Q?r1ucaWRzVZQPCQCBEUkNCwCwIrBmbHs6cTD+04a6em3KZBfD62l+cXzSdPPq?=
 =?us-ascii?Q?Vd96t6nc9JLiC5SJ07czZAF8OdHcjaGg27ahVNG+yGT3lobuf2k8aqtj+iTW?=
 =?us-ascii?Q?LQsgpow4AkHKj/7d88E9ekRilH2lz248tzn0AIyddsGZYcs0oQJ3h/lIxgro?=
 =?us-ascii?Q?4Xf6j2qK/m3lCO9PjiL1P2aPvfo28EOgzLl3dcVkiJL27tM1I5YaZZOZFw8U?=
 =?us-ascii?Q?FdVCbM5xUJuOwNg3Brq05JcH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603d5121-7a0b-4a21-6f47-08d92d072a05
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 18:31:44.4139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6c4ZOxUNg3MfV//mq6tksqAAwnGrQ17BbZvpG+hzyoQKRttbx2yeOwnnABKx4I0X+dKtnbwpEUQYniYxeb7eZ5kkVqwa8iZ5ijleAINJCUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5457
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10012
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110115
X-Proofpoint-ORIG-GUID: eSoj4SeYh64nr4Nec0OQbd-cZFITWEjQ
X-Proofpoint-GUID: eSoj4SeYh64nr4Nec0OQbd-cZFITWEjQ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

This change introduces the defintions for ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 include/hw/acpi/erst.h | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 include/hw/acpi/erst.h

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
new file mode 100644
index 0000000..a18d58e
--- /dev/null
+++ b/include/hw/acpi/erst.h
@@ -0,0 +1,79 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * Copyright (c) 2020 Oracle and/or its affiliates.
+ *
+ * See ACPI specification, "ACPI Platform Error Interfaces"
+ *  "Error Serialization"
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
+#ifndef HW_ACPI_ERST_H
+#define HW_ACPI_ERST_H
+
+void build_erst(GArray *table_data, BIOSLinker *linker,
+                const char *oem_id, const char *oem_table_id);
+
+#define TYPE_ACPI_ERST "acpi-erst"
+#define ACPI_ERST_MEMDEV_PROP "memdev"
+
+#define ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION         0x0
+#define ACPI_ERST_ACTION_BEGIN_READ_OPERATION          0x1
+#define ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION         0x2
+#define ACPI_ERST_ACTION_END_OPERATION                 0x3
+#define ACPI_ERST_ACTION_SET_RECORD_OFFSET             0x4
+#define ACPI_ERST_ACTION_EXECUTE_OPERATION             0x5
+#define ACPI_ERST_ACTION_CHECK_BUSY_STATUS             0x6
+#define ACPI_ERST_ACTION_GET_COMMAND_STATUS            0x7
+#define ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER         0x8
+#define ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER         0x9
+#define ACPI_ERST_ACTION_GET_RECORD_COUNT              0xA
+#define ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
+#define ACPI_ERST_ACTION_RESERVED                      0xC
+#define ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
+#define ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
+#define ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
+#define ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
+#define ACPI_ERST_MAX_ACTIONS \
+    (ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS + 1)
+
+#define ACPI_ERST_STATUS_SUCCESS                0x00
+#define ACPI_ERST_STATUS_NOT_ENOUGH_SPACE       0x01
+#define ACPI_ERST_STATUS_HARDWARE_NOT_AVAILABLE 0x02
+#define ACPI_ERST_STATUS_FAILED                 0x03
+#define ACPI_ERST_STATUS_RECORD_STORE_EMPTY     0x04
+#define ACPI_ERST_STATUS_RECORD_NOT_FOUND       0x05
+
+#define ACPI_ERST_INST_READ_REGISTER                 0x00
+#define ACPI_ERST_INST_READ_REGISTER_VALUE           0x01
+#define ACPI_ERST_INST_WRITE_REGISTER                0x02
+#define ACPI_ERST_INST_WRITE_REGISTER_VALUE          0x03
+#define ACPI_ERST_INST_NOOP                          0x04
+#define ACPI_ERST_INST_LOAD_VAR1                     0x05
+#define ACPI_ERST_INST_LOAD_VAR2                     0x06
+#define ACPI_ERST_INST_STORE_VAR1                    0x07
+#define ACPI_ERST_INST_ADD                           0x08
+#define ACPI_ERST_INST_SUBTRACT                      0x09
+#define ACPI_ERST_INST_ADD_VALUE                     0x0A
+#define ACPI_ERST_INST_SUBTRACT_VALUE                0x0B
+#define ACPI_ERST_INST_STALL                         0x0C
+#define ACPI_ERST_INST_STALL_WHILE_TRUE              0x0D
+#define ACPI_ERST_INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
+#define ACPI_ERST_INST_GOTO                          0x0F
+#define ACPI_ERST_INST_SET_SRC_ADDRESS_BASE          0x10
+#define ACPI_ERST_INST_SET_DST_ADDRESS_BASE          0x11
+#define ACPI_ERST_INST_MOVE_DATA                     0x12
+
+#endif
+
-- 
1.8.3.1


