Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C22FC1AF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:58:47 +0100 (CET)
Received: from localhost ([::1]:55430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1y5O-0007fa-KX
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xf9-0003a9-2b
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:39 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:60784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xf5-0000fg-2h
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:38 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKNUs9002789;
 Tue, 19 Jan 2021 20:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=fcOYsIut7P+7V3lCOwx9r74mhX1CARiekYFi7+KIyC8=;
 b=sTfDBjLkgWDZp8V+lif4M6JwD0wpGdEJ3se50XPuH31zeKuHy3SI36TGhPGLyTKjwRfw
 OpMQkOhg+QKPeam1+r0hBfg4lGgnZ+9EfeboUqk7KsFpGY1mVPFn9ED783T6pvv66F5C
 3mLVmjyhVIGeVuLXWWwZnR3Q584lVglf0Byh23ITK8xSDwrnG4wygLOH9Xy6HMQPDUjk
 BNTJJ/SUSPdcRCLhBIih0uKPmxigLkKSTBRUWv38ocg7vkruejqKsdTuaZZbG1ov3Pqg
 nFiXUz3rDEjeQGtd53NrNotWtuaYh7csH7M/bROIE5cQ8DIAHqi1UYjyfsVGzT1IyB0r 1w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 363xyhtb3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:31:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPc7P128314;
 Tue, 19 Jan 2021 20:29:28 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2054.outbound.protection.outlook.com [104.47.37.54])
 by userp3030.oracle.com with ESMTP id 3661njtast-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H42Y8RRUNogi3SPZs9hSvNXcUg0JLVb3YylZAUAsbVoidCCVWUhXpA9DGjG2ZHjIbcf/kyM4pKUpAh00aevMsLEZ6pW6v86MHpa2nkiKpzHkSIj6+j1cuQ3Lt6mahxYYu23/hpTbvO679G/su2jlcFUCGNo6EGMWvnThraLszeRImbtjzvuzu9qWEEIZa5K9ivCywQoiazWRFMnLi+FS1Tvf8SsijWa/Ay8OkzCV+JHEjo1LdZJbzat4XogNnsmDJKf0LxMuE28/dUNv1ij3sf/Bk9p2kiYWJLF9EftxuBvl4caDCJA483QbUqxUSigwpz0pOqYX8KXPIikcA4KJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcOYsIut7P+7V3lCOwx9r74mhX1CARiekYFi7+KIyC8=;
 b=lIEBG8b8wTkaql6LdOxY/MLRIj+3tLxmUD0Sw2X8QgVCnUx1BsqI4aGzbXRDIMPnHRmUIKepcFABELa5UcFyG3xTVbdVNNDQ72o9a7Iu2CqjFe0CwqC92e9dUfDtFlSJz2xk4Z0Lh60XprI75VNjd7cnEuhsFkfV/OxBilpTzc+yLxFuccQWVn6/dpaJfj3k4JNG7JPcOaRA8pSbslLjD+oq33Up2yJeFPfWfAgES76yHe26/KVikt3+A4y9Pf+GQC8PYSqMETzbQzzniovgYex1yVFE3C1S9PLLz3nhnIprP6J6RxB+ohSic1nnEsXfoyZaeD/r8NeCDkjZidUxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcOYsIut7P+7V3lCOwx9r74mhX1CARiekYFi7+KIyC8=;
 b=xj0me+IjqNKW3NJu2ozs/a7CpVP5zwNmgrzhzpjs2GaboO+PMsNQkhZ3YkmICRCP8Eiuhq00VOoCuhw8IBnlFEqmzRPg7gRjOwaY+OSn0fLefte18mhGs/Bu5XSugKtqKUwAOlrNDDtxyGdhaWiok09VMK7j9vAS4vHuHBnMcvE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:25 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:25 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 14/20] multi-process: add proxy communication functions
Date: Tue, 19 Jan 2021 15:28:31 -0500
Message-Id: <9ee013428a49194a17f16952ad579f7e057b531c.1611081587.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611081587.git.jag.raman@oracle.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.38]
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.38) by
 DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d1f22f5-eab7-43c4-c584-08d8bcb8e977
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB33490D477E0F9BC4A7DC33B190A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ay5/3Tr5CmZ5ZGjUu0EgtNsybckk1pClp6qQm0/2XE/j1LGWmJjjOdTK06XZxZL0qrC/Gd6uFohn2EQfaLbrvdPa17URqlbPbbWqUY81KML4ooptRXnr6SN5JlU4oZKTIinTbCqDh58OihNFlVFmkB109UcJQxv7tfI9U86YFKaPDgr+V6+lmwd2QWp4awRlp3WaHTCzyIThNkf7rvdODpmn5wzFDkGAJrC6M93c6oJ5ippV6alcxgM4Wnmr1eBSdUpIezMzA4OazsVBBRgf44Qjl1HKfhRBVgo395wjcDsXYc4c3OxwaLd4wxNxnG1dG022P+SFxHLVfdHRm75J1KhDkTpRFBsfoLEfMb+Eh7Hcw+CQ/IyF20U/4CGlsqw/hqTPMO7Lev6bLczOGeXBjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UhnH3DBA3LMgVs28iHJiwLPwNQQZ4GogmXAVUwQN5xumsRaOHjOnqum1PSgJ?=
 =?us-ascii?Q?Mnc18nh8SKLZq2bpOpmY+lTmonvF51i5CQfzDY1na/Rq3lcN3+SKmQ2GV7OH?=
 =?us-ascii?Q?ppRmhQYsmIkSAQdsBJwYCEU9hozLBjn6MkN095cacD6+ByDhvtG4ep9iMclI?=
 =?us-ascii?Q?blV18iw13h5GEClTB2/EJxfP5TrAv7cWwbJn+TF256wU0KaZIy+dez1Jyp3r?=
 =?us-ascii?Q?Ne6tYRsSav80wxSjtFpS4XyJrmIPLZIt30A9jHcQ+CHN06TD9hKBglQW5C9n?=
 =?us-ascii?Q?HpDZ/2hjQApAz1TftMy6AZaSxR5V5q2Lll9ylP4FdjWhcSnByHhpeHsD0f7w?=
 =?us-ascii?Q?hOPO32urSvO+87iYDAzRze05mLNU5IRrkIWtB+R+eGzHl1g1udbwtub8UK3Y?=
 =?us-ascii?Q?WxVt/TV77Niwcs6DmKE61KHd6G0dZKNP4wvRReCa+4MTPNBx9V2Fb6l5GhhU?=
 =?us-ascii?Q?KILtFu9HrjVkVv7uxGF3UmhJHTht3bmu+4+NDNR8uwbe6nUaWyxg2fVEmW8P?=
 =?us-ascii?Q?XuBqtNzSHGaqfbxvAZdSma6qI1A2go8/sWdGdbA1XiCrWx3/Qf2TiYn5G40h?=
 =?us-ascii?Q?TYmIsuzJjdgGTHsSQXMNe1Y8xFFaosXGBgHkKFKhBRUKMEoB+lZ6gT62nvMb?=
 =?us-ascii?Q?fsTnpKXIdytVrbV7uYo3Ceeg5L5by9E6aTbGU0Fv2D2zsa7Q7ooEFFuYAlA5?=
 =?us-ascii?Q?/wxoS8HjdSTWVz0iYLe6m3mLcE31YyeTUNxS3lsqEGqc9L2XQXZh1rpEpalV?=
 =?us-ascii?Q?k/GtOSfaLKKaTdplooOVbrEDFEP4SyOw330LyL0omaNTprHUrlFI/aXG7fKI?=
 =?us-ascii?Q?0Jya3Y98pPCXeWd109rN8cKD/Cp9lhjaK6s77DRTxLVCWMu0mzCaBMh0ZfY3?=
 =?us-ascii?Q?vh1weaJgcxSNxoFkePIHqQ/c+ATCHAhIzTfqP+6rf/GjgXzfqoPTqE2KFxIN?=
 =?us-ascii?Q?Nizr8/I4C3H8Ct5H1Y2KccGkXtvneoP5d7bJ2pkTsxo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1f22f5-eab7-43c4-c584-08d8bcb8e977
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:25.2248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /v0jf8dQ308Uo/ymnb0LISJNNTVOUAYQiT0h4Bs362cjof4K+UDTwCPa1kovoDUrl0ompj4Pp8oCohvpXUbyuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
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


