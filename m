Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4D428678
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:53:09 +0200 (CEST)
Received: from localhost ([::1]:38656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZoFI-0006w6-Fy
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuv-00031c-3p
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:32:05 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnus-0005ze-AA
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:32:04 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iKQo029463; 
 Mon, 11 Oct 2021 05:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=O1wqZMWk39yr286dA3PYdCN8oDXeZEiPhp+mHBjH64A=;
 b=DVvbBaOv1TbOvkUV/hwIfuC7XYkRsD07dIXpuLlG10qOGMy7k3gUtdWvW0Ku55bGmmLp
 Ed3Il1NSp1KtbexvTAbzlNJJqasJoxGENe8+EEkaTcvrwZCG1rmKTipySAsVBVjdJqEv
 jJ1PF1cvbWIDvDqrZaHM2+JJzl6hnex+RI558GgrGGCeUBdYoUAbw/n2oW5i1QLyYjzr
 e2/uoShvNmZP3kh6kc3epxv9Y38/+mYo3fcQjv+2NJvsIpaw7b4xlZScBW38RPad5ZQY
 WG8eSBZMjdlqgGEy4/57GnKi9iVOjZWMey5yEiP0vkDnW56NX3SR9g9yp6j8ylcj6pjw 7A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkwxh1v9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5UImU084597;
 Mon, 11 Oct 2021 05:31:57 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by aserp3030.oracle.com with ESMTP id 3bkyxpc9ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCZiGaSepk1nU7CYUuWocvaJ35Do1Gj0Z9US9WEPHsCxu9gQdtk1k3drrVdo1pcTg+3gq+GGD+ce/CURuCPrHVg9WT9gKsFXSaTq2ASoVuRa3Rjish3ZTHiKI5s8P+5o+y++aYc4wO2Vwls52pacJOaYoWDM0jIahe4f4q+AJ3Kt0x0jHJ1dB+NKXxQYO7tAABPcWCotkMz7eSJ08rs1v1Cc0/RRMSXjJGHz7iOIs9cp/usr1DJIUUWITA0qaR/CdfSjbOZ5AqZcuMdEDZvIO3lFz6pdTtHG0WfgSVIaXRbEGP7lmj8KG5o+wXSwKggV5R9WKoN7y1qBnZsHwiYqHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1wqZMWk39yr286dA3PYdCN8oDXeZEiPhp+mHBjH64A=;
 b=EPnoSbXovxuORvDc3+bPcfDd5a8Cy4cZSaLo2HQagyqNotRK0dJ3IdDRitZAi7REaQOAJfD2cthdihQcXYMsKJ0S3Sfr1n+xcv2ay1COixefm7WChJNhOsYze0B5zXgJ6ZCFbTW33levQB5NDfnl4GfL6J/+Nnx2iIDkK54y2M19ojVG96AUouucPaf7DFs1RoTgtLpeTDIclAoxZbQQYNcsMFptyiv5JktO61W5FyTnQj+i5WSp+NjKVebT314HyWbkRpFrWBE0ZS8PgEqVbchecYpSSnq9n/ZGeEEv96SpvHwbIn2lPflcDSn968KvvYyo3TSqpM+uSDMqjh/sWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1wqZMWk39yr286dA3PYdCN8oDXeZEiPhp+mHBjH64A=;
 b=EB2YQXQwXdLSINDnCMdjcsHIf5qyNDpDGC0pRqRfNG7tNHVlfEtDe3eQU/5WzI5IOw9TlJNFRslgyKywjJDBF2vYnjUeF2Ax9qEcArFmI19o04MYRWxlf3kICUCFGYGx/i9nLeCm8fjBKEobGwFn7ilfnRUan8vcmKDrAkEMhgc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3775.namprd10.prod.outlook.com (2603:10b6:208:186::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 05:31:55 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:55 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/12] vfio-user: register handlers to facilitate migration
Date: Mon, 11 Oct 2021 01:31:16 -0400
Message-Id: <9f85493af346c32d34cca3622e8293053b5c7440.1633929457.git.jag.raman@oracle.com>
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
 Transport; Mon, 11 Oct 2021 05:31:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b31a34d8-31d9-48eb-d373-08d98c786fc4
X-MS-TrafficTypeDiagnostic: MN2PR10MB3775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3775A24B38E13D57FECE1FC590B59@MN2PR10MB3775.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7JWs124s+2WVP0Eh7G5I4NGd9NjfKmzDS4eeK+4yq0ekeDemQJyyJQlohZ7Iy93i+sDHv0lM++TCQ1nYV1LS86e46EYC0eM+K3gbmnLHPFHxVLOKSGwNwy5jtPFl9kH+bbE3e2bI6kmuLO85LEVy1BoLVgFiE8Aw9r3hBqi30Z7yfpiKit3bDP2ZYFgN7QUWhvrXymsnuanXYaiJhV00m9Qp+ROmY8ZigV4hC4kzEwxEWMs42Lwv4OBtDKv8l3EzWW1PUvJxhoE39mGtGvPMrPmP1A6K7hJAX0np33OdVUxd/cDg/pwKFq98fjP3OQlshADVch+yrr5lPtxEx11CPs2PIT23kRgbG/vfNAy+QyfQPYR3CYiEFROW7NKf1mssZELtUTPP4eryaAICl8+oF4vLunmUUxP9TMRG0Cyj/xF8Hv2FhrfellctTbsO6p5dzPzsgsqjoKBwuaFOgk18ye4S+7Pm0cAuP7NfU/VHkRlIFzvtrLJr07cjKGFLucnbVmSemhaRohBwcsm622Gf9IYOWiqkuKeyodyY1QeUAqWFeRJJYPkB/G0sZ/UsQzmD98NffwUyMZf5AyJVnUcrZxQga5k3c1jPxBPuRQQaMd1rGK5Ls+B1hceZeJ3pAOxguWLAWX17QKyHSbr6kIcNfeYkdneAkiTOprMgr9IgZYu2CdjWXPbSrh5cxlLXo1/rsrI/u8czBmRsHx2EVc1URQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(316002)(8676002)(36756003)(66476007)(956004)(66946007)(6486002)(7416002)(4326008)(2616005)(508600001)(6666004)(5660300002)(8936002)(7696005)(52116002)(6916009)(2906002)(107886003)(186003)(26005)(30864003)(38100700002)(38350700002)(83380400001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pxDmmbqMsQuzH8S1cHUAgjTquDGUE0Itw12NL/iAhcI2HQjpDu2DXoIHlWPd?=
 =?us-ascii?Q?GGGXb3Lhmgmod+xjocm/syXpvjkQ8UjsAqAwE7nHdgfHHqxyACc2DjilQaI/?=
 =?us-ascii?Q?N/oPeVPLhL2izGGSnm9tdvULSW/Ndkuchg+w7WF/6EK1ioXgj9WcSQKrnvNL?=
 =?us-ascii?Q?M5HL6f+nhYEJdKZ5Cp3D+Kql3N3szi2J5Uz2OZUatL+6ldKHum8apbINVBKJ?=
 =?us-ascii?Q?DZ9+mkU80Qe8DzkZtmS0I80Bw7VUxSLddVOkfGmAY3rxzWa1Fvx659KaM0gq?=
 =?us-ascii?Q?aF0eui73hwICb8v3HrMM2pOxI4HKMGPtxQU5GOYLVYo0hxubCrxDcXbzaA2k?=
 =?us-ascii?Q?GZPfsvitaFVyQ5dXtn6DJNU3Vqs0eIvW2z3HGBLTHKbZV7Qnd/JNSsAkhT/o?=
 =?us-ascii?Q?Mz4TZlhhDFQ6LttI207G8g7EJIxK15aMofWtOPfdD0xElz8vSyN22BBMMEMr?=
 =?us-ascii?Q?tu+gizBc4jyZ1NSrIfdkSA6NrDhNwV7gKdCLMGNummol2ts5ClXD4Oez58Yc?=
 =?us-ascii?Q?1wGrhO2RVR0v9KaDJYBb/cBfdfVKy2FcTsFY/9+AuFYHYQScwbWffsLC+hbG?=
 =?us-ascii?Q?zru9zIXTNPIvcZh988aZSdiFNrJTpD6hFrW2s9BnuZekKIYMWQOnEb/lakYs?=
 =?us-ascii?Q?k51umUBWYnBivDUl32PHiZ5rJCbm2kodjbeCpq75vPQjKpqrIMS/37BhEgu8?=
 =?us-ascii?Q?EMfr+3VS5H0r9qOOTjIZtwxnIG/+H/NqxG0GnKfRGjHQDzO1qRiQ/+dh7KNb?=
 =?us-ascii?Q?kq8k3BuQxb+eZguXTIWDW83LARTHTcc/WQyfzZ9d+R+EGU/5AA9f79B5wMsp?=
 =?us-ascii?Q?9YdsgCHB+/PvjahtCOzP7qStjVNMIi1i5Km6IcFuhNU9mc2Xh8Exopw6ua2/?=
 =?us-ascii?Q?WDI+SXFXL17xyb44vvw235tpwJPLufTPFq0xbbmTxhSTo21wKHzfEu8xCNNG?=
 =?us-ascii?Q?6FydbSA0QvS4Isk6m0Z/wiEr0yDdBtGmLYy+u7N2uB2UgTb2/ewrD1rOv87S?=
 =?us-ascii?Q?/wgbF28HodwPjJzda4CiQCKZ8SOkL5xgyY9uEgMPKI92nxqY09CVo0TY2kYl?=
 =?us-ascii?Q?CSj1FuAfqypc4HAkdpIvy719ayBQvku+ud3YiPYt4+WO4bXwypWT/WG6CWmc?=
 =?us-ascii?Q?RAGhMLGTimOj0RiDXmF1uqBTZUqX/QGTSsoufCkGt5QR+ZDvgT/1fwFuhfUM?=
 =?us-ascii?Q?aXGkAgpAuRK+n82761dL0A7jKJTS1yYOC7lLZ0fZt986ERYRcUTOl98pBHM7?=
 =?us-ascii?Q?NA7U7TpfXNCjmb18JZZepHBk3dI2DJiwe2zl1UfSb9H81UlkqJLAwEZnZuTn?=
 =?us-ascii?Q?2qqpHvffIwNuj/meWlea1W5u?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31a34d8-31d9-48eb-d373-08d98c786fc4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:55.0848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rl6VYZhGk1n14/18ltg+FLvKzsFK+B1ZZzOVLfiraBdYufAvjrsJEd6hReQiqzf4AVEUnXv5igTfWxG8p/mvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3775
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110110032
X-Proofpoint-ORIG-GUID: 6Mkas_ex6E9yeHWhr8EqeCGRyojcRiB1
X-Proofpoint-GUID: 6Mkas_ex6E9yeHWhr8EqeCGRyojcRiB1
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Store and load the device's state during migration. use libvfio-user's
handlers for this purpose

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 migration/savevm.h        |   2 +
 hw/remote/vfio-user-obj.c | 339 ++++++++++++++++++++++++++++++++++++++
 migration/savevm.c        |  73 ++++++++
 3 files changed, 414 insertions(+)

diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342cb4..8007064ff2 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy, bool inactivate_disks);
+int qemu_remote_savevm(QEMUFile *f, DeviceState *dev);
+int qemu_remote_loadvm(QEMUFile *f);
 
 #endif
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 63c468d6f3..757355ecaf 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -49,6 +49,10 @@
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "hw/remote/iohub.h"
+#include "migration/qemu-file.h"
+#include "migration/savevm.h"
+#include "migration/global_state.h"
+#include "block/block.h"
 
 #define TYPE_VFU_OBJECT "vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -77,6 +81,35 @@ struct VfuObject {
     PCIDevice *pci_dev;
 
     int vfu_poll_fd;
+
+    /*
+     * vfu_mig_buf holds the migration data. In the remote server, this
+     * buffer replaces the role of an IO channel which links the source
+     * and the destination.
+     *
+     * Whenever the client QEMU process initiates migration, the remote
+     * server gets notified via libvfio-user callbacks. The remote server
+     * sets up a QEMUFile object using this buffer as backend. The remote
+     * server passes this object to its migration subsystem, which slurps
+     * the VMSD of the device ('devid' above) referenced by this object
+     * and stores the VMSD in this buffer.
+     *
+     * The client subsequetly asks the remote server for any data that
+     * needs to be moved over to the destination via libvfio-user
+     * library's vfu_migration_callbacks_t callbacks. The remote hands
+     * over this buffer as data at this time.
+     *
+     * A reverse of this process happens at the destination.
+     */
+    uint8_t *vfu_mig_buf;
+
+    uint64_t vfu_mig_buf_size;
+
+    uint64_t vfu_mig_buf_pending;
+
+    QEMUFile *vfu_mig_file;
+
+    vfu_migr_state_t vfu_state;
 };
 
 static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
@@ -110,6 +143,272 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     trace_vfu_prop("device", str);
 }
 
+/**
+ * Migration helper functions
+ *
+ * vfu_mig_buf_read & vfu_mig_buf_write are used by QEMU's migration
+ * subsystem - qemu_remote_loadvm & qemu_remote_savevm. loadvm/savevm
+ * call these functions via QEMUFileOps to load/save the VMSD of a
+ * device into vfu_mig_buf
+ *
+ */
+static ssize_t vfu_mig_buf_read(void *opaque, uint8_t *buf, int64_t pos,
+                                size_t size, Error **errp)
+{
+    VfuObject *o = opaque;
+
+    if (pos > o->vfu_mig_buf_size) {
+        size = 0;
+    } else if ((pos + size) > o->vfu_mig_buf_size) {
+        size = o->vfu_mig_buf_size - pos;
+    }
+
+    memcpy(buf, (o->vfu_mig_buf + pos), size);
+
+    return size;
+}
+
+static ssize_t vfu_mig_buf_write(void *opaque, struct iovec *iov, int iovcnt,
+                                 int64_t pos, Error **errp)
+{
+    VfuObject *o = opaque;
+    uint64_t end = pos + iov_size(iov, iovcnt);
+    int i;
+
+    if (end > o->vfu_mig_buf_size) {
+        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
+    }
+
+    for (i = 0; i < iovcnt; i++) {
+        memcpy((o->vfu_mig_buf + o->vfu_mig_buf_size), iov[i].iov_base,
+               iov[i].iov_len);
+        o->vfu_mig_buf_size += iov[i].iov_len;
+        o->vfu_mig_buf_pending += iov[i].iov_len;
+    }
+
+    return iov_size(iov, iovcnt);
+}
+
+static int vfu_mig_buf_shutdown(void *opaque, bool rd, bool wr, Error **errp)
+{
+    VfuObject *o = opaque;
+
+    o->vfu_mig_buf_size = 0;
+
+    g_free(o->vfu_mig_buf);
+
+    o->vfu_mig_buf = NULL;
+
+    o->vfu_mig_buf_pending = 0;
+
+    return 0;
+}
+
+static const QEMUFileOps vfu_mig_fops_save = {
+    .writev_buffer  = vfu_mig_buf_write,
+    .shut_down      = vfu_mig_buf_shutdown,
+};
+
+static const QEMUFileOps vfu_mig_fops_load = {
+    .get_buffer     = vfu_mig_buf_read,
+    .shut_down      = vfu_mig_buf_shutdown,
+};
+
+/**
+ * handlers for vfu_migration_callbacks_t
+ *
+ * The libvfio-user library accesses these handlers to drive the migration
+ * at the remote end, and also to transport the data stored in vfu_mig_buf
+ *
+ */
+static void vfu_mig_state_stop_and_copy(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    int ret;
+
+    if (!o->vfu_mig_file) {
+        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_save, false);
+    }
+
+    ret = qemu_remote_savevm(o->vfu_mig_file, DEVICE(o->pci_dev));
+    if (ret) {
+        qemu_file_shutdown(o->vfu_mig_file);
+        o->vfu_mig_file = NULL;
+        return;
+    }
+
+    qemu_fflush(o->vfu_mig_file);
+}
+
+static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(OBJECT(o));
+    static int migrated_devs;
+    Error *local_err = NULL;
+    int ret;
+
+    /**
+     * TODO: move to VFU_MIGR_STATE_RESUME handler. Presently, the
+     * VMSD data from source is not available at RESUME state.
+     * Working on a fix for this.
+     */
+    if (!o->vfu_mig_file) {
+        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_load, false);
+    }
+
+    ret = qemu_remote_loadvm(o->vfu_mig_file);
+    if (ret) {
+        error_setg(&error_abort, "vfu: failed to restore device state");
+        return;
+    }
+
+    qemu_file_shutdown(o->vfu_mig_file);
+    o->vfu_mig_file = NULL;
+
+    /* VFU_MIGR_STATE_RUNNING begins here */
+    if (++migrated_devs == k->nr_devs) {
+        bdrv_invalidate_cache_all(&local_err);
+        if (local_err) {
+            error_report_err(local_err);
+            return;
+        }
+
+        vm_start();
+    }
+}
+
+static void vfu_mig_state_stop(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(OBJECT(o));
+    static int migrated_devs;
+
+    /**
+     * note: calling bdrv_inactivate_all() is not the best approach.
+     *
+     *  Ideally, we would identify the block devices (if any) indirectly
+     *  linked (such as via a scs-hd device) to each of the migrated devices,
+     *  and inactivate them individually. This is essential while operating
+     *  the server in a storage daemon mode, with devices from different VMs.
+     *
+     *  However, we currently don't have this capability. As such, we need to
+     *  inactivate all devices at the same time when migration is completed.
+     */
+    if (++migrated_devs == k->nr_devs) {
+        bdrv_inactivate_all();
+        vm_stop(RUN_STATE_PAUSED);
+    }
+}
+
+static int vfu_mig_transition(vfu_ctx_t *vfu_ctx, vfu_migr_state_t state)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (o->vfu_state == state) {
+        return 0;
+    }
+
+    switch (state) {
+    case VFU_MIGR_STATE_RESUME:
+        break;
+    case VFU_MIGR_STATE_STOP_AND_COPY:
+        vfu_mig_state_stop_and_copy(vfu_ctx);
+        break;
+    case VFU_MIGR_STATE_STOP:
+        vfu_mig_state_stop(vfu_ctx);
+        break;
+    case VFU_MIGR_STATE_PRE_COPY:
+        break;
+    case VFU_MIGR_STATE_RUNNING:
+        if (!runstate_is_running()) {
+            vfu_mig_state_running(vfu_ctx);
+        }
+        break;
+    default:
+        warn_report("vfu: Unknown migration state %d", state);
+    }
+
+    o->vfu_state = state;
+
+    return 0;
+}
+
+static uint64_t vfu_mig_get_pending_bytes(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    return o->vfu_mig_buf_pending;
+}
+
+static int vfu_mig_prepare_data(vfu_ctx_t *vfu_ctx, uint64_t *offset,
+                                uint64_t *size)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (offset) {
+        *offset = 0;
+    }
+
+    if (size) {
+        *size = o->vfu_mig_buf_size;
+    }
+
+    return 0;
+}
+
+static ssize_t vfu_mig_read_data(vfu_ctx_t *vfu_ctx, void *buf,
+                                 uint64_t size, uint64_t offset)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (offset > o->vfu_mig_buf_size) {
+        return -1;
+    }
+
+    if ((offset + size) > o->vfu_mig_buf_size) {
+        warn_report("vfu: buffer overflow - check pending_bytes");
+        size = o->vfu_mig_buf_size - offset;
+    }
+
+    memcpy(buf, (o->vfu_mig_buf + offset), size);
+
+    o->vfu_mig_buf_pending -= size;
+
+    return size;
+}
+
+static ssize_t vfu_mig_write_data(vfu_ctx_t *vfu_ctx, void *data,
+                                  uint64_t size, uint64_t offset)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint64_t end = offset + size;
+
+    if (end > o->vfu_mig_buf_size) {
+        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
+        o->vfu_mig_buf_size = end;
+    }
+
+    memcpy((o->vfu_mig_buf + offset), data, size);
+
+    return size;
+}
+
+static int vfu_mig_data_written(vfu_ctx_t *vfu_ctx, uint64_t count)
+{
+    return 0;
+}
+
+static const vfu_migration_callbacks_t vfu_mig_cbs = {
+    .version = VFU_MIGR_CALLBACKS_VERS,
+    .transition = &vfu_mig_transition,
+    .get_pending_bytes = &vfu_mig_get_pending_bytes,
+    .prepare_data = &vfu_mig_prepare_data,
+    .read_data = &vfu_mig_read_data,
+    .data_written = &vfu_mig_data_written,
+    .write_data = &vfu_mig_write_data,
+};
+
 static void vfu_object_ctx_run(void *opaque)
 {
     VfuObject *o = opaque;
@@ -359,6 +658,7 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
     DeviceState *dev = NULL;
     vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    size_t migr_area_size;
     int ret;
 
     o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path,
@@ -422,6 +722,35 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    /*
+     * TODO: The 0x20000 number used below is a temporary. We are working on
+     *     a cleaner fix for this.
+     *
+     *     The libvfio-user library assumes that the remote knows the size of
+     *     the data to be migrated at boot time, but that is not the case with
+     *     VMSDs, as it can contain a variable-size buffer. 0x20000 is used
+     *     as a sufficiently large buffer to demonstrate migration, but that
+     *     cannot be used as a solution.
+     *
+     */
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_MIGR_REGION_IDX,
+                           0x20000, NULL,
+                           VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to register migration BAR %s- %s",
+                   o->device, strerror(errno));
+        return;
+    }
+
+    migr_area_size = vfu_get_migr_register_area_size();
+    ret = vfu_setup_device_migration_callbacks(o->vfu_ctx, &vfu_mig_cbs,
+                                               migr_area_size);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to setup migration %s- %s",
+                   o->device, strerror(errno));
+        return;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
@@ -464,6 +793,16 @@ static void vfu_object_init(Object *obj)
     qemu_add_machine_init_done_notifier(&o->machine_done);
 
     o->vfu_poll_fd = -1;
+
+    o->vfu_mig_file = NULL;
+
+    o->vfu_mig_buf = NULL;
+
+    o->vfu_mig_buf_size = 0;
+
+    o->vfu_mig_buf_pending = 0;
+
+    o->vfu_state = VFU_MIGR_STATE_STOP;
 }
 
 static void vfu_object_finalize(Object *obj)
diff --git a/migration/savevm.c b/migration/savevm.c
index 7b7b64bd13..341fde73f8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1604,6 +1604,49 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     return ret;
 }
 
+static SaveStateEntry *find_se_from_dev(DeviceState *dev)
+{
+    SaveStateEntry *se;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (se->opaque == dev) {
+            return se;
+        }
+    }
+
+    return NULL;
+}
+
+int qemu_remote_savevm(QEMUFile *f, DeviceState *dev)
+{
+    SaveStateEntry *se;
+    int ret = 0;
+
+    se = find_se_from_dev(dev);
+    if (!se) {
+        return -ENODEV;
+    }
+
+    if (!se->vmsd || !vmstate_save_needed(se->vmsd, se->opaque)) {
+        return ret;
+    }
+
+    save_section_header(f, se, QEMU_VM_SECTION_FULL);
+
+    ret = vmstate_save(f, se, NULL);
+    if (ret) {
+        qemu_file_set_error(f, ret);
+        return ret;
+    }
+
+    save_section_footer(f, se);
+
+    qemu_put_byte(f, QEMU_VM_EOF);
+    qemu_fflush(f);
+
+    return 0;
+}
+
 void qemu_savevm_live_state(QEMUFile *f)
 {
     /* save QEMU_VM_SECTION_END section */
@@ -2444,6 +2487,36 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
     return 0;
 }
 
+int qemu_remote_loadvm(QEMUFile *f)
+{
+    uint8_t section_type;
+    int ret = 0;
+
+    while (true) {
+        section_type = qemu_get_byte(f);
+
+        ret = qemu_file_get_error(f);
+        if (ret) {
+            break;
+        }
+
+        switch (section_type) {
+        case QEMU_VM_SECTION_FULL:
+            ret = qemu_loadvm_section_start_full(f, NULL);
+            if (ret < 0) {
+                break;
+            }
+            break;
+        case QEMU_VM_EOF:
+            return ret;
+        default:
+            return -EINVAL;
+        }
+    }
+
+    return ret;
+}
+
 static int
 qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
 {
-- 
2.20.1


