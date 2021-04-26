Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51DC36BA19
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 21:34:18 +0200 (CEST)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb6zp-0006s9-9i
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 15:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lb6vk-0005yF-1M; Mon, 26 Apr 2021 15:30:04 -0400
Received: from mail-eopbgr740132.outbound.protection.outlook.com
 ([40.107.74.132]:53910 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lb6vg-00051v-7L; Mon, 26 Apr 2021 15:30:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvUDfkSp9J7054dejDmZ6myeWnUbsf4VIJfZwophO6lE3y6rtW40dZqNEBPG4TBLItfudlnMlUMNPAEGwwuoalRE78/bpUKT8l8NksSa4mIDpH5rzaRR7b9Jy62dPIDnLauNrYsAG39KSY2bHILa9TMZ2Ycr+wEYqvey1pfSC2i4omGYfklM/s+ombA9Xt/iRzJya9UmI3Im0ozH3VoZBYBqdqD9+OGQnJ5jVMDUkUdPgDKOIIER3jNkmzvOBGI9U8JiLIhfrSsi27+CxUJ3H4EQLR91CQOkVh+0SlWpWLJ0JxKeP+BwLyG4tP5L9RJJ631oBB17OqgfaRbDOkvSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqUts5DpnCORE/Ky6H2ZOPEmF71t4BXRiK6ihD261HE=;
 b=mFWBwjnDe/VMZp/KKwtu2OZ/2ttD5CTfRG/NviSNtE+O8/ndMbvzWPotSibrHeJGb1mgkVd6ICquM6kkEA4wg3zUgE6dIYumm/cM9FBRDaqYrVWNOeRwxpzW/NpCJ+YAff64OorS41y3vFpvFHZUREjPe9dh1txPGw0wKMXvuWSQyUlnyFXNZDSETD9aTRjLXz6UX4vgGYwspp7PxhT6VMi75LwwoPaXdVss4K//Q8CLoUDtBNiCPRC16qsr9pf8OLR//CUQuHZUXa86wgNNx940JRbr2mZ1cSUBwyHeu6UhNCa7TeX40zVM77nujiqUpuwkwbjlGXxAPhioRG7Z1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqUts5DpnCORE/Ky6H2ZOPEmF71t4BXRiK6ihD261HE=;
 b=jDFCwJZP/inoV0NmF9MwNtSPtuVPhtduOvfd3FPFzUFOTaKwJ05pkMAUKKOYLGxTLUuDCkh3uSUhhmUvG7zhMiW5Jl8m3BnkEjvSm3tlkTt/s/ZPHKFCbCGhFQx0x45Vq9S7gWb8eTe3xD26ILKk+RRHi+bLc1qD5WkIzEKXJrBX6ps9p63Hpgm6EzAwpdrnAzyNIocBFyJIg5GvyzXNpapw/XKsnIC/4NZr0JQDjdXdGYrpmgRQKYErZlbXPKg3+NjKR+cvAohbxlLoLdXcPWr1mJ8kIV6fcdxPLpAkWkwJGtM0wYzaGQnbw6hAJOWYjA98xQSf9Y8nVAbkobRotA==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP0PR80MB5137.lamprd80.prod.outlook.com (2603:10d6:103:1e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 19:29:54 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 19:29:54 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: Fabiano Rosas <farosas@linux.ibm.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 1/4] target/ppc: move opcode table logic to translate.c
Thread-Topic: [RFC PATCH 1/4] target/ppc: move opcode table logic to
 translate.c
Thread-Index: AQHXOHV2YkXOr090dkiwvNK63T14E6rHMBeAgAADL64=
Date: Mon, 26 Apr 2021 19:29:54 +0000
Message-ID: <CP2PR80MB44994743B9245C417246FBDAC7429@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
 <20210423191807.77963-2-bruno.larsen@eldorado.org.br>,
 <87pmyg3lis.fsf@linux.ibm.com>
In-Reply-To: <87pmyg3lis.fsf@linux.ibm.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [2804:14c:482:7ed1:571a:2a0a:f5e1:e426]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6db074d2-261c-441c-b871-08d908e9ab6e
x-ms-traffictypediagnostic: CP0PR80MB5137:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB5137A93389943AE0B5935C21C7429@CP0PR80MB5137.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AnYMb6iEPTfxZ3rvY4udNY5UNZi/4SKdfXOBgHKRzjeXhHXedPxFGbTj7YFh5B2ymR1mP+YR5byd85PHtfPW2EFnbXoR9rYLBLknapujOYag/RFViVqAwvDgOAplhyh6M+h6ts6TjyP1Wm+hF4aFdRIjlAGBcNEXcv3wKpZcC++KEFdMZ83fqYID9Y4rc5SK/qz6sTOyAGaNb2wNOh3VSQwEzX/6UVzsajdaDMjoml8EroN9zYES3qsYmSM0ew8j5/WQ5y/S52nQIoIi4pEXnljy2eli5zJLHuk3e5eds7y0bPStmIn4Mql7HRBXxBvW9lq2mVyCWm5Dl1ElgsRC3vUhqDer56vYgWDAeS0/lj9bBPhztsZBUUMsRWddsdT7f4g9fzQFNy//EiaQCdUQX9Fhgo7Bx/AX5d9dC+YJkI8ahV45ofN4YIpzWZgFydSr3nSo9blmNMKatNiwTONUOx/3IQ+hR5LjR+rj8/0i+3Dg1gqX6qDEjKbQKZPFtY36AwYKLsN+lWo6EEA5WhmtgF1+Vzvwf8xmITxtPZDopi4CNospE2nut7iGVpisk4qXiWCOgZGoj5Bc4wQI2JLdvpb4iNr2vclbT3gqvDsj+c2kTgRLAUtArhwwl5AEmQBoemlpoSSbuXey094WjW6a0zZhwMaxwgT2ae24VY5Gqdt51yisfsX1dVoDsTBy7Zdy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(366004)(396003)(39850400004)(376002)(6506007)(5660300002)(52536014)(8936002)(21615005)(66946007)(186003)(66476007)(8676002)(76116006)(19627405001)(66446008)(2906002)(7696005)(71200400001)(86362001)(54906003)(33656002)(316002)(64756008)(55016002)(66556008)(9686003)(166002)(4744005)(38100700002)(478600001)(4326008)(122000001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?FNMTbY/eW0Y6VCprpsrJrKYYhv5dWSj/hXn6acR9EWXIECsYxQLFU9FUlb?=
 =?iso-8859-1?Q?l4Wpf2HnI4mhHuO83+EgyB1+PbdpeaLHun4LLyNrMLZiVlGjaGr6/u27Zd?=
 =?iso-8859-1?Q?uHNMrdlhJZJJ/gzLJjirCzZRQiBx7jhtj612NgQ0Qi17ZIRNsarIBhQN7P?=
 =?iso-8859-1?Q?4P+ysA+Dg2FV5VsQGS8uD56C7JKZLMQ6V1HN70sj+xScl0UlwhlgZ3Di0G?=
 =?iso-8859-1?Q?GE3XoBaYq3knNbBpslZKzgWvU7vgGcZa+Kd+8xAfFF///7nCUHAhe6oak5?=
 =?iso-8859-1?Q?w3sdfGZ8HIaNUMzgSAzdoEtuQ887PEt+opUBx/MNJP/JQUnsCh3TuMjjvS?=
 =?iso-8859-1?Q?eU4A47mfGoLtcPptUbJrAiq6MfJaO2Dz5Cq3LdZ5qpuKZODkq/vwtxId9y?=
 =?iso-8859-1?Q?5m7DqAkwwxth+c8zLF9KpUbklyIAZ3A34A6DCA1U8BXXhybL7oOOSBJHv9?=
 =?iso-8859-1?Q?P4DATgEKDPza4JAO+EQBCZ44n34z2X6e8qoNpkZFJIyjfjF4hdmmqOaQtq?=
 =?iso-8859-1?Q?WG2XjDcS6SDIUVEvXig2RZbFp/ze2dI0ne3UmLq0tNmkffrJhxqqxuqoqf?=
 =?iso-8859-1?Q?PBF/SNfEVGOjjTAt4uQnpYT/Jd/Yq7rSbN0ddju53/3/lZkXZoLmArHlT7?=
 =?iso-8859-1?Q?4zyFhtEOi4f84vu3zv+7M4Jtw/pq9acqJmRfluD243STIgYgFcALlCVO0U?=
 =?iso-8859-1?Q?ImgkzDY2KKj3TlNQVmjX8bi6myPKJlHlYBQ47BSutD6yEUNTklg3tawYAl?=
 =?iso-8859-1?Q?a0VVSB0ekTe+ma9LiA8Eybx67ZvvzAtaGjrfp0XOlyFs3WQUhpVxepPlCC?=
 =?iso-8859-1?Q?58nHLwmed8XPeny+mi6qNRsA8ZF8xOCP5cz4Kl2xCNLwVSxabv6Ve6StHD?=
 =?iso-8859-1?Q?M88c8PIddZG3em6B2/MbHsoiWwB1IJOqxNf0pfZswZCEbyeVyBcSAv+cBJ?=
 =?iso-8859-1?Q?bteSclukchA27B1fGDH5FR1FVi+RLNmpavA6CAj2ND1tvaiWDByO21tV+k?=
 =?iso-8859-1?Q?2GJS/w9KdD8rrxm+hinoy2tcBLRZwJ7tDw6WMMZ5O7xbkibGAbwOVgrIKC?=
 =?iso-8859-1?Q?k/ZOh/n54xri8b/xVmmek1xTZJL/0rFrN9OfTQcR41VRW9nWaL3Gi5tkJc?=
 =?iso-8859-1?Q?sTMEmvxLugXvSssCvjOWyr+30XTHdkDHCMyI3vbn7rDKw8nB7Th9/EJ4AA?=
 =?iso-8859-1?Q?qmmiSTFxB+aX67Gbe6kfHGUMXgDrm8eAGKykz3foZCd8/3PiM6LJbImJHH?=
 =?iso-8859-1?Q?G7P9gfNBzVxpZRmGryOu7agkCANmtEVLp6KlTaIdl9mpmKzldXSuuRH1Bg?=
 =?iso-8859-1?Q?8jGKjS7EJOM6Z5WLcjN/ig6RX1L2Mi0+TVPu5hh4GfK1etlzFUsZCatQHk?=
 =?iso-8859-1?Q?95yIkAoNhV1LcOU5hir0CYGjEQcwJgqHiQPlA8h04KlgfRHZhmpyo=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB44994743B9245C417246FBDAC7429CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db074d2-261c-441c-b871-08d908e9ab6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 19:29:54.5488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bHwYBVnZ1fO34M3UA/85E602bMaP+dZOpfIEiYL90fxOrOIK/+owFJPaF7/4NNsa6OOW534BGDxDvelw03TvWcoUrINLnHB7pD0l4Hi7bkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5137
Received-SPF: pass client-ip=40.107.74.132;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB44994743B9245C417246FBDAC7429CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > code motion to remove opcode callback table from
> > translate_init.c.inc to translate.c in preparation
> > to remove #include <translate_init.c.inc> from
> > translate.c
>
> I'd mention the creation of destroy_ppc_opcodes since this patch is not
> strictly just moving code.

Sure, will do for v2.

> > +#if defined(PPC_DUMP_CPU)
>
> The commented out define for this was left behind.

Good catch! The define is going to still be used by a couple of things in c=
pu_init, though.
I'm guessing moving to internal.h is the best solution, but correct me if I=
'm wrong


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

--_000_CP2PR80MB44994743B9245C417246FBDAC7429CP2PR80MB4499lamp_
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
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; code motion to re=
move opcode callback table from<br>
&gt; &gt; translate_init.c.inc to translate.c in preparation<br>
&gt; &gt; to remove #include &lt;translate_init.c.inc&gt; from<br>
&gt; &gt; translate.c<br>
&gt; <br>
&gt; I'd mention the creation of destroy_ppc_opcodes since this patch is no=
t<br>
&gt; strictly just moving code.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Sure, will do for v2.</span=
></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><font size=3D"2"><span styl=
e=3D"font-size:11pt">&gt; &gt; +#if defined(PPC_DUMP_CPU)<br>
&gt; <br>
&gt; The commented out define for this was left behind.</span></font></span=
></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><font size=3D"2"><span styl=
e=3D"font-size:11pt"><br>
</span></font></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><font size=3D"2"><span styl=
e=3D"font-size:11pt">Good catch! The define is going to still be used by a =
couple of things in cpu_init, though.</span></font></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><font size=3D"2"><span styl=
e=3D"font-size:11pt">I'm guessing moving to internal.h is the best solution=
, but correct me if I'm wrong<br>
</span></font></span></font></div>
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
</body>
</html>

--_000_CP2PR80MB44994743B9245C417246FBDAC7429CP2PR80MB4499lamp_--

