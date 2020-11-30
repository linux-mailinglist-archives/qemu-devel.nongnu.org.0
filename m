Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AB12C7DE8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 06:43:28 +0100 (CET)
Received: from localhost ([::1]:52348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjbyB-0000K2-HM
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 00:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1kjbwJ-0007qS-Tt
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 00:41:31 -0500
Received: from mga17.intel.com ([192.55.52.151]:51467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1kjbwG-0000Gr-Vz
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 00:41:31 -0500
IronPort-SDR: hkKYY/vlMGS7CCCmvJKewru5YOJ5MM+TzhKEfwm1c9NxCk+z0IER054KcEi3J7+jIcY0cZ75qD
 HYLu3S3EPBbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="152417335"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; d="scan'208";a="152417335"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2020 21:41:21 -0800
IronPort-SDR: cvjGXQT8vmQpL+5H/yTTXDnfUUbdQhwZaeCcYVHKhb3KaP4mRpVeyXim/t9VaksZ/bsfBHZwyv
 pxdodo66AnZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; d="scan'208";a="344956007"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 29 Nov 2020 21:41:20 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Nov 2020 21:41:20 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Nov 2020 21:41:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 29 Nov 2020 21:41:20 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 29 Nov 2020 21:41:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChGVtRVFeHs2LIjI1QpYgLM2GDeCYE5N9BoyrIBBY1lDxHbEPVtJTNQgU1eglscw5godoz+tcwH1fLvmtl9t62ImJZBwYo6c8cB2j2ZM5BBqEB5GLBkyIlVjQgxemx9VkgCcycBAZm7h7WcRSWKqcz0ks2tI6ntWsfskyAlCq1v11Bdc8IQIe3dTF8orKADh8lmb5YiwVv6SyQxM89JUtXolkBXnI8XoNHA/gdpEbxzWD1Ws6yzJawLBOPeKAdtHED2j8x16HFeHogyuhEn4A18racsmbiZ0Mf/93xSiKqSbHmYMdEqbgtvydM5IOrUIPkoXLaKtL2Ouqad9utZcbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVXz/h+GnJ9Ym8X++1aPBzF7/AWwUz+AqII9AlhbWlo=;
 b=kxFRk68u1M2h2fyTr64v0qI9r4SfNwM/g6TGXlTCpt7HETyDaVMrqlmzEG4rnpGYJPYp0mvaMPYYDuoZ61xoEvBCkAfOixQqmTPgp0gtRpwxh4/O3OIBk6UtyrGu9qEKiwBKt4CKKWXFj/UufIP7lwAgrvkPhQ4IYx52KTywgMUs09bxRQL7RVcABYfdFTEtDTCIlPsIoYLMY1koWpixfvJRod+23q19J7iDBElMLGJst76yWoKnR4zG7bRvzdArXDPrq3HT1vMft+YB4C7YaMxHiXV7yOEBrXnu+1WkCM0osi79ZiN7g4YYZCHRnYJgC+MntN2TPgMJZWQu3Md1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVXz/h+GnJ9Ym8X++1aPBzF7/AWwUz+AqII9AlhbWlo=;
 b=s1bn5W04DatfnIjxfZe9VlxGIfFJBU4VgYA22LtpXhNqS5qK47/C3zKXM2EEVjlgM0PTXGaukedHT5PyHp2TKH5WksyaAWsl77rwLRwjT2lRxSHp+0qZP/ihVevdRDKpX8uDOTt45vp1NSz9EIKfrDCxnmghgta7yCY9kNjA9u4=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM5PR11MB2026.namprd11.prod.outlook.com (2603:10b6:3:10::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 05:41:16 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::74e4:9b56:e013:149]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::74e4:9b56:e013:149%6]) with mapi id 15.20.3611.023; Mon, 30 Nov 2020
 05:41:16 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 1/3] target/nios2: Move IIC code into CPU object proper
Thread-Topic: [PATCH v2 1/3] target/nios2: Move IIC code into CPU object proper
Thread-Index: AQHWxnbBmTrkztkwLUad1WT77MGBTqngKMUQ
Date: Mon, 30 Nov 2020 05:41:16 +0000
Message-ID: <DM6PR11MB4316328210E97BA3BB8B9F9C8DF50@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20201129174022.26530-1-peter.maydell@linaro.org>
 <20201129174022.26530-2-peter.maydell@linaro.org>
In-Reply-To: <20201129174022.26530-2-peter.maydell@linaro.org>
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
x-ms-office365-filtering-correlation-id: b5174dd1-0880-4298-7884-08d894f28ea0
x-ms-traffictypediagnostic: DM5PR11MB2026:
x-microsoft-antispam-prvs: <DM5PR11MB202643BB01B947FE4238A88D8DF50@DM5PR11MB2026.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8e88L5R51x7jkjuXvMh1bfqNWKgbsv4qdHIkvcL66uQcu4B/AiwFBVyploojEmhipSfpDYm71YzqJ85Xnuj9a5JHaMvx9jGaWrwxQsZGk+tp7Bp2qVtGuPLop/ZYTr+ax8tODd6EOF2+d0KcxxAqEbSsp0+RWQLxMW99iVLMikk51CpUntFXedmUxx8fa9f4NyfUf6kQbQR27NA/29B9wehUCJzAeNlFRCzV/zNuUCw8ed3OUYkv6iMSOacLkP5YKG6Zrib5xVg4x6fvD1dCXH1DRrFde/LT7mEdlpaREDRC7gRP5hDY8alYyU0uQhNRt1wpXPGW4lTbbeNKhNU1Qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(8676002)(55016002)(5660300002)(316002)(186003)(9686003)(26005)(4326008)(478600001)(53546011)(6506007)(83380400001)(8936002)(71200400001)(64756008)(66446008)(86362001)(66946007)(33656002)(54906003)(7696005)(52536014)(76116006)(66476007)(66556008)(2906002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JgR2itvrZ/FVQcAZ6vZPthD0BFTQHGpA1Z4ylCUYTTcFKrGJ189PczkxzUpb?=
 =?us-ascii?Q?EsTIJc/RYwS2pyudkcaYLgJd1+RSv2JVmLgn0ywVQYu2CujNN3bHZY20pXSQ?=
 =?us-ascii?Q?jPtAIcz+AIYzsu9mTAuZlNewqiltGU6tPz2JNklQZ8TaDfhePZyiPgBxO94u?=
 =?us-ascii?Q?OCdxwDIpbfY3ZbNOl+dRmCn/AkbTwSxYSJ6pRzM4HsxRmnAW0fsaDqci5Ffi?=
 =?us-ascii?Q?9InBWl/H/6qxSLu2TzZZDTaTF0CltncD2hf/cWVLERGf4Z4Ga6CfBurHfrDH?=
 =?us-ascii?Q?0KKjVtmbhbJO0ZN9YGDBS3lMpZvqQQ37hjCAKnDKM1dC8+B/Yz5zJyi+j2Gs?=
 =?us-ascii?Q?PO2cSj7uAkmOjJgIGN8LtEObzfT/goO0/yyavO+CfniQVIaiDLw4GSIPp9Z/?=
 =?us-ascii?Q?GnAa8xR3l+mAh1st9QugZK2kF40mweyloG/F3CKo3mRBNHNBadf003V7a2qp?=
 =?us-ascii?Q?kUxFvi53q7jIh+TwM8/ll/joDWLw34YGqgbMl9i2yBpLxKElaQ0vgLUvpxeh?=
 =?us-ascii?Q?Gs5af4GiCl47EeyKiMFmV9n6rLVXXx5OvBOPdgnc+B9qerJvvB2xOgxNal6x?=
 =?us-ascii?Q?7JluNUUoOpsiKq59u4UtAFqOMw9JmrtENhpSl9obXaxZCrHMmcwdMA2WY207?=
 =?us-ascii?Q?R+lAxsJOL4vXsZD/sq/FIyG98fIp6Pb0l53rFgCMP77/6khH4alfMrEAShbm?=
 =?us-ascii?Q?4pgDIPaMwelQw22mS/wJY+JE8Zo0JdFIDymxVy/Os4+MRyc9Q7jpVi86pDsO?=
 =?us-ascii?Q?kCTpKixUG1/eoG8/gJ81xmWW2Z2xxWtpjVzTtfaH2nQbf01TM5GRB5nmJNhY?=
 =?us-ascii?Q?eTG0OYnZJaK0NX9+/bltFkZRVoqrKE5DNADO3sNTIxXBrR34twprM8oZEDtb?=
 =?us-ascii?Q?8p/qT7SE9VczV5DJfn2QrrRotepkIzetBpkmNngFZIJWsNwoIlig+6OW+xv8?=
 =?us-ascii?Q?j2L93iD4FB/WUw41NvTk57MGG8WZBqdFgDojS8kvawg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5174dd1-0880-4298-7884-08d894f28ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 05:41:16.8153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZG6fBqVChwhrsAQsRx2G26AAxRaY96WPWn7Pp+kR68uEPsR/+sA90sPDQ5S6QAmPM8tR/kuEax/R3urQ6CGxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2026
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=wentong.wu@intel.com;
 helo=mga17.intel.com
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
Cc: Marek Vasut <marex@denx.de>, Sandra
 Loosemore <sandra@codesourcery.com>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, November 30, 2020 1:40 AM, Peter Maydell wrote:
> The Nios2 architecture supports two different interrupt controller
> options:
>=20
>  * The IIC (Internal Interrupt Controller) is part of the CPU itself;
>    it has 32 IRQ input lines and no NMI support.  Interrupt status is
>    queried and controlled via the CPU's ipending and istatus
>    registers.
>=20
>  * The EIC (External Interrupt Controller) interface allows the CPU
>    to connect to an external interrupt controller.  The interface
>    allows the interrupt controller to present a packet of information
>    containing:
>     - handler address
>     - interrupt level
>     - register set
>     - NMI mode
>=20
> QEMU does not model an EIC currently.  We do model the IIC, but its
> implementation is split across code in hw/nios2/cpu_pic.c and
> hw/intc/nios2_iic.c.  The code in those two files has no state of its own=
 -- the IIC
> state is in the Nios2CPU state struct.
>=20
> Because CPU objects now inherit (indirectly) from TYPE_DEVICE, they can h=
ave
> GPIO input lines themselves, so we can implement the IIC directly in the =
CPU
> object the same way that real hardware does.
>=20
> Create named "IRQ" GPIO inputs to the Nios2 CPU object, and make the only
> user of the IIC wire up directly to those instead.
>=20
> Note that the old code had an "NMI" concept which was entirely unused and
> also as far as I can see not architecturally correct, since only the EIC =
has a
> concept of an NMI.
>=20
> This fixes a Coverity-reported trivial memory leak of the IRQ array alloc=
ated in
> nios2_cpu_pic_init().
>=20
> Fixes: Coverity CID 1421916
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/nios2/cpu.h        |  1 -
>  hw/intc/nios2_iic.c       | 95 ---------------------------------------
>  hw/nios2/10m50_devboard.c | 13 +-----
>  hw/nios2/cpu_pic.c        | 31 -------------
>  target/nios2/cpu.c        | 30 +++++++++++++
>  MAINTAINERS               |  1 -
>  hw/intc/meson.build       |  1 -
>  7 files changed, 32 insertions(+), 140 deletions(-)  delete mode 100644
> hw/intc/nios2_iic.c

Reviewed and tested.=20

