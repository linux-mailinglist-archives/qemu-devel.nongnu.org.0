Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EB22FC1A7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:55:14 +0100 (CET)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1y1y-0003tk-1d
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xf3-0003Yo-Vd
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:35 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:60596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xex-0000dn-0N
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:33 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKNUZR002769;
 Tue, 19 Jan 2021 20:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=XKBNF9uGeJ7f26QobJG1N2YFvLXFgKmylzQFDd0xfbk=;
 b=LL2ux5oW8hE/fZB0vF6KdsC2wtw0bKnklFsH41p6x8RC9I8UZRtpGqH38jhY+XzKGj6D
 h8DMPkEUQZQCVeqpdWy+O5gMqkSQRP5eiJQ5Dqf1tMSlQaHnkIoUnXppGPSorI6a7pFJ
 KkavRyCusUfkb31wtuD57RttTpha2/wwG0b3yWQMCEg5YQtWBQy6sZtaYpUp+Hu+mICQ
 7uczkmpKYu8Z98n7Hrirm/WyABdFPvlInz/7roFoD5HO9RYl/bQnkytlaFH1MIY6lfpV
 cR4FVsAxo/MFKrWhl/o/3SVQN75MmW419yihT8E9yyKjpf+r91tcScwZyRWEE1xqbxwV zw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 363xyhtb36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:31:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKQc33117492;
 Tue, 19 Jan 2021 20:29:18 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2058.outbound.protection.outlook.com [104.47.36.58])
 by aserp3030.oracle.com with ESMTP id 3649qpu94c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBjkRCvOGZYjT/FJg3W6n5f6mPrX4Ar6Da/ertltyKDCD9moN0e77Rh0E2rNjEDN76LSKYQt2JG6R4Mi70ejj9kbBoHHpnNj41xUFCut9n80TLOEJ/SVuWd+xOlh1MyTYd8Kyzvw0X5NH90vQ7Ogh4Qa1GzWlj8YQuyGwKdN5iQSp/xDjAGgufhxspYt3IgTo7/5uL3OKMgAAkpJ6lTwv/n35EOt3JGGHp+H+Yg9kAA8WR1noYmtpYxyl6kB+Pv6Xvz05jSP4gashYJ09bzxqF7sVleTehK9B/79/9KQBp7+O30Y8pC5mG97UmMPJ1kev8mJBRFje5DDJv7Faev6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKBNF9uGeJ7f26QobJG1N2YFvLXFgKmylzQFDd0xfbk=;
 b=fouyUuMtUIP0qkkKdHJEazjvvyvjf2LU3yBQS2Y/pLtfpZkoUj3cvznA/0XIbBUeXTThBhPINBWBSpLKv+F1WnCaXYjtmAgh2dwdp5bRH7Dyseo/s5oDq5c8wg3+uo1/13/2snf/NCJltmi3NPJFl+yNoL3Awxb/L5dyaOgenfzx0sCBQkmGJbAyvq7QR1IQM9cyWciLf9MqN3aj3trLvqIYGrqzu7FutUM06AVmHj4v+/2U7/CbdJ0ii1b4vrWZLkMrk42jkOn3y2yvbZCo5CTMXVQbale4M5tDW4OIsPoB8JpIjHjCzWe1ICVOQR1gwymdDpu17YMWUdjYn7ydBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKBNF9uGeJ7f26QobJG1N2YFvLXFgKmylzQFDd0xfbk=;
 b=Y3doxnX/7Zm0yPw6lHmE0gAjH+4I3VZCn+zv8dpK2gZRzubp622b78qe+lXDzOjiIJP/enSBqoeEqo9PmyOMXYlLVuuNRU7Dop3i87KAsVmNmCw0tJcFs23FZsqBBWkdrMLKBkzoCpN0ou2aik7+zzdrvL/Olx7YGi7c60VAUNw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3351.namprd10.prod.outlook.com (2603:10b6:a03:14d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:16 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:16 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 11/20] multi-process: Associate fd of a PCIDevice with its
 object
Date: Tue, 19 Jan 2021 15:28:28 -0500
Message-Id: <ad148f68688f54a2d51f1d4b530f55a1ded47cfa.1611081587.git.jag.raman@oracle.com>
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
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a23f748d-513e-4627-9781-08d8bcb8e42b
X-MS-TrafficTypeDiagnostic: BYAPR10MB3351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB335108307073C950F63E90F790A30@BYAPR10MB3351.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGR0ZbHMsNFn94GH9gS3o8j1Zj5/gt8d96HbTZJUm8VHvyH4FKhDXFewXza+Evm9NBStfWDcC+ZQGwpzea7XIm5STbTcHGkg7P0LdsOFpDFpA7/G3s0VSKtBYn8Q4mQUnbhTZ1y+fYOJRNOpvGCPcmJCzJzIGJ08lLwNbg+kzmrj68CIgaECZzqZzWFgO0h04oheORi0JPniYwMWsgfen8jSwbq9Lxa8Thf/OEO82rqafoJKUQ099pUU29CYai6ORrfVF8qZsf5/isDgPEouVvsDn+DHbviuBj6BzBS833ZL4CgbFdsUqtYQ96i7gtady1AYxqss8xvI+FutSvhaifdtu8ATjcmEpZgwWwamv+TTTi0oI5Tg/5v7h/dBd9ryK/gJteFsu8qNyhNkCXRa6s/CQudUwF7f6jy2aIrcTmKT5cSjs0YqtfO8m7ce4KFJD1DcP20y6nvDgTdk1xLUpbwa+ThFQuD4X2jet5k9NA4BuBcyaKYVksPgnz4njm1okiVkFUZ8Nm03IURhy39azw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(86362001)(2906002)(6666004)(6916009)(36756003)(4326008)(8676002)(52116002)(66476007)(66556008)(316002)(8936002)(66946007)(6486002)(107886003)(956004)(5660300002)(478600001)(7696005)(16526019)(26005)(186003)(7416002)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RExlaFBRM240bXFzNUVyRU90Q2VKbWVLcGpiZitQOVhPelNSZW5qSThST0pR?=
 =?utf-8?B?dmVmVkY3YkloZ1M5dnpvbDFieVlJdHcrRjZsLzJrYnlndzVCL21nb1pmNXc5?=
 =?utf-8?B?S3JNcHBpbHZUTC80b0htOHg4ekFBZXJReEJ1Y0pTNmdFb3lmMXg1bnEwWjA1?=
 =?utf-8?B?R0RhQm16azc2NDYveXVBei91SXpHSDFPdTdsMlBLWloyaytHWGlRZEY3V0wy?=
 =?utf-8?B?NzZnWUU2djU0RUEzcUxMRmNBK3oxeDFPakdhbUozemdmNmZ2aGlWa29EaC9h?=
 =?utf-8?B?UDlOanB1VmUycTNlZ3pzNW02QmpLWWZMbTl0L1N1YXp2dXliQ1BlYlUrSzNM?=
 =?utf-8?B?LzhRZEk4V1dTeDRaKzJXSUZsOXhMVmZDWGpvQ3hMQ1lSUjNnTllxUjdGcXJN?=
 =?utf-8?B?RU1wT0p3djZZL1EwMnlDT1J5SUZremVveEo3N2tQMmJKQklqMng3WkFtNFpX?=
 =?utf-8?B?YzJRRFhkNmI0U3MrZUF0aUFPWGtWb0FMVHRUTUdQcEhjejAzZW9yTGM0NlND?=
 =?utf-8?B?bG9YQjVBQUJ2VmkzZEtDZ1BhYzlVeTlFS2YzYk12KzAyVG00aUNKQmRicmxy?=
 =?utf-8?B?ZEhlQmNxN0lwSVc4a3BISDV4M1FJTUYxNTVTaFg0S0RXYmE3MVR6WU9OOElL?=
 =?utf-8?B?eEpUelMwS1orV2JoVTFySUh3cFhmVUVtdDBqcDBrL0NjYzVEMEpPOTk4NWJ6?=
 =?utf-8?B?K2RYbG1vcEE2UXlTcldJMkNFTXdKSDA0S1JRTFhXeWEveWpYcDN5My8rdHN6?=
 =?utf-8?B?SlRzdWVFcEdwRlY3cWY4VEtMNlVKTjNQZVJkQU9hZWpjK2VlWHdURk5kby95?=
 =?utf-8?B?NnhnUXVjcTZKSDh1THNnZHErVXZyUitWcDY0T1g1MnludlNmNEJVMEFwaSs4?=
 =?utf-8?B?TW5NSDRuaGZWRWJlQkpNSTRFRzhEa1g0VkhLSE9yN2YzZEJGbGx3d0MvbENi?=
 =?utf-8?B?bjJPUjVScVlLT1RGRXUyeDQzUDVnUWdzUTNOUEhPV1hvRTkvYUp4NzhyVTls?=
 =?utf-8?B?ejZEQm5jUHRzSy9VUjUrMVUvdTdpZExmUnFidkNkc3lvZ0t6WWM3U25BOXhp?=
 =?utf-8?B?Q0t4c2RGS1JwMnFMSzZFc3BhK1V3ZTBSaVBvNStqSUVsdytIL0pvaGlTc1VV?=
 =?utf-8?B?Z1Q0SGYzZHlQdHpOSWw3MHRsNGczQXUzcjNFV08vYkxIbjdSTlcxRUM5c0FQ?=
 =?utf-8?B?WlFCaWhZOU16NStZZjFqR3BobUlTWStrd25Gak4vOGlHUnNLN0VDTzVDd1Zn?=
 =?utf-8?B?MWJRTXFLWHpmWFl5N0o0RU9od3Zta2oxMVZCRXI2S095L294N2ZHbUI0cnpW?=
 =?utf-8?Q?m0nFwATIWayHM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23f748d-513e-4627-9781-08d8bcb8e42b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:16.2650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqHEX0SkUHhjmwACSkEC9LXQGQi4GgobwOByWSHnyICKFYBX1GveyqeV90Ze90yUIHg9aOCb6hekzl246SO1YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3351
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
index 205b188..6e60215 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3196,6 +3196,7 @@ F: include/hw/remote/machine.h
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


