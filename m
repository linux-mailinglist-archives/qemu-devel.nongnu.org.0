Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9362A51E398
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:33:36 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnAGF-0003qw-NW
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABU-0004tD-TY
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABR-0002T4-8o
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:40 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2471uQRj027467;
 Sat, 7 May 2022 02:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=PT0kcUKTqXifSrWVO280f2P93PTUtAgbpG6/XXG1RCw=;
 b=cQXHrMYJcIkCL57pB4TpNU1hneWzEQaClhx7+5mdB1l1dYO6emdkycBCFLS0CyQLHjkO
 4lcU+NPhCrEIkqTcQMv0n/J0MMrs8RAj/1jieGKibMCa7mEToQ1kSCYP60MUCm2I/apE
 D2koi/8yRuINYgdDRl7N/gRwuuI9Z5vzR7Qsvbuf/lUQy87jC3qAuNzCAMlFzzgtsEXH
 2krX19qhMHy4PuvtadvMJar/kdcC6btmqW+g+6OkoMvjOMy0jaeuMs0QaaVW5GPrzJTa
 cGc57QzookiGzgMYHs8hL4EIcwvh/NewxnQlompVI99Y1ThcdigVmOLfY3dMpIEa7VXg Rg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwfj280pt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:33 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2472BQES024288; Sat, 7 May 2022 02:28:32 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf700tpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJA8cJJbklT/+G3oy85Bz89LJWt4+lp9Cyyfu0f5WifN1V0w/IR8/PqvlanzdCzIQ534JpZCbgmcSB14yJqmAiCMZfSbnhm4IhGH+vbuw7I34YIXVDbpuSC8Bc6Blg0r31EpOd1PWLrxdDvZRiLtGATON+Nr5Mw6G2+xnpUtv9KGHJIPOSqDFPqFTr+kjMWFzOWCdVo/66XqrbVMlgofJZ6heRpMdp3oUIGzjd547ItqSkTHM/GqcIpJEnbayMYjd3iZT4+274r2iHCYvuYROpglLf1lIMU99qI0ToKoheEPTwLZ2HfPHBIV0ENO7ViW+ILJnnG1FiVUaoXJrEuzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT0kcUKTqXifSrWVO280f2P93PTUtAgbpG6/XXG1RCw=;
 b=ACtCnT32ymNyHFWtJ35WLDQlYm6vz5smv151RtVV1wfy7Ew+1tcpmgGPemdw7v1V9qaoVWcePoe7jeKpcuQU0aicdU8qz9TmNeYPhn4buShXLjJuZANUYx+kZv6yaB98wpPZWtbYPcDdNGkOikQoFIoc5Uja6ewroUHxYzlZozf5WUS85y/LAzMl2EW4wCkQiFWnJnA2OSaCLxFsYobbdOc4GXbCKdklbpCDOPorcsoyFt059xIKnvy6mbDydOv6+CY4tR8ljPymJgNsC4GzRxJLRbVcc4FrlrVITHRqmn2nGQJej6elZfoA4KmiWGgzLTksd7YmH1+0S56PDhVbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PT0kcUKTqXifSrWVO280f2P93PTUtAgbpG6/XXG1RCw=;
 b=Tfe0EpvKbXsCXhlFmX4DsIrqfsGCNYw/F73c3Pbo6M3inJYfc2CMkLtQW5GLKi7yWODUTM0zv2K3oRSL+tRPZv3WZ6HDWerMaGc+UUbmivTfybWvex2MWngVzrxbvvxL0X4vQNzOCUdG228dy39TRjdEeRC+0Wvu9Hg7r05vmYI=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM5PR10MB1370.namprd10.prod.outlook.com (2603:10b6:3:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Sat, 7 May 2022 02:28:30 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 02:28:30 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v4 2/7] virtio-net: align ctrl_vq index for non-mq guest for
 vhost_vdpa
Date: Fri,  6 May 2022 19:28:13 -0700
Message-Id: <1651890498-24478-3-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
References: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:5:100::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e1b554e-787c-44ef-de09-08da2fd14668
X-MS-TrafficTypeDiagnostic: DM5PR10MB1370:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB13702269F1D3E6508881F1A5B1C49@DM5PR10MB1370.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 462cilQ0Jk90mvccIdw4M9u+WrAVB5JEd0QRG1rus/yvU5UNWO9IxteVjzpe71ZrNnbC8UjhnIk3YI8XpF1qFOZEStygBkOTc7wlXJMF5wq/ByBX2Yw0NEBBRJ+N8dhpHAJ1qRMh2hvVoap+3ZdKWR1RhglYzE31BkSoVj5+3lu7Zac285hEvu/z6qBJl23jaw0Lq1jvY+8RbNgqZSZmINQRtDtB0YQU2/hrU+0UDcNnqOJhEaXqTVPXxQ6HifEQYpr+v1dnSfdqtsSfPLWgqni5mKrDa1ziD0bcLl8yqfgQOYNJqH7Olm4AnYnl/LmgOdzzrGOzLuz0AazTCW0cLsfE5efDiQQnSC+RgbgnaBblhN6EXNxMHJtol9/g5r7UxvaKjVa4ZqrFzY1K1PGSlD8OC2PHi5WAcd1L4gn0nYTKNqAk52/GOPjZRTmN81yIh4f5uCI+YwC7zbLNr3ADMgr79yxtK7l11PFpsNAQluLV2PwUUqMr8ZrKf6JFNR5bmzs0it2dCFNDmtLhhS9OIax1mCXHcMIw2DwEwmq4O7fISLk36qZTdmdeMvxBWaahd1z4URgECVhLEmUKnswxRFkhJtSkkapAqYYCTzwns7g9gf7iHqM1hVVBbCPPWkTON69qG7p4Fj4/cmL7tVqd8cHB243kd7wv0+GQ8X3tZ95XrbbMXkVjpveDtL+Xcf+Y+eCFMW2kForuv9yk8SWqCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(52116002)(6666004)(508600001)(5660300002)(6506007)(6486002)(8936002)(186003)(86362001)(38100700002)(38350700002)(2616005)(316002)(8676002)(6916009)(66476007)(4326008)(66556008)(2906002)(66946007)(26005)(6512007)(107886003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nZz4F6ac9gPwy2G3gudlYziXE6DgIzebJ1MiokSGnaY8dtQ+/JCm7KNRf94u?=
 =?us-ascii?Q?I7KyGMZCj0q/Scwb829s2X4kYDRWecnDrAWKQLU7SwhJoPFdzqh2NT98WqEw?=
 =?us-ascii?Q?8hKdmJYwUgj7jwcBtnX6dxqJ4i0cYnc3M9N6McXXkLpGKXzNlo2tc3p9g+t8?=
 =?us-ascii?Q?4NAhGt2mjIjWnvG2Ak19ahAUo8pF03fNlYHrtzisXZCKY/nVeIdiG0gaOmfc?=
 =?us-ascii?Q?55Q3AT9XlwPmuX1W24djotssEiLZuUqRRUscXhFxm6lvhcXtbyR2MjNsAQn3?=
 =?us-ascii?Q?C03UUCkBWgZ8p0YDlB3QrvC1c3UjYrtuWm1Y8DE6EpEEgmR5enoopSK/dMIu?=
 =?us-ascii?Q?0QqCn9Jo6eHc/ynDRNP8JDNaawVI1EBQ9vGxLZadYjj313vKkPzFQc7tLgMi?=
 =?us-ascii?Q?wsaJQdbhNnxZP8GqKc5QATVP1HgHYKUaLKe4hBZ8Jxwh0Sru3rB8StFFGWrp?=
 =?us-ascii?Q?WiadJCsIPU7x7kObXXz137AFtNmHym/5xMdmIhi0FWYekLioo890EiGnHLWi?=
 =?us-ascii?Q?F4tgL8HOea9BFQMEioAJurpvmAzooHfKEL7WSPlV/o59gnXthM8GPO8+f652?=
 =?us-ascii?Q?KI4a9VSCoPC7EioNi4M+Rw2iksrMEx4o+J/IAsvKyolcJEr0PQOnZLEE3Jxo?=
 =?us-ascii?Q?sxuJUMM9ugBOP/niBbmMeFKl1Fz3b0NqeEsBrBjPqRrnjd1B7Lwsjyc4xibm?=
 =?us-ascii?Q?CaIpa40D3ohaBEaE2imWIko9hag9IuG2w3sFe08eq1XUOEpAGAr5boq7NTcX?=
 =?us-ascii?Q?1Us7WQ2Tu/9uqziq23HWgED/4d1skKl7P71J8tnFSmMvckEB3m9qIYro38jj?=
 =?us-ascii?Q?Y6o+O5n7+6wG2KP1qwnlWXu1NZPMxw8ANAEhw2hHs3AUEotc7f6hQyZSfqDV?=
 =?us-ascii?Q?a4gnrGsrriHpEDXZeNfl8X24HFOtBIW1VRrRp50dkWnMo1HVURA42lvOj5Qp?=
 =?us-ascii?Q?4RVWVJoJrJEBUalh9aSavCXis9+qUPxlOViFtAnFASPppV3X5auJVKQDad/Z?=
 =?us-ascii?Q?pJ0aG6nYSxe6huq3UEPqNdeS6+h+TqIza3V82irF7IBogxRdwSR0hq0b8hf1?=
 =?us-ascii?Q?4XkzgfgHCBtFX/hYWKajBLx4GyRonrWUFHjr7pDmYIP881JCqyIqSfiACrME?=
 =?us-ascii?Q?6K4WhWGRbAF6TGGuFUvu8M2UMbutMdkg8oLpJ+62UmFhZr1Eu4aOYfCHDigO?=
 =?us-ascii?Q?dyQuqVHxDfO66pwoNcx7sErXOriqzOhQVlvtp4djJtK7X73QAFDTgJAMPsfn?=
 =?us-ascii?Q?zC3mX1PqGS+BEu8X1yB6W/yAlQu9VNRnmasAqhozoxFvePJ6PZ7LBSBkHn3P?=
 =?us-ascii?Q?9yOg+yQRw4go+6Na+BNqBnsXhItb0ABnZx0ZHJBHA84xUYdKilbI5+ke76PL?=
 =?us-ascii?Q?IAYIu/8T7i+3d9YGfaDiUNOHfkFQtJHJ+Eve7V2ChsF55nn2Y7NcpmiOzeVD?=
 =?us-ascii?Q?DejrSqaPck6LKvvI8XzPD3EiXBHgGyIYDgjyAmzwerFQj6odSc2F+886s845?=
 =?us-ascii?Q?p3/jAo59SLfd4GRrsNS6V6+1U7K0t4/sTSVMT4KzdjeKyvwzjGkMVzYHdkkJ?=
 =?us-ascii?Q?H10iYsU3eqUAgV2oUd9K1s6I6Z4uBMX/CgItJ1IRkt7jqhZQ97xiaW8quuBR?=
 =?us-ascii?Q?rWl32g433P+XAdTt3JYZONX1Up4RDdTWnEx8xPyyOTKdtdzl11k8SzSIt3nx?=
 =?us-ascii?Q?cjKRETVybxEGl19J/ca/xcBbDoPF6EL1y/ov8MrjWY8bZpSFcp1RZLbw4Xj1?=
 =?us-ascii?Q?UqipTgGl0TzMhse+vRbGLY1Ct15lbW8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1b554e-787c-44ef-de09-08da2fd14668
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 02:28:30.3075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YX2itu6I67ZBct4N+n6eSY8frxgntE0p31ZaYJGJK26TWOxUXGU1yHs9Y6rL8AKp7Xopj3Ed5wBCcBNj7ruyrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1370
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_07:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070012
X-Proofpoint-ORIG-GUID: GlCFG5-b0ekb536C6pfQKfh1JMEFmmM8
X-Proofpoint-GUID: GlCFG5-b0ekb536C6pfQKfh1JMEFmmM8
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
Acked-by: Jason Wang <jasowang@redhat.com>
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


