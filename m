Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0D1308AF8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:09:38 +0100 (CET)
Received: from localhost ([::1]:45076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XH7-0000IL-3C
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WxL-0007xL-8t
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:49:14 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:60908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5WxH-0006LC-5d
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:49:10 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGNxhw130066;
 Fri, 29 Jan 2021 16:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=cNYU0B7JbTLROTMkr7J8168w0RUV5sRdcKFDaltOIXY=;
 b=SrfKwzerxVxM8rPJ6qoUPr0OMLWtQfRZA+WQLs4K4+Uj0ZlZcbVyPcGDa4bqj5bIUXr0
 lbea/5sQoUkUDqL93ApsYIImYX8wD7Oxd1zMs1q+Q6zhW6GIKJ66iJ7cq56v1xuCyyJO
 deeNmTY+7kt/tKV4GeKDbLT2toN5tDjBXKQVwPDZnre6FleUoGe7Baw+HZH81nQyyiIT
 xf7G+QcG56Rxi0EKbTFM6tcemh7vQ0eWj/Eqfl41X1dcsJhPjkceK3RD2uRXKPDjrf3f
 nYWdZnhKhmgTHUWV8+UShLVbZ9Xhns96R7TAlOGmY3rDDmsAV3Qg8bppHtwoUPxSyNzV IA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 368b7ra9t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:49:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGQJSS039835;
 Fri, 29 Jan 2021 16:47:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by userp3030.oracle.com with ESMTP id 368wr25b09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:47:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiFbCGJb0O4E+T0+e/ZQERUHSwtiNQZd6A+yiBHnbzVXFlmCo3Kah+bfRwDLBrtUnu0YTOniQkWL0CG6fGbToJRLwr8e124icy+riqv3y+9P5MP7PYsjg2nirhgUDue8WbXySjnjSgaa9/Rcn+cEpisdDpVLOMMzzV4g+t/5xymi73qIJzaqhIWrdZyqy/b+F8OzKXTYj7Oo9sta6CpmBnq74+soe/Dg6QObAW3/69acQfDCYKIyHyjXHqml6fi1umS4Z+ur87/aUgNlvdoX+R4l01Re/pQc6PUUdzIGHQWhcMtLFU/pB5Vk4VqoteqD1DlEiG3+SIm+dBLeYKu/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNYU0B7JbTLROTMkr7J8168w0RUV5sRdcKFDaltOIXY=;
 b=T3uRKEBZDUDGmE7aTWkGqhzNhKSfRASlimLuIl5vHLvRWPm2hN2Z3wZp2sj1LIKXIrSTtPhyRifRbDS4sfqYC/CmrG/uTxDN6YvC7IyzhWvKqHwyMjfBQpGn4Tva6GwqgQow5vNKsA4ExxdMmQQ7rSSShQwY4A2B2sxcioFfYS9vSL2/Q50W2LQn+GJWC1y4JjTFBeK0T9bOiVevCm4mwnqKEHmou0CWtsjv4oO2tGERytXpcQsWe/iiW3h7BI50830N/W3BjFQQaSBmVYiIKNJylThFpKFWetkqKc1lLGk4OLJF+ulLJBI0gJrosWa73s2kNilgtmGDIhHEjOIuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNYU0B7JbTLROTMkr7J8168w0RUV5sRdcKFDaltOIXY=;
 b=LyG9IWJ0wKgnLXt6o3na4OaiKefDn+Q/uJaXa2GWMTVKUGaH7os3lh+fr3js0HcIUi31vr3UigWsgNllYx4SrtjC4HnShnlzl6dgG6JcCvuMiH3FWIYkF70M7QLLajVC+UcpizG7G6kWhhWY+XWGJiDpu2qwXGBBi1txRWLbJeg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:46:58 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:58 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 12/20] multi-process: setup memory manager for remote
 device
Date: Fri, 29 Jan 2021 11:46:13 -0500
Message-Id: <7d2d1831d812e85f681e7a8ab99e032cf4704689.1611938319.git.jag.raman@oracle.com>
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
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 345f316a-da45-4ca5-cafd-08d8c4757e52
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4671DFA90949849EC9E58A5190B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yYtBqguYTuCWNexFRA1vkYpylul2oI6FaLahibGNu6liCOmjluxfxGZsOy2kJE22fVmGkniCkHsl4V2t9anko2PNszxzNaL4sj7momZN8ualp441hBQOkpIoBRD3K6bhyfgj3OtCSEvHJ6N+9kctc0gSCrQqHGOwnsVWDpv0UHSq+bcXIDcPrO5l+fhAjxld6sgbVF45dcSHPDJgZRI3T4ZCh/ZP2db9ovxRcPrqxqGmyXnOIGdIu8zliVD98KCDOqV1avBBvE3KcApTHNQuGVU38RntRuUcozX09NHKTcp6B9mFlPvF4PNEfR4asaiTlzDNgfZIHGIOEvchtRwhI0DFRkNQI2go6JnLRAuurHWugYR57w6lTnKuBrsOJEIK8qIvibpwUsyRPYQ8i5FXP8Uiip4gGIGRrLXF65jCG1WcF01TrEiX3ri0Afw2ymWp/y6U5xpQHUUhaHrsOcxzalFHcuc+sHJOLRnW18wl5zuMUSb8OMK/HE6G92wuYPy2zdo82rWDMvPSHgow2CtpxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(83380400001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YUIxVlBQRGI5ZUxGV1FpRW1aL1VMZFgzSzFqMXBiRHEvRE9DSERQQVZ0QkJ3?=
 =?utf-8?B?T0FOdDltZXVUMG5SeGxuNkdFM1gvbW5JYWFIR1hwWUJJaXF2SzlNSVE4ZFFv?=
 =?utf-8?B?dmJsSVRTVWlKdXZSVHgzTTVMUS9lcGE5R1FSY1puUmt6MUh1TTBwQVhVQ0NM?=
 =?utf-8?B?LzlGVGJuOHY1YTZQQlF1NFBjdUpSVlE3OUxtWVQyYVlIU2NxREFiWHliZS9z?=
 =?utf-8?B?Q2p2MlIvK0o1SEJOWWZxQ2hjd2U1Tk1nRTZUSGR2ckZlQllMczYvcDdhYnVV?=
 =?utf-8?B?ZGNTL1Rub3hDdVVpbnBUdzhGZzI0ZzQwNTd0amR1S21tMk5zMFp6TWwvTWRl?=
 =?utf-8?B?a2h6b1NNT0xsenY5L291RnlUVXpVK2ZudkF2c0xhcXpST2Q2SUFhMEpqT2Yx?=
 =?utf-8?B?R1B5SlN3bmJpbEhkWFVRNlNaajRyRjBPUkczbWZjYkVEc01FdGgrbkRCRGN4?=
 =?utf-8?B?VmFlUHlOWHFQdGNIbGtEMk9RN2xBeFM2MGxCU05tejMwUS9tUHMyN2ZFdmk4?=
 =?utf-8?B?ZHV4RzVGUk1SbzNiY1RYUk5pSzk3Y0U4RDdWQ1ppeDdaMHdJaDVXRGFTSTVW?=
 =?utf-8?B?ZDZjVEloNkZ0VmVWcmFWb2FRbUlsT0lGanVoRnZicHJFZERualZFWHlPNmpS?=
 =?utf-8?B?UktZRmYwbVNWSjV4V2xmc1NLS05BVW5uMW9peWk1cDM2LzRocWpvMnprU1dv?=
 =?utf-8?B?aXlKYVFDbnhHRVI1cnZybk1Jb1NpYkhzNWJNVnZrRzZnMG1zc3pVUXVXN3lp?=
 =?utf-8?B?bncvb2RhTlIrWWNEWkhBd1NPWDV0eEJhNE5JOGoveG9WZXhwR2RoQnNpVS8w?=
 =?utf-8?B?TEU1YVF2RTF1TGJPMjVUSERxNEpLUmtKdHY3TGR5ejNUVDUzb1FsRHlVZTdm?=
 =?utf-8?B?RFMycEZVcG5ua2Y2OUkyOVMvamRySmNWZS9XWndvUExUT2c3YWpOdzh2R3B5?=
 =?utf-8?B?dko5Y0Vhc0piZENEZlFnZGtlbDdhNU05cWNlSkFSTVpqZTIxSERCekFpWDNH?=
 =?utf-8?B?WEhUTzhzcXFUdUgrUnNCZk1VUmowUHp1emRaeU5jL0RxWCs4SUhHb2J6UGZI?=
 =?utf-8?B?VysvUWxQanBUbmV0Q25FNGQxOVhhT0RhS3hBNWJHZkwyTDJoamRhMERsVENE?=
 =?utf-8?B?SzZEa1BHWURtOWRIcys0bUlYUWltRnNxajVWdzYxb0RCaEFlcHZ2bFc0eEpo?=
 =?utf-8?B?Ymk4OS82MGNWNm92TTdvWnh0RlBhZksxZzIzL08yR2RRSXkwZTVleU9ISTd3?=
 =?utf-8?B?VDJKYklsRFJ3eDdkekJVT01hUURpMkdVcm1kdTRiY0MyRTNBQ0RxZGpLaE5E?=
 =?utf-8?B?Vnp4RzdYdWtXUGY1YmtWdzF0aFJ0NEYzRE1WSUVzMDQ3dmIzMXZ3VHFNQjhZ?=
 =?utf-8?B?VE9pUXNLSXlnTXA1RnJGQzBRc1lubzRBME13V3kxNEs4SGN5Rk1UODdpTGk2?=
 =?utf-8?Q?j8M67TZd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345f316a-da45-4ca5-cafd-08d8c4757e52
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:58.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFNoxHWNu6fjgTHXng1+iRN30LoIVToh/Ads07VFYP7m2olBnDk6yoOaDCAh2ZUbKl/zN0bmPx0K6AKC+NJOmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4671
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
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

SyncSysMemMsg message format is defined. It is used to send
file descriptors of the RAM regions to remote device.
RAM on the remote device is configured with a set of file descriptors.
Old RAM regions are deleted and new regions, each with an fd, is
added to the RAM.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/memory.h      | 19 ++++++++++++
 include/hw/remote/mpqemu-link.h | 10 +++++++
 hw/remote/memory.c              | 65 +++++++++++++++++++++++++++++++++++++++++
 hw/remote/mpqemu-link.c         | 11 +++++++
 MAINTAINERS                     |  2 ++
 hw/remote/meson.build           |  2 ++
 6 files changed, 109 insertions(+)
 create mode 100644 include/hw/remote/memory.h
 create mode 100644 hw/remote/memory.c

diff --git a/include/hw/remote/memory.h b/include/hw/remote/memory.h
new file mode 100644
index 0000000..bc2e309
--- /dev/null
+++ b/include/hw/remote/memory.h
@@ -0,0 +1,19 @@
+/*
+ * Memory manager for remote device
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_MEMORY_H
+#define REMOTE_MEMORY_H
+
+#include "exec/hwaddr.h"
+#include "hw/remote/mpqemu-link.h"
+
+void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp);
+
+#endif
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index cac699c..6ee5bc5 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -14,6 +14,7 @@
 #include "qom/object.h"
 #include "qemu/thread.h"
 #include "io/channel.h"
+#include "exec/hwaddr.h"
 
 #define REMOTE_MAX_FDS 8
 
@@ -30,9 +31,16 @@
  *
  */
 typedef enum {
+    MPQEMU_CMD_SYNC_SYSMEM,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
+typedef struct {
+    hwaddr gpas[REMOTE_MAX_FDS];
+    uint64_t sizes[REMOTE_MAX_FDS];
+    off_t offsets[REMOTE_MAX_FDS];
+} SyncSysmemMsg;
+
 /**
  * MPQemuMsg:
  * @cmd: The remote command
@@ -43,12 +51,14 @@ typedef enum {
  * MPQemuMsg Format of the message sent to the remote device from QEMU.
  *
  */
+
 typedef struct {
     int cmd;
     size_t size;
 
     union {
         uint64_t u64;
+        SyncSysmemMsg sync_sysmem;
     } data;
 
     int fds[REMOTE_MAX_FDS];
diff --git a/hw/remote/memory.c b/hw/remote/memory.c
new file mode 100644
index 0000000..32085b1
--- /dev/null
+++ b/hw/remote/memory.c
@@ -0,0 +1,65 @@
+/*
+ * Memory manager for remote device
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
+#include "hw/remote/memory.h"
+#include "exec/address-spaces.h"
+#include "exec/ram_addr.h"
+#include "qapi/error.h"
+
+static void remote_sysmem_reset(void)
+{
+    MemoryRegion *sysmem, *subregion, *next;
+
+    sysmem = get_system_memory();
+
+    QTAILQ_FOREACH_SAFE(subregion, &sysmem->subregions, subregions_link, next) {
+        if (subregion->ram) {
+            memory_region_del_subregion(sysmem, subregion);
+            object_unparent(OBJECT(subregion));
+        }
+    }
+}
+
+void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    SyncSysmemMsg *sysmem_info = &msg->data.sync_sysmem;
+    MemoryRegion *sysmem, *subregion;
+    static unsigned int suffix;
+    int region;
+
+    sysmem = get_system_memory();
+
+    remote_sysmem_reset();
+
+    for (region = 0; region < msg->num_fds; region++) {
+        g_autofree char *name;
+        subregion = g_new(MemoryRegion, 1);
+        name = g_strdup_printf("remote-mem-%u", suffix++);
+        memory_region_init_ram_from_fd(subregion, NULL,
+                                       name, sysmem_info->sizes[region],
+                                       true, msg->fds[region],
+                                       sysmem_info->offsets[region],
+                                       errp);
+
+        if (*errp) {
+            g_free(subregion);
+            remote_sysmem_reset();
+            return;
+        }
+
+        memory_region_add_subregion(sysmem, sysmem_info->gpas[region],
+                                    subregion);
+
+    }
+}
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index b3d380e..4b25649 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -201,5 +201,16 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
         }
     }
 
+     /* Verify message specific fields. */
+    switch (msg->cmd) {
+    case MPQEMU_CMD_SYNC_SYSMEM:
+        if (msg->num_fds == 0 || msg->size != sizeof(SyncSysmemMsg)) {
+            return false;
+        }
+        break;
+    default:
+        break;
+    }
+
     return true;
 }
diff --git a/MAINTAINERS b/MAINTAINERS
index cbc252f..79cb35d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3196,6 +3196,8 @@ F: hw/remote/mpqemu-link.c
 F: include/hw/remote/mpqemu-link.h
 F: hw/remote/message.c
 F: hw/remote/remote-obj.c
+F: include/hw/remote/memory.h
+F: hw/remote/memory.c
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 71d0a56..64da16c 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -5,4 +5,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 
+specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
+
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


