Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159123B3D00
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 09:06:42 +0200 (CEST)
Received: from localhost ([::1]:43316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwfvE-0006gl-SJ
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 03:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khairul.anuar.romli@intel.com>)
 id 1lwdSN-0000g0-1i
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:28:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:30358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khairul.anuar.romli@intel.com>)
 id 1lwdSJ-0003NP-L2
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:28:42 -0400
IronPort-SDR: 3EQv5nD+VBXa0W0SQlR9SMMN7z8orzHv/oVr0GrG5TCIoQ5Znh5LGZaI0tlSdFIx0COlEOfXSP
 S4+w2mPWbcCQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207543091"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="207543091"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 21:28:29 -0700
IronPort-SDR: S1ZBm80nTxzcApaSsF783K87uT72JUq11ky3wuaonrUCDBuvIg3Gdj+lun8TxLA8kLSPgRrKsM
 hNxc3KCCe8oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="491419068"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2021 21:28:28 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 21:28:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Thu, 24 Jun 2021 21:28:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Thu, 24 Jun 2021 21:28:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsX/YKVYjQJaLZlHl+ob41LDvr7aC4AkEy3ndnYnF9sI3qQLvKOL+Qdet+8K3hzNjGBk3xnVwBVFf+pyiVwgflYvxwOX4YsIeZDlw4GlmiEYncfaPGd2UFURUW/5Zn1b78w+P/XuFLOTUc80dLdMMVbeDqafuVxti0H/7DHPMP9GGIk/j57o8g/7kNzTZdl3I9MPBwMos03lxle8vjKhQqs5kbFr8TQcgXh9Uyr86aYuoW4dLF0Wwt/zKbKeUGQrmGVTcCRTP+Z4r9X7BWx93knkXrZM40EE9o4cFPnZr210DeCbFQk1eUF1uIQGzIDeazUt7U2rC5ntnMK9S+SOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRcSnwuoe2ViO5rrhmwCj+8SZFW8cTopB5PGPFq3XQ8=;
 b=S/b3+5W+JVSzR6HJTrTzmTPBlZv/nz5y9FvHZRqUpyUXpm23o2P1JSyNGGP9JXqxSTKdDSh3nKiByBC0lGiqe75CvNgRqMEpHyorZ/N+E3quO2Wb3BQQo7FaRWiyY9HXcM6Dkoz1i0wnG3PiKnwIrUazjMopRH6lYcwSS7tEv9EaVTy8MF+L/yBToLAsQE6mo6Vxt8uB9uMEoM+wj+Tz6Am9IBEM9nLAyhSAEnhb1XgwOyWwEMbPcFRENqinH4y2vZFWx20pKFLgx41Y7T3cUlD5tbEynKdyToDZZIt06P3w80m7A5jZbEDJnA1vPOWgqA41/YCXPvE9PJ95eZP52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRcSnwuoe2ViO5rrhmwCj+8SZFW8cTopB5PGPFq3XQ8=;
 b=BPSqF/AfpfsrE17knXlEfYQezPFw2V+7UcikxcKZM7ZZoLqNn6Oi+Qav/422eAbYxkUS12GDsyXZ86phPgE6BfXUPOe3BIu372xfe6J842RY19xjHXxZXudEVUBa6uSovH2RkcI2rbjUCm0XfbcyoHbZ7enu36iuG5HrRbYeZfA=
Received: from BYAPR11MB3637.namprd11.prod.outlook.com (2603:10b6:a03:f9::16)
 by BYAPR11MB2967.namprd11.prod.outlook.com (2603:10b6:a03:8a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 04:28:26 +0000
Received: from BYAPR11MB3637.namprd11.prod.outlook.com
 ([fe80::78e7:fd8b:73f8:dc7a]) by BYAPR11MB3637.namprd11.prod.outlook.com
 ([fe80::78e7:fd8b:73f8:dc7a%7]) with mapi id 15.20.4242.025; Fri, 25 Jun 2021
 04:28:26 +0000
From: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
To: "Khor, Swee Aun" <swee.aun.khor@intel.com>
Subject: RE: [PATCH v4] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Thread-Topic: [PATCH v4] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Thread-Index: AQHXaNhE/uBljcZ3MUmyfZjMhkGmBaskIdcQ
Date: Fri, 25 Jun 2021 04:28:26 +0000
Message-ID: <BYAPR11MB3637D892CF682A0A10F4EA3AB3069@BYAPR11MB3637.namprd11.prod.outlook.com>
References: <20210624084251.54213-1-swee.aun.khor@intel.com>
In-Reply-To: <20210624084251.54213-1-swee.aun.khor@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.131.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edc64301-1a32-45db-453c-08d93791ad14
x-ms-traffictypediagnostic: BYAPR11MB2967:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2967B237E14C768B46DDB6BFB3069@BYAPR11MB2967.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x+8e8kMEIkELuNpbi1gcf2YfLT3FlImrgc+zpUt9yvvRP1tdDWSu9GOHSk/nZJp9ha6bkGCqGXQ6e1e+huO4dzrYiizjV4bkY2o4Zz0hkllv01yzpG7JWZKgZZUosqdnTYbkFtTeMbpOp6EeQGis8EMqzk8Try+/9flhkjQTlgCmVO2Rrpk+LNNTWZtYE5NsAru5T7ma9rTl0BOo2adoSIxHyrfxRMq9LwUjt/BsPQxMUiY/Wngk7bHeM6hrNoj1meofQFMot1hBo/y86neU4dnBMFrIrNGEwC9VXEOUzx6uBeeElKc0yBtxBVb2xpi3/OlFjNk6VKn5zFNAwttM7ZJ+BPtWk65DzF0tCRVn6vtlUJD5EYT4stFLrg13JXP7udkK1lBEH42m3n2qA19KpfB5K4OV3eD6/ijhte9ox7qq1cor0FIMn0xbuGVYWBsY4DkaY4dTNoayh7S25OHvioPnfHPI522MlzsAg/FxQSJRKCb2C+TpoCm/W6qadDHfQ0JyD2JSPt7juGjwqGddn78ft1Ln72o2cfs1sHBumOqFL7U6dSPpattSwFQtOHJWZS4ABQrZn0bhoo7PqpRNRT+aY8akDJfPpA+RsqzfaJk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3637.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(346002)(376002)(39860400002)(66446008)(64756008)(66556008)(66476007)(66946007)(8936002)(53546011)(6506007)(86362001)(33656002)(8676002)(26005)(186003)(76116006)(2906002)(107886003)(83380400001)(122000001)(7696005)(6862004)(55016002)(52536014)(71200400001)(9686003)(316002)(478600001)(6636002)(38100700002)(4326008)(5660300002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5BD7G6OCoNKzVhm3Wyy71LqX2XQPvAxD1t6uOxxhJDY7Y/rBU6I8SfO18SMl?=
 =?us-ascii?Q?Mmfd4UHGle6cs/vJJIeulhCarN1iKgekSDPsld0DA0J/tSCrFZteYzSVwsCH?=
 =?us-ascii?Q?+kuEqcKjxs6AleiVdgIiuOYctma4w0hTdYRc10dtRJmYUGR6l4mzmOCIPvOQ?=
 =?us-ascii?Q?yHVsJfaP7OBzKRi1P0obGphfOPPkhtTy0Kn+fbHKJALaxryFpAJzIKFDIzbe?=
 =?us-ascii?Q?5znN1Iy/8znU/QiO5lMUT2qryVTxciZhEidp1yaAz5hR8/wkGLopQFrOu0yK?=
 =?us-ascii?Q?JzYXvSrFVAA9x3HrvprJsMtQap31AMePxky8DNHLb3zCjcoiXrAVeSVa3+Hs?=
 =?us-ascii?Q?8rWvh6nqioEZPlEcwdUn2RKdDY6nl+R/Jizf1ZDnErbdchLZrJFAXo2em/iT?=
 =?us-ascii?Q?Lw3109hnk8DbPXCUG4JFhAscAIn53p9F3fEG93qHaeIrjQALwCUDWABj8PEn?=
 =?us-ascii?Q?5pRHwq6MA3N8+izWp07mhTVkVhxiq1qsWUIWwxlnFx5cDIL6IW9Nu5vuJwMN?=
 =?us-ascii?Q?C4A2NdOkpiH/wL9uaJITAzSZNlM5x54m3yWjA/3bKGwdsgyvC2xHmkgxPxnX?=
 =?us-ascii?Q?PWhGlkFgDP2QP6K5UAg8MhwuRqiKcukq8jOXj+69Jq8nbns/0mIx4/K4KZtH?=
 =?us-ascii?Q?ajkQcGY7dSCUgsOzjQmxo+fB+R6S34ALbtFVBxoaZAgAb/EtqM0IIZ8ZIfZN?=
 =?us-ascii?Q?7dm6n6DRofDo/E9GsIS2snPrm7ZgRtlmFMeJZyjC/dioDqQAURyNjeDv5MOH?=
 =?us-ascii?Q?+4jqyejw2LSmL1Dv5tAUZ5tiYG/fP0gl+cF/9ymCooC2z4qxIeurROcxF0hF?=
 =?us-ascii?Q?bgqP7qzXt7MSDoniN4Hj1KocnpRHWmmj9YeVI1nCkMqvf5m226ihK21h4EnW?=
 =?us-ascii?Q?amTz3IhI0vrK/bQirZ0hpa8HwyQCgS19gMsQDw3WPGBo4/O2e8zrzfPV9q8h?=
 =?us-ascii?Q?GEhduQl+F1x8hTPzG2diN918klKXQ2pLPJ3EiZac9L5/znXEfgmpuRxPxD+4?=
 =?us-ascii?Q?eDOAcFqroscK901Kv3CcQcHfDrHpdUFEarvd1tJnMKVGtZpCO/TgDdMY+xLI?=
 =?us-ascii?Q?oQUeudTzXT6WNVYILjXXa8JASQtJhsa/dpzbxc2mxYk+loajiOPHpNCuRyz3?=
 =?us-ascii?Q?airIf37Ao/jkDdFOu++vmDdjdyP9StvL32eGOrPxL+8Bg1UgKFMmUcx/OPFk?=
 =?us-ascii?Q?///ZEUw4v+EONdcqdtoZaMjIyjrY6vc6ifReN1NOBOKuOGlWbuhukLM+zyK0?=
 =?us-ascii?Q?HxmPCAow/3Ux1VUYxuZjGZ58yJBtSX0Njn6E6tHxNZctIv2LBJLT9Ec1stdR?=
 =?us-ascii?Q?TdfXMHUHNgaeVK7PfAydEL4g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc64301-1a32-45db-453c-08d93791ad14
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 04:28:26.1689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +cJTpiRRClADlTHjNHAnarPNjwr241FKQXrkF9h3DEx6kCjRwdLBj7fuf1a5501Puyt4KXnYHSvseQ2tY0qTN3pHDw10LR5absJ51XUbRGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2967
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=khairul.anuar.romli@intel.com; helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Jun 2021 02:58:15 -0400
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

Hi Swee Aun,

I have some comment on the patch.

> -----Original Message-----
> From: Khor, Swee Aun <swee.aun.khor@intel.com>
> Sent: Thursday, June 24, 2021 4:43 PM
> To: qemu-devel@nongnu.org
> Cc: Khor, Swee Aun <swee.aun.khor@intel.com>; kraxel@redhat.com;
> armbru@redhat.com; eblake@redhat.com; Romli, Khairul Anuar
> <khairul.anuar.romli@intel.com>; Kasireddy, Vivek
> <vivek.kasireddy@intel.com>; Mazlan, Hazwan Arif
> <hazwan.arif.mazlan@intel.com>; Khor
> Subject: [PATCH v4] ui/gtk: New -display gtk option 'full-screen-on-monit=
or'.
>=20
> This lets user select monitor number to display QEMU in full screen with =
-
> display gtk,full-screen-on-monitor=3D<value>.
>=20
> v2:
> - Added documentation for new member.
> - Renamed member name from monitor-num to monitor.
>=20
> v3:
> - Cleaned up commit message subject and signed-off format.
> - Renamed member name from monitor to full-screen-on-monitor to make
> clear this option automatically enables full screen.
> - Added more detail documentation to specify full-screen-on-monitor optio=
n
> index started from 1.
> - Added code to check windows has been launched successfully at specified
> monitor.
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
> diff --git a/qapi/ui.json b/qapi/ui.json index 1052ca9c38..d775c29534 100=
644
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
> @@ -2189,6 +2189,10 @@ static void gtk_display_init(DisplayState *ds,
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
>          fprintf(stderr, "gtk initialization failed\n"); @@ -2268,6 +2272=
,37 @@
> static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
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


