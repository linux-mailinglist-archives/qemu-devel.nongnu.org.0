Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A2A405803
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 15:47:07 +0200 (CEST)
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOKOQ-000707-3X
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 09:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mOKLV-0005MU-PN
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:44:05 -0400
Received: from mga14.intel.com ([192.55.52.115]:52947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mOKLR-00024E-F6
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:44:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="220468472"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="220468472"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 06:43:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="606840270"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2021 06:43:37 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 06:43:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 06:43:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 06:43:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akcO9kfNBaXTAoZsBxNpQ63J4vnzU5A04IoE+3XVaWo8VC0AOSsZBnJSZqYHQDSax7r4RUBXVBKMb6VV+W1wSnR9q+QsPSeB8f3ZU1KwnYn/yxxukfyasHn0KzqMbdKsEX205zJas3RGKJLgt6TYYuenj3NiJYw3V3odeABMqNehr6NpPtEY5Qdn8BJ2Vy/HzNYgVBwCh+bG9Qnh+XkM4dnxrTboTcYeZwpmW6PBw8fpJ9xE2irY4pv9OGlLmwd1Eyizo2+OdqmmRYGhMpT0dt7NTp/cWoMu/j/QreEjnQOLyEV6tJdlfqNhM639BIMeUPKWUhxnU3+INy4Lypeo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=rquyr5c4b/vno++XZqAAGvh37tDgzmZORIlo9HEiPAE=;
 b=HTEBCTEYQ6ujGbgY/ZZp4da8meyQAJQ4WCKrEdp3XEgTi7g21PHuYjOY83n0CCxkWtABoDa2tnPsvQ0xbLQgo0QPy6fKtRoz9eYlvKMu4EBRvOmYWOgBXcCxpfpqShKjV3xeQE57SB7DR1O+1yn7SQT/n9nWzwo1QHNyJHsfm2oAqMK0XYm6xEZLiPkgaIJlkaMTPE9xobbCAXzhpMznkNuNDnSWDeuDCqmJyhcraozQeKTsstRZ9ZCBOzOkcMtP0EZy8wE6pXbTViVRkC7VF+0XwvXpNRor6FSnswhvuYOMz0HTmNSQEEE7cG1wAqwOiU6Rx9hbbdj3PveUTPw7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rquyr5c4b/vno++XZqAAGvh37tDgzmZORIlo9HEiPAE=;
 b=OVHsqj5yUhGfTrilSgo+jhrHD54HyNe1fxFXVxKn7MHucfFusoS8DdOTNMwJ3G0fcUA1hOs0N/UQ1W3d8dSuAbRJHqlcaBKNPQdUbso0W10FtDA2bNHt/fLTRYAmeFnFCwdkQrcrlelLKIi7JWHQuBQdQWycX21vfkNJ3gxT5EI=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN9PR11MB5500.namprd11.prod.outlook.com (2603:10b6:408:105::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 9 Sep
 2021 13:43:34 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::bde7:7f0a:e0bd:9945%4]) with mapi id 15.20.4500.014; Thu, 9 Sep 2021
 13:43:34 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH v2] net/colo: check vnet_hdr_support flag when using
 virtio-net
Thread-Topic: [PATCH v2] net/colo: check vnet_hdr_support flag when using
 virtio-net
Thread-Index: AQHXlJlgS22HUioSM0+thc3FtmRHiKt+KRYAgAco30CAEBykAIAGZNfA
Date: Thu, 9 Sep 2021 13:43:34 +0000
Message-ID: <BN0PR11MB57573E140D5C6794F3559DD29BD59@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210819012717.318050-1-tao3.xu@intel.com>
 <20210821162524.3b112708@gecko.fritz.box>
 <BN0PR11MB575712EA5EBD922254BBB4819BC79@BN0PR11MB5757.namprd11.prod.outlook.com>
 <20210905114810.0cbb688e@gecko.fritz.box>
In-Reply-To: <20210905114810.0cbb688e@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44fd5d93-4c2b-4b79-ecb6-08d97397d1d0
x-ms-traffictypediagnostic: BN9PR11MB5500:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB55003886816038501BAB016F9BD59@BN9PR11MB5500.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bM/5hXY/d91xoVccv6VvnFQH5gPwNE5A797SewKzVSSLTaKgoWR5rL4BumT/GGIyonmYvrfcILaP/JmdiqWhV/Eu8V7Y14R109tOyXd6O6KREoH111KNHbqHZndKDwY0V7YNEuxrJlwflfysJVQWyPKlk+K9RT63n9nxmb6insF+StZ33om6dV9PkxCs0LZXB8YY0igqIBLhoGssSXwTy6S9rHfKPUUqpW15k6ABviPaxrKbR4grI8BH09SJB57fqEIdjG5DvE/SPhKIB2wkbL/fNDNsiTR92neQ6oBUrZpLZisUzpQtN2jar7iC+qeiCJofP/3kR6CnCED/x7OtImIFjTiiFt2xG65mFmqFTNhDe3nuaGHyCN71/TMW+f5nAkvCC0dSN+ParWnHawW9t+yM/jkoq8J5Qkp/zJL4SVF9XnAU2TKcnWGBQmbUvHANLgxlQIeg8l/QDVojuR0r5atoHSR7KQ/UoGNW8JNkyvkiIPHvb+8eKLNwn6uALTKSfzeGzU+Ul2ZOrQnuIqqyA3OtRz3F+M0fPVGKDiIvSGJlOfRpeSueZYZBIXzDYWOpAnDRPknTNzH5/N8KWSCZKPkA9oeD3WcHx9ZQ32otAk8oNSKJEa55KaDm72/WXnT0JDauuRcO8UPPhs6vYVLnoysnDor6+ZMRnRbC0w9DOa5wIWKxM4d6ieJdsx8ueaE1MybO4yyDQCCu98y+UHVV3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(4326008)(8936002)(38100700002)(26005)(122000001)(6916009)(508600001)(66476007)(30864003)(66556008)(64756008)(66446008)(86362001)(55016002)(6506007)(38070700005)(66946007)(7696005)(83380400001)(76116006)(52536014)(53546011)(5660300002)(71200400001)(186003)(9686003)(316002)(33656002)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RcfncE+TkkVVro3/VQ+F0/qTeG3+jKpSAT07gVd08tgq3nCF3SL3HbgfSP/X?=
 =?us-ascii?Q?aXAqYWwSZ9gx5Db65wUHA92OoYMcS+hRpRC3qtSWGATSZQWXS8RWPGW5im+v?=
 =?us-ascii?Q?0QTF/dHMAmOES+cSW1JgR7HNlxeTLf37sfU/e9KGxf9F03DYwTdfhSdghA3N?=
 =?us-ascii?Q?uFXWUvib76Z2n5HyoWRMzsTFlcE52Gwer+CS8khvZFql0dzT2B2Dv7iKg2a1?=
 =?us-ascii?Q?8LnRNxfHoDXnwNQvqgsURZDnKmc2n2VuFqznegqI3n77AS5ggx1+VBL0ZlNZ?=
 =?us-ascii?Q?hhg/6dlToXqcSbICaygt5CeiKwLnnfCOLePV9SF9KtFAy2RZ7P1rSsMZx+Jr?=
 =?us-ascii?Q?fPePCbxvR1r6neW42Jrp3L7Rl0scBUpOrTTe0fnP+HsN51sVmp19SIt44tJv?=
 =?us-ascii?Q?yMiZejtzEgPJosV0Df4F7f663Ji39YU/yOxEBKW+ZJ3bRmL+hN92otVHxFvK?=
 =?us-ascii?Q?t3gitRmJQLM1N25BoK/bXMpM6xdazAX+G3b6U42p5HbhA1Qm4o9+DPS9JaJR?=
 =?us-ascii?Q?AEJlgTPU5iK82XjOoH3taqBwliODZ/U5MX91lGHvCDr8Fw1wM8Gaa85ZMqm+?=
 =?us-ascii?Q?WvXkQh8c6rIBQO6+aZd1Xi9Gz9Ak9DreMg9FDb3UOulp3eolDrgASgjVUr9g?=
 =?us-ascii?Q?5zqkuruzqWm2aftFMIzwE0vhWR6JocBjS0QxYxaNLoV/DFrM+GZfvhVRFQNw?=
 =?us-ascii?Q?b5AZ7h2cYdEujr7f9oyK30EP70gVZfqm1kqMXs3t6YTxrJgVg9RZDevJMm5h?=
 =?us-ascii?Q?W3/t/2cO5b8gOXAn7nmM1GFMsJ9K1kZZDe+GgKZSBOdmRl3k60d5vtVJQNJx?=
 =?us-ascii?Q?tfpVPyfRn51Pg/IcfV3idwop730ZyDZHreqQZkpsMZJuxP8oJ1y5SJanKDcT?=
 =?us-ascii?Q?LIQX+1wKN5ZfTd86LUOu5DDLl9aZWueQfZ+gtHIwAA5R5eze9kav4GRIDNjE?=
 =?us-ascii?Q?SXSavyvBE9U2S63rlXD1Wry0hNTPvavesUhK3Kx37Yp0pYudrwN4I3pztdzD?=
 =?us-ascii?Q?4gEq7RfDMAKcSVlHiIhCS5mVXag43oHhu3JeeZ23zcjTNfKVNvV49+07xrZH?=
 =?us-ascii?Q?7PUltze1x/me29QzzaCHgmL1CV+kuE/5TJlfkr4K9sQrQbYYlpzycmKyrKWz?=
 =?us-ascii?Q?VbK+PeA2AajVgRm6eH59GZgb/2AOjII+RGXP32Xk6e//7tcektC5Kh7lsHj0?=
 =?us-ascii?Q?mfPNwrM+V6LlcOJwYwLRgROOTmuA/6JocdlTH2+E9+/qmYU+1mBDWue3JV6j?=
 =?us-ascii?Q?WT0UpZtXcH+vUJmGP+mt0kwx+ev4WXuDzZ7Q74CpJQKxe/g3+NXvAVylyfNu?=
 =?us-ascii?Q?sHJm/RzpRu59AltN8NRIuMhP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fd5d93-4c2b-4b79-ecb6-08d97397d1d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 13:43:34.5797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y4tV50YjFyW6brxEYtCyf3lumURNBDpArpmysUB7aVPYDPcMtiz/Wd1n3kbI0deZCGiLuXH3h6aPZ0dYlU0m1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5500
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: "Xu, Tao3" <tao3.xu@intel.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Sunday, September 5, 2021 7:48 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Xu, Tao3 <tao3.xu@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com; qemu-devel@nongnu.org
> Subject: Re: [PATCH v2] net/colo: check vnet_hdr_support flag when using
> virtio-net
>=20
> On Thu, 26 Aug 2021 05:49:23 +0000
> "Zhang, Chen" <chen.zhang@intel.com> wrote:
>=20
> > > -----Original Message-----
> > > From: Lukas Straub <lukasstraub2@web.de>
> > > Sent: Sunday, August 22, 2021 12:25 AM
> > > To: Xu, Tao3 <tao3.xu@intel.com>
> > > Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> > > jasowang@redhat.com; qemu-devel@nongnu.org
> > > Subject: Re: [PATCH v2] net/colo: check vnet_hdr_support flag when
> > > using virtio-net
> > >
> > > On Thu, 19 Aug 2021 09:27:17 +0800
> > > Tao Xu <tao3.xu@intel.com> wrote:
> > >
> > > > When COLO use only one vnet_hdr_support parameter between COLO
> > > network
> > > > filter(filter-mirror, filter-redirector or filter-rewriter and
> > > > colo-compare, packet will not be parsed correctly. Acquire network
> > > > driver related to COLO, if it is nirtio-net, check
> > > > vnet_hdr_support flag of COLO network filter and colo-compare.
> > > >
> > > > Signed-off-by: Tao Xu <tao3.xu@intel.com>
> > > > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > > > ---
> > > >
> > > > Changelog:
> > > > v2:
> > > >      Detect virtio-net driver and apply vnet_hdr_support
> > > >      automatically. (Jason)
> > > > ---
> > > >  net/colo-compare.c    | 57
> > > +++++++++++++++++++++++++++++++++++++++++++
> > > >  net/colo.c            | 20 +++++++++++++++
> > > >  net/colo.h            |  4 +++
> > > >  net/filter-mirror.c   | 21 ++++++++++++++++
> > > >  net/filter-rewriter.c | 10 ++++++++
> > > >  qapi/qom.json         |  6 +++++
> > > >  qemu-options.hx       |  6 +++--
> > > >  7 files changed, 122 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > > > b100e7b51f..870bd05a41 100644
> > > > --- a/net/colo-compare.c
> > > > +++ b/net/colo-compare.c
> > > > @@ -110,6 +110,7 @@ struct CompareState {
> > > >      char *sec_indev;
> > > >      char *outdev;
> > > >      char *notify_dev;
> > > > +    char *netdev;
> > > >      CharBackend chr_pri_in;
> > > >      CharBackend chr_sec_in;
> > > >      CharBackend chr_out;
> > > > @@ -838,6 +839,28 @@ static int compare_chr_can_read(void *opaque)
> > > >      return COMPARE_READ_LEN_MAX;
> > > >  }
> > > >
> > > > +static int colo_set_default_netdev(void *opaque, QemuOpts *opts,
> > > > +Error **errp) {
> > > > +    const char *colo_obj_type, *netdev_from_filter;
> > > > +    char **netdev =3D (char **)opaque;
> > > > +
> > > > +    colo_obj_type =3D qemu_opt_get(opts, "qom-type");
> > > > +
> > > > +    if (colo_obj_type &&
> > > > +        (strcmp(colo_obj_type, "filter-mirror") =3D=3D 0 ||
> > > > +         strcmp(colo_obj_type, "filter-redirector") =3D=3D 0 ||
> > > > +         strcmp(colo_obj_type, "filter-rewriter") =3D=3D 0)) {
> > > > +        netdev_from_filter =3D qemu_opt_get(opts, "netdev");
> > > > +        if (*netdev =3D=3D NULL) {
> > > > +            *netdev =3D g_strdup(netdev_from_filter);
> > > > +        } else if (strcmp(*netdev, netdev_from_filter) !=3D 0) {
> > > > +            warn_report("%s is using a different netdev from other=
 COLO "
> > > > +                        "component", colo_obj_type);
> > > > +        }
> > > > +    }
> > > > +    return 0;
> > > > +}
> > > > +
> > >
> > > Hi,
> > > This doesn't properly handle the case where there are multiple
> > > network devices and one is virtio-net and the other isn't. This
> > > would be a regression as this worked fine before.
> >
> > No, If have multiple network device this patch just report a warning fo=
r it.
> > You can still use virtio-net and others at the same time.
>=20
> As you see it sets netdev to the first filter's netdev. So if the first n=
etdev is
> virtio-net and the 2nd is e1000 (for example) it'll see virtio-net first =
and set
> *netdev to it for _both_ devices. Then it sees the e1000 and prints the
> warning, but *netdev is still set to virtio-net. So it'll enable vnet_hdr=
 for
> e1000 too and segfault when processing a packet because e1000 doesn't
> support vnet_hdr.

Hi Lukas,
    Thanks your review~ This patch just focus on colo-compare and net-filte=
r's vnet_hdr flag, not related to real netdev's flag (like e1000 vnet_hdr).
So, we can't setup the vnet_hdr to e1000 at any time.
    Back to this question, If the first filter's netdev is virtio-net, we w=
ill set the "*netdev" in colo-compare module,
As we know, The colo-compare module won't really attach to any netdev, the =
"*netdev" just a flag to show we have a related filter used virtio-net.
We'd better to enable other filter's flag to make all colo-proxy works. And=
 the filter module with e1000, we haven't enough information to repair.

Thanks
Chen

>=20
> > >
> > > >  /*
> > > >   * Called from the main thread on the primary for packets
> > > >   * arriving over the socket from the primary.
> > > > @@ -1050,6 +1073,21 @@ static void compare_set_vnet_hdr(Object
> *obj,
> > > >      s->vnet_hdr =3D value;
> > > >  }
> > > >
> > > > +static char *compare_get_netdev(Object *obj, Error **errp) {
> > > > +    CompareState *s =3D COLO_COMPARE(obj);
> > > > +
> > > > +    return g_strdup(s->netdev);
> > > > +}
> > > > +
> > > > +static void compare_set_netdev(Object *obj, const char *value,
> > > > +Error
> > > > +**errp) {
> > > > +    CompareState *s =3D COLO_COMPARE(obj);
> > > > +
> > > > +    g_free(s->netdev);
> > > > +    s->netdev =3D g_strdup(value);
> > > > +}
> > > > +
> > > >  static char *compare_get_notify_dev(Object *obj, Error **errp)  {
> > > >      CompareState *s =3D COLO_COMPARE(obj); @@ -1274,6 +1312,12 @@
> > > > static void colo_compare_complete(UserCreatable *uc, Error **errp)
> > > >          max_queue_size =3D MAX_QUEUE_SIZE;
> > > >      }
> > > >
> > > > +    if (!s->netdev) {
> > > > +        /* Set default netdev as the first colo netfilter found */
> > > > +        qemu_opts_foreach(qemu_find_opts("object"),
> > > > +                          colo_set_default_netdev, &s->netdev, NUL=
L);
> > > > +    }
> > > > +
> > > >      if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
> > > >          !qemu_chr_fe_init(&s->chr_pri_in, chr, errp)) {
> > > >          return;
> > > > @@ -1289,6 +1333,16 @@ static void
> > > colo_compare_complete(UserCreatable *uc, Error **errp)
> > > >          return;
> > > >      }
> > > >
> > > > +    if (!s->vnet_hdr &&
> > > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > > +                          vnet_driver_check, s->netdev, NULL)) {
> > > > +        /*
> > > > +         * colo compare needs 'vnet_hdr_support' when it works on
> virtio-net,
> > > > +         * add 'vnet_hdr_support' automatically
> > > > +         */
> > > > +        s->vnet_hdr =3D true;
> > > > +    }
> > > > +
> > >
> > > There is no way to disable vnet_hdr_support with virtio-net now.
> >
> > Yes, It looks no reason to do this.
> > Please show me some details?
> >
> > Thanks
> > Chen
> >
> > >
> > > >      net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s-
> >vnet_hdr);
> > > >      net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize,
> > > > s->vnet_hdr);
> > > >
> > > > @@ -1400,6 +1454,9 @@ static void colo_compare_init(Object *obj)
> > > >      s->vnet_hdr =3D false;
> > > >      object_property_add_bool(obj, "vnet_hdr_support",
> > > compare_get_vnet_hdr,
> > > >                               compare_set_vnet_hdr);
> > > > +    /* colo compare can't varify that netdev is correct */
> > > > +    object_property_add_str(obj, "netdev", compare_get_netdev,
> > > > +                            compare_set_netdev);
> > > >  }
> > > >
> > > >  void colo_compare_cleanup(void)
> > > > diff --git a/net/colo.c b/net/colo.c index 3a3e6e89a0..4a03780f45
> > > > 100644
> > > > --- a/net/colo.c
> > > > +++ b/net/colo.c
> > > > @@ -243,3 +243,23 @@ bool connection_has_tracked(GHashTable
> > > > *connection_track_table,
> > > >
> > > >      return conn ? true : false;
> > > >  }
> > > > +
> > > > +/* check the network driver related to COLO, return 1 if it is
> > > > +virtio-net */ int vnet_driver_check(void *opaque, QemuOpts *opts,
> > > > +Error **errp) {
> > > > +    const char *driver_type, *netdev_from_driver;
> > > > +    char *netdev_from_filter =3D (char *)opaque;
> > > > +
> > > > +    driver_type =3D qemu_opt_get(opts, "driver");
> > > > +    netdev_from_driver =3D qemu_opt_get(opts, "netdev");
> > > > +
> > > > +    if (!driver_type || !netdev_from_driver || !netdev_from_filter=
) {
> > > > +        return 0;
> > > > +    }
> > > > +
> > > > +    if (g_str_has_prefix(driver_type, "virtio-net") &&
> > > > +        strcmp(netdev_from_driver, netdev_from_filter) =3D=3D 0) {
> > > > +        return 1;
> > > > +    }
> > > > +    return 0;
> > > > +}
> > > > diff --git a/net/colo.h b/net/colo.h index d91cd245c4..d401fc76b6
> > > > 100644
> > > > --- a/net/colo.h
> > > > +++ b/net/colo.h
> > > > @@ -18,6 +18,9 @@
> > > >  #include "qemu/jhash.h"
> > > >  #include "qemu/timer.h"
> > > >  #include "net/eth.h"
> > > > +#include "qemu/option.h"
> > > > +#include "qemu/option_int.h"
> > > > +#include "qemu/config-file.h"
> > > >
> > > >  #define HASHTABLE_MAX_SIZE 16384
> > > >
> > > > @@ -104,5 +107,6 @@ Packet *packet_new(const void *data, int size,
> > > > int vnet_hdr_len);  Packet *packet_new_nocopy(void *data, int
> > > > size, int vnet_hdr_len);  void packet_destroy(void *opaque, void
> > > > *user_data); void packet_destroy_partial(void *opaque, void
> > > > *user_data);
> > > > +int vnet_driver_check(void *opaque, QemuOpts *opts, Error
> > > > +**errp);
> > > >
> > > >  #endif /* NET_COLO_H */
> > > > diff --git a/net/filter-mirror.c b/net/filter-mirror.c index
> > > > f20240cc9f..69ca9c9839 100644
> > > > --- a/net/filter-mirror.c
> > > > +++ b/net/filter-mirror.c
> > > > @@ -12,6 +12,7 @@
> > > >  #include "qemu/osdep.h"
> > > >  #include "net/filter.h"
> > > >  #include "net/net.h"
> > > > +#include "net/colo.h"
> > > >  #include "qapi/error.h"
> > > >  #include "qom/object.h"
> > > >  #include "qemu/main-loop.h"
> > > > @@ -224,6 +225,16 @@ static void
> > > > filter_mirror_setup(NetFilterState *nf,
> > > Error **errp)
> > > >          return;
> > > >      }
> > > >
> > > > +    if (!s->vnet_hdr &&
> > > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > > +                          vnet_driver_check, nf->netdev_id, NULL))=
 {
> > > > +        /*
> > > > +         * filter mirror needs 'vnet_hdr_support' when colo filter=
 modules
> > > > +         * work on virtio-net, add 'vnet_hdr_support' automaticall=
y
> > > > +         */
> > > > +        s->vnet_hdr =3D true;
> > > > +    }
> > > > +
> > > >      qemu_chr_fe_init(&s->chr_out, chr, errp);  }
> > > >
> > > > @@ -252,6 +263,16 @@ static void
> > > > filter_redirector_setup(NetFilterState
> > > *nf, Error **errp)
> > > >          }
> > > >      }
> > > >
> > > > +    if (!s->vnet_hdr &&
> > > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > > +                          vnet_driver_check, nf->netdev_id, NULL))=
 {
> > > > +        /*
> > > > +         * filter redirector needs 'vnet_hdr_support' when colo fi=
lter
> modules
> > > > +         * work on virtio-net, add 'vnet_hdr_support' automaticall=
y
> > > > +         */
> > > > +        s->vnet_hdr =3D true;
> > > > +    }
> > > > +
> > > >      net_socket_rs_init(&s->rs, redirector_rs_finalize,
> > > > s->vnet_hdr);
> > > >
> > > >      if (s->indev) {
> > > > diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c index
> > > > cb3a96cde1..637ef4ce71 100644
> > > > --- a/net/filter-rewriter.c
> > > > +++ b/net/filter-rewriter.c
> > > > @@ -388,6 +388,16 @@ static void
> > > > colo_rewriter_setup(NetFilterState
> > > > *nf, Error **errp)  {
> > > >      RewriterState *s =3D FILTER_REWRITER(nf);
> > > >
> > > > +    if (!s->vnet_hdr &&
> > > > +        qemu_opts_foreach(qemu_find_opts("device"),
> > > > +                          vnet_driver_check, nf->netdev_id, NULL))=
 {
> > > > +        /*
> > > > +         * filter rewriter needs 'vnet_hdr_support' when colo filt=
er
> modules
> > > > +         * work on virtio-net, add 'vnet_hdr_support' automaticall=
y
> > > > +         */
> > > > +        s->vnet_hdr =3D true;
> > > > +    }
> > > > +
> > > >      s->connection_track_table =3D
> > > g_hash_table_new_full(connection_key_hash,
> > > >                                                        connection_k=
ey_equal,
> > > >                                                        g_free,
> > > > diff --git a/qapi/qom.json b/qapi/qom.json index
> > > > 6d5f4a88e6..442a963ba4
> > > > 100644
> > > > --- a/qapi/qom.json
> > > > +++ b/qapi/qom.json
> > > > @@ -241,6 +241,11 @@
> > > >  # @notify_dev: name of the character device backend to be used to
> > > communicate
> > > >  #              with the remote colo-frame (only for Xen COLO)
> > > >  #
> > > > +# @netdev: id of the network device backend to colo-compare,
> although
> > > > +#          colo-compare doesn't depend on network device directly,=
 this
> > > > +#          parameter help colo-compare know what network driver it=
 is
> > > > +#          working on
> > > > +#
> > > >  # @compare_timeout: the maximum time to hold a packet from
> > > @primary_in for
> > > >  #                   comparison with an incoming packet on @seconda=
ry_in in
> > > >  #                   milliseconds (default: 3000)
> > > > @@ -264,6 +269,7 @@
> > > >              'outdev': 'str',
> > > >              'iothread': 'str',
> > > >              '*notify_dev': 'str',
> > > > +            '*netdev': 'str',
> > > >              '*compare_timeout': 'uint64',
> > > >              '*expired_scan_cycle': 'uint32',
> > > >              '*max_queue_size': 'uint32', diff --git
> > > > a/qemu-options.hx b/qemu-options.hx index 83aa59a920..b31ce3c87d
> > > > 100644
> > > > --- a/qemu-options.hx
> > > > +++ b/qemu-options.hx
> > > > @@ -4957,12 +4957,14 @@ SRST
> > > >          stored. The file format is libpcap, so it can be analyzed =
with
> > > >          tools such as tcpdump or Wireshark.
> > > >
> > > > -    ``-object colo-
> > >
> compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outdev=3D=
cha
> > > rd
> > > evid,iothread=3Did[,vnet_hdr_support][,notify_dev=3Did][,compare_time=
out
> > > =3D@
> > >
> var{ms}][,expired_scan_cycle=3D@var{ms}][,max_queue_size=3D@var{size}]``
> > > > +    ``-object
> > > > + colo-
> > > compare,id=3Did,primary_in=3Dchardevid,secondary_in=3Dchardevid,outde
> > > > + v=3Dchardevid,iothread=3Did[,netdev=3Dnetdevid][,vnet_hdr_support=
][,no
> > > > + tify
> > > > +
> > >
> _dev=3Did][,compare_timeout=3D@var{ms}][,expired_scan_cycle=3D@var{ms}][,
> > > m
> > > > + ax_queue_size=3D@var{size}]``
> > > >          Colo-compare gets packet from primary\_in chardevid and
> > > >          secondary\_in, then compare whether the payload of primary
> packet
> > > >          and secondary packet are the same. If same, it will output
> > > >          primary packet to out\_dev, else it will notify COLO-frame=
work to
> do
> > > > -        checkpoint and send primary packet to out\_dev. In order t=
o
> > > > +        checkpoint and send primary packet to out\_dev. Although
> > > > + colo-
> > > compare
> > > > +        does not depend on network device directly, netdevid help
> > > > +        colo-compare know what network driver it is working on.
> > > > + In order to
> > > >          improve efficiency, we need to put the task of comparison =
in
> > > >          another iothread. If it has the vnet\_hdr\_support flag,
> > > >          colo compare will send/recv packet with vnet\_hdr\_len.
> > >
> > >
> > >
> > > --
> >
>=20
>=20
>=20
> --


