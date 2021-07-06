Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647413BDBD0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:01:03 +0200 (CEST)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oRS-000111-E6
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJg-0000Xa-OQ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:01 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:13540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJe-00083b-21
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:00 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqGfl003973; Tue, 6 Jul 2021 16:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=NyvYcm5yWnxH/0ptvdnMkvwzCcKKLeTYdU9GCrQo5bE=;
 b=dJxHV+JeXmXjXFvDSMHI0u//vbzjabMcDdWxvnvZDNgJHGM1IUEwnIAvq7daxphtxDhk
 eao+C1iMLIclUL2DLnyoEtt8h6ksC0IvllbiHLtD7gmhnCBhf1+u0vunUt0AQJpuJzk9
 kzTZ1yO4EQPtwosXbfJqmb5eDx2yYWjE1S9cJMJQJw92RnN6t0wuq/nu5puFv2R+osBe
 QvfXs0p7RgGWfZrmpezklRTiPxEQ+5XIYtItyS6xREkpTomrmrs/X5Sxr2x+LmoirQLl
 3GFQGZrZQ5jKvaHYQuuj7s9CdMuCCPJlAQIn7f7dRe5iXW/B6W4c/ryKooOgq9WyP9lG 7g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m27hac5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoVvu084749;
 Tue, 6 Jul 2021 16:52:53 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by userp3020.oracle.com with ESMTP id 39k1nvcq11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb2c1tAVJcsEUmzYK1Xgw1WsQNW/Is8RYtf9wxU+PA47FyhMZ0YJfgAhAhkt7x9xB4UZvpSgDc4/4LajcTPIwcejLtO7kjGE2LYiZyOn+81tsk9PZ99qI2ywSGOzk0mYt67whUhc/W4v8xyKRgAo8Zem1jiaoehPIMRIzETM074x1iKmv5BJBvoutZdY7CFoTB8S6RGt1nRbcjaxTqVcR5bQD1X2G7gtiMdcNjx7tfWErE4ZesUF8PTEjJQCprb2YIQzmY8C+Vgy+VH25NlgXhSNMKaYJiiFvusD9L4SJPrRuxZisNm30oJGZxDdF6Zs6clsaXuin4gaHp/TdscyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyvYcm5yWnxH/0ptvdnMkvwzCcKKLeTYdU9GCrQo5bE=;
 b=E91OhG3zxbj96W+jvLcDzldoB0wGPcCL8KuB4Fqv8LMbVnTuRhIpJ+MdsJmp5jRD93JHtZLZq+FeZwlzsFOyyn35sa4hRFCfTITWFH2pYyWJHyQULZxO5iUwme3T6UttiS8bZEcLdbwLE8LAvZ6WhNDh0lNk/DSqulCMjv7QpcCj4mHUXS+NV5aFVvNETuh5eWxf6fErKXgaR6UjXRGAedQopTnGmm8BYa/9fX7FcSsfGXtf8/FctDIbT0g+ACyOI15TFaRKS+0DAPUJSxe+VpHCVghvXcifXEvPmdGZ+PX0eowrTiM5eORZePLJDoCOv4CELTCqw6VJWkzfnWfZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyvYcm5yWnxH/0ptvdnMkvwzCcKKLeTYdU9GCrQo5bE=;
 b=Y6zKnlSo/CJ/MliQkBrBQ53AdyzFWnVgoOvzwICtGhYLytoyI4ySuzofEHjyleWbY02iQCCaf7qwTVQYdrb4YgYw4YA+UdLA/JbzJhhXqALxMfk5EVQ29Nnv8VkDU43ghK/W7TnYfowaH+1/Is1972PtAqBu5hEeIIVy/TUOu14=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:52:51 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:51 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 08/25] vl: add helper to request re-exec
Date: Tue,  6 Jul 2021 09:45:39 -0700
Message-Id: <1625589956-81651-9-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:52:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a4bfc95-041b-4156-ee8b-08d9409e7e01
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB29822D989F7964FB6C4F05B8F91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QGXElUH08q41NZeZ4ko/yvySxTi+Kn4+BU/VRJ/emgrldQ81nMauY8wZJkEDa6m1vSYRsyHNOdafnSZA7w5A/OMlPy7oDtb1fl3HFdJVJswsGMQyllUU8wTEd2amb/6Z2wlSU2IH5SMnitDaVjgKHGxH/k/ARNDltnhz4Y0ngV/ekXmQaPPX0Qaw5i72Czax6jGMTCo4prtDMmYCIkCKpTNcXMog0H4Utv0gtu14jVt/0gUtbfoO0/yPBdUYh0zwln0jvOt/L5sgtgcLVQIi1uBl/X6HoawLrbk20/3tFJ9KKJ7EPtsc7BU1Jy1aWbAiNfeBv9GxlB1NiZpXxu+0jsiKbRPRwjaGbs1UepSWhTMAUaiHnrF0V7rZBn73MmkJbe/At1VL/LTieQjzDBG7PyN5qIMnoVDOCL9JdgaL1U7yBdaCPgl4R9WVyrLBWs+nAAMmMAnF/Eo7Xr52rOZ3YLvJ3bIpFk+hXyaEVwSF03UuMpBNjn1EISoDi5C0sf9Nv2pHWyN7mR5Ty+xpgfJD+26fGK1WEe2r2MqOpr5fMGL6DZwB3IIRHT0IvD74o6Na3w5jEhKqyyjmfC93FBK7961+aOY+orOQy8l5/k0cUjbE7jyubVcS++OrnsGW2zD4iVDv6bg0MomLSo0WkhXJpwe7i+28Zcx1w7o5Z6OdKQ0l7fLIsSMJedJ4InroN8OKcCQPGGukX63trwdkRfv1oA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(83380400001)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IeMQ1fX7BTqnqKrQO6op17PozRHg/xeZ3kTdpvq3kxVPMYcMpjrXK/QWFFuW?=
 =?us-ascii?Q?OpLsMX6uMjVbszt4zf9nYCC7H+mcjcwWKyYnJAPsqSR2TvYyJzVxfl0Zt3C1?=
 =?us-ascii?Q?oZIYEiexgL8Eu6clXjcwfGn8HpzFSKAigXSMiIkMuG7Fo9N6nFuZ31KZ/fzN?=
 =?us-ascii?Q?9Osvgr6sbVYy7ws/sCkSkZB22WLOg00H955h0/UvjfkX2XgVbRyZakOVz9MJ?=
 =?us-ascii?Q?djfqDJz+AK91tlqirxKtYhiPVNWf5MfVv2bPYOV3DmwFOEQWFA0eYLnkn5Cz?=
 =?us-ascii?Q?ywFC4wT9yh3fWaWFCSFKYJvLrUf65grOPlcPvD/TYd9H6ht1pDbvGTlcuEO6?=
 =?us-ascii?Q?2zKTPCnANvodroePscmMlO13jPyk/vVVhFJiWQXCLwtLBXXm7AE6JeJxRCrH?=
 =?us-ascii?Q?t78/v/+gcpZGyZrgd0EPkKlRZC0kik6wLY2hgGLK42oxWDhaZ4c1C+hRhDHf?=
 =?us-ascii?Q?Km7JHDSF8ZZ8lf/XVR0CthvxNL1iItql52w7CC2q8XCf2eiFlKGkjYs/CdxG?=
 =?us-ascii?Q?wJB1rRiBD0Rqbi4ozWJlsUzwVFpvi/yi1nhxAwNFSZ5+t/jlSNSvDYsbFImW?=
 =?us-ascii?Q?DpTo0LrzlnXeqsjXbTB2Gbh5W+/runM22MTalPXZSK24xBBoYv7VXsWSS51s?=
 =?us-ascii?Q?qm4o5GHK5NnuBW3RrsACY9JYjSRC+wdqCdscKCPyPr/42z6oXaAgTP7kgBwt?=
 =?us-ascii?Q?j871nYg73WYKjLqf1aW4IbzuGnmMoGdFooOBlOV6U2MaI2ge6fZUCqiesbd5?=
 =?us-ascii?Q?kJHuZ00xGuqbM5TrYNgOMsG9kC92QCzJCLLZeotapn7vj2IHClb1d6haisAY?=
 =?us-ascii?Q?3E5PrWVEC+4lAgKdbQNrpwmLL3S+iYF3CF02lg2J2tsGUzqtEpVHbUbpD/mm?=
 =?us-ascii?Q?ejATv6UpQ4edtZ0huh26pPSGgp5l3D+37STj5ZUtBq2/eBpvlyT5p/lc9Aps?=
 =?us-ascii?Q?lA50znWYt/UCCUpM7lf8b+Q3jCLJkyJesB5AgEmmuW5DfDUzjrAIhKUe7U64?=
 =?us-ascii?Q?amKU++a2gPUy6NfKC32XfKVINg6ZrFaS4zvdULP/7OxTxb/uA5gG87/0x9MU?=
 =?us-ascii?Q?hxon8ie71MH9QOCLp9WbZ6ysxWipC4JmU7eLsBx0Hbwmjechi5nPsKXJda+e?=
 =?us-ascii?Q?nJztC3lCD6iMjsF0mZYo3DoF3/qkBz8KDp9op3PaEcWXVNBUtmzJHmA6Qc13?=
 =?us-ascii?Q?XcDXbaObHzJPrg3wYDcjTPZ/Hz3HuVPwLtegwiOrWYppyNrFgRv55oS+RUmD?=
 =?us-ascii?Q?7uDxonaHcUaGRQHbJz/1ckyoPo/jzsSz8g7aCYMX4qdUbVrAv2FtwWATBYgc?=
 =?us-ascii?Q?hyV4IjU29zu1PoIzqGbRDf1s?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4bfc95-041b-4156-ee8b-08d9409e7e01
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:51.3681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z361ad8xjrdZAJVfhByPO+RfAXweiDG6Q1JdMm6EHybZGC7ZWnLYHNPt8fTcFbSD5xzSNzXDH9ulCD88I8qOFpNjuwOpV4FQsnwJH2Sk3X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: mFXG2mL-U_06TZyM6ZH1fO4o-2kksBp1
X-Proofpoint-GUID: mFXG2mL-U_06TZyM6ZH1fO4o-2kksBp1
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
index ccb35cb..554dfc6 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -354,6 +354,7 @@ static NotifierList wakeup_notifiers =
 static NotifierList shutdown_notifiers =
     NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
 static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
+static char **exec_argv;
 
 ShutdownCause qemu_shutdown_requested_get(void)
 {
@@ -370,6 +371,11 @@ static int qemu_shutdown_requested(void)
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
@@ -644,6 +650,32 @@ void qemu_system_shutdown_request(ShutdownCause reason)
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
@@ -692,6 +724,11 @@ static bool main_loop_should_exit(void)
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


