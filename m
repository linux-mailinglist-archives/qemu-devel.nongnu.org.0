Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E7C5F0DDA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:45:51 +0200 (CEST)
Received: from localhost ([::1]:40782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeHGw-0006Jz-1L
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1oeHDU-0002sB-8J
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:42:26 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1oeHDN-0001Yr-Oh
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:42:13 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28UDeVgo010516;
 Fri, 30 Sep 2022 14:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=kUMLCNMe0LLujynXCl/R18dk9nxJdyDd6BgRg4MDL6s=;
 b=lyqQ2Esr6ON1FVDrY3y/soHKY9ThhyrTv1KsskIof2dlN+7GZjv6DIzQJceBC2zMaX6Q
 Jg8LoiF5gnixLVTfIMX/wnzK1aaAue8pkFkXuQOwXyIhnCGLIfWI2kN7FDCZJkHJkSpD
 GSfLFc5Mnb/rgn7m54CwsKXD6QbsVuaWaFnfniWGg2NeRv2zaNdFYs5i+DjRp7VBJniv
 8dDrSAriLni83dHw5s5LNiietw3xwBom/2/wMa86me7W77IRp6o8omKhuu1PeEC8C6k3
 ew1DaTvAIPxe+LMtl/0tJaPkC4ps4fGtG1pl3zq/tTRZj2GNZfkkPuxEh4LDa+9iH2uo Pg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jstet8f2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Sep 2022 14:41:57 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28UDgt14005138; Fri, 30 Sep 2022 14:41:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jtps8xe0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Sep 2022 14:41:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRdw1tP4IGZBJWoVijdINZFYme4X0qwbMXiEOUG2snafVNHwSvDmV4y0ITw97KXowPaomraQWNdCfUUEaVyfq/8vQoQZZwkeyz8XUR7LEaZmgTDL6OdDJXOyOXyMuorXAPsPnaBpOwyji8nkRzD1WQUtiKvtGrrZBxIwCzkT4M/aLrFYtBBFQvVEeHeKRAOeR3AaAHoZJldauNP2OlUBW4ETGI5yM5iOqr3dqrVeqlRB/fvwZ1YVETtkiOTYkkbbDv+RaS52jE8Ve5MJVtawdCJtdoNSlMLjHm30VOMi+tIm4db2ufARwlm1XhIzwl/ShfCXVu5qFwe116fjerxp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUMLCNMe0LLujynXCl/R18dk9nxJdyDd6BgRg4MDL6s=;
 b=d2lxP2DRL/VTgAJeArBQFd5L4NOBgluVFocL8BtN6lyVe3Iv2p46wpx/7jshhXsbCMV/alEYPGxFHHnMiuSI5VSIHsxTVKqOxvasSvot78zTMcZwQE0lwkHn+Kx1Mg8fooX9Il+3dWaJ+wSZoG+yEOXN/7vFawQoXMtcQ7llFwNWtUpYmgvXQOK0mQ4wcgwvGDW2zbZNDprHzosNojTjzaBRUWvEbs9OpO652oiLyftMYpm5mmLsTlupz6LzXy414cWCqczryG7QXwV2syl+xbS6XjGjuey/PPD193o5EdR34sQ9ObQ4y9MztRrFfK70WR0WbPaN+ohCUMvmfpUYdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUMLCNMe0LLujynXCl/R18dk9nxJdyDd6BgRg4MDL6s=;
 b=tnj8GfTTRYsheWSYyQEeY9XTud7hINv67n5h2o31C1I8LmdXduG/0quqOJXWrdRSNLMlYN2klbwMA2ccoxoKArI5MqpNDp1ZohXXSnx6JFqY+0HTXn3z2DO9mY2IasQagVdOWQ+0dcXv+KMN4ThCiyS+gBHbl+idj7NgXkLR818=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by SN7PR10MB6474.namprd10.prod.outlook.com (2603:10b6:806:2a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Fri, 30 Sep
 2022 14:41:52 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 14:41:52 +0000
Date: Fri, 30 Sep 2022 09:41:47 -0500
From: Venu Busireddy <venu.busireddy@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
Message-ID: <YzcAK23fRnohvXNT@lt>
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
 <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
 <YzYcqNqVCiobf/IB@lt>
 <CABgObfbydWZbUvgQVA4ACaR8GgZuft8c9bMTm7_bM86P44vnig@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfbydWZbUvgQVA4ACaR8GgZuft8c9bMTm7_bM86P44vnig@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|SN7PR10MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d13ca4-bd03-4cf1-b851-08daa2f1e9d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: snvE4vxochq45DCd8C0maZ05XW2gPcP7nIh/N8DA4LMnTy50GT35a+M9kcl5L7Zfe0H7rZkNaeUJyfH/LBlOYz/d42zRd6cgZjI/agAvwpZk9Q6hC8K1W4gHoEETHVFhSxog5mpOVDpx1PlZVt0h3uhns0ALrS6EUxEf8SZ4uxeFwGBYQSoNVtqep1WEissZMCcRtQk4YzU08UmUk7/hlzvNBQbpDKJ9Q4QXAOA3e3V/lz88qNUAesYr/ujXszmdMxWj1nsXQHGltUqphr0PZkYF7RXbezwg+kc6+NIj0nt4R/AkduI21IoE49TH7fyiawqj3NMNBM5JQV5ROO69NppaWdw6E8jloaClhQryZHY7eKdHx3M7XN9aeIUO6KRm/yAzBAw7MX5N/NcUKUiKtnuMbaOZBDBf+oe+faD2l1F13tLrRB+6pIsRY7Oq9xQRYU5HJd9YZoF2FTZaw/3Vg3Fi/oI45ZMIfRA4OOQ5FsMPvWO2MPj1SKSDnak5AQV7u5oB7xepSW8NsnkhJLvCgn1iQEjtZfXSf8eACixMS4bvY5t65+GMeJm4YzjaT9QFpCmcmemsgbDjedqVeExENHQu6fxTUcHjTqxaQpucwizE08QgvJATu3h8pglvCyZ5JYA5evNQrCuiX5tKzHm2IDg9YTowS9GL11nhfp//K5DQPY+3wa8HeXqE8MM46dbermgUGbegFt6PnQ0tlgUZAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199015)(33716001)(38100700002)(2906002)(26005)(9686003)(83380400001)(6486002)(53546011)(44832011)(8936002)(5660300002)(6506007)(66946007)(66556008)(186003)(66476007)(6512007)(316002)(86362001)(6666004)(478600001)(8676002)(54906003)(4326008)(6916009)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LZrsl3D7tb81ECGCI1eaS+aV+EniMlQB1XZOW9Dg3ajTsftmWZBGU9B5cVi4?=
 =?us-ascii?Q?rBWM9qAXy89RaBHYd1FOkyFw8EUa60hzCwn+0vYBTua/kg/LkdwN4VwwdjJt?=
 =?us-ascii?Q?xi0uJkquy0F30CSR/wm6HF5pmMYV0/bbF0nt/1XkuWaykdlfZnKz1JPQDdFO?=
 =?us-ascii?Q?ugOwSy8Z2ppPsYKdV5DlBMSnTbZzFing4qIE5iYJvtxoMpYN08LLRBFyTazk?=
 =?us-ascii?Q?Iy9pWNfmq5+IvFxiGOAuYJ59Haevin4tN1W84PZIK5M/KQXl1kqm0OQjevo8?=
 =?us-ascii?Q?uEiMQD7Du3RUEzGjt7ZmsXbEI9coMcWnAKOLD/3VJ+nYm0VUF/D31e3Uvdxe?=
 =?us-ascii?Q?xoGWt/hho04Y2vLJYO44BztpXHJSkzoOnZbfuJfkMFL32E5G7xlVfQl9bnhk?=
 =?us-ascii?Q?MFSH1ib5oB3/VueixL2WeK7hRShKpIJ2xPTDVtfTLNlm0bwBI+kXGk0Ztz6r?=
 =?us-ascii?Q?vQE2vbxp7+ztLHUpSXg0Ur+sURdD2SjGchyUUHPW2lC3z/wRxDpQWxrKsfUR?=
 =?us-ascii?Q?1NnSCUJsKyYmMO1PMy6sWBt6pzzzlCZuga8QsTxoZknDNDcQpjEdbR7PnrLp?=
 =?us-ascii?Q?Ijrv3y4qdjN3Yu+a8XauEWvgKEpZbT2KdAaVOjZBZE6NbQRr1K7V049HD4dY?=
 =?us-ascii?Q?TvfZyP6ul9Db7lKTM87RKWLb2jDEODxZuu4LPRJ8BnsGXfplAx/Me1AfOhV7?=
 =?us-ascii?Q?e8B19KYk32hnHYVkZGr507DPa6o1kiEzAaWTGKUCXY5zN6HddDSSvrvx2iUW?=
 =?us-ascii?Q?qw5ZQCoYEqIceLEdNSQNnJsmpcVXOXjyIwjpmiPWvkoQCxSpjiqKV5T72wQK?=
 =?us-ascii?Q?9nUYE3jy1CwabWVZ3Dvqb3R+m1APOHfZPVDKXdvEdPqodNUbDhKLxogKAG4o?=
 =?us-ascii?Q?X2H5h892+wSkvtfrZgRX/OjJSsE8O6f9HZMKex1NUsYTseXaFANpgQnLRm+B?=
 =?us-ascii?Q?RFn+YA4C5jCV9UjXQO9r/IpUWrP2HYbr3nxD8kyVnSJbDjIs+dMduJjUhJsk?=
 =?us-ascii?Q?t3zxnuo45KrAo1DGccqsOcr/IivVjt/yvBjXl1flq+3f7pctQeDoNWB8iw6R?=
 =?us-ascii?Q?k1/tahmwlnihGw0dSqyQZFjRz7Uf+QuIH5/Mr4s9pZNtvbt8gBwL124A7vKE?=
 =?us-ascii?Q?rI4gq7cGgxaCmnvHZg+TmSX7QZtgn22J1rV1gBk0fzZC5LtLil1NATFncG/F?=
 =?us-ascii?Q?3w0jn5dAqkYgAx8F3ZAQgKocYfs29aRcmwXI3j81vbsRcq7a9agkeHcHRUJr?=
 =?us-ascii?Q?ZpPwPdH4x+Gl8cefKJl/uipk1FOWwac/oROnCFOpuoaIcMVL+lLhINzfDy4R?=
 =?us-ascii?Q?GagzhP4k4/xrD/p/8gu4y7wGL/zbY6V/0YUBXvKbzbjOMqKVvV0SBvhcE+bF?=
 =?us-ascii?Q?zL46RzNDZ0wB8ivqtASGW/WrxKbZ+dEQbDnGiyxRi25ROCYRlAC4cndSq0tC?=
 =?us-ascii?Q?uBtUV4shc+yTXoXN93bwsWf/RxDOvDZrkbbGreCBZyVvN+6gZn49eJlx3GDM?=
 =?us-ascii?Q?a25DFNW0G75bKAY+Aycrh3cQzn2ECH+3js54189ylMmCtKyJTOF8pLKatgco?=
 =?us-ascii?Q?cyygDhiHvTf/EXwGWMmlXlgOqLdN6EZkuEyM8irvFra+PE/VhnzWNNlYyXyD?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d13ca4-bd03-4cf1-b851-08daa2f1e9d9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 14:41:52.1618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BJnGpswU8kt7ETPJxN/wGzpZKAQaPV3RVx/wB2BBYRdZoQhaDm3R6Om60Wt+MbGERIe9z/yCgSbTNMj8b8hy/wlCgfxe+CwhpaRybPjeP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6474
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209300093
X-Proofpoint-GUID: CIw1vXVYzza7mBMYSHGm6APA4F7Dg9jU
X-Proofpoint-ORIG-GUID: CIw1vXVYzza7mBMYSHGm6APA4F7Dg9jU
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 2022-09-30 10:41:03 +0200, Paolo Bonzini wrote:
> On Fri, Sep 30, 2022 at 12:31 AM Venu Busireddy
> <venu.busireddy@oracle.com> wrote:
> > > >            */
> > > >           !(buf[0] == REQUEST_SENSE && d->sense_is_ua))) {
> > > >          ops = &reqops_unit_attention;
> > > > +        d->clear_reported_luns_changed = true;
> > >
> > > Any reason to have this flag, and not just clear
> > > s->reported_luns_changed after scsi_req_new? Is it to handle the
> > > invalid opcode case?
> >
> > Immediately after a hotunplug event, qemu (without any action from
> > the guest) processes a REPORT_LUNS command on the lun 0 of the device
> > (haven't figured out what causes this).
> 
> There is only one call to virtio_scsi_handle_cmd_req_prepare and it
> takes the command from the guest, are you sure it is without any
> action from the guest?

I am sure, based on what I am observing. I am running the scsitrace
(scsitrace -n vtioscsi -v) command on the Solaris guest, and I see no
output there. I do see output when I run any scsi related commands (such
as sg_luns, sg_raw, etc) on the guest. But no output when I hotunplug
the disk, either while virtio_scsi_handle_cmd_req_prepare() is running
or after that, until I run any sg_* commands on the guest later.

However, for whatever it's worth, if I have two or more luns
on a virtio-scsi adapter, the spurious REPORT_LUNS processing
(virtio_scsi_handle_cmd_req_prepare() call) occurs only when
I hotunplug a lun while the other luns are still plugged in,
until the last lun is unplugged. I do not see the spurious call to
virtio_scsi_handle_cmd_req_prepare() when the last lun is unplugged,
whether that was the only lun present, or if it was the last of many.

Venu

