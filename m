Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE9D2FC1AE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:58:23 +0100 (CET)
Received: from localhost ([::1]:53326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1y50-0006mE-RN
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xfN-0003lD-Up
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:54 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:58208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xfI-0000gn-Is
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:53 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKODQX131263;
 Tue, 19 Jan 2021 20:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=7jnkcNyheTPt6IRP9OYMrxjVugSN4Ups5Art0ZB0UDA=;
 b=i/0BBNT3+inA1zL1Z900VfZUhbOEOHWKMSQGFXQmkt6TR54sJwtBZbduXgJISlFCutL3
 uensJjnEPlgODk/V5HP+TKZUxLExrIIynNeeqgHLDPoE8wDBAwhRsLEi0OzdhCn0JMRl
 GlitcCBAs3oTQlF7II9JYIW7IHuakXRi0gXez7iQJgnlCYQ72BySHtuGftK/Y6k2/kBi
 N88z6Z0MvsPddlrlT6j5Fv66OWg+ZGpQWsKImwFE8+0D62WW3U5hEW8j9azf52/VQZMH
 kDAQqSgzqe8rzIXykVtogqTjwdZhqWEtiuBJ7m7GIm/2gpmAipC+npD/PnYVMlJRUzoX 0A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 363r3ktxyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:31:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKQbJg117482;
 Tue, 19 Jan 2021 20:29:42 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2057.outbound.protection.outlook.com [104.47.36.57])
 by aserp3030.oracle.com with ESMTP id 3649qpu9f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crsiyoWOawMRmU9P/98As1oqYfha2RmlMFd20O8ibJqq0IxnpPMSsRyKLTgcVGX/IoIr3NfTOR+Bp36kB2mJNGXBKQmrRxdKGuxtmw0iSOoP19OCN/9f3JRU/NHUWHKVZ2hL2E44GD5E+6YKur1PGPtQQAK0+gz3WxTUTfOh2FWGD+H//bOwnLNRxqOvZ0AcrwOk/NOx7TWu4H6tmFybwJ3U7gpK1w/DOc4ux118wa4Eg4JZPw9DYfS0zU0b/MRmGH/HZjNz8XTHKkWqDbAI1AMpHd6dZcfvfJ9W/MzYc9UmVsZ4wBU/oUtMvRgDQv8sMi57PYwGtmxU7BuAXZKwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jnkcNyheTPt6IRP9OYMrxjVugSN4Ups5Art0ZB0UDA=;
 b=CfIIV+DpHZUxemJ0Rjf5NfQOYn48Jj2c9ldr5c3Y4K5JLiW23v7DEBeaQ1bLDNvIx8uQeLQzwwsBL7nh2dBV4upqBDqYSxMupIXhNrPTu1/ocJsVsEP35x6+eI3mGusglzXJss6ci9goiOX86pNHwgNY7XAHPkEkyx35YleY3kBuZOc+gJEMbJttcUsZR27ngUVH0hM062WvbNTwtE8ly+m6qAbI/kZS74jqVnqiXuwNxWfFce3ch8OoV+WU16IRT86scjQQx0cjtKzr1fcaV5gaS0gM6AJkZRZX8TfI9MBG5zdI0MUpe1uU9+rMPjPr7e1ypsJSztuJUtZhSKcAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jnkcNyheTPt6IRP9OYMrxjVugSN4Ups5Art0ZB0UDA=;
 b=lqOv1hKTOT2oVvfrqZUMkUTNCjNMGu9cN6swLN+U2mctqPnp7NSH0HipVfjxJwqtuZWVVqEgWPZjJ1H2+VqBX9D1tb3cJBexMVml0qnn1Jfs49SrZ++2fl6/Rw6V/pCpjYo0GgX3OOAMC1RKK7Xir12cVzszc2cVdNXiGUFto+Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3351.namprd10.prod.outlook.com (2603:10b6:a03:14d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:40 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:40 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 19/20] multi-process: Retrieve PCI info from remote process
Date: Tue, 19 Jan 2021 15:28:36 -0500
Message-Id: <1a6ebf4554e61d92b1cb81923442e1f8db9d18b4.1611081587.git.jag.raman@oracle.com>
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
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 841be3ee-5b63-4bf9-0fd2-08d8bcb8f2aa
X-MS-TrafficTypeDiagnostic: BYAPR10MB3351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB335153950BEF71E170F44CBC90A30@BYAPR10MB3351.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I34yl+IxBYoRVID8p8+K09e/bZeG6YZi1pJka7N7wz/dQQVjW2qC5z1OrHxwsAbi0L7AzhctumpbVZXq8D60GFKLhKaYpwGVM5/jHWwu25tRgx/TFjzAuIdXa5LmJ5LPCcaO8fXwKPGdKdSJ0RBvopmy5+AwEgOOrL+3N74P0iYPkNL4Xky67t8pCXajnfhMaIu52U/nh9bo/3a2gJ/5a/OAyATRVwQBBafoU3OBGGUYzTK7q95ZcTnMXYSaNXGmHIpzZ5u4YpPoLgkokJMWjhALcXgNuhr+QAkl6gbg4H21BU+NweOTolMEPdI2+oURJHUsQwRfb9xesppM93yPslm76CPwOsbK0WVGEN+4cxfCDbyv5gxkaBezmadcAUew73KYFP7Zp02cJO/DdP8XxK61PHq9FRRYUxmVnXfIGyKdSt1Tvv5nEd+khtKn2YhnSPWtM725Rgi/JVQFvCbIcTMRNeAsk6swHa6X6MK1o/MDxd4FDeARTVuYZifhr56kBdYNxzVq8J60QdECHRB5PA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(86362001)(2906002)(6916009)(36756003)(4326008)(8676002)(52116002)(66476007)(66556008)(316002)(8936002)(66946007)(6486002)(107886003)(956004)(5660300002)(478600001)(7696005)(16526019)(26005)(186003)(7416002)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?quc0kvJjE8CUZHa5J0xPzGeFX9kb2mSOZZduXAjG03OVeTkHqfkg6nzhVQey?=
 =?us-ascii?Q?POWYgZNV2+2kVhRRnOXeuhrYab6n59m9uqySyqRge7wf89SmS/tZZMxHHzbk?=
 =?us-ascii?Q?zYKIczrqRrh1cfwTEpKkPMe4ygUdp6E+5rdjR8EGqIzK/it2MOHj8xd9JDaK?=
 =?us-ascii?Q?Dg/OoyWQxnPxXqql9bKbePYLSOjI8+GB4l+yr0gTBj4s8rejYdBk3bIn+d4e?=
 =?us-ascii?Q?BN4+sm5vJfyogrl10/xrKfX0EX0+bN2SLtCEAPdSRksKsCesLA/v6g6UAczH?=
 =?us-ascii?Q?CmVJco7DVBaSy6ZnyvC3VXlVFe2EFLJ6W5Zpe9VW8Rh+FIiDY5svyT2nb2Tt?=
 =?us-ascii?Q?2tXEIYUYTtbItbOW9f5TV7OHz6eVaW6Pu/rygiibb93zZm28GJAcXL1GMRst?=
 =?us-ascii?Q?PstfxRkYQYy9NkS6H4gqfQ0NGnfyL0E6wobvdMyfmXY4W0NS6YNNOQhu22qU?=
 =?us-ascii?Q?Nzki/i0FPFCnegUt9qx5c1D2faFAUezcqvsXtZIOwJiWsjfZtVlbPFcKNfmp?=
 =?us-ascii?Q?XP0jyMOKQVmADbMEz2GIOZDhupdmKAovnyHrosH9VvPF6GWqTBQsg+Zzqnps?=
 =?us-ascii?Q?3MQXF7Zqx7mjwEfCOf1ymZ3QjQrdmaw5nvwuFQMNJDM57aMsF9mX6xHZfBt6?=
 =?us-ascii?Q?R0pTltLUURXcLphEeu5QSY2ObDRTJP7im88K4FXeip3AH2bmFTX1ZVW/iyNb?=
 =?us-ascii?Q?2VlhjxyaY8iAGzklzepoPgzUr0nrSfjzV/CKJHHqql5VuwfKJkimUJtqRP8x?=
 =?us-ascii?Q?hJH2qs4+BHpfz4GtPeVgkyMmrHJ9djfnEzRPMrTRI1N4n9gDUtbkUktU1Sbx?=
 =?us-ascii?Q?oNTftipzb1H+RDz/Z0B540NB3GI3YgNOdGrgsQR5WsxbG2VyzmfqsWKoR04/?=
 =?us-ascii?Q?lJJLOwHQK5W3rShQqYAl1ME4Cb/KAweMeysgNFeDNeYlRgSy7X0AJDZHoXJB?=
 =?us-ascii?Q?rIAFGkjxEyoZgrlLl6UJAt2sfyEhpQbi2B8jSRystrI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841be3ee-5b63-4bf9-0fd2-08d8bcb8f2aa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:40.5939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McjrWRB9f2QkE3Eh8h9G0pAACB7/c1vqdkLVHdZ+UnqgHSyBkRFmR8TDdj4ttI4z3ntRl7Ma+UxWn6s/MreivA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3351
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
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


