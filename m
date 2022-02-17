Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4474B9ACB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:21:49 +0100 (CET)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKc2u-00048r-Mj
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:21:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbY5-0003yL-HN
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:57 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbY3-0004T3-6i
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:57 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4b68N005175; 
 Thu, 17 Feb 2022 07:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=SbuJrI8E7mYROfGWND44Ho3onD6eAhyXw+xRa/fbYWg=;
 b=OzeYMbAwBFRRZ61AO4l1uuSMX60J0wr29b//Q7+HNrSbbNWPOzViD5BZwMkPgsvar4zG
 QCsyUIe7imzspIZ4Fq5l9MQRWlEOIr1uYrVOcKR/d833H2TTquzYBsQybFdAq1xmP3dJ
 9BjskHbAH0HM+w1umMnVBdY2hGDvHeDzkvyo7u5EGRraEvVe28dsWVyOmLU0F3pRbB7q
 4EWD8WH2BaAAZpsPfUcZW+eoF01UQQwxcM0BYbWlScrGCd8FL2B4Qv1zEgGCS0Tgf8qI
 zFmJ7cif5kw7BivJK3hIgAKQyCTw/BBi6TlOIddV0xARwjbJDY3vZ7eqGsywAPqpXJIt ZA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8ncavqxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gU2S135603;
 Thu, 17 Feb 2022 07:49:42 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3020.oracle.com with ESMTP id 3e8n4vje24-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mA2aKjn2lQWw9tlbJxdJ0b6zgphrG1jQ+Z+thwiLXif1V/U9mwTgG0OR/2wv2OaPj6ykocljlOI0u8AZYxxmkQXoPwSJGrJtfuJJowuQCWSRsEp+CPAhBqPaIVn0ESLUU9/neB2cUZfVFq7vPKcnq7daJ295Uk+vXhGxs4S4K91hsoIVt6jJooUyI8KqrtnxGcbTRtEpp/kS/89Fv8x+vtTtUBHCRjmzqTjkJQSzA5g2M/P8vgzwEc3GypRYhUDuGLM7xQpn1PmFNMC3uOs5jJZPSOma8EO9AfGSX9rhYYyLaMzue0Rt7LcP/SG+boHum4qEJlj670uBrv3PBWXVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbuJrI8E7mYROfGWND44Ho3onD6eAhyXw+xRa/fbYWg=;
 b=VmJ19JRMRd2ZqRM9ZeCtNjoV+t9KzlFiWdMEfcMhc+ImTLfqWmzDgxFuVC5us06juqdXeM+gfJyrX4qcKkKFeMB89nyPAANTkgo0C0MxQyqepJ6STWdsxWD84O5ZHQ/eigCghaMmk+6O0HTVYqNIv/JEstRDx2ChK7KJtIDQJ1+xlJS/nrfF/rQ8fyjBbiJ28V3HjyjIKhc83NwJ73zOUGNsuwV+/JZRHteSTpwd/7LsKkYOLirS1hTM0iomCDXL8VtNvB7Vf9MbLfEnc81r56e51XqoZynG8PwhM5TBo52CRz2iBTnB4bCt1V6/+4hhTkcjGgfqhu3hvsATJUIplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbuJrI8E7mYROfGWND44Ho3onD6eAhyXw+xRa/fbYWg=;
 b=OHqhWDIJaoDRkbZhxNkFm7qCwu0Y5GDIGOA5RBwvxVCLvtlYK45e7EY3GaEMoqfBNm5BMQsx2/GI+SFtfUKRz3cOWQJt4xXbuuI/iKaeizbT9c831B2LHEa9DQk7gxNZna+WUdx2qC++Kp0ltpbDh1CiQ8djwbZA3tjwHcV4eXA=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3211.namprd10.prod.outlook.com (2603:10b6:5:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:49:40 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:40 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 13/19] vfio-user: handle DMA mappings
Date: Thu, 17 Feb 2022 02:49:00 -0500
Message-Id: <a1c3fba5d720112d3b63f3804662ff0c35fdd77e.1645079934.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 39f603be-3faa-4054-fb86-08d9f1ea0d91
X-MS-TrafficTypeDiagnostic: DM6PR10MB3211:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB32115A6318EA1059E4D5572E90369@DM6PR10MB3211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6llhxYm5vfO6oSLH5BCn9kAt/KF+b5durqaixqLnwEBsQILNdE/0WuVzu7lhLhALg9I7cD1FBQ3vT7mut3SnGJLTTYAGkv8NSYckhtulTFHcOe7vdIq1rT/TxUgO2usfPGoWq97av0zD7sZD1FqRuK7AZmbRa8583VVsnoPOO5ru108pvo1EcK0x+bg+2mLvqZ7bHcR+mILY0K8deqEg/ezuLqTM/tD0WbqvBnLT0FuCJHEzgq+uAVEODV2NAeSMZH5b4Ushm47HuHY/RcIuPn2opRbgAvK6k25zksO9f6vFiiw5hyc0moDz2X4mHJMOpI/JEq2IeWfRCBUHlVs7/aqqyTctMgV1+KcPFTmYEVr2yApZvEazIiicXlju9hAfJpgBiZ00vviKObWdSulO2e54FgBbp6uzf6xbS+8TgjstDveWGkiT7w/xKZTpVaEciVhMOJUkgpneYxTMVmuhBjfshtNT3qFkocRWxAHWZQGUmtgKsnFt25jdgvr532JuGgkXUfRtvDoWVPvc2X+S0gPFSk7iDOHzuUeg3iPPfXgXtqiI54YBYbEPy2yFqe3+t9GJyxBHyGkV3vFRUdhzzYIPqyuh4aRSX3NMFh65LC5FjNI1CEF1kamzH+cFDzf1SKkjZ9S9iNCV/DzxkYs0sFz2Ol6IjIUXxyAHHCL2VcAeoXK/KPMONPUXablDSUKytOO1ocJ6UJJ4MZsiFPbJxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(66946007)(38350700002)(7416002)(4326008)(107886003)(26005)(66556008)(6916009)(8676002)(5660300002)(2616005)(8936002)(86362001)(38100700002)(66476007)(36756003)(316002)(508600001)(52116002)(6512007)(6506007)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cG9DIcqTCYATZIy97JIoRg0LcBl79XVC/y2GsmKjM6nJYzNk8byTNov+xG71?=
 =?us-ascii?Q?sYsBeQr98WpQVY8lCVjhSPt0g3epQwr+5DPwoDCCBXbppkivzkalSwdCyaZe?=
 =?us-ascii?Q?SccwKagQzKfd/3JTyO9k+y9Ig2SM2bEFBXFUMYRun1R6uWNsnZ1vACsRxOrl?=
 =?us-ascii?Q?JMTxSHJbYg60QOp4INm9T8vjDGpidIL49epDJxJt/nW63XN1H70OvYg8czjb?=
 =?us-ascii?Q?oR+5rd49+OJUPhyFoaaXPgtycUYv/eI6aAsp8PVG5lCTCwQoXNd1HoxoybHC?=
 =?us-ascii?Q?tIG+pmttkYJZ5DJXb62+QeVSghQ6JRmkl4fz7P0Zh+/i9WnfjcHEtBNiSQBb?=
 =?us-ascii?Q?1aVfrTgpXsjqHUS1krHpD4zZCqTxqVAnyX0lK23iJiVFMMitLCDWb/WIcwLh?=
 =?us-ascii?Q?LQBQP8AEnVgY5yyJaPv6OjBrvgH/1P6K+kNRSMrULdozrhUi/qjMYYCybldG?=
 =?us-ascii?Q?9K1Q+KjNq9c/chCf5ANDfp9jdrsCVLEcM3VTDY+nrjKHUUZmIcojnUYO9Zjc?=
 =?us-ascii?Q?JcKBpRsAou35HSi2ZPzze4PQpEU0IZ8HL9aMbmg77JNYagXJzDclOQ69DkMU?=
 =?us-ascii?Q?Bm56odHZnDbvvgnXq0rc11QbGbk9LK9EKSdhaM+WcLP0/rgC9IDdw2NwZR9U?=
 =?us-ascii?Q?ihl1KZlQm2kuxy5/Oc5h+Vl9Cvn3W7982oZ09zvIAczIoDhnrBIb+PlgFrwz?=
 =?us-ascii?Q?9+ds2tGsYI/m/D+ylizTEErl+ZmPlPnyZq8TYW/f1AQ731sl6rQBTF7ZpM3O?=
 =?us-ascii?Q?wWZZ9wLEQwa1qNd1TQgwPgbjmVqlFekz/bKye4VYTsYl18hcPSIhRGHNZAUc?=
 =?us-ascii?Q?sjm9CY26jdNHWypTIE7gAT8HEh5ILY2VXz0dh6rUpQ6eTY8/pVWQmt0nzbez?=
 =?us-ascii?Q?pIHlpdvyQPf+XFNDAfSyfScuUha6ZrOqbUtr5ktkG7errBFyh4Athaq+wBX7?=
 =?us-ascii?Q?geHvac4UaTfnNEr8AYSpni55pP9LefHDSCl+Vbhrg4akz5yP1o70QR8z4ftP?=
 =?us-ascii?Q?5Dyn5npp0wGiX2FA0XhonHkBF+XcrlZGrz7La3V+BIXOQ7kf75JJmIpq47wA?=
 =?us-ascii?Q?sGmANsiwitFHrtGCx2QB1dr51XRUdO5zAhfbFLKQRoxlaVdykIsYN3Ojvhyv?=
 =?us-ascii?Q?ZzSHBeMf6tIvSk0Dc3p86zED9/Ums0QqO8hoqvyVnzRWd1Z8HsF1C1oA8MZq?=
 =?us-ascii?Q?sMNcgiL2VlIOkhNbFNwnMvXhK3poHcPfr98Jfwo+qUesIsk1uksaZvu+zmBZ?=
 =?us-ascii?Q?LB5rSTd75n46qW8UsCg0tELg7xeo1tc7No1Da2FsxBNBYidFs8kOfnUcpJkw?=
 =?us-ascii?Q?tjUK2B7hu9fh+CTJJ7by3/I46iXR8lq/dCKvNZxCfTMBDtvQBcwewYrC5WnK?=
 =?us-ascii?Q?wuGjOvoJFMgY9Bonc32BH1TKj++5Rp1ETNefAHII+488u+rYCb/lmXDJgmdF?=
 =?us-ascii?Q?32dCaucn1G2r75n3TLoYSKr6CvIR13p7EJz4BLARk9nmi6EBBdflqyyZeqw5?=
 =?us-ascii?Q?rGcFYHsEVJjvME7jTO/z02McBWSuxkgH7fXuEEgJE0jCRdxMZsVbhFz11sqF?=
 =?us-ascii?Q?VuZ7si3XpwiLwnyl9GtxHylEFxGWo2IQkIDbaG8ZoAsSGzqCGdJyBULh3JFk?=
 =?us-ascii?Q?ZDgqW57HYw0W83pGfYloYhg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f603be-3faa-4054-fb86-08d9f1ea0d91
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:40.3041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqhnV9agptMdmfRgggmjr+pRvBoCv6nFufmY6UwlHG9fV6IgPli9oJVxFQQ44mmXDQ2sYfcisCxVFWmPTEzQkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3211
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: 0PLl5ht1kWVKObpKQ2SRRGRc2XtnUnkg
X-Proofpoint-GUID: 0PLl5ht1kWVKObpKQ2SRRGRc2XtnUnkg
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

Define and register callbacks to manage the RAM regions used for
device DMA

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c       |  5 ++++
 hw/remote/vfio-user-obj.c | 55 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 3 files changed, 62 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index a9a75e170f..db4ae30710 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -22,6 +22,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
 #include "hw/qdev-core.h"
+#include "hw/remote/iommu.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -51,6 +52,10 @@ static void remote_machine_init(MachineState *machine)
 
     pci_host = PCI_HOST_BRIDGE(rem_host);
 
+    if (s->vfio_user) {
+        remote_configure_iommu(pci_host->bus);
+    }
+
     remote_iohub_init(&s->iohub);
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 4c4280d603..971f6ca28e 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -251,6 +251,54 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
     return count;
 }
 
+static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    AddressSpace *dma_as = NULL;
+    MemoryRegion *subregion = NULL;
+    g_autofree char *name = NULL;
+    struct iovec *iov = &info->iova;
+
+    if (!info->vaddr) {
+        return;
+    }
+
+    name = g_strdup_printf("mem-%s-%"PRIx64"", o->device,
+                           (uint64_t)info->vaddr);
+
+    subregion = g_new0(MemoryRegion, 1);
+
+    memory_region_init_ram_ptr(subregion, NULL, name,
+                               iov->iov_len, info->vaddr);
+
+    dma_as = pci_device_iommu_address_space(o->pci_dev);
+
+    memory_region_add_subregion(dma_as->root, (hwaddr)iov->iov_base, subregion);
+
+    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
+}
+
+static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    AddressSpace *dma_as = NULL;
+    MemoryRegion *mr = NULL;
+    ram_addr_t offset;
+
+    mr = memory_region_from_host(info->vaddr, &offset);
+    if (!mr) {
+        return;
+    }
+
+    dma_as = pci_device_iommu_address_space(o->pci_dev);
+
+    memory_region_del_subregion(dma_as->root, mr);
+
+    object_unparent((OBJECT(mr)));
+
+    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -338,6 +386,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_dma(o->vfu_ctx, &dma_register, &dma_unregister);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup DMA handlers for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 2ef7884346..f945c7e33b 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -7,3 +7,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
 vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
+vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
+vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
-- 
2.20.1


