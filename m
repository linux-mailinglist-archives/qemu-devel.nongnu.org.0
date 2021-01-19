Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191FD2FC206
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:14:35 +0100 (CET)
Received: from localhost ([::1]:59412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yKg-0005FC-6f
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xdO-0001uc-Jo
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:51 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:58390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xdH-0000MC-QP
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:50 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKNU3F002768;
 Tue, 19 Jan 2021 20:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=CtNthRMi/yWg7bExLKMplw2bOO/xThH7uzCl9jlatto=;
 b=VUuYmkxpKtjFkfoa1V3SpcrBiK63s/QvP5fjWopq2L7Cq3PHAmN11ymMcc67oTwfyYm1
 u0H8FWptjh5/pyIn7YuR2WG6eK1XncwxCU4l9PTedSIYD7aCL6JhVQ0U2yNxWQWZ6GhP
 7JvTZza3cPql6G0OW7/q/asBDeiAxYy1zAhROkm/E64qiFbU48ZBfzlJ8mEBH0eNjONa
 kVE85/mWdED3nb1EdI5plG7YVxxFF0CgFA5fZqwuOJgb9StI8EQjzZ/MxtN5LrExbNAi
 7wgQT4O1vXm63aoluaEdQOTX8Tp1Q6Rhv1gfOgo4JsJmKH8XeqqHokfP6q/2kWUcDIN6 3Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 363xyhtaut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPd65128344;
 Tue, 19 Jan 2021 20:29:37 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2051.outbound.protection.outlook.com [104.47.37.51])
 by userp3030.oracle.com with ESMTP id 3661njtax2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAlu0wIM3SasIX+gkE7TPxDk2CZMWph7J9eIBi6eTuaw8mgY7NVMJPI53DHzDF/i0a3Y4m0kTqcxSA+g3wV3OG7WdAy6TvQxCeabo42+BsFmJBcJEAnsm4V3821jXITidq42URBpWesM0yFW8pVL1Otko3yaI4Ya5koWIlA1J/gUN/6Dlhkt8fcpRhSWWiObwzWS1jHFNS+5j56S3f10L0kbAN9JJb1I3Ahyug8G8t0Bgdq9cJIOuyLr7UCdSMyRr2DXQEV0oXFuAYaCtbWXjO2sIEJdlCp2UMH0Tdxh60c4fE3V1AAvsh1BPkLikml3wqVG1nH++9OGzpxPLfY/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtNthRMi/yWg7bExLKMplw2bOO/xThH7uzCl9jlatto=;
 b=kptZA0RZFakOOjZ1LevtSGzRiM00Qx6aOr4l5H3BQIzN/Gjc+K1baAYekQ0kCDNlW2ScT1a01RKWtN4WeLM64fbmjKoEmXwZJQNA8tviXHZMLB31qJ+coD8ZG7EtQ1Ph9f9UdILU++GHYgTa0hBs2MbAJetd8a8z11bYauTjtMPq7ERKIHp7YXUBFhdx+gqb24UsSoy10v3oJVteLclN2Mg2s7ytAQrg3Vj9We9X8mjVCQbFM2S2QkBfsjNLc6wuFYbLJYw+S4Tx6Iv2odrahH/4BN5cFgXDL2WXxHPtXDNBh0eC55vON/XyGxhnmX70VzmT/8yCxr7TugVaDfxDuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtNthRMi/yWg7bExLKMplw2bOO/xThH7uzCl9jlatto=;
 b=FfwmmneexVf/Vhhelvp4HlcTVNqP+kImKy0s0pA7zSm+3589z3hJqfDKbhfdQ0EactTMDaRnTbd3e11fJfPkMER2KJzwCJDVWyPWvJRzFuQ2N71w8whKIRLrXfNZZLRCf+PWoxi/BFUpNoK7HdIfRhJSgw8o9N+CjhH+oEcnXiE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:34 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:34 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 17/20] multi-process: Synchronize remote memory
Date: Tue, 19 Jan 2021 15:28:34 -0500
Message-Id: <405327dc36bf3aa6e7234a9996be1598801bc0a5.1611081587.git.jag.raman@oracle.com>
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
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7625addf-4fbf-49fc-4c6c-08d8bcb8ef1f
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3349462A7673FBD97550555F90A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6QyUNllI6cgzyv7UQFhLi1oPvbPRHQkbyiBa1z6u80mS+KQHlJ8x8ftZDU/DN5lv7FSr3bqYuV+sZAyoOp4nwOvbBgogIAKf4EFmzBe9vhSe0E23ex1T4bQwSTizmdeIEXgpf8otWYkBDlyIWEs70noiL3gFpsfgVB8JZHeISH8HGS16qoTkX8IuRD5bT3X/VLnGqg8oFoLXXtq/5grYNSE6vCabEwFB2lru00rSjXk7yJHfqKlhhMFpBTDHi7VpPr3omKExhCWJL3ZwjEOt91mdoHrOmGTGBpsHeKZgm2yFgy3gmhFWxsG3ZVzqMzJraB/YnQWemLEnqg+R8cGR60MpDA6zqk1dOpn14st8/wrK6Oc47rywheGQgiCj4u19
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(30864003)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OXo5Sko0TGQ1b094U0Z1eXhXMjNFeVRVTER1ejVTZGJ2ZHBIb1ZDbGcwdzBk?=
 =?utf-8?B?WENEdVJvaU0xVU1lVTJVNnhiNjNGVzkxcTBLc3B6WVFWZk9UblVtMS9HM3Uw?=
 =?utf-8?B?bEQzaHd3SlNOSk52RUtSZzFTRGt5S1NwdVdWd1A5Z3ppNVlCT0dadkNNVkNJ?=
 =?utf-8?B?Q1FFaHY5WTV6L240VUN2dmxnZkVsRzZ1RjllMFRzOHg4MEZLdWQxR1VCdHNi?=
 =?utf-8?B?RkhZbElnbDUyb3hBQlRqZkwyVXlWamdhcUQxVHpVbm5zR1BhZm1QWHU5Znl1?=
 =?utf-8?B?ZUgxQWlrTDFBSmViWTBvR1Z0VmlpNUQzSi9ZeXZQUFI2TkI4eU5BM1d2aEty?=
 =?utf-8?B?V0tYN0U2aVFUN3F6QkgxRTBScjFkSGJZTFZRanNiaExoYkRiT3ZJKzhjeXpF?=
 =?utf-8?B?NHdBVXUrbEVoNE5VU3dhdFNIand1WXFWQVNIQUdxVGdSVEZJR1gvWWJGOVNJ?=
 =?utf-8?B?b0Z3YXRZRzJab2RCSWIzbFVKYk4yVkJveHZTVWllbE8rYXNXUHVMNHhhU1JY?=
 =?utf-8?B?aUZJVTBtL2N4QnEzcnV6YzJEUVovK0Y5N0JxSkhjRFgrMmduNUhUek9PTjdt?=
 =?utf-8?B?b0d3bzdqL0FuK0xta00rVEhmNU1VNkpDSmFYTDJmMUtmbkEzRG1JdHNaNHFE?=
 =?utf-8?B?N3l1NzUxc01HSVo3K0VaekQ5Ym9aNjlody9FR1kxT2sxcVhseG5aTllyT1Fx?=
 =?utf-8?B?SlBQT2JRaGZVZ3F2RC95bUJnbzNFaktzbXM3MHUzVTN3dGNYTUdZeFNIa2VC?=
 =?utf-8?B?WXQvUE9UUDFaOWwvOEhseUwzQUtxdE1HaXI1K1h5OFRDb1FzYWNlMzVmMWdK?=
 =?utf-8?B?N3lOc01CaEwvQXhMK3NVak9FYjM2WlZiZVpERzg5SE1hQVRmd1RQVFZDQzZr?=
 =?utf-8?B?QTdraE5Fb0tLU3ppa1Q1eUxmK3pNYUNNRytrUGRXeWRZUlRWbUZKT1lHSW1T?=
 =?utf-8?B?OUFSTGZxTnBYZmE1UnZGdHBIRTMzdVpOcy81OXZPMDVOZGVMdDYzTGJuZzlY?=
 =?utf-8?B?elJJaWc1NW44dklmaWhDR1YyRlVPOGt6bnNJQkR5SmNzYWw2N0FzNWlpbUM2?=
 =?utf-8?B?b1U3aFliYXFiQzV0RjNSTjdXM2Z2SlBtNnZ6YnEyS0NUZ0t2ekxQSmRsdjhS?=
 =?utf-8?B?cXJsN1FLdVhmMU93L1RrYjRrc1hTM3BpaGNhcDdUTjlxVERQaDdDOUZ0OWV1?=
 =?utf-8?B?c2R5RmNvRU56M3ZpTmF2UjhvblA4MUhoM2lIOEhpakxQcmJ1cTUvUlJoWTcw?=
 =?utf-8?B?SEZnZERKeGthSUdWaGtzZXMwSHk0OEdMZ3FJRkRIMXFxMVNub1FORTZhclhv?=
 =?utf-8?Q?Ue8PJ1iky+5HE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7625addf-4fbf-49fc-4c6c-08d8bcb8ef1f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:34.6404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AcpTR/2Hn0Pvc+xTEiEr5qc+fpHrtTUDJjmbg62YTjE7ZMAFoX2JuGHRG+FkpEPprchTVDrHyw/A16y3lHVhQ==
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

Add ProxyMemoryListener object which is used to keep the view of the RAM
in sync between QEMU and remote process.
A MemoryListener is registered for system-memory AddressSpace. The
listener sends SYNC_SYSMEM message to the remote process when memory
listener commits the changes to memory, the remote process receives
the message and processes it in the handler for SYNC_SYSMEM message.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/proxy-memory-listener.h |  28 ++++
 include/hw/remote/proxy.h                 |   2 +
 hw/remote/message.c                       |   4 +
 hw/remote/proxy-memory-listener.c         | 227 ++++++++++++++++++++++++++++++
 hw/remote/proxy.c                         |   6 +
 MAINTAINERS                               |   2 +
 hw/remote/meson.build                     |   1 +
 7 files changed, 270 insertions(+)
 create mode 100644 include/hw/remote/proxy-memory-listener.h
 create mode 100644 hw/remote/proxy-memory-listener.c

diff --git a/include/hw/remote/proxy-memory-listener.h b/include/hw/remote/proxy-memory-listener.h
new file mode 100644
index 0000000..c4f3efb
--- /dev/null
+++ b/include/hw/remote/proxy-memory-listener.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef PROXY_MEMORY_LISTENER_H
+#define PROXY_MEMORY_LISTENER_H
+
+#include "exec/memory.h"
+#include "io/channel.h"
+
+typedef struct ProxyMemoryListener {
+    MemoryListener listener;
+
+    int n_mr_sections;
+    MemoryRegionSection *mr_sections;
+
+    QIOChannel *ioc;
+} ProxyMemoryListener;
+
+void proxy_memory_listener_configure(ProxyMemoryListener *proxy_listener,
+                                     QIOChannel *ioc);
+void proxy_memory_listener_deconfigure(ProxyMemoryListener *proxy_listener);
+
+#endif
diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
index ea7fa4f..12888b4 100644
--- a/include/hw/remote/proxy.h
+++ b/include/hw/remote/proxy.h
@@ -11,6 +11,7 @@
 
 #include "hw/pci/pci.h"
 #include "io/channel.h"
+#include "hw/remote/proxy-memory-listener.h"
 
 #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIProxyDev, PCI_PROXY_DEV)
@@ -36,6 +37,7 @@ struct PCIProxyDev {
     QemuMutex io_mutex;
     QIOChannel *ioc;
     Error *migration_blocker;
+    ProxyMemoryListener proxy_listener;
     ProxyMemoryRegion region[PCI_NUM_REGIONS];
 };
 
diff --git a/hw/remote/message.c b/hw/remote/message.c
index f2e8445..25341d8 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -17,6 +17,7 @@
 #include "sysemu/runstate.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
+#include "hw/remote/memory.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp);
@@ -61,6 +62,9 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_BAR_READ:
             process_bar_read(com->ioc, &msg, &local_err);
             break;
+        case MPQEMU_CMD_SYNC_SYSMEM:
+            remote_sysmem_reconfig(&msg, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
new file mode 100644
index 0000000..af1fa6f
--- /dev/null
+++ b/hw/remote/proxy-memory-listener.c
@@ -0,0 +1,227 @@
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
+#include "qemu/compiler.h"
+#include "qemu/int128.h"
+#include "qemu/range.h"
+#include "exec/memory.h"
+#include "exec/cpu-common.h"
+#include "cpu.h"
+#include "exec/ram_addr.h"
+#include "exec/address-spaces.h"
+#include "qapi/error.h"
+#include "hw/remote/mpqemu-link.h"
+#include "hw/remote/proxy-memory-listener.h"
+
+/*
+ * TODO: get_fd_from_hostaddr(), proxy_mrs_can_merge() and
+ * proxy_memory_listener_commit() defined below perform tasks similar to the
+ * functions defined in vhost-user.c. These functions are good candidates
+ * for refactoring.
+ *
+ */
+
+static void proxy_memory_listener_reset(MemoryListener *listener)
+{
+    ProxyMemoryListener *proxy_listener = container_of(listener,
+                                                       ProxyMemoryListener,
+                                                       listener);
+    int mrs;
+
+    for (mrs = 0; mrs < proxy_listener->n_mr_sections; mrs++) {
+        memory_region_unref(proxy_listener->mr_sections[mrs].mr);
+    }
+
+    g_free(proxy_listener->mr_sections);
+    proxy_listener->mr_sections = NULL;
+    proxy_listener->n_mr_sections = 0;
+}
+
+static int get_fd_from_hostaddr(uint64_t host, ram_addr_t *offset)
+{
+    MemoryRegion *mr;
+    ram_addr_t off;
+
+    /**
+     * Assumes that the host address is a valid address as it's
+     * coming from the MemoryListener system. In the case host
+     * address is not valid, the following call would return
+     * the default subregion of "system_memory" region, and
+     * not NULL. So it's not possible to check for NULL here.
+     */
+    mr = memory_region_from_host((void *)(uintptr_t)host, &off);
+
+    if (offset) {
+        *offset = off;
+    }
+
+    return memory_region_get_fd(mr);
+}
+
+static bool proxy_mrs_can_merge(uint64_t host, uint64_t prev_host, size_t size)
+{
+    if (((prev_host + size) != host)) {
+        return false;
+    }
+
+    if (get_fd_from_hostaddr(host, NULL) !=
+            get_fd_from_hostaddr(prev_host, NULL)) {
+        return false;
+    }
+
+    return true;
+}
+
+static bool try_merge(ProxyMemoryListener *proxy_listener,
+                      MemoryRegionSection *section)
+{
+    uint64_t mrs_size, mrs_gpa, mrs_page;
+    MemoryRegionSection *prev_sec;
+    bool merged = false;
+    uintptr_t mrs_host;
+    RAMBlock *mrs_rb;
+
+    if (!proxy_listener->n_mr_sections) {
+        return false;
+    }
+
+    mrs_rb = section->mr->ram_block;
+    mrs_page = (uint64_t)qemu_ram_pagesize(mrs_rb);
+    mrs_size = int128_get64(section->size);
+    mrs_gpa = section->offset_within_address_space;
+    mrs_host = (uintptr_t)memory_region_get_ram_ptr(section->mr) +
+               section->offset_within_region;
+
+    if (get_fd_from_hostaddr(mrs_host, NULL) < 0) {
+        return true;
+    }
+
+    mrs_host = mrs_host & ~(mrs_page - 1);
+    mrs_gpa = mrs_gpa & ~(mrs_page - 1);
+    mrs_size = ROUND_UP(mrs_size, mrs_page);
+
+    prev_sec = proxy_listener->mr_sections +
+               (proxy_listener->n_mr_sections - 1);
+    uint64_t prev_gpa_start = prev_sec->offset_within_address_space;
+    uint64_t prev_size = int128_get64(prev_sec->size);
+    uint64_t prev_gpa_end   = range_get_last(prev_gpa_start, prev_size);
+    uint64_t prev_host_start =
+        (uintptr_t)memory_region_get_ram_ptr(prev_sec->mr) +
+        prev_sec->offset_within_region;
+    uint64_t prev_host_end = range_get_last(prev_host_start, prev_size);
+
+    if (mrs_gpa <= (prev_gpa_end + 1)) {
+        g_assert(mrs_gpa > prev_gpa_start);
+
+        if ((section->mr == prev_sec->mr) &&
+            proxy_mrs_can_merge(mrs_host, prev_host_start,
+                                (mrs_gpa - prev_gpa_start))) {
+            uint64_t max_end = MAX(prev_host_end, mrs_host + mrs_size);
+            merged = true;
+            prev_sec->offset_within_address_space =
+                MIN(prev_gpa_start, mrs_gpa);
+            prev_sec->offset_within_region =
+                MIN(prev_host_start, mrs_host) -
+                (uintptr_t)memory_region_get_ram_ptr(prev_sec->mr);
+            prev_sec->size = int128_make64(max_end - MIN(prev_host_start,
+                                                         mrs_host));
+        }
+    }
+
+    return merged;
+}
+
+static void proxy_memory_listener_region_addnop(MemoryListener *listener,
+                                                MemoryRegionSection *section)
+{
+    ProxyMemoryListener *proxy_listener = container_of(listener,
+                                                       ProxyMemoryListener,
+                                                       listener);
+
+    if (!memory_region_is_ram(section->mr) ||
+            memory_region_is_rom(section->mr)) {
+        return;
+    }
+
+    if (try_merge(proxy_listener, section)) {
+        return;
+    }
+
+    ++proxy_listener->n_mr_sections;
+    proxy_listener->mr_sections = g_renew(MemoryRegionSection,
+                                          proxy_listener->mr_sections,
+                                          proxy_listener->n_mr_sections);
+    proxy_listener->mr_sections[proxy_listener->n_mr_sections - 1] = *section;
+    proxy_listener->mr_sections[proxy_listener->n_mr_sections - 1].fv = NULL;
+    memory_region_ref(section->mr);
+}
+
+static void proxy_memory_listener_commit(MemoryListener *listener)
+{
+    ProxyMemoryListener *proxy_listener = container_of(listener,
+                                                       ProxyMemoryListener,
+                                                       listener);
+    MPQemuMsg msg;
+    MemoryRegionSection *section;
+    ram_addr_t offset;
+    uintptr_t host_addr;
+    int region;
+    Error *local_err = NULL;
+
+    memset(&msg, 0, sizeof(MPQemuMsg));
+
+    msg.cmd = MPQEMU_CMD_SYNC_SYSMEM;
+    msg.num_fds = proxy_listener->n_mr_sections;
+    msg.size = sizeof(SyncSysmemMsg);
+    if (msg.num_fds > REMOTE_MAX_FDS) {
+        error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
+        return;
+    }
+
+    for (region = 0; region < proxy_listener->n_mr_sections; region++) {
+        section = &proxy_listener->mr_sections[region];
+        msg.data.sync_sysmem.gpas[region] =
+            section->offset_within_address_space;
+        msg.data.sync_sysmem.sizes[region] = int128_get64(section->size);
+        host_addr = (uintptr_t)memory_region_get_ram_ptr(section->mr) +
+                    section->offset_within_region;
+        msg.fds[region] = get_fd_from_hostaddr(host_addr, &offset);
+        msg.data.sync_sysmem.offsets[region] = offset;
+    }
+    if (!mpqemu_msg_send(&msg, proxy_listener->ioc, &local_err)) {
+        error_report_err(local_err);
+    }
+}
+
+void proxy_memory_listener_deconfigure(ProxyMemoryListener *proxy_listener)
+{
+    memory_listener_unregister(&proxy_listener->listener);
+
+    proxy_memory_listener_reset(&proxy_listener->listener);
+}
+
+void proxy_memory_listener_configure(ProxyMemoryListener *proxy_listener,
+                                     QIOChannel *ioc)
+{
+    proxy_listener->n_mr_sections = 0;
+    proxy_listener->mr_sections = NULL;
+
+    proxy_listener->ioc = ioc;
+
+    proxy_listener->listener.begin = proxy_memory_listener_reset;
+    proxy_listener->listener.commit = proxy_memory_listener_commit;
+    proxy_listener->listener.region_add = proxy_memory_listener_region_addnop;
+    proxy_listener->listener.region_nop = proxy_memory_listener_region_addnop;
+    proxy_listener->listener.priority = 10;
+
+    memory_listener_register(&proxy_listener->listener,
+                             &address_space_memory);
+}
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 22eb422..472b2df 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -19,6 +19,8 @@
 #include "qemu/sockets.h"
 #include "hw/remote/mpqemu-link.h"
 #include "qemu/error-report.h"
+#include "hw/remote/proxy-memory-listener.h"
+#include "qom/object.h"
 
 static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 {
@@ -52,6 +54,8 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 
     qemu_mutex_init(&dev->io_mutex);
     qio_channel_set_blocking(dev->ioc, true, NULL);
+
+    proxy_memory_listener_configure(&dev->proxy_listener, dev->ioc);
 }
 
 static void pci_proxy_dev_exit(PCIDevice *pdev)
@@ -65,6 +69,8 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     migrate_del_blocker(dev->migration_blocker);
 
     error_free(dev->migration_blocker);
+
+    proxy_memory_listener_deconfigure(&dev->proxy_listener);
 }
 
 static void config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,
diff --git a/MAINTAINERS b/MAINTAINERS
index ee04d82..5e48a26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3201,6 +3201,8 @@ F: include/hw/remote/memory.h
 F: hw/remote/memory.c
 F: hw/remote/proxy.c
 F: include/hw/remote/proxy.h
+F: hw/remote/proxy-memory-listener.c
+F: include/hw/remote/proxy-memory-listener.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 569cd20..7f11be4 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,5 +7,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
+specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


