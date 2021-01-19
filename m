Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BD32FB99B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:36:57 +0100 (CET)
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1s7s-0004VS-7K
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l1s4a-0002XC-JV
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:33:32 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:41540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l1s4Y-0003k8-KA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:33:32 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JEOVCu023645;
 Tue, 19 Jan 2021 14:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=ZbRfLsDhWtuhK7Qm5NXdKknC88dwjGdtZvbMq4fdzVw=;
 b=YAOWsCSZCzWoA91wNQpdDQkM5WDqv1r7cf8YP1hFgA6EiqFKOODFvo37iBW2siEOpNvF
 p7n+/0ds4elHXCKY0c/dyjHUu/ayDKQxOu4ytVZGf3gMdxgTUUgy9MDNLl/tGbo6hHj+
 D/q4D5NBinkVbnVkRsPowyZIrwln72wbS/qNwuTpxiIB9NsBednr7nt6YVvnLCsuM+Wv
 b5Gh3NNB8u1A9xr8rV1y2J5hZXu4ocpYIVZjdwo3OeDyqriHe6s7wBfz5LKSqhRlHMed
 9GLZgUgJoTtxPjYy1OrG+zhTYCNX3FXA6SgT9QtKoaophmU/O+4ajj/Ggj9FTMu5ApjW hg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 363nnahff6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 14:33:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JEPNnZ069961;
 Tue, 19 Jan 2021 14:33:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3030.oracle.com with ESMTP id 3649qp98cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 14:33:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmaFkohtw99R93YpNx6hPvaNAlSRU/amH9E9idQHWZ9J3ovJ/VZiRJmuxTmolO9xogyXYTlba1Rt0z4Yf+MChu/hCf4s0L1MSZkXKpaZKm8TOfSsfJ8AJLEeeRWJJUf20o/OYJSXXZHA3Y+wS9EabJg+kzQ5Zd8pNPSnSWEb8u6CYuMOLFhNiJfuvr4kh83js7fv/v4FbXXqtlagBf8dT1U5dn/X8AniTisNJFZ9rdRJAR/gNRB0D1JT2eEvLuDIDDY90wT/HAo9mHCWLi8wwH8YLTf7pKUP79mkcERF1tNOpMRQTObRwq4aas48CAhTf4BeVLRuhwLxZZ2RPN91PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbRfLsDhWtuhK7Qm5NXdKknC88dwjGdtZvbMq4fdzVw=;
 b=jfY1WS5/bDPujraIm/romO+2uaSCyFLJ1Wfe6BejgEdAUyWUyxVGPEWEjEs1AnHW+V3GCQZmLOkIWqZpJYl0ldyZuadEaOG52KPQ26iDJVoNqSLHq55ykgeOhFYAOi8aBbTt0DqAN2EnyNRKtChEtoPOPKXozSsNGW8M9heBjm8smSSxTnEshjj6LzuOBT8mKOSMl8zvwHNAAms4zX4rdK8eEhRBzMlwMFRCasvJMKHDyNx6ykrAVHCGc+3NiZ3XeWPuGWh5JS7j/zGPjq/AjXMYUM+LyDOoJR258wEk8Nyjziq4QDKISpi/jSq7O52UgUjKA1i6VmaEZiHTj8RDDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbRfLsDhWtuhK7Qm5NXdKknC88dwjGdtZvbMq4fdzVw=;
 b=aJXZrPkH6azbS4kLwG/PbxmakpSL8PELQqufr/4QCsZ2HjxP1zpZzE4XKzrSiLo9ReauFmLKMoydZkGlA8oz6CEFXmN3o4hsBCTJC8jjChK4Q2mQJP8l0kAboBuOZoULoidk2WFZvpJwseaFzjpCY6zoldgK4AYYqEY9DWYdnro=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR10MB2048.namprd10.prod.outlook.com (2603:10b6:300:10d::19)
 by MWHPR10MB1757.namprd10.prod.outlook.com (2603:10b6:301:7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 14:22:16 +0000
Received: from MWHPR10MB2048.namprd10.prod.outlook.com
 ([fe80::106e:c89d:3be1:6a52]) by MWHPR10MB2048.namprd10.prod.outlook.com
 ([fe80::106e:c89d:3be1:6a52%3]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 14:22:16 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2] hw/i386: -cpu model, -feature,
 +feature should enable feature
Date: Tue, 19 Jan 2021 14:22:06 +0000
Message-Id: <20210119142207.3443123-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119142207.3443123-1-david.edmondson@oracle.com>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0153.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::14) To MWHPR10MB2048.namprd10.prod.outlook.com
 (2603:10b6:300:10d::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0153.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:188::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.11 via Frontend Transport; Tue, 19 Jan 2021 14:22:14 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 4afdb1a1;
 Tue, 19 Jan 2021 14:22:07 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45656680-a582-4b48-03e7-08d8bc859f57
X-MS-TrafficTypeDiagnostic: MWHPR10MB1757:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB175780326ABBBBAB37AB701F88A30@MWHPR10MB1757.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oIanD6YspQdiPmY46GpzkFXx6th2k0ZvgE/j1+7xGzDLh3jApPromnXVCLK5hMFV84q5AICopJqv5LRkfGoZ9Xs6gL2bJ2q45tPcCMPHdJ6TwSGJg3OHEG2ITSxQpKFyZfwGhnztiexTpWfSGTsiiELRyJ7fpkdcM2DhxqZdXWHqSqaQdATauNix3/8ZLSfifi/q3swR7w9dh2zA6bnO6oFrExreuGLxb8NSIDfmYkPm3RwsQ2p64t98uvgNni6pb1iIuB6Ist313JAXnvdeKcolSQk8FC+9hBWlyX82lvrjdeNlH7PMUHb+yOrMPrLtfQHMDiPPa6mB5NXA8Uh1eKIJDJ0zanex+UfM0luU2JAY8qMXbsaayhJTtaz9LXjEvazQnXsRNpu7rPTB5Zaimw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB2048.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(346002)(136003)(366004)(52116002)(86362001)(54906003)(316002)(66556008)(2616005)(5660300002)(8936002)(1076003)(66476007)(66946007)(83380400001)(478600001)(8676002)(36756003)(107886003)(6916009)(2906002)(4326008)(186003)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7sY01x2W74xQtGYjyaC8G3L4eFjyeK/86w3i8BqR/Xw09PKzj1Ug1FgUWiij?=
 =?us-ascii?Q?4BAoAUHWh6GRvN1TKD8LswCYwPMOomOkV+oDLRqbGO3dga1WrN6wnxjmT9cA?=
 =?us-ascii?Q?ys2TcLFiEaHzrJ0ASRDnSY0Ooif2UPoJg04nnivFMiyaOUP/W89RpUrmAbj1?=
 =?us-ascii?Q?DksqPQHFDR4HChuw9XCRPkJuzweZ/1qkKHqG3F73OP/CjznHT6/HyC0dX5sh?=
 =?us-ascii?Q?n4LfrMVps2pQ0dq7LFOjVnMPKxl2SUa0StSU2iJNDUiZZrtIu3wJFyRuH03a?=
 =?us-ascii?Q?zDiu/ooijlGlOnz0xe6hZN+IL+sHwRj8YnDw8kYRuszf2kYNtQdPnV+UnOFn?=
 =?us-ascii?Q?r9wBl9DX97sfJGM5zah3yW8j3ZteMT3wrFcuA5CBDUkFnW+EVlzS8WWHFiDR?=
 =?us-ascii?Q?MtEt8VyTYs9F9aRrDmXCGQYA/xDdxalz4ln343kIeS6EPcfdA/j4c5WcW5OR?=
 =?us-ascii?Q?6uRSR74Cmvxre56GK2OXZetLAgERrDF6Zvr+lP/qMo+rjO63STmvGKXSlB/o?=
 =?us-ascii?Q?qThd1qEfdaB4yCTkG9daSJWPrvQJH6j/kCPxfIwDlEvOEzrIokWBbg+iuM1s?=
 =?us-ascii?Q?1aU/hSe3dSyfthxCpZ3L6KXA7WA47yZBUJ4vM96og/OGs5o0u0qm62ny1zHp?=
 =?us-ascii?Q?dlCxTjfIuN9YsuUYwpo7gUOfonB5/4zlhWzm+ysNoHOp5VL9MeYPIjQ9GOLF?=
 =?us-ascii?Q?E0i/rxwOKlFPMnhTQ5j95M1oFYqP/VR6k/x1BbOvmpmGLkDhycRyrI4hKeER?=
 =?us-ascii?Q?ttAGkEAOfQ6ptlBF0LUiJrYXrvx/oF2e5JAjDzrGH5rinT4tmaGXt4jbBMAY?=
 =?us-ascii?Q?gqzHzO0DmbKywUQ7pFCZ4bRMyXEADu+aZJqThNE4+Ue9z8VToGMag34Bcd4k?=
 =?us-ascii?Q?14iOBrOmP9VJj8SPpqElfCnGXBypekZ2PUQP9fTZKuI6wFKxou7ELE3k8ueb?=
 =?us-ascii?Q?ZU0MR1u4vrLxoYKZdibpXJKoUv/d6A+5AbeDO9/ewGtQkTkHVwQydZDKAWJu?=
 =?us-ascii?Q?ejGW6X7zvbtJLzz27ddG0flgIQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45656680-a582-4b48-03e7-08d8bc859f57
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB2048.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 14:22:16.5716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tl1aFict2QeVkb0y9OkMzEilX9Q9YY5o+ZFCjpu8+KkG4doP/EV1dZjkfC4vrkQ/Va5nSf89pK2J+T4QRop3jfmqZzFoutwOB/mMYNa6h6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1757
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9868
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9868
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190087
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Minus" features are applied after "plus" features, so ensure that a
later "plus" feature causes an earlier "minus" feature to be removed.

This has no effect on the existing "-feature,feature=on" backward
compatibility code (which warns and turns the feature off).

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.c                   | 33 +++++++++++++++++++++++------
 tests/qtest/test-x86-cpuid-compat.c |  8 +++----
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35459a38bb..13f58ef183 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4750,13 +4750,32 @@ static void x86_cpu_parse_featurestr(const char *typename, char *features,
         GlobalProperty *prop;
 
         /* Compatibility syntax: */
-        if (featurestr[0] == '+') {
-            plus_features = g_list_append(plus_features,
-                                          g_strdup(featurestr + 1));
-            continue;
-        } else if (featurestr[0] == '-') {
-            minus_features = g_list_append(minus_features,
-                                           g_strdup(featurestr + 1));
+        if (featurestr[0] == '+' || featurestr[0] == '-') {
+            const char *feat = featurestr + 1;
+            GList **remove, **add;
+            GList *val;
+
+            if (featurestr[0] == '+') {
+                remove = &minus_features;
+                add = &plus_features;
+            } else {
+                remove = &plus_features;
+                add = &minus_features;
+            }
+
+            val = g_list_find_custom(*remove, feat, compare_string);
+            if (val) {
+                char *data = val->data;
+
+                *remove = g_list_remove(*remove, data);
+                g_free(data);
+            }
+
+            val = g_list_find_custom(*add, feat, compare_string);
+            if (!val) {
+                *add = g_list_append(*add, g_strdup(feat));
+            }
+
             continue;
         }
 
diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpuid-compat.c
index 7ca1883a29..6824d2b13e 100644
--- a/tests/qtest/test-x86-cpuid-compat.c
+++ b/tests/qtest/test-x86-cpuid-compat.c
@@ -171,18 +171,18 @@ static void test_plus_minus_subprocess(void)
     char *path;
 
     /* Rules:
-     * 1)"-foo" overrides "+foo"
+     * 1) The later of "+foo" or "-foo" wins
      * 2) "[+-]foo" overrides "foo=..."
      * 3) Old feature names with underscores (e.g. "sse4_2")
      *    should keep working
      *
-     * Note: rules 1 and 2 are planned to be removed soon, and
-     * should generate a warning.
+     * Note: rule 2 is planned to be removed soon, and should generate
+     * a warning.
      */
     qtest_start("-cpu pentium,-fpu,+fpu,-mce,mce=on,+cx8,cx8=off,+sse4_1,sse4_2=on");
     path = get_cpu0_qom_path();
 
-    g_assert_false(qom_get_bool(path, "fpu"));
+    g_assert_true(qom_get_bool(path, "fpu"));
     g_assert_false(qom_get_bool(path, "mce"));
     g_assert_true(qom_get_bool(path, "cx8"));
 
-- 
2.29.2


