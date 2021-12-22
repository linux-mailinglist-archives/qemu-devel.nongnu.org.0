Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD35F47D827
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:08:39 +0100 (CET)
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07ug-0004eU-UW
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:08:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07WG-0006ZB-MD
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:43:24 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07WD-0000PV-76
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:43:24 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXslc013624; 
 Wed, 22 Dec 2021 19:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=DtcGCfZGcdh94T21RGoDVpVtgd4LPNgTpomu0Wkj8rA=;
 b=mn/pcaFeBAnhTVkSwP+ocLIm26kYN9KJs9h01fKcvT9WBQOho4Y4+bc/BPxaBj9thk1f
 089pteR/5zkmzWLB7EDYuW9IlI5yr8iwXFHPGuM6Lc6old+IPHw6+evDSSJY1V6WSXpU
 xqiJuAsVHCNvk8gavJoHcdHr4CdCk1c41q4sD3LHvoNeGtK0BkGmTt0RyuhgEIl9iVCZ
 JYJJDygsH3qQ29O0+B3jNsj1zwco7pSM9qOQr6SxJELM2CsBmCb7QqweipPXPN2g+QYV
 AIW5NFrrY4duTW3PIiDF7RAO6mE/gIGfFTZJrqwPfylkup8EOLnUyelOh6wyBLXM7Q2v AA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCee049074;
 Wed, 22 Dec 2021 19:42:04 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlLe9MPHFYNrZRUVf/BiXjg3F1vavNZwrK9mI6Gm+7UtLCQ/12cA+25t7RkRWfL8ZCODe4zTU3jy5RB/MsMr3azBuHVB8BWLOraj4N1eUYm9Kpr4NPyqBGs4hckGBNgAWUClcsZT/OCoTynZrxbqrB3Kg+IInQXE5tAWsnLLmD6fHwAwibMV7/q5FF/x2Nw13iZVtGyu49cAXV8Ig464Ix1oLjGaHrsZvC+pDamsZb47VQ9B7t7zVZ/Py3a8IKdxXxfh9P0hqALdWmjd3CYFBhcKTzx19RYuOrtwQJ+kMa9c0t7RjZ11EwZLoCmXpGTgB0oMZ0BvH5XEDcWuQ+KGhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtcGCfZGcdh94T21RGoDVpVtgd4LPNgTpomu0Wkj8rA=;
 b=CDkqE0S5Rk80ivNMKhTZU+66A8gPWGATIJIqlhL3BBsu/FV4IGYbOZLgoIAzsP2k+nSouu5lNPiijc3lMBlXCsor5wrloN3e9vzFR1EKwKE82nwP+aKhoOgYWLbuBEIgDUm3sDPzWsjyzFzgB88OvUdxqMdW/Cou62zvO2zUz/S6bY8q/EpSAoFlt07v0nIvKvKyiT7wQHUBGpAC1CLVZm6kpDpDZe30xFfCnE1Ffy1lfEkY84NKHHEkLjraw+22nbV9i5/94I3U2yva69ZPeFyrqLGU0XdJAKaONf8RVxlidm6yYfNgarFnCMZZGde3fc/dBTe19WOZJ1VBOq504Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtcGCfZGcdh94T21RGoDVpVtgd4LPNgTpomu0Wkj8rA=;
 b=VIXP6vo20VVDgYVUxGho4F60Os95FsYeT8oGCwj2BciNOCsQqQrwVOI/U24ONI/Nv6HeW0mgF4bUCcmcykiA9Zh8KD9uEjSAT+Zft+EPHinfWJbArWHnhYyHQdsmio+xBCuW+sGOssaqjSfc3vHRllOWN4TgbbHi0yLKT05L+ho=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:42:00 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:00 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 10/29] machine: memfd-alloc option
Date: Wed, 22 Dec 2021 11:05:15 -0800
Message-Id: <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8be5efc-292e-4971-4701-08d9c5831ee5
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB288895ACB64D6D479D6356D0F97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4mCcY9XV1XDMrnDWsZojyqo1QEq+8LNut8Jq6ktIqfB5rAOnzwsIjua9o+AkS5a5DP6JmSvGbTI7+gmLU0ljr3t97aCqcsmFLsdeFw3u614zAoCWGNO0HceNUcRy80aYbuo3EvNfdzqCy2a5ObZwK00e3cOysW5jgG6sNRG6Lss3z5DSvRH7qhSJ660NBDutFMfgTgbE7Bixz8H8hxxN9DyUMGONPdr8cx3wSq5/cwgF0VehUcdN0SdaYS/sWsN4OEKzBENChfk3xsKb12dpQBeQyhcjUCdMGCucacMwAMC09s8FMwYwJ4yRzfwZrH/NatY+ZvggG0MPSzIKUR6R7K/cyicRpu6EBqHKMzWK5ulawfbcPOgjg0ubmP4drXjKAGx+81XJS1MWMKng6kmT47n2GOqU+55WyAK/nDxewjwCY3G6XLvkoFIKz9CMvb9A2iiGEi2zV/vGVZRWIsgFjNvP1mtkUpD7gAkyXMIFyhT6EaD2M2yfEWn73tK02pPUt/PL6xCxgct4YlvLHWga9sbjz/LFoh/mie/efdhGI6Z/anFTxJxTl8/Xbvem0pTH6Lg1QOESqDlGVbQjl01SN/fFr928OanuQu6uDkHS5LkV9IHDxaeDeQ/ntdegm48btw8Wg74jg1YTEodzhUf8QzqYKi26ZwjhPJEae5UcHUc3nEhl2mveO0qElvV6hfQ8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(316002)(52116002)(6506007)(186003)(26005)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(83380400001)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0W5u7m1K8sOL9KqTDkIidtOsn/PusIrDDGYNT5v/8AkILPEVKIGoBCZbxqTr?=
 =?us-ascii?Q?IeH7tZVo02cuXs3GgBZIzl+n/QMsf5kP16ZGPtP8oXh5iI/B72YacB8jMlgz?=
 =?us-ascii?Q?QZ4qIR4OqEwnyjZPJ7wRIegBvjQEvt7YT7ZOICOCaifC5eZUrQFKuOTLJphh?=
 =?us-ascii?Q?5TykE8b0jCIzI2TlPIyQ19FzAEe/xMunkZaUP3mgR62dkfih0MZAnMUxqhl9?=
 =?us-ascii?Q?6G9Fb7s3hENuk9l5OA9muHMX4a+Bd6nirTxitloU46KKXyWQsDi8u2YfzBY1?=
 =?us-ascii?Q?TAWofXGPewgVcnxN5heXJef9lZOMe8r8SL1BH7Ig48nHjtJ91I2MHTcpAhok?=
 =?us-ascii?Q?XqlRAOur9lIZmAKIeER00OCqhtomp4b/iRMj+7KmHjZNQg7dBTRpGpsSQS9Y?=
 =?us-ascii?Q?pEzhj9anc35fGSW2ay+dT5SS5C75lx1juYobXgxv0bb4M8wEmva2cnevTofB?=
 =?us-ascii?Q?v/+L3bIB5+tTerXxmKhk+pc7TO0u24wQ5U+Yt6NlKNmuqu5R+qLz0Ecg7UoF?=
 =?us-ascii?Q?S9024bGKtEvosNmkUo8zPsHADkYD7qDPvouZX0phm1a5tlDoj2Im4ry+ql21?=
 =?us-ascii?Q?KqeImBgPzLmH200DKzwUgpNQ5Dgng09whnlIwpF2unVemIOt5CPYQ48FAhhO?=
 =?us-ascii?Q?/YZLwFZLWUluJG0rSfZ1iV9YA4YbFo5KtrzZPLxPBGR9zf5cGCrsMMm7tFab?=
 =?us-ascii?Q?pXwziJgZyiBeRe/7locXPQz9qW3kW53KnS/oUwWt2zUil1Q9gmBuNMwo9ysb?=
 =?us-ascii?Q?3u0YKC6ArtC0Lvrfxc7wX4yQZCRWSTRAz0lC85YujjR6e9XL17wPoar4iTaS?=
 =?us-ascii?Q?RgYQ1cTAXg9j997VY8w8FfNrONSYyPu3ypZt3OQRDIoMx/xfWMneAeewUSwd?=
 =?us-ascii?Q?GRoaO+yECV4fvrunirQWAUV7DfdxqihJHb7dsGnj8K3D6dNuPWP2dY3KBnTr?=
 =?us-ascii?Q?EkeI3iiHD8CabjPYHM+dt/kCJOrxzEAeiuSkjg2cWgJBmCswrrA9VYx90xtX?=
 =?us-ascii?Q?pqfQ8CUtRKam/F7aRfBc2/SWc+p96vHVfxCM2MzjgkU4QotTlmgM59LRsP3i?=
 =?us-ascii?Q?6tJp4+VlrinYDp3CKryTd5DQ1fdEW7C1WbzviZTsWqmPS0JmrB6PJnLRUlii?=
 =?us-ascii?Q?JT+SSgpkF7MVoRyfqdUiFaU7mVnDhQSX5GPj3GOcoT8fpgjepdNclGvUyJje?=
 =?us-ascii?Q?ZViWRStLu2rDSjNDoszmbdrA+NsR4UviK9xn1nszbLrSEp2NpN92JTrNorY3?=
 =?us-ascii?Q?agISwXPE9O9nX84tp0euA61zrWPm5Xu716Gvc8TQRnFF1DjxpoKGhg6LV6bh?=
 =?us-ascii?Q?iZTBpXCL9mb405GQl2CCovqMzZ61uzt5kQif1EJTc/z3Pc3Td3wwxqNOzUVU?=
 =?us-ascii?Q?jQJSWoJwxsdtPv8nAv5h35DAJSf3mgerk1aGIeL+dbpWhbQYDLrd6hCXJ4li?=
 =?us-ascii?Q?toyisX3bfFZebAfX2nz86z5DYeK4js+YMMNdycEOrV47wQRHNWcn4dEQx5eT?=
 =?us-ascii?Q?s3kdujqd0ucWysSPXnWPIkZN4UYlSskUeDm6yeEAp382EuotZUsBC8ag8GSu?=
 =?us-ascii?Q?5+Vt6AOKrxyNR+XQqB0AUcCt3lT8M2X3xDltKBCOL6cm3xJJM8E8BkDfFHvp?=
 =?us-ascii?Q?08YoLARPLpsuhqK+D3uL2+TlZ5f98yIp9ZvT6zzxZOsUodpCxAS/gDFBlh4+?=
 =?us-ascii?Q?6d1+mg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8be5efc-292e-4971-4701-08d9c5831ee5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:00.1240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6D84QPuvwNhNlywlcJreckLLtqvT9h3Gtzu1uN87QAcx9Z3VxA8ivAHrrRmNSV/a+2XhSZ9uqL67AYJRp3RCjK5Z1LRdh3jfUlVeCBychm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: 2vkav69VJYNiDUygpRtaTtq7S7D7kNPr
X-Proofpoint-ORIG-GUID: 2vkav69VJYNiDUygpRtaTtq7S7D7kNPr
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allocate anonymous memory using memfd_create if the memfd-alloc machine
option is set.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/core/machine.c   | 19 +++++++++++++++++++
 include/hw/boards.h |  1 +
 qemu-options.hx     |  6 ++++++
 softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
 softmmu/vl.c        |  1 +
 trace-events        |  1 +
 util/qemu-config.c  |  4 ++++
 7 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 53a99ab..7739d88 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
     ms->mem_merge = value;
 }
 
+static bool machine_get_memfd_alloc(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->memfd_alloc;
+}
+
+static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->memfd_alloc = value;
+}
+
 static bool machine_get_usb(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "mem-merge",
         "Enable/disable memory merge support");
 
+    object_class_property_add_bool(oc, "memfd-alloc",
+        machine_get_memfd_alloc, machine_set_memfd_alloc);
+    object_class_property_set_description(oc, "memfd-alloc",
+        "Enable/disable allocating anonymous memory using memfd_create");
+
     object_class_property_add_bool(oc, "usb",
         machine_get_usb, machine_set_usb);
     object_class_property_set_description(oc, "usb",
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 9c1c190..a57d7a0 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -327,6 +327,7 @@ struct MachineState {
     char *dt_compatible;
     bool dump_guest_core;
     bool mem_merge;
+    bool memfd_alloc;
     bool usb;
     bool usb_disabled;
     char *firmware;
diff --git a/qemu-options.hx b/qemu-options.hx
index 7d47510..33c8173 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
+    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"
     "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
     "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
     "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
@@ -76,6 +77,11 @@ SRST
         supported by the host, de-duplicates identical memory pages
         among VMs instances (enabled by default).
 
+    ``memfd-alloc=on|off``
+        Enables or disables allocation of anonymous guest RAM using
+        memfd_create.  Any associated memory-backend objects are created with
+        share=on.  The memfd-alloc default is off.
+
     ``aes-key-wrap=on|off``
         Enables or disables AES key wrapping support on s390-ccw hosts.
         This feature controls whether AES wrapping keys will be created
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3524c04..95e2b49 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -41,6 +41,7 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
+#include "qemu/memfd.h"
 #include "exec/memory.h"
 #include "exec/ioport.h"
 #include "sysemu/dma.h"
@@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
     const bool shared = qemu_ram_is_shared(new_block);
     RAMBlock *block;
     RAMBlock *last_block = NULL;
+    struct MemoryRegion *mr = new_block->mr;
     ram_addr_t old_ram_size, new_ram_size;
     Error *err = NULL;
+    const char *name;
+    void *addr = 0;
+    size_t maxlen;
+    MachineState *ms = MACHINE(qdev_get_machine());
 
     old_ram_size = last_ram_page();
 
     qemu_mutex_lock_ramlist();
-    new_block->offset = find_ram_offset(new_block->max_length);
+    maxlen = new_block->max_length;
+    new_block->offset = find_ram_offset(maxlen);
 
     if (!new_block->host) {
         if (xen_enabled()) {
-            xen_ram_alloc(new_block->offset, new_block->max_length,
-                          new_block->mr, &err);
+            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
             if (err) {
                 error_propagate(errp, err);
                 qemu_mutex_unlock_ramlist();
                 return;
             }
         } else {
-            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
-                                                  &new_block->mr->align,
-                                                  shared, noreserve);
-            if (!new_block->host) {
+            name = memory_region_name(mr);
+            if (ms->memfd_alloc) {
+                Object *parent = &mr->parent_obj;
+                int mfd = -1;          /* placeholder until next patch */
+                mr->align = QEMU_VMALLOC_ALIGN;
+                if (mfd < 0) {
+                    mfd = qemu_memfd_create(name, maxlen + mr->align,
+                                            0, 0, 0, &err);
+                    if (mfd < 0) {
+                        return;
+                    }
+                }
+                qemu_set_cloexec(mfd);
+                /* The memory backend already set its desired flags. */
+                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
+                    new_block->flags |= RAM_SHARED;
+                }
+                addr = file_ram_alloc(new_block, maxlen, mfd,
+                                      false, false, 0, errp);
+                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else {
+                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
+                                           shared, noreserve);
+            }
+
+            if (!addr) {
                 error_setg_errno(errp, errno,
                                  "cannot set up guest memory '%s'",
-                                 memory_region_name(new_block->mr));
+                                 name);
                 qemu_mutex_unlock_ramlist();
                 return;
             }
-            memory_try_enable_merging(new_block->host, new_block->max_length);
+            memory_try_enable_merging(addr, maxlen);
+            new_block->host = addr;
         }
     }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 620a1f1..ab3648a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2440,6 +2440,7 @@ static void create_default_memdev(MachineState *ms, const char *path)
         object_property_set_str(obj, "mem-path", path, &error_fatal);
     }
     object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
+    object_property_set_bool(obj, "share", ms->memfd_alloc, &error_fatal);
     object_property_add_child(object_get_objects_root(), mc->default_ram_id,
                               obj);
     /* Ensure backend's memory region name is equal to mc->default_ram_id */
diff --git a/trace-events b/trace-events
index a637a61..770a9ac 100644
--- a/trace-events
+++ b/trace-events
@@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
 # accel/tcg/cputlb.c
 memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
+anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
 
 # gdbstub.c
 gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 436ab63..3606e5c 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
             .type = QEMU_OPT_BOOL,
             .help = "enable/disable memory merge support",
         },{
+            .name = "memfd-alloc",
+            .type = QEMU_OPT_BOOL,
+            .help = "enable/disable memfd_create for anonymous memory",
+        },{
             .name = "usb",
             .type = QEMU_OPT_BOOL,
             .help = "Set on/off to enable/disable usb",
-- 
1.8.3.1


