Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F23C674A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 02:01:19 +0200 (CEST)
Received: from localhost ([::1]:56566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m35rS-0006xm-TK
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 20:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m35os-0004J1-7c
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:58:38 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m35om-00030O-Vf
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:58:37 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CNkXuu027063; Mon, 12 Jul 2021 23:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=TyB3YHk5pbJuNdHCnsEOD1oq20ebr4PwcsqUnGIM0ik=;
 b=yvQQtKb4njueuFaruvbWKLKt89ekQurv6uL5Pi47QMyblO4rFjg48NUHn28Pl8NmEIP3
 PGRn61PrPavqxjDro1t4mNlNzLjlCCbYZVuYCOSdLNSCcUwjajdb5/32z6mpFbkmv7ra
 VDg4SXSNo4/7UVa8gAtYCL0DIm/1MaqF2RfjiOka+xStLVfjYEFsc0L/2ooQv/Br1KRC
 ConNZDLPHmILNUbBb1mkxVfIi2uUYfbIZUDaQcnzSlynq3y7dEfTowzIrAvp3H885MQH
 hGFmLfqtsKAWKdjHqjS7J50a4ujJaFz0xbgrQzGkRbI4/mmMLGRyRXHIVSP8KGVWtCDR Xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqm0s497-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 23:58:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CNon9D078762;
 Mon, 12 Jul 2021 23:58:30 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by aserp3030.oracle.com with ESMTP id 39qycten6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 23:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTRl55a08AJAqod7rE+D5kBlFpnaxktY46RBc94nC1ijoef/fqjdjJul5QHIcl6MU7FdX8z0a5iERqzwz7X+IwNY0fsZXilv0/eiKAba/yNryIjv5mTiT4IPVKyFCZWkU3gBDO2X5qNh3NjY4d8M1njDuvZbdJwA3tNEGDKAfLTLGUE/rNvBZnXx0NpYz8fkNeeAAqn21Wvz+nxIYdT5TyeitKcI5gWQa5tVnd8oc764TOjtzWg8d5gt7Jc9VFuEbydstFx+UIgCerzSW2COJxO54Y00aVb7Qh18Le9pFWzx0WqHsXbvI+RhDtX0jbYGx7nzu9GoPRXyk+5nY5gN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyB3YHk5pbJuNdHCnsEOD1oq20ebr4PwcsqUnGIM0ik=;
 b=VgV1+JJCvYaMbM/8jXuMOua09Yfr98h9MDgEGqU8Yb0N8PGhqRYfKAAJc2BrNqjDG0t+/Yg3j78202O8hWaMYKSL543kfHN2/3LZQsGyjKYMUBcJYkpRxjPV+Qvf2SNo897FNQeYz/F3ixGb2IRH+eEoD4LygbY9qIFXIzZcksRPo4VWh5BeZZXtDTNEN2v3dJmn0C7jpRT9Ow83hZUKz7TIIaCPnwYPvf/RNMcvlG+guJBTiIiPZveAyStiUjdER4kEovMFeBJFc+2iMEBh+MYLJwuIMpHVwmHZ3ximB4gXpL6bb7Oo3pOnMqPz314pjbTwAGZwHkQQZcqCTM+AIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyB3YHk5pbJuNdHCnsEOD1oq20ebr4PwcsqUnGIM0ik=;
 b=ejB47ubpuREXqujMypcy1qdg7rO3Kwl3eHLqg7TVz9krUnP8tosYtlJRjFs4Ormd78zQEgUcD9oS0YRhP3DaUlvZc4bWzUEVs3Xaz9BObe4D9J1EXwwowPbYy6qANxmRZN6QIODieC/7OU5G5yFzvWMrQ0z0EcWZupLerYpmVsY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB2598.namprd10.prod.outlook.com (2603:10b6:a02:b1::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Mon, 12 Jul
 2021 23:58:27 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4308.027; Mon, 12 Jul 2021
 23:58:27 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v2 2/3] msix/hmp: add interface to dump device specific
 info
Date: Mon, 12 Jul 2021 16:58:11 -0700
Message-Id: <20210712235812.19725-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712235812.19725-1-dongli.zhang@oracle.com>
References: <20210712235812.19725-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:806:d3::24) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SA0PR11CA0019.namprd11.prod.outlook.com (2603:10b6:806:d3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 23:58:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f4c57f2-e868-4681-cffb-08d94590f121
X-MS-TrafficTypeDiagnostic: BYAPR10MB2598:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB259838DB66F691B21F4DEC1BF0159@BYAPR10MB2598.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FIWX2UNTZvKZ+2yPiyYi+3UwCctOaUjMkX5YYs9Y8Vh++zcIIId3NJvl4EhFjojom/5pMspKcV1aBMuQIm3LUde4bzyjS9V2Y5HBlTAxcYXYfqxE73TiXoaBI2GVfJsrutfxMydlnZzsXIaJNz/x9OCY59e2rR/xEfxZVsF0bh6JkHgA+Z3sqaMYJYXRU11g/osnvbkJPtM+0GBZEx+0pM1+7fUVeZKhqSTEs1r8ACIDCGTqHYZgy6TY/ZjcdpsAmW+CUXfkwfZM0Zqk2ErkgPHxxnNSVr1y1OrWIJGkQLPgrdv9ac4ta/S43IZrwxdrMhgYVO6S8R+K9+H4ZlxiFMG2RFP33ujKUOG/jlvbw8Dtw2LhZqZhUYpQt0j32Py7EdxDuXI6BaPcHE9CqDWEzaEo6scfbVoOur997EhF7LlepkhP35yfrPtNqxQ0pP1De04UzFo7s42Umq/DHWecvY5UI1ASun+BnhLhh93L0oAqYDQqcm1dKwW8NINvM8b/XtEHIl+/GbSX6279eiJ5AWFp2wkPd5/dDb/rh0sPmtu9qkmnFnVmp1jfZ0pwvD9oM6ufONGiBOXm/ZBC6V7LGNg2dZ5UDIIpx4z3PY34cl2LraVOm0uFFtEstx77MpY1dIgasbxkUhFfZScFjCCs/OpDWq+wE6uILzIwoATZ/5US4Dhdgu+yl1IoZYQRzLzNZjz0BmhDwlWw2nISn4kGjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(136003)(376002)(396003)(366004)(5660300002)(6666004)(86362001)(38350700002)(38100700002)(52116002)(6506007)(66476007)(44832011)(66556008)(66946007)(6486002)(36756003)(956004)(2906002)(83380400001)(2616005)(8676002)(107886003)(186003)(6512007)(6916009)(4326008)(1076003)(478600001)(8936002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+HVW56ZodZnONNQD8m4kAf0JnCRDUSzUCKDa1Zfnk/Hk0wbg7C0lWYv38XAh?=
 =?us-ascii?Q?gslPlegIPw75U842QRRpdJCAVIUU5FuIaCQswiYIS00zguAM9rrCyOponPP8?=
 =?us-ascii?Q?socvOI7WcVf+ZitQgQM46/azGIRZVxJA7ZkMtoIcHKH5ESZS9QLIYO2gS3kP?=
 =?us-ascii?Q?3ME3grszFO365A58SizIKv9j0OakOVM+hRPdoT9GiHxNfA4oYei7qH4eEMXX?=
 =?us-ascii?Q?QP2ELu2ns4r2yFeB4tn/0jtqo96wUlXN7dVKHnhTGbF5IXNWh4az7HVcU81j?=
 =?us-ascii?Q?5Q94Nx6IKxsBqpo8EJnuAppVXSlaDTLpFbDoO9YrzcVIPxWp2o0ZXNScMTdk?=
 =?us-ascii?Q?WQ9+afJL2dIDlpgdQ/9rE2KayVP+2oMSLIOiTqb1w81SDA0h9Mlp8RQrpd5y?=
 =?us-ascii?Q?QnKAJoQ4ucaEik2M2fJxYo9P9n31Bb3vGrzEEHhne9mRkSdlQv/AELyZrLqq?=
 =?us-ascii?Q?fmNTgXW9XN5J1GY2CrUCp0cPK01IDFVmdKFDC7GFFictXq17v34lVD7iyxdd?=
 =?us-ascii?Q?2wQ0zBUIWTWw2cfs1lOStlUHo082f+pIFXkt4giZK72jeY2OWCHWwPqoBY2B?=
 =?us-ascii?Q?Xc/6s573WBHFd/Jexu7jq+V2MMLmYWOe9LwzV56iCmJq6T+gcH3WruX92Mcb?=
 =?us-ascii?Q?hL7pcw0cRb4fe41QYLZpOsBfDjfFYTyw5r4xEq82HnCQB1M3pKZDbNTXPk2e?=
 =?us-ascii?Q?ZlN1euoW0Y6Ji855bj1YayiJxPRI1OYzitmpa48/nNx0lvzk0MBZCfvHRzhl?=
 =?us-ascii?Q?5phvlANSqum+RjGdFD/+545cFvIooVT1EvodF2A+0Vid9FtaCqcYThEh2VlD?=
 =?us-ascii?Q?AZ0Swt8ttz+aolyM7yq13nWtPeRSBwDGtxxz28Yb/zMncSN8+5JTCbyfgADJ?=
 =?us-ascii?Q?n3B4a6Coxz8hQPDsigE7RCq45luMYBsUWTs09m0KZge/pNpe6BZrXhAL0itc?=
 =?us-ascii?Q?i1QH6QIqvI/y67sS3keBgwj+rdk6nhvUQcQRLnR5TTxElXy8atu/bGJBF8nY?=
 =?us-ascii?Q?18rfxitIo6U2g99DT3HiONL9VrJw2hTTcfEfr0F3UyYszJGMIrmc7PgW/xDw?=
 =?us-ascii?Q?+p78GjNqUAg5Sn6axfqCZsWSxzvBTpVHoo37C6LNpls1n90xbtPyF9Lo1ji0?=
 =?us-ascii?Q?s8RPMjCtWxRKrgtF79Y2+JH96uMmubbyrk3fVNCtFez2liVgUHV1EQ5QO97S?=
 =?us-ascii?Q?/nFA4SXOZAQDzI7xEETbbX22XQ6pf1cFMWgE9bp/hK4V9bSwEwA/DEQXr77A?=
 =?us-ascii?Q?ecO70Fp9lJWuL9X8Mi5+O/Yd0znrfZfdvVMfYw9bd6ZzVgdR2Ahl/ijLJvBy?=
 =?us-ascii?Q?f2ldbAbDaQ9ziShMhk1YxZ7i?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4c57f2-e868-4681-cffb-08d94590f121
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:58:27.4107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvxNw2ajfNgG2nCcN1BaywiEh1nXP5hrAK0vxhDHKJvJVjbTbwO2jeuluFOJGgfRvoW/oUkhW7YtCzhV0GWEIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2598
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120162
X-Proofpoint-GUID: PnoCFTqeiwEoADEhoMmuHsKwWj_su_Do
X-Proofpoint-ORIG-GUID: PnoCFTqeiwEoADEhoMmuHsKwWj_su_Do
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the previous patch is to dump the MSI-X table, sometimes we may
need to dump device specific data, e.g., to help match the vector with
the specific device queue.

This patch is to add the PCI device specific interface to help dump
those information. Any PCI device class may implement this
PCIDeviceClass->msix_info interface.

Cc: Jason Wang <jasowang@redhat.com>
Cc: Joe Jin <joe.jin@oracle.com>
Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hmp-commands-info.hx   |  7 ++++---
 include/hw/pci/pci.h   |  3 +++
 softmmu/qdev-monitor.c | 11 +++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ce5c550d44..4e831d7ae4 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -223,9 +223,10 @@ ERST
 
     {
         .name       = "msix",
-        .args_type  = "dev:s",
-        .params     = "dev",
-        .help       = "dump MSI-X information",
+        .args_type  = "info:-d,dev:s",
+        .params     = "[-d] dev",
+        .help       = "dump MSI-X information; "
+                      "(-d: show device specific info)",
         .cmd        = hmp_info_msix,
     },
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c460..4620b9e757 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -129,6 +129,8 @@ typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
 
+typedef void PCIMSIXInfoFunc(Monitor *mon, PCIDevice *dev, Error **errp);
+
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
 #define PCI_BAR_UNMAPPED (~(pcibus_t)0)
@@ -224,6 +226,7 @@ struct PCIDeviceClass {
     PCIUnregisterFunc *exit;
     PCIConfigReadFunc *config_read;
     PCIConfigWriteFunc *config_write;
+    PCIMSIXInfoFunc *msix_info;
 
     uint16_t vendor_id;
     uint16_t device_id;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 7837a17d0d..7fd3fe0ada 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1011,7 +1011,9 @@ void hmp_info_msix(Monitor *mon, const QDict *qdict)
 {
     const char *name = qdict_get_str(qdict, "dev");
     DeviceState *dev = find_device_state(name, NULL);
+    bool info = qdict_get_try_bool(qdict, "info", false);
     PCIDevice *pci_dev;
+    PCIDeviceClass *pc;
     Error *err = NULL;
 
     if (!dev) {
@@ -1027,6 +1029,15 @@ void hmp_info_msix(Monitor *mon, const QDict *qdict)
     pci_dev = PCI_DEVICE(dev);
     msix_dump_info(mon, pci_dev, &err);
 
+    if (info) {
+        pc = PCI_DEVICE_GET_CLASS(pci_dev);
+        if (pc->msix_info) {
+            pc->msix_info(mon, pci_dev, &err);
+        } else {
+            error_setg(&err, "Device specific info not supported");
+        }
+    }
+
 exit:
     hmp_handle_error(mon, err);
 }
-- 
2.17.1


