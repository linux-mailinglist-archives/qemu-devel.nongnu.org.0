Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCEA4942C6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:05:03 +0100 (CET)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJ4g-0004ZW-Cc
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:05:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjd-0008L2-3N
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:17 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjY-0007MJ-MI
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:16 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJPAPi032601; 
 Wed, 19 Jan 2022 21:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=myQFFWXBm1Jj9OwCK5BRkQ4acoQDUBpxg0VTdyAhmYg=;
 b=d6xlA5VubXrfyVu6prDL06MYZVubGMLdJyIITvE4zAZ28b9Hc1qFIf/x2erlW5oNAbb2
 MJOyplY/6TILchqcMDE9I9cIYkYTneTCIxRB0S6T8P4zBBkH1kv7ENJbPINklK3bQpRz
 g/DbB7D5AwCjumffZWvqnw6Rl6a2ZCxB8tNPXF4zFbe3uVSMA9CAM2sMMwbbUOkeqLxa
 aaHnnUyl4SOUjZkCGyPoc5ZW7VETNuo1stHZpZJ7WP1mDLwkFx+gtWwk388jnAIzknXT
 xyQVpGmWJ288LNGz4K6aMPuihWnTawozPg7VztFqh+QYYoceQkKYhDHkcbexI2G+7vvK EA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4q6hy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLa7pD131830;
 Wed, 19 Jan 2022 21:43:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3020.oracle.com with ESMTP id 3dkqqr65a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jriNLL3YW5Zkbgf9jJ8OL7cgOyYvpIsGNXgZ1JeGy6BHq3gaW9zvuVxJu0IiDzgbNOyICM1vlO8SAAkCHjgB2wHMI1UmT3fjeZzwiukRgUNWwhoG5T0WKiPErWtStD0hORM7gn5fI08az/Tq2utulSwi+lp7GDGTn6RTpojoFmZgn1Am8JlE2MuYT6xoOwm1ORCePDvW+qkBu8L/lECjHQXHTYN78KkIn+LdH0O9UuGFR6G5bOWYQ4raIfjLj9Z9XVXVBkfOaf5j31aul94MDRadqec0sZYKyJNGjnj7gI8vAKL7DgL72JVFAfZ0Sb/YINPq3sM/GvF1EK5XrIyEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myQFFWXBm1Jj9OwCK5BRkQ4acoQDUBpxg0VTdyAhmYg=;
 b=X+uDoqcMNhuag30NTfc3HOeWTCq52LXM12lnRlerWgXLTbbqhbqHaLZVSAfo/MR6aBSLzzKsWwMO4sSINDp7A7KZ37o3rCA3229eLi/m03BaXPRn/oLTlgPorfrLb0Zbtpwyr42UYRx0tKmu4DuwkJRrHGtwxGIGniGYjExo2K5WUSkWPsx5ah+rKtDlsMTvRZjrYhA0dLEgCvNqGKh0ygMjU2sCNQqyxNm4wJiMpvBiuZv5dXMaKkyImvhJK7p5D2CpGIsP13CRdsaOXAganPTXvhNQ9jUpbITpQ8kNoGW2/pkW3kd7aJUW0xsVOZuwsI6849FWN27hQirvkJAZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myQFFWXBm1Jj9OwCK5BRkQ4acoQDUBpxg0VTdyAhmYg=;
 b=cF9XY4dKJPwj2niR+lFk5TFMUH/x3zKO6A9ur1jHp9wyEhU8i0puZsV4B+y7ygzRfiWxJqEkervCJ3aZaRMcrAKuEDqGy5Ea9p5PXSxatihcAqEQfVNXZpGBwnUWa2XtxS0NXyakKHX9rDf/301+2Rh+7cwm0P4Z6giFoqvfJOk=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:59 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:59 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/18] vfio-user: run vfio-user context
Date: Wed, 19 Jan 2022 16:42:01 -0500
Message-Id: <63ef44664629ffd07d3bffe60351e808965dd13e.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77238885-8701-41ae-0dcf-08d9db94a90e
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB58879F3BB33DB0C6FCE642C990599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xYK16RT1mFXuTCi+/s9YQwtAJTGnRNk2+IUS8EdZNTBoaL7hcAZSFBdIxgTwq0m4Eg9a8yerC/DUMNQYEGWCEmfHFzNRwZ8nIgvOnGPuWT5bTBUibYGmYpP2Lru6jpOYQAhGbdZcPYO8Q14KsNiirTwo1aS6LDTB3kjR+jAgNRGLEF9TbtGwVWDl6HTrb2HMnHCeaqNVpD8btm+U/W1f7FyiohSIrtspTEvPVKjH2OLrmAHF1Mp1iMg/cToNP0bkW6XmCoSHcl1vdOzPKwGKstdqB4RvNNbMMmZcfahM1QYoSM4+XPAatyLdM7/DcruqONxBwT6cFRPsxqjr8UkabQg3l50gkxNvtpPm6P2Qac3/ZnRvGsvDIF3esW7JkFCWRbe0XkOV+WRIy+jCrjLaf4YkldcShx+Y99UvGL8WW4EHLh0yBs07f7tI/AlLVvhTCtE8XX6MlPCp9w2PDwEPJWyh1228BioFH88LAyzarHC+2RL4AhYoNHaGmEg1rHoMyHCYM/stRe8GzLhApkRHB1G0xBmCnTg+/zMh6yg7A9iq+W9KOgOMQFIF5Ex97iT/u5Kc0FPI8KOQt1UX/p5kNc3Xr1b5gCGwuihtCINLcsqhJ8lKf3+EgbyHJO1pTpIfkIsTdLk0FQs1MFjS6i2ecTBndYeZJIIsjuEwXRJ279c165nX2WSRZbYNBnysY8UaqRiGg9uEXMOCfFu+nSM1Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(83380400001)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WczR1tEi77RJTAXgYkOSh35GHYTaKWerRDusAGgZUPu4yKLt8OTuvBEjN9Pj?=
 =?us-ascii?Q?HpltrAHjP/IH/ifE6PuKPAuy/oDtkvuTXYTnoxuRiApWimTPW8wB/pj9C0Df?=
 =?us-ascii?Q?cGgtCGdwLRGfaAGju/ixuqGsmy9cqlqI8dbb9fajBDPDxYUdu7pUrwRpSW2p?=
 =?us-ascii?Q?4gScRy7BM1xKnM74ThtfIEGi/B4vDz7utCoR5BuCJb81Or32nyhzdLORAP6p?=
 =?us-ascii?Q?e81PWOMrQfVcW+b6BREDE/UUll3j0av4nQGhwxLYumrwqOnuBX4okfEwza4X?=
 =?us-ascii?Q?ZBeNd3zuMWcj3EjgKKehiP+8SEgfC/+zriO7lg6AGxCnXe3mCGyuJ+Afz3P2?=
 =?us-ascii?Q?GkulaQBEpvMJwPgvW211mgXQuAf1oJOUSCTnIE+lKbfm36uQmngMIF6X/uwk?=
 =?us-ascii?Q?R3Ptn4ygoo198d7NgOMRSrPOYyLgsn+jH1QIH3GGiNJC1B2Eo/N3g6O6IMgu?=
 =?us-ascii?Q?1q9sSUP/0TqR7p61dFAQLtRo/OEER2NPELdER3aXBJM1iwGRylA5z70nfTnO?=
 =?us-ascii?Q?IZ+L0lOjh+xK5ydi8krJwqJUKc3oJIfEF6GGVsC5ZPfGCdci3bE5hsjyspvQ?=
 =?us-ascii?Q?tieATr1rNTZJPVo4YnFdEiacfGQS5tXgXi8HTqul5r4dsw+wVTrv8sfG47W3?=
 =?us-ascii?Q?zeBz3V13/iqEHTp2l2k8Pq7nynnzyxlOAKNWLC9TNYd004qyeaYFtAdKT73t?=
 =?us-ascii?Q?cIRKREMru1FOslDp+MH1XHVX6N+aMMH/8yYgNv4EhDYEhQX7LeAL9OVVOSyS?=
 =?us-ascii?Q?KSEQOfeM1ljOi8GNuSR0V6KbEpu71KklDaCKXgMBDROfOKMiMSqm4LeWEdKt?=
 =?us-ascii?Q?Ia0gshPCCyh0nAiqo7YEVNYOFkSiZPqRCY/DHt2pZlsN02sohEyStWBqndk7?=
 =?us-ascii?Q?F538rJCCMfAfEwiS6Qh1IEtGxz250suF44eXNjuXb4t9co6V62KXFDu+4NQd?=
 =?us-ascii?Q?JBn//5TqsnrCRYxrvBFCzBficl8I5FQuJZXghc0XQc0pUL5INDORw8yvZKUh?=
 =?us-ascii?Q?HFmCeQVf3Dk2lU06jb8iVLIrpgsjE0zhXK52gWOsXSVIGrbzjixkSdaC7EA2?=
 =?us-ascii?Q?LTz6njxn5MM7VzG3iTV9lEEyuodJHklBdYGbRChJMwuFCHJD9tSHXGOzQOoC?=
 =?us-ascii?Q?7OFVCQ+EU3r+i1nngdym3XS1lNcLdqgp5l3Eiz2y0K/VL6pdQWlrJ7EJTw1E?=
 =?us-ascii?Q?pffVWFTUsb3fHxE1NhtSC0xLeOF/GRMXE0I4oLitYIG2vAu383+pt8zM2h8R?=
 =?us-ascii?Q?mCerLKLGAVZQqMgSCmxzcnqHY8tOVGZgqJHWK58kn+iXUztBV693HBYc5IEL?=
 =?us-ascii?Q?6o0b+Dc+G3V8mTlFMpLT5U2dC4d6xJqOAk+I/HhW9x/6r784IsyZwNSDfQtn?=
 =?us-ascii?Q?cyOekmBLdONC/Y1AYuSrRw2GCg3clLB92jGu4LxUcowpW0Jzn81020GhwgGl?=
 =?us-ascii?Q?g/ukSluIhGxsZMVodSoAUElhIz5sqHh2vyC2bWglv5kHZIh6gGSj8MDvH1i4?=
 =?us-ascii?Q?cjcMDsnRZylJLd+NvZHxIpvUWu3nKP58BVPqyoXTuHY8B+Sys6Uot+Q4KWAc?=
 =?us-ascii?Q?S2DdSXLtWj04dczjaN7Ma6N6c71DeoXqxURo0xa9fxMOtLeo0XHoBYZUzMQs?=
 =?us-ascii?Q?riYbOrWHh8RY7ufZ6uG6Jqw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77238885-8701-41ae-0dcf-08d9db94a90e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:58.9267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rPYkwxV4KXFgERC/Xh5fY8RwZQ53u6VhX+z7ULW9ubxNmRpzWgHSpSPOuMz9OqMQ9ABeKrgpuKDHQXDgs52vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: IgUKsK3zdLxNnS-p5Cvq0QOUhKrM0jFX
X-Proofpoint-ORIG-GUID: IgUKsK3zdLxNnS-p5Cvq0QOUhKrM0jFX
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setup a handler to run vfio-user context. The context is driven by
messages to the file descriptor associated with it - get the fd for
the context and hook up the handler with it

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 qapi/misc.json            | 23 ++++++++++
 hw/remote/vfio-user-obj.c | 90 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 112 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index e8054f415b..f0791d3311 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -527,3 +527,26 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @VFU_CLIENT_HANGUP:
+#
+# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
+# communication channel
+#
+# @device: ID of attached PCI device
+#
+# @path: path of the socket
+#
+# Since: 6.3
+#
+# Example:
+#
+# <- { "event": "VFU_CLIENT_HANGUP",
+#      "data": { "device": "lsi1",
+#                "path": "/tmp/vfu1-sock" },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
+#
+##
+{ 'event': 'VFU_CLIENT_HANGUP',
+  'data': { 'device': 'str', 'path': 'str' } }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 10db78eb8d..91d49a221f 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -27,6 +27,9 @@
  *
  * device - id of a device on the server, a required option. PCI devices
  *          alone are supported presently.
+ *
+ * notes - x-vfio-user-server could block IO and monitor during the
+ *         initialization phase.
  */
 
 #include "qemu/osdep.h"
@@ -41,11 +44,14 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
+#include "qemu/thread.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "qemu/timer.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -95,6 +101,8 @@ struct VfuObject {
     PCIDevice *pci_dev;
 
     Error *unplug_blocker;
+
+    int vfu_poll_fd;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -144,6 +152,68 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     vfu_object_init_ctx(o, errp);
 }
 
+static void vfu_object_ctx_run(void *opaque)
+{
+    VfuObject *o = opaque;
+    int ret = -1;
+
+    while (ret != 0) {
+        ret = vfu_run_ctx(o->vfu_ctx);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            } else if (errno == ENOTCONN) {
+                qapi_event_send_vfu_client_hangup(o->device,
+                                                  o->socket->u.q_unix.path);
+                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+                o->vfu_poll_fd = -1;
+                object_unparent(OBJECT(o));
+                break;
+            } else {
+                VFU_OBJECT_ERROR(o, "vfu: Failed to run device %s - %s",
+                                 o->device, strerror(errno));
+                break;
+            }
+        }
+    }
+}
+
+static void vfu_object_attach_ctx(void *opaque)
+{
+    VfuObject *o = opaque;
+    GPollFD pfds[1];
+    int ret;
+
+    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+
+    pfds[0].fd = o->vfu_poll_fd;
+    pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
+
+retry_attach:
+    ret = vfu_attach_ctx(o->vfu_ctx);
+    if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK)) {
+        /**
+         * vfu_object_attach_ctx can block QEMU's main loop
+         * during attach - the monitor and other IO
+         * could be unresponsive during this time.
+         */
+        qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
+        goto retry_attach;
+    } else if (ret < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to attach device %s to context - %s",
+                         o->device, strerror(errno));
+        return;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to get poll fd %s", o->device);
+        return;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -182,7 +252,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         return;
     }
 
-    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path,
+                                LIBVFIO_USER_FLAG_ATTACH_NB,
                                 o, VFU_DEV_TYPE_PCI);
     if (o->vfu_ctx == NULL) {
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
@@ -220,6 +291,21 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_realize_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to realize device %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(errp, "vfu: Failed to get poll fd %s", o->device);
+        goto fail;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
+
     return;
 
 fail:
@@ -250,6 +336,8 @@ static void vfu_object_init(Object *obj)
                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
         return;
     }
+
+    o->vfu_poll_fd = -1;
 }
 
 static void vfu_object_finalize(Object *obj)
-- 
2.20.1


