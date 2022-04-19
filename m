Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7504F507B3F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 22:52:30 +0200 (CEST)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngupp-0006p9-4a
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 16:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngujE-0006NO-Mj
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngujC-0003Qw-1j
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:40 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JHsMI2015013; 
 Tue, 19 Apr 2022 20:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=uGUUmqIFRYA4hYl/hssn3f4Q0UuMGH3djJvMb6OJc0I=;
 b=wFmTbmZLuY5xithyMAKAhpuPDCq0U0MZ5XGbuLCPIOYP1JVVgRzKAUWZRj0c0EPRN0a2
 vYcTNGdny1oztvikDokNUv7ORmU0NqRVpO6kYWfllfZDkLuHh/eAw7xCmGMobnrFl3fj
 bwlvTtR73kNfU8dVj4qHAOWh/13E7BqYNSGU33YxJZPh6yibHDj8ROkH3aoOqV/YDToY
 5Y3+I11HnJC6wRVBsrPbhIkptGF2hZGqtGqu4hXpV5OgFh9B8J105JF89K8WrrhS7AYM
 wJqPT7OHujhV4LBfkWevCe3Rcn5MKBElOfPxnzXxyg6PiDR6ut/HBxMqkAPgJ9Uh1vdr fQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffndtf7nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:35 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKZn5h016934; Tue, 19 Apr 2022 20:45:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm88sps7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ix2ISwf9mllTSb5PVzoX++/a9Rm+M3WV288fmdLsAkU29/CTq/SPpqLHB/1e4pRBl8sqxAQIyh/imahwgNorE/48iXApUgQgqdH6lLRsFDirMWwiw4oqUFW/Se8sJqhsMGwXNC4znSkoIVF7JZelPiR/mTHz5xhXEFapAGlNFXmC+yQCZbHwNgGvB1OH8c2FoMA/BxUlbSjVW89eMURbibvPoibbD3onDSnUL/9eZUVTtJ86GKIilBp+F3WsvgmjsDgmfMyOJepxK/YZ5mdXaWtr6itr29ghh2Pk1zyEXgNBFAX4NhRH1zpnyHKKz4pObDq+vAub6M0uLYb+VdbRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGUUmqIFRYA4hYl/hssn3f4Q0UuMGH3djJvMb6OJc0I=;
 b=ZAGUKYDfqVHtABSzRns5P2W2xn0wAThUzXi3lHiwyPLotKu/TXUsZgGOwZ3UA+CTatF65tAqYkFKaYu73mX5iFmXXYPHs8asw12vW7ZkDssJlSH51Lx2u8ZqQLYmaJdT914yEAblbhTuC+02eUvnZS4rPwf1d7o8+7tsyM8Oo8v6W/WyJGOSwlkdWLX3ILRp6Iu2XqePS86SlWaHdbUMJUBajrbxw+fP3rr+g9NdymijGxPFldMPAavdlalmYLEa2jHCupGk3exdZgtMiAdIDxTIUarcmc8xz0yipL5IIe8qgDQxELKVppS0cnzbaqI5qrFG43t3VPPCbchCmnZv2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGUUmqIFRYA4hYl/hssn3f4Q0UuMGH3djJvMb6OJc0I=;
 b=o1cpPb9jiZwqaha898hr5w/DdEtYfdmI8598cI3f54pHV8fWnSxR22Eyf8akSoTWbodcgRnXTB5gbkBAMC+PaXnze4eDjAAjB8txAB3YkIMAVslsuZ/OHze1D+xfPWzm0az4qMgtkDOwCIQFpcQ00oovNRH9qpPdz13Ec2WuWkc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SN6PR10MB3006.namprd10.prod.outlook.com (2603:10b6:805:cf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:45:31 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:45:31 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 15/17] vfio-user: handle device interrupts
Date: Tue, 19 Apr 2022 16:44:20 -0400
Message-Id: <847e6d373eb3d8ff4cdeb7a3ad9b935785bfbf8e.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa04e134-f43f-4b27-d93c-08da22458b4e
X-MS-TrafficTypeDiagnostic: SN6PR10MB3006:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB3006951F614B74C5C84A93A590F29@SN6PR10MB3006.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uUk5Td9ECnq+ZgUB8TThYm6LRBHfOCQkzVzKJy8Zw3sIouhjoJd9JjZt7VeOQFWIy3iVqFFaMNNQXGwMafhfO4SjjqQjKNX8H1ykJZJ+yQFltZpFPB4G7zi509vJaP8qvHUtgamNiD+xjcD+enpuOahBaMd9A1ZNvSvWFxFH70DRIcBP1LSLjCuJJRl1/PKx1fAnsB+d26GIj+oPKee1G2AEmzUfXD83F1JdMVS4/zF4nMLESrY28qKJbRFqZ17bD6s77UVWsP2X7w/HiQscrjYayLJa2Avo6J+OpvIR3oH0JzN5bYzTUJKOOUUj70bnojOka8ZdY0B1fBsIqrg/279r4dNnP2/uJqchnaJA6CUrB37rCyBXhDNrcct6sIDC309dM7bQuHnK1jD49awMjcXKAIL8S2n4HbGDT7g2Uek7md99etJYsv6yOXel3dI2Uu7fS1FNZClFZMDPUnAmyPNafnYU4fzWoZ47GFJ8QsnhtOBvyyeuhU+oJUqkjCocVkrl+kN5y+hcGOpFqQAkj/s3sUNN53jEGogXUs6PkOfKgMK8FWn3uXCPxxQmuU2cXCQF1vBjrxLgOJ1NjmFudFiY27emrOaatKiZBareHpENFZgj0DJ/zelsLNbjy9Mt/tN3RcP18suL7QYVweRS/yzpKvf9HhNb75eDXAX2jm1YraPOLu6c8oM/1KpfTQjaGUJx/7RJQa/9nh8DQGkOMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(66476007)(508600001)(107886003)(8676002)(5660300002)(6506007)(66556008)(8936002)(83380400001)(6486002)(316002)(2906002)(6916009)(36756003)(30864003)(6512007)(4326008)(52116002)(26005)(86362001)(2616005)(38100700002)(186003)(38350700002)(7416002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fAXWL5V4Ko8L67Nc/haupyBttiQ2tiux5liUdnxrGb3qcxCcIiXI4nHRglue?=
 =?us-ascii?Q?3LmAcudBt28NcFp7Nl0AcpLwagPbZ6CcfJiKWoblxSw1kVR19jY2zfptHMKM?=
 =?us-ascii?Q?ta6rwFShnZEwk4WUMvoawbYES2U2CFY4T2kanY0J3yIqByMCiT4mfm8n5Za3?=
 =?us-ascii?Q?+HNvty8eLSytwamOI+AzCm2V2E3Il2sTJg5zjZeaJ5aV4mREiwzY+6Uy7WhG?=
 =?us-ascii?Q?+aYhPAoikaU4DDFnba+YUre72rvrpJ3XQxhkEVdnkjQraD4Q+7rUAvQ9gWw2?=
 =?us-ascii?Q?RpO7o89VA0AGD5LJN67J/D3Okp3PSF0zWMKyjvMaTfvzGd2uoQ6x+dC/Do6p?=
 =?us-ascii?Q?dORIn1zJabVI54WxmktILrLxLdmIwZxTS8Z1lDAVEfnyQmSOPUc8TUP29qR1?=
 =?us-ascii?Q?p3rz+WACQs0hVM/iYxxJoupojP6eF8imjWc+H9u/DBuxQ1gx+J31YzLPNhzy?=
 =?us-ascii?Q?bboxcFsquygqvD17OTKAQLptffqAHgWqdHv0qfX+JolkefCcyhY/O6tVQbed?=
 =?us-ascii?Q?py2tUptey6oPC0E7mnBgWJZIgEuOmTZhXc8UI6tnSj3R8ht0/wtbPyHZahrY?=
 =?us-ascii?Q?cGXflr40lE8BBjxNaDN4zIN0EYctdOjSBulqwqLkKEnZ5uym4kIOiBlN53yd?=
 =?us-ascii?Q?qb2FBttccp0ynC944syd6x/vnlQEWIItFp67q+uxm92L18Bt0gpKd7BlxWJ3?=
 =?us-ascii?Q?6hOITa2NCg3tvlK9Y2SE+FEtIy9os4cArZpOaWMsAXCqlLCzYDjPTVb3WlIb?=
 =?us-ascii?Q?se4uf8TizuMqibcXMEqbUapp0jA9Z4dqQW7RFk6WuaEG0Mlh+2JQZNnkMcV6?=
 =?us-ascii?Q?vEI8OGa/wWTNwOi//d6vBzgmDU6+pJ6x+xdXUxEnvfsSTLiXVqLKpjkCdbjh?=
 =?us-ascii?Q?hCEzB4fElD5/TJ1if7dFkXdVVinP3H1JJCh1MAXr2kg7QMKHGxjMqLOwcCH9?=
 =?us-ascii?Q?d8fWgPil5HNSL5dTKgPLyHCCKy3PWxm8+qfBsWeuiOKSEPl99rRPzatIVH0f?=
 =?us-ascii?Q?snCZPk0X7j40td0WqTb3RX4iEmknTsRo4o82NY3ZvckoEV8wsRsHuLfrKENK?=
 =?us-ascii?Q?nnTJVe7Im2YDf4KCRvBcIIVjTn2iVu85D3ipqhG2tLXbR9IHHMIyaSrGfG3X?=
 =?us-ascii?Q?XBw5Uv6eC0Dqxal5mUULQtk3k+2VU5IJi6vFyiYVySZwf0//mWFOAyohSxac?=
 =?us-ascii?Q?ce7dXpvqoOueI6CfhUvXtYFxMfpnS9FJnR9NmF5AuLglPn3lSpxDCvTaRF7M?=
 =?us-ascii?Q?BHvlnNgHfHrG6zmpyA1Detcwxh0z9jyeypXQwcCi10wail+WvJU1FqvN7zVq?=
 =?us-ascii?Q?lkpANMnRBz4EWc99iu4aqJ25XpRVdgHj/F2H4DyU8EKFL7O47nB0kolhpWUa?=
 =?us-ascii?Q?r2R/Tm7MYOycxcFcCB9rGmER/dhgLtYH0hchmIFLMp+5nE5YP1atXRxGfMfl?=
 =?us-ascii?Q?XdltgCgaBVb5XBDVb7fe9qEw7c0AGZSmsZOMfDIGjiId4X5+5+lGTL+TxBv+?=
 =?us-ascii?Q?tD0+WPhE0WaplgFO5p5n0Y73OHL9A8IfaJRf2c3Pa8DRgLSqwEIqXdxXa32I?=
 =?us-ascii?Q?8K9VY7XHCEuTeWM/YQ55HxgbsQgNmtKJva/Q3+MQuT0J109tUYs9Sl6jlyGI?=
 =?us-ascii?Q?aLET9TH6N6HzKatMSd+ZIoKLqsnx9Pv0+Nnd0mHUPgOPyxWXp8H97cdseZOM?=
 =?us-ascii?Q?wyjb6ulQtiiLd22ZL5I5toavy1DZj3V8BrEbJD8bGXhrx4ZcXPDq/uDrsUQ8?=
 =?us-ascii?Q?HkzzjLxGig=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa04e134-f43f-4b27-d93c-08da22458b4e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:45:31.3509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYmK3ADoTmr44cbSwqQrlVrhFswAUndmPrxZOW4t1dpz9XljCOldfkJTNLc4t87jztG4R8LTt56ijoStiDsAJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB3006
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: afK-JVD4e3pxOD7iy8ugyJQS9ogbHst3
X-Proofpoint-GUID: afK-JVD4e3pxOD7iy8ugyJQS9ogbHst3
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/pci/pci.h              |  13 ++++
 include/hw/remote/vfio-user-obj.h |   6 ++
 hw/pci/msi.c                      |  16 ++--
 hw/pci/msix.c                     |  10 ++-
 hw/pci/pci.c                      |  13 ++++
 hw/remote/machine.c               |  14 +++-
 hw/remote/vfio-user-obj.c         | 123 ++++++++++++++++++++++++++++++
 stubs/vfio-user-obj.c             |   6 ++
 MAINTAINERS                       |   1 +
 hw/remote/trace-events            |   1 +
 stubs/meson.build                 |   1 +
 11 files changed, 193 insertions(+), 11 deletions(-)
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 stubs/vfio-user-obj.c

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 3a32b8dd40..7595c05c98 100644
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
@@ -127,6 +128,10 @@ typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
 
+typedef void MSITriggerFunc(PCIDevice *dev, MSIMessage msg);
+typedef MSIMessage MSIPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+typedef MSIMessage MSIxPrepareMessageFunc(PCIDevice *dev, unsigned vector);
+
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
 #define PCI_BAR_UNMAPPED (~(pcibus_t)0)
@@ -321,6 +326,14 @@ struct PCIDevice {
     /* Space to store MSIX table & pending bit array */
     uint8_t *msix_table;
     uint8_t *msix_pba;
+
+    /* May be used by INTx or MSI during interrupt notification */
+    void *irq_opaque;
+
+    MSITriggerFunc *msi_trigger;
+    MSIPrepareMessageFunc *msi_prepare_message;
+    MSIxPrepareMessageFunc *msix_prepare_message;
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
index 47d2b0f33c..d556e17a09 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -134,7 +134,7 @@ void msi_set_message(PCIDevice *dev, MSIMessage msg)
     pci_set_word(dev->config + msi_data_off(dev, msi64bit), msg.data);
 }
 
-MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+static MSIMessage msi_prepare_message(PCIDevice *dev, unsigned int vector)
 {
     uint16_t flags = pci_get_word(dev->config + msi_flags_off(dev));
     bool msi64bit = flags & PCI_MSI_FLAGS_64BIT;
@@ -159,6 +159,11 @@ MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
     return msg;
 }
 
+MSIMessage msi_get_message(PCIDevice *dev, unsigned int vector)
+{
+    return dev->msi_prepare_message(dev, vector);
+}
+
 bool msi_enabled(const PCIDevice *dev)
 {
     return msi_present(dev) &&
@@ -241,6 +246,8 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
                      0xffffffff >> (PCI_MSI_VECTORS_MAX - nr_vectors));
     }
 
+    dev->msi_prepare_message = msi_prepare_message;
+
     return 0;
 }
 
@@ -256,6 +263,7 @@ void msi_uninit(struct PCIDevice *dev)
     cap_size = msi_cap_sizeof(flags);
     pci_del_capability(dev, PCI_CAP_ID_MSI, cap_size);
     dev->cap_present &= ~QEMU_PCI_CAP_MSI;
+    dev->msi_prepare_message = NULL;
 
     MSI_DEV_PRINTF(dev, "uninit\n");
 }
@@ -334,11 +342,7 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
 
 void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
-    MemTxAttrs attrs = {};
-
-    attrs.requester_id = pci_requester_id(dev);
-    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
-                         attrs, NULL);
+    dev->msi_trigger(dev, msg);
 }
 
 /* Normally called by pci_default_write_config(). */
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..6f85192d6f 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -31,7 +31,7 @@
 #define MSIX_ENABLE_MASK (PCI_MSIX_FLAGS_ENABLE >> 8)
 #define MSIX_MASKALL_MASK (PCI_MSIX_FLAGS_MASKALL >> 8)
 
-MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+static MSIMessage msix_prepare_message(PCIDevice *dev, unsigned vector)
 {
     uint8_t *table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
     MSIMessage msg;
@@ -41,6 +41,11 @@ MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
     return msg;
 }
 
+MSIMessage msix_get_message(PCIDevice *dev, unsigned vector)
+{
+    return dev->msix_prepare_message(dev, vector);
+}
+
 /*
  * Special API for POWER to configure the vectors through
  * a side channel. Should never be used by devices.
@@ -344,6 +349,8 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
                           "msix-pba", pba_size);
     memory_region_add_subregion(pba_bar, pba_offset, &dev->msix_pba_mmio);
 
+    dev->msix_prepare_message = msix_prepare_message;
+
     return 0;
 }
 
@@ -429,6 +436,7 @@ void msix_uninit(PCIDevice *dev, MemoryRegion *table_bar, MemoryRegion *pba_bar)
     g_free(dev->msix_entry_used);
     dev->msix_entry_used = NULL;
     dev->cap_present &= ~QEMU_PCI_CAP_MSIX;
+    dev->msix_prepare_message = NULL;
 }
 
 void msix_uninit_exclusive_bar(PCIDevice *dev)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index dae9119bfe..48d4bc5f69 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -307,6 +307,15 @@ void pci_device_deassert_intx(PCIDevice *dev)
     }
 }
 
+static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
+{
+    MemTxAttrs attrs = {};
+
+    attrs.requester_id = pci_requester_id(dev);
+    address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
+                         attrs, NULL);
+}
+
 static void pci_reset_regions(PCIDevice *dev)
 {
     int r;
@@ -1202,6 +1211,8 @@ static void pci_qdev_unrealize(DeviceState *dev)
 
     pci_device_deassert_intx(pci_dev);
     do_pci_unregister_device(pci_dev);
+
+    pci_dev->msi_trigger = NULL;
 }
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -2236,6 +2247,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     }
 
     pci_set_power(pci_dev, true);
+
+    pci_dev->msi_trigger = pci_msi_trigger;
 }
 
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 7002d46980..37538edb2f 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -24,6 +24,8 @@
 #include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 #include "hw/remote/iommu.h"
+#include "hw/remote/vfio-user-obj.h"
+#include "hw/pci/msi.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -55,12 +57,16 @@ static void remote_machine_init(MachineState *machine)
 
     if (s->vfio_user) {
         remote_iommu_setup(pci_host->bus);
-    }
 
-    remote_iohub_init(&s->iohub);
+        msi_nonbroken = true;
+
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
index f75197cbe3..70b4d8b9ce 100644
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
@@ -97,6 +100,10 @@ struct VfuObject {
     Error *unplug_blocker;
 
     int vfu_poll_fd;
+
+    MSITriggerFunc *default_msi_trigger;
+    MSIPrepareMessageFunc *default_msi_prepare_message;
+    MSIxPrepareMessageFunc *default_msix_prepare_message;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -511,6 +518,111 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
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
+static MSIMessage vfu_object_msi_prepare_msg(PCIDevice *pci_dev,
+                                             unsigned int vector)
+{
+    MSIMessage msg;
+
+    msg.address = 0;
+    msg.data = vector;
+
+    return msg;
+}
+
+static void vfu_object_msi_trigger(PCIDevice *pci_dev, MSIMessage msg)
+{
+    vfu_ctx_t *vfu_ctx = pci_dev->irq_opaque;
+
+    vfu_irq_trigger(vfu_ctx, msg.data);
+}
+
+static void vfu_object_setup_msi_cbs(VfuObject *o)
+{
+    o->default_msi_trigger = o->pci_dev->msi_trigger;
+    o->default_msi_prepare_message = o->pci_dev->msi_prepare_message;
+    o->default_msix_prepare_message = o->pci_dev->msix_prepare_message;
+
+    o->pci_dev->msi_trigger = vfu_object_msi_trigger;
+    o->pci_dev->msi_prepare_message = vfu_object_msi_prepare_msg;
+    o->pci_dev->msix_prepare_message = vfu_object_msi_prepare_msg;
+}
+
+static void vfu_object_restore_msi_cbs(VfuObject *o)
+{
+    o->pci_dev->msi_trigger = o->default_msi_trigger;
+    o->pci_dev->msi_prepare_message = o->default_msi_prepare_message;
+    o->pci_dev->msix_prepare_message = o->default_msix_prepare_message;
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
+    if (msix_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSIX_IRQ,
+                                       msix_nr_vectors_allocated(pci_dev));
+    } else if (msi_nr_vectors_allocated(pci_dev)) {
+        ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_MSI_IRQ,
+                                       msi_nr_vectors_allocated(pci_dev));
+    }
+
+    if (ret < 0) {
+        return ret;
+    }
+
+    vfu_object_setup_msi_cbs(o);
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
@@ -609,6 +721,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 
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
@@ -634,6 +753,8 @@ fail:
         o->unplug_blocker = NULL;
     }
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
+        o->pci_dev->irq_opaque = NULL;
         object_unref(OBJECT(o->pci_dev));
         o->pci_dev = NULL;
     }
@@ -693,6 +814,8 @@ static void vfu_object_finalize(Object *obj)
     }
 
     if (o->pci_dev) {
+        vfu_object_restore_msi_cbs(o);
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
index 3e62ccab0a..ad51ec0dc8 100644
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


