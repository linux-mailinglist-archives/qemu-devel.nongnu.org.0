Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C2A3D8611
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 05:22:02 +0200 (CEST)
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8a8u-0003AX-JQ
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 23:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khairul.anuar.romli@intel.com>)
 id 1m8a6z-0002NB-Lw
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 23:20:01 -0400
Received: from mga11.intel.com ([192.55.52.93]:55678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khairul.anuar.romli@intel.com>)
 id 1m8a6v-0006Mn-Nu
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 23:20:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209459134"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209459134"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 20:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="663126688"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2021 20:19:44 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 20:19:43 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 20:19:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 20:19:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 20:19:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtAiMVrzXAliPC94ht6D34BsTIAr9NzGTnpxZT7jE9tht75C2N2x24Wd0cksvpzWv6kFQkSIQw6ZpddtrY0y5FHpRHflY1Abr1LKcB57gL7nHCgJEmUcyC66cqNvAhoM39QwzAUtIPTBjL7UxulFQX8MKxQn3Q+YqEu0bh7CQELGA4xqf8PdHGpsM99/uZ3rvf0R8Ep4/MKIwVtoRjxpaOM3BiA0+RShfaA2pItyLMIM8+GObeHdk/7pWfuf4k42TRzRQjHhRxNUxbUeo8CeLS4/1SHdjfZVytB817sRuZILT8amhCNBAvMJz7ujeKXHmazbTNXGUeb7lZqGDgwH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cI34iSN4WnJQTDsWxMKWFzozherhRdjGmPBjYcwIADM=;
 b=WhPmG/uWj/Lmj8ngAJ/TzSYXB3iBI/HggldGX9O/EsB684V5bblR2LH6xxTrhRR0wLbY8UoEG3Xvh7+8s3N4OZmlVBDUGLE/NJXA14Zlwql5UNRg8qX6H+92N0NFBYfybXKHefxMXK2iNH7UNnLoo5ttaLoLfvsXp7i4SOFGf2mt1yOgbwgumshWWmkqWqKYLlwdHG2pMOVJwGKOInD85SX5rjypdX3tjH27nY0wKbIacY991qZ8pMHX9c+GLTBO7N+DEpCQegKZhUPLcidnIBmieM3Y6TS5lrT9QSA23DrRxWlxDaiwLcvcg59IvDnD2ptLRfULCSDtpc+tFiQqIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cI34iSN4WnJQTDsWxMKWFzozherhRdjGmPBjYcwIADM=;
 b=kNrMlEWBGkXndY6ryZIh5IKImRAcg9F4F470/8etuTZ4EjX4n2GzFwf1drSh4d2jHuzRsynGAcH2KLFOjHJ5yZSba+dwND34/wePy6gDfSXlaKRLeVfTlzSAtQINKO0ZOpTyOz0D29cy//0WtupWGV49k+jxRr8f6siUnc6lmxc=
Received: from BYAPR11MB3637.namprd11.prod.outlook.com (2603:10b6:a03:f9::16)
 by BYAPR11MB2773.namprd11.prod.outlook.com (2603:10b6:a02:c6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 03:19:40 +0000
Received: from BYAPR11MB3637.namprd11.prod.outlook.com
 ([fe80::58ab:34ee:37bd:815c]) by BYAPR11MB3637.namprd11.prod.outlook.com
 ([fe80::58ab:34ee:37bd:815c%4]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 03:19:40 +0000
From: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
To: Markus Armbruster <armbru@redhat.com>, "Khor, Swee Aun"
 <swee.aun.khor@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v5] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Thread-Topic: [PATCH v5] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Thread-Index: AQHXaZ69WlOIKokTQUSut3mic+pUHas5Tm3CgB6cXYA=
Date: Wed, 28 Jul 2021 03:19:40 +0000
Message-ID: <BYAPR11MB3637B6D9BC7BE2BF93F6B40CB3EA9@BYAPR11MB3637.namprd11.prod.outlook.com>
References: <20210625082432.55842-1-swee.aun.khor@intel.com>
 <87k0m0dcx0.fsf@dusky.pond.sub.org>
In-Reply-To: <87k0m0dcx0.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d397119-e324-49d8-8496-08d9517689b7
x-ms-traffictypediagnostic: BYAPR11MB2773:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2773720BD8635A3C178CA87DB3EA9@BYAPR11MB2773.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Jv5z7rPc0E2KZBs77+Fsared9bhlfKwnvMCn/JocoKUTqH57aB6hlL3tcHt8bcoUqHaLwMcvP/dqjegxri8Vk2Da0q02q8dDFGoXPFqzezBxgFxsi3VYYm5nCSX1tBOctOse79LRUA7i1+fQbCMIKGwBs0rK04gF9yjwz1C7tOwPSzM2fAsOVRcbA9ZQ8Uc4yD5JedTNvlUp9zPi/SIMk7IWgkSc1AuW3y/ml/L25eCYO8fl01TZK0S7KtgqHkZxgUzLY3thQvX2cln94+6xRi5EQthNs8FZmO+Frv4xkWN+C3mG4CkNpZqVctrilA27cIb8gXWgY2QzTbSwiPP42xbPozUc1TZcyjV9/KSJq2rEq99RdDp5kzuOciN/EAk2mdV9WT1fXIf5YuskbuuFn5YyNXySPkCSBykT1Pg/NDG8kWhgLw/ZATnCh8dNHQGdxqT1+Pz4q1yUJ6uui7b0lcPzvq03rTI29Nzvqczuk6uHvoTMmx5p29tuwUX+VjAx0zRKA+vkVtRxozrxlEPbMUGT3pA6ZynEH4b4ITUDjnPhRgWDIcjEW0rF4B3j5F/nsvMm6GopYZwntpHFhghIlQrjDcBmPNPOVy5eg0e0HFHRjO8XZoNmtpF+4CV/4dLXff7aFQYo2QHJ4t1mhcu3dQYUMBCCE/NRFLgoE2fYIdzRF3olWwTWGDASza0Tm/VmUsd9TsfbsCNa9jWJLJ5npRFfiHy6fnNuOGuyA3BEdZbhn4eGYWj/YYb709cWorAI5M5owHhRtGAxGVzazNBWKU6A9dDzlDjHawwx6dxe2A3YW5BEettrxzqtTbQZ+/3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3637.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(186003)(38100700002)(64756008)(66446008)(71200400001)(66946007)(316002)(76116006)(7696005)(53546011)(66476007)(9686003)(110136005)(38070700005)(478600001)(26005)(55016002)(122000001)(2906002)(966005)(33656002)(66556008)(86362001)(54906003)(5660300002)(6506007)(8936002)(52536014)(8676002)(83380400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kyrzVLuJBC6GSjUjv3gaQ4n3Lm4sRE/9o9mkT27OHsU1WeBrkgpNJHqFOPop?=
 =?us-ascii?Q?EkBh41CBGDV3LzMVOzsQK2YipHhyZxtHg1yCw8Fu59+NI3dOhhh4bcOtZs1g?=
 =?us-ascii?Q?vXfkxR6kzF9bPlK9ry+grKsD7J5UPw8tm9zNwCh9BzPK3QScpezcC8sAG+8y?=
 =?us-ascii?Q?S2h+N+iSs/uZboOcjTYCS/25Cxg1Nq8iRh4qAtrAccXAPLjqGqsUbmyEoxai?=
 =?us-ascii?Q?dKeMmgwIfVyHgK3aFUsEduGcESXIyMtv/rArezLQjgY0ThrIlY7EYHV5Ahnp?=
 =?us-ascii?Q?3V6VriMB01qUMCUtMPJHzDqY3NNdKxvs/jTcbZ3Ya4uBoa14DZFnErJf9S9i?=
 =?us-ascii?Q?QDTIWFJfNnrrzZKjuujoJ/Va+dv1yBYlSB/8NbLBQ2axF1ZPu9XdCaSEColL?=
 =?us-ascii?Q?OLnDsljO8e65HAP39uMIP0UxLtLeKzBa+Fq2eP9HQXBzyf3prXeK6Rz+XOAx?=
 =?us-ascii?Q?7zjvs8gl9eoPVPoy5/X9/JY0hM9urR8iSIEmvrYqj9cH+LtYaoCiOfJbUTN4?=
 =?us-ascii?Q?PiWsuRpOZpwBHbtGyRKHiCHKa5Iql/lOXNeATYvRK0HLoBHNeBlbmjdNT1xT?=
 =?us-ascii?Q?eaI5bdYDPYtHRplW57aIZpmk93PxP3iKLJtSzo6uIW4DTlPIFfTylaLu10o0?=
 =?us-ascii?Q?tsfTKV+6r4+993YynOxkvr98Z24pdRkA4m8ObeKFtOg5t8yUQ8g+k2cv+mxZ?=
 =?us-ascii?Q?al9OPbPLt66n05nCOjWqpX7S+coSDla9ClPD5CU8xBre/aWk7Wz0P1LwkJ7w?=
 =?us-ascii?Q?klXiSqGFSN4TD0BqMIoP+HMkyKhISH/QJaXU6NOSM3i8GwRNbSPRQSsi09oE?=
 =?us-ascii?Q?BbzSHL0D5aT2dkSt9Dg5yynYGk04lwBgCNuh4u7pFJMPrzLC62h6CVDlVuT9?=
 =?us-ascii?Q?mypKEQMbxVj5bPo14NxrJRdG/6dLfDrQuiOLeQEmpfKO4ADPGqvG/peIj7DO?=
 =?us-ascii?Q?CTdjzZhQSsSiKRIzeLzSg8OBjTaWFqEG888DaMR1bJ86jotTFo8dUSr0pMbe?=
 =?us-ascii?Q?emEFU/H93b6OypWjmChtXfR0RcctLSwx1N1nVx9VSrZXI3PMbMFxp2Dj6sOt?=
 =?us-ascii?Q?DKsal15ihONA0l84U+HmZv/wP3fWKmStxzRelGcQrE2tiwgS4lughMpvRDZb?=
 =?us-ascii?Q?KCeoY1ip2jLddpJ64ay+i5sZjzLR8Dvk8oey7Fqkr+No2mxMLuRXxlhnL0hY?=
 =?us-ascii?Q?lluUzuL8s548GXhsdIVF6M3HIt42MhEx+MHInGntcJuQjsV81RzYezRKYDPI?=
 =?us-ascii?Q?P9MIDuWiqK344QUkNcDNkGLi3a9Ummjkz/mowuhCU9PCvVx3g1atOGykpsqv?=
 =?us-ascii?Q?LFhkvXHkn7qj6nXWnRnAqKV1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d397119-e324-49d8-8496-08d9517689b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 03:19:40.7412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AzPU8y2Lzgmj8Om2nnx/ogoA5m2OzEMNLeHcYIlDDKKN+ZqUSPD4CcLtQmQuNtKu7mU0qUU6WkNw6iehJ3O1HEjpPbRnO8EfFfpRTtljCPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2773
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=khairul.anuar.romli@intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Mazlan, Hazwan Arif" <hazwan.arif.mazlan@intel.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

Could you add comment or review on this patch?=20

Thank You.

Best Regards,
Khairul=20

> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Thursday, July 8, 2021 11:49 PM
> To: Khor, Swee Aun <swee.aun.khor@intel.com>
> Cc: qemu-devel@nongnu.org; Romli, Khairul Anuar
> <khairul.anuar.romli@intel.com>; Mazlan, Hazwan Arif
> <hazwan.arif.mazlan@intel.com>; Kasireddy, Vivek
> <vivek.kasireddy@intel.com>; kraxel@redhat.com; eblake@redhat.com
> Subject: Re: [PATCH v5] ui/gtk: New -display gtk option 'full-screen-on-
> monitor'.
>=20
> "Khor, Swee Aun" <swee.aun.khor@intel.com> writes:
>=20
> > This lets user select monitor number to display QEMU in full screen
> > with -display gtk,full-screen-on-monitor=3D<value>.
>=20
> The part from here ...
>=20
> > v2:
> >  - https://patchew.org/QEMU/20210617020609.18089-1-
> swee.aun.khor@intel.com/.
> >  - Added documentation for new member.
> >  - Renamed member name from monitor-num to monitor.
> >
> > v3:
> > - Changed commit message subject.
> > - Cleaned up signed-off format.
> > - Renamed member name from monitor to full-screen-on-monitor to make
> clear this option automatically enables full screen.
> > - Added more detail documentation to specify full-screen-on-monitor
> option index started from 1.
> > - Added code to check windows has been launched successfully at specifi=
ed
> monitor.
> >
> > v4:
> > - Used PRId64 format specifier for int64_t variable in warn_report().
> >
> > v5:
> > - Removed gdk_screen and gdk_monitor variables as it used once only.
> > - Fixed issue where v3 and v4 doesn't showing up in
> https://patchew.org/QEMU/.
>=20
> ... to here should go ...
>=20
> > Signed-off-by: Khor Swee Aun <swee.aun.khor@intel.com>
> > ---
>=20
> ... here.  If nothing else needs to be improved, I hope the maintainer ca=
n take
> care of this one for you.
>=20
> >  qapi/ui.json    | 10 +++++++---
> >  qemu-options.hx |  2 +-
> >  ui/gtk.c        | 30 ++++++++++++++++++++++++++++++
> >  3 files changed, 38 insertions(+), 4 deletions(-)
> >
> > diff --git a/qapi/ui.json b/qapi/ui.json index 1052ca9c38..d775c29534
> > 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -1035,13 +1035,17 @@
> >  #               assuming the guest will resize the display to match
> >  #               the window size then.  Otherwise it defaults to "off".
> >  #               Since 3.1
> > -#
> > +# @full-screen-on-monitor: Monitor number to display QEMU in full
> screen.
> > +#                          Monitor number started from index 1. If tot=
al number
> > +#                          of monitors is 3, possible values for this =
option are
> > +#                          1, 2 or 3.
>=20
> This is silently ignored unless 'full-screen': true.  Correct?
>=20
> >  # Since: 2.12
> >  #
> >  ##
> >  { 'struct'  : 'DisplayGTK',
> > -  'data'    : { '*grab-on-hover' : 'bool',
> > -                '*zoom-to-fit'   : 'bool'  } }
> > +  'data'    : { '*grab-on-hover'          : 'bool',
> > +                '*zoom-to-fit'            : 'bool',
> > +                '*full-screen-on-monitor' : 'int' } }
> >
> >  ##
> >  # @DisplayEGLHeadless:
> > diff --git a/qemu-options.hx b/qemu-options.hx index
> > 14258784b3..29836db663 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -1787,7 +1787,7 @@ DEF("display", HAS_ARG,
> QEMU_OPTION_display,
> >      "            [,window_close=3Don|off][,gl=3Don|core|es|off]\n"
> >  #endif
> >  #if defined(CONFIG_GTK)
> > -    "-display gtk[,grab_on_hover=3Don|off][,gl=3Don|off]|\n"
> > +    "-display gtk[,grab-on-hover=3Don|off][,gl=3Don|off][,full-screen-=
on-
> monitor=3D<value>]\n"
>=20
> Suggest full-screen-on-monitor=3D<number>.
>=20
> >  #endif
> >  #if defined(CONFIG_VNC)
> >      "-display vnc=3D<display>[,<optargs>]\n"
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index 98046f577b..4da904a024 100644
> > --- a/ui/gtk.c
> > +++ b/ui/gtk.c
> > @@ -2189,6 +2189,8 @@ static void gtk_display_init(DisplayState *ds,
> DisplayOptions *opts)
> >      GdkDisplay *window_display;
> >      GtkIconTheme *theme;
> >      char *dir;
> > +    int monitor_n;
> > +    bool monitor_status =3D false;
> >
> >      if (!gtkinit) {
> >          fprintf(stderr, "gtk initialization failed\n"); @@ -2268,6
> > +2270,34 @@ static void gtk_display_init(DisplayState *ds, DisplayOptio=
ns
> *opts)
> >          gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
> >      }
> >      gd_clipboard_init(s);
> > +
> > +    if (opts->u.gtk.has_full_screen_on_monitor) {
> > +        monitor_n =3D gdk_display_get_n_monitors(window_display);
> > +
> > +        if (opts->u.gtk.full_screen_on_monitor <=3D monitor_n &&
> > +            opts->u.gtk.full_screen_on_monitor > 0) {
> > +            gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window),
> > +                gdk_display_get_default_screen(window_display),
> > +                opts->u.gtk.full_screen_on_monitor - 1);
> > +
> > +            if (gdk_display_get_monitor(window_display,
> > +                                        opts->u.gtk.full_screen_on_mon=
itor
> > +                                        - 1) !=3D NULL) {
> > +                monitor_status =3D true;
> > +            }
> > +        }
> > +        if (monitor_status =3D=3D false) {
> > +            /*
> > +             * Calling GDK API to read the number of monitors again in=
 case
> > +             * monitor added or removed since last read.
> > +             */
> > +            monitor_n =3D gdk_display_get_n_monitors(window_display);
> > +            warn_report("Failed to enable full screen on monitor %" PR=
Id64 ". "
> > +                        "Current total number of monitors is %d, "
> > +                        "please verify full-screen-on-monitor option v=
alue.",
> > +                        opts->u.gtk.full_screen_on_monitor,
> > + monitor_n);
>=20
> I wonder whether the warning should be an error, but that's for the
> maintainer to decide.
>=20
> > +        }
> > +    }
> >  }
> >
> >  static void early_gtk_display_init(DisplayOptions *opts)
>=20
> Ignorant question: are monitors renumbered when a monitor goes away?
>=20
> Example: we have three monitors A, B, C, numbered 0, 1, 2 (GTK monitor
> numbers start with 0).  Now monitor B goes away.  I figure monitor A
> remains number 0.  What about C?  Does its number change from 2 to 1?
>=20
> I still believe numbering monitors 1, 2, 3 instead of 0, 1, 2 in QMP is a=
 bad
> idea.  The unnecessary difference to GTK's monitor numbers is bound to
> confuse.  But I'm not the maintainer here.
>=20
> The code to guard against and detect errors looks highly questionable to =
me.
> Let me explain.
>=20
> This is the actual work:
>=20
>                gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window),
>                    gdk_display_get_default_screen(window_display),
>                    opts->u.gtk.full_screen_on_monitor - 1);
>=20
> The function's documentation advises:
>=20
>     Note that you shouldn't assume the window is definitely full screen
>     afterward.
>=20
>     You can track the fullscreen state via the "window-state-event"
>     signal on GtkWidget.
>=20
> https://developer.gnome.org/gtk3/stable/GtkWindow.html#gtk-window-
> fullscreen-on-monitor
>=20
> You don't follow this advice.  Instead you do:
>=20
> 1. Guard the actual work with "the monitor with the requested number
>    exists".  This guard is unreliable, because monitors can go away
>    between the guard and the actual work.
>=20
> 2. Check whether the monitor with the requested number still exists
>    after the actual work.  This is also unreliable, because the monitor
>    can go away between the guard and the actual work, and come back
>    between the actual work and the check.
>=20
> The code to handle the error looks questionable, too.  The number of
> monitors reported in the error message can be misleading.  Say the user
> asked for monitor 2, and the guard found only 1.  A second monitor appear=
s
> between the guard and the error reporting.  Now the current number of
> monitors reported in the error has nothing to do with the actual error.
>=20
> Is there any particular reason not to use the function the way its
> documentation advises?


