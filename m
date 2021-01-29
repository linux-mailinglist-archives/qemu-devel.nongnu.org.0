Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7643D308AAF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 17:57:20 +0100 (CET)
Received: from localhost ([::1]:44850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5X5D-0004Z0-Hb
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 11:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wvj-0007Gc-PP
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:32 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvR-0005kx-7c
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:26 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPcJo181439;
 Fri, 29 Jan 2021 16:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=WVlMcOnZwre8dnoicOkOQNqx3ACkRSo1cqBupT+1ypQ=;
 b=W6WyCJWI6H/ulOmVXqXr7gl8Y2CDzKFozRL9mgnQWFyvmuyU9WxfKAQDDlR2yzgGd1Ry
 TlfdLxAWE4I2e1KM3nZr0MwtzHqXKp2SRsg7oooOJ3k+H1LBOm4sXhG2jTkHGBBbEzjv
 RxiJqqwXuq+JUOAYVwJMftcmbGBMch7fxz/H0k8dlGjRqcSAeNbC5A61C4QE0yhmZ9sQ
 ezTjFWcJpMERKN20BgCXuSSkpoU775zkN7HTk+bdSkDc3QgyCDjhT5wzaaelq1aTYmXG
 ahApy6CeS0ILCbvrktp0Ut/yQNGdNrk+UUWjt0vbqSknZBYNXlGCoQgL4c8+Zn0FVPpc /Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 3689ab2dxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPHMd121093;
 Fri, 29 Jan 2021 16:46:58 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by aserp3030.oracle.com with ESMTP id 368wcse1he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXTqIHSS+1jYZpSGLbsJPth9cdGRmM71LdnFATBBsOjFa9BOC4wW8AtIp+ZM94/GB8z+3cVIP80c9XipQ55ZMgNvtUYAvlu2SJxgV/kYgN3yNkvfDaxcmXM73jttb6/DqJ2zpzsSZ2Elou9bcsNLitjoxt9MpWYwT4GnY6fT7sq3w8uwqQG3UJu9J41paU3Yw79nN1/eNlIKkBJrmVdDoAtWD7xHfg4zBQm1Fpm/aiyJdpw4ikCsx/nIw6PDm603BuzkvyJUvCE8/dZ5M6ngK4IgP3x+tpBkTNCj8FLl29fZzCElioGZNNwLJTPuShfKdvk4bf1u3jUk8ehVY2scEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVlMcOnZwre8dnoicOkOQNqx3ACkRSo1cqBupT+1ypQ=;
 b=S6r55UPGl6oKNOowHELBCHdg7sqxOS+/ODISLcKCoYLdQfJ035O9aWcsSBZVZVVcLQMLajLcs+/KgRpaDRWvJ0Ppu9tlAiu/qJN5Y9lolpUlFN7s9W7OFQpz1B5/0v7YDMrCxHSowbPdgHRaPceFHY3NemqILPfSzWgVvQ6Pkc/iTQ/YdUXAZZSm/ihR1hGoIJpA1BXp6RhBglf40QRKyP40W1cYSrrjvQqyDo8/pIS/+WbZM03qnSWDakLCD4/3jgX64BtGGChU8iiuNlrBhg9AiQCEijydaM5G54/wHoDjTU+CE/LXMXB4gG2g8L8W1ahLbuH7peMWIICuHcwmQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVlMcOnZwre8dnoicOkOQNqx3ACkRSo1cqBupT+1ypQ=;
 b=n5jGUkzU6gfD0tqWRK+8Dz+/OFm9GELigBNlhJdyKTxFx7kVDqyGZ5c31kMQmzj6LAc358gZs49IK4OGjXinWmWLKfxt+OQGvDIpTzhCo1e2rjzOC8slppPgXW2TN53eI315Sns/xl1YWAyShFCh3YS3EbZTpjFvEyL4DRVGg60=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:46:56 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:56 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 11/20] multi-process: Associate fd of a PCIDevice with its
 object
Date: Fri, 29 Jan 2021 11:46:12 -0500
Message-Id: <f405a2ed5d7518b87bea7c59cfdf334d67e5ee51.1611938319.git.jag.raman@oracle.com>
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
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c470ecc7-8dc8-4745-1297-08d8c4757cce
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4671A775681AD3B63528AE3190B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hzzmsb24KB3yRiGCN7v+zHPNpLXxLMw9r0MrU1FN2lseqks7TWEBqFgeY0xSgSAr8/dau158ogY7RKozHbU/iOsDx6qlezib613UXHi9yAmqPO6gLCahHVY3F4tL0pmiXRGqAivzaOF7z91nOKossnZVnSCjzaZP4IhAgHMBffmqVfjTqCE3LrCjla1xDZ1levDxfZD5GNCQA9PxyKS17b+Rz4J6A6aIhvX5kmoasCRArY/3PhmOBAoWm6MCi5r4FYKwIPIVKbvs+8zoDhVm2HnYEOqmQti6Ei1w40UNHqUMttMjYs/FqXDUxKEXt2eOV9J4vCDtdM8irAQs6ZAxVOKIIyeFNXKe379WJlL90F+E7WERnYZnoNALzELZDEwY5Txl0VMTYJfwaeTbGYSPx1ynRAcJdft4Cz7awi2JYKslpOx8tbY/Y9eoLIoth87o3JLQ17vCEchIT2dihN3r/ibizsag1MfRv+vxpKyJhyVGpFePDOypAQ8RWn2rmr9IEvDW2EiBoreuIOHH7aLb3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a3JURWFxVm56Z2JOZlQvWjM0STJXL0lrc1pRVzQzM0k4VXhaK0ZOVnN3NEtm?=
 =?utf-8?B?Q0FnNlV0cFpCUUZjQ1hQTUVoakhqYnBJaXdPTUdENktZeUdqSUZPdnFlRUcv?=
 =?utf-8?B?ckJ6dVdyQ2dpSVpvMS9GMGFBVlJ1aTBONXFOa0RGZ05TRU12QnZsaThBY05w?=
 =?utf-8?B?L2RQbHcvelE2V1ZndmtETzJkQ3FHQ0pSZVFaWWphQlMvSXNyWFVqRFZGa052?=
 =?utf-8?B?VW53SWdRQjN4RU5CY1FTQ243QjhEWk11VXJjV0I0TlRmNEpHVjZ1SFppaHR0?=
 =?utf-8?B?NVVUT0x3akM1WmNTNFphbmdWOUxvRUM0cUI0ZUJMVUptVHgycTRLdllId0lD?=
 =?utf-8?B?cnVsTWNkNklRZzh3eDBqWXlNSUlOQzZZcitiQVlxVlhBYVcwT0xDVDhqc2NQ?=
 =?utf-8?B?VW1KbFFyeXVGLzQ2NlEzNHNBaStpUEpDM04wcGxVWVkrSm5VMHVPdzF3MU9p?=
 =?utf-8?B?ZXJjOXhoT3BrbkFWdklWK1R6ZExhUUQwNzJ2Z2xWcXRBeDBHc3cxV3RsaVJJ?=
 =?utf-8?B?WTZ3aHhLakNUOUo3eXVUTm4zRU43UmFmeWoxMzhtU3VZTWJ3cW9DUU8rNFhq?=
 =?utf-8?B?Y0F1akdZc3VNK3Zod1dZVitsR3pHNHRkQjZnWDgzV3BkKzRacjVsUnJPUzZS?=
 =?utf-8?B?dWJYL09kUnJlSnlIYWRGRXpFNHkvcXptK0p6S2t4WGk0UkFGQndpbloyQjdT?=
 =?utf-8?B?bjJkdkxHazNSb0ZXSHh1WVNtSGF4ZmprZzFaemVPOEt3RXFzT3hSekFQMVN6?=
 =?utf-8?B?YW9YYVRPa3paZHE0SUozVjZPSzI5L3pxUDdscURmTytmWmkxRE00NTdWWmJF?=
 =?utf-8?B?R3ByQWtvS3lOaHNjbnU5RWVBc004cDRFQmt0WUU1d2VkdVltV1J4N3ErK01L?=
 =?utf-8?B?U3RIRWlTODk1bUxjTjU3ZFN5QnkwTGdaWFN5d3g0VUY4RVIraG1qNXBRWEYr?=
 =?utf-8?B?cWRHeWQrcjUyUkhNUUlCSWJXcG5kL0tWMGc4bXcxd2FoaGtPbTlldGNOd0o2?=
 =?utf-8?B?WkdraTBONW5vM29RaXVEL0ZCaDU4VXNZUU1GTXM5T2FzZVF6aFVxblZMSFYz?=
 =?utf-8?B?UVpQL2o4eFNxZTc3aVhJQUhkcHA2NzFwR1ZYekxDWnpJR3psa1prY3R1TjZT?=
 =?utf-8?B?VER0R01UOWI1RDN6OENvajdONWFLc3hPN3c0U0ZnVEFCdVdJaFlmbjJIc1o2?=
 =?utf-8?B?TERWR0c5TnpDSGdrdEZ4bVd0ZHNVVTFZcUx0emJUUnZTTTMyeWxxTmhPV0x6?=
 =?utf-8?B?cWhEaGlJaE1hdmthSDRpSldxVVlHSFk1K28zQml0ZWRDY25kMzdQd1oyb0Vh?=
 =?utf-8?B?UHVwTGwvZDNSOGkxdnNCTU5GWmhJQytkZDNEYXZXTUVRb091SVVOT0hUajEr?=
 =?utf-8?B?Y1BoVGdJMnMrNEFKYmJXS3dONkRxbFhrSHFPREt2ZFp3RjI2bG80eU9QRmQ3?=
 =?utf-8?Q?PQLNmAjo?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c470ecc7-8dc8-4745-1297-08d8c4757cce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:55.8941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0OGDOGdti/LALdlSDA8yO3W13Ic96eXoh3348S2H4qQ9PFodieSckKcF7UZf9tcLyc8mEtFZ7OTqAMPjlZaJQ==
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
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

Associate the file descriptor for a PCIDevice in remote process with
DeviceState object.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/remote-obj.c | 203 +++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |   1 +
 hw/remote/meson.build  |   1 +
 3 files changed, 205 insertions(+)
 create mode 100644 hw/remote/remote-obj.c

diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
new file mode 100644
index 0000000..4f21254
--- /dev/null
+++ b/hw/remote/remote-obj.c
@@ -0,0 +1,203 @@
+/*
+ * Copyright © 2020, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "qemu/error-report.h"
+#include "qemu/notify.h"
+#include "qom/object_interfaces.h"
+#include "hw/qdev-core.h"
+#include "io/channel.h"
+#include "hw/qdev-core.h"
+#include "hw/remote/machine.h"
+#include "io/channel-util.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
+#include "hw/pci/pci.h"
+#include "qemu/sockets.h"
+#include "monitor/monitor.h"
+
+#define TYPE_REMOTE_OBJECT "x-remote-object"
+OBJECT_DECLARE_TYPE(RemoteObject, RemoteObjectClass, REMOTE_OBJECT)
+
+struct RemoteObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+    unsigned int max_devs;
+};
+
+struct RemoteObject {
+    /* private */
+    Object parent;
+
+    Notifier machine_done;
+
+    int32_t fd;
+    char *devid;
+
+    QIOChannel *ioc;
+
+    DeviceState *dev;
+    DeviceListener listener;
+};
+
+static void remote_object_set_fd(Object *obj, const char *str, Error **errp)
+{
+    RemoteObject *o = REMOTE_OBJECT(obj);
+    int fd = -1;
+
+    fd = monitor_fd_param(monitor_cur(), str, errp);
+    if (fd == -1) {
+        error_prepend(errp, "Could not parse remote object fd %s:", str);
+        return;
+    }
+
+    if (!fd_is_socket(fd)) {
+        error_setg(errp, "File descriptor '%s' is not a socket", str);
+        close(fd);
+        return;
+    }
+
+    o->fd = fd;
+}
+
+static void remote_object_set_devid(Object *obj, const char *str, Error **errp)
+{
+    RemoteObject *o = REMOTE_OBJECT(obj);
+
+    g_free(o->devid);
+
+    o->devid = g_strdup(str);
+}
+
+static void remote_object_unrealize_listener(DeviceListener *listener,
+                                             DeviceState *dev)
+{
+    RemoteObject *o = container_of(listener, RemoteObject, listener);
+
+    if (o->dev == dev) {
+        object_unref(OBJECT(o));
+    }
+}
+
+static void remote_object_machine_done(Notifier *notifier, void *data)
+{
+    RemoteObject *o = container_of(notifier, RemoteObject, machine_done);
+    DeviceState *dev = NULL;
+    QIOChannel *ioc = NULL;
+    Coroutine *co = NULL;
+    RemoteCommDev *comdev = NULL;
+    Error *err = NULL;
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->devid);
+    if (!dev || !object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_report("%s is not a PCI device", o->devid);
+        return;
+    }
+
+    ioc = qio_channel_new_fd(o->fd, &err);
+    if (!ioc) {
+        error_report_err(err);
+        return;
+    }
+    qio_channel_set_blocking(ioc, false, NULL);
+
+    o->dev = dev;
+
+    o->listener.unrealize = remote_object_unrealize_listener;
+    device_listener_register(&o->listener);
+
+    /* co-routine should free this. */
+    comdev = g_new0(RemoteCommDev, 1);
+    *comdev = (RemoteCommDev) {
+        .ioc = ioc,
+        .dev = PCI_DEVICE(dev),
+    };
+
+    co = qemu_coroutine_create(mpqemu_remote_msg_loop_co, comdev);
+    qemu_coroutine_enter(co);
+}
+
+static void remote_object_init(Object *obj)
+{
+    RemoteObjectClass *k = REMOTE_OBJECT_GET_CLASS(obj);
+    RemoteObject *o = REMOTE_OBJECT(obj);
+
+    if (k->nr_devs >= k->max_devs) {
+        error_report("Reached maximum number of devices: %u", k->max_devs);
+        return;
+    }
+
+    o->ioc = NULL;
+    o->fd = -1;
+    o->devid = NULL;
+
+    k->nr_devs++;
+
+    o->machine_done.notify = remote_object_machine_done;
+    qemu_add_machine_init_done_notifier(&o->machine_done);
+}
+
+static void remote_object_finalize(Object *obj)
+{
+    RemoteObjectClass *k = REMOTE_OBJECT_GET_CLASS(obj);
+    RemoteObject *o = REMOTE_OBJECT(obj);
+
+    device_listener_unregister(&o->listener);
+
+    if (o->ioc) {
+        qio_channel_shutdown(o->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        qio_channel_close(o->ioc, NULL);
+    }
+
+    object_unref(OBJECT(o->ioc));
+
+    k->nr_devs--;
+    g_free(o->devid);
+}
+
+static void remote_object_class_init(ObjectClass *klass, void *data)
+{
+    RemoteObjectClass *k = REMOTE_OBJECT_CLASS(klass);
+
+    /*
+     * Limit number of supported devices to 1. This is done to avoid devices
+     * from one VM accessing the RAM of another VM. This is done until we
+     * start using separate address spaces for individual devices.
+     */
+    k->max_devs = 1;
+    k->nr_devs = 0;
+
+    object_class_property_add_str(klass, "fd", NULL, remote_object_set_fd);
+    object_class_property_add_str(klass, "devid", NULL,
+                                  remote_object_set_devid);
+}
+
+static const TypeInfo remote_object_info = {
+    .name = TYPE_REMOTE_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(RemoteObject),
+    .instance_init = remote_object_init,
+    .instance_finalize = remote_object_finalize,
+    .class_size = sizeof(RemoteObjectClass),
+    .class_init = remote_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void register_types(void)
+{
+    type_register_static(&remote_object_info);
+}
+
+type_init(register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 619d743..cbc252f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3195,6 +3195,7 @@ F: include/hw/remote/machine.h
 F: hw/remote/mpqemu-link.c
 F: include/hw/remote/mpqemu-link.h
 F: hw/remote/message.c
+F: hw/remote/remote-obj.c
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 9f5c57f..71d0a56 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -3,5 +3,6 @@ remote_ss = ss.source_set()
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


