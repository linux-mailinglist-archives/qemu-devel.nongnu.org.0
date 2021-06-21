Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2283AE5AF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:12:00 +0200 (CEST)
Received: from localhost ([::1]:34542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFyJ-0005y8-Vw
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lvFx8-0004Sj-9R
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:10:46 -0400
Received: from mga09.intel.com ([134.134.136.24]:15734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lvFx3-0000x0-Ao
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:10:45 -0400
IronPort-SDR: wMZfRp+4XFp7C7VPXbEBIJVwim3qPoeK0UBN+8Kzuqe0P1sIZIzIHQO7A9WHg0+qsZWBA5Ps9G
 jcvbtkgsc38g==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="206753553"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="206753553"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 02:10:35 -0700
IronPort-SDR: a45dUEifi9NGZmwpYksF845g9pejtTWQ3EB83nkhhvWkh58A0xzWMu5ogpfzmbiTCQlNhNw1Se
 ppyvx14LI42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="417010013"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 21 Jun 2021 02:10:34 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 21 Jun 2021 02:10:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 21 Jun 2021 02:10:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 21 Jun 2021 02:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeRg6J5Ea1WptLWhW8fQ4Ujeg2y7cp6sx0U2eeo3l/Wk/qDVwxac5M1x7Jc0iMkzg+cjln0l7yGKX7D2Kh4aJRoLdz5bn/mK+WPYzif762nMVwhqjeEJ1G76idc/iElwJdAf/2Wvg+MibP/iBiRejhP92PTXj3bPg3Ql6BTQ7nPpGMVUEJzHCdo3SBqRKFEMZp953skwCgYRmQ8QEJtxnQGh3WfuxSkdDan17iA5jKL7Dr8EmchukbNEO8fxNQoQxM3HsJh2Ta9IKfoK4mAL3Q8OEWUbevoRBkdHKjrt4Yag7jjRtMej4BFIFSx3jIZXwCLnpfUxBU+ZT3uKgtioYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgHq+MRALyu6WLd3/j9W6u/bKVf/8v9gtAj+ZqGFPgk=;
 b=Fka9PDvDmi0D3rfZBGaSIhIDdUT3LMkqbQGM1NjjggQN2jtRszK9K9uboJLET3ttxiw4ej+uzaRMTcCkh8S8G6gOvEsG70UUgNFpwy5eavLOyh5D903CJJy+ktsyztG7KSUS8bwNUn2/ZWHcuSRNBeiy3zFOplXEbslhqEblqNHjc03PlPIT8z/M7owLy/dVIH6dw/u3oC/NOTpPJJKedmRcyYBHI4CDvQ6WW/HLXOqp/Z01BvObvyOri/RIk0lwWaAHWuC9ugB5h54KA5euGNKZSzFiYk1oyXQpEygx57tW1IxmYEPayv7OPka85Ci1O1SZc9OEAiyn6J7G300SOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgHq+MRALyu6WLd3/j9W6u/bKVf/8v9gtAj+ZqGFPgk=;
 b=AG+tu8uCX+o+gy1/aPdG8WYedJSrAEPuytcdIxYpcMv5m4ZVg5S/kXb2eWtSeRrFzwY5r8bQIOWgthvRgtIAVAJdCjPHvX1ZuVjWaQtbHXwEGvS8+wOg4soC+3H2KOpDFyq6nn5piOibO4lpe+2zQiUBtD5rLJ7A9PyCdzCZmWc=
Received: from DM8PR11MB5717.namprd11.prod.outlook.com (2603:10b6:8:30::9) by
 DM5PR11MB1867.namprd11.prod.outlook.com (2603:10b6:3:10c::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21; Mon, 21 Jun 2021 09:10:31 +0000
Received: from DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1]) by DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:10:31 +0000
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH v2] ui/gtk: Allow user to select monitor number to display
 qemu in full screen through new gtk display option
Thread-Topic: [PATCH v2] ui/gtk: Allow user to select monitor number to
 display qemu in full screen through new gtk display option
Thread-Index: AQHXZDIfHJcen+WIR0WYeKfsyBDVzasZtNJAgARWmQCAABuxTYAABWQA
Date: Mon, 21 Jun 2021 09:10:31 +0000
Message-ID: <DM8PR11MB5717563AFEEE02496E3F9803AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
References: <20210617020609.18089-1-swee.aun.khor@intel.com>
 <8735tfsa79.fsf@dusky.pond.sub.org>
 <DM8PR11MB571712EDA6522BB50D192A63AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
 <20210621065148.o7yggutrxgvdnpc7@sirius.home.kraxel.org>
 <875yy739hv.fsf@dusky.pond.sub.org>
In-Reply-To: <875yy739hv.fsf@dusky.pond.sub.org>
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
x-ms-office365-filtering-correlation-id: 0d96d413-38b0-4890-efd1-08d934946bcc
x-ms-traffictypediagnostic: DM5PR11MB1867:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1867C0B2682ABD3AF1DC73B9AF0A9@DM5PR11MB1867.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E7zuHzgmLWv1TJXdTzWazoXs89Gnq3zl6FTer+jLQlupR1DO9nLAPX2+pIEmnAr5h/IrlYwVgGWpfimxXcxorzuqTJo0oOmLe605F7r74mS77DpUcY1zDZDxZhPYnOomcZqkfsaWLwI+QRw4FMFe5MYAX6d77WX+Dk/U1rLOd0MF7di1ryKM4WU0nMSTvp3JxImnTwT0o2ECihkTV3ma4BONk8cHvYAD6Ep/v3pZi0f9rj7ABz+uIgAijpKJfdWu9/2n7UUiXH4CbTuperIKzS+y8TUFJAlE9RuHcV5Oacu32IBk7v74j30sUT0MygXjZAxSG6byPX7S2mpV9JqprEvxHLCFWkTn6E+6TETYY2jEA3bYL6FPUGp+a8PjMhuE3BfR4mRXD1nK5o9ysanz8Xg2ulE52j3PPTVOJTE8cIMCdWXA7ogAvJ3YjMOkeNLWLcneu1ORzbuNUYVCyV9wRCiIK+GuHA1nW9/ogJOtNbuPrOCVjPVMBLqdKHrxdeNmJuj0Sol/zbL/uC7zGy/gn5sijUXsyVsoOkLir9OfcxBLK63ecLQ8D6OqMG9B8xfSTkpbhQBlhfClX89ioB86lqI2rI1L8QtwcLAbJoA0PM4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(346002)(376002)(136003)(66446008)(76116006)(64756008)(66476007)(66556008)(66946007)(2906002)(5660300002)(86362001)(52536014)(53546011)(33656002)(4326008)(6506007)(7696005)(186003)(9686003)(54906003)(8676002)(478600001)(316002)(8936002)(38100700002)(55016002)(110136005)(71200400001)(122000001)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gR8xACfezgtTMXGJcu91PsU8Dwz+1GsarGH3tySphpNRoI7Zb5D36CCYawcw?=
 =?us-ascii?Q?MjVmJ9vvyvbiwwJnJPsHh+NAF2vmiy4elkqkRj9VdpsjceywXtCVOCU6tk8x?=
 =?us-ascii?Q?FQceSqnQT4j1SqQ0khaZHun65JPSc3FgWvTVlg6NNcgwkOQFEk8U3v2KR3oT?=
 =?us-ascii?Q?xBLp7WyJyn9Vg/7bP2QiguNBqwEX30mRdAaYbrHSIRuTxs0a/hFG4d9enXJb?=
 =?us-ascii?Q?EiJAvnZ0PYrXu32aiILT6w3rUC0FbMc+ZGtem8lXr8ab3OEirvP+wboNWHl4?=
 =?us-ascii?Q?omrcAeDJCJi6RFh+VPUaCrk3YuaFLFWH3l6QF/BbwQ6pwznRYXb0q1/UahW9?=
 =?us-ascii?Q?GN7QIow91xwd/xrveHradmYXLc7uaLey6nF00TZ/tbbObAlL7c7aqq9daPJG?=
 =?us-ascii?Q?icLrQsBKhQ1VLcw8ixQZvtmlrnL+qnR/LY4nNZ9rAgx322xmjWxC28nw4nhs?=
 =?us-ascii?Q?RwU8KcLLE0p8TCEhaOdVKZ9UJPh7qNBTgj1V0PA9glVC6JkYKxOi52Gtjy6V?=
 =?us-ascii?Q?7VP4llxmhCDN6cWK/qhvGCOeIUxWTWoivoeyhaYqOekUjfdrFLbdWbGRhnF5?=
 =?us-ascii?Q?/tBBVQIr0Hi6TbTFWGoA5LPE2hrGESniNykjXF+e3IoNgYgAOKLg1SyQsdGk?=
 =?us-ascii?Q?xSTHIcOra7dwnybcZLVp6ZwooSWz1nBZrWieQCt1YwTkmNZjaUMgDTI5CSoD?=
 =?us-ascii?Q?ykyaYEeic9pLA6g5AxhXjIoVD0kE7SVuLuw1KneKRe+uDpW4seheaZ3V30ob?=
 =?us-ascii?Q?f99ssol40eWFpiroTE8/8S9UxBlwSz2es37GPDqbkCCSMkkEI1PSPP0jBBSQ?=
 =?us-ascii?Q?bMnCFeNY7nI2htlxscyLdlTHNXOHoQFKTFW5lUks8F0GirKxKFyzt9AFQkGs?=
 =?us-ascii?Q?qfviEaO5I+08k698y2f84TQp4hYotK4mCHL/3ybMffdfo0Zy1Hw0D3kF/xqB?=
 =?us-ascii?Q?0kO9Jm788cwLiN14nFLE1qs1iT59FqzqjmwxglDl/owLwVAMRXf5MDFA7+Op?=
 =?us-ascii?Q?JeaZ6eBH9N5Ah7GHgDvn60BQUxguvfF5nFBkAdpAIc586tzE8CnXCIDeBns0?=
 =?us-ascii?Q?wkxskUM3KKU4mXDaSnIf1fuDx0YOmWMlOK7ItySH0Z0zkTaMoeZ/IfBWhgEn?=
 =?us-ascii?Q?+GHCtV45TQ5d+Dwg1ZOPflNz0ar28vS8sWYgHneQBfNA9qH7b63I/S3R6Pje?=
 =?us-ascii?Q?NLWl8tvF33Ri7TeaABndLaYYLRTBMsrUwyj3T8iMgAzedntuqx6O4CB1wa4Z?=
 =?us-ascii?Q?/DkUmy60cgCyEBRlkUqZt2/vd4E32CTUVYNsUaRjZVhs5H66M/RMd+9hP3bw?=
 =?us-ascii?Q?NxgGPNodWQM2SZMIvxOJKkvQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d96d413-38b0-4890-efd1-08d934946bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 09:10:31.7276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFmmG9b/Gwf8jOP7dYgrqcW3c3VgE2bxC7p2FwOtvMUCdh6JVF//kZ7jtNcQ2KjX6lKCqJin1wfMRQPA6X2MQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1867
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=swee.aun.khor@intel.com; helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 "eblake@redhat.com" <eblake@redhat.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> sweeaun: Based on my observation, when specific monitor device disconnec=
ted after QEMU launched on it, QEMU application will not be visible but QEM=
U application still running and screen framebuffer size is not being change=
d at all. QEMU application will be visible once you connect back the monito=
r.=20
>
> Well, that probably depends on the display server and might even be=20
> configurable.  I've seen different ways to handle that, most common=20
> ones being (a) do nothing or (b) trying move all windows to the=20
> monitor which is still connected.
>
> I don't think qemu has to worry much here, and trying to automatically=20
> adapt to hot-plugged monitors might even have bad interactions with=20
> whatever the display server is going to do.

I'm concerned there is a TOCTTOU issue:

    if (opts->u.gtk.has_monitor) {
        int n_monitor;
1.      n_monitor =3D gdk_display_get_n_monitors(window_display);

2.      if ((opts->u.gtk.monitor <=3D n_monitor) &&
            (opts->u.gtk.monitor > 0)) {
            GdkScreen *gdk_screen;
            gdk_screen =3D gdk_display_get_default_screen(window_display);
3.          gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window), gdk_scr=
een,
                                             (opts->u.gtk.monitor - 1));
        } else {
            fprintf(stderr, "Invalid GTK monitor argument\n");
        }
    }

If monitors can go at any time, then the check 2. cannot ensure we pass a v=
alid monitor number at 3.

I asked what happens when we pass an invalid monitor number.  I'm not sure =
I understand sweeaun's answer.

If what happens is sane, then why have check 2.?

sweeaun: Sorry, I misunderstood your question, I thought your question is a=
bout what happened if monitor disconnected after the QEMU launched.
You are right, monitor could be disconnected in between 1 and 3. If invalid=
 monitor passed into gtk_window_fullscreen_on_monitor then QEMU window will=
 just be launched as normal without full screen and not the monitor that us=
er specify.  I should check whether full screen has been successful taken i=
n place since gtk_window_fullscreen_on_monitor function always return void.=
 =20

Regards,
SweeAun

-----Original Message-----
From: Markus Armbruster <armbru@redhat.com>=20
Sent: Monday, June 21, 2021 4:31 PM
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Khor, Swee Aun <swee.aun.khor@intel.com>; Romli, Khairul Anuar <khairul=
.anuar.romli@intel.com>; Kasireddy, Vivek <vivek.kasireddy@intel.com>; ebla=
ke@redhat.com; qemu-devel@nongnu.org
Subject: Re: [PATCH v2] ui/gtk: Allow user to select monitor number to disp=
lay qemu in full screen through new gtk display option

Gerd Hoffmann <kraxel@redhat.com> writes:


[...]

>> sweeaun: Based on my observation, when specific monitor device disconnec=
ted after QEMU launched on it, QEMU application will not be visible but QEM=
U application still running and screen framebuffer size is not being change=
d at all. QEMU application will be visible once you connect back the monito=
r.=20
>
> Well, that probably depends on the display server and might even be=20
> configurable.  I've seen different ways to handle that, most common=20
> ones being (a) do nothing or (b) trying move all windows to the=20
> monitor which is still connected.
>
> I don't think qemu has to worry much here, and trying to automatically=20
> adapt to hot-plugged monitors might even have bad interactions with=20
> whatever the display server is going to do.

I'm concerned there is a TOCTTOU issue:

    if (opts->u.gtk.has_monitor) {
        int n_monitor;
1.      n_monitor =3D gdk_display_get_n_monitors(window_display);

2.      if ((opts->u.gtk.monitor <=3D n_monitor) &&
            (opts->u.gtk.monitor > 0)) {
            GdkScreen *gdk_screen;
            gdk_screen =3D gdk_display_get_default_screen(window_display);
3.          gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window), gdk_scr=
een,
                                             (opts->u.gtk.monitor - 1));
        } else {
            fprintf(stderr, "Invalid GTK monitor argument\n");
        }
    }

If monitors can go at any time, then the check 2. cannot ensure we pass a v=
alid monitor number at 3.

I asked what happens when we pass an invalid monitor number.  I'm not sure =
I understand sweeaun's answer.

If what happens is sane, then why have check 2.?


