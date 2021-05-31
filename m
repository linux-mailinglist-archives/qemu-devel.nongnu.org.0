Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A326396415
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 17:44:22 +0200 (CEST)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnk5U-0006hU-HS
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 11:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=778ee6da8=Niklas.Cassel@wdc.com>)
 id 1lnk3n-00061c-Fr; Mon, 31 May 2021 11:42:36 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=778ee6da8=Niklas.Cassel@wdc.com>)
 id 1lnk3j-0007Kn-Fj; Mon, 31 May 2021 11:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622475757; x=1654011757;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TJGdOv45GssqrFlNeVxHNn5WMqdJg+lh7RYNsXAGTt4=;
 b=qVd7HRmMPM+IjRD0YN7x4DvEO1Z7IAn3XDOyK4qD0StCO0c8cmdMzXfU
 LjjUBa3RoZm9ktd1N+zLJ8XPKi+YFqvDJuDITZ2XSQ9yGc1wD0yU6KCmq
 JdGKq0b8PccuVG63deGqEOb0r/XldLN6tcDjFF4iDbrWeEBhcJfQl2Wyf
 26ERNZeU3PWgw+yYxtJJVuWYt/lYD3Jku348grXWGQe6NJeJ9guESPq2B
 +zP5xcHNk7u2zsQ+boXrQ68Aj8b34UImZoUzR7MYTHGT5lmW9mZU+lr/G
 3cBvQaWBfrgDk0B0uIp+woBNA83GwR0OS+o1b1LxuccdbCUSIzYb6wHei g==;
IronPort-SDR: /FzS2+enZkzzQfA4H7geIQgdKvwgxGYyQNzf5gCwAjtPTDKR0V9HW7vxZVjuuXzuW5tro+shUX
 xVqYUcJ9cA0TtxMfMyhKTMM26pPbd989RPBqv/t820u5tf6tbz2ADqOXlemMA7iUL2I4Izb1yT
 spUapzFVwTHRmVltAcm+h9kWwkIifyOeAJ1oRKXzomjuBbAQIfFfFdB3Rb15FbQW/OFT+JBkN4
 HpsSDFV2fl806uY0X2SaLOb0HQy4lVq9uSrpC3D2rbIljTk+lNxM7mdEXlLW9nQ/M1GNX73m4g
 Pqc=
X-IronPort-AV: E=Sophos;i="5.83,237,1616428800"; d="scan'208";a="274046170"
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2021 23:42:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1duiVDiwy3lyPGZqP/QeMyTCc4UL3RAlqAXpXufRsoL6omwoWimtMzTktGhXPQD+lX5FX3RA+OxXD9/l4C0wC1KhQNve1394LCF9gKXo4WeA2IFtNvDhcuZ1hSOzuB5IqaifDLZZgCgFTf8s/oKyxijC1SRwF7QlV3F5SXfSEaCFhpvfzRSr4r2yauFOAcSCHgGX8fiJpTKWOrE30nQdYkCIRjjAMoC8NG8PYejmXDojvAZe4QNvZQ12TC+uzOf6zr5YXIFxA9pK78cH93PhwXIEcJ0Ao9Md2363nV2O+UPrMcPpmSqmSlYbencxRp8GI867QQT1bMOurVp6CBpBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3bClsgU42mrs4FG+MkY8ND1HWhuoIKQY+W8y84+eUQ=;
 b=dR1VjS3OQdGN3QM0Sd2BAOkLqcqWNdWEiFvpUvBwqw/dod7F2Sdc2vRSuADHaIvUjpZZnqQ3xe65nRrhhSM1sKxgLUQ+vWvobwEdRLRCuQ7MB9gDa8tmBp60M3whyMBcB8bL4IiaM9FTVRAmOKKES4exQuOwJIic3s5YjuheLQkD9gdIVxFWx+dD1FQDRBXNFCDidFrN4Vr0G79bJacEDbUnh79jKFkQjaKjZgIRPTk5q7S9J2iwq1201DMhnCRYGG8BNbykEoQeITpvpI0S8ybb7H7A5s/8xNvvqotEO2gKHOhasjYTWE/qAlTbUf39T+7k9XcPPud+P2lXarT46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3bClsgU42mrs4FG+MkY8ND1HWhuoIKQY+W8y84+eUQ=;
 b=Cuu41Ws9PfWTvIgoaUoGC6eSqLuCLdcXGj4TM80NhGqE7ixSsIR8zNKDPtDrVXagnrilgfndx+EqwlLrEhc9sWKlunETz0CnMOkc07sm6MJCnI4S1L1cjBM/I45gnEy6aNba+5uHcS99kCkGBr/tNUcRSI7I9/X6WFXNVgvmmxE=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by PH0PR04MB7205.namprd04.prod.outlook.com (2603:10b6:510:13::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 15:42:25 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::45d7:388e:5cbb:ae1e]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::45d7:388e:5cbb:ae1e%6]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 15:42:25 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Thread-Topic: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Thread-Index: AQHXU7FRNLQ7NeS/402zZyMJ0bJ5NKr4wCQAgAT/kwA=
Date: Mon, 31 May 2021 15:42:25 +0000
Message-ID: <YLUD4BggUinxUBGl@x1-carbon>
References: <20210528110459.65387-1-Niklas.Cassel@wdc.com>
 <YLDSfrUIPaZxk6VD@apples.localdomain>
In-Reply-To: <YLDSfrUIPaZxk6VD@apples.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.226.244.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f507539d-fa6b-483d-928e-08d9244ab061
x-ms-traffictypediagnostic: PH0PR04MB7205:
x-microsoft-antispam-prvs: <PH0PR04MB72050C0439F17C22E15C7039F23F9@PH0PR04MB7205.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nosRy7WVzP4fdeSOmC4fmbba8Lu1FjmQFXK4WrLcbMV2zseP1PnFNmpx25KT92plk0xj9cmPGjFHzfpyxEYDSupajM5j/0PcjPsxybELpYZtP3h2zRQPru14is7T00ts3fAcoILXKdjFuk6I3Q7adhxouwPbw4F8CVOBp7M/tMgi5Pb5lUQ86u0TeLhydGQlRenbIqftTb5hsTlsUQ9bIKmakg2F+b4G6hlOpjT1r/6XpBre+D+cOuSFpLk6NLUXlAD2uDE13t/RBsw2d38VH7YHoz6Aei6iS9Qqkrp0rNCZR58VeKrYFZsbJ7LfOMcRX0ek/wyAL5LdZmhU0BRAqTD0Wh4Y39b261KcF0aCyt70zrwCaFU4U8qJyN+SCbGt3snR6CeTecmjjsXggNslkPDsoHRAotvlsl2R6wXaYC4OAu51+6PXBouaQo5+EAuK+bVXMO2dWrPSfAFcjQA0I4jeDe6kpy9HcMcCr4EMDyusx1CMXzP5UEyCFwdBHGNFxn+WDEDBgKa/zUl7ms/sWaoE+Zg/NpqoeLkRqyWoDUQDzQWPThIXmEWBG8YIMfHpKgRsRoCqLP5LOC2fn8gl3o30bZHyT4EWmTV7drxJoO0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(136003)(346002)(396003)(366004)(39840400004)(376002)(8936002)(8676002)(5660300002)(33716001)(2906002)(122000001)(66946007)(66476007)(66556008)(6916009)(64756008)(66446008)(83380400001)(91956017)(478600001)(6506007)(76116006)(38100700002)(186003)(316002)(86362001)(6512007)(4326008)(54906003)(6486002)(71200400001)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Me+A1uKs3+CHGnbJs6qppFyO2bp1sAKtVd0lZLzfpm9NqYTrw2sHiocxoCmg?=
 =?us-ascii?Q?7bu78VZhLuXzV5h4qccJRc7luHCiveIdLlwloVKsuzCapoy5Z1PwumlVj0vD?=
 =?us-ascii?Q?z9yv3UcPOieJ51KjGBsLXdzIyWPE74iSQNoq9j3EwDK7BLIeaeLj3GvJpBG+?=
 =?us-ascii?Q?Miod0ldOg84bD2w902neVJIjPaJE7f1VFc1juGMSdFFy8JKzveUmfD8L3HZk?=
 =?us-ascii?Q?4pQmUayiOmoluR8mOW/TjhsVgrqxv7XwlXly/yhLUZtNegIf/6ADbVLN1Gh0?=
 =?us-ascii?Q?hbeb+VB5XP4f+wzeqoMSsMjNFwtHXb1qfFm8aBOVtE1gRx5/4u0YIskwrZFI?=
 =?us-ascii?Q?Qod9X6jXDObR4J5s/AiNPveZWcvaCOE817tZiC1hjLKQJSgxjRMMCVCfR6lR?=
 =?us-ascii?Q?/+1XWAJsTWaGo21xN1ykTYf142iJs+PAx66O7sRjBIdDKvy/hZur5OFzx1fW?=
 =?us-ascii?Q?ThV9DMOONuG9xfsrvIGPVZl5H4pMHXpOK7PWnfmJWvJQ4/nrtJmTygk892NH?=
 =?us-ascii?Q?xaht5EdT5luhlTyGOZXcyeC+hheP8L6NUjhThgMrSROhFcFdIjddMiPDbmnh?=
 =?us-ascii?Q?lQj6KLBuCsSeWpNauWxvw6dr42qIuPN6uErBJmdahRC2JqTRJuaSIR27unCE?=
 =?us-ascii?Q?nWNcGbdx8XoyFVZcTrz/LsbDipDIiF9EmQLx4jqmmJ5mOzwMvWWESLh8IohX?=
 =?us-ascii?Q?/5Dn+adnLnymeS0SaBswDIELSwuZEKfg9MXxvmWjPdM79tqvM54CZrwYLvJX?=
 =?us-ascii?Q?M4zuXJmCTUVilrgPYxImnPafsVoELXzyykrxRFYXBuWAjqfna+ewO+qOMgeC?=
 =?us-ascii?Q?IfbHtxo7IE650oXdA+TfBJa31hmPkhc2mYP18fJ/qsrdxl8pmzqfuwXlaUkx?=
 =?us-ascii?Q?/ip3KzEpz/XYeKYLQEW+xHXd47WjdCVvprqU4Hp4MxiS3h0F4NDdSSyHFmfC?=
 =?us-ascii?Q?PemIr5kicuOsV/zW1JYwX34pqOHlrfEZE3vvQoApmuyEorz+9G/h27/Rp0nn?=
 =?us-ascii?Q?V+Zs8HfXAe5FmFZdwNq6mAvJy9IS9dfDtxbuQ0bZ9P/wzIiIDOcaR1FF4IsK?=
 =?us-ascii?Q?MojsVSO9AF5G3ASvP5oeLu6YeJcTI7mo+ifp/BVZrduA/SxVhMUGTqaVTV8n?=
 =?us-ascii?Q?JnBJmTHuOqP75Sd+uRuW07Yz2KTrkDbFt9hLC7L0//ONmE0Qd2hTvrV6xKci?=
 =?us-ascii?Q?Cb8JOY2b0UvNTwBHYDzHrTFGk00fS2FNkbVKz7p09rCkKGT5c37SjrVoeRPx?=
 =?us-ascii?Q?jCwLrsnNN4YUCrLYGUwDOFNWJQ9KJ2NGZFTxxX+xf3OcQb9HZ/hEE1S7zaT5?=
 =?us-ascii?Q?6iPSydHyNGVlWpHiyu96dpMY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <15524E054167F74D8C08FB8989FBEAE1@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f507539d-fa6b-483d-928e-08d9244ab061
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 15:42:25.3466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6VTcO3kdw7i5sHGs6lvSPx+JLZZeQPN5HRVZxB8IKmEpCW7QmVaerPlxsm2QSW1jRREhnT+x3DKO5yj5tvCVkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7205
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=778ee6da8=Niklas.Cassel@wdc.com; helo=esa2.hgst.iphmx.com
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

On Fri, May 28, 2021 at 01:22:38PM +0200, Klaus Jensen wrote:
> On May 28 11:05, Niklas Cassel wrote:
> > From: Niklas Cassel <niklas.cassel@wdc.com>
> >=20
> > In the Zoned Namespace Command Set Specification, chapter
> > 2.5.1 Managing resources
> >=20
> > "The controller may transition zones in the ZSIO:Implicitly Opened stat=
e
> > to the ZSC:Closed state for resource management purposes."
> >=20
> > The word may in this sentence means that automatically transitioning
> > an implicitly opened zone to closed is completely optional.
> >=20
> > Add a new parameter so that the user can control if this automatic
> > transitioning should be performed or not.
> >=20
> > Being able to control this can help with verifying that e.g. a user-spa=
ce
> > program behaves properly even without this optional ZNS feature.
> >=20
> > The default value is set to true, in order to not change the existing
> > behavior.
> >=20
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > ---
> > hw/nvme/ctrl.c | 9 ++++++++-
> > hw/nvme/ns.c   | 2 ++
> > hw/nvme/nvme.h | 1 +
> > 3 files changed, 11 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 40a7efcea9..d00f0297a5 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -141,6 +141,11 @@
> >  *
> >  *     zoned.cross_read=3D<enable RAZB, default: false>
> >  *         Setting this property to true enables Read Across Zone Bound=
aries.
> > + *
> > + *     zoned.auto_transition=3D<enable auto resource management, defau=
lt: true>
> > + *         Indicates if zones in zone state implicitly opened can be
> > + *         automatically transitioned to zone state closed for resourc=
e
> > + *         management purposes.
> >  */
> >=20
> > #include "qemu/osdep.h"
> > @@ -1699,7 +1704,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace=
 *ns, NvmeZone *zone,
> >         /* fallthrough */
> >=20
> >     case NVME_ZONE_STATE_CLOSED:
> > -        nvme_zrm_auto_transition_zone(ns);
> > +        if (ns->params.auto_transition_zones) {
> > +            nvme_zrm_auto_transition_zone(ns);
> > +        }
> >         status =3D nvme_aor_check(ns, act, 1);
> >         if (status) {
> >             return status;
> > diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> > index 3fec9c6273..31dee43d30 100644
> > --- a/hw/nvme/ns.c
> > +++ b/hw/nvme/ns.c
> > @@ -531,6 +531,8 @@ static Property nvme_ns_props[] =3D {
> >                        params.max_open_zones, 0),
> >     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
> >                        params.zd_extension_size, 0),
> > +    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeNamespace,
> > +                     params.auto_transition_zones, true),
> >     DEFINE_PROP_END_OF_LIST(),
> > };
> >=20
> > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> > index 81a35cda14..bd86054db2 100644
> > --- a/hw/nvme/nvme.h
> > +++ b/hw/nvme/nvme.h
> > @@ -100,6 +100,7 @@ typedef struct NvmeNamespaceParams {
> >     uint32_t max_active_zones;
> >     uint32_t max_open_zones;
> >     uint32_t zd_extension_size;
> > +    bool     auto_transition_zones;
> > } NvmeNamespaceParams;
> >=20
> > typedef struct NvmeNamespace {
> > --=20
> > 2.31.1
> >=20
>=20
> Looks good Niklas!
>=20
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

In reality, it is the controller that does the auto transitioning.

In theory, one namespace could be attached to two different controllers,
and I guess, in that case, it depends on if the controller that we used
when doing the write supports auto transitioning or not, that determines
if a zone will be auto transitioned or not.

If we were to change this to be a parameter of the controller instead
of a parameter of the namespace, we would require to refactor a lot of
code in the regular write path. As we currently don't have any NvmeRequest
object in nvme_zrm_open_flags().

Thoughts?


Kind regards,
Niklas=

