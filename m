Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8D65C0039
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:46:37 +0200 (CEST)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0zj-0001gb-RF
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ob0uk-00041K-VG
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:41:27 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ob0uh-0002yl-Uc
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:41:25 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LDjs7b010769;
 Wed, 21 Sep 2022 14:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=34c74aXJdYUuQKT8POfn9Eyibh22sjPKMEtm6Z3g+EA=;
 b=NVSX8pwn+xHX8u0/2CDieE12kVuhbZgjnkXT0yYTGSmNSZkXFTqb/qPucu4PpiHdkcmc
 AbjPYgF4zC2a3b9wmifcv2p23rYEG+xAyImiZTpVRTmyzyMX7TV6wh6RecGX8RgvdsWV
 AxOVzUh2SRbqWehfQVz2/pmZ7fh3StJw1gs73amdBDJaSRGsIdBAAPiNNo1yIMZkQmvE
 z0O/ARxFaiivSXHhinmUSG4SnElVo64Lza/dGh6MulW6Xrqg0LioeJ9Sn6NwaPyA2zCb
 aFgy4X8QU08N4RsM6J4bJ+gALt2qWuFB7IWu3i7UVSn78wfKeuh825patbK0FWELKz9J 8g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn688j8d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Sep 2022 14:41:03 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28LELDN3027836; Wed, 21 Sep 2022 14:41:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp3cpj0fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Sep 2022 14:41:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7+ZA0Tqcfm6FteF2CIPYEa2X/ykJ6tKPiwZ8DPiQauQmAnrQ7SMQMAGP9npVcBPCMvxlFuHimIX2+GBmE5le8S7FB5yavqwyerUJ026kD3ibHN7ebchxn9OIV7IxeCrHaBNaWiOIoLO7W52fB204ywLD0uk7UfPyiV2COoUEfHMUJUMMuM1sx62Hsv3cqrLhjEz1ScTFhtChwGtT0ohAnoDmonXmHwnhVLRWdEH4xeHuKe+6+BXllbu8YoMFOkcrx2CUIBTuJ1xfrJ5OBR+IT/1MdUM6EV7vty0sKH9Hh4tbJRC+CgvniceeobIAbWPIxcSM+84HaiGo+D1MfaFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34c74aXJdYUuQKT8POfn9Eyibh22sjPKMEtm6Z3g+EA=;
 b=Y8GCpOme96U3dj9Xi5vO3UIwmq1juM6iEZF9C31xbbsq9ZwE9AddvubcKGRqKlG/DYrKyQrS8y9tyTB39+NP7ul6HV3f/0BO+VddmUm3pyctECfYRoGOmvDojKyX8whNepULZ9waZIcIhwNg3KXLPxCA7lFQ1m3N4gGoeZisHKuJ2RVGo/HAAG4txAVI+UZAPAtwjXVmFT6iidEcm4n9jlf57l1VFzHhPPJ9LBRFN5BLTV/FvGZCurg1qDCtT+XQ319hJ0Quss6LR8ykr1Pyop0V2m7inp2EDjK75+7UNdFznfQOa979yRy7CL7ycpoIZKgV05J23fN1kMkZvSMDSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34c74aXJdYUuQKT8POfn9Eyibh22sjPKMEtm6Z3g+EA=;
 b=YUZBnbVf2A71rpHPCUSoYhjMlgEalsU2QLDuqIOIevy7TGqwlq/ZyGrJAtje16HAbx+hJNjl9ME3ms+LeKHe+b4Fa0h5q8VJp4SNeNz6NvQGC3X8AEKeTVBWMXJ/r2p0APmwKrB/YoUjf4freQlxoNTW0x1GyGVhepoFIsxoA/g=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by CO6PR10MB5651.namprd10.prod.outlook.com (2603:10b6:303:14e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 14:40:59 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8563:4b2c:8877:1815]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8563:4b2c:8877:1815%7]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 14:40:59 +0000
Date: Wed, 21 Sep 2022 09:40:56 -0500
From: Venu Busireddy <venu.busireddy@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
Message-ID: <YysieAEVGkChLLaK@dt>
References: <20220915233302.145926-1-venu.busireddy@oracle.com>
 <CABgObfZyG1FB5yYEzyH01K6Epsv-oivseHdQUO1bn8OE3+B6NA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfZyG1FB5yYEzyH01K6Epsv-oivseHdQUO1bn8OE3+B6NA@mail.gmail.com>
X-ClientProxiedBy: SA0PR11CA0121.namprd11.prod.outlook.com
 (2603:10b6:806:131::6) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|CO6PR10MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfc4889-7873-42a6-1506-08da9bdf4ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IoEjzERPvImD8Ixz+DOY0hMG3Wwe9CNDaHoAlaNRu78mC31WZor4yfdO7OAl+f8tWXLD1iIUnH0NEa1Tyu4b5OypUTE8BR4z9olWi4kuHbEnuYhX6NDnnPaI39FhG2KTfZXU5OYc5qxuZcKaFbyt0ZGsEejmxPSl+X8ij5c8XP4FMyvzx/oh7MntVYsjh7GZ/KVltEJkPTKGO/gJ4hh/HUvnpxHOKpK1ik7SNAnGvoqLbskWush0y1gLd2Cg5vQzzBGdZc1+csu3zNv+4gAj17xCNOyOp21LA6TDrf2vmKbEFR8uHeDAyNNE16yd8fQmpnh/XQDNqqTm3ubwVYU8heTR8WeGiFNyuOKd5FBz2+2IiK4mTWzvTQRp2BGvpgaD7aYUEGPTTfnuI69t7sN9gmyRm+/VmSrvu/skbt41liM8Uo6iKki6z58q3o4xSLpE3158YUmAZnxpRSxv5l/IaydZl8ZTJDAE1Bj8QPrZXfANPTwADoYh+fLT3FdgdhmAUht25kokuwo0MYU7GvNgohzt4XWiAgW/+e/w6lAxIwC7iJAI4JnmUnX8eruqL48OE6q8fkuikQUhaqlwEda251RVRkeZELDx75zbklyoFhAph08DXtySoVXUGmSx5HXwCqAdxgAhJYL4Q4Z2DO0TqYKUfeC6FL1bdW/jSPJH8lfqObdkWVzVGVUIvskitD8RWCLTtxCNMI2vGRRRINKiIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199015)(478600001)(41300700001)(86362001)(66476007)(5660300002)(8676002)(4326008)(66946007)(6666004)(66556008)(6916009)(38100700002)(2906002)(6486002)(8936002)(316002)(33716001)(54906003)(44832011)(186003)(26005)(6512007)(9686003)(83380400001)(53546011)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DuEmn8SPs0pLsFgF7a+yL2EE3vU1DCVC5mkZGVZLKUFh9+0WC7yTd1pb6XTv?=
 =?us-ascii?Q?Uev859ckN0/WoRnzab7UvmhvOAoEx78oGMAcuiZWxAjzsrYK6FszeGtOrMvU?=
 =?us-ascii?Q?eZLWEB4zIboItC4cKnwaOWVHA1FIqOvpXtSwvRyvYAViCJmWA2IF4YxMKHsc?=
 =?us-ascii?Q?D1XnsvgCmPhkWKwrqhKxZBrc4XRYJZ3t8cRoIMLlKgq2oVdp65WR8UYZQ9Z9?=
 =?us-ascii?Q?CDP4odfRhmF8WL9+Ke70oBo5qApWCwIwmW2cskiIpN85fNEVDSzzZZx9PN8f?=
 =?us-ascii?Q?f/f01WP7Z5jLvkYPyS3KpKBVVOJJ5zwnSdBFK1K1iM4rk9GRh3NOJN16gix4?=
 =?us-ascii?Q?o48clRLAEjNgnj6GqSSQjQcO9jyO3/IxS8VTXL1w4aAcZsuZ36LZHlAnPJYE?=
 =?us-ascii?Q?lhOAqMGDSpA3ekDHWWOzXMFXoYpgrm5k9yMui3heKuDhxt755K7Owp/6gKO7?=
 =?us-ascii?Q?J5venEfKcQe9gbWYGhG8Dz94bDPc7hB5hY6PQ8RzpHPEt/F3128v5MZCD48F?=
 =?us-ascii?Q?0DLWPJPcmXLrBwVfyBSDXAaKrtWrKLv5FdHmFoo7YWchtvzF4EN+Q0lLc6RB?=
 =?us-ascii?Q?DHUJOBnUI8n3nYV8hPSH2YjTzzwn8Yy8macN302JLIjiOZ2buwGYKtDZj69g?=
 =?us-ascii?Q?sSwhJwKQQy0aNqeAHWehnebKVoWladNQH8vk983Z1IxtQm/sqaVYRM6z9fpg?=
 =?us-ascii?Q?qCIDTEBgyLGbpmFG8dCo0AtpGhLjl5Xzrd31Qk9bzJX99tDKfU8w06zgc+ZO?=
 =?us-ascii?Q?DqMNmtaYqfD6ahR/5XlNMNVEsJzDxokfi2Dpgsf0E+dOkQui8+CQM7TH/6wi?=
 =?us-ascii?Q?5KKvFUUqjGYCioyVfMiri3edVZYgJrz0VFP+jCK6/pfvEfT687sl4jFgmL9I?=
 =?us-ascii?Q?sAKxGaIUFzMO3OTu57ObryhEkU1F02LZVLrpcBa/1pIUpjRxB7GiMlUHfnbc?=
 =?us-ascii?Q?wcVmiBUmovLpaXn5WYVGawrc9wp6/e+Ott4FlDa2QwMMKZHYjqbBgeGMb+0I?=
 =?us-ascii?Q?e8DfrOP9ZcF1EZqSOEErn7d9BOZ34Kk5DQyi6y+QJauKmznndiFfCOGsWuLs?=
 =?us-ascii?Q?HcS1I9okrN9GZfGz/35ur++yCf7+u9Slo0kqeOS3UgtGMAcEVYFoGsn5z2WG?=
 =?us-ascii?Q?2oqHXoku9AtIE80i5WZ33QtinIUrdC7Kpt0FrmJ1XhiwO7GJJUKvWDOXdZBe?=
 =?us-ascii?Q?bxI++HM8YP3fKpdWfgGTbbiG0yY/yY5J5cTAAJInoYHDqohqyKaOAgE1kir1?=
 =?us-ascii?Q?qimEAObMN/ejmGnRvF7LLuChgb2D9C16NhHrBApAmj/d6zzbFLqqqy1yq2F5?=
 =?us-ascii?Q?X4L0hPI/B6HcPZTH3Ib2LXD4oQVwnPMMe4GDbvJ/KZZ2gCkfW80W4eW+k8zA?=
 =?us-ascii?Q?o4vrytiaMhAPBPXSaLLRUv6TjLu2APmkY2oqmHsVgfP1IKCicKGA9akSU8B/?=
 =?us-ascii?Q?YxeBXj9eKMKbXl9HogcQ7t+kxW5IphV6BL6oQF0xG9ddOZCL+wX+5iQ5iHMF?=
 =?us-ascii?Q?0C+atUw6ssfNczM8idVqnCJD+PAVMW9QoOuktxBvHlLXUYc73KeI7vR+CnAS?=
 =?us-ascii?Q?ho2yqhel5F+cEJEBaxi+4TSWGwoaP8e/kHTr0yYHcDhNPsfGcuts/Gn1hJvL?=
 =?us-ascii?Q?8A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfc4889-7873-42a6-1506-08da9bdf4ce5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 14:40:59.8315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jyWvMLCreZTCF8Keemh6fL5CCNK9ErGoPsVjorqAxiHsaga6bgh8n2xCZUu5qiZ2CQLMKWTSKuJ6FG7einVYvDLqkER6oI4kZQjcxuQpMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5651
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_08,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210100
X-Proofpoint-GUID: AG1AcyGrFw6xde8wxaYinJoPZ9HKGlcH
X-Proofpoint-ORIG-GUID: AG1AcyGrFw6xde8wxaYinJoPZ9HKGlcH
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

On 2022-09-21 16:33:35 +0200, Paolo Bonzini wrote:
> On Fri, Sep 16, 2022 at 3:44 AM Venu Busireddy
> <venu.busireddy@oracle.com> wrote:
> > diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> > index 41f2a5630173..69194c7ae23c 100644
> > --- a/hw/scsi/virtio-scsi.c
> > +++ b/hw/scsi/virtio-scsi.c
> > @@ -608,7 +608,19 @@ static void virtio_scsi_command_complete(SCSIRequest *r, size_t resid)
> >
> >      req->resp.cmd.response = VIRTIO_SCSI_S_OK;
> >      req->resp.cmd.status = r->status;
> > -    if (req->resp.cmd.status == GOOD) {
> > +    if (req->dev->reported_luns_changed &&
> > +            (req->req.cmd.cdb[0] != INQUIRY) &&
> > +            (req->req.cmd.cdb[0] != REPORT_LUNS) &&
> > +            (req->req.cmd.cdb[0] != REQUEST_SENSE)) {
> > +        req->dev->reported_luns_changed = false;
> > +        req->resp.cmd.resid = 0;
> > +        req->resp.cmd.status_qualifier = 0;
> > +        req->resp.cmd.status = CHECK_CONDITION;
> > +        sense_len = scsi_build_sense(sense, SENSE_CODE(REPORTED_LUNS_CHANGED));
> > +        qemu_iovec_from_buf(&req->resp_iov, sizeof(req->resp.cmd),
> > +                            sense, sense_len);
> > +        req->resp.cmd.sense_len = virtio_tswap32(vdev, sense_len);
> > +    } else if (req->resp.cmd.status == GOOD) {
> >          req->resp.cmd.resid = virtio_tswap32(vdev, resid);
> >      } else {
> >          req->resp.cmd.resid = 0;
> 
> Hi,
> 
> a unit attention sense must be sent _instead_ of executing the command.
> 
> QEMU already has a function scsi_device_set_ua() that handles
> everything; you have to call it, if reported_luns_changed is true,
> from virtio_scsi_handle_cmd_req_prepare() before scsi_req_new().
> 
> It will also skip GET_CONFIGURATION and GET_EVENT_STATUS_NOTIFICATION
> commands which are further special-cased in 4.1.6.1 of the MMC
> specification.

Thanks, Paolo. I will test your suggestion (as soon as I finish what I
am working currently), and get back with either more questions, or with
a v3 post.

Venu

> > @@ -956,6 +968,7 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
> >          virtio_scsi_push_event(s, sd,
> >                                 VIRTIO_SCSI_T_TRANSPORT_RESET,
> >                                 VIRTIO_SCSI_EVT_RESET_RESCAN);
> > +        s->reported_luns_changed = true;
> >          virtio_scsi_release(s);
> >      }
> >  }
> > @@ -973,6 +986,7 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
> >          virtio_scsi_push_event(s, sd,
> >                                 VIRTIO_SCSI_T_TRANSPORT_RESET,
> >                                 VIRTIO_SCSI_EVT_RESET_REMOVED);
> > +        s->reported_luns_changed = true;
> >          virtio_scsi_release(s);
> >      }
> >
> > diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
> > index a36aad9c8695..efbcf9ba069a 100644
> > --- a/include/hw/virtio/virtio-scsi.h
> > +++ b/include/hw/virtio/virtio-scsi.h
> > @@ -81,6 +81,7 @@ struct VirtIOSCSI {
> >      SCSIBus bus;
> >      int resetting;
> >      bool events_dropped;
> > +    bool reported_luns_changed;
> >
> >      /* Fields for dataplane below */
> >      AioContext *ctx; /* one iothread per virtio-scsi-pci for now */
> >
> 

