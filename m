Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D254D5B501B
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 18:53:28 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXQD1-0003wD-DZ
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 12:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXQBr-0002Th-Ri
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 12:52:16 -0400
Received: from mail-bn8nam12olkn20803.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::803]:58017
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1oXQBp-0007rx-NA
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 12:52:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8vNqmTq9SbRbP8vaIF+Muqjj+T1zNfbPnZmNA1hGMYfv1gkbk+5KE0rm9KCYrWCnk2NGTpJ3Kh3SKkqmXjv7pbSXe7KINZGlgceHA9a6AiOsWoLm6s5b57vS1kduzVTMth/Cr/PBJTGKs66PxQXhxRXnWxRMBVCUmlsv6XC4h47tUfd50EJyzavjR//KZdfsHmLg27MsQBsJem69xuWErrcZBqnXyVgtABCyE6KLPiI63/JZ7ZBVCWGXHHsBrnOe5ANv5D8fONmGgKtQThfL4yfypMDF9e0DTN2pecIVS7auRV0sNpQLjj/GY411fQYYbG8GH0iStJg6e8VQCrj1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvHPrqDZmgA/gUrSyDRzamHcWjez5v06f7mAL4QKXlc=;
 b=QnQ2Hxh9F07bhRbvQF4YHGJCGjjPv+CjYeEuk/MQB/8u0x3nwFGdG/ZIjAOSTGP5GRTKYOptHCELf4FSePyuWxMFB1mhGLsbu2/ygGx8c7JZuKOdqwCCIY78RIxAQqKb+oaPM2CFTB1gUsbPQIY4UXtimDfY2AeQpObZVSOg4KKz06oQE42m38iNgrX87geeAcCVMU4KxrKwEYuLobvO6AyUeYWbjQKKvo05Io9dD1a6GKfJakVdS9yhB0Yf9ne1RjT1zjiAwdYwmjCX88mPmmCxVTW1SuDUWmQQz+XLcCgzzOrP2reLywRtj1yPEk37JxuqSJSparpD6csvdqWqHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvHPrqDZmgA/gUrSyDRzamHcWjez5v06f7mAL4QKXlc=;
 b=cARpNVjgiqIHS6kKLbKiEs5smvCnIRXzxntSZYFSI8gWg926tw7+O1iN5eMhMW2pdgXNlhc2oF4z63grBbaI6W/n3I/UlmmHedaBpBvu2DJdn+5p1iWe5th+IizQNnNGjkxC2tugocnFB6WdXsjsdAXPYrars228B0gxc1UXKbfefF5A52KWXYeFESaR6KWzqbBaXRqUYTEoR3udDTc9DhE56FPPOLIqYt/INRxwG3T9WBqZ4Qj9R9YSnc2+gkVy7eOiJlKzREWkWFwp1eUQXzbRjiCWcSBKC1E57/+OFCZAe+kRG9+1lMy2Kumq63sLnyGeV1omiTIgmGfCkAvg7A==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 DM6PR06MB6283.namprd06.prod.outlook.com (2603:10b6:5:121::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.18; Sun, 11 Sep 2022 16:47:07 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::5dd2:9226:c045:5480%9]) with mapi id 15.20.5612.022; Sun, 11 Sep 2022
 16:47:06 +0000
From: Hee-cheol Yang <heecheol.yang@outlook.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Hee-cheol Yang <heecheol.yang@outlook.com>, "niteesh.gs@gmail.com"
 <niteesh.gs@gmail.com>, "mrolnik@gmail.com" <mrolnik@gmail.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Question about pending patch for AVR_GPIO.
Thread-Topic: Question about pending patch for AVR_GPIO.
Thread-Index: AdjF/Doy+ElIhYu/R02DoHnR675Awg==
Date: Sun, 11 Sep 2022 16:47:06 +0000
Message-ID: <DM5PR06MB2537E50667993338ED339A8FE6459@DM5PR06MB2537.namprd06.prod.outlook.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [1Hh6+UvR9f7tzca1n5cahiXo/OdgTzYZ]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR06MB2537:EE_|DM6PR06MB6283:EE_
x-ms-office365-filtering-correlation-id: 15f09f73-1f2f-4f83-dee2-08da94154333
x-ms-exchange-slblob-mailprops: ymJijV9pwJn88F/dPMn9mi9TONY5FSlURThTbZwmZjvuD+OPe6I2nbwwzHtVfJos12JVCcpT/MoZ/uTinBQllZZmvM9bezZxFsAM7lWdvIs0Jx0SE1Rl1sVepaF7htlj6uIkDfQarCVAq7o13EcjCbqLZhXBzvzJ2iYljK2uoX1576/vO/zEofPLYkMBik1GokdOwpPpuFzwTVckbjar3Y8q9Cw6gxnMikLWxPyRE3/kLqFArwEt/1hJ5Qpv4RUi9jchozfEgUUQfmuej/++9iOaxX/o+dtY7P1avZixsqj1Itio5v2Bsa3VjnRNg2XWyaPiSJrsn9tm9RPZJDIoljDrGJMw4K4J20oOO0GVnhPAUcBw4Y1r7WLS86jf+RSCspJOxn8u4T9HXaZeUNMkvFgVbrT+743fQ1yB2UB0hMZVxXsfl8KUmBnLp0PJKwuNX2d1zcX1BVz064xyniZIheOBdRtSp+BhT/5/TBBDXRdYe1xCIyM90qLghejGWdsxBiU8q71CuOok8q+S1MXXqCmWGJKIScE15n3mP0CWVhJI+5YcVTuIurQzJ35wTkNTARYg6RMYmP1Awf+zhszW9p5xkTxrzPRmdBHTuppzIW25BeuDP2EO+CQcTh7JWiJzmtBnNCLse0yH8usRqG5r1kOnIMZjevKX8J5hTmoMQQViVFsfmM6p85HZRGGSGl8LUSlBpdcApIqCt80ZBYRFigZvgAgSTSpmWBvyc3TUZ/b/PbaMwwSFogX08+/vWoLGK7kRm0AmPdQ4TMuU+NxB81xWsQ5K/rDNZmUQcNZNQQgsjGgs1EvJn27H2B8IMtJy
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NLOuFH21dHalVk/eIEHBmQEdp8ZvTHOS0XdQ6PeUpeGek083Rn2agGWqwIj7h9ZHg4GDDM1vvP3HDl0UZqURfImcQovN+b2NilblgjzrsPvco9rE5OWHb3MgVRLkIqeBGYwI/wMFxb+Qglp2NZNmStN6JqPr2AtbNNArn3Rrdk41vOCXmwk+wQpmAedc11hfuZ9PrJ/6TOSkoZmv0rb7FkwbaqTQqdY6n7XKkp+yyJsT1Dr45czj/JM4pBkUF9ONI0pXz+SrR0LyjYaQMZaMfs0C0f9oYwhp4X4uJ1is1rjbOwBydk+uAfJag0bPMwyZJjrR13Te61oy1E8f53KwEmWY4Gppjy7wzfoPZeEuDq8F1dCg03P8KyQPLSN5/Rc+R1b74fpNBPmQiNH48vgAw/NAsh5t3jVYCuXmrnPuMZ+tX29/RSYM2Lq/Vk4cQSzjDda6N0zoU5PTZNLwTwwZzRjJ+mIkPhaegIwyG9BOcfVbfPJjVO9J3aKwqH6bBa+xtEqQom8J5PS4XmeyXViL30aoymNmCFJ9xF7FpbZ2edon0PXkSJV2VnvQRFvVU8jHZV51tTLjqChHqIoeDJ19RMmmQANgbbVuj0ZHqk46/sDvLd6J1/5gs/LddmP85vwt
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QQqDyddutkMVJ7SMPFii2k5eNy/LAGQuVEw451/VXtyTUKLxfJ77PEtkKx?=
 =?iso-8859-1?Q?ty+THrxVS52pxBScPF/xQFm6RYyjDqxMIsrrV5yLqtAutQl2oq0Q4TYnGG?=
 =?iso-8859-1?Q?zQXeyqDwVRaj+MYCiYqNhTblJdh5UYB8sw2NE3pVW1vasb8Xzqh9lIRhJw?=
 =?iso-8859-1?Q?jnSF3+DdflG+/BXPH1F26HoHGvixQITb9iHe+uU7IHhcDl9qn3Oxs8Dcjs?=
 =?iso-8859-1?Q?qcwoqSOsZQQq1Pys/hl7LJFp2BPTVlNXVqc/kQe3hoqqR06uo3wNETQvZi?=
 =?iso-8859-1?Q?xo1S24LLhaZSCBzi0CS2b+9fTc03phMzA5SSDj9uHrdnOw4aT0j2KZeqFc?=
 =?iso-8859-1?Q?rIp+2k72DtqBEdVUwOMDePCNbZNV7KTSHtiu75O0GEfq7poA4yXrddu320?=
 =?iso-8859-1?Q?P8mhVXkSYm2o/jiZMhvunO4d3i04/ZESrf9fGuRR/MyMWMf/v7vOGNs5o5?=
 =?iso-8859-1?Q?DM11zTcMG5gMy2dCWmguF9YGJV5n5kcNO6PlwYupGrTW2FAYaKJHqPPMIf?=
 =?iso-8859-1?Q?4Ekf6aOlBymjbS69PsC4HXhRig1ROL7hZld0fKDfSxPxKhbGCERF4vomGU?=
 =?iso-8859-1?Q?gz/wsprwd/5sWF2vw3GNSsTrZzT8wRmEYtwbB7gOYsiw074oRebvt85uNe?=
 =?iso-8859-1?Q?hOhD8yiviEFye6hyRv+hqERWjqSbIsLyqoJ5bXzGSHC2JDiPlUrHLrIxu0?=
 =?iso-8859-1?Q?QRxgXDwq7ebSxS+byrt9VRUDHYrSZmtFFm+ePMRW3otrJ0QQdiKqbZ2EOW?=
 =?iso-8859-1?Q?nUXuPXhEKdLawcBddAHuIs71yTyv1MM+J/o20hsTTnQ74E53dYTbrMxPXX?=
 =?iso-8859-1?Q?oA3V3sE1QG5jETNJXV0tkm1MN06CcrNkHb7cfNKZR5PijUNUZ/Ycb4BvT1?=
 =?iso-8859-1?Q?Dr5vDzJcyJWnnBkL3ecjs15aaauIQ3ZRMyob3xcwcfC3aV5AWXBnPk/szH?=
 =?iso-8859-1?Q?8lLfm7KO1zg3TY5Al/Bd05+QxRSYTqrPIbc9ur+EMuurBMzCAWsgbFdT1t?=
 =?iso-8859-1?Q?9Z97qFrP5U741hycMGKZ/oLJClFl4Ue14eaDFh4Fno27j7LwSp49/yyFWv?=
 =?iso-8859-1?Q?APTWq6OybGykYAyMbLug9xVe1ZeT7EStZbTiq/dASYhDY+AH59B2howl8H?=
 =?iso-8859-1?Q?z0dd+mzSpl0Va1Tqg3G4gYLt1jtW868j3/1r3ZBrUgTd9kb8I0zD+uv9n2?=
 =?iso-8859-1?Q?2ZOUi1NZzb4SYNIkL3on18tS35Fk+kVrHwUbgYKhaE9Cez4AShWMKJ+J8h?=
 =?iso-8859-1?Q?PuNQDCNjQbcgk8/kzFPsNaNleAdkiymnF/oV8wZpAs44SwpErNyH5n48Lf?=
 =?iso-8859-1?Q?72lPvdTpT+grmHdQdrNomPYyHQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR06MB2537E50667993338ED339A8FE6459DM5PR06MB2537namp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f09f73-1f2f-4f83-dee2-08da94154333
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2022 16:47:06.8418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR06MB6283
Received-SPF: pass client-ip=2a01:111:f400:fe5b::803;
 envelope-from=heecheol.yang@outlook.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

--_000_DM5PR06MB2537E50667993338ED339A8FE6459DM5PR06MB2537namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello.
First of all, I am very sorry for my late response for following patchworks=
 for AVR gpio.:

  *   https://patchew.org/QEMU/20210313165445.2113938-1-f4bug@amsat.org/

I couldn't check works for several years because of my personal reasons.

If I or anyone want to continue these works, can I ask what should I do now=
 to continue works?
Should I continue additional works from the original source commit or after=
 merging our patches into recent master branch?

I apologize my fault again.
Thanks a lot.

Best regards
Heecheol Yang.

--_000_DM5PR06MB2537E50667993338ED339A8FE6459DM5PR06MB2537namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Malgun Gothic";
	panose-1:2 11 5 3 2 0 0 2 0 4;}
@font-face
	{font-family:"Malgun Gothic";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"Malgun Gothic";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:40.0pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:4.0gd;
	text-align:justify;
	text-justify:inter-ideograph;
	text-autospace:none;
	word-break:break-hangul;
	font-size:10.0pt;
	font-family:"Malgun Gothic";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Malgun Gothic";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Malgun Gothic";}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:3.0cm 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1805922658;
	mso-list-type:hybrid;
	mso-list-template-ids:-1177784358 1959445144 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:38.0pt;
	text-indent:-18.0pt;
	font-family:"Malgun Gothic";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:60.0pt;
	text-indent:-20.0pt;
	font-family:Wingdings;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:80.0pt;
	text-indent:-20.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F06C;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:100.0pt;
	text-indent:-20.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-20.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:140.0pt;
	text-indent:-20.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F06C;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:160.0pt;
	text-indent:-20.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F06E;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:180.0pt;
	text-indent:-20.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F075;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:200.0pt;
	text-indent:-20.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"KO" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">First of all, I am very sorry f=
or my late response for following patchworks for AVR gpio.:<o:p></o:p></spa=
n></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:2.0pt;mso-para-margin-l=
eft:0gd;mso-list:l0 level1 lfo1">
<span lang=3D"EN-US"><a href=3D"https://patchew.org/QEMU/20210313165445.211=
3938-1-f4bug@amsat.org/">https://patchew.org/QEMU/20210313165445.2113938-1-=
f4bug@amsat.org/</a><o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I couldn&#8217;t check works fo=
r several years because of my personal reasons.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If I or anyone want to continue=
 these works, can I ask what should I do now to continue works?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Should I continue additional wo=
rks from the original source commit or after merging our patches into recen=
t master branch?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I apologize my fault again.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks a lot.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Heecheol Yang.<o:p></o:p></span=
></p>
</div>
</body>
</html>

--_000_DM5PR06MB2537E50667993338ED339A8FE6459DM5PR06MB2537namp_--

