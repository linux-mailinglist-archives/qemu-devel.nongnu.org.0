Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36D8358BAA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:47:24 +0200 (CEST)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUYkV-0002ue-Q3
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyanka.jain@nxp.com>)
 id 1lUWay-0007jM-L2; Thu, 08 Apr 2021 11:29:24 -0400
Received: from mail-eopbgr130088.outbound.protection.outlook.com
 ([40.107.13.88]:25730 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyanka.jain@nxp.com>)
 id 1lUWav-0005Un-Td; Thu, 08 Apr 2021 11:29:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccwO/3kUvO1EOno8tSKWnYkJrxmfVkPeZewr5aAm2CIEj4t1eyAM0QppAP8StwWs6TNotViMwd/GKHY7FCAiNmjr+zJm1hrU2yzaoYXZrzKZSo8gIJlgOdT7qhLFMQ9zIsU0K5+LVmlruyuNom5/3ym+I4zOW2NZyiTEu+Um1KbsEip0EN8pJMexVDHa7T4z/cIr6MH76vZcQ+n3MWe6b/e3Ibs1qAV4nKCd9E8J8dM9ypQ5IEBcCKgxZ+VS26daoVFsckYF5w+PByqVp2XDi41Ep5rYyHD4QTsNOgCOZRmnzJl1ctnjnrTXHUuz7EnfqLJN/QY+YvdjYeTGBiZiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zth00usnBFh2x6EjI90697sWEQBKdPHUUDFuZ3HeVyE=;
 b=RtCV+RQWbYpLcCVObcW+gA04z2ZLTb4iEK1zSvfvtYajvEMjR0jq0zafmjHzD7f2M8+YAdqqwHff/aG02ELyEgFaSz45A/g/M2ilA67wvDtyQ+xBqse/DtBW49BfVHM9oBjK1n6al8dPgjRcHsdkFDPk1lxCS9BoKIj8eQNmr5JaqdUtvEQbTokKJLcC6rzB1GRaap8OrnUsJ3X3Qsw7erqx6XV2OtUmu+wrsIvVMGMdClMVBgOlCDbK3JT3o4I5EA58l3sHFoYepDLYbXN4ZPxoMerXhGL7U7TIYByaBCbZx3YkRrBq1QrPK7LKCiPOiJNvx/Oyc749PE1jpSceFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zth00usnBFh2x6EjI90697sWEQBKdPHUUDFuZ3HeVyE=;
 b=rN5r0EDpGb6mVfRWI6SouCIJZkNW4rkk83075Gl46vwp+9/hDCAC2BDADWYTCyopC2FiLrF/L120oHRF3ANbsN/IHhH4Ea1GmGJrFDFSSAxJjUi6f+EGL3XK61djW+04S8D2VUonbvAi950fg1QrxY/fKkdsYd0BpkWptQAsqBU=
Received: from AM6PR04MB5144.eurprd04.prod.outlook.com (2603:10a6:20b:a::32)
 by AM5PR04MB2995.eurprd04.prod.outlook.com (2603:10a6:206:9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 15:29:16 +0000
Received: from AM6PR04MB5144.eurprd04.prod.outlook.com
 ([fe80::a4b4:bffc:f02:3362]) by AM6PR04MB5144.eurprd04.prod.outlook.com
 ([fe80::a4b4:bffc:f02:3362%4]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 15:29:16 +0000
From: Priyanka Jain <priyanka.jain@nxp.com>
To: Bin Meng <bmeng.cn@gmail.com>, Ramon Fried <rfried.dev@gmail.com>, Simon
 Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Subject: RE: [PATCH v4 00/22] ppc: qemu: Add eTSEC support
Thread-Topic: [PATCH v4 00/22] ppc: qemu: Add eTSEC support
Thread-Index: AQHXGMuzEw1r8xv8mkizI+FMLy80SqqnUZeAgAOUVdA=
Date: Thu, 8 Apr 2021 15:29:16 +0000
Message-ID: <AM6PR04MB5144C1644B84BDEBAD64D581E6749@AM6PR04MB5144.eurprd04.prod.outlook.com>
References: <20210314121506.18303-1-bmeng.cn@gmail.com>
 <CAEUhbmWD=Pixh5pXqU1cqG2juOXj1sv37raSmwu1kjVRbFAXXQ@mail.gmail.com>
In-Reply-To: <CAEUhbmWD=Pixh5pXqU1cqG2juOXj1sv37raSmwu1kjVRbFAXXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [122.162.60.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 796e4823-5d2a-43ef-8874-08d8faa3126e
x-ms-traffictypediagnostic: AM5PR04MB2995:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB29954C32B7816B09A3829FDBE6749@AM5PR04MB2995.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uXXi8VFqqx4uXSgpiXgHfT3OY+Z5w/66SSPMu8b6WQEo2ttKoCb/58HoUDdCjK4vhvgIMdPNqAlPM2aUHqHdlGkWGSGvM/4E3yEdWE0pkuC1HC028rmp1BKwxVnnEEk90A0zBA6gtDk8dYtG+VIFQFP1wGVdt43fIN361IrbFyflOOanADhXqwozCsIXhXfsRofBP+flWQpumMukiFb6RJnR8vPUJ+Ph7sjb/uqOtkyfERpYmIaDFTz60MOBUTdaJfU2/GxQN/OWl3UGOl0jwPx86Y4k0T0gEFSdLQ1Hw3m6vOr59xG7bYmuVR/XowTgm7k6EvWUdONtslphm7zzPjeRkMlpiwR0TJfIOQWiiuEBr1K8EENt6cHnmKr5WWQrvpdovZavjuGnktyiJtTOuza6U3T/UQsYaz4yI/NVXBv1k9Gxx4nqkYHF38ecDZbv1sobduzM+GmO//cHlq2xAN+wt0v78heetkfnx/HsgmXvSQatjfq60BSBDZgvGPjJC8o1w0qyL0qzkAdPjVo1ikCV8qHYgFWMIw/urwA17E1tjPsZkdEFrZE8NZCmUl1QiPb6F0ulbBoxJK7WtfyDfwRShms4M1QzRq6oU6bA5mOq1JtHTJv0zIx1XkAmQ3+opyEUbCkzKM2rCYxkd92nK9QVnyNIvdrbUcrC41DKFgnByzX7N1G/qeY+yTZXM993paomA5WGYn1F33H2tTFohjO4KCz7doaRQXc5Bvsp5R0URHkdsc4C78eT7wO6dCia
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5144.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(45080400002)(186003)(26005)(478600001)(6506007)(33656002)(4326008)(83380400001)(7696005)(52536014)(55016002)(9686003)(66556008)(2906002)(8936002)(66476007)(966005)(8676002)(44832011)(76116006)(316002)(54906003)(38100700001)(71200400001)(5660300002)(64756008)(66446008)(86362001)(66946007)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?NGTqn+8Pwh90lhCUw6wY8Mbb/LBr1pYHnFfsZflpqBB8BvssXs1loi5djZxi?=
 =?us-ascii?Q?L5sLBE0NoVlWQBLIdYo6S1sJY/svswWnbV/twKI4thf3s3EmMARLccnevsJF?=
 =?us-ascii?Q?fjt2swv6vjFrrkGsPXEkqvSiUQkppKWT7BjR4FHiptvAOKUuSiLdXfMHFLa6?=
 =?us-ascii?Q?ZzCNx4dyy+vDDOa7cEmBO6sZfNo+U2QkyiZoVJZZT9p4u9OzAz0DogGnJZzL?=
 =?us-ascii?Q?+INg60XKLKzoBFJbwlB+7Pn4mVSbi4DRpDDZNzoAerlV0znHuIO1j+Rn0Mc1?=
 =?us-ascii?Q?JxEqenc7NqDKr6yKsWxqebnd3DswmeEOwtqpKZB1nGWmda9cY5bn3Q9EIT99?=
 =?us-ascii?Q?oLP7mR344wnTwXlbKHyHtG3hNl9akD5MmE6altD5WvSISQd5eUSPTM+VoNbH?=
 =?us-ascii?Q?SKkIxw8RooPVBxhCHxHViCoxddIY0n6l5niOLD6TyTGHfDvBYY4BlaUCtg8E?=
 =?us-ascii?Q?o/Ex3O1MLOBr9N4nzVi3GON7NEpESCs/EbZsXEPoUZ+/VyR3qwLkPBHdJ+nc?=
 =?us-ascii?Q?B5RcuenIwQKFLPT5XoMqQgrodafhs8Ziio+4TttnksnXCCtuGQhbVxqNt/91?=
 =?us-ascii?Q?5qoISVsRdGLhNv1VTbo2OoPi0lPAgt9foIE3hb+OYFxbKlGfPSJoiRH782Es?=
 =?us-ascii?Q?RYaBANv+IMWdwtjSi8Vo8WIb2dafKtlKlH2NHLtDvWaf0EXsDDw37DFipnsm?=
 =?us-ascii?Q?qfx3HZL1CqXCLRss51IZA8PRCqapHXvO5sbMprrIebFwUTm/huf3S0o6UwLb?=
 =?us-ascii?Q?YwU1sK4OEVjaHnRitTMocIcemBTA/J5xR5VYwCqo7ZU7M6xpEL8vDV1MvKjh?=
 =?us-ascii?Q?2G/M+x9LPsHyDsRB55B7Bmzvqm1nLyqvCB7pA1RjsgRCys5zQHHxt4upehl9?=
 =?us-ascii?Q?QzZNRpUaBSlfZeudGpuDO8JI0H0S/lUIGgY5QKeMJIi/xwrAVx09AVi68+7o?=
 =?us-ascii?Q?QX8wrMI5u6OgExKDiql9NRr/ZX8Rj9o67nYK0+vNt+xUm/NimDv0Cvs3M/ol?=
 =?us-ascii?Q?IJo9gl42zRAbGGn+YMX8KT+4kdJk+ivaxp6WWvdMTVpf8u96xJy4t/Ernseu?=
 =?us-ascii?Q?RnuLcQkFoP7WCv51ktWIt9KgrbqBXF2+iAs0nk/PGH/DIoHfr+qEfwn4k4G/?=
 =?us-ascii?Q?dw+SSOcPMtmwi2cJqD/y+NiIiuaCqa6I3QSKVVHEr7wg/CYRli1HP7EPfCLc?=
 =?us-ascii?Q?qWbn/qCzMPwE6J9Zgd8nEkGeje32TPSKeoWUqroYqMT/sBn5WnsC2j/g4a4Y?=
 =?us-ascii?Q?Wks68QcXmrL9tBI9Txu7CVPxazusS/qG6Z/kgVBagPpxeXbuVcr9FxM7QCdx?=
 =?us-ascii?Q?FLPySz8ulVhJeLXli4jmkSBs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5144.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796e4823-5d2a-43ef-8874-08d8faa3126e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 15:29:16.7912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3mFhXeaDxE9zfgj5efitxHcl4tl02yX1w8FWD8eRohh5UVZP5yxz6I/yvEL80IlflEp4gr5kGHbgpIjDl6LFsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2995
Received-SPF: pass client-ip=40.107.13.88; envelope-from=priyanka.jain@nxp.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 08 Apr 2021 13:45:46 -0400
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
Cc: Tom Rini <trini@konsulko.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>-----Original Message-----
>From: Bin Meng <bmeng.cn@gmail.com>
>Sent: Tuesday, April 6, 2021 2:18 PM
>To: Priyanka Jain <priyanka.jain@nxp.com>; Ramon Fried
><rfried.dev@gmail.com>; Simon Glass <sjg@chromium.org>; U-Boot Mailing Lis=
t
><u-boot@lists.denx.de>
>Cc: Tom Rini <trini@konsulko.com>; Vladimir Oltean <vladimir.oltean@nxp.co=
m>;
>qemu-devel@nongnu.org Developers <qemu-devel@nongnu.org>; qemu-ppc
><qemu-ppc@nongnu.org>
>Subject: Re: [PATCH v4 00/22] ppc: qemu: Add eTSEC support
>
>Hi Priyanka,
>
>On Sun, Mar 14, 2021 at 8:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> QEMU ppce500 machine can dynamically instantiate an eTSEC device if
>> "-device eTSEC" is given to QEMU.
>>
>> This series updates the fixed-link ethernet PHY driver as well as the
>> Freescale eTSEC driver to support the QEMU ppce500 board.
>>
>> 3 patches related to fixed phy in v1 are dropped in v2 as the changes
>> were done by Vladimir's fixed phy & Sandbox DSA series [1]. Vladimir's
>> series is now included in v2 to avoid dependencies.
>>
>> This cover letter is cc'ed to QEMU mailing list for a heads-up.
>> A future patch will be sent to QEMU mailing list to bring its in-tree
>> U-Boot source codes up-to-date.
>>
>> Azure results: PASS
>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdev.
>>
>azure.com%2Fbmeng%2FGitHub%2F_build%2Fresults%3FbuildId%3D343%26view
>%3
>>
>Dresults&amp;data=3D04%7C01%7Cpriyanka.jain%40nxp.com%7C2bf2ce633c6142
>1a
>>
>d71808d8f8d8c19f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
>53295
>>
>7133182039%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
>2luMzI
>>
>iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DOT5P5lmA6FnoVKfgj
>oB0%
>> 2FLVYoc6hZ1dfo54piX8jV5s%3D&amp;reserved=3D0
>>
>> This series is avaiable at u-boot-x86/eTSEC for testing.
>>
>> [1]
>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatc
>>
>hwork.ozlabs.org%2Fproject%2Fuboot%2Fpatch%2F20210216224804.3355044-
>2-
>>
>olteanv%40gmail.com%2F&amp;data=3D04%7C01%7Cpriyanka.jain%40nxp.com%7
>C2b
>>
>f2ce633c61421ad71808d8f8d8c19f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7
>C0%
>>
>7C0%7C637532957133182039%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
>AwMDAiL
>>
>CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DF734K
>p4
>> 2IZRiFaQNAzjkx8lh4Zqja9v2xUAc%2Fi9KtFw%3D&amp;reserved=3D0
>>
>> Changes in v4:
>> - describe "ranges" is required fo the alternate description
>> - make platform_bus_map_region() return void
>
>Now the v2021.07 merge window is open, would you please apply this series?
>Thanks!
>
>Regards,
>Bin

Yes, will include this in pull-request around next week.

Regards
Priyanka

