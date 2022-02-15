Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C34B7415
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:25:45 +0100 (CET)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1aC-0003Fa-Il
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:25:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nK1Y7-0001iY-NI
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:23:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nK1Y5-0002fn-2w
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:23:35 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FEi2Io027357; 
 Tue, 15 Feb 2022 15:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=6vQeUXXhEu5z0qsVHIRkr5kKo4ZvaSEjxyMykhmYCG8=;
 b=wMl1NcBuIonoiNsDvxYKr0HN7gjiDbg1alO+XBLiVRf/ksOXrKlpfhzBQZemwIUZPhQ7
 1tb85UCoIIHdTp1D8b7HJV0vjJzd0IOeH5EIn5AtrSDOYsC1NM68EoJ6zQLUhLgyauBk
 mUN8u0PEKFQRuqsbPHTa2uAItNlo4nfY14tG6CrBUVCEgjZVRA52+VAJC0YUZ3lR0dzO
 LbqDgHoZWWiSNuLp4IUN8NmogOSLbLEw+2ChnralaS/KZFwjhdx14gM7PLhEqturxM3d
 pTaD3N4YJIA4fdGsI8cmITvOwrNy/YWIomh6VH25DofCTqIh2UgrV9ID0TNu78DidUMG gw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e820nj0wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 15:04:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FF0UMv008531;
 Tue, 15 Feb 2022 15:04:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by aserp3030.oracle.com with ESMTP id 3e62xerfe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 15:04:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aedskmy4Y1nrHv9qI9zCH5cUt1euDvtJdiopLgG04Ue0M2z2JuB1CGkpd+k/5bdjlh4FkOwyh/cbnzsrfZJlW2bZIxaqzyEdBZn1nxVQGInihUCRJ/MfjV3phA3OiwI6wV5RDhpHnoSuUoc45doee1QY+fY/9DEK69SRZZJn9kxKUfznorTPCUAEJGvM5vZ3ZOPV8cmJ7WawREt5Nkw2RYOwZa0gAfayWuIB/bU3CCdF3J1q1dQnpxEyWnijtfkFH2ZI3vTjYSSZc0/CZxnt0k4QnkXbroDafBK0ZTBeqk50wr3nNj4ULf044KLmS8ORIsZYbyVQ550O0bIL9B2TSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vQeUXXhEu5z0qsVHIRkr5kKo4ZvaSEjxyMykhmYCG8=;
 b=alMx4gXwqh/zhV7JheKxsrtUGJn/59vDOd7X92xsux3CEtTqoG1Z5Rg5QoFoBI+RABjXMS5hsl2pxueUVeQrf/7tckhth24fTuouqbnwy7BFy5GTlO4pdyd3VlQrZzhDccua/4yRw7bAT33sNDQ3sGtpPxE5RpyiEHY7o6LCg+YsWyYUWlE5nniG3wthx4zTVCMa3hqvXXsXT/ArWlIRLFWQlTV+R91jF8ny4OpL+FbAggOQOPxrFkHuc8SURWdQc6DvbBWoCCs8rmuOi2HjCPLlp9oszX2eCZdFOkVk8fkIMDlfVuwX5kw49tUdqk3faGMQPsEWT4XYeD2pEaBy9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vQeUXXhEu5z0qsVHIRkr5kKo4ZvaSEjxyMykhmYCG8=;
 b=GIXPf3DslFSZBZo3ecuR2HXAdMxr1ibPIYAbRoDGyvv02MfhqktzYw8ebu/BULJS9BbayTyW6VN9Rwji/jKKpDG5c596XGJC2N0l1SLf4y+iByKLXDC9m7oo9F8x/9TPJZ2MknMrLuJYgO2B8tx6QAchaj1ZL0ONw+vmUOX/qJY=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by DM6PR10MB3865.namprd10.prod.outlook.com (2603:10b6:5:1d3::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Tue, 15 Feb
 2022 15:04:40 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4951.016; Tue, 15 Feb 2022
 15:04:40 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] Support fd-based KVM stats
Date: Tue, 15 Feb 2022 09:04:30 -0600
Message-Id: <20220215150433.2310711-1-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:806:120::13) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 143e4f7c-bb91-4a12-1dbc-08d9f0947dc8
X-MS-TrafficTypeDiagnostic: DM6PR10MB3865:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB386538D435BB2C3D23D9821CF9349@DM6PR10MB3865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rRFDxX+wCbD/fvfb1jTDVz0elH/G31tL3gWaCCUV3JFKbF0droFwJEBlfnlxoRMDvAf++3ooV6IMu2L+9l6EozM10kZkMAP0F1lXgMU+x77zVd4suSGMnoKo1Xv5Xzd+fybAhXdE+wXOe1GplO21LWiGYwiLZR3n9JW8lBG85rIWFf4MAcuiO0zmYLUKXgTBrNpsYzCyHnW3BvFd0TwxGOdDCIUPdHwQhfJR9xc4Dxi1h250+ijAwGfsDbMFesx67rc/jdQu4Xon+8Hgrdao6YfygB7ja4PK749OY4HKwn6buee+gcCycIkvVRJz6XE1NCRPiXMd86ce1gxciEaXpqbHE9RFnCsiRM9GU5WpFT9NIy0VopPHtiKo6WaCIXW7RmZR3Hwws3g4h7wSc7wuWa/GHv5xCXmnvctOoybj4wAxw8IVnGudhbpLu6I7+3xU/LZhSEDByFmqYleL1Am6b2T5NHoixirEyBaYF7AWB6QVdpil5innITzCopo8w1nWy33wEf/ExdsReInLCSn+oyoDVNN4qFVIgGWbL1aSIkeiKhTwSr3rp8h+ziJsEyoIvwO8IAb4mk5gByL+qOv93xFUfGndD7N7JTsP5A822kqqZ82BthYEd2kFA/McD390oW+ePp89kOV1FKaFRx2/2VsurA4JHf6JAT+xm+50oWHbqsbXGvzwRMLMwVJvNeQqAHrWEZuaj7p/54CykEupnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(107886003)(2616005)(8676002)(1076003)(66476007)(26005)(6512007)(66556008)(86362001)(6916009)(52116002)(66946007)(6486002)(316002)(6666004)(508600001)(36756003)(44832011)(38350700002)(38100700002)(4326008)(5660300002)(186003)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XGhf+GILAM+wJ9NWyEqkuZXZh6o/s29CkegROGy/wiLTg66J16CCLpCTR5r9?=
 =?us-ascii?Q?j1reNEjDQzE8iB1kFfNvL72l8EEzjIJUUdzcq6bT22SAkKELT+3XiwprfA/8?=
 =?us-ascii?Q?ItVbiFWv1emp5LluD0UlRw3u/uDDsmRt17kc/8ZAbUfpMD0uispWuFaHlYmi?=
 =?us-ascii?Q?u6w8qeTwx4n3YVEp/LFbXVfSQ0550kjE/UwmValMFI1bMeRmx9JMzEJfyNV9?=
 =?us-ascii?Q?keLadtv7DnmX9mDsIM/tPpgTvGmHD3RmaGjSqpXjbG01JV3oJE4V1IiKhFtF?=
 =?us-ascii?Q?SaqsV2U2zqtguMEiKymJ3rm7jgbO1hs+16qAJlH//2gfqimWc/nuIpEFSJEq?=
 =?us-ascii?Q?XSVEA6OB0f26TTDp8kot9koN0nXEm7xqdhYFjcfgIN/i/yIhzzaT9/P8ql9s?=
 =?us-ascii?Q?/YruXVxlBiXwc84bUdYRGIRgl7uNeA6uJaepB2p2TlW5PcKbxlc1/j4T1atN?=
 =?us-ascii?Q?4atfUSZbbiMwO3LY1+ZQCxmdab0mkALq+Dd9ruGTS6rVmPNNQuuAThVSY0qB?=
 =?us-ascii?Q?nAjiXHjP0INjP7L4epv5KkpEX2Hlb1hss3UxiKUnDTJb5C14XOeV2GaB4Lc7?=
 =?us-ascii?Q?7SfNSlmKEp/ooiDcfs2bytBFf6l8dRjOiQ5vdbenKJm04UxSCq6Y9Ls6ArI8?=
 =?us-ascii?Q?jKeiHoDL/kVk1Qc5pm06Qmm+A3ksIQyyEoLNitqONH+ozSGArJakAPVpcD6i?=
 =?us-ascii?Q?JEunvAPN8zrhjXMRO25w1CzYPB5+JpVTaTT6BSEEjCWjFF924UtpHciQnRNi?=
 =?us-ascii?Q?k8d29NhofrdDuSpqiYbX8d4QxSG0XleBIyIBHlf8ipT5AER5MmlJWKPwFcdM?=
 =?us-ascii?Q?/4HSdjFpPU5RyWy30z0EtqrX4wDzgITaI/D2/MsCvYZ4t27mdyqvYiEunQd+?=
 =?us-ascii?Q?iPum9iDuejZMeNUL7NnNMuZyR/mCPqh2AG30Dl00A0/K7awh/WpPoqGOciAw?=
 =?us-ascii?Q?k3e2LoJV2rjvqpegBy9j2GygAgd0h69HYObW3gneUmyys9mrBUSrmxB7xFsv?=
 =?us-ascii?Q?546rponSJLYxQwu34oS+CcHBGf1wRgS1uoKeRoi22VjAy4d8ZHtfjvpY0uI4?=
 =?us-ascii?Q?tSYH2F+9JmRQeObcjyQVH27uaN4N0KznVvO7ztJWfoEHsJpncfhHuZPNxH8Y?=
 =?us-ascii?Q?9XLQkWdfguclyLBDqdMUIXI2Bs+8jAlXjWrBxHp+kfezNpDKxOHf+PbH/dkP?=
 =?us-ascii?Q?rD8CKovlmX3S1g+zGlVYaeIILdRPU7/iLJwwUFlV5Q6oHkHNSb/P4tzmqMJz?=
 =?us-ascii?Q?EGh9KUfsagdhUxkyyNnisKipFLjyiTM3dLFLXsICMoB8RaA5pepmCaUJSOLJ?=
 =?us-ascii?Q?Wt4/lN6slfCA72SrsrTwlZ6LqPBc0OeLT3XPkGcPmM92y/duyfYtSS3aE3bt?=
 =?us-ascii?Q?Vw415l1FimnpiH7F3m48y9GyIlvvLpbtV2Dx7Ys/sdmwzRLpUu/tYNGHUDXq?=
 =?us-ascii?Q?K9Az0oDQKmEGEG87Erf5mj9EABBz00B07jzpDmkcEVCcLmv1iamf8kljBbB9?=
 =?us-ascii?Q?NuKPlI4tOYPzjb3QAR8Yj9ctCkng69CKmGuXtKBSrxo3NdRw+FNetxHrFiKH?=
 =?us-ascii?Q?WV7J73Wcm+93hHgM/N+r4XFamb8J03YsPvqlE2ievytnaGfmhdRLFo1B70/6?=
 =?us-ascii?Q?yVrefsgbtobiN+KTYsyypoY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143e4f7c-bb91-4a12-1dbc-08d9f0947dc8
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 15:04:40.8559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XiZbMnby0N2iizSG0CY8ywLX8KdYZTfvVSzcqiJLIPNJhTM32HdTRUhvFe7h5LXw5XoGqxXASAxWBkxaO/BSjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10258
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=789 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150088
X-Proofpoint-ORIG-GUID: _guKXHIawUkptCkmVmqV6QI5nHHjkr2H
X-Proofpoint-GUID: _guKXHIawUkptCkmVmqV6QI5nHHjkr2H
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds QEMU support for querying fd-based KVM stats. The
kernel support was introduced by:

cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")

v4:
- revise and cleanup the API [Daniel, Paolo]
- filtering for multiple providers [Daniel]
- cache KVM stat descriptors [Paolo]
- use g_autofree and other cleanup [Daniel]

v3:
- various QMP API enhancements from review [Daniel, Paolo, Igor]
- general cleanup

v2: [Paolo]
- generalize the interface
- add support for querying stat schema and instances
- add additional HMP semantic processing for a few exponent/unit
  combinations (related to seconds and bytes)

Mark Kanda (3):
  qmp: Support for querying stats
  hmp: Support for querying stats
  kvm: Support for querying fd-based stats

 accel/kvm/kvm-all.c     | 393 ++++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx    |  28 +++
 include/monitor/hmp.h   |   2 +
 include/monitor/stats.h |  51 ++++++
 monitor/hmp-cmds.c      | 328 +++++++++++++++++++++++++++++++++
 monitor/qmp-cmds.c      | 219 ++++++++++++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 qapi/stats.json         | 259 ++++++++++++++++++++++++++
 9 files changed, 1282 insertions(+)
 create mode 100644 include/monitor/stats.h
 create mode 100644 qapi/stats.json

-- 
2.27.0


