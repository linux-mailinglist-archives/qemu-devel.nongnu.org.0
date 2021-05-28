Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFD23946ED
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 20:20:44 +0200 (CEST)
Received: from localhost ([::1]:49014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmh6B-00084E-IN
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 14:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0K-0001cS-L7
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:1132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0F-0007PN-7h
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:40 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SID3AF010515; Fri, 28 May 2021 18:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=mgrqxsJlLhCY7N8+X72apT3RvNXAQGvwtiwQLkLCEW4=;
 b=0gQQky/TmWWytTIlaDZeqyUQqlmY0eiUZvC70201NRz7jmmHpXpd1EhgpFey5905QZUd
 EMRZGf0vyQrybwJBVzXDD13iDlqYu/+AJW2hx7ha4MHvMxILkWapQJyVR1yXrheunuXa
 eTiTeoGBxeYIdzRkBraf7IQsGaCNw6+UlfNNmg+yrQNpLS8KjRx3mP3sSMVDvegP22fd
 sPy3sb5zV2Ty1zDLlpCCf6uSlZ6zL/+VI/vr1RGa7rDVk1agROPXQI2QmrRfTACshEhF
 uFVGVoBZhlaZdEA0LOZFGcqwkANeGyWtHWXhDC0nOwCHtv/o6yXtL9gS6QkVLXG7HVH6 2Q== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38u25vr29u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:32 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SIEVUS161984;
 Fri, 28 May 2021 18:14:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by userp3030.oracle.com with ESMTP id 38pq2xqfdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5Lv3vH7deUYEg8gSSDQacShm7QbwciC8VLGfVpp0TdF1GsGPYYn+ZjndWwiqcWA8tWJ0gvoq+Ti4s+46XFe1qa2T/w3AoP4QFmvndrawy8JlmGVYgJWvOzS5j2PoGf7q/jYVJ4ygHnyVNxWKJ2fw9tRIV5RuUqMO8HJhHnsqyMPVs/xDmit6KBMBbzxLnM3CEZHForZahtkE5EyErCdqtqyJjz+OUJ68EHyR4kzirlLdJ+O4SwxAMKE8p3ufsvUzr5PIwuNaD19VtcQOsAU9ur+XDekOPIZG/3ih2BQmw52bCMGoeL6vqgCMfUm+us1pcRbzNq0F6/nce+HZSRrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgrqxsJlLhCY7N8+X72apT3RvNXAQGvwtiwQLkLCEW4=;
 b=Uz3bcZRjJTanMr9NRtVw10Tyrpr6cRtF3topnti/aFln3fJYXc1mDXOTjcUfgJe3d0rl8nfbWF8tEoP0btdNP2iRVYguxabkkM388eUF8efaEd7MlhMmv0kCl1BAeE+vjx12z12qCwpamoBMnSLG89uQNrvypGVWMqplLGxlSN1vudX4/4q2r0PaoS3HUVGKtwPGY9b+E3MRMkesPlj19aqqgfXr5P+X7SppQjmjfflNvOOzOmXqkXJWxjnfIjtCSt0PJYPzMeuYzrKX+fbO896q/w757WgX6Z1erMRqfpj6N4FrifXBVAYvSy1EzDOsxRau3VGWeYpcTYnR+6ct9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgrqxsJlLhCY7N8+X72apT3RvNXAQGvwtiwQLkLCEW4=;
 b=VIX2FvwxK8sLZv7jO5DchGLdZphUAGNhXR47IE+nEzfnX8wEX/J71Uaq5lJtMboidbgzb43Xh2D9IqHW8QTMETQgVJKyNBp4WP3v7kMFhF8LlDMtZfX9hLUGY4V0VlmznPvxr9oE8P/Am0BXSqL1ap9GjeGVwC37asPywIXx97M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 28 May
 2021 18:14:29 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 18:14:29 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] ACPI ERST: header file for ERST
Date: Fri, 28 May 2021 14:14:14 -0400
Message-Id: <1622225659-16847-3-git-send-email-eric.devolder@oracle.com>
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
 Transport; Fri, 28 May 2021 18:14:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c99e46d4-e0f2-42b4-a765-08d922046f55
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB20455A408129901D1F7B147197229@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxB0mu9apc373Ao4Ls6jqR232O+UMDPhnDto3q1HFR8HOLYsVYAXKZ3xmBj4K8lWvP0qX9sAb8RxOD7DNrPwu0/3AT/A8zk32tbuunZDV9aEU8tz1V259+j7P3Po8E3jPhhJcY/mEjUH8VmBhqtSSgqwg9TQpYq3H2BiVGZ/6VE6hPNY3OKbCQM4kFhkWAR5Xj3GDm85Zsq5fcXYaK1mWeiptrzoO1eDQuxN50BUDPAsR4FBypKQoTXCAw3wgRMAd1//Mok2mGxPW+162jOWD8uKu+aIXNp/4ZYACEyfej0CJqiM+kHcbuNXOun+Pk/4itDzEFFqcmgf3376pTHc6WW4D1/CTakVQggJHPlX44zrfpbHnWeoQFC1KUlyBG8brZOgtZqWyafP4adnw8Tj4qIlsRjNB+hLFrPcHwwAezmpHraRqASbd2oj4ew8QcZg7U8zAxBJs16TYIyaDIES0tOVBUMjdNHSceeb7ybnRPJszbTKvv+28UM2tp1/CqzAjZZr7wjx0pHPEqxAtSs+rICJfmoqmtnk+2VPXvoX5iwREBARcwjYYlzkDK04/aVcHJu/+GxRq4EXqgESyb+uNbcNJdjC7ZA7bctJpbB/9xDFqIPo4avj4cLLyqQMm7U+61cZGMInMrR+vM6KzwVspqkcg410+fY9R/EYLQF7Wllu96bfs4siYBRZF+SOhoR5TgvdAr3P2JSv/neuyMkrV5/Ycg1uezIl7j4k614ejBbAFGXAMdocjhmz8VgGrHkLuHkJtQBhoq9v3ey2sO/oZ3nz7DA9yCRv+G31uvKIe5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(6916009)(38350700002)(956004)(7696005)(38100700002)(52116002)(36756003)(2616005)(8936002)(66556008)(16526019)(186003)(8676002)(478600001)(26005)(66946007)(66476007)(316002)(4326008)(107886003)(2906002)(86362001)(6666004)(5660300002)(6486002)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rN3f8wj9KXLtuTscLe3RisOx0VKVhPuOlXlFVq7taAWgrG/qvWdfPt4ySFf6?=
 =?us-ascii?Q?v3eZeYdimGHa3IZHsxw9+31D6T1rw/qCUZKkzJhQvAGGTrSlofStDX/ccrLX?=
 =?us-ascii?Q?VsjId8y7lvfEY/QHAvEOxZvTtxnrmFobakiVURMPP4QziVleg0GwOV3OWXsx?=
 =?us-ascii?Q?VRwUbxeFBVt5VGN5TWtWLFaHmShEJ99aq79X18/XKXwfNrM8QaWfnBbHJ4Ab?=
 =?us-ascii?Q?8qD5aueDtiwLM7axuIJ83woMIG1159AIGF0cIf2aXVJi2rTI2zFcgBERd+kf?=
 =?us-ascii?Q?4SG8kVUA3Pw6Mx6/WnaCz+SSXsdTAQS+5d7Qbi7SM7yQw23Wa2bpwzmi1rLi?=
 =?us-ascii?Q?LWrmZKPZptMvwnXeB+nGRIl+AU8uNZ0LJ9T/B/kkfkto680hrzOe/t8ORWj7?=
 =?us-ascii?Q?QZO/bEl1RPKv0jJ8RGY16TdfjPqu8SG6IYiJPCOcgInU8X64i75njsULuQQb?=
 =?us-ascii?Q?qfmGmw1tSq2NmGRJFysaio6P/++8zG1PX3vUiBWZLjH0pKghBIuOpli7rag2?=
 =?us-ascii?Q?OkU8Df6q37IzpXznofC+Dojux9tOdk3O7x4a3tDUKSjE6OIdY3txt4Phwjch?=
 =?us-ascii?Q?ASf2iXZnrHdR0ZLlhhq0f/2tfckh3zjAnjFtVE+tyoz9lOG35OCqutDEtDLD?=
 =?us-ascii?Q?NlXEEne+92eN8K8psBqljrGBggg2JwV3Wb49suo0wXmDWgQUvr2ZfuxGa6/o?=
 =?us-ascii?Q?6E/0sFqg1BvEI/9HoFg8yNhSikXA/oXXGUziDAuBfEA66uYSQ469q81b/giY?=
 =?us-ascii?Q?DyPAsdrq8EnR7w5RQOUIvlgGfCEME7paG3tbOzeu8Mxr1qk4Cd0pl2D0CixL?=
 =?us-ascii?Q?QXFDxL/5Smc571hFAftohcrpQDNq4oR99zzpPmqtdhANrED5ommiadTdkqlL?=
 =?us-ascii?Q?/LAYXG7iLHdtLFwurjtR6mGBRDL0No2W2eetHhEoBv4/v0OJgcodo86GwAEg?=
 =?us-ascii?Q?Tg/h0lJMviT65CztQpQ/0g3EQqWEc5scOZB/y9c6R8pj9ELETfShJ8HKWEv4?=
 =?us-ascii?Q?+KpYDVL8hJZZpwB/mK4yAbagNYwJsPWq0HHyp6VVUp1Orf7Wi2vYWbvggDaD?=
 =?us-ascii?Q?LWwiESb78PJ2p1zpD0J/ku3g8oj/k+6TyK9jsdPB7MwU510EUt7h5pMbX+R4?=
 =?us-ascii?Q?USVlM8doYwXf+seKaNta31pXPzoFitJqA4eHtkmkbim+Sc5x+sYbxHh4YqPI?=
 =?us-ascii?Q?TCoFygSI0Td4/MJKVqM1y+3nGdTzr3Lb2jPe9n2/EvErgVBxegtq/GghDRCa?=
 =?us-ascii?Q?/499RhR3k9SutOsDHtIuVwyG/iAFJ9wwJThLiOaSlx0z5VlhhTmP2SMrIXCI?=
 =?us-ascii?Q?+0udOzwR7xd4C5qSEUxD2lWM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99e46d4-e0f2-42b4-a765-08d922046f55
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 18:14:29.4207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLYiAM+QAqVfUb8j23q0tQmvXPKLM8WlOA/DH8D5un1qMUMlx3axVZXHUL6qlvQjw/gFOKC4Ny2h8CG5dIwbiaLGcsJPRUDnJEuVTVsaSvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9998
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105280119
X-Proofpoint-ORIG-GUID: mVh1YEh6T31zKxW1qpVwkdz8DdnzIMi2
X-Proofpoint-GUID: mVh1YEh6T31zKxW1qpVwkdz8DdnzIMi2
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
 include/hw/acpi/erst.h | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 include/hw/acpi/erst.h

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
new file mode 100644
index 0000000..8a8ac5c
--- /dev/null
+++ b/include/hw/acpi/erst.h
@@ -0,0 +1,82 @@
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
+void setup_erst_dev(hwaddr base, Error *error_fatal);
+
+#define TYPE_ACPI_ERST "acpi-erst"
+#define ACPI_ERST_BASE_PROP "base"
+#define ACPI_ERST_SIZE_PROP "size"
+#define ACPI_ERST_FILE_PROP "file"
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


