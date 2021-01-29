Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC18308AFD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:13:42 +0100 (CET)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XL3-0004Ao-F8
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WxP-0007y7-3J
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:49:15 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:60918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WxH-0006LW-AF
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:49:13 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGO0kR130096;
 Fri, 29 Jan 2021 16:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=eUVxYFvu1Tu2Npba8+MmCoAp4tqpZfuy6yUJjiKwyRg=;
 b=qKHJgcWX2oi4f3ePFbOHz6X9HiaqU85TLCdixfBBSO7ADeE2Q4S8AinmQylV8kfIbTUm
 htUaEUOB4FI3YX2Up1RjVcCcVHDL+aSp4rAcbeoEydRUq9zFzr8k2n3KhCryg5rlU0pj
 ACX6enzOeAxlDeNSLqbduEuSbfwW4l/Oi8//RRrJUhoNkzuIcu+KLO320aaMRJbyTEEG
 3+jhQ529j9R+B6lf0E2WOJ7RTmSs3XwOzU7alocoV9OdtnA7JDJ2ufooKE4qlASnyTQ+
 4kbVchm6QgC2DVACYWQQJmr1mi1R47Pa/ADDTQ0Ql4AsJFxa9phqFSxIT+FGF71lK6I0 tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 368b7ra9rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:48:56 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOhnM083811;
 Fri, 29 Jan 2021 16:46:56 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by aserp3020.oracle.com with ESMTP id 36ceug42fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPtdHow3hi7yZ7shLinq057Q68Q9R+TfTCMTvOMNUzwheViKWHqyvCpzt+13T4F9Eco29uvPZ++jHU4qRe/THTxUr9aqzCxzw5QJhqurVjCc6he+IsDx9T77pgIPSRa6MrNPVRi9xhWRwN6FBMuS2Oi+nU6Cozn2V9atmn1O8icdLZN5beaFh5BKeAWVFoQvwb23s/R1G6ZcMd0wO4BK+cs1s3Shog4HjJh5BmpOJ+ErJCYoXIPaYy76+gpRkcSYirL0pyixChLZZ2kYNyzibWeHWEZtFuaNzRJWkTpvLm3x8vfQZQafbUbZCrv8MUcU5GbcIEeSLYNUq+j1bzkpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUVxYFvu1Tu2Npba8+MmCoAp4tqpZfuy6yUJjiKwyRg=;
 b=eYcC2IMedpeD/KB10mHkObZf5y8c0WsdP5zWOMtulJETu6Vdyw1GQb6CdIzvfGp9K4kh8gRe3p+ENW2kJXu11D9wAiDqQHFvSF7uqOt87SD+/Ktchxq7GvEb+1Pk2RhgTPLIpPXw6FTLVThq6Id9bqIR+0+xYXrKW4MDKqxR8nQLyLf7jfHeLbJKIK4R3IjtjCysnp7v4//MWFkPZY3O0/kR/0AyCpVkWc2Sg1MTII28ZfR3Cy6KO3KAhYI1K2kp8scEq2fmMAHrfvtD0rrfes1h3voQUeOQZpr+ghoYG3kCYMrsXXvzx+NuqeAjRCOpgiqDIdmhXKJCCSmf8oNvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUVxYFvu1Tu2Npba8+MmCoAp4tqpZfuy6yUJjiKwyRg=;
 b=LVLjGdA0osLru6iVZaifsfFeBSfvB/uVAbuOGf96u+KJOVVA59sQSWKSt0k25yFJ6/FgXcYy0NNSzhu0jaO+KHv+FpmKUdWWmg029oijpUZnd52/J9E3XNUcbkGx6rjbUEiDn0DvqzdkgtbLxcQqIiIKX5RV1LhlMvNGRYq6knw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:46:53 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:53 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 10/20] multi-process: Initialize message handler in remote
 device
Date: Fri, 29 Jan 2021 11:46:11 -0500
Message-Id: <99d38d8b93753a6409ac2340e858858cda59ab1b.1611938319.git.jag.raman@oracle.com>
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
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f004ff10-2eaf-45a0-1d70-08d8c4757b4a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB46714F98FDC0F9140658BCE190B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cqkr8QTwj1DTLf3AwMR+7RJ/e1dZDpaYxz5R5qXpCKczlf0ITskyoL6uAk3434YNusA3v2jJs8ANIsyRhm1mlCNXjTejmDqVN4V3HzdSdTxfALPI5DIFzZIsCeemfpAK9HYwG5ILChPH0mWlhr7U0iR0G2yn6x6caaAF03pZIuydEI9ykeC9+oR9OezbZRQMkTtOoiaOfMYciz5Bpp5znYDXySYMMQXlLaqxsGZUv6+06v7WjLjIwfuYoD+vsm82FP6z7FtVH33QCPCDCAs1JCI0SMXgv4eWEzkKlLJ54myytKfSgQFMvn6KKCQAB1HBL8cQsqnbhkE0KZSVGWiri/O7q+XylIHDUvUeA6wbAkx76U0974vvAFg6zPpQJxOudl9GE1+j5fut22QtEdrwnPz0ltpjxhKr7oL6P305bT/k98xE6W0Gx8+FLRhj9PFTtrHz9Quu+5YSsH5aO9fRVF4dqMQk8Hawt3iYA4kwhJ4ASIkBTpOKWTzMat9dJJd24LhkHeyWNJgyzm2TyHBYEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(15650500001)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0Jra0Q0eDZpV1FYOWJrMlBXU0treE1jSzlHZEVMTHBPVUJCSkJCR0JxdlJN?=
 =?utf-8?B?QVp0bUg1NHZjdDB6YmtueE9XQ09xZW5qb1lrdGQ0TGF0dEhuYnVja2xrUUFn?=
 =?utf-8?B?a1BacnBEaElNYXZJOW8vQmJDSVRzTWtvZ2FEa0R6S3p2YlBpL09kSjlRSUpo?=
 =?utf-8?B?OFZ2eGROVTVhZjVzdXNyU3VCakNPWktNL3puSis0eGhudE05WFJrQjJIekVs?=
 =?utf-8?B?cmZmQjBJTHk2UmlWbFFhcDZjRjlhbnE2V3h1NmFnTktHUkRaQlh5Mkk4N1p1?=
 =?utf-8?B?bDdoelgxbHNXVmhsTjlzRDFBY0l6S0FTN3RxSVN2azRqSDdHR2xQcVZaalhE?=
 =?utf-8?B?OUlIK3ZVZ2RsNFhuc082R1N4UHUwMDJndU9hRFlNOHdGcWJYWEdhbkwvWGFo?=
 =?utf-8?B?TmlPaE1DVXp1dkh1WDBQeCsvTVEvYWhITWZpQ0pkbnJSSElsS0JIa3VPZ1FV?=
 =?utf-8?B?b1VZczFOMHQ1SnRQK1hqOW5NN1FrNVRLYlJiSDRmMGl0eUttSWhhY3dVVWw5?=
 =?utf-8?B?c3laWDBTQThmY0s5S2NUZ282cmJZcGMrV3pZcUV3UllxUnVYMUNCa21ueEJW?=
 =?utf-8?B?UzlqUGxlNnhHQ1pPTW8yRXBFU21rMC9ETEt6Q1YrRlVUcmFMU0EwRy9sSy9P?=
 =?utf-8?B?QkFHNGcyS3g4QXdTMEM4cEViQWN3NWY4ZjVOR1NDeldMMVF0bU5BN2g5Snhp?=
 =?utf-8?B?Ly9lMEdoRmhhV214eEZPdnZtQ3BHeDdmOE13Uy9MWU42b0Y5QTQxbGlxMmhO?=
 =?utf-8?B?UmN4cTVIUTRrTG1acjY1TUVacmNOL2I4cDFJRGRPVi82Zms2SXZ3L0lDM21k?=
 =?utf-8?B?SGdrZ2Znd054VkNaRlVqSk9xTlRDRmF0cVFqeG5YNVBWTUp2b2tYWjl3WEhu?=
 =?utf-8?B?WnVES2ZLV3A0b0FjNERzTkoreHVTekJpQ3l6TjVqTitTakM4L2ZaazN5Tm00?=
 =?utf-8?B?ZklUNVBsMnlQY1ExNlBWSThLckxvT3l5bWVwZDdOTmV2RTA2RWZacVErNTVV?=
 =?utf-8?B?VnRoYzBGRXFxLys5UW1vNVBMa3VEcytvcW5rRHpseE9lY1AzZDF3aVF2Ylda?=
 =?utf-8?B?QmJKaFV6cnRxTHNsRkIzVmo4T1dqcjFtUy8wWXpLcUxRenZLajk1VHRGd2pJ?=
 =?utf-8?B?ZzNxQklNR1VBUlFxTVdvbjRKaHgvUXhBcXQ0MDUzSTNoRE91M0ZRaXE0U2Vx?=
 =?utf-8?B?TWtla2VCREJRMEcxeXcyanp0UlFuYTFaL09HckI0ZVpQOHpxMkN4Ym1mc0tm?=
 =?utf-8?B?Ym9RM2YxU1YrVzJ0eGNWWWR4N1dHVjNUSUEvQndla1FwdER6SmFFOEE3Q2tL?=
 =?utf-8?B?cklGTjBEVGhyNGVLYVhWRlo4Zm9IMmU2a0g0d1hITHpCckVWTnBSbWhZTmpD?=
 =?utf-8?B?TVkweks2MTZiT1VtVjNIa0VwZ3VTb1ZGTmQxUlNnd1FWR01JZkZaUDlpMG9l?=
 =?utf-8?Q?TVjjrLys?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f004ff10-2eaf-45a0-1d70-08d8c4757b4a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:53.3516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vbzd1yWnkk+y2LDSINMF34xzo9U6GyyojhWsr7k8H9GL8K54u/qANd2lvuKyi5IWBu8S/J6fCNqqSOQgA1yvaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4671
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
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

Initializes the message handler function in the remote process. It is
called whenever there's an event pending on QIOChannel that registers
this function.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/machine.h |  9 +++++++
 hw/remote/message.c         | 57 +++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |  1 +
 hw/remote/meson.build       |  1 +
 4 files changed, 68 insertions(+)
 create mode 100644 hw/remote/message.c

diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index bdfbca4..b92b2ce 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -14,6 +14,7 @@
 #include "qom/object.h"
 #include "hw/boards.h"
 #include "hw/pci-host/remote.h"
+#include "io/channel.h"
 
 struct RemoteMachineState {
     MachineState parent_obj;
@@ -21,7 +22,15 @@ struct RemoteMachineState {
     RemotePCIHost *host;
 };
 
+/* Used to pass to co-routine device and ioc. */
+typedef struct RemoteCommDev {
+    PCIDevice *dev;
+    QIOChannel *ioc;
+} RemoteCommDev;
+
 #define TYPE_REMOTE_MACHINE "x-remote-machine"
 OBJECT_DECLARE_SIMPLE_TYPE(RemoteMachineState, REMOTE_MACHINE)
 
+void coroutine_fn mpqemu_remote_msg_loop_co(void *data);
+
 #endif
diff --git a/hw/remote/message.c b/hw/remote/message.c
new file mode 100644
index 0000000..36e2d4f
--- /dev/null
+++ b/hw/remote/message.c
@@ -0,0 +1,57 @@
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
+#include "hw/remote/machine.h"
+#include "io/channel.h"
+#include "hw/remote/mpqemu-link.h"
+#include "qapi/error.h"
+#include "sysemu/runstate.h"
+
+void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
+{
+    g_autofree RemoteCommDev *com = (RemoteCommDev *)data;
+    PCIDevice *pci_dev = NULL;
+    Error *local_err = NULL;
+
+    assert(com->ioc);
+
+    pci_dev = com->dev;
+    for (; !local_err;) {
+        MPQemuMsg msg = {0};
+
+        if (!mpqemu_msg_recv(&msg, com->ioc, &local_err)) {
+            break;
+        }
+
+        if (!mpqemu_msg_valid(&msg)) {
+            error_setg(&local_err, "Received invalid message from proxy"
+                                   "in remote process pid="FMT_pid"",
+                                   getpid());
+            break;
+        }
+
+        switch (msg.cmd) {
+        default:
+            error_setg(&local_err,
+                       "Unknown command (%d) received for device %s"
+                       " (pid="FMT_pid")",
+                       msg.cmd, DEVICE(pci_dev)->id, getpid());
+        }
+    }
+
+    if (local_err) {
+        error_report_err(local_err);
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
+    } else {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index ceabcfb..619d743 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3194,6 +3194,7 @@ F: hw/remote/machine.c
 F: include/hw/remote/machine.h
 F: hw/remote/mpqemu-link.c
 F: include/hw/remote/mpqemu-link.h
+F: hw/remote/message.c
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index a2b2fc0..9f5c57f 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -2,5 +2,6 @@ remote_ss = ss.source_set()
 
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


