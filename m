Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE888308AD6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:05:56 +0100 (CET)
Received: from localhost ([::1]:34508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XDX-0004A9-V0
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wvl-0007HL-CO
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:34 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvU-0005l5-53
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:30 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGP02a121853;
 Fri, 29 Jan 2021 16:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=fcOYsIut7P+7V3lCOwx9r74mhX1CARiekYFi7+KIyC8=;
 b=J02RD1zg2K3ErxCpMY2EIE3vzYsb8BrZXi5wwb6oumzSMb5MZXn+McU1y5RPSJI8S40c
 hky9cuyHQfic/0w3oh60WJYxS+aLRiV5qbMujtsiCCQe41Y4xcPUn4ejhefzESFG5bGV
 LlRjZCGy9qLheU8zGe+4VDPjgbi+tWuLDKmrFloVU0Vvsel1FtyGd0qbktVQrlRayFyv
 IMR2TzZWrkGEt46JyiE8U9djYfjQ2EI9tLE05gp8omMKDziT4JvhU+V+cKiuO8OUZu3m
 9sppZYlwLpL/ktn8O1oVERuMo7TveAsOmmkZkmcCYxOtPdAB0klhOx8DYDw5mdw9/DaD /w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 36cmf88j4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOi6S083886;
 Fri, 29 Jan 2021 16:47:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by aserp3020.oracle.com with ESMTP id 36ceug42ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9dQKt4lmY88dEg6ezspMkbb3cEZnkBFd0CH3vSpP0/lhZv5yFICMkuU2D37WuyYDc2SbygjIHVI0+cN3FTT1bCyxV40FHHNdGa+8UjQnH7cqamYeiSaCbwbb6rmSaQG6ElqFWSNOJdkJx/tVLNehEozqjQjmvO5gBGJFeyMa6nEuIBkHXv7Qn3oN7n5bSmL7wDhGELd2yLHioIOQuGKOY7mlM6BGKMv5YyRDuJgdIoGqnrRAjRG+/fJZX429eU5dQ7gH6yNgIf0HxO1snbNgyChD54AuczwBxE98dKNC6yQit698ETPgx0jaVTOTMkAUbP3fsfOOgtkQQ/uogNZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcOYsIut7P+7V3lCOwx9r74mhX1CARiekYFi7+KIyC8=;
 b=ObJBYBfqzEbP0Uwpf9cayDXp8gqd3SIOYPQBh4Qm6eLouI7s+Ky/vMGpga1UJ0ZfiuoMrRWRMXp26s5F6PxCT81Tgwv93oSS7UR/9N5bIvmOwH0Kr/i2wci3cVOWYWkxkSuTf0OB5vzLuKGIWvE8995brb9Pgg547gAYVV/02PZdfjHr0chjxl9M7+6MSYbzZysmRMXuKH7jziqGEfP8plsckJK5ZEbgSCi9UDiulR86uflu+ByXLLvrFaEsT9s0YDXB2n8Tzy5dNXeq21ZIUHWV4dIC/gMv1mGPHxR9JSOm0PxXzwbR7DsDwigAJRtrO77jeyjxFY+FZmSZoIEpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcOYsIut7P+7V3lCOwx9r74mhX1CARiekYFi7+KIyC8=;
 b=SkGMNExl9xVi5nOboE4eV3LvgHNoJ8l66exCg7UMvXbq6w8Tmck6EQYxEIGwMqQNf35BUG7f2UmERonCuH2Pb8RvdfPaEhP+3dYxYEMyuIJmqJzVVYhD6UquHlTpRn1OvpSSOep2LBYmvB6stUKjPTKQv34fjs/B5g1u3r5YWsw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:47:03 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:47:03 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 14/20] multi-process: add proxy communication functions
Date: Fri, 29 Jan 2021 11:46:15 -0500
Message-Id: <d54edb4176361eed86b903e8f27058363b6c83b3.1611938319.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.45]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.45) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:47:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 829f5a08-5daf-422f-0216-08d8c475816d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB467110B2D035E97DD1BC9C0390B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NLp3aRQaQECqaO7XoVFvlCGT1yhbFUxbEQC6gno4OjYD4G+Bg7rqtma7Fk0brMUrpZpkWbSHSi0TnJaibdDDETSUXvJrUJFrucUPYPm753MG8XVPm9mh4l2beHweHc3sJZXMHlsUdn8Z+BnvTo4Du1n7SqnIWLSNGeZy3PG3k27RCs/H5QVHn2hp2T+g1z8r84aHJ3OPTs2MvAKSO5I2JnhgNeKBAgzhGkLvp9YFPG9bHCXBYlu8b4PQy+8P90qsY19Gm1V03D23steKLR5NFotb97XL1DAKXOyU+/ucKsCmJGGzCNlsQP/oYh4sPcCoAa0OKjRn2U5NsjDTiI9vGvZhytch6h7VMx+kZ6kjdiDYfDyGhIQYn2TVX4OZ4W+3055q+gHWiwhuD3rGiNaVaUuJHeKP7snehSWlkPAwUiB6agxMrpkmXj83lh6WQOkEJf/hjVky/lG8lwPp/K7/ZaZWW2xrhrzH9rSLDacP5izZk3yfGw5zTbDSt/MxArsK6hjPt4KkMAlwsEY1pRFRDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?J2rOSEW94cqURxjnNyK5po+SDZfbWY4KvzEwcUc4t5Irbi5tu+NFYJwjPb/G?=
 =?us-ascii?Q?GAbL3NEBG8slaNHNo40IrKX/vlQu7HhRkbfvoiReMGO9bukABcHUh14Atl4f?=
 =?us-ascii?Q?CBWn9EDd4dHYNjXBREj1EFFfvQ3T6rbU8SmtNopjGUBdkmEdnnyOV0okuN4k?=
 =?us-ascii?Q?m3YqrL58PzhxBCHbbE+rsoi4heRfDOkPPoaBviC6xtbpUT+6hAm+1zqRoETW?=
 =?us-ascii?Q?41S5dT/3o4lf18N2sDG2p3+VTwgrP/mF5SS12xJqI3TAuZ5XZw1ltHqG7aDX?=
 =?us-ascii?Q?mpfWFZU/bE52uO6cc1FmUQYnsd8B4vXYe9syR4JOoZoh2A44stmXKpD8M57f?=
 =?us-ascii?Q?fozUUDZmp88r73jVLpYuSNL7qWAXYyjm4IE6O95H5eHS73op2w1dPU1hHFK+?=
 =?us-ascii?Q?hamsCke/yNjx5NqChLU0fPWQ/0BcJ0ouhv5in4jM4m91bcI2AK98djBJ+OlS?=
 =?us-ascii?Q?/yDtYb6TMEEjYmst6ZcV3Nt7PK2OXHWK/EuEN/DHdYwryACkNrez7mabHpNW?=
 =?us-ascii?Q?JemsQLhjGdFGb1aUY7e90vY7IdJC5WivsPcLpU706gQftQe2AEKkDX8whMtM?=
 =?us-ascii?Q?+5OxOXzA8kjCX7sYSoDNObl1QIP5YMgo9LENKqxeXtFJl900YtgaoAmWNDc7?=
 =?us-ascii?Q?nTftgVjWfckbVqSC8CA3h/31DVm6J31glCDE7zfkW96hcpaHhRoqcXmifrJ6?=
 =?us-ascii?Q?hAHWVv6oCJvr4ibH6k9BKqNi+iu9MbDOeDCGUmRItKzB0sEpXGUf/FLE77so?=
 =?us-ascii?Q?a8Q3zSXkzvjgDOADwHAho2PYL/j29fVp2EcenUtMKQEQ7KeRPcGq7V+H/f3z?=
 =?us-ascii?Q?XiURR+wUYh4gs0Qe5dUzQHgLZsZvYkqVDNXK+40Gwa8BM/69NN0996R6SWof?=
 =?us-ascii?Q?ifu7FeBqcEN7QAOkLtz3IV/GAI0/yHz9WZhVqIhCkK3VamXs7NY3QxfaqfvD?=
 =?us-ascii?Q?9kggew5qzxTQaFQ2rdRE8iJYGZlTbkt/qvbHC0oNc3N8nbzlI3Z9yUDltNGP?=
 =?us-ascii?Q?G07GblO90eTL36yCoAmCiZC6CNvJrcm5KpKf0gzvLLUToL6hoatLaTmEY4k6?=
 =?us-ascii?Q?iFVfa4Ah?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 829f5a08-5daf-422f-0216-08d8c475816d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:47:03.6326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9FaAbOQ0zvul/lZgGABznU+u9Vw5Y+0iKICkkDATx0jmzz1AIjQoE13RNBnrTN3rGmjU6pQpEUjxs4X76AoaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4671
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h |  4 ++++
 hw/remote/mpqemu-link.c         | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 6ee5bc5..1b35d40 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -15,6 +15,8 @@
 #include "qemu/thread.h"
 #include "io/channel.h"
 #include "exec/hwaddr.h"
+#include "io/channel-socket.h"
+#include "hw/remote/proxy.h"
 
 #define REMOTE_MAX_FDS 8
 
@@ -68,6 +70,8 @@ typedef struct {
 bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
 bool mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
 
+uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
+                                         Error **errp);
 bool mpqemu_msg_valid(MPQemuMsg *msg);
 
 #endif
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 4b25649..88d1f9b 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -182,6 +182,40 @@ fail:
     return ret;
 }
 
+/*
+ * Send msg and wait for a reply with command code RET_MSG.
+ * Returns the message received of size u64 or UINT64_MAX
+ * on error.
+ * Called from VCPU thread in non-coroutine context.
+ * Used by the Proxy object to communicate to remote processes.
+ */
+uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
+                                         Error **errp)
+{
+    ERRP_GUARD();
+    MPQemuMsg msg_reply = {0};
+    uint64_t ret = UINT64_MAX;
+
+    assert(!qemu_in_coroutine());
+
+    QEMU_LOCK_GUARD(&pdev->io_mutex);
+    if (!mpqemu_msg_send(msg, pdev->ioc, errp)) {
+        return ret;
+    }
+
+    if (!mpqemu_msg_recv(&msg_reply, pdev->ioc, errp)) {
+        return ret;
+    }
+
+    if (!mpqemu_msg_valid(&msg_reply)) {
+        error_setg(errp, "ERROR: Invalid reply received for command %d",
+                         msg->cmd);
+        return ret;
+    }
+
+    return msg_reply.data.u64;
+}
+
 bool mpqemu_msg_valid(MPQemuMsg *msg)
 {
     if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
-- 
1.8.3.1


