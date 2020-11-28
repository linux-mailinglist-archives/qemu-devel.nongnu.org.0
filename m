Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9382C6F2C
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Nov 2020 06:53:01 +0100 (CET)
Received: from localhost ([::1]:37090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kitAK-0006rY-5G
	for lists+qemu-devel@lfdr.de; Sat, 28 Nov 2020 00:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1kit8Q-0006EU-SS
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 00:51:02 -0500
Received: from mga07.intel.com ([134.134.136.100]:17242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1kit8N-00089M-EK
 for qemu-devel@nongnu.org; Sat, 28 Nov 2020 00:51:02 -0500
IronPort-SDR: nQS1/fUxZFs5qE/eBDKOqQlJ634GF9rX6Yu8bxBY8VBfjiBfKNVNy5DFtYhTP/AsCFXcNsemPr
 5A6SsjyTkKLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="236587662"
X-IronPort-AV: E=Sophos;i="5.78,376,1599548400"; d="scan'208";a="236587662"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 21:50:50 -0800
IronPort-SDR: mIwg2gsGwUswIxpUNapuZB7Udvsv5UN1Q3xtTn11X4mbmo0I25OhoUTDoG7dQxUZ2pt7xWyehL
 5mB2gJpNVmbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,376,1599548400"; d="scan'208";a="479876003"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 27 Nov 2020 21:50:49 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 27 Nov 2020 21:50:48 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 27 Nov 2020 21:50:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 27 Nov 2020 21:50:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MU1XldOVzd4Fivlg+6u/mFxmtqSjJak2hQ/WFt01hK3bmjGG5Z93sLKEGNaUjmPRY3ENC5LuB64FEDT2SKUPPZ3AeWenFoH9jB2m/H+Jj4SHJkuLQoaSF1jOT0jxLjs1/JIsf9cbMPssYl8Pjp8xmQsXnIfgszD5eWD9tE36A7S9ddYBDp/II0Rq90z8kxP6I+VI/LaOnWYVX8wmLpQ0KDzdOaD3GadO8QYLbLHyVD9K7XtNUP40GroMjiBdfdzDu2PUhqgGu++M6HAPXK//ciHESWk/2eBsRzIzkUjhdDshcQEneWYbKi/uvlUEBsnBZ0sUuBBFeiGlJFeMFlp9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lWRb3sVvQ4GN8vFbqSvypFwMB4x69PKKo2PH6nOOe8=;
 b=SEqWBM43pv1ttS6dy/K1PGRSGuicQlQcTo/wg41iCQCAuaO7L+JuzPsQEIXQPJFzj4HiUdykt6Ztq8QgDN31xDiz11yLDzXnwDtbMkEnotoCrqUi7rn82/6cGR29KIFVPZ+hGNt26xK3W+RPXWe8EMjuFxHVvzatW7R3SLuFrTBaxG8RUKKGkC7lRi80e8mVvGxU6E04+Z3YWqyhM57Me1JM4GorxzkRd2oe4Id95xcN1kM692xrWNh+sfUeO2KkN4iXUcuUvXu6nCtlExBEOscumxgDfzti0x3vt9XjDNjxwuOUecN8T6qhJeuJwoqUCKbOftEnKLskM6vQAkaRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lWRb3sVvQ4GN8vFbqSvypFwMB4x69PKKo2PH6nOOe8=;
 b=wYT4oFIsD26z8Sr7DO3pGKWuJd0UPajUZ6YrwP0eDvyE/bCDe4R9LnyZgARdteJRHeO0if6XytzPyDx/bDOxGxbL0K/TCYo6gkLu/NZP/gk/KpV43iLHgg0Hbo2RkIzUuVYQ/sZwNmXUcM1eCqHVpiTVrLubkyHEXZaNlw5GHTc=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM6PR11MB3482.namprd11.prod.outlook.com (2603:10b6:5:58::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Sat, 28 Nov
 2020 05:50:47 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::74e4:9b56:e013:149]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::74e4:9b56:e013:149%6]) with mapi id 15.20.3611.023; Sat, 28 Nov 2020
 05:50:47 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/2] target/nios2: Move cpu_pic code into CPU object proper
Thread-Topic: [PATCH 1/2] target/nios2: Move cpu_pic code into CPU object
 proper
Thread-Index: AQHWxPFMAXrqjPCoy0mnktLK1OToe6nc6xmA
Date: Sat, 28 Nov 2020 05:50:46 +0000
Message-ID: <DM6PR11MB4316F7ADAF2DC8124FA0F4BD8DF70@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20201127191233.11200-1-peter.maydell@linaro.org>
 <20201127191233.11200-2-peter.maydell@linaro.org>
In-Reply-To: <20201127191233.11200-2-peter.maydell@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f7d42ca-4c9f-47f4-2c53-08d893618db7
x-ms-traffictypediagnostic: DM6PR11MB3482:
x-microsoft-antispam-prvs: <DM6PR11MB34827DCAE172EF87B2BE38648DF70@DM6PR11MB3482.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vXCId6CoHlItHhyfy2rHQI6dCfGkSeN4CU1WZvGzyqdNQGR59PAfyThLyykgGfrjXDwBmaRNUCkNaXfYr8F+qpHMRej8YBXGTO5XBPG5GKc4Q+AU2SqMlPVSSmNVysfNaiS9cAS9KWpuAXtRNPWm9Iw2RY/AE9I8gqI3as6MqfW/ePT55CGF3aDH0+1Rx0hizet3nbogKI0usvNO5dIGrFFM/oF6krk1eIZRQftzS9P8W0dWoJEgDZOnLFhM+PhK+BBwYvB8oXf69k1QnzT2wNtPmn48Ndi6nTcqZBTZaB89YUjJrdwuqTefaQKFU6F5RdO2niWSoQg/q1X7Sp8M7e+fAJjKU/vHOm4E9LlaCoD+7ZkWjitkjuLY+e1tebM3O5/2whVWGpU39Uqz/QvNKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(5660300002)(66556008)(110136005)(26005)(52536014)(9686003)(8936002)(316002)(2906002)(7696005)(186003)(966005)(8676002)(54906003)(53546011)(71200400001)(4326008)(478600001)(66946007)(66476007)(66446008)(86362001)(6506007)(64756008)(33656002)(76116006)(55016002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?koi8-r?Q?arhj3Vi9F5T7J9t+u0x6KZzyD6niZx9XBjGqU6IgylaCuV0KNHVwlfS6gdNRhZ?=
 =?koi8-r?Q?LEPERrn11lEiJumwwrP1E2NSbrOg8gJkLflE+UESxNBUktYVBCTzAFNHxLtqx0?=
 =?koi8-r?Q?ZoGXqzIUCEY/cyUzx76fEh5HLIBq/4txcHEjuiBpJoXxScZ8aJu0VWyyDUNEpb?=
 =?koi8-r?Q?B9kAFKgkkT4o0guQWCQsffvzV8Tc2ypLF7ZUJ5PTRVfKEJLiM9BTNoX4PWu31t?=
 =?koi8-r?Q?ENapDQEBhMwwgS4eVKsQgqY9KbJYRs46VZflzFvi7AknoAxxedVP9+ieZTAczS?=
 =?koi8-r?Q?1ZJdqRvKA3ePdd+7p32cSh1UPdHth///iOS5szWCXYfArQSUXjrxUgmawtBpqK?=
 =?koi8-r?Q?BR0oqj2eQ8Ovap0/uCHBjQAa4r33GrpeevaKDIXxtsWyJRj5zgeA3rBuHsc4sl?=
 =?koi8-r?Q?bGCSqXJY3jeeVxLPFBg1W86AnnPUD1Ai3u6aNdnWzJti1GrBGMTtF4mjjKG2ZJ?=
 =?koi8-r?Q?bkNS2IB6VRsh6zPLTB4Ey/cxmTJkq5uP0pk4pJp6wkOYYmXsx7M4WjW3OzZO80?=
 =?koi8-r?Q?F0WJKJxDxT949PX6sUnI/hGjTb8B+DmT4R9Kq++KGC9PKdGwNa9NVf3wtgWhay?=
 =?koi8-r?Q?JYNl5oE1IEH1HTWoOYPM4g4RbWdcvOa9T+iblERmENJ90EMlFK0fxHHGODzzA8?=
 =?koi8-r?Q?/FMg27+mjiCcHMqQ12PwK9KomXfjNo5ofEzcw4b05bwbbkIAFEr5Y8OA3hxlep?=
 =?koi8-r?Q?oI8EemTctNk68ia6ug6m6oTRWyHqXoajRUaEkm578lUCRzUIBGEHN4i/2RublD?=
 =?koi8-r?Q?lWnuX8eF3FAV3CCXUu4xoIIHn13+PSts8rtcscKvK7I/UAsVte6Gp9jns/y0Mp?=
 =?koi8-r?Q?fe0tfQG5KItq44n9RKhgTyC+WOAInLz7dk2YsvAGNcET3W9VPm1vpq4rFplDXe?=
 =?koi8-r?Q?3B97GMtIEBige971b0wUPWeRgx4MCKqLab3gKhUfqs9MOEDEO9RhSdj03YMb7P?=
 =?koi8-r?Q?imaB3/kzCpY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7d42ca-4c9f-47f4-2c53-08d893618db7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2020 05:50:46.9549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UjDetI9OfxGt6TMvMNNje8FblmEh86omlebWigSOxBlUKYAJfLcBX8en1uOtNYIu4aYjO8t/ATZaRanodrFrHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3482
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=wentong.wu@intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Sandra
 Loosemore <sandra@codesourcery.com>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/28/20 3:13 AM, Peter Maydell wrote:
> The nios2 code uses an old style of interrupt handling, where a separate =
standalone set of qemu_irqs invoke a function
> nios2_pic_cpu_handler() which signals the interrupt to the CPU proper by =
directly calling cpu_interrupt() and cpu_reset_interrupt().
> Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they can h=
ave GPIO input lines themselves, and the neater modern way to implement thi=
s is to simply have the CPU object itself provide the input IRQ lines.
>=20
> Create named "NMI" and "IRQ" GPIO inputs to the Nios2 CPU object, and mak=
e the only user of nios2_cpu_pic_init() wire up directly to those instead.
>
> This fixes a Coverity-reported trivial memory leak of the IRQ array alloc=
ated in nios2_cpu_pic_init().
>
> Fixes: Coverity CID 1421916
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> target/nios2/cpu.h        |  1 -
> hw/nios2/10m50_devboard.c |  8 +++-----
> hw/nios2/cpu_pic.c        | 31 -------------------------------
> target/nios2/cpu.c        | 34 ++++++++++++++++++++++++++++++++++
> 4 files changed, 37 insertions(+), 37 deletions(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h index 86bbe1d8670..b=
7efb54ba7e 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -201,7 +201,6 @@ void nios2_cpu_do_unaligned_access(CPUState *cpu, vad=
dr addr,
>                                    MMUAccessType access_type,
>                                   int mmu_idx, uintptr_t retaddr);
>=20
> -qemu_irq *nios2_cpu_pic_init(Nios2CPU *cpu);  void nios2_check_interrupt=
s(CPUNios2State *env);
>=20
> void do_nios2_semihosting(CPUNios2State *env); diff --git a/hw/nios2/10m5=
0_devboard.c b/hw/nios2/10m50_devboard.c index 5c13b74306f..ac1993e8c08 100=
644
> --- a/hw/nios2/10m50_devboard.c
> +++ b/hw/nios2/10m50_devboard.c
> @@ -52,7 +52,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine=
)
>     ram_addr_t tcm_size =3D 0x1000;    /* 1 kiB, but QEMU limit is 4 kiB =
*/
>     ram_addr_t ram_base =3D 0x08000000;
>     ram_addr_t ram_size =3D 0x08000000;
>  -    qemu_irq *cpu_irq, irq[32];
>  +    qemu_irq irq[32];
>    int i;
>=20
>     /* Physical TCM (tb_ram_1k) with alias at 0xc0000000 */ @@ -76,14 +76=
,12 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>     /* Create CPU -- FIXME */
>     cpu =3D NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
>=20
> -    /* Register: CPU interrupt controller (PIC) */
> -    cpu_irq =3D nios2_cpu_pic_init(cpu);
> -
>     /* Register: Internal Interrupt Controller (IIC) */
>    dev =3D qdev_new("altera,iic");
>     object_property_add_const_link(OBJECT(dev), "cpu", OBJECT(cpu));
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq[0]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
> +                       qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", 0));
>     for (i =3D 0; i < 32; i++) {
>        irq[i] =3D qdev_get_gpio_in(dev, i);
>     }
> diff --git a/hw/nios2/cpu_pic.c b/hw/nios2/cpu_pic.c index 5ea7e52ab83..3=
fb621c5c85 100644
> --- a/hw/nios2/cpu_pic.c
> +++ b/hw/nios2/cpu_pic.c
> @@ -26,32 +26,6 @@
>=20
> #include "boot.h"
>=20
> -static void nios2_pic_cpu_handler(void *opaque, int irq, int level) -{
> -    Nios2CPU *cpu =3D opaque;
> -    CPUNios2State *env =3D &cpu->env;
> -    CPUState *cs =3D CPU(cpu);
> -    int type =3D irq ? CPU_INTERRUPT_NMI : CPU_INTERRUPT_HARD;
> -
> -    if (type =3D=3D CPU_INTERRUPT_HARD) {
> -        env->irq_pending =3D level;
> -
> -        if (level && (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
> -            env->irq_pending =3D 0;
> -            cpu_interrupt(cs, type);
> -        } else if (!level) {
> -            env->irq_pending =3D 0;
> -            cpu_reset_interrupt(cs, type);
> -        }
> -    } else {
> -        if (level) {
> -            cpu_interrupt(cs, type);
> -        } else {
> -            cpu_reset_interrupt(cs, type);
> -        }
> -    }
> -}
> -
> void nios2_check_interrupts(CPUNios2State *env)  {
>     if (env->irq_pending &&
> @@ -60,8 +34,3 @@ void nios2_check_interrupts(CPUNios2State *env)
>        cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
>     }
> }
> -
> -qemu_irq *nios2_cpu_pic_init(Nios2CPU *cpu) -{
> -    return qemu_allocate_irqs(nios2_pic_cpu_handler, cpu, 2);
> -}
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c index 8f7011fcb92..4=
b21e7c6d1c 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -64,6 +64,37 @@ static void nios2_cpu_reset(DeviceState *dev)  #endif =
 }
>=20
> +#ifndef CONFIG_USER_ONLY
> +static void nios2_cpu_set_nmi(void *opaque, int irq, int level) {
> +    Nios2CPU *cpu =3D opaque;
> +    CPUState *cs =3D CPU(cpu);
> +
> +    if (level) {
> +        cpu_interrupt(cs, CPU_INTERRUPT_NMI);
> +    } else {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_NMI);
> +    }
> +}
> +
> +static void nios2_cpu_set_irq(void *opaque, int irq, int level) {
> +    Nios2CPU *cpu =3D opaque;
> +    CPUNios2State *env =3D &cpu->env;
> +    CPUState *cs =3D CPU(cpu);
+
+    env->irq_pending =3D level;
+
+    if (level && (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
+        env->irq_pending =3D 0;
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else if (!level) {
+        env->irq_pending =3D 0;
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+#endif
+
 static void nios2_cpu_initfn(Object *obj)  {
     Nios2CPU *cpu =3D NIOS2_CPU(obj);
@@ -72,6 +103,9 @@ static void nios2_cpu_initfn(Object *obj)
=20
 #if !defined(CONFIG_USER_ONLY)
     mmu_init(&cpu->env);
+
+    qdev_init_gpio_in_named(DEVICE(cpu), nios2_cpu_set_nmi, "NMI", 1);
+    qdev_init_gpio_in_named(DEVICE(cpu), nios2_cpu_set_irq, "IRQ", 1);

The code looks ok to me, and I tested the changes on Zephyr project, it wor=
ks well.

But, according https://www.intel.com/content/dam/www/programmable/us/en/pdf=
s/literature/hb/nios2/n2sw_nii52006.pdf ,
The Nios II processor offers two distinct approaches to handling hardware i=
nterrupts:
=94 The internal interrupt controller (IIC)
=94 The external interrupt controller (EIC) interface

We have already defined TypeInfo named "altera,iic" , and others can also d=
efine EIC, so IMHO I don't think we should replace the internal interrupt c=
ontroller with GPIO.=20

>  #endif
> }
>=20
> --
> 2.20.1


