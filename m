Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41293396DF4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 09:32:13 +0200 (CEST)
Received: from localhost ([::1]:49782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnysm-0002ll-3C
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 03:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7797843ad=Niklas.Cassel@wdc.com>)
 id 1lnyr9-0001sj-4R; Tue, 01 Jun 2021 03:30:31 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7797843ad=Niklas.Cassel@wdc.com>)
 id 1lnyr5-00083L-15; Tue, 01 Jun 2021 03:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622532625; x=1654068625;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oXXaRGOGXcWLaDh1rkDskyvxawVF8Fy9OzPXk37wTRE=;
 b=BmMoEJBVgVIwoVMzzehC5Go656ShWKXXr4lFdRgAzVtwhfVwKWwoj2Zv
 aQC8JbYpLGMvenJj6PmtS/XrI44Mx4VssZbZf/Q10hW4ncXcF2/cyNtLi
 pX9flGQ7fN9PBg94GaXoE8NvCTVpFRLq9wA+CIb4GM2rJgjBz4LV0asjb
 HxR8TCM15Z36Fccgq8kF9E52pOEGu009ndBfBTWdIVwg4LhUszXQzZ7BI
 SKJeebnMi72sH02SBXOqz55N1kF9UH165SPs17RgXj3cXM+UoeQ0NZx5C
 6Px0gD6IvL0GHNG7F6Cx2NSOTbhSac0DWrvJqfKZB2rl/ZdpuW12S9uIq A==;
IronPort-SDR: 1SZaCT3zemIxJKQUIXpcpb2plZzo1iX3o9ITkOgha2lpTSsHzNtc/jyxNU4knqY3sRSRsCdccv
 QeNZEH7eHq/oOvZJmr0mcgqwPWh7B1waVFV/kDJHsKDtNppPj1NM06TIqT1U0W51od6DNq7ZMG
 P5QF0Vg26LjZeKy39tBGf+0DFFoZ44KaxXtQntu9SKIE5HeWjqeI2MrhKzTeMIk3YfJ1Ocktjk
 AzqS4ckROP0i/a1a2vvs2b7ks6Nkm76on5Iz5Xwq0c9DyH85jT7mG9h6Pt+ZKcRQMe39uFaolJ
 WoU=
X-IronPort-AV: E=Sophos;i="5.83,239,1616428800"; d="scan'208";a="174966498"
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jun 2021 15:30:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICLqwJbZEzsu89AnrYs6anxXUqodlwI1lO2jL5/ntUHuS6l6lGt4/fKd8VtnWIxllGLOdmmTyvxQueqL8zOTdoptUQ26ieUjfhFlIhLG+XUReAHN5XN9D2TxgMcbE63vxUriVW7OuqfaRFHUeLY8DSEUwekSck7/nCz1b5MRrF4Uc+GMbLcfprfzGLt0k1KbpnX18yRTmH5hCsNYr44ubGuSERrT2sXixIn/Gx7SVz8d5YM+K4Z6AhgaX9koveunDOR4BEGgCIyhbkYHFPrhSRIcBpRIFAbT4wYEsyQ2PfeWmyZp/TejEsKhwc3txPljXgoaAmhlMBtqqYlCxfLIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXzUfy1O9j6GvqK/DwZKyvWPJTF0Jp0oMc0kNE7K558=;
 b=NZAJAfusgtqhUUElhbjIJvHm7uAK7XUs0/jZD/mfzjRu3PTG4Gn3/H80X9wKlcvNzOG+XfbPiEFcqm4MWhP7cimJLLdMYuak9BrdTSK0c3QTSOnaT6RqAavQj35VGgxjpmR8PFqAq27Ys2bewRkTJhRTRNHwwGAAFNppB4zo3RgWyHpUtzG73lfgQPP06HQm+xu/dP2gL2a4C7SkKdmvmtxV4pkpfYlS6UpiDW1aOdAPaMn/JidKIUlbZfVZpfMGlHKrqh6VFpfoz7b51Vgw7knBydS1sfbABFS4muTSze3/233DIgnrQD3C7nAvi8rfigljkYY+xpbKKSt66PWExg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXzUfy1O9j6GvqK/DwZKyvWPJTF0Jp0oMc0kNE7K558=;
 b=h9zPVNblEwYThzLRHlOWNVty9imbKbILjR66Nw8rMBfns/FrsPS48KaetuMge01zqkWhOF9FDp1Tz5w7CmoZBpXOIK/FdCqZ7uldB1REEiANkEm95cgUt+QgNT2MP/HVB/cKmheJu8RWbYNp+m9xnjoPeKnFjM1niPxkhM1FPKs=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by PH0PR04MB7205.namprd04.prod.outlook.com (2603:10b6:510:13::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Tue, 1 Jun
 2021 07:30:21 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::45d7:388e:5cbb:ae1e]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::45d7:388e:5cbb:ae1e%6]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 07:30:21 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Thread-Topic: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Thread-Index: AQHXU7FRNLQ7NeS/402zZyMJ0bJ5NKr4wCQAgAT/kwCAAEIzAIAAxqYA
Date: Tue, 1 Jun 2021 07:30:21 +0000
Message-ID: <YLXiDGRgboJc6RUu@x1-carbon>
References: <20210528110459.65387-1-Niklas.Cassel@wdc.com>
 <YLDSfrUIPaZxk6VD@apples.localdomain> <YLUD4BggUinxUBGl@x1-carbon>
 <YLU7aJDjk8L8JMIi@apples.localdomain>
In-Reply-To: <YLU7aJDjk8L8JMIi@apples.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.226.244.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea3b9d02-cb70-46d9-983f-08d924cf1d37
x-ms-traffictypediagnostic: PH0PR04MB7205:
x-microsoft-antispam-prvs: <PH0PR04MB72052FFEBE769CEDE4E7FE82F23E9@PH0PR04MB7205.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zfw3ZSVxYuiNwKJSsXwRBMIvuqLDSK4fNgWJEKO0zZyZrboFrRPp4rEan1vq6QUvm89Yz7K+ZOjH27XIi3C2ysqU9kJ7FON4K04XAYA0ZIDIDlIipB5VbuFZ7P28Jq6cy9Lv/p4uLFin+p0debU+s2EOsFCxu+AC+Cyr1qZmEGA3Zl6WQFrFS1k9+mN2gcaAS3LffOK4hsLdpRXVOlpC8cHjPA84pwnXPV+9g0KA6BkHo+gCGYfXeipqXm084pmU65mRXswRhp0Hq80GYW8coxK0QS/BmQa7drx/COmK7aPXY/yl2ODfvwoBss5CKjGTfKTamgF0oRwajyfA3WvhdKwvv0czRll/dk3H8yFhHKS3yPsMVW2bAL9VaslJg2WG343QGBJZHzf5PQkBppg5F7toLXazoXBx/NVjS0o6lC5aKpgH1nJvVzWzrtUDkjWqHonVs0y/ZyfIAKLQWaCRvU+IBrBb3NMgOiYx+CPFZzGs4RtUM/VeMYQ7G+ba+qUEM1sDW346XHNJlnhbZ54exLk0ToIPAFi9wtz8Mx1YHA+ZRjg3LyQTLTcvEvECfTmzw+j5zHlciVBcJ78QcDoRjdlIcmTiFKKuwaddcfjgKds=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(186003)(6512007)(38100700002)(478600001)(86362001)(316002)(4326008)(6506007)(76116006)(26005)(71200400001)(66476007)(9686003)(6486002)(54906003)(91956017)(33716001)(5660300002)(8936002)(8676002)(66446008)(6916009)(83380400001)(64756008)(122000001)(2906002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?lWsiyO+HgHo0PhH8H/M/TBHbccZTn231DkLdApe6Pq+53DZAmUUhrTAjPoE/?=
 =?us-ascii?Q?77Qg0N+6l6LuCHZkmcjSLNtP/o2q85Xs3hqRLMc6rsar8AzRRvwsF2F0vgTO?=
 =?us-ascii?Q?j70kCLhijvcUlmrDex1dUCEMrSkWE7Iu2OrCYSEYfDyQ4eMzwXAmyC1AzcKm?=
 =?us-ascii?Q?r89yOTdWEj+U++HwL75LXVdZyMs/wBPRHSYS7mzTIv2uyeXwr55Oxsx1XI5R?=
 =?us-ascii?Q?PjblcyHxfPKziFwRQLGvW0AV1rff0zntedB5oXP5owIdvF/MZ9sKqiwwrasb?=
 =?us-ascii?Q?F+n5yUMIttsXckbbFybPmVY8ods0gVEbsM9NTsvblBm+mKnfXb4uTYt+NqyS?=
 =?us-ascii?Q?LpKAnFaVl+WBcR5Vg4fc5353oOnccnf6bawBx9U/Q5xHG2umm4TiaT8sJzk4?=
 =?us-ascii?Q?7hTxEZQAcBZwcihQxKdzpH2FaDd7V7o2w9tzgIcy5pnGhpLvUY0oWJUVVl7q?=
 =?us-ascii?Q?AfgomF7MtiZ04gZt45yEB1ra8b56Y7iuqTO/Op38o+V5Hqc8V34tqEVYBDF+?=
 =?us-ascii?Q?ZRH0aT2cK+aDCfr5Fvi2ypMjETOgaLFTb9YGypqcy1qlk0Of2vRRk8baHXO0?=
 =?us-ascii?Q?xpA9Gx9bwJZy85WZZGomXKRgXGdDWuogT2HVuoVeu2fpnEgha009cb8RVwa0?=
 =?us-ascii?Q?T1TxLqf/5SUmjwc7kzKhyVEOfHO0HJ8NRkzAyNCctgMh5Ad9hTuBMkPTnRa6?=
 =?us-ascii?Q?XGZRpH9B+/QFm0MvjnOFgLc/YYFqlbz+NqN7fbx5eBwoOI1kFcu0R+eBhoL+?=
 =?us-ascii?Q?oNf8CI2Z0H9/nNzWUDi3Yx2TWMCivJ+suveFi8aw0HJXwSk6LSdBbrdAxBPN?=
 =?us-ascii?Q?Extg6ib7WerL6zh/YXK9eoqDMdwyaIJFVxPpYua8MlXKaW6X2pU6h7gBxl59?=
 =?us-ascii?Q?iWh2yXVEz7TgfcxyBbT59sgLCPB6NbOQuwDN9m27edlqUOHIRPTRjBkAfP3i?=
 =?us-ascii?Q?/FslBcXJ+a7yNYIszeUgNzm0yZtEqgiDfi7Y4yUx14CGKPyoX+3eXVmOIhLj?=
 =?us-ascii?Q?NUVM7W7f76JSEOMaZNSxJ5Estl4dCMgIFi56hMXYVNiowQHFrkYoM3dpn4lJ?=
 =?us-ascii?Q?O6+Sgkp5i4l/kdwbXiwkCsMKU8IfodtqZznGHJXJsEubyJSR3hm+HxYeP9i7?=
 =?us-ascii?Q?F+cG4+6l67Xe7hPjIo4leMCja2Va8ebPbSiZKrtJy55FwV//kPySZCuLM2P2?=
 =?us-ascii?Q?jrVSVIbje4mZZ62WinTMQVSSMQ4x0/a0zv8YuntgM1zZltuKhrDZfc0USYVO?=
 =?us-ascii?Q?cnPIZXWdiJxJmx5ksRK2c187oLzFn/2eeI5CAe5XFJExxm6U+trzhPiYhN9r?=
 =?us-ascii?Q?g+cCH0BJJfmSfCGxyNogFG6Y?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E090E128E234946B4F4B1B09F78A230@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3b9d02-cb70-46d9-983f-08d924cf1d37
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2021 07:30:21.4687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wSRLb2MHpGTMRke97GvwMmx2cND6Rlv3P4JLuP3SDHbBe4eq0P9ARpECWYtlvQauDj0ZjDRpuHjOc7xUZgvKVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7205
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=7797843ad=Niklas.Cassel@wdc.com; helo=esa3.hgst.iphmx.com
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

On Mon, May 31, 2021 at 09:39:20PM +0200, Klaus Jensen wrote:
> On May 31 15:42, Niklas Cassel wrote:
> > On Fri, May 28, 2021 at 01:22:38PM +0200, Klaus Jensen wrote:
> > > On May 28 11:05, Niklas Cassel wrote:
> > > > From: Niklas Cassel <niklas.cassel@wdc.com>
> > > >
> > > > In the Zoned Namespace Command Set Specification, chapter
> > > > 2.5.1 Managing resources
> > > >
> > > > "The controller may transition zones in the ZSIO:Implicitly Opened =
state
> > > > to the ZSC:Closed state for resource management purposes."
> > > >
> > > > The word may in this sentence means that automatically transitionin=
g
> > > > an implicitly opened zone to closed is completely optional.
> > > >
> > > > Add a new parameter so that the user can control if this automatic
> > > > transitioning should be performed or not.
> > > >
> > > > Being able to control this can help with verifying that e.g. a user=
-space
> > > > program behaves properly even without this optional ZNS feature.
> > > >
> > > > The default value is set to true, in order to not change the existi=
ng
> > > > behavior.
> > > >
> > > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > > > ---
> > > > hw/nvme/ctrl.c | 9 ++++++++-
> > > > hw/nvme/ns.c   | 2 ++
> > > > hw/nvme/nvme.h | 1 +
> > > > 3 files changed, 11 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > > index 40a7efcea9..d00f0297a5 100644
> > > > --- a/hw/nvme/ctrl.c
> > > > +++ b/hw/nvme/ctrl.c
> > > > @@ -141,6 +141,11 @@
> > > >  *
> > > >  *     zoned.cross_read=3D<enable RAZB, default: false>
> > > >  *         Setting this property to true enables Read Across Zone B=
oundaries.
> > > > + *
> > > > + *     zoned.auto_transition=3D<enable auto resource management, d=
efault: true>
> > > > + *         Indicates if zones in zone state implicitly opened can =
be
> > > > + *         automatically transitioned to zone state closed for res=
ource
> > > > + *         management purposes.
> > > >  */
> > > >
> > > > #include "qemu/osdep.h"
> > > > @@ -1699,7 +1704,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNames=
pace *ns, NvmeZone *zone,
> > > >         /* fallthrough */
> > > >
> > > >     case NVME_ZONE_STATE_CLOSED:
> > > > -        nvme_zrm_auto_transition_zone(ns);
> > > > +        if (ns->params.auto_transition_zones) {
> > > > +            nvme_zrm_auto_transition_zone(ns);
> > > > +        }
> > > >         status =3D nvme_aor_check(ns, act, 1);
> > > >         if (status) {
> > > >             return status;
> > > > diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> > > > index 3fec9c6273..31dee43d30 100644
> > > > --- a/hw/nvme/ns.c
> > > > +++ b/hw/nvme/ns.c
> > > > @@ -531,6 +531,8 @@ static Property nvme_ns_props[] =3D {
> > > >                        params.max_open_zones, 0),
> > > >     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
> > > >                        params.zd_extension_size, 0),
> > > > +    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeNamespace,
> > > > +                     params.auto_transition_zones, true),
> > > >     DEFINE_PROP_END_OF_LIST(),
> > > > };
> > > >
> > > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> > > > index 81a35cda14..bd86054db2 100644
> > > > --- a/hw/nvme/nvme.h
> > > > +++ b/hw/nvme/nvme.h
> > > > @@ -100,6 +100,7 @@ typedef struct NvmeNamespaceParams {
> > > >     uint32_t max_active_zones;
> > > >     uint32_t max_open_zones;
> > > >     uint32_t zd_extension_size;
> > > > +    bool     auto_transition_zones;
> > > > } NvmeNamespaceParams;
> > > >
> > > > typedef struct NvmeNamespace {
> > > > --
> > > > 2.31.1
> > > >
> > >=20
> > > Looks good Niklas!
> > >=20
> > > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > In reality, it is the controller that does the auto transitioning.
> >=20
> > In theory, one namespace could be attached to two different controllers=
,
> > and I guess, in that case, it depends on if the controller that we used
> > when doing the write supports auto transitioning or not, that determine=
s
> > if a zone will be auto transitioned or not.
> >=20
> > If we were to change this to be a parameter of the controller instead
> > of a parameter of the namespace, we would require to refactor a lot of
> > code in the regular write path. As we currently don't have any NvmeRequ=
est
> > object in nvme_zrm_open_flags().
> >=20
> > Thoughts?
> >=20
>=20
> I think you are right. This should be controller-specific behavior. I too=
k
> the liberty of moving the parameter; the refactor is minimal.
>=20
>=20
> From: Niklas Cassel <niklas.cassel@wdc.com>
>=20
> In the Zoned Namespace Command Set Specification, chapter
> 2.5.1 Managing resources
>=20
> "The controller may transition zones in the ZSIO:Implicitly Opened state
> to the ZSC:Closed state for resource management purposes."
>=20
> The word may in this sentence means that automatically transitioning
> an implicitly opened zone to closed is completely optional.
>=20
> Add a new parameter so that the user can control if this automatic
> transitioning should be performed or not.
>=20
> Being able to control this can help with verifying that e.g. a user-space
> program behaves properly even without this optional ZNS feature.
>=20
> The default value is set to true, in order to not change the existing
> behavior.
>=20
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> [k.jensen: moved parameter to controller]
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/nvme.h |  1 +
>  hw/nvme/ctrl.c | 32 ++++++++++++++++++++++----------
>  2 files changed, 23 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 81a35cda142b..93a7e0e5380e 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -382,6 +382,7 @@ typedef struct NvmeParams {
>      uint8_t  vsl;
>      bool     use_intel_id;
>      uint8_t  zasl;
> +    bool     auto_transition_zones;
>      bool     legacy_cmb;
>  } NvmeParams;
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 40a7efcea914..8dd9cb2ccbf3 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -34,6 +34,7 @@
>   *              aerl=3D<N[optional]>,aer_max_queued=3D<N[optional]>, \
>   *              mdts=3D<N[optional]>,vsl=3D<N[optional]>, \
>   *              zoned.zasl=3D<N[optional]>, \
> + *              zoned.auto_transition=3D<on|off[optional]>, \
>   *              subsys=3D<subsys_id>
>   *      -device nvme-ns,drive=3D<drive_id>,bus=3D<bus_name>,nsid=3D<nsid=
>,\
>   *              zoned=3D<true|false[optional]>, \
> @@ -100,6 +101,11 @@
>   *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (=
i.e.
>   *   defaulting to the value of `mdts`).
>   *
> + * - `zoned.auto_transition`
> + *   Indicates if zones in zone state implicitly opened can be automatic=
ally
> + *   transitioned to zone state closed for resource management purposes.
> + *   Defaults to 'on'.
> + *
>   * nvme namespace device parameters
>   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   * - `shared`
> @@ -1686,8 +1692,8 @@ enum {
>      NVME_ZRM_AUTO =3D 1 << 0,
>  };
> -static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zone,
> -                                    int flags)
> +static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
> +                                    NvmeZone *zone, int flags)
>  {
>      int act =3D 0;
>      uint16_t status;
> @@ -1699,7 +1705,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace *=
ns, NvmeZone *zone,
>          /* fallthrough */
>      case NVME_ZONE_STATE_CLOSED:
> -        nvme_zrm_auto_transition_zone(ns);
> +        if (n->params.auto_transition_zones) {
> +            nvme_zrm_auto_transition_zone(ns);
> +        }
>          status =3D nvme_aor_check(ns, act, 1);
>          if (status) {
>              return status;
> @@ -1735,14 +1743,16 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace=
 *ns, NvmeZone *zone,
>      }
>  }
> -static inline uint16_t nvme_zrm_auto(NvmeNamespace *ns, NvmeZone *zone)
> +static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespace *ns,
> +                                     NvmeZone *zone)
>  {
> -    return nvme_zrm_open_flags(ns, zone, NVME_ZRM_AUTO);
> +    return nvme_zrm_open_flags(n, ns, zone, NVME_ZRM_AUTO);
>  }
> -static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *zone)
> +static inline uint16_t nvme_zrm_open(NvmeCtrl *n, NvmeNamespace *ns,
> +                                     NvmeZone *zone)
>  {
> -    return nvme_zrm_open_flags(ns, zone, 0);
> +    return nvme_zrm_open_flags(n, ns, zone, 0);
>  }
>  static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
> @@ -2283,7 +2293,7 @@ static void nvme_copy_in_complete(NvmeRequest *req)
>              goto invalid;
>          }
> -        status =3D nvme_zrm_auto(ns, zone);
> +        status =3D nvme_zrm_auto(nvme_ctrl(req), ns, zone);
>          if (status) {
>              goto invalid;
>          }
> @@ -3080,7 +3090,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequ=
est *req, bool append,
>              goto invalid;
>          }
> -        status =3D nvme_zrm_auto(ns, zone);
> +        status =3D nvme_zrm_auto(n, ns, zone);
>          if (status) {
>              goto invalid;
>          }
> @@ -3169,7 +3179,7 @@ enum NvmeZoneProcessingMask {
>  static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
>                                 NvmeZoneState state, NvmeRequest *req)
>  {
> -    return nvme_zrm_open(ns, zone);
> +    return nvme_zrm_open(nvme_ctrl(req), ns, zone);
>  }
>  static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
> @@ -6259,6 +6269,8 @@ static Property nvme_props[] =3D {
>      DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, fals=
e),
>      DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
>      DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
> +    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
> +                     params.auto_transition_zones, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> --=20
> 2.31.1
>=20

Thanks a lot Klaus! I really appreciate it.

My initial thought was to add a new flag in the enum where NVME_ZRM_AUTO is=
.
But I think that would just make the code harder to read.
You simply check the parameter directly, which is more obvious to the reade=
r,
so I think patch looks good!

Kind regards,
Niklas=

