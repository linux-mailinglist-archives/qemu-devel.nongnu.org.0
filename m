Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3E51C638
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:37:41 +0200 (CEST)
Received: from localhost ([::1]:45280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfQ4-00017f-1v
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0q-00066t-BL
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:41 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0k-0002Cz-JT
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:33 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245EeRAB026258
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=tMhPJ6I8x9XnOpLitiRP4wsXVpLiDj5kcfeRdrChY00=;
 b=O2B0ohZsD55aEuDfDXrOXX5Yv/tkO14244U7iikFgWH413MqLY/QHik0Z7EFO0QeLUU3
 5X/u58qZPX8ch5I/HSfcVknttPSV26VaAcpGtAnKCHBgWIJbbM2bzmqg2/g6Lbm9Fls1
 ULD2zb/viJgrMuAfEwbQ4MqC044PNk5RmeHBxizhtcIXASScXm65rcbs86MJAaY5qXAd
 j4pPtnoyoWRy95oHlk+6Zs8us1DoJFpb7v8nMkCwYlyBFjoHn0fHzrGWDwc3Jovtm3S1
 exlaQ9Tj77Jh6SXI0rPV/nDBMuZqHz/UjaB97MTANWv8HPM2aQxYANZzKi/LbLwlIysU ZA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcbs6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:29 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H0ZjO006371
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus8ybfxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEaYzRFruKn1av2RjHaimMEBB3D2sD98h0vyrHwGrGH/x1SJLfdZisSh4QqEW9Aga222HBQ19MyhMEAHiAJg4G9tci5+sEUDQ9N0D18BwgiEI0UmL9+SiJkzNI3eBrAGHffApoKlhrYm7x916o+d0carXbhmTVXFu5WqgMrRE/kQCzpOLeKhCWK0dmlvgJ9LnVy0Uu1zuho/Ye/z/2SwFn6priZWtd9u9QP7+gOQ6OYKVfypxykOIPjeYyRFcyTO8W0b9vO2HX7zd2gkFsrFpgpRIF9vflcf7Z1eRmcxKiAPxo2zSyo8le6khUTG+zq/b2z5saQzhOHu7TSLaG4Qtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMhPJ6I8x9XnOpLitiRP4wsXVpLiDj5kcfeRdrChY00=;
 b=X0+BOpWLt+VnE8OQg/ma8FMLFel+MaCcr9b8c5IO/0/Adh2UJV8xzfq7oMEWEaGiNPip3q0SVBKytzq7Iq5ZAfH/MoaDhcmWcE79qBWfLTmu0eL4RICa+A9bU4jVu8lbdIptHS+qgfj442BkgUtEx43vzMdw9eeYxMkcVfNmywhHxD7ucNR90+T+RcYe/YnXSHAWW+XKqmNp9k5J/V2b4SmamLFwdWwhPxEyfFoxtnC1GxDOkzuZ3KGTuiw55M5kXv91GqbAqftgmUtjMdAyu6gGAxmDVmF79MWS6FtkfZ0Wa7qL3qi/u+dLxvXyHe1NrZ8jR6/0Odp30dxckKGA3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMhPJ6I8x9XnOpLitiRP4wsXVpLiDj5kcfeRdrChY00=;
 b=lkYHriqCNNOhKILS/WLAZXmVqaBw82tubcjgxk3GysAG4U4Bf7XRKP2snm74hCGcrtZsDkkqyNWfngYWCNKpajXxVY21JnJxxgCfv3426nvgoIG5C+ST1UECIWClvzDxMxPdATP/YdtT9ngKSYpT3Aq5zNC6egODyiLhzJ4tJqo=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by BN7PR10MB2689.namprd10.prod.outlook.com (2603:10b6:406:c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 17:11:27 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:27 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 21/23] vfio-user: add 'x-msg-timeout' option that specifies
 msg wait times
Date: Thu,  5 May 2022 10:20:04 -0700
Message-Id: <cdd60ecee4e34d4c6d4315c529656d18fe95ad5e.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21ff9bd3-6d16-4cf0-54d5-08da2eba47b1
X-MS-TrafficTypeDiagnostic: BN7PR10MB2689:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB268921BAEBC5D6651CBE56D0B6C29@BN7PR10MB2689.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0BGvWfpMmR9oZ1sLD0Falxl4l7Oqb3oxalQqjNDVOcDeLyafEDFl4XwFeMwKOy5YM604k6Dgyh+dpV02v61KmH3uWEcsgLYATzg3ZUSYHHV9kSOZsvxi5GAvk5WU6XBZPFasFURC1drXNw5wbbS7RC3rRlpgqTHO0POh648/GEVji55l3YisriXe5VZGSgAu8jY7g4r6QE6roEz+qMT0oKVcZ9ckF7sLexNLP18yfp3bniW8KeOMUlhSHe8Xfteo5h1A50BavMZgRNXgLo8sfBDIxHHkUr9XOpuaKnblWXlkhTrk87AaGZVaUZiTwkK00Md6xVeTDoqjMFY/Isn5P2MH1uhT56RrBtXlWTwAgZ5R/WjLNFRnShPcQLY6b6I+jMK11WvqCXLQLHL8zDTkML0EF6s7JDeS4WsfyF5KUZoRvckH0wHlhLt3x2kYkZxZFcVkJXcWt9rZhEWAnpErV7EQ+4Xp1CKJSydB+Z1jL7sCfTqGKbPm3nZ+a6o+zIFDk69TcIyYcOHsrDu71I9Vqxd9C/tUriI8IsYyHYUKRUkJKpPMwcsr+dW6uJY28s3BHfvCy1HNJJvUlmnjjEJdsx+VpG7OvRms+QUXBdT+1dbgH2INiTtPxUNF76hZg2N5tWPSRltVAyfJqz2xvndsR2abdl1JQuPOqKLgZFp5Bt9qDK99jJxerw0/IzexUQkq4sKrEEVp2B4QJYZbmss5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(83380400001)(6916009)(6506007)(6512007)(38350700002)(316002)(36756003)(2906002)(2616005)(26005)(66476007)(8676002)(86362001)(186003)(66556008)(66946007)(6666004)(52116002)(6486002)(5660300002)(8936002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HT4pwvf9mFkB3qk6Yp5cedF41ukEG/je+pUnf5SgkMtHcdLawhNOBpOfM6As?=
 =?us-ascii?Q?QAaxDU9yu1PJTU7deLi4tCBFV3BtzqVKiEHZ15pbgkaBt8Ou3LXgTmDhrhdF?=
 =?us-ascii?Q?QfyplOIC6uBi6D7bR3Ez28/1mUmx0X+CJ2pbnVkEFTRLKxaGstjzEKEJFK3o?=
 =?us-ascii?Q?fADKSfx4o5tRX1vkhao86cWpcwCy3cIu1h+KIAyVQ7eDB0rIMj7Dr4t8z1Z8?=
 =?us-ascii?Q?MlhdqjxKBOX2FCF9NPjprLcvRZu58q0HiIorP3UwaFgoM5BWnMfNrEQup8VY?=
 =?us-ascii?Q?/Ec9VRfJrzKKzphv6EhSbrYXcW/dyG3wTNM6/WGZ3y4tsHYtXppBCyU63dZc?=
 =?us-ascii?Q?SjRD3dQ9cI6hgxp9Q2kJHZ27YQnS7Anjn66GMhb81ENt0u1OFPZiqdA25jJj?=
 =?us-ascii?Q?gXJL8Sg4RybECN0LJGsECF6dBm/FYumtMbtcsKSL7Gxb2gUYqVWqFGTCAo6R?=
 =?us-ascii?Q?/w2EVImyv+nQBAROhTf9v8dr2ruqWH2d67ZiCVG2E6I3KqgNsOBBG9YzG4M3?=
 =?us-ascii?Q?RxoNyX0aV8ppEGfLc5uL1/IWW8M/xk2lO2Y/wV04ghed+siJdXtUMAd5b74a?=
 =?us-ascii?Q?NAiEnCZPOVZ117jrQW6kN5tysrMVaGR/5vP51qFx9QpezSEjgClvHQLABsir?=
 =?us-ascii?Q?MrTbUPYpChgOGGrdRgB80Nm++59qNccK9rKCvzcaNEEoEyy/RTnPbazjWQ3m?=
 =?us-ascii?Q?y6JtYowv5lPu4yTlcHaklAVCcUiikcnpNX+cBGCwlxyxKieO6PZM2jYCMmIJ?=
 =?us-ascii?Q?+vZ+jgyo/CdOSf+0PZ02HZJ1JHSI1NrzBjvV9x2B39jdAJeN6CiYM4OAV919?=
 =?us-ascii?Q?7K9iB/84T23sNJJJ5woa4l2JJwe9rHjlAXyn21YerwnwLxkcGKM2H23YHJ9h?=
 =?us-ascii?Q?jKbBqlbmKddj1mIGVPsxXxyq4yAUq5I9cWqr0ovBXbG2HrUbF9sMs1y7ZnJI?=
 =?us-ascii?Q?lVst0mHVYubJc+4ysM7wdeFbhzFIYXFtMocCnCXXxvy7rlYw55nWBV41haFQ?=
 =?us-ascii?Q?RV+s3jQJchnH0LwGF8X8jpwZOSSf6Nhi+Akzd0wYK93aw45zO5QridWCahM/?=
 =?us-ascii?Q?zAgk0WCSUBrif0FNyNX79YwPJU0XbTqCTPLeOTzSBkGPGMORLHk1LOvM8JSf?=
 =?us-ascii?Q?lEEkn7sIHhzGW2N/C8OWlNM2subZXHmMSkYQPcRqKmVhzjQktrWJKXiOnFTE?=
 =?us-ascii?Q?GaAl1QxgKRw+oBL87d0VmR0B8oKs61rHPNlc44hMGOBlYKNDGXEF5uiWf8dn?=
 =?us-ascii?Q?uVKD91sWx8D18yRmeMRlK/ZmNVEsdTFCVIO1w29NkuvFwknqZRtzJK7O5A+r?=
 =?us-ascii?Q?ZlIEsHtcg+Ap1GPth0bj9DSldzPHkyBdlsGYUretsQJIFcPn7CdwWpS5wDqF?=
 =?us-ascii?Q?Sr1q54M/meG3CIE87VNudX7FSpQxjit5nVzy1j0DJ7r1kLG9lTZxzwy+JURx?=
 =?us-ascii?Q?Ej5TTzUIyVniHBtm3/OqSZvlTUDPIt6iSeQYJbVq8tdFbU9ZmjMtTxPwPkS2?=
 =?us-ascii?Q?U2tZeGzpfDcrh0EpnDitaYMjwQ4y5nbnhws09FISu4IIZJjQhP2/Wm3EzWuN?=
 =?us-ascii?Q?ujonBJo2zCwq+tSvdfO5FBFK+JjAH4tE+lgYWOzZ9dVG0wsP742wHfQlKJZL?=
 =?us-ascii?Q?yZQgd26Te+6HvAz7QR2VSvYZ8XVnIxjsG4R8tm/Zt+msAiOJZ4ZfoGA2oDob?=
 =?us-ascii?Q?b2fWglQ3tVaPL4QWfav37IGyvruoMfdGO+KlAtaE/0Y59xy8AiKd1H3goVOe?=
 =?us-ascii?Q?zxDXp1crSsDsKZLe7sLO0TrnQE54M6c=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ff9bd3-6d16-4cf0-54d5-08da2eba47b1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:22.9195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuEHC3IlC9feuxhfSjPzTSJ3DIR7eeeOynQHhiazkmXJFBnfNxWaqORa9uDc4/W/jllRjXiBxMlrNee6yK+MmklN3V375eaSWeBhES2iGZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2689
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050118
X-Proofpoint-GUID: q77cTvFFryE1GREbpt2QaRSRxIG6EaSU
X-Proofpoint-ORIG-GUID: q77cTvFFryE1GREbpt2QaRSRxIG6EaSU
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h  | 1 +
 hw/vfio/user.h | 1 +
 hw/vfio/pci.c  | 4 ++++
 hw/vfio/user.c | 7 ++++---
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index c207847..ca50858 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -197,6 +197,7 @@ struct VFIOUserPCIDevice {
     bool secure_dma;    /* disable shared mem for DMA */
     bool send_queued;   /* all sends are queued */
     bool no_post;       /* all regions write are sync */
+    uint32_t wait_time; /* timeout for message replies */
 };
 
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 902facf..18c6404 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -55,6 +55,7 @@ typedef struct VFIOProxy {
     void (*request)(void *opaque, VFIOUserMsg *msg);
     void *req_arg;
     int flags;
+    uint32_t wait_time;
     QemuCond close_cv;
     AioContext *ctx;
     QEMUBH *req_bh;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index f4b4a30..b103d08 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3698,6 +3698,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     if (udev->no_post) {
         proxy->flags |= VFIO_PROXY_NO_POST;
     }
+    if (udev->wait_time) {
+        proxy->wait_time = udev->wait_time;
+    }
 
     vfio_user_validate_version(vbasedev, &err);
     if (err != NULL) {
@@ -3840,6 +3843,7 @@ static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
+    DEFINE_PROP_UINT32("x-msg-timeout", VFIOUserPCIDevice, wait_time, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 262d1a7..ec2d89b 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -39,7 +39,7 @@
 
 static uint64_t max_xfer_size = VFIO_USER_DEF_MAX_XFER;
 static uint64_t max_send_fds = VFIO_USER_DEF_MAX_FDS;
-static int wait_time = 1000;   /* wait 1 sec for replies */
+static uint32_t wait_time = 1000;   /* wait 1 sec for replies */
 static IOThread *vfio_user_iothread;
 
 static void vfio_user_shutdown(VFIOProxy *proxy);
@@ -718,7 +718,7 @@ static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
 
     if (ret == 0) {
         while (!msg->complete) {
-            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, proxy->wait_time)) {
                 QTAILQ_REMOVE(&proxy->pending, msg, next);
                 vfio_user_set_error(hdr, ETIMEDOUT);
                 break;
@@ -757,7 +757,7 @@ static void vfio_user_wait_reqs(VFIOProxy *proxy)
         msg = proxy->last_nowait;
         msg->type = VFIO_MSG_WAIT;
         while (!msg->complete) {
-            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, proxy->wait_time)) {
                 QTAILQ_REMOVE(&proxy->pending, msg, next);
                 error_printf("vfio_wait_reqs - timed out\n");
                 break;
@@ -867,6 +867,7 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
     proxy->ioc = ioc;
     proxy->flags = VFIO_PROXY_CLIENT;
     proxy->state = VFIO_PROXY_CONNECTED;
+    proxy->wait_time = wait_time;
 
     qemu_mutex_init(&proxy->lock);
     qemu_cond_init(&proxy->close_cv);
-- 
1.8.3.1


