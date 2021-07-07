Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A73BED09
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:29:28 +0200 (CEST)
Received: from localhost ([::1]:38792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BMV-00032e-HI
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKT-0000C1-7X
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKP-0006jC-Lk
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:20 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCO4E029361; Wed, 7 Jul 2021 17:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=uUPd8ywn/2q536iq/Nsy8RD5CPFrhQt4bo3xVk+Kgw0=;
 b=Ao/+z4Efd+DV8oJAWOYOlLEoZGRrI3VrTCK4m3qLhRBDp/F63dhEPzvB0VLNG8TJhe3P
 dVuy30kUU64h6cHLxCmtPUdvYucGpduQD8J85eX6I9EwQBNpXTFWcAT2tdKdUW0ETQGO
 wQOE31NhlCwZGkv/ijqD5rVhhdPfbyhAcYDR91MZGtKWOWX7131hY4CoHQiNjc6mqN43
 T8hTDPupy1q8kZBauP+qh/hIz1RsfD25ze+JSntKpQxu7OicPr6IPJ5EnDECwSzuJV1s
 hADFNs03VReleBrj+WavbSJODmukZTZkurP96fNQGZqN8fEwcpL+oHVePKVuBrO48KuZ yg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aacpar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HA9YW026110;
 Wed, 7 Jul 2021 17:27:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3030.oracle.com with ESMTP id 39jd13ub9h-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxqAepu1bv5/yG03FSrXHF/sj0AG8N6hzZZVs+O4EKrF3Ao75xKKCoOLNnrjWRslpIJgQuj/BYK6FGQv3PvHjVMCNrkcVa3Fd9iej6iz57c+uOpmvVfqbw8sUsIq1aXfFhOfnzkxNRM8zQlOqY+QlVRfq0Yx5NSHp+fbQfTmvvvwrfqzHDr5MABnDX8soZL/y/PH98WsbjuDMcuMAPePNGIuZk0DpYNXxUmpR4PSPkGlSwiDzFeXM3+3j5dB6Ybl99SppHS7mVK62Z22UYRi7z28W2QNu0wSrCRyfJWUkixOG0BQaplsgHX3+aublfjRhU+gtcuqPsCJnhvJuxhQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUPd8ywn/2q536iq/Nsy8RD5CPFrhQt4bo3xVk+Kgw0=;
 b=SppLQGQXgPC5B5FrbP9Ds/MZHV6sSrMOzBbIYZHC0AbB/U1BtOm9TgCuePhOR+LrcRK3lTW/4uDG4W3oMK5hEKw6vsno5U2jY8aXNYwAPhhHiqyhCV8PCnN0H69h271xGagDiOQ10enyGJHmwKIThhzcOqkVvp2wddFthgJgcql4o+NudsM0/9o/OW0A5I0XENGRov7r4XjC6VBySxbZQDE4jddTcTzJN66owtf7MKKQeQulWHE+asIi5HNVw/d+/UgLKcTxrl+oekz4x4LxyRk6vqmF+3LlhFpV7WXyLElcYPY1Z12EWznTBK34FlD4AWOhz3lekPTAYZUzxuX+ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUPd8ywn/2q536iq/Nsy8RD5CPFrhQt4bo3xVk+Kgw0=;
 b=RoRQn3p94Q6Pm0CjxAvO6UzY/bp05+ailF9rzM9GUW34yPB1QdQXQMJhL6vUY0We3/Dy9l8vew0OVzTPj8xosM785qrkyffTZW2NXpH/fnhGx96ALNUrvDmNJ7O97Et8+h5dDTw4jbiz4VCky7Pf3wLhHZ/TVkOFikS1D51kAxE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB4104.namprd10.prod.outlook.com (2603:10b6:a03:11b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:09 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:09 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 03/25] cpr: QMP interfaces for reboot
Date: Wed,  7 Jul 2021 10:20:12 -0700
Message-Id: <1625678434-240960-4-git-send-email-steven.sistare@oracle.com>
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
 Transport; Wed, 7 Jul 2021 17:27:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1aa468f-1686-44ef-a10e-08d9416c72a4
X-MS-TrafficTypeDiagnostic: BYAPR10MB4104:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB41047DC86119FDFCEF5D691CF91A9@BYAPR10MB4104.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJcqCWXNoPXdPeaf862inWJwhdVAaHR8qES6GGWeikvTfaZbaU1DH2Mv5WJK7yX4JHG16I7gjm3ufVCD8fsTnJiQX8Iz+eMMyTVqLjsXOvo1ZBlCytFXfLBPtYRtr+q/amiR6/1k3/HdIzCRQXeMUn05gj7tCfjeJdDa4SZSPSQr82kdxetmp8NNCUgh056TBmgrw99YWu+2dHUyNCoszbF7pwbMeag85gfMduLLdqmbx+xzQ1VKcLoxvL4Quo1/3xk+IEYHnX9G0FC8dyNm+KmIQDhOenIBfuCiOpGTyu/Glu32QHDFPaqFTq2ofmdpYYkut6xzFCFvLHbYgGeBauDxC9DCSXR22QsuAwUvEEX0cwuq8S6idl9jzf5ZmXNOUX8RoZQgX/qtQ1ODTxk/0KtyH2nZnVNf39qRY4vWiXSZIdW8qbWBMX5AWlLdkBpLvt9Pg5CJ2Ur40URpt576Jy3ejN/K1HLcIVGQVRhMUgnfRvAiFtpUKmG/z2ij0b7IVqmmWRByZSJbHu2iYPJFJwJhxrZpsVqXWUHl+oAhs/m/76E1qpYoLrXzDFZgQGPOAIZO7wb5FpEdOtWRNltFSfjnE/LnnT7W+oYXn0BE7/bbSoaazWPh+bjgIE0FebCYXZ9M1Fhh+fuCSw27jO4wFM8ELfocvOp09m/7r7E1ZXFqvi5Kj+Bt6JyhiCL8S3yQp4jkAp6O0y+44PbEe5ep8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(136003)(396003)(346002)(478600001)(36756003)(2906002)(2616005)(38100700002)(186003)(6486002)(66946007)(8676002)(7696005)(6916009)(956004)(8936002)(26005)(66556008)(7416002)(38350700002)(66476007)(5660300002)(52116002)(54906003)(4326008)(107886003)(86362001)(316002)(83380400001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xb2qzAWShVk/tzl86VP76TmNlUSCYik66sth5PKJCo9cNl5kDBUz4M1kx0rj?=
 =?us-ascii?Q?XNukHmuZ/rCnojArvByyJ+HhnEDAk+2Kvpwvj8H7mTfxnj0VfBnGEPlX5/Ji?=
 =?us-ascii?Q?8l/wqgc1EEVAHs0oksdL3mDNdduDOhMpyMnSrfKsdybrYAN04rAEJpzrZK0P?=
 =?us-ascii?Q?GAqG2tnUZgPHbFUMK0M37Ck/RpAYl8e4FWYNNSNgh4G3xi5b0aBxvRk65Oxf?=
 =?us-ascii?Q?N2kPzrtkcpbnWlOr4CBWA4rQU7bm5CAVQlKviQpTaHG4xkBHwGkVS5epuVmT?=
 =?us-ascii?Q?Kgs0L9Ch6yjSObUsfnQjVJklVSGiJYJDpXbeYPNQhfeacakON4reZmvROK5p?=
 =?us-ascii?Q?is0ixFpRLb76LhHftihEOsZ1s26sttuBECy2XNJhi45Q7QFHGPRbieiwsfxx?=
 =?us-ascii?Q?XN/FxlFGuIVGJFXuf/cDokgibjvJ8vaU67nYVJpUxPU7NMYwAb+m4EKxv54x?=
 =?us-ascii?Q?+bvVh48gl+euo9GtwNIs+SVxQS2S/Z9vEo3C2cyQHiLYpniDcgwzK7g/xFFB?=
 =?us-ascii?Q?Qmsc3wzQoXxGHtvCon/xCHtRdHU/ssoBXiUWVEI27ZzdHjRYDMRG8B1vaegP?=
 =?us-ascii?Q?vOcssaLe28UaJEc/ACpDqyot/2mUAY1jZX1iL8f/mezF5FGgd8ab2ZX/T9Qc?=
 =?us-ascii?Q?AVfyV/J8ztazu6IFTVCIEuozMnPoKqWF1qUmoTgjqcNT2/EodALKOtQLrkIV?=
 =?us-ascii?Q?h4cV4q3un6p1Sfe3/gwCi36higa/4n1fdWRh+wy/7Oie0KZ0QIWGIjXx59Mc?=
 =?us-ascii?Q?bTpM1VgtdwCIN1DTT1lBNWvYFT7Qjp5W+0ZWmB15L3QWxkIiSCwELflb3fi6?=
 =?us-ascii?Q?HW8Pkeqsl+fSv8gXjrb/0l0DBxWZ258Os4PO412mgYq19JUHe7zhfbjEil62?=
 =?us-ascii?Q?Q4Mg1psEVfsDFw+E/+1LNPVVbuGNn4IT1XXFt6eJ0oR3QBeLUbQWV1BA8FWo?=
 =?us-ascii?Q?I1HWLiYhxMUnL3FUE9OmEboIAZagvHzMqvgf3Zajhn08xFy09Nyup7jKdkpC?=
 =?us-ascii?Q?BWR1TBX3nChXGzEJZyGGFtf34kRjGbbZx7r+XK0cW/O/7wfhwCSiIgjl7x/W?=
 =?us-ascii?Q?CCMqg8n1Kaq/bgV0fu75Kq6dlPoS5sAHirWHNtyYJCpcgcgYuqZd9feGuF2P?=
 =?us-ascii?Q?vCn0rleCu1Qj9Anb1vjF5tCpxfZRWdoCKgDHwts5+egVMQkktQcYrU9nRnZk?=
 =?us-ascii?Q?QrqR5OofzTjrOKlAWUtc7I6xRulAewHwUkNp+49IwieTgQdv2kJI/kycFhR5?=
 =?us-ascii?Q?GASKNI/1WWhGyNnHBV26Oo2ojw4Lp0gdiuT7Dperg808i+Xc7t4oSCYPXDlJ?=
 =?us-ascii?Q?20QasWRc3WXQxYoS4a8md3ub?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1aa468f-1686-44ef-a10e-08d9416c72a4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:08.6920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96SQWjdSFsaweRtmXna4d6YsKkyPPn0yM8PeKbrdtZ7EtNpylrfnRdrE0rpjEXUOWtQRDqMSFrqTYc5TCPHnkfqVm9sYhKEn6rwYdlIKyhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB4104
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: cGmuxFPOhMTuJMarNQmcVWh8FSY45oLj
X-Proofpoint-GUID: cGmuxFPOhMTuJMarNQmcVWh8FSY45oLj
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

cprsave calls cprsave().  Syntax:
  { 'enum': 'CprMode', 'data': [ 'reboot' ] }
  { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'CprMode' } }

cprload calls cprload().  Syntax:
  { 'command': 'cprload', 'data': { 'file': 'str' } }

cprinfo returns a list of supported modes.  Syntax:
  { 'struct': 'CprInfo', 'data': { 'modes': [ 'CprMode' ] } }
  { 'command': 'cprinfo', 'returns': 'CprInfo' }

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS           |  1 +
 monitor/qmp-cmds.c    | 31 +++++++++++++++++++++
 qapi/cpr.json         | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/meson.build      |  1 +
 qapi/qapi-schema.json |  1 +
 5 files changed, 108 insertions(+)
 create mode 100644 qapi/cpr.json

diff --git a/MAINTAINERS b/MAINTAINERS
index c3573aa..c48dd37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2864,6 +2864,7 @@ M: Mark Kanda <mark.kanda@oracle.com>
 S: Maintained
 F: include/migration/cpr.h
 F: migration/cpr.c
+F: qapi/cpr.json
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f7d64a6..1128604 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -37,9 +37,11 @@
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-commands-cpr.h"
 #include "qapi/qmp/qerror.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "migration/cpr.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -153,6 +155,35 @@ void qmp_cont(Error **errp)
     }
 }
 
+CprInfo *qmp_cprinfo(Error **errp)
+{
+    CprInfo *cprinfo;
+    CprModeList *mode, *mode_list = NULL;
+    CprMode i;
+
+    cprinfo = g_malloc0(sizeof(*cprinfo));
+
+    for (i = 0; i < CPR_MODE__MAX; i++) {
+        mode = g_malloc0(sizeof(*mode));
+        mode->value = i;
+        mode->next = mode_list;
+        mode_list = mode;
+    }
+
+    cprinfo->modes = mode_list;
+    return cprinfo;
+}
+
+void qmp_cprsave(const char *file, CprMode mode, Error **errp)
+{
+    cprsave(file, mode, errp);
+}
+
+void qmp_cprload(const char *file, Error **errp)
+{
+    cprload(file, errp);
+}
+
 void qmp_system_wakeup(Error **errp)
 {
     if (!qemu_wakeup_suspend_enabled()) {
diff --git a/qapi/cpr.json b/qapi/cpr.json
new file mode 100644
index 0000000..b6fdc89
--- /dev/null
+++ b/qapi/cpr.json
@@ -0,0 +1,74 @@
+# -*- Mode: Python -*-
+#
+# Copyright (c) 2021 Oracle and/or its affiliates.
+#
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+
+##
+# = CPR
+##
+
+{ 'include': 'common.json' }
+
+##
+# @CprMode:
+#
+# @reboot: checkpoint can be cprload'ed after a host kexec reboot.
+#
+# Since: 6.1
+##
+{ 'enum': 'CprMode',
+  'data': [ 'reboot' ] }
+
+
+##
+# @CprInfo:
+#
+# @modes: @CprMode list
+#
+# Since: 6.1
+##
+{ 'struct': 'CprInfo',
+  'data': { 'modes': [ 'CprMode' ] } }
+
+##
+# @cprinfo:
+#
+# Returns the modes supported by @cprsave.
+#
+# Returns: @CprInfo
+#
+# Since: 6.1
+#
+##
+{ 'command': 'cprinfo',
+  'returns': 'CprInfo' }
+
+##
+# @cprsave:
+#
+# Create a checkpoint of the virtual machine device state in @file.
+# Guest RAM and guest block device blocks are not saved.
+#
+# @file: name of checkpoint file
+# @mode: @CprMode mode
+#
+# Since: 6.1
+##
+{ 'command': 'cprsave',
+  'data': { 'file': 'str',
+            'mode': 'CprMode' } }
+
+##
+# @cprload:
+#
+# Start virtual machine from checkpoint file that was created earlier using
+# the cprsave command.
+#
+# @file: name of checkpoint file
+#
+# Since: 6.1
+##
+{ 'command': 'cprload',
+  'data': { 'file': 'str' } }
diff --git a/qapi/meson.build b/qapi/meson.build
index 376f4ce..7e7c48a 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -26,6 +26,7 @@ qapi_all_modules = [
   'common',
   'compat',
   'control',
+  'cpr',
   'crypto',
   'dump',
   'error',
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b97..001d790 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -77,6 +77,7 @@
 { 'include': 'ui.json' }
 { 'include': 'authz.json' }
 { 'include': 'migration.json' }
+{ 'include': 'cpr.json' }
 { 'include': 'transaction.json' }
 { 'include': 'trace.json' }
 { 'include': 'compat.json' }
-- 
1.8.3.1


