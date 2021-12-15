Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2D7475C36
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:51:18 +0100 (CET)
Received: from localhost ([::1]:43178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWYn-0001fB-Cd
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKC-0005Nv-8Y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKA-0008Th-AB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:11 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFELE5P028543; 
 Wed, 15 Dec 2021 15:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=TQdgYe05Ql0eIEvKeCcD0ED+VmMuLrl2ibuR9EfwY7Y=;
 b=Ykcsik3RXHMjpVdWe3vgXvVmOjoIwYh2WZ2GlZpNnTYoZrRhGIp3B+TyNA32hRJvSv/L
 ptNjtQsSiTvmO7GunyohWLM2SYGXZTIl9bZq2NxTE40tmSZJ1NB3BbdeNJUyxqCWs0uC
 2PNC7TyiRaKO9JdFy1J9fv97J961xye2i7cgi3Mi3wvorL0xuIC4eDS+MAqLnsOyQ5z1
 5pkLZeJ2piX//z8EAyQAUY3+e4x1JLAFZywF2aBi3i56aAJgyO4F/ZWGNiZXOH66bTWZ
 XiiTUPQsMfYKDWJ7G5CWYvnDxDY/TMVII03vtBvOPZMIxevrPVzUCB+vt84/Nn4rAGaA 2w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3ukf6ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUWiZ094235;
 Wed, 15 Dec 2021 15:36:04 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0tra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h96ISAgfobIS2vVH5w8L9Iy/d3ud8VDDyIoVXGiWS2XfyV/DPOt90TMgAzNQS3klOz62f3hXbaZlE2YnOg4OxFX8Ew4rL03gixJZhH25MdO3+g2QX4c7RYTSzg7G5BPC2IlZzqyFwzDpaPch5613xSme1JhgRQ6/4ApIyKwpZSqgqxhSQMUZCfOOGE6cssJCdRYEbaxTB1TUxDb54ZIxIdlPR4Fgr8dpIKaBm+bGwcoXMn5+TM/gSNnGNLjiqM5Z2JLl3JEVSBldIhlHAjVp9yjRZyxsjdZNeUFk2uIcaGMjBV88S7+B857joCKfkLIx/NN3iREdEEj+48N8vykUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQdgYe05Ql0eIEvKeCcD0ED+VmMuLrl2ibuR9EfwY7Y=;
 b=BKrIolNHwGvVsEGEBO6UVFKByGDvD99vnYelQJA3VUdhH/sAd/S3YyIBDJ9ydxCahPgzJwksHfyqfESbz4WKBSUuc5Lye/pBAIsky50K/rytKTcZyAk1DheNYvmaCBza99Xi11RtQKUlny7jh6fBD3ytXrw6LxnGYK0SVi33awlr9tV76XRnWa8x40VhBMWATw/koB72/L5cS4xvPiFt5EnKbEj28S5qUXS2DXfjBR92dehuVyQtwKC6ffk2xGR3DRmDPfw8l3DYmedBpNzzGgZQwpxkzvLHNl4+ZhMAuAuAU6GygOx0sqA4CYOFz9lu0EMSj24h5i4/jXzNeMpinA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQdgYe05Ql0eIEvKeCcD0ED+VmMuLrl2ibuR9EfwY7Y=;
 b=Hs9VCLqBIu10e8nFea81X+QaISWZJRSm+RSzk2vPAoQ1QvwKHXXWUlMf+N1Y/3AS99DTdEnoxoOrzMiaDRJAjLvLnZbCZyhiglQUk55qH3DFBc19e5QDbcF9V5Huy2ivxFqI27R/kVru0vF/gBOueYF7H5mErK1VzwSqtMLVkLU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5282.namprd10.prod.outlook.com (2603:10b6:208:30e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:36:02 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:36:02 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/14] vfio-user: instantiate vfio-user context
Date: Wed, 15 Dec 2021 10:35:29 -0500
Message-Id: <661e4b32da4b2ae7e0027fb483d74b96faff2cb8.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8eb8de4-8871-4edc-5633-08d9bfe099bc
X-MS-TrafficTypeDiagnostic: BLAPR10MB5282:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5282A47F657C345109DDDD6590769@BLAPR10MB5282.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8n6itNPSBw+Is4ifRkA5xYzICm2asoF6MqaNAF+5xI4x7KZMs3fiG1IN1wZx1psZy+cTopb8afH9WN9B02Ta/0W+lGUO/G60co2ILh/0fpvxOczRJdqQxN029y9oEGPufwaaj5V+cYYN+TKWoVBhaNMgO6Si/TTRHkXNqNFfwBC/5o9gLozrToVujsZQaWsyzAblufL5V7d76taxkH1dJi2zou2Ir4cQ57KtVdIR/F59RzSJME4mTQcQulkjaDtnq1X2hecLLTtSNqfb8YbUHTPk9GRCpGS/YMVhbr5zqMwTcLltf9Q/ZaGxOzF85sNA/MIJ3MAGuLOw9I34SEZw0q+9s+i7L62u9ITt84gbQAnd9shCrdKHBkWwp2gslBczxeXvDsQkvfxpZkod8PdGQJRJN1jwa9p4pUurhLuGJsXE8w3Mt+h+MXS86b6aEGb+wL0gVUPhRwt3AXfOzSAoWx5KC3f+7f2mOao4aosW/Ygg2yL4lvl49/+NbmfqjstBPOO+bHhGt+hMGNhcdQPR7QO8Xdl105iaW24VTWqnyFdz638YOB2YkErFIGYgm/JSqNhtOmUdzw5llNu6XGyjmEMM+VoPNffPvjMFtI1KIAio6RSOtoQ2dN0vD1CahfZZPbtPoeZN7IN1tctrabmOS4RtCvid2+KQbVZnDw4AOZxnmOtbsWsIilg8vDRHPeYdow8p+CZvlv3VwMATLi4zmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(86362001)(36756003)(316002)(52116002)(6512007)(508600001)(2616005)(6506007)(4326008)(6666004)(6916009)(6486002)(7416002)(107886003)(83380400001)(8676002)(26005)(8936002)(38100700002)(38350700002)(66946007)(5660300002)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hLOsCbrjo+Kik7scwKI6Iqp3aWVwGR3MKniy6MOkYkiAdOxi6kdQxjQ+8zYO?=
 =?us-ascii?Q?H4LnzYwWlJvt4bDI/Yt3z0EQBs0vkBaMUt7wfazl0TxN9C2rlN5FwRteZrvE?=
 =?us-ascii?Q?jOnArlFIl9yaCzv08z2RUTFV4yK22WEkRZSBxuc6CRlOd/rRBQpFBCYUowiC?=
 =?us-ascii?Q?rgg9HeWpG6Df5Bf40Sh9tk7dd4bFJzNr9k1sGnG9EH/yx2pb3CoPZ5iDUc9q?=
 =?us-ascii?Q?cWKcQOlt8y3YHXUO6nrBY+X/gFmpvuK9j9wST/+HOsFdF6ClJc3+CfTtFr58?=
 =?us-ascii?Q?FAk/F/r6ASAjoIla2A7gEBsFu2yVRzCtqAiv/gxlc6AXceiuH/w7D6QjxatR?=
 =?us-ascii?Q?y8Xp6guB3ee7Nru9z7tHweqUTmWJxJMwzknzpumWdzJ5f7gqfa+mmpVq1pxG?=
 =?us-ascii?Q?rn3nY2D2V2v/5zj44FX4k/EIpURyv95AgKBQQi666WFqJYUW0LADbIIg14AV?=
 =?us-ascii?Q?7elqdgQ1b6CLLQbXTzVICsaoJYxuwRVcAPZ3Sz/2/uGhf414WTFHXkjJbtge?=
 =?us-ascii?Q?cfYW/qrjaYTXI+z/abGVbsDsVBhhGLjQY/TS16B9Ykh1u9oqzdvJd6nEL2vA?=
 =?us-ascii?Q?AyeED9TxHmSLnaGnTpbew5SqHgEhWFLowvd0U5Xct3fUeQH9KEB0jc8nFY0r?=
 =?us-ascii?Q?wuNOp1QzSjZSdDxruTblGooEpImiBG+NrbZjMr5yZ0AUiMTscm4/2ETsTuqB?=
 =?us-ascii?Q?XWZRFWJTeALOAoA/5UBn4UAWGUdiQY2zTF88FUmfV9oaKdzUnqayDNREEcjl?=
 =?us-ascii?Q?/bpVyoTe+JmrWDvEl1OBmXYjJNqlwAKGJHX2yjy7rcCLJVsKj82ZcOFYcmYf?=
 =?us-ascii?Q?4dPHF+AgrtT2qM1pvStJCvArocQS9PhP7CR1A1rFTH2g9LcggsHL/44UyMTN?=
 =?us-ascii?Q?WPKqxfvwtnbkUm3Yz0jhtUyCz7aKGYPAt+EJMYTkEhy8/6Hj3V0QEuRpPEXY?=
 =?us-ascii?Q?5Mb6GqJnARwNlpX+8jSn1JNvyv5ylmElOGV2U48JvQSSma48kZ6cwohzI9Wh?=
 =?us-ascii?Q?3Cw2W6mvS5OTBwW5qEhGiO3b1GzSYR9iD4QKGb73UzC6oUOCQ5gi3b0kESbM?=
 =?us-ascii?Q?FsLsdf7IDwdNzvVh1Q62VNS5Bj6nW1CD7R9mYS1tVwjDnDq2E0maNcw8q3Dw?=
 =?us-ascii?Q?Ry9llWkwRjYt0y91KgXzefCrPBwOYaj4H4D6E76oM0ZDxZR5j3h5CEKythGo?=
 =?us-ascii?Q?MBK7c7siGpspiFkh0tNgyAq22jQ/i491QuxdhZO3NzTOQiFSQm7U1JxxSOxY?=
 =?us-ascii?Q?y+l3Km9lOw2VobktfIP0gOM4ZPY3vySYt+5y62NVpEDxHcMb/aW49hB7iq6r?=
 =?us-ascii?Q?H27Ly/Q5zbD96dRKM8Frd40saSZAkXm/z95UPH62GuDB7ThvmGdGokmf3eeX?=
 =?us-ascii?Q?oZGf3LCgf+yoyIj8azMmSi42WShANs0+/eA8nhV7tUqDhnTwv6bpyvLU2wln?=
 =?us-ascii?Q?Nv8fcXn9SiczRkcShiP2Z6G5wwmfrusEFL8W/uU/Fpf1H80qVbaBJQ2Mkag7?=
 =?us-ascii?Q?+YMk/kNclj5+/WcRq/g0gBzCC0pYrs6IJFHIWcpj7Y/wjnh8/blhM1IWtkbs?=
 =?us-ascii?Q?RTji15t5UTPTLw4YwmhGDP3Qi1ES8PYwPO/LaaPyW6IwgEUKviKlmeYSTzQ7?=
 =?us-ascii?Q?Aw9xMsI+tJIbbCJokKiOHho=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8eb8de4-8871-4edc-5633-08d9bfe099bc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:36:02.4190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngNSfazZqOdKqsCzLzjStgrUiibln+wxKj9EEYwjwFdwRL56bcbT1mZp+9nXJXvgjvqPHbqfjyJm1DO2Fu4YnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5282
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-GUID: ozLXfZTkurh7Y-znEwn69BJJ0AKaRu5K
X-Proofpoint-ORIG-GUID: ozLXfZTkurh7Y-znEwn69BJJ0AKaRu5K
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

create a context with the vfio-user library to run a PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 69 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 10296ef33c..f439b81787 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -41,6 +41,9 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qemu/notify.h"
+#include "sysemu/sysemu.h"
+#include "libvfio-user.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -62,8 +65,14 @@ struct VfuObject {
     char *device;
 
     Error *err;
+
+    Notifier machine_done;
+
+    vfu_ctx_t *vfu_ctx;
 };
 
+static void vfu_object_init_ctx(VfuObject *o, Error **errp);
+
 static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
@@ -84,6 +93,8 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
     }
 
     trace_vfu_prop("socket", o->socket->u.q_unix.path);
+
+    vfu_object_init_ctx(o, errp);
 }
 
 static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
@@ -95,6 +106,50 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     o->device = g_strdup(str);
 
     trace_vfu_prop("device", str);
+
+    vfu_object_init_ctx(o, errp);
+}
+
+/*
+ * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
+ * properties. It also depends on devices instantiated in QEMU. These
+ * dependencies are not available during the instance_init phase of this
+ * object's life-cycle. As such, the server is initialized after the
+ * machine is setup. machine_init_done_notifier notifies TYPE_VFU_OBJECT
+ * when the machine is setup, and the dependencies are available.
+ */
+static void vfu_object_machine_done(Notifier *notifier, void *data)
+{
+    VfuObject *o = container_of(notifier, VfuObject, machine_done);
+    Error *err = NULL;
+
+    vfu_object_init_ctx(o, &err);
+
+    if (err) {
+        error_propagate(&error_abort, err);
+    }
+}
+
+static void vfu_object_init_ctx(VfuObject *o, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (o->vfu_ctx || !o->socket || !o->device ||
+            !phase_check(PHASE_MACHINE_READY)) {
+        return;
+    }
+
+    if (o->err) {
+        error_propagate(errp, o->err);
+        return;
+    }
+
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+                                o, VFU_DEV_TYPE_PCI);
+    if (o->vfu_ctx == NULL) {
+        error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
+        return;
+    }
 }
 
 static void vfu_object_init(Object *obj)
@@ -104,6 +159,11 @@ static void vfu_object_init(Object *obj)
 
     k->nr_devs++;
 
+    if (!phase_check(PHASE_MACHINE_READY)) {
+        o->machine_done.notify = vfu_object_machine_done;
+        qemu_add_machine_init_done_notifier(&o->machine_done);
+    }
+
     if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
         error_setg(&o->err, "vfu: %s only compatible with %s machine",
                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
@@ -122,6 +182,10 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_ctx) {
+        vfu_destroy_ctx(o->vfu_ctx);
+    }
+
     g_free(o->device);
 
     o->device = NULL;
@@ -129,6 +193,11 @@ static void vfu_object_finalize(Object *obj)
     if (!k->nr_devs && !k->daemon) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
+
+    if (o->machine_done.notify) {
+        qemu_remove_machine_init_done_notifier(&o->machine_done);
+        o->machine_done.notify = NULL;
+    }
 }
 
 static void vfu_object_class_init(ObjectClass *klass, void *data)
-- 
2.20.1


