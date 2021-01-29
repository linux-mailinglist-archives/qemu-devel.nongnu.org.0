Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E968308AFC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:12:50 +0100 (CET)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XKD-0003II-AF
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WxT-00081K-FB
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:49:19 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:33796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WxQ-0006OQ-Uo
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:49:19 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGmk7P181129;
 Fri, 29 Jan 2021 16:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=RdD2os6t3PSYJEZeInDV3U76ZlcxnwkHmDA1IYMV3bY=;
 b=VtKRa09Ec0PuJ4l7z93FfmC1+A2LKt6ly2u+YmTlRafDTOVPHCxDVJJY37znpzrBfdt8
 P1SiFrv/wv7JD1KuTOALYQPAFlQuWavnvd4fUn8R1MyRiNXtNt2ny7TsrPSTol4POa9x
 qGsLQb7LgXyvEHQIpN/NUKcYL5K8QaXSE6ac9jsU94IawjSdyWWUhaecB5TpskV8i+jE
 4Ex2e50VBMREupVwTr+wvGPjzU0kL9N5V6ifnALwBq++cx6QHOFVL5Y4b/VbA+SxtGO7
 ZcgERaCBb0m821pXkhZbDPjcQBiDti7SqbbCdLgCmaLLHGJRCNbgMwdoJk5Iyl+7AlPS 6g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 36cmf88jf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:49:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPHxo121180;
 Fri, 29 Jan 2021 16:47:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by aserp3030.oracle.com with ESMTP id 368wcse1ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgzAg2IX1hcJuRXKR9IgCmANSdEM/XmZE1sRrg8X0/rK1sGxHjHCqD4x5UagU4rMJuVzu5TTvARW+AVOgOJMoRxkVqdZKDb+6mpA6QFAi5Xtw+6Xw06cE1vRILvL2F2ssO7PoHHrsNO3XK2ZKUzlxSAnUsc+DlLNb5ArnxsFY8Mfb7Ts6HdzmT7scZSHAbUXOyzI5/TqJShSdPk72eD4QzSlXDo2UtVGa9gPMxtTnGksaC6V0TJAiYnOnNbA0+Ryvkh4h1mzlIsx1Pff1wQne4XCC+da6PpP2RMilWh0b5CH5NwUCn/zQCAe6VDfViD5JQfimT5YKtUUdf0edAQasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdD2os6t3PSYJEZeInDV3U76ZlcxnwkHmDA1IYMV3bY=;
 b=C/Jmwb4kx9HYL1dAxzZ2rqtWhHPShdIK7Y6vXPsVY/TSue9hXDVkV6Q1VX1RDm75UF0M2D+/kcIHaGcFt2Urzl02tTWKJpvKu4nvKhROkRF1a4dNOulV3ybRrUrOMYtQlk9mma3L8jZS+FV4ZyW7Q9rYJqm+66lwQg+HGKNIhfQ2RppfL8KtH2BnoP8ckWJwz1Yrdr1dHvx/BPU//0g+CtepU+R53AH+4bp3jJ2HtqFd1vSz+yJtn5FY3wJZbOKEoYWtG30Y4FqYgTNza28bY2PDMg4hCc59GGIzgUD2YG3fGrHIRdwgWLxVgsJemJU1A4cgFAz7gUwB/toTsNm3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdD2os6t3PSYJEZeInDV3U76ZlcxnwkHmDA1IYMV3bY=;
 b=EMPwaxIAl0m4x2SYMxHtpI3H9L56AKx7xZgJTssH/Z6Xy3HER1jf1ceXH5Dzv5wf2EH6BT42W0rLunlkdYs32Dzty+I+QcKgopDn7SkFLSDf6KfMD93atXgaixCRff0XUD9rw0I6lL6gORPrH+6yQi2pG/rnB43YYSapyawzqjY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:47:06 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:47:06 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 15/20] multi-process: Forward PCI config space acceses to
 the remote process
Date: Fri, 29 Jan 2021 11:46:16 -0500
Message-Id: <d3c94f4618813234655356c60e6f0d0362ff42d6.1611938319.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.45]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.45) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24769e1-2f82-49d1-155c-08d8c47582f5
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4671B4846D9BF49A1412EDEF90B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93w7fiWRQro6RVxKKHbcjHUuAsZWdQD9qVsuOJeDs93JhqHWzjlvca+W9Phf2ALa4tRiBtSVTd711jdUUHKf1B4stfLyDIAM2L2qkYdRcPIbHTiB3wmKQuPN2Ny2lKkN2swu5YHJ1dGWn7Gs+B5tGlE/vsdI+8KppEOzkeSzWf330my8Pa8p2Bt/nXJz9RKZTdCd+0v9EpTsWdHVhywL4HZ3fivvZdTisTIkoMU/xERUtzsgMPZTAwUHprbJ6lZHLLLrLsIYFtNioGX2xDNCHcHLXnsCGb/BUMbeXOkk26/HaHKH/pfdCZQVWU30RIiyJA6S9t5CRdJNFZiq0U91t/836y8Z4PgsJ8KUx/97hKbeq6mFLrcxMKdjf0P/6uy92Ej55rH2cpxz0I1LKDC/pFAOfOZEv/7gFD2/gSXJ/YOUqy50COtGMb+S0ttyEeDfDwVl0VsBnRMKIJnvzFud3DQCw31wprP3bMHh2YVL6J4AcoN70S8qqy7KAz95hOojPHclqWq+OhfUSt+y/2gWHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?n9bWhg99CecbWu49HtRMwzwrvoHHYNvRks/6YhHdc/DGt6mlH2r9XIZuSfwW?=
 =?us-ascii?Q?fiJNjpZrcyWj5d5XwCxHPZx3vtyPZoqwuyIxnP9V99+7rFl0XjXoJf0E0Rh7?=
 =?us-ascii?Q?rxZulGczIcT5bOnuen6R9pjpWGB+sHsmsD9udCTbUcphSrfUNdzAKHkgWDve?=
 =?us-ascii?Q?4qC86Dxb0YlpK63dNJCbs7YgpvmrTSbci2vhHdfsITwQJdiMzVAK0zYRi/Cy?=
 =?us-ascii?Q?YbZi+ySixQ2CqRfhjV8xjyNHjrbOa4NK6EdPGDHE7TiXigRonByr7GBTVfqR?=
 =?us-ascii?Q?8zXq6SUgGPIBEHo6EtjHXkJ8lAj4jW2B+fOmdBLhf/oDD57HC4D3il0Iviw2?=
 =?us-ascii?Q?86jTTeQEL6ue5eSNXhOQQzWbici8a0ERIiL/NZ7ygd86Bvp4+uQIu6/7jTGK?=
 =?us-ascii?Q?4gyFV7hilrM0aW3ZgZIOZRZJqwcm8Ig/baDT67TLSLu/VJKvsGhlpyMlQjcF?=
 =?us-ascii?Q?eG9C84RsVcXphh6ScGwtkFg+ZoRMe+cp556pDmqmJOvGZ3T/+lHnQkMSIaVG?=
 =?us-ascii?Q?v2q3n1HpqwuiyQSnZrmVzbaNQ7jIzYx/CN6DOu4r2FBmbrnmP/hJoHiE7MgU?=
 =?us-ascii?Q?u2MnQSt4u0Ach5MfUIbyb+ZUXJDDxTPPsokBzV/5hxSqu9d//n66u7X7ReSr?=
 =?us-ascii?Q?tKdNS9RA3w9+mRMBIlQfYmLkkVPV8xxiG0VqbtOUgbRe68X6ccD0ixbjCKLB?=
 =?us-ascii?Q?oCbKU+LHzRZtrn2oSVXQlmhaYdq1EiKj61uMTG/NBSOZlc5bzha8qBODaoVE?=
 =?us-ascii?Q?dOSE7tpfel/pF/zd5Nbc+6hRCjtWG1QoGuTeIf0lynzhCpfypfGS6DGSOHRM?=
 =?us-ascii?Q?DW2hnSko0Obv5lIqdnEQAxQzWs1/xMU9dCfIXeNNu1ZbnPEoy2UgZ0pyl76W?=
 =?us-ascii?Q?0Sxuv2sUBsdXns5ccCK+wS1gLrdeVZjm5A1STV75hXwroJ45SGqHhw85rEGR?=
 =?us-ascii?Q?HI5h3B2mi8fLOYkgpWkZrA6OmeQxSQf9FPiJDSo6QFrQOqGgeRlrnFns1BzJ?=
 =?us-ascii?Q?21AMD8CuVYSMVD202xY4ojJhyhXLpbV0drxL3zhYtyX1UlJ5x1UQrI+dX89r?=
 =?us-ascii?Q?yn6FZzDC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24769e1-2f82-49d1-155c-08d8c47582f5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:47:06.1891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YnUVkX1sAEBfrZFdncUVVxU3tV670zLxRCpjNsbvoFJT8YOzeEqrjncNGHcAwsZkv1EmlvTVtb914lVVJP1Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4671
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290082
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
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


