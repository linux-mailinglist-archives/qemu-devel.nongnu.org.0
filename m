Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F447D81A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:03:14 +0100 (CET)
Received: from localhost ([::1]:45884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07pQ-0003qu-Eb
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:03:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VJ-0004yB-1w
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:25 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:18988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VH-0008Lt-3a
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:24 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXxQI028537; 
 Wed, 22 Dec 2021 19:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=IGFnm2dfC8pVFp09AUsn0guUx5mG+5HBcTTy6eY3AGY=;
 b=WmTuXWD7UHQv68PziiBlaCWKRwoJwSQXdD9DMeqDxBIQiDu733J7a3Ht7q2kqlHCUQX9
 a1pTFc9IFBBOW1xj6fM/V2WqZCODZSm2DGtoyPWUtrBL/2+Dl2WlaCEtoWSzm8ZEMiTx
 ZG4O70HpcyMEs0EW4Z+IQL7gnJvY78dhmpmHWBdCPRCqgH16neSWt5FnMwwhk9u9EwBm
 zYkD2eIg7EdyWaBuPBq3jnai7qw/2Oi2SGvHXyP2Rrla6jBN/YxoqWe6KrV1EPMbAbai
 +zfYGi77diE+e+/8wPePbbEpB/EWpWr2y/MqqwbLnfX+0mA00uQpgSAMDMwDeIlW9tz7 Zw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCF2049078;
 Wed, 22 Dec 2021 19:42:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by aserp3020.oracle.com with ESMTP id 3d17f5rftb-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjHGInZYfAXUI91+jyv0DKdw7yrU+ldQR8tiwCnKQbhAYQjq1+jQ6STmVEcDcP9Ff82rrCEER2OdvKB0Z80E1rhCv4Ok1sIYRT4XHw6JQsZO8nGHuk78c8LbC9eCCPV5xTwy8KG7SoLKnc3x+nkM8ghIPJADpjbTOM6ZJlOvb0eFqbA4uy+dqxG0J/7+sfBCNoVdFFkEWcn1WmCFCgXOmUHiqB725P23TC4aWQF9aldq9pznRicNBty90LcMDZ2yKFXw/QAVDrAsM/S981ss9epZxdNEuX/wVFcOBO+gOW9AwNt60WZzA19UMO0ZB88Pu5Vfw/W1A+WLWXOpwcNj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGFnm2dfC8pVFp09AUsn0guUx5mG+5HBcTTy6eY3AGY=;
 b=Bqtt4w7/aKDLI0XNmGz3kVVs944zCp3OjJZebi5Bf6Jzz/DvABkqjPSckmNKvTg5jys2w6U3ms30sgitZPna7D8ittGEeIN4TYuzEuRCeSAH4KyIbVLHgNHsrWXAC8FqMDP375ldFg7JzozyyL3/9sj/3oTkgdbY6yuY34Y+U8/PTvMXNrURftWnC7E4vrhJKusQ8cRH21XwyquERzb5RIoimfePR/BjIyQ5A9bRFhMuSnxqN+NL1oUBSlrjOhNYVfOt18cdLwQ6XeH1irk/wxxMSZ/zdNf0SJgrZtNfl4kli1h+L4+2TtEL3DyRH/V56l3EFlrzoQmYtOodBK+khQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGFnm2dfC8pVFp09AUsn0guUx5mG+5HBcTTy6eY3AGY=;
 b=A225pC3/5pdaI4/XNIq04CQlkfhUpp4SQlo2bglD0URRSSv6R8xOSQZLSr9x/nl2JyEKjzKmh7IOCikmZOAc0LrZsBLv2xTozmrYNcwy7OUKAN7/IkPeBkk191Cu6CPtWweIGgQCCG/7foWGsgUlQVl+cxlwRkn4NsZumHeqDVo=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3746.namprd10.prod.outlook.com (2603:10b6:a03:1b5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:02 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:02 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 15/29] cpr: restart HMP interfaces
Date: Wed, 22 Dec 2021 11:05:20 -0800
Message-Id: <1640199934-455149-16-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ac66553-8634-4bda-2fec-08d9c5832059
X-MS-TrafficTypeDiagnostic: BY5PR10MB3746:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB3746CC1860BE5994AFFCD806F97D9@BY5PR10MB3746.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7L8zwTSFLBoVfSVXQ+t7i0iP9vU61+UKjOc/hVeY+7DEYumtIB0AOZJWJMcQVCC9vU23GAkZnIXstuiDffc7wxGAJF1Qce22xZxRazW182zjWMzVhiFUs+nQGuetu6Hl+p64pxiNByaqXXuZ19ExCfc5jjaJq0pZVh+30GB9xzU9DnpDtHlFD5oGAoEp4sx5z1SZVqlJhegYIGgVXfr0Nrh02dDydb7/O7FPMdUUttK803NE4/iL39yAyDBJ2QylkexI7nOQDcR3Fn9TzwUGmjQMhZYDizytxlSz1QDo08GGjyTmEXoJKL2BSOJkUIKz/rEjfzGK2s/BBYRtk1Q1Jw3ZMAkeMK6w7GoyBl9fa/bHDK/jDdM7vWPpKVazpiDlmUeBlzbyDou0YMmFSGL7NXQntX8TIulEARx5D3czcdXPrghMfc+0qn4C+1vPM4J65hwGAS3gDrlBXgOCMwKKuBlARxCMO34QKtuJSoBsX9BspCPER+Bk8bUdMbiwPNa/M0zNR8Vs7DRBc37CjFBn62AjROFqTDOqI2RepIGhoGMULeCM9uomihK+PAnyIaUzbzZFseSgtP92NDHFQZCt336BDaBia5MS9XSZNPsmKzTXn/FsN/gUT4cAhyawQ9usr7c2iEjcd6hX9W3vcrhQZ/mtsdOg4riO5oxK6aqnryfGeAO+lyW09uLWeRUTF0HPV5ZNVdC5Cpz7acDoZiOVAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66946007)(66476007)(508600001)(83380400001)(38350700002)(38100700002)(4326008)(2616005)(52116002)(107886003)(5660300002)(36756003)(186003)(2906002)(8936002)(7416002)(8676002)(6486002)(26005)(86362001)(54906003)(6666004)(6916009)(6512007)(316002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6N9gQuHbGBkhWWN/yTW2aHTNmJnt/DvdVy6jZivnNwygWKZ2rz+tUsbhRzV7?=
 =?us-ascii?Q?RrXYrjcavXrARnB4BRtWrTrrabzsv7jJ5JDYrnOjljLjp/6q/qzQotg6E8kI?=
 =?us-ascii?Q?sgBshzdI02rbUmRVSqc2x32W4ACPXNsdiQR5VXB+eAIi73Ipb0UCcYUZ6n1x?=
 =?us-ascii?Q?9z8CMpTSdNirpx+nSlQ57djg0ybSwK0l4WrmlGidsHk8Gywj+7e4vd/HKFz0?=
 =?us-ascii?Q?pu+T9R7Prq5+37Rnqb5ERo8BaJc9AN+b0rq9YVJXr/sPCKllciXrv6lwz2D7?=
 =?us-ascii?Q?LnyZ9VJHjSvl8EzqAEM9MOw+W2B0rgWjJMyn4qEA00Tf1t4wtY0GqSVd9Gt7?=
 =?us-ascii?Q?e2s0NaRRnrs0/zTWLg7Y1MhcBIz/X1KyRBu8/AaQExlkfAbyVmJd8w7xRAep?=
 =?us-ascii?Q?5IOJCpFcVIhfFaY1y5C0HRqurVS0QQiezAyz9Y5KUMXx9fXvTmH1E6qEZpTB?=
 =?us-ascii?Q?iwGIoXHFr1XjmJdB8TKrCx/G+qWGPWP840MpgUE4R9zXMFtzjZiZxJlVh65A?=
 =?us-ascii?Q?pPXiHPVdlF9W9kbdoOGHSB5VfkZi+NwfrHwLJfn4Rk6N7gmRQfuvhtuRd3/x?=
 =?us-ascii?Q?gccLe4yxn2bJ0kcBqOV2HJ6Vd/tJVvfT+scuP9QQFA3R7L0SbuyB3/21O0+v?=
 =?us-ascii?Q?I/qjTAXD9jO6cfrCGtCO/fd9S71u8ZYxLmG8um6XPfmSKr4BDBil5C9NQ5OM?=
 =?us-ascii?Q?tHAXANEhT7LDhG+xoRnqVB2HYgsUDo8xVk+ZKQuxg0N+gt98H1bwIIaJpfRM?=
 =?us-ascii?Q?wi/TatREAwANEJuIURFZZnth6l9HmevMKE8FCxxxjUzpLAaNBlt/84/C+/MJ?=
 =?us-ascii?Q?seT48Ez8ELLocli6CAfKNQeFonbGHdAHUuQlyECzD6axf0Np33ep7YkPoq1T?=
 =?us-ascii?Q?AD1iUfAWIrNnYpcGHXPxM6TyLTZHbsuPMt5IQf4mU5iC2F+skLup16EHd/J5?=
 =?us-ascii?Q?VOKJqP3uLz2wniCczkXHOGoKQYEhaQWtR74KdbnoHZgWySb9i2nuimUFn0hq?=
 =?us-ascii?Q?GLB2gykl62/2W0nsnA2UqKRXbAMBvbOjv7w4e9Vk5dAgXQGJelEAs24nLCGb?=
 =?us-ascii?Q?XxnIycE6l48ziGAhDfHXgLP7tEvfytmhUrwhdgFlioB3wyCRp0IkPPszJUDz?=
 =?us-ascii?Q?LPC15Bqk9zbLYYdW9gQ6953GxsIKuQcQFRg8yoJKRHvQ2z0DMhp2MRzXA6Jo?=
 =?us-ascii?Q?IA1H/FEoBVXbQQsjfoCSq3pT6gWtlChrWAUh88IJYxRrIUEnni5jZICu2YHs?=
 =?us-ascii?Q?3EsgAz7Mm2pZTHBdmZdVcCQcJRX5WIPtCBQY2mjspnsgcxisupz9SwLrZmWe?=
 =?us-ascii?Q?iBVtxISacjdDdrpTCOGIdRJicbB1Nr6GTmlW0MnJv2fcyTBjMPE+CUzmAW8L?=
 =?us-ascii?Q?UKcMzJMAaJGiKyrcx2de1blm34xBskL9m9SJy9N89OktF4+VN3a7SA7GGMWH?=
 =?us-ascii?Q?hoP+vflqklOWdXvg17U14MzprjFmYT+xOfpZBnQoQu+9XJ7nuW9dvdFWBPyz?=
 =?us-ascii?Q?RoFRVCbsU80uGssnbvzZl5i5KeonZ/acDwWk7zkvYni6XfRBLDL2l8hBTIza?=
 =?us-ascii?Q?IPCF31SDHmDVrGkyhLPhCNoIf5A8il9bfO9hJhkMNY64ZOVdrJ+NvZIqC2Cv?=
 =?us-ascii?Q?vupOE2upDuWtWlF18V9RRNFSMJD/z0/HX94Fdpe8+q8Ln2ccA7Jrp9JPYuaR?=
 =?us-ascii?Q?UuQDSA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac66553-8634-4bda-2fec-08d9c5832059
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:02.6551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1V52wlxqFAe3Z+mQMYp4qz5F9gs9kA+QQ5y0RPddshHCM4jslfvP7iHhSGajjzb7jXWmU/UhvmXygOO7THgxmsABnqZi+5cBbKCuFOJisw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3746
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: Inpf88W-SCurecR5EjS4FKtS_BKdYZ6X
X-Proofpoint-GUID: Inpf88W-SCurecR5EjS4FKtS_BKdYZ6X
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

cpr-save <filename> <mode>
  mode may be "restart"

cpr-exec <command>
  Call qmp_cpr_exec().
  Arguments:
    command : command line to execute, with space-separated arguments

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       | 21 ++++++++++++++++++++-
 include/monitor/hmp.h |  1 +
 monitor/hmp-cmds.c    | 11 +++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 350c886..0fd5b1b 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -353,7 +353,7 @@ ERST
     {
         .name       = "cpr-save",
         .args_type  = "filename:s,mode:s",
-        .params     = "filename 'reboot'",
+        .params     = "filename 'reboot'|'restart'",
         .help       = "create a checkpoint of the VM in file",
         .cmd        = hmp_cpr_save,
     },
@@ -366,6 +366,25 @@ If *mode* is 'reboot', the checkpoint remains valid after a host kexec
 reboot, and guest ram must be backed by persistent shared memory.  To
 resume from the checkpoint, issue the quit command, reboot the system,
 and issue the cpr-load command.
+
+If *mode* is 'restart', the checkpoint remains valid after restarting qemu
+using a subsequent cpr-exec.  All guest RAM objects must be shared.  The
+share=on property is required for memory created with an explicit -object
+option, and the memfd-alloc machine property is required for memory that is
+implicitly created.  To resume from the checkpoint, issue the cpr-load command.
+ERST
+
+    {
+        .name       = "cpr-exec",
+        .args_type  = "command:S",
+        .params     = "command",
+        .help       = "Restart qemu by directly exec'ing command",
+        .cmd        = hmp_cpr_exec,
+    },
+
+SRST
+``cpr-exec`` *command*
+Restart qemu by directly exec'ing *command*, replacing the qemu process.
 ERST
 
     {
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index b44588e..ec4fa44 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -60,6 +60,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
 void hmp_cpr_save(Monitor *mon, const QDict *qdict);
+void hmp_cpr_exec(Monitor *mon, const QDict *qdict);
 void hmp_cpr_load(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 5ca8b4b..39894d8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1105,6 +1105,17 @@ out:
     hmp_handle_error(mon, err);
 }
 
+void hmp_cpr_exec(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *command = qdict_get_try_str(qdict, "command");
+    strList *args = strList_from_string(command, ' ');
+
+    qmp_cpr_exec(args, &err);
+    qapi_free_strList(args);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_cpr_load(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
-- 
1.8.3.1


