Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A696D308AC9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:01:49 +0100 (CET)
Received: from localhost ([::1]:53970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5X9Y-0008KQ-Kl
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wvl-0007HM-Ej
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:34 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wvb-0005nI-Fp
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:33 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOiHi121677;
 Fri, 29 Jan 2021 16:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=bSc7FL5nFi0+xGcsWTkkqW8vF96TflCH6/DZRipj63Y=;
 b=qQEHMZqGm5n5VpwmKp23ZU9+s+Dm5DgbvSHzjaUxC7bd1Jv5zwPJvC8Rk6zr8edIIY4R
 Zl9Vjmh5bhbNrrpA/SVjFniqcdl2odFfBOjrZbDMp4j+yA5Zo2XcMdbMLsLS1W0twqp0
 0IEIygDrClEKDdNb1f4U4JV0kHzPbM2mWCvKuP6z+BiUgYY+cZG3NDMaFtAkmnUzlwCD
 HED30OUIcLK29+tUlWOWrXImkB8clXYgFPV+ccGnU2vWBeMi4XDAgMIXlr2JhhNvkhpw
 vi2P6+EpO70IASFf7lDvvGURePTYc38bkh5v9s6WFut+aUKHCPb/R0MVE7hjuiI5MbJc Rg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 36cmf88j56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPtEo089699;
 Fri, 29 Jan 2021 16:47:14 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by userp3020.oracle.com with ESMTP id 36ceugw3rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ1M71lKJGgbfzHXOoe3RweGmN0MzQ3aGEgHm5gLKKh4KMQCsQ4IX3k9olzXigmVstx8xJQ1f47vfhNIPAC8ZiBh0/ZmKhCCS6rds7jdz2tISYAAjXgKzFcGPQRpLUgdmJBOisICRFR2nDJsq2yufErWJYvNhYv+3OW2cH2gqwS+5SbSMH8ty/tCmiLkLSsl/f6ODwRkGbr4iUkk68bjqpA3FsDDnDi9uUFoEUkgbF18Uqwb/Jwx/3i9U+Q3RRIG1dT1itIkwySoR0tnthD+83hBoGzCwnEowyHPTxrNB+B8ylbASk91Jt4wI4p/JNdYakZTl+GcFI+YPsEYUvURiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSc7FL5nFi0+xGcsWTkkqW8vF96TflCH6/DZRipj63Y=;
 b=Muf3yk3mD5sqeoeMAkroqDD61PvzAMm1vd1/Dl+BDwYKKyugKIgkW6HBn/MarEuFaZOWYAmrc91r17bHgRTmElV4L6WlRO41g342jOEK3awzli3ZGmnxM15S7Pa6PiWvlFm95WO0SBQKdulQzeoC4JyRabkoO7aE5Iq9aGAPg3ufsLq+0GeehtBKitEnTqiOS4k6Chawd1jxu0YGmBFvfo/RHUWIUXJwq1qMW28s0VO61ubKltpoedLN4C6wqZ7wYAGHFY5ql3a//CzkR68jEO34rW+LgMBVDzKlmhLJoue2ic3KY+9BPShkcYS1WLHWuXq3+//Pg3uzTmBySIhl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSc7FL5nFi0+xGcsWTkkqW8vF96TflCH6/DZRipj63Y=;
 b=RaBSG+PguyXh3LQKT2VmHR1Sz6w0iPCzUhv0QVjQej25v3VWLvV9dWKGCRwh+TfwtLvpcZFho/u82ST5en8kPC1d79PoRtAZ1nJqcrnG9xvHl4zhNf4fam7eAsBbq3QyZLrZSI4frENlFotxLawXmlcbwe7NQOas3QPBWvCaTRw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:47:11 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:47:11 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 17/20] multi-process: Synchronize remote memory
Date: Fri, 29 Jan 2021 11:46:18 -0500
Message-Id: <04fe4e6a9ca90d4f11ab6f59be7652f5b086a071.1611938319.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [209.17.40.45]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.45) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:47:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b75d5f5-7916-4e75-9f1e-08d8c475860d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4671E15DAFCD2D1CC0BEC94190B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3bbGkHsMk0lytpRTSH0iGrBTSfFPeAN3Rwr4SHVFkLyayIm3YEkAzCTXQhQreKIucbycSpRm9jjVd2bzFZRtdmW5lkPOTre7WvOtrtVuCly+ufjubZIls1P4BhMxWB35MbGZB8soEFc5v2J99b/d7ffHFL73gBJQGONV4p1Qliu/U2MmJb9Gg1mihKCbeAjhjPCEw+T8rg5ECyuU1IcPM9RfTvN/EFY22It8gwDmA8xLmww8//bqbWAuA98x+XvweUP2vp/8884VF3moVHkHAERssFGWS1pMnECTKz6iUXtT+rYPT6q7ziRn3ERemG69p5M5AEbFEdXZxFXM1+mVRtUHoLsBkCwFHTv3UxLpq/IoqzKDoMhO/vURviwi4RSz+Y/Jy/wIwhl0lT7q9JeESP0NQIehFeDoyUl75oDnryAX9SGtRFfjMy4dGWMYWI4ojuRcxmBD01Ma6bKfpN1++KgJ5yCP8rs0mA36/zrATHHmYyZ0DE2QY1lPyVNKLwcei3BNatLRCC7aK78bNJJ4YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(30864003)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0p2aXlQMllXT0cxTkdPeSt5VG54cytaRjNqK3RlMS96MGJaaG9uMVdJWDF4?=
 =?utf-8?B?Q2RzR2xMSnE5Vjd0Q1FBeEpaRFVnLzR2SzNjWnNMa0lKWnk5TU9DNGl0bGVi?=
 =?utf-8?B?a0pralBraTZJeE40Q1RFOWVQZWFNTVYrMEdOeDJueTRJTUhiUG14d2tjMm9o?=
 =?utf-8?B?L1NNZzVmTm55Q2p0MFdIT3ZCKzZIMC9FVldPS05ydnVUc29kM1hNM2xReUFy?=
 =?utf-8?B?eWZIQnJXUUduMEpLTkxmWE04TlVpWUdxbnRXMm1nSXN2NmdIMUpjMHZnMmMy?=
 =?utf-8?B?dXBMWFAzaDdRdTUxUUgzZktDTFkxN0g3cndCOVBLSXVKS2VzcTlYSCswVTZq?=
 =?utf-8?B?dWNUYWhYcWh1VDhDWDlqK0NVVy9jWnZkT3VaK2VDZ2UzYkxESFBPZ0lPZDNL?=
 =?utf-8?B?ajgwS3kwbHd1MHE5dFE0azV1MnFjZVJnK1FUUFptNEVVY3MveEV2ZXlZTWRi?=
 =?utf-8?B?UTE5c2VaOVZneWxHSVFTYm1TMEdYeTNlc2MzeXYvM0EzT1FiekY1VTdCSStC?=
 =?utf-8?B?K3dUMDEzam93aFQxWDdtcEhpT2hXUTNKK3lsakh2UGJ1TU9LdTdXakhBUTJl?=
 =?utf-8?B?eWFqMXBLdWUvQ08wZWhOWTg4M29uNkpWTFVodzBmQ1NBVFNhblJoZ3AyQ1Y2?=
 =?utf-8?B?V3AwdlpEeU9rTlRrVVFod25GNXc2ZkZ3Q21lMFBOaHpsQ1MwSi9sL2doMkRY?=
 =?utf-8?B?T1F2QTNSM1hLSFdIOTdKYnJMQ3M2MDh1bUVTRlpaUHozYlgxcy9zb3VjamNl?=
 =?utf-8?B?ckZ1R3pvVjNrK2gwbE94UjNCYUhwRm91cUhBZnEzMmFUV2w4UTVPZUR4YlBr?=
 =?utf-8?B?NDV3NTlkY1RBc1AyM3hMUnNIZVlpVjE3b0l4MFd0K0hpbTFObWpwcmhiMzJM?=
 =?utf-8?B?SFV6bEQ4KytnZFdEQjdWSVdMcHpLSlhqc3pRSlVjV1BzeDMrM1gwaEpaOTNU?=
 =?utf-8?B?U2FQamxGRmJSblZUZmVSRUJFZmxPSENuTWRKMFlyU0ZCYTVqNS8zYy9RTmc4?=
 =?utf-8?B?OGxSMWIycnNLOFpKb0JZUUN6a3piUlpnTDJ2UXo4Qzc2Z0p1V3JXQkR0bENy?=
 =?utf-8?B?L2lHQXdIdmRBL1ZVL3BtY0FlLzU3eFVzV2lMWVppVEJNVFIvNTZWQkFhMWs3?=
 =?utf-8?B?Nmpkb1RsRS9UdXBETm5ZTXFNNTJaWmQvWUoxdDNHaVZ4a3RBZUlqZlZhd2p1?=
 =?utf-8?B?c0hGcDlLUzlkZFFLbkNJRFFBNGx2U2MrVVpva3JVOWR4WHExTHFSbTBIMG5q?=
 =?utf-8?B?WjZDc1A5dHE0Y2U4N0kxbFFKaG94L3M5MVEwZ1g5ZHBJckFBNTlDdnVJc2hY?=
 =?utf-8?B?UWxPQVA1VVoweUE4ZExOVkorVnZQeENvd1hzWldGTjduV04yWG5MOVhBNzJh?=
 =?utf-8?B?bU5qVU8rU3pEOTJqMkpBcUxuZGxZdmpVWlUyZFFYMTNKbUgyeGI4ZllGdFph?=
 =?utf-8?Q?p8dRnZj+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b75d5f5-7916-4e75-9f1e-08d8c475860d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:47:11.4890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fK4njiFBnSXFIhsEUR+VJNCcgoStGX2A4lWjgUjl/17/aBE1D7AEwP5tQfvS3T1my6eLCIL2XF1o25BRuf4ebw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4671
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
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
index c60c333..b8b24d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3200,6 +3200,8 @@ F: include/hw/remote/memory.h
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


