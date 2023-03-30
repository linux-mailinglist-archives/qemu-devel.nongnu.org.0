Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1266D00C2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:12:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpFq-0007Sx-JE; Thu, 30 Mar 2023 06:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>)
 id 1phpFn-0007SQ-Qw; Thu, 30 Mar 2023 06:11:35 -0400
Received: from mail-psaapc01olkn20824.outbound.protection.outlook.com
 ([2a01:111:f400:feae::824]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>)
 id 1phpFl-0000Ft-PJ; Thu, 30 Mar 2023 06:11:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5yXGVJc+pYJCxpr4uW2zbK/HCzoAuQpGigSiwnlOqYAK5ZMATnjhnE4rEImT3RO+S9TfSvufMsskPkSc4YWwezVw1NXYr+Qje5lE1kFrNnrZ4rNX3f+1PNg1ELZEDkl7mqZ53U1Tc1GPtCxB9j3ZjCUuq1mTUo1yJw5/dWJzL+kHE0cYv2RAmA9hzoPdxL+2WrzEoH+79t3ZWMu7eaZYN3dD2WJ7SG0eOcGUnC/VcEXZTbiYpLGxa4n+Jnp1JuqHWS21Gg/3hgISmMlOZRdSqrc8UPfj3YeaOjBlaW1hru53soBAFgO1/ptC5vxhbXTZUHupTl38rO0nF3x9ua1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj4jgmAYIMdDFQECBhsjl/fFuOBv/ABJ63eY5PpfHxY=;
 b=gr4lpWtMMOluGmerL6ZbnHt6TkZ4jTo57RvzAXXgsEr8IwvwGd00UbsYPwx+xLy2hA43P7J3wqraAGg03jLkKDMndbfxOu1yzABwIGojDCDbnsnJOehgMFVEfK5imUTYEsp8uj+7Kq2ycFEEeZIvYCnBJpXSkilbW0a2cXbLBfn2OnpZaAXi1d6b2QfypoU78qNLLvoiINCUefXL3cNgfzrXtgTxCmOA1d6L18L7M6xyXoTpWssBrgpQ07tjpq5rFFuWex7MSUdOfQmRAYCT6MF7zEogePOiH3jQ+GFFB3UD0znso78AzyE5KAij4tWSrZvnBfyrLtPgRaiL99Q+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by SI2PR06MB4377.apcprd06.prod.outlook.com (2603:1096:4:154::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20; Thu, 30 Mar
 2023 10:11:26 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26%2]) with mapi id 15.20.6222.034; Thu, 30 Mar 2023
 10:11:25 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: Yohei Kojima <y-koj@outlook.jp>, qemu-trivial@nongnu.org,
 alex.bennee@linaro.org
Subject: [PATCH] qemu-options.hx: Update descriptions of memory options for
 NUMA node
Date: Thu, 30 Mar 2023 19:09:58 +0900
Message-ID: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [6QSty2ZlSI0otk3NdiQVGQEurc9Rus+4lOhsF/+BS3isWCfKZyCYHBV2SJVMQpN4]
X-ClientProxiedBy: TY2PR0101CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::27) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <1b259f14f6fb3b3dc9be4458bed411b3d79b4938.1680170906.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|SI2PR06MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa333ce-7c70-4dd5-9b82-08db31071e7e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LBiz+3qw51B/ndFdNZyPwMowp8OE2v1p2Utd2+wBQ5MQzbrlDVcYVLBDHjl9Lb7jdEkl80f7wIeI0Y+/MDfGjREIMrF1Ff+BZYZkVjzOuQjzxCR1BWNDe0utqHotvKQmFjBMgWlSjlcATfPuaIIH/sG553qwNT6w1NaH3EZqiVyqxuWLDiMevz+KD1BcZUkS3ImkUQG428mTAj6b7ZzCzmdV/Bad1qYGwJTt0clWzTBl7HdmWWqfySPA2KZd90DOZrd0OiysLQ3vOte3mgmG7ezQFj6peX0fkgSQ35cV6XRKc0+Z+FNHgoWelRj1wGK7AE3k0pV8FW2lgfVCWFUbAt3BM9kimMd/1jRGfzK23k2Tq6y3/+4WdJ1mcfrAjj0RIEbQk4Gd7+cqaV5eTHSzseYCC985cQbgwnNt096jJo5L0X1GtgT4NybZ6nPfgKXglUZg2tYUussT7mOOVQW3KMf0fSyR2ZvEaPkfMFn2z0wTT51OXJw2y3hZC/KGLGulCFzsQicDrw5u8kOcO+mcnpYlyV/ycOtEXV33JJ1oToTyA1QsA4Y4dOPFVhjURElW9CtRp2OHFI+BrLh+szZgFj4Hs7XO4y7G8ca5WRL5YUc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G5Wfla9ZYxPOEyQZpthYBZmGWNlkeRc3DLtlXYVSJxxlhbw+HE9WQyLrkS4/?=
 =?us-ascii?Q?ifIBIb/vi2Pz+HJPwSgdZ9MfZNgEB/3GizfYHAU3JE+BFzsD6LSZRwgss7Ae?=
 =?us-ascii?Q?FiBW9E6Ep/XcG8DYTNpWONxsBEdcGeKQ6hFLTTMFfrUe8+rqDg5Sg+80lbo8?=
 =?us-ascii?Q?p78rHJhCGTPAl88+Jqb/3+EztQfB21SZlWA62irBYD3oGfQfau7fFiCphjR+?=
 =?us-ascii?Q?0cdZd7eNrpjccj1IsOENQ41DAiq4V8s55yog/q8I9cS4Ny8THBlKkpb3JAcS?=
 =?us-ascii?Q?ECr9WohaTYWHcu7jexhxCoXihkRARHZRoIREcN++wbFU6YRe6uLuUVrOST9b?=
 =?us-ascii?Q?tjup6bnZUc3sXfrO8JLLgDnl8rI6picYKMl0HTqLBrLVeDHyoo6hfZq7weOB?=
 =?us-ascii?Q?J1nQPQYV4WkQqlN+Pz0TPDTIw9k29dZ4isPlJS5hlwMSc5uZE5hoOa8I/zq1?=
 =?us-ascii?Q?ypauPtU5tC0KXbHna9X20+WOR7AK2QNdkTUn1rz5ZVpK24osw0vmV/Zbkqrw?=
 =?us-ascii?Q?GWs974LAB6wHJBqpeLo131RxW6oBIr4KwiAaYAvA99k7LHfBrro/VkylyTgA?=
 =?us-ascii?Q?ResC8JAZGS5aSaKW3axq31s/OhTdhJNqyYIO1cUXXjkFG/SHNBeAxtSPjXsi?=
 =?us-ascii?Q?eTMzOz+qf/EcczwgQcJckUGbBA9LDRNSzO/RKwWikHoqty6SqJZ8O3Y0PUO3?=
 =?us-ascii?Q?ijE2PEWuoYebafxYGjMHmUoQ646ZrQ5D1e6q0LG/0/ziKWWom6ThvZSTyeqK?=
 =?us-ascii?Q?ZEJ4i5nG2xJtH2/UEtZ3p4AxeOACQ2Moh1Lwbfb3c7fZKwGjhDNtUV2TRc76?=
 =?us-ascii?Q?UHtcKbYFIPCg2pEDoHEPjMJZ30m7PbE/jlsm72qc+ESCis6biheG+VYR8Q/d?=
 =?us-ascii?Q?FKWpldwa89ixmTluSK56ag73Pc1hfbCeHToCP6KmPoxr7qVExqdhMtHX0nFY?=
 =?us-ascii?Q?ydg+wVsD6vRSqhXXciyiCF+tS6ofuILymiJrGex+MNBVfSym5dV0K0/yx2IO?=
 =?us-ascii?Q?kZH2kPt+iGvICDEPORrvQ9KbR5vwFZ8OTBGcRptn0AlEMB3BxyZxhsJWwXDW?=
 =?us-ascii?Q?RJYy00nZZZWl8sujbkZ4dCsbJ+tB0dbQpxffXPRjFzP9OtUhHKs7C0vdX5Sw?=
 =?us-ascii?Q?Ex0GUc4TekpnwcUgxnnMS073uGSeBRe60Orp4xAcpmm0OpPJcvG9DcXdXXSq?=
 =?us-ascii?Q?bqA7QRjyJz8oGDm9y+rAnyfBJk64wy5nyvsm/f3uvwX+1nN//KDsWXvewSre?=
 =?us-ascii?Q?+xmu6qtSsgrv20juszp5ka+v30XewQ2fbscSl4/VGg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa333ce-7c70-4dd5-9b82-08db31071e7e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:11:25.9086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4377
Received-SPF: pass client-ip=2a01:111:f400:feae::824;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
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
 qemu-options.hx | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..174f0d0c2d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -405,15 +405,22 @@ SRST
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
+    device to a node. It is recommended to use '\ ``memdev``\ ' option
+    over legacy '\ ``mem``\ ' option. This is because '\ ``memdev``\ '
+    option provides better performance and more control over the
+    backend's RAM (e.g. '\ ``prealloc``\ ' parameter of
+    '\ ``-memory-backend-ram``\ ' allows memory preallocation).
+
+    For compatibility reasons, legacy '\ ``mem``\ ' option is
+    supported in 5.0 and older machine types. Note that '\ ``mem``\ '
+    and '\ ``memdev``\ ' are mutually exclusive. If one node uses
+    '\ ``memdev``\ ', the rest nodes have to use '\ ``memdev``\ '
+    option, and vice versa.
+
+    Users must specify memory for all NUMA nodes by '\ ``memdev``\ '
+    (or legacy '\ ``mem``\ ' if available). In QEMU 5.2, the support
+    for '\ ``-numa node``\ ' without memory specified was removed.
 
     '\ ``initiator``\ ' is an additional option that points to an
     initiator NUMA node that has best performance (the lowest latency or
-- 
2.39.2


