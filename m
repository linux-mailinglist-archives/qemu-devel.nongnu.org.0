Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA64B9A38
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 08:57:04 +0100 (CET)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbex-0002Yz-Rz
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 02:57:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXd-0003kQ-Vq
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:30 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXb-0004R3-HG
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:29 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H5fnhJ009160; 
 Thu, 17 Feb 2022 07:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=vhEYFFYX+TrtcRrGWsY3oodb0J1nU/gv+MKcvz6xNgs=;
 b=NERy1FTl28boyWNwjxOzvxbTZ2L378eptVi73LfcMr5CsPhWpfedIFpWhyqaC3ZdNxCg
 vXbE629T+3GYjkXQ0ppOx4e/UxqcGwQE3PdHFplqZeL4+ql9eOx3FpfPuswnSl42Z9Mt
 18/za70h/VpJZ/aRIYv6mohdxMliSW5l2uHnJ3wDIimzzUQCg8ZB3/OUgon8PgJh1AEi
 zyaIb9D9zpnnBtSjasz6fhtZ5shtTmCPrc5wpHhlFKU20GJRuN0qE3/dAHi23AVDtAjX
 5DCOCc7eq4TVZqZfhQdjZQvINLqsqgbkT4Mf/x2h0xIqktABsxlSDkLOBYgxPmQ243Bg uQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nb3mhqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gUYC135610;
 Thu, 17 Feb 2022 07:49:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by userp3020.oracle.com with ESMTP id 3e8n4vjdvt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZyabwPcUBOGb6U2m7pct+f1xzB8amSQyXrNa0RNBzcG4oW7ZAMizBrJI/rEnNnVkXHBx0SQZqpybzKK2W8aPt35TWJ1ROhIFWi/wgNR7JEz7g/vQTjn2TG98gWVQjv83XJ6jH4yhwjWulUqYQWG74c6hHp4TEa4k+9kOxuoOnzkBivvyCpOecL66yNC0j9GvnxX0mOA6YnwS7FOhhX0jj8U53phmjZ36eXffZRVRDE+mtWPtBx59HysiX3OY7Zf0A7ZcrfkFpzJxFolDt3kxrvkDHpsHDNrqM94asED8FEwafth+tHdoUO/eueTieU4AqGBsJFlecFPYLS9rY1qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhEYFFYX+TrtcRrGWsY3oodb0J1nU/gv+MKcvz6xNgs=;
 b=e7oKYoE07HWXDVzw04i1rAo0mJ7MSHRhYrBai3R3HZDaUwcwHaeKUFgOyWE32J7D4S4l1k7X3TtoS4vLFTIhGch8+nWfYPKycOkVYGlMfyH6FTmCGrWTOUXCvvwSVWuQfGMF6cQ/L9JkC4Jjxyc4/E4SIjFKMEDSDiLaO96eG0yan2/kfUWEJNbY+wKckyBI9hMmJC4m+nngUUPMGHdzss40AzmgghAJ7u8HSlIjv8GZpv8PGa/kGNVxmNdkKzIa7odS9cd/V06BIEcAd6s/MHIDdXl613fDjuBbDjRg0BDYjTkhpKoghdkGbsZLyp7OIzmQoPPttjbKIfA0lEscgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhEYFFYX+TrtcRrGWsY3oodb0J1nU/gv+MKcvz6xNgs=;
 b=EMEojuLdJjkDCEQvZ7hg7nDmHoplrzKtv1/e7XAaenac4YWjVldHBcv8RAuzRUNhItjtMD4scPBGoN0+HbEm2GrY53Bz1MtgZ+4mLQyK9Yi14vOaaDWMCrhiOQZoYtFe/NAFIHAdzLiCn60FVfed/pO6wRD3klI1i66Xn4kqdJ4=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by BL0PR10MB3009.namprd10.prod.outlook.com (2603:10b6:208:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Thu, 17 Feb
 2022 07:49:21 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:21 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/19] remote/machine: add HotplugHandler for remote machine
Date: Thu, 17 Feb 2022 02:48:51 -0500
Message-Id: <aa49b99e70d4a4dc9710846a9da487edc80f4f0a.1645079934.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9f0db0ad-81e3-416f-7c64-08d9f1ea0216
X-MS-TrafficTypeDiagnostic: BL0PR10MB3009:EE_
X-Microsoft-Antispam-PRVS: <BL0PR10MB3009A6B1D166E10695B0790F90369@BL0PR10MB3009.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q336bCWNRx7fafMAGyYE0DLgtRk8+4AGTiKhddnCWUHMgiM/UQ59+2CoRGkUitCFYidBu5waUZ32KXB5EX7cr6MIMhl3SWpb5RHWVweu1F/YsmXvPkJxfip6ahfIWSzPXnJwwE0BWbsArH0V4yg6pXVX8mANscpDbnUB7H+2qpn4NTPc7iVtnlBfH8nirunT5J51hvsoeonwvG2gagVAhWReCnkU7GROgp9xhv4jxYt+eYMLwGPMEATeExBfEd5JteApx7V4xAlano19oWHrC6hvsOd3LdJIptf98hQQ8QAdmimZo1n4qiJ9BdcsjACL/FaG0dNUUSoSbZDFkyjnWHG/MKs83S6A+68u1bQNq/oCFCYR/xFItpRm9eCXTNHpuzGHxKOXafr/yoZjf6GmgSbR/+e95yI5QCUbwstH3MaktLmwoxiktVTMTbpA7XDc38GFwuR1Zh92CjHyUVlDiaLpHuIuvsH19Hpp+Q0SqDBX3rseHEVSDj/yW2ABXRyzSKPh9cBK2Sl23O91YcMp+qv0RMCh2lse1H6U6XNL8CnApzm/xJWeDrV25vwJs5M9USrd03/04Yy+pDI46H0yPNU1QFnFQzs7Geyfds8zYD9M/jicEa215NTl+8plzTHcgWrKn4IDTX6sX4vfzYAOjeiNe4VOel83lmfsvs3oCgOFPUQBi8PywAJdsXipQuObWVP3hKvSxCePb1k85KTBMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(66946007)(6916009)(66476007)(4326008)(38350700002)(316002)(36756003)(38100700002)(2616005)(6486002)(508600001)(66556008)(6506007)(8676002)(107886003)(26005)(2906002)(5660300002)(86362001)(7416002)(8936002)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tmWZLzo/ocwVJu5IxvTwmm0+qY8Lu48Shj/Nh0BzJh5dVRo3STmhotgRppOY?=
 =?us-ascii?Q?8+NQhwnk+4RJkCPNU+uJNcHnUCkEtxP1S7bCl2IFxcxFMo/uG8Q24gKw7ctV?=
 =?us-ascii?Q?WepAaLMuCcfNPkvsfWI0lYrWqonMO/g2KE92o0hjcPvxzQyjTIgivPYH6R75?=
 =?us-ascii?Q?XmhdK+pE4Sl81bql6XwpAHEwsf0FoeLi31cDXKbf77Lubnni30V25Tr5pNzM?=
 =?us-ascii?Q?TuUw9cGnlkMI25YJRoj5lZHojoGXDnHCSlO2aFr9FxW84Qp7KyC2uT7To8Iy?=
 =?us-ascii?Q?nYK0BT/F+/NXa1Y6xTaOIjHmtHAr7vb1dXXyk79bj0SfAKliOCxd+wzNo7Bn?=
 =?us-ascii?Q?5P0cDxZMHckKvf/wSPs3F+hyDWNnyqwwSwp06lD7hgk9dJuT8OO+GeDB6b8X?=
 =?us-ascii?Q?uXiAId6LfMcYSnS1DcjbzgkwCYTaeGGj8bSY6xCh7/fgXDe8pbxuW0M5YsUO?=
 =?us-ascii?Q?+WkDn4xJ2QoCYrh2MtQBePPg3fuDScI6el18PqL8QNb12OL357lnHQG7IVAS?=
 =?us-ascii?Q?nRA4p17pyPle4d87kOjSfUBdLgOB6niaUpB8U1Z4Lhjy7Fy8q/q56J6Copmr?=
 =?us-ascii?Q?03hmSPDupj2MksmafczgtNi3qwq8LCjAuHyyniGaaJUyy/VW+n08z53A9xDU?=
 =?us-ascii?Q?g+b8cQbEEMjXeKYl6vt/IuKAOZnCu4fZ9VnHMhIWv/xT4FHnR9ndU6K1Es2a?=
 =?us-ascii?Q?Py7ChBWObKzZCY8AR7ZqD72Y9jlEt9myY069qx8wL1g4+kFwnXSLEoSTM4MH?=
 =?us-ascii?Q?/iZOxr9wAnRXFX84qo1D84W2yMAm02bg6mfuxK1mnk5z+ip05t1tpFfNE6HY?=
 =?us-ascii?Q?FweXjQxYdPsQXAQf32INtWlLV6TiGdimhOt/CnxhD7MkLA17hZd36MQXEvMF?=
 =?us-ascii?Q?X/DYISTT9ArdF2mSzJdQrQzLhUR3bI873eZBeYtsGswkdZImoao8WFwf7gMD?=
 =?us-ascii?Q?4tr6KTk5KHuQDh0OA+D+4eX5PToVmgxxJpiPX2Zetr4BP5q3zbW4fNWxtL4Z?=
 =?us-ascii?Q?6iz+duhNU9H0ZXaCdmLhcA97LaGGAc6F4B+Eveu8cszh7yVUazEKBW+b5GwV?=
 =?us-ascii?Q?DkTWaL04Ea0h/kphxyJh5DfBezwKjiIwnBszNHl21t1Zhd1+9uZw8QDYtOKN?=
 =?us-ascii?Q?iFEARuR0HQylFPXBdrvntY48e0C3Entls6soYv+evGqmDD3sUzoDjQU6AJ2Z?=
 =?us-ascii?Q?kAPYubR8UpLahszNgFjY2Bfv+TVxnbXujGyyZEOg7uwxpiksBMypxjDJvBrr?=
 =?us-ascii?Q?x7/cKSHur3RrmkLeLAN0mhnYRrPGIZB35J82C41V0I/1JmCe27+dwGAZOvtx?=
 =?us-ascii?Q?qd/y6B+W+OYTB2AADMcp0D0Zc9EA2XZumv1lZaUE+D1HjDexVs812jaxVkSM?=
 =?us-ascii?Q?xbu8SlPThud7xvaV6e+TVQ94Hgn8TIfi2k7VRpRrU+heeDTRMbUMB57xj5Vj?=
 =?us-ascii?Q?4AH93nVYuN/rbf8resnUgEYmlspiiX5NmoLiGgOjkMq1cZr1z9DLu4Mdr12r?=
 =?us-ascii?Q?uxFDcbw+hZjbpwZBm4BGxTg/oD8Gj9NjOIoksXCn6CRjaA/M4LEIUW2vJ0HP?=
 =?us-ascii?Q?UR/NbNE1rVemv3YcyWlr8nmHrZvzyVMAMOjebTkBnI8nEZ28DYOIMGubD7hC?=
 =?us-ascii?Q?qOFww11bXom7t47GXWESHzg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0db0ad-81e3-416f-7c64-08d9f1ea0216
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:21.0398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+FbL8Hsw4DKaOZjHgsIv/q9763zP2+JHC62F7LPQKlkf0sjzESD4V24+JN3wi64shsQizfp0h650axdGDn5EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3009
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-GUID: zIlHBWOE7NRWteqlzaw2eIbKx-m8lPT2
X-Proofpoint-ORIG-GUID: zIlHBWOE7NRWteqlzaw2eIbKx-m8lPT2
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

Allow hotplugging of PCI(e) devices to remote machine

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
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


