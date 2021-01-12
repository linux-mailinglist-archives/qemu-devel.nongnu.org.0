Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B122F3416
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 16:22:54 +0100 (CET)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzLVV-0005WO-3G
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 10:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kzLUO-0004kN-MB
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 10:21:45 -0500
Received: from mail-hk2apc01olkn082a.outbound.protection.outlook.com
 ([2a01:111:f400:febc::82a]:2657
 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kzLUM-0005AV-6l
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 10:21:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E18DtcWw6/0nPvbjt9i3BeRxqOr1C6L7C6tshNGKSua/lsC7dis/CdvboUDOfHEgyCbAnoJA/v1XtPXffUPqgQX2An7hJ3pjkZxtKyBia6ERA+EejJhA7ftmWEvc66b+b+lX+cM77LGUAQv6R4y2njhrJCjwcs4STraXpdsomsFmqGx4dTU0yKj1Fb+hVWwDrvXEnMiFd8GnSl/miCaQ/J/q6B/4pVFgZYXvP0LwYxz2dMq4N0gBlN+P7A0/FdaEJiQC+TsVcVMZJlvf22ZQc4PbuQI4chPbPLI+jhNE1yU/hBlMZgeK9Feud9UC4unzAYwRh4Fap9Qa2P0QLIYu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2Y2Mk2QfVSofBOXoEl7AJ8frq/mcwxCN7+pKKDHI7Q=;
 b=cVOxAfc2DjAjikYzG2dgVZ8FlyXtRsU84toafSmUtQFzuSMHJk3rh8rQ88FIRNrCzrVa9HoWSk1h6v7+qGMpzuvXI6d7FbS3gRvxeXbUVcdBqd10kDEOPt7Fvfz2jJPVy4sbEy0+aq160aYmhpKX3zFGmbeNCwV5/Bvh5hgwKJ8NHkYMI2EvJK1aaRRuDYKNP13XuBW9DmaQmAEYcFRXKdda/YtYssLKOMhYkfk9zVXT+SDthyS43CZoRT+TOVyJvFXydH40o0fp7SrbjVRa4jvIrZr+ZhgWJzh58Jsumf6UabN++5W4FaUKpT4ganvlCXP//cGSDGn4RDz4AsNA0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2Y2Mk2QfVSofBOXoEl7AJ8frq/mcwxCN7+pKKDHI7Q=;
 b=E6/FBuV4fmLGedyJRP7TDpY2enR/ZDxHeb1rMx1EXXoKZeus7fYFOpY08M7rkuNTuLcfPVodzdI1YgnXXypNIIrjEjP73wFh61us75gmcbgYT5fOuWK5lLNOFrC4N7ioIHBZxayTCfBXn56AGOqGbVaM+qLktJUNCoXxRFv0ekp/dmnuAslpum1bXqGtiHWnCsuUZTIja7+rCEBCuhLT+shnAgRYsHBXoW9gUcIzPtZy/h7fRXZFb28rdoN2rIAjX72vQKH50hRhIeStmVnHwcsLrkUFrTzy+AwsHnNGogswJylqixJeoyr7O2wJA/505b898+uvE3cIVC+6F9OJ+Q==
Received: from HK2APC01FT019.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::50) by
 HK2APC01HT186.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::297)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:06:22 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::53) by HK2APC01FT019.mail.protection.outlook.com
 (2a01:111:e400:7ebc::187) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 15:06:21 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:7029F99A4C0763641D0B7F6C020E7D6044E8DA8475C1C1AF4489CFB8B43714CD;
 UpperCasedChecksum:AA3859C5F9C882DDBF829EF8F56BE5BE103A942A59647BFFB01494F408F951CB;
 SizeAsReceived:7361; Count:45
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:06:21 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] rtl8139: fix stack overflow if RxBuf overlaps MMIO
Date: Tue, 12 Jan 2021 23:05:54 +0800
Message-ID: <SYCPR01MB3502B0D05FEB1ED21532219EFCAA0@SYCPR01MB3502.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [kAGdlyAXKVQaVOR2dC6QNratJcV5ztiF]
X-ClientProxiedBy: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <20210112150554.340352-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (111.176.239.56) by
 HK2PR03CA0064.apcprd03.prod.outlook.com (2603:1096:202:17::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Tue, 12 Jan 2021 15:06:20 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 47585f55-18e1-4c79-09c3-08d8b70b9ed4
X-MS-Exchange-SLBlob-MailProps: =?us-ascii?Q?oSNBGPqYqPTCAQXeIGl5Vz44a4ykuhAQEvCA9AcJH7uk+NIwKt/kVlpJulzm?=
 =?us-ascii?Q?lTiag11pByE/2Xk6XDyN3GECKvaeJIsSnGJ8xrkrGirXgY+aY/veNIfuAd/M?=
 =?us-ascii?Q?mmArEZcfU8rsps9roWdTUktvKIAPII4tFZNUhxl9afnvTcJDfiN4dCAdDZWL?=
 =?us-ascii?Q?xyfZN9y2ZaDij5ZGauLyz3avkXO2JHRbUTPAqKG/d+CtsB3enyP7Ue+qWetb?=
 =?us-ascii?Q?9B2CmVa9tp2Ot3dZNmVeNsGXcqUpVwrdEpJDYsr6uYzN+QF1TBYW+JQ516PR?=
 =?us-ascii?Q?1giFAeT0l5KNS01/07TiToxTV5Ji7t38/TTq9+n+wgOiKhKLppfG+1nynpsB?=
 =?us-ascii?Q?4UG3vhCNfrUxdVMQldZ0/KMivokT5xvXRPv7PrrvNNQijMlQmwS4+D3Icu98?=
 =?us-ascii?Q?OAN1yBnhLLAFx0Q3/3NFWeS88Ew6XCSVZqnId0SRsZN9MdWmqYlbvltsMKU6?=
 =?us-ascii?Q?wiAZ1o5ADzTaq9kAP1yBDMjz2BIa8HKVmE0dznl1wamd3Y6hwIceXzbaEJZ/?=
 =?us-ascii?Q?seTxup1gYQQiLmdrEPTDOa9bFuoq5F0GW9iIxQCBTP2Fe7plB3+Wu7S4ZQcD?=
 =?us-ascii?Q?vNzH/Tf1xKmbe2M1Bx8Y9IgT847fJOAUotwrw3S5/A26WdPqc1K3Xfhn/j4D?=
 =?us-ascii?Q?QyF4cN8EFd0BsXbvML+VaYUw+goY4YHibsOtMthOI6CJzC3ZsM0YihTRg4jo?=
 =?us-ascii?Q?sGDbVL+90AJFVHV3uCJQKqgJ8ks0Cq1GeZmEhF235lGql7tC2Sya1mo8bbdk?=
 =?us-ascii?Q?iohpXDuGisG3uzpFE9wDEYd6AaCtz1uJNLC309Gk+ycXEhNnv+FpIrncmBwy?=
 =?us-ascii?Q?HXbgLGm4EOxiA2hUYywQMJ/CG5k59GQWFxm1lVQ65euuluYUU2YTK2aUzsP3?=
 =?us-ascii?Q?9nlxscYTjDePmpMZ9IGB9as+HjurgZcT0I8MzuNaPAzSyWgC+pKySh36Qfmb?=
 =?us-ascii?Q?9w4niRbDeBlJCr+mwySggeEIoYvrwV9v8HkZCcUwZKkB8ZL5eC7y1JjQUEkt?=
 =?us-ascii?Q?G3pdVlDlolzIDXQyyZZ5dCi49WIUWEUX/eNtZoZV6gt7rs123/lCInhm7w?=
 =?us-ascii?Q?=3D=3D?=
X-MS-TrafficTypeDiagnostic: HK2APC01HT186:
X-MS-Exchange-MinimumUrlDomainAge: launchpad.net#6196
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgszimIWk8rgN3eJmDbWA7dRneSKvUv62J8DTttnVXdcoKkhY1hQzFmlPGzVnZep9vtmuqI1h3TK8uCWbq1cT4P7qRe1N+fESwhNxCJiQ9RyLhJMVVlOlQUFjsOIAz9CF0Kpz/CRrJwa8g9JdsdqhGAJw+x8Ae4lO5HJZGx7QrO0f+JPoF00QtxB/w92Ap5srBwWti/XDeyCVJ77NxEu48yk1/OJ81fZw4JtBq1lU7xSnkHbgwuiO18Arr5Ug5diR91mr+sdG9wO25uoItkimsPpiux2lOPvPhGW8g79U1A=
X-MS-Exchange-AntiSpam-MessageData: 4r4vMki8q64gHD2bXlGNIw4GmprUexoYeKgZRC6lShNlW1yGzLvHkJDobEZwSHfEpigiV2uiu7c3/cpFhuw8lLD9wsOQP3EKGX0Gn5Gk1MRerHj2pP/uD45dhFuxwZnbXPqUGeblnYt3+CToYCpTIg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:06:20.9195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 47585f55-18e1-4c79-09c3-08d8b70b9ed4
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT019.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT186
Received-SPF: pass client-ip=2a01:111:f400:febc::82a;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alxndr@bu.edu, alistair.francis@wdc.com, clg@kaod.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix Bug 1910826 [1] / OSS-Fuzz Issue 29224 [2].

In rtl8139.c, the function rtl8139_RxBuf_write, which sets the RxBuf
(Receive Buffer Start Address), doesn't check if this buffer overlaps our
MMIO region. So if the guest machine set the transmit mode to loopback, put
the RxBuf at the address of TSD (Transmit Status of Descriptor, MMIO), and
trigger a frame transfer by directly writing to the TSD, an infinite
recursion will occur:

rtl8139_ioport_write (to TSD) -> rtl8139_io_writel -> rtl8139_transmit ->
rtl8139_transmit_one -> rtl8139_transfer_frame -> rtl8139_do_receive ->
rtl8139_write_buffer -> pci_dma_write (to TSD) -> ... ->
rtl8139_ioport_write (to TSD)

This patch adds a check to ensure the maximum possible RxBuf [3] won't
overlap the MMIO region.

P.S. There is a more concise reproducer with comments [4], which may help :)

[1] https://bugs.launchpad.net/bugs/1910826
[2] https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=29224
[3] https://www.cs.usfca.edu/~cruse/cs326f04/RTL8139D_DataSheet.pdf
    5.7 Transmit Configuration Register
[4] https://bugs.launchpad.net/qemu/+bug/1910826/comments/1

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Reported-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/net/rtl8139.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index ba5ace1ab7..aa7a38220d 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -2567,6 +2567,18 @@ static void rtl8139_RxBuf_write(RTL8139State *s, uint32_t val)
 {
     DPRINTF("RxBuf write val=0x%08x\n", val);
 
+    PCIDevice *d = PCI_DEVICE(s);
+    uint64_t mmio_addr = d->io_regions[1].addr;
+    uint64_t mmio_size = d->io_regions[1].size;
+
+    #define MAX_Rx_BUFFER_LENGTH (64 * 1024 + 16) /* RxConfig 12-11 = 0b11 */
+
+    if (val < mmio_addr + mmio_size && val + MAX_Rx_BUFFER_LENGTH > mmio_addr) {
+        DPRINTF("The receive buffer may overlap with the MMIO region.\n");
+        DPRINTF("mmio_addr: 0x%lx, mmio_size: 0x%lx\n", mmio_addr, mmio_size);
+        return;
+    }
+
     s->RxBuf = val;
 
     /* may need to reset rxring here */
-- 
2.25.1


