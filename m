Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958E532DAC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:38:11 +0200 (CEST)
Received: from localhost ([::1]:34354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWbq-00078S-3i
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWVB-0008Co-1p
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:17 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWV8-0003RE-VX
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:31:16 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFKeGQ018506;
 Tue, 24 May 2022 15:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=uqM4fo1oaHQDQh56XS1RRp5KeUjXcP5uwdV6i5UnzOg=;
 b=THWEF9av5xELBCWGeg8f6GlWyiRnhzDuyKfrvx8mQ0iGcY6hkYq5Ok4WO1BxNWMiPsp/
 S/36hzJATyefCU6teBUb0Pqew6/boi+W/YeKaslVbLc8ORD829AoASVfIyJPlENyuniG
 CSrYOlpbgp0nCh8QDaNiavrnX1MVcHr/orI4w2paG8/K0ulY/zZlopfdZtIxl4qknkV9
 86pXNMCOgcb96ASiFcY7QBWWM952m10ue/3YTUSJSEGKwfmcLM4dOjZGknyD6nAlX2np
 hcDuGQjoLxST3qlI8ZRAsd+9hSbQd0N8Xdt8YAF1/nMyOdBk+eywIPtrtbhPdilUyosR hA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6qps6tjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:11 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFSSVx020986; Tue, 24 May 2022 15:31:10 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g6ph2rj84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdWzG355mhzHgfv0ZfGNQQqpIT/GKLOFSb5lg2sWwll31rm31mTriuT8rAj9ovWYbPFwm2/zrtmeZKR+nJzWxys9oHvZY8fFUJoH81YUJBhH/bEhjw5HJnYF6xPDHAa3A2sPDYLYrYSitFFnCe9zGoWL9+rcXtLKhglH6mjSQrks1b1AQcGLzqyr8KtgX8JNXsIiq/EX50OrreVP/xmUQS+8BxTlNV3vnhCDffv44Pq3t2FkRKG9oPWVSGRHtyYHefNrSGS2VIAqJDWySds7nDsMSIovSVsTgc5rhYpxKbPgo8lpL270Omizuw9dQdEk/UukzY3McWEehE+RjvZdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqM4fo1oaHQDQh56XS1RRp5KeUjXcP5uwdV6i5UnzOg=;
 b=RlLvucuTw1bNOronYTy8uc89lYMIv2TScTx5XUBBq2zNL20tWkpbWZsoVlz3YVsfbA+U4z5kFbttrOPNMboV/I3Yhq06c4j3SIzyrXLL4MnNkTH4g3LxSFyO2au6YS0Kbk8UYZjSKkSriZAiP14kfyE1JWjez2QvGclyDD7DfY7NQLDd3Gt/inItS032S4WdxhkiVmOjrJtlCK3+MLjbCAKEMEOr5SonG8BB2gmZaTRWEnHGygX/5GWJ+FnYe/NMLIcsbeBrAn9NMW/reI7y/qWglRUN+XOzF/9exgd7PmKUBEzBsMlJNBhwlQyBoPLTENHBUQR8OjpQ1Sws/o80lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqM4fo1oaHQDQh56XS1RRp5KeUjXcP5uwdV6i5UnzOg=;
 b=J7Ia1CuZLCjOJw8J0F190UC/IJB33QRSPYQnOxEb2L3O46LOIKUSqXlo8xQsyD9PwrRLPhdEZB9EBP6uYUhKgICoOURfuGQAlNe35inGSATtsFK5Lsa/Gqih0oDM+E+cFidrNW6o/eGX1Wua/Ix0jL7/Zx2lk6QFiA3jp+t2zEw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:31:08 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:31:08 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 09/14] vfio-user: handle PCI config space accesses
Date: Tue, 24 May 2022 11:30:28 -0400
Message-Id: <497de95cd7abe46350f62c748d45e691f7d64a8c.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f8f8567-5738-426e-2884-08da3d9a6ca0
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3117B7B2A86F4F01535AC43190D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HTupOOUwoHvGuGl6BRTbHpt7dFSe20roRhDGZMQQf+IlZYqqJYzBsOl85+H4iCyZI0LMfXNGvDWrcskylJbGdwo5QiuOF0y+0yZswauGSaiqFvapePeAJtEAGE1LcrV38N1Hva440tlFOvUMHG3PR6fi9R+l7v6FRr+ZsYI/nPoL3nk424J28J5vTCYmagV1NcG4hWgaQu/shYT3xGNpv5wWvburv0WkdTgQkG+mlD61xGvntotVqngSRltOcgY8mUZ2lSFc5YS5AbqcoB+mm7x+YuRQQ95JstSMy9KwzoksREoCJMIIohGbv8cboD/WEEkHqsbwdrYcVCyZjKWJIkWN2Xa0m30nin1hXmv7nENujGgHDAlK7LroY+zRMsiZ4IYQdCJRUMewPfbNgV6o9PY5+2vDD1Y2VZcOAh6/wuLQlky3Pcr8EWEELrZccCyV8Uq434R01Si21gmsiAih/NaQXY8c7nLXeX9EuBVQceIgg/gdm/ZfyUS/vUB57P5cyMtt4+4kpzn73DF8xaP3LUs/RE7BQtw+EoBeSfECCGOcztf/mKDE9ULifIz3kR/PLw2xdJsiArmUSmxp0x7TGsD8SOPz7VFNokToxQ2nYpNeBr9pfbTY33Kh3W7Rumb9wQCJ3YtwVqXhPERDMGx++bZw+Qjgys1bfSbb0OIKeR4UXarj9I2Pk3pAljJL7in9u6nwMfwF5CSSiFggl2UWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(83380400001)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Z2CKHujXs0EUIiqF0s08ih+O8oZcsKfp+bH686aWN+fi3hdjvhKk2iEQElg?=
 =?us-ascii?Q?oc0ycc0yO4obAd+sTlAFHFohduCx4fhbKXRdvetnqdOrA2wR4jrIhDYURgur?=
 =?us-ascii?Q?8yyDDOneBGR8X/dwiAYJ9N63til+iif0O/4G+HV86/fFtjslUZukVEAItORH?=
 =?us-ascii?Q?5t+/SY88w9k99psl8+OxEkhQeHovDNNaYAnx4CSlBg6Mvn9htvUH8FHqpnwY?=
 =?us-ascii?Q?1Pm8+uUuEHTS/RXpK6Pef3fFcxdL/KOOWXP4EMZ+0IJE2Nk6vJ67j0SHKfXd?=
 =?us-ascii?Q?pMwqDdwq376rf5dZD/oJhkyXOOcXhEx591SVXSPhm3YoaFQHICfBDMyHgpd4?=
 =?us-ascii?Q?XuodBvSMX5L1asILd4mLZXeeO/pKOlGpi404WlRGw2IAK8PvdnuUPuckl+xm?=
 =?us-ascii?Q?idonrSsd40XhnPc8eyCtFT8t0jTAZafClyt4oh09ebCV+4TSgxd6Juu1BB0C?=
 =?us-ascii?Q?2daCYngBRdzwIhsaUQbyURyYWi41AWHHMn/yz20VdQhM2zEeQoelbJfZML6W?=
 =?us-ascii?Q?1l8NFAn40YEEZPBAcSeV49w6e1WmGNxCB3t+8ENpP0XffJUev2nowCZ/4Bq2?=
 =?us-ascii?Q?xrdFma2cLEPOn+NCHG7R/q9ThPgLBc2ChIxPYc3QznEdHsR1LQhkeoVUvB2z?=
 =?us-ascii?Q?sqRtxDDD9qojzhjcdbGU2NyN5oi+WHQDFNzic54HqXSAhJDcWbPhFkzxz4Yg?=
 =?us-ascii?Q?7/hB0Hy0Qw132y/unbunqkWKIbpZao/hmoH5Wui41s8aD57Al1/ehIseGwyh?=
 =?us-ascii?Q?8+8cQyPtwfogsXujqhE/AeN+tB6Wu1gt+oPqRoUyHc9skx8BS4H+9IfFJ3PQ?=
 =?us-ascii?Q?H/7MoB5AbX+e4MpLoIFZl+HW0bIbAdM50Ngdze2RiEGhtfg4CdHwT80+FfsF?=
 =?us-ascii?Q?m6DjKwKZHMgWIY9xDU9rgha1eK0zPRINIVkAcS3ku+5KJR9bxceXWSfwHHq5?=
 =?us-ascii?Q?jbCxwjpLWYGkG9wkZv2fQ/SXudVN42atDvRTHvFGh/AR+UJe35eBJkaHo2VI?=
 =?us-ascii?Q?KClJc/PGHXfqZpp1nJKk6YmJuPBh3nT24CUbf6/BMdAh6Xo5ZV+voYnR4h0d?=
 =?us-ascii?Q?bMcpSAqFkl6mHXXhIoWD3ED6g7C+cejBZvUDOiC7xapSoTUuialvYpO8BMai?=
 =?us-ascii?Q?OHPnae4IqxjykqrNsbDf5QWnTSo3kEU8HaTDeZ7+lqKHKAuZ8DHtc2EvDqtM?=
 =?us-ascii?Q?tvHofd3FbKChSDAp/YHwrI8Ni5s/rluI2mBx03ITXoNfEfnSU4WNIDDbtRQw?=
 =?us-ascii?Q?i3K3M3z3ltM0ut1oaJm9mDyvAcWMtsioQUWTFD6Zu2K5LC08ZskC/wSY5s5I?=
 =?us-ascii?Q?dEbyaFKtN90y1sX6bFIIBk6dbCWMYZCzErUzYLDqq1AOAryH12dpRONIJEw4?=
 =?us-ascii?Q?/55JwcXiiIcbAumaHOIcyExnV5sKEbbBSCBHVXOpb8YU0mEc8gLZ7yEhJTDc?=
 =?us-ascii?Q?LLGGNOjB5lCT7B7LL71T0MHNQ1v1JYPv0JliLbAVpn++cCn260YCPaESiLQW?=
 =?us-ascii?Q?Eb6z++LPgbaSGUewLJ39hQKFJMyOggQOLfw6cU3e9n2ywF9BYj363iWwMhTo?=
 =?us-ascii?Q?6gRSP3KZq44jf3Anhf6lV+genlwsdUFpwkUKH/IcvDDRpaqZkaOeXfNteSlb?=
 =?us-ascii?Q?g4C9ovXkklDnR4qaoKILK9DhmCV8Bvtvzil4V38E0j3nOSspydKE2Ze/dgjR?=
 =?us-ascii?Q?NTTKnBRiVWWDldbIbXCxje1ZrmYaAN/CjEsTel8vrcJB8KYm4nw7wG+V7aNe?=
 =?us-ascii?Q?2mkutsSYxg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8f8567-5738-426e-2884-08da3d9a6ca0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:31:08.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cT3VfRrPM2fE2LaCAej4gfcSU8ZDI4/jH6/hDwlW1iiu0uaF9Y7cBcN2Lh5a/8BNvul8Jjya+GJErq+76EyA3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-ORIG-GUID: nPAuumOLT1cCLY8XOTN2CiUv6kvhEx80
X-Proofpoint-GUID: nPAuumOLT1cCLY8XOTN2CiUv6kvhEx80
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 51 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index fb5c46331c..575bd47397 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -46,6 +46,7 @@
 #include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -244,6 +245,45 @@ retry_attach:
     qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
 }
 
+static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
+                                     size_t count, loff_t offset,
+                                     const bool is_write)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint32_t pci_access_width = sizeof(uint32_t);
+    size_t bytes = count;
+    uint32_t val = 0;
+    char *ptr = buf;
+    int len;
+
+    /*
+     * Writes to the BAR registers would trigger an update to the
+     * global Memory and IO AddressSpaces. But the remote device
+     * never uses the global AddressSpaces, therefore overlapping
+     * memory regions are not a problem
+     */
+    while (bytes > 0) {
+        len = (bytes > pci_access_width) ? pci_access_width : bytes;
+        if (is_write) {
+            memcpy(&val, ptr, len);
+            pci_host_config_write_common(o->pci_dev, offset,
+                                         pci_config_size(o->pci_dev),
+                                         val, len);
+            trace_vfu_cfg_write(offset, val);
+        } else {
+            val = pci_host_config_read_common(o->pci_dev, offset,
+                                              pci_config_size(o->pci_dev), len);
+            memcpy(ptr, &val, len);
+            trace_vfu_cfg_read(offset, val);
+        }
+        offset += len;
+        ptr += len;
+        bytes -= len;
+    }
+
+    return count;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -336,6 +376,17 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
+                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
+                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
+                           NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to setup config space handlers for %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 7da12f0d96..2ef7884346 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,3 +5,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
-- 
2.20.1


