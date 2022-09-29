Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5965F0066
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 00:34:00 +0200 (CEST)
Received: from localhost ([::1]:59782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe26Q-0005uD-P5
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 18:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1oe240-0004W8-Q7
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:31:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:57578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1oe23v-0001It-CD
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 18:31:28 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TLxL9V028692;
 Thu, 29 Sep 2022 22:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=HKNwVgVf7LirTs4N3p9PY2geoc8PTucOlDBBYlaIcus=;
 b=G49E0EUSfFzR4Y6LPk3/Ub6uHS/ucwAa1F8/bYDo2yWFPAUEm7yp0o5Cq8thLLwVscHs
 l+f0BVXpyNfyu2D1M7iauClHXVqFo+bDBB/HoKO5BkxPZUnJb04/a1OKh39QYq3/4RqW
 uoMPUJ2l9Q6HDkgj4WFlZqvLsak6nXp33k8oPbpG44IMhddK/+BGRJRSlfFEHibIQlEt
 MVqdaFA3Dd96iBT2B4fk5eSJ2lqzNUnUE1SULY1eD8uBCzMR2K0WvrwP1z9mHSYsFdXb
 bD/kpUQD6y+26Ujnpk2FiOziLLKtF1H1jXYqyNAYVoAEGjZG0O5dmjx8EphlEQhRyPA7 wA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jst13p8ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Sep 2022 22:31:11 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28TMF9pT040314; Thu, 29 Sep 2022 22:31:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jtpucmac8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Sep 2022 22:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUwoReNIevGwlNASHYZ+gKFW2qhKxodniGdA80BGO5Zdiuhu+njSccbLGrhe6zpDKLCAvI6cx/l9AHbq0v1X+KZ3rBULSGkHVxz7Z1epfAimQylCt9qqg8BnQiarRgtoH95QiWUotr5d5d1II3oW1JJ/GaN6p/ACb+/3TxTj52DPM5ab3TWj/2L7ZmTA95DrRdwV7uCGZYEQqEN2qBGDGpBqiu1FU3TgM+XVQOOoFi+SJgCCT2bToz2kiW4QQKv11oh0NJoD/C8aISlUNJAs9W6pjx4xVVKvEyk1f134mFrcZ+z9yrWCPMjUHmC3taj3GUdK6YjZDcdUJCyY5vyC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKNwVgVf7LirTs4N3p9PY2geoc8PTucOlDBBYlaIcus=;
 b=RFRG6OCsrptIhgtVTxuPDZoG2p0BkY977CHuUwJRXIDAdJnNwYCiZ5I7Ob0vOwIk0Y5xBsxiux1Ob6SVaDFsM9fTj8cQpZ1e2npEhO8FObqUliHGMiZirJ9PbJuwTlYayLGJ5Tr7HFYGuqnwHNCK4OU8vjPBKsevNT4v5XGkSMgSCh2DAqNIi7c3OAN+8Bz7JYq0eG2Kh/a0NLpxNc0WUPSYF7wZheDPp88mKWYRLlr6lb3DZn9ggaa524WA4j9G6zR0b8hgGjw1pk5AEIATOOV46thMwNJ2Av3EV9q71vmPtLE0eUlP4gogx+UC6o5xmo/+n+Hrgz2Sqfx0M8fUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKNwVgVf7LirTs4N3p9PY2geoc8PTucOlDBBYlaIcus=;
 b=uT6Ouq2QOX0BhQ1ouZJmSC+UgV37UF0nHm37a0XPG9FR8irsBQRU1jaANwzcntko3Ay+QdZwlgluDng81kQGtsYDtKtfxscqC3+kMf0qZbI+FgtsIWdmaGK5UqEUVSQf8XErLqaVVRVaMy9Usp39yfjJBfrfQThRh5jO9EJh05k=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by CY5PR10MB6072.namprd10.prod.outlook.com (2603:10b6:930:38::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 22:31:09 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4%6]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 22:31:08 +0000
Date: Thu, 29 Sep 2022 17:31:04 -0500
From: Venu Busireddy <venu.busireddy@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
Message-ID: <YzYcqNqVCiobf/IB@lt>
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
 <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
X-ClientProxiedBy: BYAPR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::40) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|CY5PR10MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: e634f3ab-35b0-46b3-8ce0-08daa26a4e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABhBQEn9cQrX6HQaDeJD+DcxdT4dIeS9TeFvmdMqJ0Pr0cMcA5fD/WXGPgwUjCNYc19wj3m3ai98MDdFXpaGOwiSLgW53r0NSTTRGl2XOXTIsBToxbnc6XDn7WpvxsqzSQrAY2Yfg9wqP7EjlTWh33cUSJoEqo+MI8gEIpkyKbupIC7V1asCKllEG4Lo4+6/eQqzP6ByKm+z4F7Jw3t8zvdmLO238RpquMKtdWBs4FvSRvK/AK/AJx8Jk9PT8pin/I/0c0FbOzz7k453CNmRRNihgXANdERYeMxpWfzxxNIxHUC8ctLZpKWZGnQKw+etTd7qSkskg+b/4IGqvfCzl2RHNX5ZrP10ls+Iry6KEJZ2313LO9mPd5oyXMkYPggvTtXLGrZWI0ltYIGTwevWYr3EjGRm9U64Y5HqCc5E7qdg4+3zbjWFeSxCJzJXb4L0UMfMVHFtKO83PGZSEiQMHNr6GyqymPMpkKixxsr/dgAWUX3Yro5yCwhagjoQPau8Ct4HqTA3pQL6yHU3bCLrekj9QdGWsgasLtPYsrEoVJn19HNBYsvENYD/KQJhMGLZWfZuUon9aG/J4tuYh3vgb0uOm8d+R+m2ZDmSD4bWeIk3wRN236Ah9VgsndDIPgZiwUyeYSMld3C9WBgw6ZBY1asjmC8EuftfOzx5qAyCxUpeNNT3oeFou4fI7LiyLvWwe85RTPqy6uWx8eGG5l17+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199015)(478600001)(38100700002)(33716001)(6486002)(4326008)(8676002)(66946007)(186003)(44832011)(6916009)(6666004)(26005)(9686003)(66556008)(66476007)(6512007)(83380400001)(2906002)(8936002)(41300700001)(53546011)(54906003)(6506007)(316002)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?axJ+v1AGpo4+7eGR/9+DpSgAf78zgvNesjQSkmXZuWvuUUZLx3CaFMsKmSMx?=
 =?us-ascii?Q?YZtO9inyp+zKSG4GBKHNrW1aTXMQAQ/D3vu0JGTpubHDritJfLV1ZNp3c2iS?=
 =?us-ascii?Q?NNhSnJzTdNtWbOrh01n8VnAb6s2hSAkV4YYwUMt3yV6Tm/tB/CmxyUP1sG2h?=
 =?us-ascii?Q?rTiXErQ33TfyeSCY0lEVug1KR8NP0omntmMQ8QRnMCnrIllYer4P2nPVXsTR?=
 =?us-ascii?Q?JHVBVsZcAGMSuuovvP/h3t90GQ+u8lrqDK216EowCPy9XueAsQ/9kDzIRk3z?=
 =?us-ascii?Q?AohmpidLOjhsvs6qp0JmtC0lM0cnTCu4wgFkHsdfxcD8bpMPU/64cbfdHsYs?=
 =?us-ascii?Q?s2A2RhvH2Z8fc0dORHyiM6rdF5FwhY5G5hAIHG5jiPgKHwpM7TLIMjBxhaof?=
 =?us-ascii?Q?ZUTIlsPYm/yWWAxBr+R/0BQrFAYZ7HpQUvNBN46gOFqMuy6qsZ6DuJwbSx5a?=
 =?us-ascii?Q?vjaINh5EYafmf5gpdwTzQSl4IIqgK1e4S0mZxcwv3KzA7TTgQtsMoLKtuc2P?=
 =?us-ascii?Q?V0FPsqgKSYKba79SFG05hn6gRIowfhKUkYdFLGKgU5hGej1VY4PWQoEr9XrF?=
 =?us-ascii?Q?JfcbiEaGyZnmiQqroB/NSqrYUKzSRJKsA4Z7JQ8OB6XI4F1zazGm4gdbMgD2?=
 =?us-ascii?Q?Clqunv4vpjohnpusOcNH4HPYuXDAF67pDa6A3MaQ5dYpgDaA8lvz2A9NHxWj?=
 =?us-ascii?Q?thTUib0TmQGj9CNIEjqhPVp5IWkzZSDssCs0VjSijAkt80ADbx54MyyO12EX?=
 =?us-ascii?Q?BhuezegPAcF/Ap5lEJxWQhvM3/0w2/gJ0BQ3MXlv7P9KrDZngTO70Em1XShM?=
 =?us-ascii?Q?+huCj/d7GubQraZ4O7w2Vadb3BM2Rmr/Gkyiq9OP3KhPAb8Hi5j47wBfWSlR?=
 =?us-ascii?Q?55nSNJILuUi4tgAZo4vtkCiyI6J/qhyFZHtqJBbxK5pbfs98yHFCDlLgpnjA?=
 =?us-ascii?Q?tu0iCsWKK8Ub/m3XP27Nz7sip/XVDxZXHlK0RFPx1BIWjDx7uDest/zzpv16?=
 =?us-ascii?Q?HxJMCWEvU5xS3jl8+lLTMh0EgRF8rasCYPQCI+7+XsXYmL2BccLZis1l/dym?=
 =?us-ascii?Q?OY3Jq7doKXwgYuwUme0EGGJ7EjwSLosysxCCI9rIWfCVIrqMpgYiBnGXYvZ8?=
 =?us-ascii?Q?WGjjHHZOFYm2YWjK/YTc0qvl4bYOFTqPnswfdNyTDKeeV9X1fyWW4WunFXre?=
 =?us-ascii?Q?50aPEeOttT5NygG5K33bLjF7Ajf+t893+bNP2Hak8HlDkaCPLM3aDGaYDcD7?=
 =?us-ascii?Q?IdzCf97/1d1vNkopqXj6OVPbLSCjX+82OBc5UyUZkcIiYzCKlSeMbIizSmZS?=
 =?us-ascii?Q?lWfcKLwyesNhBX/QSKP9/lDxPoOqlTCMydkythaZSWrFQQtPzCXJt0KbUgxv?=
 =?us-ascii?Q?/ouFcLnxhd4GFpTP9uyQKFD+U7EhbpvCCm/JFia3GuRElyKuvP/+zLWOZ3Yq?=
 =?us-ascii?Q?hHloM2K4H9wuqifw7gNSx8/Ea+l0fuL1c4me4dw9DjMQwpM9oQQVbHPLNFn9?=
 =?us-ascii?Q?KCeQ4ceUEX4ptMqsiT03pE8utFs7JiQOtXDQoTJUaa0+JIT1x3Q+VD2gU9Q2?=
 =?us-ascii?Q?2EEInkAT8ofi+OfS12qCeW146V1uyH3vjRLjQlrsT06vPmcuQzlutxQLT6Rh?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e634f3ab-35b0-46b3-8ce0-08daa26a4e08
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 22:31:08.8262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QiSPIA4ibvHXCIEd/ZPf6+pzo2Poi6F3FVfWuPojyFZwUXt93lBupgI/r8YXFBFAcAfQlqNmbfPTuWs0WfHLEcAirB296sPKQMH4FfkdZ9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6072
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_13,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290141
X-Proofpoint-ORIG-GUID: LHmuQkfaSG3x1NBZU_5KeqqY3D1nWA70
X-Proofpoint-GUID: LHmuQkfaSG3x1NBZU_5KeqqY3D1nWA70
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

On 2022-09-29 12:49:51 +0200, Paolo Bonzini wrote:
> On Wed, Sep 28, 2022 at 8:06 PM Venu Busireddy
> <venu.busireddy@oracle.com> wrote:
> >
> > Section 5.6.6.3 of VirtIO specification states, "Events will also
> > be reported via sense codes..." However, no sense data is sent when
> > VIRTIO_SCSI_EVT_RESET_RESCAN or VIRTIO_SCSI_EVT_RESET_REMOVED events
> > are reported (when disk hotplug/hotunplug events occur). SCSI layer
> > on Solaris depends on this sense data, and hence does not handle disk
> > hotplug/hotunplug events.
> >
> > When disk inventory changes, return a CHECK_CONDITION status with sense
> > data of 0x06/0x3F/0x0E (sense code REPORTED_LUNS_CHANGED), as per the
> > specifications in Section 5.14 (h) of SAM-4.
> >
> > Signed-off-by: Venu Busireddy <venu.busireddy@oracle.com>
> >
> > v2 -> v3:
> >     - Implement the suggestion from Paolo Bonzini <pbonzini@redhat.com>.
> >
> > v1 -> v2:
> >     - Send the sense data for VIRTIO_SCSI_EVT_RESET_REMOVED event too.
> > ---
> >  hw/scsi/scsi-bus.c              |  1 +
> >  hw/scsi/virtio-scsi.c           | 16 ++++++++++++++++
> >  include/hw/scsi/scsi.h          |  6 ++++++
> >  include/hw/virtio/virtio-scsi.h |  1 +
> >  4 files changed, 24 insertions(+)
> >
> > diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> > index 4403717c4aaf..b7cb249f2eab 100644
> > --- a/hw/scsi/scsi-bus.c
> > +++ b/hw/scsi/scsi-bus.c
> > @@ -730,6 +730,7 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
> >            */
> >           !(buf[0] == REQUEST_SENSE && d->sense_is_ua))) {
> >          ops = &reqops_unit_attention;
> > +        d->clear_reported_luns_changed = true;
> 
> Any reason to have this flag, and not just clear
> s->reported_luns_changed after scsi_req_new? Is it to handle the
> invalid opcode case?

Immediately after a hotunplug event, qemu (without any action from
the guest) processes a REPORT_LUNS command on the lun 0 of the device
(haven't figured out what causes this). If we unconditionally clear
the s->reported_luns_changed flag right after calling scsi_req_new(),
the action taken in scsi_device_set_ua() is undone by the eventual call
to scsi_clear_unit_attention(). Here is the sequence of the events:

(Note: SCSIDevice = 0x7ff180005010 is lun 1, and SCSIDevice = 0x557fed88fd40 is lun 0)

virtio_scsi_hotunplug(): Entered, reported_luns_changed = 0, VirtIOSCSI = 0x557feda9f750, SCSIDevice = 0x7ff180005010, bus = 0x557feda9f9c0
virtio_scsi_hotunplug(): Exiting, reported_luns_changed = 1, VirtIOSCSI = 0x557feda9f750, SCSIDevice = 0x7ff180005010, bus = 0x557feda9f9c0
virtio_scsi_handle_cmd_req_prepare(): Entered, reported_luns_changed = 1, VirtIOSCSI = 0x557feda9f750, SCSIDevice = 0x557fed88fd40, cdb[0] = 0xa0
scsi_device_set_ua(): Entered, SCSIDevice = 0x557fed88fd40
scsi_device_set_ua(): prec1 = 0x7fffffff,  sdev->key = 0,  sdev->asc = 0x00,  sdev->ascq = 0x00
scsi_device_set_ua(): prec2 = 0x00003f0e, sense->key = 6, sense->asc = 0x3f, sense->ascq = 0x0e
scsi_req_new(): SCSIDevice = 0x557fed88fd40, bus = 0x557feda9f9c0, buf[0] = a0
scsi_req_new(): sdev.key = 6, sdev.asc = 0x3f, sdev.ascq = 0x0e
virtio_scsi_handle_cmd_req_prepare(): Exiting, reported_luns_changed = 0, VirtIOSCSI = 0x557feda9f750, SCSIDevice = 0x557fed88fd40, cdb[0] = 0xa0
scsi_clear_unit_attention(): Entered, buf[0] = 0xa0, SCSIDevice = 0x557fed88fd40, key = 6, asc = 0x3f, ascq = 0x0e
scsi_clear_unit_attention(): Exiting, buf[0] = 0xa0, SCSIDevice = 0x557fed88fd40, key = 0, asc = 0x00, ascq = 0x00

As can be seen, before the guest does anything, we cleared the
reported_luns_changed flag as well as the unit attention condition.

Therefore, when the guest eventually sends a TEST_UNIT_READY command,
we don't report anything back, as can be seen by the traces below:

virtio_scsi_handle_cmd_req_prepare(): Entered, reported_luns_changed = 0, VirtIOSCSI = 0x557feda9f750, SCSIDevice = 0x557fed88fd40, cdb[0] = 0x00
scsi_req_new(): SCSIDevice = 0x557fed88fd40, bus = 0x557feda9f9c0, buf[0] = 00
scsi_req_new(): sdev.key = 0, sdev.asc = 0x00, sdev.ascq = 0x00
virtio_scsi_handle_cmd_req_prepare(): Exiting, reported_luns_changed = 0, VirtIOSCSI = 0x557feda9f750, SCSIDevice = 0x557fed88fd40, cdb[0] = 0x00
scsi_clear_unit_attention(): Entered, buf[0] = 0x00, SCSIDevice = 0x557fed88fd40, key = 0, asc = 0x00, ascq = 0x00

That is why we need the d->clear_reported_luns_changed flag, to know
when we genuinely processed a command from the guest and only then clear
the reported_luns_changed flag.

> 
> I just reread the code and noticed that there is also a *bus* unit
> attention mechanism, which is unused but seems perfect for this
> usecase. The first device on the bus to execute a command successfully
> will consume it.
> 
> You need something like
> 
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index 4403717c4a..78274e8477 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -1616,6 +1616,24 @@ static int scsi_ua_precedence(SCSISense sense)
>      return (sense.asc << 8) | sense.ascq;
>  }
> 
> +void scsi_bus_set_ua(SCSIBus *bus, SCSISense sense)
> +{
> +    int prec1, prec2;
> +    if (sense.key != UNIT_ATTENTION) {
> +        return;
> +    }
> +
> +    /*
> +     * Override a pre-existing unit attention condition, except for a more
> +     * important reset condition.
> +    */
> +    prec1 = scsi_ua_precedence(bus->unit_attention);
> +    prec2 = scsi_ua_precedence(sense);
> +    if (prec2 < prec1) {
> +        bus->unit_attention = sense;
> +    }
> +}
> +
>  void scsi_device_set_ua(SCSIDevice *sdev, SCSISense sense)
>  {
>      int prec1, prec2;

I tried the above suggestion. Even with the new suggestion, we suffer
the same fate as with v3, except in this case, we end up clearing the
bus->unit_attention instead of device->unit_attention! Traces below:

(Note: SCSIDevice = 0x7f2c54027790 is lun 1, and SCSIDevice = 0x5599135fbd40 is lun 0)

virtio_scsi_hotunplug(): Entered, VirtIOSCSI = 0x55991380b750, SCSIDevice = 0x7f2c54027790, bus = 0x55991380b9c0
scsi_bus_set_ua(): Entered, bus = 0x55991380b9c0
scsi_bus_set_ua(): prec1 = 0x7fffffff,   bus->key = 0,   bus->asc = 0x00,   bus->ascq = 0x00
scsi_bus_set_ua(): prec2 = 0x00003f0e, sense->key = 6, sense->asc = 0x3f, sense->ascq = 0x0e
virtio_scsi_hotunplug(): Exiting
virtio_scsi_handle_cmd_req_prepare(): Entered, VirtIOSCSI = 0x55991380b750, SCSIDevice = 0x5599135fbd40, cdb[0] = 0xa0
scsi_req_new(): SCSIDevice = 0x5599135fbd40, bus = 0x55991380b9c0, buf[0] = a0
scsi_req_new(): bus.key = 6, bus.asc = 0x3f, bus.ascq = 0x0e
scsi_clear_unit_attention(): Entered, buf[0] = 0xa0, bus = 0x55991380b9c0, key = 6, asc = 0x3f, ascq = 0x0e
scsi_clear_unit_attention(): Exiting, buf[0] = 0xa0, bus = 0x55991380b9c0, key = 0, asc = 0x00, ascq = 0x00

At the end of the above sequence, bus->unit_attention is cleared! After
that, when a TEST_UNIT_READY command arrives from the guest, we do not
report anything back, because no unit_attention is pending, as seen below:

virtio_scsi_handle_cmd_req_prepare(): Entered, VirtIOSCSI = 0x55991380b750, SCSIDevice = 0x5599135fbd40, cdb[0] = 0x00
scsi_req_new(): SCSIDevice = 0x5599135fbd40, bus = 0x0x55991380b9c0, buf[0] = 00
scsi_req_new(): bus.key = 0, bus.asc = 0x00, bus.ascq = 0x00
scsi_clear_unit_attention(): Entered, buf[0] = 0x00, bus = 0x55991380b9c0, key = 0, asc = 0x00, ascq = 0x00

As a result, the guest does not see any REPORTED_LUNS_CHANGED sense data.

> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
> index 88e1a48343..0c86d0359f 100644
> --- a/include/hw/scsi/scsi.h
> +++ b/include/hw/scsi/scsi.h
> @@ -186,6 +186,7 @@ SCSIDevice *scsi_bus_legacy_add_drive(
>                                        BlockdevOnError rerror,
>                                        BlockdevOnError werror,
>                                        const char *serial, Error **errp);
> +void scsi_bus_set_ua(SCSIBus *bus, SCSISense sense);
>  void scsi_bus_legacy_handle_cmdline(SCSIBus *bus);
>  void scsi_legacy_handle_cmdline(void);
> 
> 
> and if you call the new function in the plug/unplug callbacks it
> should just work.

What shall we do? Keep the d->clear_reported_luns_changed? Or, is there
a better way to define/handle that flag?

Regards,

Venu

> 
> Paolo
> 

