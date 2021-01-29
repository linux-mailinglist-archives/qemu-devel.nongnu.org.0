Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44159308AFA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:10:03 +0100 (CET)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XHW-0000VZ-AL
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wvv-0007Kz-HA
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:44 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvX-0005mI-Bf
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:40 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGNxpB130044;
 Fri, 29 Jan 2021 16:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=WWJvgtB3AelazeMKJ9LuGJwKpRD2TFnza0WlANweXA0=;
 b=MxNX6zTncdP8erxLui97hm8/1dAQN5/dQfNxroWk4cokRbeMtAOJDNpg01AX4jtnXjEr
 QxdI1vLRNoBSI7wQ8KTW1mFBMHV0wzFgnSedTgQX3i3x7XzZMLNH+PDRhOH9TFQ/zKx8
 PK36TkDP1JpQtHV1V8PfxpB1pxxlMlw+860Dh1ESw04BysCD6azJSUZR5EAjvnk9xlgv
 I2jLLjesY4bw2oel9ephs/gi3JaQE+0MN7IdfwrfiyuGulsR0JIySsHyJplC0+PfEryn
 e6OdjsMeCorOiYQvEKNfXrwSux3ZhGMQbSi3fFt8JEOr9SsRVpOaTwRD1alezBRUn5dm CA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 368b7ra9gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPIFg121237;
 Fri, 29 Jan 2021 16:47:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by aserp3030.oracle.com with ESMTP id 368wcse1tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgeHxq3eATJCzaueXKXITiwxqDIVLl/TNJZiD8R0XgPpq/wWL5m8tHZj0aSyZuMVMjjURXSw89fo7bzotvPsR56XGGMM8nIe7dNfs7UzNcBoAFkjkbNTcfr6/uLntBxqfLAvrn7zCFUfFHPzZcYOY8XAELduaKYiqbi2cX1CjlafVOMgUQKFb84mpzMcXmEAcz2HgphZtFVQIlTDKBgPuiFILD8Vo/hJ5z4AwNpC1jJe7qono1bKXVmlz1hLXuOa8g6Q1GcxQ7D/oYHZQRe8NnW6CFcXR/ATdNb2Xa85okK5QQ3LKTyKUOW2v9bQ9Y/g79a2rl1Th99C5q9HGvtRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWJvgtB3AelazeMKJ9LuGJwKpRD2TFnza0WlANweXA0=;
 b=lvsLgzg8nxxF/el/lJIu7apa7tXtendXZ5Ifaa2ZQ0P771m26ImVQlmnh4peRJG1gqq7YaTkPegI0kacZ52RTteHgXQKR3qpBKVdQTnYPVAnbHxIpjfWGt4g5Fl5+i7POdzflS0PVK7ZmObiM0GRRQl1W0Ww20AbAyh3Wsk9ftj0Z8eFTmYj4spa8VJ6Ixuy5G2ixoSUo09Ac0xQLxKlcOm5LDd0myJlVRVHpkcYlWZAwVoNJWZ3Pv6hjOi7oFPLRrv7uVPFtNPHQuSIeEnQJcItlWvKtPMBf/+/72ETgZ1m+Kp8W7JmzG7ygIrBxoEE31/H91qQ4uDS9rQ+0WDTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWJvgtB3AelazeMKJ9LuGJwKpRD2TFnza0WlANweXA0=;
 b=nk4QTUL2iUatlGfaEBuweIvYkLD8ZYhiobsdnHGIRcH8k3lMWhJvn01yQElGdJijC4/SSNK0YxNh61NeXlD1o8QNzOri4NTi90ESirbCkYBiqVZAGARGZV00HDDBx/ywAy9XVOMWvshhJFvmghBIM8G6FB75F4ZAhO3lT6XP2yw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:47:09 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:47:08 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 16/20] multi-process: PCI BAR read/write handling for
 proxy & remote endpoints
Date: Fri, 29 Jan 2021 11:46:17 -0500
Message-Id: <a8b76714a9688be5552c4c92d089bc9e8a4707ff.1611938319.git.jag.raman@oracle.com>
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
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:47:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f276ca49-06fd-42ea-0a91-08d8c4758479
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4671AD1742AD96F50306B20F90B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 31m4ui4GAP2x8XqTOulx/inpEHPx5/i+QOJm9bW0eiyOtHJb4GxCaRkzJPMq/HhNM7r36391pkxQF9S7Lf0xwX0mJRtCCWRQJTVHipbaa2OCgQMP5NMHufbkgdoD8E3okEUAsRkxjwkPxZBYgvqvQ3RftwZRwaW5QiREaePck/T/ju03Q1ZjW1lr8RJlX0+vAccpM6wvZLPl6tqxvpgmh9kpiblWjGzZIBs4mVdmBWpGZVnX17v8MMXdJ7m4WlAGcXI6eN1za+pIwU9P7q5PyPXgdwFBq9Tb1KFafkXC7ak0cTvALi+rRiqg5xLtOjnUWRExH6BEGXmHh7pUzEJjsDe21tNyaEOzDF83vMT8FAL1ChqJ+uhnvveMwFQJFvhzn6HXlN68tHHo2P43+Th9fxGZi2JG5j9E9jpM2n1x+TnAhQyIAIncGj98GpYRxi/MsrShRpuM85YHXdFyuucbEqUXBs9+4lwegas2ZXa9d7HjeZqhpOTRbw+3x4EKBTwB5jWxJduNm7mOFp0ztIZokg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/RRozMfHzsrJROB8mXBZIzJoKbZRihaC7q1f1OQ1Ls3wFAxBLc7Ssewmv+dN?=
 =?us-ascii?Q?BAcrg2Ea80x+p170/kAOWlsTb0jcZNxiFjgV4UjtdyIKWBe7vuGScBf5rAsX?=
 =?us-ascii?Q?iLe7KMlzUP5J8Wn4BZpuiNvV1sNmnoTPFWJriPpQUDtdhAGhQd7LisYt2DuY?=
 =?us-ascii?Q?NY5Ipqb2X+/fUaGMu4PkzCD40afMyKWjvFf8AFA6JZnpUoy/CrfTv1ZpjQlb?=
 =?us-ascii?Q?fWJbmcK7Wz0Xf/VGcD81ZdeBWRY9NB5Wql46ICVV8CEn56Jh23uaT++b1/Qk?=
 =?us-ascii?Q?mqgev7QiFrME3jZ5ZIHyrfA/AQUuV0/Dg0nrgKowMOSXHYWEHnPe8bz4mFjs?=
 =?us-ascii?Q?/SdwQQC5J94wobeJzyoQmbpgyYxLTPiqyS8IFHrg2oARzSq7t2Wog/iBIfaO?=
 =?us-ascii?Q?3G59YzsNiDWmLFzbUAJJBY2f37kPkC/Nl0fLIPFUumawh3X0guMr4cyIy9hB?=
 =?us-ascii?Q?cSZNpP3o/Q8sMFZrLqkXWmmk4gComKQz+4Z4bq7AEBsBhhuwqjBs3qvxaVPh?=
 =?us-ascii?Q?Re1o+X5hsi+z5ChAge/fixNkSnc+GTRsPdUF3GflWJputP+86JHOe+18c/Hk?=
 =?us-ascii?Q?4cwbC5SyUbRdSRtxIC0Ruen5BNr9IyJlAL6lQD/WsyHS0vB5l50/nKVHJLvv?=
 =?us-ascii?Q?wz9grsyYvqVQworK95wCGjUs5Hu3PFb0+m10al9VkloHJp1G6RHeCucm8Dhm?=
 =?us-ascii?Q?n0u9/csOAIukg/nktfajvOnWaue5wRTy2JDaiSotEXi2cUAQ4k88BjSm3jhZ?=
 =?us-ascii?Q?cULlfgoxrePxQlsFrPgO/ERb/pnq25GKVv7VgUR9A39vqAiCm20Su5LW67iB?=
 =?us-ascii?Q?FOZiMma6ndxz+p5qc38K93jzwlwxPtg9tWDGU0LWXhUoEjRG9dPZ2EMAfp7v?=
 =?us-ascii?Q?d8Vbw8UtsK6IdakoQl66wHPtzHORHGkJk6LgYQsuUEWkCTBTzSl8E4tHs29e?=
 =?us-ascii?Q?EubPMHSAwMIFVGEYwUSole6+Y0y5UiKo9yHalcuiZ7CcFDKMHwOO/HV4uPdm?=
 =?us-ascii?Q?fAwtJWwWKIum6QlQoE4r0b+bY7UvkXwIhwE9UnJpgktl3kD/j8L0TImcnu8g?=
 =?us-ascii?Q?Pe7RbXWF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f276ca49-06fd-42ea-0a91-08d8c4758479
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:47:08.7936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+SPcSTNsP6K9DVsK6V+kmGqlQ6eHxADtVdixejT0rYKGuk4JLdMcA7GhGXQp5YQFUaPc6HztwhxkuJSvLA/jQ==
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
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


