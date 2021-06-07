Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F6939D939
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 12:01:40 +0200 (CEST)
Received: from localhost ([::1]:50458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqC4h-0003Y2-EJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 06:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=785b62de8=Niklas.Cassel@wdc.com>)
 id 1lqC2F-0002Wa-Oz; Mon, 07 Jun 2021 05:59:07 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:19448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=785b62de8=Niklas.Cassel@wdc.com>)
 id 1lqC29-0004eg-Vg; Mon, 07 Jun 2021 05:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623059940; x=1654595940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=s9PgsUskqvbSNAA/vLcjTnhWfG73wHItM7wgFL63waY=;
 b=lmMHxfnYf7cItYs3HVnJ02mQ87DMPt2qAvcC6BKEi1do8pabqvaDCekh
 bGGyqDgm0XGnCBqzApNaAxBUCkbSohjkLt7YM8DO7gl8Qc0YpNeLJmvJK
 rly/3oh3q7oh/E3LxiATaWh+s9NRce9sCO5GmWZwzZevX1HirZDKIZDQH
 TGA+Tz4kF85qmVb12Ytt+Flzmrn9/BvBT+dvV45eFzdFL/eAFug/WRfQ5
 xJ8p24jE8+DyHTcVz6JRCv48f7HWfoL7Cz3bsIZjGQQ0Zqb9VB54V6UKj
 lUb1io+drvDzjp0Cpi7LJJhM0T0oEDAG3lbzoHhuUHdn9MM3D+qSN8mMz w==;
IronPort-SDR: c/YmPRMqoKem8C+wXD/nBZ/QFaqqVrCXl62fxvezACW3UsqvBbxC6mMTN/d0BbqceGFa1pKgJX
 5YeBsFkjSyQ1ZZh9Ubpv70NLhteueBFwr5X+dc2oQlIOFZd3Xwd5z19VXDTVPJZE0++E97Z+7w
 00F4PIkFVlC1P5Wxg7IzASnKhSq4NhTUfTyEDjD2yWUKBdxuhrvUAyarnrPP1zpqDZ/gVLSJOY
 47Gjvh8lXDzuYH9Sx502/wJJz9fScMVMoBVGbT5pFAOt6eGXJIWrO8Omr7wjcfzFRbG1PCktOP
 e7M=
X-IronPort-AV: E=Sophos;i="5.83,254,1616428800"; d="scan'208";a="175757895"
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jun 2021 17:58:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcZwJLAwDazz2EX7QTN6yTO3KukUvWb67GV1FQMS8ArIM/d9uF0nO68BwJGcm72trCxGuQf+RzcqeWc/sDRG6BfsmuhyYR8WZGiBNtv4O5qmAsmKNlARdJTWewMDfmf2IELBkwfRiN8zAmE++bvTeDVLJwwcgR689CNBrEKNrsIuNkaDF/w4nA8pWGrxQcTEEEL9U63kzw7MzM+gotVcKwXp+mYem3m87lK+MCxYc57PzQo7wEUDWHaSeHw22RCNk2mIVJuiYFNhif9T/pjUmSaU0qj9Q+T9RMxT3T+7ebJFZLKpFhfc34/tjx0T9oVsR1rMHIo0feWOIQFmioE1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ykk4O4lCJxBVCU5rqLkBgWE/cFStJgUVZORsu+/bNNk=;
 b=lR0DvLJYxuBLreBb9oP9J4JJsn0SlvgFOAzmbXgjd5EGHGEADmm1IfQdRldK+z4d9eqC1379TVmuZDP3+MJ39hRh4lylt+6pU77bPweK65RK9cv1aUUr0SP6mEhog0MyjkS9oetGCQjXOXWZQ7t+AeAi9PxWZ9DbgnUFtrNqCuBdIvwaXsGcpe1WToq5S4zIYzFQv36G3FtEXAQfGr2eNcjmLEqqGcMHzEv46lSNd6BwFvE6hk6xTm9b16cITS8OPEiarravA9DpRysBo67mj/64M4+Y3s/leXSBosJ+m0zAc56uvIf/iJo+jHTNJWMDTdkAZMmUiLe7WKU0JKsh9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ykk4O4lCJxBVCU5rqLkBgWE/cFStJgUVZORsu+/bNNk=;
 b=Pt4zF3hBMWpOkG72unBv2SFeaaet1DGm+PvUWBAd12agMd084n84bDRN4wKEvT5IWw+/Ni0ZjX8d0qiP5IU6BeP833+bR2L9WZJZwI9b3j+h1OChdLSlR8HVz1/hyRVK9jEyrooQUTyxYsdZgert+8upB3G6q6n67l4Y+bQhfqk=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by PH0PR04MB7704.namprd04.prod.outlook.com (2603:10b6:510:4c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 09:58:56 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::45d7:388e:5cbb:ae1e]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::45d7:388e:5cbb:ae1e%6]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 09:58:56 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Thread-Topic: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Thread-Index: AQHXU7FRNLQ7NeS/402zZyMJ0bJ5NKr4wCQAgAT/kwCAAEIzAIAAxqYAgAmWJACAAAFagA==
Date: Mon, 7 Jun 2021 09:58:56 +0000
Message-ID: <YL3t3RJ8exPXcYJc@x1-carbon>
References: <20210528110459.65387-1-Niklas.Cassel@wdc.com>
 <YLDSfrUIPaZxk6VD@apples.localdomain> <YLUD4BggUinxUBGl@x1-carbon>
 <YLU7aJDjk8L8JMIi@apples.localdomain> <YLXiDGRgboJc6RUu@x1-carbon>
 <YL3suv6IRJfoHl0u@apples.localdomain>
In-Reply-To: <YL3suv6IRJfoHl0u@apples.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.226.244.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5d8add4-501a-426c-4c4c-08d9299add2e
x-ms-traffictypediagnostic: PH0PR04MB7704:
x-microsoft-antispam-prvs: <PH0PR04MB770408AAB885016630FB577AF2389@PH0PR04MB7704.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VRelZPBl/G3vsZLeExHVk18aH+HpQrDcZmqRyAEJD+CsbeIao/EpeuIQU8FBUw5C7JXSB7XeXbAoqqllPPy2oDzVZDlR2C8ZRJeIjB5rdbWnW/2rfvc2uXaRlDGjC8Y0/LZqKP9jBXCW4y7eCED+PE805wr2/XK4HpVxf+ghcIjYZOzRy4wQhZT3qs9jsdzm4RbnDU04Y7UoRaInyG3J3CzqBCH56zRVMCwKeKgf+P1atrk6CAdd3wRw1EQvMg9VxQ7bFuRNPOa4HKoe8avrllT79WME16YdWxQDfL2JBwmb9zERYms6GfimAH2vB1gx3zWOsAg9M9Ml+XnFzXk6G2MOnmWVWZiKSLUujJaJB6FVlh3TjReo94tYdMhvm/92QK77HrdaXP+IAMqZfMDnnivpa9K9dYt+KjhlshIryW2zsWsolRf8KeyXZBEguhXysDdEhNn6TTVcrWda8sXHdArh0zBQ1j3ibTWlkIw64vcKmoB3s8MrctB8geHuzQn+5gh5qMcdJGcgGGhac2qyjIyhS1Dve7sn+yH7hSvh2C9DobIVU3gBgalLktqrLPvgHZ3/X6cU2EV+6PSrzQ3bV05imasCh/EO21Mdf5h4LTE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(6486002)(83380400001)(5660300002)(86362001)(6512007)(186003)(9686003)(38100700002)(122000001)(66446008)(6916009)(91956017)(66946007)(66476007)(33716001)(76116006)(64756008)(66556008)(316002)(26005)(54906003)(71200400001)(30864003)(8936002)(8676002)(2906002)(478600001)(4326008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+guz1HCuxMEqm9JMFtifi+W2qvP0bGxcaEDBrzWEY1r2zTSTy1lteRPFxmim?=
 =?us-ascii?Q?soCIpjZUFRUPOHTynesJkSAEb4UXk0D/pzWZrECKNOlNPa11fx0kij6WVi/4?=
 =?us-ascii?Q?moYPr9pK9itpsTo47UgBFBvjSoQbCRCpRJ43hMkJZ+1wUStUL+po8whO6RPC?=
 =?us-ascii?Q?IFHfybiV610tENLVaa+0VPhExLd/vTnm2UBBkJlbU2tYWQ6H1lEGgneujvhk?=
 =?us-ascii?Q?z/KX6P9fbi2mfOkVUX/TE4RQkOWhljLndFpxKcEsNPBckeQU3LdJnCwf7Dig?=
 =?us-ascii?Q?E8++wBu5X1jbbM1cvebaipLCFpG0KEp+MHspvOk/lh9h3lUCFeC0Jq8XEGN5?=
 =?us-ascii?Q?ioOjNXGN3wCGFWD7QN2mu8k7gWf6Zes1eNXKVJJmtO/HoiRQJ2afMEmXh7m2?=
 =?us-ascii?Q?+d8Pi+h1czp1CLiip5mderk2Ppv67oIyLzB6I9KdkZkCsqKEt4ByUSt6Jp+t?=
 =?us-ascii?Q?e9NGwr5o26P701MGN97QnvuFc9MCw7HJSzuma23CGHsQDrMEuqidTxRiT3n5?=
 =?us-ascii?Q?K6u2D2K2o5CIBkT0xBK7AwtPaog32jUTx2WPz8Mhu6B2H/CUl6vF0XtwItxv?=
 =?us-ascii?Q?ifaKwNqBIBbwpdz36QstyaV+wHbkvkdeXS/hnsigQoh6gDoVLyu8w4HKwfv2?=
 =?us-ascii?Q?zkTiVTlrVq0iJheGc3fobXM+NOs6gw8HU/9gC78AUpDNFE5J70ApLuPsbHwd?=
 =?us-ascii?Q?C0oxuswXPjgj52JZJ8svCC75piTuH89GXYRow0A+wgve3Bnq1lvGx9SxwSxt?=
 =?us-ascii?Q?722EtDnGMuUuQUO0fzVP3AnWkQtvBehmPZW6BwoCqbtgDgnkGTeHemJbcoSH?=
 =?us-ascii?Q?7C+EYFnvSydnJD01H9TkRuJKWYmJ8hxNMiktleA/Z6ptFSZJ8CuavTcwzO9i?=
 =?us-ascii?Q?YTpoxu3zjg68SLrnYec1QuuHWDPZ2h+shgf7sQATxFnKH8mj/ulJ+GXcA857?=
 =?us-ascii?Q?MVPQ5vAqbYNCXb0Ab2TSxUsuRb1UBD+/oJuTCdXBdmWczOGlVgbgyDKxbsha?=
 =?us-ascii?Q?8FOG3gnwiXXxVP+dmJDJ71oUSfQefF554xj42ng10TXR75e658hKVEpeRDbV?=
 =?us-ascii?Q?q2g2DCyRlnYWtdY/g2mfjMBynJKXYJ7KXAsSR/F7SOOBD2jZOXqlHc9ISkik?=
 =?us-ascii?Q?Qs8JOos7tAWgxzYwDyO1roPAcDK0jnx7MopkgFVgJx++MA80c3SIxqzHtYCj?=
 =?us-ascii?Q?tn7gir8Ap1bfBPYrd/K+lFM8givUu6cjScvvtn9Xehco7mMgEGVG1LHwoCiV?=
 =?us-ascii?Q?LDnbQlsdfvJv6aWao3A38qCXeDHR4Y39bHPMQJ5ZZM6hyH9Exnf59nfwrZox?=
 =?us-ascii?Q?tBUBkDKP909FzT+ayYSvmFBv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2DF24A033E537A44B3E6BC4BFC950159@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d8add4-501a-426c-4c4c-08d9299add2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 09:58:56.0842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /7hA0GczVLDlcsPawa/nU+FH7e6V7MO1gFcvUNyzPv6c2E9nVdXMR/g5gzC2qg78wsb6+o3SdBd19a0Ci6PzPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7704
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=785b62de8=Niklas.Cassel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "kbusch@kernel.org" <kbusch@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 11:54:02AM +0200, Klaus Jensen wrote:
> On Jun  1 07:30, Niklas Cassel wrote:
> > On Mon, May 31, 2021 at 09:39:20PM +0200, Klaus Jensen wrote:
> > > On May 31 15:42, Niklas Cassel wrote:
> > > > On Fri, May 28, 2021 at 01:22:38PM +0200, Klaus Jensen wrote:
> > > > > On May 28 11:05, Niklas Cassel wrote:
> > > > > > From: Niklas Cassel <niklas.cassel@wdc.com>
> > > > > >
> > > > > > In the Zoned Namespace Command Set Specification, chapter
> > > > > > 2.5.1 Managing resources
> > > > > >
> > > > > > "The controller may transition zones in the ZSIO:Implicitly Ope=
ned state
> > > > > > to the ZSC:Closed state for resource management purposes."
> > > > > >
> > > > > > The word may in this sentence means that automatically transiti=
oning
> > > > > > an implicitly opened zone to closed is completely optional.
> > > > > >
> > > > > > Add a new parameter so that the user can control if this automa=
tic
> > > > > > transitioning should be performed or not.
> > > > > >
> > > > > > Being able to control this can help with verifying that e.g. a =
user-space
> > > > > > program behaves properly even without this optional ZNS feature=
.
> > > > > >
> > > > > > The default value is set to true, in order to not change the ex=
isting
> > > > > > behavior.
> > > > > >
> > > > > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > > > > > ---
> > > > > > hw/nvme/ctrl.c | 9 ++++++++-
> > > > > > hw/nvme/ns.c   | 2 ++
> > > > > > hw/nvme/nvme.h | 1 +
> > > > > > 3 files changed, 11 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > > > > index 40a7efcea9..d00f0297a5 100644
> > > > > > --- a/hw/nvme/ctrl.c
> > > > > > +++ b/hw/nvme/ctrl.c
> > > > > > @@ -141,6 +141,11 @@
> > > > > >  *
> > > > > >  *     zoned.cross_read=3D<enable RAZB, default: false>
> > > > > >  *         Setting this property to true enables Read Across Zo=
ne Boundaries.
> > > > > > + *
> > > > > > + *     zoned.auto_transition=3D<enable auto resource managemen=
t, default: true>
> > > > > > + *         Indicates if zones in zone state implicitly opened =
can be
> > > > > > + *         automatically transitioned to zone state closed for=
 resource
> > > > > > + *         management purposes.
> > > > > >  */
> > > > > >
> > > > > > #include "qemu/osdep.h"
> > > > > > @@ -1699,7 +1704,9 @@ static uint16_t nvme_zrm_open_flags(NvmeN=
amespace *ns, NvmeZone *zone,
> > > > > >         /* fallthrough */
> > > > > >
> > > > > >     case NVME_ZONE_STATE_CLOSED:
> > > > > > -        nvme_zrm_auto_transition_zone(ns);
> > > > > > +        if (ns->params.auto_transition_zones) {
> > > > > > +            nvme_zrm_auto_transition_zone(ns);
> > > > > > +        }
> > > > > >         status =3D nvme_aor_check(ns, act, 1);
> > > > > >         if (status) {
> > > > > >             return status;
> > > > > > diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> > > > > > index 3fec9c6273..31dee43d30 100644
> > > > > > --- a/hw/nvme/ns.c
> > > > > > +++ b/hw/nvme/ns.c
> > > > > > @@ -531,6 +531,8 @@ static Property nvme_ns_props[] =3D {
> > > > > >                        params.max_open_zones, 0),
> > > > > >     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
> > > > > >                        params.zd_extension_size, 0),
> > > > > > +    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeNamespace,
> > > > > > +                     params.auto_transition_zones, true),
> > > > > >     DEFINE_PROP_END_OF_LIST(),
> > > > > > };
> > > > > >
> > > > > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> > > > > > index 81a35cda14..bd86054db2 100644
> > > > > > --- a/hw/nvme/nvme.h
> > > > > > +++ b/hw/nvme/nvme.h
> > > > > > @@ -100,6 +100,7 @@ typedef struct NvmeNamespaceParams {
> > > > > >     uint32_t max_active_zones;
> > > > > >     uint32_t max_open_zones;
> > > > > >     uint32_t zd_extension_size;
> > > > > > +    bool     auto_transition_zones;
> > > > > > } NvmeNamespaceParams;
> > > > > >
> > > > > > typedef struct NvmeNamespace {
> > > > > > --
> > > > > > 2.31.1
> > > > > >
> > > > >
> > > > > Looks good Niklas!
> > > > >
> > > > > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > > >
> > > > In reality, it is the controller that does the auto transitioning.
> > > >
> > > > In theory, one namespace could be attached to two different control=
lers,
> > > > and I guess, in that case, it depends on if the controller that we =
used
> > > > when doing the write supports auto transitioning or not, that deter=
mines
> > > > if a zone will be auto transitioned or not.
> > > >
> > > > If we were to change this to be a parameter of the controller inste=
ad
> > > > of a parameter of the namespace, we would require to refactor a lot=
 of
> > > > code in the regular write path. As we currently don't have any Nvme=
Request
> > > > object in nvme_zrm_open_flags().
> > > >
> > > > Thoughts?
> > > >
> > >=20
> > > I think you are right. This should be controller-specific behavior. I=
 took
> > > the liberty of moving the parameter; the refactor is minimal.
> > >=20
> > >=20
> > > From: Niklas Cassel <niklas.cassel@wdc.com>
> > >=20
> > > In the Zoned Namespace Command Set Specification, chapter
> > > 2.5.1 Managing resources
> > >=20
> > > "The controller may transition zones in the ZSIO:Implicitly Opened st=
ate
> > > to the ZSC:Closed state for resource management purposes."
> > >=20
> > > The word may in this sentence means that automatically transitioning
> > > an implicitly opened zone to closed is completely optional.
> > >=20
> > > Add a new parameter so that the user can control if this automatic
> > > transitioning should be performed or not.
> > >=20
> > > Being able to control this can help with verifying that e.g. a user-s=
pace
> > > program behaves properly even without this optional ZNS feature.
> > >=20
> > > The default value is set to true, in order to not change the existing
> > > behavior.
> > >=20
> > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > > [k.jensen: moved parameter to controller]
> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > ---
> > >  hw/nvme/nvme.h |  1 +
> > >  hw/nvme/ctrl.c | 32 ++++++++++++++++++++++----------
> > >  2 files changed, 23 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> > > index 81a35cda142b..93a7e0e5380e 100644
> > > --- a/hw/nvme/nvme.h
> > > +++ b/hw/nvme/nvme.h
> > > @@ -382,6 +382,7 @@ typedef struct NvmeParams {
> > >      uint8_t  vsl;
> > >      bool     use_intel_id;
> > >      uint8_t  zasl;
> > > +    bool     auto_transition_zones;
> > >      bool     legacy_cmb;
> > >  } NvmeParams;
> > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > index 40a7efcea914..8dd9cb2ccbf3 100644
> > > --- a/hw/nvme/ctrl.c
> > > +++ b/hw/nvme/ctrl.c
> > > @@ -34,6 +34,7 @@
> > >   *              aerl=3D<N[optional]>,aer_max_queued=3D<N[optional]>,=
 \
> > >   *              mdts=3D<N[optional]>,vsl=3D<N[optional]>, \
> > >   *              zoned.zasl=3D<N[optional]>, \
> > > + *              zoned.auto_transition=3D<on|off[optional]>, \
> > >   *              subsys=3D<subsys_id>
> > >   *      -device nvme-ns,drive=3D<drive_id>,bus=3D<bus_name>,nsid=3D<=
nsid>,\
> > >   *              zoned=3D<true|false[optional]>, \
> > > @@ -100,6 +101,11 @@
> > >   *   the minimum memory page size (CAP.MPSMIN). The default value is=
 0 (i.e.
> > >   *   defaulting to the value of `mdts`).
> > >   *
> > > + * - `zoned.auto_transition`
> > > + *   Indicates if zones in zone state implicitly opened can be autom=
atically
> > > + *   transitioned to zone state closed for resource management purpo=
ses.
> > > + *   Defaults to 'on'.
> > > + *
> > >   * nvme namespace device parameters
> > >   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >   * - `shared`
> > > @@ -1686,8 +1692,8 @@ enum {
> > >      NVME_ZRM_AUTO =3D 1 << 0,
> > >  };
> > > -static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zon=
e,
> > > -                                    int flags)
> > > +static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
> > > +                                    NvmeZone *zone, int flags)
> > >  {
> > >      int act =3D 0;
> > >      uint16_t status;
> > > @@ -1699,7 +1705,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespa=
ce *ns, NvmeZone *zone,
> > >          /* fallthrough */
> > >      case NVME_ZONE_STATE_CLOSED:
> > > -        nvme_zrm_auto_transition_zone(ns);
> > > +        if (n->params.auto_transition_zones) {
> > > +            nvme_zrm_auto_transition_zone(ns);
> > > +        }
> > >          status =3D nvme_aor_check(ns, act, 1);
> > >          if (status) {
> > >              return status;
> > > @@ -1735,14 +1743,16 @@ static uint16_t nvme_zrm_open_flags(NvmeNames=
pace *ns, NvmeZone *zone,
> > >      }
> > >  }
> > > -static inline uint16_t nvme_zrm_auto(NvmeNamespace *ns, NvmeZone *zo=
ne)
> > > +static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespace *ns,
> > > +                                     NvmeZone *zone)
> > >  {
> > > -    return nvme_zrm_open_flags(ns, zone, NVME_ZRM_AUTO);
> > > +    return nvme_zrm_open_flags(n, ns, zone, NVME_ZRM_AUTO);
> > >  }
> > > -static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zo=
ne)
> > > +static inline uint16_t nvme_zrm_open(NvmeCtrl *n, NvmeNamespace *ns,
> > > +                                     NvmeZone *zone)
> > >  {
> > > -    return nvme_zrm_open_flags(ns, zone, 0);
> > > +    return nvme_zrm_open_flags(n, ns, zone, 0);
> > >  }
> > >  static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
> > > @@ -2283,7 +2293,7 @@ static void nvme_copy_in_complete(NvmeRequest *=
req)
> > >              goto invalid;
> > >          }
> > > -        status =3D nvme_zrm_auto(ns, zone);
> > > +        status =3D nvme_zrm_auto(nvme_ctrl(req), ns, zone);
> > >          if (status) {
> > >              goto invalid;
> > >          }
> > > @@ -3080,7 +3090,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, Nvme=
Request *req, bool append,
> > >              goto invalid;
> > >          }
> > > -        status =3D nvme_zrm_auto(ns, zone);
> > > +        status =3D nvme_zrm_auto(n, ns, zone);
> > >          if (status) {
> > >              goto invalid;
> > >          }
> > > @@ -3169,7 +3179,7 @@ enum NvmeZoneProcessingMask {
> > >  static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
> > >                                 NvmeZoneState state, NvmeRequest *req=
)
> > >  {
> > > -    return nvme_zrm_open(ns, zone);
> > > +    return nvme_zrm_open(nvme_ctrl(req), ns, zone);
> > >  }
> > >  static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
> > > @@ -6259,6 +6269,8 @@ static Property nvme_props[] =3D {
> > >      DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, =
false),
> > >      DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, fals=
e),
> > >      DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
> > > +    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
> > > +                     params.auto_transition_zones, true),
> > >      DEFINE_PROP_END_OF_LIST(),
> > >  };
> > > --
> > > 2.31.1
> > >=20
> >=20
> > Thanks a lot Klaus! I really appreciate it.
> >=20
> > My initial thought was to add a new flag in the enum where NVME_ZRM_AUT=
O is.
> > But I think that would just make the code harder to read.
> > You simply check the parameter directly, which is more obvious to the r=
eader,
> > so I think patch looks good!
> >=20
>=20
> Can I add your reviewed-by on this? :)

Yes, of course:

Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>

However, in many projects you can't have a Reviewed-by that is the same as
the author, but perhaps that is not the case in QEMU.


Kind regards,
Niklas=

