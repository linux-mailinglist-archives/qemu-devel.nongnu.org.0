Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE97532D98
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 17:34:27 +0200 (CEST)
Received: from localhost ([::1]:55570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntWYE-0002C1-PM
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 11:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWUr-0007hl-Fq
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:30:57 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ntWUp-0003IR-0N
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:30:56 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OFJgGe015053;
 Tue, 24 May 2022 15:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=t5tgMMmXpRvBP2cJyjBHcmYEbrGfrdT/NzKncbAou6rb2A2GD8H3tVxbzt6SpnIhhfgP
 J1DSRj8/EPRfWbd92qofQ/1MpejitxLOjuAA1jcIqSlDKD/EsdA/jocQ6O5zv3scYTrg
 ligaMUtcIiHRbavw26JvdvvUn31z4gMAebvRpfAR3WaDdwLssw7Quz2erNR468VZRo7k
 9dceRyP1UhvqjQSzjqkYTl8swWubXoyNJBfPcq0sja0TBzYDVnDhVDHwoYbTHIZMwgyL
 rNT3+Ow69KmvzA/P3kszWfhRCdwlS+6+ffG9ws2rkzbvaEjRdbOr2xndNjl5qCd//4yL pQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6pv26wcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:48 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24OFFrjE015045; Tue, 24 May 2022 15:30:48 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g6ph8x0r8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 15:30:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLxM4lVfnvsulH7uC6D5Y/ab6odHnNfgKXAn/zxluylkdoMgRuNsTXFHHfdiATEFXNLhPO71guhdg8XEHsd3Z97tf65D32/e89/60idMzMSgctuKHEZQOcJz0lrq5RVwqzzOVKqcMZWzv6QC+nOByxP3V5fNciyPS/t/kCNRobOeB1EIPC4ZTDneJTQTB7OpIYRYgCLnvXlc0cZxSn/oTyvWeN7V5WKIRYIKojXJyHEpj5y5c+UEysOspt4j1wzSTISF9svCA3FLln2Co59bkWOfvS4pzZMdHTw7a4zDpADql9mtNGidnaeGMmSfkMRdHD1M3SA/UtRoC9UeYEwrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=cXt7R36Ox/lQ1hcd+RAxy/JLIY6FtvI8qkqIjakWlMZ+JhwDW6HMREudlmvBiN0mo5Ga4xNIR5X8ktpVW3WwgBlpZsAyb9zmTsYZbX2r3NY0ij2C9Zq2q866inZMuoXCwtj9Etznv0IoeKngXIOGl2+CpsGDHW+OCEyDDIxDSCI1otZS+6g8nCQPV/bFOOJsuAw1YB0SNU7sx+DVjWcWoqyczklcoBHfyMOveCobqigtVUwWLq9ixUpqIVWoI3+LBOXfQ0AUuI5U80jmF6sUZbSlHO8cOndgMSoibZR26HOKoIuHsP8yzSBYg4wucJQOk4RhiV7LZ4Ujm/Up7SXzEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezs4Sf67fjK10WgD/7RvcUDz7aSscd9W02JfSQT2ykc=;
 b=RfB6RYYZJ8s9yIU0YGLwr+AVVt+wQPuHmvR3kJX0HPPy7i4A5sykORIz5eD6qExrDbMAdYWif9ANqxbFl4u9Nl+aXldEwPsld7kWB2AXsqkSkD69UQxuiSP675W9PM2BgoTfUQl0gwAiKamzZZ9txSJQTBKVOSJzK1CB5qyGDxU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3117.namprd10.prod.outlook.com (2603:10b6:208:12f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 15:30:46 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 15:30:46 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v10 02/14] remote/machine: add HotplugHandler for remote
 machine
Date: Tue, 24 May 2022 11:30:21 -0400
Message-Id: <7b044dc32307309fb0e03dc6453ee075e4e39096.1653404595.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1653404595.git.jag.raman@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::17) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62c35254-1611-4661-7f61-08da3d9a5f07
X-MS-TrafficTypeDiagnostic: MN2PR10MB3117:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB311702D75174F1DD7367A0F190D79@MN2PR10MB3117.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /cH4z6guJzaRZwCuDwNHH+B2aIhO5LPJtftOni0RcRJcKXBJkV7GgelzfjEzl2oO3FrU1X9sv5ZT4f+myLtIHfTEANaNmV1FU2ZNeesy40+NRlsbzPzW3LX//QTjRN6Or3hIUyLoqcg1JPdJv4e+iiX2fj2yzD0HUpPAXFVhrrx5sjZnKWEItTrl1tZIgCVUbvNSbFcNRrClke9Hh4XSAd+jzRlw/84hrDiffxY1Qsd7FOaPju1JyxNTq0aXh037/939MKRco4cOUYM87oXCNPjbl831fUOdSZk7Q34RlgEoW9N5gi89fCtd44SGzlbCEdrVG3ZG6Ns1ymYoipk96icU4sNbAwgx0OpMiPvB/WegKJBrT5brvtYmG6HgEKDytWMjAyhAuLU5rSWS6yXcJEGaNE4YTjol6NOna7Zu9Uc5eR549xj8FGws2oZyZqufeDP6LVwu31SxFvnnI3x7fZE3hJ2Gmb7gaqR09MUi0anWxtw+jDgMWLT0c1q1KSBVqI9c3stHr3CrVuS9g0MXZPYF+qo0N1DZgYfdmva9FxA5zZ5mbEfGC7juFE7VP0JmuGKExQrCFhLiVHTLojRJeeHngv/YcSqMmIom3B52HupOgfVBa2iEXIyi+myE6GP+K6rTrtcHZ7Jti1Xi+6yflLr82fUEUQfo83cnWjamY+KYVSqZldd4hXCih0UhM5k+AmAaXqyNCNQOD2BekNlVQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(66556008)(38350700002)(5660300002)(38100700002)(7416002)(86362001)(508600001)(36756003)(4326008)(66946007)(2616005)(6486002)(186003)(6666004)(66476007)(107886003)(8676002)(6506007)(26005)(52116002)(316002)(6916009)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r+5P0XvcAEhlpC+31PjAzBfGduiespRcTqHzV9z9oS0XzYy6reOeQhg2qKAv?=
 =?us-ascii?Q?hbmLsiawtcD2pqtlugb04cI5w3sbo75TUjXZgasN6XkCwCgaMNvuiWIEbVPi?=
 =?us-ascii?Q?MM0v/a9QV5awyjiL9iMeK8sBxQBRhRTgkg1xUsgDU59g6UV0RWv51JfJUqBH?=
 =?us-ascii?Q?qQLZHorpa+My3Y+UNDy1vfiWa9OGiThCBLaCIfC6lzefLnp70vXosaI/2lZq?=
 =?us-ascii?Q?DNOATiKZKApiUFHrDgnmBCeQWcSC38oTMtkqNmddz42TddPKOd6Ci6NV/76A?=
 =?us-ascii?Q?C9rUX6Haq9lt25x7NSnBaA/LasM4Hyzj2XV40z2ougJsqTlCP60r41uhGQyx?=
 =?us-ascii?Q?EP9ruGGNMfdY76GiWqQTh+AQ0B5UiZOSa0oL74xvt0mQXcUXAzQ1WUAzHD+4?=
 =?us-ascii?Q?K1tfZH8VHB8CJMMs1GsWwJ+4M6ACZQbsTuUmk0wYZbQFgoh2iLkHeqlo2nha?=
 =?us-ascii?Q?D7AD5jOrdNquxQy+DT5Ty/31c2j5beRGYSVEy0CY8pcGPTv1RHjTHG7eJ7uB?=
 =?us-ascii?Q?RAtM/cAEkKq2hR0yeTe5+l1o2If2O1ccxVLXL19CczLkjjQExBCbRHr7nZZr?=
 =?us-ascii?Q?ldvY6PHZ8npaMyWd3mWxw7Y0ZsuTHlrJcqFNBiBQpxtglDrhLI6oozYnCgqq?=
 =?us-ascii?Q?LQTpE19phE6n10ZC7r5rNn8I5zIoU+y5Zjv0R4WOT96lBZHAtZFJ50V/Uj1o?=
 =?us-ascii?Q?SpB2/DblZT0iQysPMSZ360vqyMNfYg24b2A6/a4orEI6FcbcEYKc7bCbqI8G?=
 =?us-ascii?Q?sYdKz4AZpM7XBlXJcgGJLyEJ/1Acarhyduw7qmtB5UzoUhz2qy0SNzh9o53t?=
 =?us-ascii?Q?yNmn64rQ/kM+k8+TpWxGVx+pueCOs1LHm3s9VctAP2Sm6HnEvtrWb30XGycy?=
 =?us-ascii?Q?X5YrVMuEdz7ckByTFld4dsJR1b7cbQtbKsN2mhkH3aFlNQsIghV8aRbNFsmE?=
 =?us-ascii?Q?zwhJm07cm0iJUgoTfFSF7cyWhW9TPOCV1TUhGWH6Irbh4PWr6SYlNoSS9t3t?=
 =?us-ascii?Q?nqiho5robDcOAFgDIx/S1Dm/m5FEq9tV6vP/mdx+Vk/N1cQtkRTgc0US9pjq?=
 =?us-ascii?Q?9eYAX7HZjEVoFQZOpCRDxA7POSK5TvkLF3vk2VlJcihcuAkBeXy/axrWGi3+?=
 =?us-ascii?Q?NAX8zOnBKtwM8pArqVKflbZTUUIChdJCI61uKrubGf6qheQzBiVUJdAfF3TR?=
 =?us-ascii?Q?ZOs82XqoLNH/vCbBpm2DeRG8MUpOOsRJJdem7nV7plgSLbY9uWA3RsrY9G5m?=
 =?us-ascii?Q?IVmur2iskHedz4GYiK/+s4wjhcZgXQ/UDRo8PnVEt2LnuAjJw4mLDCVSXGG7?=
 =?us-ascii?Q?uQrxNXEWLkBImfKyYwuz5f6UdTAfWiIXrPxlxcxFoij0X6nrg9unTOxF7T2v?=
 =?us-ascii?Q?UFzyJAa2P+2AndzcccgKhpTNvmPfzHrUTX+FJFsN3QrPdoFmwjX0c9dEAU5J?=
 =?us-ascii?Q?NTDwF20tGmfHgKUr1JCQr6njxHfKCBl46PyCSRqcKoZqP0t6xoM/BBJO2klL?=
 =?us-ascii?Q?4NOxYdFSNVak62j2sfdpexUIpKB2rcvm4x89o3BDB/UIDlYcf1JzZI1deNAE?=
 =?us-ascii?Q?CE7ya5nSH9Ibc0g2RqR7OdsLeo2m9i4bxy0WAX7CZ66+829aGwNtRCUfuyPK?=
 =?us-ascii?Q?k7texV1bvayREkGuZ50RtzmzYK2h+eWFGs101SiJCydDNgg9q/PUy0tLQasq?=
 =?us-ascii?Q?jVw8P6XVX6FJ0JhQceSGkyTIAfKU7o2MGS9ifRWWJ3f3gYq2SD1IE5ENS5F2?=
 =?us-ascii?Q?/cqWo90Yiw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c35254-1611-4661-7f61-08da3d9a5f07
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 15:30:46.7430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rs3hxSWQe+pNA++a725Ov/kjSWD6IEEIN+seE72H9vkLY6Q90aHvd7XxR/gDNconnmO/dx90DXDqd835r8hbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3117
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-24_05:2022-05-23,
 2022-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205240079
X-Proofpoint-GUID: 95WGRL0njyJgU-uM2kL6tG48frVzSqe1
X-Proofpoint-ORIG-GUID: 95WGRL0njyJgU-uM2kL6tG48frVzSqe1
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow hotplugging of PCI(e) devices to remote machine

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 92d71d47bb..a97e53e250 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -53,14 +54,19 @@ static void remote_machine_init(MachineState *machine)
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
                  &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+
+    qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
+
+    hc->unplug = qdev_simple_device_unplug_cb;
 }
 
 static const TypeInfo remote_machine = {
@@ -68,6 +74,10 @@ static const TypeInfo remote_machine = {
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(RemoteMachineState),
     .class_init = remote_machine_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
 };
 
 static void remote_machine_register_types(void)
-- 
2.20.1


