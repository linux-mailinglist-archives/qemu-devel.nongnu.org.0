Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F65135FC64
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:12:08 +0200 (CEST)
Received: from localhost ([::1]:48688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWlrr-0002hJ-N3
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWlnP-0000yB-O1; Wed, 14 Apr 2021 16:07:35 -0400
Received: from mail-eopbgr750120.outbound.protection.outlook.com
 ([40.107.75.120]:16037 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWlnM-0006g1-Qe; Wed, 14 Apr 2021 16:07:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1eK/D3Qno5U+nIe6Kr8Y3hSFALGonNkFxcnsPTaqUHpX5EkNBvaJzoggUxMKEA+g5J/ZbeVk+WxNZu8iZg3hTBz24QDAEFN+K6pEBsxibEtTWQxHjej5mbdcEBGui0JP4hpfbgVF8tQHGGar1ocsJy7kYQXvYalBTjMAUWEmbPtis8ssEVErNsHKDu2NsZsiBHqetzX9DKFEmw0cs8x/XVJNe0dGoV+UASProDM8g2cVX7HXxKMOgVeZBQBkERKYjvjxH7dLJYqz/Dpr5etbKtwPfezakvdjwDROEERfv0hfsxiSlhgdHr04wT8rWFXhXZGk0uHUR6S3dBvv7m5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS3W6AFAve1LY5hZxfa7ERJKnC1DzBjxZ0voNR9O6C4=;
 b=AoLmbI1NHYC0AOg9O1/VVr5rsEetrQvhKIhncFOTwE3xVYb6xF5hRpI0z1wVpivEQQ9lMfJnS/UFe/NgY5mJwbWIkb9vRf9PUv2xQ1yhM+do38G0QQh4/lQcQGWD46Vz/Vlha7Z6A+UXD9ATnS2R8opayIuukApcwVPXRrLH2mTWeQB//hBNI8xtsw5JS0CuoibzZyjwmTzKfnxiy1SmSEOUzHjaKsj1bI8UeXVOR62CI0YHQi8RtmuaX8v9eOIu5is86jAMW7fYoUMIIEItgCP9m+pUr5n1M8Ml54C60eiTrMqZpoT6oGABmvVBMDjO2L/nEmpGnh13tqE/mwD8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zS3W6AFAve1LY5hZxfa7ERJKnC1DzBjxZ0voNR9O6C4=;
 b=CTsAHYbDudD2NnQO7k7tAGbeZQSKsV3S32gKNpW0AzzXNFMrquiInBGj832lv4J3mow5CC3gCO5rFJZ1l82ztxdyV93mcETtNH+3FOOzo+T28Rojkkxw7Q9RNihKu/RyKQWUJ3vPNzQ/9fPlUTMQFehnQwLUlNlJxE6cqx4BbuN0R1SKBxD26hUh83HNJzo0gANJdd+dUcWmJ1mnmymKbv+tnkKo+ZWMYOKXFDiV2irKr8idbP0T6T0UZmEW5BRFcRqvdTDkEEKvcxiMVBi3kIrI30M9i9x/bMUzn98RJDtv/oZf+vI5ZeN+ESkP7PUQXzUAMUhn7pa+4jC+wNp6lw==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP0PR80MB5298.lamprd80.prod.outlook.com (2603:10d6:103:2b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 20:07:23 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4042.016; Wed, 14 Apr 2021
 20:07:23 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Topic: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Index: AQHXMIej4hDOonaOpEaWSp4QxcAAL6q0ajoAgAAEQNk=
Date: Wed, 14 Apr 2021 20:07:23 +0000
Message-ID: <CP2PR80MB449939F026D6CAD8915F2180C74E9@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>,
 <7f935c45-21f2-91b2-f787-dd528858c838@linaro.org>
In-Reply-To: <7f935c45-21f2-91b2-f787-dd528858c838@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [2804:14c:482:7ed1:af22:840d:1c02:6531]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1857b787-e7fb-44b9-f458-08d8ff80eb23
x-ms-traffictypediagnostic: CP0PR80MB5298:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB5298ECC2BFD5E20686E6CF7CC74E9@CP0PR80MB5298.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7Msk4+Jz5P+w0DOG2+H6jWHjjF7p4isRxKk2PBzPkNk+Zd5JkIq3vf21HoDRdAfQPfV/Z0FF0fECuStkv9nnN5WR3fnnKYOTMS7SkywSmIthWZDpeabv3RuwHOTvRzq7SBeNgR7M3rPvntKTKv1DEYrgSsDXMiKlOhQ/Ut7BDwxJ7h5OPRxwamNT9U7bfdBKPDrqa1q78HqQtMK7PaZXi1GlfuqT5MyKNbdcLEstBii3p2xPvURmXHmCORl3Q+83dwOEqx4GnbR3JJ1Q6NBmED+Uh8xmIq15xfSI+fnvGj82YHu7XH9uBAknGnMnn30W33M0IdpNyklOxvXVnNMX54fcWJIYlqFJMvWFF3ZZgk5gOTBZ08YLv55wt+6CLw5aXpxdNfjFZc5PMN8+6OvlXObJw5edeyApGPoAdqfy3FB3Auv9bOl6LJwFY9EGPWJ9Q7AxcRIXfCtRmbNuZzWviacEeulwnB3GVKIWpmp7vbSDlvH7T3th77aifta7EG9fHHNKaVVe/YJgvnX1EEZkUs1by9ysN/ApT1ltZbOFuirY0BPWxNurPxclvJ4HzWeN2Ag5N/zKCUa5h2yJQNRqY6x4B88CID+iRqz8Zx0+lZ8xe6CGTd9Fk9sTJsxqmujta3odoMgImhd2ObQXiR6VKpfDHO35pnjmclbNVdYdiK21J9DPDdW05yLeZAxg41zb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(39850400004)(346002)(396003)(9686003)(107886003)(38100700002)(8676002)(8936002)(55016002)(166002)(33656002)(186003)(2906002)(83380400001)(21615005)(4326008)(122000001)(6506007)(66446008)(64756008)(66946007)(66556008)(66476007)(76116006)(5660300002)(478600001)(19627405001)(52536014)(7696005)(316002)(110136005)(54906003)(86362001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?DDC8jOKk4QsmIt/48a20HnMhia/r8ej2HEPgNMZe+/qD5WKYtrzfutuh5E?=
 =?iso-8859-1?Q?v0nMHm4rfUBp+/7gZxiHU7M3WArGpGbhy2ae5b2SXyZ8Uuv2acQZctF23f?=
 =?iso-8859-1?Q?eDEyKxA9tIC88MEwn+EoW+P2OcqeaP+DtXU6ohQFLeHndUIUfo1/7EGOtD?=
 =?iso-8859-1?Q?i3ZRidp0bhbebTTUO04u3CEfIRmlSs9F1vfIp6aOYpO3VluSsynBiX9nFI?=
 =?iso-8859-1?Q?mXhSCWwE0RQB8Or1VAQw+T2AvoLs9EMlHcIwK3NZw9EQJQSw5ABOx/peTv?=
 =?iso-8859-1?Q?TERCaK0SoaYRBiql4lHrJDnpvSxlNXyiMS4q8ZMVBcScHO4A4EqWxbdROv?=
 =?iso-8859-1?Q?uExqcWHQj4E/WE5HrCtDj9mcD5AC7ZE4xa8vtxn2lNinxqECEbd/gYonBY?=
 =?iso-8859-1?Q?0+hDk0ydOAbE2zDu0TSmwsmnhMWzjNqrmV3zlKUM6fF++4znWTVzskNvPY?=
 =?iso-8859-1?Q?meahASL1Iigr9TrMtt/p+/aMUp9ynmh1/z9HLAVUTCWd7FrpOj2obFIUlm?=
 =?iso-8859-1?Q?llJNb7OwGF/uSW4R57fhoDT7Dk7T8quc1a0rFqTPDs7CE5A8iASd+c+ARy?=
 =?iso-8859-1?Q?pHn6yCRgLQlb8Ri3aOIAZSaJ9CGuKAWbNPxdj7Ke3TQ85GBtTeTvfdtwVU?=
 =?iso-8859-1?Q?k4ARtlQPKozBKXPJBgm8JSOUtK54fpb+MCnXBBNbRr+ebjSsQFRcB0JF0D?=
 =?iso-8859-1?Q?pXfesWRozXD9SUBsON9KH37QGI6BjlOPygd5u/ssCgSXOqVEe7HffShMu4?=
 =?iso-8859-1?Q?29HBDXWxAh+gn+onoYHwa+DXr0ExVygU4RHFqBKjo3u/lHAhlEMWOtg7Qt?=
 =?iso-8859-1?Q?PE1eoBm27Bg/0K9TDVNkhaETITYyQfMZtdhWL0K4GRVTpJ1tMQTGlmmWSz?=
 =?iso-8859-1?Q?5AdCyKoh54YjBpwivOIzPXiMKyGvIa2zzLR/u0cXWI7D1Y4puiJNqo3OQB?=
 =?iso-8859-1?Q?10UWCP7zvS98TmLVf4MEJd3/wiJ4bOFrVYXuHtyogacDI+CrIPxMOdbL8N?=
 =?iso-8859-1?Q?TOGscZBEb+knj1MhdKZCEhUWtpwJSHXwcIDBfD79DbnjHiTEGEcT+4p/0c?=
 =?iso-8859-1?Q?E8o+/UzKYTAdjTYHYTyIRqJfsY3EmZUOzjfwfRMuIYWWDWPq8+OM807fIn?=
 =?iso-8859-1?Q?wRLIZ2nBU56uzzJm+muJehRBCBZdTk/LuXU2AiZmbGChRSqF6MG07jGbK2?=
 =?iso-8859-1?Q?sc7ej65I5O2iGLI8y1d/K9YjZwcq0rs0CTeVEIpcrjDXD2b/mEeMPWFoLa?=
 =?iso-8859-1?Q?EuA3/E09lP2SaI/gUQMqIQQcekNTKD12h7MpPoOsd93jEPc/gf4neyUmhx?=
 =?iso-8859-1?Q?Ghs0w1lsfYjDuBhffvOWE1z9l5VWyc66UziiAqrMNKRxp66lhTY5Q/8h8E?=
 =?iso-8859-1?Q?H8gjyFjDdSS5/vWkqBcVdNQRJucQdCTzA18F/D8xuLrXhTYS4wJ1E=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB449939F026D6CAD8915F2180C74E9CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1857b787-e7fb-44b9-f458-08d8ff80eb23
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 20:07:23.7314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xwWv18ryF/yQoT/JzSPz+zgToeZ7qEggYgoctqLHHv0QYRyuCkkFaGOC1knMI+UJzM28z8ArUlM7FX2YkDg+zczquTJCJyxV9rSgEQdV9HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5298
Received-SPF: pass client-ip=40.107.75.120;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB449939F026D6CAD8915F2180C74E9CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > The trivial path is to:
> > * rename translate_init.c.inc to cpu_init.c (since it has to do with
> > initial definitions for CPUs, and it's not related to translating
> > anymore);
>
> Anymore?  You mean after you've moved out everything related to create_pp=
c_opcodes?  Sure.

yeah, that. Also after removing every to destroy the opcode table
(which isn't packaged in a neat function for some reason, it's loose
in the ppc_cpu_unrealize).

> > * move gen_write_xer and gen_read_xer into cpu_init.c, as they're
> > used for some sprs, and whatever needs to be moved with it
>
> Well, gen_* things are specifically translation related, since they emit =
tcg
> opcodes.  But I see it's used as part of a callback from the SPRs.
>
> I think it would be worth moving all of the SPR code out to a separate fi=
le,
> apart from cpu_init.c.  There's a lot of it.  And, yes, I would move ever=
ything
> that you can that is related out of translate.c.

Yeah, now that I look at the SPR code, I'm starting to think it's easier
I think it's what fabiano had in mind too, but we'll probably have 3 files,
spr_common.c, spr_tcg.c and spr_kvm.c. It's a bit of surgery, but it's
probably worth it, to avoid a mess of ifdefs.

> > * move opcodes and invalid_handler into cpu_init.c, because they
> > are only used by stuff in this file.
> You could move the opcodes to a new file of its own, including invalid_ha=
ndler.
>   Moving them to cpu_init.c does not seem helpful.

While waiting for a reply I tried this. It's really not, it creates about 6=
k errors.
I ended up moving everything that used it from cpu_init.c into translate.c.
create_ppc_opcodes and destroy_ppc_opcodes ended up going there, and
I added prototypes to internal.h to call them in the realize and unrealize
functions.

> However, I think the surgery required to disentangle the legacy decoder a=
nd all
>its macros is probably not worth the effort.
> What will be worth the effort is completing the decodetree conversion so =
that the legacy decoder goes away entirely.

Yeah, I wanted to do that, but at this point I'm just following what the cl=
ient
ordered. Maybe once we compile with tcg, it could be suggested, but I
wouldn't count on it.

Anyway, I don't think the disentangling I'm doing now would make that
process harder in the future. Let me know if it is


Bruno Piazera Larsen

Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/cli=
ck?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ=
7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUi=
puK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1w=
j0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXW=
nW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDc=
VzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIv=
qmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>

Departamento Computa=E7=E3o Embarcada

Analista de Software Trainee

Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>


--_000_CP2PR80MB449939F026D6CAD8915F2180C74E9CP2PR80MB4499lamp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; The trivial path =
is to:<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; * rename translat=
e_init.c.inc to cpu_init.c (since it has to do with<br>
&gt; &gt; initial definitions for CPUs, and it's not related to translating=
<br>
&gt; &gt; anymore);<br>
&gt; <br>
&gt; Anymore?&nbsp; You mean after you've moved out everything related to c=
reate_ppc_opcodes?&nbsp; Sure.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">yeah, that. Also after remo=
ving every to destroy the opcode table
<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">(which isn't packaged in a =
neat function for some reason, it's loose</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">in the ppc_cpu_unrealize).<=
/span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&gt; <font size=3D"2"><span style=3D"font-size:11pt"></span></font><font si=
ze=3D"2"><span style=3D"font-size:11pt">&gt; * move gen_write_xer and gen_r=
ead_xer into cpu_init.c, as they're<br>
&gt; &gt; used for some sprs, and whatever needs to be moved with it<br>
&gt; <br>
&gt; Well, gen_* things are specifically translation related, since they em=
it tcg <br>
&gt; opcodes.&nbsp; But I see it's used as part of a callback from the SPRs=
.<br>
&gt; <br>
&gt; I think it would be worth moving all of the SPR code out to a separate=
 file, <br>
&gt; apart from cpu_init.c.&nbsp; There's a lot of it.&nbsp; And, yes, I wo=
uld move everything
<br>
&gt; that you can that is related out of translate.c.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Yeah, now that I look at th=
e SPR code, I'm starting to think it's easier</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"></span></font>I think it's =
what fabiano had in mind too, but we'll probably have 3 files,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
spr_common.c, spr_tcg.c and spr_kvm.c. It's a bit of surgery, but it's <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
probably worth it, to avoid a mess of ifdefs.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<div>&gt; &gt; * move opcodes and invalid_handler into cpu_init.c, because =
they</div>
<div>&gt; &gt; are only used by stuff in this file.</div>
<div>&gt; You could move the opcodes to a new file of its own, including in=
valid_handler.</div>
&gt; &nbsp; Moving them to cpu_init.c does not seem helpful.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
While waiting for a reply I tried this. It's really not, it creates about 6=
k errors.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
I ended up moving everything that used it from cpu_init.c into translate.c.=
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
create_ppc_opcodes and destroy_ppc_opcodes ended up going there, and</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
I added prototypes to internal.h to call them in the realize and unrealize<=
/div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
functions.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&gt;<font size=3D"2"><span style=3D"font-size:11pt"> However, I think the s=
urgery required to disentangle the legacy decoder and all
<br>
&gt;its macros is probably not worth the effort.&nbsp; <br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; What will be worth the=
 effort is completing the decodetree conversion so that the legacy decoder =
goes away entirely.</span></font><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Yeah, I wanted to do that, but at this point I'm just following what the cl=
ient</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
ordered. Maybe once we compile with tcg, it could be suggested, but I <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
wouldn't count on it.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Anyway, I don't think the disentangling I'm doing now would make that <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
process harder in the future. Let me know if it is<br>
</div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Bruno Piazer=
a Larsen<span style=3D"color:#1F497D"></span></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttp://clickemailmkt.eldorado.org.br/ls/click?upn=3DUPoxpeIcHnAcbUZyo7TTaswy=
iVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx=
5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG=
6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oD=
Mp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFk=
jH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU=
3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2=
BmF0NnDET6jMLuIqtCcVIch" target=3D"_blank" rel=3D"noopener noreferrer"><spa=
n style=3D"color:windowtext">Instituto
 de Pesquisas ELDORADO</span></a></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Departamento=
 Computa=E7=E3o Embarcada<br>
</span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Analista de =
Software Trainee<br>
</span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttps://www.eldorado.org.br/disclaimer.html" target=3D"_blank" rel=3D"noopen=
er noreferrer"><span style=3D"color:windowtext">Aviso
 Legal - Disclaimer</span></a></span></p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
<br>
</div>
</body>
</html>

--_000_CP2PR80MB449939F026D6CAD8915F2180C74E9CP2PR80MB4499lamp_--

