Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83393B3BB1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 06:35:51 +0200 (CEST)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwdZG-0002DZ-7r
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 00:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lwdYK-0001IV-Ga
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:34:52 -0400
Received: from mga06.intel.com ([134.134.136.31]:40669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lwdYH-0000Sp-W9
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:34:52 -0400
IronPort-SDR: weONEhkXr4mT/zIxXlUNe3SNAll4xAimVwRMmPud2jxMyMCy2AnHm6Q4BKTA81MZzvY9b1AWMP
 o/I+KrRyrAlA==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="268738041"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="268738041"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 21:34:45 -0700
IronPort-SDR: lhJkQtCnhhZR5ZJW/AJVJYGoSCisgrCDhHLgg8YKfPf3UfuqeGm27nZIVy67euCRyH9xp+1ZKd
 D5ZLctTbdl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="556729683"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga004.jf.intel.com with ESMTP; 24 Jun 2021 21:34:45 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 21:34:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Thu, 24 Jun 2021 21:34:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Thu, 24 Jun 2021 21:34:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehjQhrGKL218ATFjgJ1urdiBLQlZ5oH5ec5E70P8e1MACMnz2LLEbRS/0LbLYTHb15iZ76GmTm5WRTeAKMJPhSV8GcqmN2T7cBrQWWJtmJWGTrsGiVSH/csvL7yUhdnzEMsVRu9dQ6ZRHv78Qdf8qYy4xDTkGaPhiCJj5gU3k0WzgsMksDoKdqt+WQX5ghU8SNahkWPXWmy3J/vlqj/Fju0A2h7TrITPRzGUPY297Q8gzb6/GQbKfmUhB9EtRNkiAXgbvWa2/aphkt6C7drmmW3HL67kdYQFdk+kLEIy41DkCNVX66N3ve9qrSH52I3lcS+i5n/5y9Tye59ogljIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj/i8gqTePXq7JnrO9t9wDNswFZT2mtW80p87LDilDA=;
 b=anwewNwrKiaI8JdoFRTxrHDkY6Tvh4WMMRnhI9xNr3H16HtKid/HZiAAdnV6nJ+TvaZtWl3tZBxog1l3mclTe3eAuYFKEj3x9eZOaLsyySpmtkJfNdIdbvClaCUuCn98rrRP+5t2yfofi3XevUz0Nny/yyeoL4wMXmvUtF1QcwjttWZ0RfgezBtM759oNrsxq1e+XzOe1ZhruZ1oHrMCmm50ghxaF/IT+8oqAfyPz3tQL3OULQWjkwDqS+wO6EEH+f84quS4xilmxezNsSwCcllk1ICs/b9jaPzLcneWSTWqKUQNvmF5W+opTdXWZN+iPOt53JkXmPmKzQgXMyQzOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj/i8gqTePXq7JnrO9t9wDNswFZT2mtW80p87LDilDA=;
 b=nAwRODVrgPeFT78Wb/rmTB9ruXoCbCp9+TezUXV9iICN+nmrR7XZvOMayyymHRrkwiJ9hc/dGjwGsbYWUNUhOq64UrM2dQ0XfvpmmlxestRffbrMRFtnXC0i1zM2UVfnTaBb0Q6xQLT8PiEqPjZauq0QsQ6UCmcUtq/4jj14Y10=
Received: from DM8PR11MB5717.namprd11.prod.outlook.com (2603:10b6:8:30::9) by
 DM6PR11MB2745.namprd11.prod.outlook.com (2603:10b6:5:c7::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19; Fri, 25 Jun 2021 04:34:42 +0000
Received: from DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1]) by DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1%8]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 04:34:42 +0000
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
Subject: RE: [PATCH v4] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Thread-Topic: [PATCH v4] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Thread-Index: AQHXaNhEBocbFJJIMEWCUOu0d8iR6KskI2QAgAAAZUA=
Date: Fri, 25 Jun 2021 04:34:42 +0000
Message-ID: <DM8PR11MB57178590E8554BFD1EF3212AAF069@DM8PR11MB5717.namprd11.prod.outlook.com>
References: <20210624084251.54213-1-swee.aun.khor@intel.com>
 <BYAPR11MB3637D892CF682A0A10F4EA3AB3069@BYAPR11MB3637.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3637D892CF682A0A10F4EA3AB3069@BYAPR11MB3637.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [14.192.215.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4aac18e7-6e42-4f0d-c997-08d937928d6e
x-ms-traffictypediagnostic: DM6PR11MB2745:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB274587FACE82E6DC61CDB94FAF069@DM6PR11MB2745.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3nAvoTvOx4oAL5QDnmQg9duH6HH/R56n4yIkQKgrhEwrR+zHbqJW4TH4qjIPJdeDzbEjyozudraobL3o34r0M1t/XR9HYekJLTi7Y+nlcoymqfaXCb439W3AuKtbR9lH12ysw/QnYqfgjUx9/dlMjUgSw9NH9GthD6G5WuBzeK0IFbrJhW0N/iBVQis+obBK1JEg/pB7juBK3aBHx7uji4eoZvW0Tv5HTVXVD9Foh9vyTrb0z03HEW6VYLwsOhbC/PtxlbydvLBPY4ZCPAl0v0NlgFd8ruxtdIrBBeMFrddpCMhFhkm1rLqlG5n1w/dIlH2sAsyT2tclJrzc3lcjH6U5z/hirSgupYY9W0NDzld0xqa93ckLjJAFohdaNWoOAPJd+9E6OeldgbfjMyaNfrR6d8kfY7x7IVVZgZOur6SxOcNlWTa4jGymx+Ar0k8sODelTrxO6i8r3vT7B9XQhwfeNu2/PRBoY5/DXgTFcOL5W4LSPY0ywTyjanm74M3+NIOnad3QPnqznyT9OAlkutDQ+ydo8CaoMCH9kzPg11EM+OQyME7FVz8rmuRdq6J+GSKo19dUT/oL/Sx+KvwFtvau5PJ5ejIjkyQV0zy9YPA7vwHvG0FL+/ofV/PwYOHirVBF3NExUqw3MF7vntz1Qw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(346002)(396003)(39860400002)(107886003)(6862004)(8936002)(6506007)(186003)(53546011)(26005)(7696005)(5660300002)(33656002)(4326008)(64756008)(76116006)(66946007)(66556008)(8676002)(66446008)(66476007)(6636002)(52536014)(38100700002)(55016002)(122000001)(83380400001)(478600001)(9686003)(54906003)(71200400001)(316002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?npQBjYbZh2PM6pehZ0Qp5GCTYgSA2Rzb53ZyVj4hMAgK4HdOLAIN16E2uRlK?=
 =?us-ascii?Q?AKivt2x2A6aiLhBOBiu64xBfquMyc96X+EdCjhxyVeIMTKdyGoDgz5+lPf33?=
 =?us-ascii?Q?amgRpk6dD0f4SORGr/V4R8PGgx/v9zW9dx5Yb5tsVz4Ptbn3hDtgBWsfESZb?=
 =?us-ascii?Q?7i4xrrRJzUngQ2I3lgCyCze0sYvv6JH+DLQdKRaKJaIh/l+7Pj655d+HO9KK?=
 =?us-ascii?Q?8Y9pDxTsoN0oSP3ajeHD6QxCXEtiLXppWEhfu1KGkss66aJM/nhM/D8CZEVZ?=
 =?us-ascii?Q?FOVLAOPY7cg7uJdTuOiGi3I1YZbwqYWr4tG83KwirPUhEfrb8ghqrtp7V8lA?=
 =?us-ascii?Q?KGPluUlhCxDRNZgzU0u1z21OZOSAQWjO0lpJC2iImZbmE7roS9iux/mqdcxY?=
 =?us-ascii?Q?YvCsBMhSqmScrnHJD0jTo9pI9MNjvkGpAYkbskw8zDhjzUPSHMKGtmHEzd+d?=
 =?us-ascii?Q?85m3W7PE4KLyOst8lxIl/BeFhTgMtg3ZPNnrN71S5XXsY2Z3YaHnL+0BK7g4?=
 =?us-ascii?Q?LliXz0n+qKriq5QE5WdhPRsQ1OyPWChKQRtBKbjwWsHR5NgsOH/yog8iqKM/?=
 =?us-ascii?Q?8Unymy3iK73zopJL5kN7RUMyVg64r7FITwuslfG+LAm9Ab5uG1x/pr+YkRxR?=
 =?us-ascii?Q?p8CnRFmREF95mEKtRJXwSRS5fKogNV9o7E5PR1wsnHO2tQSY/Xpy992CdhA6?=
 =?us-ascii?Q?IncuR2Lhj1KyFPrTx2tsaYyeBrDb49ZHNRkOI6ea66xdXFG6yaPzuIn7bZBZ?=
 =?us-ascii?Q?qR0DdV3b2KFRwX5KpEnGFbSKyyVB67FbDHReg96PRf+rkqXDwMOKzPHszoqR?=
 =?us-ascii?Q?6W06l+5l5eY/Fzg6ZjvlVzLptia9p4UxeGP55+dBVFBL39a105iU+K12zNoX?=
 =?us-ascii?Q?rloG2i4YwscvCRPlFs6jQujQcB5nCIhL8swlIhWp+QZbOTs6sL5OMRl7v/Kw?=
 =?us-ascii?Q?iKf7UbgcBiV3gS1zwMmJQcIeIPBvQSP4DLtB5Ihqf92f4qC03SHT9Qt9Blmm?=
 =?us-ascii?Q?MZ4T1CRAambHdRbuVTreQk1GzUG/NT8IuJwUxqo9UN0oMJFyLGJDJ95eCF0c?=
 =?us-ascii?Q?I1Rt6Bmml0fcFtdF47/yMasi2sNrAiJhBtwZ1ffcfUGdu30spP5KN3Qp6iXW?=
 =?us-ascii?Q?lgmdc0tE43ngHwXE2cm/yskwneu16ncVt2Jf+R22KH8xqImDMlJZuN+qTbgd?=
 =?us-ascii?Q?Uqy9MufWg8a4dOLErBoR/wgu0DxgmvGse0xS9CP3hMrQtMSnD3kT3uZkPjjy?=
 =?us-ascii?Q?xph+4vE/DLwpD4/oxWO9ogQ5ap/614vZwxqOUOVzUXsCeHnIEp2JKdlsBfeV?=
 =?us-ascii?Q?MqSL29dP3zAQS2zHQDwRq7p+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aac18e7-6e42-4f0d-c997-08d937928d6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 04:34:42.5673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCUUNoGR1xOpIGANplE0Y0F9G3G4Lx05Mfs2OW9AaupZ/yeRXSP/CqHCzpZQQjQktpOkG11dBf8OmVQCQZikzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2745
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=swee.aun.khor@intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Mazlan,
 Hazwan Arif" <hazwan.arif.mazlan@intel.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Khairul,=20

> +            gdk_monitor =3D gdk_display_get_monitor(window_display,
> +                                                  opts->u.gtk.full_scree=
n_on_monitor
> +                                                  - 1);
> +            if (gdk_monitor !=3D NULL) {
> +                monitor_status =3D true;
[Romli, Khairul Anuar] Do you think we should use gdk_display_get_monitor i=
nside the if check against the NULL value rather than using a variable? Ind=
eed that with cause some code readability difficulty but I don't see gdk_mo=
nitor is being used beyond this check.

SweeAun: I can do that. =20

Regards,
SweeAun

-----Original Message-----
From: Romli, Khairul Anuar <khairul.anuar.romli@intel.com>=20
Sent: Friday, June 25, 2021 12:28 PM
To: Khor, Swee Aun <swee.aun.khor@intel.com>
Cc: qemu-devel@nongnu.org; kraxel@redhat.com; armbru@redhat.com; eblake@red=
hat.com; Kasireddy, Vivek <vivek.kasireddy@intel.com>; Mazlan, Hazwan Arif =
<hazwan.arif.mazlan@intel.com>
Subject: RE: [PATCH v4] ui/gtk: New -display gtk option 'full-screen-on-mon=
itor'.

Hi Swee Aun,

I have some comment on the patch.

> -----Original Message-----
> From: Khor, Swee Aun <swee.aun.khor@intel.com>
> Sent: Thursday, June 24, 2021 4:43 PM
> To: qemu-devel@nongnu.org
> Cc: Khor, Swee Aun <swee.aun.khor@intel.com>; kraxel@redhat.com;=20
> armbru@redhat.com; eblake@redhat.com; Romli, Khairul Anuar=20
> <khairul.anuar.romli@intel.com>; Kasireddy, Vivek=20
> <vivek.kasireddy@intel.com>; Mazlan, Hazwan Arif=20
> <hazwan.arif.mazlan@intel.com>; Khor
> Subject: [PATCH v4] ui/gtk: New -display gtk option 'full-screen-on-monit=
or'.
>=20
> This lets user select monitor number to display QEMU in full screen=20
> with - display gtk,full-screen-on-monitor=3D<value>.
>=20
> v2:
> - Added documentation for new member.
> - Renamed member name from monitor-num to monitor.
>=20
> v3:
> - Cleaned up commit message subject and signed-off format.
> - Renamed member name from monitor to full-screen-on-monitor to make=20
> clear this option automatically enables full screen.
> - Added more detail documentation to specify full-screen-on-monitor=20
> option index started from 1.
> - Added code to check windows has been launched successfully at=20
> specified monitor.
>=20
> v4:
> - Used PRId64 format specifier for int64_t variable in warn_report().
>=20
> Signed-off-by: Khor, Swee Aun <swee.aun.khor@intel.com>
> ---
>  qapi/ui.json    | 10 +++++++---
>  qemu-options.hx |  2 +-
>  ui/gtk.c        | 35 +++++++++++++++++++++++++++++++++++
>  3 files changed, 43 insertions(+), 4 deletions(-)
>=20
> diff --git a/qapi/ui.json b/qapi/ui.json index 1052ca9c38..d775c29534=20
> 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1035,13 +1035,17 @@
>  #               assuming the guest will resize the display to match
>  #               the window size then.  Otherwise it defaults to "off".
>  #               Since 3.1
> -#
> +# @full-screen-on-monitor: Monitor number to display QEMU in full screen=
.
> +#                          Monitor number started from index 1. If total=
 number
> +#                          of monitors is 3, possible values for this op=
tion are
> +#                          1, 2 or 3.
>  # Since: 2.12
>  #
>  ##
>  { 'struct'  : 'DisplayGTK',
> -  'data'    : { '*grab-on-hover' : 'bool',
> -                '*zoom-to-fit'   : 'bool'  } }
> +  'data'    : { '*grab-on-hover'          : 'bool',
> +                '*zoom-to-fit'            : 'bool',
> +                '*full-screen-on-monitor' : 'int' } }
>=20
>  ##
>  # @DisplayEGLHeadless:
> diff --git a/qemu-options.hx b/qemu-options.hx index
> 14258784b3..29836db663 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1787,7 +1787,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>      "            [,window_close=3Don|off][,gl=3Don|core|es|off]\n"
>  #endif
>  #if defined(CONFIG_GTK)
> -    "-display gtk[,grab_on_hover=3Don|off][,gl=3Don|off]|\n"
> +    "-display gtk[,grab-on-hover=3Don|off][,gl=3Don|off][,full-screen-on=
-
> monitor=3D<value>]\n"
>  #endif
>  #if defined(CONFIG_VNC)
>      "-display vnc=3D<display>[,<optargs>]\n"
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 98046f577b..255f25cabd 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2189,6 +2189,10 @@ static void gtk_display_init(DisplayState *ds,=20
> DisplayOptions *opts)
>      GdkDisplay *window_display;
>      GtkIconTheme *theme;
>      char *dir;
> +    int monitor_n;
> +    GdkScreen *gdk_screen;
> +    GdkMonitor *gdk_monitor;
> +    bool monitor_status =3D false;
>=20
>      if (!gtkinit) {
>          fprintf(stderr, "gtk initialization failed\n"); @@ -2268,6=20
> +2272,37 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions=
 *opts)
>          gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
>      }
>      gd_clipboard_init(s);
> +
> +    if (opts->u.gtk.has_full_screen_on_monitor) {
> +        monitor_n =3D gdk_display_get_n_monitors(window_display);
> +
> +        if (opts->u.gtk.full_screen_on_monitor <=3D monitor_n &&
> +            opts->u.gtk.full_screen_on_monitor > 0) {
> +            gdk_screen =3D gdk_display_get_default_screen(window_display=
);
> +            gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window),
> gdk_screen,
> +                                             opts->u.gtk.full_screen_on_=
monitor
> +                                             - 1);
> +
> +            gdk_monitor =3D gdk_display_get_monitor(window_display,
> +                                                  opts->u.gtk.full_scree=
n_on_monitor
> +                                                  - 1);
> +            if (gdk_monitor !=3D NULL) {
> +                monitor_status =3D true;

[Romli, Khairul Anuar] Do you think we should use gdk_display_get_monitor i=
nside the if check against the NULL value rather than using a variable? Ind=
eed that with cause some code readability difficulty but I don't see gdk_mo=
nitor is being used beyond this check.

> +            }
> +        }
> +
> +        if (monitor_status =3D=3D false) {
> +            /*
> +             * Calling GDK API to read the number of monitors again in c=
ase
> +             * monitor added or removed since last read.
> +             */
> +            monitor_n =3D gdk_display_get_n_monitors(window_display);
> +            warn_report("Failed to enable full screen on monitor %" PRId=
64 ". "
> +                        "Current total number of monitors is %d, "
> +                        "please verify full-screen-on-monitor option val=
ue.",
> +                        opts->u.gtk.full_screen_on_monitor, monitor_n);
> +        }
> +    }
>  }
>=20
>  static void early_gtk_display_init(DisplayOptions *opts)
> --
> 2.24.3


