Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E047D825
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:08:06 +0100 (CET)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07u9-000385-7E
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:08:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07Wa-0006ln-Qh
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:43:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07WL-0000QP-Ky
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:43:31 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXwoN028486; 
 Wed, 22 Dec 2021 19:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=lV+ZcClg/TFbPtkvlXzcH1KXAbV7Z12iavCzhI5yYEI=;
 b=UvUe2pLpksRb6EzKVj6GvoO8Mz3ly/EcxGeFhT+zNwsHhmFSYIFAy4ZmGAqJb/dGZ/qS
 4bO1WZMK7MJSqYDeSqXQFvngJEjGtFtwAUJzKro5zPGzAEdMghIZt7O+nlPc4bVzMgSS
 CVMSIV48VqauQvTK2ks7/6DWNTCR7X+O5zKeVARrqUehxWlull34ZXHdRgvhL9Nd/u6I
 daIZn5xml7g+X+2MVIZhZ+3KFqVgGbFbdKea4W4e2SosgA0Kpz5Rc5/X9CoXnkQ7iHan
 zZ8yS2Cqu/ZGddL5eWme+0lT1vXrG7GuCNgCN8joB0ljFVs76YQltbYKopf6Py61W2VK 6Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelTk030497;
 Wed, 22 Dec 2021 19:42:13 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
 by userp3020.oracle.com with ESMTP id 3d193qamws-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ4uXC/kpBk59+zcKkVGBpVAdIBVTtc4cXpPioapnZtbwQp5ynYnxC6sL9Tw4X2dYnP83vwfDUI/Gs7IGiY8sncFqxsaUrQwBzfRDGzEes+Ctf/c6yg3nBylDMvXYk/B9bMyAPs8lWU/iPSSaL37B0JUEooCuHDnU/016jQ2gU6sFhw1OTJtlWV/qVqnCS6ujWplRKrVPYgkC8mfpinwvAl8rwGJIYZ1po8PiA/fvgWZikokOg4GJ9XLgVcuiYKO1L0qf1r8C4QscnmW3ERsmKm9wcVPSx16uEmxQvfGlN0I5sJKHG3/nE9XNdQNUqifNTheBK0nMvLImP/aLdGrbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lV+ZcClg/TFbPtkvlXzcH1KXAbV7Z12iavCzhI5yYEI=;
 b=RKViO6lLeNHCTZ+LEUEdoos+v17dhNQNvmy9M4rmZy/kPl5N2fHp76BZekRE8j7/bDXCxu6w7fssImR9/Y7sS/TVgHJ3zPB6lQLsKZ9qsjIVNcO0HYvG6PPdkAQG+SZx2gf5rx0yI8BqasWJsFsVJ8WmEYczPB57it6o+1on10pvE7ErqT5LqeX/ad2dDY7Nnp+UgvzHEpd+Sm22GIAeda2nxAF8kj1p/eZKfQNYYhDR+YPLIJIoyDOskI4FBiyH3kfoT8m1M9YHfWocRJvI79wsjb/ZdBk543hvA5iml4gmA9yLLs6LDljd0kMc4c5w+UsqzP5xx+dOoJlJfuUutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV+ZcClg/TFbPtkvlXzcH1KXAbV7Z12iavCzhI5yYEI=;
 b=qBfN37K1KEL25btWIUXOlH2PcfPuUYc3ZwroZA/3MaxB3XViF3IZrtdzS1/lIMRwXDUdjY6EemG1UtrlXcJqTvJK/jVIPRnBt+WHmKZqv+9NE8RVE0xVySDKQqFPkxRMrrUxEbejn27ZNPHeTzlXWPRH/LThzYw6csz8PuzeikU=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:08 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:08 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 28/29] chardev: cpr for sockets
Date: Wed, 22 Dec 2021 11:05:33 -0800
Message-Id: <1640199934-455149-29-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 914ec8d6-0234-48a9-58b4-08d9c58323fd
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB424293FC037D13F3EFCC4DC0F97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00IntqUJQDAShRzRZYKrTSGPPChBtpej1TEg14NkeOO5J+AElZQzPai1tMiWNL65qhnVOPCK4QfKOHvBNZoiJ+ewl9OJE3viFjDjXf4Ul1yjAU21RPhod81LPAhNAdt+e9zCOUK3kXm0vni3ABE70ueePuc+XqJysld2e9gShZOvBhSjcLo+SksS1CQWmpa50U81sSaatMXoYVkrf4pjPu2FKdAcMfz0x6KWqpZjbgV5fclcmcEeYr7Y6KBzDUpnaOnqHcsr20RdRCRFOsU7Dp5TLV/YrcMVBq/s71Rtdydwlm7afsWZNjA9e4sAmAlOg1/REBva6i7NRlC1O0akEMpS0MRkzFGBbc2G+thZf2s5Xy+FBAT663+IX9byUBq0ZF1msgvwzVdzwp98pZocpG3Mnb4hQCYteaUXWJt0DKVjB3dE+5lRLYU3QksqBS786S7PcEwegV1RQfCtJn276d3mgrvr9ry1CCGI3bnETy9iHhxD/zvRMrxUil3mwQYOZBPa2buDOkH8HMjSHjW/zm9Sv8ROhEc57Ytlzuf182VU7O/KsaaoqOipDhRuxqHmQgu/GPDJB6s1f/vl0HY2oO7grOwmTjcUirrCeNIwjp1afJmR33dT3V/1p78GkxrQx0tjk/NBTTY0Wn1H+OzKPGCnsfXelSAj56ZdjiPEKgPbVS/6Tj+dqDaiH8fhiK45B06zHvVA7Ly/YxzmNdwBOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aS7YcTtYXfFOHhiL29BcEq78YwP5nFOojG+hB9NofKZaFraEsIeMhWO9yiJt?=
 =?us-ascii?Q?D5kNCDwtZ2K7+twq9KvtS2CCuaS/fGfxJMn5dijUhyNwd/Z+p47hQoS02l1z?=
 =?us-ascii?Q?0w8H6otttcHcioBAKchRfMI0l9dLI2ZRO7Q3AShbyhvVDtrjeo4cK/N1gYww?=
 =?us-ascii?Q?5NuTvOmL35qGcKAfQyHud9d3io/oM4TUrzu5socERKF4jwlt+qTyS3yetrKj?=
 =?us-ascii?Q?U5zF+Z10/Ctm5wLtVBZroB+jHuhxbZCE3lS5+Dq+S5wjFqRUwUHbWwpUiVgn?=
 =?us-ascii?Q?r9gyiUQvADUOiAhuPK+FG4eHlA5xTQmwKk+1iNQ7sg0mHis60LxsXjvlPnvb?=
 =?us-ascii?Q?AJ1/iq/Y5YG2FnvQ0KiWGJj4ExIhb7i8jGdxc6fzSiZ4RWiKjyWQzBsHOGUQ?=
 =?us-ascii?Q?4pOhJB0gaygr2HpXfD3LAFEL1ZhyGhM2sq3R3oJ1Lq2I1ut/MkBlc248gd/Q?=
 =?us-ascii?Q?YzvYt/ICoLhFK+/G7asnEN1967OcsvL7TcaC9aaqrJ5itRD3/89P1gG5swDn?=
 =?us-ascii?Q?dyOooxOe2SlIO9LqbcLNlHgM6gJKeoHR4fdcDi7WcotSIWZpyfxpSnpivYq6?=
 =?us-ascii?Q?WwP8Qs9bfCVjG0B7VX0wjrzEKKAtGjqU5jcf+GYPiZp2lU0iSGn68C12IjAJ?=
 =?us-ascii?Q?tX1aMFN74IzzObBAg8k7UPNMx1r+QkKhJBE46AmSJwxPW4RCs4FaOp0U4UFj?=
 =?us-ascii?Q?c7K60PvQ9580LKVetLdr5bn0iKWBO6lFW5b3IZOGejZ3mcCVGSaz5OHtoGfh?=
 =?us-ascii?Q?JIVT21KeEn8HYK9AoCXOStA+obn35pgEHogJRg0JKCA2ZB9YLvvV+DZ7Dfly?=
 =?us-ascii?Q?bU1ITMFNYPNF1gpC7ZhKwjc0UmHuLcpJFXxx2yWijfGt2dwVtCe+tk4ohv9w?=
 =?us-ascii?Q?uGU7ApTwygxeIwu8taC65BuD8LcdZ1SdndIT5XhErsNGwXxMhB9mvLZdjjJ6?=
 =?us-ascii?Q?oR/IRryHiPWafdjwyAze//h27fuiUVtXeAizUC/n66sluR47gqn2miRusLYz?=
 =?us-ascii?Q?lP416XEFQ8L0+8/TRqImPBvmMA3xOxginaUE8ZJYEQs0xVMxhxlf6DMbQha7?=
 =?us-ascii?Q?WaKdheKi9+RrhqvVAFjuDVnZOgQ5opv9Tt+ismilLoBzrPKwj/F1Vwx577E1?=
 =?us-ascii?Q?t9++1/2c8jMZ/yvRAlxQP89/2OcGtTJbPtX0x57oRQgA9kL/Y40rAv76u+lE?=
 =?us-ascii?Q?fB5hV+HhwHJjyMyohbz0gdiRbkfJarbvBSFZ9ahxbiqS0GRoEGA3YSN5N+25?=
 =?us-ascii?Q?aw1ykKqzu7xOllVaydzzfGQhb6B7TXPYWUsr6bp90FQn+6MQuVCz0kkw5sgq?=
 =?us-ascii?Q?2VyoEMzOqlJqT99a8J0VMZC5XSIyILjT84IbI39I8Ie293g5djx2uxXRiwJo?=
 =?us-ascii?Q?DLfEhFgXZGN4ouUJFUwovxVdnEKXRnZHBk0k+uMCo2vbPipjIauSrlOKK/rP?=
 =?us-ascii?Q?tTLuZRxYpZTKPw8Xn1UOKKWwe9AqzPeDfCRr/KwbNMVJVevyznrgHMAh9uQP?=
 =?us-ascii?Q?DA+Z729vwWfxNOKpTllKlFBrSDXiTLCNmlWPQiTzSOOrudXveUnIPa1dfxzk?=
 =?us-ascii?Q?FJWRi2jhSxMF82wuhkf3o5SWgJfjvlUgorinrdE8DwfnJJQR3+GgK6KMS4t5?=
 =?us-ascii?Q?EwkYOnvkkq5uKGNuHsmIhw+r8SE69HHzfbRZfH87kFJvb490pT9xWAxNBWhE?=
 =?us-ascii?Q?+0jkiQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914ec8d6-0234-48a9-58b4-08d9c58323fd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:08.6391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cQ8ShQqvnBmrJTq6fZKY2KugubPh48TJfBqfc44g5CRaVuwdvakeHwJV43vjBL6Pqoq781W2z7/vlMZEbceIQOCh2u+HXkjQx32h+JF8dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: Gog8-W2_zBO4v5v1vtKrV9fxyRlvhy21
X-Proofpoint-GUID: Gog8-W2_zBO4v5v1vtKrV9fxyRlvhy21
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

Save accepted socket fds before cpr-save, and look for them after cpr-load.
in the environment after cpr-load.  Reject cpr-exec if a socket enables
the TLS or websocket option.  Allow a monitor socket by closing it on exec.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-socket.c | 35 +++++++++++++++++++++++++++++++++++
 monitor/hmp.c         |  3 +++
 monitor/qmp.c         |  3 +++
 3 files changed, 41 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index d619088..c111e17 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -26,6 +26,7 @@
 #include "chardev/char.h"
 #include "io/channel-socket.h"
 #include "io/channel-websock.h"
+#include "migration/cpr.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
@@ -358,6 +359,10 @@ static void tcp_chr_free_connection(Chardev *chr)
     SocketChardev *s = SOCKET_CHARDEV(chr);
     int i;
 
+    if (!chr->reopen_on_cpr) {
+        cpr_delete_fd(chr->label, 0);
+    }
+
     if (s->read_msgfds_num) {
         for (i = 0; i < s->read_msgfds_num; i++) {
             close(s->read_msgfds[i]);
@@ -920,6 +925,10 @@ static void tcp_chr_accept(QIONetListener *listener,
                                QIO_CHANNEL(cioc));
     }
     tcp_chr_new_client(chr, cioc);
+
+    if (s->sioc && !chr->reopen_on_cpr) {
+        cpr_save_fd(chr->label, 0, s->sioc->fd);
+    }
 }
 
 
@@ -1175,6 +1184,26 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
     return false;
 }
 
+static int load_char_socket_fd(Chardev *chr, Error **errp)
+{
+    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
+    QIOChannelSocket *sioc;
+    const char *label = chr->label;
+    int fd = cpr_find_fd(label, 0);
+
+    if (fd != -1) {
+        sockchar = SOCKET_CHARDEV(chr);
+        sioc = qio_channel_socket_new_fd(fd, errp);
+        if (sioc) {
+            tcp_chr_accept(sockchar->listener, sioc, chr);
+            object_unref(OBJECT(sioc));
+        } else {
+            error_setg(errp, "could not restore socket for %s", label);
+            return -1;
+        }
+    }
+    return 0;
+}
 
 static int qmp_chardev_open_socket_server(Chardev *chr,
                                           bool is_telnet,
@@ -1385,6 +1414,10 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
     s->registered_yank = true;
 
+    if (!s->tls_creds && !s->is_websock) {
+        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    }
+
     /* be isn't opened until we get a connection */
     *be_opened = false;
 
@@ -1400,6 +1433,8 @@ static void qmp_chardev_open_socket(Chardev *chr,
             return;
         }
     }
+
+    load_char_socket_fd(chr, errp);
 }
 
 static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
diff --git a/monitor/hmp.c b/monitor/hmp.c
index b20737e..a425894 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1484,4 +1484,7 @@ void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp)
     qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read, monitor_read,
                              monitor_event, NULL, &mon->common, NULL, true);
     monitor_list_append(&mon->common);
+
+    /* monitor cannot yet be preserved across cpr */
+    chr->reopen_on_cpr = true;
 }
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 092c527..0043459 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -535,4 +535,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
                                  NULL, &mon->common, NULL, true);
         monitor_list_append(&mon->common);
     }
+
+    /* Monitor cannot yet be preserved across cpr */
+    chr->reopen_on_cpr = true;
 }
-- 
1.8.3.1


