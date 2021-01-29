Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0451308ACB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:03:11 +0100 (CET)
Received: from localhost ([::1]:56440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XAs-00016d-ML
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvR-0007EF-HT
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:15 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WvE-0005ii-3e
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:09 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPJ1V181282;
 Fri, 29 Jan 2021 16:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=b6xReGZmaxY8ncA/p520i8jAE7csSnpeABAwQ0CTshU=;
 b=PJfsRslZoqIYFN8WpIY8+KpqPeBpcWzI0PzbnQKWJ+4Uhs6+wdgXe0wvhTSXvEBM/akf
 R6w5c1ioNbX+Eqru9cenEY/fSXbm4jL+0OevselFuK2Ug1x3/lT27PE7qHO98Kz+pQcB
 S7uyb+pcfWB+d5RRWCnLpp6qnJ3tPAL1/4baL1OHrEgfMx6JrxxAZg9jg8B9x/cTQJ3U
 SmZASqjO5LF4YaRk0XH+PwKvbsYENrH/hJoNib/wRAHb8LcBR1+Q/SCkIirK+LbDmb6V
 S4t717ocgdE9O1SbYjdtHN11qwK6n+UUHAOCgBQrQAp9EecoSjnNV0If3kUh0UwevEJk dw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3689ab2dw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPtrr089727;
 Fri, 29 Jan 2021 16:46:46 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by userp3020.oracle.com with ESMTP id 36ceugw35e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb+6jyu3StKH5i1cofIpuZPfb1ZUpULskKFdj5jw5er8O0xKUdfD0BhvJcfPnPHsrS6TMB8m3lxl2K4xYh8aIFQpXvkWb7ZAa/7B75O+Gh39FGZI01B+sXGbOiPv+LIyR3uxmzi8G0BA/FwnCfiVT5/GkRgwG0hpBtYAFdihs9HofQuXgDcTzyXK026mMy3NnYpfvqjXmKQeQEAlLRl6Rtj1gYBytMUxBaOJZTcndQwJCoUFcGTZFWuW/Am1KlcmwXx5M8yUVheKCZBDnhbGGfviDmgGGHmYFnKidJDTDrLdJjlYRscEr/qlBbQNRqLJpUjmhKMO0tT1aE+ICEVSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6xReGZmaxY8ncA/p520i8jAE7csSnpeABAwQ0CTshU=;
 b=cuGZyUKjAE97eRYgmtEWYwR0eHyr2pZcE1yLrWwJbs4K/4w24kNCjvNfzvRjAuI+UG9yOYHADwe77tJ48/KkwEqCyMq9eRS8aztX+pMBShRjU8sixdZPSnPEhuTxz3PUKhp7T2fzJ2lgFHiClgc+ZA4OE9HfklZCwEPMjp4M7egrh6vd1lGMGha0jcC43RajiJCvaDnriq2AbBwL61wVUEWjZM99TJYRJBE3QrPbGYy6gdA9NuOb3lQ24b0O65jOn2l6p5A6l11xhht6SLnm3v07aY/BdqnonTi0J3mTgxOxHjgmnb3jrWczIPt7svDYa9C0tY8SMx04ufH/mW5Q1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6xReGZmaxY8ncA/p520i8jAE7csSnpeABAwQ0CTshU=;
 b=Lez3WKjFMq8hEjNjNglGuFW676kIBnf95ULbY5cbQWkHHv+Y6QZcfUteg8r5XY/JO5O4RYZ5Rs5wiqrcd5yQ8xHVz+huRMyz9jXqqoatgsFCAzOcvQ4Yr7bdxXR0QOpPFRkRC7FsrKmfKWzNiNrqmttYXvFlEqCyojc9oYjxGjc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 16:46:43 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:43 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 06/20] multi-process: setup a machine object for remote
 device process
Date: Fri, 29 Jan 2021 11:46:07 -0500
Message-Id: <c537f38d17f90453ca610c6b70cf3480274e0ba1.1611938319.git.jag.raman@oracle.com>
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
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c19e4e1-e032-4179-35ab-08d8c4757517
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4686759DE4DB8C93A18664C090B99@SJ0PR10MB4686.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +xtxefbxArHO0DU1eEViF3qXY1TSfN3Ctp5AME69r3rK2rt5k8W2FLbXzNsbUY0Ko1ov4Ud7eP1uncYpYf9TWhvHBTMSMW8WkNdqrx3H2A4yujGmEH+5WKi9D1r18R0zmsG71VKNeXVBkjprg8z8o4KzGUoOWhNsZJYoOzTSvS8mdCFO3Dtw9m3XloHMicYg3qxHgOGu/iwjnn1ATlnMkjw4n77DK/g8aRfWBIwCC6SOCiHE3o4vn2558RvIBdPvnEL0yH94gng7L9bXfUdf0BB/7OZTsb33K8mbZUHsJuWBLJqQXPK+eRg+Rvf9libsGhIEPDoxmZJ2mBSpnG7Q5WFvwbTQDD0q64WqrMr7iDOYaOxPgkcOwdQo4lfCTW5Z0aP2UlMxvQodotugvvP3f5qerl28N6OIi+OFni0vYrcf5h9eXtD71hsnYtwytPtT+y02RJsbiCfk+mmXUP0tUZis9ddMcbP3JQS9Ybl9jq221UIGm00Daa4UaYfaqDEmlTakHcL9xdM/avFq1ZKC5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(5660300002)(52116002)(478600001)(6916009)(7696005)(36756003)(4326008)(8676002)(316002)(66946007)(66476007)(66556008)(956004)(2616005)(26005)(2906002)(6486002)(107886003)(86362001)(8936002)(6666004)(7416002)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U3RPSGlCRS9MWTIzNU9wSEdSakNmRXhka2hTb0pWbnp1M1FWeVJtaTUvZms5?=
 =?utf-8?B?YUJpcjRJejIxdDF2RzJ6WVE3ZWJLNWh2d2RLMzBOdE9YSU41MmhiRk5SeVJG?=
 =?utf-8?B?aG0zUEk4SjhMREtZWUxmQTZjOFpUSkV4bSthMEVYM2NsdFZLek9JWE1TTnNx?=
 =?utf-8?B?LytpNCtCZkVoMDRGWEgrdVFFaENsU0hwRkVKM2NzT3V4U0tFOHNnZDR0U1F5?=
 =?utf-8?B?b1hqME1lVm9HNDNXbGJvb05hWkQwakQ2Wmg5WC9VUFpudzNDNER0dmdteVJi?=
 =?utf-8?B?TlJXL2wxdkoybk4rRWFaaENrUFRnd0R1ekN3dWhrYXYyTEJYemk5V05vUi9Q?=
 =?utf-8?B?bW1LaG1oNWZia3ZZTS9GajNkVUpLY0MwUStWUk5oelNLR3ljZ2s5VVBHVHNw?=
 =?utf-8?B?cmVDYjdQVC9VRDJNczZTM1JBck43UkdGR0hjdzJjdjR0WnpPTGsvcUxzL2Qw?=
 =?utf-8?B?a0VXUGFZMzVVdjZlYkh2R0h3UHBjYmJLZGs5RXBsR2pYd1N1L2gxS2xNckxL?=
 =?utf-8?B?TzFwWXdUNEtrVXZTWkFiNGdVdExDeVNqZEthdlh0QWJtMVVQd3ovS3E4dUJr?=
 =?utf-8?B?eE1QbUpyNGgzQjZENmVvam9OME95akdRY0xhdFkzNFdFN1dtY00wdVBaZGZa?=
 =?utf-8?B?NUpIZVhUWnZKSThRZE92VEtoTDhHNjlWS0RvcTJpQ2dnOE5sd2NpNWFuVmFW?=
 =?utf-8?B?aUFvQ1l0cFNTR2tSdlFXaWdwN2ZVMlh0NTQ3eWJmRDhBNnZZK3dEUDczRnZE?=
 =?utf-8?B?UTVFdUNVWUtkTlMrWGozVk5GODcrdGM5cDY0bEhMTnNqRlVtQ2FBSkxrakNm?=
 =?utf-8?B?eCtWbzZ4aXFyNVU3dmYwbENjUWVHRkFETHVBTy9qZWVrazRBajFOQ1F5TEhX?=
 =?utf-8?B?RWNFR0dlcVcrSkJlaHVHRkNQenFKbnhYL2tsenZ0S3pMOFMxRVZremU4dWJn?=
 =?utf-8?B?RGxKMzNUTkZ6ajZTTG5XNjgvUFlPT1pSYWM4Ym5KWTdEa2xXNmphbXVMUmJE?=
 =?utf-8?B?d3hrelV0MkxzSEZmUEdkOWRJaE1YRmxZR2JxRUJvR3QzWEpQc1BrVVlHZXN4?=
 =?utf-8?B?ckZrT0Z0U0pPQWQ4WHBnY2hSd0JLWXhNSisydmVnUGNSNHRvaUt6cVIySHk1?=
 =?utf-8?B?QzlUck9penRlM3FYWWZjeEp0Sk1UY3d4S1MyT2x4RXJKWjNCMlZOdnFuclF0?=
 =?utf-8?B?eHNSR2U2YVlocHJRL2s5LzdmaW9uY3RlcTE3Q2o3cVhLcmpCVGVQTWt1bGFu?=
 =?utf-8?B?K3dGYzZUQ3ZUUEp4MHZxNXlCTGdGOWlHMWZjTCthZGZZK2c0NldhUld5bWFF?=
 =?utf-8?B?ck1veFAvNXZUS01RWXBwWTVHYk95cXdzU2ZXRUo5QmpIeW10ajZsdCtWZlAz?=
 =?utf-8?B?Y21IWUYyRFpZbEZuVkhidm1CQ0tURGM5dFMyclljNWtsM1pDczZ0Zk5QTGdw?=
 =?utf-8?Q?gZMnyHz7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c19e4e1-e032-4179-35ab-08d8c4757517
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:42.9886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ID3v8CLBlpFNYJMI2abt2H7N86sWyod5F525q7nnzwKiwdFfD77asTmn3TsfNvE8KrbZske+a1jCkmwKpBgUzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290081
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

x-remote-machine object sets up various subsystems of the remote
device process. Instantiate PCI host bridge object and initialize RAM, IO &
PCI memory regions.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/pci-host/remote.h |  1 +
 include/hw/remote/machine.h  | 27 +++++++++++++++++
 hw/remote/machine.c          | 70 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |  2 ++
 hw/meson.build               |  1 +
 hw/remote/meson.build        |  5 ++++
 6 files changed, 106 insertions(+)
 create mode 100644 include/hw/remote/machine.h
 create mode 100644 hw/remote/machine.c
 create mode 100644 hw/remote/meson.build

diff --git a/include/hw/pci-host/remote.h b/include/hw/pci-host/remote.h
index 06b8a83..3dcf6aa 100644
--- a/include/hw/pci-host/remote.h
+++ b/include/hw/pci-host/remote.h
@@ -24,6 +24,7 @@ struct RemotePCIHost {
 
     MemoryRegion *mr_pci_mem;
     MemoryRegion *mr_sys_io;
+    MemoryRegion *mr_sys_mem;
 };
 
 #endif
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
new file mode 100644
index 0000000..bdfbca4
--- /dev/null
+++ b/include/hw/remote/machine.h
@@ -0,0 +1,27 @@
+/*
+ * Remote machine configuration
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_MACHINE_H
+#define REMOTE_MACHINE_H
+
+#include "qom/object.h"
+#include "hw/boards.h"
+#include "hw/pci-host/remote.h"
+
+struct RemoteMachineState {
+    MachineState parent_obj;
+
+    RemotePCIHost *host;
+};
+
+#define TYPE_REMOTE_MACHINE "x-remote-machine"
+OBJECT_DECLARE_SIMPLE_TYPE(RemoteMachineState, REMOTE_MACHINE)
+
+#endif
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
new file mode 100644
index 0000000..9519a6c
--- /dev/null
+++ b/hw/remote/machine.c
@@ -0,0 +1,70 @@
+/*
+ * Machine for remote device
+ *
+ *  This machine type is used by the remote device process in multi-process
+ *  QEMU. QEMU device models depend on parent busses, interrupt controllers,
+ *  memory regions, etc. The remote machine type offers this environment so
+ *  that QEMU device models can be used as remote devices.
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
+#include "hw/remote/machine.h"
+#include "exec/address-spaces.h"
+#include "exec/memory.h"
+#include "qapi/error.h"
+
+static void remote_machine_init(MachineState *machine)
+{
+    MemoryRegion *system_memory, *system_io, *pci_memory;
+    RemoteMachineState *s = REMOTE_MACHINE(machine);
+    RemotePCIHost *rem_host;
+
+    system_memory = get_system_memory();
+    system_io = get_system_io();
+
+    pci_memory = g_new(MemoryRegion, 1);
+    memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
+
+    rem_host = REMOTE_PCIHOST(qdev_new(TYPE_REMOTE_PCIHOST));
+
+    rem_host->mr_pci_mem = pci_memory;
+    rem_host->mr_sys_mem = system_memory;
+    rem_host->mr_sys_io = system_io;
+
+    s->host = rem_host;
+
+    object_property_add_child(OBJECT(s), "remote-pcihost", OBJECT(rem_host));
+    memory_region_add_subregion_overlap(system_memory, 0x0, pci_memory, -1);
+
+    qdev_realize(DEVICE(rem_host), sysbus_get_default(), &error_fatal);
+}
+
+static void remote_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->init = remote_machine_init;
+    mc->desc = "Experimental remote machine";
+}
+
+static const TypeInfo remote_machine = {
+    .name = TYPE_REMOTE_MACHINE,
+    .parent = TYPE_MACHINE,
+    .instance_size = sizeof(RemoteMachineState),
+    .class_init = remote_machine_class_init,
+};
+
+static void remote_machine_register_types(void)
+{
+    type_register_static(&remote_machine);
+}
+
+type_init(remote_machine_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 49e81d1..5c032d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3190,6 +3190,8 @@ F: docs/devel/multi-process.rst
 F: docs/multi-process.rst
 F: hw/pci-host/remote.c
 F: include/hw/pci-host/remote.h
+F: hw/remote/machine.c
+F: include/hw/remote/machine.h
 
 Build and test automation
 -------------------------
diff --git a/hw/meson.build b/hw/meson.build
index 010de72..e615d72 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -56,6 +56,7 @@ subdir('moxie')
 subdir('nios2')
 subdir('openrisc')
 subdir('ppc')
+subdir('remote')
 subdir('riscv')
 subdir('rx')
 subdir('s390x')
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
new file mode 100644
index 0000000..197b038
--- /dev/null
+++ b/hw/remote/meson.build
@@ -0,0 +1,5 @@
+remote_ss = ss.source_set()
+
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
+
+softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


