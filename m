Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688AD308AE0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:08:59 +0100 (CET)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XGU-0007zN-CN
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wvt-0007KC-7C
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:42 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:57050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wvb-0005nF-0m
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:47:36 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGPUG4181343;
 Fri, 29 Jan 2021 16:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=AS8UWkRpJUrW+JJRGO/u95Afdjuks5vJZ6zkIDQXZiI=;
 b=nYjVg1PR8r29muVkqeXi9OIaBHwUGzuOOArKDJF4uyD8mTlXkIYNjZaVdos48JSHUmud
 SsVYea+jdkwpW1LwVt0dhosNQDA708GuxKzc92ifEpRREWCPRFd98S8QmVSrV76B43OQ
 CkMYB7jR38KgwIRlfcH9f/ydlgB3Sz2CPk+KDchnIWIK7knZawomqrV9dqKzu9Mqz7Cg
 qrm21Xk1skJhswtk/+/E5ylz5e8/19lqmRK9CYyi/Oi5Ti3GKz5rikGdudikfWnuZDW0
 z7hhYD+GmeY3CcYsDYzsr4HP+cMq6ogbvpwvX2F2KR52mPbdou/LaSN4milhpCVyQRjj Ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 3689ab2dy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOiSZ083881;
 Fri, 29 Jan 2021 16:47:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by aserp3020.oracle.com with ESMTP id 36ceug42nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Alrs4bFstEL9s27srNIpkwYEWEvw9CvccZF7WgEUg9g7ROMTVmPTgVXsdoXKIjTP6xpR0Vuaos0rYGkCDhkytHjJCK2fUSBxwhcC/zmUznRCBV+z+PQd9KQWj1VmueBS5JhbESwDIFeqIdP3owMaYH1f+oplx6ep8YhdO1hyvwcut2HKCVR879FOcYrjrJaNJ8Le2kYp5yOOJNFHWfxp/2X1TqYQwmWfP7qz9qWT/wjie4ia1mbAEQ/Ldk4OUdYtNV8QwEqQZkUWAF4JqhMC/fVUR9dUbyW0gLqXaxq4KBXy6EQb5iFGB4wOs91J1sw7vGRcHub4fc/PQgAaCID6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS8UWkRpJUrW+JJRGO/u95Afdjuks5vJZ6zkIDQXZiI=;
 b=RsjRvcXkX+QHttvA1hUDcu0h4kXFfHew6xRJ+OViaOBmEcl8CAlwKZZ2Sljp7gjjXAtE2x/TML7hr2LQufXNIqEFKXqSDYAUQ5lQ8ST4FZ4flkG4APzavMSk0yJPaF5hhEQm0cI8cXJ03Vfv26c9WWzbG5vG02J64y5UmNWhBWhXlrkTjdv68sZ41bB7ZLJsDL4CkNZum9vPKVBug+b+2vYegRRwDPVV6LRjM1dgiWRpyu0jluWGWuGJQiF9vVbaR1dg0L3froFdWZRemMfS1K4jVTMTmKiyQGBwRrKM0n9/7dYTgK/41PfV/ZfAgT0WIgxRYkr++9NDScWq/u3OTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS8UWkRpJUrW+JJRGO/u95Afdjuks5vJZ6zkIDQXZiI=;
 b=bhPQnob2/r06WA2Ry/stCspqM3Xan6Mdy6YhYZlp0JDwoigMrvk0Z1DpF8ciS+tQDCXMs8vO0swXaTxA8GplokOUP0ZFwaDycilMpup/3xr17c72UkodpEIkPf8HOeNLGySeNQCSPdW3ad3lnLayEEF4hu3UpmZLwog/Ywp9H4Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:47:01 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:47:01 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 13/20] multi-process: introduce proxy object
Date: Fri, 29 Jan 2021 11:46:14 -0500
Message-Id: <b5186ebfedf8e557044d09a768846c59230ad3a7.1611938319.git.jag.raman@oracle.com>
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
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 816aad9d-b3f9-4e80-4b0d-08d8c4757fd6
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4671F5BBF3874D02F6EF183190B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KF63mkYZ54fAkapS1fr0prwMV4kmf/pjDUwOLuKW8HUlBYoqXa+9TgUu1ofEKWNnhd58UPRtXW1Ab4jeFjpyCzR0z5fXpu8Zndb7FLhtMvQKdo2hLhOJdtgTtV0FNhnLkcV26nE5FshWdfG4xwmeEbC2FqWSC4PklcwAUkaDxgpEVO2Prz8LQteFMkcNk2Zam8gf7eewbkgUVoc63XK2m6KopGZJ00Dih7PtsmJHPmoEWGXXlQJ5MgspEI9ggD4NjYVmle22TyIZkTNldl7r0rUk1Q7FmeEay9mzqq/KeabqEvBSAtpAqFE7NCiMotfx6tR6P5fFeuBlD2Xbuq0xacgCkhjzaa+4UvZe+CRP2wU4EKEPpfK/Qh+vADN0ZFDXv9b+H5yYyzy1qnDo6T/Tub/GzBgZtMuExPcOXryl6E1xAQ3+bzx/6JkjI0O4jGiDKVDz7v+xCG7AAaPSFyi/bth7vuaGjrdR5dLlhHsfp0qDwEod05ztOeTjK+3nTBdEB7pH3KpW44UuyiTOW9XnOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dEhHNFc4NHo4SEJYWkxZellLa2NJUU1Kd1dwRjB0cEI4bmNNak9hQlppVWI0?=
 =?utf-8?B?ZWpyVGhjK003ekt5Nm5VNzhpeThUV2NNM1dqeVRWL01YSDZ0dlIvNVpzRzUw?=
 =?utf-8?B?bm9XMUxvQ2xramZUcmZTUW5MRWt4S0RvQ3Ryc3V4OVJDWWI1UzczTjJmbTlj?=
 =?utf-8?B?cEVZNjdPRnlYN0Erd3l4cTNpOGx2RkF1SVdOUmpWQWRqZlNqYkVRT0hqbjNM?=
 =?utf-8?B?N3NTRXRBd1Vjb1ZDTTYvV1BCMVBCaHJwWGo5bmtEd3RVZWtLWEp1SHovOWpm?=
 =?utf-8?B?ZzdlMitCVGgwQmhEM1R3UGZrR1B0N3VDOERsY0VMMmFLQWRkb2I3dFhTWGwy?=
 =?utf-8?B?SDUveHpWRWZrbmZMNWxDQ0QxSlFWdFhNYjZMSlVMWGhhK0dHakdoZWNWRWg5?=
 =?utf-8?B?SkhZa0EvUEJuNGdIOXNDYmVSRmVsRWJIRUpsb2t2Snl5K3BYY25SaldJaEta?=
 =?utf-8?B?R2drVWFRTUZwaXJJcnZ1MDdOeVpwTUZlQUJtMlg4U0ROUXBscThqV1hpZVpZ?=
 =?utf-8?B?L3VGancrQy9hY0dCeVJzL3g2Tnl0OTZFLzZRNW45V0NRUU1ENUpwWjkwaVNp?=
 =?utf-8?B?M1FUcXdtNEVZeFRLSlNvdG5GcC9hcGQrOG1WaTVqUDNMK3dBSFhZVXUxSU82?=
 =?utf-8?B?aGVwdThJVTJMUXMvazNpS0VMV29CSGNJalZsTzViRzVBTWYrV2JCWVU4MEY5?=
 =?utf-8?B?VXhvdnJWdlE5VWozRTBRTDJZeDVrNE1xRW5OT25ueC9vMi9YQXh5Yi8zNHgv?=
 =?utf-8?B?V0srZkZOS3JIOThCZTFESFpEVHNadzkrQXR5c2xkZ3NKaTZ0b1g4T2YwZFpR?=
 =?utf-8?B?VHk4d3g5N2JhY0lMSUhKME43YWtqaXhKd0hiMEtHa016OUFqaUk5WTVCdE56?=
 =?utf-8?B?MDFrazhiQ0VnM3B2VURnSGFwTy9hckgveG5tM3BsYkVTRDhJVGxqVEt5YUxw?=
 =?utf-8?B?U0xrUVNITDgxd1FTY3l1dEkyS3dmNXpGVlUyUi9XSzFnU0hJSnZ4S3NYMWYx?=
 =?utf-8?B?L0FFS2F5Vm1CQ1k4bjF5N3dycklSMXI3cjYvRUVsS1ZYVUIzZlF4dDdrQVFj?=
 =?utf-8?B?TXVpeE5ZMjhlZGZWZUlnN3JrMDBiSTM0UERuZDd1bGdGTGVYMFFpZHpqY210?=
 =?utf-8?B?RnFZakMvK3FqdXFGLzAvQTN6djFyYVNLTTlRKzlIbWVwR0tvK09RaEx3ZGJX?=
 =?utf-8?B?Q3Y4cTViUzh4alhRY0xhdS9YSmhQWHZONmlQcDNJcXp1bDFqTnpMcHp2bkRK?=
 =?utf-8?B?emRzNjluK2tmNUdWL1JPbnJmbXFNSUdqMm05amlQRzZhdElYWG4wSktDdjBV?=
 =?utf-8?B?MTNmYVBURmxkMVhGUWE3S0lmMitzakpXVWpGckR0SkZFdmE1TEVwcHJlNVFR?=
 =?utf-8?B?UEE5R3hSOWhPMnV1WE1VbGZ2a0tyTUNTdjY4YTBYcTBqay81UWs5K3RTc2NM?=
 =?utf-8?Q?h7N/vtBe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816aad9d-b3f9-4e80-4b0d-08d8c4757fd6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:47:01.0571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1ZvH17cyf4H2an0Uh0OCrN6kxJ7frCvpED5uAnWg/KvkOQBDgsD6VJnvmB6S56NIX5cYXCSrpk7ArWumXkDXA==
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

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Defines a PCI Device proxy object as a child of TYPE_PCI_DEVICE.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/proxy.h | 33 ++++++++++++++++
 hw/remote/proxy.c         | 99 +++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |  2 +
 hw/remote/meson.build     |  1 +
 4 files changed, 135 insertions(+)
 create mode 100644 include/hw/remote/proxy.h
 create mode 100644 hw/remote/proxy.c

diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
new file mode 100644
index 0000000..faa9c4d
--- /dev/null
+++ b/include/hw/remote/proxy.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef PROXY_H
+#define PROXY_H
+
+#include "hw/pci/pci.h"
+#include "io/channel.h"
+
+#define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
+OBJECT_DECLARE_SIMPLE_TYPE(PCIProxyDev, PCI_PROXY_DEV)
+
+struct PCIProxyDev {
+    PCIDevice parent_dev;
+    char *fd;
+
+    /*
+     * Mutex used to protect the QIOChannel fd from
+     * the concurrent access by the VCPUs since proxy
+     * blocks while awaiting for the replies from the
+     * process remote.
+     */
+    QemuMutex io_mutex;
+    QIOChannel *ioc;
+    Error *migration_blocker;
+};
+
+#endif /* PROXY_H */
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
new file mode 100644
index 0000000..cd5b071
--- /dev/null
+++ b/hw/remote/proxy.c
@@ -0,0 +1,99 @@
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
+#include "hw/remote/proxy.h"
+#include "hw/pci/pci.h"
+#include "qapi/error.h"
+#include "io/channel-util.h"
+#include "hw/qdev-properties.h"
+#include "monitor/monitor.h"
+#include "migration/blocker.h"
+#include "qemu/sockets.h"
+
+static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
+{
+    ERRP_GUARD();
+    PCIProxyDev *dev = PCI_PROXY_DEV(device);
+    int fd;
+
+    if (!dev->fd) {
+        error_setg(errp, "fd parameter not specified for %s",
+                   DEVICE(device)->id);
+        return;
+    }
+
+    fd = monitor_fd_param(monitor_cur(), dev->fd, errp);
+    if (fd == -1) {
+        error_prepend(errp, "proxy: unable to parse fd %s: ", dev->fd);
+        return;
+    }
+
+    if (!fd_is_socket(fd)) {
+        error_setg(errp, "proxy: fd %d is not a socket", fd);
+        close(fd);
+        return;
+    }
+
+    dev->ioc = qio_channel_new_fd(fd, errp);
+
+    error_setg(&dev->migration_blocker, "%s does not support migration",
+               TYPE_PCI_PROXY_DEV);
+    migrate_add_blocker(dev->migration_blocker, errp);
+
+    qemu_mutex_init(&dev->io_mutex);
+    qio_channel_set_blocking(dev->ioc, true, NULL);
+}
+
+static void pci_proxy_dev_exit(PCIDevice *pdev)
+{
+    PCIProxyDev *dev = PCI_PROXY_DEV(pdev);
+
+    if (dev->ioc) {
+        qio_channel_close(dev->ioc, NULL);
+    }
+
+    migrate_del_blocker(dev->migration_blocker);
+
+    error_free(dev->migration_blocker);
+}
+
+static Property proxy_properties[] = {
+    DEFINE_PROP_STRING("fd", PCIProxyDev, fd),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = pci_proxy_dev_realize;
+    k->exit = pci_proxy_dev_exit;
+    device_class_set_props(dc, proxy_properties);
+}
+
+static const TypeInfo pci_proxy_dev_type_info = {
+    .name          = TYPE_PCI_PROXY_DEV,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PCIProxyDev),
+    .class_init    = pci_proxy_dev_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
+static void pci_proxy_dev_register_types(void)
+{
+    type_register_static(&pci_proxy_dev_type_info);
+}
+
+type_init(pci_proxy_dev_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 79cb35d..c60c333 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3198,6 +3198,8 @@ F: hw/remote/message.c
 F: hw/remote/remote-obj.c
 F: include/hw/remote/memory.h
 F: hw/remote/memory.c
+F: hw/remote/proxy.c
+F: include/hw/remote/proxy.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 64da16c..569cd20 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -4,6 +4,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 
-- 
1.8.3.1


