Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361F546DAD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 21:54:29 +0200 (CEST)
Received: from localhost ([::1]:38992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkiB-0004Eq-VR
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 15:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkez-0000Am-Om
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkeu-0000PL-VD
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:09 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJi0IT021319;
 Fri, 10 Jun 2022 19:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=wTG0AnFKpw9o0Sk/u5S0O8hM0u+ZhYo5tYnbm+PFelE=;
 b=ydmSrLg3kzuINDuSdSJfc83NsO8DIG9Fd0tEVZxj+w3g3xYBeMskqj24y3+BigtuG4KP
 K/osS1qPWwGD1eTQ76g/hZxcC915OzZQbA+WlNSOvnVnyx02wmOrBsUxbGOaQ8j2hwcz
 1OGFPLanoZ58eUE6DOnKhB2Wd7Iq1AMFIXWH8YYYGLZ2xs7KR8NKcxZEPzj/mqS+nPAB
 J1YRzh584MKNiSvqD4J0n9rfwFo7tGqH5jm6sVJX30o5m2iQd666Onyxbr0Okhw1YR9P
 2UUNFcHgBPCyCfV+Fa0yknhaKa+2paXx7wgblHRRmDbkclnFTYyZ7TPqVLQaEeJAWpDA RQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyxsprd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:50:53 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJjLKR030549; Fri, 10 Jun 2022 19:50:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gfwudf28r-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTZvlDlkAzisEER+5Lj2QgoSMKCOUr9uWBF5hYqyyx+voiqxTeeXTQlfEbjIPwQNcRwd99+Zr7tC5R4fre22MqTy4+pZqU4a2nsyBJISwIhPqzb1QeOqijfJoRyC7CNgbhglrH1aEmQwJqwhnpmTxOSAxzTAz8baDItpKn/CWfBUuqmvsUky+XDxr8pazCya3yL/zkRvTzP569g1h3hPwCcqgh3FAEVNOMqgu7Q2xWavdRfuuA20qj7TJVd8StZgjfOiV0bdXy2+VDgllqZAlKDLdiWkS4byZc3DQA52gmP6mKSIuDpwDTbXPUoPxdZJmLASDTspnp+b2+ZDh8q3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTG0AnFKpw9o0Sk/u5S0O8hM0u+ZhYo5tYnbm+PFelE=;
 b=Sla1OPWwxS4xIu07li6PoNTSn8FfKij/joZDz+RfLODKMPDWWh+r/QiklD2aNqscYpINaGlIJx9x4d11BAsMxbGKAsePM6BgOJtbmO7/XaUAgUCkCZ9xcpC4gg2H2O3ho2V6pLqi4n8Rhd0Ok1o1B0uJOrTpwG2u343sI/GigsnOnNnvYhK6vzqbhKZDnKsX6hZNKWEcjuvXl13pUxouUiC8lzcOqIc4FJTC+JTG3D/ZkS14ruhiy/LzgeA5xce1FTtRWPsjcghx9S2qN09GHVC5SlSto9TXs313GtOE5FlLjuoVoH8aFFXWcocy4qlw84GXtE4ajUdNUCX610ziRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTG0AnFKpw9o0Sk/u5S0O8hM0u+ZhYo5tYnbm+PFelE=;
 b=ZtkI4rcmDCs0viZE9tsVMtzna8MFyybOvoR86fEPc+9zsV5PKVS0JxR8XdVal09bT0Z5Qnqdixt5v2PsgrabUmNxhYpyWGGN4hRy4K8JC3UDaT3To7Ni9oOW4UvLjhF6ORQQcpGCO2Ep3kbkPKsV1H2/G3v3Cb9OMz27TQi977k=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM4PR10MB6254.namprd10.prod.outlook.com (2603:10b6:8:8f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12; Fri, 10 Jun 2022 19:50:50 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:50:50 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 01/14] qdev: unplug blocker for devices
Date: Fri, 10 Jun 2022 15:50:28 -0400
Message-Id: <00fca23089d8abd03581b7fa7fdbfb0d79bb16e4.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36117f7a-ee32-46d2-f661-08da4b1a84fb
X-MS-TrafficTypeDiagnostic: DM4PR10MB6254:EE_
X-Microsoft-Antispam-PRVS: <DM4PR10MB6254F932386921AD7C5EC0B990A69@DM4PR10MB6254.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AobAcgzN+kAyZuKUBVKmFIdla/1ES3dk6NbZVDIN0c2Ws6gvSFCPnzNcyC/Pgle+Byk3tw7iC6cOAsuSVIs07rRTG11BC5NdVALm02gfawAumkuGNBv3ahjfOgUxF/VX1XtSRTYt9tX3k+YtudeuGfdOKwan6WLtiP+wzv5t1hfERzvbzOGxLCz/wxKPlIdayQ9hRw14yDIleEdCx8CgIY+scGB65bXRf29F/m8N5Uxwnu+dyx1y70z2GS8pF3gDkoP3tE96TyEFdM/cLuqtVmmBiGs3OF+EgO00l/fOBGkP5GlzuGvuim1K2dw/q71HW3R9qWW4LkJQxF0Q9IMor/wc+9I0Qg8E3d9HTq1pAn3XLYCu/P/xPktGB+0D91vEFzK6Rjqe/E6SstCf76CDqXkD7c9tpMySQxSi0EBZNtVtyJPeKP7jjVSH07R4DbOQWyOiE0w1tA65dnbK+QeDvpf7W6D/XUC1FGbUvR3Z46segV4tbOC71EJkT8yZY2Uzb7gGwOrlevfDhY3H3GWSnTytjP/3cdK+IXMjjwrYc8ZLtzJUIQfwBHjze9C6gXECYujGr7Y4Vf4yrB1Tm5m86+9uvVGRKLHpq8O0CBjEOl0HNgQi+dMIelnkac/iHIgqRIKApPDWeM3GUBAsuvTEjpRKKyXfNN0FEJWqVSJZ+JZkk9J9R3eBz0RYJskoCNHDtUcPgj0bW4w1hoTq3/cCdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(38100700002)(26005)(8936002)(2616005)(6512007)(6666004)(36756003)(186003)(6916009)(316002)(83380400001)(6486002)(38350700002)(2906002)(6506007)(86362001)(107886003)(66946007)(8676002)(4326008)(66556008)(5660300002)(7416002)(52116002)(508600001)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tYw/JGkH1PDSbwjBoSQ0+xq4E7QS8HJ18rEB/9IikLQq5Q9YExgJ03MmJ7AY?=
 =?us-ascii?Q?jhwqm5SXLHZsxUk9fJiL2bxUZS8fjYtIyZuCEHO0hkIGvnAoxRRoURMoivJ+?=
 =?us-ascii?Q?X/kXlhULFt8JM9Ev6Wr4BQp9PcqmFyXk/EqAw3EcAM+nzhORzIjwCypFelTx?=
 =?us-ascii?Q?4TcD7NhCFoVPgQ4YPWJgNTqy7OplnolLPVus5liJnVxr0UhMlI8KCNInmXzz?=
 =?us-ascii?Q?pNDhYMkO2iwh7zUHO2ZzYR63mDO9Z/FJigfoMDMiQskzQMi38y+kw3v7EHRL?=
 =?us-ascii?Q?+cO41n3Q0833IzkpNsP9RrnD9b2GqtguWZ7elaApjfz9gxAoeWrljxLnLvZn?=
 =?us-ascii?Q?GuBTMuDL6aovyE0GxA7An8ZOP79EdzIe7IAvRHS6hyKxLDuPEeoyCDAdS7Pc?=
 =?us-ascii?Q?0rGuBSI+YvBa19l6WzeDKAjLaSFfS2ZAPJ0Wye1mCeB48Ne27i+ZCP1nkbNI?=
 =?us-ascii?Q?XHTo1/hyWptV81yn7wch14VZgUsaYN8QMDly+/cvHZqs1/bcsjDJIoWM6bOw?=
 =?us-ascii?Q?Wlg8sehzGgEx5/QV9PwZrp8fe67GaVi8D+0wnJMewq4p5yza2gwJzUY7Z70k?=
 =?us-ascii?Q?DTLjdQwPfk5iQhT0tODtrTKlCoccN5HWDPZih1FcDGI9LYIBfcnPE8tBCo+f?=
 =?us-ascii?Q?zthJT3gZSPX4xlp51Qtt8XO9JD2d0SoPmXXshi9NwNHPiqKz36hK+W99BvEz?=
 =?us-ascii?Q?r/S/UaJM5YT+Fh58SBURHRRN/sX8LjXI3NzJWZO/SaNK1xe5COyfGI+60PW2?=
 =?us-ascii?Q?bY6JccuJr748rz/s9ord/4o7/OD9haufNzK3DlyK8O/HPjleWcb75PD8Ws7J?=
 =?us-ascii?Q?mzbFpzq8vLEAkW1auFfTaQ2iy3UGqmEtwlph9saKAKYl+J1+JWPb+umMq0Hh?=
 =?us-ascii?Q?3cdXn+Sot5QR7EgeFkk7PJ34eMShApAHtTgIsCPIl9L1erkRPGNFf9dqFOoB?=
 =?us-ascii?Q?xl72btQUuPxS8OHnAhpaJyNpFhzihQ+itGWR3uQ3GfupOqTF7LDr71HNRPbZ?=
 =?us-ascii?Q?DxpS+cUDU2uaF7e61MqYvuC7ZN+swjNEjdI6ayXDVDtL4vDROrPpuqTgUv1I?=
 =?us-ascii?Q?tzf9zxaLerjV7o16jW4zHxzod7Qohio/Ol+u1IEauz40SlJ+XPgjANimG/O0?=
 =?us-ascii?Q?T5wnQJP4aSm5QheumBEwJmig6UM9EIJ2R0MTsDcZCoBaDjOEiGw20iyBxphX?=
 =?us-ascii?Q?NSay/EYwmjH9tYfqylrFRBuwei8KQRSHjYYLU+ESHWOLn38h9hpdWoHPYmig?=
 =?us-ascii?Q?3SHv6S+WaLCIN05vdI+zznwj7F4PObrYQnqkGagTvle1YfwGnke5xViua87U?=
 =?us-ascii?Q?vCGlZXpjHo7I+9GGBtEVnjZDhmEK99ZWRkYwB0OIS8fHdXfcoFTt6d0uf1Vw?=
 =?us-ascii?Q?/h0vxdoswhf/KMy5jZgYu0bg9xpq4xjp3eqsiTgBXje1REQvPHD/O3ZOnSsT?=
 =?us-ascii?Q?lo130bMHDZZMsTR3hdhVJinEF4cYHOIGXlvE1HhYMnAM5sC4eysRbJHcdK82?=
 =?us-ascii?Q?U0G0yOA52+xB9bAzdWrW8WL+XnL1yM5Ii5hIs3i2XsFI1HIIjaeYGeAoLo/P?=
 =?us-ascii?Q?IVowcsop/A/5+3N+efeA6XouvJSdgEMiJvGUYgqBEVszFEWs9UuVZtwvKt7Q?=
 =?us-ascii?Q?ofbuH5tPGwtMl+seqygV+s2joCiEub848G1UIvL7gxUiAoXKToDWkuWVFI8J?=
 =?us-ascii?Q?QQjii1SiTXeCub/CRq4jOyt7RnQlZIcSCOeVXC0RIaLrE01BIgM/FiMsXqGF?=
 =?us-ascii?Q?hbV4P1sLuQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36117f7a-ee32-46d2-f661-08da4b1a84fb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:50:50.0090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2bQiU+NjRufSzz5BcSjOQufCUvAWK4OBar86VhqW/8ZxVHgJbff1jzsBY7G8VLeI5rmKtCCNSGTfFC6IhFPAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6254
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100076
X-Proofpoint-ORIG-GUID: LztsvXDuS4_lsCbr2S63zLBNmyq6pw-1
X-Proofpoint-GUID: LztsvXDuS4_lsCbr2S63zLBNmyq6pw-1
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

Add blocker to prevent hot-unplug of devices

TYPE_VFIO_USER_SERVER, which is introduced shortly, attaches itself to a
PCIDevice on which it depends. If the attached PCIDevice gets removed
while the server in use, it could cause it crash. To prevent this,
TYPE_VFIO_USER_SERVER adds an unplug blocker for the PCIDevice.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/qdev-core.h | 29 +++++++++++++++++++++++++++++
 hw/core/qdev.c         | 24 ++++++++++++++++++++++++
 softmmu/qdev-monitor.c |  4 ++++
 3 files changed, 57 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..98774e2835 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    GSList *unplug_blockers;
 };
 
 struct DeviceListener {
@@ -419,6 +420,34 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
 void qdev_machine_creation_done(void);
 bool qdev_machine_modified(void);
 
+/**
+ * qdev_add_unplug_blocker: Add an unplug blocker to a device
+ *
+ * @dev: Device to be blocked from unplug
+ * @reason: Reason for blocking
+ */
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason);
+
+/**
+ * qdev_del_unplug_blocker: Remove an unplug blocker from a device
+ *
+ * @dev: Device to be unblocked
+ * @reason: Pointer to the Error used with qdev_add_unplug_blocker.
+ *          Used as a handle to lookup the blocker for deletion.
+ */
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
+
+/**
+ * qdev_unplug_blocked: Confirm if a device is blocked from unplug
+ *
+ * @dev: Device to be tested
+ * @reason: Returns one of the reasons why the device is blocked,
+ *          if any
+ *
+ * Returns: true if device is blocked from unplug, false otherwise
+ */
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
+
 /**
  * GpioPolarity: Polarity of a GPIO line
  *
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..0806d8fcaa 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -468,6 +468,28 @@ char *qdev_get_dev_path(DeviceState *dev)
     return NULL;
 }
 
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_prepend(dev->unplug_blockers, reason);
+}
+
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_remove(dev->unplug_blockers, reason);
+}
+
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (dev->unplug_blockers) {
+        error_propagate(errp, error_copy(dev->unplug_blockers->data));
+        return true;
+    }
+
+    return false;
+}
+
 static bool device_get_realized(Object *obj, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
@@ -704,6 +726,8 @@ static void device_finalize(Object *obj)
 
     DeviceState *dev = DEVICE(obj);
 
+    g_assert(!dev->unplug_blockers);
+
     QLIST_FOREACH_SAFE(ngl, &dev->gpios, node, next) {
         QLIST_REMOVE(ngl, node);
         qemu_free_irqs(ngl->in, ngl->num_in);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index bb5897fc76..4b0ef65780 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -899,6 +899,10 @@ void qdev_unplug(DeviceState *dev, Error **errp)
     HotplugHandlerClass *hdc;
     Error *local_err = NULL;
 
+    if (qdev_unplug_blocked(dev, errp)) {
+        return;
+    }
+
     if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
         return;
-- 
2.20.1


