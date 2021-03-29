Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B6034CA72
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 10:41:12 +0200 (CEST)
Received: from localhost ([::1]:36410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQnSR-00054U-3w
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 04:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swetha.vipparla@students.iiit.ac.in>)
 id 1lQjk7-0001ZX-Qb
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 00:43:11 -0400
Received: from mail-eopbgr1310082.outbound.protection.outlook.com
 ([40.107.131.82]:32256 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swetha.vipparla@students.iiit.ac.in>)
 id 1lQjk3-0004Ia-7K
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 00:43:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caXZ8ifQpk02mwCEQyr5W945W8dHqz9xnnFc84v9KaHkS6WFL5bgFOs2xn2+RgQTkPcqxNZCFP0Sx5z8WoFIM50lYIAbMv5vCZ2esGW99+hWze6/LvGoA1T9lSyygehKPr+vRDYE4i+LDxUejDk0YlWSkC7RITLTNdgudEr9TZiCxHGnyj1lUtQeLal4wm0LwtRyFhiVjzf7tl+4joo0Dg1tG6Xk9g9QK7MfVO64WNmR1DbHfZZ15eYYSlWKpWpIn57liBPQkZeFYsXIGWN0V7xL4KiS2yKeN5xtM4lrncVTWBpHsNZHKkbr5ojNdxhkhoWl4tH0uCzglGza6NlBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKQDg3A73wDbZLun4KZYNWOLp2oxg1v6+v3j8whvqFQ=;
 b=MbEVI1n1oWKnEAr2QdWT/PraN+3at7kvdb+wbQ9bZa3BRwcKUPPxyMFDRjtA0atE0RrSc9wGf7arhcIP1K5J7GNI2Rv1mw5JstHuV8/d3k0XSNm6XQv/UCJw/Sd9PGBelPrz8y8qgGha0CFGjcAdu7UIIEwCbfEpp8P1h51BE/O6oVV+c7vZKcjzfNeFoccEaw6x4If0GBH121NRVQswJmCKRNw0ROk9SFn9d/op5tqjoCpXC5IN51b4ovUk0NKcgg7nCw1VLb6lB7ClX1mBSpUD4UGnjcRkAV48hnTklpSqmx0cDLqo1czMjtHXrPBOx6zqjeHKNVJDVU7ANtKSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=students.iiit.ac.in; dmarc=pass action=none
 header.from=students.iiit.ac.in; dkim=pass header.d=students.iiit.ac.in;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=students.iiit.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKQDg3A73wDbZLun4KZYNWOLp2oxg1v6+v3j8whvqFQ=;
 b=gSDkqjjhsaGiv1EjIU7T6Sm+u26GoVQt+u3WSUJglRDaev2tjd4KWeVZ4jd3FMZ9Fbd3mBOF+PB4NQGQQBoNqebrD8/9iQlGGJKYrGymRH40W53nIkjzycfJqKHJHEQ5RsPaEGyqYkAhX0w77XFM/lXq+uED987eHMESv7sA2tAx/usIg3oaG5f8ZaU8b1opXt+YR1NjcsZoRkBKab3CMGlwcNm/mGS6pBIaN8PEe14F782BG8EIv1MDcoFU19pBEoeTho3cLOKc7RAi9ufd5y55m7S8eJa5luiILR2LPWjhIGEl+ZFBCF89FBIHCj+bylG4tlTppU41D5NyLGhtkw==
Received: from SG2PR04MB2524.apcprd04.prod.outlook.com (2603:1096:4:a::18) by
 SG2PR0401MB2189.apcprd04.prod.outlook.com (2603:1096:3:5::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Mon, 29 Mar 2021 04:27:45 +0000
Received: from SG2PR04MB2524.apcprd04.prod.outlook.com
 ([fe80::e01e:6fe0:a340:b8d2]) by SG2PR04MB2524.apcprd04.prod.outlook.com
 ([fe80::e01e:6fe0:a340:b8d2%3]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 04:27:45 +0000
From: Swetha Vipparla <swetha.vipparla@students.iiit.ac.in>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Request for Mentor Interaction - GSOC Proposal for Complete AMD
 Virtualization Emulation
Thread-Topic: Request for Mentor Interaction - GSOC Proposal for Complete AMD
 Virtualization Emulation
Thread-Index: AQHXJFOsfBWL4VRqAUSwHrXez0IUHg==
Date: Mon, 29 Mar 2021 04:27:45 +0000
Message-ID: <SG2PR04MB25249AF2C2537C98D1D048BCE57E9@SG2PR04MB2524.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=students.iiit.ac.in;
x-originating-ip: [2001:8f8:1471:e2af:bcfa:f691:1859:6425]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 046beef4-33d8-4ec7-efa3-08d8f26b0099
x-ms-traffictypediagnostic: SG2PR0401MB2189:
x-microsoft-antispam-prvs: <SG2PR0401MB2189092F09AA84D0E392D555E57E9@SG2PR0401MB2189.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VqEVZWtv/IUgHIeUlL4nCJm8it0VDpDNaMYlVesyBRnovmZUrpddflA0xk6IZ8vpCUkXL74JPd/yj73bJB8kgI+y+8KAlrKdjiMnGFrDgkdUW48JHhIT71CYs6zCNPNLsxab3imRaotfQWxKVhx0KimFK+OUHpEn5NqjXoq4KnQxcAi8yMc+giiTIlyuWADlsf67g8cnqvGjH43beAmBp9N8ae71nyn89eS6PeLMLVlNCawAEE/MPQ7prUcmKQFSKSJGFFILVLsLzLOAsyGgeAq0255NX565yz4cexFhrgoWwrI46hUahE9KXX4ov+f2eNuwij+2mrxJmz5aPg/OGjDg6tnOxO2qbnObItBNnDZ7X/5r2lZ/pnjm+qoYfweAhkxMClOPr2QeGBkblQiQS2HhfMNtJ7F4K8OaV/HMCf2u9XECQXvj871XVYokZXC6MbjbS0pnAM6upLIoEfv4GzWLe3qjCAcXEAoo33tri8aCsjSRCNs9nSM47Czjy7dn96cE/FnQp5Qv7hRkvIu8bXW+vnLMPH5neIolGw1XXzNslUjlXNJtw0G66kbp0nOR6slmJo4sE3sMQZTeNopUP8eBY/6ZJ6qUJuiR37NkP4y3IlNzkZck1L3Ce9DFb2JLHaEos6u7+DdVMPbuFqGEAUJK8xFcGjSh0OPCTWh4qQE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR04MB2524.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(396003)(39850400004)(19627405001)(478600001)(66476007)(66946007)(66446008)(91956017)(44832011)(8676002)(33656002)(186003)(76116006)(55016002)(38100700001)(786003)(316002)(64756008)(9686003)(7696005)(66556008)(2906002)(86362001)(5660300002)(6506007)(8936002)(52536014)(6916009)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?rHbxp2IhSqVWip3Ixjpax+cBO6qB6URjVEfvscLgZ3I4Eq0y6wiOoChF?=
 =?Windows-1252?Q?YJLm+sQKdNDazBQE7RCFsMapn3UlAMrwmA0OJlxgQ6za7Ia9FW79a1pB?=
 =?Windows-1252?Q?ad9hxnfiUfvi7c/BwWxbnMc/pfw7zd/pgpM8wB74jZ4ezM6vZt98YxqO?=
 =?Windows-1252?Q?Qb/Pl93crD6ua0IwUEIv3ImuPnTOK+rHy0OP6/pW+zxY/0n21y2oeR+9?=
 =?Windows-1252?Q?0ebhS+vnjxgMOEbLrQS2mUGeoFZpkv5xxRJAVi6NGx2OxvwkJDUWQ0Zl?=
 =?Windows-1252?Q?q1N5cXccG7ZweYyVjfH2OVq6XJoQ/7k6Z/iN66b3+RA1zoeRIDqIaPue?=
 =?Windows-1252?Q?xjL9z/11RTqXhQqpkThpS55klHcHJw0VLlhcvkZsP2U8VK3sI+xkemqb?=
 =?Windows-1252?Q?TumaFz5A2lEWFwd8oZ+5SW0Y8eE3ACfzItCdU5dWXS3alovmTctAid+b?=
 =?Windows-1252?Q?1GUi8CK5czN9SRAGgFVjaCY6/fMD9B9iDJ5V9Pkj9uoc5oWVlx9NA6Ee?=
 =?Windows-1252?Q?INgD/unNShsARohohK7Zzn+fmqDlkwDCc2hkQBOtPV9kDQD/o0anLRka?=
 =?Windows-1252?Q?UDGy2QwiPZzOyyOyo2DGF1VL14dJQNSEMyjNnhHOhs/nlTIuRBHLZxbk?=
 =?Windows-1252?Q?VCnuqkXhSalYkg+NDhvs/SSkhCW+RGUDkISObjKDtu+AtpH+GSiCGe0u?=
 =?Windows-1252?Q?x4iFnBajnZ3xl1/HAsCID1sqfqEgzF64UDbWAMCBjsp84JDVhmuxS69X?=
 =?Windows-1252?Q?kk20xuBgofdE0pRmIcEcB8O5KC00VbffwKQ0hMsmA2VZGGLfXhpq0hm1?=
 =?Windows-1252?Q?dvzXhO4SOzmSgTRGRius2GfsKttHEbDWVs4gkVOuRKBUtWc3QGGNcmcT?=
 =?Windows-1252?Q?jc6AD4FlpFjfGANXS82Jap63nczhRMvSNKmdh6Pu65UVjgA0cRxFo6uD?=
 =?Windows-1252?Q?rV7xpFsddC1KD1yF7P5gAQLX4D5TlAiu5YwsafoMcYvJfuY501Xj6cpp?=
 =?Windows-1252?Q?vBAiTCbmB2jhMBuuuoYMKYsjUpohNo8Mvrecncv4NsEIbaV+rJjI6PXV?=
 =?Windows-1252?Q?ua5te2aEEr9BvS4r0/4vm+Y5IYLSE/KWNm8C9eIMzUIaSkyvwcmOheMk?=
 =?Windows-1252?Q?eStBfLBw4MbmiWOya+LsZPSYG2ZQAOycFucwCJfUvGhrxi/W8UtTqEHG?=
 =?Windows-1252?Q?AHtN92eSUhr+UPYiGVJa/4jkrqYJchtkUsIICtRf7/DAmQXsA9Dr1dkE?=
 =?Windows-1252?Q?R56/qU89BJIlJG7gqMfIQmtJacPCRN6NcRTV/FEkVK5ty9e5WBTEGplO?=
 =?Windows-1252?Q?EZNv0zerNyd5pEaHYNui6GLJK9NxE4KlgkiyDDIJtLhAJehuj+BuAxHV?=
 =?Windows-1252?Q?FLBfI+2uJe+7PB00Kigi32fSnAJiNv9zTKrRs14HUaIbQotCeI39UtgI?=
 =?Windows-1252?Q?YKVwicfdWIRPQXBAm0MmPlJJf5MBBUpy4vLggO/oZbK8Hort5SI+ntrs?=
 =?Windows-1252?Q?wHxpIlYj?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB25249AF2C2537C98D1D048BCE57E9SG2PR04MB2524apcp_"
MIME-Version: 1.0
X-OriginatorOrg: students.iiit.ac.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB2524.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046beef4-33d8-4ec7-efa3-08d8f26b0099
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 04:27:45.6097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 031a3bbc-cf7c-4e2b-96ec-867555540a1c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GBSmMHuiOBpxUqo5rP4Yqtd/hdm578b6c741nXHmRKxpIkNdwVwwRvIxsuebuaMfHl0doomv0kQcBX/yFIq4IupuveNsXBvequkT4V9H95aDWTFRBF61fgkbn9BogzQY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR0401MB2189
Received-SPF: pass client-ip=40.107.131.82;
 envelope-from=swetha.vipparla@students.iiit.ac.in;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Mar 2021 04:39:26 -0400
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

--_000_SG2PR04MB25249AF2C2537C98D1D048BCE57E9SG2PR04MB2524apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Respected Organizer

I'm Swetha Vipparla, a computer science student of International Institute =
of Information Technology, Hyderabad, India (IIIT H). I am currently studyi=
ng in my first year.

I would like to interact with a mentor in relation to my open-source propos=
als submitted for GSOC 2021 so far.

The project I=92m interested in working on is Complete AMD Virtualization E=
mulation.

My Github ID is SwethaVipparla, and I have sent 4 patches regarding the fol=
lowing proposals:


  1.  Replace common idioms like if (s->len > 0) { g_string_append(s, ", ")=
; } g_string_append(s, "foo") with common helper functions.
  2.  Remove leading underscores from #defines: Identifiers with leading un=
derscores followed by another underscore or a capital letter are reserved b=
y the C standard. Using grep 'define[ \t]*_[A-Z_]' $(find -name \*.h | grep=
 -v roms | grep -v linux) to find files that might violate this rule.
  3.  Replace calls to functions named cpu_physical_memory_* with address_s=
pace_*.
  4.  Convert routines with multiple goto exit-paths to use g_autoptr/g_aut=
ofree to handle clean-up and allow direct returns.

Please connect me with a mentor so that I can go ahead with my final propos=
al.

Thank You.

With Regards

Swetha Vipparla
Student of International Institute of Information Technology, Hyderabad, In=
dia (IIIT H)


--_000_SG2PR04MB25249AF2C2537C98D1D048BCE57E9SG2PR04MB2524apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"margin: 0px; font-size: 12pt; color: rgb(0, 0, 0); backgroun=
d-color: rgb(255, 255, 255);">Respected Organizer</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<div style=3D"margin: 0px; font-size: 12pt; color: rgb(0, 0, 0); background=
-color: rgb(255, 255, 255);">
<br>
<div style=3D"margin:0px">I'm Swetha Vipparla, a computer science student o=
f International Institute of Information Technology, Hyderabad, India (IIIT=
 H). I am currently studying in my first year.<br>
<br>
I would like to interact with a mentor in relation to my open-source propos=
als submitted for GSOC 2021 so far.</div>
<div style=3D"margin:0px"><br>
</div>
<div style=3D"margin:0px">The project I=92m interested in working on is<spa=
n>&nbsp;</span><b>Complete AMD Virtualization Emulation</b>.<br>
<br>
My Github ID is<span>&nbsp;</span><b>SwethaVipparla</b>, and I have sent 4 =
patches regarding the following proposals:<br>
<br>
</div>
<div style=3D"margin:0px">
<ol>
<li>Replace common idioms like if (s-&gt;len &gt; 0) { g_string_append(s, &=
quot;, &quot;); } g_string_append(s, &quot;foo&quot;) with common helper fu=
nctions.</li><li>Remove leading underscores from #defines: Identifiers with=
 leading underscores followed by another underscore or a capital letter are=
 reserved by the C standard. Using grep 'define[ \t]*_[A-Z_]' $(find -name =
\*.h | grep -v roms | grep -v linux) to find
 files that might violate this rule.</li><li>Replace calls to functions nam=
ed cpu_physical_memory_* with address_space_*.</li><li>Convert routines wit=
h multiple goto exit-paths to use g_autoptr/g_autofree to handle clean-up a=
nd allow direct returns.<br>
</li></ol>
<div style=3D"margin:0px"><br>
</div>
</div>
<div style=3D"margin:0px">Please connect me with a mentor so that I can go =
ahead with my final proposal.<br>
<br>
Thank You.<br>
<br>
With Regards<br>
<br>
Swetha Vipparla<br>
Student of International Institute of Information Technology, Hyderabad, In=
dia (IIIT H)</div>
</div>
<br>
</div>
</body>
</html>

--_000_SG2PR04MB25249AF2C2537C98D1D048BCE57E9SG2PR04MB2524apcp_--

