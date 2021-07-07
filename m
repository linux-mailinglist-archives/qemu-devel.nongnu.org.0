Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F093BED6B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:49:56 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BgJ-0000ya-Kk
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKq-0000zf-Go
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKl-0006sB-Cq
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:44 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCNYm027404; Wed, 7 Jul 2021 17:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ODVcqsNZZUgyrGgVRAilz5u+VITg0/BtM24sLZwVyiY=;
 b=gh2ktkZ7eNG1laVbNYXrs8Mp39Xf1F4KFlMombzDxnmZFmRN7muChSPo3+X3nGSylhDs
 M4P6wE7e5SjXWRQ0lT0LQsc8yNeciWExKYS+Qa4zoFoS4QhpjzrJqaJ6JSWxV8u0fg7P
 075F7NfGNCrbClchfu+qs94EnK4JT6qI1czmxP+b5eBj0Zfq1eabKCLSlcx40Vs8xHyY
 hOK9TEV4AMP8hfgZbo9nkzLF5610fybNFwH7PBQaxHFwKXAOLAnxQyoaOPQoj194WYtu
 AvKwO0E6+S9lxTbWJcquanIfm0ixZa3z2Ym1f1qUMfYCeufI1/eFtjU5rwltIF8odYle Kg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2smmq7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAADG026147;
 Wed, 7 Jul 2021 17:27:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by userp3030.oracle.com with ESMTP id 39jd13ubju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAtHZlWAFKCJVob7UU6S4GN/pbJd3RakGIRPRgQITmPs/PkXwf7HHZ6zoJmsbxsPVexAS6ayEz0M/gDqQRraum/d0DCyyFlN+NkwAhD4nDHktIsm0AwDWJPXBy/TG+tZ4qTmCuuXpKPJf5P/Fw1m3K3mtqr9ifg3vx7iDDD6AWI2KPc5N1jjsm1DoXKSoZJi2RG5YdmMsXc/DeQCFjIjo6DKkYjyEh6uPcQGJsF2PqKRmurb/mU54GgtcCKsEO9EDcIiQXJ9N8VAbF7/Mx6DxrszFWdvhGJ9EhnEkcSrkqReuprO0y2gPGus72Mwxq06VNZ15qBS/j1s1Rr+s+Wa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODVcqsNZZUgyrGgVRAilz5u+VITg0/BtM24sLZwVyiY=;
 b=FkYYPKbFuEc6C6dLRDVDai9JcwOlpX4I//kGs/4BKwDuUTGP7W4OqFGoqXUGuDQrhClD8Oh17rHLRSOHI/HKsm26i21+zr8V1KMABGogpAJ0nhD8Wa+K5ObCZrvfTY43EFsObsqwkvpaC6g0NezHoQ7HIAemT1/DyqfmF9FceXwnNxU+yE8o3HNYDopcEG4RcJY+SFPOmxFoxX8eLxHgl5amgUTLHlh0ezQ8RmkGd2r9Dgwm3QQV8KPsZYGt26NOqeH3EbJxPCP7ldNajVGBMbenFlL9yuVpjRzZvcDFVP0chzrDv/UWT2yP7WW1LyXQn7kSIi+YKA1lBTf5RNxQeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODVcqsNZZUgyrGgVRAilz5u+VITg0/BtM24sLZwVyiY=;
 b=WUYnf3ZVgblSNItrbDJOd+8IxymkSMPZ7XMtMxTBCtIvr/RfOEkLMdwMeZJM+xYupqQB3gthf1u7xOXRRbYI/5KqLfm9Lj2BPnwrvdxxIgBg6sJzbaZjFl2CBx8WMMq4DSQ1icyZ2NY0uaZBIOh+foMBDJopGscRtTrJhJP++Q0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2534.namprd10.prod.outlook.com (2603:10b6:a02:b1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.29; Wed, 7 Jul
 2021 17:27:22 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:22 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 23/25] chardev: cpr for sockets
Date: Wed,  7 Jul 2021 10:20:32 -0700
Message-Id: <1625678434-240960-24-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eda7363c-4609-497f-e5fe-08d9416c7adf
X-MS-TrafficTypeDiagnostic: BYAPR10MB2534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB253449A25FBF45C440EC83C5F91A9@BYAPR10MB2534.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hjwx8n/4q4ybPW1vASJ4/uaUxzllC1dfwD3lf+EJqBkhlccXYjmPJCr8cCEuy95mMmjXwYCL+9ApSGWhZmWw5auFlGujKTe6hJZITVVLUJ4CGpyAhnEv3kkmOSTOrxEr3S5i30+QShPcyh9wyl3YfG66XZffNOzjyE1OxMajm7utGBcsjIZVEe0Wo1u0WtcosATN42em7gHrlpLuU3p6CCHVUalu5LrhZSM8h5yXgXhjr7G2JAU7U/KLCkUTTbsfkpAmP2OHH+JNmEySHmaGSWylPkUMriFcdt0v8FBJA9c6zvZFrAtkm8cpWIxiMT8WABwM4NKk5w7SpZLcX7P+4a8lTIu5YW5lLAp54vdlwapDtM+Pw87sFzL1a+TkJo4C0PYhVly5vkVwn6cmfnAAiNVLC/VHXrAtodvJ1qe1bVSNYLiU381l+bgZCu29Luu7YtFdFcLH/10niKg8hSalCq/05Gp4wvQ5bMw6eSidVUn8LMlqI2ht8NICPjPDGm1nHxwUGohoEOeua2AlPlkxCeNIkT6KmHwi2NbYCSN/+9FTw7DnWyXAjtx2jQN7ujVV5b5U8Vwbikvj3hh/Nl63PU0t2OoFDVYJTNDtOsY4079TjR+dKfmYvwkjdjyPBT0IT4aN+uE/Rug9C1F8rWVQ8YuZlTjxw6oB0PufrNlePvJhbS+6ish779tIj49vz8SK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(39860400002)(396003)(66556008)(4326008)(66946007)(186003)(36756003)(5660300002)(956004)(2616005)(38100700002)(83380400001)(38350700002)(8676002)(26005)(54906003)(6666004)(6916009)(66476007)(478600001)(7416002)(8936002)(86362001)(52116002)(2906002)(316002)(7696005)(6486002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3oFsr2iBkKWstHNkE/Th96rEttVn+Iix4s+rLJrXc3grFqgaP7RF6I8546Fk?=
 =?us-ascii?Q?46i4SQabVzYP5DpKJbVOgKzRGnCKgWseBVfR3gUQL9paWOsd30TtITauXM3N?=
 =?us-ascii?Q?SJVnSEACSIEV1GLYXOmFDGZ7566O4Zoe0n9eZFs5FFO1gffON5rWbxPJKo3T?=
 =?us-ascii?Q?WRvQW0Yv7n126+IRd37WRP7/Hygj/xSZaqF9xP930DoqasxVdczn7GL1SyQj?=
 =?us-ascii?Q?VP4rhDsQzmJSFV6neyydxMElQ0bY7BS1Kp1orgQ2+fjShaO/v853T7W5+Mn2?=
 =?us-ascii?Q?iQ7pVs6O5ppjiwq2+LDWwbfG41t+NwkgHq08rHtThLG2I4M4SNluOB9Wh7kd?=
 =?us-ascii?Q?7nYnoJ3GLDueupNeffz61Zbck96B7ZfkKhXeZLunmmHb2up7PSt1niqQR8v+?=
 =?us-ascii?Q?JyUrLuubmJzaAAMYJs+CzvcMroKnfMzms9ZrBer++AlllZukp/67plpPjr0J?=
 =?us-ascii?Q?g3/RIC4KIqIKy66WXT+Uq2efEpgbhDlkre9nAEwig7BYgGeoxArefwKG9SW/?=
 =?us-ascii?Q?g50ZmhjqxKHVbDl/TvtUgu6cwoN/z4VT0nRbD8ELRsXz1Ckn3wf8b9WLfa/x?=
 =?us-ascii?Q?uGtJulSprcRmb+ODTxcg33DDtJTw8Nk+2ujlfgyPuB+T5xKEfy9+s/+7A3x0?=
 =?us-ascii?Q?f+zPg5ioE0PUVuec6ijXt4wlvxN0ZKQpJvvyZJpNmbgLtiQ5ggqXGvDWV7nc?=
 =?us-ascii?Q?uWLyzsgyzJzNS528/AG9b8Km/Q6zDw5mw4ycJwWEWP0GvZkyfmsltB/6ELyj?=
 =?us-ascii?Q?BmKPDoa+jrM9hg+UYbsS+S22fsgoDu8Yy45jwbiPFdVj0K6wOZ/cTxvI5vWH?=
 =?us-ascii?Q?xjT6VwKmJVV0BYTOEwm0VUjrxt9SWjbj50BciXoGZju7HDv4rVSDBbYDoC9g?=
 =?us-ascii?Q?1EXE0Q9GfIs6FLElqg07Z5sr2M6L/Ae9G4yUrOUzi3nAPMEn5esKU66CkKeR?=
 =?us-ascii?Q?hl9oLRpWxYXZBHGSxudsDxmAdaYRDaiLgkam1n6YMX8khue2SKDP9+tuo7k2?=
 =?us-ascii?Q?BKZfCYqzVIJkyYseZBMzgFocZnN4+kQ86WI/Zc5v9rKHT8fidkQVkmVBgLSM?=
 =?us-ascii?Q?bfywPdZi18pVqajfxl8KpYMVIqraVfHKReMpMLCK4s8ilinK0TXU56fKM6RA?=
 =?us-ascii?Q?gViDGzv4UKEU9BnTTwcQI0MaW4t11MWjQr2gH8gtOs7nTO2h9scvqtTkNb/8?=
 =?us-ascii?Q?HVyji96l37tenajibCc6M4s+BnVkDIsmw7WORgZwrRLYf6k4EF6FTHzm4URO?=
 =?us-ascii?Q?MK0VKWbQ0xosmYuiAuVZmti+6JgjOY1FjyFUDTUT6B1BK5DhPKP455zhuAGA?=
 =?us-ascii?Q?Gxl2eN2lXTxdDxH7MOG6eU9S?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda7363c-4609-497f-e5fe-08d9416c7adf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:22.5711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06u73bCnznqYruMfh7ObBJE4HLHKyn1U4WqFIFzQ+1GD2JriXI8gAeLWQtWLjaSsXiYwvkP5Tj/Y0kI1RMCG+6Ij2CPCnQxVSJBPcxr12Qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2534
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-GUID: UbNjZSmCZ9s7VhyLEddZnyWU_Crr3kmm
X-Proofpoint-ORIG-GUID: UbNjZSmCZ9s7VhyLEddZnyWU_Crr3kmm
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Save accepted socket fds in the environment before cprsave, and look for
fds in the environment after cprload.  Reject cprexec if a socket enables
the TLS or websocket option.  Allow a monitor socket by closing it on exec.

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-socket.c | 31 +++++++++++++++++++++++++++++++
 monitor/hmp.c         |  3 +++
 monitor/qmp.c         |  3 +++
 3 files changed, 37 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index d0fb545..dc9da8c 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -27,7 +27,9 @@
 #include "io/channel-socket.h"
 #include "io/channel-tls.h"
 #include "io/channel-websock.h"
+#include "qemu/env.h"
 #include "io/net-listener.h"
+#include "qemu/env.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
@@ -414,6 +416,7 @@ static void tcp_chr_free_connection(Chardev *chr)
     SocketChardev *s = SOCKET_CHARDEV(chr);
     int i;
 
+    unsetenv_fd(chr->label);
     if (s->read_msgfds_num) {
         for (i = 0; i < s->read_msgfds_num; i++) {
             close(s->read_msgfds[i]);
@@ -976,6 +979,10 @@ static void tcp_chr_accept(QIONetListener *listener,
                                QIO_CHANNEL(cioc));
     }
     tcp_chr_new_client(chr, cioc);
+
+    if (s->sioc && !chr->close_on_cpr) {
+        setenv_fd(chr->label, s->sioc->fd);
+    }
 }
 
 
@@ -1231,6 +1238,24 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
     return false;
 }
 
+static void load_char_socket_fd(Chardev *chr, Error **errp)
+{
+    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
+    QIOChannelSocket *sioc;
+    int fd = getenv_fd(chr->label);
+
+    if (fd != -1) {
+        sockchar = SOCKET_CHARDEV(chr);
+        sioc = qio_channel_socket_new_fd(fd, errp);
+        if (sioc) {
+            tcp_chr_accept(sockchar->listener, sioc, chr);
+            object_unref(OBJECT(sioc));
+        } else {
+            error_setg(errp, "error: could not restore socket for %s",
+                       chr->label);
+        }
+    }
+}
 
 static int qmp_chardev_open_socket_server(Chardev *chr,
                                           bool is_telnet,
@@ -1435,6 +1460,10 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
     s->registered_yank = true;
 
+    if (!s->tls_creds && !s->is_websock) {
+        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    }
+
     /* be isn't opened until we get a connection */
     *be_opened = false;
 
@@ -1450,6 +1479,8 @@ static void qmp_chardev_open_socket(Chardev *chr,
             return;
         }
     }
+
+    load_char_socket_fd(chr, errp);
 }
 
 static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 6c0b33a..63700b3 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1451,4 +1451,7 @@ void monitor_init_hmp(Chardev *chr, bool use_readline, Error **errp)
     qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read, monitor_read,
                              monitor_event, NULL, &mon->common, NULL, true);
     monitor_list_append(&mon->common);
+
+    /* monitor cannot yet be preserved across cpr */
+    chr->close_on_cpr = true;
 }
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 092c527..21a90bf 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -535,4 +535,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
                                  NULL, &mon->common, NULL, true);
         monitor_list_append(&mon->common);
     }
+
+    /* Monitor cannot yet be preserved across cpr */
+    chr->close_on_cpr = true;
 }
-- 
1.8.3.1


