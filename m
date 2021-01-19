Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F86F2FC19A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:54:28 +0100 (CET)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1y1D-0002zJ-94
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xfM-0003j8-UA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:52 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:58194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xfH-0000gh-Qg
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:31:52 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKOVtc131398;
 Tue, 19 Jan 2021 20:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=BXRIbQx5WB+xFmNtc+iUxvKCUVvNcKmkSoo00eBRgjg=;
 b=qHpAEeKX1dYiyDtZMGcTVwdfgEqF444d5vRQI7EYlNqsZ0XeRHdFiP/9LdIKqprA++w2
 9PTu0NGlXfF9zOn43OsqYrysnC8/8rG6U5euZQzwXvC7hJHMQ3wFExV5s9a57QjJKR/g
 rkoHVddPXDleUEkmqiq0CVfLPGTZyjOBJbm4dlT+jibNpiDPMrhocY6ltI6OKIvzmCPX
 5pD2w0ngWXjIhpEy0DgIZJT8JCns70eC55AEFhhKLMa+NY3WYNSVSVzBzul7869XOjOp
 B/2F8dDWvLKIANJMMBWs2rozlu0XkSd66kC8uGQpgQXtcTZ3U0sFwLbZ80m4xYucB1dR 7g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 363r3ktxyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:31:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKQbUF117465;
 Tue, 19 Jan 2021 20:29:40 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2052.outbound.protection.outlook.com [104.47.37.52])
 by aserp3030.oracle.com with ESMTP id 3649qpu9dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:29:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IA0/3HECIYBqQvdOFTBou+YlCbJ3FE0vUOZbeeQchMLg6hp5fMk/CYDid/GYAAaDDrlmz/EbYi0wKbCybrl5xzXceMPrLed/e+aVsMXGqmreESYGx3VQdZvH1lj3EacxUCBkG0cIU3NVWn19iYyoQOBObDESEiA83h6oKsHuACt1RzH/6kov6G3qhbYwCDQSGGqQYy/V87Cp4v5MX+q+1zOevDfMdT/3oI4758dFlMi9tqt+pX1WTE+XFtO85BSH7ZNE31tPPiH9oN95ivDkyzDmzLtdzFZAWnSX8WlBF7u7iJdxcKUtOW006ALC7NlFuKkX2R32XQekNEzIexLhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXRIbQx5WB+xFmNtc+iUxvKCUVvNcKmkSoo00eBRgjg=;
 b=oK4Za8AOc5zEbr+NBMX0t3TbrKjqZy8OKdZ5vrtFexB2N5zWmOqmkvJ/gcCQFXl4l9fLraiuDhnGAQw/SfErKo5lG1DAoz2ZRMhbQkjczH9mTJGO88D1SdI6xIFEEaJFjQWG3aXr2PBuL5jU1hEU419Gn0shnAYMlLsuW7JKYsk3eZkqH9sRBQMFU/mFYInAIRbQWYxDsFYC/gqNYP825/ARfx+ESTtuRIHTmoMRvFt8Vnvj7kT/bHO+Gg0BpQa11Q33ETI0qeRXnKEMTvkwo3fuOytMVZvx9sFS2swl8NS4HCw6mV0CtaFcqVUp+cp6GOz8+f0aRfjw8XkjhGEYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXRIbQx5WB+xFmNtc+iUxvKCUVvNcKmkSoo00eBRgjg=;
 b=NQr9iNkE4rIGmLBVrwGF4lm9+vxijlU1GV72vBIrpfq3iiKScLOepGu21JeGAQ2IzlhgSlOqTFOF4z1GTSih2I68/TI38zkS3H5Kis0lhAkglA4T6/EK+zpHJ3bFCI9UGtL3TCpP2LPBCIo2amYo8iHGcdZZ3wcS+akzBH5GJJ0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:29:37 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:29:37 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 18/20] multi-process: create IOHUB object to handle irq
Date: Tue, 19 Jan 2021 15:28:35 -0500
Message-Id: <7cbe8162242af38a3a5c5557254bb1c51ac4a257.1611081587.git.jag.raman@oracle.com>
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
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:29:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8deaa436-ad8c-4189-8b8f-08d8bcb8f0e2
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB33496775326C9A6C3DC5DD2690A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a0usr3x1jE5GUJvuGtfh7iG2+Sgg1619WErNDHIHTY2UkYmJugmGMcApMlfkzc3UYAOPSfx0DhWGSZFhbXyDtG0I72FwmiZr0irMKoQi5d0Clpqgfu8I4/+GDh8B7db8fPl0F98SUCtkoNWynxvwWU2gVwwqo4iGepgKphYVxj+UyWGEqwIcNBB0RTfzOEaCqB/1wFvzg+6/DobcvgOdow2BZc6GK6/kmmL1iC2lpWkBrLBN8zVDGuW9udUOH5qSUAom2DgbcwIPu6c4WnSg3yw9RBwWhTdYjf5nB+/2mynQAZ0213+n6QA+mBLWG7C7MCq7y3d955LB4qldHYCKGLC0eMwYn6ns1lQJk28wJcM3VMhohKnAetfF/ToNeUwQVJRG/cP3tcnYc5O7IYk1Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(30864003)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmRCNU40cTc2UDFyNjJnSzhaWnZYK1NWengvT3Nud2xJbHJ1dzY1UWFsWnEy?=
 =?utf-8?B?Y1VEckFTaFg2a1pLR2ptQnF2TWFjZmN3M2ZKN09XSG9JV0RtdkpPWkF1VEVa?=
 =?utf-8?B?Mzk2Lzk5YklhcXFLVmIxZlJYK2duZE5TbnRWL0psOEd0MDhWaVlYS1VoOWNj?=
 =?utf-8?B?VTJHQjlRVytSbllBK2dzT2JBaVVta3ljV25IYlZxWlRSazJRZDk0ZG5WcUsx?=
 =?utf-8?B?NFg5UDdhT3JDRHFhMy9OVHltNmowSHFEOW5wSGRMWCtQYzg1VG83Qzc5UjdM?=
 =?utf-8?B?dGpBZkgzcEZWOU5rcHMvTkNTN3M4Qjc0emhidWdPeTlPR1VxNy9pNzhybE10?=
 =?utf-8?B?TjFFdVNIdHdVVXkwQjFsbThLeWVhRTRLTFNDSjYweGhrcjR5Y3I2WlcxSmpk?=
 =?utf-8?B?YXArakNkYVVLRW4zdnh6RFdhSFlCYkw2d1NHNGw1L3hTWFloNzJnR3UvcEU2?=
 =?utf-8?B?SVFHQmpkemlzSTZoak80eGFvMU1PUlBNb2hrN0d0b0xuYWtiM0UyaEhEalpR?=
 =?utf-8?B?cDNBazNIcHJUMlJpeGpibzU1eWR3Zi9WdUxGSTZBN3BDRGtnT09yYlBNbnhu?=
 =?utf-8?B?aGZJVmczRWE1Z0lTc2ZwNDNkMk5YRm5lR1hFc0xPamprc1Y1eG9obFNhMWVl?=
 =?utf-8?B?ek1HeFhMVDJ1OUxVMG12Y2cwZW9WRzNid0wwbzhPWURUUFR6WFBoK3BOUEx0?=
 =?utf-8?B?VzZsY1N6TEUvK2NxVVNISWxZTi9LRCtXREM5V3VXcEFzcThrTFJUWTViOXo1?=
 =?utf-8?B?bGlKelk3Z2pualpTaEp2MGE3SzJOcjRGWSswTXVqanVSWUJ0cmd6WGdLV2Jo?=
 =?utf-8?B?MGlUTjhFeEw4YWVNWTA3SlBrbDliNGYrRUg3YnJNTzF5WmhFYUk0TTc2ZE1G?=
 =?utf-8?B?UWZKSjRzTU9UZFpRRjFnOHBTQWk4NlQwVG5BKzdjTUFDSC9ucjZqeW1LaGtm?=
 =?utf-8?B?SVJSU0IxN3ZzbmlibXdqZnFhRDl6eVBacm85eGs5Tkg2OE1ORHVMd0RPeUNl?=
 =?utf-8?B?WXJ5Ymd3ZWZuL2dWRHB4VHl6OFBkd3RMUExWS0dkT0pybm1SbVV3TUptK3hn?=
 =?utf-8?B?Z3ZYYUVSUzNrMnNndWhXQU1KNnhqMDBHZlN1QzhZbDY3akpybi96VERDRmlB?=
 =?utf-8?B?ZTYzWFBCc2RYRzh0RSt4dkNDc295YzFBNGZUVFVNYXY5WDV2VHI1Q0dpakp0?=
 =?utf-8?B?ajFVSEZXNlhEczF6U0ZueG0rWWo5Y0t0UXh4QnROdVExSGNpU29iM2lYZ3lu?=
 =?utf-8?B?QWxJVkV1enl2Uzk3R2dXMmQyNDNOWWg3VVpld1hyUnlicUViMGtZWEFKc1V5?=
 =?utf-8?Q?A1b4btlvudzQY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8deaa436-ad8c-4189-8b8f-08d8bcb8f0e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:29:37.6367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQat3Mfxt9uo6SODvkhxnw1uhxXMUA2bohxv7bYI27gP1HSe0Z1+FteR7th8zaUw98/idlhBUp5AS2FIMcC9mg==
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

IOHUB object is added to manage PCI IRQs. It uses KVM_IRQFD
ioctl to create irqfd to injecting PCI interrupts to the guest.
IOHUB object forwards the irqfd to the remote process. Remote process
uses this fd to directly send interrupts to the guest, bypassing QEMU.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/pci/pci_ids.h        |   3 +
 include/hw/remote/iohub.h       |  42 ++++++++++++++
 include/hw/remote/machine.h     |   2 +
 include/hw/remote/mpqemu-link.h |   1 +
 include/hw/remote/proxy.h       |   4 ++
 hw/remote/iohub.c               | 119 ++++++++++++++++++++++++++++++++++++++++
 hw/remote/machine.c             |  10 ++++
 hw/remote/message.c             |   4 ++
 hw/remote/mpqemu-link.c         |   5 ++
 hw/remote/proxy.c               |  56 +++++++++++++++++++
 MAINTAINERS                     |   2 +
 hw/remote/meson.build           |   1 +
 12 files changed, 249 insertions(+)
 create mode 100644 include/hw/remote/iohub.h
 create mode 100644 hw/remote/iohub.c

diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11f8ab7..bd0c17d 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -192,6 +192,9 @@
 #define PCI_DEVICE_ID_SUN_SIMBA          0x5000
 #define PCI_DEVICE_ID_SUN_SABRE          0xa000
 
+#define PCI_VENDOR_ID_ORACLE             0x108e
+#define PCI_DEVICE_ID_REMOTE_IOHUB       0xb000
+
 #define PCI_VENDOR_ID_CMD                0x1095
 #define PCI_DEVICE_ID_CMD_646            0x0646
 
diff --git a/include/hw/remote/iohub.h b/include/hw/remote/iohub.h
new file mode 100644
index 0000000..0bf98e0
--- /dev/null
+++ b/include/hw/remote/iohub.h
@@ -0,0 +1,42 @@
+/*
+ * IO Hub for remote device
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOHUB_H
+#define REMOTE_IOHUB_H
+
+#include "hw/pci/pci.h"
+#include "qemu/event_notifier.h"
+#include "qemu/thread-posix.h"
+#include "hw/remote/mpqemu-link.h"
+
+#define REMOTE_IOHUB_NB_PIRQS    PCI_DEVFN_MAX
+
+typedef struct ResampleToken {
+    void *iohub;
+    int pirq;
+} ResampleToken;
+
+typedef struct RemoteIOHubState {
+    PCIDevice d;
+    EventNotifier irqfds[REMOTE_IOHUB_NB_PIRQS];
+    EventNotifier resamplefds[REMOTE_IOHUB_NB_PIRQS];
+    unsigned int irq_level[REMOTE_IOHUB_NB_PIRQS];
+    ResampleToken token[REMOTE_IOHUB_NB_PIRQS];
+    QemuMutex irq_level_lock[REMOTE_IOHUB_NB_PIRQS];
+} RemoteIOHubState;
+
+int remote_iohub_map_irq(PCIDevice *pci_dev, int intx);
+void remote_iohub_set_irq(void *opaque, int pirq, int level);
+void process_set_irqfd_msg(PCIDevice *pci_dev, MPQemuMsg *msg);
+
+void remote_iohub_init(RemoteIOHubState *iohub);
+void remote_iohub_finalize(RemoteIOHubState *iohub);
+
+#endif
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index b92b2ce..2a2a33c 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -15,11 +15,13 @@
 #include "hw/boards.h"
 #include "hw/pci-host/remote.h"
 #include "io/channel.h"
+#include "hw/remote/iohub.h"
 
 struct RemoteMachineState {
     MachineState parent_obj;
 
     RemotePCIHost *host;
+    RemoteIOHubState iohub;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 6303e62..71d206f 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -39,6 +39,7 @@ typedef enum {
     MPQEMU_CMD_PCI_CFGREAD,
     MPQEMU_CMD_BAR_WRITE,
     MPQEMU_CMD_BAR_READ,
+    MPQEMU_CMD_SET_IRQFD,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
index 12888b4..741def7 100644
--- a/include/hw/remote/proxy.h
+++ b/include/hw/remote/proxy.h
@@ -12,6 +12,7 @@
 #include "hw/pci/pci.h"
 #include "io/channel.h"
 #include "hw/remote/proxy-memory-listener.h"
+#include "qemu/event_notifier.h"
 
 #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIProxyDev, PCI_PROXY_DEV)
@@ -38,6 +39,9 @@ struct PCIProxyDev {
     QIOChannel *ioc;
     Error *migration_blocker;
     ProxyMemoryListener proxy_listener;
+    int virq;
+    EventNotifier intr;
+    EventNotifier resample;
     ProxyMemoryRegion region[PCI_NUM_REGIONS];
 };
 
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
new file mode 100644
index 0000000..e4ff131
--- /dev/null
+++ b/hw/remote/iohub.c
@@ -0,0 +1,119 @@
+/*
+ * Remote IO Hub
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
+#include "hw/pci/pci_ids.h"
+#include "hw/pci/pci_bus.h"
+#include "qemu/thread.h"
+#include "hw/boards.h"
+#include "hw/remote/machine.h"
+#include "hw/remote/iohub.h"
+#include "qemu/main-loop.h"
+
+void remote_iohub_init(RemoteIOHubState *iohub)
+{
+    int pirq;
+
+    memset(&iohub->irqfds, 0, sizeof(iohub->irqfds));
+    memset(&iohub->resamplefds, 0, sizeof(iohub->resamplefds));
+
+    for (pirq = 0; pirq < REMOTE_IOHUB_NB_PIRQS; pirq++) {
+        qemu_mutex_init(&iohub->irq_level_lock[pirq]);
+        iohub->irq_level[pirq] = 0;
+        event_notifier_init_fd(&iohub->irqfds[pirq], -1);
+        event_notifier_init_fd(&iohub->resamplefds[pirq], -1);
+    }
+}
+
+void remote_iohub_finalize(RemoteIOHubState *iohub)
+{
+    int pirq;
+
+    for (pirq = 0; pirq < REMOTE_IOHUB_NB_PIRQS; pirq++) {
+        qemu_set_fd_handler(event_notifier_get_fd(&iohub->resamplefds[pirq]),
+                            NULL, NULL, NULL);
+        event_notifier_cleanup(&iohub->irqfds[pirq]);
+        event_notifier_cleanup(&iohub->resamplefds[pirq]);
+        qemu_mutex_destroy(&iohub->irq_level_lock[pirq]);
+    }
+}
+
+int remote_iohub_map_irq(PCIDevice *pci_dev, int intx)
+{
+    return pci_dev->devfn;
+}
+
+void remote_iohub_set_irq(void *opaque, int pirq, int level)
+{
+    RemoteIOHubState *iohub = opaque;
+
+    assert(pirq >= 0);
+    assert(pirq < PCI_DEVFN_MAX);
+
+    QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
+
+    if (level) {
+        if (++iohub->irq_level[pirq] == 1) {
+            event_notifier_set(&iohub->irqfds[pirq]);
+        }
+    } else if (iohub->irq_level[pirq] > 0) {
+        iohub->irq_level[pirq]--;
+    }
+}
+
+static void intr_resample_handler(void *opaque)
+{
+    ResampleToken *token = opaque;
+    RemoteIOHubState *iohub = token->iohub;
+    int pirq, s;
+
+    pirq = token->pirq;
+
+    s = event_notifier_test_and_clear(&iohub->resamplefds[pirq]);
+
+    assert(s >= 0);
+
+    QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
+
+    if (iohub->irq_level[pirq]) {
+        event_notifier_set(&iohub->irqfds[pirq]);
+    }
+}
+
+void process_set_irqfd_msg(PCIDevice *pci_dev, MPQemuMsg *msg)
+{
+    RemoteMachineState *machine = REMOTE_MACHINE(current_machine);
+    RemoteIOHubState *iohub = &machine->iohub;
+    int pirq, intx;
+
+    intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+
+    pirq = remote_iohub_map_irq(pci_dev, intx);
+
+    if (event_notifier_get_fd(&iohub->irqfds[pirq]) != -1) {
+        qemu_set_fd_handler(event_notifier_get_fd(&iohub->resamplefds[pirq]),
+                            NULL, NULL, NULL);
+        event_notifier_cleanup(&iohub->irqfds[pirq]);
+        event_notifier_cleanup(&iohub->resamplefds[pirq]);
+        memset(&iohub->token[pirq], 0, sizeof(ResampleToken));
+    }
+
+    event_notifier_init_fd(&iohub->irqfds[pirq], msg->fds[0]);
+    event_notifier_init_fd(&iohub->resamplefds[pirq], msg->fds[1]);
+
+    iohub->token[pirq].iohub = iohub;
+    iohub->token[pirq].pirq = pirq;
+
+    qemu_set_fd_handler(msg->fds[1], intr_resample_handler, NULL,
+                        &iohub->token[pirq]);
+}
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 9519a6c..c0ab4f5 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,12 +20,15 @@
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
 #include "qapi/error.h"
+#include "hw/pci/pci_host.h"
+#include "hw/remote/iohub.h"
 
 static void remote_machine_init(MachineState *machine)
 {
     MemoryRegion *system_memory, *system_io, *pci_memory;
     RemoteMachineState *s = REMOTE_MACHINE(machine);
     RemotePCIHost *rem_host;
+    PCIHostState *pci_host;
 
     system_memory = get_system_memory();
     system_io = get_system_io();
@@ -45,6 +48,13 @@ static void remote_machine_init(MachineState *machine)
     memory_region_add_subregion_overlap(system_memory, 0x0, pci_memory, -1);
 
     qdev_realize(DEVICE(rem_host), sysbus_get_default(), &error_fatal);
+
+    pci_host = PCI_HOST_BRIDGE(rem_host);
+
+    remote_iohub_init(&s->iohub);
+
+    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
 }
 
 static void remote_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 25341d8..adab040 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -18,6 +18,7 @@
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "hw/remote/memory.h"
+#include "hw/remote/iohub.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp);
@@ -65,6 +66,9 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_SYNC_SYSMEM:
             remote_sysmem_reconfig(&msg, &local_err);
             break;
+        case MPQEMU_CMD_SET_IRQFD:
+            process_set_irqfd_msg(pci_dev, &msg);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index bcb32e0..4342245 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -254,6 +254,11 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
             return false;
         }
         break;
+    case MPQEMU_CMD_SET_IRQFD:
+        if (msg->size || (msg->num_fds != 2)) {
+            return false;
+        }
+        break;
     default:
         break;
     }
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 472b2df..555b310 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -21,6 +21,57 @@
 #include "qemu/error-report.h"
 #include "hw/remote/proxy-memory-listener.h"
 #include "qom/object.h"
+#include "qemu/event_notifier.h"
+#include "sysemu/kvm.h"
+#include "util/event_notifier-posix.c"
+
+static void proxy_intx_update(PCIDevice *pci_dev)
+{
+    PCIProxyDev *dev = PCI_PROXY_DEV(pci_dev);
+    PCIINTxRoute route;
+    int pin = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+
+    if (dev->virq != -1) {
+        kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &dev->intr, dev->virq);
+        dev->virq = -1;
+    }
+
+    route = pci_device_route_intx_to_irq(pci_dev, pin);
+
+    dev->virq = route.irq;
+
+    if (dev->virq != -1) {
+        kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &dev->intr,
+                                           &dev->resample, dev->virq);
+    }
+}
+
+static void setup_irqfd(PCIProxyDev *dev)
+{
+    PCIDevice *pci_dev = PCI_DEVICE(dev);
+    MPQemuMsg msg;
+    Error *local_err = NULL;
+
+    event_notifier_init(&dev->intr, 0);
+    event_notifier_init(&dev->resample, 0);
+
+    memset(&msg, 0, sizeof(MPQemuMsg));
+    msg.cmd = MPQEMU_CMD_SET_IRQFD;
+    msg.num_fds = 2;
+    msg.fds[0] = event_notifier_get_fd(&dev->intr);
+    msg.fds[1] = event_notifier_get_fd(&dev->resample);
+    msg.size = 0;
+
+    if (!mpqemu_msg_send(&msg, dev->ioc, &local_err)) {
+        error_report_err(local_err);
+    }
+
+    dev->virq = -1;
+
+    proxy_intx_update(pci_dev);
+
+    pci_device_set_intx_routing_notifier(pci_dev, proxy_intx_update);
+}
 
 static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 {
@@ -56,6 +107,8 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
     qio_channel_set_blocking(dev->ioc, true, NULL);
 
     proxy_memory_listener_configure(&dev->proxy_listener, dev->ioc);
+
+    setup_irqfd(dev);
 }
 
 static void pci_proxy_dev_exit(PCIDevice *pdev)
@@ -71,6 +124,9 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     error_free(dev->migration_blocker);
 
     proxy_memory_listener_deconfigure(&dev->proxy_listener);
+
+    event_notifier_cleanup(&dev->intr);
+    event_notifier_cleanup(&dev->resample);
 }
 
 static void config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,
diff --git a/MAINTAINERS b/MAINTAINERS
index 5e48a26..a15a04f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3203,6 +3203,8 @@ F: hw/remote/proxy.c
 F: include/hw/remote/proxy.h
 F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
+F: hw/remote/iohub.c
+F: include/hw/remote/iohub.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 7f11be4..e6a5574 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -5,6 +5,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
-- 
1.8.3.1


