Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C7C3B2ACB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:52:53 +0200 (CEST)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwL6S-00031z-Ie
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lwL5Z-0002LJ-Jz
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:51:57 -0400
Received: from mga04.intel.com ([192.55.52.120]:7757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lwL5W-00007e-OS
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:51:56 -0400
IronPort-SDR: 5FwAGAvUP1r6g1dkxqpG2JWyYH9UZra35JDIiyiI/qeddh+5AhxWKWlJoYrtwn1aOiL1zm5LaO
 J3tC0UCLxqKQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="205602405"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="205602405"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 01:51:46 -0700
IronPort-SDR: gLA0+OS5sRFM2O0Q0tSWmJZENxs2tWmQEKKqbCTbzyFEYsHyn4Q4Lrq7ch67PezxAryQH7wK5+
 5gcOZv4V+LiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="453348531"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 24 Jun 2021 01:51:45 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 01:51:45 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 01:51:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Thu, 24 Jun 2021 01:51:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Thu, 24 Jun 2021 01:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1cC7KhAkcnpj5aLyYNp+kdMfGLcap1MdbhbHMsXqvPP/zPqhhmoxBcVdPiirMSr0ZWT9m3WdZ/Sn9glAPTjmW72nA62dj5BCxaeY0bo8SXguticcSEw9Q25QLC1segNMCijmKVDn6/vYOUnSMIbxBAPuowOJBRx3RUThovUnrzw+OJF7XllgLDSoPZ1DVj9AxiDIWuyrr12P8cwHBcL7OnuR2J4E0CSKi6F97k9cfIRnKEt9x3R4B8sDJXQcAqsroW8DJkuBunCKxOHt0gDh3j6doEVSbjad0Cly/UYQfhJuebab5SnUV1yilD9Bdc0zJ1GJ7aENNREvTOzJGVzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mecaz6gqOWk2Mp/qDTyroDIXYiIvdZJCHgfmYZXZw7g=;
 b=DAxxi1BEGweEh677cidtEaVObswbrYwDyLy9U6CAU9m2mNYIF+ykbmZDumUT7j+wjZXVA6niMt5nzeUASJwtKTW96+uxEIlNT0gsLq3nr5QSVS5/s9mr7PcuKrtTOUfV2S8GKUydOqqgDaytlBk8vaGBEJs2jMRd2NzJ+FGC9tYccq8VuJLJ/lPjhXMfHobOfJPwr0WuZZDCT8cNORXjnKPzTVq7vUKvN5nxLzgE81GoiHgMiaW/O1Fh9o049/zY+uEk5hH3KabeemQRmqMrJT6Hlt1akEOJq8JYjdgtEpl1Oeaf+yxA27UFENZSu9kEWCM5xo9s5f2PVYrfhpKz8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mecaz6gqOWk2Mp/qDTyroDIXYiIvdZJCHgfmYZXZw7g=;
 b=jNj6PlsSnofboXcGo5jXo+Vu1EjjIUIAWluurLLAFbqq21i5iNW6HjPG3kWNHKnpgec1lx+Wz4UEBNUdyWvQty8Osg4m+Bw7JKAbvFMPs6DvmZdu+nGVcZJrkkx6ZH7G7Ubu5dZ7uvEw/G/uwI9GkfYC85P8YSy30RgglVifito=
Received: from DM8PR11MB5717.namprd11.prod.outlook.com (2603:10b6:8:30::9) by
 DM6PR11MB3052.namprd11.prod.outlook.com (2603:10b6:5:69::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.22; Thu, 24 Jun 2021 08:51:43 +0000
Received: from DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1]) by DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1%8]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 08:51:43 +0000
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v3] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Thread-Topic: [PATCH v3] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Thread-Index: AQHXaAzS8sVU8+VI/U61LH6XCKK/N6shh/GAgADI9CCAAIpxAIAAAIQg
Date: Thu, 24 Jun 2021 08:51:43 +0000
Message-ID: <DM8PR11MB5717679971B7C2BBEA2E2011AF079@DM8PR11MB5717.namprd11.prod.outlook.com>
References: <20210623082744.24421-1-swee.aun.khor@intel.com>
 <20210623123351.irmwdawwktbvkdsb@sirius.home.kraxel.org>
 <DM8PR11MB571751EF8FB44E601757843AAF079@DM8PR11MB5717.namprd11.prod.outlook.com>
 <20210624084836.4hwtq7i2p2cwcg7z@sirius.home.kraxel.org>
In-Reply-To: <20210624084836.4hwtq7i2p2cwcg7z@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94fb8f76-edd6-469e-6269-08d936ed4a48
x-ms-traffictypediagnostic: DM6PR11MB3052:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB30522240A276576011DBB392AF079@DM6PR11MB3052.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kh1tasiN1SgwxvjIZluZfhKvPelNtfM7zSl8uTTCWo2xm9SaUljTYnwbvfWtt/nyWPTfaLBS+iB5GdBvfJs4JnvpOjp2wXE6xd/kmDyT9nXpCI11FXeJkWNoQUBcswHSgugeDXroBAa+GCV9vhkPi/+Obe0GDTuIx/+XFJ9d+CY6QpLO9ZhAVioD5lDTcAS1QQW/EWLAmYQqXemWUgGyQ9pXBlLVqgZyQ5KA98lt27Hx4rhi96Im0ddMb3BW6bUzdnVB6WtepaF5M9yRei6Yrbz0aj7ucFqV1iVMnQ8p89yKnUhegqIxAMa3HYpZx0AVqUDRqBwrI8Xn/mf7O1qh9n21zvXPJtbA/xfueaguZhCOOMMhtDsnCg6zAAH3vSwcqxLcoTCpfS4VFYGDbngDW1UGl0FKeB2GSrXsT9VzQH4h7BRTQUZhDJKS3BjoBelswUQqw7PuuLgxwUa8Uf8suJfM4HYh3STWYvw0VWkpImgsZGDGhnlM2Mzt3nWE26yPrNg0NEN6RNmroyHGmpK/PAoc09NvJbBClAAUOCMIe0vciObzenUVaY7TeKY9DmCmzQeclD6U17HfgPQPMoOxxd6FHoZLXsGvQsh41apYG2CQt4TwDYZZgatD4KewRghO2cwoWbMz+GD71MXOpyhDtPmzSf2sYjx901QRBdkx5Fd87cY85dqODdJWGQbUAmvejIL/uuGzGY6WYpkv2eiygw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(136003)(39860400002)(376002)(346002)(66476007)(122000001)(26005)(53546011)(54906003)(5660300002)(2906002)(8936002)(76116006)(52536014)(107886003)(6506007)(6916009)(186003)(38100700002)(478600001)(66946007)(83380400001)(55016002)(9686003)(66446008)(64756008)(8676002)(66556008)(7696005)(71200400001)(33656002)(86362001)(4326008)(316002)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s0XZTlP3bQ+hchE/SPQe4w/aPpt5/VypD2zvv6ErLD5zZf927MKiI3sKV9Vl?=
 =?us-ascii?Q?6aCSXsSACVb0W1Ouh9rhAnMWu8d2/gVTsOcrK7aXZEq3ml/7zzBGCRszse+z?=
 =?us-ascii?Q?llviBIybnQ3+dQftUDQo51bt/IZX6hVYKCJIBitL+SPxfm7bObwtUn9wziyB?=
 =?us-ascii?Q?Ig23tf7VBtL8RQBlduxsrgnScY8eUiEj2crd6VdjC0s5U1cpYMJGfMm2e3rf?=
 =?us-ascii?Q?5CvXggujU6OK7r4KFdWxMTd98HF0xtwrkO/NE8Ppj8YEaD7YM9DQiSBCntfH?=
 =?us-ascii?Q?xzucx6K3pueo9OG+qkWt9yKVFP/OlF3UzGywSjbacec36AYnxzNNV6zEEi40?=
 =?us-ascii?Q?3XpVxhXtvpg5HnD03SMtJr6wkBjJO5pMYmXzJgCMWtK90BOFodf7P9PiwN+k?=
 =?us-ascii?Q?0CbWOb/3IyF+MgOLLkHIEAAbJGbLWAkijjPR8stiikU6Z+lasLjIobQniUCV?=
 =?us-ascii?Q?x6/gnC3uBfJ8dkirAa4Y5s7sBObaXdfMHIe8tZ/vfAuWwstdEKt9xAHpCcA/?=
 =?us-ascii?Q?XJ25nzTJVXTGyckjYV9Sna2wMIhdh2miTGglUmAwZ6ym0PfucH0X7YNNYSvO?=
 =?us-ascii?Q?I1h2Gwo/kA3Gy3p9S6klkEenBp4YYhFWCzW2uAj30YcOF0EyiIPz3jLFdIzC?=
 =?us-ascii?Q?A034ydl44WN3t9eIllRzTXiCgn++K3ZjrIkwd/4eoobOsT5UqEdC4Ruoj2ie?=
 =?us-ascii?Q?7yO9WYmu8UutUqb9uqm5+pL4oLT1d/9vn0jXxIgLlB01/PjtJtEipxD7f3zP?=
 =?us-ascii?Q?1y8qYA+kk3/uIz5WyU1eISBwdEGkmyt1k56aEViytDt7ENOWsAJbjIhi7kQ7?=
 =?us-ascii?Q?k0BKXCTLIndWRfnCiZ8R73v/tqCEvUo0dYucjZ1uDbbG/XAatPvG3uJg6L38?=
 =?us-ascii?Q?1keYnhtVGSv9SSfPVSOhuYo+0WU49Wiobpd1y6LafJj/aUm+Vtyr+ZLiu3JL?=
 =?us-ascii?Q?tVRZpOtvN7GNQXWhPMc6fleuniMKhUpzHA1HSD74eTzSi8cPI/5S8pjH53V0?=
 =?us-ascii?Q?ZbQWCpJqoTXvEfsRSLP1vChJ7V3ydwng0hMdf9aXXApISX4sV3FxzBdDbdaQ?=
 =?us-ascii?Q?EzCRJeZ7S/aqZ90HvXsYMPePSF2LFFX0Wjm+JkCXqWVFSHzzbqalCI5s04Ps?=
 =?us-ascii?Q?5dliB/loglm36ViWyRK5jQZnrYe1tJoFWqU3+74AZYcCqc/LwT1jv5q/dk8Z?=
 =?us-ascii?Q?RKjw4leWbdR3JpKv9Icuw0LOhj/IEmMx1v+LyqxsF8YZEb1oU0e1tpbDaGhL?=
 =?us-ascii?Q?YC58+Pxf1AIE1YskmGDacMg06VpCWd/3lD84iQE9mS9JODfUZ/LE5GekPmg3?=
 =?us-ascii?Q?YAtx1VgHoPvJMK2JwUjMutQq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fb8f76-edd6-469e-6269-08d936ed4a48
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 08:51:43.0365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNH6NMMmZtmtA0dvZs7A3FhMOz40z1gy3JG/lqh1Bm/GFwOr98MEhwaaAuzhtg4hZkHTySkR6vL2P/St7YSJhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3052
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
Cc: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>, "Mazlan,
 Hazwan Arif" <hazwan.arif.mazlan@intel.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Gerd. I will submit another patch using PRId64 In warn_report.=20

Regards,
SweeAun

-----Original Message-----
From: Gerd Hoffmann <kraxel@redhat.com>=20
Sent: Thursday, June 24, 2021 4:49 PM
To: Khor, Swee Aun <swee.aun.khor@intel.com>
Cc: qemu-devel@nongnu.org; armbru@redhat.com; eblake@redhat.com; Romli, Kha=
irul Anuar <khairul.anuar.romli@intel.com>; Kasireddy, Vivek <vivek.kasired=
dy@intel.com>; Mazlan, Hazwan Arif <hazwan.arif.mazlan@intel.com>
Subject: Re: [PATCH v3] ui/gtk: New -display gtk option 'full-screen-on-mon=
itor'.

On Thu, Jun 24, 2021 at 12:56:28AM +0000, Khor, Swee Aun wrote:
> Hi Gerd,
> I am able to compile the code without error with my v3 patch. I don't see=
 my patch showing up in https://patchew.org/QEMU/ , is it due to this compi=
lation error?
>=20
> I tried to change from %ld -> %lld but I encountered compilation error th=
is time.=20
>=20
> ../ui/gtk.c: In function 'gtk_display_init':
> ../ui/gtk.c:2300:25: error: format '%lld' expects argument of type 'long =
long int', but argument 2 has type 'int64_t' {aka 'long int'} [-Werror=3Dfo=
rmat=3D]
>  2300 |             warn_report("Failed to enable full screen on monitor =
%lld. "
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
> ......
>  2303 |                         opts->u.gtk.full_screen_on_monitor, monit=
or_n);
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                    |
>       |                                    int64_t {aka long int}
> cc1: all warnings being treated as errors

stdint.h also has #defines for printing integers (PRI{x,d}{8,16,32,64}), th=
ey make sure the correct format string is used.

PRId64 would be the one for int64_t

take care,
  Gerd


