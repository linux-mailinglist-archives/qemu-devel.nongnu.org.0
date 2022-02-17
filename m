Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74654B9A83
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:03:34 +0100 (CET)
Received: from localhost ([::1]:44480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKblF-0007dF-Uo
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:03:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbYF-0004DT-Jl
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:50:07 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbY9-0004TV-I0
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:50:07 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H7nRW1010825; 
 Thu, 17 Feb 2022 07:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=kIO7ytcQa1owSWvuHF9yUxUxfZyJkZcHwXlzyyoRPvY=;
 b=n8U2oyjO2Qh4jd9tFgzfHQoOmkEdoEeVnT1s/8oKejGuVVcPyN/3u2Ggx0tsWeDRG7rS
 qf3vWR9ldbif8SpeugE+x2nTkHFxpziZlz28hnhiO4mWReuYwi+ByNhefhrfuJWsV7XO
 kXtzLfQCfx3WSgW3Lfw1dfD/V0KzeaHpXn6WLtZYleQ6RrxAkjxca3iuwSYhFSyjEfUk
 IS80Y8fgtD0G5g/0Xsv4IuKWPGICtXY6dGnK8JWQD3ZP2CPKQslt3AlsUbykyuID4gp1
 a/p3eGnBgA0ThT/x2KpndbBKAvrDAzhElmlIMQp9Ta5YiqkJ+ehSxpja049pUsbjKIKw bQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdmt40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7fJbN142777;
 Thu, 17 Feb 2022 07:49:48 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by userp3030.oracle.com with ESMTP id 3e8nkyqrvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzwhHTiIXhj+Su2oF1d8ImObgrdlmJxHf2XNK25Ylwj/di6XdcTO/s4ESEAoUERsLtq25KamPJshBldvD9yjDPc4HRsX0hyeSbaVyqWDd1vq5UgPfB50feAHiiVVvFh00CsakpswtM7hhFsMas93s6aIJrBFXR5VfQ3THnNOVBftbvRl1yaYSm3vhuqhPelhxJFhAeD/T7bcxUSsLqaHammMBSiDuo/GFbelRcXSFJD5yFDLfCCkgLn47fy4s3Db2MjxT5SRAuJZUa9NQNG7C8hXq7rbVGR+zakC5eQJFukX+kNQhnkRrsWNEqBXpMnK/9aIwZ8Hx+AETLCVdmNP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIO7ytcQa1owSWvuHF9yUxUxfZyJkZcHwXlzyyoRPvY=;
 b=DfbKXtB+CzKgwVp3BzI5CooLolRaRKFhjxvg3R0/tcySjFlWnWp/w+80Qv8tlcwiMq9a47OwJqrTrnCgm5iP0cyHZGeGg/S6POseJaZ389dY4fF99LYrM3rL/7Gpsb7IOtjyq6A/+tK0THPdefPuQhqrxoH5Zt32w7qQdaSXcTdGuTvpIsBveGza+t7oBNQkUyscXoyA08zO4FHcE2oIQU4fbgjyBHVlH0sxMr8Y27Vg3PzQjS1pnFEXEbX7XRlI8bECLmlBmdXPwbR2V41PMO4um2i6mdE2JGRpC/xfgw2w6JwjR4bmKRE1QoenWFc4gRNIGb8/KyinDoNf4bH8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIO7ytcQa1owSWvuHF9yUxUxfZyJkZcHwXlzyyoRPvY=;
 b=QPNGQcXzlrmYcBaj4aIL+3TfcMGjOM1Qy7QFc2eMvu38YBKWu0nbBjFreG/fHHSBLbjI7K/S8hAJIbODNpJUfOuvyJwpP90SdsCj+38PzTG+kfIiP74H+xeTPxCTHlAEmgISKmbK+jDZuxF/uYmZj7cyhv+pziZxFJIlg168Q28=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by MWHPR10MB1374.namprd10.prod.outlook.com (2603:10b6:300:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 07:49:45 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:44 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 15/19] vfio-user: handle device interrupts
Date: Thu, 17 Feb 2022 02:49:02 -0500
Message-Id: <ba5a32f3def72ce66a894191747dcafd63e7a517.1645079934.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: ebee9380-aa07-4f46-6f8f-08d9f1ea101a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1374:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB13745A90194C9D872A80254190369@MWHPR10MB1374.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:172;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YL+hvOhaQ5garXFJ7hDgU7mt5aVwOVQuCUDOKpuzXDAwdpLOFuvKDP43l3k4zk8wbk2THfT2FRRaHMzz6WwPVATisHZ0uBc0lYy1Mb6bifwHkUtjhFOaAr0ne6/fj1D4EaUzXiXoDb66HuIpeYwURCGfO+KflFEoJ+/c0+pQf5kESM+m8hGlCLSb3eLEQrHV384NnOClXfdNbF0ojzwoDkyGFHuEvJGmZixBvCfflkq90QNjes9h7vNloYHTXFo7OVKrQyNv8YAwERGorj3SY3bJVtTmHUjhxAlhvGRvQCEztbKdkTmzvPYEojq3zwC2EOJb8/S6/PghKOU17t2qgURLZ4EwZ4AA7BIDDr52aNMggko4tLHuPVcO7sbTM+3ij/mf5P7yEscVj0lBg8EiBdM6qsDrmx30ULp8ODN3mTZBBK63fr5H19WKCsHaDsYhYqIHMpexWmU47EkPyLvpua56XbsXqEaQNc5TKMWC0pzav1Ktnu8tzDELFJgxeFLepLLCYG6D5QJvAcHxWe1MrnEzXa1+bbsBCpPzaiDTyBE7n2uxIi3lZUl0zwo9U3A6nsFWITGAoiJ5U08jLelT7l5El1VoZztrnOMWeFeC5DiVijcbc+2BsqhT9LK7RPTSNkzR9Digv0hjt/ls5x8Y+ezfXG5k4LXXx5glBCTdzkHAQwCXpNpxvpTaHWnwdC+8Kuiqivwi7FArr9nERJw49Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(52116002)(6506007)(508600001)(86362001)(6486002)(6666004)(2616005)(6512007)(316002)(66476007)(6916009)(4326008)(8936002)(38100700002)(38350700002)(66946007)(83380400001)(8676002)(2906002)(186003)(26005)(107886003)(5660300002)(30864003)(7416002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ANtz+GYlKh13Etd5UdLSZ+qF6ctWCxJQn0gTX9mqb99eKyjUM3gI4a7DR1qj?=
 =?us-ascii?Q?MuZ3SxGEhsaaZhFNA2TbcvRlIo5oVdu1xBN/IjEmVgkoL0TpKlrb0SEdX1p8?=
 =?us-ascii?Q?N+7PI1U0pa6MXtL+D8WmXTDC4phwcl6/ly24Ur2RpfNagse7fCRyXfCou2Gk?=
 =?us-ascii?Q?07a8hnCDMe+HTDnBhMayXCYTRselGGqrKRjbf6b4m1pjhpK7F87d3l6OFnEl?=
 =?us-ascii?Q?soe0ytHVXKoUqVgziZV4MWofoOyiqxJAi3CaWjW3DfckdrLEdSuYNY8MPt5V?=
 =?us-ascii?Q?ipR56XxFZGnrl4Z4WgsalzM+x90sCpxOXJzp9LQ1nu2FXx8334G3HUCaqG3K?=
 =?us-ascii?Q?TZkIx0yt5RYCALaNvCE2GxWAKPvD+XJQwHA+RRhPh/wjd63Vsco0dq1/QwKu?=
 =?us-ascii?Q?MNIwSteOsyliqZSUGkjmSyQ3C3NEjThRpVunHa1ACnfbuuPV4cM+cQON0xcL?=
 =?us-ascii?Q?jz4icJWr2JVKKVUGihPMTNE6VDKsv9Ixjq2gFhBbx9pSJbEikn0VgHHHlMWu?=
 =?us-ascii?Q?+7IgU6jpTSVQ8elodGerkcusWpQWA2vYz2XO5L7Wv/Fv90XnMs4aCKRQaRrb?=
 =?us-ascii?Q?h06iP0+iORlfErqROcaKrrdDc0X4y3ozcQe4ZPb2g64jETn9LZoyzjnx/LMH?=
 =?us-ascii?Q?OOoXFPvgGDivtvpZqj7bSojtrTZc6gweWVjcAIA4+3Yu15xyt1cAUC/FYvNN?=
 =?us-ascii?Q?zOQbmZyzE+cEem6b36CQpx76AW5La04hET4zJ1aj6yzJ6s3ZbNF/sI2pcUIU?=
 =?us-ascii?Q?uvwCPD2R01+UtSXzODYcgG8YZHjOtyBVJ84BbmW4y1sM2TSX8W0WsNzZFFz1?=
 =?us-ascii?Q?qPvNh8IvLSKdMZk2eYXR8gz1W8NGHyx8yFFIObfOk0aWrSbQxNi3uhuQtslj?=
 =?us-ascii?Q?a8FaQZrPNoW7eJzRUjTeer5RcxZa+88mPC9IPze1kCSecLAdwe32Rr2zWpaq?=
 =?us-ascii?Q?4AojlTHRBOXGEEGQ0dsQPRg1pGYvKKZalfKqBHfv98vpFa6SqiSlf7rXnPHt?=
 =?us-ascii?Q?sJUxSwN2ADIFzRGAqQTq+LK3Jz+jE/iwZnN0RaIEUiqWLaT8pTo+rsKSBzGE?=
 =?us-ascii?Q?uIs2556OJ9gDvTKOml/cRYfWjZVnLL7yxSMCxsNsFzlKtKIdybMmJ3Qwli96?=
 =?us-ascii?Q?/DN0LpCz6IU869Fad7YTuQUeroJAUlFTGNnPXiR3fpezTNe2LeI5vGJSwCQ+?=
 =?us-ascii?Q?/pkXiMI5/ED8A0AjxtBdLS80txb3a0KcVsHsdBZ9glMr67l/PZaYL44YfR0t?=
 =?us-ascii?Q?a1bs/+iVCc4gt7AG7EJiHIec0DdA9RDj98NlNjC5sLzoVe23QiNx83kRugoq?=
 =?us-ascii?Q?g3lKWS1idHaz+1tTdobqVqQSnwIRy7n9aC4Rpqb1jThh6EquCCw0fL+2UMuG?=
 =?us-ascii?Q?SXVvcCHFdnKGvmRns32y1MutADxhTobg/KqpvhTpGkHAvFNO7AQDU7+3iMyu?=
 =?us-ascii?Q?upI5PS+apTwRFgMwPG7zbWM5b3ckjIObcxr+OETVLoETeny4ZCoM2yzJbXgX?=
 =?us-ascii?Q?dpMN+fYiW++qzf9LuR2x5wfc28uHoUJ4PRG52+SRJnFEDoyZH3/J9H1FH6kb?=
 =?us-ascii?Q?cM+t1BsidxfDCaTbFeccKvu3kglMMamteZRQMTl8LffNeW6rIEx3tMw1QXG/?=
 =?us-ascii?Q?NMwDcU7uyRyOdQK0VxCZlT8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebee9380-aa07-4f46-6f8f-08d9f1ea101a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:44.5538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: em0QN9Dv13RdC/8Pid8C+nvoiQaY/EEEIby7cYIARjbtIGFCX2bBKShUYfsfkhd1y6Qw7B7p8qguj5ASs/gekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1374
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: -rJ1K-pQfD7mu8lH2kXrmqTxuaXpHS9w
X-Proofpoint-GUID: -rJ1K-pQfD7mu8lH2kXrmqTxuaXpHS9w
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 include/hw/pci/pci.h              |   6 ++
 include/hw/remote/vfio-user-obj.h |   6 ++
 hw/pci/msi.c                      |  13 +++-
 hw/pci/msix.c                     |  12 +++-
 hw/remote/machine.c               |  11 +--
 hw/remote/vfio-user-obj.c         | 107 ++++++++++++++++++++++++++++++
 stubs/vfio-user-obj.c             |   6 ++
 MAINTAINERS                       |   1 +
 hw/remote/trace-events            |   1 +
 stubs/meson.build                 |   1 +
 10 files changed, 158 insertions(+), 6 deletions(-)
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 stubs/vfio-user-obj.c

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c3f3c90473..d42d526a48 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -129,6 +129,8 @@ typedef uint32_t PCIConfigReadFunc(PCIDevice *pci_dev,
 typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
+typedef void PCIMSINotify(PCIDevice *pci_dev, unsigned vector);
+typedef void PCIMSIxNotify(PCIDevice *pci_dev, unsigned vector);
 
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
@@ -323,6 +325,10 @@ struct PCIDevice {
     /* Space to store MSIX table & pending bit array */
     uint8_t *msix_table;
     uint8_t *msix_pba;
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
index 47d2b0f33c..93f5e400cc 100644
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
@@ -332,6 +336,13 @@ void msi_notify(PCIDevice *dev, unsigned int vector)
     msi_send_message(dev, msg);
 }
 
+void msi_notify(PCIDevice *dev, unsigned int vector)
+{
+    if (dev->msi_notify) {
+        dev->msi_notify(dev, vector);
+    }
+}
+
 void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
     MemTxAttrs attrs = {};
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..1c71e67f53 100644
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
 
@@ -503,6 +506,13 @@ void msix_notify(PCIDevice *dev, unsigned vector)
     msi_send_message(dev, msg);
 }
 
+void msix_notify(PCIDevice *dev, unsigned vector)
+{
+    if (dev->msix_notify) {
+        dev->msix_notify(dev, vector);
+    }
+}
+
 void msix_reset(PCIDevice *dev)
 {
     if (!msix_present(dev)) {
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index db4ae30710..a8b4a3aef3 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -23,6 +23,7 @@
 #include "hw/remote/iohub.h"
 #include "hw/qdev-core.h"
 #include "hw/remote/iommu.h"
+#include "hw/remote/vfio-user-obj.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -54,12 +55,14 @@ static void remote_machine_init(MachineState *machine)
 
     if (s->vfio_user) {
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
index 2feabd06a4..d79bab87f1 100644
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
@@ -107,6 +110,10 @@ struct VfuObject {
     int vfu_poll_fd;
 };
 
+static GHashTable *vfu_object_bdf_to_ctx_table;
+
+#define INT2VOIDP(i) (void *)(uintptr_t)(i)
+
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
 
 static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
@@ -463,6 +470,86 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static void vfu_object_irq_trigger(int pci_bdf, unsigned vector)
+{
+    vfu_ctx_t *vfu_ctx = NULL;
+
+    if (!vfu_object_bdf_to_ctx_table) {
+        return;
+    }
+
+    vfu_ctx = g_hash_table_lookup(vfu_object_bdf_to_ctx_table,
+                                  INT2VOIDP(pci_bdf));
+
+    if (vfu_ctx) {
+        vfu_irq_trigger(vfu_ctx, vector);
+    }
+}
+
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
+    if (level) {
+        vfu_object_irq_trigger(pirq, 0);
+    }
+}
+
+static void vfu_object_msi_notify(PCIDevice *pci_dev, unsigned vector)
+{
+    int pci_bdf;
+
+    pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)), pci_dev->devfn);
+
+    vfu_object_irq_trigger(pci_bdf, vector);
+}
+
+static int vfu_object_setup_irqs(VfuObject *o, PCIDevice *pci_dev)
+{
+    vfu_ctx_t *vfu_ctx = o->vfu_ctx;
+    int ret, pci_bdf;
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
+    pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)), pci_dev->devfn);
+
+    g_hash_table_insert(vfu_object_bdf_to_ctx_table, INT2VOIDP(pci_bdf),
+                        o->vfu_ctx);
+
+    return 0;
+}
+
+void vfu_object_set_bus_irq(PCIBus *pci_bus)
+{
+    pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, NULL, 1);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -559,6 +646,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 
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
@@ -612,6 +706,7 @@ static void vfu_object_finalize(Object *obj)
 {
     VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
     VfuObject *o = VFU_OBJECT(obj);
+    int pci_bdf;
 
     k->nr_devs--;
 
@@ -638,9 +733,17 @@ static void vfu_object_finalize(Object *obj)
         o->unplug_blocker = NULL;
     }
 
+    if (o->pci_dev) {
+        pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(o->pci_dev)),
+                                o->pci_dev->devfn);
+        g_hash_table_remove(vfu_object_bdf_to_ctx_table, INT2VOIDP(pci_bdf));
+    }
+
     o->pci_dev = NULL;
 
     if (!k->nr_devs && k->auto_shutdown) {
+        g_hash_table_destroy(vfu_object_bdf_to_ctx_table);
+        vfu_object_bdf_to_ctx_table = NULL;
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
 
@@ -658,6 +761,10 @@ static void vfu_object_class_init(ObjectClass *klass, void *data)
 
     k->auto_shutdown = true;
 
+    msi_nonbroken = true;
+
+    vfu_object_bdf_to_ctx_table = g_hash_table_new_full(NULL, NULL, NULL, NULL);
+
     object_class_property_add(klass, "socket", "SocketAddress", NULL,
                               vfu_object_set_socket, NULL, NULL);
     object_class_property_set_description(klass, "socket",
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
index f47232c78c..e274cb46af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3569,6 +3569,7 @@ F: hw/remote/iohub.c
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
index d359cbe1ad..c5ce979dc3 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -57,3 +57,4 @@ if have_system
 else
   stub_ss.add(files('qdev.c'))
 endif
+stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
-- 
2.20.1


