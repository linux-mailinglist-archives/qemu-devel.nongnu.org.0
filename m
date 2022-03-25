Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7616B4E7A77
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:31:58 +0100 (CET)
Received: from localhost ([::1]:52240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpfB-0004dE-FH
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:31:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTy-0007Vt-HG
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:27 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTw-000366-FG
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:22 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PIEN9o000397; 
 Fri, 25 Mar 2022 19:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=zwPhI+aSY9A8g/pGSugY9jLxWCS4xmeP2Ig6quKEBs4=;
 b=unY1Pncn2sM42n834QpjWlz1IGUIzFgqVnlpPr5iD8TS9ZHLknq81rfued03sXJkJj1c
 PxavlOJGwMiaMmEDt+doOi3Qf6oEmmnKvmg6AyRY56YVFctChOn3OY7lZ1wtzWnuAucD
 K3U5J15y7YCZ0/zuGYa7L2/OZHpVSYEQO53+KOy220YJQZKmhpWVRU2XuWq495Ly2LxN
 qBM6L98VfI9z5DrwXCqdVCfwCwG73jSbR2RiNOshCN2po5bZT3ypyhPmtt2HrNUxlFFW
 N0zCMYK79f6Z14HvbnptN9w40TMusmhLn6Izo9TgM72fxB0rHcBk3ZppAWpORi+7zpV5 Dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew72aqnrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:16 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGW6n077178;
 Fri, 25 Mar 2022 19:20:15 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2045.outbound.protection.outlook.com [104.47.56.45])
 by aserp3020.oracle.com with ESMTP id 3ew701w9v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKgQ2e9quCke9B9hWLl9ZwuxsqbivJqEWD1wPAaXAJvhucHHFYWfyzy0kWSE4FbeazNwk00hvkdx+AWIp1+A41h207YMXEGtJmo6UBvMz/LlPSaBY3uZj+0SA1xtvde1TbrSSLu2zDihxi6BpzJNIVny1f8Z7qkck1gF9DcPl3cc0ud7W+B40190iesCy6lLIKPVI3F73BlZIhBgyHvU+dOcX/9Uc7Bjotl5AJg+AW/inY8BQXaOQmXzzONgnnCS0OKBp2cMugiJ4KnBHcKJjc7MIkAQTIBP7y7oHwUEpiqQqCWC2aSvXjQa5vYQeCBruqOX+SU9kqGyAeuOmEhqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwPhI+aSY9A8g/pGSugY9jLxWCS4xmeP2Ig6quKEBs4=;
 b=H7teHtG1EyD0NDxB5Ltc8y0BIP7k24SpBklm+gQZlpN861qP4yq10LzwPQHHTGdDZaelbKxMhqLsoTr1djkQyc2dVItVjfnIeJ8zd2zGNUHuzFW/unLEEx8RsiNKQAZbdLUls0DYMceRihIsjOiEgZE3Hg1ra1zsUUWNKyi2lcQI+atkhqVirvo1LIvN50NVJTzflGhCbw1DhAU398XRnya4G9LrkXfslDJ9US1cLu/Bxm7yyTTfessGIi1ul7ZSfGZ1NDilu20oCHj8dT8SIwhE0wLMsV8hPBX5sQ+ffjux9xKji4qgl0EOspOGdY21YRvG3JGy2DGFJkVnr4T09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwPhI+aSY9A8g/pGSugY9jLxWCS4xmeP2Ig6quKEBs4=;
 b=uSn0+DM6DJTcU4bD0WEnQWzIWkLV9VUbdEAJka+uhPX+hv4fOBsKargAp8KeIwqv88hGMUAL+iAw9y/bCjqsN3NmHqOOc0YVWJrckcfMHGMf1oYey2ZZX4T3uknlkE/9LMWk69jUYTVt8aWRiGciT8GpEX3lY8Wvsy7oA7KzfAY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:13 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:13 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/17] vfio-user: find and init PCI device
Date: Fri, 25 Mar 2022 15:19:38 -0400
Message-Id: <753d79e5cf6f3568e58db25349be65e6cc8a656d.1648234157.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 79b985b7-b2fc-4b3b-ddfc-08da0e947c6e
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB52066A3269D4646619A9FC42901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0zJIVyX8lteECy3q0LQNbDOf3JXC+fbEUrCrkB934KEsafzk+gKVHrMPt70CboEDf8GrWXoWoKknZzsNB7wg6MgLnpog4cHwg/l+mlXq/BHamTM5R2RQFd7Vm/2vockpedeCdN3oW0DSJwQC/DhIKCTTvNyscqAgIzYKLluYwd7WLmK+yjvchuzu1ABIUm72QJREJXjReHn38xICZf48oH9YhAy2SLCjDLD9vdiChRbL+gxBcBcsq5L4fN72XNI4ofknq9VSMrSmBNgpKuAPWA17IPKr8qYmQ9u2KdkmHEj+hES05ylW0o1CtQZ4s7IwXqfjNlztV3pyenKl0pJA45ysuIIdra38RTyyoWE96hgvQhn0KjkC3SRo33QlTst+Ae3IQ4Lz6+5S1sTo3GDl66G3IYWQibmhUM/mno2quBD8RGTvcF9BYfARiKSqQQsHN1DCD45M41ceG6SfsevPkYCNadki/z/ld4Yxdc1boaStFpiFdJj2HNakdWnv+eUvMZ6HAip5PMLiyahQw3NhEG3kTtcmAcEB/oSSY/dpM7j3/VfYZkOheG3XN7GFcng+DnK1jSTSrJbVDhk+Sz/kt1FipuyHy/HHjXtwPa3dLy4zpCDw2UPJ+SB2tS6JEK6vraIeu4cKlqvG96Nsms3lta4rca1Q+7sD6OInGNgxJcyyfT4cfI3dVWjQh3zhW4Ag7iExEx8jw+48UmYDgNOaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ygIoYmpRv8lH/5VGQ12Jy3ZOgeXjXIy6GjRS2G3UKxEkKjV1TtGsqFbXhsUw?=
 =?us-ascii?Q?pJMMErLj9ZlmXd+mF8aU72eJTdYdeET9CU8wLwL1obRFOusHkGu9yItZIgNj?=
 =?us-ascii?Q?rhaVaV6hK6zWBPBDsRAzTN9DxExPxmoXL93bTYRCS1P6yG/9BiCyOnS+uSgq?=
 =?us-ascii?Q?sOEXnQNrNe3W3UoWwZMRmz5thwky+kobMU86vawZeaGHqycPZlm7jiAM7l7l?=
 =?us-ascii?Q?7uo752D5s67K2rPnLWTre8AgOY/JLmMb8tiwqw8hPCi/n74YpFXaBzSjGtOz?=
 =?us-ascii?Q?F9yYMK25ZP2hH9IIjuI1wgY3saA2EUNTr1xGGHo8LMn/t+v5I+FKbXVR2qly?=
 =?us-ascii?Q?XS+Fx3aqZUehXf2cdL2PCywOQnLY9FE+xxij3kL7hwzD7GQSqaoiv06nHxPu?=
 =?us-ascii?Q?1NdMm6bQ1RR8/ViVEjeQsZa5sm744A399mop6Hp5+htSHCJWoraRUlCgnsAq?=
 =?us-ascii?Q?iDsqCzln4OcP6I2j+jMeYONXuyJC6om1z/FF/JeYTLqMO7rIHvU5a5UMkxlw?=
 =?us-ascii?Q?vlU/TIqjDnfosZElnw9gXqbywT5WBzbMAGjFEfItdMn9e2zdf1tGIT2OWux6?=
 =?us-ascii?Q?vWp354fMK9Lq4AeUsY2M6y9dBstsIx7UbtAlg7IGteNL200ejf2iXUqIKlfh?=
 =?us-ascii?Q?9jxv/lebLpwph1MBaKeLo6HTymW8WszN/n3dap0Vo0Z3lSoSlqL+/iBsa1DG?=
 =?us-ascii?Q?Um3NU6g+X7vJopfKp/lC8Dw+HaehShGA0cpwdsJ+kteiRWF7340WZAPti4qu?=
 =?us-ascii?Q?+Z4VqUxerajTm0gaX0wImsUERUq4XJYOfeCSPcxk1N9V8301E3NOd/x5Jz62?=
 =?us-ascii?Q?MGW4sTcMVACB1UpFGjNhxWxeCUWFunXQvpADAa4k0/wWhtInoI9aFte0kK0Q?=
 =?us-ascii?Q?+GNMgppWsSfj2I0CZNGlV9J2mCEOk7qzFqLvdWOx4xoJEcWU9IjIxhkN9XFk?=
 =?us-ascii?Q?lwo05UmDWad10NvrAZ3md+MK1f1uHpu7yy67eGdli6mhlnO/NQ9p10dXzUZh?=
 =?us-ascii?Q?aj7ONFLwZzsYfE+2hPv3Uc4WGNkhQNsRIrJ/w1tPhaIoCBCCEQagdd0vQBfN?=
 =?us-ascii?Q?PgqJiNQAhbJGLtm+0XgrRGDGefPNNUPrsk6/wPPDzfjXOMcPkTusNlracNi2?=
 =?us-ascii?Q?GSGkXrFCb7mdrY5VpM3VY1H6pLdFYIjmJ1YDHXxDQRmDZ4mAiV3juiu8Xz6u?=
 =?us-ascii?Q?Ruih0eDtOUDHTqcYz+BcHSaV5stMyJZrVQmwYz336JuoIsyhxE4VYAiwJyh/?=
 =?us-ascii?Q?K1r7Z5wLu+88HpHotgIQWKEpZ5EIWIGaA9dTUjwW/rn8YASMKrxX6426y2Vo?=
 =?us-ascii?Q?fuwLQ5TIJIPU8kjSle0mOqOhHtgqyezdAO6qu56i9Z/uZduOhv/CBX4e0kuN?=
 =?us-ascii?Q?0jXbVuNaOf4YTfwf4eN9+7hYei8gdYwB6+LYgat3WSLxRVEeL3GBiBIWtay9?=
 =?us-ascii?Q?sVo9E8bNWWtiRUDD7r2zwz7VDhAVVLTBoq2QpHnrmLdTnv9XcqFecxUgogDL?=
 =?us-ascii?Q?1XFSvL0ybPuz9f5S3SC+NOaqVPVRTJApN6CKfN3sNX3rkjGxqC4HfnVmhEmP?=
 =?us-ascii?Q?bEbzvJwsiZuPojyRyOzTYCYPIXaIcRHnnfgl3MhTAKjdpnDFcyWr3vqcnL0v?=
 =?us-ascii?Q?Oc1K0sGZeye7XtRLA57p6UEQK6rImGAhpTh8hhPxrEjbT8QZUyYoOp92vV9t?=
 =?us-ascii?Q?4LfCKxIiTYTGLyBw/Wd8CU4WpQgbHRmWr+daVD6GZi1JVDaxZyK5Vtwkmr3p?=
 =?us-ascii?Q?X+2MhyzxbQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b985b7-b2fc-4b3b-ddfc-08da0e947c6e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:13.3810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRCJ8cH32Hibd4zlNJEcHxB4VEjQBNJ5usTKAAqDbvKkXfwsPled6afgHMTblISnqjKfkD/Tj2V/+n8fGK4CGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: pG_99Jg19VhvjPVmGbfI1fsVwjAgv8g-
X-Proofpoint-ORIG-GUID: pG_99Jg19VhvjPVmGbfI1fsVwjAgv8g-
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

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index d46acd5b63..15f6fe3a1a 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -44,6 +44,8 @@
 #include "qemu/notify.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -81,6 +83,10 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
+
+    Error *unplug_blocker;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -182,6 +188,9 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
+    DeviceState *dev = NULL;
+    vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
             !phase_check(PHASE_MACHINE_READY)) {
@@ -200,6 +209,53 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->device);
+    if (dev == NULL) {
+        error_setg(errp, "vfu: Device %s not found", o->device);
+        goto fail;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(errp, "vfu: %s not a PCI device", o->device);
+        goto fail;
+    }
+
+    o->pci_dev = PCI_DEVICE(dev);
+
+    object_ref(OBJECT(o->pci_dev));
+
+    if (pci_is_express(o->pci_dev)) {
+        pci_type = VFU_PCI_TYPE_EXPRESS;
+    }
+
+    ret = vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    error_setg(&o->unplug_blocker,
+               "vfu: %s for %s must be deleted before unplugging",
+               TYPE_VFU_OBJECT, o->device);
+    qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+
+    return;
+
+fail:
+    vfu_destroy_ctx(o->vfu_ctx);
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+    o->vfu_ctx = NULL;
 }
 
 static void vfu_object_init(Object *obj)
@@ -242,6 +298,17 @@ static void vfu_object_finalize(Object *obj)
 
     o->device = NULL;
 
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+
     if (!k->nr_devs && vfu_object_auto_shutdown()) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
-- 
2.20.1


