Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089433BED59
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:46:45 +0200 (CEST)
Received: from localhost ([::1]:32972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BdE-0003Ob-05
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BLR-0002ZX-2J
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:28:22 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BLO-00070V-Sl
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:28:20 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCO4F029361; Wed, 7 Jul 2021 17:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=B7thqYCtugzpzpKDd4BNDeOqSRJYuranoqPGv/pNnDA=;
 b=OBREZ1OtbE8xMFRbdRVzGBvVTK9DCnfj9e6NFg+Kn/etnPlQBhZdC0rqV12FfAsQr8Y1
 oWOiswdy2YfawXq8BTuIy1ByYr9Freae7GDLU/c0nCmGDWtV6hanGVUG7WXDLq5B2Dw5
 gMWnXAuNB5bbv7yp8nsd1NfdiZCKxsR4AwSVhrcoh5qzkCaHz9tSBgAEVsr29LerE0oZ
 ImjQjtVevV3dHCndrUtwYIaKRhsWHGsBgd4m/kKdgqgMomlEPpOiuDfy7R4wz/wCk9xD
 N4+him70IWGbWHQh8L2R3u+7N5hXqRRLuQaD1gzhgRwcG2Bn0TDEbq/6+uvDEG90jBYY 3Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aacpaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HA7t7026057;
 Wed, 7 Jul 2021 17:27:15 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by userp3030.oracle.com with ESMTP id 39jd13ubc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTaIguH5h29/zGj2vObT2bTJ4FgaBbgpNU/M4HuGL4jLREui3HbOBWgAXfeUkXBwd0UywCyFeyRY8mnkbaL+Cz3UuHKhKSa0qUCMJ8FswYW5R2NQ+ueRn/8KAlK4ZIvh/jR0OAwQFAiHCr3BjbL5gHJ/EiXKpzn8vDd56MF3N/5SFff5OWZJCxx3tobeDfkskjpWIp1few1wq0+rWOGhzetscjsWGnkGrV43lQTZx3Lkch7yHKZ0NjmebNySketgKfzLvtvfd7SFdzRbF6+2v0ZkhzvQqBdvSDrB3LL2AZaDRuEQe+9A3AVFElyICgwrHzHiQAZJ6M7aCjcDvHqu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7thqYCtugzpzpKDd4BNDeOqSRJYuranoqPGv/pNnDA=;
 b=F1Dsox6C2K8NOq/hbIUaH7PyZjoZb6b+Hel4H7l+Ze7Uc9897MrOO4qxm2u5tXSVOehf3JvtBCh0pIT8o6uMpoDswLlg8aXbeupu2CI/Cm6aib1Ap2Jq/rZl3ps9cfIg2OlGCtKNdfqBwKYamPprWacg6aczb30iiKV152vr3SlgkiSBqZHFQAr9OCangOTLVnEIWMY34pM158q6WQT0aesoxR7OtYPGmJALy5DWJathrBQTxURJJ/P16q8y7VSVLdzfRAOJRKfu5bg6bln4jQlPncMw3Vrn6zbK+KfhmcIgTmebtpYWhmU+su+JLTyeWp6PJbtQQbG2EcXUE00g8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7thqYCtugzpzpKDd4BNDeOqSRJYuranoqPGv/pNnDA=;
 b=d6rEblDKLDrOx3rwjPjUcpHGK9VZkPnAfi/p57bjeptDrnzxnkxMAVuswCPRE8km3T5FCczyf5x5EUPBoiojyW7AYnSEt2KXdXc/wz2qAFxDYi004e6lMp49ILPtyP83rpXp3SeSvjdgtTOTUVh01qUx7KbKkOFA4yau5Q2kdIM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2677.namprd10.prod.outlook.com (2603:10b6:a02:b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:13 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:12 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 08/25] vl: add helper to request re-exec
Date: Wed,  7 Jul 2021 10:20:17 -0700
Message-Id: <1625678434-240960-9-git-send-email-steven.sistare@oracle.com>
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
 Transport; Wed, 7 Jul 2021 17:27:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77f930f8-96fb-45d2-a1a5-08d9416c7518
X-MS-TrafficTypeDiagnostic: BYAPR10MB2677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB267730FADEC8DBE7DC464FEAF91A9@BYAPR10MB2677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qGUQnPG7YhBKLAdxfdbhI3po5J/So1OHVTUAWdu+9hOmHL3v4fzFIiz6M7p0i24AIcFWuVRgdIjM44ITbBN3U8z9q24+fNqcBLBYV5VRrm7/0SH1qf97SJRR6Lp+SeEWrXXFqfccokxd2O9B6RLM7vAVQ5t9RVyAgwwKsRFWT68UgHZYMXgcYqN668+f1Xtwmyja42uuX2xiE6FAmARfjOFiiMasT63A8OJSnYckyNvqW69IleiogrBHB5Ix2xg0a64lFmrnR/FS77LASJpK2GIyXxLjahzR5Kp9s/Ag0735bahIYjO+GMMysV9aZodLEgdMJ3/J/zTAUskmY5TpyIpcsLEtL7hvCoAY0lBATcyFVaAQWmXyepY2QhyG2cRNRwHrV85P1b0AJczlloOdXcML+Peg2jHorTv6Y8zpOAE883Ns89tVovoxHw9/T0WYfsiDUJNJOv30HGwnKeRv23iyiYzYX0jgKeFavioIYAOX6zSUwaUgRrDSm/c0HHqSVVz+A5Mviljwuujba81r323kYaRCyLGDkEqlUQKFHjBmaHXAGls0TUM3QsbnQ+yXxcmvv5qUXvmD0OVhqo9+y2fuNzsiiW/OmY8ehi7A+cgC1sq3jLXoG6aPPQaEubFW209LuCC5MaeL+rtriemxdB5AMUUz8wd+ILYjlEYFHTwu8seNkShUXmw46at0eRw5tdBa8h0cOlDfnF/PeY2giQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(376002)(39860400002)(366004)(346002)(6916009)(107886003)(38100700002)(66946007)(7416002)(4326008)(6486002)(478600001)(2616005)(7696005)(83380400001)(36756003)(52116002)(956004)(8936002)(2906002)(86362001)(186003)(8676002)(66556008)(54906003)(316002)(66476007)(5660300002)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PCtDYp49Hky/Z0j2N+tYsefpzdLmOQ1Y758tNpaz5Td3hz+CzWFqmIG51E9r?=
 =?us-ascii?Q?E9dzoumjIBBpD4HmBdFGv9NIHyXiyCekUmcKxN3uoW38+5HiN66jXqKNoPyE?=
 =?us-ascii?Q?hZ20WoOAE9sWUXfvfoBr6jhtOTX18zFoa5+FGE8rgoEuREVpVwVzxOj2ef/S?=
 =?us-ascii?Q?gxj1l464DwHNCP90WCFE8bRnQNxX8/qDMXMDolMg7lQHrz6dtLhIy1/rgqEe?=
 =?us-ascii?Q?A0Lyq01t9pW52jXGulHO8bIPYTDQKHE6sOqGj6VF+SAqwq/tkYXCJmPEC0ht?=
 =?us-ascii?Q?f56dm0dRsCZcTj2tcL/MxOCTk/Mdg9W3UoRU1mP5VdtMo7/za5KV4XZnGe5u?=
 =?us-ascii?Q?wVi4m7ORHl5f0GcxL6EM7Cn5HolQb1wXd4JqfJKPi6gV9J2En/e8nubpF4Tp?=
 =?us-ascii?Q?eRpLVdnxxRTT5WKZ7COsMZEMXA3M/C6bm/sg/GWK3fITJLkc8Rd3V/ZwcHVF?=
 =?us-ascii?Q?nBMMGE85QVRiqoklK9N+perybiqE9AutsHhRQf0RTExbHeolaZcBtlKAQDDy?=
 =?us-ascii?Q?sFA3VZEe0GxvAIPzervN/ggjQncdKGMAXfpl01UJIY+RxdKIURPglPhgbPdf?=
 =?us-ascii?Q?h4KNUS28yaKGuthlQs9rM3tT04kU7egWiNJQA7x63JjMwS4w3j6zUNKgLn2Q?=
 =?us-ascii?Q?/FP9rjcVpQwM4ZdeEoZiOl/9leeLPyW8hsMlYYFVqGqg2Tu7f7Ibe6iXBgKq?=
 =?us-ascii?Q?EUxFWPxWtXFOJP9qKhzYqa/WliuzVVYwZSjgNZuEhFIA5VXlB9+BOxWTUftb?=
 =?us-ascii?Q?GK0EAIoRBi2CZuwO4oZjXF3b0cKMnk6HADZX2Z7rBOxmoP/Vk6hM6rrLiZiE?=
 =?us-ascii?Q?hXav0IL790Q5REhgy0tpeW2oX/I1EBsTiwP/TJmbNaFVesb7t44lkKk48Vma?=
 =?us-ascii?Q?WKbMwfpkteVtpV7YfUpP0iqc20htRmNKQbJwCBJGSDxTgATmmOFVf8mpUZNk?=
 =?us-ascii?Q?kmXY/AcE1LDWSZsqjYC6yfdC+tg5SjITo+5obWUDO+e8lwxN0D5qqNfwh4Mz?=
 =?us-ascii?Q?qJ303cr/w/0wCAKfb/eEPuFZpNuKtJROsYWoT8XAg4+kFvQqezo7iKhvl7m1?=
 =?us-ascii?Q?bQLMXblmsmqltLPHJTBZxHCVSQW9W/iJOnk+96zj+E3j6twaHiTC6IQ2+aes?=
 =?us-ascii?Q?CFLoHgHzAOJBj6Z5s+EsC5Dwd9kCYEPJ5OealxjYaKKwINUW9nPNV+owXd9G?=
 =?us-ascii?Q?y1L6csGt8a+q+ldM6f3lGQ+gu3nOjGLXjRb7ll79NcSCGGfuU2CV3GThEyE6?=
 =?us-ascii?Q?UNgVzgqeeh7ZLUKKX2N+m/KfkgySifLOyPXQp+Qzx8Rj4C7bXpJkmkHabvPJ?=
 =?us-ascii?Q?rxaAKu2yWS7Kdvu12moSuIIS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f930f8-96fb-45d2-a1a5-08d9416c7518
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:12.8906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iB5cSqKH3BeP+NACt/X13xcxSh5bvRRALI8PxeS7nuG/ZmY6A/EAU24+9d5FzNgo78AdyBLAi8CvP/uQD1f5SFqqjJ10/j4cN94TY6GF6Is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2677
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: KgXN5GXI2pik5lS5PIw0q__U9MjQxzda
X-Proofpoint-GUID: KgXN5GXI2pik5lS5PIw0q__U9MjQxzda
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

Add a qemu_system_exec_request() hook that causes the main loop to exit and
re-exec qemu using the specified arguments.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/sysemu/runstate.h |  1 +
 softmmu/runstate.c        | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index ed4b735..e1ae7e5 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -57,6 +57,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
 void qemu_register_wakeup_support(void);
 void qemu_system_shutdown_request(ShutdownCause reason);
+void qemu_system_exec_request(strList *args);
 void qemu_system_powerdown_request(void);
 void qemu_register_powerdown_notifier(Notifier *notifier);
 void qemu_register_shutdown_notifier(Notifier *notifier);
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 7fe4967..8474a01 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -355,6 +355,7 @@ static NotifierList wakeup_notifiers =
 static NotifierList shutdown_notifiers =
     NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
 static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
+static char **exec_argv;
 
 ShutdownCause qemu_shutdown_requested_get(void)
 {
@@ -371,6 +372,11 @@ static int qemu_shutdown_requested(void)
     return qatomic_xchg(&shutdown_requested, SHUTDOWN_CAUSE_NONE);
 }
 
+static int qemu_exec_requested(void)
+{
+    return exec_argv != NULL;
+}
+
 static void qemu_kill_report(void)
 {
     if (!qtest_driver() && shutdown_signal) {
@@ -645,6 +651,32 @@ void qemu_system_shutdown_request(ShutdownCause reason)
     qemu_notify_event();
 }
 
+static char **make_argv(strList *args)
+{
+    strList *arg;
+    char **argv;
+    int n = 1, i = 0;
+
+    for (arg = args; arg != NULL; arg = arg->next) {
+        n++;
+    }
+
+    argv = g_malloc(n * sizeof(char *));
+    for (arg = args; arg != NULL; arg = arg->next) {
+        argv[i++] = g_strdup(arg->value);
+    }
+    argv[i] = NULL;
+
+    return argv;
+}
+
+void qemu_system_exec_request(strList *args)
+{
+    exec_argv = make_argv(args);
+    shutdown_requested = 1;
+    qemu_notify_event();
+}
+
 static void qemu_system_powerdown(void)
 {
     qapi_event_send_powerdown();
@@ -693,6 +725,11 @@ static bool main_loop_should_exit(void)
     }
     request = qemu_shutdown_requested();
     if (request) {
+
+        if (qemu_exec_requested()) {
+            execvp(exec_argv[0], exec_argv);
+            error_setg_errno(&error_fatal, errno, "execvp failed");
+        }
         qemu_kill_report();
         qemu_system_shutdown(request);
         if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
-- 
1.8.3.1


