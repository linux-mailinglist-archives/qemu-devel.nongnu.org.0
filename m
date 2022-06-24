Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C10559A26
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:12:43 +0200 (CEST)
Received: from localhost ([::1]:42984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4j74-00033b-Bf
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvia.benton@showblurbsearches.info>)
 id 1o4j2d-0006WQ-KQ
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:08:08 -0400
Received: from mail-maxind01on20615.outbound.protection.outlook.com
 ([2a01:111:f403:700f::615]:24310
 helo=IND01-MAX-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvia.benton@showblurbsearches.info>)
 id 1o4j2X-0007Xx-5y
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:08:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmxaEekVEDgKFNmfjLs73cCbE3qlgp20W7aKjJIIqNcQ1KSsE5JPQEJ25G6DoZhecnwWEFQ+cyOHCAopmiCTUsCXzvt+OcvBYeG3yeWDpE/shqzbPasvtNHJTt7+Hr+RNUXqqSH9lkAQM3oEEARJOHLgF8cK/VDwKsKZLPnlCWJ1/OFg/L56kfdLM3GZyyEN5xMwGLnnyEiSkbRg7gzCtr3Yc392XJKgHrQtyroRuXymRARP4VcqHk8MLZUEFtosaHhFlJ2DpkbEnRXF6iP1c/xZyugrF4esnW69TmeW1Tk2wovGya+fAi3/lRzuQZro6xnIos652ijrjf/gCuBQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVaqB5pOsuHY/G1t8A0C8dMM3PqsLk8NdNZeUciexSE=;
 b=JREMY+ePF3r4TYsYk5s/nMx0NdCSXMV3yJ9spdzjIo5cmdBfQichnvZvmXtqXGSIsHu/PzmVLTl5pL7sK9UjWfHZ+TvGPujyK6PqYQXcqUr0zFPj/lyLs+rDLz3Y4bqfRaVVE2OED6GxNQ1oPQ2PLegPIrO5izQXb2okxu5X8QN6S2nsuFntJiSCZ92HhypDq//QPzzOoshqy31l7+oPvDDOuQqRKYD88+JUZIltAAd2vuvhGY8RzQJW7Xn2Lxt7GFiBCrseeFJPryykd3+9PaqH7ua1o7HnwYwUBWz39cStTSdz5cPts4yHsF8LsBI9HBE8BrFnN6ZjVUGurNPLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=showblurbsearches.info; dmarc=pass action=none
 header.from=showblurbsearches.info; dkim=pass
 header.d=showblurbsearches.info; arc=none
Received: from MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:74::11)
 by MAZPR01MB6635.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:73::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 13:02:52 +0000
Received: from MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e1cc:903a:bf47:fffa]) by MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e1cc:903a:bf47:fffa%6]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 13:02:52 +0000
From: Sylvia Benton <sylvia.benton@showblurbsearches.info>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: Options to get started DAC - Design Automation Conference  2022
Thread-Topic: Options to get started DAC - Design Automation Conference  2022
Thread-Index: AdiGVB7FDwYb1YE2QtyhkqAXOg331wBdpLpA
Date: Fri, 24 Jun 2022 13:02:52 +0000
Message-ID: <MA1PR01MB35451A37C86FFB7D5DCC2AB980B49@MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM>
References: <MA1PR01MB35457999A8E1A0C1C44F964580B29@MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA1PR01MB35457999A8E1A0C1C44F964580B29@MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=showblurbsearches.info;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d467289e-e06d-4c4e-c96f-08da55e1d932
x-ms-traffictypediagnostic: MAZPR01MB6635:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kSlrbzyBgIRWXJlsZMzKIMdq/O+oHZ+iZyy/dTSvt3BxOHEvT7KVKU2vCeDv/MUT9z16+j4PjSvjAll5tFIMv+Xz7pANUCTt3PsAMZTa5RFQNIp/SLg4nQoeEFFtvH4c/WSpLh3ORxSbjDXJMYljwOsoPr1UBpRTSYGb814gQO+JygfYdwoVhWsOrUgrxoqebhsDzm+695uGRExccQz+4hM/o46GtjAc+Gz8Duh7UUxwjnErOQAQt2PUsvhAwgWV1PalJ0YyhvTSyxm4bzLGQSW/dKon0Z0gl3EhPdcrbYU5UO6P8MVUousmfozw0VB3h0I0V8s5z/X8OyZY9IAfQkckyhzKo2z0nCn1gKue/IlJ2TzjFL+c2lN1Ul0PGobxuMpRrOnifyfLEJhkKzG0s+XrwSxhVTvnqqK9F3qzbaEhJ76GmY+Qv/qguAtf5fnDAh1J7YqC7qc/+VDZqyDVioJoASn3+9tL6Ulj18oKWMxw1QHJ77cDrSUuxNxyb9qIHZbaKaDZ96iGedPuCG+laRuOhsBgHTbVs+IAxL0h9/RBFrR/W/ZcMAfO5bEH99SX8/f/R3A0x/ZAwny5fn/M3QlhodUG858NlLCqpFg/Nw6faGtyCrh4RiXhznTzeMIEJqwj+zpZp2X3FY68HdUr1NblApKe0QrD7fKTTXmpUhUbH7RnaI96q+Bhke1SnTT1DD4fEZ3C8sYTobKYS7CExsiQLtJ0nunMjtLEhTZ97YkFXPrRXHkvpmgAV2Zu2vzneNaOck4s0cwQmBgOXygUwGJEPKcyvUSJqEc1NbVLme2gQQvZ0ndXzYBCA1PLLo81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(396003)(39850400004)(366004)(346002)(26005)(186003)(66574015)(9686003)(83380400001)(41300700001)(53546011)(7696005)(6506007)(38100700002)(55016003)(52536014)(38070700005)(6916009)(44832011)(122000001)(4744005)(8936002)(508600001)(5660300002)(2906002)(8676002)(316002)(71200400001)(64756008)(66476007)(76116006)(66556008)(66446008)(66946007)(33656002)(86362001)(45842011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mSaCs3gKB3qw62zUd1+0Yqh7aBadJNPJn/Mi8youTJLvkiJf7HP1GNyeTjXX?=
 =?us-ascii?Q?LFr2OiCzPQveLwG223w/4u9r+VnqtlPXEOTvIH9AfJaCb2VLV1KbzPlifYSq?=
 =?us-ascii?Q?J8vGJxHPMZ0QiTDOSGr/dtZZQ819Qghx9r5xNvn/T6kK1GXeHaGjrcxQ8dM4?=
 =?us-ascii?Q?d+/9E80Ieb5/ewuCeMfFQzqrQhmqIg8/pdN832odYxwX0gtUnsN/oCMbG/E2?=
 =?us-ascii?Q?S50gWFGRTmSAl7OFTUX1PkeTJjvs/IldGEDKjsSofMNT9Jc8w65WH1n1gFaM?=
 =?us-ascii?Q?7zDGZGPJ2wqOP4QxDF8QpIA9w1rnUfc+j5SVZs9y5uJqIlHAt2Fbxv4YCA4b?=
 =?us-ascii?Q?znvsk+CGfxFBi9dTxeDJuqZYQ1ya2ekvLGWoVnJrc9Xa/gPKpVqLT9+MvDbn?=
 =?us-ascii?Q?lYFK1jtKBfpn9sndBJzS/kW4ivEPjXIlf2ThZ2qfzuztQXiYej3XJdeyX6ob?=
 =?us-ascii?Q?7kS5ATqEUQlyCSJEPYdhI8v9wlb2x+ZTKYl9MSHUmjbiIrDv6pFlJQq3+O5x?=
 =?us-ascii?Q?f5OD97vYG7U32SI/6mKhO81788q6sDTzlwL/jSN8pFDHkzBNLCYf5Ord74lt?=
 =?us-ascii?Q?w1mJWjAMreYv6sB44bOhqEzFMM2yT9SoAA611P7JgtxTZdRdfYwSeIMtUTrN?=
 =?us-ascii?Q?Lv/kRgw6q7M8Fmoj7YVRUPq2QwjF4qVHA9oK9L+jrKTZfAN/lpbZcZvoZtoD?=
 =?us-ascii?Q?MVCVz42D/pKWNq5fj22TAVn38gapKF79wZA+yT1GwFLrOND7CHC/E5s1NhCD?=
 =?us-ascii?Q?xOLSBi05cTLRR26Q4+hbb7e962sPbHPxxcTXt6+6AGXp6w+K3+ggcHyh8DVv?=
 =?us-ascii?Q?AhY20WLyVbagyaeXBEcyez8L79tIIKOCpdZ9f0KUfSaFOff1azvJhB4PmhmD?=
 =?us-ascii?Q?Nc513LxIAMnXurlLjwuKnH+8bE9b26kzQok7Yaxh7Cr7wVVpn0u9Gnsso87v?=
 =?us-ascii?Q?xBJ0+ecp/XM6elt8/Ls20QdHfpZIHWU2U39/4/tayl0lO88JXM1tZoDPDkUG?=
 =?us-ascii?Q?Pnbb48YOlwN7CI6XyRIKQEdGrhKv/iUYLGIrFAnjiKocOxzNW8Y38bdjnl9F?=
 =?us-ascii?Q?9q1wzS6hfSsGPN5/kSVxfaUl7zcDAN36jj3uaDVOLXKSRMC/RroIkqHW23vE?=
 =?us-ascii?Q?H3sjf+kef7rthQ5OpJcJ6AtcIc5OTdTVOX3v9zO8uQVhqypJElJjyUFg5ozU?=
 =?us-ascii?Q?Clrl2kWLVhdgHQ9DvQP37Av5R9mLVHvhIkCMirxCen9kU4iaB7ujAALNvbBy?=
 =?us-ascii?Q?q2U1oGM5clxKCtwYDySSSu316nbrrM8A0KhwGmHr3mZsoge6jrfpMUStEvMG?=
 =?us-ascii?Q?aXHFasfb+45O3EyIkgDIfovuErWIWbLonm6+Z68/Pd0bevAWZ43LAap/SNN9?=
 =?us-ascii?Q?nCKzTgHMGKv8uKsXsHuath6DVDoiHOpQT9i5LxAAhmFAfZQlSHD18bEn7IjR?=
 =?us-ascii?Q?cqcZmpn98p9dJ17jmmYLqUIrVPMY51IuWS25gmL3tAqOg3CEhIjOLuAkanTn?=
 =?us-ascii?Q?gW/2K0ab7ueWTYwetI2oPJFtPrnnlAMbJaMZYS44xWw/DGkwRVvgZmpRD6/l?=
 =?us-ascii?Q?XE4pwhd/RG2qoFmJg2QmqAY3EGGv5/m0s6vwzRVaR7a/ETdSUOIe7RbzLx5z?=
 =?us-ascii?Q?5sqP4k6U5w3q2r3otmC9NIA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MA1PR01MB35451A37C86FFB7D5DCC2AB980B49MA1PR01MB3545INDP_"
MIME-Version: 1.0
X-OriginatorOrg: showblurbsearches.info
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d467289e-e06d-4c4e-c96f-08da55e1d932
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 13:02:52.3052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8e4bf5dc-1586-40a7-a144-f33548ca1a2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ngvsEOQdk6a3C9PvWS84gVu3Hs82PFPtwawHimKUCwvQ0uy6YybAJPpkUsySb8Sst8bGLeLBQGzNesBQ1TAkkvk44y0FpMu/cWoOaV7f+aNXFTQdMUs1OKmznAz9KZIT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6635
Received-SPF: pass client-ip=2a01:111:f403:700f::615;
 envelope-from=sylvia.benton@showblurbsearches.info;
 helo=IND01-MAX-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jun 2022 09:09:37 -0400
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

--_000_MA1PR01MB35451A37C86FFB7D5DCC2AB980B49MA1PR01MB3545INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



Hi - I hope all is well,

Are you interested to purchase the list? Do you want me to get back to you =
with Counts & Pricing for your review?

Thank you,

From: Sylvia Benton
Sent: Wednesday, June 22, 2022 4:48 PM
To: qemu-devel@nongnu.org
Subject: Options to get started DAC - Design Automation Conference 2022


Hi, I hope this email finds you well,

I'd like to discuss about the pre-registered email list for DAC 2022 Design=
 Automation Conference.

Target Audience: EDA Software, IP/Core Design, (Embedded) System Design, Ma=
chine Learning and AI , Design Services: ASIC and Post Silicon, Foundry/IC =
Manufacturing, Consumer Electronics, Design in the Cloud/Design IT, Cyber S=
ecurity, Automotive, Internet of Things Others...

If you are interested I am happy to send over "Cost and Counts"

Best Regards,
Sylvia Benton | Global Marketing


If you don't want to receive further emails please revert with "Take Out" i=
n the subject


--_000_MA1PR01MB35451A37C86FFB7D5DCC2AB980B49MA1PR01MB3545INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">Hi - I hope all is well,<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">Are you interested to purchase the li=
st? Do you want me to get back to you with
<b>Counts &amp; Pricing</b> for your review?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">Thank you,</span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Sylvia Benton <br>
<b>Sent:</b> Wednesday, June 22, 2022 4:48 PM<br>
<b>To:</b> qemu-devel@nongnu.org<br>
<b>Subject:</b> Options to get started DAC - Design Automation Conference 2=
022<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">Hi, I hope this email finds you well,=
</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F4E79">&nbsp;</span><o:p></o:=
p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">I'd like to discuss about the pre-reg=
istered email list for
<b>DAC 2022 Design Automation Conference</b>.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><b><u><span style=3D"font-size:10.0pt;font-family:&q=
uot;Verdana&quot;,sans-serif;color:#1F4E79">Target Audience</span></u></b><=
span style=3D"font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;c=
olor:#1F4E79">: EDA Software, IP/Core Design, (Embedded) System
 Design, Machine Learning and AI , Design Services: ASIC and Post Silicon, =
Foundry/IC Manufacturing, Consumer Electronics, Design in the Cloud/Design =
IT, Cyber Security, Automotive, Internet of Things Others&#8230;</span><o:p=
></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">If you are interested I am happy to s=
end over &#8220;<b>Cost and Counts</b>&#8221;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">Best Regards,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:#1F4E79">Sylvia Benton | Global Marketing</spa=
n><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-=
family:&quot;Verdana&quot;,sans-serif">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-=
family:&quot;Verdana&quot;,sans-serif">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:7.0pt;font-family:&quot;Ver=
dana&quot;,sans-serif;color:#7F7F7F">If you don&#8217;t want to receive fur=
ther emails please revert with &#8220;Take Out&#8221; in the subject</span>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif">&nbsp;</span><o:p></o:p></p>
</div>
</body>
</html>

--_000_MA1PR01MB35451A37C86FFB7D5DCC2AB980B49MA1PR01MB3545INDP_--

