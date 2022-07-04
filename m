Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB85658EA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:49:07 +0200 (CEST)
Received: from localhost ([::1]:33598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NNq-0005E9-K1
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1o8L1A-00049j-16
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:17:33 -0400
Received: from mail-vi1eur05on2072c.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::72c]:46401
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1o8L18-0008Bp-1y
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:17:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENbftYtKwQHhwio5APq3W8CV3hAPR5bYW9r9MugWmlJ1A9i5Pe22T8Mg9ywn8aOi8/AX6yX+q0mdWz2ZlRAIOG4lvyuk+HeWmCe8G8GNr+n3ThTFjWK4SaUnN9q4hCAQ2JHvjSiiX0Mb18ejQ0kg2l2+dW91pB//AdX1E+CBjHSdt1FciMZX6iyTp9DkhKJVZ+0/2s0ISA5aymZbZaNdWx5Y7GLDy7fn2O/OBkrA7b+no0wukB4NvHPkF8PUkieCvqIpSNrmlhGnUxklj5ez/V03hXoltGYx5vIIL2YiaAS19Tc/BWqWRfH6q8bv9WSFOxT4+kJ9cgt0b6LxGVI5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zR/f9whDszMDU+aRlgT13dv76BIto3r0pobsrRYAAfU=;
 b=autuSzOxU2bPL+3i7QC6LEMjJGtYhXisLqFG/5lGJvQZYCJdOr7VO8dbeobJy7exEO0co1tEBZh+GyN3ZTXpLsnBSvboXDoN/hcuXfeuHOW6hFSW6WPTEmpIfkBeNmc3JN+n6J8bre/uVpl3d6p6vP9zdtcJJodqPu6MZNEagecmjsLz2z2Z5SN5o1X11KH6GwALeGgyZFxqYd0UrFV0H8VXAng7D/Eum3vfBBf0j9ByGBxGwuKLBkrKti8y8R+DZ3j8o+lYbFmvgGEuHAN29oPdmWqkpca80itR4YoDD2h85BDMFltCotJB1fwS+GQqxAF655sQQfgo1xAD53JBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zR/f9whDszMDU+aRlgT13dv76BIto3r0pobsrRYAAfU=;
 b=o7JmIoAk0vdFlTSDVHYkewSb7ZtosKgT0TMjTWvtbUcYo9qYOMnbL+cFsSQwxy3VB4PQ9MVONSIRH7ZddOv+MConIVuQhALTKBZmxpeSJkpZvbLILXH4psMxiFwtTjJ58+lVA88gnQgoAviBadopUpcjF8nVSRmMICADPnaLsNw=
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AM6PR03MB6088.eurprd03.prod.outlook.com (2603:10a6:20b:e3::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 12:12:23 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::bcaa:7ab0:a9d7:5aa9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::bcaa:7ab0:a9d7:5aa9%6]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 12:12:23 +0000
From: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>
To: "thuth@redhat.com" <thuth@redhat.com>
CC: "cfontana@suse.de" <cfontana@suse.de>, "berrange@redhat.com"
 <berrange@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Djordje Todorovic
 <Djordje.Todorovic@syrmia.com>
Subject: What to do with the nanomips disassembler (was: [PATCH] disas: Remove
 libvixl disassembler)
Thread-Topic: What to do with the nanomips disassembler (was: [PATCH] disas:
 Remove libvixl disassembler)
Thread-Index: AQHYj50uOHdu/aranECmbCSJvx652w==
Date: Mon, 4 Jul 2022 12:12:23 +0000
Message-ID: <VE1PR03MB60451347A50A8DDEF6F8B5C9F8BE9@VE1PR03MB6045.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: ebf367e5-7d99-d45e-9172-2c5eb225b5c1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Syrmia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73b8ed7f-9472-4659-51bf-08da5db673f4
x-ms-traffictypediagnostic: AM6PR03MB6088:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t8TBTVAuANpDV0W2iInZrbACIWiwSKxlbYpcE5CDyQfyMDZ3nFHdorNzOlzJiZ7nydTKQ9phrvJs2I8D1ZN/dzxR/84/bdbrfCnHjauiGhZ1FM4c9H+yUgCoEGo/xY2fCRIYiMTWrEeaGA1M5Mz5S5BC6mdJxJI17xpQfCGxUQHYm4CSTMoIbM9A+DFl0eCNbg2X7/AbbxQqffusotMATDxApsWJdr/FAI767dF3Wv9Js84HT5Dh5T9UfkJgej2qMSGlQ1yZGP+4W6yOxtqYL1SMPlRHLa9hf+qY7TEFVBnokqsEsQVl0BltewR2ttPz13AaV4Um8ZGd5tGNposjzFH7KNzBJOQkmwzQ4UATL6CQ1BMWWY2ocm8enL16ypVA/gr17jlf6QoCrJVNc2cv8wci8VdGzUUESRQS3qxKuR1FuXXEPDpUKOKsgmLerNJvbUSwalInQ7tdHGZO6tNBuTENuQU2n8yyi5hNIYb05oUSKVedM4OsmynzTZl+vQ1SrzPp3ygM5Ni88ZxMlaqp/tpZb9gIZIvcPBmIZkeOwiU2oM+GT0OkDGYbygRUosT5c5SFWmQuCQ7SfiaTzZpWIwl7+ZvsRoxsF8BkBV9kBkXuKfhsK/Q8ZjJiU5rujqlS+WiLDBEae0FQXHMUmXp/HjK+03r+tplllMloYb6rmu0mDqD0Ph47vHpvj4mK5DpQtmOJ82BA42rDcSHEM0QBEJqfBzb4qMEFrc1aP2JXZLnaNgx3F8GGOxmIz+FUMOPhG2m7OfMRa2H9T6faX3FVBNtVQb4jJHkyqOMeuMjBISeOJPkS9vbyI0MGL+oOn4KA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39840400004)(376002)(366004)(136003)(396003)(55016003)(186003)(19627405001)(107886003)(558084003)(38100700002)(4270600006)(2906002)(33656002)(41300700001)(38070700005)(71200400001)(66446008)(76116006)(66556008)(66476007)(64756008)(8676002)(4326008)(66946007)(9686003)(52536014)(6506007)(5660300002)(7696005)(26005)(8936002)(122000001)(478600001)(54906003)(86362001)(6916009)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EuA6JeGYdj7lr2K9i9mFGQU073XVLJA9IWQLA3awadr5rUYGXkTLzmqpnh?=
 =?iso-8859-1?Q?GaJiiFkUloHYHr+9zJbJvQBM0vLsF20wzsx55NZBJE2gXuRh564Iu8+j8U?=
 =?iso-8859-1?Q?HVHm6e2elXCWzl1Ud5jgj6q1wxlNtLP3jAH2s/EyZaO5NNwBTpR3pfm19H?=
 =?iso-8859-1?Q?KUQjOzoUU5N2lb7CcVOpKUB58nm9X4iO8nlIlDu+wuGYZL2qOQW2c29kkg?=
 =?iso-8859-1?Q?C9wngnPZuzVfUjWo2qcVm07PkVNd0rQcjKtPVcNj7SXH3lB9rEUU6yhM8I?=
 =?iso-8859-1?Q?e5AnSuWACCrqFy7ryfdBeUcn2/2zpch8c5YwfUe/N52BPtSmsai10LwBJb?=
 =?iso-8859-1?Q?Gqq1hzYNVhawOLx6cOx0aH7dbT/h6nxlMNfh1fRQu8/iDo+2AyDm8hnzEr?=
 =?iso-8859-1?Q?iwcqREO7NJ7GtRl+a6PFBS4yJIRKszeXfKAxxYroJKzw6Vz8/9QjoV/cqF?=
 =?iso-8859-1?Q?nQ1KgJgsXap3wF7ely8FqG0KIizKOX0MfNdFAlVawjtQmfK+wE/BEuz+KN?=
 =?iso-8859-1?Q?busDIJyBCH9NtBpqDcpykiirfrxHhUjNRmOYrm/RSMJzxFsUQW6XX6xpHJ?=
 =?iso-8859-1?Q?sQt87g0VK0H9cBTduc/y56GTpkCyA69vsOsBWNAFJAUyrtFs3ZlWq4LNDK?=
 =?iso-8859-1?Q?QoY9cHjrHcGQ0Um4Zj8joueMEELFnC7Y04sSrnEyo32tyhqZTLZrl6oHvL?=
 =?iso-8859-1?Q?SG4M2pZ9/dH1uma4yWkJxx+oF6QYkeIlRuy0I1YB/62+v9JAizj2+gFddQ?=
 =?iso-8859-1?Q?OKbMKzosMOBGx/Eu9Mp9Kckfk8X7QSfb3LkINNEeaiwGEBnoBiS6WQ8ZsO?=
 =?iso-8859-1?Q?8LKDa2n8f7+R2vzDO3a3SdGN2M3IdWJeyr6gO2lvq82GtOJI///tm+rg9k?=
 =?iso-8859-1?Q?t8EPS0nhf0UTjj8yP+nXwe9CPhfk9ceEMrWBu/O4IS6BasMN9oyXaV8Li1?=
 =?iso-8859-1?Q?amu4OeJR8nkyl5Koj2q7AJJ4fp/EYozhwrzI5j+5hhHkpiV3OqkSE0wAnp?=
 =?iso-8859-1?Q?Iydfh98HSsRRaGOu9MVKK1x5+Wz1FiykyjVYqGTuE/SfCiGhBYB0J6Y1Ji?=
 =?iso-8859-1?Q?EDv6BZMQtWzNqhvdgCtwItCUhW1RoJeFhpA+zfXfobbC9nuwCFmWKTpovE?=
 =?iso-8859-1?Q?+mWtf1t2Z4Pp5a9j7i14XJr0IkoKRVUXOVyEyKHZOaplSzJVFH/c2ouGq2?=
 =?iso-8859-1?Q?zBNCNMU+WlHHltRDeXY05+39IzQb96A3RPLrPwpEt7yKm8t9XeO5JGAV5c?=
 =?iso-8859-1?Q?sHfi2PIiJBXo0OHiyGMGJSFIdM47R9mYf9L+Fi5UEq6uBEHXcNwRvZECvr?=
 =?iso-8859-1?Q?TersC5suCEdO+NRLzcIjvv3ZL6EzyP/oreStMbCEDhfhkz0Lt+yzkNzZVG?=
 =?iso-8859-1?Q?BlHvo/qNxBK40tOxwO9V5GfUM6xCtDKPm7S8UcbyI64g7/7EKMAj/inS7e?=
 =?iso-8859-1?Q?xOQGGDw5RHDGLuNpd9teC0vDAyEfifyBsVX4g3AP+MBOLl1DlPZJrhhrSJ?=
 =?iso-8859-1?Q?njkvmsyzj24jqq58bPQWIHF5MfURzBlYNVCh88+0NkmSDbKMV2080erVV8?=
 =?iso-8859-1?Q?m7YN23Mlf+MZ08Baec4nCF5KScsINDClsfHfYjugLcxWpXWAndvm71PqqO?=
 =?iso-8859-1?Q?sWNxLT/wsOPyYoJjqSLIk9FKp+ECHVYS3m?=
Content-Type: multipart/alternative;
 boundary="_000_VE1PR03MB60451347A50A8DDEF6F8B5C9F8BE9VE1PR03MB6045eurp_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b8ed7f-9472-4659-51bf-08da5db673f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 12:12:23.6856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhB+tYGEOr51Pr4nRDPO22C2kQw/ONOuzOIpMotb+SNBCiA02uN6nQ/HSp4IU2Crv3QLDGlhk0gfGcY81GPxUBlediaF+y/gqzNqtUUH+/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB6088
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 04 Jul 2022 10:25:19 -0400
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

--_000_VE1PR03MB60451347A50A8DDEF6F8B5C9F8BE9VE1PR03MB6045eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone, I am interested in taking on this task.


Milica


--_000_VE1PR03MB60451347A50A8DDEF6F8B5C9F8BE9VE1PR03MB6045eurp_
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
<div tabindex=3D"-1" class=3D"fEEQb BeMje TiApU allowTextSelection">
<div>
<div>
<div>
<p><span style=3D"color:#1D1C1D;font-size:15px;font-family:Slack-Lato,Slack=
-Fractions,appleLogo,sans-serif;text-align:left;text-indent:0;background-co=
lor:white;widows:2;font-variant-ligatures:common-ligatures;orphans:2" class=
=3D"elementToProof">Hi everyone, I am
 interested in taking on this task.</span></p>
<p><br>
</p>
<p class=3D"elementToProof"><span style=3D"color:#1D1C1D;font-size:15px;fon=
t-family:Slack-Lato,Slack-Fractions,appleLogo,sans-serif;text-align:left;te=
xt-indent:0;background-color:white;widows:2;font-variant-ligatures:common-l=
igatures;orphans:2">Milica</span></p>
</div>
</div>
</div>
</div>
<br>
</div>
</body>
</html>

--_000_VE1PR03MB60451347A50A8DDEF6F8B5C9F8BE9VE1PR03MB6045eurp_--

