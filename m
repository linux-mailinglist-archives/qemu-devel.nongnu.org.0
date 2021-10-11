Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D741442866C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:45:26 +0200 (CEST)
Received: from localhost ([::1]:59610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZo7p-0001nr-9m
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnua-0002eb-Nd
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:44 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuY-0004VI-VP
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:44 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iJ5v004463; 
 Mon, 11 Oct 2021 05:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=1RZKnaeEAYkXhzRLSn1V/tLPa22KWwgcgpeT9yelbmE=;
 b=pIUO1QZmbrH3YJB9Lmh7tUY4XEPROc/Svbt14JnIEXoN9qK7pWbiP1QcaUm5BH+FLVcC
 GR5E5Ola9WF0zOZVSB5eIbDm1+pwt/hKfSV7diZhqrnWRnfMmRIIUD26Syxry/qPVy31
 nHPIF6m4tCiV5cIZIxpCVqiWhzMUfwRiRNiQvFmJfTubkkZC2XlohQzhEBuosXy534Yj
 j6i1oE6huyWered8Knfn6Bi/fEA5anbgU7yaNNhnbZXBT6zDcpSduGiImC2t3kEFgevP
 LAcea630Vnc5jR0aJTFtcfIAvAgH20PQLmLdGIFn0JIl1GOBjdeG9qt0UTPYHznkKrEJ rg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkxs59thv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5UI0X084620;
 Mon, 11 Oct 2021 05:31:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3bkyxpc94y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naUjWRhx3HDqVdAZDxaHW8h6eXvB+b/FTMGBsrrBAlhiw9DqxofDk4/PzK7JIC2jqnFTsa6Ifsw63vX2KNPgiu1BH57in6xRU+8X4LgCZpRpKyQbRTjP8mNM44IsV573wflakCUloL7wPKB22ZKPIXY/CP1Ul24FZSrgMhtewqReiUOv0qh02BVq9+g14dZIJgqJjGG2s5PLIlHclZ0E8/PSJ4nkCkYUcpTrwTPrYCfkPJDpdcjgNdUlBUh16lGJv4G7c7U9XzglUcuiJPBnUcMS0GLvup4QQ/T7TufZKLT+pUFmN5+xFFmESkdp1B584Jfiig6xVHLrnixn0f3WpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RZKnaeEAYkXhzRLSn1V/tLPa22KWwgcgpeT9yelbmE=;
 b=P15rO8ImVgQHTaSJY1wEqBywFc21E/w5BTOgfjf3T9MziAmmKfkDVVIoRNLaaNXajSLaHqD8GYMoapnJwq0hc3mvIRFUdeCC1qc2kG8I+IvakUZkpFwfciGDqBgoqdhS/6iwj+/x9OSHHzbyswDn6mu617RDgVU1PfkJBfeh366Kgp2/zHl9Lu/2JZIocL2y7lA7hMxAH1CWjy5Ig4jHiNYmJN7VR7UFH7JpZhl7EtSYj8T24GVUsd92tRXWWOpjamFr1ZNLbyUHDJMqw9QFsEon1alKEY3e3gBMNb1Y2tbNXGQp4j9TNANq3SpQd0k65K3taSR42rCw7Q3KDFP5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RZKnaeEAYkXhzRLSn1V/tLPa22KWwgcgpeT9yelbmE=;
 b=Eekyu6QxTwcFB5I2TkGjW4VwVyUB0tIP9oS34cO95PExJHVbVWbrrYGtIDARSJ9/hgaEvS2CO+Is8ElrSxoSZsX0u87X7d3QkEy15NhH/KjnxrTBE2lz6Sui9CMtSgkbKNpfwCEVsVzbGL/ziFibSFq5IS0SN9Pfn7rN0DtaHEk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3902.namprd10.prod.outlook.com (2603:10b6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 05:31:38 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:38 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/12] vfio-user: find and init PCI device
Date: Mon, 11 Oct 2021 01:31:10 -0400
Message-Id: <697ee91edc2af1aae07a01d49a27156d0e87c00c.1633929457.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1633929457.git.jag.raman@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
Received: from jaraman-bur-1.us.oracle.com (209.17.40.40) by
 BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:31:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d60bf8a0-96f2-4d16-deea-08d98c7865c5
X-MS-TrafficTypeDiagnostic: MN2PR10MB3902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3902A1CA0EB2FC582603338290B59@MN2PR10MB3902.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: geznFlPkPv35p/PbqPTLViQsVqqXqq7RDhnsWnSnWylz/4mEeN5HBl23PcEx7UGwWimOFSjKUyCXWQ/T04+HScCXFJq/64qGq6KsskDgIjwthG+KujljpWuAsS1Itn11X8EDJNa4vXZvBj/AmDvsLosk0k5mx6opCz6OeKVye5C6XlK9HqAKxffQHpUqKiluiAbUuzmEwWBxIt6MvsWCjAhc3ayntuKYxQ6gBOlwWFyC1JiRRntCATygN0vpFSBl0fKY5FG/UPg2o05iQ+NPO6HgwrdgDWDKl7kFsVRRE+pan8iR7FkV1zGo6vKaK+O+Xz6hBInxOkbXWKGa6Keehprulx4O18PS12JIlwoySeb4hSa6ultCekIDzat79pMOwhUSmFJuZWrkqLYaP2Q4pYhmfqFifby7cqCLX/rqHfZJtudln+ph4LbcritcVh5khg+85QdYcNDYEGv4sDDhorfKUBzk8nDRRmGt/9yQo+rUgXlfsWlUWhtPUcfMJdzHyTdbuXYVOPyAOW2w/tloIpAXbhG4WbSLwyS4KynpKf8LGnfv3UTmijGWiA+NOiwrZzebVi63elohqsEcF6FCnP78p3Y+yOu/kJ54ebEJDX54UVyB1trzVe5jb6SZzEoU+6ODEkFR2jcClckRGLSFxHvjlkqVxPCdC7aGPkD7ZQ+X+GMIIFFjLVRmXl6F+jPsBLQ4DnhyiBkaZlrSfic7sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(6916009)(6486002)(186003)(508600001)(8676002)(7696005)(26005)(2906002)(107886003)(52116002)(316002)(38350700002)(6666004)(38100700002)(5660300002)(8936002)(86362001)(66556008)(66476007)(66946007)(36756003)(7416002)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+4fEWTvDiYRHCCEfnehthO7uzEOYLjhi8HiF8oEbUuJrUnhY0esqgQgVENiV?=
 =?us-ascii?Q?e0e058neAimz+Jo2tNypXh4LuV/UcnOasJmVwI2hf35vU3eS2seD655ZFk5+?=
 =?us-ascii?Q?BnpSknD0PLseccyGcmXVTkaKe7zj5ahCzBkLYigaJDaaXnI6PFGaRluAdQib?=
 =?us-ascii?Q?3BG69wJFWlnddtngTy8g8FqTBk93VE2ca+CYjeIdhf77dPL4ID/choJAhNp4?=
 =?us-ascii?Q?lbHrMBcFp7TL6GnEBiGe7Uqv562N+gF9vgpKnjTxH2tiAyYAqdvAbMDPkBIU?=
 =?us-ascii?Q?vEV7qNs2GNFkLUH0RDpOK29szg3TCBwFz0bisEkX6TCgKvJbndRcFJ5UUEmA?=
 =?us-ascii?Q?u1AJ/4XdaykWX5Z47YqXk+YGGaBJEmmUtkPEtaEbjK+xtb7bsHMwkIYGHOYY?=
 =?us-ascii?Q?8PjJBe6LgJQaTRqLjASsxYFfvN9uALSCtPwDAyEakVhCnYMljVgByq2TYyRQ?=
 =?us-ascii?Q?pepacu4gFGH0sf9PJ/eCsYFpooRCEmMQwdLK7zaQXLn1cPYUqjA8lqQ5BpTM?=
 =?us-ascii?Q?1EO2DNvij1pXGpcRzWwCedCkTsY1Me0KrDkwhrck5/bXwSiSvGQhVqJPZ208?=
 =?us-ascii?Q?GRh/OfviLWDKcNiPLuB2mMA40j7Uhp4Fz3gPhwESzJyhdS+h4Vb9MGK7BwKR?=
 =?us-ascii?Q?s7neBA6hWiMLcARMsMEXy838bRMF/FDXO8epqYuskk4TaJnxRIxSu0csczv7?=
 =?us-ascii?Q?bYcwOjK45x0RHTAOuoUbzPywIUrPKeEdgGSS45cDwKpO/1gwkZBanUbdoqwJ?=
 =?us-ascii?Q?gXfTg6c45zL2IwrYtEXTI4U3ZVE7cGBegOWLPIMGXVHzBNGBfAsVrhH1sUYG?=
 =?us-ascii?Q?mJ3d02iMMj7bM6xtGVxgVASxG3/i45FAni/NhjmZr0mX981MXICIi+r8Mq7z?=
 =?us-ascii?Q?CbmL6bSxY1wjhPLnSFq+wrKR6Af4TqDNznjpcJwcCnmJBbqK+kLvKnhlrioe?=
 =?us-ascii?Q?XiEjNSlF7lIa/wFEaB/7dcZaOsbZC9i7nRN4pN9ph+YHJ7M4XxWdQauBh6nZ?=
 =?us-ascii?Q?nTax/P9oumNMsMZRL7LLBmdo5IQwkjTn4G0rhdtthAKPzTPya0TR+eTSsM+G?=
 =?us-ascii?Q?UKt5NcF470biUTOGHnOLdT+sa6ZIWR1MPKWWMOE8FCq7/ytiMmzMMWCGLyFP?=
 =?us-ascii?Q?xqp6DzjuuJxuTzdcqcCwsmZPk1p+mHqnyIE18PFlsZLeTIysQ9rBbuXGfAPN?=
 =?us-ascii?Q?Qu7z0cqD+tM7wGRBVJaWjkPs7QfUuJKJqx3DsYtxrdAdMIlue3QA0TMVzJUM?=
 =?us-ascii?Q?mqcE0A8jIOedlGiC2Yvwh3PQ+vTifl7s8so/qG/6FJB9CK7QWvf1VNNMGfOn?=
 =?us-ascii?Q?fXlx1O/8O/NsDds0XMW9o96Q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60bf8a0-96f2-4d16-deea-08d98c7865c5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:38.3215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfjmexcMCant0PqHu9HzDNKNzPn9M+e3yenijNu+m4G/LTfIVrHrBVlZ/VtUwQR1qTgdKLzsnvEwaFwu9wYXRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3902
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110110032
X-Proofpoint-GUID: ZGHqJ26PN727LyWai-Z0EISo_qHxmsEK
X-Proofpoint-ORIG-GUID: ZGHqJ26PN727LyWai-Z0EISo_qHxmsEK
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index d26e5ec9e9..7ce4e5b256 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -44,6 +44,8 @@
 #include "qemu/notify.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -68,6 +70,8 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
 };
 
 static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
@@ -112,6 +116,9 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
+    DeviceState *dev = NULL;
+    vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    int ret;
 
     o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
                                 o, VFU_DEV_TYPE_PCI);
@@ -120,6 +127,31 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
                    strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->device);
+    if (dev == NULL) {
+        error_setg(&error_abort, "vfu: Device %s not found", o->device);
+        return;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(&error_abort, "vfu: %s not a PCI device", o->device);
+        return;
+    }
+
+    o->pci_dev = PCI_DEVICE(dev);
+
+    if (pci_is_express(o->pci_dev)) {
+        pci_type = VFU_PCI_TYPE_EXPRESS;
+    }
+
+    ret = vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(&error_abort,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->device, strerror(errno));
+        return;
+    }
 }
 
 static void vfu_object_init(Object *obj)
-- 
2.20.1


