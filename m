Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFDF6E0D59
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 14:19:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmvuZ-0004yY-CP; Thu, 13 Apr 2023 08:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pmvuV-0004xX-El
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:18:44 -0400
Received: from mail-tyzapc01olkn20815.outbound.protection.outlook.com
 ([2a01:111:f403:704b::815]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pmvuO-0004Nq-FV
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:18:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIVsfn++2bUKeAa3KnHz8fTLT2B+56BL7VFRUb2qOXIn7pwQPgebFw65gBXpsW3DZn9pXrpxP3KkCYBhMGn5L+ffR/737YnUNrql0/zUt4NPmG65FmOgxUs47czuGTUaXtOM4h2MzQnF/J4b6y7AzVkALNuionU8MxVNCDwGipgtclaEF3DWj+Knzloa7jXw9NhamwDl0jCGuOKckiMn2fl3M9aNJHs3LSIEFqJaDETcGkXU/s3bjNr3Xwp75ivfVRmv2NTr+MVY9AnGphDSyp3fUf1qFmQAo1hfT0+Vv3mI/Me9bvSEWnvoGPpXqxy+0rT+CuvrkCE6yhabyCSXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ap62yr0XgdU/buqOIQLS6uNVRNiklUQaI/BA9l+JqnM=;
 b=gCneo5FA17zN2m6Eypqs6bWmK0uPvl+1tkvbtenfojhQZmntohtRYutOyOCPjm4lcHYUKk68DlU9MUyst+OJ1uSs2nur5Er0GV57/+ZuclmmneDN2XNOz1F/xnSloPzmj36gLItOdQuH872eoGU7jfUdKYppvH7iURw2GH+J25vIS9KoJvmZ70VchY4ShM9Wb2ZIaYSzPBOuBOA8fupIljNhQDjCL/gqOveosjGiQMHiATe6afk2N+wpSD2+5S58t668DpjpIjRTxFJWT6tRYuo50Sta7FYwtCmomu0XU7H9c+EoYpfydLJzpFzaFZ8lcZZQK4iDe//6omghE/ef4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by SEZPR06MB5716.apcprd06.prod.outlook.com (2603:1096:101:ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 13 Apr
 2023 12:18:29 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::12b0:2e9a:1b1f:2555]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::12b0:2e9a:1b1f:2555%6]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 12:18:29 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yohei Kojima <y-koj@outlook.jp>
Subject: [PATCH 1/1] qemu-options.hx: Update descriptions of memory options
 for NUMA node
Date: Thu, 13 Apr 2023 21:18:01 +0900
Message-ID: <TYZPR06MB541882960C628F64C35427189D989@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <TYZPR06MB5418DC69BD2E73B51C9584119D989@TYZPR06MB5418.apcprd06.prod.outlook.com>
References: <TYZPR06MB5418DC69BD2E73B51C9584119D989@TYZPR06MB5418.apcprd06.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [c/XvqtrXgQEn3dCCS8Mnx6xJ+ZwyNevCPeaFQ/Sq7IwUZusz37qvF7/TGTSzbhQz]
X-ClientProxiedBy: TY2PR06CA0032.apcprd06.prod.outlook.com
 (2603:1096:404:2e::20) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <f4f99b015e248939a6ae5311cb873d4d5d06e0bf.1681380524.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|SEZPR06MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: d6796bf0-3ecb-4ecf-da27-08db3c1930a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jM0G+/jI3w+VGaDN/3BGtonR0m0+eLRvpNHf4tQ0K88UBRq2vg7bTYuY12qEmBEiZ19xeLdCKkgUS+NKSfuJUfJuh+TalexQDhEVmPlfH+yEBlHxVp3U94BO0w1QKa80qMonvFZE3M89VvZEcY4xjC0Y1muWPcppWHMLNlZi2H6QAP0KAIyA6duUizdA1eL+GPl5PtIBV+Yq2oVUadWqzTuw7GyR0lb0xyZaY1OZRrUPwl2f/OTBUebt8mMFmrBjAB8FCTS/qZvJCFljjrjbVLtRLHzNGMAVj4KEKHYtgH63njtk/Evbgh8dGcgaW0PuKVFTwRm5zc+EWD3qkve/h+GDLsmmiKLHlsGDYIwH7pg89Ls+XjDAjhjH21gN9PFfdovsLzx4mCCJXA1NWxtPR4TsyrKgBCM4RNXgQEksD7DSijYHtPK3czVWpYRV2yeSrqzXNg8iZn7DlqgyBJeAIcQaj+CqKm0BRu2+ahRgAM83L4tOlcpAsQZLlcgbP2YF6XM5nkKlyWY1iCSM7DgDBYhPrwHqHsTxYeF/RXy11yO0+P9qwovGJwTVMD6CMuMCWDfCsKsKxZF803+zVHvPMzKHUvB94vI4OnuOTmHKvaDC4vQeZNPjG/E4JdeZSLQqN6jVswbDUlkpphnkrTYSvw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0iz6xEiqR4pGz4Atrbu0rBz3sRukFCPiqNpOIEA89vRjxaE3dCD3jrHK1Rh+?=
 =?us-ascii?Q?9UpXXVu+M2fCKkZ5IICrxtS8Kmd3Mjq8tCr9pxIXW4x1hsLZU4reQG5w/gK+?=
 =?us-ascii?Q?n5COHBJ5r3OEPGONvNyDlVCKY9I63BPSZBy7y2jNW+HkpAd77QxooIU3mhoL?=
 =?us-ascii?Q?W0POD9xcYb8RHPGpPUB5etsoTkGRI1QLGhnJ9D8hPFV1I4wu8s2bZD19ov26?=
 =?us-ascii?Q?7qgt/e+eqCHgolGuJGxlu6UKPhgIRoG8GYx35YwZI766VieRUOCML8wU9zUV?=
 =?us-ascii?Q?Se7cqhunVHq4sGzgLhCua7iAuqsyvLDiBbPsHZnyIvzQI9eGsbr+1Bh90EAo?=
 =?us-ascii?Q?HbDxdDnTNpr17lZ0sADNo8K67f2oQbXaybNYqZ348auEwZq+Do17H1HcX3Xa?=
 =?us-ascii?Q?QvYFM4K942vq0lFudE6CUGOqc0fDTGoZWdmqXGNcv0nU3xxyktu8PReqlzM5?=
 =?us-ascii?Q?+cmlWG8Tjj50Vo9RJ0xOZXkVJdnNV9oM6/2IDcjAoTyqLX1gjC/rk75ECiZt?=
 =?us-ascii?Q?gut8gZ/Ktq1WtOPsj5nPrMyZbT/L1DcbjRQUJPu6ixrqARcS1f2qTYkO3cXu?=
 =?us-ascii?Q?uXjhySIVoGjdNW74p2bxDFxR9UHL5hgzAEWWDpRza6uw6tOB4oQ7IqZSsIhn?=
 =?us-ascii?Q?tIlQXuvsPHBWU+nkGlolEAN+7+nN42vztwoERnGTuy6yMFgBoRHRP/A2u7DV?=
 =?us-ascii?Q?pQSU10l5eyOIMSaSOZdnhaOv8HHGwBmnvp0qNj1y1aLd4WV5AK6YTJflePuY?=
 =?us-ascii?Q?Voax6z+IK0d6QxUj4Q2Z5kLCYyv0wi1LeqVpEKccgG08AcSae7hncFGYqWjO?=
 =?us-ascii?Q?AqvzAn8vWXBcgfmyhnboR1SPeFNNqwBvXeMN/tQB6jJ3JLieIQjjsthx5Sq5?=
 =?us-ascii?Q?DtvOeoKpeYEiCslhf8AY9TOsGDX8gVFs17D38OoU9gfy2xlHGgjM4yvT3Vjh?=
 =?us-ascii?Q?Eh4lcTyXPuA/K7JZkBW0GwFV5dJxYAWSMAqkd0mnoULd4Iy3n+oV4FOCU7eC?=
 =?us-ascii?Q?6U6LquBCVGrYu1QVC8NbAsOnV1f5CdkE+jJz7aTbuCaSo4KmHcWxA10RGril?=
 =?us-ascii?Q?ertvzs7kRmy8nwkJyiq7/0N8kGTRq/GU6ZBYJ0cXuOnokKciaA4MJNTW1csn?=
 =?us-ascii?Q?Wa6TRKlKFBw7+VNB3wkt6QpLuLH5b+KXzL6bUNwJ9A0w1h5o9o/w9wPYyeuN?=
 =?us-ascii?Q?Vko1W1OWgt9SnzrQfVKuxJz5GuXtGdJi63tppxnuwQ+veeicWzK0EDC3HDHF?=
 =?us-ascii?Q?rYd8KNdJPTikJrqelaraterAfZ6fIsI6J7PGUj4TYg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d6796bf0-3ecb-4ecf-da27-08db3c1930a5
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 12:18:29.2850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5716
Received-SPF: pass client-ip=2a01:111:f403:704b::815;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This commit adds the following description:
1. `memdev` option is recommended over `mem` option (see [1,2])
2. users must specify memory for all NUMA nodes (see [2])

This commit also separates descriptions for `mem` and `memdev` into two
paragraphs. The old doc describes legacy `mem` option first, and it was
a bit confusing.

Related documantations:
[1] https://wiki.qemu.org/ChangeLog/5.1#Incompatible_changes
[2] https://www.qemu.org/docs/master/about/removed-features.html

Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
---
 qemu-options.hx | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..b65f88eaf8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -405,15 +405,9 @@ SRST
         -numa node,nodeid=0 -numa node,nodeid=1 \
         -numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=1,socket-id=1
 
-    Legacy '\ ``mem``\ ' assigns a given RAM amount to a node (not supported
-    for 5.1 and newer machine types). '\ ``memdev``\ ' assigns RAM from
-    a given memory backend device to a node. If '\ ``mem``\ ' and
-    '\ ``memdev``\ ' are omitted in all nodes, RAM is split equally between them.
-
-
-    '\ ``mem``\ ' and '\ ``memdev``\ ' are mutually exclusive.
-    Furthermore, if one node uses '\ ``memdev``\ ', all of them have to
-    use it.
+    '\ ``memdev``\ ' option assigns RAM from a given memory backend
+    device to a node. Users must specify memory for all NUMA nodes by
+    '\ ``memdev``\ ' (or legacy '\ ``mem``\ ' if available).
 
     '\ ``initiator``\ ' is an additional option that points to an
     initiator NUMA node that has best performance (the lowest latency or
@@ -448,6 +442,20 @@ SRST
     even when they are symmetrical. When a node is unreachable from
     another node, set the pair's distance to 255.
 
+    .. note::
+
+        For compatibility reasons, legacy '\ ``mem``\ ' option is
+        supported in 5.0 and older machine types. It is recommended
+        to use '\ ``memdev``\ ' option over legacy '\ ``mem``\ '
+        option. This is because '\ ``memdev``\ ' option provides
+        better performance and more control over the backend's RAM
+        (e.g. '\ ``prealloc``\ ' parameter of
+        '\ ``-memory-backend-ram``\ ' allows memory preallocation).
+
+        Note that '\ ``mem``\ ' and '\ ``memdev``\ ' are mutually
+        exclusive. If one node uses '\ ``memdev``\ ', the rest nodes
+        have to use '\ ``memdev``\ ' option, and vice versa.
+
     Note that the -``numa`` option doesn't allocate any of the specified
     resources, it just assigns existing resources to NUMA nodes. This
     means that one still has to use the ``-m``, ``-smp`` options to
-- 
2.39.2


