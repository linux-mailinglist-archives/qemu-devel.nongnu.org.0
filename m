Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F223A2FC18D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:51:18 +0100 (CET)
Received: from localhost ([::1]:35560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xy9-00078K-Ri
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xfF-0003dr-0M
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:45 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:39520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xfA-0000gB-SY
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:44 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKOpKO146203;
 Tue, 19 Jan 2021 20:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=WWJvgtB3AelazeMKJ9LuGJwKpRD2TFnza0WlANweXA0=;
 b=G/nPFqKt0pcgBKC9fljsiwYy0kaeg18LXxGCyVW6Ry1SrHdumVmaphD/IfW6MeZemGyi
 YfKwM2awl32uLzw/4McREJAGw54LMb3GXnYTDKYMhJocDRq24j9T7g3Z3W07tJbG6MJT
 KAj9nmjoD7RsKmyX9N2rQ1LBlT1l/ID7tzusB4fD93rf3nUA4fqK5/jLnOLAKC0UZm28
 lYt9lyqkfHGbcBQW4GO6NpgMs+H4kT7BFm599sFLpTbUmDJE6I9GYdE5WI/yEQXwyqwy
 lIYR8+GIxpu8BjP8YdbjWIMftueYO7HbHNiPiO6HWmoHy7YCDJtHBNZcVDIXqlVgs6EF /g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 363nnak561-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:31:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKQb6b106592;
 Tue, 19 Jan 2021 20:29:34 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2053.outbound.protection.outlook.com [104.47.37.53])
 by userp3020.oracle.com with ESMTP id 3661kht8h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az9DeAkOvOHDWQxluhwRdbuTfhb1p7azdFk3RkSvvf34v6jroO6kV+G6O45X8uMgGBnXkJjfdwxfUkoOUATETPPk44+gytXi89misUQg/LMtpTcwB/MYSJNlP0SsccMZ93b4SJM/bsC4BXwVWQgqbOa6HvAinIZc7gQhVsK0bgDyJEqbuRCXfWLlmBs5UiUfqb+0kEfNGJKDZWfBmEvrB/eanYwF/x8XXMsl01BrKJzOT8SDg3BQMYbs7kUSJjAEk25+QVRe7aPBhEhjADDbBvX1HUOGrbqnug4+ufo0YHWqOJvpcmj6pWyfyr4S/Wdd4x5rLj/ePu/E607KBoazkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWJvgtB3AelazeMKJ9LuGJwKpRD2TFnza0WlANweXA0=;
 b=bw5fSh0rhuiLEsFGwjywofkFHeO5EGkLnM2c6l842z9I66D/cmrLOCucmW0PCSTWAnkqJUsX8jceDF6vWTXFe3zL7+J8cgvVO+FqlSjfHv8zNykkuHaSSjCE2Chee9QDolCQEjiiOCav/oB3DlmHAGTluBvxJwrmaXXEbF2oQj0CO7cxANuYmtOOpnwJeP/feR/pBpcRjCtnBMSqk3jOBFIcZdFsly0tk5Sl1WW7SYdTZuVDVCHzV/xr0O2VPYhg1fXPOUn7V0iw56ZXEybasb9qFIEHZnLOLaLCwUFI7U6lp1XZdHT2XF89W8UOuuiU+4vuyjQGnA6PZYS8wDKndQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWJvgtB3AelazeMKJ9LuGJwKpRD2TFnza0WlANweXA0=;
 b=ehYNJa2iZG8pH0fLdfNvzU+M0NErOTI2073Vmcm4jY06fnZz5WwmCPrOgJ5QffoZnV6LuPO7VLGi7v6RR5EGS6ZPl/grH7RPa10ciCHMVTPW6FnTIOMoEXtat5B8SIWAG+DQeUsgiWMCu6XX5jfZDztnZF/gCxC167u0bWZpIM4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:31 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:31 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 16/20] multi-process: PCI BAR read/write handling for
 proxy & remote endpoints
Date: Tue, 19 Jan 2021 15:28:33 -0500
Message-Id: <009f187044136fd5316fc0ffa652379364cdcfb6.1611081587.git.jag.raman@oracle.com>
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
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e51b66ed-cc50-4763-ef3e-08d8bcb8ed57
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB334963A012BAAC6A0B15B3B190A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIdF5zKbEMqxU+qMHBydY/ZI5AASJUeX/BS+1GTU7lyOCEb8cf4OmOwmx2kounsX4nLviVZOEAltGYdgHws+3Oj7zl53Y8IXSpCmS3WVo8qsKF5jXimZ6FhY7SbP7+h4b157a+V3ZRM5KXhEJTY0YUX0aoM3Vb6CZUOcAIz26hZ/BMRZz6NvvHkDxAsTRsvM4Rnc/yHib61tumpilEbnyXKp4NLiIJwAr0CjUao76tcg8SzUsmngZgJEFG0oQ5lLGj/4nrxKa2x8BmfqTZNLKaggX+cKYSBp/NvkYVLqJV8dUVe1wZN6jAPCzO3DrB0qXXbLRkMyIB+jgq4KQKLtt77rp4nvhjS8E+qlUEPZC9RjxqWvMUm9PAxBVVcWGf7f58w5q5tiCbznMeU2bNyK7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KDfbD7J87OD0Wu8G+8XuQXyiCBPpcHmKc6GUgZeNeuZrbM4q3KThJUCdkPwP?=
 =?us-ascii?Q?AX1Dv6kaKZe3LF83lpmvPZjeJAqhhXA9b8Jf8CIDBUdfMqXg7fx5N3m3xV+1?=
 =?us-ascii?Q?jG8wZCa0HvhcngZhtNOtJW0rdYyDuNbt2p0rvZGXtx38DCSGOfN6W0uSlxQ2?=
 =?us-ascii?Q?BiaApp4mTixbYLVgFIvnqh/fB8M1XjbugsB/762V7qOVpDL9Z14Krg9byk+a?=
 =?us-ascii?Q?pzQVLjeL2cUx8tNjyLN6/LGGYwfUKuoYCdTuI6d9QG9lDgPCcilQ90ofCJxh?=
 =?us-ascii?Q?w31YoCR9KYMlB5mkEClB78zQqJQqb/KuNDbunwRqvxZlco0U0/oBntHgx9g+?=
 =?us-ascii?Q?GgQ9/qzj6xWDSxEA6j0rTpkKlaZbNjvXQYK/QHoT/15EZEmKBv2Fe6hnnjCh?=
 =?us-ascii?Q?+Nggjl4cY1vKYQKmDAhmjyqNqWV23xC3hGWnwcZ0HRjxjis488wWRMTYvBpS?=
 =?us-ascii?Q?c5RipAFsHLsN/Dsf3FmHunjLhYwQmZ0fR3+ZkCAtt21iBY5n4hSZz/PGcCS9?=
 =?us-ascii?Q?/1kRSQh8SLSN4woAsECtwgS3/xEP1AHaUTzw/JrNVxWg5sr2n+iB0e6UlnOH?=
 =?us-ascii?Q?XX9CDGljCgPDfMuTUS3wRCiY5kIGVeLOnZkr1Do0IO/+XHgU4Gx44N1YuBPh?=
 =?us-ascii?Q?SUmTUKPO7Y+XsMW+K6Udmi9/Knlk36wrQagZoDggDE2y9NPs2ySzz1qNwYWz?=
 =?us-ascii?Q?2Ekm8G52GGhCUM31qiQE/gxKINZJCZqe7UKUyNHnU9d6zEnBFN8vY5XwY/Cg?=
 =?us-ascii?Q?5iWsQhkDxMRQaoFQ91SwwM6uxddoKj6rBBIw2WS5UwZxq+mKt1t3M+SJojgW?=
 =?us-ascii?Q?dRqbbMXNijnn9kYEuf8fOj4gwMv40JX8SGbXqKPZJQXsgD8GAVXQbBh6YoXp?=
 =?us-ascii?Q?+UngzlMwKnKNrvsDBxwucuRuneEk7tsMGquliexK6AaL+05tN8YEV4jo60Aw?=
 =?us-ascii?Q?vaPdr9A5TZugnA77KETIHKhdbL8zc+D4jLO9sdF4wbM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51b66ed-cc50-4763-ef3e-08d8bcb8ed57
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:31.6971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79hhuDCSufziJPRotHON2lKaKlN22kqRJJxj8sO604v4xFCF+QpcZ6zKm6npvKTJYOjAwPaLG6+60aw7jMtZag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 phishscore=0 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
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

Proxy device object implements handler for PCI BAR writes and reads.
The handler uses BAR_WRITE/BAR_READ message to communicate to the
remote process with the BAR address and value to be written/read.
The remote process implements handler for BAR_WRITE/BAR_READ
message.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/mpqemu-link.h | 10 +++++
 include/hw/remote/proxy.h       |  9 +++++
 hw/remote/message.c             | 83 +++++++++++++++++++++++++++++++++++++++++
 hw/remote/mpqemu-link.c         |  6 +++
 hw/remote/proxy.c               | 60 +++++++++++++++++++++++++++++
 5 files changed, 168 insertions(+)

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 7bc0bdd..6303e62 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -37,6 +37,8 @@ typedef enum {
     MPQEMU_CMD_RET,
     MPQEMU_CMD_PCI_CFGWRITE,
     MPQEMU_CMD_PCI_CFGREAD,
+    MPQEMU_CMD_BAR_WRITE,
+    MPQEMU_CMD_BAR_READ,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
@@ -52,6 +54,13 @@ typedef struct {
     int len;
 } PciConfDataMsg;
 
+typedef struct {
+    hwaddr addr;
+    uint64_t val;
+    unsigned size;
+    bool memory;
+} BarAccessMsg;
+
 /**
  * MPQemuMsg:
  * @cmd: The remote command
@@ -71,6 +80,7 @@ typedef struct {
         uint64_t u64;
         PciConfDataMsg pci_conf_data;
         SyncSysmemMsg sync_sysmem;
+        BarAccessMsg bar_access;
     } data;
 
     int fds[REMOTE_MAX_FDS];
diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
index faa9c4d..ea7fa4f 100644
--- a/include/hw/remote/proxy.h
+++ b/include/hw/remote/proxy.h
@@ -15,6 +15,14 @@
 #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIProxyDev, PCI_PROXY_DEV)
 
+typedef struct ProxyMemoryRegion {
+    PCIProxyDev *dev;
+    MemoryRegion mr;
+    bool memory;
+    bool present;
+    uint8_t type;
+} ProxyMemoryRegion;
+
 struct PCIProxyDev {
     PCIDevice parent_dev;
     char *fd;
@@ -28,6 +36,7 @@ struct PCIProxyDev {
     QemuMutex io_mutex;
     QIOChannel *ioc;
     Error *migration_blocker;
+    ProxyMemoryRegion region[PCI_NUM_REGIONS];
 };
 
 #endif /* PROXY_H */
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 636bd16..f2e8445 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -16,11 +16,14 @@
 #include "qapi/error.h"
 #include "sysemu/runstate.h"
 #include "hw/pci/pci.h"
+#include "exec/memattrs.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp);
 static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
                                 MPQemuMsg *msg, Error **errp);
+static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
+static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 {
@@ -52,6 +55,12 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_PCI_CFGREAD:
             process_config_read(com->ioc, pci_dev, &msg, &local_err);
             break;
+        case MPQEMU_CMD_BAR_WRITE:
+            process_bar_write(com->ioc, &msg, &local_err);
+            break;
+        case MPQEMU_CMD_BAR_READ:
+            process_bar_read(com->ioc, &msg, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
@@ -115,3 +124,77 @@ static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
                       getpid());
     }
 }
+
+static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    BarAccessMsg *bar_access = &msg->data.bar_access;
+    AddressSpace *as =
+        bar_access->memory ? &address_space_memory : &address_space_io;
+    MPQemuMsg ret = { 0 };
+    MemTxResult res;
+    uint64_t val;
+
+    if (!is_power_of_2(bar_access->size) ||
+       (bar_access->size > sizeof(uint64_t))) {
+        ret.data.u64 = UINT64_MAX;
+        goto fail;
+    }
+
+    val = cpu_to_le64(bar_access->val);
+
+    res = address_space_rw(as, bar_access->addr, MEMTXATTRS_UNSPECIFIED,
+                           (void *)&val, bar_access->size, true);
+
+    if (res != MEMTX_OK) {
+        error_setg(errp, "Bad address %"PRIx64" for mem write, pid "FMT_pid".",
+                   bar_access->addr, getpid());
+        ret.data.u64 = -1;
+    }
+
+fail:
+    ret.cmd = MPQEMU_CMD_RET;
+    ret.size = sizeof(ret.data.u64);
+
+    if (!mpqemu_msg_send(&ret, ioc, NULL)) {
+        error_prepend(errp, "Error returning code to proxy, pid "FMT_pid": ",
+                      getpid());
+    }
+}
+
+static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    BarAccessMsg *bar_access = &msg->data.bar_access;
+    MPQemuMsg ret = { 0 };
+    AddressSpace *as;
+    MemTxResult res;
+    uint64_t val = 0;
+
+    as = bar_access->memory ? &address_space_memory : &address_space_io;
+
+    if (!is_power_of_2(bar_access->size) ||
+       (bar_access->size > sizeof(uint64_t))) {
+        val = UINT64_MAX;
+        goto fail;
+    }
+
+    res = address_space_rw(as, bar_access->addr, MEMTXATTRS_UNSPECIFIED,
+                           (void *)&val, bar_access->size, false);
+
+    if (res != MEMTX_OK) {
+        error_setg(errp, "Bad address %"PRIx64" for mem read, pid "FMT_pid".",
+                   bar_access->addr, getpid());
+        val = UINT64_MAX;
+    }
+
+fail:
+    ret.cmd = MPQEMU_CMD_RET;
+    ret.data.u64 = le64_to_cpu(val);
+    ret.size = sizeof(ret.data.u64);
+
+    if (!mpqemu_msg_send(&ret, ioc, NULL)) {
+        error_prepend(errp, "Error returning code to proxy, pid "FMT_pid": ",
+                      getpid());
+    }
+}
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 5bd6a9d..bcb32e0 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -248,6 +248,12 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
             return false;
         }
         break;
+    case MPQEMU_CMD_BAR_WRITE:
+    case MPQEMU_CMD_BAR_READ:
+        if ((msg->size != sizeof(BarAccessMsg)) || (msg->num_fds != 0)) {
+            return false;
+        }
+        break;
     default:
         break;
     }
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 2b14394..22eb422 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -152,3 +152,63 @@ static void pci_proxy_dev_register_types(void)
 }
 
 type_init(pci_proxy_dev_register_types)
+
+static void send_bar_access_msg(PCIProxyDev *pdev, MemoryRegion *mr,
+                                bool write, hwaddr addr, uint64_t *val,
+                                unsigned size, bool memory)
+{
+    MPQemuMsg msg = { 0 };
+    long ret = -EINVAL;
+    Error *local_err = NULL;
+
+    msg.size = sizeof(BarAccessMsg);
+    msg.data.bar_access.addr = mr->addr + addr;
+    msg.data.bar_access.size = size;
+    msg.data.bar_access.memory = memory;
+
+    if (write) {
+        msg.cmd = MPQEMU_CMD_BAR_WRITE;
+        msg.data.bar_access.val = *val;
+    } else {
+        msg.cmd = MPQEMU_CMD_BAR_READ;
+    }
+
+    ret = mpqemu_msg_send_and_await_reply(&msg, pdev, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+    }
+
+    if (!write) {
+        *val = ret;
+    }
+}
+
+static void proxy_bar_write(void *opaque, hwaddr addr, uint64_t val,
+                            unsigned size)
+{
+    ProxyMemoryRegion *pmr = opaque;
+
+    send_bar_access_msg(pmr->dev, &pmr->mr, true, addr, &val, size,
+                        pmr->memory);
+}
+
+static uint64_t proxy_bar_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ProxyMemoryRegion *pmr = opaque;
+    uint64_t val;
+
+    send_bar_access_msg(pmr->dev, &pmr->mr, false, addr, &val, size,
+                        pmr->memory);
+
+    return val;
+}
+
+const MemoryRegionOps proxy_mr_ops = {
+    .read = proxy_bar_read,
+    .write = proxy_bar_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+};
-- 
1.8.3.1


