Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EA134E54E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:21:39 +0200 (CEST)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBVC-0000Ng-TS
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=716e969d0=Niklas.Cassel@wdc.com>)
 id 1lRBTi-0008GQ-21; Tue, 30 Mar 2021 06:20:06 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:23002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=716e969d0=Niklas.Cassel@wdc.com>)
 id 1lRBTe-0005nP-JW; Tue, 30 Mar 2021 06:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617099603; x=1648635603;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lh1oZf1qAUyV8aZ8/nX29pybWkUnB2IKFT0bskhvlVw=;
 b=llfrVR02upBl3QJeV0fXjeo1RAnPSL+WA/LLyCoRPkWpKyF/zGRGh+8a
 QW4DDS8bY+qVS4TxBEg0+Q6MRVbjUtihm4nmhWuweb7i7QoBVvMGsFgiS
 5GRBcPTKvnaHBRlFqMOfWgk8F6PvadSubpsFTs2U2DesZ5237CJN5dMfx
 d9Jj0falIqbV518z6Byv40mizpxmhgO/edck5XBgO99GDBILs8by8AdI3
 LnGKOmpf4PZrn7pPqS4IEGlaAzJamTUEfHj09EhzdJbxWaJf+i3YnE1VY
 k4Iw15FQHzBoj72Pmn2gQypGUNQGXnS1xc5gLYqOvANBogE4wCnflz3kA g==;
IronPort-SDR: 7MS8CN+38tX32LgSDIkX18XyQE4yZNNVH1kt9lEuK5Ig26gN0eJ9yUeTJOzNvD08zyFwSzRecz
 QK6mwyWymP67I0FY3l07uPHUxr8Q60M1NXQIwk8Sc5qxDPgWE1bcwoLS6OYUoJkyV1KKPyXv9P
 fGapQEc7ERWEXPDnWI4ZE/rJTFCBKrbgFPGvwnffskpcoBr+Dk1mvAgovJbqnRJumMiyWaytmK
 EFvLNDOQTuSyMoUupk3E+YZ2n5lPr/8uoSuo6ZEyEfZppCk/Vev/Kz0eP83KEKzvEGE1NToDOw
 mnY=
X-IronPort-AV: E=Sophos;i="5.81,290,1610380800"; d="scan'208";a="267764967"
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2021 18:19:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvvelljrbrnIGzFyyiIFrPqfl2J8GxbXEz5WQlcdvM3dxwuPW/Q7mDzsfAoylzsaJJHw9fFgBmVeKeJmFQT+LQCK0tUsud6m9nzlaM63bjFu7y1Q+LEPMJosmqeffygqS6hr3Kpauj9x+D9+lTOygUnVTVAyS06aXbVhOsR3BEgbbas/21N5GuWFvgONDw7Rp7DK2UcFC3l31l7gtXv6Ier41pQiPI6dPfUOJLtV4jmLgRHvPF+jWES4pqoV5y/iS71MQgu6Bd0oA+7+bL2+zul/Y1fpzhbhw8VSke4d+5d66y9kuSt3ukyd74D6Lo9QYHuVlVhvspDP0NZd+jnRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0ne1V4K5cmW2KXvrFC3+FJRMhjwfpnAN+Hx23PC5BU=;
 b=lwWa1y7wPDGgHuiprk3IwMtfAoo+WWqrVybzDEpDvmQX9tdrTkO6xWeO600YlST1Bq6SeQFjq/k9qB2pfuKWL79MqBEA5CgfjmWsYGTSkO7S9fHzaMpgNutKgqQJ/GbaBw2KpkqfPD0gnBh7MJCLzrcB6bGuBZOQE1CUvLmYPJNn4SWiB2AkRfsjP+e0SsEHSULc/xBzV+MlPZI5kd2qlOEu904+zDuN2R3DRkU3sBFJjjmDIJcSBcUFKJRuxiAu0LeE7l16SbIxviAJvm/od8RBcz03AvOxR59bCVH1u1TGvYPhifJF/V8orYYGH8oHuKQ8w/ekC9FZfK7Bf+gasw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0ne1V4K5cmW2KXvrFC3+FJRMhjwfpnAN+Hx23PC5BU=;
 b=MkMlcBbWOUDCFYk7Aeumu4Vb6SoomQIXpkowmUSEmdskR9DURBhAYlBGCU8mqtSZ72N6ZKnPZzwgLvGrZMebKPepxAe/J9U4TnQcluev7ugP8l07h9sk/AybnwdPvsCir3GcAVGkrshyAN2ibD55fNn/inQYbW3325SPsYj1b/w=
Received: from DM5PR04MB0684.namprd04.prod.outlook.com (2603:10b6:3:f3::20) by
 DM6PR04MB5548.namprd04.prod.outlook.com (2603:10b6:5:12a::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29; Tue, 30 Mar 2021 10:19:54 +0000
Received: from DM5PR04MB0684.namprd04.prod.outlook.com
 ([fe80::f0ed:1983:98c8:3046]) by DM5PR04MB0684.namprd04.prod.outlook.com
 ([fe80::f0ed:1983:98c8:3046%12]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 10:19:54 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: remove description for
 zoned.append_size_limit
Thread-Topic: [PATCH] hw/block/nvme: remove description for
 zoned.append_size_limit
Thread-Index: AQHXH9Y9DJiNPD4JsUmuGSBN3p/7PKqRbWYAgArvXgA=
Date: Tue, 30 Mar 2021 10:19:54 +0000
Message-ID: <YGL7SOSqHG6WSshj@x1-carbon.lan>
References: <20210323111817.115837-1-Niklas.Cassel@wdc.com>
 <YFnPAKkbw3bkB6n5@apples.localdomain>
In-Reply-To: <YFnPAKkbw3bkB6n5@apples.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.226.244.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e8619bba-cbf2-4d8b-edaa-08d8f3655ce4
x-ms-traffictypediagnostic: DM6PR04MB5548:
x-microsoft-antispam-prvs: <DM6PR04MB55489BCB3885D04BB4FAE564F27D9@DM6PR04MB5548.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5f0BOHdZkpMhaPlNKLIY4XHm3jxiw0TQxO92m/Y148oMRYT7kfKqmtnL3x5N+xRRFOx59lNfLOo07kLXf3n9kK2bzAOLkrmbxB1PthBTjA54CQb+a8fHcqyzOVra29t4u2ww7Zy2bSWdytc8pvRxJBfp7kwn4TEO34lUoS9MAEshe+i9mkPYb99q720RqNeLON/oLQzLOaVfiaK2RdKMgTUOpk6XBSO+Slp4j647W84ICL+UmIelmct9Kyjx7cR/5IytsqEowzTenflmBR5Hox/Xedg7BjTBuoJVuIJaKmFuBs3h/YbNlPVHBhKWKQTctJS7Zx1mK8kyJNUofMXU38QNyUYFMcKkOQ5B/KBXifclNr+ZZm3DRgGrVukNXMI0M+hnX9tw3/9yi5Ey0sFIdqDB8o9RUuhJ3/TEuJoHp+aNj0zLtri8iSRSFMm2nBtMI7PyyLrMAz6e5ib4nI8MWfTYMBsDAoGs9QjFIbAWEYTyWKaALtXR7DZFX2v0Pi3BWoN21YHy8mqHqNdTnobsQXOMtjRPvOuonU2IDhJ5BhRBuZJVXS2s4FCWWatXlJbGQBni7zBpYvX6FHu3VsMEHuaQ5YVeciNiFfE9nlORhoMeg1c2tabVCtsEYF6NZC0mphD6s7Wh9hVXhDc0RSz92BKiyXXC6s9Xpw6xXX9oDgo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0684.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(91956017)(36756003)(66946007)(76116006)(478600001)(5660300002)(9686003)(66476007)(66556008)(64756008)(6512007)(66446008)(8936002)(38100700001)(86362001)(83380400001)(6916009)(54906003)(316002)(186003)(6506007)(6486002)(4326008)(71200400001)(26005)(2906002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?c4vINluNSP1CHfgRX501mpfstrrL0qmYVUaCSsNzo6lthpsapke+9gv3oReH?=
 =?us-ascii?Q?bG6SUw2EwRRFnQY0DthKz+Bp9SkIRObDkGJS+jR4RZdmi+0BznHbNfXaqG/t?=
 =?us-ascii?Q?9pwgYiqA0XftwcOhQOs3qCO/ge3BkzdnzAkr9uyPg4EdAw7YzvHCn8gr308O?=
 =?us-ascii?Q?y17rWGq1OoVERKvyD+RuX/LAvbKRZbL5r/wBJWDGcY7N+Tx20Cuz+3X1yPsy?=
 =?us-ascii?Q?eneUHtXsbhkOS0dMWQ4Tk1b42HjCXDWNztd3cI/M9qdrX11PBPO+aCjY/SiZ?=
 =?us-ascii?Q?plBZbmaY3buorGIH4qOaeVAArDl5/t1LSfgXX+cXtT5Om8zVsz9cmVtvGUly?=
 =?us-ascii?Q?dtt1koDibtjsw5fyi/qyKfdbjUaOuQrc8ra4aAG+25QVY5Or9zLN5mR8N5SH?=
 =?us-ascii?Q?NRk4UiM38bxYGqGYJtrofqkc5vDg2xEJBy4UpsX9nkAxjscv+LyTtgMt+hv4?=
 =?us-ascii?Q?gN5OgQM0QWW354gwbwsiRjmRNNGHAoXUmGJr2ufxWS+u36ug23YbLiA1Mn74?=
 =?us-ascii?Q?ZBn0duJH0tg3egkUJb2Cj9FGZf2kyBAImMs8Q92I1gxaUA76x+iEuGhP+BV1?=
 =?us-ascii?Q?VlXjkNnw8n7l3b4YH4u05Dv8NcxB+ulYj/91Ysb6OUGMIrDHMxNjZ/KH7cuu?=
 =?us-ascii?Q?O2UZYc08GozM3iHNgTxrrtaw9j8A6nxgHiR75iMo54DcYZ1NcOFhMYWfswmX?=
 =?us-ascii?Q?Lk4MztujVDi+/Si3XSyV3PybIYr4RE8Zf03BuWF9BkvdblMJXVAR5ppDGxAH?=
 =?us-ascii?Q?aL9H6IjmQ1Bv/928cXX9y/GvjOV+qgxT5UKaYH1+pQdDdH+r2hssYmJp8eZ2?=
 =?us-ascii?Q?B+1z6CReuBW1dSu15/iLNvf1CqfAgLa2nlIFVbMLuv/fVFeafkAKuHcz7qYL?=
 =?us-ascii?Q?QJ5oHIofQ9Fh8DNOhSaVo8ZKt8ligOnw5O9oZP19KpGuC//LIzUDQUPef4d5?=
 =?us-ascii?Q?7IcSK+boJcAgLzJbkQaFAUeBnkJKE63jQVFZEL60I3MfPenzsWXQknXJKLiG?=
 =?us-ascii?Q?kYrl2qTHrPK5xLIsYzvoCADhpEa0LCskEKS4lpNwvOdceYMeC5/+hzI6uQ02?=
 =?us-ascii?Q?weKSPiyF5+guEK/p/gGpGzFQD06y50yXUIMJNSC/ucKPQjWTsTRjtuNVfLFd?=
 =?us-ascii?Q?eIWWEt3HcrRF5XpgN3+Qgsfp3Y2b+Y3yEJcPzyHQD3lq5m+EttVDrNAc2tZn?=
 =?us-ascii?Q?TeEExBI4Xf3rAYFxhBZj5M37VRaBrcHmjK9EjaiQHe+305aTkATX2kumoorl?=
 =?us-ascii?Q?UjPs+gq8K6yECMJeYyqqcmm0SdicIzJrHiiJs7/j/V18PGJyExnVr6HLyykC?=
 =?us-ascii?Q?g2PuCC3U29R8+F53gEs151B2?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E2AD1AE914FB0946937EB74D18AA84D6@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0684.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8619bba-cbf2-4d8b-edaa-08d8f3655ce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 10:19:54.8108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zV40jVCU/JXgNrFzSW4MNbsK2dAAdSBenaoGA7EANvYHH3bysYZu58VeXaApqHT7GYM+ngpv9pLc2ShyhUN1Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5548
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=716e969d0=Niklas.Cassel@wdc.com; helo=esa2.hgst.iphmx.com
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

On Tue, Mar 23, 2021 at 12:20:32PM +0100, Klaus Jensen wrote:
> On Mar 23 11:18, Niklas Cassel wrote:
> > From: Niklas Cassel <niklas.cassel@wdc.com>
> >=20
> > The description was originally removed in commit 578d914b263c
> > ("hw/block/nvme: align zoned.zasl with mdts") together with the removal
> > of the zoned.append_size_limit parameter itself.
> >=20
> > However, it was (most likely accidentally), re-added in commit
> > f7dcd31885cb ("hw/block/nvme: add non-mdts command size limit for verif=
y").
> >=20
> > Remove the description again, since the parameter it describes,
> > zoned.append_size_limit, no longer exists.
> >=20
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > ---
> >  hw/block/nvme.c | 8 --------
> >  1 file changed, 8 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 6842b01ab5..205d3ec944 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -91,14 +91,6 @@
> >   *   the minimum memory page size (CAP.MPSMIN). The default value is 0=
 (i.e.
> >   *   defaulting to the value of `mdts`).
> >   *
> > - * - `zoned.append_size_limit`
> > - *   The maximum I/O size in bytes that is allowed in Zone Append comm=
and.
> > - *   The default is 128KiB. Since internally this this value is mainta=
ined as
> > - *   ZASL =3D log2(<maximum append size> / <page size>), some values a=
ssigned
> > - *   to this property may be rounded down and result in a lower maximu=
m ZA
> > - *   data size being in effect. By setting this property to 0, users c=
an make
> > - *   ZASL to be equal to MDTS. This property only affects zoned namesp=
aces.
> > - *
> >   * nvme namespace device parameters
> >   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   * - `subsys`
> > --=20
> > 2.30.2
>=20
> Argh. Thanks Niklas, queing it up for fixes.
>=20
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

I don't see it in nvme-fixes yet.

Did it get stuck in purgatory? ;)


Kind regards,
Niklas=

