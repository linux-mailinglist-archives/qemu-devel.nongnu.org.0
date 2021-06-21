Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C93AE9CB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:12:09 +0200 (CEST)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJig-0000Lo-Di
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lvJhZ-0007kj-Md
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:10:57 -0400
Received: from mga04.intel.com ([192.55.52.120]:8858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lvJhW-0008MG-LR
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:10:57 -0400
IronPort-SDR: sXut2EgpadA0gDYZQoGrdeI6ZPLFNCPvy/VbBmHix3UFsn+ElaWunc2caOzvHwCdGiYchUbilQ
 2WSSnDSM0QIw==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="205014717"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="205014717"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 06:10:16 -0700
IronPort-SDR: 7/bXkcxUVhwoAI33gtuDP1yT0gmsTNDaqyURxFf1GrOwi8m5ManAlrwqKrbGesQlZGwiGgA0gp
 jvT21WbfXz8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="453876269"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2021 06:10:16 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 21 Jun 2021 06:10:15 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 21 Jun 2021 06:10:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 21 Jun 2021 06:10:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 21 Jun 2021 06:10:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dr+DniqXZKNTLdPOjzDM/8YI7H/ljeU+KFe7dtbdk8EzYKXaRv7WQawtYfFdrJhXUhW5F/99RQdzokCQn16Ydn/OEqVgEf5vCuqaaJU1iFxHm76dMvE0I8Pf1E5XzhwNzvsEHZzqGk96MA6d2QSifxHrcwFuhrwMW8xdV8xWD+J3i/zhi09LFtiRb2Y2oG+xXQGJiGBObXanHXeGeCDwjICARsOhlD+cYlkhUPtK3dfNac2As6HZiqdDvTHygNKmPnQ04PXIWZhjKwGUhPU6oPWvREB9WkN+pwOJr30t86AR/TxMhapk/qhb4I2GVRqE67++/d+zl23/Xtjvp8TiyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8MBx66TGtKEDkY62rPavLXgrv8vSNbqqOa0IfgFwcI=;
 b=PCF3YEXW7Yssz2/y2YuQKMQXtAbxSRZqEb1Iv3wi0KrCQmNfOFac2Px8GQIPNB/Q3eYqYpTf95L2dY38WfWs9XoAcr7yKTyiZIeb624uOobiiD7A1dya4450xPU8GitfnW5EYy9OMRzWnEocvOgWXlXs+1mcpXInirfaKGsSG/pTa3wnNK/8RvKF3LIqukcy1sLh+vSmJUOYv/ZSPSaFBMUZK+sZJcIYWtpYck9x9k58XYJj6FqCmGJRERSNe9YwVvsrntZGfRPUMm70AdrkEdTTbz5ycAs9o5Nno7tZLR34BwU9uBLtV7D+8lkfsfcHHNVywWI14D/vzLux+kY+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8MBx66TGtKEDkY62rPavLXgrv8vSNbqqOa0IfgFwcI=;
 b=bBeJNTbKYpoJk0mYDHvOXIBsfE7tQcAhl719vVxPOnG5OKjotu6vqAYWxXc0/FupDfkhTbV+3txU2smYUvVNB1mWIIZtsa9ky0eYgH9JKveueZrRkFX9b4wAtgYFmCe5OX6DLevUOgM9BX2VPpTT6uPMLxq2A7xSyPG/5hJ3hKs=
Received: from DM8PR11MB5717.namprd11.prod.outlook.com (2603:10b6:8:30::9) by
 DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Mon, 21 Jun 2021 13:10:12 +0000
Received: from DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1]) by DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 13:10:12 +0000
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v2] ui/gtk: Allow user to select monitor number to display
 qemu in full screen through new gtk display option
Thread-Topic: [PATCH v2] ui/gtk: Allow user to select monitor number to
 display qemu in full screen through new gtk display option
Thread-Index: AQHXZDIfHJcen+WIR0WYeKfsyBDVzasZtNJAgARWmQCAAAPZEIAARZQAgAAekPA=
Date: Mon, 21 Jun 2021 13:10:11 +0000
Message-ID: <DM8PR11MB5717708D9E5793F1EB13380EAF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
References: <20210617020609.18089-1-swee.aun.khor@intel.com>
 <8735tfsa79.fsf@dusky.pond.sub.org>
 <DM8PR11MB571712EDA6522BB50D192A63AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
 <20210621065148.o7yggutrxgvdnpc7@sirius.home.kraxel.org>
 <DM8PR11MB57176186A481ACE8F5924AB8AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
 <20210621111436.l64mvuqpob7lc7dc@sirius.home.kraxel.org>
In-Reply-To: <20210621111436.l64mvuqpob7lc7dc@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [14.192.212.248]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c244ee0c-f531-4d64-d454-08d934b5e714
x-ms-traffictypediagnostic: DM6PR11MB4657:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB46571BA402639990600CB98FAF0A9@DM6PR11MB4657.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DJKsL1Pm55eaMl2i3PkH/jA1VwgkqnOz/InLhD+R4u5nxrEhgYOOTtxbP9P4aSPBhMSbPnnSFJNU5mn3nfi3jUZ8V2cvBo87OoO7RLF/80aDU5GMNc8x18okZDIXbiMpxoTA5EShYirFEidPfGPQxSXKhZqjBPqfZWS7qUssOEtwFYF+b8b1DbSfoJYShXD0V/j4Tk/1uyAewNNRHBvgE4S1HH1vWvoA2s/HQk+X+tgUY94le4sdZVPHi3gm3xJGTJ6ZVpPDyK2xsC0dr2RR6ESyB7TVKWfuQlxnIg8P5KLjzOy8Djrt8sq/2/T4eBpJI4Kp67zSXJ0c8dlIyvP5VrxbjHbZ1XJjO1C2uTv4BUZUnIYs/luyc8m6Hq7PdaJefHcsdEXFl/qCB8WAuTadYIZ4wxS7IIpwi0VRoLBtjixvcGnJ7jmjxU/t4HaE/OvA511WPAXis9xv2ooZCOHp6l3MpubihPvf+4ClNNUa80aWvDmqjkfdv3Nz7E4opdiYgdZfnlVn0c387Lids/7ewq2r0sKk0Ta1zmjStCZrXSQAt1SoDxLcDwStP4h8qiPwkDRsE62A5J+RzXIlEO+QPDYm5cfYM4E4k9KoQQfx4fBwSFTdyXtj5npgzMt4WiKCqrXTCw7vzkm217rhaT0r7VpsMVNG9J/TMMPntwFMLGu6xnvOCm0W4O7IkdHI29RpghB6MIS79haJ0kQuhXffQ6obMyj3PJKMcTKxW1oz4lQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(76116006)(122000001)(6916009)(66946007)(33656002)(38100700002)(966005)(86362001)(66446008)(9686003)(64756008)(7696005)(66556008)(55016002)(26005)(2906002)(8936002)(4326008)(83380400001)(71200400001)(53546011)(186003)(498600001)(6506007)(52536014)(54906003)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iFd3Lluga0Yx7EoFQfSZ5P1+Ihgmfp01nqM9/728ohY+SD3J5hestiPUlm3u?=
 =?us-ascii?Q?w5o9WmQhDMiRk1R7I5+Vbxz4SmfYEiPDycQBsa8IrmDEssaiYJZU02uZQ5GI?=
 =?us-ascii?Q?5oKHq6HlbAAYruyM2Z3cEIMm81Qs8bXUv3ZsDdHBGc9Cr0u93JkklsGpTihp?=
 =?us-ascii?Q?wwaZpSY4Zx0esOf/Xz3ePzF8ROK2qefhgav0K0Zd9ugoU9buAEUodWlVizYU?=
 =?us-ascii?Q?ZAPHjVyRDtzRxNBQUsEhVIXn883o0YXR+hnGOyfQGOlUFUuOR8ww+HBIiVRp?=
 =?us-ascii?Q?p1/T8QcZV83vH93x7el77rg/Pkr+p9WQyV5ehwzldpm0dplumChBJ6gUA0zs?=
 =?us-ascii?Q?uGQs0yhm0zmcpU7O5QLy+qNVrUvn8gVkdnHcjaK0gwg/Oyz7qA19XaCTvo4e?=
 =?us-ascii?Q?5q72kiEZ8KxlvJrqW4ftn+PottgIADgDiZj0vQ9ep+N27P3uA/EtrLwaSAx3?=
 =?us-ascii?Q?5xBj6U+tWtGUakm/cwFvycwqhL8SPXF2p9r6t3FAWO/dJ0p0vgKBJaqV8Pl3?=
 =?us-ascii?Q?e0ArUwM+J05YjZFVTsWhZKOwHmxV4Rr5agQx3iPB6xJn+S4JdwwfS4hJkQqz?=
 =?us-ascii?Q?t5wTPKcYzoYX5HncOGyPRwuTrRyL5ybSrH2uUwCGEBFREukq4uPV00OG1TQ0?=
 =?us-ascii?Q?wawnzfGLcMDNEvog0Tu9Io7kuvSNYavPAE5mC89tpHt9PZWk2dxqcrv39Fz0?=
 =?us-ascii?Q?ijBdMJoWMIccMH+H/N2VlTemh2CayYjYL4Fd7nJwtxm+QUpAPA+t3pfSBo95?=
 =?us-ascii?Q?NifxCtdyQ+zG/b+ZmSzQ7BMpx5B36JvnnYgenMuXf/iOCgGQ/LjRMzSJxLhb?=
 =?us-ascii?Q?2yJ5YBaMD2bDXlLqpYlM/eXzNUzVezmEJoMNvSaMRw4sO6m+wBbvv1xSmIxI?=
 =?us-ascii?Q?XPtuwZ/Zw+bdm2gEmQYVIinL0xUdfOrRjcPvFnnX1tZbDoCN8jNPGs9fZwdj?=
 =?us-ascii?Q?cn4pTLbkOiopZzEdZNgWqkFpV5nlETkGBTv/J76jEYnDA36ElNc2wbjcaoSU?=
 =?us-ascii?Q?aTZ/3y6QCSCLhxVQSqN+DKy3s8aG8tz3aymPzpY2nLYVasoUYyl0IqKKCx7s?=
 =?us-ascii?Q?e08OQv9kyaaKqnhCVZ+aB6woJW3puvLOlj5Nes7p2zwhJdXoErtfaQessHL3?=
 =?us-ascii?Q?lr24RiLVmjOhEalvQ95sGK0neN6QtF1FVt0nCum4cDlguosKnfs9tD5pKWj6?=
 =?us-ascii?Q?GhSM8UcjXX/OjgWtQ/MPqRTG/PhGP32wZP4Xvc/MB3AzE0Qs7t6DDWECu0gO?=
 =?us-ascii?Q?ELcaZyw89ErQseYX9wUPc7brgAaBDlAG3i0dkMc6RHCKTVyolP/Vvz/u30T5?=
 =?us-ascii?Q?S2ve//ysRgqnJ/83w0l81jfk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c244ee0c-f531-4d64-d454-08d934b5e714
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 13:10:11.9033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C7vlnbCm8vvveB1/HYax1lofIPkwIpB8c9DVFS35+sp7NtITFhdB/Nj7ps/YCZlDe2c6fDxeRTeczm7o0w0K4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=swee.aun.khor@intel.com; helo=mga04.intel.com
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
Cc: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eblake@redhat.com" <eblake@redhat.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerg and Markus,

Hmm, right, nothing obvious at https://developer.gnome.org/gtk3/stable/GtkW=
indow.html for the non-full-screen case.

Nevertheless the options should have sane semantics.  We could:

  (1) Require full-screen=3Don in addition to monitor=3D<nr>.
      That would leave the door open to implement the full-screen=3Doff
      case later if we figure some way to do that.
  (2) Rename the option to full-screen-on-monitor, to make clear this
      automatically enables fullscreen too.

sweeaun:  Alright, I would opt for option 2 in this case. Thanks for the fe=
edback from you and Markus , I shall rework all the feedbacks for the v3.  =
=20

Regards,
SweeAun

-----Original Message-----
From: Gerd Hoffmann <kraxel@redhat.com>=20
Sent: Monday, June 21, 2021 7:15 PM
To: Khor, Swee Aun <swee.aun.khor@intel.com>
Cc: Romli, Khairul Anuar <khairul.anuar.romli@intel.com>; Kasireddy, Vivek =
<vivek.kasireddy@intel.com>; eblake@redhat.com; Markus Armbruster <armbru@r=
edhat.com>; qemu-devel@nongnu.org
Subject: Re: [PATCH v2] ui/gtk: Allow user to select monitor number to disp=
lay qemu in full screen through new gtk display option

  Hi,

> Well, wouldn't it make sense to have monitor=3D<nr> work for both full-sc=
reen=3Don and full-screen=3Doff cases?
> sweeaun:  Yes. That will be better option for user. However, I not manage=
d to find other GTK window API that can set window into monitor rather than=
 gtk_window_fullscreen_on_monitor so far.   =20

Hmm, right, nothing obvious at https://developer.gnome.org/gtk3/stable/GtkW=
indow.html for the non-full-screen case.

Nevertheless the options should have sane semantics.  We could:

  (1) Require full-screen=3Don in addition to monitor=3D<nr>.
      That would leave the door open to implement the full-screen=3Doff
      case later if we figure some way to do that.
  (2) Rename the option to full-screen-on-monitor, to make clear this
      automatically enables fullscreen too.

take care,
  Gerd


