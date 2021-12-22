Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B946A47D819
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:02:32 +0100 (CET)
Received: from localhost ([::1]:43518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07ol-0002BD-QX
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:02:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VO-00052Q-M1
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:31 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VM-0008O9-F8
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:30 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXxKI028514; 
 Wed, 22 Dec 2021 19:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=QFFQQ75FhmFktlCsGgHNOoVoT54FA8jKZtFqxdzItZg=;
 b=0SaQelE5SpGTkc1tNJquXvpT0yaJ51r8b02PWLPEr7BcBzPH+A+jTHZs5+vDZxcZUxUV
 fJnX2v+hG12vYbdvRsDN+sE0QXKt5VX+iXE84i3U7HtYd17QH3ziPtfbtngkpYe55hv9
 jkfq9K0eSk6KqqCCe5n9kuQHIlYiEx3w3DcUTZa3JysuqkHlwh4y8ts4DwrgYXahq9C6
 +WRu4PV2LjVUUjm7MC3dSHO1KPaXX38fh4C6KzIWfafDlVR6LzYslRUhNYro3G78O1EU
 P85Lj5ws0SH1eKWODoGrWqUagEMZ0Wyw84iDNy+mx0EZk9HwC46T5soMAgaTValuNuZ0 dg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelqQ030437;
 Wed, 22 Dec 2021 19:42:12 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3d193qamtk-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciLQIOP6cyc702+C3suIiWe9P5xtsNosmcXJnX3TbDFQjmwB26XkCCvOR33sfcQa5HMxUDW+sUP7cMusrZViH5Iqgu/5gugnprUQ158SmwnjaLoPkzDkNtVvv9+eZNTfC3g/7RB8PYB2brzeZvTeUENF9xwdR/p51kCHBe9NJKOlw8Y7tUJE71Xu4rnSCVblqNcKXGvX+00pgi9l2k4rNPG6y7GEifgyvC02ZGo3dqb0EYcFHPzHVSavUb24Xj9HuCOnL6J95BmaBEoSGCym3UW1nSKleKxATErQHleh4GjtxCLuMBw9TweGgfEgKPehIH4gsbXiX+dmuC+tE7uwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFFQQ75FhmFktlCsGgHNOoVoT54FA8jKZtFqxdzItZg=;
 b=Zf3BC4+scmRwyf49I/D9KTHy0AR+P9rtTBpK5v4lhSr+3QjFO+Q9mTETb1qk9dQMb31rB0R7Ueql1i1c3sKLHFACEzRgZ0LcUyXbMaNyB+AADislBBPnw6Q5UZP3JhoXCFcnuNgIzLzHzXtWsjFVTwBY1g+6G23YQTcfiWRJkSa0pBj2AkK2SFhq4SKMXnf25ScmCT58q5JQREL4wzVzZhWhb1MQncyrtkW/TdKZloDlxLwAUuULUXeQcv1jmioabmqnMfrh/FUy7Dp5lrF8Dam0rU73ysn+iHRBIxtPzUTYXx+nUmOic/8HVXyrwSCfml7Nm9Oulx6UdFGeCn4caQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFFQQ75FhmFktlCsGgHNOoVoT54FA8jKZtFqxdzItZg=;
 b=XE4ii9CxcWjExNW2C9h1Egnov6I8DUDVQwsBzrN9mfzKDzp3dtH5tTMAVYO0YNdwDNxPnBsOV5k13iF/WtZa1nP3hmsE3mdyZQNsC7pEiAHulVPKgp1gLqE78+ES9TuQu3ygNjQt9/QVXGaw+GDkWzaG3lunUi2AatTuG3cQ3tc=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:07 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:07 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 25/29] chardev: cpr framework
Date: Wed, 22 Dec 2021 11:05:30 -0800
Message-Id: <1640199934-455149-26-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80d8b977-81fa-4ac6-c85e-08d9c5832326
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB424205B7E96AF09D4DEB8E01F97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1/nyS83jwFPqwuEkv2x2eITwIpax1e3hYMAihfqKEOCqTmGekq0/7VbpuBdNjqhSoRBKAX1IAjgnQiVNNx5sfxoEU8aASBzjPBAAN9lLxDOWLYu8yb9h5nRwNfOTplP2mGgBa5w0Vc50wcWEgHjjaPG9SrxlRmj0dEUstt3XXHHeDLllcXuDnqipkAMOqF41MaJpu/KypyMq8gZTXfZlT4Wv+LTMuR2sETtYK5qQKlwoNnn5VIPHiwp6e7+PybRrXAC2qKCfkgM9B4EL3jKqe5UkhZ3c4imDKjEj42mWlQ7SnLD7+x+VuCKdUFWNb6B3dAtAMIuy0QNsi+bxGX6qZoWZRXXv5p0skf1zBzyRRlYszfrK0LC1Y93LI9isrj9DmJZ1jsi2jOqG3OyILryiArEIiA9eeMWQAFhTZjAdVn9kCXBSnzi+8+egH9RK3LJKXeNpEgoicB47GrRi0v8Gfc0TdjBOz54pomgb6HsYdyTk2jjYwN97L1D72BNrZw6XT4/9Vm3BlEi8hAJKeMaABjFzqzetRJvoWF0uBWpyil40BrL/5s/ateJqY/gCJpLvxuV2qNhkHbyWP+ROfmwtOswebNeqKbBF/NhwgX8+GQ9KQg5gsTiL1ZsagAliUBTjpCePQ833RPA+6Vhmd/Iqq7ycKXiDwB7xbPhfrJBUOeoBRbrE0Nu3uNs2sDfg601orO0fwh80Yr0Yf7unj2czKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iv3hjP/3QZVaFzej19xi5rrjbbDJSDrjo1MswWgHWPFdaw5YXqDyj6itAtYq?=
 =?us-ascii?Q?7ETjfw41V6+0HXIXTJvvub12TWvN7ynXsDJLTDsXJENScpd79+dyYtsf4XuV?=
 =?us-ascii?Q?jG5JX/mHBBkKziy/vp2N5yIZz8th93VxL4UqtHN+nEH9niVI/UMXV7Yr5EHf?=
 =?us-ascii?Q?E5tYyH9/syY8dpyEE78JH2LZ67HQryINdxzzGKLlDvGMBe8b7V0gBHe6nA+x?=
 =?us-ascii?Q?/Lxag+4Oyt2NrpOzDEmBtXXS/HFgdQ+GYtgdWFvJyMSTaz3BlUNloDAhL1yQ?=
 =?us-ascii?Q?U3kZDMB2TbaqWSIbq7zhvu1lkyUlYVSeC58EcP+er2oS4lDL9Hy0rqkSxrGN?=
 =?us-ascii?Q?OJaA4p4ogFyQxUxj0Oq66x5dGYluHi+1Cv5EKH3Iyy4JwZnRWBI7XI3uMMxP?=
 =?us-ascii?Q?y0PEeMOeoJ4/dczvvN/RGIwnUhfl+W+YFLy4mGDKkztS95JeQyAgEK4e9yqy?=
 =?us-ascii?Q?V04OYGg1G5WniThWpb6ZtFpaTfYQ/+2xajAsf2FfgsoW9phasgSx8VK3tdWp?=
 =?us-ascii?Q?X3EvxP9AtOqF+N2YsFhfPWMuJ8iMRxRTdRtBPadnqDCog4B9xnRGFlb7eAiQ?=
 =?us-ascii?Q?rbSrgbKqumxvM9ZnM+mjb78EGi54CYMjKVu9n2MPcEQ1ciras308Xvdd22MC?=
 =?us-ascii?Q?y9LTpWXL1BcCQVqz7SFnguLZgPIZQfYOQ/SWFZIRs998+UIPJA8uCy8G0CkS?=
 =?us-ascii?Q?4hoZN2OCwEHvIgliNxeIcV6aUBtzYUxK1G4GM1+9QRffB8M8mSJ0hzm6TMJU?=
 =?us-ascii?Q?Z6o/4/G2+LsS9BPj+oWsCY2/hlBZb9STzdASbdQbfLbpRnZtLEHC1x482emC?=
 =?us-ascii?Q?jNweqWGU7UMhXcDg7yb6EcVd4t3CGkixL/+TKfwQoJKLTQjO5h51FIr1Zeap?=
 =?us-ascii?Q?weRSFLzsIkiqIBfcNtWgqvcsURcLEQwdtvABrbaOsBARSfLvuHBhW6EfjYrX?=
 =?us-ascii?Q?YgzlQwbfCIzENFFqV8Z2F0W773WSGZ8cbtYrU6EzGA7e59kUm4RBn19T2C28?=
 =?us-ascii?Q?xH01nniCtTnGfj76WV398FT5W4byuQdD8enqceUxu1FYvaF+zdunCqxn+MLD?=
 =?us-ascii?Q?Guk3gb/pIZG8xCst6yneQ/nxyZFSroDMcsDV9TBYZkR1/ii46QQB1Wj4jafG?=
 =?us-ascii?Q?uZSGHPVvqvz5qyEeF/AfD3RRTTLMuS1iEBSn3vWrer8tUdRWmkFWss1FOy45?=
 =?us-ascii?Q?I9aQm/XRvnYECHqq+OzjdnOx+Ja6IqT1zgKWfOrkOKJuVCX9V5rLDlYuRXDQ?=
 =?us-ascii?Q?y7AzWCRoRxjMVvvc24FKRA8iFj4gErcq3IEYQHcvtvBwfs49/LnwHYso7+xX?=
 =?us-ascii?Q?NLI2Ns0t1cLn21WuEF5YifHpLFcDaBSlSX/RnDNGpuitMRzsgmS97+zW5uKy?=
 =?us-ascii?Q?yfPjGkgvXQp5FtjYs4ufle6UTbWqypoPp11wOqo0RZ+WUq+md7a0ZMYJSiMB?=
 =?us-ascii?Q?w5CE8tvCWdzctl/4wbx4C/eKri6SnluTty+NL7+P/7ud2C2jRhVakjB2p0us?=
 =?us-ascii?Q?WfBTRKlE2+Usc+tBjaO3tsNhE5pXDcImo3XgWqJJSFW5REHGtdaCaGF0pwOG?=
 =?us-ascii?Q?C05Uo1T7j5xzRssc7sycBDOnscJIEZPS1r40o7LSB6ZXxGmXiljhmpd0nUL6?=
 =?us-ascii?Q?5jgWBT7badwJ6hC1M14qO1OnFNmwHdozgZ3LgIUFlQCQJ4C9I2WLWo8pNPXZ?=
 =?us-ascii?Q?gdR6uQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d8b977-81fa-4ac6-c85e-08d9c5832326
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:07.3580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEBgtUn7ejMJDA0Zhk2pvAfddLHb0rG6+qgHUbCjC/lZVyQNOKen7EgDYgsmBSeZvU2dVX4QnjtsWUEWWkj3/LP/04oOD0+52EqNH/CyhOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: iQrxIY69WiuBa8QHlkUHQhKALL5JEK1U
X-Proofpoint-GUID: iQrxIY69WiuBa8QHlkUHQhKALL5JEK1U
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

Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.
Add the chardev reopen-on-cpr option for devices that can be closed on cpr
and reopened after exec.
cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or reopen-on-cpr is set
for all chardevs in the configuration.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char.c         | 45 ++++++++++++++++++++++++++++++++++++++++++---
 include/chardev/char.h |  5 +++++
 migration/cpr.c        |  1 +
 qapi/char.json         |  7 ++++++-
 qemu-options.hx        | 26 ++++++++++++++++++++++----
 5 files changed, 76 insertions(+), 8 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 0169d8d..230bf16 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -36,6 +36,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "migration/cpr.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
 #include "qemu/yank.h"
@@ -240,15 +241,24 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
     /* Any ChardevCommon member would work */
     ChardevCommon *common = backend ? backend->u.null.data : NULL;
 
+    chr->reopen_on_cpr = (common && common->reopen_on_cpr);
+
     if (common && common->has_logfile) {
         int flags = O_WRONLY;
+        g_autofree char *fdname = g_strdup_printf("%s_log", chr->label);
         if (common->has_logappend &&
             common->logappend) {
             flags |= O_APPEND;
         } else {
             flags |= O_TRUNC;
         }
-        chr->logfd = qemu_create(common->logfile, flags, 0666, errp);
+        chr->logfd = cpr_find_fd(fdname, 0);
+        if (chr->logfd < 0) {
+            chr->logfd = qemu_create(common->logfile, flags, 0666, errp);
+            if (!chr->reopen_on_cpr) {
+                cpr_save_fd(fdname, 0, chr->logfd);
+            }
+        }
         if (chr->logfd < 0) {
             return;
         }
@@ -297,11 +307,15 @@ static void char_finalize(Object *obj)
     if (chr->be) {
         chr->be->chr = NULL;
     }
-    g_free(chr->filename);
-    g_free(chr->label);
     if (chr->logfd != -1) {
+        g_autofree char *fdname = g_strdup_printf("%s_log", chr->label);
+        if (!chr->reopen_on_cpr) {
+            cpr_delete_fd(fdname, 0);
+        }
         close(chr->logfd);
     }
+    g_free(chr->filename);
+    g_free(chr->label);
     qemu_mutex_destroy(&chr->chr_write_lock);
 }
 
@@ -501,6 +515,8 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
 
     backend->has_logappend = true;
     backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
+
+    backend->reopen_on_cpr = qemu_opt_get_bool(opts, "reopen-on-cpr", false);
 }
 
 static const ChardevClass *char_get_class(const char *driver, Error **errp)
@@ -942,6 +958,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "abstract",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "reopen-on-cpr",
+            .type = QEMU_OPT_BOOL,
 #endif
         },
         { /* end of list */ }
@@ -1217,6 +1236,26 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
     return source;
 }
 
+static int chr_cpr_capable(Object *obj, void *opaque)
+{
+    Chardev *chr = (Chardev *)obj;
+    Error **errp = opaque;
+
+    if (qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR) ||
+        chr->reopen_on_cpr) {
+        return 0;
+    }
+    error_setg(errp,
+               "chardev %s -> %s is not capable of cpr. See reopen-on-cpr",
+               chr->label, chr->filename);
+    return -1;
+}
+
+bool qemu_chr_is_cpr_capable(Error **errp)
+{
+    return !object_child_foreach(get_chardevs_root(), chr_cpr_capable, errp);
+}
+
 void qemu_chr_cleanup(void)
 {
     object_unparent(get_chardevs_root());
diff --git a/include/chardev/char.h b/include/chardev/char.h
index a319b5f..299e129 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -50,6 +50,8 @@ typedef enum {
     /* Whether the gcontext can be changed after calling
      * qemu_chr_be_update_read_handlers() */
     QEMU_CHAR_FEATURE_GCONTEXT,
+    /* Whether the device supports cpr */
+    QEMU_CHAR_FEATURE_CPR,
 
     QEMU_CHAR_FEATURE_LAST,
 } ChardevFeature;
@@ -67,6 +69,7 @@ struct Chardev {
     int be_open;
     /* used to coordinate the chardev-change special-case: */
     bool handover_yank_instance;
+    bool reopen_on_cpr;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
@@ -323,4 +326,6 @@ void resume_mux_open(void);
 /* console.c */
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
+bool qemu_chr_is_cpr_capable(Error **errp);
+
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index 4229c17..3bda83e 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -6,6 +6,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "chardev/char.h"
 #include "exec/memory.h"
 #include "hw/vfio/vfio-common.h"
 #include "hw/virtio/vhost.h"
diff --git a/qapi/char.json b/qapi/char.json
index 7b42151..dfa6baf 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -204,12 +204,17 @@
 # @logfile: The name of a logfile to save output
 # @logappend: true to append instead of truncate
 #             (default to false to truncate)
+# @reopen-on-cpr: if true, close device's fd on cpr-save and reopen it after
+#                 cpr-exec. Set this to allow CPR on a device that does not
+#                 support QEMU_CHAR_FEATURE_CPR. defaults to false.
+#                 since 6.2.
 #
 # Since: 2.6
 ##
 { 'struct': 'ChardevCommon',
   'data': { '*logfile': 'str',
-            '*logappend': 'bool' } }
+            '*logappend': 'bool',
+            '*reopen-on-cpr': 'bool' } }
 
 ##
 # @ChardevFile:
diff --git a/qemu-options.hx b/qemu-options.hx
index 33c8173..1859b55 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3227,43 +3227,57 @@ DEFHEADING(Character device options:)
 
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
-    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off][,reopen-on-cpr=on|off]\n"
     "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off]\n"
     "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
-    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
+    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID][,reopen-on-cpr=on|off] (tcp)\n"
     "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
-    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off] (unix)\n"
+    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off][,reopen-on-cpr=on|off] (unix)\n"
     "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
     "         [,localport=localport][,ipv4=on|off][,ipv6=on|off][,mux=on|off]\n"
-    "         [,logfile=PATH][,logappend=on|off]\n"
+    "         [,logfile=PATH][,logappend=on|off][,reopen-on-cpr=on|off]\n"
     "-chardev msmouse,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
     "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev pipe,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #ifdef _WIN32
     "-chardev console,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
 #else
     "-chardev pty,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev stdio,id=id[,mux=on|off][,signal=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #ifdef CONFIG_BRLAPI
     "-chardev braille,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
         || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev tty,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
     "-chardev parallel,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev parport,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
 #if defined(CONFIG_SPICE)
     "-chardev spicevmc,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
     "-chardev spiceport,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
+    "         [,reopen-on-cpr=on|off]\n"
 #endif
     , QEMU_ARCH_ALL
 )
@@ -3338,6 +3352,10 @@ The general form of a character device option is:
     ``logappend`` option controls whether the log file will be truncated
     or appended to when opened.
 
+    Every backend supports the ``reopen-on-cpr`` option.  If on, the
+    devices's descriptor is closed during cpr-save, and reopened after exec.
+    This is useful for devices that do not support cpr.
+
 The available backends are:
 
 ``-chardev null,id=id``
-- 
1.8.3.1


