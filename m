Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34DD3E3198
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:16:48 +0200 (CEST)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC892-0006Ud-11
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85Y-0006Sd-9H
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:12 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85W-00042z-Dw
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:11 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MAQjC021183; Fri, 6 Aug 2021 22:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=r2JbS8VYeBYPsfVg51cUNnmcVJkHDu497NEB/cljIYY=;
 b=q5ZFmmamYVbfUTygy7ARii2xcUJXc4sbVm3ZvR3+j0qoXqQnFn737Kbcw7+ZSQV1nIrZ
 Zvgdbk62x5Q84YvxD2Sk65L3HBZRPKkLZranNKk4/XjBELoOtZYch0L/v2uFe3d60nPq
 qGkZwRm04DltsbW7f7slOO30IE6zyR32w5u3aSgHyZwyTVv34LDs0vScrf3Rnb5zEfTV
 cs10oZu0bSqAPtKJJ55QgiL+etgyiZVpmhkhXqqR4kazyUS+1ttAQT6e+95VQ9v1QWf4
 LmREhCLjCdn70/s0EV6XH9tNq5DUef0jc20jvvxgEEapu5E43XWaT31sHwAbrd+hYGGd Lg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=r2JbS8VYeBYPsfVg51cUNnmcVJkHDu497NEB/cljIYY=;
 b=Bg3JrJQJKpxVFSZKadGOjy2NmhEtJ1mizi1obH3PbCCnW2XR+jz+KDBhiMrs4NwiDYX5
 GhvRrh/1j4MfPR8UV8yIc3F8Op1Lz7MyC3qSrbFVSVWWMl+pqnbhmeAtCNet/xrC9RjG
 uZ4D3u2NiUWxPzwYafRzygTzs4ElLUoNPBV3Xqc/1Mb0wy4x7fFA/NrqbnvvdCtW+lO5
 y4Hk0Y2H653SkQwBPhlihVKESjDRBEiPRcDYtvHvaIHbYGOqws67wh9N3bgJk5g2epNp
 9J0toOOTtiqjj+d5rEN9y7fbbSZKVTvvyhaiGqqbua3fio1GTV7lobVkdNKMMojwrkBF fw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a97hqgrmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MACpf083117;
 Fri, 6 Aug 2021 22:13:03 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by aserp3020.oracle.com with ESMTP id 3a7r4caxv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUsSJwO/L/4MH5zHmyPnTSbEHxGpTphc6g6NjFpRE9I/TjaPgdWZ12HjQ3x6b7BuDqWvZWfLI+XRFpisGKzBpfv1e/kXvXg5PRYAAfFy+ImSbTTj1cSAlBgHJbCXJSBT9g/lDjg9L7KQqSVfYugKam8cfoQyT6OLwHqY0qG6Sj5pQ+KLDGhfXBnXDb0xXQ1MwFulkNCidNYBzrq9k+2utB66DIMdHT+ITnAsOntlvnRSXe1dDX/n8aYZsME7kVSaxHsUbwefp2Jcopn3Jlgpo2fS/HVYw2V8HdIyWaz6SZIlfm9iBhsyGrSbCF8IPRcMj5E/x0nlf7oI1WdsRjvhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2JbS8VYeBYPsfVg51cUNnmcVJkHDu497NEB/cljIYY=;
 b=EADMWl7SkrCLDkEeTQzGIPjXEyMxGvQgA3KFQECso3Op8jauJmCKSQegY677bi2nmh6fv0+TU47fKSA1QjU+dBCHpXgFF3MlXAr1ZskBUaX+PQoCCMv4/e6x8lIsqIakftixlYPJbtM8WB/6378iKkfVb/jdBwWSnIFBQ1MF4pJD/tibYie7v44/XdHCqZQiUFpE09LEyA/OD0y/3/I3sEkD7/jFPdrNMGuN+DW6t4FtTTrokcovnPBsm+Vfdq13j4U1NtP34JgBNYI3i79Oldd9YepBrDUS/kiTFO9Kdj2C/PCgoVpS5RryG/vibcmJJeJEBlOJQrsWLRfA23mSDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2JbS8VYeBYPsfVg51cUNnmcVJkHDu497NEB/cljIYY=;
 b=HGJFSfQxJ+7sG0FWa002g2hl2ILeXScCQzXgzlenYz6PVWgkv8qdceJZ/c2hCPri/DuQctSHtj8Dc4DAsMVeCo9alcYrDORFTedUhmhHN10y6PMN1pf+tF9Uc1B2B0kb49wxO0DZ1mKg7MtBsNECmf07+oNgEUbISvEdypsAXLQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 22:13:02 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:02 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 05/27] vl: start on wakeup request
Date: Fri,  6 Aug 2021 14:43:39 -0700
Message-Id: <1628286241-217457-6-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a704647b-cf79-48e4-d6e7-08d959275b1b
X-MS-TrafficTypeDiagnostic: BY5PR10MB4324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4324854241A4C9BE3BAED892F9F39@BY5PR10MB4324.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kpu9SM+zHHW6Xr6ckOJ/Rql/ZkEVg8XBf22V0fd+h4Y7sezrN63JczuYKDS7PEG1pV+qMGmibIS/rRk+f/absvrF/ox6YUrvEUurtwFDeR8tVPQ1lJaOtw63ibXXTVeAIWsx88FfEd2QZt7bpIPxUg9Fno05nf8knsabruumuBL9xmxkf6+zJprYLDrAmQq6ImivArXg7PDN+POUnGxcLukrgLc+k/ZP2QPzaRswWh/XHcXaKIkPC8+joe1Byn/DTDPYvhcZmXUAnaFA64fXm13Hs38m1t/Cgn9MGL2HsOFnU/wzgG0Zfy4+1VAApD2Ox7DPnjQq56/+3/wnd81JogrYm/bA9N8VChQ4QoY3/iD4o/roTrw9amGL9PC4Xs1hn4r33/KzPyx1PK6ABI7vK9UZAWS4lB5XzBH2fx58BSU108q002cb04IOjNKX2UIVF6M0AcpKjRlXXHm3pMUqNTotrLu7OPPItOt6K76yiXZbh6vNSQoY/pNpV0fcTpZ0v6s3NXSoqMfZzMZ8NlpzrIdUzNuiSqVdZapVVpSpcNv4u31et7r3+vhe0GoQ8dgYMrpjShdkK9um5JfkGY6SlkNz1SaGa/Og6ZKRbFKsVUtxA/mh5H3Z6NTvE/YUHncA4BC/JtuagY1M0ueyfQcTAkSAHw7EXk8lehBOihgfp1w/VzzWDM2mOBwsdvUj1o98uJNgXULNtNQQ+JyJUmzJxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(6916009)(2906002)(36756003)(956004)(107886003)(7696005)(4326008)(83380400001)(7416002)(52116002)(2616005)(54906003)(186003)(86362001)(66476007)(66556008)(6486002)(66946007)(38100700002)(38350700002)(6666004)(5660300002)(8936002)(8676002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FtjRJyLMFEaSfOWKEg+d9W1lqzyQp3v6Hq+w5X0rkzV4pkIuM9IScjYHqxLQ?=
 =?us-ascii?Q?arvhZ5reSSXaUEuhoqolUmhOgTRwdXVXn/crgUI8wvXxbancLxSTA9BGWvab?=
 =?us-ascii?Q?EpZ4HnBAjbM2dlDoPAsFU30CUB8AFISR2ztQME4YsTrGNGf3VL4VeP9xS9pV?=
 =?us-ascii?Q?cwYvXmIULfXQr50dkIsRu0xoPSG88Caw/5o3x/xPnK6F2QieoDKQZMtlkX6L?=
 =?us-ascii?Q?YGOkcDMbTHZ6TxMr9+rGbD6fjXYMtiZbsaGYqLr/AzLxSP4whfQa7lRg/XUY?=
 =?us-ascii?Q?vsU3HW5Jxdzcb0TpmnPvF/COKJtK1Qmupzb1fIydOnUQM4G3cso6vKZfspTa?=
 =?us-ascii?Q?pm4APzKe7g1vwPlrshYAwUXijpo/RjK462wU/yAy8Rtc9FHiQPtzjOcmbi2o?=
 =?us-ascii?Q?2CNh+ulF2joe0MG9if41pGHE0oRAuNQDY7Q2NnVPMAQXWJe3dovGutuiiYYa?=
 =?us-ascii?Q?j9BLn/byb4aPxQXcni8VtHcUsVRL564/x4QiJ9iXoYYDPyyzwqZN/KbLjyKK?=
 =?us-ascii?Q?8xu7VzG9RWR/bb4U44oJV/nF10uMWn3sly6f7LlWLD0IWUEStswmZO7hcm2e?=
 =?us-ascii?Q?fTYmGbpho4dq5lzCM8v27Z5P+b6qISgN9k7EFf/GHK7u+kmEHkDbZbzy5QXf?=
 =?us-ascii?Q?IOa3WK8vL7k7KEQpXRKTi4HQiOY9qoi5wNdAmK98fcDk8EcgGcfWLRu0omAS?=
 =?us-ascii?Q?QTHP0EiU8cR9x25hnTaLffuFvPSe5mw2hIHdy5sWTrA0LIbqFhMftLPkJS1r?=
 =?us-ascii?Q?bXs+VFC4JbnQ5y9EZB2jOs76eeskbTEiuQhEAZVB1Z8Z4wLFzQlupvn1WNYz?=
 =?us-ascii?Q?eh4JCTukqcMr83jI2KymYNu4EgTLsDutz1TbqJ/c+Bd34kYIs0a3zNqwi9/+?=
 =?us-ascii?Q?jNzt2NLAIbjZTisljRGv8jmKMDbK67PpgncsWWQnlZGo1hzJL6RD3RHyKr3p?=
 =?us-ascii?Q?tC0qES7rAqxY0/roZLSQ7OYGSGoUrNCfcSoMpZMcOMmJ3JXu2mT6J6GDyhCl?=
 =?us-ascii?Q?tAOS6YpJg+j9ioLpzzohSqFkO8XbM1mrbiWFQIzjvB9316Zn/coWU2xGJnk9?=
 =?us-ascii?Q?diAgTL7dC/x2qfMhjCUJlNxsRK3ltBhV5K2f5pPHCSqngJnt+vzYlbJ7n7HC?=
 =?us-ascii?Q?ZLANVictkhNSPLHQRjs+R+7NzsCpkukVYoRWTCK1if+IL5gAn5ns3TCh5kn1?=
 =?us-ascii?Q?AoubhwR6rqH1saMvcrmhX7CykBB9xnC5TUoIwtlgKTyW1jlo1NXa9G0OJoms?=
 =?us-ascii?Q?cok19IZv6xjP2atU11TZjUSBS1yVjRJtmbHbnbWfuvcs5+CYr8ie2rfBX4Vz?=
 =?us-ascii?Q?209LRluY2RAdIjNonp6F+VYh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a704647b-cf79-48e4-d6e7-08d959275b1b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:01.8052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuhWc5x0iaid8TECBiAX87ggh6MXKTT51No8WLKMn9bdJzq7z9B8/vRzOK4s0p0+oVdkKWHDj09BFxftvoaVhqZrlWqJuc7SfRRMqQV5DD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-ORIG-GUID: ogwf-WNlAcHfWbiJLP7KeEKOHSSyr3ia
X-Proofpoint-GUID: ogwf-WNlAcHfWbiJLP7KeEKOHSSyr3ia
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
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If qemu starts and loads a VM in the suspended state, then a later wakeup
request will set the state to running, which is not sufficient to initialize
the vm, as vm_start was never called during this invocation of qemu.  See
qemu_system_wakeup_request().

Define the start_on_wakeup_requested() hook to cause vm_start() to be called
when processing the wakeup request.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/sysemu/runstate.h |  1 +
 softmmu/runstate.c        | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index a535691..b655c7b 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -51,6 +51,7 @@ void qemu_system_reset_request(ShutdownCause reason);
 void qemu_system_suspend_request(void);
 void qemu_register_suspend_notifier(Notifier *notifier);
 bool qemu_wakeup_suspend_enabled(void);
+void qemu_system_start_on_wakeup_request(void);
 void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
 void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
 void qemu_register_wakeup_notifier(Notifier *notifier);
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 10d9b73..3d344c9 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -115,6 +115,8 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
     { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
     { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_PAUSED },
 
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
     { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
@@ -335,6 +337,7 @@ void vm_state_notify(bool running, RunState state)
     }
 }
 
+static bool start_on_wakeup_requested;
 static ShutdownCause reset_requested;
 static ShutdownCause shutdown_requested;
 static int shutdown_signal;
@@ -562,6 +565,11 @@ void qemu_register_suspend_notifier(Notifier *notifier)
     notifier_list_add(&suspend_notifiers, notifier);
 }
 
+void qemu_system_start_on_wakeup_request(void)
+{
+    start_on_wakeup_requested = true;
+}
+
 void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
 {
     trace_system_wakeup_request(reason);
@@ -574,7 +582,14 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
     if (!(wakeup_reason_mask & (1 << reason))) {
         return;
     }
-    runstate_set(RUN_STATE_RUNNING);
+
+    if (start_on_wakeup_requested) {
+        start_on_wakeup_requested = false;
+        vm_start();
+    } else {
+        runstate_set(RUN_STATE_RUNNING);
+    }
+
     wakeup_reason = reason;
     qemu_notify_event();
 }
-- 
1.8.3.1


