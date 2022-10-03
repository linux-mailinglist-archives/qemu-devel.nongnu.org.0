Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408805F39DE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 01:33:47 +0200 (CEST)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofUwT-0000aB-TT
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 19:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ofUtg-0007Ur-SQ
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:31:07 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ofUtb-0000jv-4I
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:30:50 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 293MOA6i007662;
 Mon, 3 Oct 2022 23:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=L8rkkl5JafyrguqoRS7E9AD/9fq8XXDB/DyJPNhhl4k=;
 b=BN8ZfHPn6c8g90KOARMX/6MFb0L1PbnMqUFvl4L1UmQZX6K2uHzhDXaOV4k04cMl8jyM
 An5bbVQURJX103thTpFxguhSFL8lXqyj87vIAVmrzlgeseLjugQY90lrxJuPoierCU4Q
 koiGJ5zBUpoMAaP7xHyy6Bi+Q9Lvc5o/BZrekpFe2D+mrkFzIi6IgUU0cy3F6lfTUd0q
 ykLNnJh6RLlFsLcxkPWJMYg7c0BPKgXOeyCXvf+0ZLKcTrBwuG8g8cEnd8DcllAq9Cqx
 OTV1c0GObFQYKTDtB4b/16tICs58Uh7spsrHCY2GUOSsUgUizJWMTK5KRmmeLT6K3ZP2 FA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxcb2n2h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Oct 2022 23:30:38 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 293KGsoW015569; Mon, 3 Oct 2022 23:30:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc03q2de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Oct 2022 23:30:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dz0hhKTxYeBkTXpHjP9OlXVjZk89zXZbAgU443IXJQrBTegCn2BG/v1+WEhCmrWfGqHxD/yU5ul1TPmIKkyBIpi+vLeD6ARr/J23CKqVJn407tnvPNj3H8ba6tHWA/1di4vV5G9d0cXozOIOebWhq+ev4au7m2Av5BBnPzWZyXWZdsx3yViVqXLdM1vLQ5VJj4umK6CZIdmqjYiJf6uXJ4SoNAlhldO4T+lEcrVqm209tv1c1yQW9O9t0S3BFCBu8MJlQRuK5E8qF10T+8KMUxAu2sxIeVt6Cn1hHGdDwc7Q3dftCQGu7sPSjkjC5MjcpytIV/LgAzM6YE+xFi1UXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8rkkl5JafyrguqoRS7E9AD/9fq8XXDB/DyJPNhhl4k=;
 b=SqOVOMVoeuFd7SvwEKM8R89Fdkfr4ITZcF2/K5tEP+/xI2mdAo8tCpsTe+Mko6xbAl1PZS3WBGF2YCrRsfP9UTnIrqKYMWVHPSycsXscI1vAcrKKd1z54aDrZUghAOGneMt1eoRJtxanId1tTTMUlYZ+AOZqZ99ThUgX4bqZsrTFuoHRaNjgmcmCnaBaVix7qZcddMgkf7owoVV2Lj3XR/vGaRNnf0MMJvEB2rd09VCIIldFrHDwbFUEr0bUAZuemT/3CQJKSaWUtmwqlfLiEHxbPNne1m9rtMeWaHFqn8WxNm/Agh6hLUZ4LXDIJbudGWZIV1lx3Axa8NaAqmi6AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8rkkl5JafyrguqoRS7E9AD/9fq8XXDB/DyJPNhhl4k=;
 b=ws+3ARqQqBBWgMkhJm8s8iQbFPudwsV4wwpDUT/IuxmeoKy81cBIChTWHNZGr+Y3QwauHMPRnsFSzqIAuB7NOsC7nDjL/srkrmspUSvBl5c5TKF5mUBw6nnTIhdHL+xyfE/lWpdbijUXnruy7WCXHUfv+0vKxyw/Y7Pjfz68OvM=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by CO1PR10MB4788.namprd10.prod.outlook.com (2603:10b6:303:94::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 23:30:35 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4%6]) with mapi id 15.20.5676.030; Mon, 3 Oct 2022
 23:30:35 +0000
Date: Mon, 3 Oct 2022 18:30:32 -0500
From: Venu Busireddy <venu.busireddy@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
Message-ID: <YztwmEuYK39mFAHB@lt>
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
 <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
 <YzYcqNqVCiobf/IB@lt>
 <CABgObfbydWZbUvgQVA4ACaR8GgZuft8c9bMTm7_bM86P44vnig@mail.gmail.com>
 <YzcAK23fRnohvXNT@lt>
 <CABgObfZ-8T+=PgPuxtTc5GHgK9sGGTs_HUrcWG0N3kXXLXAZnQ@mail.gmail.com>
 <YztsgiapfWC78BG+@lt>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YztsgiapfWC78BG+@lt>
X-ClientProxiedBy: BYAPR11CA0052.namprd11.prod.outlook.com
 (2603:10b6:a03:80::29) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|CO1PR10MB4788:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b54b48-ceb2-489d-7202-08daa59745a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VGaH4suqqKcYEbLXuekHuaFUiN3v+YCvEaJZ+dV5XGeZCLOjf2b534bIzLCxEMGwXNhv/vE773It/ynG1hjj7vtVPnzglAIxpM3Xyn6BNzYMl8QJq1PlOFfFrNQcG5KW/zMXxe8f/utc3l1kLPu6aKfgIu7nnB8H/o8iMTlY6DpC+RHdKonXxfuzudXeGAe4Q3f2NdnBq7JvCO4y1BM6oyhyek3AwIAFrTfgJOkOD3j/3UvU4aJPufF+FkcNMntltC7NJMULnjlTMAK/w4UvMUcSpchmsVtSpohDC88INvVPH1ejUd1PGJF7jRHubPL+Wq8O1dSOXbYpGWr5wIAIMRVOr5oKTc0qo2kbVV/AojqKqpQyL12uQOxPOBO37rWzrk55gbchVGLCCVAaFqxeYoDB2HAVwj2v1xcoEmiaiyqFMqL+TcB9larteerYobBrJR6kZ8r7W11S3EURbmrgQPBy3RQPQSB/xojbogugVbsZ2QcJszx9XaLtscus/FcYrUf/cpm95VmT0uYOnw5qdgigWamfKU8kSSP1rN2k7CfBnedKiFvFGcZY8Xl8no1GhQ0kSRKuCS9SuNgNR5xCx86GGVX4yrYc0FcUoEyHtzYeTl9z4lI6DwhZ5pDIT3vw2fsrs7bV67C6GMUcGBbhN1dKzXrpNfmDxkCWe14W1SKxsN1G8GDMULSWAfbWRgyOTGuv7DuAYZWcef2uC534SA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(5660300002)(478600001)(8936002)(9686003)(26005)(83380400001)(2906002)(316002)(6512007)(54906003)(6916009)(38100700002)(86362001)(41300700001)(53546011)(6486002)(66946007)(186003)(66556008)(6506007)(44832011)(33716001)(4326008)(8676002)(66476007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?efTmsZMuO6IPRxolE3fD4GIrtV/IDrTCLxb1Xb5WGBDx1p7luZaHbEk9Vd7R?=
 =?us-ascii?Q?4q0rtBgh71+c0s10a1fJBxEqW18cjk6nKjSA47/6CTbcZ6/CfkPQl+ZbFaXX?=
 =?us-ascii?Q?o9repV+pCKSaJYa75AfggT809aVcJiCnuinEop7dJmTX1soWi9E5sRz2y2lm?=
 =?us-ascii?Q?czF0AIYL8ZRj5w399XUEXVEq8evNtDllCKrfN7/Okq4dFwcvCvzAFYx27K72?=
 =?us-ascii?Q?84nFKUmrQfP109e9V2JuahbygEX++kbVVydjGxsHKmrA872zOJrdQWKb9wyU?=
 =?us-ascii?Q?8zppVnSTzswHM5Ctjd7X7wzww4ss8yb1f51Cq93Xxffd1ZmW8OsNASgRsJn6?=
 =?us-ascii?Q?GDOeAQAwKKDhLBrrCio0l2SBSJc5BujmSEMb8SayYoCqaGFlvWfBy5AgPVCA?=
 =?us-ascii?Q?WUgTHkX4WNzGHmWn7fak0QJgTksdYscA3RCxv04ktnom6EQw//j7je15FPto?=
 =?us-ascii?Q?Phi9kMARIv/89n/4h1CCGnqrW2iNI0ehRPnE1bkfRJDQWqu8sp2l7iE5bic6?=
 =?us-ascii?Q?0gbvfW1gsmNKYBU6VLCnlABpxhqyW3LYubTUXd8N3S9d6i9sLy7RLM5VLqKd?=
 =?us-ascii?Q?GMV7qKcgxO2Wo2FpV+95A0gPUw6fvJ/hiMXZmeZBB1wkheyjPSTbeCrUDLNW?=
 =?us-ascii?Q?/O3ho/U7WIaIyTq4Lr4ky0yylT9CrtCq+lDW4F4Fvma9NLewBbKtPd6Pcsyo?=
 =?us-ascii?Q?I0eS5bc3L80fv0iuRG3yxsqg9wqaky/A3I+TaGgYk2LUc7otOVvguqKEdizw?=
 =?us-ascii?Q?VPhst4nT7P+ZzrFezqMv9e751DyXqX82u6VZe4vGD2RIf8kl+eRC5mWdwoPh?=
 =?us-ascii?Q?dvVyx8ZV6AiK3ZNcY/fO50bMTnqoSTyZPDxKQaIz0CXwpqbuHKDARLonKB/x?=
 =?us-ascii?Q?y2q4n/tmW12XesJE9jfarl/Btv1MLaZeE+ctTGSQDlY/YqqOByzh5DZYZwHT?=
 =?us-ascii?Q?e5abM6/yLKxnpjY0+J830HWYPtsLRASRdSECog/RF+oLHX38u/8QWllkcuw1?=
 =?us-ascii?Q?8cZKl6KXWyzALa0quwGDdCG4NLYAP7pXq4fg5dv9bVfZ0/W9mbrUcnoddnWB?=
 =?us-ascii?Q?IDNFFul5ye2Yp+2+nVKm7Di+yIT7LS6TDnMYGsVJ43XE9b+oEEjoZkqLUdcC?=
 =?us-ascii?Q?DcCsbafsRSSMxMOrFoxEV7dRQd4j6Txawslwih9cJerwzmP71FxCxoj4et46?=
 =?us-ascii?Q?4yprKEOnevGSB9PHuMLFjNNkYS7epwrsxHCn/QDxLICf4ekJ7A+0VlxC+DC8?=
 =?us-ascii?Q?MRI1mnOF/UEuTFPruxbUFv2I5+76w1U3d6wYDLlsg5DGjG/3OpF+vf2wDHYY?=
 =?us-ascii?Q?MRiwhRxCnblA79/jW5T+iw+fVdNA7zUzDf8/tyByxXkk8k8iTreUcfYIr2P7?=
 =?us-ascii?Q?X4sfHmT2IzOa2YxrMhxRIDrIVj88jQYIJLr7h4UFmoq8eZnJAg7VXjGmXShP?=
 =?us-ascii?Q?cFjETXd2RoMtYGZ0QhKa6Qp0ueSAdquqh8wPhsjAaRqoVxwuxukYS4bWRPQH?=
 =?us-ascii?Q?WyNeL10B2jZzWmpgkExClBKww+lSDzaEW7yG+jr8878wPcDUw+Vf0IHs/AA8?=
 =?us-ascii?Q?uWACsNG6+RwF/CMXCp9ehEg+7Ue5WOqASgLXwe0LBVw2fpEIVLLUIN8ugkt6?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b54b48-ceb2-489d-7202-08daa59745a7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 23:30:35.6717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lo7MP8GVE3BDG3BdqAPE3uzN3IlT2cuH8jkWGP9+GC+B0f6XFfy6YBMcqCiln+w6Z6MKwydJShhLG8Uwf6WXkWsdYA4A3ISVn/aBLNm3mNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4788
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210030138
X-Proofpoint-GUID: DIWvAd14P2ZTc8t2bfiBnO-TpNqdvaej
X-Proofpoint-ORIG-GUID: DIWvAd14P2ZTc8t2bfiBnO-TpNqdvaej
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2022-10-03 18:13:06 -0500, Venu Busireddy wrote:
> On 2022-09-30 18:25:48 +0200, Paolo Bonzini wrote:
> > On Fri, Sep 30, 2022 at 4:42 PM Venu Busireddy
> > <venu.busireddy@oracle.com> wrote:
> > > > > Immediately after a hotunplug event, qemu (without any action from
> > > > > the guest) processes a REPORT_LUNS command on the lun 0 of the device
> > > > > (haven't figured out what causes this).
> > > >
> > > > There is only one call to virtio_scsi_handle_cmd_req_prepare and it
> > > > takes the command from the guest, are you sure it is without any
> > > > action from the guest?
> > >
> > > I am sure, based on what I am observing. I am running the scsitrace
> > > (scsitrace -n vtioscsi -v) command on the Solaris guest, and I see no
> > > output there.
> > 
> > Do you have the sources to the driver and/or to the scsitrace dtrace
> 
> I do not have access to the source code. I am working on gaining access.
> 
> > script? Something must be putting the SCSI command in the queue.
> > Perhaps the driver is doing so when it sees an event? And if it is
> > bypassing the normal submission mechanism, the REPORT LUNS commands is
> > hidden in scsitrac; that in turn retruns a unit attention and steals
> 
> While SAM does say "if a REPORT LUNS command enters the enabled command
> state, the device server shall process the REPORT LUNS command and shall
> not report any unit attention condition;," it also says that the unit
> attention condition will not be cleared if the UA_INTLCK_CTRL is set to
> 10b or 11b in the "Control mode page."
> 
> It doesn't appear to me that virtio-scsi supports "Control mode pages."

Just to clarify, I am referring the mode pages with page code 0x0a (and
any subpage codes).

> Does it? If it doesn't, is the expected handling of REPORT LUNS command
> be same as the case of UA_INTLCK_CTRL being set to 00b?
> 
> And while trying to understand this, and reading the code regarding
> the handling of UA_INTLCK_CTRL, I ran across the following comment in
> scsi_req_get_sense():
> 
> /*
>  * FIXME: clearing unit attention conditions upon autosense should be done
>  * only if the UA_INTLCK_CTRL field in the Control mode page is set to 00b
>  * (SAM-5, 5.14).
>  *
>  * We assume UA_INTLCK_CTRL to be 00b for HBAs that support autosense, and
>  * 10b for HBAs that do not support it (do not call scsi_req_get_sense).
>  * Here we handle unit attention clearing for UA_INTLCK_CTRL == 00b.
>  */
> 
> If virtio-scsi doesn't support "Control mode pages," why does the above
> comment even say "assume UA_INTLCK_CTRL to be 00b" or address the case
> of 10b? Also, other than the reference to it in the above comment,
> UA_INTLCK_CTRL is not used anywhere else in the code. This comment
> confused me. Is the comment just wrong, or am I missing something? I am
> just trying to understand this better so that I am better prepared when
> the client driver folks start asking me questions about the qemu support.
> 
> Venu
> 
> > it from the other commands such as TEST UNIT READY, but that's a guest
> > driver bug.
> > 
> > But QEMU cannot just return the unit attention twice. I would start
> > with the patch to use the bus unit attention mechanism. It would be
> > even better to have two unit tests that check the behavior prescribed
> > by the standard: 1) UNIT ATTENTION from TEST UNIT READY immediately
> > after a hotunplug notification; 2) no UNIT ATTENTION from REPORT LUNS
> > and also no UNIT ATTENTION from a subsequent TEST UNIT READY command.
> > Debugging the guest is a separate step.

