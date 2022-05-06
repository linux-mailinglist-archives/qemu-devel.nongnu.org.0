Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F6051D069
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:58:00 +0200 (CEST)
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmq2R-0006sY-G0
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzS-0004sl-EF
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:58794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzO-0004R9-92
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:53 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245MEZ2U026114;
 Fri, 6 May 2022 04:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=fEPFWGbZ8+IHsjEeFpB37DX6xH/iWUNvL2PJ8TmNEeE=;
 b=wz8GIuZXJi6CBr7GVAh+H2jRLnWiGnRXb+V0yRQxgwunwhnmktnc+XoJMF3CnzRyGyHK
 b4Z647rIeP5tL8/M3s8ZK4IqCL9xeY2yTT+LyETU2p2WQ+FJ+KYij0cxFOfLExb2Prbl
 ZzYsaJ+y0U842X6hQIA2wyfMHtZcHx29Ri6/cJ7F76V221cGB07WAEVbCsUqXNLFhGnE
 P4igV+i6NkbDvXsh5nHApCoCB7Iwbxr8mKCq/Szc20uhKZ11f/G6UMJrfFMp49NrU20V
 VlFeiLpjnZPpVabQfnAoBqa7GODVSygO1U7ExNjWQfsgVf+qVhpJz5M4kojflkihV/LW Ww== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhccuc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:46 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2464ovZU016814; Fri, 6 May 2022 04:54:44 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj5htmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l428MROl0aU0w0QCzDiOIkN0hsAP/datAMgyUNFxWDZjSR8rLlxHUlOQ4uQALQopGcQToGi3nM32uhSjC3ylCPTUcimrrdmVyF29G/JtkQuFAPHHYCiVcJfI3zm9swFqoZYT2/tEZXo0EEpqNaoOs36nHigcxMy1cqIfMdphjD2K89CEzZ4aAOEQnuTvJ5sBjn+rOcigNVPeCZN+CfgHYQ8oXOyEmUdXYOmuuYulx/GipQ2MiW6JtD3xdqvHzL3znnZnPKy9R/nm4+vLJ2Xl54oQRdxqwNPPWHDWnvjSTgFFyQB7NghiGjeACtyaRad1/aX/27eazkc4sPdU/4ZFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEPFWGbZ8+IHsjEeFpB37DX6xH/iWUNvL2PJ8TmNEeE=;
 b=UMMXvUQIfjgyoCy2pKOpECuyXe0A6HvBHBW7fePE+KzYdPyNlHwALhy3SmyILWxVctPiCRYVWrupxgQRw4E8jhiAWNAeBiJ4Lk1Ww/MuAAR2nrNlseO91NFXDc+34F+RcRWHq1cStD3fV6evsETJg8DhOPnKcmhQD9PWqHuNaLTdOFUsP34Wt3SYZct9nL0dx/Ti+NR8OXGCkO888mpYORnt6MSDNhrvg4vpqMGFes1ybZTyzR4bWY/MACdPqTfKJy9IlgZGxwLwSoo3f9UuolcIq2X+EneyS0biG6nu696//0dYZcqvUCHEloARD7V+eAS1IxgrNW8yTkHFzL/NJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEPFWGbZ8+IHsjEeFpB37DX6xH/iWUNvL2PJ8TmNEeE=;
 b=USDT8aQ/2p0FUG5N07x+OKkeA+grJFjFSzncNG0brP/vhdFS2XZBG1Z+VYLnqUclV+vb3YUFvZascI2Tl5wNUDyyxVBEufAc5ybyLmGtaQJU+gRuVa5TGieNZqyGrjmxsl6az9U0YIZixxqNjztL1yMJSZAtMhHXxYAXBEKbPew=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB1416.namprd10.prod.outlook.com (2603:10b6:903:29::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 04:54:42 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 04:54:42 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v3 2/6] virtio-net: align ctrl_vq index for non-mq guest for
 vhost_vdpa
Date: Thu,  5 May 2022 21:54:30 -0700
Message-Id: <1651812874-31967-3-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
References: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45228081-b607-4647-afab-08da2f1c8860
X-MS-TrafficTypeDiagnostic: CY4PR10MB1416:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1416DE755171A84701B3E68AB1C59@CY4PR10MB1416.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HMusEOkPgcadyYiKO3732DoE3tWQgV0TJwSbu0h8QNrt2oOizOYwd08kOa7IUJb+B0yr790Pyx3aGT22C8DI8X4Xog8DDyqC9EVitoRaznqse/O4Kk6UVfCalLIXqJT06hixvEECOmhbWBMcFCpPzZrJTh2DEcGKKloQi5YKXWhXy2ls9bPKhRGFW0hC60udpIBhujtxDWYDXKL0fJhxpaq2hF2DglrqYvYzaD/A5uvNMhzvLWNlpz67M23jupuiM8qzyMZKjE3Sc3SZNUJba7ShM6DyOQU/GKTiyjqJ89DL6QZmH3y+blixJVhRcjwa22GIHsF0Kgl+0emBbJLJPhCptPaco/EZkyAGI0q1bxgs/O4pLv/z8O2XXTH5C61u6yjpwE5/2L3BpMpnLooO/uNDd2JxHsw7Jg/aJdeFyogQz049ZU4tflTjdWSwDkJtc1klbHTkOnimeD11rhdUrl1SOX8CxzDWz8+BMzK5bsxkhgPJ97EgMESgFWb0Mj9pV5sHlByOp7XunrnAaIdjpFe6onsS5z8bd1nRuisZjrS+bVfZ5wFVT1qwHwRAbZaMF0JCpVKSKndSC/G/Vp6NK0cYSoslH8VsqRcI41NhuMrsEedM99IT704LxSRVUv+dP3EpPIrZaTGUdJFIbr0N+P1SHeaY3ORDwoBmuNiaaYfbkqupb/SBtAFMqBT1VqHgpkJdqO673IyOaqaLyHZkqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(316002)(6916009)(5660300002)(8936002)(186003)(2616005)(38350700002)(38100700002)(107886003)(6486002)(52116002)(6666004)(6506007)(36756003)(66476007)(66946007)(66556008)(83380400001)(4326008)(8676002)(508600001)(86362001)(6512007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vz3AlC6yA6HkPi4gKfse1XpQiAO2xmrUM83yA+PPXbxXj5i8SBNRVEkUMSvD?=
 =?us-ascii?Q?k6YCekLFscrQL5DohSx1bwzT7CtTS9RwvUD5wqcGGLN8RC0Ku3t7CHCOQdUQ?=
 =?us-ascii?Q?zga6cMwss1rW8cwixo2HStxTGRMp3mzh+yWCODqhX+SsVr9xpgAISGACh8HE?=
 =?us-ascii?Q?kQMVogItUEMmDUuIsViDjbypd4mjWbbSzb5txigZoCQ5y6T56nlUumvnmfoN?=
 =?us-ascii?Q?wlI8/PkHakjjPl4AGLMu9UPfGNl5fSe8aUAUL8rE3OMyZWZmy49ayuoX9Fbh?=
 =?us-ascii?Q?7auAIhm7WDlKWmizFpXv/XmYRXEFBQ3lxmULIEHdewxXfWMatvnPCvZPnP5v?=
 =?us-ascii?Q?amJUqbBl7Bkg3PBpaL95zGNXV0V3ObDFYHwqcBEA5yGayi5YVvapZYEmw/kv?=
 =?us-ascii?Q?bH+c3NykimRGgpkY/zqtQDt4AU65Lb1sY25CxyaektEgJolFnjpunv8moEuF?=
 =?us-ascii?Q?Y/eQAh9n7Mi/lg51sVcD+iEdQinYjkHuIzN6Iq4nYI0NuMF+vHQOLvO2LsoH?=
 =?us-ascii?Q?LMyHoWz9AeSNc4zi6M/tf2l4omC7yI8LDX3eCm0BlVItLys8ZWgKJg8kVGmH?=
 =?us-ascii?Q?zXxNBhAgjYb/LVdU+RQXI2lMn57t3araQTOVW4ESKhkcr/34IPhCTxBfFpK4?=
 =?us-ascii?Q?WJqN/2dwzDB6k4P7NzgfXkTGFUZ5k6f00zSyN6kmV+T0KsF0GZYlkymVaCiP?=
 =?us-ascii?Q?YWGVXRyxWzjE/4v/1huL9wU1NTfPW/jQe4CGkwL4meEv0pNL5s71I1t6pZf+?=
 =?us-ascii?Q?bO9yKnimwlDKSUCppfSk7Lk2IOGopG6QHJAzr0v1qBZAr9Cj53kxrO6mW/ys?=
 =?us-ascii?Q?ZhIEY3vmDN2Le1K0EJRGH6XQ/1PD2Ku+IXpx30D+9vpWNKKsu/2HsvS4BzkH?=
 =?us-ascii?Q?thVWAIKlAGet2iW5cpw6jQpshUz4a67bv7Od6vYJCC6Jx6uzm05RzYP99Try?=
 =?us-ascii?Q?8Q69R1RnGAhzE2pmehczYKwjCXr9LjB9WFcH4Qy930Y2+LbN8o0fYjE623PJ?=
 =?us-ascii?Q?wotLLz54v8pWsS9SapedHM/ChIOYYS2EFvO89yMOWYSx66fFUnCBW3t+bn92?=
 =?us-ascii?Q?NsG1Jlhd3KRoHe3JSxZdnL+G5JfUaABXZ8GKPXAoZcvZ+b24j0v7wdtZTEkJ?=
 =?us-ascii?Q?63Td7qlBF7TY+1sBEGldhwTXrDFAcACrjUjMuR6SAW/vri0gp9NoCc5aR6pE?=
 =?us-ascii?Q?cUTBQef4A+jU7ugtLzYi/72juKyTaz+wXHQp98nNp+K4c3k0DP3VFJOenWf7?=
 =?us-ascii?Q?nTNvVMgllmvvtyxWGVEth2YUumJQVYaMHySeDoT+LvkV30/TMyYqffwWIfNJ?=
 =?us-ascii?Q?id7NAJB8Vtrn34bsW0TPFDjYfYL6DGBrZGAXW0vV8rN5g3ZCBfo6u75ttXcD?=
 =?us-ascii?Q?4Djnhc3ZbeB4Or8c5Q04yOBQPNU1v9oFQ/EblrIIB4kQVKOH0Z6SkFINCOfF?=
 =?us-ascii?Q?mXZpN32DB8XH2H4wipasKL+d7koLGATKQTEvBg2Vg883UZinSa5eBUk/zkRA?=
 =?us-ascii?Q?HFX8BM2Ig6RS9VHR7HROZN9aIM0XJXQDdtImFf0vFF4iyixgHpPvPl1U2brM?=
 =?us-ascii?Q?NDWdw/G41+sU7j5Gkd6ayRV0gBr0+vDggOjHwLhf5eSyzKuHKBny/wUYdRO6?=
 =?us-ascii?Q?phPlLzAtZvE0nHs2LVcCkDMJ36sRlht/kqWnp/ZiLSttgDt15rOCPLxOVx38?=
 =?us-ascii?Q?Jl0lCRACAsr1xXfGGr/6/c10y5meJNFswm4KJw1163mrnDTKf1rLIqPGXoCD?=
 =?us-ascii?Q?XlEAw6wxlXbVNeEkW3U5fC1kpVJMVdM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45228081-b607-4647-afab-08da2f1c8860
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 04:54:42.2005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/epdJhw2nEqj824IQvhdmoNsOT5RW6YzIC4AdzCmzvXC65qHdDU8tZ5CPKMKypHrw3GtwrpvVoyOzjGkAbpFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1416
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_01:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060023
X-Proofpoint-GUID: WULJ2Ao8mvhUKA-GZG1WnWiSvGS7UBaL
X-Proofpoint-ORIG-GUID: WULJ2Ao8mvhUKA-GZG1WnWiSvGS7UBaL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With MQ enabled vdpa device and non-MQ supporting guest e.g.
booting vdpa with mq=on over OVMF of single vqp, below assert
failure is seen:

../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.

0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
   at ../hw/virtio/virtio-pci.c:974
8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:361
10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
   at ../softmmu/memory.c:492
15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
   at ../softmmu/memory.c:1504
17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
   at ../softmmu/physmem.c:2914
20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
   attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6

The cause for the assert failure is due to that the vhost_dev index
for the ctrl vq was not aligned with actual one in use by the guest.
Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
if guest doesn't support multiqueue, the guest vq layout would shrink
to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
This results in ctrl_vq taking a different vhost_dev group index than
the default. We can map vq to the correct vhost_dev group by checking
if MQ is supported by guest and successfully negotiated. Since the
MQ feature is only present along with CTRL_VQ, we ensure the index
2 is only meant for the control vq while MQ is not supported by guest.

Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 hw/net/virtio-net.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index ffb3475..f0bb29c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include "qemu/atomic.h"
 #include "qemu/iov.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "hw/virtio/virtio.h"
@@ -3171,8 +3172,22 @@ static NetClientInfo net_virtio_info = {
 static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    NetClientState *nc;
     assert(n->vhost_started);
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
+        /* Must guard against invalid features and bogus queue index
+         * from being set by malicious guest, or penetrated through
+         * buggy migration stream.
+         */
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: bogus vq index ignored\n", __func__);
+            return false;
+        }
+        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    } else {
+        nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
 
@@ -3180,8 +3195,22 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
                                            bool mask)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    NetClientState *nc;
     assert(n->vhost_started);
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
+        /* Must guard against invalid features and bogus queue index
+         * from being set by malicious guest, or penetrated through
+         * buggy migration stream.
+         */
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: bogus vq index ignored\n", __func__);
+            return;
+        }
+        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    } else {
+        nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    }
     vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
                              vdev, idx, mask);
 }
-- 
1.8.3.1


