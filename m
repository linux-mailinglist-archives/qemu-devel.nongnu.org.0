Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9A3308B52
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:19:34 +0100 (CET)
Received: from localhost ([::1]:42012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XQj-0002aQ-TM
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wxm-0008Vu-SI
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:49:44 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:33676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wxk-0006WU-Eb
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:49:38 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGNx0N130060;
 Fri, 29 Jan 2021 16:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=7jnkcNyheTPt6IRP9OYMrxjVugSN4Ups5Art0ZB0UDA=;
 b=jrxVNxSiVf9zwClY8xqtACEqgOvGJ1B76GcrnSF5aMZMhphYcQnggPHJ8cXhpl/BSz1j
 wMBi8SgKRU9TJOO2o8qO+wd5UMTOU58eq6+743/Jpm6kDMZueUXpmgBFPM6vpgTKhebz
 2MCMMnK28MGzSTHoQ1kpyEMYlwRqH6z6Dns+WjmukvCQHAw8/hQPvkudQDs4vxPTaOS6
 6ITzawOtcCYtaJYnw907nftFNS2ra3U/YCKo8N+9rcar8PK+tcISsuYTBCF1jhkyDFgi
 /YVe4mXB3yn5rGlhcpAVjVUxcjEBJQRQaUfFmpRwKlQnP4w/CBRAzF9MYx5eTHSeoWOb gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 368b7ra9vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:49:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPHTU121114;
 Fri, 29 Jan 2021 16:47:19 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 by aserp3030.oracle.com with ESMTP id 368wcse1y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjUo19ayh2JGp07k2sxk59BeZAUbMTDe4+modZ35+ZmqL+UuUcaFfd9TbqAP8ZsvA8jkYfliW5+kfXceMwFuq4to/PwdYAn39SXQRoYVclMZ0CMHYuP4NSJzaiL8SGn5WmPRX/TjNbSXE04FUBk9WvSb7RFsT7vjYSfjkqN+6q2OrIxGWqnu5+vnulXUVAV+cfIMF/vzJhRFnL6xGs6QUwf34GYsW67Nn8CC9hWIOyrR6vbPVgkGu0eDVDHQ8M0vyYT2sHIYWNjxpEFl/J4xfE8ttpTB59NA0x9D1zL907Yn4/Si8XqlW3f8xZKdicHv/1M/NjJ23I3kRtg25G1SpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jnkcNyheTPt6IRP9OYMrxjVugSN4Ups5Art0ZB0UDA=;
 b=e6FZ+ka6E+96EfQgnhbNav7Rdyv26YgAO0vXJqRYTzekxtLLlgA622bOox0I0R2ztirBdaVQUm6lDZXnW6/O75QlgtqqE99HjhlOTaawqTo3eGONN7s68/GZFOr9DyC1i5mJ6MudZF+Vuj+bku7UzBLfzkxIc65SIPUiYI20hsj+RLQ5xg+I+JIqC65PHqBX81vE7CUAEB/o/uS5WzlB5hz0KVH4DqJsnvEt2UaakKH1yejcBDHAtFSxwxaeetkgfqI/2lFKzVJ6L0vceC3EkoHk/WQXwKRjKv+KUotUvf8XRgrg9EI0HaRAkJ/Tz8j5TrjDrnODlQgQ2P9GGw79fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jnkcNyheTPt6IRP9OYMrxjVugSN4Ups5Art0ZB0UDA=;
 b=a+K4UlNOrQh1um+BngBHy/Y7pyeKyBadXKoI6cWfwOrQ6XOK2h3nab5lV43bGlUz/THoQuXBIC8NcQ7R8rRxOW5XTbPjS4uDo2qmktaB2fJ9a02l47nyqLwfOcaKWJgm6YgCABIkRwFZsN32NUZlXqh7v0CgvwhogobnJCyhu48=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:47:16 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:47:16 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 19/20] multi-process: Retrieve PCI info from remote process
Date: Fri, 29 Jan 2021 11:46:20 -0500
Message-Id: <85ee367bbb993aa23699b44cfedd83b4ea6d5221.1611938319.git.jag.raman@oracle.com>
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
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:47:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78fe0ff4-b6e7-490d-2834-08d8c475892f
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4671D5FD4A1DA883E316188E90B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nfe9D1D1iQPRamCocD/+O0BVJyFwjaq7pQTbU89cZXFLK67BnBh3bDG+6Sno6onnOsum20QDhovDHAkoZoQvIIuIkDGJ6VFS/HF0sokdxpXRWbLSB2fFItupCZhkiY+F5NBL3wswARQfNDF4TTcRw5GhC3AQSioI5crkTvDyJGbhJ20ilvNjtooclqHVK4BjRZIwkg+7+bDaMeMbwXCt9sMHJpeHrnJjvETIYajdsuZydMN4cM7H4LTL9OGJmf3Dxi917AZ+a1TLYOUAj/WpeD1h0Rhty/nPTZFq1n44eA/fnYGHFCwKjZI3uQoMOV55h2lGmAMFZzsUkgMx3YEVdVHN6TzQc5xj+lRwtnuUts0KmQ597BNPonsZxF4zXz6i9msetFaH4/f8LPJMqzMtKny4niyPkpPkifWx4ETGbopjImAvyM7nlqBKeixqoZCRZshueX7T/EnwILd5gWJuGK5yNrz4/F/OQYW6BztDu8DUQHPsrwHAx+wYD+LpYU2CTF/Tn4jg0O4V0SJrUV9tmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ATfUzBxEe0DLRyM/vlaCH1kQEkn2iRosQJOztOBFQfwIyNYSQVPgd2Y2hk8m?=
 =?us-ascii?Q?56/CM4wN0Yrdx3lTFE3Hh/R4ne6a++1REfOoXUs+ZjHBdcSX/Vzyx0OGnC/+?=
 =?us-ascii?Q?mXs5bhVJZtR/Cgju1liJu7JsUouBk1kEetOsQU81MvyOYNlfh/k4+WgCyv5/?=
 =?us-ascii?Q?iZCEs0Ij1Pk41ei0Rb7qypBrDYB2gXXw0PPebD6bTBkoq7zrTI1x4MH8wwnY?=
 =?us-ascii?Q?yIaGp4jNSY9gmnCuCCHmRug2GLcGk22HzA4Ryi7BEDTcFVa60gUdk/xNURqQ?=
 =?us-ascii?Q?j+Kx3Gh62vfCr3OT7qm72Rqqhx/qP1nIRH8T5SUqNKZOz2aVfU3n8QNyb6nL?=
 =?us-ascii?Q?UHcopwnhm4Ba3DiIj7OzVFt6VzN4l7sMgXkL9cjAajc0JjKH7XGPS16b+qET?=
 =?us-ascii?Q?4dXjMLvWzF86K5dmJYE12kKTcTRROqf11r0qhiUKgS8ej+CfRLpfMu2f7GKk?=
 =?us-ascii?Q?96FEVtkLKPYEqS1CXWbUNsfxgyLXDurZ9MHvh1+Srqyzj/LDtpYqnsz0QO+8?=
 =?us-ascii?Q?3UFgY75cXwJu7RTkOT+hMprmf9v61W4Yi0fUYUj3qOzbrRZ4e6ks+hYFVPFL?=
 =?us-ascii?Q?OjmYJ991TS+b+ptrddUWaVS5BPH4fkZhLPLnzmrZgb8CRJvdDKueY8QFwSA7?=
 =?us-ascii?Q?LxjVP4KSdpZLgtQMt1GxfHiVXE+/nnc7JBg5vhJEa6vj8QQR1KHdIXh0TGk5?=
 =?us-ascii?Q?+DVccSJ2TEBLZ5nGiGOp8eFl0ERO2x3gLIoeVZa4EwdQh2vqQSoG6ULEK20G?=
 =?us-ascii?Q?oafaB5pzi1KDBoOoyj0dDOlGzSbKkvirMxBACvGFtczUw5SUi15JsacMXm4R?=
 =?us-ascii?Q?+kXdXkB1XDjcFa5+T1VBmSlSiBPrHG+FWcLDsZT0kmNwBysQusaO7aCeW4fw?=
 =?us-ascii?Q?vdZKtCBFn9yf/XryiuStRn3gpEqilTZBehiqcou4yS8ZUsyaRLf/B9sjQ4uS?=
 =?us-ascii?Q?qigO72PI99Vn5ZX6ECP+ZBXmaORtQp/qlSoSADpXT3vXKs6N7SU7+CSyRoVz?=
 =?us-ascii?Q?7LYDD+8d9jBoOrXVLIMfAaJDD2lBA30meOEaR9D93aZlazFyvFmwwmmKAUJZ?=
 =?us-ascii?Q?JYK3ubUS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fe0ff4-b6e7-490d-2834-08d8c475892f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:47:16.7060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ighu96PO1jingAdIn86hlp1tPecWTMtDG79kiRzAL6tNglZjidqW2zQEnN9+yl5iKH1z8Nl5PN0cuswdzekLWw==
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

Retrieve PCI configuration info about the remote device and
configure the Proxy PCI object based on the returned information

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/proxy.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 555b310..a082709 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -25,6 +25,8 @@
 #include "sysemu/kvm.h"
 #include "util/event_notifier-posix.c"
 
+static void probe_pci_info(PCIDevice *dev, Error **errp);
+
 static void proxy_intx_update(PCIDevice *pci_dev)
 {
     PCIProxyDev *dev = PCI_PROXY_DEV(pci_dev);
@@ -77,6 +79,7 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 {
     ERRP_GUARD();
     PCIProxyDev *dev = PCI_PROXY_DEV(device);
+    uint8_t *pci_conf = device->config;
     int fd;
 
     if (!dev->fd) {
@@ -106,9 +109,14 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
     qemu_mutex_init(&dev->io_mutex);
     qio_channel_set_blocking(dev->ioc, true, NULL);
 
+    pci_conf[PCI_LATENCY_TIMER] = 0xff;
+    pci_conf[PCI_INTERRUPT_PIN] = 0x01;
+
     proxy_memory_listener_configure(&dev->proxy_listener, dev->ioc);
 
     setup_irqfd(dev);
+
+    probe_pci_info(PCI_DEVICE(dev), errp);
 }
 
 static void pci_proxy_dev_exit(PCIDevice *pdev)
@@ -274,3 +282,79 @@ const MemoryRegionOps proxy_mr_ops = {
         .max_access_size = 8,
     },
 };
+
+static void probe_pci_info(PCIDevice *dev, Error **errp)
+{
+    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
+    uint32_t orig_val, new_val, base_class, val;
+    PCIProxyDev *pdev = PCI_PROXY_DEV(dev);
+    DeviceClass *dc = DEVICE_CLASS(pc);
+    uint8_t type;
+    int i, size;
+
+    config_op_send(pdev, PCI_VENDOR_ID, &val, 2, MPQEMU_CMD_PCI_CFGREAD);
+    pc->vendor_id = (uint16_t)val;
+
+    config_op_send(pdev, PCI_DEVICE_ID, &val, 2, MPQEMU_CMD_PCI_CFGREAD);
+    pc->device_id = (uint16_t)val;
+
+    config_op_send(pdev, PCI_CLASS_DEVICE, &val, 2, MPQEMU_CMD_PCI_CFGREAD);
+    pc->class_id = (uint16_t)val;
+
+    config_op_send(pdev, PCI_SUBSYSTEM_ID, &val, 2, MPQEMU_CMD_PCI_CFGREAD);
+    pc->subsystem_id = (uint16_t)val;
+
+    base_class = pc->class_id >> 4;
+    switch (base_class) {
+    case PCI_BASE_CLASS_BRIDGE:
+        set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+        break;
+    case PCI_BASE_CLASS_STORAGE:
+        set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+        break;
+    case PCI_BASE_CLASS_NETWORK:
+        set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+        break;
+    case PCI_BASE_CLASS_INPUT:
+        set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+        break;
+    case PCI_BASE_CLASS_DISPLAY:
+        set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+        break;
+    case PCI_BASE_CLASS_PROCESSOR:
+        set_bit(DEVICE_CATEGORY_CPU, dc->categories);
+        break;
+    default:
+        set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+        break;
+    }
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        config_op_send(pdev, PCI_BASE_ADDRESS_0 + (4 * i), &orig_val, 4,
+                       MPQEMU_CMD_PCI_CFGREAD);
+        new_val = 0xffffffff;
+        config_op_send(pdev, PCI_BASE_ADDRESS_0 + (4 * i), &new_val, 4,
+                       MPQEMU_CMD_PCI_CFGWRITE);
+        config_op_send(pdev, PCI_BASE_ADDRESS_0 + (4 * i), &new_val, 4,
+                       MPQEMU_CMD_PCI_CFGREAD);
+        size = (~(new_val & 0xFFFFFFF0)) + 1;
+        config_op_send(pdev, PCI_BASE_ADDRESS_0 + (4 * i), &orig_val, 4,
+                       MPQEMU_CMD_PCI_CFGWRITE);
+        type = (new_val & 0x1) ?
+                   PCI_BASE_ADDRESS_SPACE_IO : PCI_BASE_ADDRESS_SPACE_MEMORY;
+
+        if (size) {
+            g_autofree char *name;
+            pdev->region[i].dev = pdev;
+            pdev->region[i].present = true;
+            if (type == PCI_BASE_ADDRESS_SPACE_MEMORY) {
+                pdev->region[i].memory = true;
+            }
+            name = g_strdup_printf("bar-region-%d", i);
+            memory_region_init_io(&pdev->region[i].mr, OBJECT(pdev),
+                                  &proxy_mr_ops, &pdev->region[i],
+                                  name, size);
+            pci_register_bar(dev, i, type, &pdev->region[i].mr);
+        }
+    }
+}
-- 
1.8.3.1


