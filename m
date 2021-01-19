Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930F82FC1C8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:04:34 +0100 (CET)
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yAz-000475-Jn
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcp-0000zV-05
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:15 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcm-0000Eq-RU
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:14 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKOBJa003091;
 Tue, 19 Jan 2021 20:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=N0GNGvHs9TRNBlocD9sV2QNxgHrdfPGGDai8hIri/+M=;
 b=ySF3qomnfqrjEgzwO6kr3ykfywBGTw39tUzp8l8bZbsUsADSiWczxGjxhf70LwsW9qtx
 iSwhOfJqHVae9oLL5Xxo44qSIwzc6wuCIeXJO1LVHWMy4xTPlPURBgN+4TBXU67uNMwi
 nezbwia/bgRcza6norXNqK6Gu8zjduADmcVIIx/4JpaVc4ppY2d5+2mqRsn3VZ+awEh6
 PFo8qFj/bYDWlR+tWYPORBBVR/6u+u6RTOnlBJzWIhakEkP9CX/EGC4xJFrI3EIdhk1W
 wBY4BPxv5z3Zqz03TmWucMcgenQoQCo5e3eMfQGpckZbIcMb0gzqZP4jjEWyz5XgQ+OJ hA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 363xyhtasf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKQbKw117373;
 Tue, 19 Jan 2021 20:29:03 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2056.outbound.protection.outlook.com [104.47.37.56])
 by aserp3030.oracle.com with ESMTP id 3649qpu8ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCOn5urEWxcZ6GVMyv3Os5K6KT4zmXeabX9BOFBZ9Th6jZkTGZHDMBA/Y9EhtxZiY87muI0EnQ5l/QO+UGQAhJSYN9oQmK+8qX24U2LwlMdVWFSFvc5Y+Ge/k8fQgbUeczrtX5HtU/4pCDVd8tSPurqeMzSL8+0EJSZ25Xy/AO8X12yf4TSK9KKznK4/4z+6E6qPtwQx0k9uim+NvjhXGg8sJjxiWKQyfMpi4JZ+KU+dQjCZCLAfX1jX426QE9uPARqtI/nYzsRyiAzBKK3Q8rMpG3Sspws/I9x8DB1rfAaDQlB5IAimyEkeDCqdr3fLeJCT++vEIcR+YG74HqKLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0GNGvHs9TRNBlocD9sV2QNxgHrdfPGGDai8hIri/+M=;
 b=DWgdrtpnHQAxFWGsI9UjvL0rh7HPEhx7fncmMMZ7Zk1y4TBH2eOrLMiFDKdMNQ5TpdJZzkVhfh8mvEIN9Pmo2VS4Ja9CkxkAf1pApzM7FAdssVzwI/y+lGxECVfwo8N07YIBQGj5LFiiqAVb9Y3XslGJP3HnC28CucJ5vpWcyKviL//B3PX9dV0ahdUYKxhUI0vkXuvmLbfD9p/7PoiepWK/m1eOqm9/Pkgl/6UelW+lDbPEns9ZCR9jp8qG6u5DKQAdqZ8N4e0eT1CQ7cE3W8m/wZcKx/clgKXFztfR+LRPlZjSexww0vqQ1PQViXzMNjV5Zm7iUcq5WKthSy6yTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0GNGvHs9TRNBlocD9sV2QNxgHrdfPGGDai8hIri/+M=;
 b=BERnFXd5LzLY/N+gvmlTNDRxfMqfE/sTer0A1AWnwv7GhW9eOyVOCKkoaYPDUF4l4YoLcy7wXo3MDCQc4xhrAJDqPgIJ4fMuIysmtKlv7oSuJ8u4OB9eqwopvM3gOmcZFybtQHM6cvuClXkrdPMvHaG9z/6Oi4N0EWhToSZxjh4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:01 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:01 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 06/20] multi-process: setup a machine object for remote
 device process
Date: Tue, 19 Jan 2021 15:28:23 -0500
Message-Id: <696cb01059efb127949c475bf2234f8d74b79bf5.1611081587.git.jag.raman@oracle.com>
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
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:28:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dafabe0-221f-4076-6807-08d8bcb8db2a
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB33497B34BC79F5AE66F9816A90A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tKUWp/lRhvjcT4L274Z63ppjAo2LLNyr1mdAWZsES0s4JO+q4N9tSYrEumi+JMZV12X3LO/AoGRhCtFyFMEhT4MOQCcFcTk0y273hayljUQHch7apJ80llfiCp5KEe4Sr69K5f3uQ3KtmfWjwVe26sO96hz5J54sGWxUXYP7X3Cmlckc+ykatDZnsWLXkzCEXPMBOOIsABkhV9EQZ91NpdVu0ReUb3S3L/C/0JTtCd6kqQJstiehlOJ2cnLnq9xJsIBkuN9vPsK27HLkYkorh6aDCE1b2+PBLwlWPtrEJq7Q+N9JGtKjIaoLLGSm7tSbQTVJqG1ZNbDj/YCSCNuxCmm0xzw6CknMZV8otoUo5uoU0bYx7+7lFOmheZKzo12YNRonleLQtqVeE9z9+qrh8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c1J5NzhLLzFUZzNGU0dVTHY2K3E3eE4veGRDV1VjZXdNNjU0enByRkppazRV?=
 =?utf-8?B?VHNhMFFpOEhhSFBvd09CNjZkdUxFTVRDbE1udVZqYnRPdy9iOEp3dVMvQ1BP?=
 =?utf-8?B?ek9QM05vcExSMzJpdGZLa2NYSEE3TmdDelUxSGdBMm1hSUtFQ09XU0E4b2ZQ?=
 =?utf-8?B?T0xXS2pQOFVlazlrNjRJYzdhd3FJSm1vTjVwQ0grWmZJMS9RR1d5dUZGeFJv?=
 =?utf-8?B?QkRnNWhFMjFqKzUrUlBoUGJBSFh0VklIUXp0S3dEU3hlWmhhaVFXcnlOZ1lN?=
 =?utf-8?B?SUY1QTJPN1VqNTVKZ25rVzJpZEJLbzhUamlMQUdPQ1lHZi9jaWlwVnkrS28r?=
 =?utf-8?B?WmZldTg5bXc5eVVwK0lZNGdoUDVtRlYxeFRUMzFsT1NJL2pSZ1hmQUZxazZq?=
 =?utf-8?B?K2g3NURkazBiSUNPRWZMeGVjMW40QkVPNkR4dDA2UTNRNzFmQVpOZUpMbG5h?=
 =?utf-8?B?OXZrUGlCQjcrRWdMZTcyRG5jbWc4ZVU5TTdXL2pmMWIrRGR3SnFYNFJwVXMy?=
 =?utf-8?B?dk00VVNranBRSFhINTV0VVNORlAweXRLL0FSRHJpTkh0bEZIcHlsbGZ5ZElT?=
 =?utf-8?B?bW5rSStKd09TQlJPaS9DanhzTWNMODdGbUpEbHRJTHd2YllnWWxsbGZvZGtp?=
 =?utf-8?B?UnlONW1FZUpsM3NVRW5MaEpwTG9Db1pZMExqUnZDYWJrUWYwM2N2UkVObzRl?=
 =?utf-8?B?aXhkM1JaaTd3bzJNbkNqOG1SeS9zRTJBNklocFdNSk0wTFg5MkdISmtkVWd0?=
 =?utf-8?B?ZlRrT0ljK3duaklac3NHOW1aME1FYkwwVk1ObEpMWlFsT1JZNXY5UW5GSDhT?=
 =?utf-8?B?Z3BKUFp6TmdhNTUramw4dWt4Nmw0YThhMkZWRTVWa2t3VTVXZERSZGJ0TG5u?=
 =?utf-8?B?Zis4YzdGZEsrUFhrQytoM1k0dWIxODA3MUZ3bXUzY09Wd2kvNCtyNTJ3TW9G?=
 =?utf-8?B?Z3dZZGREb0dlKzBwV0hLZDRFSEVDQXN5VXh3RHZKbDBzODh5VytBOWdvTEll?=
 =?utf-8?B?Y2NUYVB5RUgrZytNN0tHRWFXSko2Z3ZFbmJmcmwvL0lBMEhZS2lXa3dycENk?=
 =?utf-8?B?SG5IUWdIeU1YYVVvVlczeExyMXlmU08wWWROb3VlZFJuaHBpZm9scDlWSjVh?=
 =?utf-8?B?MWQ4WkFJbGhhYWZmRG5KenpmSnZDMXhHZUppQmxMRko0TU1Wd2NvTkF0T285?=
 =?utf-8?B?U2lpaThZNm9SRmtxTTMxbE53NmhjdHVvSGNodUNoWkxLcXFoOUk0SnJpdFda?=
 =?utf-8?B?Y3JrOGNSaWMvZUlHZ2hCU2pHUUhzS2ZRZXlWNWJtRHY4M25MbS9pWkRUWUls?=
 =?utf-8?Q?zZHQZhWVOX6p4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dafabe0-221f-4076-6807-08d8bcb8db2a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:01.3147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4Xkg2Sh/D1FGYoFR0y94djvv7FwzsATylNIS8wCmBwaIOTiTlwvQjXLLSykepikfvNSDG8BzsCw2xFBWUtyKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
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
index db50cbf..3f01a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3191,6 +3191,8 @@ F: docs/devel/multi-process.rst
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


