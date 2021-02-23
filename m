Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A743322F27
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:56:41 +0100 (CET)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEazI-0003KO-HF
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <djw20000606@live.com>)
 id 1lEWP9-0004Nt-L6
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:03:03 -0500
Received: from mail-oln040092254031.outbound.protection.outlook.com
 ([40.92.254.31]:13906 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <djw20000606@live.com>)
 id 1lEWP7-0004BZ-AA
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 07:03:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjEXHg6oioC8kiExSvPfYwHTznOipMfoi3sFgqIAkI482FK3cxkl0PSiPaLpU8Ir/D1p20NSHpkxjmeYlQLydYje6Wgr4uT1EN3V0gje3yHu01UENErweyTI6g73FeyfQoWPFOjNNtNwyGZYrpElQ9mS4oOfCl5mDyucwz0YyD+aPu9OTLlX3yqAW87m0SsaeAJFkMRb3C+Jfj9nJu/d5h6VNoUnAWYVNt7J99g66h8X2RljY178nzp0+gre6mKVNaNefjPRxSPchPYrawVT9l0Mm19WOJHSECcBKBJLkXsG9EwkHIOr97UgutShGeR8d/USrZaSBWmR6wXaHqPkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMAC+RaSdft4rTq/Mo0x4MgIc472BuIkmX3LUdR83M0=;
 b=A5CYQf0v2kgHray/HSBULg7xxdlZLGT+rRlLicMg6qE/dDP6PtYEJgYclO+B66bg8WNtuLiUzsX5C5hhi4/jttQveMfuqq+A1xTF35xB7RsNYzQ+WXJm9aOsnXTjK+O73cchUEPmuFJ5RJihNgFLuGDIcaS+IpkZI/v9b6zpePrKd/EgtBBzswEBHBO2PlQH/vh7VNVg8zNF2YaGHNftfyRP1+p5nHBAVIWAl//NNvmBwCvUz8UXroXgT/PlTceIrkb2p4r04VXxowkQF7AIC9wFr6wq00fGHQ/klBXKMLqHs6emoZ+rAF8Fzr8YmM0UhgFdrQhpyFojhRTyNyvb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMAC+RaSdft4rTq/Mo0x4MgIc472BuIkmX3LUdR83M0=;
 b=VW1QWjnOMEZrp0et6esosK47pi3eTUUzA0xQCFR/ccqxnB7/6vYgSnuhbCO08XLSiZQGRON5fC9ti2l3oObA1vh13a0MxXwwG6nZ+LZ8SqXKrdQV/3YO4z7geVI+bV1esEtUaEiuTyYji5IXwRPhU61zoB72XETatf8bYOZxA9yx4Vcyr+XK4LC5PqPUOWbAL1jioEsy1TpRcyxWsfivI4m9IXqrtIvHTLlo4i7OIuBgO0WBVh8qnJSLVQpy6P0yzysoBItKGVw67/SAny7/dZz4ZXppi/uxa19MVgwiNP1411X4jMEdoWiYBV2m0CJqWc8prmCmnI5c02zTq05odQ==
Received: from HK2APC01FT052.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::44) by
 HK2APC01HT024.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::421)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
 2021 11:47:47 +0000
Received: from ME3P282MB2194.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebc::47)
 by HK2APC01FT052.mail.protection.outlook.com
 (2a01:111:e400:7ebc::244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Tue, 23 Feb 2021 11:47:47 +0000
Received: from ME3P282MB2194.AUSP282.PROD.OUTLOOK.COM
 ([fe80::6d42:6489:fb6e:4238]) by ME3P282MB2194.AUSP282.PROD.OUTLOOK.COM
 ([fe80::6d42:6489:fb6e:4238%6]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 11:47:47 +0000
From: =?gb2312?B?tq0gvfLn4g==?= <djw20000606@live.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Questions about qemu virtual device.
Thread-Topic: Questions about qemu virtual device.
Thread-Index: AQHXCdiebgwn+dAEvUChMUGW1bhA5g==
Date: Tue, 23 Feb 2021 11:47:46 +0000
Message-ID: <ME3P282MB219482106ED855DDFA703408D8809@ME3P282MB2194.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:AF0F833B5757E4BC87493F8F8ACB7044BA5193855AC04F9E3BDA2D9F1184AE81;
 UpperCasedChecksum:A016D1B25D23B33F703B83E503E3936E11D3DDC9B633B544595F8393606A4877;
 SizeAsReceived:6643; Count:41
x-tmn: [X+0YHue11L+hV82WHBpT8Mbi9nv74hcs8c9AwuvvVJg=]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: b70e0c60-e696-4b7e-8f83-08d8d7f0d6ed
x-ms-traffictypediagnostic: HK2APC01HT024:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c1lKJS3IVpdHxqBzcrqUTc4cJIA8meAhgs6PECCcKCtWG6YTz87Ne4/OBPZZ9RLP/I5DpFZnpOHLhiTB8R9uZVjRejrRjd01PxLrWl6x3sMgBOVjLDCnEvDvMFxRdYT2YqVTGQW3gWktrRDd2zabdUgInOSgovv9Bv5oH7S/75LS5+YiYUbPqOUdU40TX0s9BQNaHrmn+X+OYvMuuNdJ8m17vCroJYPnfU73Q+QKichpvRlBd5jBcYHGnr4imouXmPxgxFeVDaAg39sM0NhYY4Bk7JgZt7EVnDfq9G/iVuKwRUnDyDOwHII0VB7wOPs63rgA+QXYhOZaCKjA34h1pI8XkD8x73bg1BRiY8kMqG2oyXvFPzg4N7UyptYATBsxS9Y9V8FfIxAw9pHs6vBgmw==
x-ms-exchange-antispam-messagedata: u5JWKJVUC26HWTkdxpe/dhs/937XNOLhZh1OfHYUvocO8KyviSC/whAOhOPJ2iUKkDFhb+XkLf6oRyzK5Mc5saUz/HLN94KQ6GjBTpwSYNs6HTZfSej5CEtVSD/sbLJhlvOX8wJ5O7odgGgrPdkVcA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_ME3P282MB219482106ED855DDFA703408D8809ME3P282MB2194AUSP_"
MIME-Version: 1.0
X-OriginatorOrg: live.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT052.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b70e0c60-e696-4b7e-8f83-08d8d7f0d6ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 11:47:47.0025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT024
Received-SPF: pass client-ip=40.92.254.31; envelope-from=djw20000606@live.com;
 helo=APC01-PU1-obe.outbound.protection.outlook.com
X-Spam_score_int: 57
X-Spam_score: 5.7
X-Spam_bar: +++++
X-Spam_report: (5.7 / 5.0 requ) BAYES_20=-0.001, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
X-Mailman-Approved-At: Tue, 23 Feb 2021 11:52:20 -0500
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

--_000_ME3P282MB219482106ED855DDFA703408D8809ME3P282MB2194AUSP_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

DQpIZWxsbywgSSBhbSBhIHN0dWRlbnQgbGVhcm5pbmcgcWVtdSBwcm9qZWN0IChzcGVjaWZpY2Fs
bHkgUU9NKSwgYW5kIEkgaGF2ZSB3cm90ZSBhbiB2aXJ0dWFsIGRldmljZS4gV2hhdCBzaG91bGQg
SSBkbyB0byBjb21waWxlIGl0IGludG8gobBxZW11LXN5c3RlbV94ODZfNjShsSBzbyB0aGF0IEkg
Y2FuIHRlc3QgaXRzIGZ1bmN0aW9uLg0KDQpJoa9kIGxpa2UgdG8gc3RhcnQgcWVtdSBieSB0aGlz
IGNvbW1hbmQ6DQoNCmBgYHNoZWxsDQouL3FlbXUtc3lzdGVtLXg4Nl82NCBcDQogICAgLW0gMUcg
XA0KICAgIC1kZXZpY2UgbXktZGV2aWNlIFwNCiAgICAtaGRhIG15LWRpc2suaW1nIFwNCiAgICAt
aGRiIG15LXNlZWQuaW1nIFwNCiAgICAtbm9ncmFwaGljIFwNCiAgICAtTCBwYy1iaW9zLyBcDQog
ICAgLWVuYWJsZS1rdm0gXA0KICAgIC1kZXZpY2UgZTEwMDAsbmV0ZGV2PW5ldDAgXA0KICAgIC1u
ZXRkZXYgdXNlcixpZD1uZXQwLGhvc3Rmd2Q9dGNwOjo1NTU1LToyMg0KYGBgDQo=

--_000_ME3P282MB219482106ED855DDFA703408D8809ME3P282MB2194AUSP_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello, I am a student learning =
qemu project (specifically QOM), and I have wrote an virtual device. What s=
hould I do to compile it into =A1=B0qemu-system_x86_64=A1=B1 so that I can =
test its function.</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I=A1=AFd like to start qemu by =
this command:</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">```shell</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">./qemu-system-x86_64 \</span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; -m 1G \</spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; -device my-d=
evice \</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; -hda my-disk=
.img \</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; -hdb my-seed=
.img \</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; -nographic \=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; -L pc-bios/ =
\</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; -enable-kvm =
\</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; -device e100=
0,netdev=3Dnet0 \</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; -netdev user=
,id=3Dnet0,hostfwd=3Dtcp::5555-:22</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">```</span><span lang=3D"EN-US" =
style=3D"font-size:12.0pt;font-family:SimSun"><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_ME3P282MB219482106ED855DDFA703408D8809ME3P282MB2194AUSP_--

