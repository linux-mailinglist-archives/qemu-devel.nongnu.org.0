Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D335FBE7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 21:52:13 +0200 (CEST)
Received: from localhost ([::1]:51928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWlYa-00068e-8s
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 15:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tbattle@thebstgroup.com>)
 id 1lWjVh-0002dM-K0; Wed, 14 Apr 2021 13:41:07 -0400
Received: from mail-dm6nam10on2063.outbound.protection.outlook.com
 ([40.107.93.63]:53536 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tbattle@thebstgroup.com>)
 id 1lWjVa-0000eF-B5; Wed, 14 Apr 2021 13:41:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdRLlGKiVMdDASSRsyb+c6gXx1l0nGo9uDRylCF5ujoKxCMlIEgeTX//g6Dj2nSKs+ZityW+eqAtB9/l2JQK2A9qEtUsBTjMIr4T5ScbPXUR7ORlVgtxVoVBJCsdPSVG25rotLUG/RaR8H9LO/ta8hEgL0AFr6489NaXSSox+LYaQS2xCCqaLOFlcUqmDDD7MbQnS/0/2ceUowlkkGC9phJ/nwFfRdNIP4dERi/Toq/34dtptnOI6HTxAThlCfrm1WvLywSnOoC3XWx4RU/zexqnVVM7Qbhn4fXgsB6ScO87pgMCa9S/jshmPt8NfScWJhdknXfl4u2QEPoc3tk+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcn20+CzZWcSEH7XG4UdMOjeQTTShAfHY9rkdTnPuB8=;
 b=LTt3cqSc+QihtjK4fRG88qgMoc+qvBO3oiLZ8x3fgebkkGXa0ebiKPg8STuhx3KfKyUtGZfEDtOpwKck0wp6HScjQGaFBciQIl2TnW/TcCpn7cLUxBi/jMcC7RKwFksIKxh/8J40td466HTB1L9bqRpphUq3mptDxgGhQMTVJ4JFUbmw3rgRZ60SBR80Rpr9Gh95zvGf9Gpd3gi2D5wy9//M9M8BA0hjV1eUl3UhHi/VLH12De+9Ui/yh9fk6vCtgxkAMXZVqPBqCmLYnZkjy28lDXFenAERray70kBwe50mrNlL5e6SuXVCuJSTqlaE7TJxvSPeQebe9W4oOfY1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thebstgroup.com; dmarc=pass action=none
 header.from=thebstgroup.com; dkim=pass header.d=thebstgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thebstgroup.onmicrosoft.com; s=selector2-thebstgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcn20+CzZWcSEH7XG4UdMOjeQTTShAfHY9rkdTnPuB8=;
 b=HVsns6K9nFqfWVDqNVP1/wsZzg3RM3D6FY6QD/ADQrXzHwC7XWyMKNBfRlhO7s4iBJzaE0kIXDObB+WhN/ZYYdAG7K5zpW+FLMZ9O0NnEmc0CWB5t8Beyjc2ZXTvnH7HihWIL/KOEk6m0C4Lzp5brEyMKjVyJwEjVYqGMJo2H5k=
Received: from CY4PR15MB1941.namprd15.prod.outlook.com (2603:10b6:903:10f::23)
 by CY4PR15MB1893.namprd15.prod.outlook.com (2603:10b6:910:22::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 17:40:53 +0000
Received: from CY4PR15MB1941.namprd15.prod.outlook.com
 ([fe80::91f6:4acb:a4f0:74b3]) by CY4PR15MB1941.namprd15.prod.outlook.com
 ([fe80::91f6:4acb:a4f0:74b3%6]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 17:40:52 +0000
From: Terrance Battle <tbattle@thebstgroup.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-discuss@nongnu.org"
 <qemu-discuss@nongnu.org>
Subject: Converting QEMU .raw to VMDK VMware
Thread-Topic: Converting QEMU .raw to VMDK VMware
Thread-Index: AdcxVQtHtZvK9gyuRu267l4ECSWtFw==
Date: Wed, 14 Apr 2021 17:40:52 +0000
Message-ID: <CY4PR15MB1941331170E5D19185C9B5E3A84E9@CY4PR15MB1941.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none; nongnu.org; dmarc=none action=none header.from=thebstgroup.com; 
x-originating-ip: [73.34.84.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a55fe3aa-1836-4a73-6025-08d8ff6c735d
x-ms-traffictypediagnostic: CY4PR15MB1893:
x-microsoft-antispam-prvs: <CY4PR15MB18939D111BF3C52AAEF51C43A84E9@CY4PR15MB1893.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kjrsJ1xsUjBt8RsJOCW2a0NvaLduWkwkvtAKVwNUCtaAl8qAwdKoVga24U2ri130dGwvigussj/FcgLLnRKxgAqAId2wNGAyCHaBIn5tQHPnHRYD08PlEFbZrdjBoqB3fFkG4o0zrqgma+qFwH3TBrTRa5i2eBP2y8Z68Qy43hanIHogk54yCr0nREk6luqapKQTfTLbskTC2NhoirI8yYTSrE4QCiSGYQgnl5obrX8RQEZCPyAVnmUJC0CKYW4556Q+mn4WpT3uoOc8pFAg3nlPwA4Rotwexfw2HS/N48zEzvGvTfLgU/QTrgowbPCvZf/ILvZfIBraZAl5uOLAuMR24nMgcXmE/roJkTnlCcjqAZtkMHmg0AVPVaxBwizUhUH+4D9Y3LlEmns4GNyVB+3OlP4KyC6E0YhrIvw2X1VhufIvJyiSheUZY5R8ARGCliyOhuni3FAV9/AOBpeYq/Dfp8IFVTNa1n1IAv5dz8pkBG+EPHXP0O7Kna2+iixjSNRkTOUOdEn/idiMuCGWfXLccZMRd4JK6d5Y/2Ov9vJNng9LQ6V5hsy93xbKFXys3aki03rMp95j7JYsPTU7O+9yyL2ijleqnznz93DhAhiJYeZ7PibUuT2oGrhlkdUaPcLWXNqutM6UHf1464V/CGqDZCHpydamhoTl4Y21XrhNHj2XzoaTOQENBXeAUA5hDZ41A/nLlWFBJjck6BNGz4BoCwpAamqiXgl6uAr4lY0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR15MB1941.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(136003)(346002)(376002)(366004)(396003)(110136005)(166002)(9686003)(8676002)(186003)(122000001)(86362001)(450100002)(55016002)(316002)(66946007)(71200400001)(66556008)(38100700002)(52536014)(66476007)(6506007)(66446008)(33656002)(7696005)(2906002)(76116006)(9326002)(26005)(558084003)(5660300002)(478600001)(64756008)(8936002)(142923001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7+4KLYo3wMMaTQeygKsQikMoou4tATulP14F/5nytteQqvf0q56mtcn1qUo5?=
 =?us-ascii?Q?SevzwNypxArfFjVKOyeJ1EyOCuZZxYcVkZi0/wOwUywA4X2hp1TcjBqkWphR?=
 =?us-ascii?Q?Zx7ECYWDvhtTXTprz1Meu8PQt0n2Nx34WhMvlzvD8iUYoH8GcwHl0oj8IGIG?=
 =?us-ascii?Q?0bgH4NXmuzxvDKCSplL8CpLRFoB+ir0auBSguuRnJno+8zKz8bWYjzuwlrYG?=
 =?us-ascii?Q?IIXmEjxABOe1X4+GVMNICx9IJvti4/Ik2kmVHqSLFtBpzw5QpICEYtzIfaJT?=
 =?us-ascii?Q?EC7sh8Cinmk4QZ7fXOq5igTOcBItm0nV1p8iVw0Ba0HCQzIbgEdFJu2uCYzI?=
 =?us-ascii?Q?IoBAkwmS8XwTmVWUPajdMhBC7pyW0R/T4rdGtMECaxV8Yfg14xGZtGGsAHY7?=
 =?us-ascii?Q?1cFFBYDlOf1r6fwxqyi7ilO+HjXHivjm22pNOWBvCoEXwEyJM2aQ3bhOI0PP?=
 =?us-ascii?Q?3OP+AUYFR73y5D7pcXF1jfctxlOHiUPzyebff72/SWgdBnmUQiI24b7i+Ti5?=
 =?us-ascii?Q?q7fpaGfav8ITEdvnLjiT6y01M3HZXq+aJ/unZaLBEk4zWAAuuZJ+8R9DRcBc?=
 =?us-ascii?Q?b4BbCytMt97fzJu3HaTThSPHfm0a7+ZG7lA1GXCLFAO7oegM0nxiMhZF3AAa?=
 =?us-ascii?Q?y1WAOBS7tOsuCqLambwjAglEAmzlpElQ+ovsAz2pe14s2fRyyRDNwhkDT4p/?=
 =?us-ascii?Q?IdmidduYPoHcYFvJHuXAZjcnY+MTD13DIsBb5p10q5wALUas0/JeIRaK9kuM?=
 =?us-ascii?Q?cZSvUfRWtXOEVzxe+FjNfVOMZuKaJPsk8lF9g/K6n3c7naKd/Oqn4Sa2lvjw?=
 =?us-ascii?Q?lHyMZoi6Rp8iXRZ5IUxffw/qZfOhOA92Mf2w3f0Xrzlcjbs1z5IOfrj4zkGV?=
 =?us-ascii?Q?J4DAZV/mjUxzBKmCXMVwYJN3c2q4PTmdYh6SrV0IBu77IkQURYXsRPkkiPOw?=
 =?us-ascii?Q?4a0f6Py4i9d919WPmTV57yBbK5WFLydc0L5GDNsA3iA5CIwebYWKJa2/eETh?=
 =?us-ascii?Q?thULyHAqmuL5LP8bjI7A1p7TEjVCsHjuW/mCSjomPP2aIClOPOM+8Iymh4NY?=
 =?us-ascii?Q?xnYNnsEBQurb0rvWCQJ5MKdzJD2spUZ2ByXwFx3x2uHlF37KTpvsnNRHsw6u?=
 =?us-ascii?Q?DCm+5w0n6psArP0aJTDrB/fpOKY5RlrpGR8EOgmjfgEeY2zOQ2UXiHqi4Hqo?=
 =?us-ascii?Q?U4tT/m6txV1jXcWcaki6fP1iaTsep081V/LvL1ZxH25ew/j/y/gFlGpPrb3r?=
 =?us-ascii?Q?PlkMTHMB87/8UR8klrF8cwF+C0lGLqJ7P4t/EtcYBhdLMTx+wJZV+MAEATsu?=
 =?us-ascii?Q?njM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CY4PR15MB1941331170E5D19185C9B5E3A84E9CY4PR15MB1941namp_"
MIME-Version: 1.0
X-OriginatorOrg: thebstgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR15MB1941.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55fe3aa-1836-4a73-6025-08d8ff6c735d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 17:40:52.7846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: df8e3c14-526c-4667-be48-cb8b78962b83
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prScZTvU98tYGsCI/i0FXLaGVX+kL2iLcSXysLTnKiheqJ7K8s4Ge9zKqP1van6QZ3ampxS4wmdufLfqcvFC7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1893
Received-SPF: pass client-ip=40.107.93.63;
 envelope-from=tbattle@thebstgroup.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 14 Apr 2021 15:49:00 -0400
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

--_000_CY4PR15MB1941331170E5D19185C9B5E3A84E9CY4PR15MB1941namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a question, how do I go about converting a .raw snapshot to VMware V=
MDK? We're looking to move the .raw snapshot to  our new VMware environment=
 for DevOps.

Thanks,

BlackSalt Technology Group
Terrance Battle | CEO
tbattle@thebstgroup.com<mailto:tbattle@thebstgroup.com>
202.579.7334 (mobile)
www.thebstgroup.com<http://www.thebstgroup.com/>


--_000_CY4PR15MB1941331170E5D19185C9B5E3A84E9CY4PR15MB1941namp_
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
	{font-family:"Angsana New";
	panose-1:2 2 6 3 5 4 5 2 3 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have a question, how do I go about converting a .r=
aw snapshot to VMware VMDK? We&#8217;re looking to move the .raw snapshot t=
o &nbsp;our new VMware environment for DevOps.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt">BlackSalt Techno=
logy Group<o:p></o:p></span></b></p>
<p class=3D"MsoNormal">Terrance Battle | CEO <o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:tbattle@thebstgroup.com">tbattle@t=
hebstgroup.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">202.579.7334 (mobile)<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://www.thebstgroup.com/">www.thebstgr=
oup.com</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CY4PR15MB1941331170E5D19185C9B5E3A84E9CY4PR15MB1941namp_--

