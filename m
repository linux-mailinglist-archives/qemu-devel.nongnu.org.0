Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B5339A3C
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 01:02:06 +0100 (CET)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKrjJ-0002Sz-1z
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 19:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lKrhp-0001rU-Mz
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 19:00:35 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:5020)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lKrhj-0007KZ-UH
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 19:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615593627; x=1647129627;
 h=from:to:subject:date:message-id:mime-version;
 bh=Bjue02RK8V0lM5T9u+WTSUdGgiGct/T50GbMlpuxXWQ=;
 b=p/w6U1qMAJc3HAXTnZSc1A2vx6VUlU0MPwgqMVYzCVAs2X0VouN4nLGg
 wlcxRHrODGicm5hk5aQ6a0Nl1OETEVFY9lwiSCBy53LSBJ3Z+GgkHbMfE
 Eeg9QzRaJ76Yj/6EG1VQ42Ka3/nlym7l76P+L0Au1ZDYayB/Pmzc4R0BI c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Mar 2021 16:00:20 -0800
X-QCInternal: smtphost
Received: from nasanexm03c.na.qualcomm.com ([10.85.0.106])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 12 Mar 2021 16:00:10 -0800
Received: from nasanexm03h.na.qualcomm.com (10.85.0.50) by
 nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 16:00:07 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 12 Mar 2021 16:00:07 -0800
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SN6PR02MB4989.namprd02.prod.outlook.com (2603:10b6:805:71::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 12 Mar
 2021 23:59:54 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5485:c29a:8c18:d524]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5485:c29a:8c18:d524%4]) with mapi id 15.20.3933.032; Fri, 12 Mar 2021
 23:59:53 +0000
From: Brian Cain <bcain@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: gitlab outage?
Thread-Topic: gitlab outage?
Thread-Index: AdcXm1mg3VtODd2tTLy9kx+J3TRZuw==
Date: Fri, 12 Mar 2021 23:59:53 +0000
Message-ID: <SN6PR02MB4205EC1BAA236F9A8E34E605B86F9@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [104.54.226.75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5c58257-b301-4614-10ea-08d8e5b2ee68
x-ms-traffictypediagnostic: SN6PR02MB4989:
x-microsoft-antispam-prvs: <SN6PR02MB4989EB483ACE04594DDE829EB86F9@SN6PR02MB4989.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wUGRT+k6c7D+FuDdLkXbhKx/ZnjtAQUngXQ3DfccqNd7D6/CBCwqJd1uXWMy5+F7hHJcp67eJZhDTtpbpgAZ1EnEsXAgNys/Z+RH8zBvV3FJkvStcwCQtNsq6uEtzDFMVILrGvlwutxbV/S1+Zee2ApeeYa/q8dVovkBLfZoA1F8HOoejJ5oxFEhIvBNz1B+SNA/SnPwoc+AWIi7Ws4P0I0GkboFm+ZVmsJVIPWvusGGmA9NcXCQyqnz/foEOir1y3P9/bKopI2teUBRkMNQFQnehp3Xg+/W0TQ+eeacGEIk7GhbvIOUh155evxjZzZ5q3317z9HzC4tRR4gLXDgbXeZzeUrE9h3/iMeYpG3Mu6aOGm5GBZf81o8eV8M/FTD/3BVxlFLQ62YURacoMgqHdcJAqJA/J38/+PFFgo8uvsrnYnKYahwSa3HTezoq+Cj9aXFgULTtuGdqS+mN07BJVijgQRwBzUN59JmpIusLJ8riOueal6wLzkLg4cmdwvccAjWFSIF5NA/28L9PZTg3Ak3VlvyvB2wLCrPG2E+dKGjtgnDzIFKT5BYdsKZbruz+a4U7O45vPId6407o8ZGGtZafpYDTBuv7QRT/xYcYpaTra09JBHLOkOjxdPt2PqGGxqKxPd/vuA624Lugeb54g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(166002)(33656002)(86362001)(83380400001)(66446008)(3480700007)(52536014)(558084003)(76116006)(64756008)(66556008)(66946007)(66476007)(5660300002)(966005)(71200400001)(186003)(6506007)(9686003)(55016002)(508600001)(2906002)(8676002)(26005)(8936002)(7116003)(6916009)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?V1/S/mPwW5UcKJx0YSyHCDJGIiN95nP3FNUNSUP+FXjzA0EXOWkPKLImMMUY?=
 =?us-ascii?Q?3dMKrzF4HtkXQpyzPE1gGiXGGlycDpg6YZ8ILfMJSwSZBqfjGcT1L6e285tS?=
 =?us-ascii?Q?jNFQz4sS3xc6cHS0KoXt8t7wVHBLO2K4kiclV3jEI+4xRyS0/96/is+dVsDI?=
 =?us-ascii?Q?8qOhzk+m5JrOPzRJYEty+Kdxd8ojnjnmYXZkeXkPamTRcaX74QEzvGp2BJAC?=
 =?us-ascii?Q?Bw+O3mnb2D2AxYMogiyEp+ppcr85UWmndbSJY11/KlqVwfMFVY2z+0x8Vk05?=
 =?us-ascii?Q?7PE7lxUkl4i1Up1AZZRG5i96EoP6k8yN698kr3vP1ZiDLfQs84o7+Q5MHs0z?=
 =?us-ascii?Q?KuRGqvKTpyl4vCpXuFUgAY+xTOuMMSdW5jzla0JZnoTmjfrHBcWYWLPBtQrP?=
 =?us-ascii?Q?7OEGVCjpcFe1rn5msjs5uk/9sqL7mXEqX5eZAWf/gMQRLvBPWFjC+6Nr3ekv?=
 =?us-ascii?Q?gXCVZzPXZsOMnjCLsDlEkYGP55SQTGugCjVsARLRGyYlzmxG2vHVKF69r+gm?=
 =?us-ascii?Q?Ak3jE7BR5lCRquVgs5tkkyx4sZV/07+z5wfj3LscoyKN4soVsL60dRD5o5D3?=
 =?us-ascii?Q?mJWNXd0jvFVa/BW/S6EZbDuszWZXeZr6cOVPscUku/nqKtbNuYd17eiFmXkg?=
 =?us-ascii?Q?6X9tYyyuh/8s+OIoDh/r8M9Ko1+/j4lXexBz3BERmGhWGKzH/gETH4yOrz0H?=
 =?us-ascii?Q?dVYAvgwSL318CaKrCaIHRDPfqT/1yoNOpC4u23Ty/lcYFCZ+Bmm3gKSfbFyk?=
 =?us-ascii?Q?DOXLa8pB1PntHE21nKFNam6Ja5LaSuZrb1MROwUzC4uITm9vP/3JjXcX7y/J?=
 =?us-ascii?Q?dOfnbMatnz0QAC2qgH2EOMLp7fdKO6MjvZp3kaboSx5q1SDtIm7FLDWmh2aE?=
 =?us-ascii?Q?BKjNvUm7fNreCmGFPjNGXJwf3j4vcwm2qJ93JAuoIgZNVVdGS9a9kaB7+0br?=
 =?us-ascii?Q?XTY4O1bVPaX4e75auqIvvltmBMkD5doCltm0G0r4LZbmRvVHsn9eMpue93u9?=
 =?us-ascii?Q?PYWWqLxU5addFuOyRSxzxb7iHjxuvdp/oGAfGdG2t4k5/QCh0prTt1Cb3pg1?=
 =?us-ascii?Q?KzGGiFMBnUMII663J5nWxWUnoJIRJ6v6GxtLLtk3+gVQ6MReZVYqde3uMevb?=
 =?us-ascii?Q?WHST0lKLYJMRau5vE1JvLuuDjDHvoZCmATONA+BxWybyck6qmHWUQI9f5FZ+?=
 =?us-ascii?Q?ZZ+Fwm3RtympBSrkN2X77JmVdqUvYZB9gu2aLn+SM536cEzEY/DoQkkA5xbD?=
 =?us-ascii?Q?GJZEK9R2P4LvDYEhZJkDpoBiaSDCkzrq9CIBtQxrnz515+Od0e5Lmu5qZnxN?=
 =?us-ascii?Q?HI4Eb+wPFASn62dFqDu03yRj?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/qXwwhDFPpCT8KYUoS1y9ioFgZ8YzYbqRbvkAB9huHny25W/iLGhHsgt1ynC89pq+sq9dVgleJBKHjbb5L6VZnEGP/zwmn7XyuGJbW+RZK9QOEB51RQ/HWfs5/4bAcsbdRhMM+OrWy6u6uqugZq8MKTZsMeO8FQnqGsgqmYVv/J3JMuaAFYuzWHDvgQlqrmH4EeDBoIDnE4PGlAwjkaBNlwjUBfU032KdT5Y80Dtv/ohVakK9KFZ+kZ0fSZgVVQObBT6eWHWcw99wzLMDa8WSw0Q5Oe0Xa+1/pOmxmwYg4NR+j2FoEBU/+oCLSNn/4OTDAoPvr1J8pm5Osp/FcsWw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwN1AcXzIfF5lN30QqK3xU+rLcQLEjCGKtpemFdvnCc=;
 b=gbaZoahl3a/ILhLld7gHlJY+dOkmxLxQhqsA6i0rWMeh4cqRqf5iW6b6j6kAMcCZE1OoMZYYv7CTKCf1vMWwubJdw3UE48lx7baIXcA7TcQU1+d1alRg9fIA85IYlMXAsZ01PhxcN5LYIRvmfn2Hg7B+H36rAlNpnuYGED9CPQaQ4cl8Lqfw4Z6Sy02JAbbSN68fc3Fpwu+B8wQOYkmAlj5okDGWKqkxAF8XS3Lqjyi3LEr4kz0b+ylPED0Aj13WgQjqYXeGTUED8PfpNLzmCCOt1CJRAjp5aDQTvQ9WIGpbx9M3ltFhH4Ol4kByzmRvkX8/ypHzpPT+zQTA+tvo6g==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SN6PR02MB4205.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: a5c58257-b301-4614-10ea-08d8e5b2ee68
x-ms-exchange-crosstenant-originalarrivaltime: 12 Mar 2021 23:59:53.7413 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: nqaSlo0Hv5jok+y3qsjIQzSG43V1CvV9Lrcqh8tRm45VA8x7rVY2Rtdn7mMAMMpKrSDX1DmLPEN8wQ08NcAiHg==
x-ms-exchange-transport-crosstenantheadersstamped: SN6PR02MB4989
x-originatororg: quicinc.com
Content-Type: multipart/alternative;
 boundary="_000_SN6PR02MB4205EC1BAA236F9A8E34E605B86F9SN6PR02MB4205namp_"
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=bcain@quicinc.com;
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

--_000_SN6PR02MB4205EC1BAA236F9A8E34E605B86F9SN6PR02MB4205namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

https://gitlab.com/qemu-project/ asks for sign in and if I do sign in, I ge=
t a 404.  Is this expected?

https://status.gitlab.com/ describes "shared runner degradation" but that d=
oesn't sound like this problem.

-Brian

--_000_SN6PR02MB4205EC1BAA236F9A8E34E605B86F9SN6PR02MB4205namp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
<p class=3D"MsoNormal"><a href=3D"https://gitlab.com/qemu-project/">https:/=
/gitlab.com/qemu-project/</a> asks for sign in and if I do sign in, I get a=
 404.&nbsp; Is this expected?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://status.gitlab.com/">https://statu=
s.gitlab.com/</a> describes &#8220;shared runner degradation&#8221; but tha=
t doesn&#8217;t sound like this problem.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Brian<o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR02MB4205EC1BAA236F9A8E34E605B86F9SN6PR02MB4205namp_--

