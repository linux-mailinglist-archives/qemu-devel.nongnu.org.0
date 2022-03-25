Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B792B4E7A79
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:35:07 +0100 (CET)
Received: from localhost ([::1]:33112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpiE-0002Rj-RQ
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:35:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUO-0008Dx-KM
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUM-00038u-82
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:48 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHS8fW031405; 
 Fri, 25 Mar 2022 19:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=JYVQewzoX+sUQJRNA1z3tNqx20vy8lzb2DxjMGniLpY=;
 b=UtXtqVl4z48zQKH+0WmQrt6AkCgKFqmC/SvWPMe734An5GmzGqChUIQ1iVTI7cXN+f+j
 /pZl2D9UV3GhXizg24V/bldcjLlzrRDPTr57GDjDScKII6jWGPIa2/71++8bNcq98GPt
 4T83tnl4Jmg8OfDaNf/JKHV7m/i15IADwoGP2OTgx1WL8Y0Vn+F3BuW8zIXXk8p0GQE3
 Rbaf4ZL70g0zqVeOd7Gnt+cEXB3BlOpH313hHqgRxWMb2rJ9s5myVgLciM8J31LKDz1h
 4Tmt7V6WiorwvHcb9qjelcfBMOg+Hr1d2dULbpOrnjCCRhwNSYMtbf6rNo/m+5+Zj/xd lQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtgb3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGWDU043737;
 Fri, 25 Mar 2022 19:20:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by userp3030.oracle.com with ESMTP id 3ew49rgq83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baB1+VrF8tCKWiPDy1MKnYu6obZNTUtMofKd3kWigWG3cw5zeKJBg+kSR1gHN52XInoyiHuditKyLxVsro2vqkIN7B1q7lasXhk5XIj2hbOazZGSA36Ren5V+R93fELxfW/cW/Qm/tbR5OvGECcwTJEgLAaZElrj+fIzWZxNPoTfPmD8yMhnNw2yw2N14Awu6pUQDmKVu/9uYMiTzqHCyEwqOI12sCBe7yCGApZGet9sJ17YbpYLDKAqEizzMTADldHRNaqKszKXgqhUja6l2JAmohqnXitWFT3mjZHWYgeThZRciB6FaNyMVN/jOhci3pjM80CbWQecHd3Qabi6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYVQewzoX+sUQJRNA1z3tNqx20vy8lzb2DxjMGniLpY=;
 b=iAhsNs7nTuUzDn5IUQY/fNKq0wTwqnbfsAw+vBu4hmfvxD+2gZA81OaTSM5LN3kuJTf9KMW4bVlFejguSNyZuEljYAbaFQhtbsdyKc+gl+2Rj0kSuM4Wvc24NN1w1EYvfaUvcRH4T/wXdtdYWYmfSDSSp6Mc3YfoIrQ/nqA/y6gRMnK3LzLzKf7cBJqbcdEPWDM3FFwj/f7vGOaxMjOMNGIh0QJbw72Abh8fY5JkeCtb/k1z+QQV4UMKqhfuOMNB6t6RH7OSeWgL4d/wZC816qkPoDRTdt4rLZkX7n2L88SJ6nJdnDYIGtHH2gr3TAeFvVkpW4ajVKy186rDG3RYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYVQewzoX+sUQJRNA1z3tNqx20vy8lzb2DxjMGniLpY=;
 b=pi3GNuZ9zL4ehzrd6O+F+xUCBjEVS8Y1bCxjbfJZelWqyP5NkOtpsSu5URhrRkWgoZktuJe4zzuJMSYLuJWGa9amD9c+EkYXVsVC6501ZLBgPKoul0VHQyjf3ym9bPQtMq9Zmki6oTDB5hzPXn5HgKGLjBBK6oU7jAXwnNdL0Mo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN8PR10MB3729.namprd10.prod.outlook.com (2603:10b6:408:af::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:27 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:27 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 15/17] vfio-user: handle device interrupts
Date: Fri, 25 Mar 2022 15:19:44 -0400
Message-Id: <377ddc113f35efdfcdb41066cca5f5d4a6f32ec7.1648234157.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8c1a3260-90af-4215-6c89-08da0e94847f
X-MS-TrafficTypeDiagnostic: BN8PR10MB3729:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB372950C1EA9EBC0BF36592FF901A9@BN8PR10MB3729.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y6Q1jQL1GY4zxX1AcbhEVNXTwugH41n4IyrfoWT0z/F5/vZFXzpl710tcCv834ONgCrlLt4K6KcXztgLUJX+RV9BPWNgXKxUEyGWJsVJg/cIldV9M8ga9ZCDkSViNL2OuhNcLJf1AsiDZe3Ju93b/Hex4+/Sxy1jZRQAPcgssrDwtntGmt1tpoP1MaR0YJ3arYddrRdoUiMbgWe7rkfGnFqUOQpiXZCNwh7P46h2Yo0/bOGp7Jcw4Q7aPnMgqUJXVOUzLiX7zaEfE7+ZXgCt/nbfwOkpUl5AUNKfh4ZhpXyyzbsRxtMgASZ57KAkSt7GZ1mUjHLocZ80zlYGsRsQlQxLLva5e8A1mDwWnaAY7UW9whrc+NL9LeWax4uGI9iempxX7o5dmBiZjHhKBtwF2ae0pNhShx7AiPpWudpJlWpWzp0LCSTYAvEPWccH0wT9hsFpxlsQc5cYrmIeBC+kvEOlfGrBtnraxBi/bX2lPSSpxhwod0oy2y+rSDeK12EzQYNNQkg2wNaU/gIsardSCRG05ObEkmq7XVKmBsSom2JewGhJpbDytmDDI6FHWk6nXnrY+2PnHg6Ud8813hiTskOaF/OBiP7+9qRyLO/5sJNoSWWAC8Ft/tX+scpcAzDVbWtDYr2OseZ49C5Fv4bVSzBvfP/QPZxqTxaZQq2FM0IUZIfRSByhzT5/+mQR+/5HKaoObgwY5Hx8Z1Ofo8df4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(6486002)(8936002)(6506007)(2616005)(8676002)(4326008)(508600001)(66476007)(86362001)(6666004)(6512007)(6916009)(66946007)(66556008)(5660300002)(52116002)(2906002)(7416002)(83380400001)(38350700002)(186003)(38100700002)(26005)(36756003)(316002)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wKXk1vVFBATRH5GKD+Vscj7s9hdC480seqpLTdJcR15fs5Oe4Ub1XvkFCG2i?=
 =?us-ascii?Q?yw0oMc3B76t2LBeBmsrcYrTw5ORm4gAa/oYUfoS6A4PV6C1sjRBso3L3Mai1?=
 =?us-ascii?Q?y1JI+CBtIbIm3D28rlQpffryIjJZWkttYXu91AEagkHxH+Sxi1AwWyJ7fKff?=
 =?us-ascii?Q?8FR1f83siTNOWzs4Z4rXThHJJ+LEudeGDtcT1A56kakG/5YTX80MaVW9M4I1?=
 =?us-ascii?Q?k2FRdrVtvLMPSC9Mabh1do3ILyTT3oiwpUHjKTQy8bGbmrLnACLMfiaEtu08?=
 =?us-ascii?Q?WIRZx3o6JYGt3bWp8spKBbWtzGg3365nh0n4cmakOwcEbBJi2Rfsiim9UiYg?=
 =?us-ascii?Q?M/E6kj54uk8wCGLTwgk8VTtUgD2Qj12vFXdEnsdH3E9dZEK23mgFE9Zwxawq?=
 =?us-ascii?Q?CRRMhgnD50Ep/08Ot68ObRF1x+UlW6t4mcEzp+9ommlOMzCy0+OPA9lrpBds?=
 =?us-ascii?Q?vEQ67lKQ2s2HBRIqQGKwgnqBMpkbfPtJeixNk5x8V+F+b2LTP5vbcfEUUAzg?=
 =?us-ascii?Q?3yz/5GuC40RRlY/iPOT2IjF5GoY94I9/Mwlrwk9fbDhhn9xgQO5foTckQytn?=
 =?us-ascii?Q?JCe7EPCg5iLvRGZluPw9Ul9QfYSjX/itRrj21eao4tSmRuq1uugbHexHjYnL?=
 =?us-ascii?Q?JzlLPnjha47lbgh6MBCR59e2exCrn77dW2+VO2P0QRwYMJ8frrCPbzQkIiz1?=
 =?us-ascii?Q?LsPVx/YJPy4lcH3srx53Yh2CWS1rcfsd03PXBL1VWrOdirfSUDrQwfkGjLWK?=
 =?us-ascii?Q?AL4hs/rk0POJ8uieZBJp339Ar44/Jn+ilJJydaWmJN99XG7c6E0thMdYzzVX?=
 =?us-ascii?Q?GLlkxssUXuyc2p4WrCVEU5CBS/6ckpZdKKUaedIcGswBBHioPrF64B1U7dO+?=
 =?us-ascii?Q?TFwNthgphVK9hpj+IjxzDi21HSeuIx5uP4z0DzDCWEwCUESHo7ll1P84+oq7?=
 =?us-ascii?Q?1AvhK0Mi5VS4EkQDSDdb2DUuJsuZIchf8jxCYstb3J6vYPGedsXSo8gVKUHy?=
 =?us-ascii?Q?6BituQhVPPX5LCk+ZHiDQh/9XgS276ICIMarlMt9F9wmUzXglwrSykrar2aQ?=
 =?us-ascii?Q?GtBgOQP3Udln1bb8+uLzsEb6d5kkhSLgfXW8aLC4CPY5Fl8xb6GjNs7EQ5lj?=
 =?us-ascii?Q?G6WIDDy9LofD+rf+ovHGEW4j7yKe43loVLx6mRh1fG+rS0K5txlfmTAH1wBX?=
 =?us-ascii?Q?w8Z6yD88+xsQqQ8oBdOzmysdgd9TOklXu9yvfNHpM2SY5GNkjjY6+3xnF5uI?=
 =?us-ascii?Q?pgG4EZ+1ZmcIKqEHgQEkIDOEYpBkuF7a3ZMg6ip1MbTJaqLjWwQE0pyLti1t?=
 =?us-ascii?Q?KrZ5VUvtOJ1yVoLSH70Cvn6sqgvXuy8lPLLp/CykosMQDXmfqqwgau2oBVwQ?=
 =?us-ascii?Q?RiQItvnLzpOEbt6o1vZvwpsiRfUXYDSg4jt6zvEQDNySnU6QW/fKwgTYC0iB?=
 =?us-ascii?Q?mdpf0pMThHMs6AatOg3QsPXHDspJk6N6FzYuRCJzmxPdUTnHFcPyDdkYwwAR?=
 =?us-ascii?Q?3C4CVW5inKHzOYHaDPX1j/wOiVDmrTfSyrFESz/4xgzpBxWVUYMY/Wg6i94v?=
 =?us-ascii?Q?vu5ZLLImv5KoI9BEdltHIgQ9dZkYuxMnTkUAQIR4woLgqcpCMiCR9ljZ4OmO?=
 =?us-ascii?Q?aIqaW5jdh9JdWnzt5BnXN0s70AFiQx45t/JwSvp8N64suIIREOFAuJORR/sE?=
 =?us-ascii?Q?C5B5iInzwe2to9cu92ja35gUDRPzetpOjRD1x8CmoRWDvENBludNezhJOKWR?=
 =?us-ascii?Q?b9/sYQFWdA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1a3260-90af-4215-6c89-08da0e94847f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:26.9894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOuE0w0+RZH9rVbkOUQl295MGiaXS+dzPhPpcjZcpNpgJygNxic1QAmuf+HgPb11FliZnj8/K+ZfXARG4f2umw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3729
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: mWh657PU9_S_HGcI2zJFPyIRBWcYIt-w
X-Proofpoint-ORIG-GUID: mWh657PU9_S_HGcI2zJFPyIRBWcYIt-w
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

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/pci.h              |  10 +++
 include/hw/remote/vfio-user-obj.h |   6 ++
 hw/pci/msi.c                      |  11 +++-
 hw/pci/msix.c                     |  10 ++-
 hw/remote/machine.c               |  14 +++--
 hw/remote/vfio-user-obj.c         | 101 ++++++++++++++++++++++++++++++
 stubs/vfio-user-obj.c             |   6 ++
 MAINTAINERS                       |   1 +
 hw/remote/trace-events            |   1 +
 stubs/meson.build                 |   1 +
 10 files changed, 155 insertions(+), 6 deletions(-)
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 stubs/vfio-user-obj.c

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 3a32b8dd40..fb8a05ae25 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -16,6 +16,7 @@ extern bool pci_available;
 #define PCI_SLOT(devfn)         (((devfn) >> 3) & 0x1f)
 #define PCI_FUNC(devfn)         ((devfn) & 0x07)
 #define PCI_BUILD_BDF(bus, devfn)     ((bus << 8) | (devfn))
+#define PCI_BDF_TO_DEVFN(x)     ((x) & 0xff)
 #define PCI_BUS_MAX             256
 #define PCI_DEVFN_MAX           256
 #define PCI_SLOT_MAX            32
@@ -126,6 +127,8 @@ typedef uint32_t PCIConfigReadFunc(PCIDevice *pci_dev,
 typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
+typedef void PCIMSINotify(PCIDevice *pci_dev, unsigned vector);
+typedef void PCIMSIxNotify(PCIDevice *pci_dev, unsigned vector);
 
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
@@ -321,6 +324,13 @@ struct PCIDevice {
     /* Space to store MSIX table & pending bit array */
     uint8_t *msix_table;
     uint8_t *msix_pba;
+
+    /* May be used by INTx or MSI during interrupt notification */
+    void *irq_opaque;
+
+    PCIMSINotify *msi_notify;
+    PCIMSIxNotify *msix_notify;
+
     /* MemoryRegion container for msix exclusive BAR setup */
     MemoryRegion msix_exclusive_bar;
     /* Memory Regions for MSIX table and pending bit entries. */
diff --git a/include/hw/remote/vfio-user-obj.h b/include/hw/remote/vfio-user-obj.h
new file mode 100644
index 0000000000..87ab78b875
--- /dev/null
+++ b/include/hw/remote/vfio-user-obj.h
@@ -0,0 +1,6 @@
+#ifndef VFIO_USER_OBJ_H
+#define VFIO_USER_OBJ_H
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus);
+
+#endif
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 47d2b0f33c..a161a5380b 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -51,6 +51,8 @@
  */
 bool msi_nonbroken;
 
+static void pci_msi_notify(PCIDevice *dev, unsigned int vector);
+
 /* If we get rid of cap allocator, we won't need this. */
 static inline uint8_t msi_cap_sizeof(uint16_t flags)
 {
@@ -225,6 +227,8 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     dev->msi_cap = config_offset;
     dev->cap_present |= QEMU_PCI_CAP_MSI;
 
+    dev->msi_notify = pci_msi_notify;
+
     pci_set_word(dev->config + msi_flags_off(dev), flags);
     pci_set_word(dev->wmask + msi_flags_off(dev),
                  PCI_MSI_FLAGS_QSIZE | PCI_MSI_FLAGS_ENABLE);
@@ -307,7 +311,7 @@ bool msi_is_masked(const PCIDevice *dev, unsigned int vector)
     return mask & (1U << vector);
 }
 
-void msi_notify(PCIDevice *dev, unsigned int vector)
+static void pci_msi_notify(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
@@ -332,6 +336,11 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
     msi_send_message(dev, msg);
 }
 
+void msi_notify(PCIDevice *dev, unsigned int vector)
+{
+    dev->msi_notify(dev, vector);
+}
+
 void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
     MemTxAttrs attrs = {};
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..fbf88654b3 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -31,6 +31,8 @@
 #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
 #define MSIX_MASKALL_MASK (PCI_MSIX_FLAGS_MASKALL >> 8)
 
+static void pci_msix_notify(PCIDevice *dev, unsigned vector);
+
 MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
 {
     uint8_t *table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
@@ -334,6 +336,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
     dev->msix_table = g_malloc0(table_size);
     dev->msix_pba = g_malloc0(pba_size);
     dev->msix_entry_used = g_malloc0(nentries * sizeof *dev->msix_entry_used);
+    dev->msix_notify = pci_msix_notify;
 
     msix_mask_all(dev, nentries);
 
@@ -485,7 +488,7 @@ int msix_enabled(PCIDevice *dev)
 }
 
 /* Send an MSI-X message */
-void msix_notify(PCIDevice *dev, unsigned vector)
+static void pci_msix_notify(PCIDevice *dev, unsigned vector)
 {
     MSIMessage msg;
 
@@ -503,6 +506,11 @@ void msix_notify(PCIDevice *dev, unsigned vector)
     msi_send_message(dev, msg);
 }
 
+void msix_notify(PCIDevice *dev, unsigned vector)
+{
+    dev->msix_notify(dev, vector);
+}
+
 void msix_reset(PCIDevice *dev)
 {
     if (!msix_present(dev)) {
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 67801c3a4d..95f97ab268 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -23,6 +23,8 @@
 #include "hw/remote/iohub.h"
 #include "hw/qdev-core.h"
 #include "hw/remote/iommu.h"
+#include "hw/remote/vfio-user-obj.h"
+#include "hw/pci/msi.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -53,13 +55,17 @@ static void remote_machine_init(MachineState *machine)
     pci_host = PCI_HOST_BRIDGE(rem_host);
 
     if (s->vfio_user) {
+        msi_nonbroken = true;
+
         remote_configure_iommu(pci_host->bus);
-    }
 
-    remote_iohub_init(&s->iohub);
+        vfu_object_set_bus_irq(pci_host->bus);
+    } else {
+        remote_iohub_init(&s->iohub);
 
-    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
-                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+        pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                     &s->iohub, REMOTE_IOHUB_NB_PIRQS);
+    }
 
     qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
 }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 6910c16243..19d075a9dd 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -54,6 +54,9 @@
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/remote/vfio-user-obj.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -489,6 +492,95 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static int vfu_object_map_irq(PCIDevice *pci_dev, int intx)
+{
+    int pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
+                                pci_dev->devfn);
+
+    return pci_bdf;
+}
+
+static void vfu_object_set_irq(void *opaque, int pirq, int level)
+{
+    PCIBus *pci_bus = opaque;
+    PCIDevice *pci_dev = NULL;
+    vfu_ctx_t *vfu_ctx = NULL;
+    int pci_bus_num, devfn;
+
+    if (level) {
+        pci_bus_num = PCI_BUS_NUM(pirq);
+        devfn = PCI_BDF_TO_DEVFN(pirq);
+
+        /*
+         * pci_find_device() performs at O(1) if the device is attached
+         * to the root PCI bus. Whereas, if the device is attached to a
+         * secondary PCI bus (such as when a root port is involved),
+         * finding the parent PCI bus could take O(n)
+         */
+        pci_dev = pci_find_device(pci_bus, pci_bus_num, devfn);
+
+        vfu_ctx = pci_dev->irq_opaque;
+
+        g_assert(vfu_ctx);
+
+        vfu_irq_trigger(vfu_ctx, 0);
+    }
+}
+
+static void vfu_object_msi_notify(PCIDevice *pci_dev, unsigned vector)
+{
+    vfu_ctx_t *vfu_ctx = pci_dev->irq_opaque;
+    unsigned nr_vectors = 0;
+
+    g_assert(vfu_ctx);
+
+    nr_vectors = msix_nr_vectors_allocated(pci_dev);
+    if (!nr_vectors) {
+        nr_vectors = msi_nr_vectors_allocated(pci_dev);
+    }
+
+    g_assert(vector < nr_vectors);
+
+    vfu_irq_trigger(vfu_ctx, vector);
+}
+
+static int vfu_object_setup_irqs(VfuObject *o, PCIDevice *pci_dev)
+{
+    vfu_ctx_t *vfu_ctx = o->vfu_ctx;
+    int ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = 0;
+    if (msix_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                       msix_nr_vectors_allocated(pci_dev));
+
+        pci_dev->msix_notify = vfu_object_msi_notify;
+    } else if (msi_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                       msi_nr_vectors_allocated(pci_dev));
+
+        pci_dev->msi_notify = vfu_object_msi_notify;
+    }
+
+    if (ret < 0) {
+        return ret;
+    }
+
+    pci_dev->irq_opaque = vfu_ctx;
+
+    return 0;
+}
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, pci_bus, 1);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -587,6 +679,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o, o->pci_dev);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup interrupts for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
@@ -612,6 +711,7 @@ fail:
         o->unplug_blocker = NULL;
     }
     if (o->pci_dev) {
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
@@ -671,6 +771,7 @@ static void vfu_object_finalize(Object *obj)
     }
 
     if (o->pci_dev) {
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
diff --git a/stubs/vfio-user-obj.c b/stubs/vfio-user-obj.c
new file mode 100644
index 0000000000..79100d768e
--- /dev/null
+++ b/stubs/vfio-user-obj.c
@@ -0,0 +1,6 @@
+#include "qemu/osdep.h"
+#include "hw/remote/vfio-user-obj.h"
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 21694a9698..d07f2a0985 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3599,6 +3599,7 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 847d50d88f..c167b3c7a5 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -12,3 +12,4 @@ vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
 vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
 vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
+vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
diff --git a/stubs/meson.build b/stubs/meson.build
index 6f80fec761..d8f3fd5c44 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -60,3 +60,4 @@ if have_system
 else
   stub_ss.add(files('qdev.c'))
 endif
+stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
-- 
2.20.1


