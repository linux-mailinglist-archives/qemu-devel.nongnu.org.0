Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B96D3B245D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 02:58:07 +0200 (CEST)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwDh0-0001FA-64
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 20:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lwDfi-00005S-6W
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 20:56:47 -0400
Received: from mga12.intel.com ([192.55.52.136]:19194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lwDfe-0005bX-KV
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 20:56:45 -0400
IronPort-SDR: EeRHkVeSpn2caIbEq51aIvW/geMJXgv3Jvc+3JoCeaRNFQLo0K6ktE7nDbFgFUqKWyCjpnzsNU
 VtSY4kxLE3qg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="187059204"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="187059204"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 17:56:30 -0700
IronPort-SDR: w0QZU6c33FdOZKPVTgBMyPmcY7aWw6KFqJWDjJiDI51LPBa0x5jjn3vRCcKA5SDOH/UaulbPTK
 ZLrkH9TthgPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="453221747"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 23 Jun 2021 17:56:30 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 17:56:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 23 Jun 2021 17:56:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 23 Jun 2021 17:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCwFoXG3uIcA0CWcFKHi3u+UkvuhPs85NUqU+WxuUeuDC7zrcNsBoGjlKxD7rMTzIpxpqpUe7frleXJ2bIBGtR3G9CO5VMQQTJIuo6KFat/+hEnBee6zIgODcK4YSyNkANlW6RGXZKk4V+/qLNBfeki26xFUV/nC29koVnLeSCY4nmdwuksBEneeULjRIF1WaC/CPNc95WRoh4adgCPsRCYhLtY7+mZs0vs1e7TwGr3dXVGVtAzOu5iqv4APAoB9P9C6kpcfDlnf9yj7XN9PrUtpyZSdm5vePEicwpspvCLSjxb9FO64LIvTgLirE7ENInWNwXHPJlV1/HOvI22/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U87X8B62qE4l8Wbc4ZrQe9S+IAejG3wOJjPMG6g7L6E=;
 b=DhoOS99daVQ9LbJm0v0D6nPhjB94gS0j26JpX/A2iLfn9m+JIjkv5yxgsC2fs8kS7vUM86RbLrRsOt4OQL1UAqTqpwp5DGpmsyrbD6EjPQbY//VkCKF9+CdqL1gN0tSpnBX3P+vJST3h1FZGo1DDiXA8XcsXawKJZUbvcyuHqHlvof/naJ5SJKFxhxkej0Iz6CLJ/PQjfoSzdskSicmZSRbn+AbysKmQERxDkeEN5JzK5NutIhOj795el15UBc4Jj0Bf+r6nobDqbbCzOKeWLhQzY5XcpP6HNRpr32ByB3MWeh/n1mTajA14ltJ48Tg+QLZg4b34o1yS/nmZaYx04Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U87X8B62qE4l8Wbc4ZrQe9S+IAejG3wOJjPMG6g7L6E=;
 b=Glah1AgekjYNWbrzqbqiuQeiTe4HF4dOgoqOJAdaikWoBQLUVNSWVs4YaF3WXp86EVJK0xuslw9McIuSF6xc0gL3LNzrtuYMCf9wrNlK72nCAau5nZpV4zimSjahC6Rx9+yjN4PR8DqcnrxCRSu5IxQQqUNAZP0R/4TzughMpjU=
Received: from DM8PR11MB5717.namprd11.prod.outlook.com (2603:10b6:8:30::9) by
 DM6PR11MB3979.namprd11.prod.outlook.com (2603:10b6:5:197::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18; Thu, 24 Jun 2021 00:56:28 +0000
Received: from DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1]) by DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1%8]) with mapi id 15.20.4264.019; Thu, 24 Jun 2021
 00:56:28 +0000
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v3] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Thread-Topic: [PATCH v3] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Thread-Index: AQHXaAzS8sVU8+VI/U61LH6XCKK/N6shh/GAgADI9CA=
Date: Thu, 24 Jun 2021 00:56:28 +0000
Message-ID: <DM8PR11MB571751EF8FB44E601757843AAF079@DM8PR11MB5717.namprd11.prod.outlook.com>
References: <20210623082744.24421-1-swee.aun.khor@intel.com>
 <20210623123351.irmwdawwktbvkdsb@sirius.home.kraxel.org>
In-Reply-To: <20210623123351.irmwdawwktbvkdsb@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [14.192.215.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df891a31-0583-47a0-e539-08d936aae614
x-ms-traffictypediagnostic: DM6PR11MB3979:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB397983500B1F788EB5D63235AF079@DM6PR11MB3979.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZF5cua6rm7MQZcB2iVezNQF5tT+E5+uZM/DnLnytvIH6Vo0V8LyoHbuCVY8bp0M3vd7m7odd0GSLDcQ2Za5nxxy+VF/amrHzqbp7tHx7OhjK81/9iABsGMukq6EHb9Hgd5blj8PL3v2Vj/JNDIHfqvXkTnXsMWWsEiYhq3hpw45LmSwu+CkW5nCERK22Fd1+JimdmitpSFBjWkmZf/m5mENzgAYys0z3zA8VjlkK9A/oW0OtJGoCrc92SjgKD3JFU9K8l1BgAzg/WjsNMQl8BYzMaFZf3jEAhHaTTp9opG9vgoW+5EEAw1u40ITGKcyXoY4pCnkmobYjxFmwEg24c7NPjEQ3IPr6jorbkBtxCrSGS2IdJawErOD68odInWC1fSbOL6gbT1OhMFamCy5pHEBuVmXzBvurk14jqP9bKSIf7gZkxCcdlJhH/LqTYSd0VpdC+h2wGK0YyiqbBgRvcab/hs8cYeVXhYHP3KwBq0Oobe+Kz4W0pAiM/eHksde7fzaSzZxIQX08AbmxfJ7a+AlWSJLiGfUvUDLbUg0a85t2k/+vLlLc+j9YkRcRdw5Ebv4T5dZf1Dv2MrbSivY8/FDErQm0Wx77ggvowy7/5D4tAORVX73Nf+6wJFVqE1LyTPKnRm8e/o2mKxKZRL5KE2n0ei5tGjdS2X/KFWNUDODqM7reVxQeAMcPA3Iw945idBlvj2GyDwYLZNzY/ZgL9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(136003)(346002)(366004)(396003)(107886003)(55016002)(26005)(8936002)(186003)(33656002)(53546011)(6506007)(38100700002)(9686003)(316002)(4326008)(8676002)(76116006)(7696005)(122000001)(54906003)(2906002)(52536014)(66946007)(66556008)(83380400001)(6916009)(966005)(478600001)(64756008)(66446008)(66476007)(86362001)(71200400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cj36z5q8Xkh84TH3HbpqG3DvID1Lzhd66+8tCuLyWJ9DrcLPwFX5RQ54zphe?=
 =?us-ascii?Q?RQDmg73zDXhCBUUoUdgYiwlLWrpShgcjxs0NP3N6+mYWPIVfFbSZn+Bmh76C?=
 =?us-ascii?Q?hq/sjoRuZjN7WAGFMmbi/qxz+pqiyw/XhbKf5crwk9WHjWKUh4XLAdg85CJH?=
 =?us-ascii?Q?5rmTcyOpV8ZGrwRqGIqkIsG46Y2UJvZczLNruaajrVUq9esUxW2/Znxo8F1f?=
 =?us-ascii?Q?ff9mY0slJOuCY9siI8hFmEClT3+x6icoLxht2ai815CLvocSTkgktv9LFQ6q?=
 =?us-ascii?Q?n7KztC+dwxfsg4NTQBFrZdEOzovYWeZk+aUdENF6WN1Z7PK2sMYrFmOf44lg?=
 =?us-ascii?Q?7F4mOXRjKDL2CLb40ZvEmc5+ypOEZniwLMWs89Nhzab8oqPo3h5KgzEJfo1x?=
 =?us-ascii?Q?wL2LSjPcIVcegaeQ3RdRkWDIZZr+6GRe8WvQhROHmI0iWs8OZZLB1bCSg32L?=
 =?us-ascii?Q?ws6DbfbDwuOm8YOQ4xI42sKk8zgGGYqK3N5/vVN7qgTSyAsje13byXbmNxwN?=
 =?us-ascii?Q?Mf65/Dk81Hqy307XE/7leLM3uUn99oAMWWsNI2mjuBbBR54rxxf9aN/gkdrQ?=
 =?us-ascii?Q?fTxtqOzmAtYPUCtWozxE0tmMNGxMf6ZJd/Ip3kNP7v+jfW5U/Clm3KmoHEM1?=
 =?us-ascii?Q?DSy4DaNimmbKkDo0wR8Vgy5GnLPVtBccgw0okHyjrP4domQpCH2/T87wmBO+?=
 =?us-ascii?Q?Sq4Ee3oIAHNnAze4bIAu3msNHknYnsrTLXAQQUMVnEdnMozaNpEFCx//w3W9?=
 =?us-ascii?Q?XEYleq8oMCWUXJOxTuJeR+AdH0gXVjkpqnicUHtLtDhCLg+dSNt38xCAVsMM?=
 =?us-ascii?Q?YslU1Fc16HadiJqsPTvGxZWa0V/GKYL/UvhQzMLVvksdEMlGfyVk+fSphBuR?=
 =?us-ascii?Q?2pl6kVL+jQIAxha+c+ptqlJQp3RMnh2bQiSEQ9W8fYubPf8f6bVpF01GT+7/?=
 =?us-ascii?Q?Xx47OvuiDq/IZ3mT3q7crMaXDUS/FPQ9hWj9NyUEtosXZ6EFa/bILWwIgJnw?=
 =?us-ascii?Q?k8ir0ziXIuhRsHonLHGvHOq3gSQ4RteMN2jKRdE2OO3+vDDxtHbfbpYKSky4?=
 =?us-ascii?Q?VI+j4oJTBel2VaQ88g5pu9SslJNotwvMsNvchihf8IuynRS+8rII4IHb8LmI?=
 =?us-ascii?Q?aYoeqDP2nutEHZ0GVrfkq7kYe4OV9FcANY6YxWJNvH7Y4uVRUgdjALooXwjd?=
 =?us-ascii?Q?JVRdS4rKK3TI+AVNvBIB0o90n4ncohDPUq051ay5g0E8GTTVmGnX8ND/Z0Pj?=
 =?us-ascii?Q?lrzgK+iMH4jljnqAnluvc4aoJD8/hjx8FpiODavHCiZ/KsfWY/ca3yEKCPfK?=
 =?us-ascii?Q?XLDh0/XRAngxEufoZemnlfUT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df891a31-0583-47a0-e539-08d936aae614
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 00:56:28.1577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01ZDOI2pVC0nNF2sv/tL+iBUBPgJjROm41s0xYdDK4B7MojpijlcqgBKyBK5dIivD/wgHczJXCVoJucuYPhQUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3979
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=swee.aun.khor@intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>, "Khor,
 Swee Aun" <swee.aun.khor@intel.com>, "Mazlan,
 Hazwan Arif" <hazwan.arif.mazlan@intel.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,
I am able to compile the code without error with my v3 patch. I don't see m=
y patch showing up in https://patchew.org/QEMU/ , is it due to this compila=
tion error?

I tried to change from %ld -> %lld but I encountered compilation error this=
 time.=20

../ui/gtk.c: In function 'gtk_display_init':
../ui/gtk.c:2300:25: error: format '%lld' expects argument of type 'long lo=
ng int', but argument 2 has type 'int64_t' {aka 'long int'} [-Werror=3Dform=
at=3D]
 2300 |             warn_report("Failed to enable full screen on monitor %l=
ld. "
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
......
 2303 |                         opts->u.gtk.full_screen_on_monitor, monitor=
_n);
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                    |
      |                                    int64_t {aka long int}
cc1: all warnings being treated as errors

Suspect it is due to variants of host machine, I think I will change it to =
use PRId64 which is more generic for all platform like below. What you thin=
k?=20
warn_report("Failed to enable full screen on monitor %" PRId64 ". "
                        "Current total number of monitors is %d, "
                        "please verify full-screen-on-monitor option value.=
",
                        opts->u.gtk.full_screen_on_monitor, monitor_n);

or you prefer casting ? This seems working as well.=20
warn_report("Failed to enable full screen on monitor %lld . "
                        "Current total number of monitors is %d, "
                        "please verify full-screen-on-monitor option value.=
",
                        (long long)opts->u.gtk.full_screen_on_monitor, moni=
tor_n);

Regards,
SweeAun

-----Original Message-----
From: Gerd Hoffmann <kraxel@redhat.com>=20
Sent: Wednesday, June 23, 2021 8:34 PM
To: Khor, Swee Aun <swee.aun.khor@intel.com>
Cc: qemu-devel@nongnu.org; armbru@redhat.com; eblake@redhat.com; Romli, Kha=
irul Anuar <khairul.anuar.romli@intel.com>; Kasireddy, Vivek <vivek.kasired=
dy@intel.com>; Mazlan, Hazwan Arif <hazwan.arif.mazlan@intel.com>; Khor@sir=
ius.home.kraxel.org
Subject: Re: [PATCH v3] ui/gtk: New -display gtk option 'full-screen-on-mon=
itor'.

On Wed, Jun 23, 2021 at 04:27:44PM +0800, Khor, Swee Aun wrote:
> This lets user select monitor number to display QEMU in full screen=20
> with -display gtk,full-screen-on-monitor=3D<value>.

../../ui/gtk.c: In function 'gtk_display_init':
../../ui/gtk.c:2300:25: error: format '%ld' expects argument of type 'long =
int', but argument 2 has type 'int64_t' {aka 'long long int'} [-Werror=3Dfo=
rmat=3D]
 2300 |             warn_report("Failed to enable full screen on monitor %l=
d. "
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
......
 2303 |                         opts->u.gtk.full_screen_on_monitor, monitor=
_n);
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                    |
      |                                    int64_t {aka long long int}

take care,
  Gerd


