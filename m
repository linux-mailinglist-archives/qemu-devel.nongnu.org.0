Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55924306022
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:49:09 +0100 (CET)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4n48-0005Ri-Ba
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4n1x-0003wR-3p
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:46:53 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:52930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l4n1u-0001ff-C0
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:46:52 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RFiaWm096197;
 Wed, 27 Jan 2021 15:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=3jkOSU73no9c1wvY97sdyMJOwxj1A1nBsaPRtYSJqiU=;
 b=DVgzYmOfus6L6UDmCT+lbi38gZBdoWstvDnYU60lOKDFpA8/aRuLJAyYuRGi3Rc8/BqZ
 JcbixATPzU6Ya02qoKS8vFjls0ezaBleVj9ZNT7YxY0WDS2QrTWv01ocDa+yrc15d7JK
 Y2JtOdN70yGDTM7fXOFpXaaTcbrWk0ZwWpSWn+aImrOnUdYysBHnjpV5WSkqSCRRaHHc
 ykqnc/E0n41RGwGD0nYIV6J7OnT8yG0EcPA5hfH0IXGhgLcKIEpNmhAjL0ktB4hIE79i
 AP15Jw+yE1E1bykt1kTHovPLgV4Ir+GKb495HOKiWtK42+u9oWJHlol/62iqQEKgNlcx eQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 368brkqt14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 15:46:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RFj7YD024904;
 Wed, 27 Jan 2021 15:46:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by aserp3030.oracle.com with ESMTP id 368wcpdwqk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 15:46:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib+T84Du2oWOQfOI4yAjcRChOW9jFsfbEw93tc1UrKkBvwCvfx4YDPDAJC3uaceopxyNDOWtfQ6sgym5MK5g3NIzuS2MvGGm0OEuvVQZ2CtTYE9agoBQqT+wwz9tAIbybZlzmKlySN/QISMJJw9fa/kGZTKi+mANPhrHjDMZxxq+8Gymw/3YeLfLcoIShdK5C3P2t8aejlrzd/cWqaLFuc29S/mXBM8mMep+/3CweDCIgNb4tC4lmJyyvUCHeVwphDl7G1KEVEoWAekvSUuhkwgr4red58wRNqeLP4nhwY1UfsyR9xTK4WLerhGGTCd7xKV+63yL5d78EKMtobfBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jkOSU73no9c1wvY97sdyMJOwxj1A1nBsaPRtYSJqiU=;
 b=fXV9qAUgsmNgjei0JSwxj23RnzssBTFwggWNkWgP+PkYjpC9CGsl8vjxsxakDXtcm1vFNSek+8BlrZC3Su8WRgHfpP76p3EnHg+juexMrGYkjgg6TQMPR45a3PbW8L2HcKWS0PGkMrbm+Rbgx4BU8KBAAwtbPblQGWKujLIwx6G7yvtEobiUN0pURL0sW6mId9uLUmpeqMh+1EXkSUYg510JyvaUuHsWgEEiwlkdPnW440nPd+YHxuwvyxgYrN2As55waXHwu2DG3OoQuSJyyXpUU9NCpEBl6OJ9yc1a7Yfg8wDofJCUdOQOdg3p4/H9YZo1E0ElDuHB4Yp70+D2Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jkOSU73no9c1wvY97sdyMJOwxj1A1nBsaPRtYSJqiU=;
 b=HGi+D9NTz5n4z0J1MRkF+h9ByYNcJpyFQZoTQ7K7GzfXDlKn1oTKMZuHEktJ8UogpIqWcJlVLM+IPAKrjVXwdmhweplWs7FgnWCdwpb18b6M5qUEAQ0AwBP16Ttpcr39JR3d9SWSqqDhIXVe55LXVjFc1ItVdmo55kwJJt0iNEU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB2032.namprd10.prod.outlook.com
 (2603:10b6:300:10b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 15:46:41 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.015; Wed, 27 Jan 2021
 15:46:41 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/4] pvpanic : update pvpanic spec document
Date: Wed, 27 Jan 2021 16:59:29 +0200
Message-Id: <1611759570-3645-4-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
References: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 MW4PR03CA0340.namprd03.prod.outlook.com (2603:10b6:303:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 15:46:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70e25efa-805f-46b9-6926-08d8c2dabd68
X-MS-TrafficTypeDiagnostic: MWHPR10MB2032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB20329585F96E33B8A9B4A3B688BB9@MWHPR10MB2032.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S4I7GosN045B5E1kzu8OElY5cCGl/oTK3EIK2qFUDfmpM9YdFnBe/VUpOo4LcEqlpKq7kHNjso0sCiGRETodndp+2CsbF6nDk2B2wIEa8n2tXTiiXYcPTjvAgLtWGwTrsdi98tyt6M3o25GM7DrCAhgWnnVn2sHmNOHdCMTlZV+IphUATibXP4VtmFw5q/DoBaJKCsaWO37doyHp5bgCBvN9XwfVuxZpP5vwJCo2OVoVv5+BeX2PjRF3NwBx5j/fNOlGz54jPLe8W7+SX10tqrp2+rLz1GUxzEjP4nIRJj92Oa6AFlodztM8GNfDMivEMdGP4H9SqJIUtl9GquFP0itgdw60MiI/B2UHG0j1orh2xRn4zFZWg41XkHwuqC2SaCuc905dWusOoVX1xTN53NuCXwf16nqQIiPB4IZA3NS9XSFIusC4EBR+LtFgMoGq2ctaGw0s1VpiTvDGQ2pvL617SgjZ4qEEQhaU6efdjI2ty4VsvVOxpDESnPdskfYNA3TtAhl7+PdwtmbEvUbh8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(39860400002)(366004)(136003)(8676002)(316002)(52116002)(44832011)(6486002)(4326008)(956004)(86362001)(186003)(6916009)(26005)(6666004)(8936002)(6506007)(107886003)(2616005)(36756003)(16526019)(83380400001)(66556008)(66946007)(6512007)(478600001)(5660300002)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?b15EEjordi959UtjxoPiNjodBHAU24k0gB+wINYs6x1DPkoUVnd4wU/r76RZ?=
 =?us-ascii?Q?WQA5/bCHO8g1QH1YTTd1sWIcuSvurihxHStluLfEg0V9NH/v8TM9hmcgHvpE?=
 =?us-ascii?Q?bNXhhuH2t1mNAXHbZQ9MrjNAFYmE+eqLJGNXSusj4qNqgQTAQNZoN1qeGnb/?=
 =?us-ascii?Q?0nVE7apCTivtyrzy4rJH2f4Qsvv0K+2YuvL/2+YH9MTebn/dviTEytWB/e2p?=
 =?us-ascii?Q?ifwNm0UitZmiN8srnGPPrjLwrRyTeadgOtyrcTfiSRHsBOxlGhsGwwDq3cpI?=
 =?us-ascii?Q?XD+fBg1x/YtFDsJdyWjG2oePMW7FAMg2qGXlUi1OaDRSIoDEYHqYvPB6Dfef?=
 =?us-ascii?Q?lchOVBYDEo71bSbsh44tpcYsja/L3KIEWJ9HWiJs4i8UbuOjSZkIdTyrmyml?=
 =?us-ascii?Q?qGaO9br7MrQdUyEoU2nppLql4HESN2tMZcsfVVFb0rpgz8pvHNZlWLRgwM0E?=
 =?us-ascii?Q?P2LpYLfRH1gFMqwwa6hS/bUJVGk2TgOTYb+sK/grEZOzY/cVH+y2dcTFiuER?=
 =?us-ascii?Q?o3BUOkmokgfLP6lGaM7MwO49ej5L1OdeKfJlDMnhUkuoyj603IPwqgsc9Erd?=
 =?us-ascii?Q?ejbH3XrdLx/ooU9Ggh7xWzmKiwxglLR4t9eC1vcVntZ3Nm2KVVBG/i3okgmw?=
 =?us-ascii?Q?PyAA/rw/EbSx0X7JWuEP6yokVrpAQQvJcIRNbaKqBWHmtRVwJ57Hhvn8daab?=
 =?us-ascii?Q?ZEVmvKFXlZwnH96hHv0BMPsvYEuL+OaVN3aUdtY5zPM8gg5WOT+RiTYIyi8X?=
 =?us-ascii?Q?n5iMll9VkvJ3BGSuqYdjZI+hS4a4b57+7okeZ0cGXpraW6YYJCJu9VuGPAgA?=
 =?us-ascii?Q?feZDXTeRXq9yMgpTusMLIuaQSse9XeQ4fRP6LBz8T3GAaSrctvdVx9UpKHHb?=
 =?us-ascii?Q?7Zw2CzLjOFiA4zxUco3TouyJ72Fmu4m5xrmWb1OpV8BrwrQqLdXi5bfgIyol?=
 =?us-ascii?Q?iUhH1LbbNqT57/y89NIGLOtabbXVLq/S/aA8TB4xnEwgzldaz9c8NtCQJZGJ?=
 =?us-ascii?Q?x+mET7fvF/auwiloc5jIlNzFg9aX/Ps99dfLW9LdK1Q+0PWT6G+EQQcujIFo?=
 =?us-ascii?Q?o8q2sTsC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e25efa-805f-46b9-6926-08d8c2dabd68
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 15:46:41.1819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SulCECU89MUUSh8FeV/Xei3F3faF7Au6U3a3eJK/h7UnFPT2V6Zru25V+scDMUZ2jQC6yKVJor4Dyr3NFC+wqeIQpxChfIsDxM0MzyWWnIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2032
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270085
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mihai Carabas <mihai.carabas@oracle.com>, peter.maydell@linaro.org,
 yvugenfi@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add pvpanic PCI device support details in docs/specs/pvpanic.txt.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/specs/pvpanic.txt | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index a90fbca..8afcde1 100644
--- a/docs/specs/pvpanic.txt
+++ b/docs/specs/pvpanic.txt
@@ -1,7 +1,7 @@
 PVPANIC DEVICE
 ==============
 
-pvpanic device is a simulated ISA device, through which a guest panic
+pvpanic device is a simulated device, through which a guest panic
 event is sent to qemu, and a QMP event is generated. This allows
 management apps (e.g. libvirt) to be notified and respond to the event.
 
@@ -9,6 +9,9 @@ The management app has the option of waiting for GUEST_PANICKED events,
 and/or polling for guest-panicked RunState, to learn when the pvpanic
 device has fired a panic event.
 
+The pvpanic device can be implemented as an ISA device (using IOPORT) or as a
+PCI device.
+
 ISA Interface
 -------------
 
@@ -24,6 +27,14 @@ bit 1: a guest panic has happened and will be handled by the guest;
        the host should record it or report it, but should not affect
        the execution of the guest.
 
+PCI Interface
+-------------
+
+The PCI interface is similar to the ISA interface except that it uses an MMIO
+address space provided by its BAR0, 1 byte long. Any machine with a PCI bus
+can enable a pvpanic device by adding '-device pvpanic-pci' to the command
+line.
+
 ACPI Interface
 --------------
 
-- 
1.8.3.1


