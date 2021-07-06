Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532C3BDBE0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:04:04 +0200 (CEST)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oUN-00060e-Dm
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK6-00022j-HQ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK4-00087Q-J7
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:26 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqSuJ028780; Tue, 6 Jul 2021 16:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=13ZPN0OngDIInQqWARKofJJbxucdobxgXa/doKPjdwA=;
 b=h9WTmbgdWZg2IGAKdVKa5wDVldCM/EHHiM0YwyzDA2xF8Qt7rMkYWGauKeyjLMFZYrqn
 OvVR1OaugYNNWMLBkkatBU8njt0UVZ0A7fgzGJYE9YzTQEcdVoZVsCf72AEvBT0IgXaE
 ZPM/U+r5rUAOJEqI2cpY3xKwu/G5ArUIgNQApiDvNKq3uoPaNdOEJbePILt4BIzWt+WS
 4iHtd5O/snEjDafJa4c5SAa9QcnrDJB83fEUV4is08EstQa/jW14WwJQfnWbpfVO2wD2
 08fF0sfmbR0QG1MWmNn+dktV0twatDrEuaEvPY26XVfTpzsd5UvFTfQZqVAm29Jq2C/2 4w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aaaaq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoYli085104;
 Tue, 6 Jul 2021 16:53:21 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by userp3020.oracle.com with ESMTP id 39k1nvcqqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3hcI4PErGKaBk/C9i4+exbwaND6xEeCVX2Nk6dMT5nAcI+QKj69Sy+RcgFvAg5mlraqqhFlQOWbPUniQki4oEcmDOYRTnkgpXLil+2LeTryNflNHdyLelNknz26KK1U3fiU3ZEJ69cvHtyOY+O8uZuSlaIHkgmbc/IDLwa/PoNhZ7Kac50OWjJ+byxYRKKjZQTxBCmp85LgmHSsDOic+6wg7+x4db+P6MQ8pXc/UgHbPCcZNqQ4q5F7FS0zNLbdT3gfTtj5iK7ak/WD+qHMFBWVYZuyDZZyXbBNM1x+7wiahHqMJzxuWDRnYVgzMAOlzyhl8MoOg5HKJC1h71ug+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13ZPN0OngDIInQqWARKofJJbxucdobxgXa/doKPjdwA=;
 b=jngKnWbHqsBHsJJM0siYmSgK0NQySUYsqjjKfYH/G1PuxvPci9M0Rh4mZHlb+MfgoGpEjTgaq95zt66f67y4WOWTzgKwdmJq93EvwQ8DH36WJVzWFw55+EyEUnkZEFxiW7W+9L15F19zzt7GDPD7YJ87kmHT+gTXxFlaYNc0IhYLVP+9cwfKqfqdluZiZb6zo/zDCu2/MbTd/c1SLcTM1UsO+JCG51/A2Pd7NCyVLDhfMo8hmWl7qfu+efSR8sRj3/3dHFaGR4fxlcS2Kt2VBENthNuMSAnj9Hel1kmbS+VRphBP8l9YIemMrmMZG+jZ4nTW0S6t8a98mfdOZMG+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13ZPN0OngDIInQqWARKofJJbxucdobxgXa/doKPjdwA=;
 b=brhsjX7Jkv1Vc8y3CfUhsX4eAFt5SWZlGYqACma3NHli0RCzDsao9LZfgTGFTJOBQqurIjyCdV4sX+1dIaLTzGrRzgwvV9KKMtQGGlJ1FEhM0Zc16t8cqbNSwYY8VcaCh4PbyXJGBnmT2z5yHcaTf1ZvTJ75pefxbLaH8I6O7vU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2534.namprd10.prod.outlook.com (2603:10b6:a02:b1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.29; Tue, 6 Jul
 2021 16:53:18 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:18 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 23/25] chardev: cpr for sockets
Date: Tue,  6 Jul 2021 09:45:54 -0700
Message-Id: <1625589956-81651-24-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:53:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 318aad1b-e237-4d2e-9cf9-08d9409e8e22
X-MS-TrafficTypeDiagnostic: BYAPR10MB2534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB25348E3EFC908E83BB2EA54CF91B9@BYAPR10MB2534.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SKH3HKrWt9vWIpyXPRjmakEdTXDAvF28Mihx8Q2BmG7g1tvkwY8I3JD8B6Are0fQ/6O2/qPowJY4En/DOi+wpfaGIjvbFw/DX66OQ3kNCvn01EfXfN4+qoaX1/EcwBTYVCC7rokawx9eDlTCccWkH28nCTt52xQRBAway7CP8Dd0zTEgayPdgHxl0Fq8aJPSQbwKV2daR0XSfEHbNEb9fCgYVIH19fUl4VsnFhasakbOxFlaK9aF1H1ihdvoZfxjfYWdU6XlYcToBKnisCeB/yge2ZYVEsyPzJnMWOLXhZcl0IzhkCGDtLTSE4346SG19soCJ29U5BRdmEpU0jyxRrOFCoCM4WrXTY1AdhG1InQ6pFmg9js6zJzS+kUgsHw/IVYPtow6uKKRdfSXGaw01L+vWd0Ptk2/zSTfeB84l0ic3x5N+P8nDCyNeVYnvSjIBjcdQKGiXV4eJrDgCYVOeEGdqPEj3FIG0SeItJI1y0YkiB8q+d5lH2Az/eRLz5jnQ9PyE+c+lkCpr3Ed5tvGPg87RL0qNonV+AVQ6EFgovfVaQ6oP10yklGX6/AnVP7ldnDBvbTX8dAJdEX8h2xBlwaz4tmpA/Yzx1tjUU8eX+t29HDKPsAQWFalMbXwGBWMuwzKb/rTqQZ4d73TnK+myKnxDRvlSw/ovzm2bLd1mZkTf+uhuLwDrmlpd1DsJn92
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(366004)(346002)(4326008)(6666004)(54906003)(36756003)(956004)(107886003)(5660300002)(186003)(2616005)(38350700002)(8676002)(38100700002)(66946007)(26005)(66556008)(83380400001)(7416002)(52116002)(478600001)(316002)(2906002)(7696005)(66476007)(6916009)(8936002)(86362001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vt5Sw/I19ohD5qMJ2YThFSGCRVeJN9OraZssdptiRpkEEvfvhw6iAPCSJRJE?=
 =?us-ascii?Q?HqNxcqW2SH6FAOBM3TkslrTJ0Ys8K2SdrN4nVVuLGnhfMCUDaQUvNZPvlWnK?=
 =?us-ascii?Q?B2S4ENIU4BM19B1pJkJ6yKu/9FDyUNb+oeAIfSuD5d5vX4y+ldtQzu7+JwG+?=
 =?us-ascii?Q?a64W1Pqi4RaY3NsDhO+8/HCleVHNZ0jf3Tcf00M6LLzWrCqWRCBSI+Y3fQ2j?=
 =?us-ascii?Q?Z65PYKVGClDb5o/gRT3QPHO+taaRJA0mQzEUVg6X60MZMIAo1HH+Pgvut+0U?=
 =?us-ascii?Q?WGCRI2H90LEByuk64Fslkd3QgWObtoRkS0HuANnpUmhhX512Op1b0XuOpfZY?=
 =?us-ascii?Q?eKLmbi0zu+pfnoHEM3kLAcdr24QK2pJe1uBTozGsXHyVka9tF4upV7Y8BMsd?=
 =?us-ascii?Q?5Fr7fk3tRZNuPDmzBJvXVm2SiqqANLnSsQH8Pl/MvoRpGoaKjlA3mUJzBKxn?=
 =?us-ascii?Q?mjEG4JIwFYMimOgNYxzcAuRNlkHxI3r0gbO0nzphTyCkV0NWlN+c3ToupI3i?=
 =?us-ascii?Q?OevuEp099S0iCu0nKUHT76CRx85IuIGv6HA/AhJR5wcbmQL7e0pVL4XmO5ec?=
 =?us-ascii?Q?TBnpFU4jlBfPr2HTBchsylHaLvkfHWbPAeKkD+cPVUT1QKSLoNM9fzljFIhh?=
 =?us-ascii?Q?rghhUbrvNkhCiECi0DxAA45ZhmZeJvUJ3DmRLxhvtaNGkekDRVgOVMyJsy2k?=
 =?us-ascii?Q?XP6AGA+JSwUUuCgo18gEgO68xAh8ICuV0I1XvgOrR4hRd0uO3JDvWUklfR/R?=
 =?us-ascii?Q?2arnnoQ8cIRT+z7sDBL/dZgfAdJz8i4GA+CHW30v6JGFU/eE/0CoFFGEu0/J?=
 =?us-ascii?Q?pKpA4Fj9xOIWF++LVCcAUr8iKdvQ1tOxir3Rug7Gk4c4sKAW1+GKz5IdSDlE?=
 =?us-ascii?Q?JhcmVdeVuoC35iSibUp0IZ7/oBBbC3DhyIeCA1k7iJqrTU+ufGxc4REqKAjv?=
 =?us-ascii?Q?QMbsmeig5PDNujcVJHXqHGvgfd9XeyTEQBdBXPK2R1bnTK/4uYYv1XSWp4oO?=
 =?us-ascii?Q?5jCNDGxQ71DJb2Ctf9kvdi/kHgl0z2z4YssQRAZ3FG7XS2pR9AsUAKTuGqlG?=
 =?us-ascii?Q?pDwnGkNIb0zZR0ZLR4xtlTWDYYy2m7NwIHhxpqszCJDVuH9Yscf4HvcuphWZ?=
 =?us-ascii?Q?L1V1LQZL4c1A+1M+GM4lRZBX4cop9w2WYS5DWbqN1wxGY5u9gHmCTMRJ+K5K?=
 =?us-ascii?Q?/h0qVvGXzE0LBd6vyXNuv/QAPitpa7NdVI4lAdO7qfohIQoCf1W2m902Z8RR?=
 =?us-ascii?Q?SJEZDK43MSpp/1Lz/2jhX+/L/lKaEV09wlL7Bbc34y/BTjmz+Ryq1oPZCD7o?=
 =?us-ascii?Q?ZfEFXwIqJ/ih9KoKSyX14lfR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318aad1b-e237-4d2e-9cf9-08d9409e8e22
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:18.4438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoD/gE+vDosnwePh+DXsiPObIurNg9DcFz236zaaY9ulRha3BBv3v7LuOvkJ8ZhXB4dX2QM1v2gdfOPZjmqVyhsDH5roi3H+BHx7OIy/PFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2534
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: yKlKmPQ28cjR9u4rywoK6IH5ZtJjhqUm
X-Proofpoint-GUID: yKlKmPQ28cjR9u4rywoK6IH5ZtJjhqUm
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index daa89fe..110f263 100644
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
@@ -1441,6 +1466,10 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
     s->registered_yank = true;
 
+    if (!s->tls_creds && !s->is_websock) {
+        qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
+    }
+
     /* be isn't opened until we get a connection */
     *be_opened = false;
 
@@ -1456,6 +1485,8 @@ static void qmp_chardev_open_socket(Chardev *chr,
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
index 2b0308f..495d68f 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -531,4 +531,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
                                  NULL, &mon->common, NULL, true);
         monitor_list_append(&mon->common);
     }
+
+    /* Monitor cannot yet be preserved across cpr */
+    chr->close_on_cpr = true;
 }
-- 
1.8.3.1


