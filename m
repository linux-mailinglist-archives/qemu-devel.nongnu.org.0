Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA13F8230
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 08:00:45 +0200 (CEST)
Received: from localhost ([::1]:32844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ8RG-0001Rt-Ao
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 02:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mJ8QB-0000mW-Rv
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 01:59:27 -0400
Received: from mga06.intel.com ([134.134.136.31]:20275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mJ8Q6-00068v-GD
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 01:59:27 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="278683980"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="278683980"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 22:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="456661134"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 25 Aug 2021 22:59:16 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 22:59:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 25 Aug 2021 22:59:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 25 Aug 2021 22:59:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2TADj6cX7dO9llJi/re6WAyY4DnhstGh8nZ9Z5UR0TEhL040uTsAKXZLh73Hm8BDaitgpj2BnaT8fSV//3ycn44XXmuIlr2IMYMrB7z6FupLB1GrM+bbQoQ7BkrElrOTNOFnMFbrv1uLo70llesEKhd1S1NFHTj3whpBmFhOL3jyvFeBpj0NHz7OnLTB7c6WidD8pfV6naKxzlzzmzGJrbPJR3klGsqtzZH5BHaS3C1xM3p31u3CBpkwrlwF0gkDFVCmXoi5ub07CHpuduFxgbi+uarUNk94ePMmNUARAbfUwgj3utJJ5WuEDN2wNY5zUQMoKGd5DD6lx9+ErbvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rprj98gj9yGfg9r1riRXRi44dcPKMSgPygFTCK6pUFY=;
 b=DRNT+yG/L2dy2bZ2B9FDmDl2pHkMEZTZ/XFykY4xLECDzmxLUTsk69qlFKjj9EGTjWyHax0XWseTljW6l1FxTONvwHlFRUA1hlODHVLfxNKtSNDgmaf6GanTasAtquqid7sO5C3dXeTYUWECz5sinkUjj6+50BiGmOB+rA82dOBa6B3NMzl0qIfeMunFCCObefG87U0tZwbHGrITW+1a2Ma6xWIhAHOrTpvCZxFeyXNmPsae22dobxY6y87fiahCOsLX1/9noXYlTLrwZrBR8UUrZzpDclYnRru4HX07fabGDutxO2EcRM7NsIW/EUM06b23zI7HwEXv5NDv6kHJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rprj98gj9yGfg9r1riRXRi44dcPKMSgPygFTCK6pUFY=;
 b=J5+FEmR6c+g8jNrEavCrDoNua3bapIlJI4oMmRjs8rFuIRi/4oqD+VTKw4BY9bz620f6vLmBi3qSM5mtP/jNy8qDrjIqj5rmGekYsuzLGqbfddg2qp6gYoBK9vdW+pmw3HIXSCfuCISuGz1PeRdalX5VUloFgbPuR4NHQorhFw4=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 05:59:09 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945%4]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 05:59:09 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Eric Blake <eblake@redhat.com>, "Xu, Tao3" <tao3.xu@intel.com>
Subject: RE: [PATCH v2] net/colo: check vnet_hdr_support flag when using
 virtio-net
Thread-Topic: [PATCH v2] net/colo: check vnet_hdr_support flag when using
 virtio-net
Thread-Index: AQHXlJlgS22HUioSM0+thc3FtmRHiKt872QAgAhmHtA=
Date: Thu, 26 Aug 2021 05:59:09 +0000
Message-ID: <BN0PR11MB575788D65F197AFC5685FF549BC79@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210819012717.318050-1-tao3.xu@intel.com>
 <20210820214238.yxly3k7chfi6xakb@redhat.com>
In-Reply-To: <20210820214238.yxly3k7chfi6xakb@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa514375-6557-4882-4a26-08d968569f4b
x-ms-traffictypediagnostic: BN9PR11MB5465:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB546581FA4AF5945F3155BCD89BC79@BN9PR11MB5465.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QlcELKeyxlZ86mY/gc/ktT+gg0KL78s9Qea7161Cal7/Z4WRQRPcdecuwpfHfZ449DIA2of5oGH/oaN5zjNPemkREpJFNV4v+ebVQt1bdo9ZNHj5S6K/SpZQhsor5ciwt+F03JV4RW+Mk53pLDsrNOlOtFL7afhGbLahmgJzjLzrnRqbjxMv1zUEyTrOupogZyIahJjDxHKDyxyqZF38aloLl/5jslsppO2+T11Ovw5TBD6ET3CZi84axHmsVseAp5qTbcYqv7BlL/uDJze0F73Ddd6s7/lzGXsW+RiXuViBBipDDlxGauGHCJ66jNFTidsbElzlyZeo24x9mzdOgLBMkbxv96ZwPOUjHiKhNNZ9SuSwSINMcIepczh1P7o1KJgRX3ACDDd4JrVV1K1M1KH9GqHxI+o7Ienwse5wi93pQ58S1BxWrJNcCX/lrhWw4TuBeMbWMpvbmdlFcJWHYEei6UrAzrCO+V2v3zmLMXbOjr11Bz9TiPE93U0DMkDzQ3iJVxmGU0WPpWqE2VE31BbvQTNq/N6m349ADS7DsEoAYs9ILWH9XxoYw6MSJcGHBCkOf003Mystxfuq36bE70pi01sPCA40Kq8pT5ajWSO4GUfNMCrtNlEOnFH/vb80Z6XRyyjELC+huOwdgmO5cQpqzWLvfVpYtNyPC4FhDutYxabKIiOdf2jDjz45EP90pQef6h/l3xiBJcAd1iKwpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(66556008)(66476007)(8936002)(71200400001)(7696005)(26005)(110136005)(64756008)(186003)(2906002)(53546011)(5660300002)(316002)(52536014)(38070700005)(76116006)(66946007)(54906003)(66446008)(6506007)(86362001)(8676002)(4326008)(38100700002)(478600001)(83380400001)(9686003)(55016002)(33656002)(6636002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iaBnBkKJBOXdpInVqW0+noDsJsmMCNJLc3F331e1J3SzILfwrZE7I+YoJ1EW?=
 =?us-ascii?Q?BaH7vJhzTCgfSOdd/084E/C0TxvHcnHgxashMBs3baoj7hQoeiEfnX8H4Pmh?=
 =?us-ascii?Q?TmDDaSTJHOt6BNDSnmHgUXG4/jk6tUJ/aqsRuOLcJ8SYkbv9XZzPJ2EMunNN?=
 =?us-ascii?Q?3mSUvAhrFhkZeuCr3Bj7Y1tdMy2+GRBRFh+0VoktiMAt35YC7r9L4r0w9ebl?=
 =?us-ascii?Q?7SiA6k2A6OcLPsdZS4Lp05fSy8Hv/sF1JsvuMr02m/qvPO8oZwvCctqz/8KQ?=
 =?us-ascii?Q?o5Ty++duS+i5+Qm/zz/VyIl/Kht05hePATWW5Vp3Sgqe4u7K2BPT6eGo0dn3?=
 =?us-ascii?Q?qohk5EiA2l5U7nyN67OhKgM+XpiGlfHiSGmEAynn2yeBWM//eggFD0RP7pWh?=
 =?us-ascii?Q?2rxpMQ4q+pBKru8Ivwo/AYNtAggXTY95edll4HHSaSFEu9zY3nJyfk/mrIFD?=
 =?us-ascii?Q?AHIZtR3MzLRLQNGVL2Ias81qPt1gCS5A85SxL0XEK9PPvbWsSxaOVt366xnX?=
 =?us-ascii?Q?EXZqaVZXhp68V+KfLPKbkKMAfhMVb/GMA5X/QV2uLs2z2mlHqKJ4I+7epxU5?=
 =?us-ascii?Q?swuaAvLfB8uTSqO+K5LujBgjjv4OvS/Qs9tR5RpRIvpd+ddqrP/HqvXM4C0b?=
 =?us-ascii?Q?aKHFc5KHuyA2zLTfn0MUbZCw5bm5PcLhTLdwlt0UcIc0AaQOp5GMmIMKCnFl?=
 =?us-ascii?Q?lAgReLeT0joz8neg5yyvbOVVYaWiAeThA0MTHgCcJ70ErO+8syjdoH87Z4EJ?=
 =?us-ascii?Q?XLTciywxcTsqtsN0g6W3jIHGpAtTVs52XmodMKmkbX9i0c9/2yZDH+NJXryu?=
 =?us-ascii?Q?NYErQ5HzYLCjRYLmA3wvXAPu6hkUdxE1Y5hzuCgXfI4/vEYrD9nn515MCzFt?=
 =?us-ascii?Q?gj1EV0mdpcbghD1Yd8n4CBZGbqM/vOpV8j/XD+pWxa7tAtLIq5M1lJAvKfb2?=
 =?us-ascii?Q?YhP8yp8kGDHlAk4LHT+0ZCcBSLoHqHQePxNODMD+mAZFThpiWjAsO8toS4Pn?=
 =?us-ascii?Q?MinCQpMoh2tuOoHKHGTVPVNHr0zKpfKt1VU2jKyLRvgqQnlX/4N+VUyEqdC/?=
 =?us-ascii?Q?pk0R0KsW3NyJMdo91TePVJczU8mrF9zvAVEFifLh+DQKS6p/TYKgw87TN0Wp?=
 =?us-ascii?Q?+9bj2jPx7s/3C+C8XMXnrVX0BXx5JfU9AoPpnircbzrplL+8D8zdhzOLcGwX?=
 =?us-ascii?Q?kbUtIOoFwPaoyUiGAZYFFC8rnsxulCG/aRR44t3+KgwsWVvawVwZJOnSY2nZ?=
 =?us-ascii?Q?8nMV0IPY8Yo6cYGPeABdmXVlCgulLcKk8TTZmhe1UIg6rdVQ9gldAvGt/HJ+?=
 =?us-ascii?Q?5IC16g64cKAGoOptqFUs+lGo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa514375-6557-4882-4a26-08d968569f4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 05:59:09.7996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D4hMF7b2lUKil2BKFHBZzjndgXNpI8fpUw/EEff2kzq9ilSDT52u5nxVUt9TpQDJbcM6r5yhp9D1HtuQY4YPww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5465
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Eric Blake <eblake@redhat.com>
> Sent: Saturday, August 21, 2021 5:43 AM
> To: Xu, Tao3 <tao3.xu@intel.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com; qemu-devel@nongnu.org
> Subject: Re: [PATCH v2] net/colo: check vnet_hdr_support flag when using
> virtio-net
>=20
> On Thu, Aug 19, 2021 at 09:27:17AM +0800, Tao Xu wrote:
> > When COLO use only one vnet_hdr_support parameter between COLO
> network
> > filter(filter-mirror, filter-redirector or filter-rewriter and
> > colo-compare, packet will not be parsed correctly. Acquire network
> > driver related to COLO, if it is nirtio-net, check vnet_hdr_support
> > flag of COLO network filter and colo-compare.
> >
> > Signed-off-by: Tao Xu <tao3.xu@intel.com>
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
>=20
> > +++ b/qapi/qom.json
> > @@ -241,6 +241,11 @@
> >  # @notify_dev: name of the character device backend to be used to
> communicate
> >  #              with the remote colo-frame (only for Xen COLO)
> >  #
> > +# @netdev: id of the network device backend to colo-compare, although
> > +#          colo-compare doesn't depend on network device directly, thi=
s
> > +#          parameter help colo-compare know what network driver it is
> > +#          working on
>=20
> Missing a '(since 6.2)' tag.
>=20
> Grammar suggestion: s/colo-compare, although/colo-compare. Although/
> s/help/helps/
>=20

OK.

>=20
>=20
> > +#
> >  # @compare_timeout: the maximum time to hold a packet from
> @primary_in for
> >  #                   comparison with an incoming packet on @secondary_i=
n in
> >  #                   milliseconds (default: 3000)
> > @@ -264,6 +269,7 @@
> >              'outdev': 'str',
> >              'iothread': 'str',
> >              '*notify_dev': 'str',
> > +            '*netdev': 'str',
> >              '*compare_timeout': 'uint64',
> >              '*expired_scan_cycle': 'uint32',
> >              '*max_queue_size': 'uint32', diff --git a/qemu-options.hx
> > b/qemu-options.hx index 83aa59a920..b31ce3c87d 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -4957,12 +4957,14 @@ SRST
> >          stored. The file format is libpcap, so it can be analyzed with
> >          tools such as tcpdump or Wireshark.
> >
> > -    ``-object colo-
> compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outdev=3D=
chard
> evid,iothread=3Did[,vnet_hdr_support][,notify_dev=3Did][,compare_timeout=
=3D@
> var{ms}][,expired_scan_cycle=3D@var{ms}][,max_queue_size=3D@var{size}]``
> > +    ``-object
> > + colo-
> compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outde
> > + v=3Dchardevid,iothread=3Did[,netdev=3Dnetdevid][,vnet_hdr_support][,n=
otify
> > +
> _dev=3Did][,compare_timeout=3D@var{ms}][,expired_scan_cycle=3D@var{ms}][,
> m
> > + ax_queue_size=3D@var{size}]``
> >          Colo-compare gets packet from primary\_in chardevid and
> >          secondary\_in, then compare whether the payload of primary pac=
ket
> >          and secondary packet are the same. If same, it will output
> >          primary packet to out\_dev, else it will notify COLO-framework=
 to do
> > -        checkpoint and send primary packet to out\_dev. In order to
> > +        checkpoint and send primary packet to out\_dev. Although colo-
> compare
> > +        does not depend on network device directly, netdevid help
>=20
> s/help/helps/

OK, will fix in next version.

Thanks
Chen

>=20
> > +        colo-compare know what network driver it is working on. In
> > + order to
> >          improve efficiency, we need to put the task of comparison in
> >          another iothread. If it has the vnet\_hdr\_support flag,
> >          colo compare will send/recv packet with vnet\_hdr\_len.
> > --
> > 2.25.1
> >
> >
>=20
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org


