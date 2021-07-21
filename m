Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B313D0691
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 03:57:20 +0200 (CEST)
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m61U7-0003T7-3L
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 21:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khairul.anuar.romli@intel.com>)
 id 1m61Rn-000207-Px
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:54:55 -0400
Received: from mga01.intel.com ([192.55.52.88]:56480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khairul.anuar.romli@intel.com>)
 id 1m61Rl-0008Td-6X
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:54:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="233149053"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="233149053"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 18:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="576199052"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2021 18:54:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 20 Jul 2021 18:54:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 20 Jul 2021 18:54:48 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 18:54:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ud2fVYrzXNDuETexzyA/3tHr3IuKCalfpqS5uoQQLXdbmmeCe0p3uu2c2BIyswdVF9LidjepjxU2w3ml4Joaq+xaBC5qrn6zBZmmpIDGsJco9jKWwQrmYFKbt2m8vhZpFzmluJB3aBAxQLFN/AXuPyD7ddLh8my5CkefhhyhDlPcKseWQjrrXaCwpCupNu1q8pPkQlJO4UOJ9e8pgFHEqE/pJAZsuJ0tqXfsktghOnUC0v92EnSe0MpTWAiGdkdbnsnXSo9HRhjzEvCQVZS4r4aU/M5UTTzJ6TyzZFSUd5A6S+mGNYT5CUXnLzPx/38NW8oxW1qC8Ho4/4XfR/lLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNgim6LBs/EuKEEZmcRxjd5NOUMy9wQOgbMeYhA0AM4=;
 b=bOSx8je7nxJ++idxmLTg0vkIUWuv3W9Vhfsyi5teZzAr/A9tScBmUsSoRKjBOymc4EGRtj02pBbUfEF2myO8hCl1hpHrcBRvOYjXnQFCcc/znUsNxoLFDsO/p90VwJfrFEViTZw7JZhn5jmgKE9tWazUTKsOkE/m9MAE2Rzq7fTWP6ROtPVINt0v/Dwwo6dTiyLdl7VzFSuD533bRzZ79f1wntYi0u/Z7dSsLWZsR1fN/HXyNGoMtdc5S0wGeTp+YGYCvfyYFPGq1G6tTcZDyDmTkPzySVnPw81uVcLByoVfCF8ZHWLyWCOUpWnutOKbMJ5bAGnVNfnWVqbRWb0f/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNgim6LBs/EuKEEZmcRxjd5NOUMy9wQOgbMeYhA0AM4=;
 b=HzziyRm1b2BqGkZGjMPB1Q8v3vWROpTfCNSii8Vy20ZpbaN5t05ociG9T6oSVsoz1XmmhhYMzE6bbXfDENIwhZKGI8HtRugVcDrWZWdbc4v76dQ49reilO70lwb6A1iML7jNlr8pcvqEEKXFTdaHollfI1bknOgB9brRon3itTQ=
Received: from BYAPR11MB3637.namprd11.prod.outlook.com (2603:10b6:a03:f9::16)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 01:54:46 +0000
Received: from BYAPR11MB3637.namprd11.prod.outlook.com
 ([fe80::58ab:34ee:37bd:815c]) by BYAPR11MB3637.namprd11.prod.outlook.com
 ([fe80::58ab:34ee:37bd:815c%4]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 01:54:45 +0000
From: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
To: "Kim, Dongwon" <dongwon.kim@intel.com>, Thomas Huth <thuth@redhat.com>
Subject: RE: [PATCH 1/2] ui/gtk: detach_all option for making all VCs detached
 upon starting
Thread-Topic: [PATCH 1/2] ui/gtk: detach_all option for making all VCs
 detached upon starting
Thread-Index: AQHXfOcoJ10AcuS1IUm/PxN0B5lDaatL4EwAgACPs4CAADrSwA==
Date: Wed, 21 Jul 2021 01:54:45 +0000
Message-ID: <BYAPR11MB363739049D30EA5C030D136FB3E39@BYAPR11MB3637.namprd11.prod.outlook.com>
References: <20210719214157.5863-1-dongwon.kim@intel.com>
 <885e977c-f697-dd02-4be1-b5283fdf343d@redhat.com>
 <20210720221635.GA4519@dongwonk-MOBL.amr.corp.intel.com>
In-Reply-To: <20210720221635.GA4519@dongwonk-MOBL.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eab9d119-4e51-4d60-b0ad-08d94bea8412
x-ms-traffictypediagnostic: SJ0PR11MB5150:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB5150C5724CB70C11ACC94089B3E39@SJ0PR11MB5150.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1+HZFuVMatb6wrfhHjQHjtcXvQXXGKMGLiyQXnAfqsEiC3NXjTxwxcwx7Vj2i45nOhlIm6FxNGu8G4SwhR+m5g1KHZo9UgigeKQscOE0mnkdwyuo25R0j+NjBZtm06O80iY2TDLwgdbIiOyDAEVZhld2IBo5Aa0EjmJqF+VhgP4Ee2fDUTXVJoDiq/r4GODOgEBQUJQa/+Y7r8BlEvryUrfTZXyOuTPimz3X4EkN+Uw3lb/G2XdUnjRoRgptOieq49lpF5YPlhdCS5O4pj5LPmqvQ6hJbHxHEsnIhHuKKepkmeXlQ0jPKHwMDLwLrb3oHj3MHOdEMAMg3WeLr3I+6YoQ8JU9AmPSoz/pKqq8XJSHwJP1s/Y0TtO7tEp/CqOy/PEwQJg4JiPohmmS2lKlEaRxLb4riojA9uT9FdaKQ4oaEht+lbNoB3uIXpsTon+0lX0jmCVBinp43uCHPQMLVVfdmgA9LPDpziTjTN8TpB9jAs8Qnwme7ijLrEv1RFo24eejxEodf/4r+l/Gi6sESyE8zNVA7XjKlZMFQT113pv+++YnuNWMkz3ZGPuZeLF/zIZo1F/LPDFFm3G9p+MTIldS0wJEUSe9zqXo4PhKm698gxuZFWrSUD6/MAPsG01K1/VA0xdY4t32JorVmDT4fbFqoQFHeOax7AbokpuFP56SNEfZa7GAcc5B31bfk8uHgrhdVlfITv89QIhGYJ+tnw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3637.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(71200400001)(52536014)(83380400001)(6506007)(66476007)(8936002)(64756008)(110136005)(9686003)(76116006)(66556008)(53546011)(316002)(86362001)(38100700002)(66946007)(66446008)(2906002)(8676002)(186003)(26005)(122000001)(4326008)(33656002)(7696005)(55016002)(5660300002)(478600001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bX4ff1sL89Rb3VWYRg5UwL+p7FvWmnxGF3jTjvHt383CBV9/cToHr6znEQ?=
 =?iso-8859-1?Q?yamzrgsJSAT3Mdptt/krte6rfbGj75zH9KODf95l11lSaZJejjdc1e/KLx?=
 =?iso-8859-1?Q?gc7ANVYmlqdRAEa8jU+8Mr25302kktpzu2Cec9QDxTZUcet7jyPuCOJPy7?=
 =?iso-8859-1?Q?GVgXSXSjPsrIUgK2YoDVqfeGcxHjyCFrW0qjLnU7IBXe6dUXHZuP6HGJYQ?=
 =?iso-8859-1?Q?sIoRpxCs3FEi0adZ0C4tbng2zkg+vI6zLHwx5GRun3Dxj9XsArbgvzfDH3?=
 =?iso-8859-1?Q?Fbxhvd1S0yUxfvH+pX/Q8fH7zgnHgrLr1VlrxhB9oQy4S4Z9mYmg0f6beW?=
 =?iso-8859-1?Q?duqzRP+29mU4wJfO+gPqAHuA1RL/7Ms3ldcy6qLtyGDsYyrRjSpsaL/Wcf?=
 =?iso-8859-1?Q?SS7AqWIOAlXTwNWf9GjhMzoo2vttA5oSd3eF7y24jr0m0iaLPq1ZZtKv/W?=
 =?iso-8859-1?Q?AEqDWDRKJdiFQzMKflwFGEepWdkIYXCH+JWuUf54NxxYV6aaOGw+RHJJ+7?=
 =?iso-8859-1?Q?NoEmUFARPTiw98ndqrGjLGencEJrHktxOOXGegd0hac5vedXFaf+MOp5io?=
 =?iso-8859-1?Q?MHpXDGyXB6tj/CaMwFf3LGOdyzdQORExm70cgBHUwWoSkbYyQ53FCNWrWH?=
 =?iso-8859-1?Q?kTnLTyVL8Yjmi1hihVzt6S7bwGSWsYN9PVx9sWNNEACKFCY8ov70Czi4VE?=
 =?iso-8859-1?Q?vvb9+p4jdgbKx6L+XGgqTd7Gi1TrinzSWURPy+Pu0XssNtcjamKC7dhuKY?=
 =?iso-8859-1?Q?JLVLNQ3i2UnWtIs6wnmSs8BB67UeRw+UVxF2SBx2FkD0iYaT0Hgp87cjva?=
 =?iso-8859-1?Q?FtXsOAIgECRYIWMr1fpofF2c0/lV+7V3BfUpaB57pWOyyPAPolJ9b+jyFd?=
 =?iso-8859-1?Q?Lv5EE8fL78DcFY+AmEdFxORGtXU/w5fVJdIY/OaenuTuH6JqdSBj0WOHQe?=
 =?iso-8859-1?Q?jmnOI1T7fz5arPqFw1IW88WoruaKDJgwhs7yL9mLvNj9e0lYbsgY75kVzc?=
 =?iso-8859-1?Q?T2kHaJZtClJbQWmBew6WlR2GsPub28MNu0GedU/yg2/kolx12ls43VeiRb?=
 =?iso-8859-1?Q?3qGigql9GqGMsckh7o2OaDnPtZCGevUynyATkVTImv6+GI1pMrgJYcNy4M?=
 =?iso-8859-1?Q?o7/QFP+X+5m+RRU4DjP8TpvaZ2HdSuQztzX+WJaIYMEamYNMlScTiDXuTV?=
 =?iso-8859-1?Q?3B0I4th07E/X+sfGQkj2DvufGXUdqRXazfSQkMTDnjyqJBcsrbvFgkq8mT?=
 =?iso-8859-1?Q?dp6CkBKJTPT1Uj9e9DXy/EPbQnIyQuV6zPkzQokkFmCWUpHQSM014T649D?=
 =?iso-8859-1?Q?i2udGsT69yjZHnlc0Ix0KM/Au/Rl39kiu++lAYQf/3C8xUjl1tG5qND6g7?=
 =?iso-8859-1?Q?onUK44CtoQ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab9d119-4e51-4d60-b0ad-08d94bea8412
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 01:54:45.9054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIpBe2hciNh6AXfFFqlNVUKv0c0Yoa0pi0ToV4A8/wEAIvPJrgX+w+TfpGYWckR+hw/YG369r6I+0agFuZlXIudl7nChO0JRDt9upZOcfCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=khairul.anuar.romli@intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've tried and this patch is able to detach all the virtual console after w=
e launch the qemu. However, I think we need to filter out other terminal th=
at are not related to view such as compatmonitor(), serial and parallel.=20

Also, I think we can have the detach specific to virtio-pci view without th=
e need to have new parameters.

> -----Original Message-----
> From: Kim, Dongwon <dongwon.kim@intel.com>
> Sent: Wednesday, July 21, 2021 6:17 AM
> To: Thomas Huth <thuth@redhat.com>
> Cc: qemu-devel@nongnu.org; Romli, Khairul Anuar
> <khairul.anuar.romli@intel.com>
> Subject: Re: [PATCH 1/2] ui/gtk: detach_all option for making all VCs
> detached upon starting
>=20
> On Tue, Jul 20, 2021 at 03:42:16PM +0200, Thomas Huth wrote:
> > On 19/07/2021 23.41, Dongwon Kim wrote:
> > > With "detach-all=3Don" for display, all VCs are detached from the
> beginning.
> > > This is useful when there are multiple displays assigned to a guest O=
S.
> >
> > Can you elaborate? (i.e. why is it useful? Do you just want to avoid
> > having multiple things opened at startup? Or is there a different
> > reason?)
> Hi,
>=20
> The original motivation is related to an use-case with a guest with multi=
-
> displays. In that use case, we wanted to have all guest displays placed s=
ide by
> side from beginning. Virtual consoles other than guest displays (e.g. vir=
tio-
> gpu-pci) are not actually needed but I found doing "detach-all" is the si=
mplest
> way.
>=20
> >
> > > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > > Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
> > > ---
> > >   qapi/ui.json | 4 +++-
> > >   ui/gtk.c     | 7 +++++++
> > >   2 files changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/qapi/ui.json b/qapi/ui.json index
> > > 1052ca9c38..ff14bb2f46 100644
> > > --- a/qapi/ui.json
> > > +++ b/qapi/ui.json
> > > @@ -1141,6 +1141,7 @@
> > >   # @show-cursor:   Force showing the mouse cursor (default: off).
> > >   #                 (since: 5.0)
> > >   # @gl:            Enable OpenGL support (default: off).
> > > +# @detach-all:    Detatch all VirtualConsoles from beginning (defaul=
t:
> off).
> >
> > Needs a comment =E0 la "(since: 6.2)" at the end (like the one after
> > "show-cursor" some lines earlier.
> >
> > >   #
> > >   # Since: 2.12
> > >   #
> > > @@ -1150,7 +1151,8 @@
> > >                   '*full-screen'   : 'bool',
> > >                   '*window-close'  : 'bool',
> > >                   '*show-cursor'   : 'bool',
> > > -                '*gl'            : 'DisplayGLMode' },
> > > +                '*gl'            : 'DisplayGLMode',
> > > +                '*detach-all'    : 'bool' },
> >
> > If this is for GTK only, shouldn't this rather go into DisplayGTK inste=
ad?
> > Or will this be also useful for other display types later?
>=20
> This option might not be that useful for other use cases.. but at the sam=
e
> time, I'm pretty sure this will work universally (won't break
> anything..) but for now, I think it's good idea to limit this to GTK.
>=20
> -DW
>=20
> >
> >  Thomas
> >
> >
> > >     'discriminator' : 'type',
> > >     'data'    : { 'gtk'            : 'DisplayGTK',
> > >                   'curses'         : 'DisplayCurses',
> > > diff --git a/ui/gtk.c b/ui/gtk.c
> > > index ce885d2ca3..a07e5a049e 100644
> > > --- a/ui/gtk.c
> > > +++ b/ui/gtk.c
> > > @@ -2211,6 +2211,7 @@ static void gtk_display_init(DisplayState *ds,
> DisplayOptions *opts)
> > >       GdkDisplay *window_display;
> > >       GtkIconTheme *theme;
> > >       char *dir;
> > > +    int i;
> > >       if (!gtkinit) {
> > >           fprintf(stderr, "gtk initialization failed\n"); @@ -2290,6
> > > +2291,12 @@ static void gtk_display_init(DisplayState *ds,
> DisplayOptions *opts)
> > >           gtk_menu_item_activate(GTK_MENU_ITEM(s-
> >grab_on_hover_item));
> > >       }
> > >       gd_clipboard_init(s);
> > > +
> > > +    if (opts->detach_all) {

> > > +        for (i =3D 0; i < s->nb_vcs - 1; i++) {

[Romli, Khairul Anuar]  We can a conditional check here to only detech virt=
io-pci view rather than "everything". Also, we may want to consider not to =
detach the primary view and keep it remain in qemu primary window.

> > > +            gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
> > > +        }
> > > +    }
> > >   }
> > >   static void early_gtk_display_init(DisplayOptions *opts)
> > >
> >

