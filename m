Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64B82FC145
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:41:12 +0100 (CET)
Received: from localhost ([::1]:40078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xoN-0005DQ-Kr
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xf8-0003Zy-Vd
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:39 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:60726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xf2-0000eG-0B
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:37 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKOU4Y003527;
 Tue, 19 Jan 2021 20:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=aq4qgM/9ZUvfZcUCOWu4yZOFwO9YwtwroNXUeqyYPFM=;
 b=QadsxWVI8H1JUN5QwhMbEwEK4cyTUsImNmXe+UC2ZBiX51Cv/rOAZatGnrWDdJliz+xW
 FuTU6XaaMPK0RAgIi7VpQ0+5b0BN/HBDC0e3fHKwUxSximKzieUYC6IG6cKMx+DCf5lm
 4Luc/vJkqXUvgDAy1z0cGXI21L5A6B/OeA/S/86zPKcnz//KsCL0sCYYqYUGQWMqUe19
 Y4Z3ZOyr2xiZDMk/4PV3EgI5uYEBJxs7a3rSzGkZXT9LqUvOrFUU2YLObI9mN/7D6lM/
 i1Dhshjnpbw8Wzy/CA8us/o83byZgDBwbeTph5YVFHscr0FJuG0xeZ/OhG0Eo0oClbXw Bg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 363xyhtb3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:31:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKQcIu117505;
 Tue, 19 Jan 2021 20:29:24 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2056.outbound.protection.outlook.com [104.47.36.56])
 by aserp3030.oracle.com with ESMTP id 3649qpu97n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glb/gM4Lq4ODyOJroAnZrG/kqCtxGU+gV6ora60FPGR2HV9aiAn4cUlGTBporL6WKikqGxpsVkQcbLdWJi3QCCRJt4T0MJlbuF2FlvRlekSr0ljK7m0BNuuOQcTL8ySjB03kBUTVSFmiEg6o3wUHYlYSiVSvuu9dp2z9ySTeTXMghxJtg3WxGupHcMmgXoqYU0vqyt9yc6pryG9OI3EpqGhuNj0dS9ApWiLedNXTxIPPyACJ6p7ATo5qMaaxvq/dRh0t+btQFkXCH+DkKNpzUuMXtfhCj0EJK/zaK4X8ghzoNXDQrO/0XDpzw6hRdnKot6rQfI34Di5413a+A40z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq4qgM/9ZUvfZcUCOWu4yZOFwO9YwtwroNXUeqyYPFM=;
 b=SpNjVl/iNsjZrMwC1wIzkMFzw3lk4lSw2f7FsLoT1gU1s4budf4EeKXBQj6DXhPgAnpzFBQF+dhWyPdivTVtCMWsEkAUcP2EKjdAXVd83a4O07Mpm6Ig32lmLzTGS9KAySMP4Qc2lUQF+hxe4D2GwhdNMoPnpIevLvQ/FK1EdtmZm+HD2WFGwE3ZYqOylH89Afq18D8Kg4/xFhOkLGmvr2sjZhUXr6urPyiXH/S27j7UmoHA0egr/B9vHtYXJJQl8xJA5KtyMdk63pT0qaaoG4WrLLaw6FM42FEVUVJ//o5Ar+PXIRBZL0lbnJcugUZvVDXaPc32Yb6q/Tt575l6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq4qgM/9ZUvfZcUCOWu4yZOFwO9YwtwroNXUeqyYPFM=;
 b=Dp+NOBs3EhJkbrEqjYDONeuSZ7SupU79sDQlfc2CUsjfbZ6dlApX/f0s00Bngi/0p+JLOcrI3RY7yvRUcD9tVtykGXG41A8wWTgxyVq2fA6y8ART781h4vgG9KvSTNQMaI5Vyl3pUT5VEr3yw1Dkag2T7zC1q5Ic4ZimIfLAuAE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3351.namprd10.prod.outlook.com (2603:10b6:a03:14d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:22 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:22 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 13/20] multi-process: introduce proxy object
Date: Tue, 19 Jan 2021 15:28:30 -0500
Message-Id: <c37c1197969c14624c4c7068e7e3677bc70ade48.1611081587.git.jag.raman@oracle.com>
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
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a6b421c-811f-41fd-cc1e-08d8bcb8e7af
X-MS-TrafficTypeDiagnostic: BYAPR10MB3351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB33515861734B2D2599CC035290A30@BYAPR10MB3351.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nGp1aZknmH9hliLna8Uc4d9zQNArETudgghyzVE15yKJVUjqu9NcU2HmWjHLNGdlXjRXsb8uGr4iXgpfLKQOnkQbk3yEGLlG+N8upD6rTUMNVruuncuRhyS/o8V46i4FijUVecK9uhlEiY0Z6VI4pinQ+eQ9c92PrTczb/z2DaDbC1u2Bhw2CM5ZPclMOnQW+kJPMTRS8JGY+4v/ccNrellJUnTMe8Dnz//L7AWg+ut8C6l0yfk4vTOOvL0LldrL5D8tY9aWFwoQOZQxb2RLsxYhlfANtbCI7Gpi0pCZTUtXLPcm+Wl/O+qeSYUdRr6aF/MnQ2h6G9SyCr5wWE0XztNZLggEhCr8SL6ORd8STlx1Yb/Ez2/AazKbavwRuFex+2RqvF8WEThru1lEwYlrBGxjEXFbnC3ATY1uQu9DBZCkoMU1QK7I1y0xWx4IqmrhROhRqr64yFkRA+jiv3rp51UjutI3XyuJUP9o0vi9kNUJNrnjb6POD43F9nDSREDTNNcjVOXNiXliyvLcp84bcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(86362001)(2906002)(6666004)(6916009)(36756003)(4326008)(8676002)(52116002)(66476007)(66556008)(316002)(8936002)(66946007)(6486002)(107886003)(956004)(5660300002)(478600001)(7696005)(16526019)(26005)(186003)(7416002)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlQyd1JBS2dkSE96MGg4Q1VQRlRVUG5JbGtRY29zME4yNFYwVUtiVXdKeHli?=
 =?utf-8?B?aHdDU0oxcnFSaDRQQTIycmFvS1RUV0RHTlhHblozVDM3NWY3M0pXOUs3d1ph?=
 =?utf-8?B?eVcwR3JTblhicFA5WkZHdXlzdkR5NHBCVnV0Sk1TNjZLUkpjOVE3ekZIcERB?=
 =?utf-8?B?S1FvUVdmblNPNDhXU2Qvc2xpcVp4TXVkY3J4RjZVb014SldZVVhUdzlwYVE1?=
 =?utf-8?B?QVl4Y0M1TWF4TmtvZzdhMk5aSUQrUU9lOVREZG53eGhPOUZBY0hFbGhWb08w?=
 =?utf-8?B?ZnNPQ3lnaGRZRE52Z2xWMGl4V1pia2hMdEhkYTZCcFFCU0gxdzY1OTZVYTNw?=
 =?utf-8?B?aHQ5VmcreVJXYXkyQUFlVTIwVmJUY0lGOXp1R3Q2aUZsNisyVUh2cWg3eTJq?=
 =?utf-8?B?NmU4Qmdwa1gxWGRSTDNEZEVJczIyWStGbzYvaHYxUzcvMnFvcW1lbSs0cml1?=
 =?utf-8?B?aE00ekpSalJMTnpUVWtHSXNZR0NidkhkTkNoUlJIeGhaeWdYQ3RXQ3hYSG9K?=
 =?utf-8?B?a0Y0bFRHc2g5V0c5VTFUUks4SWNBYjhibGdSM0lDNXdZWUVsNDhRSlpZSFpH?=
 =?utf-8?B?dlBWMmlFS3d2QUpiN1RDZ1RzTEtrNktuclZ0d29wRWlDbVY3b1hyOVRRbU5p?=
 =?utf-8?B?RXczdkRnanBkYTFYbE1lcUxHNmRmM2R6TW5PVVhBVVRTRkFZaDVPUEhMRytZ?=
 =?utf-8?B?T3dWbUNlak1zY0JSRy9lWVZUZGRFU2c2MVVXdCt5cGZNcXYwWHcyQjFTWjli?=
 =?utf-8?B?V3ZyUFMyNFd4QXE3cW5HQUphZ084OGlpbTBBcmIxdmVNbzVGT0tIVkpuSVgv?=
 =?utf-8?B?RHlSMjBDQzdoTk9ZWWdGSWpBZG9RcmZEM05VTVRxcHRyTE0rdXovK29BWDRX?=
 =?utf-8?B?VmZ3b2V0akpHNHN6Tkp3TDhXaHlYM0kvN0l1cXE2UVZjWDVVcTlvVzJ0ZUtU?=
 =?utf-8?B?bVBoZS91Mk5WcEZqamtWZ3R4MGtJbWFBcWhVQUI0RGRUYVA4L242QXcxUFVE?=
 =?utf-8?B?SlJ0Y0NYVWpxK2RkbkhOUWkyM1FWb2NtbjZOaUtqZ1d5ZFVFdVRiQ2JVMTJB?=
 =?utf-8?B?djVUUVpxK2hrK011bktLZVlkUlgrUSt5a3h0VW1qOUVka1B5TS96TUUrOGVM?=
 =?utf-8?B?MHp0Vm9XenhKOVFCcGxDeGl0VUJWRDVxWHVwUXdUOGNualR2M1ltczJRdDBh?=
 =?utf-8?B?Y1lKSzN4TElsQzlGYmcwZEdlMGdsREFING1abWpBVDRPS2R6ODdaV0JVNzZX?=
 =?utf-8?B?Zm9MQWJnUlJGdDVML1RSNEdTUXkreGh3YWxlRTFvdHZLLzJ3QjNmV2xZOG95?=
 =?utf-8?Q?jSAJUfJ3txoyc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6b421c-811f-41fd-cc1e-08d8bcb8e7af
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:22.1976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3JfOy0i96sDNL6j/MVSW2lHZ7bWcnXehrqGJJy2N3jSqMgSAuEfw6xFEVd4wJjNkEpbGx8uOTTXif5gjbEaGg==
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

Defines a PCI Device proxy object as a child of TYPE_PCI_DEVICE.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/proxy.h | 33 ++++++++++++++++
 hw/remote/proxy.c         | 99 +++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |  2 +
 hw/remote/meson.build     |  1 +
 4 files changed, 135 insertions(+)
 create mode 100644 include/hw/remote/proxy.h
 create mode 100644 hw/remote/proxy.c

diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
new file mode 100644
index 0000000..faa9c4d
--- /dev/null
+++ b/include/hw/remote/proxy.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef PROXY_H
+#define PROXY_H
+
+#include "hw/pci/pci.h"
+#include "io/channel.h"
+
+#define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
+OBJECT_DECLARE_SIMPLE_TYPE(PCIProxyDev, PCI_PROXY_DEV)
+
+struct PCIProxyDev {
+    PCIDevice parent_dev;
+    char *fd;
+
+    /*
+     * Mutex used to protect the QIOChannel fd from
+     * the concurrent access by the VCPUs since proxy
+     * blocks while awaiting for the replies from the
+     * process remote.
+     */
+    QemuMutex io_mutex;
+    QIOChannel *ioc;
+    Error *migration_blocker;
+};
+
+#endif /* PROXY_H */
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
new file mode 100644
index 0000000..cd5b071
--- /dev/null
+++ b/hw/remote/proxy.c
@@ -0,0 +1,99 @@
+/*
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
+#include "hw/remote/proxy.h"
+#include "hw/pci/pci.h"
+#include "qapi/error.h"
+#include "io/channel-util.h"
+#include "hw/qdev-properties.h"
+#include "monitor/monitor.h"
+#include "migration/blocker.h"
+#include "qemu/sockets.h"
+
+static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
+{
+    ERRP_GUARD();
+    PCIProxyDev *dev = PCI_PROXY_DEV(device);
+    int fd;
+
+    if (!dev->fd) {
+        error_setg(errp, "fd parameter not specified for %s",
+                   DEVICE(device)->id);
+        return;
+    }
+
+    fd = monitor_fd_param(monitor_cur(), dev->fd, errp);
+    if (fd == -1) {
+        error_prepend(errp, "proxy: unable to parse fd %s: ", dev->fd);
+        return;
+    }
+
+    if (!fd_is_socket(fd)) {
+        error_setg(errp, "proxy: fd %d is not a socket", fd);
+        close(fd);
+        return;
+    }
+
+    dev->ioc = qio_channel_new_fd(fd, errp);
+
+    error_setg(&dev->migration_blocker, "%s does not support migration",
+               TYPE_PCI_PROXY_DEV);
+    migrate_add_blocker(dev->migration_blocker, errp);
+
+    qemu_mutex_init(&dev->io_mutex);
+    qio_channel_set_blocking(dev->ioc, true, NULL);
+}
+
+static void pci_proxy_dev_exit(PCIDevice *pdev)
+{
+    PCIProxyDev *dev = PCI_PROXY_DEV(pdev);
+
+    if (dev->ioc) {
+        qio_channel_close(dev->ioc, NULL);
+    }
+
+    migrate_del_blocker(dev->migration_blocker);
+
+    error_free(dev->migration_blocker);
+}
+
+static Property proxy_properties[] = {
+    DEFINE_PROP_STRING("fd", PCIProxyDev, fd),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = pci_proxy_dev_realize;
+    k->exit = pci_proxy_dev_exit;
+    device_class_set_props(dc, proxy_properties);
+}
+
+static const TypeInfo pci_proxy_dev_type_info = {
+    .name          = TYPE_PCI_PROXY_DEV,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PCIProxyDev),
+    .class_init    = pci_proxy_dev_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void pci_proxy_dev_register_types(void)
+{
+    type_register_static(&pci_proxy_dev_type_info);
+}
+
+type_init(pci_proxy_dev_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 27216b3..ee04d82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3199,6 +3199,8 @@ F: hw/remote/message.c
 F: hw/remote/remote-obj.c
 F: include/hw/remote/memory.h
 F: hw/remote/memory.c
+F: hw/remote/proxy.c
+F: include/hw/remote/proxy.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 64da16c..569cd20 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -4,6 +4,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 
-- 
1.8.3.1


