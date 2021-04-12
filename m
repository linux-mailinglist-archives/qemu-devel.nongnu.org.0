Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A6F35C6BE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 14:52:32 +0200 (CEST)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVw3K-0001XG-SN
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 08:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lVvzd-0000w4-Te
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 08:48:41 -0400
Received: from mail-eopbgr800132.outbound.protection.outlook.com
 ([40.107.80.132]:38848 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lVvzb-0004sf-R2
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 08:48:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcMb/g7TF12rPFaJaiBuS4gUzYs+XwDBopZ3ff1oC256M+NhnGjXgmS73iemFnH5ATsDahyw9F/Cyy5zuxcwB9LRW93a8WQKIKo0oSD6KEn3KX8kjzPL7zeZsKHyU9yeehGBnDWuoQtHg8dGKiBWGTMzIQYK1eduinHA1wluwzwmKSCU9/RaJUnkFxV/QzvAv5+JXh8Lci8yW6NGptat6D1FhyouXmhgA+jThXnozOQ5X6s7Awi2UbLkGFzInDH71KiV0L9kLqu8RE96L7QroedPYvt8QJgsXkngywiY9+INNmbah8RtRVtEJXO4xSTYKCY3mKZTYtYy6MpFkRQDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGJo5ni5yMLrnXV2bLIWDs0hFfm4aAfVAelQTfyebEo=;
 b=hjo6j7VnEJ43M+ui0M0nWNo/Ze9W5nt0g7O5lgXuCKUqq1qdHYtQqT7ldNOm5as+Ppfhl8y4A2qD35+1Z9kywPB/rWfZeGNIZ34YYvs22mMsj28jBWAbCx2QSrCy3ZjLzg3MGKqOssH8vkAXNH86/95rbtAc1IbWOl9Uiihs0Iwv4scFSExXCG/l+4/JDMfjE/zEqGYGEN5/D4j5oPBMdPiZ6VLq29DZZ13uHLJpfTitLVLEJ34CHS+jUngc8+LBQIkvEql4OyqnilqSxok/Nk11zTN+8ajBxukVNZ0othdffa2+uEBLw1XgJ/BVSSZYDoFY4iI810bmRPlREqBTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGJo5ni5yMLrnXV2bLIWDs0hFfm4aAfVAelQTfyebEo=;
 b=l3MAnRbjGJgwKo6to/N2OePgP41johNfLAB3LKRn2cyhSXNBSRMLotxljQjNLqRb7D4vy0usABgknGpe+OPg4mO0kRbafY09WJHsHpYqYabGWRGj7Mxpa3AhBeXFpM1v4529Q+k+SxiuYE+x01jymmknvqszeP9efo/+F49qo+XGPHe7tieWLZbMXlhyoVh4Kb+PdM6lZJRwQUHKJoSMStekOlrhy7sGu9nnqBzA9Fa0kFhAusVYsKXp90PhpoMaE4E81tlu7N8+WQrXvADv17XYPAm3NzFkH1UjOpaFkfP7h+LBV8JTq9bgvvCKxq/TBbiQnlad8UkuLxkwTyQ7Fg==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP2PR80MB3873.lamprd80.prod.outlook.com (2603:10d6:102:2f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Mon, 12 Apr
 2021 12:48:35 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 12:48:35 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: Better alternative to strncpy in QEMU.
Thread-Topic: Better alternative to strncpy in QEMU.
Thread-Index: AQHXL5omkZuxql7c7kqwov5c35bNVw==
Date: Mon, 12 Apr 2021 12:48:35 +0000
Message-ID: <CP2PR80MB449967665168242102F3E397C7709@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <mailman.36964.1618210428.30242.qemu-devel@nongnu.org>
In-Reply-To: <mailman.36964.1618210428.30242.qemu-devel@nongnu.org>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none; nongnu.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [201.82.34.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bdbbf2d-cf0e-417c-79c0-08d8fdb14955
x-ms-traffictypediagnostic: CP2PR80MB3873:
x-microsoft-antispam-prvs: <CP2PR80MB387312DE2EC70CDE39CCD20AC7709@CP2PR80MB3873.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y426ar8FdT2SUtQfYUCSa9lbR0L+w+5yoJLymj+re7qBc6ORKxqUQDuxn/y2JOupF7a6Lncbaw69/A6FNnA+w/UUgWV62Y5Oyymm2G0X//UK5YTL9bTgHm3dmQ5sIOxfGKpGF4VrimTeFrPBHMr9/FOz5QLjs5OhGZv9GMQUNM29v9pscut/dS2IU+nz6XSOHgUqMX669vcRxE/J2Bcp7qdzI/Jo2wPGtdi8y0mUZOWZ79bBHdB9DMOljZMvbWNk3wUOlmnzbwdI6LuyEDBJEwMGX+v1q80AQsrO1krRnkUL71oPqCo9PO6cZ+z4no5pf/5Q647QxLifacp3eQAf9mnZUYvNPhpNHI6KMo13SR99Xap3zFNLNDcDBBzepLE8jnS+bhhopeAEUKsjXiwYaKRTjPachEJ5Eql7vXyHYIMRLV/BthSfxYU+aiD+6QswenuqPNhz3eDENR1aJ43eTFfROg2yGPgKkTAR/tkS4bj7F2Psh+qLRvpzv1Hzn+7Pheasymg570uPxCDRh201iPsjGpesA+ikyCQxMflBCNUbiU5xY7ytq2EFiTjrJ+UifRLdLMrBLK5H4NMlNvZ4Csm5mLEH4K91xFUe0WDDLXswlVe9bnXnQRXeyM6SyImUfXvT48KpcIJikB9II26CHQ47SDNn9oBqs2uDjHBlpktQDkyCnCGgjSRFNPUTZfjd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39840400004)(136003)(396003)(71200400001)(9686003)(55016002)(66946007)(21615005)(26005)(66556008)(166002)(7696005)(66446008)(66476007)(86362001)(64756008)(76116006)(5660300002)(6916009)(316002)(52536014)(6506007)(38100700002)(19627405001)(2906002)(186003)(33656002)(478600001)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?cNry5MVt/WkEWT0NpJPbTxHj5hl3ztIaR6H4oIXeCKDkV0gIxUpYVQjNwN?=
 =?iso-8859-1?Q?KcWxBUaKQpLW8/+/aLleZFQ2BbGOGTG4qB69qXxGaeAxY7ar0rkUMcfqws?=
 =?iso-8859-1?Q?T/FhO+0QtFwsR0xeeFzhmkwl42U+py/Wxo+J/sIxsrWxjPXrfD148TAIJC?=
 =?iso-8859-1?Q?dz0s/UhUIaxS+KkERo5Th8yQBp4eVCCeFa86DlUVT9XbBo24fRsz2Ang8Y?=
 =?iso-8859-1?Q?/ZYwl0l2qKwviyhGBQkhGHxFkEfJ0VH3VW+JCnF4C1N3XxTFZ39TBrzXfI?=
 =?iso-8859-1?Q?TQyNGMq3VqZBgY5pU5zg2ZZGRA7hM50oz52DDI7sHeCLaGKR0ZdOjde3YS?=
 =?iso-8859-1?Q?mzNChOya3z2j9swsMSPYroDXIFhLZNx6GifjutliSDyY25gIaXExSfMXm0?=
 =?iso-8859-1?Q?lSVo7qJPFzbSXke9OXwHA97vDOlfoDsNY2MW2ZdUZDicfpMiMa7bEC+tZ+?=
 =?iso-8859-1?Q?sUd7bn8PbQtmSA94LPPFGlhOM876w4Ln1sH+1MUyTZhniCI5uJ0pUCtPak?=
 =?iso-8859-1?Q?mv5pEArIfjNMw23pHhuSlug1ORZGFABxd9CZQHd2tHlGYu6GI990X9390o?=
 =?iso-8859-1?Q?15do6wID67hyFZVJTIGdVMuQ0rA08iKuOCrQgXJ0AfiB71jXd12GnAvJzT?=
 =?iso-8859-1?Q?jVGhR4ufSqWfqpWrDcZUdLHGB7zawSMOGrnvJ24MBNCH/0GXQAmG2LHbtn?=
 =?iso-8859-1?Q?DflDyX1pBzRA0xQEMXnGL3Ami/l131rzFPM1kk8SgPwgQycKVgVtdg5gpL?=
 =?iso-8859-1?Q?SMrPoP5n5NsTACzxMEuhk7GhUI7+MGlpysG8eV8+3WmdqruxU0Aj7XeJfn?=
 =?iso-8859-1?Q?Y6wd9vt7cyyUK6n/W4NeLo/RsoBvBeOsHImT1E00yA4xo9keBHy3bRPNKj?=
 =?iso-8859-1?Q?RrOAbPt1fYY/cPC39ixovzp4iNQit9m6Wo2KWMDxCXOoS1U8mnx9PtkJ2J?=
 =?iso-8859-1?Q?d3TryS4rL2yWsC1DIJo9UwdurALbQsfaj1cWigesKnaeklZeLWORKw8KQI?=
 =?iso-8859-1?Q?dC5E2NIZUJjsy25hL6EeMxV8+sUL9HjmEGNx5wxW3w7b/RimCy7xEl6n9e?=
 =?iso-8859-1?Q?OUruEonh8ogjorfYUpkDiH/LgnkwCgDhJePtoePlGYxw3/Pde8yyx3Hc9F?=
 =?iso-8859-1?Q?nMJSVW2R+r41emSGPJwwFDgKC0loxnGMStWmv4xstjcciQzhDjhEubsqOV?=
 =?iso-8859-1?Q?aEyS5rjufzAxb8ZvqKtAH4Gf++tnt9ahwSxTxU9Cqy8j+2A/MeuFb17gJN?=
 =?iso-8859-1?Q?60e9/qv5BY0k7ZVUVz1dC9cW0n0YWlXUt2JjqZaVlmABUl3kyIpJHI0m10?=
 =?iso-8859-1?Q?l6p+h9xERCM4DuIwXbGya/fsWSwqy2JMV+IuZn8yEDbEbPE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB449967665168242102F3E397C7709CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdbbf2d-cf0e-417c-79c0-08d8fdb14955
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 12:48:35.3053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2A8/HJSs0au8eDGpDJjQta0D1fMtT6/6jo4J57TTbFsDvTJWMZptDJueIgp9Go5cfbyEz/ZKArv81JOmO9peZS5IzOD/PNgRUUqZN/nIF+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3873
Received-SPF: pass client-ip=40.107.80.132;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB449967665168242102F3E397C7709CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Im not sure about what "better version" means, but my guess would be a fast=
er or more reliable version. If that's the case:

>     for (int i =3D 0; i < strlen(source); i++) {

Since you're going on ebyte at a time, there's no need to know how big the =
array is. As a stopping condition you could use source[i] !=3D '\0', which =
is one less pass through the array.

One other optimization that could be done (but is a bigger headache to impl=
ement correctly) would be to cast the char* into uint64_t* (or uint32_t* fo=
r 32-bit systems) and copy more bytes at a time. The headache comes from fi=
nding a 0 in this longer variable, but you can probably use a similar strat=
egy to freebsd's strlen (https://github.com/freebsd/freebsd-src/blob/main/l=
ib/libc/string/strlen.c).

I'm not sure if it would be a real speedup in most cases, since glibc can u=
se this strategy already), but at least we'd have consistent performance in=
 case some system doesn't use it


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

--_000_CP2PR80MB449967665168242102F3E397C7709CP2PR80MB4499lamp_
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
Im not sure about what &quot;better version&quot; means, but my guess would=
 be a faster or more reliable version. If that's the case:<br>
<br>
&gt;&nbsp;&nbsp; &nbsp; for (int i =3D 0; i &lt; strlen(source); i++) {</di=
v>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Since you're going on ebyte at a time, there's no need to know how big the =
array is. As a stopping condition you could use source[i] !=3D '\0', which =
is one less pass through the array.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
One other optimization that could be done (but is a bigger headache to impl=
ement correctly) would be to cast the char* into uint64_t* (or uint32_t* fo=
r 32-bit systems) and copy more bytes at a time. The headache comes from fi=
nding a 0 in this longer variable,
 but you can probably use a similar strategy to freebsd's strlen (<a href=
=3D"https://github.com/freebsd/freebsd-src/blob/main/lib/libc/string/strlen=
.c" id=3D"LPlnk206464">https://github.com/freebsd/freebsd-src/blob/main/lib=
/libc/string/strlen.c</a>).</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
I'm not sure if it would be a real speedup in most cases, since glibc can u=
se this strategy already), but at least we'd have consistent performance in=
 case some system doesn't use it<br>
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

--_000_CP2PR80MB449967665168242102F3E397C7709CP2PR80MB4499lamp_--

