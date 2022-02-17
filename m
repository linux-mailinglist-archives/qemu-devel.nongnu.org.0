Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9AD4B9A82
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:02:42 +0100 (CET)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbkP-0007MW-1F
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXf-0003lD-M9
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:33 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXd-0004RA-5P
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:31 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4RVGv010846; 
 Thu, 17 Feb 2022 07:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=saOEryQDDyAtM27236xvu2pZ3ZdpadOAdYj7R2frOt8=;
 b=cPKaFXgA0G0CCooXx3yX15Tl6HnzfQ7ZK7V6ATRjxImgNr22C0247v/mCnxIaQqIQQJZ
 surSPPgvXhFE3h5Y0vOTQi+4E+eHQp3FILLMosocFeAGKUB3qneG2jt7dFG1Xp9ni6xJ
 jIJpAYjqNJX798B0y7kjG5jWcbXD/5XcerRKdh0NZJh/IFpsuwI7UjOJJkR4F9vzVbA6
 b04uc33RL0Te0WWn9BC0bMf+TpUDdo5LaFe+klldIWE3baGf5veZvXhx/Bk4fRESgau/
 68L9beCwCMZHtC4xGCXl0d0pQd2UucSosZEj3q7khOjIsTLOmzLlSDfw0i1pIMU9xmPK BA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdmt2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gDg1030269;
 Thu, 17 Feb 2022 07:49:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by aserp3020.oracle.com with ESMTP id 3e8nvtf68q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvBg8m93DiaRF/fdMHEpIi+Z5XHci50qTNlWyipQ5VQ3jUl13PnpPVlA4sTRk41kwi9XvooBFcbP+4PYSo1IlvBrqSaCHlUWYLzpy2u37DNHrlMcNLZatef8Xz+md5aHt1n5dHIJMp7fxxSsrg3A3OrIGgBu3ZPmQ+41DhwccSYRqpfaYQt2fN6hqteV/D4QWWwR7BdHwVaTJTIY4NaML0Q9oRQr9AD3q97njj/roGlhftZOWz+p801Mnki93SzYOvGJdBTJngOecnzMevlxID8NkWC25TyghqMIuIm84oIr9yiYgG7p4CFv9H3/mtUkEW2QxyrC5ukoHla4aNoTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saOEryQDDyAtM27236xvu2pZ3ZdpadOAdYj7R2frOt8=;
 b=kakdT6AXELSHhnMosnLFUVbfw5KqmpTtT8yfWs9pIfY8qcshmRPU3c5Z3B2R80lYx4oSjJqPXzsEYErcDtKbHuDIl2F7sIGxWOc5QzmDQSztRVbBZfzSKa+KoVMsz4RpXw+LajRm0C84FOsBR2+YhC5g7fXCzLy3llkOVGUNIl6lr+9HuS1HlpB4TTEEztb2dpdCTDBVS9ZODrb/MUjV2S42JFR30SxMA5czISyb5pFOgiOt7AYKeXXWIQmV98kOaly3oSLsSYqOp1SAF5kWxruZzLoWGXQTXhgM5s0Olo3WTLETjCADQXh3FeN8jr6X2jS4zKTu4R2oszmkjI6oGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saOEryQDDyAtM27236xvu2pZ3ZdpadOAdYj7R2frOt8=;
 b=iDggFWbwiw2d5ZS9te/T26cg+lDuWypdX8uXmPHnUZR8S6RB1FbnzWTU3IcOdZFILF248bGOhAaQp9nEFfFL0kY81DkZoblLqG/V2ag+U6K9FE7QeTkDL0sfosYfVfSGFWvLBDyJgboXYYUM6TVmYhKNXPlFc0oAHzT0Ql2si78=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by BL0PR10MB3009.namprd10.prod.outlook.com (2603:10b6:208:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Thu, 17 Feb
 2022 07:49:23 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:23 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/19] remote/machine: add vfio-user property
Date: Thu, 17 Feb 2022 02:48:52 -0500
Message-Id: <4f063dddc17a2ac1f8c9088641df455957a3f78d.1645079934.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6856cc03-6beb-4f28-b66c-08d9f1ea035a
X-MS-TrafficTypeDiagnostic: BL0PR10MB3009:EE_
X-Microsoft-Antispam-PRVS: <BL0PR10MB300915E84A6F0A287AE3AB3490369@BL0PR10MB3009.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sMd30+8T1+8a+KcvKQDzF0BHuSppb41JayhYCjmYlk1GIM+cP+ruLBLqxHC4z458xw/lYOYeCOw0xW4jdN2yjlLvgiTezfp9E5wMNoaD1rHbrnpHL84FEScs5kesU6veb/81ZWTzhIG0WsS3wjlajCtRRDgM8Rc4BOP8Yh9Jx/dg2JSj8EHmVWdblQ90bn64vlzP5qKur9kq64Gs6kIRHrOdn4GawsX5Ri6Tfcx+cxEnusbR5vjhhMoN4jdE2Cy85ukLCxdckNnAFhIowOCj9VXkq58tAAdK9UTu3R0fh5sZJpbKd29s1EVq0YmJm4OWs0zSs/63MOYjrQpDr+tR/mM9bAtqxITFsMcfujV7tP0LAa3HgXvgTNIxHe2GUkFL/jmfpvbFlJQ37GQ6j65MCIHynBsUIDUvCs+eXXESlPYBvg0trdBvaMO6a3kKVo75ntLX64+xEEnMPXcNGHx3bS3vmqlHaFpn4sFapqSQd280wEjUuHAOOE2N5en7QZe0ojBFllvDyD5RhSdJgsXdDxNm3Ngw3COZo/ex0szKvOaXI/nEPNs/V0hGllvuWmaCk8ey65+yrT9ZMWCN8NNGm31YcfcN5HGcq4BDNWDvt+u2fSHIMYygaT0mrK5i34LgnmATrBqwp/KJue9vFyyW2g5rxuVHkU2UZL6NT840Eh81GNARyf1Py6+pbCQ2BXMElDpYkw8NFY5o0eUFoVAAVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(66946007)(6916009)(66476007)(4326008)(38350700002)(316002)(36756003)(38100700002)(2616005)(6486002)(508600001)(66556008)(6506007)(8676002)(107886003)(26005)(2906002)(5660300002)(86362001)(7416002)(8936002)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0NxKnuxZVMiVsYQmMo8zZtB30jELkaLFT6KN0qhWXPwWqm9M1pQ4grKxPbFD?=
 =?us-ascii?Q?yTM+xgR7qB/8vVpG7Azb36DhwbN5W2ZlpsQRexX3cUgqTIUxV5cMpq1mHU73?=
 =?us-ascii?Q?WgQEZof2nid2T3I3XD8YZWy/Xr0DHqDAA3RHGiZUqGFZOo53z0M3SOAcibWD?=
 =?us-ascii?Q?kcI5EcAGrzRprqBYG/jrjv4mQx7FOc2e+OTXA19msqWWf+h8FJuiVt6TD4Wd?=
 =?us-ascii?Q?HjoU0nVN2SWizjVEHMsU5MXYx1cCA2f4Pt2d4oxBVXh1tECaZgnYbuNdQshO?=
 =?us-ascii?Q?Yy3blvujjDZSgOxDeM1Lqy5GGlLAzw3zdB5ZRluoCpxR/PYgXrH3Ee0t+dXB?=
 =?us-ascii?Q?quK2b7lOAcNHuy2lgY9IIUBnNInKJLOZp4140YpMEnzV0N8ak+yalDs9XsRw?=
 =?us-ascii?Q?GnHQ6w2vUZGUxqJP/To+TW37rcmt55aoFdSSuVU0rbmntSV5u1fyW0Mol2jZ?=
 =?us-ascii?Q?whyaoqvn0AuCbbXnZeCuK1TaLnnSmVRTGSk9LKJJdI6zbEmUDImdZIDhnaPh?=
 =?us-ascii?Q?0h448Lnn8GjzVvxxxBPM53reZMWxFQ+mOclSzyNHNGs9zI+DWZ8pMLVuWA8v?=
 =?us-ascii?Q?HR0i3h+CWTExv8Os2OKVCzY1DTptANXDZxBk/2uZ3+QA7wFsb1Yk2qWJ6iZw?=
 =?us-ascii?Q?JXvOrBMv+iAV5OP9sooPwy7LvpL8iBs2h8dVTqHw8MIPgR2ueOuQ8d+iKrQJ?=
 =?us-ascii?Q?cKlHqx60TNnLPyUYohLu+ZFKKfxFt1xTpdxdf/485X447I+cApI1bxEkKYjF?=
 =?us-ascii?Q?HR3ZI3Yw7kdjVothcgyaJ8CP91/cjgYezkh/jCjixvFYPyVhN+AyonRPOwno?=
 =?us-ascii?Q?QmkLeE4ceUAYjkVXvQVrS2UIfP9QO/drMNzZM0Zo4zd+mhK9AUs1PbCZUk9u?=
 =?us-ascii?Q?2LzQicMnpOOfwx11FGN9TM9lW6vR3yOEQxxRIsXeauRZpvy2gdeLPzf5Wdij?=
 =?us-ascii?Q?onqfuYYbarMVTRMwTBBVnh5dOXBCn6r7rDN0KfKAGkOEn1AM6M0pSvKm4qFD?=
 =?us-ascii?Q?1/JZgvPWF+ZQ/+8q0lfTZ9ryPZIW0SQ7PNVW0TGD3UG/E0QuzwlRPTZW36Ri?=
 =?us-ascii?Q?EMh6xiqrRkZR/xtcEglLZ7KOw0fZcCAHdmbtKsj+KXxJ28+NrdfHeRvi87vi?=
 =?us-ascii?Q?3Zc868LeJor1uizh+BZApkk8nmCiAuPuOJ+lrt2Nox+xzEUu2Y3yBOWyrUrG?=
 =?us-ascii?Q?w5Ahfy4JNVJd/GeidbH+Z4mPkVsveXHI2FttR+uXepG/zcBBpn34bcWCgiLS?=
 =?us-ascii?Q?eKhV2SNxeJl5l/oMNFb5SpIUEJzuKOILWVjcYaDU9bm05htgE/qF3bsqKRV2?=
 =?us-ascii?Q?9QQR6qAK0LMeCCbHMzZOYWsWdBSqNt3sAz6DJOYeCNiDjwo1y2Tc+ipQN4Mx?=
 =?us-ascii?Q?TyWRV8yM6zWL8t6FTopNZRMjNy3METzq9luBCrgXWqAOfbY04WE3P75ENSv3?=
 =?us-ascii?Q?7SRZ1IGpFcJFuoMbfOmOc1WFOTroaWZbbTygR5+e9B2zoU3WBI8d4I22bW9K?=
 =?us-ascii?Q?RRypC7tId+pWvxMgP3mCibwWdY2S5MUj66tvegidNN7pfmcZSSuWRcszo7M0?=
 =?us-ascii?Q?P0sRr5ZtQOT+4aI1p/PYEVG+BWv3CET6rCyNckEto5/UeGLuyUaXQxncn4Mx?=
 =?us-ascii?Q?/Z70YFCecJI4ezkVOK0BFTI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6856cc03-6beb-4f28-b66c-08d9f1ea035a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:23.1803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQ2cmBF4aB4qY1c1oaTzK7K8PbtHsG4EkImK3z1u/erNmJeWaIQ5V67iitjHf6u8SdYIy1zW1HIZVzmIB0Jh1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3009
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: myDIJZ5hwzG7j70yD7AAxtRy1D5zT8Zw
X-Proofpoint-GUID: myDIJZ5hwzG7j70yD7AAxtRy1D5zT8Zw
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

Add vfio-user to x-remote machine. It is a boolean, which indicates if
the machine supports vfio-user protocol. The machine configures the bus
differently vfio-user and multiprocess protocols, so this property
informs it on how to configure the bus.

This property should be short lived. Once vfio-user fully replaces
multiprocess, this property could be removed.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/remote/machine.h |  2 ++
 hw/remote/machine.c         | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 2a2a33c4b2..8d0fa98d33 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -22,6 +22,8 @@ struct RemoteMachineState {
 
     RemotePCIHost *host;
     RemoteIOHubState iohub;
+
+    bool vfio_user;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 0c5bd4f923..a9a75e170f 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -59,6 +59,25 @@ static void remote_machine_init(MachineState *machine)
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
 
+static bool remote_machine_get_vfio_user(Object *obj, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    return s->vfio_user;
+}
+
+static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    if (phase_check(PHASE_MACHINE_CREATED)) {
+        error_setg(errp, "Error enabling vfio-user - machine already created");
+        return;
+    }
+
+    s->vfio_user = value;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -68,6 +87,10 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Experimental remote machine";
 
     hc->unplug = qdev_simple_device_unplug_cb;
+
+    object_class_property_add_bool(oc, "vfio-user",
+                                   remote_machine_get_vfio_user,
+                                   remote_machine_set_vfio_user);
 }
 
 static const TypeInfo remote_machine = {
-- 
2.20.1


