Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434E03BDBCB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:59:22 +0200 (CEST)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oPp-0006fO-5s
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJm-0000ng-3Y
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:06 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJj-00084I-Sd
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:05 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GpqgF030618; Tue, 6 Jul 2021 16:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Ql4BaF/gK2L7/cYlLylEl2VIg9AptK3OxZelqg16maQ=;
 b=ul8XUsNUxcee4JCD7rfqYTFKZW+6qgFd/AYkC8t65nVqeXZtKsiMmf+BayFWw5bJzulM
 YMcJ2tiaFIO9KFP7XNVxJ0V/vyoXTyqs+fZxzrGTSjWBDa8H87J4gEC4YB5+X95Hdlh8
 G+gL7XEU+rSX4OSQB8FxnVKjpvs0DXY6mjEhXFs3ix/CA25Yv45n5MlQVtUNKL7oR9cz
 03q9EdaTj7s5/K95dlC3PCy2nHX/5TB5Bn+Swnk1hXNeBPC+uxSw6lWmpDpfNIHDOpLD
 EeimYXS9yQj8okjolgd0mZz+x5faw0yTw6LZRNc3ZzPNLJVYQATHbJEyl4oKibjgw9GN mw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2smjabc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:01 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoVE6084730;
 Tue, 6 Jul 2021 16:53:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by userp3020.oracle.com with ESMTP id 39k1nvcq6h-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVcowGXV9xYnFT2ANZ+SB6d1W3P+UtUbSF670eCZCBUbu3KZ3Tiig1ADzkzV4fGOP4bZt4vZuC/6Uql6iszES1wNT01k7IqU1MtXUBB0ZnRA+NfM526YQECGJUgpqDhY8mMGeUuBwSv/uPHFWZRqM6tcvkYN12wLaDuT1p9AbJSI+2tr7R3gIsZ9MetiJTsedehYa6ls8KGtXL7AAFKhkpp0GZXPHdiz/KwMvG/y4fg+e8/GT1/fSmSNcDoGaP2zviVICynTw8+UJB6VeCd4Xtct2Y2FEUnt9LaH+bcfOAZ5QGExxrQu7Es655yRCL3XX9/8sW+IPmJgitdWYlfZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql4BaF/gK2L7/cYlLylEl2VIg9AptK3OxZelqg16maQ=;
 b=RYsWqfyf9FKNitIMRI9l5oSWgazXV2f/kTG+p2i6hZsNYMdEhmxKgG+sa7FdtCtL7WazrSudoWGfTHUwaBcVeqzxsIxVbE80HedsdH7sI51hLGVrAuw6g1IRJNfFuGaj0bFBAVMuqtMP8UriBLkOfa/t56DYYu/XnQmLXI/HuX5PK/Cq9A6KPcuTun2eAoZhUK+vFK9grW4ycuCJAK5tBIOC9bH0yNPXygyQh/3LkAL0pWU4by7tmTJX02ljPzB1BDJzCMnFnKrqZOHrOy/twaimVLdo37QFYnOZ8pdBIbYcpoX4JuGWGCwvf0K6Ha7d2Hl2wcbsFsP9h3r637rxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql4BaF/gK2L7/cYlLylEl2VIg9AptK3OxZelqg16maQ=;
 b=La9ushhfYwaFwHq0GzKPhO9kSAGkevCJMGjrER+SBHrFpTd5K7AWAaDKJrUw4EPwjAI996T+3sbCJ+NIQOaYdG8n9ax7ZI1uOqYDruwI3DSOuibmZ9yq+mA+EdMKthtZcoNs25meMiM+MUMrrOpUtc2Wp90epF3WED+g2DIDA+s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:52:58 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:58 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 12/25] cpr: QMP interfaces for restart
Date: Tue,  6 Jul 2021 09:45:43 -0700
Message-Id: <1625589956-81651-13-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:52:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b316ca9-9eca-4818-dd56-08d9409e823a
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB280501A763681924C78C4B5FF91B9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKP5vZ2YHpF+HBF2M05cdNQO8CzyZBvffiK4dubSxHeqMlGXo0Nct24KOChQkwouthBwcDA+hfBpoZzEq9R7EgjBgWgG2hRTDK43e6/7lPZGiW2151eJXcT3S7FJp510GUgcz8HDoyamvNKfiF5DcYyGzOksmjEI33k0A53Nwlcujq35VnytxzVF30YwYaxBpaI2UNqqoFZStG9urDEkrMQ4iqwmc0IZW085VJvdk24iTrdY7hELMGC6Fb7E6fzy6/Xbe+pIiL702h05NYD3eEEsOCRZk8r48aAc0iEqJbsIaq29zJhNdlbuh3eASXwGXmxnPmcI4sG6PmgN30UNem9fXAZR6LKhiwTc/CUKtxXM7KpGNsA98xt8Vvv16QTE8gq5Sn2WoC2qey7u/5AxLPjfUy9E3wgtXJrRwoIKIvzdnrpjIIj6LaptYnUyHIhrgJ5pwX8pIVV8h4AN7a9wvOYGVDMq+hpv+FUeE7pKwA/rC84FTe51Fc0AsWmPS70yLTy/noczBv74o/vJJl5cX4TQN26e7BrXKU+lExqxFZRcgEHowLOTqfkayetCTOrO/Zx1wkK+iFj5/SPfNGa0bm2KHOTfom3NaSBBVio6IJCBH4c1gjCjmumkMFHaNpZJg6sNOZRAjocoKnXZdKYzuteEQXD4E/nHsT9hTN5SBHGg4XnPkROhcFZuOL8I3fmqPCbcDw98JR8wY92n6pVLFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(2616005)(54906003)(26005)(107886003)(5660300002)(83380400001)(6486002)(7696005)(186003)(66946007)(66476007)(66556008)(52116002)(956004)(86362001)(6916009)(7416002)(36756003)(316002)(38100700002)(6666004)(38350700002)(2906002)(8676002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DtnlwWWFDSQwA1+IB/8RboCqlF0IIE3OKgyI7a7NVmvNF21GBly8UOXubSfT?=
 =?us-ascii?Q?fcet+y1vobVSo4ZE7R/B2FqBJNAMLk3G4MvUO9fsyFXCeLUkEnvQ3YeWV+fz?=
 =?us-ascii?Q?g/3knBQefVqCsks0gCcIIr0WiOqx0TKfLzbnoqkdLZ4sksK7hVn85X6dS7Um?=
 =?us-ascii?Q?RWqNyL2c3q8BRT6+SPDu3xYyQWBo4MATzRF/YPL9UxTf4/hZxh26mc/tfe/n?=
 =?us-ascii?Q?Yz9BsTqve+JwYLcoXPdNqm0SxY/epe2esDpioECVn82C/Qm4DRmVqL+TcgBC?=
 =?us-ascii?Q?PPV/roA+GqQyoMqQ+aBKB9FcMu09WJkVhHuwiLd/G8WfIgcRdHNBqpmQaFOf?=
 =?us-ascii?Q?e6thQyTR/Jv5NCrsLxECbruwjYsQXpupNeya/m0Cj81EbB74QRnic2oflBkN?=
 =?us-ascii?Q?C8UnpSWgdUs8owCdJpOEtFS7G3We7+ZlSvaivweb7shxGNtTp+BhSboUDyj3?=
 =?us-ascii?Q?FARX1m5Uh5yQLXFi+P+UCWihrp4HelRAVeHLP8jbbTQL9iyToh17nTsjAT2m?=
 =?us-ascii?Q?QWPeqxpDtd0MbcWaTaoyRuI3oDssV3nz5J5B1NsamKGw2zhDBEFaCgzcN5U6?=
 =?us-ascii?Q?C39tNt4/IvmRsDysOhp8RURHr8lOCuvmCBjzpypPji4IZDBXiRwBLzNYUqZ3?=
 =?us-ascii?Q?KFut9gCFRxiIc7mWDXFxgFFaNQzYcp3mwh9QNWVCx7JPELgwV4b1wQJAggQY?=
 =?us-ascii?Q?CKc8LdR3pA08lu0CUhHE7xoCpAC2lGmYVJcRgW096uBzm5TqQiSgEPQudTcf?=
 =?us-ascii?Q?FCgXoAlo6jqda9HsYySdelOQDX0QXUrVWw6wYhNhItRgxRlR1E4fb+cNFmuO?=
 =?us-ascii?Q?J1SF0DKn9avwGQOiAS1YVxugta1gqLd7tBAi6O7RQIv2fQL8jqAWwNgqAWlc?=
 =?us-ascii?Q?wU/yVMseeaXr5HvExkXWYrKNGR7/ApEyYiKyFV3PiOaRIjFl4Hze1FPMQOw5?=
 =?us-ascii?Q?Q2lIvknEIG25QlXsALg4eM+n9CMGlX9cGDIy8XJB/1rRH6i9zuokAc7fFYMJ?=
 =?us-ascii?Q?AdG276g41RYnNp+MiWUUhWjFTgadeDUiLhOZ0+T5rpdP71lUhrjNZhy5Bmq+?=
 =?us-ascii?Q?OuaNhPTMwijCbCgBBtuvm7zRh8303FHLEW6H3fHnUKzvyHhTP9711xe6rkhH?=
 =?us-ascii?Q?KRpbdrXx0hO2TSRdXibok1owHyUF28KFu6MCroZWgsDYpqG8B216cQCO0cJL?=
 =?us-ascii?Q?bZ2f7rdmdVIJMujO8JMg67sQMQejk0oe0T1j9GHIi4sUFfWaCwF5ocleXQNa?=
 =?us-ascii?Q?AJDqqD/pbVRpzDocqZhT6AWQkqJ3YOMOHZ7YXUlzvbnw8wLILUMwa4++ttdk?=
 =?us-ascii?Q?VE3F3ka6AksdyAJQZXtJFirV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b316ca9-9eca-4818-dd56-08d9409e823a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:58.5750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BifcR7D/l896h0opzbXC6E/yfQDEsl+NJFHpB+QwVhY1P1Kc8j0ZPWMmYO7oo1G4RvQjoGULPJ4Uwmf0tTaqMTCWUUEVVM3HKLHKPrYzOy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-GUID: pNTetxE4aQw14MaOqfITtpwclVvCd1gL
X-Proofpoint-ORIG-GUID: pNTetxE4aQw14MaOqfITtpwclVvCd1gL
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

cprexec calls cprexec().  Syntax:
  { 'command': 'cprexec', 'data': { 'argv': [ 'str' ] } }

Add the restart mode:
  { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 monitor/qmp-cmds.c |  5 +++++
 qapi/cpr.json      | 16 +++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 1128604..7326f7d 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -179,6 +179,11 @@ void qmp_cprsave(const char *file, CprMode mode, Error **errp)
     cprsave(file, mode, errp);
 }
 
+void qmp_cprexec(strList *args, Error **errp)
+{
+    cprexec(args, errp);
+}
+
 void qmp_cprload(const char *file, Error **errp)
 {
     cprload(file, errp);
diff --git a/qapi/cpr.json b/qapi/cpr.json
index b6fdc89..2467e48 100644
--- a/qapi/cpr.json
+++ b/qapi/cpr.json
@@ -16,10 +16,12 @@
 #
 # @reboot: checkpoint can be cprload'ed after a host kexec reboot.
 #
+# @restart: checkpoint can be cprload'ed after restarting qemu.
+#
 # Since: 6.1
 ##
 { 'enum': 'CprMode',
-  'data': [ 'reboot' ] }
+  'data': [ 'reboot', 'restart' ] }
 
 
 ##
@@ -61,6 +63,18 @@
             'mode': 'CprMode' } }
 
 ##
+# @cprexec:
+#
+# Restart qemu.
+#
+# @argv: arguments to exec
+#
+# Since: 6.1
+##
+{ 'command': 'cprexec',
+  'data': { 'argv': [ 'str' ] } }
+
+##
 # @cprload:
 #
 # Start virtual machine from checkpoint file that was created earlier using
-- 
1.8.3.1


