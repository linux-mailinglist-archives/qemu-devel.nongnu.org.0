Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871FD4B9A84
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:05:52 +0100 (CET)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbnT-00005o-Ko
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:05:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXf-0003lE-Qr
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:33 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXd-0004RB-4H
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:31 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4RB0x010826; 
 Thu, 17 Feb 2022 07:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=WeEMwwmfamCQYK/H1Q2W/6RyNxDm0faPPjQIJdS2mAA=;
 b=nYu0tF0r6XMZvbeSNrjMTq3k4U4w/iM4UTSv3npU67CCjphC8sbhnEcc2rEcZPKeqo58
 5BYSZAtMvaOkH8IUTPGFRtkt5IEqOwQRJ/pRBmRwBTXl+AVf44nj0qQGXhrIzQfDZe44
 4heX9qyvjrP+vl0Kd6rh+keRc1fPhdEin46NltQT3jw/aUeJvW4vDbgoW5cGUbdidyaG
 AK7jWyQWIO+9IYYWCPJXFK+DfmovAI13VwFGtSRbwUZNT4NlRyW6QEQ6dDfPraFEN54I
 dt0HC//wuT+2AqmymRDsHVo/VtliIcFDfS9exVy+dOLeInQtugnKO3WHhSauSEc3AFW+ PQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdmt2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gUYB135610;
 Thu, 17 Feb 2022 07:49:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by userp3020.oracle.com with ESMTP id 3e8n4vjdvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLaHjAcRcF4izlPbYqjJyrnHStbLlLEQl2i2fOCkCb3/Fg6v5CoBKwgCqKT9MNv7coBtLBmq9AUxsF9GVcosSSM1O7+QbtiFgjSZcwtwi4g6Ir/Gm8CwJatlQe0ekMco6ooP9uzYDskyRc5lmMDdRAbsdJZ6H0q7rAJywIgMvrNF8zEAxuLP1NhDOPkhv39i8rOBNhxNnGFSxRw5JvM7lByDAEZTZRLru3wM4x4K7TbSqAh+YEGcDDastlJTzbf+ZlrGw2cyIQ8lv6P/MXhcKT5lfcmGpiWVlRCKM3Ol4OKgfmEX/G9LmZYu4P/s1wvcxf07sCncIbqyFd5/PNHS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeEMwwmfamCQYK/H1Q2W/6RyNxDm0faPPjQIJdS2mAA=;
 b=GRdbWdAQV6t7mL9O9FbnhSEji+5hGKlkzwmCxLWTAPda/oUM6E+icNNgcrjou1Fwt1kyI2lzjZ1rO19a0ckVMBb9Xk305RomhaM6+pqwGesUuBlc9QG2PMdnvVpaFCOXJo24JmkykE2S03GITf3CJgvZPVfnr5nR/I9b1io842TUwGo6MxAEecmlCYTRDc3g18m3E0xNT15cfaAX1JpOYZyDjy29iAaLcrEaPotCdJEzA5gG25la9SAdOsbhFoLh4MMS/GKuRGosE7D0Oumo+9fkeIg9tlqZQRLL1Qpjp/sCoBL4m+0xecBrOu3VNOR/XVdF549Je59FiyWXL9c0hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeEMwwmfamCQYK/H1Q2W/6RyNxDm0faPPjQIJdS2mAA=;
 b=Bn8tERSePpOMcJhhn1wq1Vxz7w5hCVGxYQ7BS26iR3/IyX9rukHbkobgN2sUvsFHoh6cFKCcBNvnahJcVxIdnjiFEo9hRB6A+bHZhznoO0k7zFEYhG06TQl897n5hHA4mJwUcn8MZawZpdyJN+IJACiTuJnBWO/XyEjtq7m4CrI=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by BL0PR10MB3009.namprd10.prod.outlook.com (2603:10b6:208:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Thu, 17 Feb
 2022 07:49:19 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:18 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/19] qdev: unplug blocker for devices
Date: Thu, 17 Feb 2022 02:48:50 -0500
Message-Id: <5acc81b16d52949a47cbcbfcc2eacc0e4f3a5687.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 513fc9d8-eca6-4a50-cd8e-08d9f1ea00bc
X-MS-TrafficTypeDiagnostic: BL0PR10MB3009:EE_
X-Microsoft-Antispam-PRVS: <BL0PR10MB3009CDC2DB4E27B4C62B2FA090369@BL0PR10MB3009.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OC7P69oN8l+yG5A8QMB97uh1F9PGnGTfbgCPOpJeCtEwyiuwZOYZowyjz3jAiwSKRF7esq/PlihblGLdc5H1Skzs2BHitX5o6Fjo7vM0f9DYmXA0SgxwMcUZoTPlB0pknUNKBpEvsRdQ+NuuT3KqvasQAzHvaTnaUh5kE7ZldN0wn4UBTfqo5mmwk/GfOJPWKzryuc07LOxabmio1LKucTDWn02PDNEyyvox9O3lcVZ6/LNngefjzX9HQtL5Qs0E28tl7tyh/Xwl7zv+M5N0vde/15l5zzNf60oNULPpyxfKojY6jXk5JTv7cqFx5Fvay37ssvwZxP9Vsx7ASpIigFIPfyF+BXVPMReSlqGjHgVg4lPlv+gsF9n41eXcuHUkW860lCzhIM3BYmD6qkWjzEevtOAFzmOxcgzKM8wsSUKV+7BcOZ5lNImiV75sMQX+OiLlkuroXOkoHnp/mZGgUJBQFiAbX6pLFaE1yF7qTSbAOrny9+0ebQgrETU1gpHPWtvggDgT5Ofjl76Z1sLaVU8Apmwjms/ttaxNRPIFvMxc3Jwga6cO5AGxYuIfBJGI4pCyJReAfSQ/W/oYKuAXno+uMsDl/OEY2qXPRb9ttCKMaFD1jqXWLF1LEej2NFnWHggfVnFP5bElpy4SYZZjFHulzGu/59jlYjQdaCnuokjOPIpO5LyfOK26ppPyMJDypGragjN+AGR48eEUk0m58Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(66946007)(6916009)(66476007)(4326008)(38350700002)(316002)(36756003)(38100700002)(2616005)(6486002)(508600001)(66556008)(6506007)(8676002)(107886003)(26005)(2906002)(83380400001)(5660300002)(86362001)(7416002)(8936002)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T9bQGtRPAwPSFklTQriInPd5b+jiS5OKH4/HC3ud85qkCcn2fjBDu+SJ+W4M?=
 =?us-ascii?Q?Kqzf0K2H+M4gE71snF6/UKwQj6A1VDon5j42cH3oXvyE0NLkDyp+5THZn9+K?=
 =?us-ascii?Q?kykWj+QB19hJhMyEyYw99KnasG1RFKJBhwvrKG/APyCzq6vbBMs4wqgB5ff+?=
 =?us-ascii?Q?Z8azINqGxGu97rdNvMMwFQ/K/0u61mlquOFna+qESkwOZD7uCzjCitcARMgj?=
 =?us-ascii?Q?ZSXhC/HEN/a6zhHR68Dpe6nt6/jqtKjQMLVZv9z/oGK2FR/pLNHhJsURpdiZ?=
 =?us-ascii?Q?KakUgYp8+nGOLZSQQ7Bvt1aEctQOgHTWmMJHE6q+lx/5/B/3PMP2/eMeU4Iz?=
 =?us-ascii?Q?1BbPljBSUWqLZwyx7FHFfCOJY0NfVxFlsJaV6pdXKHNLGw9luSzWuSDzxrSO?=
 =?us-ascii?Q?RUksmo0u6uTBDc593sYqUQFPCj3tV4rmeyFW8TPqlEpHUsodjb5aAtPhq/QC?=
 =?us-ascii?Q?uZU+bCFCstib8rlIGSNIkORj+zjAhcic++ol4b4TT6L2isXm3Nn4SQcFfBd7?=
 =?us-ascii?Q?KcSvWXNUUD+hmmmyiqmPMLYmvgDz/8X5Uo/hws+GO6xonrK0wRYpRuSdM4RU?=
 =?us-ascii?Q?xqPcBSkQBeP/o7Ctgu+chFs/a2LdEjSNYjUl3HOKoTkIIE3R72c8GUMW6kai?=
 =?us-ascii?Q?C7JYqrKqnGYekWlDAnf2BY64u4BFh0qtAO9NtcHiBKv6mrZyL5YTsAt++zsK?=
 =?us-ascii?Q?FbzQAOLboibIpvNCqHzs7wEDCdVo/NImmEeMW4VtkagwIg0PgVmVSAoOj8bA?=
 =?us-ascii?Q?Sxs4xwdClr9Tvw5o1TfsE7goL/0Ilz5fLzYA9Y1lpuUA+RgMeohu+IXsUdNa?=
 =?us-ascii?Q?kclDgxM21hOgOqZt2oPpv26eY1yEirCCalMTgj5sW0vjfObjTQzo0BhoSph8?=
 =?us-ascii?Q?cn9vtVxMWPnP4ciSO1M2GtlBrFmsl+0Vf77h4akfE6j8CD+eM2Z96UB+pwt/?=
 =?us-ascii?Q?9KybsidfY4jLANjMQBnG6YsK+FuqG0yJxxgYxVHUVuMIkXiN09wKPyb6AVSs?=
 =?us-ascii?Q?JS3CfxDMbBgx8FY/p77QmCd7N8jwT0kHdzAtc08Xi/tKHpBYHIEh1go2gpXC?=
 =?us-ascii?Q?lY9wY3/1ihrmdm3MIuu575uOxkYQ4G9lod+MkqvhEGtVfZQ4HfwP/T34R5vO?=
 =?us-ascii?Q?3mkm7Xqd5hWZyTLo+lpl4NkyUDUfAccW2Hu7uY5Ainqe+1vw7ofNsDIsoNYz?=
 =?us-ascii?Q?iiKLiDcwEGVndJpXLkg63Vbj6tU80w69hUmX36Fiv8fIQNv3SwT7/q2Fm5U8?=
 =?us-ascii?Q?HZt62pLyXzsWIsRwcYH5F7dlHKo3V9H/aAPVzKtglZYnl/sGveOA0BKJqlUV?=
 =?us-ascii?Q?EowURuuekkjz8a1REW0BiVraCAG6UeOTUu0LVam9sBctojy0lup2T8c1K8f/?=
 =?us-ascii?Q?OfniOG5G/6JaAqvDQwXL0k6lTv21agsKGI2Ua++rwAESwTfi4I13iKXUY/h7?=
 =?us-ascii?Q?jb4Jfv2aLmbAUvYs8yiNbbOb8JK2abJIN7fbO7vkY/1ZNSumHSTOhzQvcVb3?=
 =?us-ascii?Q?XLAK7TvqIGWb1hDaJJClbVtTQNMkKdnAIQ21L91hkINTHTLLVtq0uQDWyfEb?=
 =?us-ascii?Q?xCu2UWXZ3/m6j65pMDSDsxxGJP+0ioZgRKtHnvhvcjYfVUA/ntrg1xcKnFr5?=
 =?us-ascii?Q?3v65siq4inJf18RLXMT+3RY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513fc9d8-eca6-4a50-cd8e-08d9f1ea00bc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:18.7900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79YMAA3VmRi9nfVAHL4yS58RbyxiA/vnM58MedETEbaOhAaTxAaDts5HxB3oD9RNcEOCr6OqZo2PPc/bpqtuRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3009
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: 6QSB064lWpHxyhj5UUSy97r-pVnR07jz
X-Proofpoint-GUID: 6QSB064lWpHxyhj5UUSy97r-pVnR07jz
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 include/hw/qdev-core.h | 35 +++++++++++++++++++++++++++++++++++
 softmmu/qdev-monitor.c | 26 ++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..4b1d77f44a 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    GSList *unplug_blockers;
 };
 
 struct DeviceListener {
@@ -419,6 +420,40 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
 void qdev_machine_creation_done(void);
 bool qdev_machine_modified(void);
 
+/**
+ * Device Unplug blocker: prevents a device from being unplugged. It could
+ * be used to indicate that another object depends on the device.
+ *
+ * qdev_add_unplug_blocker: Adds an unplug blocker to a device
+ *
+ * @dev: Device to be blocked from unplug
+ * @reason: Reason for blocking
+ *
+ */
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason);
+
+/**
+ * qdev_del_unplug_blocker: Removes an unplug blocker from a device
+ *
+ * @dev: Device to be unblocked
+ * @reason: Pointer to the Error used with qdev_add_unplug_blocker.
+ *          Used as a handle to lookup the blocker for deletion.
+ *
+ */
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
+
+/**
+ * qdev_unplug_blocked: Confirms if a device is blocked from unplug
+ *
+ * @dev: Device to be tested
+ * @reason: Returns one of the reasons why the device is blocked,
+ *          if any
+ *
+ * Returns: true if device is blocked from unplug, false otherwise
+ *
+ */
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
+
 /**
  * GpioPolarity: Polarity of a GPIO line
  *
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 01f3834db5..69d9cf3f25 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -945,10 +945,36 @@ void qmp_device_del(const char *id, Error **errp)
             return;
         }
 
+        if (qdev_unplug_blocked(dev, errp)) {
+            return;
+        }
+
         qdev_unplug(dev, errp);
     }
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
 void hmp_device_add(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
-- 
2.20.1


