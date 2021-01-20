Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35492FD0F8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:02:10 +0100 (CET)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2D7h-0007Br-O4
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2D4o-000670-8Q
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:59:10 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:43332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2D4k-0002Fk-Qo
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:59:09 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCdsMe145909;
 Wed, 20 Jan 2021 12:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=3jkOSU73no9c1wvY97sdyMJOwxj1A1nBsaPRtYSJqiU=;
 b=sPDwXan0hapXC16Vnsaf+L9nKeb9vVTt45htwWovklfew6uG6LIWMUP6mmtCeUEduTLI
 vH2AOISDYPQkeIGe71r6fLGuCLn74Dx4gwU/T8YztEpbUKqo/Afv+QoHwDVJZyubw2O5
 mO1zkfAd4crqqUgugu9s2wX3lOGnWwTm7k8dBmthx9uVqSjkcjz5piwWCRQFraUJBD37
 bbM2QdW5ZuaSfrxqLR61uayhdG2D9Om+pFU99tG+MjTGXHAH/10k4L01p84v0esdKD00
 Hcm86sbW1u9R9W/7jAjWRr+hl6EcVO+6MFBiP3QLkc486LSwajAE7au6TuI3Txp5mED9 mw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 3668qaab0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 12:59:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KCaf3H061415;
 Wed, 20 Jan 2021 12:59:02 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by userp3020.oracle.com with ESMTP id 3668qw5s1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 12:59:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xag1LqD8myV3AGzP6PJ5T8QpWI8VFCePNh6JOgfkASUFGLPQTHgeEcq8K92TGf1y8AGQR2nf/f5UDeYh6BBnlsPebAogyxsABMucT/G4zeP7aa6USxXQ970ETACgWHs9M8pWY6XgL2JGa7u3vLx980KwcoRvLaEZEWEeLqOH0TpEes4+rmWY7Bodb79HH8sYovxD5VZ7KUIFJuQP+2PBr2ogJgQ5EjkTmwkf5pYkxRLzH2/9+ZUuxObqxMW7KWNXiDxlZV1F/rc5luHG+8dGeL+fWhFgwvtzJFUM4sudoEUoKoIH298NLVqR2rNteipOSl0fYuS2LD26vJRNlWNziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jkOSU73no9c1wvY97sdyMJOwxj1A1nBsaPRtYSJqiU=;
 b=KUClQW7JE9oqjhd4PNq+qU7lG5Vk8Y89e4KLzEupOfNv0CmqCF/o4DMVc0Zpy4wq1zFgNFDY4a289k/3jcsKnRLkqrs9jpjc214on2FgqkWcQfrcQi1jvUw6cGgu25I9vu1kBBtQ3XSZ2d+eyWq2bNAK8KykDrfcBbF24JzI+BG1mz0wEsJmoEJjBSnXc3tArYkAqh3sKA89LCgYhYqZ+xYSYNSt2Hi5ML45sPQNrQKL1J3wHThzYMo23h4RZIBjt5SOPWf2JNfDaZYPdFRut4JBuoR0kGsQK5ztkYVgpB+gPZ04uV1TirGT1NB7OrNJDFTm4GZ9j5zegi6hUV4tZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jkOSU73no9c1wvY97sdyMJOwxj1A1nBsaPRtYSJqiU=;
 b=P3eO53vXjcLv+Wexw7fEsb6qrP4xKWFiKHmnL3XZB94BNyq4/Q87WPAdFceBWQTi2BQL7Ij4+UUMZBcmkyX7PYUiO4DrLc02R4a2ZwinCa2WZ2ogkS30y9bXfa2gEatpSUMc1tQjr88DoMCkN5oBDnjAloz6oleibE0olFRUxRA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by CO1PR10MB4739.namprd10.prod.outlook.com
 (2603:10b6:303:96::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 12:59:00 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 12:59:00 +0000
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/4] pvpanic : update pvpanic spec document
Date: Wed, 20 Jan 2021 14:11:52 +0200
Message-Id: <1611144713-21433-4-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611144713-21433-1-git-send-email-mihai.carabas@oracle.com>
References: <1611144713-21433-1-git-send-email-mihai.carabas@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: SA9PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:806:a7::31) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mihai.localdomain (138.3.200.25) by
 SA9PR10CA0026.namprd10.prod.outlook.com (2603:10b6:806:a7::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 12:58:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b52872e4-8371-4ab2-0aa0-08d8bd43278a
X-MS-TrafficTypeDiagnostic: CO1PR10MB4739:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB47395560A3A5130C7033C7A188A29@CO1PR10MB4739.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UA9PGPzUNcmhVKLvCTUAmzb64a+srEaF+K/I4t3RUqCcBwQmo78IunBeszUSih8eEQEt8VKvQR+YfyztZ3QodjkKqZPtnH/3xlK88srJENeoAxrsNIq0zhfozj9uDUVIlKYKhQo48ZJnJgGJE1GWEmmOMyT+Gs9YvuMwc/J9hMdZTgAdnBpTMsUmvWcEM2pn/VIIx/kTwLE58X32PZCL5Qe4CGapVtPklPxs38TEzktj9f+Sg+RKiJzJsD6duQRCqoyMCxgApOqStho/OAnlrB6My2gxhuL91v+hqaz1eBzkWzaUiS+cmK/S5YDI8EwxUoRmU+H/pnldyxRTWS2dtrpUU06U+tuVQZvfTN0zqbs4FmnYhyINcIZQKjj/47LsOlj6k8ZQaEb9it6q3N1ZZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(6916009)(6666004)(52116002)(4326008)(2906002)(66946007)(508600001)(66556008)(66476007)(5660300002)(36756003)(2616005)(86362001)(956004)(8936002)(316002)(6512007)(44832011)(107886003)(8676002)(6506007)(6486002)(83380400001)(186003)(26005)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?weYMDgvbl0P6nva0UJGVsiMduKQ1DMvrKAsTU2FPQhi0NfyWJF8jGN1tYVc7?=
 =?us-ascii?Q?tJL1mqgC6WHDBSAXs10cq7aM5W/rpTWRPYvQBPJvZFeTV4oTU05QtqWAVD9D?=
 =?us-ascii?Q?Vn+VXYnTGleIcVjxfhNrnej3kgRuEKKCdjuFkuvRCkNSzX0jogeO+ovFafUJ?=
 =?us-ascii?Q?SgQ3EyXu0hqminZurXkJ/973UnqgkPmw9N87U2iWevaaKFo0XtfybIvIlWoi?=
 =?us-ascii?Q?D8we6TLylBS95kz8tR9MIo82dz3dY5l7kjhkwg5UWMhgwBLgaYVAruZBUhwR?=
 =?us-ascii?Q?QK4VyNCRrt1GyRDJq2+PSy8k/QWrWNNByxU7qyjdi222OwVSYWkmN/Kd68Jx?=
 =?us-ascii?Q?C6zqWEeDjGQi6WPkUZi8ZX/mwe6owsqq57buTQjeOtNvhOVb73HdlOdPugrH?=
 =?us-ascii?Q?ozvLPR0ExK70vi8gH9joFXWNIOD4s2mapdnJHXN2e9M0K3M41eneIgl9Uhzv?=
 =?us-ascii?Q?OalLzxERrKLOco4taNQq8nGUvyWj7lkAmiiW/wnCywjYgwlJ1yGL4qAVuXjY?=
 =?us-ascii?Q?SDDUk+g+XwapQYl2+yZbezgryKksHJWGPg/M62xFAtWoDm3M7jrzSx606MSO?=
 =?us-ascii?Q?CwakB1+J5lGZNkgWaP7BuoYwbI9Qxb8aYe61PN+yHHFO5pyGN3B0uI3Gl/79?=
 =?us-ascii?Q?737OoNNFnURNxxuWmKluahRHda9aaXySIBiQAFiQge49bSmBC/+/YDs/RZzQ?=
 =?us-ascii?Q?FZm6Bik5OAbPoVKnDuOSi1qIylFExwIewCRw0gduDE2duB+xJmkfs2kwG6NX?=
 =?us-ascii?Q?N3Jw/4GIbPaWGzaej/MRAFgvT5B4bGQWnflX+vFRhQc+bDnYcmklZSTR9R5C?=
 =?us-ascii?Q?dxg3jMyVkezM7ZDfhiLfDFEiMZz8pxTbM5HGIqkxGcfFIvF+JC/KiZTeBcWk?=
 =?us-ascii?Q?iD9gci+lBlB/sB654dQV4WIsgEpJNj4dG7iKwhMpb3y7xT2AQBYahGODguSg?=
 =?us-ascii?Q?pZWYnjFMR3vFbXXauN53QMVm33n2S/NoU1pUg6bdfDXNLtMX1lFgZX6BNCEv?=
 =?us-ascii?Q?fXL5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52872e4-8371-4ab2-0aa0-08d8bd43278a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 12:58:59.9420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgZkOgzzeiYvVH8wIY2fXgf8BUxLSa1q1J2Gb5ovsER/9NjWEHaGuDv8Nj4t7JJdvhN/9frSBpEUnSIq7+HY2WaUzKWnaVwFEiI1J106Q9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4739
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200074
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


