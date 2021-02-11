Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F80318E72
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:28:24 +0100 (CET)
Received: from localhost ([::1]:41438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lADtH-0007gC-EK
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <admin@fosshost.org>)
 id 1lADrz-0006oH-Mz
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:27:03 -0500
Received: from mail-eopbgr100067.outbound.protection.outlook.com
 ([40.107.10.67]:14592 helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <admin@fosshost.org>)
 id 1lADrw-0005qg-Dc
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:27:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BskLjiG8oSmRkOwvAdrJxKisTiSIqaP5Wtetd2TZRP2yA2a6XSnL/oyQm/qURgxt6v00OxLb2DfzmeJ9KZ0hb8MRyQIqrCQQt74oDXxXZkBRZ5FbGycrJdbBSlReqOgLfApF0Y/nf4jW09VQHndBjjGFvqkfSh47nVyc1N5DoQLJpuuA8cJxn1ylKJKo1aJJ5S1M2K1laTMnuuCQIHUl3J8pgNGyOY6CTJUcJh4X59BoY/Qd+QNpIO4BE+xHerO9/plV5ll/XCSQVqtWxTeZ5ioCyTHAix5iTa3ZquuY4zFNZv+F6VFMqHrksQRAz633KpJrv5piyjKF3EzSH+6oqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWS6tsyQjmtv5wdYP/vasqPROUZrHiKYRWikkyrPNPM=;
 b=QW+vVT9cjKJHuh8PMSfbWMHDrR2jaQKrIMAth1PoBsIEtFijoyc+1baQ3rFAFNQCi+llPd9HLAnTbVjNZrzRuOVAyQiolW5R14RLOha3AAIdmMpzhZfSoFVVwAZIFwO0X149wHJCbYOkyrbk4911XfQ/In2EhVYjLGxxKHolSbci5Ub+7/vND34JdrQzqLUPveWQDj4cRvWmHXoPUO+v9bZ1wfIPccxY8+EAbsaNjTpCe3kl5nqcVtG/WzbmLNI7dVTMNuI57Nsd/8k6uU9cea+r0lQoFijspNWxpWNGqOn7akcnVe4PR2ATb4/A/1AatJU61hqL0WbtU0tDJsNaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fosshost.org; dmarc=pass action=none header.from=fosshost.org;
 dkim=pass header.d=fosshost.org; arc=none
Received: from LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:c2::10)
 by LO2P123MB3661.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Thu, 11 Feb
 2021 15:11:52 +0000
Received: from LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM
 ([fe80::5121:a2d7:cd28:d11f]) by LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM
 ([fe80::5121:a2d7:cd28:d11f%6]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 15:11:52 +0000
From: Fosshost <admin@fosshost.org>
To: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: QEMU hosting
Thread-Topic: QEMU hosting
Thread-Index: AQHW424jqgpOevQOwkK3Y6N1ZcH1wqoZYUODgDhJ4ICAAA0KgIABkQXH
Date: Thu, 11 Feb 2021 15:11:52 +0000
Message-ID: <LO2P123MB26051C1C6C485711334D239FC88C9@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
References: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
 <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
 <CAJSP0QW7WqH1mmni84nn+id63nHLDNXd_nUDRaXKEifa2Jp=sQ@mail.gmail.com>,
 <1935839985.36186507.1612970109135.JavaMail.zimbra@redhat.com>
In-Reply-To: <1935839985.36186507.1612970109135.JavaMail.zimbra@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fosshost.org;
x-originating-ip: [82.132.246.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2101e453-994a-4a7f-633d-08d8ce9f5d0e
x-ms-traffictypediagnostic: LO2P123MB3661:
x-microsoft-antispam-prvs: <LO2P123MB36614C2094952E88FD8056C6C88C9@LO2P123MB3661.GBRP123.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ztfNSJGWvPA0vUJPZF3YPDC51heUa68xybypcpwyr1gCE57wUDNXL1hgidU5WxTFhjHtPndMCIvjaLDoijwIpzKNQZMjEmVjS83moSEnsL9niQmKeV9Rf0s04z1GHDmtV6OKGY+RiaxESVqLoFZgn1qFHXO9NBp7rYvEIb3o8CxuWqIxB5YKOPvFbr2CNZ+r/odgqqZ+AP2PGwrZaFob2AdiWuvACeznRIt/AUCpfwmSoHvj3yjdOWnur2LfAnZu3TenQ6FyWTuilyXNerstlwFg8yyWj3PWTQ9Inbk3WMaI0jTsNDp+sM8jRVwgxsTUFjk6Y7L3/Fp1HS1NyIIS/qWbOox+vdLQBHseMziuDn66t7kvxESGkmARk3wB19tFDjGFyoO21dauBFKwjlnMwTWJkeUXx0tB7x/ZfSgDd+2iDdvQ8sq5zypZGkC3D5E1Vc2aBXw/wDueKSC9aaf4kfuNEw4V0ee4Kdtloza94ThaQpv6cc6eHt5vMiEx19BD7Q2NOWcOqupnkLAhIWuAuO4nGHgNqZd/2ThCZeDuPcY8eNkAvokshq+n8+bZyHQJUr+6QBhA56QA3DUwpkz0jZ5rbMLWhyfxCzYaaUQY00phtnA+Ll8Z7L25C81dAyIJ5/nGygixkwRCFehD5/wJ0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(136003)(34096005)(39830400003)(396003)(346002)(376002)(8676002)(316002)(52536014)(186003)(7696005)(19627405001)(5660300002)(71200400001)(3480700007)(33656002)(110136005)(7116003)(54906003)(53546011)(4326008)(478600001)(966005)(6506007)(83380400001)(66476007)(55016002)(66946007)(2906002)(76116006)(8936002)(66446008)(9686003)(26005)(66556008)(64756008)(166002)(86362001)(11634003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?VZ+sSuYHw35ig/S3lJF4W97IlJvM+Dwq9o16AQMPZWmTysfE7QDwuZsqJXpH?=
 =?us-ascii?Q?VIvdDgRJCI9JLl6NCyWChxre4MshSFryKKN7eBGDhgbApxn9Ixgy2QZfDKEB?=
 =?us-ascii?Q?Db28e/pl5JeGojSxdkA/FPri6vX04vUFbT2j8WvVhzs1TDMrov0B2salFaC1?=
 =?us-ascii?Q?qPyQzo272oaprBP4W/P/IT/GgGeOPWWYlfsyOifzs067PDycmmrTJoepn0MH?=
 =?us-ascii?Q?TlhTKY8ZuToACnanC8qI4guWxBO1OzgnFz7oSO0otN4SVI87m6B6YvlNKp4J?=
 =?us-ascii?Q?yOpzmQj4MlwPHWVyanyggwsTouG4CuUZs6cfWUdpMI7RNPLqwvRKlluRVkQG?=
 =?us-ascii?Q?B5zN1PgO6GHsaIZzbULArtFTtT/gXoNsQS9NCFB83lqpJb1oBtKKFhQOD6RU?=
 =?us-ascii?Q?bcwl8Boa7qtsWabY4NYizLJcw4qZYzjM1JJ+KIH/SwAP9+bgMIysuLqdYz6d?=
 =?us-ascii?Q?CMPBPOAkFJgg+GU2aoXc/D79/+mYgbwVeXGKfh7AB/Tx3M4W0MAiQMheIPG3?=
 =?us-ascii?Q?bgk2zplZwcfW40VDIhjx7/v9mo6AIt9napTr6hZemwcwUNT1di4hwuVfqaJP?=
 =?us-ascii?Q?XrAUExrO+xzRuynEvTkubtpy0qtf/sO1R22ifNO2MLrKySN6QirckmzP9fFm?=
 =?us-ascii?Q?TVrOpfk4vdOoWTeYhM9aRCJf9Z8Dmcqfp2B1wiZKYTqMAjDuzQxSzrdwqODG?=
 =?us-ascii?Q?DthvnCJv/ur+I8uvliN8lzpN0j1sJre4uz6AblNmdEqjTVJBEDGXdnnnrJSM?=
 =?us-ascii?Q?jzLmtnAcpajwwZfmAvnQ0vlt0BHxE+tTKUuSHV2pFbIPCFMmmE9Rm9vqt7SS?=
 =?us-ascii?Q?V95235LaC/R4uC/3sSojYMRkWHwvhPKlA0iX8OlCxelXSftNjXvB6fSWz4FY?=
 =?us-ascii?Q?SjUEFHzE06ln8n3k1JEEICOhveUFyLBosba4NT9Pg3Gz64BnQOpWFC43ObAA?=
 =?us-ascii?Q?Ccg4+8UplRm0kpr9FS+CM+YmX87H2x+Xpjvc3EzWEX2mvCeOLPHI/gT76M4s?=
 =?us-ascii?Q?EmuglcxY5JpM78zQbpOq69zNGI+JqkFcfa251eIDbYSr0jhmCzblTL5VLelL?=
 =?us-ascii?Q?8TiE4K89/Rpwa7fjhQTUypSnj1jKB9G0XDjVAzUV/hn5YJSxpK6tTy5vR+ef?=
 =?us-ascii?Q?QUKXucIicIg4tNYKklE6pQJj2ogUJuFkX6UEs5AMuzCBBGLFkdPcDZa9Bnot?=
 =?us-ascii?Q?5q5VUtaBktQcfwmeUxB6d41Gko1HDAaZibat7CvOMApPJFU8xownaS7i+jiw?=
 =?us-ascii?Q?d61EWq+JYNpuEzLGIf/8zm8NEaAwhAUNJww0aoJL5Uef2bCia1c1XimsTrJL?=
 =?us-ascii?Q?lAY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_LO2P123MB26051C1C6C485711334D239FC88C9LO2P123MB2605GBRP_"
MIME-Version: 1.0
X-OriginatorOrg: fosshost.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2101e453-994a-4a7f-633d-08d8ce9f5d0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 15:11:52.8071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f05e4df-9801-4bb7-80d6-e7c58e957903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uhlmTO5yyZ76GFKnaHDpBo2zn8iTS3I4xd+y+br7CLewv5NqfaJSCn42hGj59QKT3bKJP5WGx7v+7w+mQtDo6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB3661
Received-SPF: pass client-ip=40.107.10.67; envelope-from=admin@fosshost.org;
 helo=GBR01-LO2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <cleber@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_LO2P123MB26051C1C6C485711334D239FC88C9LO2P123MB2605GBRP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Cleber

Nested KVM is not currently supported, apologies.

We are looking to change this in the future.

We use KVM to power the VMs (qemu).

Kind regards,
Thomas Markey
Chief Executive & Founder
Fosshost.org

Tel: +44 (0) 208 154 4278


Disclaimer: This email and the attachments within may be confidential and a=
re intended solely for the use of the intended recipient. If you are not th=
e intended recipient of this email and its attachments, you must take no ac=
tion based upon them, nor must you copy or show them to anyone. Please cont=
act the sender if you believe you have received this email in error. Any vi=
ews or opinions expressed are solely those of the author and do not necessa=
rily represent Fosshost CIO.

________________________________
From: Cleber Rosa <crosa@redhat.com>
Sent: 10 February 2021 15:15
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Fosshost <admin@fosshost.org>; qemu-devel <qemu-devel@nongnu.org>; Cleb=
er Rosa <cleber@redhat.com>
Subject: Re: QEMU hosting



----- Original Message -----
> From: "Stefan Hajnoczi" <stefanha@gmail.com>
> To: "Fosshost" <admin@fosshost.org>
> Cc: "qemu-devel" <qemu-devel@nongnu.org>, "Cleber Rosa" <cleber@redhat.co=
m>
> Sent: Wednesday, February 10, 2021 9:28:29 AM
> Subject: Re: QEMU hosting
>
> On Tue, Jan 5, 2021 at 6:55 PM Fosshost <admin@fosshost.org> wrote:
>
> > If you would like to apply, you can do so at https://fosshost.org/apply
> >

Hi Stefan,

I've made an application for one x86 virtual machine on behalf of the QEMU
project.  It's not clear to me if the VMs, in addition to being powered by
KVM according to the docs, if they offer (nested) KVM.

That would be an improvement from what we get from the GitLab shared runner=
s.

Thomas,

Would you be able to tell if nested KVM is available for the x86 VMs?

Thanks,
- Cleber.

> > Feel free to join our IRC channel on freenode #fosshost if you have any
> > questions regarding our work and service
>
> Hi Thomas,
> Thanks for the reply! I have forwarded the information to Cleber Rosa,
> who is working on QEMU's CI system.
>
> Stefan
>
>


--_000_LO2P123MB26051C1C6C485711334D239FC88C9LO2P123MB2605GBRP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi Cleber</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Nested KVM is not currently supported, apologies.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
We are looking to change this in the future.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
We use KVM to power the VMs (qemu).</div>
<div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kind regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>Thomas Markey</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chief Executive &amp; Founder</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Fosshost.org<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Tel: +44 (0) 208 154 4278<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<p><span style=3D"font-size:10pt">Disclaimer: This email and the attachment=
s within may be confidential and are intended solely for the use of the int=
ended recipient. If you are not the intended recipient of this email and it=
s attachments, you must take no action
 based upon them, nor must you copy or show them to anyone. Please contact =
the sender if you believe you have received this email in error. Any views =
or opinions expressed are solely those of the author and do not necessarily=
 represent Fosshost CIO. &nbsp;</span><br>
</p>
<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Cleber Rosa &lt;crosa=
@redhat.com&gt;<br>
<b>Sent:</b> 10 February 2021 15:15<br>
<b>To:</b> Stefan Hajnoczi &lt;stefanha@gmail.com&gt;<br>
<b>Cc:</b> Fosshost &lt;admin@fosshost.org&gt;; qemu-devel &lt;qemu-devel@n=
ongnu.org&gt;; Cleber Rosa &lt;cleber@redhat.com&gt;<br>
<b>Subject:</b> Re: QEMU hosting</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
----- Original Message -----<br>
&gt; From: &quot;Stefan Hajnoczi&quot; &lt;stefanha@gmail.com&gt;<br>
&gt; To: &quot;Fosshost&quot; &lt;admin@fosshost.org&gt;<br>
&gt; Cc: &quot;qemu-devel&quot; &lt;qemu-devel@nongnu.org&gt;, &quot;Cleber=
 Rosa&quot; &lt;cleber@redhat.com&gt;<br>
&gt; Sent: Wednesday, February 10, 2021 9:28:29 AM<br>
&gt; Subject: Re: QEMU hosting<br>
&gt; <br>
&gt; On Tue, Jan 5, 2021 at 6:55 PM Fosshost &lt;admin@fosshost.org&gt; wro=
te:<br>
&gt; <br>
&gt; &gt; If you would like to apply, you can do so at <a href=3D"https://f=
osshost.org/apply">
https://fosshost.org/apply</a><br>
&gt; &gt;<br>
<br>
Hi Stefan,<br>
<br>
I've made an application for one x86 virtual machine on behalf of the QEMU<=
br>
project.&nbsp; It's not clear to me if the VMs, in addition to being powere=
d by<br>
KVM according to the docs, if they offer (nested) KVM.<br>
<br>
That would be an improvement from what we get from the GitLab shared runner=
s.<br>
<br>
Thomas,<br>
<br>
Would you be able to tell if nested KVM is available for the x86 VMs?<br>
<br>
Thanks,<br>
- Cleber.<br>
<br>
&gt; &gt; Feel free to join our IRC channel on freenode #fosshost if you ha=
ve any<br>
&gt; &gt; questions regarding our work and service<br>
&gt; <br>
&gt; Hi Thomas,<br>
&gt; Thanks for the reply! I have forwarded the information to Cleber Rosa,=
<br>
&gt; who is working on QEMU's CI system.<br>
&gt; <br>
&gt; Stefan<br>
&gt; <br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_LO2P123MB26051C1C6C485711334D239FC88C9LO2P123MB2605GBRP_--

