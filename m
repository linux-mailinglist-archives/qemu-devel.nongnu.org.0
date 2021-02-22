Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83BE3212C2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:10:34 +0100 (CET)
Received: from localhost ([::1]:37802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7Ef-00042B-Nl
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lE7CK-0002Fo-3l; Mon, 22 Feb 2021 04:08:11 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lE7CF-00007n-81; Mon, 22 Feb 2021 04:08:07 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11M95BHh086628;
 Mon, 22 Feb 2021 09:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=rpYf2g5i+FmKY1UIItcEQGuVewKFKxf8AxyPKgo9A84=;
 b=pYbSl9Nnols1SRUfGn22XTPghfujAzm/YpQJhXFhQxJN2RIyPn4L1Fw53Zr4egMk1mRV
 Amily7dhS0i7pJJD+FSZaDrRCh14kephC1NLInp4ZwwGyT33zIZXnkz9iddA1OPM6DXd
 vAcDt821KJ3NCoqde11TSFlQXu9u3DLPHfmOCIY/pDqRSkDUM5nc1YigQ6Hy7DyTk0ux
 6CN8BSDleI7m7BdquOursw6EY/vN8NHTno5JaCFCuoZ1iZqsDw1cNCYiC0qzCKUWuCJu
 GuWhUmzxM5xN5t6kpUGUDN7fPQzc9lYr+5SRHRGdCmNjXnvQPybKY6ArmLdCOWgtK0HM XQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 36tsuqtuu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 09:07:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11M960cO181046;
 Mon, 22 Feb 2021 09:07:56 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3020.oracle.com with ESMTP id 36uc6q2xgn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 09:07:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmQK3xSmM44HHhhgrAgZS/CaXj6NPuL/vhMAfggB6VksrgWthk55Hp3YZbPuWpqUI+fPaO9ZsX31WdPiDEA6Y6UzdKrA/azVZi48ZA9q3eR09QdULVHvs2ODaJBfFp3jARtXiH0EMtbLM9iEC3rK3FhB1uQQ6QpjjzadqHph2f0n8jBsZAiqrzUNNdiwmhEzMjW86eEaGJw0bnvFnMNXElBtv4NG/IdnXbc2suHtuiQWqzGN5Awhj346pG5mtI61T1KqWk1E3wB39zhhZmtH2ZHP+lvs04mcXF2PG+D0MFzoF9ebmlJmjRLWxT6/acM069/Rpxc1tTCjpTTtGsXh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpYf2g5i+FmKY1UIItcEQGuVewKFKxf8AxyPKgo9A84=;
 b=J75jVLqIHHwuWNpIEhP247P/iHMWgIO9347Bjuiqmr6l53aFBW4ZR8nVyFSSufyGfbH6FuaytuadUvOIHmSiPx2M3FRlZp7+C+zDs5n90UR68Q39pzS37fLweKHAS/Fxo4tjhdCUpzkFkPnc0BCQRXgMuj7pBVYc3PKNCtVzVoiEsQIkneIVwcodDatiRm8FluW/iHJ1c9Or1aHZTxvEHg9ySz/RQlOo9LioLbabzlZKPCD7KAItequBQWagB//ow+/0u//mwdLPLDjRAPZOW9FCDsnUhHdThLfTmQBxHZn0SoRvDzd+I175+f3TM0uV8SEBPLo/5jqwHzxqDcuthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpYf2g5i+FmKY1UIItcEQGuVewKFKxf8AxyPKgo9A84=;
 b=XsdjIxQBwfmhFWx8VUST115dmKt0ucThaxNZRCj+gnksfZibq0S5bee+1ONrWvn9luuq/iLFE7tjb5S4otiN7zFSGJlHGBwilyXYg/VEMtOMq6GRw3KfImr/ibUuXIVlrjltUDWxqzUjL0+7fgpzJ8CBapBhd3Be4gvHMXfoqhI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3227.namprd10.prod.outlook.com (2603:10b6:5:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Mon, 22 Feb
 2021 09:07:54 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 09:07:54 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/3] hw/pflash_cfi*: Replace DPRINTF with trace events
Date: Mon, 22 Feb 2021 09:07:45 +0000
Message-Id: <20210222090747.2310104-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222090747.2310104-1-david.edmondson@oracle.com>
References: <20210222090747.2310104-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0384.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::11) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0384.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Mon, 22 Feb 2021 09:07:53 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id bf484353;
 Mon, 22 Feb 2021 09:07:47 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b114087d-2961-41fd-5c7e-08d8d71156f9
X-MS-TrafficTypeDiagnostic: DM6PR10MB3227:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB322762E5C2ACBECDFE13008888819@DM6PR10MB3227.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xJ6eOuqIPzwH4W6NiP9Q5B7aAoBGPjDaS7dl4wRv4sVu0g4b1e9j9JPgSemoAxB4nXswFK/7ZGITxW08G604CAxuVrzwhrau6a5u8bnG4wzU9O8Khxmmh9sot+4NAB4lSUVuBAYtw9bXDmu/ejcXUodrMdlcr4efRxn7beK1qLOF8+O9nnLTn5tR7CcwkUhjqXXnKHEMVR5+IXEpG4qW48co9x2Z1BSy6kSAk5z+RRfA/Na2Qr+eag3nTzB//2J2NRaA5VBd1sxNBJVswfhahol/wwLLu2D1nKzZpXrQ5bEkHsTNnngy+yA5uUiPboaazPkN2f5Ufle4q6AU3Ao09ieOkOXuvDgPFTQkeS1A5kuUFsQmEhoqCg/qbzqJ+ilmHdvaypmWe+YKtc6aWUwcq5XTiMraSlzy2ViwbXIrOxoQSb8YsDGbCY5650667wud8FpjtFTPDPB347otRZLrRYT56BqcL3BOie8MH63ljAjMH1TvOTA9ZcsRj1bTMp/T4pmz1Fif3/6XVRl67FsrGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(396003)(39860400002)(136003)(54906003)(2616005)(52116002)(8676002)(83380400001)(5660300002)(36756003)(316002)(186003)(44832011)(30864003)(66476007)(107886003)(478600001)(66946007)(66556008)(86362001)(6916009)(1076003)(4326008)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?k0GJkUduJ5XPb3p1iITbosOAp0C3j48jG19RDFzQaCjcSV+bXQYqkZC3Kk83?=
 =?us-ascii?Q?5HUJzlS/vu3EV+yYOOAIb0Frdx4988CFSbXo+Uc+OAZoqmyqoaJwghdKCotF?=
 =?us-ascii?Q?yx73P5V8QO2dLdsNRCn6OSJ2OjulijqMBhfLaopm0ag4MR14FzabuOXVYsPb?=
 =?us-ascii?Q?ofyvk7iCyxs13rLIOE23OqWVLbEB+e1b/aRh9F24EXCHnNqP7g2VJRQgnl7U?=
 =?us-ascii?Q?eMaKKAgTbiudy8cVeJ0vrlbUAo4sknUvvVNZoX556lJjEr6kjTkcU2fg09pc?=
 =?us-ascii?Q?5xOvtVLAiuFsirdRZZG28w38LBrlrBB4UEhLuesoGqVJI6yscs2ZB+ipSC/r?=
 =?us-ascii?Q?XKbMhuYJNbQc9pFgrJ+IktzMjxlNmqus+N+4KXXaVtViAVJxFR3YWW6Iolol?=
 =?us-ascii?Q?wyMb+lTx56wXSf0GJf5OJnhgfjPJxNvPvu7Nq1kIMI/AaGGMkHDNABQ9KDRi?=
 =?us-ascii?Q?XDFc8cnzYbBNzqdkX3gfS7Ye4wzGNvjiFDQzZmzWSOYJFvXmo3+FE4iBllnZ?=
 =?us-ascii?Q?soyl4lobsyAqAonB1e5SSW8NvGX4/OF/yoz9G81xH0WLLELe0s4bW3lkz12r?=
 =?us-ascii?Q?men7peSTXvU55jK2QMVJMTMMcGkM+wjgR7TJLQseUWPrnhQ0hzbK9CA+NfZY?=
 =?us-ascii?Q?Jubwhc1RQjXKEILRXrlvbJUL+DUzN9PW3fok6Zm2U29kTeTIMwNcHarTfIXU?=
 =?us-ascii?Q?m3pNd5+Q86UisNXIfTb6UnBqgbcb3omrCCR6cbLl5cIHA2qdt/PfjdWYez52?=
 =?us-ascii?Q?DcS+4HDDNPioit4y5vShsBkrwGhkA3C9SvZ/YP2KnkIJ4lBBoaKpy7pU1a0A?=
 =?us-ascii?Q?3UJUX3WhEpXsBfEtYkGp+GJB3TxFLSnit7xpeMjpea+U8UkDWKAgn5lYwrq7?=
 =?us-ascii?Q?jHBUkByowZ1HZo6IoYEEQmT6umeFIA3c96Axysno7Dvl1NaHbhoqb9Wh/7Gg?=
 =?us-ascii?Q?fC+YDv73V4r1mIOWXIY0//FbO/3/lNk9W6ENI6o1aJHGtYjGKUaXKTOtWG2j?=
 =?us-ascii?Q?3rFZUM4lTGCoyzDnBi93zNR9mBBlTmfYxyk0TDUNdj3itekN4Lj8hNlxM2JX?=
 =?us-ascii?Q?MWodzk6S0+qMow4EpugH2aoNcjj1l3IoKfHeiIVCX3K9YoF9KIfALtBwklbB?=
 =?us-ascii?Q?Yr5Di2vNF7KImA0t2e0oc4nw1bE+hrBf9+zDDcbjB7t95i8XNW8p5pHai0yx?=
 =?us-ascii?Q?//1zfMCvx3aJHgBIWa5xYFc6NFrGFcTVlTt/AaYjw9nNGmY8Ser/kTlOsrPk?=
 =?us-ascii?Q?ySZ/mXAEO7AWkml3gMUELTrzs20+i8tY+f0N9XSiiiHyJMii6YTVju+l99es?=
 =?us-ascii?Q?sWIlKbKjjvr6o3olmI73j0+KTjO3xMuur2Z/pUw2mCAOwQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b114087d-2961-41fd-5c7e-08d8d71156f9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 09:07:54.8862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDU1uAKE4hLRQAs2RS2d+zgb2O4mQ1d0WeqBAHFOa4JrJSGl0tEoNf0heLrwoBzZuSpwcl+76O0nVHP+Jopozr4AqOIC6jNT/ikDWm0MrUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3227
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220081
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than having a device specific debug implementation in
pflash_cfi01.c and pflash_cfi02.c, use the standard tracing facility.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/pflash_cfi01.c | 78 +++++++++++++++++------------------------
 hw/block/pflash_cfi02.c | 75 +++++++++++++++------------------------
 hw/block/trace-events   | 39 ++++++++++++++++-----
 3 files changed, 91 insertions(+), 101 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 22287a1522..9e1f3b42c6 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -56,16 +56,6 @@
 #include "sysemu/runstate.h"
 #include "trace.h"
 
-/* #define PFLASH_DEBUG */
-#ifdef PFLASH_DEBUG
-#define DPRINTF(fmt, ...)                                   \
-do {                                                        \
-    fprintf(stderr, "PFLASH: " fmt , ## __VA_ARGS__);       \
-} while (0)
-#else
-#define DPRINTF(fmt, ...) do { } while (0)
-#endif
-
 #define PFLASH_BE          0
 #define PFLASH_SECURE      1
 
@@ -152,10 +142,8 @@ static uint32_t pflash_cfi_query(PFlashCFI01 *pfl, hwaddr offset)
          * wider part.
          */
         if (pfl->device_width != 1 || pfl->bank_width > 4) {
-            DPRINTF("%s: Unsupported device configuration: "
-                    "device_width=%d, max_device_width=%d\n",
-                    __func__, pfl->device_width,
-                    pfl->max_device_width);
+            trace_pflash_unsupported_device_configuration(
+                pfl->name, pfl->device_width, pfl->max_device_width);
             return 0;
         }
         /* CFI query data is repeated, rather than zero padded for
@@ -205,14 +193,14 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl, hwaddr offset)
     switch (boff & 0xFF) {
     case 0:
         resp = pfl->ident0;
-        trace_pflash_manufacturer_id(resp);
+        trace_pflash_manufacturer_id(pfl->name, resp);
         break;
     case 1:
         resp = pfl->ident1;
-        trace_pflash_device_id(resp);
+        trace_pflash_device_id(pfl->name, resp);
         break;
     default:
-        trace_pflash_device_info(offset);
+        trace_pflash_device_info(pfl->name, offset);
         return 0;
     }
     /* Replicate responses for each device in bank. */
@@ -260,10 +248,9 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hwaddr offset,
         }
         break;
     default:
-        DPRINTF("BUG in %s\n", __func__);
         abort();
     }
-    trace_pflash_data_read(offset, width, ret);
+    trace_pflash_data_read(pfl->name, offset, width, ret);
     return ret;
 }
 
@@ -277,7 +264,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read */
-        DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
+        trace_pflash_read_unknown_state(pfl->name, pfl->cmd);
         pfl->wcycle = 0;
         /*
          * The command 0x00 is not assigned by the CFI open standard,
@@ -313,7 +300,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
              */
             ret |= pfl->status << 16;
         }
-        DPRINTF("%s: status %x\n", __func__, ret);
+        trace_pflash_read_status(pfl->name, ret);
         break;
     case 0x90:
         if (!pfl->device_width) {
@@ -328,14 +315,14 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
             switch (boff) {
             case 0:
                 ret = pfl->ident0 << 8 | pfl->ident1;
-                trace_pflash_manufacturer_id(ret);
+                trace_pflash_manufacturer_id(pfl->name, ret);
                 break;
             case 1:
                 ret = pfl->ident2 << 8 | pfl->ident3;
-                trace_pflash_device_id(ret);
+                trace_pflash_device_id(pfl->name, ret);
                 break;
             default:
-                trace_pflash_device_info(boff);
+                trace_pflash_device_info(pfl->name, boff);
                 ret = 0;
                 break;
             }
@@ -380,7 +367,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
 
         break;
     }
-    trace_pflash_io_read(offset, width, ret, pfl->cmd, pfl->wcycle);
+    trace_pflash_io_read(pfl->name, offset, width, ret, pfl->cmd, pfl->wcycle);
 
     return ret;
 }
@@ -410,7 +397,7 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
 {
     uint8_t *p = pfl->storage;
 
-    trace_pflash_data_write(offset, width, value, pfl->counter);
+    trace_pflash_data_write(pfl->name, offset, width, value, pfl->counter);
     switch (width) {
     case 1:
         p[offset] = value;
@@ -449,7 +436,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 
     cmd = value;
 
-    trace_pflash_io_write(offset, width, value, pfl->wcycle);
+    trace_pflash_io_write(pfl->name, offset, width, value, pfl->wcycle);
     if (!pfl->wcycle) {
         /* Set the device in I/O access mode */
         memory_region_rom_device_set_romd(&pfl->mem, false);
@@ -463,14 +450,13 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             goto mode_read_array;
         case 0x10: /* Single Byte Program */
         case 0x40: /* Single Byte Program */
-            DPRINTF("%s: Single Byte Program\n", __func__);
+            trace_pflash_write(pfl->name, "single byte program (0)");
             break;
         case 0x20: /* Block erase */
             p = pfl->storage;
             offset &= ~(pfl->sector_len - 1);
 
-            DPRINTF("%s: block erase at " TARGET_FMT_plx " bytes %x\n",
-                    __func__, offset, (unsigned)pfl->sector_len);
+            trace_pflash_write_block_erase(pfl->name, offset, pfl->sector_len);
 
             if (!pfl->ro) {
                 memset(p + offset, 0xff, pfl->sector_len);
@@ -481,25 +467,25 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             pfl->status |= 0x80; /* Ready! */
             break;
         case 0x50: /* Clear status bits */
-            DPRINTF("%s: Clear status bits\n", __func__);
+            trace_pflash_write(pfl->name, "clear status bits");
             pfl->status = 0x0;
             goto mode_read_array;
         case 0x60: /* Block (un)lock */
-            DPRINTF("%s: Block unlock\n", __func__);
+            trace_pflash_write(pfl->name, "block unlock");
             break;
         case 0x70: /* Status Register */
-            DPRINTF("%s: Read status register\n", __func__);
+            trace_pflash_write(pfl->name, "read status register");
             pfl->cmd = cmd;
             return;
         case 0x90: /* Read Device ID */
-            DPRINTF("%s: Read Device information\n", __func__);
+            trace_pflash_write(pfl->name, "read device information");
             pfl->cmd = cmd;
             return;
         case 0x98: /* CFI query */
-            DPRINTF("%s: CFI query\n", __func__);
+            trace_pflash_write(pfl->name, "CFI query");
             break;
         case 0xe8: /* Write to buffer */
-            DPRINTF("%s: Write to buffer\n", __func__);
+            trace_pflash_write(pfl->name, "write to buffer");
             /* FIXME should save @offset, @width for case 1+ */
             qemu_log_mask(LOG_UNIMP,
                           "%s: Write to buffer emulation is flawed\n",
@@ -507,10 +493,10 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             pfl->status |= 0x80; /* Ready! */
             break;
         case 0xf0: /* Probe for AMD flash */
-            DPRINTF("%s: Probe for AMD flash\n", __func__);
+            trace_pflash_write(pfl->name, "probe for AMD flash");
             goto mode_read_array;
         case 0xff: /* Read Array */
-            DPRINTF("%s: Read array mode\n", __func__);
+            trace_pflash_write(pfl->name, "read array mode");
             goto mode_read_array;
         default:
             goto error_flash;
@@ -522,7 +508,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
         switch (pfl->cmd) {
         case 0x10: /* Single Byte Program */
         case 0x40: /* Single Byte Program */
-            DPRINTF("%s: Single Byte Program\n", __func__);
+            trace_pflash_write(pfl->name, "single byte program (1)");
             if (!pfl->ro) {
                 pflash_data_write(pfl, offset, value, width, be);
                 pflash_update(pfl, offset, width);
@@ -553,7 +539,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             } else {
                 value = extract32(value, 0, pfl->bank_width * 8);
             }
-            DPRINTF("%s: block write of %x bytes\n", __func__, value);
+            trace_pflash_write_block(pfl->name, value);
             pfl->counter = value;
             pfl->wcycle++;
             break;
@@ -567,7 +553,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             } else if (cmd == 0xff) { /* Read Array */
                 goto mode_read_array;
             } else {
-                DPRINTF("%s: Unknown (un)locking command\n", __func__);
+                trace_pflash_write(pfl->name, "unknown (un)locking command");
                 goto mode_read_array;
             }
             break;
@@ -575,7 +561,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             if (cmd == 0xff) { /* Read Array */
                 goto mode_read_array;
             } else {
-                DPRINTF("%s: leaving query mode\n", __func__);
+                trace_pflash_write(pfl->name, "leaving query mode");
             }
             break;
         default:
@@ -603,7 +589,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                 hwaddr mask = pfl->writeblock_size - 1;
                 mask = ~mask;
 
-                DPRINTF("%s: block write finished\n", __func__);
+                trace_pflash_write(pfl->name, "block write finished");
                 pfl->wcycle++;
                 if (!pfl->ro) {
                     /* Flush the entire write buffer onto backing storage.  */
@@ -642,7 +628,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
         break;
     default:
         /* Should never happen */
-        DPRINTF("%s: invalid write state\n",  __func__);
+        trace_pflash_write(pfl->name, "invalid write state");
         goto mode_read_array;
     }
     return;
@@ -653,7 +639,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  mode_read_array:
-    trace_pflash_reset();
+    trace_pflash_reset(pfl->name);
     memory_region_rom_device_set_romd(&pfl->mem, true);
     pfl->wcycle = 0;
     pfl->cmd = 0x00; /* This model reset value for READ_ARRAY (not CFI) */
@@ -1022,7 +1008,7 @@ static void postload_update_cb(void *opaque, int running, RunState state)
     qemu_del_vm_change_state_handler(pfl->vmstate);
     pfl->vmstate = NULL;
 
-    DPRINTF("%s: updating bdrv for %s\n", __func__, pfl->name);
+    trace_pflash_postload_cb(pfl->name);
     pflash_update(pfl, 0, pfl->sector_len * pfl->nb_blocs);
 }
 
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 7962cff745..b6de18d3ad 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -48,14 +48,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 
-#define PFLASH_DEBUG false
-#define DPRINTF(fmt, ...)                                  \
-do {                                                       \
-    if (PFLASH_DEBUG) {                                    \
-        fprintf(stderr, "PFLASH: " fmt, ## __VA_ARGS__);   \
-    }                                                      \
-} while (0)
-
 #define PFLASH_LAZY_ROMD_THRESHOLD 42
 
 /*
@@ -220,7 +212,7 @@ static void pflash_timer(void *opaque)
 {
     PFlashCFI02 *pfl = opaque;
 
-    trace_pflash_timer_expired(pfl->cmd);
+    trace_pflash_timer_expired(pfl->name, pfl->cmd);
     if (pfl->cmd == 0x30) {
         /*
          * Sector erase. If DQ3 is 0 when the timer expires, then the 50
@@ -233,11 +225,10 @@ static void pflash_timer(void *opaque)
             uint64_t timeout = pflash_erase_time(pfl);
             timer_mod(&pfl->timer,
                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + timeout);
-            DPRINTF("%s: erase timeout fired; erasing %d sectors\n",
-                    __func__, pfl->sectors_to_erase);
+            trace_pflash_erase_timeout(pfl->name, pfl->sectors_to_erase);
             return;
         }
-        DPRINTF("%s: sector erase complete\n", __func__);
+        trace_pflash_erase_complete(pfl->name);
         bitmap_zero(pfl->sector_erase_map, pfl->total_sectors);
         pfl->sectors_to_erase = 0;
         reset_dq3(pfl);
@@ -262,7 +253,7 @@ static uint64_t pflash_data_read(PFlashCFI02 *pfl, hwaddr offset,
 {
     uint8_t *p = (uint8_t *)pfl->storage + offset;
     uint64_t ret = pfl->be ? ldn_be_p(p, width) : ldn_le_p(p, width);
-    trace_pflash_data_read(offset, width, ret);
+    trace_pflash_data_read(pfl->name, offset, width, ret);
     return ret;
 }
 
@@ -325,7 +316,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read*/
-        DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
+        trace_pflash_read_unknown_state(pfl->name, pfl->cmd);
         pfl->wcycle = 0;
         pfl->cmd = 0;
         /* fall through to the read code */
@@ -338,7 +329,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
             toggle_dq2(pfl);
             /* Status register read */
             ret = pfl->status;
-            DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
+            trace_pflash_read_status(pfl->name, ret);
             break;
         }
         /* Flash area read */
@@ -363,7 +354,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         default:
             ret = pflash_data_read(pfl, offset, width);
         }
-        DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx64 "\n", __func__, boff, ret);
+        trace_pflash_read_done(pfl->name, boff, ret);
         break;
     case 0x10: /* Chip Erase */
     case 0x30: /* Sector Erase */
@@ -375,7 +366,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         toggle_dq6(pfl);
         /* Status register read */
         ret = pfl->status;
-        DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
+        trace_pflash_read_status(pfl->name, ret);
         break;
     case 0x98:
         /* CFI query mode */
@@ -386,7 +377,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         }
         break;
     }
-    trace_pflash_io_read(offset, width, ret, pfl->cmd, pfl->wcycle);
+    trace_pflash_io_read(pfl->name, offset, width, ret, pfl->cmd, pfl->wcycle);
 
     return ret;
 }
@@ -415,9 +406,8 @@ static void pflash_sector_erase(PFlashCFI02 *pfl, hwaddr offset)
     SectorInfo sector_info = pflash_sector_info(pfl, offset);
     uint64_t sector_len = sector_info.len;
     offset &= ~(sector_len - 1);
-    DPRINTF("%s: start sector erase at %0*" PRIx64 "-%0*" PRIx64 "\n",
-            __func__, pfl->width * 2, offset,
-            pfl->width * 2, offset + sector_len - 1);
+    trace_pflash_sector_erase_start(pfl->name, pfl->width * 2, offset,
+                                    pfl->width * 2, offset + sector_len - 1);
     if (!pfl->ro) {
         uint8_t *p = pfl->storage;
         memset(p + offset, 0xff, sector_len);
@@ -438,7 +428,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
     uint8_t *p;
     uint8_t cmd;
 
-    trace_pflash_io_write(offset, width, value, pfl->wcycle);
+    trace_pflash_io_write(pfl->name, offset, width, value, pfl->wcycle);
     cmd = value;
     if (pfl->cmd != 0xA0) {
         /* Reset does nothing during chip erase and sector erase. */
@@ -496,27 +486,24 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         }
         if (boff != pfl->unlock_addr0 || cmd != 0xAA) {
-            DPRINTF("%s: unlock0 failed " TARGET_FMT_plx " %02x %04x\n",
-                    __func__, boff, cmd, pfl->unlock_addr0);
+            trace_pflash_unlock0_failed(pfl->name, boff, cmd, pfl->unlock_addr0);
             goto reset_flash;
         }
-        DPRINTF("%s: unlock sequence started\n", __func__);
+        trace_pflash_write(pfl->name, "unlock sequence started");
         break;
     case 1:
         /* We started an unlock sequence */
     check_unlock1:
         if (boff != pfl->unlock_addr1 || cmd != 0x55) {
-            DPRINTF("%s: unlock1 failed " TARGET_FMT_plx " %02x\n", __func__,
-                    boff, cmd);
+            trace_pflash_unlock1_failed(pfl->name, boff, cmd);
             goto reset_flash;
         }
-        DPRINTF("%s: unlock sequence done\n", __func__);
+        trace_pflash_write(pfl->name, "unlock sequence done");
         break;
     case 2:
         /* We finished an unlock sequence */
         if (!pfl->bypass && boff != pfl->unlock_addr0) {
-            DPRINTF("%s: command failed " TARGET_FMT_plx " %02x\n", __func__,
-                    boff, cmd);
+            trace_pflash_write_failed(pfl->name, boff, cmd);
             goto reset_flash;
         }
         switch (cmd) {
@@ -527,10 +514,10 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         case 0x90: /* Autoselect */
         case 0xA0: /* Program */
             pfl->cmd = cmd;
-            DPRINTF("%s: starting command %02x\n", __func__, cmd);
+            trace_pflash_write_start(pfl->name, cmd);
             break;
         default:
-            DPRINTF("%s: unknown command %02x\n", __func__, cmd);
+            trace_pflash_write_unknown(pfl->name, cmd);
             goto reset_flash;
         }
         break;
@@ -548,7 +535,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
                 }
                 goto reset_flash;
             }
-            trace_pflash_data_write(offset, width, value, 0);
+            trace_pflash_data_write(pfl->name, offset, width, value, 0);
             if (!pfl->ro) {
                 p = (uint8_t *)pfl->storage + offset;
                 if (pfl->be) {
@@ -586,8 +573,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             }
             /* fall through */
         default:
-            DPRINTF("%s: invalid write for command %02x\n",
-                    __func__, pfl->cmd);
+            trace_pflash_write_invalid(pfl->name, pfl->cmd);
             goto reset_flash;
         }
     case 4:
@@ -600,8 +586,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             goto check_unlock1;
         default:
             /* Should never happen */
-            DPRINTF("%s: invalid command state %02x (wc 4)\n",
-                    __func__, pfl->cmd);
+            trace_pflash_write_invalid_state(pfl->name, pfl->cmd, 5);
             goto reset_flash;
         }
         break;
@@ -613,12 +598,11 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         switch (cmd) {
         case 0x10: /* Chip Erase */
             if (boff != pfl->unlock_addr0) {
-                DPRINTF("%s: chip erase: invalid address " TARGET_FMT_plx "\n",
-                        __func__, offset);
+                trace_pflash_chip_erase_invalid(pfl->name, offset);
                 goto reset_flash;
             }
             /* Chip erase */
-            DPRINTF("%s: start chip erase\n", __func__);
+            trace_pflash_chip_erase_start(pfl->name);
             if (!pfl->ro) {
                 memset(pfl->storage, 0xff, pfl->chip_len);
                 pflash_update(pfl, 0, pfl->chip_len);
@@ -632,7 +616,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             pflash_sector_erase(pfl, offset);
             break;
         default:
-            DPRINTF("%s: invalid command %02x (wc 5)\n", __func__, cmd);
+            trace_pflash_write_invalid_command(pfl->name, cmd);
             goto reset_flash;
         }
         pfl->cmd = cmd;
@@ -683,19 +667,18 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         default:
             /* Should never happen */
-            DPRINTF("%s: invalid command state %02x (wc 6)\n",
-                    __func__, pfl->cmd);
+            trace_pflash_write_invalid_state(pfl->name, pfl->cmd, 6);
             goto reset_flash;
         }
         break;
     /* Special values for CFI queries */
     case WCYCLE_CFI:
     case WCYCLE_AUTOSELECT_CFI:
-        DPRINTF("%s: invalid write in CFI query mode\n", __func__);
+        trace_pflash_write(pfl->name, "invalid write in CFI query mode");
         goto reset_flash;
     default:
         /* Should never happen */
-        DPRINTF("%s: invalid write state (wc 7)\n",  __func__);
+        trace_pflash_write(pfl->name, "invalid write state (wc 7)");
         goto reset_flash;
     }
     pfl->wcycle++;
@@ -704,7 +687,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
 
     /* Reset flash */
  reset_flash:
-    trace_pflash_reset();
+    trace_pflash_reset(pfl->name);
     pfl->bypass = 0;
     pfl->wcycle = 0;
     pfl->cmd = 0;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index c1537e3ac0..a715a2e173 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -6,15 +6,36 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
 
 # pflash_cfi01.c
 # pflash_cfi02.c
-pflash_reset(void) "reset"
-pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
-pflash_io_read(uint64_t offset, unsigned size, uint32_t value, uint8_t cmd, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x cmd:0x%02x wcycle:%u"
-pflash_io_write(uint64_t offset, unsigned size, uint32_t value, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
-pflash_data_read(uint64_t offset, unsigned size, uint32_t value) "data offset:0x%04"PRIx64" size:%u value:0x%04x"
-pflash_data_write(uint64_t offset, unsigned size, uint32_t value, uint64_t counter) "data offset:0x%04"PRIx64" size:%u value:0x%04x counter:0x%016"PRIx64
-pflash_manufacturer_id(uint16_t id) "Read Manufacturer ID: 0x%04x"
-pflash_device_id(uint16_t id) "Read Device ID: 0x%04x"
-pflash_device_info(uint64_t offset) "Read Device Information offset:0x%04"PRIx64
+pflash_chip_erase_invalid(const char *name, uint64_t offset) "%s: chip erase: invalid address 0x%" PRIx64
+pflash_chip_erase_start(const char *name) "%s: start chip erase"
+pflash_data_read(const char *name, uint64_t offset, unsigned size, uint32_t value) "%s: data offset:0x%04"PRIx64" size:%u value:0x%04x"
+pflash_data_write(const char *name, uint64_t offset, unsigned size, uint32_t value, uint64_t counter) "%s: data offset:0x%04"PRIx64" size:%u value:0x%04x counter:0x%016"PRIx64
+pflash_device_id(const char *name, uint16_t id) "%s: read device ID: 0x%04x"
+pflash_device_info(const char *name, uint64_t offset) "%s: read device information offset:0x%04" PRIx64
+pflash_erase_complete(const char *name) "%s: sector erase complete"
+pflash_erase_timeout(const char *name, int count) "%s: erase timeout fired; erasing %d sectors"
+pflash_io_read(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t cmd, uint8_t wcycle) "%s: offset:0x%04" PRIx64 " size:%u value:0x%04x cmd:0x%02x wcycle:%u"
+pflash_io_write(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t wcycle) "%s: offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
+pflash_manufacturer_id(const char *name, uint16_t id) "%s: read manufacturer ID: 0x%04x"
+pflash_postload_cb(const char *name)  "%s: updating bdrv"
+pflash_read_done(const char *name, uint64_t offset, uint64_t ret) "%s: ID:0x%" PRIx64 " ret:0x%" PRIx64
+pflash_read_status(const char *name, uint32_t ret) "%s: status:0x%x"
+pflash_read_unknown_state(const char *name, uint8_t cmd) "%s: unknown command state:0x%x"
+pflash_reset(const char *name) "%s: reset"
+pflash_sector_erase_start(const char *name, int width1, uint64_t start, int width2, uint64_t end) "%s: start sector erase at: 0x%0*" PRIx64 "-0x%0*" PRIx64
+pflash_timer_expired(const char *name, uint8_t cmd) "%s: command 0x%02x done"
+pflash_unlock0_failed(const char *name, uint64_t offset, uint8_t cmd, uint16_t addr0) "%s: unlock0 failed 0x%" PRIx64 " 0x%02x 0x%04x"
+pflash_unlock1_failed(const char *name, uint64_t offset, uint8_t cmd) "%s: unlock0 failed 0x%" PRIx64 " 0x%02x"
+pflash_unsupported_device_configuration(const char *name, uint8_t width, uint8_t max) "%s: unsupported device configuration: device_width:%d max_device_width:%d"
+pflash_write(const char *name, const char *str) "%s: %s"
+pflash_write_block(const char *name, uint32_t value) "%s: block write: bytes:0x%x"
+pflash_write_block_erase(const char *name, uint64_t offset, uint64_t len) "%s: block erase offset:0x%" PRIx64 " bytes:0x%lx"
+pflash_write_failed(const char *name, uint64_t offset, uint8_t cmd) "%s: command failed 0x%" PRIx64 " 0x%02x"
+pflash_write_invalid(const char *name, uint8_t cmd) "%s: invalid write for command 0x%02x"
+pflash_write_invalid_command(const char *name, uint8_t cmd) "%s: invalid command 0x%02x (wc 5)"
+pflash_write_invalid_state(const char *name, uint8_t cmd, int wc) "%s: invalid command state 0x%02x (wc %d)"
+pflash_write_start(const char *name, uint8_t cmd) "%s: starting command 0x%02x"
+pflash_write_unknown(const char *name, uint8_t cmd) "%s: unknown command 0x%02x"
 
 # virtio-blk.c
 virtio_blk_req_complete(void *vdev, void *req, int status) "vdev %p req %p status %d"
-- 
2.30.0


