Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22543BDC07
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:14:30 +0200 (CEST)
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oeT-000144-GM
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oKW-0002jP-5M
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oKU-00088K-3c
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:51 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqBZ5003703; Tue, 6 Jul 2021 16:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=6cGzFJW0zbMPR/3Ev2ElJmV1SpOsn9CRc6H+mQTDDG0=;
 b=qkQMvHiiXF/WbVk8IMe02Ty1x/E6GMjjBOF2oIJegrkduETApfFRn4HS/N7g8hiep8ql
 236xCVRdYoCgCQhK2nBUY1JZeur0Mb1lXeDk5v+xYnWBAwcvO0XoPScDq3MpHAucuztf
 QQ8CzsexH9o4RGRJS2Ad0FECyt43yUo+ZWI9VlL6jIgIhjdcD30GPYwOchYNuaWZ9J3q
 kBLzKbg6FWfnLgGn9Cey/h/Jj9jFGQr1hG6ytVpY92RwNKWUjyKQsF042YBvGMwC8zYq
 Dic1QkAIgPyZp3rZwpCiy4RsbOaVvguGcBAD+5Svn1OT6rG36idSJN9+ZV4uX5MaOxym 3Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m27hac5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166Go40s159172;
 Tue, 6 Jul 2021 16:52:45 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by userp3030.oracle.com with ESMTP id 39jd11nfxx-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HA5LPS9mcUT9SCU2+IVU7FJjKKooB9289LOvG0sGWW3R008wjCrw2P8qrtgHhxBXiHY7vIN3+XIaRKg92JpLi3GUQxdovZeAjj4FYhevvXJYRXRgemL7TdunGU2uHFaj8u0IEiZZWNOLgMkE/PB/yWohJaDu79AUKQWf9UPvP9UjrPLUapvbyLo6q5u+GDFMsVe5vIk/Mack9/W7G0PmtYrhITcdRpIGKODr54nzdAivuhmGtdKAAfLC750VgLGpaWMYCzYRP3/xLaEbXOcCjSaN9l4+3UhQoDNFXC33Pps/XX3jcOYga2vOQr6OB3GvL+hoXJlYJMzqaekFt1mYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cGzFJW0zbMPR/3Ev2ElJmV1SpOsn9CRc6H+mQTDDG0=;
 b=XUhSW4odmJZBKAyPRMSaySrC4XgQk3VmNNH1yfKJ3TIbrCLFF16JL1g1T+uHU1vWuA07HuvpyAOZztWUo7sLJZKs7+KJ3wQnP9Vqmr5zrFuVbEawy1OtHJ1047hV+9z/TFee4tyeK7MFFKXseVAOnjkIolMHQC4hbpGBjEyxzOfTemD4Ze8BryjA7OqbrEvCRH2VtFXs9qzYG0zaQXx07CtbUSQJaPB5dU/KpJSlocis98RPzbHq2Y7nNgB9c2nHcfq1Cv4kMnFU8M6qu+jvr7Rlm2xdV88ZB+DEX7rAfC9aEgdazgmxnyjKZWSE6jIa3DbT2eTIkKNRM4SXjSCU9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cGzFJW0zbMPR/3Ev2ElJmV1SpOsn9CRc6H+mQTDDG0=;
 b=BcFGsZ3nEXEMkzHiDpP/3MYZGgmmY8exiMvcpY3qPmWGulDoMqhaBucPmaNmFROzzAyQuxQDsY/gh8IjtrtkVc8ai7bA3fO4IVI1ViWhxJy+fCFXlA9VsCsPncBC6lhEg+DE4z18WXn+N0H9CLtxVyjyqdU1zTKPqIIEUiD4NVI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:52:44 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:44 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 04/25] cpr: HMP interfaces for reboot
Date: Tue,  6 Jul 2021 09:45:35 -0700
Message-Id: <1625589956-81651-5-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:52:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f7d44ae-43c3-4f71-787c-08d9409e7993
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB29822C6446654E2BCD86A34DF91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q5ICaFWSxkwK89IbP6NkvDaD7gdE7x6pYhGHj4PE6zg0CuYX+jK3rIFRnQRJsdcbHyfoIrlE5Cu4jD5npb6mqINy0l1PAf737xq+MCQa2mZqrTA2m1d7WtDGv3Cuht560Rww5fZIDxbBuYOAxJY0hCJXm7Q27tvJZR1/9coGn8CemPpGixHIFVNUEFWGtEHSux+GkuMst6bby1LkYPAHnb8I5qMHOApBP+sPgvzqBHG0HJ8JRg+42ANG6ujOFEHA1xZqH/bgg33XFAt2kwEFukhowxOz1lJbdf86QvH1SFMqmakuuk/AxVVYFxZJOxpIU4a7zHiDNr81QesXK4QKvSdbm3pdJH5LjXnU9CRhjIkBZzCKg4DvbiJU3UnAjPoOPYOL5ig2T2BiFA4XUAb/j5SedEFF1QugsiOCa3wl0hRG8Foj5Z9mDufuwdGe5SfpGC1XWG+mNdJLTGBOHdoNUAd5THIrgnMQ3B6a9ZBAJVAyjO+hj5JU/pcw1eczevYmOzv56NAC4QlXTeeRgLraUO0kBYIPtNglGbDekj0ZTuysNuCz7RZBOBJL4I0ZAlHzfCLzrot8YN1gGnd4hxzoOGKrshUyfa6CCwAINGgFjUJWLMeeZJj45TqbCbC+Yhyl0u8VM69vyxZoIBP34VkXsPVr14Vogmq/QBdN4xR9ac9RjeT1tK4rjsZJt+Vb/CHSlcdNik0yEnxN3WPf1sWKtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(83380400001)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FVpmgn6VVgMZS5zqnH2V8T/sFFOPAMBB8OH/NJeSDbOwVON9g+jbferEbXnX?=
 =?us-ascii?Q?mG0+C/yBD4UPd36PhDLtrQYnuUGWq+SjA55fslX2zq5WZi7qRY6f5k41JGyL?=
 =?us-ascii?Q?1Co/Yk9IWfJfINek57zk+6LVKitQWss6MH0Zxa7I2I+lfERb0bwEGDcF8ZuM?=
 =?us-ascii?Q?IB0tgCO0vaF8vkS/flafo29sD6jybaP/Mr08yIlxONvXSEVPQn2tfwG0PCpM?=
 =?us-ascii?Q?c/EkCL4hPbmmuIEeoLHezt0S6h1SqehrWDVWVzJlGdbeifa/orMqnSPmutXD?=
 =?us-ascii?Q?/f4IOWpsK/YXneabFWM72Y+eO/NljYItqaGCBQxJGZ6JX+a2GAgbKDNtFxwV?=
 =?us-ascii?Q?z3c8rqF14I7UdIfa7E6M/CGVeH9hL/ZZUsYIUFfqhVepYZotZd+gNBi3rav9?=
 =?us-ascii?Q?VdqAn+106omsV7nxFRSc3KHo/Gwt+mQsk0TTU3zUfeFdSIZ+7G3QwfNZbrpt?=
 =?us-ascii?Q?NV6i1nxOTJvnxIqcFOilaGdsTpJYPLsIXnoylz3aPfKLNvyf30brB5rCEUHh?=
 =?us-ascii?Q?NMyWJ95vSVick5Cdveea6bLWjliuM0ZEPx7l63RYFIg+1WUVj37N1LUPg1Eq?=
 =?us-ascii?Q?wGb3ycmuFxFCiJNm1N9zzHp1DTS3DDwRSQpBeR0Ju2JNAIfiebea4ElRehFi?=
 =?us-ascii?Q?OwVMREBbUGdqYgnx5S/Rvmz2btfDu9Ib+aql8EHNTKABQxXLnfU9Jof7Mtwc?=
 =?us-ascii?Q?LzRBRn6qOpLeBuLi51/69EgDPngUUhmzZfkuhLfEFXERZyrR6GZQtcTOD1hB?=
 =?us-ascii?Q?izqKRXGE6rbiIvSS1Km0QMP18azdFhIUPgQ9hi5Qkz7BtjJkkAe5P9HrvCpp?=
 =?us-ascii?Q?Y7W5ga4RyywTtJ/Tp42HpjBaNRreOgkDF2lg3qwqLfU3wr4sVIr/IHf/3zsA?=
 =?us-ascii?Q?UQoYiSdxEJsvFSTTZIbkZ5ToE2Rw/csnFXVzyqcsnx0o5TvB345eFeSlbdIW?=
 =?us-ascii?Q?X1BGY5lP4RRXX+dhzAq0f1nhFUYCiJ8eONhPRD7z1UAsvUPhfsZ+hRs3xQwJ?=
 =?us-ascii?Q?EkJGy8BmAZTnTEEPF9qBmMj/DbQGlco01n1E33HNs8Pez5/HTB41kMZUp1z1?=
 =?us-ascii?Q?VtCofL/7cQvunXiAEjqGZlMFROzBk3qMUz4alsd5E3aW0UubcXxV7WO0V1q1?=
 =?us-ascii?Q?pSKj3eW9FcjKYqtNKwALMnNHpR6XJGZMgsYwz7Nk/0JGbmiq9oF5G3vVAw4+?=
 =?us-ascii?Q?nQHSH4PthTHwYaR4OER9FBOn8Avq/+QWtJfWuEoji/T82WTPUGnx1jV2Zj2o?=
 =?us-ascii?Q?hwa7d8VfPH1UAwvoF0CHNQAr6Fh3yYRUnWiqY/darFrOFSRdxmXTYDRa6LrY?=
 =?us-ascii?Q?n25IR+5dASKEFwRh5vPNpaG6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7d44ae-43c3-4f71-787c-08d9409e7993
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:43.9373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neav8aTDeYocRel5hbtY2Jjcg2HLaVR56CwVymt2+8j0BuhUg567vO7yAfbInEo7r2SJaOWoyTBic9xBP3aD4NQNRc652NPdWTbMROggD6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: SgxzhBxJDbQtoF3T5Lz83EnqB90qr7DN
X-Proofpoint-GUID: SgxzhBxJDbQtoF3T5Lz83EnqB90qr7DN
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

cprsave <file> <mode>
  Call cprsave().
  Arguments:
    file : save vmstate to this file name
    mode: must be "reboot"

cprload <file>
  Call cprload().
  Arguments:
    file : load vmstate from this file name

cprinfo
  Print to stdout a space-delimited list of modes supported by cprsave.
  Arguments: none

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/monitor/hmp.h |  3 +++
 monitor/hmp-cmds.c    | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 435c591..015faae 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -351,6 +351,50 @@ SRST
 ERST
 
     {
+        .name       = "cprinfo",
+        .args_type  = "",
+        .params     = "",
+        .help       = "return list of modes supported by cprsave",
+        .cmd        = hmp_cprinfo,
+    },
+
+SRST
+``cprinfo``
+Return a space-delimited list of modes supported by cprsave.
+ERST
+
+    {
+        .name       = "cprsave",
+        .args_type  = "file:s,mode:s",
+        .params     = "file 'reboot'",
+        .help       = "create a checkpoint of the VM in file",
+        .cmd        = hmp_cprsave,
+    },
+
+SRST
+``cprsave`` *file* *mode*
+Pause the VCPUs,
+create a checkpoint of the whole virtual machine, and save it in *file*.
+If *mode* is 'reboot', the checkpoint remains valid after a host kexec
+reboot, and guest ram must be backed by persistant shared memory.  To
+resume from the checkpoint, issue the quit command, reboot the system,
+and issue the cprload command.
+ERST
+
+    {
+        .name       = "cprload",
+        .args_type  = "file:s",
+        .params     = "file",
+        .help       = "load VM checkpoint from file",
+        .cmd        = hmp_cprload,
+    },
+
+SRST
+``cprload`` *file*
+Load a virtual machine from checkpoint file *file* and continue VCPUs.
+ERST
+
+    {
         .name       = "delvm",
         .args_type  = "name:s",
         .params     = "tag",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 605d572..e4ebdf1 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -58,6 +58,9 @@ void hmp_balloon(Monitor *mon, const QDict *qdict);
 void hmp_loadvm(Monitor *mon, const QDict *qdict);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
+void hmp_cprinfo(Monitor *mon, const QDict *qdict);
+void hmp_cprsave(Monitor *mon, const QDict *qdict);
+void hmp_cprload(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
 void hmp_migrate_incoming(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0ad5b77..e115a23 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -33,6 +33,7 @@
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-cpr.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
@@ -1173,6 +1174,53 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
     qapi_free_AnnounceParameters(params);
 }
 
+void hmp_cprinfo(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    CprInfo *cprinfo;
+    CprModeList *mode;
+
+    cprinfo = qmp_cprinfo(&err);
+    if (err) {
+        goto out;
+    }
+
+    for (mode = cprinfo->modes; mode; mode = mode->next) {
+        monitor_printf(mon, "%s ", CprMode_str(mode->value));
+    }
+
+out:
+    hmp_handle_error(mon, err);
+    qapi_free_CprInfo(cprinfo);
+}
+
+void hmp_cprsave(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *mode;
+    int val;
+
+    mode = qdict_get_try_str(qdict, "mode");
+    val = qapi_enum_parse(&CprMode_lookup, mode, -1, &err);
+
+    if (val == -1) {
+        goto out;
+    }
+
+    qmp_cprsave(qdict_get_try_str(qdict, "file"), val, &err);
+
+out:
+    hmp_handle_error(mon, err);
+}
+
+void hmp_cprload(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+
+    qmp_cprload(qdict_get_try_str(qdict, "file"), &err);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict)
 {
     qmp_migrate_cancel(NULL);
-- 
1.8.3.1


