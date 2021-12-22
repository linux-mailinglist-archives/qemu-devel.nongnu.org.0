Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785D47D7ED
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:45:03 +0100 (CET)
Received: from localhost ([::1]:57562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07Xp-0007I4-LP
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:45:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V6-0004YV-H5
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V3-0008Kd-Qv
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:12 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXvQh014457; 
 Wed, 22 Dec 2021 19:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ZAUYcjtQ4CZMVSRb56kgREKga11yEanCT69C5zHJOD0=;
 b=sL6bd9q4eCwPGN6Eu4VkNcKxoc72H0p8R4dLfqCXOJUpMg0z70foA+zwCBcgx2b3jcPs
 Nx2LLJqQjSV95r8ZNxlGslcOpJiwA8sjKmhPhXs24uBpPLm/Rg99RbF0AJKB8JbnHLzP
 laetJ9bDPKUge1ZP3yuLEni4fE1W7DRcYIzcxg5fMGHyueZdH0sWenbHlUhpIfUF1Vdg
 7LbfGgdVYQDXNXDmsFHWJO4lTOg9fvBSLy8FTWHXCI+PqU5BAGvczMABkU282gnV6GBv
 aKH54dWCdPQc5zEMuK7dBjALKr5+MI7MpK7NqlzlTCD3PdFehZBp9ZIt3CPbrknJcWuf 9w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46qn0t1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCEu049078;
 Wed, 22 Dec 2021 19:42:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by aserp3020.oracle.com with ESMTP id 3d17f5rftb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxspVxxqc+IyMLI2yhCi2dxOSY5ya+N+t3FuxQTbaFw7X9cV61qNuUSTRf6A/OvOn+f6IvAUNky3+zjHOGvt45ETnTCyEekzK0hGGAJQ+6aDwHJVaYQ2p+V/dx/wZdUI6+ZVSur2htVcDO4wPy9y4sZA0pThgiRVC4Qfd/VPJPeo4SYDtKdR7Iz7X4Fxfh1tirdsxvQ19pNUK5anhnKD9ybNcjawir+HjWS65J+FewrdCxA4wGdLaGsXFmfO8MFSKj7+Eblq0k6bbhaEi4/QUDVJalPChainxDxF+ekecX4jUcwe5C0ROG6OujUU0zgRt3C+IxFI413BYipyYwZ3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAUYcjtQ4CZMVSRb56kgREKga11yEanCT69C5zHJOD0=;
 b=F2GlSsNgPR+3iS57kiHVH7Evq1e/BMCYSlT1V44D1rW+/o4bBcH4nwbo9s9VYqwJ6EApRoCrmN8mPKE/sHYhGHROSEthoaYkSnDIJyIWskEMgdyi5Yl7ai4y++/Si20m0oyAzwC1Yo1g9ZUn6RNLyRvjjXFPnkhGP/T7V600HSZIMvxW2Qjy2yVdTgsCwIARLmOidq38yEiir9O7oyNqT048Pk5n4Y92Af2jDRE/pUc1jfue6bVH/4Tz9mfmAfkVGibHjKKDctJWlvek4Iqp+I+G73cp2X+yGCt4MVR7XGcm+ifRPw4+NJhC5fdr7hlfZpUPHa/If6xPwGMvW3q4tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAUYcjtQ4CZMVSRb56kgREKga11yEanCT69C5zHJOD0=;
 b=UCLkTfjnC+JErJsZM/PZPPosIhNfbbbvXHHCZyiKOby5EZgfiYTsi2pbEwAYnGsw+vUg5FmLac054Q04/XctHWExb9549lCI68SNryRWpg288dWp1rq21tY+CejWVL4czFdJmJgTRGKjrj7pGuQVUlaAAowExwfkEqaEWkbf5ns=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3746.namprd10.prod.outlook.com (2603:10b6:a03:1b5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:00 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:00 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 11/29] qapi: list utility functions
Date: Wed, 22 Dec 2021 11:05:16 -0800
Message-Id: <1640199934-455149-12-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1496119-740f-45ca-cc72-08d9c5831f2c
X-MS-TrafficTypeDiagnostic: BY5PR10MB3746:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB37463B63A9530966E1D24341F97D9@BY5PR10MB3746.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oLfWs1QImRjkYwtMVdUgKDg1TDXBTZtmv+BhBXeM6qcmp06N7Te5Gtn3YXsxY9vQ0Ltm7WwAkyzZgQEq42kmRwe6AST7mhqejjkm8spURxN/vNnX80P2tx3K3DAxbsQPg80J/l+Julxu/NeOXo971aeC9niBHPpYmsGfdJxUOHuBspGz3e7GDZYzloECdsNZtDQhLUSB1pwNjtmrEkc8u6wNzDoQ3xt1OGae1g3K6R4E1kJAJzbJ1j6R78voCj3MN4WTNSXUe86+gzPE7eKH+rr0HOC0XOgqFd4TArle0duK2SluaAeVz6ItgPA5+lP3QQ1nxG+hZFzuSPBeNi4HM1RX14D++xkNr5IBbZoRRYl8dm9EdzZWH0wCYqoyrcaeJCPL/eM3sCPhk/aa2/Wg7MJ0Z9gatN5J241+H4cuYDR8e+0J+WfIUY1oESdShcu+NGC/rMXXNtD55ZiJDBPSUaB2ViO6JfewfbSI7AAbb/Y9qKnT4/eL3aKGi7YW6ehriKg4YBu4FezlVPgAre68vmJ2UV3iqkel6aFQVzHlgGbJ0QjCnEXiujhSvunyKy0utWtw3jerLRw/VJwy6EQQAlflPDJ1Sx9+KTbUphWo+4is+v8pdLGF2fA7aHBf1wreYLXOi74Knycwy4HMn3waYZ7vdn+zwJchg+gSywABgiO35nUg8Iftz7Idv078c15Qa0TP03JfJ6DfWnJlaOKP4+XhePusRH7wXuq5EJeWTDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66946007)(66476007)(508600001)(83380400001)(38350700002)(38100700002)(4326008)(2616005)(52116002)(107886003)(5660300002)(36756003)(186003)(2906002)(8936002)(7416002)(8676002)(6486002)(26005)(86362001)(54906003)(6666004)(6916009)(6512007)(316002)(6506007)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xl0A66tE6ZW2NfcfmUHhUicrZYzwCpVcIMLynw+gDp2Dyrs2RlnfEjhjA3jV?=
 =?us-ascii?Q?XVw9GjZZThmIVaG9fI0oipjoOkKTXpDg7TRh48qa3lDGCA6JgYJ2m3CCTvyo?=
 =?us-ascii?Q?IkzviY0B95NQXEBYRmpEClzVc7WLZ437jj3du3UKOuTgqOFkC0Pjc/Sid5u1?=
 =?us-ascii?Q?HNomYsx64FXbf/qBIdCkVY4kawosdd8c6Ak00SRdxzMrjmiv+zuDbxNKFsmH?=
 =?us-ascii?Q?ZgQ4fmsrrXqhmONRHWbIqZraeS9OZMyKzFoehGKvgUbv+zz7ZC9hF8OToQjK?=
 =?us-ascii?Q?Zf75jsmDKlksmFEm7VrZHDnk0rrFCTs5cpAJYZH1CBUJGk2JUQmeWYEXaz7E?=
 =?us-ascii?Q?CFAII9qllsjjj6VG4ME7KynLvaqMaerOdK+tw7xLTmhIPXxna+h5IEYNtav+?=
 =?us-ascii?Q?8PmFQhr7C8poYgKvWQZdlGWUhqzusCc4Q4fynzz9D/iWxUD8aedCXIsGlzHc?=
 =?us-ascii?Q?K0XpuJ7iJ0of/wzRJ4gfwjNnSGcRJkFEktQJC0w2Bn8VBaShxmGbHzlNgKoe?=
 =?us-ascii?Q?2OQAWeRowNxvakmSrCEe74UoPlY2EswARXQ0WLsejCz9xeZMikY9o2BAwN3S?=
 =?us-ascii?Q?LA0dRXkm7Hf59Mo3XV4emZoO35j+2XIOFiu3Fer7wF8OjTB4+q6OB7m3ZknA?=
 =?us-ascii?Q?wgcrGLSGqlfupKv5Or4Wow5rn1C0B8EK6kOQFll1fedrA0qpB12akqGFTm/c?=
 =?us-ascii?Q?oJTF72dP9oH+nqt3l9gqUcGqjP2LHZBlIECPLfJpx/4+J/RIlKtQANepuNXu?=
 =?us-ascii?Q?3w6IOBqMujrnFhH0+GnLpTB/5zJyheISRCM9Pj/M9FIoJyXET+IBryFSWEPe?=
 =?us-ascii?Q?GGCOj7QKgf6EB05tDGOiVuFsdQBb6Rb7prnSqO2t/2Xl0iWgxworgI1UsF39?=
 =?us-ascii?Q?xnmi2SGif5FDCkSnOYILix9XDWzjUrOZZ7znNAdA9i3KMfd/i9iwctz4Gj/h?=
 =?us-ascii?Q?NcC8y55dnj9/UlEkApT2/55TXKpNtr6ZiweS9LjCTKPg3x/QJU34vvbfOOQk?=
 =?us-ascii?Q?dbmX4I7QY8vYYGjaOw7PbAAW7HqMx1kTgTJlGrZEatgVXZvFs7OxIXJMt9z7?=
 =?us-ascii?Q?+7bCS8ThMrYgxVQV3xvw6naZ1xIdprPz9u4f09YaEJSL9N1jm/M/L0Vkog1X?=
 =?us-ascii?Q?eXAoOWc7k6yaEHo+rq6uxbWoE/Y51qanGkT+zEB0zREZmBS1lehAfZ4qviIw?=
 =?us-ascii?Q?JN1Zb/TGwXzPD+NlfJWLNT67HyqD1mTJ5zFNuFkFN2hjlLVCH+MjoTnq/t7u?=
 =?us-ascii?Q?JCi8NXjIjB2yupPLhB5Mb8yfKBnJC1K3K+BjP6MDcT1wuvsjbr06ExAENxu4?=
 =?us-ascii?Q?BjbN34QTFEQOs10Pw1ufB1mTmqT/ni95sHEMZKn45BHq7l/ZdB4jJEOv2SoN?=
 =?us-ascii?Q?Uodmqetey2S4SQdOGYoMDvEAYqZr64Ri6NGsZLZdu4TR0WFnWIyYLwjKSTSv?=
 =?us-ascii?Q?L3UjYdElihZ7FLI/aFUIrklJhT9GQOBjrE2oR/6P7woDmiDtzV18Tg43dFOG?=
 =?us-ascii?Q?cNVnZOXRJgb8Yto/whr1cP7f2GXSGO9v2gRaaC4qEwa/5oXmXTsDfJDTFQVi?=
 =?us-ascii?Q?63Fb3f14qF19TVM5NO6vxu+X5nygUgL9QM9xnp3zsSvsc+pSLj3C2LOZOE2q?=
 =?us-ascii?Q?zQzTIy7bx0zBKun5sH1ItR3qDTUKRShut0i2A+0ll424QJJkUkuFm+tsU+Q7?=
 =?us-ascii?Q?dHSKHw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1496119-740f-45ca-cc72-08d9c5831f2c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:00.6396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+jhTppLnyQ6YMSgZ5cStOh6WviD4cfWk/fDpGKnuk6uyzYurNjcemUnIWITrZoxCeQBYB5G/wwjVPO+zSYJp5EboBK4GWsTqAzEF6c9zR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3746
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: aT8TnoSu-q69IGVldk2EgRyALViWxXMl
X-Proofpoint-GUID: aT8TnoSu-q69IGVldk2EgRyALViWxXMl
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

Generalize strList_from_comma_list() to take any delimiter character, rename
as strList_from_string(), and move it to qapi/util.c.  Also add
strv_from_strList() and QAPI_LIST_LENGTH().

No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/qapi/util.h | 28 ++++++++++++++++++++++++++++
 monitor/hmp-cmds.c  | 29 ++---------------------------
 qapi/qapi-util.c    | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 81a2b13..c249108 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -22,6 +22,8 @@ typedef struct QEnumLookup {
     const int size;
 } QEnumLookup;
 
+struct strList;
+
 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
 int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
                     int def, Error **errp);
@@ -31,6 +33,19 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
 int parse_qapi_name(const char *name, bool complete);
 
 /*
+ * Produce and return a NULL-terminated array of strings from @args.
+ * All strings are g_strdup'd.
+ */
+char **strv_from_strList(const struct strList *args);
+
+/*
+ * Produce a strList from the character delimited string @in.
+ * All strings are g_strdup'd.
+ * A NULL or empty input string returns NULL.
+ */
+struct strList *strList_from_string(const char *in, char delim);
+
+/*
  * For any GenericList @list, insert @element at the front.
  *
  * Note that this macro evaluates @element exactly once, so it is safe
@@ -56,4 +71,17 @@ int parse_qapi_name(const char *name, bool complete);
     (tail) = &(*(tail))->next; \
 } while (0)
 
+/*
+ * For any GenericList @list, return its length.
+ */
+#define QAPI_LIST_LENGTH(list) \
+    ({ \
+        int len = 0; \
+        typeof(list) elem; \
+        for (elem = list; elem != NULL; elem = elem->next) { \
+            len++; \
+        } \
+        len; \
+    })
+
 #endif
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index b8c22da..5ca8b4b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -43,6 +43,7 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/util.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -70,32 +71,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
     return false;
 }
 
-/*
- * Produce a strList from a comma separated list.
- * A NULL or empty input string return NULL.
- */
-static strList *strList_from_comma_list(const char *in)
-{
-    strList *res = NULL;
-    strList **tail = &res;
-
-    while (in && in[0]) {
-        char *comma = strchr(in, ',');
-        char *value;
-
-        if (comma) {
-            value = g_strndup(in, comma - in);
-            in = comma + 1; /* skip the , */
-        } else {
-            value = g_strdup(in);
-            in = NULL;
-        }
-        QAPI_LIST_APPEND(tail, value);
-    }
-
-    return res;
-}
-
 void hmp_info_name(Monitor *mon, const QDict *qdict)
 {
     NameInfo *info;
@@ -1103,7 +1078,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
                                             migrate_announce_params());
 
     qapi_free_strList(params->interfaces);
-    params->interfaces = strList_from_comma_list(interfaces_str);
+    params->interfaces = strList_from_string(interfaces_str, ',');
     params->has_interfaces = params->interfaces != NULL;
     params->id = g_strdup(id);
     params->has_id = !!params->id;
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index fda7044..edd51b3 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -15,6 +15,7 @@
 #include "qapi/error.h"
 #include "qemu/ctype.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qapi-builtin-types.h"
 
 CompatPolicy compat_policy;
 
@@ -152,3 +153,39 @@ int parse_qapi_name(const char *str, bool complete)
     }
     return p - str;
 }
+
+char **strv_from_strList(const strList *args)
+{
+    const strList *arg;
+    int i = 0;
+    char **argv = g_malloc((QAPI_LIST_LENGTH(args) + 1) * sizeof(char *));
+
+    for (arg = args; arg != NULL; arg = arg->next) {
+        argv[i++] = g_strdup(arg->value);
+    }
+    argv[i] = NULL;
+
+    return argv;
+}
+
+strList *strList_from_string(const char *in, char delim)
+{
+    strList *res = NULL;
+    strList **tail = &res;
+
+    while (in && in[0]) {
+        char *next = strchr(in, delim);
+        char *value;
+
+        if (next) {
+            value = g_strndup(in, next - in);
+            in = next + 1; /* skip the delim */
+        } else {
+            value = g_strdup(in);
+            in = NULL;
+        }
+        QAPI_LIST_APPEND(tail, value);
+    }
+
+    return res;
+}
-- 
1.8.3.1


