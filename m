Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45962FCF12
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:21:31 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2BYI-0002Jh-Mm
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2BW4-0001UF-D8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:19:12 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:56006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2BW2-0001cl-4O
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 06:19:11 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KBFWXr004401;
 Wed, 20 Jan 2021 11:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=3jkOSU73no9c1wvY97sdyMJOwxj1A1nBsaPRtYSJqiU=;
 b=hLHTFJ7GTmPSLfHeSNfI6UB92RmQNAJxMEOKTIzPvbCGJEo4ghPWq2bKyK5HZ2Mo9QjJ
 8Qk+RWL0uwjCJEUfiQhzcUi9teri9RrEWtS3znB/r4/2stRt/UVHdqKxBQ96FyR6YEVp
 SDduxtP8W3bqjzo2Yabm/S0zTT38cI0KRVQelCJGjqLaW9Bl446We2Kkqtn8P3n62m4c
 yHerou1Q9zgYclIiz1yC1+2yM0AHoNG0a2+GgsXIEOxIEA2QqkJn88oF4g9XVJsD6s8Y
 hNTtcIDUL1EZmcIf8vfbeGLIh8O8EgQoA0CyO/+7AIM2pIjzvE13NjHS2Bbh9gTc5vK2 hQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3668qa9yt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:19:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KBFfTl046064;
 Wed, 20 Jan 2021 11:19:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3030.oracle.com with ESMTP id 3668rcvsuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:19:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+yW6xgiCT4zmyoU3xiVpbZgUpGnUQxfg2l4c/c5EPtmMM0POShIIsMSym9cQ+azzi7xM1Y5jKz2sdkMUO1hh2ppFSZ4+M5Hv7JUHvj1h4AHpprKx8uPVC3USwjK0sjY5N9Pnhlu0gBF1EnJjjknN7suOLeoni8W72gP48GBK5atYx+PKDSGmJEinYeEETqEIdO3J5c1hHp9x/1bOLc6K5WOpYq4wD7Y3GI98z5rOVXiBJlFyzvYmiqc7nVxjeNFE8TTs3tWW4tfdgKjJMtTEJsUh3e5/El6uOu1PsanC5llsijAdcZEghofeLHtSj91yHhkKr01u/O5Ddsz8FvVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jkOSU73no9c1wvY97sdyMJOwxj1A1nBsaPRtYSJqiU=;
 b=YMxYtlT8+fLG5j7VyHhp9f6I0Fg9Gs1JXJ9WBh1AuvcBT8MGimZCubjayKrTHB7LXv8KGwSGWXs8i+/lNrJrjKaleRU+utkoU2SUg8Cg+Q7za4aDWcCylPXgFGbNAG1DtetDDCUwt/s43aOYM5Rn3JUJq4WU2eDiTl4/LyRQJU0GBiKPwQaFoqj9Qk7XZfdWwn1ZR0smpvT4genxDzVb39s7MiCu7pGMwpEFYH6kRPzEgKHKhjs7ViBQwziYnZc0JqLv1fQ9RtGFBEk1T3M8KvAJC/nv6xBveujLqBw1jFDlPmk4vOh0Ug+SWr6fTfYZRsmphu62q4rtplJmUlI+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jkOSU73no9c1wvY97sdyMJOwxj1A1nBsaPRtYSJqiU=;
 b=ND+hlOQgb0w4SeB2H7AfegVp/NiLOKL8Ob52N79Xq6KBPINdfEa6wCKlCfXDXX0TsJDondDl6uy7A40gbPU2/FvwNna1GqgDz+P+KBFKlOrH/kQryG3wewrZrePRV27zCt5ZWAK/Wnxr8Cqbf4Y+POaxyczYHYK+8W/l6FlND7s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB1342.namprd10.prod.outlook.com
 (2603:10b6:300:1f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 11:19:03 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 11:19:03 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/4] pvpanic : update pvpanic spec document
Date: Wed, 20 Jan 2021 12:31:56 +0200
Message-Id: <1611138717-1672-4-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611138717-1672-1-git-send-email-mihai.carabas@oracle.com>
References: <1611138717-1672-1-git-send-email-mihai.carabas@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: SN6PR16CA0062.namprd16.prod.outlook.com
 (2603:10b6:805:ca::39) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 SN6PR16CA0062.namprd16.prod.outlook.com (2603:10b6:805:ca::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 11:19:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00d0995c-36af-46ab-8fb8-08d8bd35316d
X-MS-TrafficTypeDiagnostic: MWHPR10MB1342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB134207E1ED5FCE576714CC5788A29@MWHPR10MB1342.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BGtKKGanrx3Ghhm0lyYyRi0+nHZLB75QiuqorN0W8nMTD3dJ4XZWUa3g/MWrIk/2dNJPyRe3NXr3A7FfaS6UtUTlTCeMXp7PJUF7lZJUsUXOODDOUvt9H95wF4oR7zAoTvokylEPq+4eBkrX2MUXiIlKk9/IfnNkbE3L913rm7Y3JGcFfN1AegrwOUaxgtewbxZ4oLiUCWX3x1q3igKaUA7rO+70gozyzz3lO5DYdpqrOYCM9/tgHX+bQ8WhZoq/+LkgSCMDwl10+Kr3BaeJ6QW1yR75kQT0VRXAs6H3q52rNlvBG4kO6YZGoS3knIFi+8oJPUAMyQ0zyM+6DzqlnTOLmoIU1Cy4XhVA1/48iEQvQS8kTzLdhplTQ2eGvhStqT1u8uAQ6/F148vpA9lICw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(366004)(136003)(376002)(6486002)(16526019)(6666004)(8676002)(36756003)(2906002)(86362001)(83380400001)(107886003)(6506007)(6916009)(316002)(8936002)(5660300002)(956004)(52116002)(66946007)(44832011)(478600001)(2616005)(6512007)(66556008)(4326008)(186003)(66476007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?P/nX7d5ulfTjZlzUQlaW7PbVQrDjkVwaCW3+jBlIoeewjFfWCo4K108K7b9f?=
 =?us-ascii?Q?TEU5PCajodMZVZm2t109TfiUIrRh6yLD6JFMM5nxulZaNmStPFxYUtrJAAgj?=
 =?us-ascii?Q?iuViWPlNFuq48ZDJENuBkXjMZC2ObOiBs7RIpXZtAVgWcwQaB4S9cGcUV4ac?=
 =?us-ascii?Q?BKmBJw87qjPE+5R85IqVwqRYpyjhOuZvKIBXuZSZkygXRS/jPgdnRFwgq0yd?=
 =?us-ascii?Q?9UGDmCwRyeuz4cP1YuDPCVsneiMMb2H38YcN12EJIEmpaCiuwEgoxocow357?=
 =?us-ascii?Q?JFct+rVnr232As4CFAaDyoaRxdFnR1ArVy/jGNbhael5aX/uAtUXoYeq7KUg?=
 =?us-ascii?Q?HUVE4m5ZzXo3spUsHAn5DZPNA1QowVPKkT3jTZ1mxbIEeq1zjJ/MyLCCdNxJ?=
 =?us-ascii?Q?OKa/vcvP26p8wlJSj+4Bw9/7GalA2W2E7CVCor7xEG/e+hzX65glP7LqkMdW?=
 =?us-ascii?Q?odLQRzCqOYt2ZrV7LN8a3VR/L2pbYq5TPNLdj3523bjlHOZZfbk+rvFpSGmw?=
 =?us-ascii?Q?f5t0Luww9dqMjmJDOnfW75+C4vxwa9/4gAWy6na/AYGTR64OyO7wPr2JaNSV?=
 =?us-ascii?Q?HNfvafYRxdluNnSuxduYhg21Wdn/Yq3yzK1MA6OPvRNXLT5aOS+Q8ZCqY1UO?=
 =?us-ascii?Q?rIFDgRycLkG1wXi/mirX5oDc+CYeLvaWRsVFEEu0vR5bqkas3KYzcsD/08Ob?=
 =?us-ascii?Q?29Sc/0VQSb3G82N8csw3c5ERri8nTuG4EJoRbuCrIuqss95qdKbVHeB39W1A?=
 =?us-ascii?Q?d0poMzsqkb41/ON2B4RjZlZYmKCJgMhISBgpvrpmhRdhVBS7XVmp1SVdqoEx?=
 =?us-ascii?Q?XDF4ErVjEtxfeeOL6PmI8fRRGgydhojuHiCFrMP0Vt+KdpecqmChWSWanEfz?=
 =?us-ascii?Q?8xU0rnqRf0A/iGNVmEjnD3vj/t+bRSQoe+TdTanByTyXI7ep6zsPWiZQhn27?=
 =?us-ascii?Q?sQHf8DznCeUsf9/v1J6o6EcI2khz5391pclkOn8sQLo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d0995c-36af-46ab-8fb8-08d8bd35316d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 11:19:03.7212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPieN3V7BJkCMALIC0unUWCPS+ZvTkgScCyIzWOcQcew2SrtA1MnENKbjP4L3T57MqA+SbEa79g6erOYe03TzNh4Aw+/hxMhqpmyIa/Tru4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1342
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200066
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200066
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=mihai.carabas@oracle.com; helo=userp2130.oracle.com
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
 kraxel@redhat.com
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


