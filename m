Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48E7559A27
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:12:44 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4j75-0003AU-Lr
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvia.benton@showblurbsearches.info>)
 id 1o4j2c-0006W5-Bq
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:08:07 -0400
Received: from mail-maxind01on2056.outbound.protection.outlook.com
 ([40.107.222.56]:16125 helo=IND01-MAX-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sylvia.benton@showblurbsearches.info>)
 id 1o4j2a-0007Zc-Ha
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 09:08:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyqsMc1wUCowaxufTft4ghPRYpOCl+H+3o8OQVIbrfG+uxFKBOyNT+cg0tN6M0TQfdkuNNeQ10lDDoZzgsQFnmSxaLDdBgGqswxH+c5q8LOz9M/VdlRk0TVR/ZOmJ1wJTffoYRoimzaMMsQhbaal/l12CLBIJELd3kSArzB1zQT66XtnnQDReqW9U1VKoaABQpRr3UXQSJ4OqtjtpTZuF2gQFWg8M+cdH5Qp6umOrN2IUhkeDQE03A4kwDgdaow6IXZfWG+ryynH+leyA5JNMNaxugE4lva1sfM57lnDYpNRjLDOcoki/zginxkD10scGZdyVCw22l7T/Gpq7d583w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWQ4P7mAdHiNOZHvcN3HLfBDwqvw1ZwwM4M5WeaBT50=;
 b=OFM2CfGHnYdKhGLRKUgoS+vjgggTNPlFMUKI/5atuwC51txBnzS0tmXQc+1jbSz/OrQdk7smfYBrLTlRrERraRvfYzc6TyTJRQXyAv7BJ6G5/5+DfinEpPYqHDB/3JdtPrDF1M5/mm08FowkR4PI7gfrWV3FZmoWmH8cOoYKeNpe+0f2bEnrw/8+7xkBBGN7Gns5fhfU3a5PwKXAfV/qQs1fsDt8sU+oTat+TpkpErAPo3oZ9HDSpJMLagRQZRyRZTuw9Y5LuwtkhPYsIz0GeXdaDqY65G1XhekI70bIsPXUO6yxYdchz0lwZCX3gEnIS+LRMFeK9OVzAWOI5x44SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=showblurbsearches.info; dmarc=pass action=none
 header.from=showblurbsearches.info; dkim=pass
 header.d=showblurbsearches.info; arc=none
Received: from MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:74::11)
 by MAXPR01MB3743.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:67::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 24 Jun
 2022 13:08:00 +0000
Received: from MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e1cc:903a:bf47:fffa]) by MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e1cc:903a:bf47:fffa%6]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 13:08:00 +0000
From: Sylvia Benton <sylvia.benton@showblurbsearches.info>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: Options to get started DAC - Design Automation Conference  2022
Thread-Topic: Options to get started DAC - Design Automation Conference  2022
Thread-Index: AdiGVDMnnF77ULaZSDWvBQaXe7QcqQBdzSyQ
Date: Fri, 24 Jun 2022 13:07:59 +0000
Message-ID: <MA1PR01MB3545A1255E7618D2F3FCC3EB80B49@MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM>
References: <MA1PR01MB3545440AC39B0F0A4C796CC880B29@MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA1PR01MB3545440AC39B0F0A4C796CC880B29@MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=showblurbsearches.info;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b320e8f5-5cdd-459d-08af-08da55e29065
x-ms-traffictypediagnostic: MAXPR01MB3743:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ofhNb7mbElmZmmLgjFOhfCx11vvT+BTAs58J86IcKua46qVXHjLGZhYq4JBj01I17QGCNR7vgc9Ouw1WTxu0wugg/IptvpC6c+h8vQWiea9F7r0w9F7l7rNeZSga2RKHsivOWtBkPChw/rGYvOWyc4PL45HVPQSPsb93eKpnU1r6N5LgiKWTgAgeWfimeZDyMVveINmKN57liswWYJ/cnR12GT8C/cEJTu38TSh+xOwvic9cUJvRBIfWLL32JpirpHNhkZS5DZmIkCvq7aOJp2NfA7JuwvvXN8BMsLmfE9+/FsspZUjZnw7+udnYosUIvFmsIiEB3vgCqvCR0v9z672FbSgjGQvb3JxNC4idTyiwc/jHlCFhe/Z6fT270DtuwTKTyGclyXqSPtue4Jz/FjyHmv+hTaFZaUO3rR6fwBxuuKJS8hOdrMIplyABsD0stjGjU45FgbVVe2IYbIgHkP1VWQnOAWrXDDfkG6iULMxdMab8sUIp4yPAPbAJ4h1nfQrjL8vlWy1gI4ysWbCi2wFvIMUMe//R17nYGbiY+XnzZgNj3WKnpv+j6i54BP0hYeOqwHqOoSfIZ3w9RPYQmms6KR5feqGbfScsOOPUv9P0wh6kovppKq/6eUHsEY1e2BL+e60QWJB/ueXchAEt3NvFj6hOikgtKRjtvjZTqoYpMkWsK6zwzhlkLBEIZPlI69mVQ/E/8TnDF4fK/flB3nvkCEBczXL4+Xsp6IwQqQ5rv0s94Oj0GGkMY9FCkJUSbnaiOwCBQyGrUb/qImUElWTCY1ytCEVDYA6brKTQzz9kbaQ5ZCB9tJIJ04ZI+RfZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39850400004)(346002)(136003)(366004)(376002)(26005)(6916009)(44832011)(66476007)(8676002)(52536014)(64756008)(122000001)(66946007)(4744005)(186003)(76116006)(66446008)(6506007)(2906002)(66556008)(8936002)(83380400001)(33656002)(86362001)(316002)(66574015)(7696005)(5660300002)(38070700005)(71200400001)(9686003)(53546011)(38100700002)(41300700001)(55016003)(508600001)(45842011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J97Qswv6y7Qf+dcIAC6+BXESTD0GGzx/H7bRjEumIpJb81nVCo5FEAPyBzSj?=
 =?us-ascii?Q?9C/1l38p8CoRMsoFYiwgpvH5sMqghSpspf1OQClB2LwlsQhTN8DWaZ5fKVIJ?=
 =?us-ascii?Q?OO6UFbVB33fxFw9uU8jn90uS9vwWnBfsUpo4UnIc85VloTihkk5FIdzUc7kx?=
 =?us-ascii?Q?xxrfnbyKh+R3HSHqQ7CKHQXvusu/b2nzBiGM60onz+1suw2Ev2FZ7VQIfcI8?=
 =?us-ascii?Q?5XhyVBT9YaWI62k6GraoiTlDkr3Srpw2Ac5ZRugPm3yB9hRDhAkdrrJge0TA?=
 =?us-ascii?Q?6YXIqk2PdsAgVV565PHKcxMbkpP9N4M5LLFlCRrTXWkRoMQ4r2a2dBXjPG97?=
 =?us-ascii?Q?DXyRUAD0OQN+/ZMsGDYZOi6B4n/TmAyfZoA1EbuMejoNU+YOsIzowWfOu8x3?=
 =?us-ascii?Q?VfTcDmQQ/ajrIJypY3vtlNgzq/if9nx+rft9DXaVFkwaV+pej+cNYbYyAWTG?=
 =?us-ascii?Q?e367Yb7TdGW3gmoTeJUVK+qmH6r/bKd0OTbdWEabdKqv2aKCeIZalZGt+7Br?=
 =?us-ascii?Q?SpxA2AyiBB7+I2aLbCMfJ6G0YX+rZaFqB5GKf1QyB1fYBjyOP7yyUvBBxr4z?=
 =?us-ascii?Q?LdvbDOV7DrUEjSyZxGTfSsAKooHufO2Dj7YtLXMvLskrggKsjHyvMkTI+fyu?=
 =?us-ascii?Q?fUGg6vqdEfrUfVJUELol8/lL/m5/tuZebwUwGo8+fginSzAHzQ3+q0JT7I4o?=
 =?us-ascii?Q?BBpUwvd5lAH3XXtfPNydMTZUGOJHaZNIXUQObRLNnQ0CwOxCAPof3Ua6XItQ?=
 =?us-ascii?Q?AQm0si39g9buCAZlDQbZNq3+jNY34SHTq3R6rebXpq3n4k73JXFKGU7xdkvU?=
 =?us-ascii?Q?FjEw6Shq/saRnBzAmmc9oxVDR88QTGKn/qHOMIbpwErQ7h1nCYfJvD6p74Pw?=
 =?us-ascii?Q?JQErYPRYsunt04PHwOPqorb8E6V1doWjKCfpv+TxZNIx/MzT2pAaTaQLEpjL?=
 =?us-ascii?Q?uJJA+YYtj8xVyhKngAV8hdludCLzWNf5VYOG67L1FJc6Y4jp9ux1sNw3T8h4?=
 =?us-ascii?Q?XVV1PhVTbfp0VjtKpW4GpiEe6xwzR74R5Fr3i1u6j8UOGqONXvJ15X/yl2cq?=
 =?us-ascii?Q?3M3MWbMt9NpLDNO3h4CPUKXhozLkZhhv3/39Cc2Q5rvC2nGfw7ANDrmS+DS0?=
 =?us-ascii?Q?OEn98Riq79NQaeszobPoP4pTnzyw2+kr0XAQqHE5XmnllIqLN9RYDX1XD7rE?=
 =?us-ascii?Q?AY2QNzMEcDAsAUOjfmVCwHajtE3qTc7znbGLx56zAdC5GdFFWISk53f57pV/?=
 =?us-ascii?Q?X87aSZPTJE8nDBS3cBxxSadeU0HgDxaInRvORlGb3GJhEszVfigcefk5fPBm?=
 =?us-ascii?Q?a5n47Ck8LxkpD+0r/E+ITO2w4ifVkFQEoU5QpwylgjtU+32xC/Qjj4OcbRGY?=
 =?us-ascii?Q?fbfELwjS3LVdsaLwfLPy5+wKbeerbXDSl618b5c6bJW9Z3eeqexX4Lfv+pC8?=
 =?us-ascii?Q?WLxYVEDkjPDvdE9ZdH/v14u6TT3K1C0ycufRnAr5pWpugUqcw4tH6ALRDZpv?=
 =?us-ascii?Q?09nmBFz668RbQwVILw+f+Umq1xOWC7pNFjkn5qH2s+V+l/EymwqSSgqNADKJ?=
 =?us-ascii?Q?clFaJKClTs+DKMg/NMGBs9emdVT7vmwPjyzHjqyd+8ap2JQnrEI2lzKPRpM/?=
 =?us-ascii?Q?wqxawIzwF8Fl1lAT8zZF+QI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MA1PR01MB3545A1255E7618D2F3FCC3EB80B49MA1PR01MB3545INDP_"
MIME-Version: 1.0
X-OriginatorOrg: showblurbsearches.info
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3545.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b320e8f5-5cdd-459d-08af-08da55e29065
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 13:07:59.4232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8e4bf5dc-1586-40a7-a144-f33548ca1a2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N71f7SWTzs1bqzW4MYk/gnexr4OTN+P+IWmFx3WVVeCVrvve5KGrEJIlhQ4L62b132ZlomJ+NSLSpveyBFUCtV4GcB7xWP5EsUTLqDaWWBW+vMPgBNvzBPkfpmDmW6kb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB3743
Received-SPF: pass client-ip=40.107.222.56;
 envelope-from=sylvia.benton@showblurbsearches.info;
 helo=IND01-MAX-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jun 2022 09:09:36 -0400
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

--_000_MA1PR01MB3545A1255E7618D2F3FCC3EB80B49MA1PR01MB3545INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



Hi - I hope all is well,

Are you interested to purchase the list? Do you want me to get back to you =
with Counts & Pricing for your review?

Thank you,

From: Sylvia Benton
Sent: Wednesday, June 22, 2022 4:40 PM
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


--_000_MA1PR01MB3545A1255E7618D2F3FCC3EB80B49MA1PR01MB3545INDP_
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
<b>Sent:</b> Wednesday, June 22, 2022 4:40 PM<br>
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

--_000_MA1PR01MB3545A1255E7618D2F3FCC3EB80B49MA1PR01MB3545INDP_--

