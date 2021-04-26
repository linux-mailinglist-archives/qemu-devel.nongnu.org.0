Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BFC36B294
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 13:55:26 +0200 (CEST)
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lazpk-0004G7-CW
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 07:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lazma-0002xB-7n; Mon, 26 Apr 2021 07:52:08 -0400
Received: from mail-eopbgr790113.outbound.protection.outlook.com
 ([40.107.79.113]:6171 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lazmX-0000jk-Ai; Mon, 26 Apr 2021 07:52:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Au0pczd45zf6LMOymX0IPD6eJnpJcM8i92wBQg8vN/2/nvDTj+z2JhJ56IJ2Y7/eC8YRePjh05J/z7V30kbDTZs9iVm7wnQWM5SzHaNoPj0sIcvH/+CrTGU1bhDlkCvvH4Medkorf2vUdt1k2aqQwl29azgWuPg/pAFoghgKcH6bkVd1fEm03+3HZdhDM3WbVpkeqSAx9cfFHNasw5SC/myj/9Tt8+lZLuBIm6ZUqymY5vK/dxFOlM4lZ4mgg8s3oSwbf7FY0/+4k/q97HgF90wDD4aQBnaGttNVosufOBSbM4MkDrLukiKRZVojCTdFooaHPitUjXc9jeXj82vI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+he89qnn8yCjUtrzmoR5vHZBuz02fiIaXd0lBj83ok=;
 b=fPHVE32o36ck1ccJLDPERX2/bj54vArx7ptYITMYo5ykQIEA9vVgoLuE1w4vsYxzMed1n+TJ2qxWfujpUrTA1mgFlRNuyQEdA3i2TpmlYeX/h7gnOSm4pr9t3Z4Nxk7IxjCj2cJVJzsavQBB7SeICY1l+xdYf0jxKOWDQKkmK31eb2mxv/cKvhD2LfWPyLOSqklJNtSd5KXhHC5cyd8eMdkSLkl5ZtOkkTwg0lcW8/qp1kTKcuWf7j+sp6ClwHPGCzLoGfgLtcwdUV8j9sKm9VbNyAYEND9/uJtLq+NkH6aBOBvB9wawAsUSuo8MfXWhG13ERsTN9mHmToKO9lPvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+he89qnn8yCjUtrzmoR5vHZBuz02fiIaXd0lBj83ok=;
 b=NTfLatXHxdmjLpng7S7L+I/ofbJsAhWDqZdFqmsGufD3xag2qmrAp2txTkM2apiRaJ1GtZLTF4M5S2JrTrD+HQ7Srtk7hN1i+6CnCZ7/vrfykkoJI014o4KOilv3MrkMjaHXx2pViA7IDIlwATPqpp5uDoYrjSLDqbWXIKgA4bREehdj0rZ45UqZwy+IOvRPx/G7Y1JTj/7KK/9c/4N0yMH2RuUo0x2+kMJHG6Mc9+KyoGGKgj4/AYVj/J3i9piQ7C9QWtYZfcCRS5SwoWNNzJ4vc9z6blGaIHIo6fjMme9mtVhlztZW0BeMiim7V3KkL25wAOxmcSzN6QAprs+Hww==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP2PR80MB3874.lamprd80.prod.outlook.com (2603:10d6:102:34::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 11:51:57 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 11:51:57 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 0/4] target/ppc: code motion to compile translate_init
Thread-Topic: [RFC PATCH 0/4] target/ppc: code motion to compile translate_init
Thread-Index: AQHXOHV11OTffNfr0E2ueq3p6HQ/WKrCxB6AgAPvRPk=
Date: Mon, 26 Apr 2021 11:51:57 +0000
Message-ID: <CP2PR80MB4499B86147B6D7C2C975152DC7429@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>,
 <c68d5932-fa77-4521-3860-ab471f834386@linaro.org>
In-Reply-To: <c68d5932-fa77-4521-3860-ab471f834386@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [2804:14c:482:7ed1:571a:2a0a:f5e1:e426]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 854f7007-433d-4f2b-d287-08d908a9b1fd
x-ms-traffictypediagnostic: CP2PR80MB3874:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB38742A9F5CAF3639CF27858FC7429@CP2PR80MB3874.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P59p1jXZmf7m8243zk+C6H5Ry6bOsbPjYhFFLM2VgGtSWWe5YeLK86aWCB0t3pDXI/+bCQvH/MqaVFqC4GqAb/1lhKThEHPOD8asRL0y4DJxKdU7yNI3RIUxTPvnRq7NWLxmunhYRNFQAoLR0rD4gcqkWcRWbjvgay4muWUBwYP1Q8W3uo/JXMY5xS3K6tf8RP246P0zL/o7q0zBbOvv/fU934Pcx/iMjqw0RRW6FI1HpSNPAWdjjl+wFtPB5WWSHr5ljCx9Bq983RC2IUTbaY4UvZiLPOjWSBmwHzw2TOs0bJvXT9fXV14mvu2QZdnearmLqH+ru7vCeN+traAwvvJDvrtSxf1aqETublrULhFgi2XGoXn2y0hBjucMRJ2+s6cRdrQ9TLddriWI70B7QvisnB+NOUU6yH43NY4HFEPXPQbDTRRAhKJoPtsZfoMHgwJPdZyIQ3N9JgYXLj5uUk4eAtTbilLhOUSdlvw8PnYIVBfvPq7F6LMpWXVQSA16S6I2uGiWQjQsz7g8zuTtYz8FDdn1H4bXIi/wNQNq7KTj5tRD6GpLtma/3jfEQw34/EgxznA00lRHKETMyHI9/hoQzwWrUUs5EG6xd4C8B1XFPylAqB54KYuCAr39hSQDDDNSuI6sKx7yvt05dnViNu6ssY2zCtW8n78DbGjNJRQzliRWeAZv0eNn8azAlneu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(39830400003)(366004)(136003)(54906003)(8936002)(6506007)(186003)(19627405001)(110136005)(86362001)(8676002)(166002)(7696005)(66946007)(316002)(66556008)(66476007)(64756008)(76116006)(66446008)(5660300002)(71200400001)(33656002)(21615005)(4744005)(122000001)(4326008)(478600001)(38100700002)(9686003)(2906002)(52536014)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?oRcuyPFa9cC91kl0Zjxx441GxU1l+uaT+Yo6FWcd96/wC4RPRZg1hSQEgf?=
 =?iso-8859-1?Q?7X4teTxO+k3jniYp0RMDAI+4acJ+kR6qzZIBkV2n+OIJ9zX9d4laaGGWTw?=
 =?iso-8859-1?Q?jKB31LX3LzDjgo70PwEnLRJfsJm2OL7RO61OwHJwKbHc5x5lzQNnmrirZ6?=
 =?iso-8859-1?Q?J6EzXvakN/qauiGfdo4s5CMhZN/EZYhnIeQ+I5t5Qni/TV/b+gZ1bQbhbd?=
 =?iso-8859-1?Q?aB2D8g25At10SnXn4wE9E4WuhU9vI47J+EPfBU8S+Id3XOijivrsMYIkOn?=
 =?iso-8859-1?Q?wkj2xk+21p/p2QLR+lzyMRVJObiLnV9EbJZEh8zDyeth0JjL1COnzBqrNu?=
 =?iso-8859-1?Q?ro4J4MuANI6iDyodJilbufEOlzbJD9t+cl5/OzcXTMU8I2xPIbtv6Glx7q?=
 =?iso-8859-1?Q?ZNY++rVXhXBtwHzOVjUwwUqsWHC2t9y7NoEmJhOVh5fqAQKaFaubj3ISkc?=
 =?iso-8859-1?Q?dgfe674NF15M3wTjhMtnkQeCCcRMNhRK5JrQKcXCPiON8lsWDx0zhw2TcL?=
 =?iso-8859-1?Q?cssNM+0ijXn8FqRXdky1pXzbLc9j8XFNy3wjw74lgTSRVZk5/pllzu9/V7?=
 =?iso-8859-1?Q?rBFvKOOU6gn9lSSQFSjfTEuWlmclpKlwwUbqOd+f6KZEIKPmLTfEf/190+?=
 =?iso-8859-1?Q?ofCNrPgXvfj7YTxxbzLFcT+aNF/AxRg0062SPIegmxBj8OPkBKH5pz65/2?=
 =?iso-8859-1?Q?5JfQ3+0mOcRpfSV4piwKOYPyjW3m75d5ShGUv5lyHaFMaNZvCGwWols0vF?=
 =?iso-8859-1?Q?W697aK8vUM61P1o0MrQjz5kOVdA5uJiEmzaSZJVNiPg7KvUYMXc4JE/ujd?=
 =?iso-8859-1?Q?caTn5VNd5rcOnYRyXCfCp6OA63NvVRo+vrwzwMQhmYvDRG07oooGd1STJM?=
 =?iso-8859-1?Q?7Ls4vCBHLoI3+HEkTFzl453r5veRMJOu2t/AbOoIrBQrszA/5AHNkCiqpi?=
 =?iso-8859-1?Q?ZM9JUQoe5NSbo+Fj79+trXzbRUxkVK/hFxhJEm4c/cfNxloLLg6kKR/Arh?=
 =?iso-8859-1?Q?/Ldm618BcfTSWDy0fiqtQ+9B1aqMZItcJ3jcAvszKoWMacUKSbKGtlJy0t?=
 =?iso-8859-1?Q?sotGNg/Mnn8bdmLn9S+c1Q7UpRrhZsOUOAsuA2/nBDNsnBjV8tbWgusAqp?=
 =?iso-8859-1?Q?Sv7lbvBKaaTR8dUeXgxrPa6VYV8j0n+yKydR62ZpXzrxK8fcofyv5VjQjo?=
 =?iso-8859-1?Q?4JX0bE2zzoOKHABddyfzY98VhAe9y0rZPgHk3lx5L1B+TKpEPS9HaL20Y3?=
 =?iso-8859-1?Q?WxEksv1/XGPJGoGZ3k6ztALWohII1x/CUJeMTI3MTLleXL/m9WgIYdkaK+?=
 =?iso-8859-1?Q?+C2b3IQcUPaNkUFHcokoi4hMZEPV6tYOl/aG74i16WEQMQiFiRObykq2g3?=
 =?iso-8859-1?Q?iuJcASd5bzGUW7Xs1n/bRx5RQUeo9SrMcI0nWpmsIp2ThfBuxswPE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB4499B86147B6D7C2C975152DC7429CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854f7007-433d-4f2b-d287-08d908a9b1fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 11:51:57.7703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TvGYE8yiNhOXyv+gvKdfSFBihIrJm6TpEacdIKyQiSRh7BNfc5szaru47IhoHPwJ5bYA29kS5EBNp2yQpA8xZuBwNk43+gTp1aa58Kivv4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3874
Received-SPF: pass client-ip=40.107.79.113;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB4499B86147B6D7C2C975152DC7429CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > The current patch series aims to isolate common code from translation-r=
elated
> > code. This isolation is required to disable TCG at build time, and the
> > final system still work.
> >
> > This patch series is still WIP, so comments are welcome
> >
> > Bruno Larsen (billionai) (4):
> >    target/ppc: move opcode table logic to translate.c
> >    target/ppc: isolated SPR read/write callbacks
> >    target/ppc: Move SPR generation to separate file
> >    target/ppc: isolated cpu init from translation logic
>
> This does not apply to master.  You should say what the patch requirement=
s are.

Oh, right, sorry! This patch series is based on my patch from April 14th, s=
ubject:
[PATCH v3] target/ppc: code motion from translate_init.c.inc to gdbstub.c


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

--_000_CP2PR80MB4499B86147B6D7C2C975152DC7429CP2PR80MB4499lamp_
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
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; The current patch=
 series aims to isolate common code from translation-related<br>
&gt; &gt; code. This isolation is required to disable TCG at build time, an=
d the<br>
&gt; &gt; final system still work.<br>
&gt; &gt; <br>
&gt; &gt; This patch series is still WIP, so comments are welcome<br>
&gt; &gt; <br>
&gt; &gt; Bruno Larsen (billionai) (4):<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; target/ppc: move opcode table logic to translat=
e.c<br>
&gt; &gt;&nbsp; &nbsp; target/ppc: isolated SPR read/write callbacks<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; target/ppc: Move SPR generation to separate fil=
e<br>
&gt; &gt;&nbsp; &nbsp; target/ppc: isolated cpu init from translation logic=
<br>
&gt; <br>
&gt; This does not apply to master.&nbsp; You should say what the patch req=
uirements are.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Oh, right, sorry! This patch series is based on my patch from April 14th, s=
ubject:</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
[PATCH v3] target/ppc: code motion from translate_init.c.inc to gdbstub.c<b=
r>
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
</body>
</html>

--_000_CP2PR80MB4499B86147B6D7C2C975152DC7429CP2PR80MB4499lamp_--

