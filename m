Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B134E7A6A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:26:35 +0100 (CET)
Received: from localhost ([::1]:38160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpZw-0003Ta-U8
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:26:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTo-0007Np-Qb
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:12 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTl-00034A-GQ
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:12 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHS8fM031405; 
 Fri, 25 Mar 2022 19:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=/9fgYmY3VqzOkuFKOBD8Jyf5x96OyKAr6GSdY7sOTgc=;
 b=cnVR++esnD6SEhF8lGA69eH8Ecqo+VdMP0oqE5bhSKNUxTmVWGNdLm0C52cNoHw8aNzI
 yyHc7Wh1OH8tguPo+wtwVxs6IEe7qN3Ieuu2oXahGPMkrMYfSc3Agh6+3BgTa8ELSPcf
 ozLpn+aJBHKVdnpCIMqqCuef72DEoI7jG3alZkSb25gvR4Lb63Adf/AkZJS7QylIrhSv
 mUo1Fb/3+aLuLaqphPHKC6bZDbNmPqCkxD23yM2ArwjzaLPTFqXr6VWWec7btp/umfDv
 m2XAKPgrXylopZLYhywiAWDZYHKR6agxoRzfOkczlf6S//+wp6uGcpxg3u3SWQuodckF tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtgb1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJHAxm125507;
 Fri, 25 Mar 2022 19:20:01 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3exawjj7xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAyQu7qf2RBQFnQBOEdntttGSNTLlbZrouAD0hwV4VgsB+3GT3zp3++k3lepH7iOduwdRV3JfSCnFyPqf+xn8C3s6oRJNm5ney0iNZkaKGlzZ5roXwPrcwnlNviWmqQpmXRDMPVJZdYrY7Bcs3Iuz7v5DDfQVA2ca9RlgwPkTTWCBbYGlUEtzW8syz/cQaipwy74SOxBHs7Ai9tZfelU83hfPGN5j7BvqjEfbCxCv65uIG/9txWmduQnk6n9yvCXiDAbiA+hylpGAlqeS2fZ8vqq/jLS+26ShZT5qmHD2e7uN/3Hkp17/zvEkeDkfoI1aDfvGVzrWene194ytEjoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9fgYmY3VqzOkuFKOBD8Jyf5x96OyKAr6GSdY7sOTgc=;
 b=HQ7MbLbJY+dcjYleReIULgO2XFoEPOR5BBqA6o3TNk7wQOiv2Slj+BchkyGijGbiMxwwNAhzaivPCYkaQNIIe+krDBo/ywQjsNhiuIp6Xiz4/BFtuoOgoGq67JX/GsRXG6FUzv8Q2icdGO8iAdZeJ6tVa0OjR0sc+sRK4x36/9XF2nLN427Xxr+vjY87ovqvr+gHfALIkfDmqZOSeg3Q7Ir0eQNdhrS6zK4yyj7HVEaNYFvYBfkwH2R8g5e8VbahUXSVI6tKuIm2sUE7xKzo2moCs+3YhbB33PxGu89TwsVEc14Uxj9yFHSpmfExLSfH0QrjNVUoUdRhLbgugZy7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9fgYmY3VqzOkuFKOBD8Jyf5x96OyKAr6GSdY7sOTgc=;
 b=TsR/xvvBmw1h7SGAuvmfL4J2vNguBojNZCSuanBR3hLFlq42bLikI6VHyq00GRpLSpv6DA/kl8JsqFUc18bG5I2wAaPmV1tqFoG/hlxugrBCXebexCTHm9ypjCT9ToC1JQQajRdsa7CSqlmb4wk4ZpYfgDjxPlBegG/r4TWhflo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:19:59 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:19:59 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/17] remote/machine: add HotplugHandler for remote machine
Date: Fri, 25 Mar 2022 15:19:32 -0400
Message-Id: <27e78b738ed37c235cbfc8bd52eae134e171b94c.1648234157.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: a157e2c1-5dd6-4cf9-a34b-08da0e94740f
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB520633DEC0B8DFC2E98DC174901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BrsXVPR+9SmdjnSPZuMmh959M4JPt6lWVoR3X/pIa6gu+KFTqATTDa9xIrEV3TKAmg/KJlTPI0JSh03sccv+DwPymKyuMjkGDrnTUFlbHedfGYJhfRK/qi2kwz3l7QlOrfwCwa+fODF/4cYa76+7inFLfP0Onsp44bLykJZ0i5VcXm2GPzKMjwaHguoAMd4GgvpPQW/CIuospx0Qd6jqRRnYbZzabu+a1lLLp03JX9PDzmTorUumEcinzyWeqXFxoxyHFMMEaCbTPwx8yfEoMpBKYQonlyFk7p1p688sEv8WwBvFG1UzP+JIQtdxppJRkfMc/VSe+BbFjoTK3Ae2rdWIt6NI1VuSf5S6D43iR/LVzoYwV+IDB9erADSyDG1csUQbBlZodJOulTiLFJ4D/trtjdkV56fWYdLJqofIuKhm1dpa2b+ySRPPlB4H0dSUC3kvR6r1Pz4cvp9a///CyRceUmJydLbheUPRJUjTJfZarWRSKZJAKq+ATkKdAyz6UIJmK9UfaEF7qeTEUuyY8HrOR7LvmqsvEo7W6f5dJjgXUDeJTqibgr5hA3W1h5LkYM9LupX5aCIMgugQFwRBDCdQGKjH762k/L6zeGekM04nX33WHEAA+SN4omhcF8g3tRdIyPTK7Bf4WCww9dG+H46YK+EBaNIK8kLzotStfCrQ/B+MnRrdPc/i3adVX80tNIl5pMQ+WQ8rsdwQlmnAZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cs55d34QEWu65evm01cSqLqNHlJBrxIvweea5TpPZ+LRQK+VLMHNJPxiDgiR?=
 =?us-ascii?Q?16GLLOxuIJCDqpcPEVPlMawP+K6ufVYn/ftfqabRLXG4wbKrleqcfngZLkfe?=
 =?us-ascii?Q?0ugTLqjtBFgOSoGqQeGgngO4YBfH3VcjyYRKzmWtTskPkqQZMQEacOLLIchK?=
 =?us-ascii?Q?xwHR/i1fOmgl974YWE/e05brmKXmt7GrKYLbxa8fB1elBxsils2T5BPmk7Hv?=
 =?us-ascii?Q?ggwih8hvCz0kCQ9qAZpPb3e68OEcnHxh8VLcn9XK9/ZhzUNMvoaBcCDqFbP5?=
 =?us-ascii?Q?l69KJv92+Mfnls0Igp885V9F6UGGpiUFL9fL9gsfaLwunt/xXvNvCgJycziY?=
 =?us-ascii?Q?/jF3PsxIK7wUZB9OWMX8AeGeU1duiftsGJazDrVF1dCRfT8riGrfOsV6YATZ?=
 =?us-ascii?Q?W5A8sl9Pib9nPD/jPrXZ2yjNvcvNBSEeSh+JLKmz7JkxIt8G9yft0l4UzWCg?=
 =?us-ascii?Q?zDTKfpyzN05C1xySGrf5/rOgrnVN2but7/Y1bD3mScM5jxhXy8YOYaHUGu3a?=
 =?us-ascii?Q?cwI0hGvVW5/TB/ngypSFrbj1YLejqwQ8SGfl5bsLl3LnRtkJzB8kb5YNOl99?=
 =?us-ascii?Q?Yky7gjd/Dsj7wTQFJjgIBhQgfPIqBd3gCig1DBBySMdYocqGJDg0qfpaJ6yW?=
 =?us-ascii?Q?xl4PqwoxxXxb94wMulJZCDk2Pw2AP9oq+YXPxnOQU1vwM3uH9a6kOafWwYRi?=
 =?us-ascii?Q?CTdum79dkhyednBEmPyh3GR5OOG81LtJCsmbOUH8660yGKPMR1pfEkOnR6rO?=
 =?us-ascii?Q?UEmcPtZVU3xXIoYMm8FIsJBNvnOhREYE6V2DWQhpJfv1GDYFYDMB0aETE/Db?=
 =?us-ascii?Q?sabEwzcKK1C526dve325xY0701b+UfTOybadAb/WQ2iZOQT5kpHWgH3WySvv?=
 =?us-ascii?Q?JKJE8EWAniWBFr4Uk63jvRErUMKSAo19a0dezPib6XwRZ+5Sm+/WtKMT2mrO?=
 =?us-ascii?Q?QZNE7uwnuL0ZpvGJouoe1vX1tWlsQdnC53bFu6xRg0WuqKUV9as3vQ/SfHwR?=
 =?us-ascii?Q?MNt4WnmuWClPbgLrIGItVb1O4LBrJc3xU/5fQsZDLr9/F0KcaaCBYwXnkYQO?=
 =?us-ascii?Q?0/tRN2il4STw7Ki215T9Q6GzAenhXcBKTPptYYGLTczHSqsf+8kzCpgRRXDz?=
 =?us-ascii?Q?MUh0KTJnupsmIvavzDx7Zhg3NncKgb+2b/vT+y5gTd6Erb2RyM39rZ1UinwE?=
 =?us-ascii?Q?ChCdnlb0vwK4u8K6L+Aa/w/V4YJL+SGgmdqPKCPd5lnxAiDNeatkkYAFnh6S?=
 =?us-ascii?Q?x/kL6zSc9ui9LeXc3B5UhTubH4fKIitmUeX6SuZLXn3XntQz25Eb8i1WDZfJ?=
 =?us-ascii?Q?LeoAVKIkOBiV9LEy6ffrUoUihBOMEkqbR0by3eDtEPD3pKaZBBNo+/IsGSt2?=
 =?us-ascii?Q?0Mos87wt9NvCq0EkJJZxdWbwS3MP7PxJxVL7ilS7tWc4gcmheMungQ0XT9LA?=
 =?us-ascii?Q?RQiBnNy/rUbu4LzBS+glF65owjnN8ZVLNxrojfeaiPc6xlNigrfYYLIX/cKQ?=
 =?us-ascii?Q?AXCY2OqH8M9tin6pUny96CpLUNi36bspd9Uh5V3xGXdD8L71wajuPtDd3IDx?=
 =?us-ascii?Q?JUmNAdNkPhZqckfXiK3vfn/7xAXVIokeVeAppAszwI6yM6hMhH5Y2BwlRLL1?=
 =?us-ascii?Q?l0TnAA6hL3xnPDUUYa3d0svrwnXY+WFavWt9s0832JEq73ApTwY2O6YFJfZW?=
 =?us-ascii?Q?G+fY0kwyPqE/+pA4P8x3hcHjds1Cy5o1L9s+ZjepP+VX++5Rsljg08DsD96N?=
 =?us-ascii?Q?AXJ2/8UBCg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a157e2c1-5dd6-4cf9-a34b-08da0e94740f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:19:59.3508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvJMkQFhoF5qw3bmvyE8b0VZQgy8IRnGFtGmH/j83JdBew7DRbU9ZaMBMlnIxPEyG7J6pJQ3Ha5VicQpnv2ChQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250106
X-Proofpoint-GUID: 4pUNu_OSj0J3vLd1zYSvbAjXczJ4Y_4h
X-Proofpoint-ORIG-GUID: 4pUNu_OSj0J3vLd1zYSvbAjXczJ4Y_4h
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

Allow hotplugging of PCI(e) devices to remote machine

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 952105eab5..0c5bd4f923 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -54,14 +55,19 @@ static void remote_machine_init(MachineState *machine)
 
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
@@ -69,6 +75,10 @@ static const TypeInfo remote_machine = {
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


