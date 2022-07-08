Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F356BE4C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:42:56 +0200 (CEST)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9r4A-0000GM-4O
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1o9r0K-0005Kp-Un
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 12:38:57 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1o9r0H-0005Hu-NB
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 12:38:56 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268EcRjo011487;
 Fri, 8 Jul 2022 16:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=OMGPZXFe1qGL5E5vpLoLZiuHX5O/lwCfoD/vHXS0OSQ=;
 b=tHU+dnm6BJuoHs2H5UCU8m2ezF1yP20KEpT4Z+2hnmEoigbOq9kSAVQAX1ZvuGsBTJUq
 JiQwR7QcA1G8d3LjeITgPKHzzOqmPX0XX+B5ovQlPUNaFHDkU3TSSMQ1+f59W8mKxrc5
 wuonASo+W0punoQsrvtiZ1rLLTbrU5xGdAkDqgnGREnc2z0I0Ze+HHREk2war6bIYtac
 CVDJO3lajjnXLG6FnIpGd03FSgfc1OzvP6wqW6f1U9GcnUa0W4KvRYLkw1FO8opH3TuS
 mWrBntji3IjN5wLnank5zpqpJI0TEIeDi3kJKbpKdL1IK0itMOABb3Gh6oYFvnMWlZad Kg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyrk4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jul 2022 16:38:36 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 268GZO6x000864; Fri, 8 Jul 2022 16:38:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud727rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jul 2022 16:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9LNXBT14USK3ajaHwRlQAAj1Ih3Y8KJNjISaTHJ33iAYI2c50LpjjuEycGGnc5MaHdA9yT2y/3VeSY/Rt1TP6UiYUo+bB9ueOmyh5JMvOn23h3t6l5hmopZaY9SDyqIS4evKcEHLgfjbT+z1xlbsRVjQv9YT/Qg6jqLU+uIMZeGouLb8eyA30BacfBCHVLKgmJmJYvs2Dxg0rFIUXqaCFNb35QoOJz/izURVO3MRewix7fxOhIS20D+u6LtI0HO0LFILg0DIvpf+YpyzZRwCifpsgOgoI9zVwqjtnYC/GoXnanmOI4VIKyQk7Um5C1U5izEQFvIfjxzJ1nl+I3OBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMGPZXFe1qGL5E5vpLoLZiuHX5O/lwCfoD/vHXS0OSQ=;
 b=Mawl8v7xajyoh2a4L5csn8tgbKQ1ZN+Ak5uwPnQmPym3KukjxYGCw/1PT0yP33xiH+yERJ+C4wCgvBOUOkESPymLPic8IO1OgaCiN2hqPpKHoErl+7MFJzTmcIIw0nfYgqgN8JIubOj6S1FdHJg+eGOqM8/xVA44pR3N5zCgVFb1VK4AViWh9Rm0j9YnGKV+1vZEPUpA/D70OBrKbIrUu7kovhjKBQ3IiLE24YwM2Sb0XrbDBq8fGJKnO5CsPty4YZeir/c6yr5LmzDKgvhJeiMzSXYZ8948m0dIwOjk04Rl3bxBxKVhzMcfYq/4bYJvvagQVtgU53dRhUR/OYPr8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMGPZXFe1qGL5E5vpLoLZiuHX5O/lwCfoD/vHXS0OSQ=;
 b=nFBmr+nOSL6+cJTHsEj6CamXl4z++h9giMSGmpBy+YnegM3SjjGxvaq8891iGAsIfZZPbtFAS+QefvfWPH11Z+E3udu9+Sw8JUqbCNa4sJf4ddBBz8QSf0fKBnN+fY+c/0Da3KcCXvvOSKuvmaJVadXa1J4RI55RHBOQQHeDTj4=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by PH0PR10MB4743.namprd10.prod.outlook.com (2603:10b6:510:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 16:38:32 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::f2:3cb8:9942:56ec]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::f2:3cb8:9942:56ec%4]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 16:38:32 +0000
Date: Fri, 8 Jul 2022 11:38:29 -0500
From: Venu Busireddy <venu.busireddy@oracle.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v1] virtio-scsi: Send "REPORTED LUNS
 CHANGED" sense data upon a disk hotplug.
Message-ID: <YshdhYosBuxC6Ulm@lt>
References: <20220531202237.274483-1-venu.busireddy@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531202237.274483-1-venu.busireddy@oracle.com>
X-ClientProxiedBy: MW4PR04CA0352.namprd04.prod.outlook.com
 (2603:10b6:303:8a::27) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26f7a8a4-7fea-478c-017e-08da61004be0
X-MS-TrafficTypeDiagnostic: PH0PR10MB4743:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CsNAWTcJF7rkpwOtBrIswBdAoDs0vJp+48IhKVEAXyDS4e1V8OtaYnCMIE9SgLo4eaOWW0n7T2RgCBHifSs+HrLnzkdlDTFNOXksb2erLosI7EvmANyaDSuPcT+8rwI9ck8RVX1/AppEaaQMGrilq7SKaEIksD/r3/LL+rWON6QQII6DrPvm6BtxOaCWEbLyFuFnREx/nkdhzxjgAQrFlVto/LjQbK9CECVxL00hkxGnDPsLUfnhw754Ew2X6DVFgv5JaAkTkZz8I/4ozKWPGMQqGM3hEVgL0LTEwOVFPszsAkCe0UTCe3KglYHrgiTcV3kyDrx8/MferEXRZdRDG68SSVEtCXObdhVRGUPdzFej7bmEFFzL6w4UDS4fmX79pBbLURfv2wq+PvcPjEJeU6DCdMkxAFz9QuSHyGyPJ1PL3qqDObv6WRPi14Qzj9xLXvwO5djNQPywJuW3kugexxc4GgL7rWZ5nLO55ff2FlnGRnbfLJpQcCFw1UETiWq1hiXRP4GfnOrehFhsCp7u9lrd0NIDmOAl17vytyUpuODIBi0vFSX0MmleoADZLkU9149l5Exbmmv35MHvBqLWenMNeBDpVVX4vOhlEw5L6NiqeykDSW4jxa3fSaPbzje+3nbtLxZUSIuVd568MtYmuBXJHa9MjYcaqhfM1GoEzfJcjnMEj/KeULlXzebgiH2lvhFtJLaWnv/yDut4isOCoJiDL/ZfvHV0NXlY+OiXSykJWGu4ED+R+SEAz6Rl/U4H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(376002)(396003)(39860400002)(136003)(346002)(6666004)(41300700001)(4326008)(9686003)(6512007)(186003)(2906002)(478600001)(66946007)(86362001)(6916009)(33716001)(6486002)(26005)(6506007)(316002)(54906003)(53546011)(38100700002)(66556008)(83380400001)(5660300002)(8676002)(44832011)(8936002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gkpxmTyUCGn06uXokWxE183Gz3M1kLrGuAS8blr7BMt2RlH35oD+LgvDjGfb?=
 =?us-ascii?Q?RWNsdocWH20EIW7bdnKh6tGt9+4zg9mKcJmxc5Xgc7ftK8SsWqeSTilEk9Ga?=
 =?us-ascii?Q?GPoLAoXjc3vtbxFWQc8KY6ZXXVpggiypZYNKoE58/GIzlAGh0T3Co0JRmTm1?=
 =?us-ascii?Q?HxOK3acEFZn3Fd6/o75XZanDFRaXE3guxwcIolHK2WJmu3IDSMfjQYyBXBoG?=
 =?us-ascii?Q?DMUEmtDwACcVy/zNCvua3/oezBaJVAGqXMQHyob4IQLNN42v6j6YxIieQa58?=
 =?us-ascii?Q?eo7aYZWSL1zOXhq2EdVrK9bXkg6O9kxaFYBfnPxs2kMJqBNl9FtlYwyiT2QP?=
 =?us-ascii?Q?YLWXJK9rNJl7OjBBrKbZ8QBGR/FNuelKIxeSskmcK9APOqFqDjMlahZ+/y/f?=
 =?us-ascii?Q?6K6iASS4VzVG+ZHM0xHjITAu7PSoip39VN8ZxDx6r/MknWVedffgQf70LAUm?=
 =?us-ascii?Q?cxvondmo+MOKBnmZRK/WiqnxePtGmKyup0F7wqbz2h4J6Xap+zAPsLkkepuA?=
 =?us-ascii?Q?+YRCRTOHFOnluyYjtCoQbjRPVPAj9QMgIoDltYS11KVi6YdWTwHBKiNFdPIk?=
 =?us-ascii?Q?0kYMqRMbLuP2kb4+Vvf3j9VYfMKQ+fpBWTXMTvywDrmSjRvVfEVCCQt8UqKL?=
 =?us-ascii?Q?8xonPubwItJv+2JOY4UusTqtvG1yksxv/MYEvITqaeMQ1tiqe6WluhjccBKR?=
 =?us-ascii?Q?+67oLMGUnxEMjRBCHlQu7C6MRgX8aKLweBIdPduuZjtQfE5Wq177U6+o92vk?=
 =?us-ascii?Q?plPPjW/T3+e7ze1F+QGDeb3zLGon8eSwbDA/3xPCPiPTd54gSyTrqnVeiuuk?=
 =?us-ascii?Q?87wuMwcjzZBuQEb6vJ3GN8VjT3ixrqrYtt5u3DZaUEWi/+Pk4ZnPBmNNLKPf?=
 =?us-ascii?Q?XbtVk8dITpDssaLEzsLQl7jcNZaXO9oxaso6VFQCnM8hjxf3wUehEP7S+JVB?=
 =?us-ascii?Q?4iac+XuZy1j75ceEm5FZgSQzjKzHr37wXbby+BZYuImKB4N1XsxXXI9AtdAx?=
 =?us-ascii?Q?yv2pAUBjD//7iugFxXCZtANRivU8ToBBafXVFeBY9HRjwgQkXcPDEtOWsITd?=
 =?us-ascii?Q?ICpXmI8AfTNTQxuB+rzFvyayHTJs5E3WHTgmkqi5PJcuqHOlV+DKGlaiuwZP?=
 =?us-ascii?Q?xTLE856tWkv5++/3XCt9xBNb30upnQWWuGY0s6J6Jtglyo2kFHMcH1+uvf6b?=
 =?us-ascii?Q?/hLjhOft3sd6aNXqViRYyKn1azvif5FhbtV0C7kmbM14hnRsAymL537jCJFY?=
 =?us-ascii?Q?ADXmH4Siixx9OnS8xZ0RcPoJYCzwhS7jb4oKFdqyTgeuJ92oPs7XjciHh6/A?=
 =?us-ascii?Q?61IQg+CVBQthcSDQOquNV+JoXSizKAJ4DE1UTEAauYwdMhYvdg4s8D7lScas?=
 =?us-ascii?Q?CZfwyigAI/36V3zDb8x2RKQ/mhboIHAHAt6qg626Bzw1mBOa4M4ji3noa3sO?=
 =?us-ascii?Q?1PC4i4szV8sPjYD67G5bJow6oP/8nvWh88CXuqBdOpVicKqdbuEAuUyvxCgv?=
 =?us-ascii?Q?jDehYAlRYD/s70/n9dZDLOefnsz21MbwWv1aIp7Bah18bGb3x8J9CnDyoFPZ?=
 =?us-ascii?Q?XPldkuZ2azphmbVBatHbAIzuigcxDCU8cc8ZA/eE4QFt4jCN7G/h2uJFbmkw?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f7a8a4-7fea-478c-017e-08da61004be0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 16:38:32.8462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yi01IIFdmqbOTZUFUrAE2zN+ad471T212hdHmnbuXBnWv+1Htmq5y8Fu6d5oHRS6yhEFJ5mhFdXPOnLPofCxCPmwad4aHTOkOT+UfjyVAeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4743
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-08_14:2022-07-08,
 2022-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080063
X-Proofpoint-GUID: xt7IvLPOtpmi7KgNyMBbNpS2sCKnkcar
X-Proofpoint-ORIG-GUID: xt7IvLPOtpmi7KgNyMBbNpS2sCKnkcar
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Ping?

On 2022-05-31 15:22:37 -0500, Venu Busireddy wrote:
> When a disk is hotplugged, QEMU reports a VIRTIO_SCSI_EVT_RESET_RESCAN
> event, but does not send the "REPORTED LUNS CHANGED" sense data. This
> does not conform to Section 5.6.6.3 of the VirtIO specification, which
> states "Events will also be reported via sense codes..." SCSI layer on
> Solaris depends on this sense data, and hence does not recognize the
> hotplugged disks (until a reboot).
> 
> As specified in SAM-4, Section 5.14, return a CHECK_CONDITION status with
> a sense data of 0x06/0x3F/0x0E, whenever a command other than INQUIRY,
> REPORT_LUNS, or REQUEST_SENSE is received.
> 
> Signed-off-by: Venu Busireddy <venu.busireddy@oracle.com>
> ---
>  hw/scsi/virtio-scsi.c           | 15 ++++++++++++++-
>  include/hw/virtio/virtio-scsi.h |  1 +
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 4141dddd517a..7ae1cfa6e584 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -608,7 +608,19 @@ static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
>  
>      req->resp.cmd.response = VIRTIO_SCSI_S_OK;
>      req->resp.cmd.status = r->status;
> -    if (req->resp.cmd.status == GOOD) {
> +    if (req->dev->reported_luns_changed &&
> +            (req->req.cmd.cdb[0] != INQUIRY) &&
> +            (req->req.cmd.cdb[0] != REPORT_LUNS) &&
> +            (req->req.cmd.cdb[0] != REQUEST_SENSE)) {
> +        req->dev->reported_luns_changed = false;
> +        req->resp.cmd.resid = 0;
> +        req->resp.cmd.status_qualifier = 0;
> +        req->resp.cmd.status = CHECK_CONDITION;
> +        sense_len = scsi_build_sense(sense, SENSE_CODE(REPORTED_LUNS_CHANGED));
> +        qemu_iovec_from_buf(&req->resp_iov, sizeof(req->resp.cmd),
> +                            sense, sense_len);
> +        req->resp.cmd.sense_len = virtio_tswap32(vdev, sense_len);
> +    } else if (req->resp.cmd.status == GOOD) {
>          req->resp.cmd.resid = virtio_tswap32(vdev, resid);
>      } else {
>          req->resp.cmd.resid = 0;
> @@ -956,6 +968,7 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>                                 VIRTIO_SCSI_T_TRANSPORT_RESET,
>                                 VIRTIO_SCSI_EVT_RESET_RESCAN);
>          virtio_scsi_release(s);
> +        s->reported_luns_changed = true;
>      }
>  }
>  
> diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
> index a36aad9c8695..efbcf9ba069a 100644
> --- a/include/hw/virtio/virtio-scsi.h
> +++ b/include/hw/virtio/virtio-scsi.h
> @@ -81,6 +81,7 @@ struct VirtIOSCSI {
>      SCSIBus bus;
>      int resetting;
>      bool events_dropped;
> +    bool reported_luns_changed;
>  
>      /* Fields for dataplane below */
>      AioContext *ctx; /* one iothread per virtio-scsi-pci for now */

