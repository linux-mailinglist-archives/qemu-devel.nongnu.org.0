Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09244E7A64
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:23:13 +0100 (CET)
Received: from localhost ([::1]:54462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpWj-0003wn-0O
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:23:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTp-0007O6-0m
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:60068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTm-00034I-Dg
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:12 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHJCrw031416; 
 Fri, 25 Mar 2022 19:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=2TfzwsdKkoSLpAZcAHPlG4MbvqRV9ya/urKqgtpFuuw=;
 b=PzNlFLmerZ0+8uHJY8yNrwLztlnCH5fVPHEvEdAlgoxjghSyvhgTHGOpXaUi8bg0q2Nj
 BYb8L6gJ1Ks4Vgbz1TWqm01U4DOKc6ojLJx8b3kLGKDYJadmSLr20yiZhGpuP2k0gT/w
 bTOq52tdkeuzWmsPBdemPXVpoOjeLPjvE9FbwqawNeMeLXoLDo6NEKDrnH+qcCGNIy3q
 YCbe1xzOBO/IX3keeqeUT9A8OWXgjP+k1xkOCBaTskYt5+ioBIV9096RrI65w+6X1Oej
 tRh8FaL4WvCAn5WfCNIckK3ZRqci4v0AsoV4pnaWeq49xCLBkaWHz0sR6IfRhJuOdkwL /Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtgb1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:19:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGqlG077284;
 Fri, 25 Mar 2022 19:19:58 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2041.outbound.protection.outlook.com [104.47.56.41])
 by aserp3020.oracle.com with ESMTP id 3ew701w9u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:19:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYIQP1ANjnsxA1pW/Gn2A+GkbiS4HZr8vmJHXE7/XmLWPQMvwM1tXanV0Mo3ORHT4oKaaeZCejW7NYCqQmU6taBpKWph27PO6fwIfhEY6pFfaMn5yn6w6psiy9Qyhsej7o0mr7LvCtVfbke9YamBLwR+ttHcp+nF4zy1z+UrELwvGMANyX9bVTrhFKWFXoRvwxNB82WliSTz5abcO0nC45II1MXjW3/jpOeRmRKp78JtnBBM+lfaEjoGhxMe0XayKjLWcda6Nal5wG7Q8Qcr1oie2Bu+XQ1hx037bGSVISe6C0NiATfwwm8zYCvMY9NvrUEBujqvuTWR57orBDNShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TfzwsdKkoSLpAZcAHPlG4MbvqRV9ya/urKqgtpFuuw=;
 b=LhwfDxcUS2o7tad8Wk4Bplpi0aDs83rQVP4lvyl5VEuS3J88LdlHpmq0sIuJQb52XYY1qqUpqDsojQSEs+Zus8YLQcBQKYR9eDZ4Y015wSMUGKLLgpRwNW4x/igUIpQMlD28q2CeIUIU6YiMM7+sss51KdQsCQSWKmEf/pOkNv7vz14e9mPtWbhKH/gqWjmbJ0zydvHDdagnAnJOW7elqwYr8kU3Yz8J9DAnO8g6FV5mYMhqWJGIthHIg9xvUn2cqhQAcxIpXUsQgdcjJOJcjf1IIbG8S7RvgsnZKrpmw4FwEQZFasAyN0gNL69QJIPbCmoWrDpuy1iMFs7B9olaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TfzwsdKkoSLpAZcAHPlG4MbvqRV9ya/urKqgtpFuuw=;
 b=p16k+Mw/yXYsrM+itvf3aCQ/PaP0noJSzCUdWk6R4y89d/2YMle5xNEj5nZ1JHUzErICNDTE8ho3dNPHstZpoMtkSmsuHJ6ufHzfB67L5WA0iOTj/p3x/dbpQ0b/289Hgltv2UShHrcQXLjH97PBCBwVpCGXE8EdDosjtiI7pWc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:19:57 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:19:57 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/17] qdev: unplug blocker for devices
Date: Fri, 25 Mar 2022 15:19:31 -0400
Message-Id: <5526cf86f18a08f8228e602cf12eaae6f39e74aa.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05238a38-5a44-41fb-7ddb-08da0e9472bf
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB5206162EC825F7CA2153034E901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wi89nzedDgJ5Htem3cTZYkVR8cGJlqgnLBZiY7yrjMfjRIIIbr/6BeOL2+LSi6wynKgLKr1gj86MAr3Bmd12phOmzy7CigOwKvqXJvAaBkn/mOP2adxaXM9zg892mtnnXSYEoFHgl37HHjwsGP2cyY7tgLoV75KfzJUJmqlr+0NWZcnLvtY8U0ZHiGhfvDTLaEMSlYmrzKSDS/dlakJsQiCcnW55ObNnlkOVkoDpTVzCf0lJNCCSYSpyewn7DsxXS6L2xbP3T/7VIgqzDfEShMqYKcCfT9fB9xmMvh41rVp5huYvDmYqHFrFdrcuRm1fQPmnfdrEurIBXOGVp1dJfx9KgCp6Ys2n4pScoHtOFJILlIVv9g528mM03+WZus7mfMkA5e/hllY+oVp0SEIZMafSzLZT9FHoYKay4ly+E9HsJjb0JWr3b3RDCstty2rqMY6qbh+ptMuvsJIetm55kiZqH9KcNbD4T2M5srU1boN8LKR/5ekfqT1sijoKjPiQQjYzwFnGZNSugfdoWEJ6JGs6/ZGwPfUxBnubT3ga6dQJGaq4tWx1nvWelh0bISQA7u8W/+Z3+r1mylomJmm1Dvc9/owuT3AE0+648sbPKJRx3pRMDsAJymLEuYTrGSerLj5ZLM6YzfOwAjFCzBmVy2j6JS/NNHBCL6CNb3cpywR6BKKrPXg0IrOLDgnXpO1FnIRGBhtWEJoUiaP+CeQvWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hgz7FC6O15azzG7xY8fu1qasIpUt7YysBj2UlvVNjTc0V2x+ee7WtAnzItGR?=
 =?us-ascii?Q?V9b6oa02YlsQs9CdQQ+GaMi6DX2aZdtiJbRBBQx/bqKlN5AGtDzbMfqofMGD?=
 =?us-ascii?Q?fXnSV4Gsg8qb2GFYa/KYHkPPFX3KqDi2sXlHQ6aRRJqJiCTMP0hoy0PcEaCV?=
 =?us-ascii?Q?Qt1UgpcA/9B/ZAPTJiqijUsi+92FaLkzMQz1R27GPfLTEGTMIjxZaAiLeTdn?=
 =?us-ascii?Q?QtBdN0cVpO9DaJGZyG5U37podOJQ4nzU9+sPeWYnAGAjGb5BhM0vPsmAnp/v?=
 =?us-ascii?Q?roGQUwmNc1VNB7Bz+HIefYPv83q5QcarLZOlr0BvG4GTCdjSONH0ltgwZ8Py?=
 =?us-ascii?Q?eOTqaeRjvnPK1+YF16UySG70AFCOXCqKr3sbkkH2OZlSfAA0bRmf6E11rzJ8?=
 =?us-ascii?Q?/5qj7zIeVXU0Fdi3g+ltiAQQa8b1thrGIcDE7PQLfr3kVe7STUZkqlXC+E4e?=
 =?us-ascii?Q?HkgeS7XksNvbZfmuX4fGzffDjQavh+161tKl+brtNnaOX0XriGEKtRIyI0yj?=
 =?us-ascii?Q?vTHKkEvIDLyZjJ/G4OJ6cRWyyDXEOq/yWeBMl/FPlegQ/gJ71tBG8aQVuTzp?=
 =?us-ascii?Q?Z4pRDIx3GcG9csB3MDvPMHxjUlHN+/VIWxYFJlr4d1JNPpc3oaeHCG7t27p3?=
 =?us-ascii?Q?EYTQXeEOSd5nGJUlRoXAJaTyC/XA6e3djosi38Iphhe52UmFVAdy8LerP9ZW?=
 =?us-ascii?Q?vH5Fm/fm8ZkbXo/uF6QWErIRMlLpMfvUIGHk4ODsFkrEx7iUl0d8CPFbaAn5?=
 =?us-ascii?Q?ETTpU5BuWJjJnw7guI2uUa/PSEZfvmUkTEsm6BX/Y4QmoiJPzgCJEXe5+Fd2?=
 =?us-ascii?Q?qNTusx1T26wemASr8TVwCNj1Ja1LYglUbbZ9+RegnRyFXGNrN26g09lGlZEZ?=
 =?us-ascii?Q?nEBPHrjdZERfwoarly09k48lMoi18Y0EITcyw702WrxGeIn6uDRb3GIrJ9zH?=
 =?us-ascii?Q?KnivD5dGnIpeZvw/smMppuHw9qeXKHaYrRaSU8Yn4uCMPhqCpy3qfcSnnnts?=
 =?us-ascii?Q?tm8+VkB52LjmMUejMjTvxF7spCgs8thY5pRoFuSxC1llap7iXpHckX4J+oUR?=
 =?us-ascii?Q?oa65/Oq83SI4AHA8+SU1Imx9UJS+pwXU0d/nScaQa7ZxAfxGfZs+phw2rosR?=
 =?us-ascii?Q?Kya09cqi66Dw9tZiNvdUShlbplPFiikclhFBXXoEJpFiAvNaeZOs2MSB+BTa?=
 =?us-ascii?Q?2NITODnOq0O1ec6/jprbQIHvJKz8NStzWixj5TtvQLn/ra/dks6bK6l2+X4R?=
 =?us-ascii?Q?zJgYal+EJ/fdH04Z7ym3KgtzdFR7xN5QkNDo6XNQtcIA/9qyoIuqBdZht8wF?=
 =?us-ascii?Q?GN9Yh/5DBg1ymp8WSslB4hldc8IOraP1oTSjUdL3C5EhO1mHI/er1hg62smk?=
 =?us-ascii?Q?AjjHxNexgGw0b1LN6usR3+qsCbBGwnqj6t2tz8gXK3j0+yuPzFYcksYTVx7b?=
 =?us-ascii?Q?NhZBRXbeoeeDvgDhk6+KHzhGlwBehTY5MecsKQwFi4cME0GEihHNVDKR8Dw2?=
 =?us-ascii?Q?4TEg+1sGmA2v/Z4QALalVtAOe8dKeItcq6Acfs6TZXOcWqUs3Yj4b/v8kpYD?=
 =?us-ascii?Q?idUQNtz8tOzej7yrRv8upyk43UKH6zzycCtH+F8IK515ANXITfFxJ5agYl1R?=
 =?us-ascii?Q?IN/GnPjhqf+AtoFcZLZSoxQ5A9fnS/CGgFJ3SGVoF6ncHAwXchAHBHwC0bqY?=
 =?us-ascii?Q?srgIUCjSIL+H/Zie7CRnuCWc84UPU4+A0fdufEkqrbqz5Zx/h30VXkxbZC+V?=
 =?us-ascii?Q?MU3JqZPwWw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05238a38-5a44-41fb-7ddb-08da0e9472bf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:19:57.1634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sC6H4yFgLyqao7lBAjByCESam7liriHzsb9A9XyC2TexpSSPUguVADHcy3t+FndOKVBe6iDTQmPLq+rZa9uZ7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: vOtJEg7ZfnWBcxdW_Y57zmOkEXHPGBTs
X-Proofpoint-ORIG-GUID: vOtJEg7ZfnWBcxdW_Y57zmOkEXHPGBTs
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add blocker to prevent hot-unplug of devices

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/qdev-core.h | 29 +++++++++++++++++++++++++++++
 hw/core/qdev.c         | 24 ++++++++++++++++++++++++
 softmmu/qdev-monitor.c |  4 ++++
 3 files changed, 57 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..1b9fa25e5c 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    GSList *unplug_blockers;
 };
 
 struct DeviceListener {
@@ -419,6 +420,34 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
 void qdev_machine_creation_done(void);
 bool qdev_machine_modified(void);
 
+/*
+ * qdev_add_unplug_blocker: Adds an unplug blocker to a device
+ *
+ * @dev: Device to be blocked from unplug
+ * @reason: Reason for blocking
+ */
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason);
+
+/*
+ * qdev_del_unplug_blocker: Removes an unplug blocker from a device
+ *
+ * @dev: Device to be unblocked
+ * @reason: Pointer to the Error used with qdev_add_unplug_blocker.
+ *          Used as a handle to lookup the blocker for deletion.
+ */
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
+
+/*
+ * qdev_unplug_blocked: Confirms if a device is blocked from unplug
+ *
+ * @dev: Device to be tested
+ * @reason: Returns one of the reasons why the device is blocked,
+ *          if any
+ *
+ * Returns: true if device is blocked from unplug, false otherwise
+ */
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
+
 /**
  * GpioPolarity: Polarity of a GPIO line
  *
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..0806d8fcaa 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -468,6 +468,28 @@ char *qdev_get_dev_path(DeviceState *dev)
     return NULL;
 }
 
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_prepend(dev->unplug_blockers, reason);
+}
+
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_remove(dev->unplug_blockers, reason);
+}
+
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (dev->unplug_blockers) {
+        error_propagate(errp, error_copy(dev->unplug_blockers->data));
+        return true;
+    }
+
+    return false;
+}
+
 static bool device_get_realized(Object *obj, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
@@ -704,6 +726,8 @@ static void device_finalize(Object *obj)
 
     DeviceState *dev = DEVICE(obj);
 
+    g_assert(!dev->unplug_blockers);
+
     QLIST_FOREACH_SAFE(ngl, &dev->gpios, node, next) {
         QLIST_REMOVE(ngl, node);
         qemu_free_irqs(ngl->in, ngl->num_in);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 12fe60c467..9cfd59d17c 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -898,6 +898,10 @@ void qdev_unplug(DeviceState *dev, Error **errp)
     HotplugHandlerClass *hdc;
     Error *local_err = NULL;
 
+    if (qdev_unplug_blocked(dev, errp)) {
+        return;
+    }
+
     if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
         return;
-- 
2.20.1


