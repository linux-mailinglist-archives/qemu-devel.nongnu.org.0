Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79BA2FC112
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:33:36 +0100 (CET)
Received: from localhost ([::1]:47194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xh1-0004sc-Pq
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcp-00011s-Tl
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:15 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xci-0000E8-Tc
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:15 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKNUow002794;
 Tue, 19 Jan 2021 20:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=as6s5hO3AJDOzJBWkCCgDpzZPYcwFCq5Zq3lZo67axk=;
 b=G3/+ny1y0VqZack8S9rM+S6YbQLevCwnfmRkJcEzHW6J1SRf2CRcvmVKMKWlUXXcaPHj
 F0QyeVlw1EU+IF5cruodqlR+9bkp0brnRCGmCQtHFCpad8Ndd0BPu6DckfPmtNXD+6vR
 dDgG2+tTLekk0bY8PbOXO+Y6r/0m6GQatgoXGEpLY//BGnPRgDsz8N7j8Wsa79Tbpabg
 DieaOX09uN4fso5K8P+OGWxV+l9eYM34o2XpRyIShMvDb4/eCzDJ6gBP3A9vb76k+amY
 ys/GkCk9C49NPPwisrUS4vcQ5zBdYVLOy4jjuwSwHxmhaL/Syb9K4V2gmjC5DAux+VpR 6w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 363xyhtasa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPfCn128678;
 Tue, 19 Jan 2021 20:29:00 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
 by userp3030.oracle.com with ESMTP id 3661njtab6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOchjXeWNFl9VNx9Bx7rWThTkID3/ZLRa501nnMU9BaJR6Ke2TGP0n+b2eeVv/D6meK0KliYXq1Si8AkmLq/3M+2v/dv1NnxS9vZ5D+Bg9rMJl4HgXZYZUd47zZYimbiVIAviiGWpyeaqejC+QMKEVoZrUb+g5iW0vCI1xLd/cFUKMjkaiaG5cZpX9FHjziFM5hiKRu3boUx4VKPbkd8UCL6qhPhQiS2ynQ4vfKs0c+qQYgVo3BJCcOMVIQxo61uXMwwrk4vHMQ7pRb3zePylyRtVZcr3ctzPCgMcCfqmGEb+84X3gbX25NvnXGRQPtZwI89tQ5Al4Oba9TkT6Y56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=as6s5hO3AJDOzJBWkCCgDpzZPYcwFCq5Zq3lZo67axk=;
 b=c73yc5XXy2WXuIZGJygdcVvrlGGj++fRjWpD76Woka66syMcf+EEyotkpFS4LpuwrX6LxLO00dwJgpS9qgZ43BB/i3yoJzs1OxMOQuKKeQDCUaJvnRC79PQaJPLMkgFo0rdZGOZ9aZy/kOzHfRJpzTbW4hXUQ3CBP7Q5A4KXCTQvvg4vXqDHj33Ss3Yl3X7LDqDyWy5PM104bDU8MqcKOuFwBr/NRKh+q20i4otzLawoymV0o3psgQDkWyN4D3hxrjWHfktbklbRupmuL9nRD5HdzE5fg1PCV07V5UO2Yhxj3Ha7aDSEk/vbJos1uW8VJ7lDTUfykqZVi4wAPQCk4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=as6s5hO3AJDOzJBWkCCgDpzZPYcwFCq5Zq3lZo67axk=;
 b=EYHr953XtZMhwdlx6lU7EpsOtTLASw3M/ejUxjdM9M20IDWpPmCKzQCDFJHWZOzeTYxNKoSazEgxSUUAFQuehccb6a16XuJHMURJeYI7UmA11aO0ImcgWGQI/+zKIVOQDWlK7mzaTKBS532MB+ReNVIPs/CGDcy/1HAHaJs+D5Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:28:58 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:28:58 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 05/20] multi-process: setup PCI host bridge for remote
 device
Date: Tue, 19 Jan 2021 15:28:22 -0500
Message-Id: <0da166349ebd79f7ecf0d1c6b42caaa7a90d6113.1611081587.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611081587.git.jag.raman@oracle.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [209.17.40.38]
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.38) by
 DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:28:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ae73e6a-b68a-4f12-950e-08d8bcb8d96b
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3349D1E01FE8FEA014EBBCC490A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3sViHgNwnSEGbqjNXKGxHxl9/3hWPo0T8B7i+ztwvVCBLvdWVq1CqgkZkaRBboHOMhT79rODVYm54rtMM9G75q7g5FOcFWPUN9cRBFYDNGj7/k6erCXalkloTR5Zms7ZOOHJgNtOMP/Q1o0nTFUydUNbkcyB3SUsax+sswcqVNIJhWfiWs0qlwXRU3YRUTV1TvDOLbGI0gdMkXs0G7BnN4GrKt0CKgYDA3hkHbtql1somnoluCNltSFYk/OpGLRgIihBPqnqDujBWGFyR4XciWROrFDdeVAYieTLmulB9jd6aDyjRRJhS3KPGTFhnoeFZKsewq1MTwlMNjBvCTRMlZA74J06DKB4MEfnHqqwe3c5lzvLZ+GxjamuPaQE9K/O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUhPbkRsbHFWd1ZsaGlaazhmdVZkajd3Njd4RjdLU2hiUjZWQ1MzNkFPRkpx?=
 =?utf-8?B?ZEJxZW9kWkszaVhnZlFGbWxRWFBHZlFucEM5Tkp6MGNnNXhaL2Z2aHRvcjZO?=
 =?utf-8?B?Q0FNN2Q3YW9NQndNOUkzWjhNQ2M2bGNia01DR09jcjJWQ3lqdzE3UWhyOTFt?=
 =?utf-8?B?UFljQVh3WlpTNXhwTDM3SjNJYjdJOE1zYU1vWkp2dyttbUhKamtEUjMyTjg0?=
 =?utf-8?B?ZjVkQVBhMWdQRWJUOG5mRm9ZNTBLOHpLQUU3dVljMC9hamFPOVhhYmY0a0lx?=
 =?utf-8?B?aUd2cytHRk5Rc3VKTytyOWtyZUJTMzZ6Mkwvc0YrY3RHQ2xHSG1tUTVSV2Jt?=
 =?utf-8?B?YTJ0QUZsaUVLQU90Slk5K2pLSUJCRG5WNFRFTitwZlFUNnRvS2p4bFdOWll1?=
 =?utf-8?B?VjM2clloc1dETTJjaytqUTVhc0ZUSmhTdW1ybEtPWVlrVUZTZkdoKzU1eHNy?=
 =?utf-8?B?cUtLbnhkUWVKRkZvRVNvSmJjeVEwaGpqT0wyS3hobFFwZ0hlYTcxcUZ4dkhi?=
 =?utf-8?B?MjA1dm5YM2xUQzVIVmFPMUZBSlhRMEZLMkwrZmFVUGlLT3pldTIzbUFabmRv?=
 =?utf-8?B?K3lIT21JTkROQ3p3ekl3b1Vhbjl4Z3hzblNLSHgvRVNVSy9WVjdRb1dxOEhz?=
 =?utf-8?B?RkdyUkRQeVA2b0RiMHpEQWxiYmk5SngrVTJoenQ5cXlNVDlpWC9GMVA5MUVY?=
 =?utf-8?B?MG00eVk3MVlyL005aGxDUDdyZTJsaDNiOG96MmJyR2c3ajJZdUE3TnRtdTJB?=
 =?utf-8?B?bzdZam9HdFVvcjdERFEwL25yVjhxL0FUcjZXc2RHczFQVkt5dUdYRjk4bUtk?=
 =?utf-8?B?TzlpSTB0UFdjczdMYnJnR09lQVppczUrdFF2anNpT1NFT2NLdmZGWjd2WmlD?=
 =?utf-8?B?UlpQVnkyVWJYSWdzMFJiYndad0hlMng0end0MzdZVlV3Qko0cWVGQ0JEcnZq?=
 =?utf-8?B?RnNyamRibC9iZTRTQUM3MzdlZW93SjRwdXdEQkhQaHVlb3hRb3A0Yy9TTzRh?=
 =?utf-8?B?YWorY0d6aGJyQnZsTHpPa0NLUnVOUlhjV2VmbEpob0xLL0VORTJjWjJSbk1Z?=
 =?utf-8?B?NmVvOUJ5STkyQWFmNEhqVnlvUU5BSEJtbmt0Nms4K0RRcUJuL0s3UlROSCtk?=
 =?utf-8?B?MHVhUk1TZGdwZWZBUzRzRzExZnRvZ3VTZlBYVWtJemtVZGJRNmJYMDJBSzk1?=
 =?utf-8?B?NTlJWWRBc1Q1SS9LYmVxcVZaUzhGRW51MEtPRnM1NUU1am5GSzkxUlUyYU1a?=
 =?utf-8?B?VldGM0hvcVdFQTgzaFZKS3FhUEQxRlIyeG1QeGdrTldOVkZFM2ttMG1xYlBG?=
 =?utf-8?Q?Sr123fm/32xP0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae73e6a-b68a-4f12-950e-08d8bcb8d96b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:28:58.2744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oitP9AbRBkIPgN0tm5w9YV7KJkDgKTAJp9YZbcmTbgncAisDYTIpSy9pd7xflmf28Ijao1/trVpVDTAyo3Cfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190113
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

PCI host bridge is setup for the remote device process. It is
implemented using remote-pcihost object. It is an extension of the PCI
host bridge setup by QEMU.
Remote-pcihost configures a PCI bus which could be used by the remote
PCI device to latch on to.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/pci-host/remote.h | 29 +++++++++++++++++
 hw/pci-host/remote.c         | 75 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |  2 ++
 hw/pci-host/Kconfig          |  3 ++
 hw/pci-host/meson.build      |  1 +
 hw/remote/Kconfig            |  1 +
 6 files changed, 111 insertions(+)
 create mode 100644 include/hw/pci-host/remote.h
 create mode 100644 hw/pci-host/remote.c

diff --git a/include/hw/pci-host/remote.h b/include/hw/pci-host/remote.h
new file mode 100644
index 0000000..06b8a83
--- /dev/null
+++ b/include/hw/pci-host/remote.h
@@ -0,0 +1,29 @@
+/*
+ * PCI Host for remote device
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_PCIHOST_H
+#define REMOTE_PCIHOST_H
+
+#include "exec/memory.h"
+#include "hw/pci/pcie_host.h"
+
+#define TYPE_REMOTE_PCIHOST "remote-pcihost"
+OBJECT_DECLARE_SIMPLE_TYPE(RemotePCIHost, REMOTE_PCIHOST)
+
+struct RemotePCIHost {
+    /*< private >*/
+    PCIExpressHost parent_obj;
+    /*< public >*/
+
+    MemoryRegion *mr_pci_mem;
+    MemoryRegion *mr_sys_io;
+};
+
+#endif
diff --git a/hw/pci-host/remote.c b/hw/pci-host/remote.c
new file mode 100644
index 0000000..eee4544
--- /dev/null
+++ b/hw/pci-host/remote.c
@@ -0,0 +1,75 @@
+/*
+ * Remote PCI host device
+ *
+ * Unlike PCI host devices that model physical hardware, the purpose
+ * of this PCI host is to host multi-process QEMU devices.
+ *
+ * Multi-process QEMU extends the PCI host of a QEMU machine into a
+ * remote process. Any PCI device attached to the remote process is
+ * visible in the QEMU guest. This allows existing QEMU device models
+ * to be reused in the remote process.
+ *
+ * This PCI host is purely a container for PCI devices. It's fake in the
+ * sense that the guest never sees this PCI host and has no way of
+ * accessing it. Its job is just to provide the environment that QEMU
+ * PCI device models need when running in a remote process.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_host.h"
+#include "hw/pci/pcie_host.h"
+#include "hw/qdev-properties.h"
+#include "hw/pci-host/remote.h"
+#include "exec/memory.h"
+
+static const char *remote_pcihost_root_bus_path(PCIHostState *host_bridge,
+                                                PCIBus *rootbus)
+{
+    return "0000:00";
+}
+
+static void remote_pcihost_realize(DeviceState *dev, Error **errp)
+{
+    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
+    RemotePCIHost *s = REMOTE_PCIHOST(dev);
+
+    pci->bus = pci_root_bus_new(DEVICE(s), "remote-pci",
+                                s->mr_pci_mem, s->mr_sys_io,
+                                0, TYPE_PCIE_BUS);
+}
+
+static void remote_pcihost_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
+
+    hc->root_bus_path = remote_pcihost_root_bus_path;
+    dc->realize = remote_pcihost_realize;
+
+    dc->user_creatable = false;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->fw_name = "pci";
+}
+
+static const TypeInfo remote_pcihost_info = {
+    .name = TYPE_REMOTE_PCIHOST,
+    .parent = TYPE_PCIE_HOST_BRIDGE,
+    .instance_size = sizeof(RemotePCIHost),
+    .class_init = remote_pcihost_class_init,
+};
+
+static void remote_pcihost_register(void)
+{
+    type_register_static(&remote_pcihost_info);
+}
+
+type_init(remote_pcihost_register)
diff --git a/MAINTAINERS b/MAINTAINERS
index 654358b..db50cbf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3189,6 +3189,8 @@ M: John G Johnson <john.g.johnson@oracle.com>
 S: Maintained
 F: docs/devel/multi-process.rst
 F: docs/multi-process.rst
+F: hw/pci-host/remote.c
+F: include/hw/pci-host/remote.h
 
 Build and test automation
 -------------------------
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index eb03f04..8b8c763 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -65,3 +65,6 @@ config PCI_POWERNV
     select PCI_EXPRESS
     select MSI_NONBROKEN
     select PCIE_PORT
+
+config REMOTE_PCIHOST
+    bool
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index da9d1a9..1847c69 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -9,6 +9,7 @@ pci_ss.add(when: 'CONFIG_PCI_EXPRESS_XILINX', if_true: files('xilinx-pcie.c'))
 pci_ss.add(when: 'CONFIG_PCI_I440FX', if_true: files('i440fx.c'))
 pci_ss.add(when: 'CONFIG_PCI_SABRE', if_true: files('sabre.c'))
 pci_ss.add(when: 'CONFIG_XEN_IGD_PASSTHROUGH', if_true: files('xen_igd_pt.c'))
+pci_ss.add(when: 'CONFIG_REMOTE_PCIHOST', if_true: files('remote.c'))
 
 # PPC devices
 pci_ss.add(when: 'CONFIG_PREP_PCI', if_true: files('prep.c'))
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
index 5484446..504fd6a 100644
--- a/hw/remote/Kconfig
+++ b/hw/remote/Kconfig
@@ -1,3 +1,4 @@
 config MULTIPROCESS
     bool
     depends on PCI && KVM
+    select REMOTE_PCIHOST
-- 
1.8.3.1


