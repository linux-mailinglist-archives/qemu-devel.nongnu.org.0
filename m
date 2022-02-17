Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6774B9AD9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:26:50 +0100 (CET)
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKc7l-0001jB-Ad
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:26:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbYD-00049J-Rt
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:50:05 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbY9-0004TX-MK
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:50:05 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4YPWb005266; 
 Thu, 17 Feb 2022 07:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=qd/HghLhnXj4tRPCu6B6TxV6jE+DPov8SM1cEPYB25o=;
 b=aLAxYKnYnD8n8BRV63bwVLYQfTiUpwPY9/Go/0F/KwpjYTJ7sVtWfb44+9Xh171txsF2
 RiCX66wUrWZ6c1rbcNp0WCKGqmJeuxLRP6OXrmA1l+trIA1I5R3NW0vz709R4I6lH0I6
 hHSNTCZPDwhzek8kmB8pK/LRFFYnrQvCGVKluL7kIMV8psETCvxXbkn1aZfGL65WbmDh
 nzmOgPvwtwkMgJ/44mm2dwQKDEAqR9v5TykqStVSEK4veAFRfCHBI7d3qRhmC6TdyZTu
 AW4ElJD99rMnQZYPFCnwj2HsDDzWoE4CbYz+Oen9D0+On64o8PDSL/WrnUejtjXeP3Fg qw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8ncavqy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7fJbO142777;
 Thu, 17 Feb 2022 07:49:49 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by userp3030.oracle.com with ESMTP id 3e8nkyqrvp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nL87cWeifC25gM1VsD+b2ROTtZIdcYzhCooSLR72HtYKBR5tBEDKiBcFWcl4YaZsOi+ZQknmAFgbEC44y1ZjyztJx3IG5mNj1t031mbfJzyTl+tCP/JRwjvO+M5Vg7mf5XjM5ThUywinPk6DvgUJmwFE18wS4k08rKoumXq5ucv79h1FW6T03Ugi4S3+XAcQKq5Cw4O1rENH5IlGzHVsChIS2EbJu+eL0PiIG5CqbmpKo2KMaiwER7bP8TFCQM73RzFtW++0qpNrVyvG5uNXWOATOUmkBbIYV9PrwZjZG0alfp3+CEU3FVBc8UvEukaCeZeE4PwulQ7QEYSM3oylMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd/HghLhnXj4tRPCu6B6TxV6jE+DPov8SM1cEPYB25o=;
 b=edHwOzFu5wkWS5Clk9fCOwgxscoSHHDgzRospZQblBBCQ7t2bMm+4p2a1m4SBsRVG0RlqjFDf5mTgGxOkk5fqTUAi87JD6g4zPko0viliT/HlEt9wr8xc/eHuae7LaC5/oRhlihqhothj9725nYS/MWrXI/zxzwbNvBNGC5RcI/se5LjIKywRBuQfV3N+KdxD/LwjQjOu3Qq96JnfhSZkPTk6X+/js4xJr+R9zD0czhcNGavaWwwT+fz3xW6ctzewfOLEFr18cCeOa86jFuB17qCheuS86CqbaGzvEfCZKd4+onuEBwfLZcKhQyFf07NKjDeKR4tKZg7WVZ80DQ5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd/HghLhnXj4tRPCu6B6TxV6jE+DPov8SM1cEPYB25o=;
 b=YfvCWNjxYKD9S1CopGD9PYHZP+2cIMYblABSHlQf/wO80bfGGJZptDQXlm6yddUeqtHsHXJbA59gHTXzVaP7QNTNRJgi8h3chkgPpPFdlCtZBRiFdD0qonaYkuTwtLoUApuUjz3OndU+nXSv4dHnDIdPHMu37RUA/h0lKzQCdwk=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by MWHPR10MB1374.namprd10.prod.outlook.com (2603:10b6:300:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 07:49:47 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:46 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 16/19] softmmu/vl: defer backend init
Date: Thu, 17 Feb 2022 02:49:03 -0500
Message-Id: <55fa22ea0e82b204ca3c5ee2fc4b9b3d2c1669f6.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ce71d95-0071-4924-0be6-08d9f1ea1161
X-MS-TrafficTypeDiagnostic: MWHPR10MB1374:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1374FBA666F944595DCA5E3290369@MWHPR10MB1374.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +dkPI9qTPb0ExWb6xQ0KyFhmsfjeSL1hCNAI/dgW2KPofk17WVhr/o/C6BBqEnI+Nvct80wknUnV/6ZZvaV4b4vTGulafbs+BGqvL76KWkNYQxtTqd0m0EVxr54t8t+UGfYdPaTTts7Cwq2jfx7y5JNmjPYrpae/XRDYCgJIbV2qZH3I8/JqNvw1aoE5e0c6bU3/CuQYDJ8vpbwpG8uFOU1SVg7Q96kQHtvJR2rnjbIlKIpT13v0qmdrVxC2u4FZa3zn3G34a8AzAfjLjK7UBtlFogex6p931q+x82E/3T5Tb+h/76XpZSWSxq8zX+2BR5Tkx01peRVcSi1j2mGoUq1Jxa3X0WZX+Ij2t1NJwkTUQk/x5z4NEJI9inAbS9G0jSGs9G2dYZJeO3J0FDru4KpTPEnd5PNXWpPV2a4QqCGig2/beTpCouhFG4y2WzBxiSBkW0iV7xotkRHl6V2g9zAP6xe2yS5QItx+KPNNaWEnc4XGBweKnFBAlCJqvRYQ0bMp65f3FiYS1MxtPelOlq6QPJPNDgQdxf3R2lwLvxZ2nAqdoHTTRgD+eE6BxvIbwniAfLDpIVV5xl0jzxalLdst9YxQ5g3/5oPSVAsSOHanfyz//qS75tvveISPmSQKSmFFsVuTpW+Y3JudYm2t60kQmLqini8daovuIMLqxNqGaFMFEd/TmZEvcIaFgw63gus17gnKeVqRdXzxtH6cqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(66946007)(2906002)(8676002)(38350700002)(6916009)(4326008)(66476007)(8936002)(38100700002)(7416002)(5660300002)(66556008)(186003)(26005)(107886003)(86362001)(6512007)(2616005)(6666004)(6486002)(508600001)(36756003)(52116002)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j33GUCK8j52/yCSoH/QV1ymh+Yg33Fb3xGW8VTnv3blA8OBUEIFC/vdC2oYv?=
 =?us-ascii?Q?EpZ8GaHq/1sVK64UJLNrH9oxfjs8VYBL11/c8tonNjt42tH0xPesuNvaYeia?=
 =?us-ascii?Q?3i77HQXiNunlGDB9mzJfcTOoS3i97DZG9HQE2pyPL9h12LCFHwwZvET36nE+?=
 =?us-ascii?Q?ofSl9i7MphyWyWA5vSFJQrUcJXX7jeUS64FVox0FZSs3LeJjWt4M4okvFZ9I?=
 =?us-ascii?Q?vb6AVjCUnzZUHyfEtv5iME7K82u2vZmoL/DgCmz7vMPkh6dnMLcN6Krit+4w?=
 =?us-ascii?Q?rcsFtfge6gX84KOLloTDIXGWXofVDGOfwF/QJtdv3o3TNP2kjtJ69YNT0yyp?=
 =?us-ascii?Q?SKUle19t2+4XYGYwlgIBG7TMenHdmUmbcRCBuYaZcth20hy9bFw1kUIBpnmE?=
 =?us-ascii?Q?zGFsEJyx5xdU0nByKBg7h4xfSvRkEsk7kmUnRZeTYItQmYOYh1m5+zauQfNZ?=
 =?us-ascii?Q?VHlJwvOOcx/gxViYyB7RdR3VXr6856mjdR1xocprqtPLmQzVpVqqL3bdrVim?=
 =?us-ascii?Q?8lIYYsLt9MdkGNRp5cytTlVNcF870iylGveZ5ueVdk1hwHlKXAXsc+s0pOjt?=
 =?us-ascii?Q?SiQHoMbPolhFm7asQSStsIYZAx2T5PWVsKqktEGd4YtJJLDLBKMoaMeM4gr9?=
 =?us-ascii?Q?DrETptAYUhYBgZRiuidE90n+YmIU+jBT9I8kQyehga0yte6eN1+hCZVWERei?=
 =?us-ascii?Q?/+TQnPQn5YMdxyPWE/2UenkTVnPPFQzW5kpEqooLZIFDxk9fSxWwg+hkX6v/?=
 =?us-ascii?Q?DOtarRDzkwc+jDhFMiM/E1xPGRF6Sw+c6XncL0UEslbwmZ4+uT9g67ppFfAQ?=
 =?us-ascii?Q?c7R7zHMe0u2czVWL1RI0FBKb4oPy4S47bs8aXAsPCc8fpzD2pKcBFepc9x2U?=
 =?us-ascii?Q?iUnVQuT6gDgTDKR9xE4pWgf/G+K8MIJosFk7VpNx5luXAQlBpt1uA0HD/9AW?=
 =?us-ascii?Q?+eTx83QDx2bO238gjLwQ/Hn5YGbmqYRk6cKsG/0Vu8YCYzILcUJC+GTmY78J?=
 =?us-ascii?Q?yjHopBueQDWZr6K3HgxdVswUFuqGi4qov/KbUas3XA0y0uKGq7BWsbPQ/pII?=
 =?us-ascii?Q?QZpUN1eseHJmSL+6U3hMZbnXaNOEpINaoatjl5mf14reMEk4NeLyRasaRQpe?=
 =?us-ascii?Q?zyHYi0yRtxn4iwyPbv5YWrPHOs1nMvszQWT7qU23YdBWc/LPwwPZKvniCp37?=
 =?us-ascii?Q?4LEt1er0d8w8REHWutyHC5SNQ1RXP/WDCOjQjkqlxtLHmMwg9VKCmjH4/JKq?=
 =?us-ascii?Q?UI9oDrqTc7P5vNmaz/Y+slz1hQyyBupPrXngpxCucKPaS1sePPOGCL+YJwdN?=
 =?us-ascii?Q?y1COdMUoDPg0ZWVTRN/dUEOVRLdPSOM48uEfPMbU0waqPqs4NHhUKTePthlk?=
 =?us-ascii?Q?/FpMsLAU6Fli00AldBctPcXOMHlmttYtxvZYYKANWHbuEWPmupQDts/YYk53?=
 =?us-ascii?Q?FwUW2oksazs49uIxuv8IayNHcJj5XKXy3OzkWVIG0wQKNm5jtVCTwwdkV+v+?=
 =?us-ascii?Q?atwRhC1vlA5/einYxGZTX11ud99Acs81kN+y3lBsdTci1LaQ2WPrOcNvwbD7?=
 =?us-ascii?Q?K6dQdA6Mmqhgf8qfacCuv4k3FBGqA00P87wx+uqJto5Oz3NKFWdl+IPD9Q3h?=
 =?us-ascii?Q?bWWyEhK/ucRr1bXDrOC2gTU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce71d95-0071-4924-0be6-08d9f1ea1161
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:46.8505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKXNvilabzuhA+o1YGY21FeMwJ2qp79rcWIy5Q67eDGNR+qKXrTSxhGWpbHJRSgLhSrR3bwYkU0SwVYxM68BdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1374
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: MVBBGVO7HnRll7qpUETsowwc_gatjDPO
X-Proofpoint-GUID: MVBBGVO7HnRll7qpUETsowwc_gatjDPO
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow deferred initialization of backends. TYPE_REMOTE_MACHINE is
agnostic to QEMU's RUN_STATE. It's state is driven by the QEMU client
via the vfio-user protocol. Whereas, the backends presently defer
initialization if QEMU is in RUN_STATE_INMIGRATE. Since the remote
machine can't use RUN_STATE*, this commit allows it to ask for deferred
initialization of backend device. It is primarily targeted towards block
devices in this commit, but it needed not be limited to that.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/sysemu/sysemu.h    |  4 ++++
 block/block-backend.c      |  3 ++-
 blockdev.c                 |  2 +-
 softmmu/vl.c               | 17 +++++++++++++++++
 stubs/defer-backend-init.c |  7 +++++++
 MAINTAINERS                |  1 +
 stubs/meson.build          |  1 +
 7 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 stubs/defer-backend-init.c

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index b9421e03ff..3179eb1857 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -119,4 +119,8 @@ extern QemuOptsList qemu_net_opts;
 extern QemuOptsList qemu_global_opts;
 extern QemuOptsList qemu_semihosting_config_opts;
 
+bool deferred_backend_init(void);
+void set_deferred_backend_init(void);
+void clear_deferred_backend_init(void);
+
 #endif
diff --git a/block/block-backend.c b/block/block-backend.c
index 4ff6b4d785..e04f9b6469 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -20,6 +20,7 @@
 #include "sysemu/blockdev.h"
 #include "sysemu/runstate.h"
 #include "sysemu/replay.h"
+#include "sysemu/sysemu.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-block.h"
 #include "qemu/id.h"
@@ -935,7 +936,7 @@ int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
     /* While migration is still incoming, we don't need to apply the
      * permissions of guest device BlockBackends. We might still have a block
      * job or NBD server writing to the image for storage migration. */
-    if (runstate_check(RUN_STATE_INMIGRATE)) {
+    if (runstate_check(RUN_STATE_INMIGRATE) || deferred_backend_init()) {
         blk->disable_perm = true;
     }
 
diff --git a/blockdev.c b/blockdev.c
index 42e098b458..d495070679 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -569,7 +569,7 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
         qdict_set_default_str(bs_opts, BDRV_OPT_AUTO_READ_ONLY, "on");
         assert((bdrv_flags & BDRV_O_CACHE_MASK) == 0);
 
-        if (runstate_check(RUN_STATE_INMIGRATE)) {
+        if (runstate_check(RUN_STATE_INMIGRATE) || deferred_backend_init()) {
             bdrv_flags |= BDRV_O_INACTIVE;
         }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5e1b35ba48..9584ab82e3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -496,6 +496,23 @@ static QemuOptsList qemu_action_opts = {
     },
 };
 
+bool defer_backend_init;
+
+bool deferred_backend_init(void)
+{
+    return defer_backend_init;
+}
+
+void set_deferred_backend_init(void)
+{
+    defer_backend_init = true;
+}
+
+void clear_deferred_backend_init(void)
+{
+    defer_backend_init = false;
+}
+
 const char *qemu_get_vm_name(void)
 {
     return qemu_name;
diff --git a/stubs/defer-backend-init.c b/stubs/defer-backend-init.c
new file mode 100644
index 0000000000..3a74c669a1
--- /dev/null
+++ b/stubs/defer-backend-init.c
@@ -0,0 +1,7 @@
+#include "qemu/osdep.h"
+#include "sysemu/sysemu.h"
+
+bool deferred_backend_init(void)
+{
+    return false;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index e274cb46af..1f55d04ce6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3572,6 +3572,7 @@ F: hw/remote/vfio-user-obj.c
 F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
+F: stubs/defer-backend-init.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/stubs/meson.build b/stubs/meson.build
index c5ce979dc3..98770966f6 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -58,3 +58,4 @@ else
   stub_ss.add(files('qdev.c'))
 endif
 stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
+stub_ss.add(files('defer-backend-init.c'))
-- 
2.20.1


