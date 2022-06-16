Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC8454EA47
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 21:43:32 +0200 (CEST)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1vOt-0005Zx-34
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 15:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1o1vNJ-0004tk-Lv
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 15:41:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:4930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1o1vNF-0007D8-Kl
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 15:41:53 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GJWcNw029747;
 Thu, 16 Jun 2022 19:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=OMGPZXFe1qGL5E5vpLoLZiuHX5O/lwCfoD/vHXS0OSQ=;
 b=lm5Xy4PUP78hu3G8AzWmb+soF/MLMRjAMP43vlhuWhG5nI+CjVuy6XXa0GmFhM0TMbG3
 ywpARXtEPAb2E/7Cjj0EaP7icIoI8oAM3MlvavAyEViZ78APViulRbIVGH6pJVPwLVXW
 7fGGGXel1YayFUIkdSlBm4HACCFJKvMapwHpS5r6TUqHdAryrm5/97/Fm5/9j7tO8y8a
 KgTndyAfZNL+nWnPHh3xCdfJj2S6F/uVbyipR9O2zXpnSRoNjkHN4yGoWME7coCqaKa1
 2KDGcwPR+b/Mjz7RPn69fCRvKcnkcbDviCkbOd+XMSiYaXIoVoQsO89Zp9vRTuV9oja3 Jg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjx9ky8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jun 2022 19:41:41 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25GJFeTv037128; Thu, 16 Jun 2022 19:41:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpqwcdfr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jun 2022 19:41:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpfNz+m1nLI7DKvUehaJfiPATXM/BHb4y126OtA4vR/8V4OLIuvIxX9jdp8OkeQD8a3DtC76Wyq1vL71ZMf0VbqTiHpG88NKLfPYiqd5+Yy/wVJg73YzPJp9wOr8fqyuTazVb0prjijAGAa/wX6CPi6De3HGhSQpR0h83DGtqECUt/PFCymNsjMzA7/2jcgSSq1TFVK0BeCodD1wF4jLUZIkdP/Vm4DFWk1JwFqiHewpP1xkmr9y92XdAYSDbV9msIYaegSmV5TKjJzp1bzDMlLXuMkKbbFAYeFotxWZzBeuoAbM0p4yh8ZS+1XrF+UGWcgxlqnrPAiaiPjXsngpmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMGPZXFe1qGL5E5vpLoLZiuHX5O/lwCfoD/vHXS0OSQ=;
 b=H4ozvgKhPBUG51SyuPmfikiM0Iucz4KyVnA2Tc2Pzs2kXR3Jx8Lvyyj9R/X7S50fDp81oZF/QxuAdqYz5iKkSfUfHxcm1frCh5VUkrLbhCbhYWctFrxtK1WdQw4EwhlX+Fp+S2zmU3OPXb2GzxN6ucqmW2ASYU4lJv7cZ1GUPDwVnzRYJD+uDJl22la/BTC+YduBtmzO6LIj692Xq6eJgKdtIXiYhazW2BrejDMxq/fTinz5XSKJvKJg3+HVk8/hJadE9xKyqNtjLf9QMGctnRLR4TMOvCql6URaSuKSjqEyGj1OcZHZxnu9gKJPvxAkT6wvSz/fBTMOGcizhyh1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMGPZXFe1qGL5E5vpLoLZiuHX5O/lwCfoD/vHXS0OSQ=;
 b=awrwFycRwZtHGYSwT2fdtrjjPss74YQEbBsih1wQNvRc1oeQkEPOgS9NCRxzPwIi9pcDbXdc2WswlU3yReih239CJbHrpJjn4yKzVGJKtgOISfSMpn+4bBm13UpGVRxvkPgavGtYVCcv7aiI9+rUz2YUPPAXi8MBkWF7HX4/t6c=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by DM5PR10MB1676.namprd10.prod.outlook.com (2603:10b6:4:3::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.14; Thu, 16 Jun 2022 19:41:38 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::286d:9e89:2450:f0e7]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::286d:9e89:2450:f0e7%7]) with mapi id 15.20.5332.024; Thu, 16 Jun 2022
 19:41:38 +0000
Date: Thu, 16 Jun 2022 14:41:34 -0500
From: Venu Busireddy <venu.busireddy@oracle.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v1] virtio-scsi: Send "REPORTED LUNS
 CHANGED" sense data upon a disk hotplug.
Message-ID: <YquHbvTcksdMZfsp@dt>
References: <20220531202237.274483-1-venu.busireddy@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531202237.274483-1-venu.busireddy@oracle.com>
X-ClientProxiedBy: DM6PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:5:40::22) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8794dc60-f063-43ea-0cd9-08da4fd03a90
X-MS-TrafficTypeDiagnostic: DM5PR10MB1676:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB16769FCAAAEB08D43C46E266E6AC9@DM5PR10MB1676.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dSqNrGRYZoM3LzuEv50+EBtymp9OWpZb3GLfjQCV6PIl3AAaElGIHgMNL4w+bq66TssNBL5jEUujJWtBCEV5rfRm6DhxCpcgqd5Dewx8DVPRhvap18K2dWD9TB2uTrHhqxX98nhdOduZtJHssps+0ALKnH1aqQSYXxE7j3CvIaqkkx5ENk52qSMm2lOoAGjvP2s+wMwuUhL8ctLycyKGT8z2XGRvwjchEzd42RIgXtj4i9hMj2rStOhfLgz7kmDgz9hG+zlXtRc1zi9MpnBt13wqv1PyDFvXZZ4Nas+wZBi4MEc+8saf9YgxnlVC8Gd9oWJm1mezNClQQ14VHq1x3yDsAaLfUOM+CrYReEzWC4e0yLvLXHhd5sJIsI8mMJeoWuJ4m+eonZfIt2wtbl6i9Hm3iGpDlXAWrPzX0qfjeGdKywlc9zPJ0zCDv0Dxdg1m/4+sz8GoDDd4RLVqw3E1qu+tVQ6QoJmPjMGKnbqMpNugCNRb7JDeJkW7aQBCFYK8XpadFAVx5swgKi/IW/mclYus0DBz/GQhiOQw5Q/6KZC7idGopf/GyY2ZkAX0pYtiN/STr+VuZS9awE9Ddrx98EadX1dLuGMf43JOEO0vmSAzkSA3kIzw6aLRJFtoiyvNsoU5iOii5JOJ+CO/gAUS0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(33716001)(9686003)(66946007)(86362001)(6512007)(2906002)(66476007)(6506007)(53546011)(83380400001)(186003)(8676002)(6916009)(8936002)(5660300002)(44832011)(54906003)(316002)(6486002)(38100700002)(6666004)(508600001)(66556008)(26005)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SRoQ6LORdwDVRDHhSdNLigCoZg2yPlksUisnYwF9SL24wi/BszYUIQNNT7me?=
 =?us-ascii?Q?VJN53j8TBhJ+/7ZbJWfU46sxtvJ8cTFkd8uxbqSY9+me3pVh8yCSjS6M9tJS?=
 =?us-ascii?Q?3XtlBJRCtLQtHjhGo+S0FPDr6WLp4RS0ztBnlWyjAN/D8XZR4zl2d/TcOUDX?=
 =?us-ascii?Q?bvHthD5UpucSVqaLGwsotaGH8lE8d9+HV0msRVlAS1g7i1mVLH9Nvz3xSdiC?=
 =?us-ascii?Q?KEqlaLhmw+oIbmy61fQInzbmiW2fIFiR6oNtsD4Wzzkg8DeUN3UkB3pIfpaU?=
 =?us-ascii?Q?cYmKijXEP88i856G+J4m662e/VoOAz9LGeq92STajOGxRECvHtMg/DabuCEg?=
 =?us-ascii?Q?7mTE7ToGoxERqwnXJ5HXyNc7MAKTiboHxAgobABueHM3kOId2a2bHWCBhDp8?=
 =?us-ascii?Q?eJtP3hJ8zV4b0D+LiLXkuk1IGmMGFhNe2QQ0TxFuDg1ensbozUvYpvFoXLpI?=
 =?us-ascii?Q?xcasTIEX9uw5XMFaOV9NANS+tD0/AV+3d16HZ470gvzGbAu4SlhxsJ5nIUzV?=
 =?us-ascii?Q?bCo3EMtf9Nr+8435HlBE8TYfasUdOfKJwZ3VT3pRgQqUwDXoCBDwSuGoo+I3?=
 =?us-ascii?Q?rsq2bT3i7oe0pxsVSCXaMwNfe63l6ffkUI7jwUnfcnyV/OMwDmatY2eRV8q8?=
 =?us-ascii?Q?x85XkiqXKWqnT6OYuXkQczXkjYqaacpUnerNmez0Lp3xFc2c7jABcTuU5GRM?=
 =?us-ascii?Q?FxBTYC/TyPm+MuNKrPJJEKuY39eAlqDil1vqGHcjVTvvW9lm9ByCKuxiSQDl?=
 =?us-ascii?Q?BFFZTNL3XksKqGkwlYFFagh0GlFwVevcuDRTtAtiFJAdXywl9U6xkfvE1JBh?=
 =?us-ascii?Q?3YXGLyQ50yPA2G9vWbPsl5YMeQByDTc+la/m50gdgzarF1mcHaGTw7BSTKiP?=
 =?us-ascii?Q?ZGsTvfujsqhy6VrFLjChZ5uAYzO8Ad/zK93HLi21bI5fDPTFRGg2TohtQpte?=
 =?us-ascii?Q?Evgv08YN34yArebB6cXv0tMirN/jK8GCzhOIRKQ/J6ZEafHNfEnyIweFSNT/?=
 =?us-ascii?Q?Nd92jrnzAN1fEBVSad5W0LIwUhq8bStnoBJuYnpwOPDsCQGykVfAwqY4pNR6?=
 =?us-ascii?Q?CEPR2DSQzA5ac2KgHOOUJvyK7493zJfOk/anw3s0oRYlJsnNUmbx5A30IHHm?=
 =?us-ascii?Q?DN0NFXZ6VqGD9fS8iwClpyuIEeh/Cgy9AIkYoiaEaA3sWL8AxY6KZB8ZqQ/k?=
 =?us-ascii?Q?eN2ZmofeFN/1VjCt/B9U6kHJJuLDyiyIYYio8nRZQgVzferuuOMSKDImn8mX?=
 =?us-ascii?Q?sD2En0oGxpZIy9hp9RyDYELAUI8NvzXq3QvvHe7KMxvS18+xIXHvoXiTu0LE?=
 =?us-ascii?Q?K1Ud0DtPvPpqpRirvPqR4MW4aLW8puNW/Qv9csLtGMFYjqB5LGrOqIOGboNL?=
 =?us-ascii?Q?x8OJHYiao2WjatwxfpMAvxBfKndxx1UAX7w37FbkBbKi46lQnu19WD5BfsEG?=
 =?us-ascii?Q?FNyyk3H67xaoYjYBA2PpeMjUTvxQq2vund8+ZLNH0LMjSmANP661HoN1C8oF?=
 =?us-ascii?Q?QMEpJ9QAviWXanifI6H5pZelK94x4R2dd7MuEyQvN+wg60FU/ul8SE5TWFo6?=
 =?us-ascii?Q?w2Nr/wuMnCG5nTuM0m8MeZcvZvZ0xQMhANYlI9IX5u/EZBFmgaLikCgds+xx?=
 =?us-ascii?Q?skoITIO1YAZyUULCXFHzCNyAFVcTnSgCTuf7SHGgV/mZ2yuKpmTDLNHpuzIM?=
 =?us-ascii?Q?mg+6NgTf9bxkjcWp+6i12gwnP9mCrN42+0zg8MiwwcFP9TcYpT9nemZ/EGFR?=
 =?us-ascii?Q?FTm53YTIWyd0kIbhlD0bBoAUHnDpgLM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8794dc60-f063-43ea-0cd9-08da4fd03a90
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 19:41:38.1751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnzD5bTaH04GCYh8oJJEMTIpnBsHJcl90UoLdIJEURK/oaFg5ec18v1SC6yNiDQnepYYb7yY86HTwp8qyP89XcpwfCw+9SlcDnfqbOw4E9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1676
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-16_15:2022-06-16,
 2022-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206160079
X-Proofpoint-ORIG-GUID: T37MIskEGnlYCkD96F_umhg1gCJxHQLG
X-Proofpoint-GUID: T37MIskEGnlYCkD96F_umhg1gCJxHQLG
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

