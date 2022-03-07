Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51924D0020
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:31:55 +0100 (CET)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDSs-0003bT-T6
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:31:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7j-0007Vh-Aq; Mon, 07 Mar 2022 08:10:04 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nRD7f-0000UV-BU; Mon, 07 Mar 2022 08:10:02 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227BtvLn028756; 
 Mon, 7 Mar 2022 13:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=b6cRhgofTg3110J4mbquae/fhanGaPcQ+PGh5VyVeO4=;
 b=EYws1TOFFyGRL2yqV4CM3ooSw5GS5XyFWMYEDYJLLum/23qX4929bHwmX6WB+V42+P5x
 ABM+OTArKxQOGVSIMOgsolOaj3qLwxgb4YYRezL3vTgmCyWKbkmlPBFTPbGKJ6+8JTA7
 WQmmZ0lEugyjz6etaXiXpi5irxrz1zM4xQBa5EsytdP188QVFTYDFJyX828D47Nj/PYZ
 CdhZak3aS3aQp24wJXrzEbcWUltR3SLjVIg88JXM2X6hN7FIkxFtDxGQPVSCbj9G5sK7
 fvFTR6uzCgezFvqxBxA/roht0PcsWfAdK4aSfuRO3wVPgG/HzmGugpWOXo33qcVj+mYZ Ug== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyfsbpgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227D6OFP145635;
 Mon, 7 Mar 2022 13:09:40 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 3ekvyth2c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:09:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+NT8hjJ1znfUBjCZIJOpCS66KpslMLnBliYLstPYIQTjrWPIweqYiqtFFXw5g41L4NqtIKcbA8S34YOgM/tKqtdIw2JoGc6dP3V+JBtgAaa6UZyVXBhMwCvKu17vZlPD8tCVvEO1InQoM6+YmsSaYGPnTT226Ig1cUfZIsJ6ASVDJ7bTDfu1MKSkrwbzmlLUcidtd8uaKusYQ1wP1CkWDJANyza7eIWAK6wo8dakwdMN7ZSuey0e1Ab+RLB3uU3+2SApAstNwm8mfkXZmyGCRQX0TgLrU8b34ronw9FsZD43TJzfRKD4C64aR+6YuASDsygGK1InoaN3ZU22kqcvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6cRhgofTg3110J4mbquae/fhanGaPcQ+PGh5VyVeO4=;
 b=M3SzSUQzwn/ntGc7B8ikKDWP5OV0HsOevzWoFdj8CcvcARyquCvlSbkt+1C2VsS6AgGEwB47jGvoxK9R6JPAh3+rf0hsH0gKgeWdXBvxUm5ZYhyRoshmErls5lHdwokRefq5sA2lK3J0ZFayujrekN1BaPNDtWQ/ucRY+ij7aK50q9ygnTan+1Y6MXrdSTAM9izwFOJVWIoI3E3SmA8ebEbcLBXYXAa+u8QoiMpDxgKsvwF7RO3hpRRB0HWRiAW0wvFacMNd9NJX0b/+8w4UUFYjgxc64f9Ul4nlHpfz33Q7ufPdDe/uBJgrawyKxlhlkUHRYgbK0W3x9UkFrjxEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6cRhgofTg3110J4mbquae/fhanGaPcQ+PGh5VyVeO4=;
 b=PKjuUCzUS0/0yggJccDajwStFPwSBUp9IIOwf2+6fCG8mwVgLiRwpqrl7loadbJB9oodZMvR4voS8AyWp0FD6kLCPbiWo88Oz6AC88GKx/6wSOqc71bZVLAVeMJTk7WyMsJfCXskoHjyqxdEFSv6gT6axCXwu+tDA6VF8wPT/fc=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 13:09:37 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::500d:126d:b54c:cc85%7]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 13:09:37 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 8/8] hmp: add virtio commands
Date: Mon,  7 Mar 2022 08:08:41 -0500
Message-Id: <1646658521-31652-9-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
References: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0034.namprd07.prod.outlook.com
 (2603:10b6:803:2d::15) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d70f5480-e2ce-4fbf-c366-08da003bbb79
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB5608C3CB39ACBC20676A9813E8089@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: id8PPUMucPGiwGYTgayKwoeCwJybIs/Y9+d81vrxReEmn3ex6rC+UFcKJ5b3wULNAYWp2dRlO5KqmMiOn/KRrF8YD8dZfRI28QjcdG/8lKtE9AUWKuJOopPecVByd0I3Kq1admRt9dcjQpPzVmEsJI8gLGT/xgMdwNMxEPKhEcI8DKnLwEgPG2wo7Olto/OWqUTiraEd5xdlM/1rXpkolpUMpNYJVzl9pD0h5tw29Y/ilEW4IuTwSkkqTc5FNmqhRFEkV6Fm0YBsCxXj5ohYTB2V0Xf065dygl8A8ggr+GtOXDDSJpZY8qmrCHtKI0wef34CtQuc2BwmHfy2ESM4d/TWZs3+eFqnipehvyZrLszy4KAoT1wJsumPzn3GsaMqQKqn63bx4FWX0Q9Vq8i3FMuIcS1oCOlj0XpfiNbNgLgAApklfmrj+/miWezVy1ywTcX0gWTdausNHR6M+bG61DQpkhRDXGq/MA+CFSkX+MlHkeFiJq71KEVlyZEQFuZMUW0R+EBSY8124NU3NIHiDKnVuAO72FcEvYtfo0viDmScsp/2+pjHe/8S1GMku81wzPHS4+qnYq4LuBCNqG8IZz11dF0Hw4Dao06xiEmT78p0mMatTe8VEmRodCWnxR0Ld0hFVjADyHAlzVSXaA8ndu8VnAHzpAoLwYH82krkQMwmnNUNgdiUI5vGXRjjmRUiW7DVpdkPKImVDd7bEL5m7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(44832011)(30864003)(86362001)(26005)(186003)(38100700002)(6916009)(316002)(38350700002)(2906002)(8676002)(66946007)(4326008)(66476007)(66556008)(8936002)(5660300002)(7416002)(6666004)(6506007)(6512007)(52116002)(6486002)(36756003)(508600001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FC3EGs+v0dgm8I6Ppbq7yi06nyPF5uSdjisu6rfnEo8paBEuLv9c9GRcvqp5?=
 =?us-ascii?Q?hCTIaCJvcT8OG9jCINim1zrjaPu7XO/2SlisxmJpleKgOuKSqSq8LpeRa9Es?=
 =?us-ascii?Q?8fI7jAnUnvElVPn/US+IQaNUdvH3mKQCZnpuVSCTdSyX71BURReVx9PMtsPL?=
 =?us-ascii?Q?piNVOHBQsvXoWnaLHp5kC/8+v/3BmybGtacua98b2UgNHT5BbYLGTj+D9ewz?=
 =?us-ascii?Q?6O9S9E0PXSptsTZA+tpWeRsvv4rhzsVsW79ENRcK5ur12LM2gYP8as5h0OIR?=
 =?us-ascii?Q?qrmrAEBxF3WPAlENh0M1xgBdQmEtM/fiaRfmhGjs9BzxqlNGpVVT/4lkp9Mt?=
 =?us-ascii?Q?oaN7kJqFFsmu4Gmazc42ileKgexT4DCx0Rq6cgTMac6abvAhgKypOS43/chy?=
 =?us-ascii?Q?PADPcLi3jRVkw4MO6r76Ik52DQ9PGlJMwfAcbobkURZq/YRJf0n9gN/KJlZ3?=
 =?us-ascii?Q?bSBZLeL6rJkHqvT2ZfsINmTVIwgXmump8c8vUINgC82LkV0og3t/clFC4RfS?=
 =?us-ascii?Q?rYkC7iZuDq39TmV0bsBi0734wM78xQdkA1t0BpZFIuaxHhDgH8aPElFElI4g?=
 =?us-ascii?Q?FYWtWPROr0KIVDmmREzhknSO7X2mXG8LqLqSQF0gDIVXPqgGTGPxkQ7wih/i?=
 =?us-ascii?Q?Wy7XXiwpht17dVzDdumUP0sxAgqYY6G5P9x53Rqbng+qgZDJllKqCzIm66yE?=
 =?us-ascii?Q?dXV+RVyBL5nGGHWEvoMdwiL59XvKU9ZAdO6uYaiH5fqdWt5oC8i/hD8uwh0g?=
 =?us-ascii?Q?wGmpBdzE+j5OhteGuU+fuFzrqyZdOl2i1gLDpqPh2dW7xixjcwUiTSmnviFy?=
 =?us-ascii?Q?acYo347xAWHMUQ2iMm9k14aCrkRdp67v8A+3HBkshq6kUJVpDk8PJevENu0e?=
 =?us-ascii?Q?sBuXvmKqee4UCulL9S7yjayfQWDCZtZs9OZrMV36Nq+znPlNLBlqU/bRqNj8?=
 =?us-ascii?Q?SwDfqeIc29VT6MWRj8xGBMpgvw80/5Qehsg+bwmS8yYYfwtz2XheZnQUq0oQ?=
 =?us-ascii?Q?5ATJqkiHVitGLvxqyYJj4a0pRGPrwGodIiRG79C9ryilCG1mnyM358zrAHBn?=
 =?us-ascii?Q?z2sEkx8kEPEg2aTADd0kdTB4/JQUFNHxyu0tjSz+GgZ/iOQFTAL4trFkB45A?=
 =?us-ascii?Q?xfURgaKWsVizQ54TAMQkbbwY34mnd70s0pfgFNlHoXUGrla3c4GCTyp3sVOA?=
 =?us-ascii?Q?OMMgn95d78Bun75fwUtek8Y2XdLTXai7CO8Q+1VqQqibVOqrG1M4CPlq/i6x?=
 =?us-ascii?Q?59dKbz+jKLqDvNXP+jCChmSroFQRuiAMp05LPlW1SYpUIoqQxxaPDt5H7L9B?=
 =?us-ascii?Q?XCm7jfa+cpvo5LZtudT7gLNqMyM6VstYII8EaXqj+zINEDClClVPDQF9FT5U?=
 =?us-ascii?Q?mtDp22nJxp8kI6C+BFJ3AnniQ5o63UoKW9QSiEU7RZLiyig5NUn7N8BR9z1G?=
 =?us-ascii?Q?CgWCCk6cCiC06IyINWyoNZolapbDxNxEBVKabZxcC1XQAAt6CYG3YNHGDb65?=
 =?us-ascii?Q?TLx9IUSRj8hDimdjtoHyWrNJdZ32prTAc1bYZA5WBNLzFsCKfB6PQIfeDrtK?=
 =?us-ascii?Q?kU5dnEAZke9qbtD2IP37i+YlW6PcKPd3BX3bP2eScaS/DVVduCzh6dz328V/?=
 =?us-ascii?Q?28+Y0nFnFVV3CwqqLHRKNL0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70f5480-e2ce-4fbf-c366-08da003bbb79
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:09:37.6454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anv+iCdC/H+QPnFf1AH2CXxfXjYvvLaAeCJbxp5yveXFXo/eNV6bWRwW0A1Mg8hodo5ltRVzVR5KcdkCM8aJJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070076
X-Proofpoint-GUID: NNkk8dxUNLqUULcnWBB91twkAEKfDzTz
X-Proofpoint-ORIG-GUID: NNkk8dxUNLqUULcnWBB91twkAEKfDzTz
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This patch implements the HMP versions of the virtio QMP commands.

[Jonah: Fixed virtio hmp command output format (e.g. use PRI types).]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hmp-commands-info.hx  |  70 ++++++++++++
 include/monitor/hmp.h |   5 +
 monitor/hmp-cmds.c    | 311 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 386 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index e90f20a..9bd1ba5 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -879,3 +879,73 @@ SRST
   ``info sgx``
     Show intel SGX information.
 ERST
+
+    {
+        .name      = "virtio",
+        .args_type = "",
+        .params    = "",
+        .help      = "List all available virtio devices",
+        .cmd       = hmp_virtio_query,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio``
+    List all available virtio devices
+ERST
+
+    {
+        .name      = "virtio-status",
+        .args_type = "path:s",
+        .params    = "path",
+        .help      = "Display status of a given virtio device",
+        .cmd       = hmp_virtio_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-status`` *path*
+    Display status of a given virtio device
+ERST
+
+    {
+        .name      = "virtio-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given virtio queue",
+        .cmd       = hmp_virtio_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-queue-status`` *path* *queue*
+    Display status of a given virtio queue
+ERST
+
+    {
+        .name      = "virtio-vhost-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given vhost queue",
+        .cmd       = hmp_vhost_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-vhost-queue-status`` *path* *queue*
+    Display status of a given vhost queue
+ERST
+
+    {
+        .name       = "virtio-queue-element",
+        .args_type  = "path:s,queue:i,index:i?",
+        .params     = "path queue [index]",
+        .help       = "Display element of a given virtio queue",
+        .cmd        = hmp_virtio_queue_element,
+        .flags      = "p",
+    },
+
+SRST
+  ``info virtio-queue-element`` *path* *queue* [*index*]
+    Display element of a given virtio queue
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d0148..47446d8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -95,6 +95,11 @@ void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_get(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict);
+void hmp_virtio_query(Monitor *mon, const QDict *qdict);
+void hmp_virtio_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 6349684..2689aca 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -42,6 +42,8 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -2221,3 +2223,312 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    strList *pcol_list = pcol->protocols;
+    while (pcol_list) {
+        monitor_printf(mon, "%s", pcol_list->value);
+        pcol_list = pcol_list->next;
+        if (pcol_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (pcol->has_unknown_protocols) {
+        monitor_printf(mon, "  unknown-protocols(0x%016"PRIx64")\n",
+                       pcol->unknown_protocols);
+    }
+}
+
+static void hmp_virtio_dump_status(Monitor *mon,
+                                   VirtioDeviceStatus *status)
+{
+    strList *status_list = status->statuses;
+    while (status_list) {
+        monitor_printf(mon, "%s", status_list->value);
+        status_list = status_list->next;
+        if (status_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (status->has_unknown_statuses) {
+        monitor_printf(mon, "  unknown-statuses(0x%016"PRIx32")\n",
+                       status->unknown_statuses);
+    }
+}
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    strList *transport_list = features->transports;
+    while (transport_list) {
+        monitor_printf(mon, "%s", transport_list->value);
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+
+    monitor_printf(mon, "\n");
+    strList *list = features->dev_features;
+    if (list) {
+        monitor_printf(mon, "                    ");
+        while (list) {
+            monitor_printf(mon, "%s", list->value);
+            list = list->next;
+            if (list != NULL) {
+                monitor_printf(mon, ", ");
+            }
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    if (features->has_unknown_dev_features) {
+        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_dev_features);
+    }
+}
+
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_query_virtio(&err);
+    VirtioInfoList *node;
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    if (list == NULL) {
+        monitor_printf(mon, "No VirtIO devices\n");
+        return;
+    }
+
+    node = list;
+    while (node) {
+        monitor_printf(mon, "%s [%s]\n", node->value->path,
+                       node->value->name);
+        node = node->next;
+    }
+    qapi_free_VirtioInfoList(list);
+}
+
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_query_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:             %s %s\n",
+                   s->name, s->has_vhost_dev ? "(vhost)" : "");
+    monitor_printf(mon, "  device_id:               %d\n", s->device_id);
+    monitor_printf(mon, "  vhost_started:           %s\n",
+                   s->vhost_started ? "true" : "false");
+    monitor_printf(mon, "  bus_name:                %s\n", s->bus_name);
+    monitor_printf(mon, "  broken:                  %s\n",
+                   s->broken ? "true" : "false");
+    monitor_printf(mon, "  disabled:                %s\n",
+                   s->disabled ? "true" : "false");
+    monitor_printf(mon, "  disable_legacy_check:    %s\n",
+                   s->disable_legacy_check ? "true" : "false");
+    monitor_printf(mon, "  started:                 %s\n",
+                   s->started ? "true" : "false");
+    monitor_printf(mon, "  use_started:             %s\n",
+                   s->use_started ? "true" : "false");
+    monitor_printf(mon, "  start_on_kick:           %s\n",
+                   s->start_on_kick ? "true" : "false");
+    monitor_printf(mon, "  use_guest_notifier_mask: %s\n",
+                   s->use_guest_notifier_mask ? "true" : "false");
+    monitor_printf(mon, "  vm_running:              %s\n",
+                   s->vm_running ? "true" : "false");
+    monitor_printf(mon, "  num_vqs:                 %"PRId64"\n", s->num_vqs);
+    monitor_printf(mon, "  queue_sel:               %d\n",
+                   s->queue_sel);
+    monitor_printf(mon, "  isr:                     %d\n", s->isr);
+    monitor_printf(mon, "  endianness:              %s\n",
+                   s->device_endian);
+    monitor_printf(mon, "  status: ");
+    hmp_virtio_dump_status(mon, s->status);
+    monitor_printf(mon, "  Guest features:   ");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:    ");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features: ");
+    hmp_virtio_dump_features(mon, s->backend_features);
+
+    if (s->has_vhost_dev) {
+        monitor_printf(mon, "  VHost:\n");
+        monitor_printf(mon, "    nvqs:           %d\n",
+                       s->vhost_dev->nvqs);
+        monitor_printf(mon, "    vq_index:       %"PRId64"\n",
+                       s->vhost_dev->vq_index);
+        monitor_printf(mon, "    max_queues:     %"PRId64"\n",
+                       s->vhost_dev->max_queues);
+        monitor_printf(mon, "    n_mem_sections: %"PRId64"\n",
+                       s->vhost_dev->n_mem_sections);
+        monitor_printf(mon, "    n_tmp_sections: %"PRId64"\n",
+                       s->vhost_dev->n_tmp_sections);
+        monitor_printf(mon, "    backend_cap:    %"PRId64"\n",
+                       s->vhost_dev->backend_cap);
+        monitor_printf(mon, "    log_enabled:    %s\n",
+                       s->vhost_dev->log_enabled ? "true" : "false");
+        monitor_printf(mon, "    log_size:       %"PRId64"\n",
+                       s->vhost_dev->log_size);
+        monitor_printf(mon, "    Features:          ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->features);
+        monitor_printf(mon, "    Acked features:    ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
+        monitor_printf(mon, "    Backend features:  ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
+        monitor_printf(mon, "    Protocol features: ");
+        hmp_virtio_dump_protocols(mon, s->vhost_dev->protocol_features);
+    }
+
+    qapi_free_VirtioStatus(s);
+}
+
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtVhostQueueStatus *s =
+        qmp_x_query_virtio_vhost_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s (vhost)\n",
+                   s->name);
+    monitor_printf(mon, "  kick:                 %"PRId64"\n", s->kick);
+    monitor_printf(mon, "  call:                 %"PRId64"\n", s->call);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %"PRId64"\n", s->num);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->desc);
+    monitor_printf(mon, "    desc_phys:   0x%016"PRIx64"\n",
+                   s->desc_phys);
+    monitor_printf(mon, "    desc_size:   %"PRId32"\n", s->desc_size);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->avail);
+    monitor_printf(mon, "    avail_phys:  0x%016"PRIx64"\n",
+                   s->avail_phys);
+    monitor_printf(mon, "    avail_size:  %"PRId32"\n", s->avail_size);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->used);
+    monitor_printf(mon, "    used_phys:   0x%016"PRIx64"\n",
+                   s->used_phys);
+    monitor_printf(mon, "    used_size:   %"PRId32"\n", s->used_size);
+
+    qapi_free_VirtVhostQueueStatus(s);
+}
+
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_query_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s\n", s->name);
+    monitor_printf(mon, "  queue_index:          %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  used_idx:             %d\n", s->used_idx);
+    monitor_printf(mon, "  signalled_used:       %d\n",
+                   s->signalled_used);
+    monitor_printf(mon, "  signalled_used_valid: %s\n",
+                   s->signalled_used_valid ? "true" : "false");
+    if (s->has_last_avail_idx) {
+        monitor_printf(mon, "  last_avail_idx:       %d\n",
+                       s->last_avail_idx);
+    }
+    if (s->has_shadow_avail_idx) {
+        monitor_printf(mon, "  shadow_avail_idx:     %d\n",
+                       s->shadow_avail_idx);
+    }
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:          %"PRId32"\n", s->vring_num);
+    monitor_printf(mon, "    num_default:  %"PRId32"\n",
+                   s->vring_num_default);
+    monitor_printf(mon, "    align:        %"PRId32"\n",
+                   s->vring_align);
+    monitor_printf(mon, "    desc:         0x%016"PRIx64"\n",
+                   s->vring_desc);
+    monitor_printf(mon, "    avail:        0x%016"PRIx64"\n",
+                   s->vring_avail);
+    monitor_printf(mon, "    used:         0x%016"PRIx64"\n",
+                   s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *e;
+    VirtioRingDescList *list;
+
+    e = qmp_x_query_virtio_queue_element(path, queue, index != -1,
+                                         index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name: %s\n", e->name);
+    monitor_printf(mon, "  index:       %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    descs:   ");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "addr 0x%"PRIx64" len %d", list->value->addr,
+                       list->value->len);
+        if (list->value->flags) {
+            strList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s", flag->value);
+                flag = flag->next;
+                if (flag) {
+                    monitor_printf(mon, ", ");
+                }
+            }
+            monitor_printf(mon, ")");
+        }
+        list = list->next;
+        if (list) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    monitor_printf(mon, "  avail:\n");
+    monitor_printf(mon, "    flags: %d\n", e->avail->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->avail->idx);
+    monitor_printf(mon, "    ring:  %d\n", e->avail->ring);
+    monitor_printf(mon, "  used:\n");
+    monitor_printf(mon, "    flags: %d\n", e->used->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->used->idx);
+
+    qapi_free_VirtioQueueElement(e);
+}
-- 
1.8.3.1


