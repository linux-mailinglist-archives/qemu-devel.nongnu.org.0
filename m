Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135FC308A90
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 17:53:03 +0100 (CET)
Received: from localhost ([::1]:36298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5X14-0000hX-0e
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 11:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvA-000792-Rj
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:46:56 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wv8-0005em-HS
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:46:56 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOgsd121634;
 Fri, 29 Jan 2021 16:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=hosYQD9aLZUvE8vMB6lhIDoJn77Qi4YZUI5H8AXf4Ak=;
 b=tSTdj/rG5KnjKtr0HMttXFjly3t6W/zaYLJlSaRtdMM3TknOnulk7eFPDk18R+RTAGKP
 JMueAkXXJ35u8cMEXpljDazjpLBgbnxIeI64qvGi4drpYfqA9UcEqCjKUJnLPzucsQo0
 B5o4nGZTKbM8eTxFxHEVvp3fgc4qbPd5BDYT9DmgSbxtWTW66lPsu8eIfLv+TmO6Ue58
 T5ON7zveCJNmnjxp+kg0fF+/ca4ECQJ+b6wqbY+TFQYVmhclxLffiCC9JW7zi0VgTM/g
 0yj/z4FLCxHtVG87YvglJ3JmLHiHw9YzXixIydxMZYjGyARHhIDVisAUB8Jzh9wAMOI2 0A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 36cmf88j1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGQJaO039857;
 Fri, 29 Jan 2021 16:46:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by userp3030.oracle.com with ESMTP id 368wr25amf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ec8ygrWX+jUr+MjDIczE4gMeYLCaVcLGMWS1k+Mq7u0kDLIwwM31GuR31Xe5aSOzBuXV+MTgDAy+zsRboNnPEakEZ9A75b1ckmmqgWq6qOHPr9avkNB96szgO5UWtzUrFwsQzXpmhDl/u2ao5AdlRpuM9mjnSlxFxq4DGxUNjyHBK5kaxH9CvjqHnpx1oqztIcpXZSUjGHC296+w3Wxto+DAr0adLvJORyXo7I86KHwyICynVud8UKKA+DWDKJYs2OgBTctBzLIR0onRbuRnhV9s7EfxF819OuKp+jj5gd63oeOFYauii8iFjXfnixyIdUhwznz5SUYP6B1gFPx2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hosYQD9aLZUvE8vMB6lhIDoJn77Qi4YZUI5H8AXf4Ak=;
 b=JMC24fK/3DbgcOyD0qSR5Bxe249E/8OEa114OOgFmQ431qiP6unDOYcw4El+uKOMJN46c1eTiYGMYhkriE222//SPBdKVNqNz8O+QYJxt1IbKH/UKurtCbkCtaEsBJqyoAPnmxJ/DEMxodGSXrpNarwdMKsMM8rp0C+SeH1hmqHZnu41MUR0+WVhoMOyL+s//yA+7s0s0WHGrmwHpUAU1+A3FzEiQyyiXyOp5rKIENaSKaPV0wj52fvm2+htsRtN40RWY9xBST/l1N0eU5JNg1VF/lgJ3aoRm+bE8W+S7522m4u22EAgUMh/hER1LauKgDmgU+WlUyQgd/CULE2Kfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hosYQD9aLZUvE8vMB6lhIDoJn77Qi4YZUI5H8AXf4Ak=;
 b=KqqKKvt4BRDTKB05amUcLlWuEqVsl61ihO+yFxpsfulSIhNaeu6OZ+fJbzQE64SqI3edr0oUq/5ZymZdfAJ7G1W+fmWLyJcbd0DNyr6FZvCXFCQjMR/GWzxoEru4O/hIgZeTU6giRCiVs+5ActIYm2UQi+LsNSR/ifId4X5Rees=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 16:46:40 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:40 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 05/20] multi-process: setup PCI host bridge for remote
 device
Date: Fri, 29 Jan 2021 11:46:06 -0500
Message-Id: <0871ba857abb2eafacde07e7fe66a3f12415bfb2.1611938319.git.jag.raman@oracle.com>
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
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fedcabb-5965-47a1-3835-08d8c475738e
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB468621D859E96C557C49953690B99@SJ0PR10MB4686.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mlgJKf65tX0Y6IzClt3RDAfoXkiYW6iv3wiaS6g9lrvi9gk4msHtyCPI35rYPwJWfFBrH1sPJk8qCDdvUj+cQquCHTD4sEiV3Or+opUTevTPuWcI27ZNoi7vvoDaNuiUkrk9KGAyFwRkiK1HL5XSQLU9HrSHRLH69e/VohrXFLW7Kof5g+Z8pkJdIMg2pPd4h3GotwjyVxjYlCh1Mo0nwVgeEAsWxqQt5iWT9fCRRNr2e/2/PfBBI3H+CbsvjkObf+w2mCr/1v4qazATsawTslg6ltGbfJe7DFp2yOkNgtRrWTiDJwTKN4rkd73NAClGGGFc/S8bXKt2ubXEMi5BVzK4X+K7beWxS9hbUIwBtWFOvAtMQLqXSSY/pI17o/5rwrWmS8gO263BGaURVnCWiKfMW4ijZUECsL8v9hoJdizM+GCqA7asp5JhL9qUSt6k5wI5vs4e0uZxNsXqFLArMM4weH0AyCHVSzdwzwh9fj8uhx+RPZC+pKVwMfKOBXtifkhbqjHMqpeLWZYBoiPmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(5660300002)(52116002)(478600001)(6916009)(7696005)(36756003)(4326008)(83380400001)(8676002)(316002)(66946007)(66476007)(66556008)(956004)(2616005)(26005)(2906002)(6486002)(107886003)(86362001)(8936002)(6666004)(7416002)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MnQxZFZwd0Z2S3dXK2lPVkNPdFRBM1M2empoaVk2VnZKNHArWVF0YzlMS0I3?=
 =?utf-8?B?Y2dlRzk0cExsZGxQVFd6TTVTUy9uU1NUaXA0Nm5vSjFDSXJvK0hsSm16a0VY?=
 =?utf-8?B?SGthMDUvMWRCZDhYd2Q1TmNJSDE2cXVwNENaQmY2T01FOERUVWVBMmhpUE53?=
 =?utf-8?B?c0ZyODAwVFV6UExleUZCOEdqSUg1Y053S3BtcitVYitxcVJHOWhRaXFlak1a?=
 =?utf-8?B?YWFjUzVreEpWYXR6WkdMU21vWDNUelQwTVpxM3JwL2dqaTVJUThjU3NZditO?=
 =?utf-8?B?ME5TYlQ3WmJpOEZKbThHdFpkTCt1T09lbTJxL3UrcjZraGd0Q1hLU01YRnht?=
 =?utf-8?B?ZHFrNFViclZSZGNGMDBuMVJUb3FVYko3K3lrL1RiY1lEV0p3c0dGT3pxRzBv?=
 =?utf-8?B?a0ovaExPMWowVEdQTWkzbUhKckpaajNqRlZSK0NBWUlKU2JHOC9kTnUrWmYz?=
 =?utf-8?B?WWc2dnc4MGRXM0t3L2RJeW5WcmMwQ0NCNXFhZDRNR2pqdFRESXVlTUpJUG1o?=
 =?utf-8?B?QlA4cnB0emFXRlhWRndVYlEvTzBEUHNWY3M2QjUrSmNDQkFUK3VnK2hnVzJE?=
 =?utf-8?B?K09yNXJFWEF0bmpoS1VVM05aQStXd2lEdGNRTDFEcDRLQU52VlArbzJDNTZy?=
 =?utf-8?B?c0luUVNHbW40cjFzQVB5dGVrMnJ2TFFHZnJ0YlZvQTRNZ2JBL0VORHdiRDBv?=
 =?utf-8?B?RVZuMFFFK3VNeGo2VkRCeTNybEVodXNqd2poakdOdW9wSjJsOHlMYy9scW4x?=
 =?utf-8?B?ZXh0TzFSTU5XbncrMWRhSDl6SEFsbVJWQlFsbDZzR2djeGY4SUh3aHhFUGhS?=
 =?utf-8?B?VGgrSUY0akNBU3lWT0ZNS0lHSU4rMWpVcVgrcDI0WGRiZ2d3ckZGdGk5SW1T?=
 =?utf-8?B?NGd0dnROSFkzZlBtTVBTclZ6RWUrZHo4YW03NTRxd0JCRytpa0NyVDU3RVV1?=
 =?utf-8?B?YlFTRDNaZFdaZVhFbGdORTJPa0ZaelFRaGNtOC9VbE10cHV5bjVkYkttYVVO?=
 =?utf-8?B?UXM5MFFtdmZ6UHhaT2xBS0EzQjZEWjlIaXpSRlgrZlFhUWdsRk5kTGhKdlo5?=
 =?utf-8?B?bG5IN1Q4MGhINHhxRjBDaEg3cjRmUGQ3bGxXVFN1WVZCMjVFcGhZRDMxbzNO?=
 =?utf-8?B?ZkN0UEJpd2EvM1JCOUdlVFU5MkF6akEvdGZXOFhXZW1CRGdrYzhZalo0TmtU?=
 =?utf-8?B?N0o5VU1rN1hJVE16MXJWUXNJdlZHMjhTR2tabDNPSHhETGVaak9ZYUhtZ2po?=
 =?utf-8?B?NHg4ZjZQRVQ5c2xBakxmRXZ3WGNML3ZwNjhyanBkODFHdTd2LzZoblBpVzZu?=
 =?utf-8?B?WElyT3FjVy9lbDRDZ2JVcmplTUZUYkN6Rkl1bG1MR3g0Zk5YcVIyUzk3UXE2?=
 =?utf-8?B?NUVrWGZuWlllVFdhL0NGNGNvbTJaNjFIb2o1STJZK1BXV1NqMzA5VzBkRzVK?=
 =?utf-8?Q?YedKz1HI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fedcabb-5965-47a1-3835-08d8c475738e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:40.3712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFUJt+Hk5NMEevhhYrS7GM3WjLxBk/rsyHlgfxgaopVct35JyURM/MpnAsjptQCpnn/xWBDg4yodzydq++2PRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
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
index 1f84956..49e81d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3188,6 +3188,8 @@ M: John G Johnson <john.g.johnson@oracle.com>
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


