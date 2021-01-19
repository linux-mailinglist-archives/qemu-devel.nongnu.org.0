Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD26B2FC128
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:37:58 +0100 (CET)
Received: from localhost ([::1]:59114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xlF-0001Qz-Rg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xd5-0001cE-W9
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:32 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:58070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xd3-0000IR-FM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:31 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKNZBZ002868;
 Tue, 19 Jan 2021 20:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=QY5nIxO44go0zceRhgbLvvjkODdNL2qmvBtMCjdho/M=;
 b=UIoRLPcM5k0wfmK+lb10txFugf9RrNMv1F4ZG9+LPnY9tfuNY7N6y420BLHuRkAgEqJx
 es9WjCh14ZJ7mmVKq7Sa1HDvKvPEabK7jytKDoK8L8k7mlilRFWqzC9LYvKPGCvqsm78
 XGfjHanH/dX63Cd7iuXHb+d7IuzV9xOyJYEo86WRb1qW6M6HupsQoYF89QqjWaBTD+KP
 zFXBrKRnAV8mLPTiGYHE91ii1w+f4q+IRnKe61g8TmIY7HeQLprFOaqT8ejzekZAzlYT
 5orlvMf4u9ZwPD111pQUp9hD47IZDE1gee6IXBuLAolJ1+EEKdPfqEigtwfh9Yj4Som6 gg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 363xyhtate-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKQbYD106679;
 Tue, 19 Jan 2021 20:29:21 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2051.outbound.protection.outlook.com [104.47.36.51])
 by userp3020.oracle.com with ESMTP id 3661kht8c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egii90h5CGjvjGK6xmIaHWciGQbXK2WdSjnOy3LTzkn5O7UjS01WV80cp9xdDvzz8WIWodYydsYuFOSi3BXhdVe62kvOZhmfkeTTWhAKEzyDGFURsI9/fz+lH7U89O/r6tnUxsHZSdY64oxsFtAdWyPzTmOfJOaaMVEvwDD7Iur6zikoDmaM1ciLmuYlsX5aU6yjF6EVbHOu7LfVDvmhk2eEPIxqVN56jBW7zqBl++xeLOjYL4HErwYrZ3vG6toOrieh1xF8Wu6vWoa6Bik+z8O8urMpRokme9yxFjacjpKHQnvCMDZVA81Eik8ZjxpF5z5/MFVTDfaWP+Kvlsh4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY5nIxO44go0zceRhgbLvvjkODdNL2qmvBtMCjdho/M=;
 b=fwq5KYCOW8muKtB0QcSq3MGK6e8/odfSq3IQIXg1zkTt5XNKeUhjVlX0CZ/CqWR/v3brVUzGtlxnqT3ShDRTzcZA5ghXy0hZ+uFPhRg/uTwNwCTGAc9waYCXjZhZ4VMmByFxrhC+2sbjsc1t97T/QdnqCsRG5AazlNN8o4lKrGMQuTn4bGPjUWawz16/baqjliPtjUFWCI9n4vDxdtdKrk0GsT9tbJt/MuHZFrquUHwvG4D814kGyWaJvLzKTelffWzTLCrREq01Js9tv8Sw/oHQBffJTwgXjFn1NKbxEnM7cB3hHsAJHMVYY9f0engPxXLS7nYcoJUbc+Etsw5smw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY5nIxO44go0zceRhgbLvvjkODdNL2qmvBtMCjdho/M=;
 b=zyU3T8EjJ2/yU7ujWfyjT2YiBk0UKGmtqs5XgPCBNhNCObKEgVnjmVKcUkWpi7x9CCwX7IWZJQ1BI0/OC1HFzypHc9KBaXYc78S4Dvh3f3ymet3xRfAeF50mqAIwm7JoDBsFSvqP1REWBltKu44lyjdSbAlahiXMCimpnjxVvxk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3351.namprd10.prod.outlook.com (2603:10b6:a03:14d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:19 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:19 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 12/20] multi-process: setup memory manager for remote
 device
Date: Tue, 19 Jan 2021 15:28:29 -0500
Message-Id: <ac84c6794e8ebfca1eff27a078c7d050566c8e19.1611081587.git.jag.raman@oracle.com>
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
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a1328a9-c7cd-4bab-0224-08d8bcb8e5ed
X-MS-TrafficTypeDiagnostic: BYAPR10MB3351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB33517ECDD4E64D427704C5A290A30@BYAPR10MB3351.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M883akLRhpeV/53VXDSvI5oZmdytEKHrf2L12ol1HN8YN+MKVp7VlXPQFce9fqdqSCJIj5tr6MnwtqB/PtB7DPF9UWZoBgdW+IKF9xe7+hTR/lbcGxC9HL5eM6edQz8agnV6s/QGaiNu0NqfZ3do/jffQRUrg8mFiv34anQQYEo0cPJiCIxL7xEl4hY/zDUZQqOP6vfQ7ewih23a/XzXj2HGxP9qz33fZirNM1JsXPeaIsm+sARSb4vnh3+hef1LX/Yb2ZTlN5xyhk8TtaGriiEWvhaC0+/6eK2b9dLcTKV7sgnIwOgqCcM6VubVpU/wAqV6tdvC9gz3jMHX+W1iiqpHoOMMoI8U54CjtcosHV84k9dcynQ+DxQcLJJ5FA7ieIEl1LkhOs2zyIGQ6J3P3kSTlHU07Ki9phoki7XR5LdGrYfI0aJh+3bYYiyoYlNRgDm+A1TNA+iPPeIQU03xGb7vgBIXLhnYiqrwbuXCQx0EHNgfzJMkwckIF4bsX6FjkwCQNpNURPQJHJt+nrzJxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(86362001)(2906002)(6666004)(6916009)(36756003)(4326008)(8676002)(52116002)(66476007)(66556008)(316002)(8936002)(66946007)(6486002)(107886003)(956004)(5660300002)(478600001)(7696005)(16526019)(26005)(186003)(7416002)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WlhXUURNL2NxbzczUWc4VExrRDBucTB4QU1EbkY0QmRZVUc5OW5UcHhjbisr?=
 =?utf-8?B?UlB0OVYxZlZYSENZR292RXYvc3hCSllCaHkvUUlIdjgvZlJ0UmNIWXk4WVdD?=
 =?utf-8?B?dVhoZmFiUGJ6SWtrM0crQTFVUnVqSUVPaHFMUllGVWdrcXh2dlBqWC9zTjFM?=
 =?utf-8?B?NzBueGRnSEMxVzNGUU5FSlYvUWplTTlpWWJacGloRnhEbGdRU2pXRFJmUDhi?=
 =?utf-8?B?VmlvcGJQMk5pWWVDQkNRb0xsSVZBd3ZqZ3NyMHViREY3SHpDUGk1R0J4bGVM?=
 =?utf-8?B?WlowTEM4UzFyTlJuT2FUTkMxK0xUc3lrV0I2d2NHNlNiTGc1dkxWQ214VXRv?=
 =?utf-8?B?RUd6NU9kc2Zvd0FPSGJqWU9yb1RFcmU0SW15OWRsVDBjVHMzc2lxbjB2ZnN6?=
 =?utf-8?B?L09VcGdmb0ZRTXpLK1JTKzBud0M1SHF5cnQyQ0NaUVVueG9Nb1J6UW9GZDlz?=
 =?utf-8?B?ZEdlZFhEZlB3dXFGeGUvbFNEVmJvUmJ6NHp4d01EUFY2SENNUWZCemlrOU9x?=
 =?utf-8?B?VGZTeVZaUjQ1bzB5VUMzaUdyMERGV1pBSUx1aU4wTHdmcFhvY2NlcC9VNjJD?=
 =?utf-8?B?aDRzTSs5OGl0VEVEcDAvb2I1dGt2TG1ZRWpmNFhiSGh0NXlaYUc3Tkg3K2c3?=
 =?utf-8?B?RWFMYlM0aTdydVVtajUxYjdSYU1IWVN6QS9MVy94SFZ4Wm5VTVdESlA2Uzlr?=
 =?utf-8?B?TCtYcEYwb2NQTU9PQU5sZll1RWl5VWtQU091S3lGQ0NhbFZRaDFUb3kzdjRI?=
 =?utf-8?B?TkFoN3N6VzhSN1EzYnZuTEVCOTBlbW5WOXplR3ZWNWNLdWt5Rm1oV3c2c2ph?=
 =?utf-8?B?ZDBGQko1bXFjSTdTaFlwVE9LRFNpY0lOb2RkRUJXQUpyRU8yR1ZoT1ZsR3VR?=
 =?utf-8?B?MTFnNDRQeE52QVUvcG9BR25OeFVvTUtJQWFSbkZRWXdOMVlUWEVuWjZmelcw?=
 =?utf-8?B?bXo4V2EwUUlNRnJwd2dha0VMNHVjSlhCaGYrOUVJVGhybE95NVFXbGhGN1Vq?=
 =?utf-8?B?TjlpLy9ySVIzdVlPcWg3b2VvWWFxWWlxVWhJUDc3S3Vjc1JBZGxLbCt2eEJ1?=
 =?utf-8?B?dTBIMVB5WEZpY2tjNVBzVDQxTUZGOTJtRGllNWUvbWQxU2Z4enJUaVNXSVNK?=
 =?utf-8?B?czg0RjR4Z0x1TFNiU1k0TWVxRWM2OUlNTi9tMGpMR1lPcVRSN2FLS002NERx?=
 =?utf-8?B?V0xoa1l2Vk1qWXdhcWQ2RVBYMXhlU3pOQkJhbXhydVB4UUVhaldCVi90R09i?=
 =?utf-8?B?eGRNSHdPRnlzZjJDdmp5UDNMK1paeDN0MGlJWjA5UHY4dEEyaHhFMnQrdlhy?=
 =?utf-8?Q?VVHkXlKafi+6k=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1328a9-c7cd-4bab-0224-08d8bcb8e5ed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:19.2363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0yhGfHcf4FJHswzL2uDd5aIOWM95EjfiHNatp/r10fhqCwxlC8OQ1mb1MCW7e93JvaAv4a8vipm4c/9JcCkPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3351
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 phishscore=0 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

SyncSysMemMsg message format is defined. It is used to send
file descriptors of the RAM regions to remote device.
RAM on the remote device is configured with a set of file descriptors.
Old RAM regions are deleted and new regions, each with an fd, is
added to the RAM.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/memory.h      | 19 ++++++++++++
 include/hw/remote/mpqemu-link.h | 10 +++++++
 hw/remote/memory.c              | 65 +++++++++++++++++++++++++++++++++++++++++
 hw/remote/mpqemu-link.c         | 11 +++++++
 MAINTAINERS                     |  2 ++
 hw/remote/meson.build           |  2 ++
 6 files changed, 109 insertions(+)
 create mode 100644 include/hw/remote/memory.h
 create mode 100644 hw/remote/memory.c

diff --git a/include/hw/remote/memory.h b/include/hw/remote/memory.h
new file mode 100644
index 0000000..bc2e309
--- /dev/null
+++ b/include/hw/remote/memory.h
@@ -0,0 +1,19 @@
+/*
+ * Memory manager for remote device
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_MEMORY_H
+#define REMOTE_MEMORY_H
+
+#include "exec/hwaddr.h"
+#include "hw/remote/mpqemu-link.h"
+
+void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp);
+
+#endif
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index cac699c..6ee5bc5 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -14,6 +14,7 @@
 #include "qom/object.h"
 #include "qemu/thread.h"
 #include "io/channel.h"
+#include "exec/hwaddr.h"
 
 #define REMOTE_MAX_FDS 8
 
@@ -30,9 +31,16 @@
  *
  */
 typedef enum {
+    MPQEMU_CMD_SYNC_SYSMEM,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
+typedef struct {
+    hwaddr gpas[REMOTE_MAX_FDS];
+    uint64_t sizes[REMOTE_MAX_FDS];
+    off_t offsets[REMOTE_MAX_FDS];
+} SyncSysmemMsg;
+
 /**
  * MPQemuMsg:
  * @cmd: The remote command
@@ -43,12 +51,14 @@ typedef enum {
  * MPQemuMsg Format of the message sent to the remote device from QEMU.
  *
  */
+
 typedef struct {
     int cmd;
     size_t size;
 
     union {
         uint64_t u64;
+        SyncSysmemMsg sync_sysmem;
     } data;
 
     int fds[REMOTE_MAX_FDS];
diff --git a/hw/remote/memory.c b/hw/remote/memory.c
new file mode 100644
index 0000000..32085b1
--- /dev/null
+++ b/hw/remote/memory.c
@@ -0,0 +1,65 @@
+/*
+ * Memory manager for remote device
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
+#include "hw/remote/memory.h"
+#include "exec/address-spaces.h"
+#include "exec/ram_addr.h"
+#include "qapi/error.h"
+
+static void remote_sysmem_reset(void)
+{
+    MemoryRegion *sysmem, *subregion, *next;
+
+    sysmem = get_system_memory();
+
+    QTAILQ_FOREACH_SAFE(subregion, &sysmem->subregions, subregions_link, next) {
+        if (subregion->ram) {
+            memory_region_del_subregion(sysmem, subregion);
+            object_unparent(OBJECT(subregion));
+        }
+    }
+}
+
+void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    SyncSysmemMsg *sysmem_info = &msg->data.sync_sysmem;
+    MemoryRegion *sysmem, *subregion;
+    static unsigned int suffix;
+    int region;
+
+    sysmem = get_system_memory();
+
+    remote_sysmem_reset();
+
+    for (region = 0; region < msg->num_fds; region++) {
+        g_autofree char *name;
+        subregion = g_new(MemoryRegion, 1);
+        name = g_strdup_printf("remote-mem-%u", suffix++);
+        memory_region_init_ram_from_fd(subregion, NULL,
+                                       name, sysmem_info->sizes[region],
+                                       true, msg->fds[region],
+                                       sysmem_info->offsets[region],
+                                       errp);
+
+        if (*errp) {
+            g_free(subregion);
+            remote_sysmem_reset();
+            return;
+        }
+
+        memory_region_add_subregion(sysmem, sysmem_info->gpas[region],
+                                    subregion);
+
+    }
+}
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index b3d380e..4b25649 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -201,5 +201,16 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
         }
     }
 
+     /* Verify message specific fields. */
+    switch (msg->cmd) {
+    case MPQEMU_CMD_SYNC_SYSMEM:
+        if (msg->num_fds == 0 || msg->size != sizeof(SyncSysmemMsg)) {
+            return false;
+        }
+        break;
+    default:
+        break;
+    }
+
     return true;
 }
diff --git a/MAINTAINERS b/MAINTAINERS
index 6e60215..27216b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3197,6 +3197,8 @@ F: hw/remote/mpqemu-link.c
 F: include/hw/remote/mpqemu-link.h
 F: hw/remote/message.c
 F: hw/remote/remote-obj.c
+F: include/hw/remote/memory.h
+F: hw/remote/memory.c
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 71d0a56..64da16c 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -5,4 +5,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 
+specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
+
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


