Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756772D2EED
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:00:24 +0100 (CET)
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfPb-0007ti-8V
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erich.mcmillan@hp.com>)
 id 1kmfMw-0006PT-7B
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:57:38 -0500
Received: from us-smtp-delivery-162.mimecast.com ([63.128.21.162]:48520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <erich.mcmillan@hp.com>)
 id 1kmfMt-0006Hp-Ch
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com;
 s=mimecast20180716; t=1607443054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FacxQLKnS6SaUMJ+99kvrDpjK5509+D9jy42X1IiaB8=;
 b=AODLpQpgq3G4HeICr1R03/nbmWQOYHvmbHNFF2BruHPLPfhr9K16kdv7A7EpeD3/6EkIYv
 cC6E4gxaOGYlZ/dh7uUTVRBa7uPqYw5ub7y/Q5RtC9oJxTjRQXPniALGFJQ3ZZVRNwBE62
 LOdMIxmTKvCJeq+aC49V4Xmm4Qc6Q1s=
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-9UrPD4dgOMCDmQuWHq8r8Q-1; Tue, 08 Dec 2020 10:57:26 -0500
X-MC-Unique: 9UrPD4dgOMCDmQuWHq8r8Q-1
Received: from CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7507::9) by CS1PR8401MB0488.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7507::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 15:57:24 +0000
Received: from CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::8be:6658:227e:aad7]) by CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::8be:6658:227e:aad7%7]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 15:57:24 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "lersek@redhat.com"
 <lersek@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>
Subject: Re: [PATCH v6] hw/i386/pc: add max combined fw size as machine
 configuration option
Thread-Topic: [PATCH v6] hw/i386/pc: add max combined fw size as machine
 configuration option
Thread-Index: AQHWk2Vu5Zex3oyzg0aTR1075CA/CqnM3aqAgACDQ0WAFpsSgIAATO+LgAmFEcE=
Date: Tue, 8 Dec 2020 15:57:24 +0000
Message-ID: <CS1PR8401MB03276155EC00461E2B430450F3CD0@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
References: <20200925175751.4017-1-erich.mcmillan@hp.com>
 <20201117115329-mutt-send-email-mst@kernel.org>
 <CS1PR8401MB03272F390100B1B88CCAC784F3E10@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>,
 <20201202045601-mutt-send-email-mst@kernel.org>,
 <CS1PR8401MB03270F0A0C876B2AAE28157AF3F30@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <CS1PR8401MB03270F0A0C876B2AAE28157AF3F30@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [76.199.17.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02dc007f-a952-47e1-353d-08d89b91f486
x-ms-traffictypediagnostic: CS1PR8401MB0488:
x-microsoft-antispam-prvs: <CS1PR8401MB0488C938CF3D9E1AA2B78A6BF3CD0@CS1PR8401MB0488.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2733
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: fAyrPOMPr74wZIYuKOVmpNWb1gkAILymTezhU2mg618g5CFCIfL0IkO6wrJMxeudkBYSFm3X9aR3ZcbteGDwBbe2nLAFqo9Jxmb2xDYOsHwfxgIvcveAX7K4PyTGh6YOrJpCZJScxE1rOvHFb18T+HT3fnhgG1nIVFgQ2+ATeherPBI8W4MqkeRPBAnuD9e09q2Wo4zV0fUzJwbZ3RslcM750Keh0OoPVZvKch9iTTz3SEnyBUgWmfFiM7eHF2mmDlNdZt4S91zwQ+h6MADOo9h1OEBu7oWvxkDpYLIwRwf0Gs4nZTnLcFENoWhUUJm9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(136003)(366004)(376002)(6916009)(26005)(6506007)(52536014)(54906003)(76116006)(508600001)(53546011)(9686003)(55016002)(66946007)(71200400001)(66476007)(66446008)(86362001)(7696005)(4326008)(66556008)(8936002)(64756008)(5660300002)(186003)(33656002)(8676002)(2906002)(91956017)(19627405001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?IwVaubTpPowtmeKkzl5/GwT+Ya/sOztd+Hs8xWVddzu88B1aL439k4LIWjMY?=
 =?us-ascii?Q?y5r/Nfgw0a6Hd/t4chOqhy4R2AnwFM3PcrRH+YwTvGWXPZqamflvUeaDyAu1?=
 =?us-ascii?Q?60cvQ7pvJufWFaH2YT/hJJ4sF/6F3H026YlcVZmZx8cMcYuXNKF7C5eW4Jgl?=
 =?us-ascii?Q?+Eo1MfPNHdS72HJ4p2yZmqHVq8GvSeiL9yZPurhhulqwB9KOvSHA5bjjU98g?=
 =?us-ascii?Q?/gJHO+IAz60WzjkKk8LmZZRQkkYV9DeKTf5dDyp3mENdBvlz1jGTKYi87yss?=
 =?us-ascii?Q?y+WxSpeZ6clAZJNnFXUNEUYvFr8qzTTHoPAb/+qFxB4LCC9szcMeF4UN+CAF?=
 =?us-ascii?Q?HMrYvgeMzLmyYWgArpbIS+/0qs1H/4p6NLbY7ohlz/o0rN0ARyr8i7coNd8r?=
 =?us-ascii?Q?5ndfNW9/zpkytpfrbLLApDIgW2JZJANZTy5p4dlpYlWV+TthNdzGQ+gjfONo?=
 =?us-ascii?Q?knqt7y3EY/PV9Z10FX3C6jDygaZq8d2X7nnZg8jsfoyTAsyH29Fuo0CTDGwS?=
 =?us-ascii?Q?tMQ0F7IO3+Iyk5uCia6+8NdasdKPjRRCnnY2Xx1rucO9+YYWEvW/cyFS3hmO?=
 =?us-ascii?Q?YQ0jQ2FXm1gf3KsVSJT1dwGJZcYsRkuzHmS2K/SfucRoTR7UdpPWLmNbCJQD?=
 =?us-ascii?Q?A3jnshf9lZGECbRJ6YrUPpruz8h9svvv9DdImyJhWR+RwV2cWJmRsgXTfnS5?=
 =?us-ascii?Q?BD8qTcq6k68QDtY/rE5ID4s7CJ5Ac5R16Tcrttsq+jSS93XOCq5Le25MZUW5?=
 =?us-ascii?Q?aj4pi0k09AWju8tYoNnyVtFBkAei0v5jHy98Q8mSwX8lOmpRxGh/efCVV/dy?=
 =?us-ascii?Q?9HfTBwrrhu4kn+YddvkhwczU1kX9mJBAvQeNROyhoE788PY5GA/+X3AM3VWb?=
 =?us-ascii?Q?1/WTNRL3xnPdhn3bb2pLDcFnIWj3HTQ1fIYVC6eccIOycm924iJrvzTvu5cU?=
 =?us-ascii?Q?b/y+Fvi9NTGOtYFXQU2DB6AOhtdGNLD8Uhxe/CNtsyo=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dc007f-a952-47e1-353d-08d89b91f486
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 15:57:24.6495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDma9viV9iUX9g5r16o9g+8QzW2ERshI177AqEwcrk4y9Aj2EfSkhscnVBOcvuOc7p3F1beR8J8JEK59IfPuKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0488
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA62A171 smtp.mailfrom=erich.mcmillan@hp.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_CS1PR8401MB03276155EC00461E2B430450F3CD0CS1PR8401MB0327_"
Received-SPF: pass client-ip=63.128.21.162; envelope-from=erich.mcmillan@hp.com;
 helo=us-smtp-delivery-162.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to: "McMillan, Erich" <erich.mcmillan@hp.com>
From: "McMillan, Erich" via <qemu-devel@nongnu.org>

--_000_CS1PR8401MB03276155EC00461E2B430450F3CD0CS1PR8401MB0327_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Apologies for the delay, I just sent out a rebased patch. Based on latest t=
ags looks like release may already have been started?

-Erich
________________________________
From: McMillan, Erich <erich.mcmillan@hp.com>
Sent: Wednesday, December 2, 2020 8:31 AM
To: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; lersek@redhat.com <lerse=
k@redhat.com>; dgilbert@redhat.com <dgilbert@redhat.com>; marcel.apfelbaum@=
gmail.com <marcel.apfelbaum@gmail.com>; imammedo@redhat.com <imammedo@redha=
t.com>; kraxel@redhat.com <kraxel@redhat.com>
Subject: Re: [PATCH v6] hw/i386/pc: add max combined fw size as machine con=
figuration option

Sure, no problem.

________________________________
From: Michael S. Tsirkin <mst@redhat.com>
Sent: Wednesday, December 2, 2020 3:56 AM
To: McMillan, Erich <erich.mcmillan@hp.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; lersek@redhat.com <lerse=
k@redhat.com>; dgilbert@redhat.com <dgilbert@redhat.com>; marcel.apfelbaum@=
gmail.com <marcel.apfelbaum@gmail.com>; imammedo@redhat.com <imammedo@redha=
t.com>; kraxel@redhat.com <kraxel@redhat.com>
Subject: Re: [PATCH v6] hw/i386/pc: add max combined fw size as machine con=
figuration option

Could you help by rebasing this on master? Shouldn't be hard ...
Thanks!


--_000_CS1PR8401MB03276155EC00461E2B430450F3CD0CS1PR8401MB0327_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi Michael,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Apologies for the delay, I just sent out a rebased patch. Based on latest t=
ags looks like release may already have been started?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
-Erich<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> McMillan, Erich &lt;e=
rich.mcmillan@hp.com&gt;<br>
<b>Sent:</b> Wednesday, December 2, 2020 8:31 AM<br>
<b>To:</b> Michael S. Tsirkin &lt;mst@redhat.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; lersek@redh=
at.com &lt;lersek@redhat.com&gt;; dgilbert@redhat.com &lt;dgilbert@redhat.c=
om&gt;; marcel.apfelbaum@gmail.com &lt;marcel.apfelbaum@gmail.com&gt;; imam=
medo@redhat.com &lt;imammedo@redhat.com&gt;; kraxel@redhat.com
 &lt;kraxel@redhat.com&gt;<br>
<b>Subject:</b> Re: [PATCH v6] hw/i386/pc: add max combined fw size as mach=
ine configuration option</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
=09{margin-top:0;
=09margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0); background-color:rgb(255,255,255)">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span class=3D"x_smartReply">Sure, no problem.</span></div>
<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Michael S. Tsirkin =
&lt;mst@redhat.com&gt;<br>
<b>Sent:</b> Wednesday, December 2, 2020 3:56 AM<br>
<b>To:</b> McMillan, Erich &lt;erich.mcmillan@hp.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; lersek@redh=
at.com &lt;lersek@redhat.com&gt;; dgilbert@redhat.com &lt;dgilbert@redhat.c=
om&gt;; marcel.apfelbaum@gmail.com &lt;marcel.apfelbaum@gmail.com&gt;; imam=
medo@redhat.com &lt;imammedo@redhat.com&gt;; kraxel@redhat.com
 &lt;kraxel@redhat.com&gt;<br>
<b>Subject:</b> Re: [PATCH v6] hw/i386/pc: add max combined fw size as mach=
ine configuration option</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Could you help by rebasing this on master? Shoul=
dn't be hard ...<br>
Thanks!<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CS1PR8401MB03276155EC00461E2B430450F3CD0CS1PR8401MB0327_--


