Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA8431F303
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:25:40 +0100 (CET)
Received: from localhost ([::1]:41652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsfz-00024a-Ss
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lCsdw-00018X-JB
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:23:32 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:46618)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lCsdq-0000dA-55
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:23:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1613690606; x=1645226606;
 h=from:to:subject:date:message-id:mime-version;
 bh=QZoNOUoqVxjl+yvIqjJb8cYXoojnYPO3Go8OMtdqQaE=;
 b=gBDWD6W1uT99SjgVHElcUG4NHnbn7agI4fRUElm4T99VVeFvtURX2LUB
 gFfFoBIxn0QuF4XICNkMXbHzYdEuYmUCp2djHrZCCMLJLt11mS4GleBIe
 vFr/+E8bJBXrWFUoBufbCY0dinUKviAHmygP6AbxgHYlMCSAfkFtI+lF2 I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Feb 2021 15:23:22 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Feb 2021 15:23:22 -0800
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Feb 2021 15:23:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 18 Feb 2021 15:23:21 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6993.namprd02.prod.outlook.com (2603:10b6:a03:23f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 23:23:20 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3846.026; Thu, 18 Feb 2021
 23:23:20 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: How to get a wiki account?
Thread-Topic: How to get a wiki account?
Thread-Index: AdcGTOQcWl7Fz5PoRJqMOX/d/tn9zQ==
Date: Thu, 18 Feb 2021 23:23:20 +0000
Message-ID: <BYAPR02MB488605CFFBDA686B2E00640BDE859@BYAPR02MB4886.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 651e0153-ebf7-4bcf-e635-08d8d4642e23
x-ms-traffictypediagnostic: BY5PR02MB6993:
x-microsoft-antispam-prvs: <BY5PR02MB69931F9D9A0724A96F995B36DE859@BY5PR02MB6993.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BGhG9DZCbG69OMHB6+q38kiid6ohmxwBU/3N+daD+Vob2E+187PDg9OCI5BvORmjDICqu1f3uunvdjgDHWKrBdvazK1CUQF3QakcTnGyFw6HwtkqEv0eErHr37qktsRwp3iGcf3a6YQb7SztQ+hG68wC9lJBmdIjwI6vE9D4Ya9zNC9ZAipgScgEvOqYn69F1TkdOVRxyakz334AwmjP9bQ84dO5fP6tVdaoO9EAAfBNuKRkKhoX95xKOz+8cyFwLkH42WsKDeLUGcJmK0hc3vekcoBvenCIvbcEqkCfopjk4LY7JFyE2+KQx6yYk1y8OUiJ5hDDOuPW2q24NI8wFHHi0/cfd4/eQN3KFU6H4614pIoyD2z211v9TMUQH+v80pJ+3UtrYmvryCGpC6iZYYAfMnfN+7efUhoVGyD6YktwJqpEYq/cAEOve2wI3CxMEzw/6o6S2ruV4QYivH83KppNQedZoKCAVDQAK/5t8s2i3FnUgI1a+bKXUzyvX0Sy/L+b08pDMb9OfrS1Qqip/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(9686003)(478600001)(15650500001)(83380400001)(55016002)(52536014)(5660300002)(316002)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(6916009)(7696005)(2906002)(558084003)(71200400001)(86362001)(6506007)(186003)(26005)(33656002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YXYLrPofeqJE7Monx0qidVeT64qD7hxivXGaySO0/x1kU84tVfsPfL5GhaEp?=
 =?us-ascii?Q?DI4ed+eJAKEsYpt9ur4xWRLg6U2P9lVflgTKXdQD7rS0Z/54Mf3/9P3rqkVR?=
 =?us-ascii?Q?jDw9ghS90ya47yKB67w9DVAbxvqS5Non0HP7yQQpej4xvs54KYtkIS4p1mCd?=
 =?us-ascii?Q?WS6Wn4yAwXRKDDtPy/MR0pmUdlnc4OTdiIbvM7vgF7WJn8tRVRnbJo6qfBBG?=
 =?us-ascii?Q?PJ+Z2HC4U7QI4Gw2mQJMEYfM6PNPAoWzz6mtzRwQT7O39yj3coaNqFRMzZNq?=
 =?us-ascii?Q?cAnkkLVB5PIBWd1qbzewDar6IB4c0mKftfLjO4SbR06f5pKKXrLB7/5ygs1c?=
 =?us-ascii?Q?wOBlFZGbY7y6MQKnYW8Fx/Arej0dot3BSHUgwJTXvGXMZZc3FfBPaYeoy21l?=
 =?us-ascii?Q?nssAzkQJYb+gigsQtgvV5nvS8Q4DclEn2xWST+HgPK2gNSOFB4o3wTQpeEVs?=
 =?us-ascii?Q?npBqC/fzq4XtWY1AZq+Sieew00q6MQNusaKdweA+0jGIHXHr4cy0rXGjhik3?=
 =?us-ascii?Q?VEECaCG5zYNo/TOs8wEUUog1rM+qwVB/WR/0DtHvxBqJjf/U5jjhRizbA309?=
 =?us-ascii?Q?VazHxkXQzwIsV8p6Ec0rmTXBFXdvE5YNlC52BOdr7b1+m0Vytx9ct5WCQU2C?=
 =?us-ascii?Q?ClGxJ1TmibCXLMi8WzIAOXgxznp5l+FqSchRgiN/mX6XdXrzinN27xOZ9dYu?=
 =?us-ascii?Q?Ksy+lm/MAH5P4R+8x3mUr+aZfw/buBqYq654JrxiKrXQgmYuYlDiHZLMvf1j?=
 =?us-ascii?Q?8Jzaa1eOXxY34CjEhBiJ3YeBqDdh2bRFkJ/nppVKtmrk5+tqIfdXTQINWenO?=
 =?us-ascii?Q?G+gnRAhV9LiSJH+aVtA8F2xj+MsOpNWfgxDbaK2iQs5LBItzZe+joTesmTXk?=
 =?us-ascii?Q?1X1VSn8OO3id08V/yhNiCjqn61bMH/PLARKbCEzQZwVdP9IVANp0gnCS9eCs?=
 =?us-ascii?Q?6ERFWpPMiDridEuzYUf/V6wWGPl0iSOMZnX188ZGXnnrAD4sGNjIySsmOBTW?=
 =?us-ascii?Q?MNkp9OO0KQPOlUXHMBXtCWqvlSrrjIrvZZrtPv8Nkw8honTbajZG5jC6lsTr?=
 =?us-ascii?Q?MJcVLjzVSN2mrXZMzPFbqF/Xq/+EX4gghJjCRkFPixGE0t0Z/NLBN6zBsjp7?=
 =?us-ascii?Q?qkPK50MghVQA4dO3Qfg2EVPlEAOdKIRlYNOD1l9nmlKCnJnysEYOEE7fRh/y?=
 =?us-ascii?Q?O/bBPi6qYtERA+CXbfrWrXpoLcKYWfsdPYZhy52PU0naPaGoWawlMy7J3o6i?=
 =?us-ascii?Q?ota4NeNvBeaPNbnMMEySqNKQMp3X7oI9EWIVaIawLrnxhj2yn7MCvZLkHx4a?=
 =?us-ascii?Q?IYcPs96i2IaEfV40Q47z+B7f?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIimWP0WM92BeWlH2O2k8KHKP01r2kyc2BKxjlx63t7ooH7QV1bwrDCUhcr0Ar++FlHdzVtLlhQjtau8S3zAtX7DiiAwdk+QpyD8z2k6+x26LlrMcsTcYDMl+A7YQQgYrKtC/Q3w5CWoIVE6hYP9sPvOWAebkAqrXRBPZvK/LmHyiYP03wXKppKEhMEli9KBDBI85EoS/A7a0pfLn5zMUCt81H9pJ5qzN365L8+Tad32/WVFiGgeY5f6D10QxdS152o5s0erUkEJbXcFmz+OLiWGPCNp1VrjQF6/JCmlwLKGG0sxQh8GOjyOaILr7pE6o1VoTsZa0IGvKLzAueZkGg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wax0lJGFgBmY67JtZBu29AYBu/fNfbxlaoSuAjTc7OI=;
 b=cFPjDTSlmGMEl9OOoHBDXLsLp6EL/biwkun1u9paRXPYAdc4kvGC8+CRKG5WFIoa0CbLE20VQYGTV8r8YM5YF49ZiLoMvl7vGIvL3w7kTCFGxAy9vU01PajNEyiSJ/1lPFgNOxiZWEdaYz3ddeaow5mft7p+U0BWtosZz6ioJMyltoq+50nh1yBoq3s2gjq4yKOGMnzz04xC5ktEd9Z+ACZHlpo3ovQBLKHCXg+HD8E44KdPiXLAQm4xL2fmJg40TFUv3ZrO+A3mKCGY7OqOs5/0pUGn8tX22XYtl0OooXVD/RTm0YntPGJC4/H1Q2B7hor7YpGGfF35SIiQUb6OGg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wax0lJGFgBmY67JtZBu29AYBu/fNfbxlaoSuAjTc7OI=;
 b=Bb/jc0v1dip36lmZHLgGes9UmZJpFmNqvJW2Xyo6uam+KUcK/q9HU6570/sDQCetA+013THl8XKWm9m0NZCM1AVffcGXsGyy4A2MUp8+DxPOey10O5oYCjzxOHc2xno0ESIg1GS7MX1MlOmxRxT3yF54q9Op69UIKlQxWAcScgs=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 651e0153-ebf7-4bcf-e635-08d8d4642e23
x-ms-exchange-crosstenant-originalarrivaltime: 18 Feb 2021 23:23:20.7448 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: SeJllCZtrr3BZr7Rx/LEK5hHilNAD1hQPRCrJARxPD0DLAGyma9JORTYINpP1iD/v5cYA218FOf87gCDPlugMQ==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6993
x-originatororg: quicinc.com
Content-Type: multipart/alternative;
 boundary="_000_BYAPR02MB488605CFFBDA686B2E00640BDE859BYAPR02MB4886namp_"
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--_000_BYAPR02MB488605CFFBDA686B2E00640BDE859BYAPR02MB4886namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

How do I get a wiki account for wiki.qemu.org?  Going forward, I'd like to =
be able to add information about the Hexagon target.

Thanks,
Taylor


--_000_BYAPR02MB488605CFFBDA686B2E00640BDE859BYAPR02MB4886namp_
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
<p class=3D"MsoNormal">How do I get a wiki account for wiki.qemu.org?&nbsp;=
 Going forward, I&#8217;d like to be able to add information about the Hexa=
gon target.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Taylor<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR02MB488605CFFBDA686B2E00640BDE859BYAPR02MB4886namp_--

