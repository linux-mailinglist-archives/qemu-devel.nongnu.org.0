Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB484942AC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 22:57:13 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAIx7-0002E4-2n
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 16:57:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjA-0007nA-1o
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:48 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIj8-0007KD-94
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:47 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJvWvj031403; 
 Wed, 19 Jan 2022 21:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=dPKOtKsyJGUcQvMnjboBXAncXgAhop1HN8BaHg/fUvM=;
 b=XnRdox+hkODsLH8uY/Wcp5VFg6Sbi0GT6tGGEwVrVB+I9tYK8pZ9G5lmyqUuRzY9ysXp
 qBeiNcGsQ9mvivQMRjO3mftGWA/OHuG9jqC2rVPmgi/qHp6wK9rlqSW9rqYD9V0i5Lv/
 zKJQJpRuuO3LDR0cs9/+GBj9VMVDca45+qzcnGEMN0u8Kumq+tg1qUPJ4IKTT7Zaq4Mu
 aFwR4jyaXu+MCA/KbAaFUw5FJUQbLWMjrtTpe1z53np/DAdJQdEeiL9lHs4BsqHBfAN4
 MB3/ylyBTrvIxLtt3Ix5gyM8//ulyGC6Q2E4CwreAv4m6U27f/MD8yJ2ccITlZmKnXwk +w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnbrnxb4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLaudN147168;
 Wed, 19 Jan 2022 21:42:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by aserp3030.oracle.com with ESMTP id 3dkmaeb6nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3dz3AfaOo91z8sVYgubkZsclBJsrfCYVkDXFeFa9ZQhYJnWwmvlzp/1WEtN/UUpFhRw1eeGJ5LLHG7UrViTXqRq5SuqLNEGGqJ0G60oQsGHLihvoWbQJgd7MmUe+Z13Vh4F02zVEYg8ajOjR8wyDBIDoRxFG0/h/GFaxENNhmn/SSqU4weKp/wEBJLLCHcEW+ZPG5cuRwN2BvnsRzTqOVd3E4tMe1+KU1OWcpKLdSRzhJbAf0yZMfIosXQpTmxKE8Yvdl2aMj+maHy+pRLgHwmBQnyqJKeB/n3JEl3oJ6rpqtC1Q12ZR55mcTf1Lirfc0TRNqbYbBLRAIuXy6GJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPKOtKsyJGUcQvMnjboBXAncXgAhop1HN8BaHg/fUvM=;
 b=hBv6Nrfl82DmbWklDsYC68/rk4ixB2bexy+dhriS0iN8oiuPOXhN1T/4F7haypxAQrTW35T3jRhbhVmQEzy4y0uBGi8WClhNNMUZ/nIt8/GPm2QNbNyzoXnz91cduWzoG1KTU4uGyMfQDZmoum/KSBAL62Y8yn1iyi7iINoxmVdZIR/3UmNQsh7P13QytF/F2ZO82wzmyv83rNdcH35l9/bECS/EKLTE95em/VZCNZDQ1/Hx9aMGc5ankXAnkzG/UQx0PpCnLsCI56b607hPZlfGGDTPDD3zYVETGXRi9mEC2sD52uCn7auv0v437rjiFPdIkSVt9BAacdE6r1X9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPKOtKsyJGUcQvMnjboBXAncXgAhop1HN8BaHg/fUvM=;
 b=q4jB8ytGR0Vvgru6T+wTFU5GrsYCCq5kpxti1hRoupYisw5OHiCRta8Io0nF43qIuIIOPKlL/of1l6HAsUo5OcTDXsA+Fvaqq5RHL4MiinOtZAKHaepOlJHfiXMoMS4ZPAtz9JhVVgprKQn1AEoKKw2Y656g1LSuG4krrVV5uuM=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:41 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:41 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/18] vfio-user: set qdev bus callbacks for remote machine
Date: Wed, 19 Jan 2022 16:41:56 -0500
Message-Id: <1dee463f227f7a865877cd98f78e4ce48ce8ab32.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea7b18ac-70cf-4d9d-6ae6-08d9db949eb5
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB5887CDC99F288254F629681D90599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cMqYftxsfQ5E5kPEfJB9c8VQxa4tampnM3dPH6ynr5WDXouZ10gdEo1JvoOU6/CKojoWdmzzXaILzIP1fp+65s6qmtk5EUNpr3K6vlfVlrOnzcQF7A5uCQeQTehmuMOdTzYWzO2Y1OG50cx73RoWD4oO49P6xQT7icPjFNuG0eAHzxEdUdhae/dwlXzU8h41o3fGo3PJwTBkXIXBfFgV9aTMKo7SpT9zOOo9bzfEbs35Z05syFCkxP21Rk/6RZclubZJ4SP4gBCQs+Dh5nX+MKSpBrfQyVpb3cYcW5kQpmC5fcfDARlchdaQPPc1uI0Av4v576U2Fc3frFn5FtPpJUa4yC6NDaMoZWcx+Q/x1fE6AIMLvQVl/BygqN2uZ6JT4a/toH9uvM0vOE7YgjGdy0ozJGhvYtdG0hCL1G04Zyv2CMss9545j2NhiZq6KxMSK71W1g0CY6aACY6utOrLz6eAJVkp+ixD2Lg+BPgkh69tH1+CKQM8d90Ml3cn1tYVyZR+nzooITuB2CYvpanZdMXKoj427FT6LSA5bmBTc41eXY4bN/t07x3c2GS0A2vfa/YCfAfuIbh7G+9GLBHhgnVVlQedEpreax1r9RvhZHheGRAfxhDU9EsWgMOYvoqQcOSLMfid+pmXBULjY0Ug+2OqmXOzrqx4FHKzSL0euM3rCIysjRI+2yy7enekXNajxn1kJlBnzDdaqEqXt2POFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rSgvrAwhwEjIPrlcQb98rEABIKj6QxoSxpQ6herbdACWWbi8iEEGlDCiLzwt?=
 =?us-ascii?Q?MU2PvnXkp5WFnpQSRBX0m9+ZujJRJThliTZbfFX1VC4rMMZwkHkvslIWRfj1?=
 =?us-ascii?Q?vQvdE/4oiPa5OivMEgk061Y+66d1cicpbf7I/Islxli1RKgwSb5IV9hExIsM?=
 =?us-ascii?Q?H4MLgkVWpJAN+O5iUw9UNk6iUsZF7P+t8ZLD6oFrC0Vqz+9wNqufrPL8eMt8?=
 =?us-ascii?Q?oUT2bYW4w/w4bKuR7qJp22BwbdaevsxgYYOczMRK4zdiRZfyzoLzqfcDm2cS?=
 =?us-ascii?Q?Q8ON3HM71UWSZMy/xMPV9RjzftuaA0tLbcpLsm/1j7DpKCU8QZtesfbnTxYT?=
 =?us-ascii?Q?nnIPZGl2mCCGapbT3FyCIchl+NQD0/V2yeAIMFTtBSViBdOTsc7DNXOU0SH+?=
 =?us-ascii?Q?dKqoYhf2UK/yTqUBeFmVETWS2OK1GmSqGI9DY2tdq9TXiJDGfysTY2RKVBcL?=
 =?us-ascii?Q?T//FJgSGaM+pLv4cSgA1wh356xMsxnDfo9/4CB9CLSrVZ4i8GrCp24kTCono?=
 =?us-ascii?Q?EwIZrldNH8lm8CbRRkyKyOA/tNeYVvk22sLkN7U+S7elivh/1i5LAhx3+ZoF?=
 =?us-ascii?Q?bsNj/KNI2cXRDjqXURzplMfv8V8vlczzUHdZRLzHS4Gi/8GDU3cA9j375QCG?=
 =?us-ascii?Q?7Bdhjv4cFFyyL5EYQ0tAfoTjyQJDV5bq1TKaMNaQQOqH26F1gjm1u4ZWVoEb?=
 =?us-ascii?Q?l2VR/HsRhI5uYQIg7CY4+SLg/ZhK1fqYNtfJFPZbUwBKX8lRvmV0fK7rp26+?=
 =?us-ascii?Q?QKSZ3uDoSIjL0Ujg+il5ns/1CnZI0L/dGodZWIwlt6QYOnyXqyKbgp2qFywv?=
 =?us-ascii?Q?MnY5Zv2ghkc9WDM7FcWhsTrDngzkcSpUM/9d+njVbIfIEkBv9COimK2XZ7s9?=
 =?us-ascii?Q?Hn+vYryG0B037yV6uQt0vBTpbMyyaXb53kWF46YpQlXS5CTVlxIpKsNcgqBR?=
 =?us-ascii?Q?zvFYNvU1icpSBo+RypejQa9VDTGi9AuGel1HoUXmQnQ3hqG7VKHEz9F8/jR7?=
 =?us-ascii?Q?jsnR8m9GU948baqpz3+MM8iGK3TnFlCnnYLwg7GsI4a1Yb9oIfueyS+vQWBi?=
 =?us-ascii?Q?X61U5X/uhzJvoS3ZrmgYc95dfN/RmqdzGUbV1PqD3FAVgRPVIvZDuxeVfnHz?=
 =?us-ascii?Q?7c+Qr5Eg4pZ2FkBGLKV58H4uIeE4JskS7uOAFkQ/OfQ1PLILVtxCiKKNEG/6?=
 =?us-ascii?Q?BWr/5Jf5zbtPy/GqxX8/szRnM2AfEDuFFSEPQVT24w4kCeum67k0px0rrl9V?=
 =?us-ascii?Q?EzYCfeMIqpiLmGU9rjM1o2z0G2Cz3nMmM4epeZiTElO/gNDl0TTkSvsWHZdQ?=
 =?us-ascii?Q?Atht5Fok4zWWmUINMBSXOhQGK47ud1D5QVh8QYWuPMUoRlAem/7DSrOQp9o6?=
 =?us-ascii?Q?BrRxxO9NZAHnG2ChD/h/eM8Pp0KVZyueInVVk45SNeJWNcVpdxdyZN1G3YCq?=
 =?us-ascii?Q?nTnpSYbWmydZ9fl4bKWnLzZJBUnsPdAMeI8iBss017Y0k6dcbWq23vsYqPDG?=
 =?us-ascii?Q?24Ww+urUEnfv8Kkszf7RmhutVQx6R2SSrzh9qwz81ZG5T+WUVwLgBdbPNTEC?=
 =?us-ascii?Q?00KS286IuTFcebcubrbx+6BbPVgmgUVEKljNUAe4W2z/wmH8Kq/7EPHJy4NY?=
 =?us-ascii?Q?s7fVPw8E+zeSC+uInocXYfc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7b18ac-70cf-4d9d-6ae6-08d9db949eb5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:41.5374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG3HafxtJ48UxJIsJY23CVAj5ysoDvrqzYXI+iyr6KdAGJ5SMs0U0IaGAmvLTZ9uU1diFMqkhL36wHGY0DpvAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201190117
X-Proofpoint-GUID: Yddj9vBq8ruF15q6rv92EfozKihXefPj
X-Proofpoint-ORIG-GUID: Yddj9vBq8ruF15q6rv92EfozKihXefPj
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/machine.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 220ff01aa9..221a8430c1 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -22,6 +22,60 @@
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
 
+static bool remote_machine_get_bus(const char *type, BusState **bus,
+                                   Error **errp)
+{
+    ERRP_GUARD();
+    RemoteMachineState *s = REMOTE_MACHINE(current_machine);
+    BusState *root_bus = NULL;
+    PCIBus *new_pci_bus = NULL;
+
+    if (!bus) {
+        error_setg(errp, "Invalid argument");
+        return false;
+    }
+
+    if (strcmp(type, TYPE_PCI_BUS) && strcmp(type, TYPE_PCI_BUS)) {
+        return true;
+    }
+
+    root_bus = qbus_find_recursive(sysbus_get_default(), NULL, TYPE_PCIE_BUS);
+    if (!root_bus) {
+        error_setg(errp, "Unable to find root PCI device");
+        return false;
+    }
+
+    new_pci_bus = pci_isol_bus_new(root_bus, type, errp);
+    if (!new_pci_bus) {
+        return false;
+    }
+
+    *bus = BUS(new_pci_bus);
+
+    pci_bus_irqs(new_pci_bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+
+    return true;
+}
+
+static bool remote_machine_put_bus(BusState *bus, Error **errp)
+{
+    PCIBus *pci_bus = NULL;
+
+    if (!bus) {
+        error_setg(errp, "Invalid argument");
+        return false;
+    }
+
+    if (!object_dynamic_cast(OBJECT(bus), TYPE_PCI_BUS)) {
+        return true;
+    }
+
+    pci_bus = PCI_BUS(bus);
+
+    return pci_isol_bus_free(pci_bus, errp);
+}
+
 static void remote_machine_init(MachineState *machine)
 {
     MemoryRegion *system_memory, *system_io, *pci_memory;
@@ -56,6 +110,9 @@ static void remote_machine_init(MachineState *machine)
                  &s->iohub, REMOTE_IOHUB_NB_PIRQS);
 
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
+
+    qdev_set_bus_cbs(remote_machine_get_bus, remote_machine_put_bus,
+                     &error_fatal);
 }
 
 static void remote_machine_pre_plug_cb(HotplugHandler *hotplug_dev,
-- 
2.20.1


