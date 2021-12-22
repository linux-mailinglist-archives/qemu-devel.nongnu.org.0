Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A45347D7F0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:45:21 +0100 (CET)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07Y8-0007b7-9q
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:45:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V5-0004Xc-2C
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:11 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V3-0008KP-2G
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:10 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXufq014442; 
 Wed, 22 Dec 2021 19:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=AHkIlLeKWP4Wsdh2SeKkcOJujvmNOHt5gI3ruFNHWIY=;
 b=ex4eUN8W9GzijdMN2/zkXa2/iXGMqNkBZlYdHbWmGNXGA7NcI1QpYFH9bgEMT/2YL5GX
 jhidhp9ZSjy4tyyiTLhi92Lm+Sd54gyVEukEJXc786hOZGfHEALMi7kon3rsMriy+z9T
 HRsFOTIEPKul/QJ+A/z/tbGzOtKANE1qDqKvwjuOfbw9Vyx07XyY60bWFlUsUNDqb7NC
 ybvVwPV23ktOtHUMlIJKRQisF6rcwlwODXYelJSioi+oRTe8j+iCssDr6d5MNgJ76LlB
 VzBIXMNuhAOmdGCj0z9Gw4vdsw3suRIFzFo4i4jNpTNpEXz8SPIw5q9AOdUFwEc+MkbN kA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46qn0t1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCea049074;
 Wed, 22 Dec 2021 19:42:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oln1AmsfoPJnGfi/kqAgp58zA8Zv9rX+MU4sFiyaq/YcMpeZSU+joOu08lILdSzNcyOX4Q5rC7vI1bUbJmlIdEmX6Ee0sTcrOpERqCjYMO2ZsjYcycxJjudjLjYJ8yyiZe1HIH2ICNJ+OTygCzgY+ih9jMhTEp8WGdWBlk8+j9Jbo4HModc+TRuYIZqb0vJ+DV/ASaG1E1I3Li9ikwguOsMkgDwbIZ/x/9//g1tGtWpb5v4Ye6kQjZyvxQbdhYzcakaaterY/LrFdNRzjushYfA+N4eZ0H8QVrHXVamtFfq77b54fyMkPnxCt7rXlf1pqGlAgf3RX16K8FGqZGsVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHkIlLeKWP4Wsdh2SeKkcOJujvmNOHt5gI3ruFNHWIY=;
 b=n2L79BZE45+bXbYqPkU+qXz7nWj2i13GgnF2WN2S+4+9O8PTW7gqz7U85fWjWgyR5+Y5EHMq/7bX5vY/sU2uTuwBgWm/0qeM0yilx/fmEeuzkm4+I/MQbI0pMXI/WP2+Z6ednOyrx2+zgyhwq4fT8p7IPwmIE3os5qYBIMRGOJN4vkA+njBKUR8oS29+Rh8/I3AuJ7uP8bNfOTFUNu/kKXTf3xCDu2qIp3bsxOoYFRTQ2dhOLEJ8xGmNLCQjmzUPwHc4umPHsvc0OatfmRuyLilqOfmT8zpMzWDvmWkZSjR7pWJ/lGzaIjpEgdjwu5MNWs1HSBTseQuzJtYkH74rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHkIlLeKWP4Wsdh2SeKkcOJujvmNOHt5gI3ruFNHWIY=;
 b=RoM/YbZiQmQ115njKUZ67B9DCmZXMOU+j8Lg4TlkWlcXh13FnRosXP/bMz2gPGx5VIJFw6gJsdkuviE25io1dRLMoenSTV1rK6aG8Nby9I++46OXJQur648wLuJHLlW0hJ10FryO4FkSySI0ZlT7IV/kgOXlYo/pMXmLn/SaF9s=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:41:58 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:41:58 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 07/29] cpr: reboot HMP interfaces
Date: Wed, 22 Dec 2021 11:05:12 -0800
Message-Id: <1640199934-455149-8-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7945cb02-6105-4838-d0e1-08d9c5831da5
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB288823C633D007F192A2BC68F97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /fYwWUT28lSoA3lR3gPfFVV41WZH16DKQ/Zg72AO0T8zFUid58R9EuXhyCS9uWjOtqoEmkc96Of0KxhKyc0+MxWw7+c/eIHDVye2B/x/pXRdKYPCiA3DKdDYKWpSbfxHU/Uo/tvntx6LxF3oK9+PQJEddyd2bFcGxX6Ib/IstwIAbkzZzGkhgUNXgRa2MDnR1n22bZqCfBVGwhQFHKmYrKCvKD5lGnSqSgoUxh39u+5ASlF18thvkGMqVlSKEBNHfzL0ifMEwb55891Uye1rec4ZcpCfCW/GY1QOFQV8YXXSoiLTjVWnH5k3VPEJib3CiO1RMH8t8O2VL15pkKqOdqWPqjf5EXEQUAnAQoyKxTyGlmxDQ2prhOWD5A5DAujDM9/Rjab/TiceBJRjW0+EYYMjveOPHGjSu9IdUEIw802Sbsu7ssGQdExKgzSAgxT269zF8WW8bLL+Bu2k9d4UMwW8uiv8L1Sd6tR0XqFtq+3nbbnwFet9uMJu0U7XGTNVTXnZJWgYW3uSFsu9sNJhAhiF2k/HTfrmtHMsdqDLuaCo4StQgE0VBB2uQwgzBcgl4aT3ZUFtHnN5es0yIL3TrSiGu7ARN1oiubMsnzOAoEVi+Ip1WuNZLLbL9zJvOqzAXdnWNL8GYrNyoTPnyaiGQdyyeQNRFX4WSxSH0jVq5u/cAXqjbD8eBhx9vEsl6QJAqBWFmL7LqxXw9bSqtxSvgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(316002)(52116002)(6506007)(186003)(26005)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(83380400001)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?laLmlQKmKaWIyPMp9jBMaa/5Mh7n1zNx34BZKQ0YJkqXkv5X9+sQK87gbV5n?=
 =?us-ascii?Q?f/s4Kv5K9bRRA7poEcexK747L0AlaAkUTdYqajQvjBNxTksyqtNLvsyvegSO?=
 =?us-ascii?Q?GoMz0Ln5PRCgdNMO5ObMuihxMsfD0U0fmH47ka+X/H/r3QV+6+z0Rbmz6Xvh?=
 =?us-ascii?Q?GC9mKFSB18+J5hGHYHPBRZnHmd/JcS755RSiKI93MZVfm7cioLFPyaE0hq+Z?=
 =?us-ascii?Q?rukLppb3icSyBWxGfghW27+vC2lHY/SzoHykD9pCK1EnZTPViBWEAnX/b7Ve?=
 =?us-ascii?Q?xk3FiLVPCJiYl2FBFfM1Qtkulvx0ZIycoJi84tPj5U0oOxUlrZJyGB7VGh1e?=
 =?us-ascii?Q?ZMqj+jO/FLSNF6wyR9QnYBZyjwzuRf4mbNFvnO/yIEjuahp0Y+Tap0u1yShx?=
 =?us-ascii?Q?VrhvkdOV7gtKKrEWHwkLjUZYp6kBEnQGR+Zy68m/Ed3DE0532fWTKg+7HoDR?=
 =?us-ascii?Q?R1tPCpWTvXBStSnJpaTMJqwwgfifEpU+Au8x6GgWJrxqNdkxAnHi7ldifnM+?=
 =?us-ascii?Q?RK+yy+wHbLc8dRxvWwEth8pwQlQ8EuC6IrD2fB8A7ITc5lC5NnQeWHzBOvyb?=
 =?us-ascii?Q?LP/EH5pguaqDjJ6Uqdw0u1bY/UZx2YHdRDZoGPj2LliAqlBn0y7cljQiN1SK?=
 =?us-ascii?Q?UhBv3bS24QVczZaMVyZ/hXICQT6jW2cXR0/4xuckGspjdF333wVqIOcrcEa5?=
 =?us-ascii?Q?wkrjY8uEl1VRMu/khuIK+KTDauyKQSsEgpn0bmQWgWf0buv2eYX4VoYgClgZ?=
 =?us-ascii?Q?oEUHGUNEnuypXQAUEzGRPrq40DkPyKAyoG37ZhPf528rtVij0Ji9fbUfiwou?=
 =?us-ascii?Q?72I3OiuwoQuZFBjGWq3BgEYrz8BfWrrlVvfZOhTGMBqGNiV2sFSJQVGvQR9C?=
 =?us-ascii?Q?QouXJryyazz7mnytablKmaGACFLUGy4l0PQk74k/lT466vin6gQtm721IJn+?=
 =?us-ascii?Q?OJGYkMBbz0Nyg6wwJ29Ab2jm+XzXkcjetu0rBHFG+TMauoB/L65CGcpDHpIN?=
 =?us-ascii?Q?F7pm0nm7STjpuWl+aqtxxDk46T7RG7GQVdQhjockg57X7CCd4BqKJzY7upai?=
 =?us-ascii?Q?f/TqYc2XDddPfKvJfbNVY3Mnt2WxJn8pC+RYSB6hbpelupM5qbFD05L49DiL?=
 =?us-ascii?Q?CvIfH50D+MV1+IK6WjkKEGWfKZIOOZiQZ4KHy3mj9IVh8CkapoU5K01PJi9d?=
 =?us-ascii?Q?gPHpp+D6h7ZsS2cDsOSWLZ2ujdvY+HgmWTD4jUaQ0VfTuH4/SQaeUA/ARRU1?=
 =?us-ascii?Q?tmV2kz+XBKXge0wn+jFGuKNCf3wGodRN/922H7tmx1oTSghikI/kVMIWIiOp?=
 =?us-ascii?Q?Itf+SW2z5uQzcITzNjNMO/BaxKD0UgAQnwWWWnzxIrc87Mk0+qAyZRqLkfkT?=
 =?us-ascii?Q?M+pxzHhj7pjd0am6XYJPovXcin+DSnItXKlCTkCNlHOZ6t6CYHy4oRNS95ij?=
 =?us-ascii?Q?Wn3UohZi/+yx8HawNOKp6FUnSxAyPm16nTGann+CQzKV5pcdOGpE7yn6g3rl?=
 =?us-ascii?Q?5BrLgV6rUlm9viw64uAUxRjwQK9k5l0R3K3ENfnC/HoNL/qmT869VXs9bMHX?=
 =?us-ascii?Q?UmW2qLDHvsGEm68kQvCQjT8ilwrJtMdv6C5WbH8HibHtKLB0pNEX+w1PPWKj?=
 =?us-ascii?Q?NdVseESgHC55qOMIWxLgX6By+w6LnSbXgYxhJa20+CG8H/yyi+l/cuuEuTAh?=
 =?us-ascii?Q?JAHyxw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7945cb02-6105-4838-d0e1-08d9c5831da5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:41:58.5929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zTy5aoc7V6IvW+xRN1OQa0T+R9JcQghZ4LIULE+tdLicZD5cNMzERYUq6NWF/SBbGXUSbqaCppLKg5YTwAFvi2qTOWGU0Z+1xijZ1DD7xM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: Zj9mBPUmPnvrghTVp5qfQglGEvVvyQdP
X-Proofpoint-GUID: Zj9mBPUmPnvrghTVp5qfQglGEvVvyQdP
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
  Call qmp_cpr_save().
  Arguments:
    filename : save vmstate to filename
    mode: must be "reboot"

cpr-load <filename>
  Call qmp_cpr_load().
  Arguments:
    filename : load vmstate from filename

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       | 31 +++++++++++++++++++++++++++++++
 include/monitor/hmp.h |  2 ++
 monitor/hmp-cmds.c    | 28 ++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 70a9136..350c886 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -351,6 +351,37 @@ SRST
 ERST
 
     {
+        .name       = "cpr-save",
+        .args_type  = "filename:s,mode:s",
+        .params     = "filename 'reboot'",
+        .help       = "create a checkpoint of the VM in file",
+        .cmd        = hmp_cpr_save,
+    },
+
+SRST
+``cpr-save`` *filename* *mode*
+Pause the VCPUs,
+create a checkpoint of the whole virtual machine, and save it in *filename*.
+If *mode* is 'reboot', the checkpoint remains valid after a host kexec
+reboot, and guest ram must be backed by persistent shared memory.  To
+resume from the checkpoint, issue the quit command, reboot the system,
+and issue the cpr-load command.
+ERST
+
+    {
+        .name       = "cpr-load",
+        .args_type  = "filename:s",
+        .params     = "filename",
+        .help       = "load VM checkpoint from file",
+        .cmd        = hmp_cpr_load,
+    },
+
+SRST
+``cpr-load`` *filename*
+Load a virtual machine from checkpoint file *filename* and continue VCPUs.
+ERST
+
+    {
         .name       = "delvm",
         .args_type  = "name:s",
         .params     = "tag",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d0148..b44588e 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -59,6 +59,8 @@ void hmp_balloon(Monitor *mon, const QDict *qdict);
 void hmp_loadvm(Monitor *mon, const QDict *qdict);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
+void hmp_cpr_save(Monitor *mon, const QDict *qdict);
+void hmp_cpr_load(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
 void hmp_migrate_incoming(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2669156..b8c22da 100644
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
@@ -1110,6 +1111,33 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
     qapi_free_AnnounceParameters(params);
 }
 
+void hmp_cpr_save(Monitor *mon, const QDict *qdict)
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
+    qmp_cpr_save(qdict_get_try_str(qdict, "filename"), val, &err);
+
+out:
+    hmp_handle_error(mon, err);
+}
+
+void hmp_cpr_load(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+
+    qmp_cpr_load(qdict_get_try_str(qdict, "filename"), &err);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict)
 {
     qmp_migrate_cancel(NULL);
-- 
1.8.3.1


