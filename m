Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58BE2FC174
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:46:29 +0100 (CET)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xtT-0002vK-P4
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xdF-0001nk-SM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:41 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:58318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xdC-0000LX-BS
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:41 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKNUio002770;
 Tue, 19 Jan 2021 20:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=RdD2os6t3PSYJEZeInDV3U76ZlcxnwkHmDA1IYMV3bY=;
 b=vUF6GasC4uEWgvqJogVHMuOlhE5eLrrbjia8qkpXrbhgiJORouczDY8lDdBSLyiyqymI
 9xGUnF/JDJWIHbBBkBQ8LQUtJtoFeSVqdICPkQ+dIwsqAOyo44n9kG3WSf2QL59PggxZ
 cvDkVdlwd0yV37AivLzMlhsiIs/YUqH/oGz9RZl3vRO2rOHAOzGHhbnJoThuqGI4sdTo
 JLEvbYZANzBOyA0E2t3TU1KydSUsXVreH7Fvr93rJTKOoE3rGoidz+b7cGUWr5zHo/RR
 7psb4mIM1eZm2p+jW+TOthsbplh2oG5NxZ4c3tFTpCfTd1qCpOQ8l5zrRWVH7LCL8pYI xA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 363xyhtaud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPjmO175968;
 Tue, 19 Jan 2021 20:29:30 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2051.outbound.protection.outlook.com [104.47.37.51])
 by aserp3020.oracle.com with ESMTP id 3661er950v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obMmSyWlvLrdcDbiXy/A5Vk8nWWWvrQpL8t6zvG8AX3YpCYo8mt74Kn82z0dkuoFs6hx6CEIshAHFdDHpNZ2kkpE2Nq4ddg8XZZWloeEpzUgm4ZNxHD9aXcep9w+vKXeSMtos+ORcYMj40s5aPVp5wE7DTy/67RX/b9rkxLTDxnmZfnGsCZuF3C0OUS1VJ3RcILWGjxKhwZtvdC57ZukZ5NN/BL2Rnu099iewchl7ni+Rv0ve5MsHBDLtP1tV/nh9a9twI2ok+b7sZWrMBcrb00OKuZpJhN2Vybhaug89DaZahI30veVrvAE36elqBV4zc2e4FhLeqJyZAy60X6pHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdD2os6t3PSYJEZeInDV3U76ZlcxnwkHmDA1IYMV3bY=;
 b=bU+PtgRIXGX++JMdXrS6A2yHzFgqN4FIhlpw1KajAd5sU3OpEKReJcqOraCtoy+qmqABJN8v2+qjFrcKWcai68AF5QLV1CyUtuSFnSeC2giv1OZf5YBjD8dNSQh8grQuKMA1WEVV+8c7o0oiPx6VLBQnEFG0pdLqBrgyPxheKvZm5nTZoE8KdBH25AaqTTemJKzas8ciGDHCh2vYRfwwIb6xiESkjpg6ScscUpsqDyUDgEcshRF4lsd6sNGcCIC4Bsx2cjWYHkrniibj6LDuGdsoyMoRe0QXy93peY5nkSbMIouJbjZOM/SAZbHKvGUDGv3hydbh+LOipA6cPr0C7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdD2os6t3PSYJEZeInDV3U76ZlcxnwkHmDA1IYMV3bY=;
 b=madxR3fn8I1sH6OXdmjfSU+r+mjETpkVNA2RTZvEWW2DFzhv1myfEEeTvs/od1rbY2HgLadPG8A7oa+oVADoC6wrGWz7HznqmslnbA0z9nAc74AA562ikm2P8niSIkJOux6TZ+jJourbWN5EThRgJ1UsLPtZUUHnUSyYQ41VN+I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:28 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:28 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 15/20] multi-process: Forward PCI config space acceses to
 the remote process
Date: Tue, 19 Jan 2021 15:28:32 -0500
Message-Id: <78a1ad3a2174de5e2f8bbe74947c057ef0ec230a.1611081587.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611081587.git.jag.raman@oracle.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.38]
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.38) by
 DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf621153-ab67-4bf9-03fb-08d8bcb8eb44
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3349F577E5CA7F17A67D008190A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6avvBL0mDYaMSp+sJdRDo2WukUFihO+nQKi1+njzQfDK7eVyE+Cc+xIifQ5NdJsbPWdOLR/w0zPisDLt7XjC7yb5OdEgCaBmcVy24elIqtV0dR9t/ibYVDaCe2DJiR2OX7EBLj2MVQwNa3IRXV40U5YNIZ8rPh4O+yU6ahQKAlGIjZOVipyK1Ia9Kii6BX+9FHzZQTXA1f9OSFnQcVdIyu3cVnU8ImHU/LoZ7/OTzBUi70uWmrZjIGb18zY1NJVMwUQEpobl+nr/+xkaG5vwTyCvEMCjHj5n6kMikt8jEvPBhUCwjMmKGYi8RvgEX9kOA8fdCLTF45XtufTVi87GZ65VviQOIv2NrpeNlTSeXzG8Znz1y1AV8BjJpdyxM+UWESq3JmbXJL73SN//IDYgmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fEHrRz21DjHz+C2qmjNht7upu1F92QFtjiJhmrsY4/0HIrJFGWkZVmy8JOAL?=
 =?us-ascii?Q?0NGGfbde0sO9FcGzrgDly6H3ibG9b420xJVIwJbb/aoW2tYCTOT2aTNtSplr?=
 =?us-ascii?Q?AE6R6oN30FsCxY3iIpWBttRstuFm0s8U0ItPUHilnTi4P3iM1P4qu3+A48nX?=
 =?us-ascii?Q?LLgGuQUFHlbyO87j+Fb4rHQC38GS68J18oymY0ySDGeLeVyGelVi5Rbu11Y2?=
 =?us-ascii?Q?kkf1Hb85IVoO0Wz0iQ71Qywd/9w1RHXhYNmCME8FASckO8VXFOz/Bb7ZZMIm?=
 =?us-ascii?Q?ZREKeDfK8CoJs65UpCCF5Izj59zJMGAgQ002TCabgSp8vx2ptM0E6eav1wWY?=
 =?us-ascii?Q?xFSAQMzF3L6pfyb0K7JBtACsMkEVkuwtp1eN5hmB4zqRzi+ylMWQ2NUtf+J2?=
 =?us-ascii?Q?+kULh9Up+935V1h2RxVRi2jNKZw4C8MCFF1+fZmeAazA9PIjvXWK2o+zahax?=
 =?us-ascii?Q?5E8CPLEnAA4edqWcYpUgHbYXB0bt3WC7JLUyqqmGAzMjHPOR0Q3l9TuGt5wn?=
 =?us-ascii?Q?lHfYMnb6Oeuxebf45/rQF2GDb44QUGRriFeBkadxQad7sdZ0QRx+FfFI0eES?=
 =?us-ascii?Q?8nxPCqpWZj2D5P0BOsSscizbOJ3M0x2P0h4RvhJwVKqEmHzmHXnl6nxmp+/o?=
 =?us-ascii?Q?tiYIdl5rV7ajF6JPl96JHpic5Lq37/KIUYPoUtaikLPE+fQtFJFu1kyJy1vt?=
 =?us-ascii?Q?XHCeqjhRvRCwRpNiNPDyMBeKpmSqWZp8mP13mK0Di9ms5cfd7K6IYtI9ERWV?=
 =?us-ascii?Q?3BoohSlR8/l2nmDeTYlWPveMn+2vCJ++L1cCvD5xisojA0cYjYFhm8duDuJx?=
 =?us-ascii?Q?UfjZPOempmAPAH4smdwyo9SW7CbDwb1M2FZI8UmBD2YqTDCB4+8jtKkQuGS7?=
 =?us-ascii?Q?QhbpUpbtENNXcHOUP4notzo3MjFx6BIAtbZe3tpJYhe2bRMKB0tAcRbM5rNu?=
 =?us-ascii?Q?DhXKvqIGmHKJyPVC23nfemA1mGpwvKo8G5MvQLxF2T4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf621153-ab67-4bf9-03fb-08d8bcb8eb44
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:28.2021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bo6BxzVBpO1CESpA5kyQklu3Gh5PfWNyNT2za3Qysoq1BLGS+B6C+vy2O1pJNTCLoY6F9TUbNN6dN6fzXXYIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

The Proxy Object sends the PCI config space accesses as messages
to the remote process over the communication channel

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h | 10 +++++++
 hw/remote/message.c             | 60 +++++++++++++++++++++++++++++++++++++++++
 hw/remote/mpqemu-link.c         |  8 +++++-
 hw/remote/proxy.c               | 55 +++++++++++++++++++++++++++++++++++++
 4 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 1b35d40..7bc0bdd 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -34,6 +34,9 @@
  */
 typedef enum {
     MPQEMU_CMD_SYNC_SYSMEM,
+    MPQEMU_CMD_RET,
+    MPQEMU_CMD_PCI_CFGWRITE,
+    MPQEMU_CMD_PCI_CFGREAD,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
@@ -43,6 +46,12 @@ typedef struct {
     off_t offsets[REMOTE_MAX_FDS];
 } SyncSysmemMsg;
 
+typedef struct {
+    uint32_t addr;
+    uint32_t val;
+    int len;
+} PciConfDataMsg;
+
 /**
  * MPQemuMsg:
  * @cmd: The remote command
@@ -60,6 +69,7 @@ typedef struct {
 
     union {
         uint64_t u64;
+        PciConfDataMsg pci_conf_data;
         SyncSysmemMsg sync_sysmem;
     } data;
 
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 36e2d4f..636bd16 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -15,6 +15,12 @@
 #include "hw/remote/mpqemu-link.h"
 #include "qapi/error.h"
 #include "sysemu/runstate.h"
+#include "hw/pci/pci.h"
+
+static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
+                                 MPQemuMsg *msg, Error **errp);
+static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
+                                MPQemuMsg *msg, Error **errp);
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 {
@@ -40,6 +46,12 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         }
 
         switch (msg.cmd) {
+        case MPQEMU_CMD_PCI_CFGWRITE:
+            process_config_write(com->ioc, pci_dev, &msg, &local_err);
+            break;
+        case MPQEMU_CMD_PCI_CFGREAD:
+            process_config_read(com->ioc, pci_dev, &msg, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
@@ -55,3 +67,51 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
 }
+
+static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
+                                 MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    PciConfDataMsg *conf = (PciConfDataMsg *)&msg->data.pci_conf_data;
+    MPQemuMsg ret = { 0 };
+
+    if ((conf->addr + sizeof(conf->val)) > pci_config_size(dev)) {
+        error_setg(errp, "Bad address for PCI config write, pid "FMT_pid".",
+                   getpid());
+        ret.data.u64 = UINT64_MAX;
+    } else {
+        pci_default_write_config(dev, conf->addr, conf->val, conf->len);
+    }
+
+    ret.cmd = MPQEMU_CMD_RET;
+    ret.size = sizeof(ret.data.u64);
+
+    if (!mpqemu_msg_send(&ret, ioc, NULL)) {
+        error_prepend(errp, "Error returning code to proxy, pid "FMT_pid": ",
+                      getpid());
+    }
+}
+
+static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
+                                MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    PciConfDataMsg *conf = (PciConfDataMsg *)&msg->data.pci_conf_data;
+    MPQemuMsg ret = { 0 };
+
+    if ((conf->addr + sizeof(conf->val)) > pci_config_size(dev)) {
+        error_setg(errp, "Bad address for PCI config read, pid "FMT_pid".",
+                   getpid());
+        ret.data.u64 = UINT64_MAX;
+    } else {
+        ret.data.u64 = pci_default_read_config(dev, conf->addr, conf->len);
+    }
+
+    ret.cmd = MPQEMU_CMD_RET;
+    ret.size = sizeof(ret.data.u64);
+
+    if (!mpqemu_msg_send(&ret, ioc, NULL)) {
+        error_prepend(errp, "Error returning code to proxy, pid "FMT_pid": ",
+                      getpid());
+    }
+}
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 88d1f9b..5bd6a9d 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -207,7 +207,7 @@ uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
         return ret;
     }
 
-    if (!mpqemu_msg_valid(&msg_reply)) {
+    if (!mpqemu_msg_valid(&msg_reply) || msg_reply.cmd != MPQEMU_CMD_RET) {
         error_setg(errp, "ERROR: Invalid reply received for command %d",
                          msg->cmd);
         return ret;
@@ -242,6 +242,12 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
             return false;
         }
         break;
+    case MPQEMU_CMD_PCI_CFGWRITE:
+    case MPQEMU_CMD_PCI_CFGREAD:
+        if (msg->size != sizeof(PciConfDataMsg)) {
+            return false;
+        }
+        break;
     default:
         break;
     }
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index cd5b071..2b14394 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -17,6 +17,8 @@
 #include "monitor/monitor.h"
 #include "migration/blocker.h"
 #include "qemu/sockets.h"
+#include "hw/remote/mpqemu-link.h"
+#include "qemu/error-report.h"
 
 static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 {
@@ -65,6 +67,56 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     error_free(dev->migration_blocker);
 }
 
+static void config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,
+                           int len, unsigned int op)
+{
+    MPQemuMsg msg = { 0 };
+    uint64_t ret = -EINVAL;
+    Error *local_err = NULL;
+
+    msg.cmd = op;
+    msg.data.pci_conf_data.addr = addr;
+    msg.data.pci_conf_data.val = (op == MPQEMU_CMD_PCI_CFGWRITE) ? *val : 0;
+    msg.data.pci_conf_data.len = len;
+    msg.size = sizeof(PciConfDataMsg);
+
+    ret = mpqemu_msg_send_and_await_reply(&msg, pdev, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+    }
+
+    if (ret == UINT64_MAX) {
+        error_report("Failed to perform PCI config %s operation",
+                     (op == MPQEMU_CMD_PCI_CFGREAD) ? "READ" : "WRITE");
+    }
+
+    if (op == MPQEMU_CMD_PCI_CFGREAD) {
+        *val = (uint32_t)ret;
+    }
+}
+
+static uint32_t pci_proxy_read_config(PCIDevice *d, uint32_t addr, int len)
+{
+    uint32_t val;
+
+    config_op_send(PCI_PROXY_DEV(d), addr, &val, len, MPQEMU_CMD_PCI_CFGREAD);
+
+    return val;
+}
+
+static void pci_proxy_write_config(PCIDevice *d, uint32_t addr, uint32_t val,
+                                   int len)
+{
+    /*
+     * Some of the functions access the copy of remote device's PCI config
+     * space which is cached in the proxy device. Therefore, maintain
+     * it updated.
+     */
+    pci_default_write_config(d, addr, val, len);
+
+    config_op_send(PCI_PROXY_DEV(d), addr, &val, len, MPQEMU_CMD_PCI_CFGWRITE);
+}
+
 static Property proxy_properties[] = {
     DEFINE_PROP_STRING("fd", PCIProxyDev, fd),
     DEFINE_PROP_END_OF_LIST(),
@@ -77,6 +129,9 @@ static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
 
     k->realize = pci_proxy_dev_realize;
     k->exit = pci_proxy_dev_exit;
+    k->config_read = pci_proxy_read_config;
+    k->config_write = pci_proxy_write_config;
+
     device_class_set_props(dc, proxy_properties);
 }
 
-- 
1.8.3.1


