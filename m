Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55073FC998
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:18:42 +0200 (CEST)
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4b3-0007vk-Fx
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sefaterahman@usf.edu>)
 id 1mKwDq-0004Gz-0q
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 01:22:10 -0400
Received: from mail-mw2nam08on20613.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::613]:38496
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sefaterahman@usf.edu>)
 id 1mKwDk-00014d-3u
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 01:22:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkGap1UQXRlOCr0wsz81ziLw5XrbVQEGgArgt3+zqHuMFG8nAlVFmX5xbBpl9ND6z5m39tOWH7OkGIJHrXLLftU6zKadJNWEMXCSdL78t1kwIku79HqhjwQ1z+EoWDefSLNEaqFW5Xk8DgtMG0Mv7JRchHzwTlA+e2PjvUt8EcHlgUU15Ni4xqVa6a5hS2BG+jBfZpOD3O7t3MpP1s9J2uY5AbVJWms8+OvyEroIDdFCVgXQCqeOaAkZEzw+UnpLNJK0kgkD6QTjmrPcwWAL6SwH/8ks6IyvcDvijbfO4mDPgCUOhozt/M+7TblG9YIfzFl7tE5hmXn9oA4oWOL6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBrvzNyYRXTRZYWIOQEwBUOWcQ9tXAX8O/Gj59tvrfw=;
 b=QrICNlIDIwhZcLCEOtD2UeMbuLg6n+vt0d0SaIToSHRDk5WgYyYnC67jFwHz6f01XZs2yyrKVDG2/d+WP3vQTIDmi55gU3nsJgfTHJKVP6kkZe0XX7ZjTggUpDm0p0X6VpDkv6w2RwPy0lVJtOw7o7CaKMcBeFtndiK6XVwNJ0pzQzbTb1bLqyVlxQSS6ipdvHLHlFjoNqzGRZi8mXtUoL3bt5bwcykMNQe3p+yk4571Gq5GZcu9Dljo/q94Q32twPBS50ltmPVe7sX/kDe5wue10uG6xWs4LSSvJ7SA2jNYQ4dLWlimz0DScH+KISMbou+afXqDsLu1XczHegB7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=usf.edu; dmarc=pass action=none header.from=usf.edu; dkim=pass
 header.d=usf.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usf.edu; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBrvzNyYRXTRZYWIOQEwBUOWcQ9tXAX8O/Gj59tvrfw=;
 b=a6zJ7U6xkrFyAZK8TCIIuWcc1xB3Smp0cMk2sSQgBA0tyMVddkHRQe2f6VsK5W2hm+C/cebY86feuZHkrF/kzb8GSdP2Kbu2HWgbJXY037MDHspq6vzyao2heJt8+VZknijrLM9AkikDK907zAc/cbcEx4qUgpc9O6PZ1LCGE9w=
Received: from SN6PR08MB5647.namprd08.prod.outlook.com (2603:10b6:805:104::24)
 by SA2PR08MB6489.namprd08.prod.outlook.com (2603:10b6:806:112::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 05:16:55 +0000
Received: from SN6PR08MB5647.namprd08.prod.outlook.com
 ([fe80::5d29:6124:89da:f79d]) by SN6PR08MB5647.namprd08.prod.outlook.com
 ([fe80::5d29:6124:89da:f79d%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 05:16:55 +0000
From: Sefat E Rahman <sefaterahman@usf.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: QEMU resources
Thread-Topic: QEMU resources
Thread-Index: AQHXnibTiN5VhoZR6UCn+QBrSCEskg==
Date: Tue, 31 Aug 2021 05:16:55 +0000
Message-ID: <SN6PR08MB5647DEDB013A4E12863A4EBAD9CC9@SN6PR08MB5647.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=usf.edu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a88cf1d-9e3d-40c0-8bac-08d96c3e8cf3
x-ms-traffictypediagnostic: SA2PR08MB6489:
x-microsoft-antispam-prvs: <SA2PR08MB64894CF240C27B746CBF4F58D9CC9@SA2PR08MB6489.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: doto9+KsPaHwdiYWknwcQ2ny7Cvjgaa95JZol1+1kpNPlkbJUqA81NlZ/el1Tg8xx1OARfGPk+VnzR+R86FVtQIb25Ql/dTsJn25itkaL37/12AGJXr3UVEg3S2UDuQ70Y5BQKBxFF9tks8y7WNU5q1HOsILrpyfPfJQ7VJS7iHOuzKwktCax/5mm+8dEKTS1zI1TfgWd3c5qeL7ZCOaCRZ25xzP3Iq9vVdmUF0aC/mqL4VjFB1J0w21hUxKOXxxEeMxHBMWIq3iNCru7SQ2QB8SoEqWjkpnLQd//bcoj4532D/HU012wA70KXmEQddVUxRBabkQRMp0xF45FAGpdNesul+sg/rvsmOFsb0cNk6ynaJmJvOYFatWYpQpQCldtZCX1EI4IqxiVAIu17grQXk187ylPDdjyt0Ee5tk5gRi8l1rjLqGYFIuk/8TdUOpG9Die972L9DUi55CtWhBKE72PeZLLFHZ7jpNYoqEtVEOPwQj/PwJi07xLqiXjuaEcUed1oQlOl7qcrGjunu7ctkEykAYMYXuMSg/x6GBdCdi4KLNAEL5ol2Atbl87RrGV6ZyQNveuLGGQ2U4qqfybm8yTzIGyLWBH4O8K+jZwRpQG9Hieyf9lLQXiY44QdRAHQtbKZfdCIdkduke7dIvrGWdBF/OxNAD+a2Pm/CKSranjIZFwWx0icODcPzH+0yfZaNvvPLW/W3u18pQ01uxLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR08MB5647.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(76116006)(55016002)(66476007)(478600001)(64756008)(66446008)(786003)(122000001)(91956017)(52536014)(66556008)(38100700002)(316002)(6506007)(4744005)(71200400001)(8936002)(66946007)(5660300002)(86362001)(2906002)(19627405001)(33656002)(75432002)(7696005)(38070700005)(186003)(8676002)(26005)(3480700007)(6916009)(7116003)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jFa0we3Yp111z4k2ZVi5LBNv/Tz/xzawe4yKV2lIjIHszkXOVpShi6woj8?=
 =?iso-8859-1?Q?lmWYZkZ5ObK7vGE+0hEXAPxCNQbByiLAscH8HdP/eG/8dTMWICwbG1F+Wt?=
 =?iso-8859-1?Q?TPKEWC0uQUQDMLZyInQP4T486av7NaN1VHWna08bR7XOxjO5dLeuJAGB+U?=
 =?iso-8859-1?Q?L7Izlxxc5kOalsWiDG5exy/5Kc/1DrJHh6b0y66SUSkuiMf3Xc4LPF0Bs2?=
 =?iso-8859-1?Q?6etNgXagv0YycRjc/fUwFbmFrjRmLQMkX63Tu5lNBgDsPYIUhG4IuqRXUG?=
 =?iso-8859-1?Q?zv6AXNuyoDyp34+vkHQrJeMRPaMDIlkxfE3fcgTzD56RHdLsDnpzWzcBts?=
 =?iso-8859-1?Q?YYoHqKp8umn62hBciCTjpft+kynXlJRym7qsyWjDegl6U4jIf9Ogw2ZkJ5?=
 =?iso-8859-1?Q?pCh6uVgndOok7IP4ZITS54CMFJDPrHQxAmDhbTDUcRpD1F5i0KTmAl8QUO?=
 =?iso-8859-1?Q?1q0ZTa5qedtjOOl+TKQTQA3DBOgeOA99p4j0ObvL+lXt5VVte//f4IyN7H?=
 =?iso-8859-1?Q?o5rn1Ci6teNUyKvlrACJvd70313ovqplejI/bC45KQAQ0551aQy7Q+r/sM?=
 =?iso-8859-1?Q?zVxM5H/kxEhbnPwOXBqTaSC0zt9RTFTStc2zKRgzzSzjWNKS9GN4Ej4rSZ?=
 =?iso-8859-1?Q?jj8fDFAwQP6SZeIygKWZFaox+6L8iskF1ooQTq3JeUvaioCfdesLiGOmBl?=
 =?iso-8859-1?Q?rT12I0u1pMDeEy6vLSAjUCcCi9NGFFpU8qq2bDbIg2Z9/G8OvYAqX9Tqdr?=
 =?iso-8859-1?Q?M4khGnot2njh8ZWh7G7oIGTvnz3qTDVAR85a/NFgx9z23lwyhkldCbzhkV?=
 =?iso-8859-1?Q?bXhnzlk0tZm3h71E3zkEZs7AOmc0qCikgGzLxOt/JEn+8hvLCjB5E2pZe1?=
 =?iso-8859-1?Q?uiRs9yGZ45bel0yvwwXpr/5zmK3dHJVxC0dsYJkMVo4+R3GIfWlgGZxllN?=
 =?iso-8859-1?Q?irbAt06SrqfbCyRaVlTbFPikXiKdieCYAPEg12CLrYFMXaQCy7vCyjPlFv?=
 =?iso-8859-1?Q?UaBguB4Kgt2Y8oSgn55CfoNn3Q6BOGpcr3SzqL7ETnqhyhYfKJFeash7L8?=
 =?iso-8859-1?Q?mPrtjq3oRMLgj3JsVMHxpY95M9Etw+1wAsmVtgXRUTCGKrtf8rLY3koyeZ?=
 =?iso-8859-1?Q?gLwx7H8F98hdDfdWoMGw/cGrqIQA030alWIM8CsuF7An9RCLyO3mxBo4oV?=
 =?iso-8859-1?Q?ScBeYU8ddbnrV3TaU/xxEytsfLtoi8sy2G5eA8Aqmm1Clwsfu4eXvhxQnf?=
 =?iso-8859-1?Q?leDqAndIja12sGnrSFfKTe838vZq3MFoRTHkbpbN6lIcKpKEQpGjOtrp/g?=
 =?iso-8859-1?Q?d6xKmmpYV1hJ68eXxz7cfEtAeJGKMZ70NYJh+zdde3uVADQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SN6PR08MB5647DEDB013A4E12863A4EBAD9CC9SN6PR08MB5647namp_"
MIME-Version: 1.0
X-OriginatorOrg: usf.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5647.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a88cf1d-9e3d-40c0-8bac-08d96c3e8cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2021 05:16:55.6500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 741bf7de-e2e5-46df-8d67-82607df9deaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Qtsaq+vXOVddslul6g293hT+eIWvhCEJtshP0iedY3/jBaXJx6BjrgsYxHhQW3rGHoC4sWvzNFvBb8yaiK+0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6489
Received-SPF: pass client-ip=2a01:111:f400:7e8c::613;
 envelope-from=sefaterahman@usf.edu;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 31 Aug 2021 10:15:07 -0400
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

--_000_SN6PR08MB5647DEDB013A4E12863A4EBAD9CC9SN6PR08MB5647namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
I hope this email finds you well.

This is Sefat from University of South Florida. I am a Ph.D. student. For m=
y research purpose, I will need to build a multicore system on QEMU. I have=
 spend a lot of time trying to find helpful resources to start a project th=
at will help me learn how to build a system on qemu. Can you please provide=
 me any resources by following I can learn how to build a system on QEMU? I=
t will be a great help for me.

Thanks,

Sefat E Rahman
Lecturer(On Leave), Eastern University,
Bangladesh.
PhD student,
University of South Florida,
Tampa, Florida.

--_000_SN6PR08MB5647DEDB013A4E12863A4EBAD9CC9SN6PR08MB5647namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I hope this email finds you well.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This is Sefat from University of South Florida. I am a Ph.D. student. For m=
y research purpose, I will need to build a multicore system on QEMU. I have=
 spend a lot of time trying to find helpful resources to start a project th=
at will help me learn how to build
 a system on qemu. Can you please provide me any resources by following I c=
an learn how to build a system on QEMU? It will be a great help for me.</di=
v>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Sefat E Rahman</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Lecturer(On Leave), Eastern University,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Bangladesh.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
PhD student,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
University of South Florida,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Tampa, Florida.</div>
</div>
</div>
</div>
</body>
</html>

--_000_SN6PR08MB5647DEDB013A4E12863A4EBAD9CC9SN6PR08MB5647namp_--

