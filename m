Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5863647D80A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:54:52 +0100 (CET)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07hL-0007xa-DV
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:54:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V7-0004aw-QE
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:13 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V4-0008Kn-K4
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:13 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXsAa013618; 
 Wed, 22 Dec 2021 19:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=75zZ/yjfc+FBxgEI3tCsey3+RfhAFPqgNxlIO52HzAY=;
 b=u6+EsmaWcRQVzSrSXEnR4fyyhuLHlX+9smMRaZVq70Fjy5iGycpryBsBOrF+GpaK+MIK
 yF+tFVGYgmDQRRgT2xIWoE1VFRzjyIHkg2mRds1WywV/2+MEeZj7vvfBDZ6SYqfmxbn8
 fDmJ5FAmKlLsmXrduVL5Uqf3pzanVmBtSxx6aZGkpKh9Dp4le4ABmwmLq8aP83e2pAMZ
 inxtNCpWhAz3ebkZUgZnAJYXqozWTb9gg9yy2km95RAWS5RWMWEtSXMN8pqvL6W4ggiy
 ZFd34pROvfEM8MNChiChtkVu9RgSFkHZFpqeYORlc0S8Vkpgf/w66srbtkONY3LxcGVp SA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCEx049078;
 Wed, 22 Dec 2021 19:42:04 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by aserp3020.oracle.com with ESMTP id 3d17f5rftb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnhw3N7T57mZZN3UWfQEGbhvixLfzF+5vte7nbrcw+r4R6Hz0E/c+ugDZxGPrXz3wG1lbzJ1l7LKdVzHrAUTy8R0PNFdpg4hT6kldUU/kFsqFOssWx3EshVT2lERmqKv/EGZiNa1HWqzWfk/teoTF0jc1fwGUdcM8QexXo8IbIczKi0e/fLF19j6F0s5qaqPux2CeJztMBg6ahkFowdqszFv2eYI7eAThXNVdkFqtT6sRYWSkzYBTvTNAwIE6wM3byP+3ocRsyFcOdUyBArQ3gSGcxWgOj7Wgw3Oj1JI6LoyepfrQz0WyQaegBdPQ6jAMl807Ufkd4ylEeV35qbQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75zZ/yjfc+FBxgEI3tCsey3+RfhAFPqgNxlIO52HzAY=;
 b=bBWRsM/jfAHP0KK7xaULaTeOhBz2AYIcP1wzN6mG7RXqOxv4d12sCmLHnBJHCGwe+avvxfVfFkriy2508Zfb9s9va3Wlop6tt86ut6/jOFwdd7VnsY6D4tQyfwiHbnhMb1zqJT8R/Gecp/VPZBRx/9p2UvfYlpHx+BK2jbyv6UZtSyjXVfwl5LWMSWkrzeA7rId7SF1Ir0vFCWd5y9qirq2BuNjDAFI+CeJrWT89EPyUzXOMkhG+O5gWWip1dqHjgjGpIbeA0KzYanbY+hRhslbz1Lr8S9PLje5uC7TCcXt3kxZmL2gfvbk78v2YtoQ4wChVMUoyHElSJrnlrC73DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75zZ/yjfc+FBxgEI3tCsey3+RfhAFPqgNxlIO52HzAY=;
 b=Uy1i2JV1xZliwhlVBki/kbkw7H8c8d6phx86t031sf+/yqdYpZ0k+oSFeCbIyniPo/5Wr22vLBavxAfU2LLIWID/UaAvTZUP3JMgAmXWlzc371fBSY+U7StuEAi12kzazeaLIljbaaYYOyOHilnAMv+9czzmgcwFr7Xl8DGIIDc=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3746.namprd10.prod.outlook.com (2603:10b6:a03:1b5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:01 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:01 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 12/29] vl: helper to request re-exec
Date: Wed, 22 Dec 2021 11:05:17 -0800
Message-Id: <1640199934-455149-13-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20385d3e-1f6f-443b-644c-08d9c5831f87
X-MS-TrafficTypeDiagnostic: BY5PR10MB3746:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB3746744C356A35164BBF98B7F97D9@BY5PR10MB3746.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sD34zostAiWWdgp+6uvH0/uZ5gJXK4LII4FYIPq5S1eDYV8tg9UMnPkzE7RNPh+YUrbgRFqGBxg73l9w8vllwM7618NbQ1aRkpYPzOR7ObLbXu5Ep+BuWPu8lTlntnQwZszSdu13vhiaayDvBJ3+JhZpNojS3DJ/H5kuacEpAxxcQVR3aPYRksbKsO2N9zD16NhAn2t1XA4AlZQJAYPqNWQWST9tT0zKogZKxo8Qppl87uYTSBhId4tM74jlLL5KmO+TjNMUdIUDRH4eSW9AURUY7ugcI6aLKBytnsN1maWNgNaT2IP0ttwk7Gm2rWX6PCl67ANsCP0/GcDjLjUWXtyMwH35C0VE0I3+21d2lBP2OZYZTLiXPhwuefGsx+oLt7JolbIeZqoFcPXnQ1ji6y+daj6mYQZUSJR7opnGh3WqNMsG6/Dl9Dm35XkarmRd07nOnHqqHyaXsZS22538Wgmed/soPKv6jMtD/LJdmNLxKd8PMfRC234+KYjDMlsKyna61bN++PLTPucaA/XBU/FvkaZRhlAZOcz+2eH4CU1CTo77iqmSCiby5CiEC1f62F3Aih5gcLTzGPi42Qyfh9M7ppNp09ZjItv0w2SpY0F4LON3yzOn494LpNjFb0tfw4Youdxab0FtbjEZ8MADi7RhQDf7OQlzgSz97MLH5LvOA4Upgu1e766lp/6hiyk8fa+lnfdF0p/9LYpt8zZMWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66946007)(66476007)(508600001)(83380400001)(38350700002)(38100700002)(4326008)(2616005)(52116002)(107886003)(5660300002)(36756003)(186003)(2906002)(8936002)(7416002)(8676002)(6486002)(26005)(86362001)(54906003)(6666004)(6916009)(6512007)(316002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pRg9n9vmOg2mudz4Kpnz5vvHffljcJe/NmOJ1pFNLRMEZRDkl8U2Iy0VnRgT?=
 =?us-ascii?Q?5Heg+4bNWRhMA6jiYKzjx+9UfrFANlgy1cK0XA1td0i3dVOJYECWNTP/9Ub2?=
 =?us-ascii?Q?0GicRUVQIwvNlv9kTRh2GQhyTtubRu/0Q+zr4Z1wNA/IZNTKoG8N+Xu65lEi?=
 =?us-ascii?Q?lXP2p6Jly0aVq7WICFgjjVg6SKkUEm8BKBnfE5z8+QiicQdi84TF5hx5rxeW?=
 =?us-ascii?Q?lFaDkACNr78ROc90N6rawWyk6IwlypXn4AYP0TPtmy2gUL0JCVRg8I21opnv?=
 =?us-ascii?Q?TF9Ci1ceSZwk7m4pk0MlQb8qkHGOheMfxjJp1cH2kzXy2eOVWUrqZXMEI0+8?=
 =?us-ascii?Q?p3VwlHWcr07XCjG7MpUqiBJ99RNWp9KQLHSSuS7org/5m9LA62xFBbUsB8CR?=
 =?us-ascii?Q?J6If9fiLeuqXBvZ0CasPhf70GHwHSQTVTG1VH5hrkjZTkEKZFuPixBgGaLTQ?=
 =?us-ascii?Q?A8YYlc8rX3N3yRsH3eoqlINcxN4fr/r6XJQlldEeOEcsg9LHoFvibdg02YV1?=
 =?us-ascii?Q?0wd8sP/2L6Lmr6OoHRpPt9wr5SXmYNfeGLVSFCo67pikyzrHgkykVh1+jH+/?=
 =?us-ascii?Q?Tkn0J6AMCs8aWyZQFdG1hpMDDqtyOR4368nTHi9tSrU5DXu41/mx3oNh3o+W?=
 =?us-ascii?Q?HaosrAoC7THnEP7NNZEn8VwxfrwiagZX8YsSuzTsaT1gyV88OIAah8UEWOwW?=
 =?us-ascii?Q?Z8kDUp4PvSZcySKzNKQwacvPizqxHUTxhnwaoiN8sBeoXHd45IuxC0FRPO7y?=
 =?us-ascii?Q?xP5ylarC79u0NNxiOeZiOxKSU+dGUDIfkt4b/ROc6ofyHVnYm5/OjjQCBm8C?=
 =?us-ascii?Q?v6ImK2kwaEn+hoASrcUmnUfbKIsPpZV7K6WvlNme/cRhqPPArdOFo3z7b1jp?=
 =?us-ascii?Q?HfZXSbMIsK5syojD25KcsJeVOM7y2wXOO0flEdSmUXKRGMIVew1RLT7ApLtt?=
 =?us-ascii?Q?1OlS05y0yvIM5x+a9UB7WqPH6xv4oDt76Dpfozqk5J6uTr6cW0nuqUaQKimp?=
 =?us-ascii?Q?jgqpjZO+dEg5BARVB01OJwGfe7Lu0sTL72r8Og+Dbs7R/XbdWAbQa90Euldn?=
 =?us-ascii?Q?OCj0TCjVZmzfklyUfrrb7yUWZ1+P2KDVJyr7ez1I8X3MFbGXmMKtO7sya2r8?=
 =?us-ascii?Q?bW3fZK0HEwiy1w3ME/LacKNkNbwVMmruOtLEu0PIsl/lJZGbyhmbwb0E5laf?=
 =?us-ascii?Q?Y0QUDRYLcE8IflYVtjGhRgUX438p9GHU6OT3STg1HuPx8i9tZ6zwPVqF6o50?=
 =?us-ascii?Q?szQVOrHkXo9UUAe682ARThwZozjbjQZlDBy4ougYOjmgf/Yq3Lmso1bztOoK?=
 =?us-ascii?Q?kyDcb1sl1mEVowtthLV6SmeTmHp7AG+tdHzgmV9SQEUbbWDqwfmRWZV2k6OW?=
 =?us-ascii?Q?kX7Yt20y2rIl35JJeNNyl/i9r0BdF6IGuMPcBtgU7KM6EF4+RDjuTT/PQte/?=
 =?us-ascii?Q?FLZ8ZjmN78dOziuZ4V1huSFL7KtN/T64aZ0or5EY/mpz386NbRYmvP9vLir9?=
 =?us-ascii?Q?+K0sEhFFFq6w9jV9l90k7+ZxL5b4buCT3T/PV+MH1A6HzmQNcA0ll4kMAQxV?=
 =?us-ascii?Q?vzHIi2EDxIQO30qQvWUkiHZBmnYjFFEHitn8ff4oHic/8+i9Cfd653xuZ5ZK?=
 =?us-ascii?Q?qUZ1VyGoFdnInECMWcnU8HvyJWGvy4E44t2mgVvnoSXtHvlKXQw50aH634Cf?=
 =?us-ascii?Q?5WSEKA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20385d3e-1f6f-443b-644c-08d9c5831f87
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:01.1240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0WTCX2IE/vFC5nw9OiBXORn1fK57yvUrDSmkzEZZaSUiY4ElqlDDCC2KKU6wif09C2ztuSAn/Jr+MmsjXypBsCN9NdmhvjbEL6PI7+CP1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3746
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: fN7Io5OyRsvEslpXSdNYOh57C6GugG6A
X-Proofpoint-ORIG-GUID: fN7Io5OyRsvEslpXSdNYOh57C6GugG6A
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

Add a qemu_system_exec_request() hook that causes the main loop to exit and
re-exec qemu using the specified arguments.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/sysemu/runstate.h |  1 +
 softmmu/runstate.c        | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index b655c7b..198211b 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -57,6 +57,7 @@ void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
 void qemu_register_wakeup_support(void);
 void qemu_system_shutdown_request(ShutdownCause reason);
+void qemu_system_exec_request(const strList *args);
 void qemu_system_powerdown_request(void);
 void qemu_register_powerdown_notifier(Notifier *notifier);
 void qemu_register_shutdown_notifier(Notifier *notifier);
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 3d344c9..309a4bf 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -38,6 +38,7 @@
 #include "monitor/monitor.h"
 #include "net/net.h"
 #include "net/vhost_net.h"
+#include "qapi/util.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-events-run-state.h"
@@ -355,6 +356,7 @@ static NotifierList wakeup_notifiers =
 static NotifierList shutdown_notifiers =
     NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
 static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
+static char **exec_argv;
 
 ShutdownCause qemu_shutdown_requested_get(void)
 {
@@ -371,6 +373,11 @@ static int qemu_shutdown_requested(void)
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
@@ -641,6 +648,13 @@ void qemu_system_shutdown_request(ShutdownCause reason)
     qemu_notify_event();
 }
 
+void qemu_system_exec_request(const strList *args)
+{
+    exec_argv = strv_from_strList(args);
+    shutdown_requested = 1;
+    qemu_notify_event();
+}
+
 static void qemu_system_powerdown(void)
 {
     qapi_event_send_powerdown();
@@ -689,6 +703,13 @@ static bool main_loop_should_exit(void)
     }
     request = qemu_shutdown_requested();
     if (request) {
+
+        if (qemu_exec_requested()) {
+            execvp(exec_argv[0], exec_argv);
+            error_report("execvp %s failed: %s", exec_argv[0], strerror(errno));
+            g_strfreev(exec_argv);
+            exec_argv = NULL;
+        }
         qemu_kill_report();
         qemu_system_shutdown(request);
         if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
-- 
1.8.3.1


