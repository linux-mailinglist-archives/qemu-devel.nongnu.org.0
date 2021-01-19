Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE22FC1FF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:12:17 +0100 (CET)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yIT-0003LM-0v
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcx-0001LN-Py
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:23 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:56116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcv-0000Gg-6u
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:23 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKODbI131269;
 Tue, 19 Jan 2021 20:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=VQKJ1H6MuV/ngL6Cq9KGXuymdjJIz35iesfj/KKtBXA=;
 b=dhBZVMmoKwfDOc46zo0dazxSfjljc2imx7w/GO5KaNP3PPZA3KP3+OcO2crxQWPbaJzV
 K83yvJ5gAIxCerdahSXKYa7h/sy763dY1diNR0FCreIttR+jxw+QqKnyEccRlPe5bGGU
 le3boXYJ5vtwHTSIK03UZEb7JhXqlcVWYEzcoOlCSvVL3paMIjCgYAP2evq/Gkg0gfUH
 BsNfELLz/IMAHRUnME6mZm4fDsfJrhTSCW+2YUZWUAZBAg1JyN4Lq9DLw6Q7Szi1ptEl
 O/yCnIbzkrcKhOZUJZ0of8cgTMiZHNfzpNCHlRkDrUTgmL56QDD6E2l7Q3TCH0te8nx8 ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 363r3ktxn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPdbS128387;
 Tue, 19 Jan 2021 20:29:12 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2055.outbound.protection.outlook.com [104.47.36.55])
 by userp3030.oracle.com with ESMTP id 3661njtajg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8pL65LgV8Q5zhb4B1WdTLJ0GCjNVWCJZvneAejoRBf5w1cruLXyVeZ1G8A4p8UyT2LiDHEsOuNByGQFOTEuzdvzI1K7KNey4JVlST32e3db9jpbBm6UHFoAFbr2qTQzNWy794Ax7q06ElYe1XplK4iHfqz2ie92uk78vHHO9mf/xd09s5AWhkoLRRh9HCYVAFs2lvbdqMxqlzulkWFxuBJ31TfeNpziStbWXDwGVF+Gr4vZk482naVIeS3hwnGF3OsSLqTIIXWh/4WinI9pZ+QfjV076EuliTUf1MuwgqJ3JVZhAciumMFiCs2IW9fj4VccwkmISZnFPmOaITAoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQKJ1H6MuV/ngL6Cq9KGXuymdjJIz35iesfj/KKtBXA=;
 b=dFWybTz5kbLvLBR1IKB0CIK6wVDpNlxV37MTU1kO6//ctrg0n70/mtlFHC/9P6QgYOdlW+4ils6UOxkHCjqb6TEd/hxxklxiirraIpAzDaVE5cQpgh0C14zklonchcBwweEUGb0AD/G6OVUxX8vTxtOz+WC3b7X6H+d+DZEeAN4NOUHNTzat8JE/2LH8LzTp0ljE55LEz5pmWjZFcpD97oLQorSAJpyOyziPcS+hEUAfxJdeCXRFbY16U6rAdxTxh9uHch0kM2VcqLpMZuYDYBLObRYoAKBp6TS4Vd6woJ9kxWtwzOKAc6ivm594aD8EEEPP28+1erZ3Mrhd4VAF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQKJ1H6MuV/ngL6Cq9KGXuymdjJIz35iesfj/KKtBXA=;
 b=CK0ASR7VlklQpknsIEl95RKJ+PjXRnZA2Ml2ltD8NO6QD0/zApo8usXuGn2oHJBw0n3N6RSgMAXKkQMhU6AQP2rdV3oSFiYFOgRfHovamT4CRHxB3BmpXwPq/+VItsskERNXNVf7bLwfGzFcuDYuMinnsK2jPL8pTpJSeIRiTNM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3351.namprd10.prod.outlook.com (2603:10b6:a03:14d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:10 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:10 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 09/20] multi-process: define MPQemuMsg format and
 transmission functions
Date: Tue, 19 Jan 2021 15:28:26 -0500
Message-Id: <918f6170a4d564c1672085d841d3d8bb213311de.1611081587.git.jag.raman@oracle.com>
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
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f7300be-aa55-4355-0e5f-08d8bcb8e087
X-MS-TrafficTypeDiagnostic: BYAPR10MB3351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3351727F53F005B90D92416890A30@BYAPR10MB3351.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Auz2/ZkWs+lPNzOHWlURhQ0Fxm27ny+vC1i7L/1j83VoGQhz+uRuHSax3dCY3D6rUO+I/KaHy/XUOwkYt83QRzcwgq1UCNaHbJeEDo//UI4EEGmnllVEoSzPC6oveXow6UsLo52DL0TaeTQ6ikOl9rushS8RpzxgrZ2WxiyU79uApbRygaxszUNCBj+l8nJ12ey5Ml3GgpDnkrSCbINQ69xk6Hjk/zFG9VojJvLne+wYBUZHvmffYRQ7yLmzck2HVn5zlyxeqoaaX3ehz1J0XinZA4io+VIKBiKloBtGTx395KQaWX4ZzBBTolghJ/S02facIrtQBUyNFqF+8V05Oazh3ITPsxwMeGRRbiXT41tjiWT1MfKvaJT/5FQYCWNiEe4y7n3VPXx3yzCLKiQCkcZOHtKrkmgn7z6BTp0NPXSZDOA2Sn3Bo7KFD8UvP6uficVdc4PI+JjZ00oFc6RDGLyCVT83j9/vexSBvRAhgw+hk36AVZIfJ65F0af+XHrRq/bg3412l6i6UIErFg/fQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(86362001)(2906002)(6666004)(6916009)(30864003)(36756003)(4326008)(8676002)(52116002)(66476007)(66556008)(316002)(8936002)(66946007)(6486002)(107886003)(956004)(5660300002)(478600001)(7696005)(16526019)(26005)(186003)(7416002)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0JyWnlBUTdNTk9nbThLazlLSG43akRsMDIrdW9valFnWjg1WFFnNnhvT2hu?=
 =?utf-8?B?WGUzTkdwMFN4T1E2bzBOanFYd0NKTHlwZGNKZFZxYk9HaFVSdmNXbWlMTUkx?=
 =?utf-8?B?KzNMM1daZko5YVVJSzdEaWZkaGlNTk9ra29xSXZQd3hPczNPaDRvaWMxVU1E?=
 =?utf-8?B?MjdPTDNMMVh0czNmM3NvMTd3UE9OMGJJODhOR2RXeVR4OWMya05nUndRQzQw?=
 =?utf-8?B?MmZkTzN0V0N6TDdIVmtRR1pFTHlKZHV0dEdqeWJYYlh6ZHp3aG1SaHpHNVJM?=
 =?utf-8?B?WTl6cURseUtZMktrVmdMNTNPR3oxdjNKRC81VzJ3ZXFhMnJ2WjBwYi9tNXoy?=
 =?utf-8?B?NHlodHR2b1A2U3NkWFUxRUFKVEcrNlhzVlpqQy92T09PNjRueC9JL3F5cHcy?=
 =?utf-8?B?RWFOeSsrV2VSdlJtZXVuUWl2TkEvdmU1cmRZYk9rckc3ZHh3MWY5VC9pNi9J?=
 =?utf-8?B?TFQ4YjRKQjhJalJvcUpOVGprcHh3d25QVnVpU2lSclBzWENSSmdRSGVXdXZ2?=
 =?utf-8?B?RzU1RVRvNVhSRjVBZU5sL2NHZU5iNU9Ud1Q3QS81MGdQZlkwTlEraFZmQXBE?=
 =?utf-8?B?bWtHUEpEN3V5RnBrbDNqaHUwZ21tMVAxM0dOalpCblN6SkJMZDFCbTc4MHY4?=
 =?utf-8?B?cGdRMmRENDFvNThhdGNtYzg1MXRtWmI1dWlsZHc0YjcvU3JqY1QydlY0OXhK?=
 =?utf-8?B?Rm50Ui9iUWkvcmsySnJSSURrUC9jYzNKMmIydVRqenNYSjA2YXZkakZxWWNX?=
 =?utf-8?B?RUVGN29QYzdyNjVYRUFLaUhOTVI3S0NpLzFoaHFnY0dBWHdDckRtbXRyRE5y?=
 =?utf-8?B?YlRVSHVLVlFpdko4RVoydzdwbVlYc3YwVldXYjYvZjBYc0xBYytZUFdPT3Nu?=
 =?utf-8?B?R3FRRnpNWDJzV2VDMmIvcjA0Y2hSR2J1bk5hWE9iT3YxckdjSFZYejhkSXg5?=
 =?utf-8?B?T01tekJ5QTdXZXo2Q005L3hFZE9jajAwaEdtdmMxT1d6eG1GN2FKQzZwLzhv?=
 =?utf-8?B?WnY5bUdCVW5mbkhvcTR2OVI0bm45Y0F3L3dHQWxzYWV5eExTdGErRGZaRFly?=
 =?utf-8?B?L0FxcFE3Vit4UEU5VDFtazh5dS9OKzkxZ25vbU1PVk1DSG9zQ0RrdUZGV3hI?=
 =?utf-8?B?V3o5NmJHTVV3NFlLMm5LZEhWOUdHMnAwOTI2ZFdyYmptcjhIVEFDUTVncVlM?=
 =?utf-8?B?WFdhY3hub0FDaWMvUHNhdE1LN0tERENrbzVhRHRONjJBWUZkWndYMFZ6VnBY?=
 =?utf-8?B?Zi9sR3g4NHZMNnl6YVRwK3dFbHpEdnJ3VFpCSk9xUWlzU2xxV0RpQ2Y3d0VO?=
 =?utf-8?Q?souIEcNVp5kBU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7300be-aa55-4355-0e5f-08d8bcb8e087
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:10.2005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUha6EaZyPfU1bSBQjhyUxuXMS2fUywsOOKKTwNVtvYr8fZeS7+5o++GdYBJztwJVofDFceR5QK30otRQIIfRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3351
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190113
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

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Defines MPQemuMsg, which is the message that is sent to the remote
process. This message is sent over QIOChannel and is used to
command the remote process to perform various tasks.
Define transmission functions used by proxy and by remote.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 meson.build                     |   1 +
 hw/remote/trace.h               |   1 +
 include/hw/remote/mpqemu-link.h |  63 ++++++++++++
 include/sysemu/iothread.h       |   6 ++
 hw/remote/mpqemu-link.c         | 205 ++++++++++++++++++++++++++++++++++++++++
 iothread.c                      |   6 ++
 MAINTAINERS                     |   2 +
 hw/remote/meson.build           |   1 +
 hw/remote/trace-events          |   4 +
 9 files changed, 289 insertions(+)
 create mode 100644 hw/remote/trace.h
 create mode 100644 include/hw/remote/mpqemu-link.h
 create mode 100644 hw/remote/mpqemu-link.c
 create mode 100644 hw/remote/trace-events

diff --git a/meson.build b/meson.build
index 01e25bc..0b353a6 100644
--- a/meson.build
+++ b/meson.build
@@ -1754,6 +1754,7 @@ if have_system
     'net',
     'softmmu',
     'ui',
+    'hw/remote',
   ]
 endif
 trace_events_subdirs += [
diff --git a/hw/remote/trace.h b/hw/remote/trace.h
new file mode 100644
index 0000000..5d5e3ac
--- /dev/null
+++ b/hw/remote/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_remote.h"
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
new file mode 100644
index 0000000..cac699c
--- /dev/null
+++ b/include/hw/remote/mpqemu-link.h
@@ -0,0 +1,63 @@
+/*
+ * Communication channel between QEMU and remote device process
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef MPQEMU_LINK_H
+#define MPQEMU_LINK_H
+
+#include "qom/object.h"
+#include "qemu/thread.h"
+#include "io/channel.h"
+
+#define REMOTE_MAX_FDS 8
+
+#define MPQEMU_MSG_HDR_SIZE offsetof(MPQemuMsg, data.u64)
+
+/**
+ * MPQemuCmd:
+ *
+ * MPQemuCmd enum type to specify the command to be executed on the remote
+ * device.
+ *
+ * This uses a private protocol between QEMU and the remote process. vfio-user
+ * protocol would supersede this in the future.
+ *
+ */
+typedef enum {
+    MPQEMU_CMD_MAX,
+} MPQemuCmd;
+
+/**
+ * MPQemuMsg:
+ * @cmd: The remote command
+ * @size: Size of the data to be shared
+ * @data: Structured data
+ * @fds: File descriptors to be shared with remote device
+ *
+ * MPQemuMsg Format of the message sent to the remote device from QEMU.
+ *
+ */
+typedef struct {
+    int cmd;
+    size_t size;
+
+    union {
+        uint64_t u64;
+    } data;
+
+    int fds[REMOTE_MAX_FDS];
+    int num_fds;
+} MPQemuMsg;
+
+bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
+bool mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
+
+bool mpqemu_msg_valid(MPQemuMsg *msg);
+
+#endif
diff --git a/include/sysemu/iothread.h b/include/sysemu/iothread.h
index 0c5284d..f177142 100644
--- a/include/sysemu/iothread.h
+++ b/include/sysemu/iothread.h
@@ -57,4 +57,10 @@ IOThread *iothread_create(const char *id, Error **errp);
 void iothread_stop(IOThread *iothread);
 void iothread_destroy(IOThread *iothread);
 
+/*
+ * Returns true if executing withing IOThread context,
+ * false otherwise.
+ */
+bool qemu_in_iothread(void);
+
 #endif /* IOTHREAD_H */
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
new file mode 100644
index 0000000..b3d380e
--- /dev/null
+++ b/hw/remote/mpqemu-link.c
@@ -0,0 +1,205 @@
+/*
+ * Communication channel between QEMU and remote device process
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
+#include "qemu/module.h"
+#include "hw/remote/mpqemu-link.h"
+#include "qapi/error.h"
+#include "qemu/iov.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "io/channel.h"
+#include "sysemu/iothread.h"
+#include "trace.h"
+
+/*
+ * Send message over the ioc QIOChannel.
+ * This function is safe to call from:
+ * - main loop in co-routine context. Will block the main loop if not in
+ *   co-routine context;
+ * - vCPU thread with no co-routine context and if the channel is not part
+ *   of the main loop handling;
+ * - IOThread within co-routine context, outside of co-routine context
+ *   will block IOThread;
+ * Returns true if no errors were encountered, false otherwise.
+ */
+bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
+{
+    ERRP_GUARD();
+    bool iolock = qemu_mutex_iothread_locked();
+    bool iothread = qemu_in_iothread();
+    struct iovec send[2] = {0};
+    int *fds = NULL;
+    size_t nfds = 0;
+    bool ret = false;
+
+    send[0].iov_base = msg;
+    send[0].iov_len = MPQEMU_MSG_HDR_SIZE;
+
+    send[1].iov_base = (void *)&msg->data;
+    send[1].iov_len = msg->size;
+
+    if (msg->num_fds) {
+        nfds = msg->num_fds;
+        fds = msg->fds;
+    }
+
+    /*
+     * Dont use in IOThread out of co-routine context as
+     * it will block IOThread.
+     */
+    assert(qemu_in_coroutine() || !iothread);
+
+    /*
+     * Skip unlocking/locking iothread lock when the IOThread is running
+     * in co-routine context. Co-routine context is asserted above
+     * for IOThread case.
+     * Also skip lock handling while in a co-routine in the main context.
+     */
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        qemu_mutex_unlock_iothread();
+    }
+
+    if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
+                                    fds, nfds, errp)) {
+        ret = true;
+    } else {
+        trace_mpqemu_send_io_error(msg->cmd, msg->size, nfds);
+    }
+
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        /* See above comment why skip locking here. */
+        qemu_mutex_lock_iothread();
+    }
+
+    return ret;
+}
+
+/*
+ * Read message from the ioc QIOChannel.
+ * This function is safe to call from:
+ * - From main loop in co-routine context. Will block the main loop if not in
+ *   co-routine context;
+ * - From vCPU thread with no co-routine context and if the channel is not part
+ *   of the main loop handling;
+ * - From IOThread within co-routine context, outside of co-routine context
+ *   will block IOThread;
+ */
+static ssize_t mpqemu_read(QIOChannel *ioc, void *buf, size_t len, int **fds,
+                           size_t *nfds, Error **errp)
+{
+    ERRP_GUARD();
+    struct iovec iov = { .iov_base = buf, .iov_len = len };
+    bool iolock = qemu_mutex_iothread_locked();
+    bool iothread = qemu_in_iothread();
+    int ret = -1;
+
+    /*
+     * Dont use in IOThread out of co-routine context as
+     * it will block IOThread.
+     */
+    assert(qemu_in_coroutine() || !iothread);
+
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        qemu_mutex_unlock_iothread();
+    }
+
+    ret = qio_channel_readv_full_all_eof(ioc, &iov, 1, fds, nfds, errp);
+
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        qemu_mutex_lock_iothread();
+    }
+
+    return (ret <= 0) ? ret : iov.iov_len;
+}
+
+bool mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
+{
+    ERRP_GUARD();
+    g_autofree int *fds = NULL;
+    size_t nfds = 0;
+    ssize_t len;
+    bool ret = false;
+
+    len = mpqemu_read(ioc, msg, MPQEMU_MSG_HDR_SIZE, &fds, &nfds, errp);
+    if (len <= 0) {
+        goto fail;
+    } else if (len != MPQEMU_MSG_HDR_SIZE) {
+        error_setg(errp, "Message header corrupted");
+        goto fail;
+    }
+
+    if (msg->size > sizeof(msg->data)) {
+        error_setg(errp, "Invalid size for message");
+        goto fail;
+    }
+
+    if (!msg->size) {
+        goto copy_fds;
+    }
+
+    len = mpqemu_read(ioc, &msg->data, msg->size, NULL, NULL, errp);
+    if (len <= 0) {
+        goto fail;
+    }
+    if (len != msg->size) {
+        error_setg(errp, "Unable to read full message");
+        goto fail;
+    }
+
+copy_fds:
+    msg->num_fds = nfds;
+    if (nfds > G_N_ELEMENTS(msg->fds)) {
+        error_setg(errp,
+                   "Overflow error: received %zu fds, more than max of %d fds",
+                   nfds, REMOTE_MAX_FDS);
+        goto fail;
+    }
+    if (nfds) {
+        memcpy(msg->fds, fds, nfds * sizeof(int));
+    }
+
+    ret = true;
+
+fail:
+    if (*errp) {
+        trace_mpqemu_recv_io_error(msg->cmd, msg->size, nfds);
+    }
+    while (*errp && nfds) {
+        close(fds[nfds - 1]);
+        nfds--;
+    }
+
+    return ret;
+}
+
+bool mpqemu_msg_valid(MPQemuMsg *msg)
+{
+    if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
+        return false;
+    }
+
+    /* Verify FDs. */
+    if (msg->num_fds >= REMOTE_MAX_FDS) {
+        return false;
+    }
+
+    if (msg->num_fds > 0) {
+        for (int i = 0; i < msg->num_fds; i++) {
+            if (fcntl(msg->fds[i], F_GETFL) == -1) {
+                return false;
+            }
+        }
+    }
+
+    return true;
+}
diff --git a/iothread.c b/iothread.c
index 69eff9e..f606871 100644
--- a/iothread.c
+++ b/iothread.c
@@ -375,3 +375,9 @@ IOThread *iothread_by_id(const char *id)
 {
     return IOTHREAD(object_resolve_path_type(id, TYPE_IOTHREAD, NULL));
 }
+
+bool qemu_in_iothread(void)
+{
+    return qemu_get_current_aio_context() == qemu_get_aio_context() ?
+                    false : true;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 3f01a02..ae3172a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3193,6 +3193,8 @@ F: hw/pci-host/remote.c
 F: include/hw/pci-host/remote.h
 F: hw/remote/machine.c
 F: include/hw/remote/machine.h
+F: hw/remote/mpqemu-link.c
+F: include/hw/remote/mpqemu-link.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 197b038..a2b2fc0 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -1,5 +1,6 @@
 remote_ss = ss.source_set()
 
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
new file mode 100644
index 0000000..0b23974
--- /dev/null
+++ b/hw/remote/trace-events
@@ -0,0 +1,4 @@
+# multi-process trace events
+
+mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
+mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
-- 
1.8.3.1


