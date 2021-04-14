Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBC35FD9D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 00:15:47 +0200 (CEST)
Received: from localhost ([::1]:55436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWnnV-0004sh-Qz
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 18:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richardmatthewhill@hotmail.com>)
 id 1lWnQ4-00067t-3l
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 17:51:32 -0400
Received: from mail-db8eur05olkn2102.outbound.protection.outlook.com
 ([40.92.89.102]:59137 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richardmatthewhill@hotmail.com>)
 id 1lWnQ0-0001LN-Pf
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 17:51:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzENH7n6BE382V+Dk/g0VZInX9bfxMejoOtW6egf1c8EEWeN4PXLNsh9TwzCdjrpbSwkZbtlno7gGuu2TS4p5VS8yjVzsSrVNswSi9X5PHNlSrcolynEVipBwU+TZzCtYj4b0w+xV57+SQxm1pTSUXyZSDFZjfy8ktqbZtDiuBQMboYUct2jRIdWcXGMr77almo3KTWVAcn7zgLWysNn4SNUwOzlpuW14Ux16vsPigHdcsnaQnL5vVa+jhl21qbz84ziMlJQZslT11Bc34mUJxNSm4tS3V7IgePukrThdAOr11+4m0uLaDelGm1mxraGgwclZZibjCb8QgA1b3HltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW3fXcsi0ImjJpzcjMmGRN7Pv0bPb8vf0tA3yML3vCs=;
 b=HV2sl4L9nExsef83qy4eZEcPFn2Sqm3Dkv0268ifkNzF2wSCkDuMbILvmernCwc5l1nyut+CxZ/vGUfrZmmWnge8sW8hUgQ4L7Ib/Gy7YS0lfQgFXjbWu5N26mhhnb0k/zhrN6HuGKEgKsJrZHp3Ml2SauGvtn5omXbAmK7A92VDfI/4QZYa5ehD0ye0HePQNLQk+StS1ZW3ix5IVLmCgO5dE9J/a6hOlOg2mRyCkw4TliFq5FltXb1m9hQrYcGUPxseybDcJ3rZBD/hYpNXhyJnL48TjKoDmJNIbD+CwgHv+Pv36IjOWwy546r7NBvDYJqhqCq9cfTgDBvfum5sxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW3fXcsi0ImjJpzcjMmGRN7Pv0bPb8vf0tA3yML3vCs=;
 b=LKl6ogygUbmK9bsCZLtKQTuiM/b3NYVGYbZdl1J8+VgsJ+FmoLJEtLE3EpnFjC0DYWu9HlEE5XipYvX/0eJ0pFJONy6z+DBXWOjlhjVvueaJv8Cyt7uwPjGFK5fbpSV66j4AH7LOY60jHyzNtOew20/7g//09vESFBEgB6W8NlBowCMIO4x86d16wq70xMgfKzyE6PUq1mEfvITF6vir/t/UliGAGQCZCqjJ5U8dwBgOeopRwbfgRcgDdxn9kdNYd/1lhBwpDGk96FRpjk1nE357+OqZuqIHpX9RH0Ekbk8Lsz5m28AHflk0VPUtM+Tb8qGYBg/VB8boKvCKiZsiYQ==
Received: from DB8EUR05FT025.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::46) by
 DB8EUR05HT234.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::438)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 21:36:24 +0000
Received: from AM6PR01MB4980.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:fc0f::4e) by DB8EUR05FT025.mail.protection.outlook.com
 (2a01:111:e400:fc0f::391) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Wed, 14 Apr 2021 21:36:24 +0000
Received: from AM6PR01MB4980.eurprd01.prod.exchangelabs.com
 ([fe80::94bb:9c5d:fd5:7f61]) by AM6PR01MB4980.eurprd01.prod.exchangelabs.com
 ([fe80::94bb:9c5d:fd5:7f61%5]) with mapi id 15.20.4042.018; Wed, 14 Apr 2021
 21:36:24 +0000
From: Richard Hill <richardmatthewhill@hotmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Mac OS - Standalone Installer
Thread-Topic: Mac OS - Standalone Installer
Thread-Index: AQHXMXXOtnRcd+YXJUu3oK8DT+OyTg==
Date: Wed, 14 Apr 2021 21:36:24 +0000
Message-ID: <AM6PR01MB498093EDCD5AB2B533595611DF4E9@AM6PR01MB4980.eurprd01.prod.exchangelabs.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:723CC0034CE67A5BBEBBCA46D3CD458852D61EB82DED833F7B5764121E2F87BA;
 UpperCasedChecksum:07A68A074F65D37D54BFDE7142DF68264760F26E0F08843D0F7F87ADAF85D4C0;
 SizeAsReceived:6721; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [CK1E6mOa6+QrNAGT8w3FOOpmhGfAyMXF]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 028a2502-12a1-4c2e-d251-08d8ff8d5a69
x-ms-traffictypediagnostic: DB8EUR05HT234:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gy8kuZIQsA+I6E0HSaj23eBlQl4IpCSnk4fM1TZUkOWiBZ1P2yJ3fvGMLuuXwt7aJRcC1khFyVSpc2O/9duIIkQddrlITEujD8Vt19TNikkP8Aa9lpeb6zjuYRDyr54x/QKYKmc/JdkG0MEeaM4lUUW6tM8jlmTXzEkAr51L6gHNFfgNAtuyHbWt1ArygB+KZgl07OnPA6iHudmf8EpHaNYF7Xe7BTb9hISrUYyizLevjkpWSLSrxkhYEQwlMbUt8hUtqobQCQIkIxBOpQGgz7nRwKMTsHW19wLWX7Jzn5xIZerxKzrNGH41SSLKhgxsATdChWCm1Fn4qv4h56XFUWO7uqERlV3C3WVIj8mJxIeCGrGXCoSie5g0tRR9JKBdzbFp8kWrH8SvqW4rjpKVeQ==
x-ms-exchange-antispam-messagedata: /hQLzKopbc5pSnP08+DXgVThOg77LBrS5zpFUA5w6SkP+QeR/UloPErPqSV76tWOU6cMzpf658PgytbveX8rjme4PukD9JuMFaA660RjB05OMGJcCUBeqDBHc+5BVBTMft3/Xc+vkiah1f2awOK24g==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AM6PR01MB498093EDCD5AB2B533595611DF4E9AM6PR01MB4980eurp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 028a2502-12a1-4c2e-d251-08d8ff8d5a69
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 21:36:24.4611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT234
Received-SPF: pass client-ip=40.92.89.102;
 envelope-from=richardmatthewhill@hotmail.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 14 Apr 2021 18:13:12 -0400
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

--_000_AM6PR01MB498093EDCD5AB2B533595611DF4E9AM6PR01MB4980eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Everyone!

 I would like to ask if anyone on this list is aware of a standalone instal=
ler for QEMU for Mac OS?

I am aware of the excellent work carried out by Stefan Weil for the Windows=
 Platform and I wondered if something similar existed for the Mac?

The approach of using Homebrew will not work for what I am trying to achiev=
e.

Many thanks in advance for any response / help.

regards

Richard


--_000_AM6PR01MB498093EDCD5AB2B533595611DF4E9AM6PR01MB4980eurp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hello Everyone!&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
&nbsp;I would like to ask if anyone on this list is aware of a standalone i=
nstaller for QEMU for Mac OS?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I am aware of the excellent work carried out by Stefan Weil for the Windows=
 Platform and I wondered if something similar existed for the Mac?&nbsp;</d=
iv>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
The approach of using Homebrew will not work for what I am trying to achiev=
e.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Many thanks in&nbsp;advance for any response / help.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
regards</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Richard</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
&nbsp;</div>
</body>
</html>

--_000_AM6PR01MB498093EDCD5AB2B533595611DF4E9AM6PR01MB4980eurp_--

