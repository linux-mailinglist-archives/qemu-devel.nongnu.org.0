Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005332FC18F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:52:18 +0100 (CET)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xz6-0008Kf-Ok
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xet-0003Va-Gl
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:23 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:57810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xer-0000dF-3d
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:23 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKODTi131286;
 Tue, 19 Jan 2021 20:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=KRxZkeXCGOGB5WtxKQKW3/m4SU9GrTHotzpmkhTwWDM=;
 b=SVzgdcWeylJdSTkwQzNKwa6+/iA/1bYRqR34rwSHQTZC/UXKxUGm8EMrNA2y7NScGIs0
 X22B3CRJ2m8bAj20TlZgEyFC7U9PYbfsW15s2zvJbrXUYvOEewdRdfz4FIZ8voyzwSU+
 hyZHK7ApHYLVubS6KOA1oC+tOip5HZtH25LmpAwlGYI58FA3cXVUdSk5of+I0xAaSbZd
 Ggef317nDKl25Vgktw315j1mFMucw6iQjJkkhNHU68y88Icz3OuYk9mJAnyk9MCLJ+XP
 sGwSitufEotgvOJ9josZFcMcQacXBaZ/aK78oen2Ie8csX3lI3Zvo24wf4lOlhYQe0KD 9A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 363r3ktxwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:31:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPkEY176110;
 Tue, 19 Jan 2021 20:29:15 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2054.outbound.protection.outlook.com [104.47.36.54])
 by aserp3020.oracle.com with ESMTP id 3661er94nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iS1gT1/qRXWWWaV6OopRTVkh6p7hyHjuQQyStlg8o/9ED9V89p/0gmiBHMv+NWD2yMVlLcRf9jxtfCupFhSdSl0O+4XzV9sN0vey/JKUAXkFUg+gJG6+1o9mpYIUKgg6ylSYGrlXNxtwQ3sutvCHEpQLHFLJ8skV+zv0AJ/bV5vdIxvYJOcUM1Afire+oWhNKvduYT6xKdeLJuozK4XRNjsom73n5mfriyX+eNxhdbUS3v/1AMv4hiaZDDjF4nlevGyYuD0t1tfjpoGHIHbxihkQHDH+9boil6/rDRufrHywOsMg3RUt+AFDh189hYF5qgXYaUxmlUOIKN70jiBAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRxZkeXCGOGB5WtxKQKW3/m4SU9GrTHotzpmkhTwWDM=;
 b=BKqGyL9/syz928DnQaHI2SGJmlRaYZeUnOzB6hExEfAQ3tiU038ZGXbzV8NNtYHR61Jf1O1a6OyewKzKgPAk3lMgpvANdBIImtb9CSF3yo0DqINDlgWUlo++4AdNm1aU1+fpV4R3nj8AK+YaOYAMPQrGofaYMV8vsgNZKbRGluHg5Qu0VCFWST5RQrXOvn0DsvLaSBuq+1iLtZz4IGWCY+kJplY7hFiHAwpt2Xw8PwcLNj8muPmVXzvB9j5cz8d14X3kre9i2sGE4zrmwfd4kBzBrXhQqN6RXvUFfECpz8ZeQrFWGyP6H70rvEgRaIRfWfqD/jlMa/EcmlYPKtAcpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRxZkeXCGOGB5WtxKQKW3/m4SU9GrTHotzpmkhTwWDM=;
 b=qbnz6f3NOQwO5xP3HHZlZhtBIro+nOd1bUyOd1AqeYC83op00Qh4MROptsWQfnsn0yRbuXde2+B6eMgUykL/3zGIUHqgEj+CgZI0BLJplCNGEAx6LpeQ5hDdpwOKmkgwEke5MKnhH0JVMEhwHu6cfyuguvkbM8y2loAvmXuDV4o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3351.namprd10.prod.outlook.com (2603:10b6:a03:14d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:13 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:13 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 10/20] multi-process: Initialize message handler in remote
 device
Date: Tue, 19 Jan 2021 15:28:27 -0500
Message-Id: <b0f21d708c3746c110dd787fe61364284c10598b.1611081587.git.jag.raman@oracle.com>
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
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95899e30-52e2-4e3e-6718-08d8bcb8e250
X-MS-TrafficTypeDiagnostic: BYAPR10MB3351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB33514CC66054DBF733AC193A90A30@BYAPR10MB3351.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ILlko1oB8K6LNsSQhjaei5hiWRr6m7dbDMtMh89ZnAWkoCrZ7prDFm8Z0Y0s0xzG3Chw2YXbW7sVjtdtYOdqPiFOXv84xbXdFtFoLZ8Y92uut7j0fzYEEJ1/uV2fLQiFnXlt7jV87NBiIzCtwqa/bs2JfvEWCX8h18mf5DrIj6DrNra07GvjdDIQ17w+fQFbcEIPLmjbhyIe+Y7lnNAuyQjf7g7sfukxWOZu0WiLRAcxWtJVni2QfNopGo2Et8p7A+StxLGCVO83nGRPpSJ8Ecrz7K/KWW5gesn/5mK94vokEFXgwOPn07LzINY5YA9x3MQlJmTzhTBX4BovKhLdAytx+Zh6oPHL++cNB6/qCIRQctpLzUUcws8COL4kz49AWYJ0avmSDWRI0byb2u8e3LWE4PnMuyrreSbgHAGKVpbze4Lk/KEOOD2DLJEZw3Yuph2cQuRvbC9VJZHdzQu9JoAFm4miESFXJ7LP6c3G9Bm2DrtTC+AxpZIY4SZNfv0lZNmy9CA3njx2xryjwsyVzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(86362001)(2906002)(6666004)(15650500001)(6916009)(36756003)(4326008)(8676002)(52116002)(66476007)(66556008)(316002)(8936002)(66946007)(6486002)(107886003)(956004)(5660300002)(478600001)(7696005)(16526019)(26005)(186003)(7416002)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RlNqc2tuZDNKdG1zcmNXMWVsLzdCcXBWTE44bjJsdHZ0WjZmYUM1SCt6ZTZC?=
 =?utf-8?B?R1VhOGY4QW16M1lNUisrMGZVN2dCby9HTjNseHR2UG9HaDJQeGplcjJCbHd1?=
 =?utf-8?B?ZnVZaVAvQm96YnY4Z0V1M21MaXNBKzYwSW4wSkg1c1c0ck4vSFQ4MERydHlz?=
 =?utf-8?B?Qy9pOHZwN1dKaU9IRDM0bTJicGt5aTg0OFJJV004ajhRWDUrZzNFd2R3NUJG?=
 =?utf-8?B?OWVRVk56ZHd5M2V4UWpVckZXUnVxdytsaGpwYUtYdXlsMW1iSGF0QllYU2Vs?=
 =?utf-8?B?Vk9QUVV0WUh0TGlNZGRUcTJoVkVGcXZpMXIrbkpjQXFHRExwc1R3dWVabHZL?=
 =?utf-8?B?U3IrOFBZVkE0c3NXRi82YWZqTXNSdVorRUQvR2dyZ3pOaWpvV0FDcGJGUkxJ?=
 =?utf-8?B?RFdaU2hoUUZhOXErRUN6dlFxWGxMaVI4N1MvMy9waWtDWU1oYnhRMmc3Vkhi?=
 =?utf-8?B?ZHp6UlRld3BnNVoxMjhvaS9UREpKRDRwTTNSR0Y3eDdkcWQ2Z3NyZWtINk9i?=
 =?utf-8?B?ZTFQQkhFd0Z1YVRQeEpBZHhqYThKNjF0M0U5ZDFJWlRLS0EwU25jNG5jd01q?=
 =?utf-8?B?RHNUVEwxWTRDcVg5MHVnbytCamU4ZUlyellzS1B4ZkZ1cWp4UmtHQUtIY0ZT?=
 =?utf-8?B?OXR1ZVQydGsxQmNRL21IUDhQMTV2L1ZEY29EWEFWYjdrSGxtazRZU21vV3Bs?=
 =?utf-8?B?SGo4NHovRy92aE5jeE9wRlBnaHV6Y3ovRjVSZUU3bC8rc0wwUkFmL0ppZUw1?=
 =?utf-8?B?U0RoakttQkNia3pQSUNnUndIZlA1YmtZQTQ2OGppRkRqN0szNXNNUnFvcnNN?=
 =?utf-8?B?dERENnp2OHl2WUpHSTRRb3JhdVN6UlZDV1pCRVlCdEZnSjM3YndJYjU4bDBr?=
 =?utf-8?B?QjUvZDlnajd3R01qVGE0QUQ0V1ZyVkJ4TEdRYXprZGFiMGZ0Q0xGUzl2RG8x?=
 =?utf-8?B?aS9pbUFKOGZOUUVtNXRCRHViWHk2dkhCcWtTOXcyM2lqbUNTKzEzLzYwNkpF?=
 =?utf-8?B?RXJQWUlVOUZpdU5ZcXpWN1VzWU13OUR5RmY4QUt4R2RKUDdqaS9YZTlMclcx?=
 =?utf-8?B?ck51TDFDOGwwSlNjaU9uczVsYUk4eU41T3U1WTM1WXhvOGhZSG1MTmNlSjMx?=
 =?utf-8?B?WVVkMkJ0R25ZYWF6YlhhVEY2VG9RZmlhcGFja3h4UUZNQUhpVWJtNzRPMElZ?=
 =?utf-8?B?ZFZBUCs2VDA3ZWliZmw3c3puMC81TXBaWUtWVFVaNWVCQ0Vnc2I3UXZtMnBT?=
 =?utf-8?B?cFVjTzdWV1BESEFFMXpkT1dNcG9NWnNTTjVZaVdOQUgxRHliQm1wVGZNTmJu?=
 =?utf-8?Q?2UDdOe/4PSFac=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95899e30-52e2-4e3e-6718-08d8bcb8e250
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:13.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOeEqWnSeVD4V5b+YUDDynKe/7PCZ8Z3+2B5x1fqsoD4fIL8s8kbuS/8xM6xEJ0YyumKtp+T03BOTvcbW/TESQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3351
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
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
index ae3172a..205b188 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3195,6 +3195,7 @@ F: hw/remote/machine.c
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


