Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF12EB35C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 20:12:10 +0100 (CET)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwrkX-0000OL-FK
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 14:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <admin@fosshost.org>)
 id 1kwrjM-0008M9-0b
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:10:56 -0500
Received: from mail-eopbgr110073.outbound.protection.outlook.com
 ([40.107.11.73]:51045 helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <admin@fosshost.org>)
 id 1kwrj9-0003Fz-IV
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:10:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3t2tOgbbSeAMW0CmFbK3MkjvGlzF4dEkwDMpiRBDdp/JElrAHpo00qjce4kwfTROCd8sECmycOjwfURHkfj4moowkrbN4RchQQLl6hxAF/yFUvE0CJIhWOFvW14Xwjd4ut2Pq+vE2Kk4bJpAtmunVtNvl8QBfIrNTeigNit44zg2qMnmpNsIOAzFp3DdkFbeQXI2EaSgK1kBI+dMiZ7XOD9JcXOlhNAq9NZVXtgKi6XuD0I1b8v2aq7g6i74NY3VbXUq2WnoztjcBHdq5UWFzvlHF66CvBIevsAeoxZTqHHQKYmqvSzQznkUwRjk6qeJ/HLNYvMg4rMQvQMiBV3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWDxH7megDpiY8lP4ECtMMmhkTR94BJ4d8xUx7wWJGw=;
 b=meLEEtgRRQxzhEAnYJzEEZzgrHepSkKsO33/2MV8FZ4RdmCwxHdhHjJ+v8G+QGGCdB+LrPwok37jr/RFN7pSKrGr4UHfZ+vokF/Mo/0DleVPBrDCxQV8EfM/EAj0OOIAbi6Eyf+CI45vF2Cdm6SrVdgsvoefxKu0/iYjKNac1gYzrpa8pOc/vdRWlDSNUGyvwyMmWsWphHK5R93BvqfZ7NAteHQjFmD2aPyvTxiutcCuoqKf4ELZVBMJM/ICVzb1IrDP/JCcmRs/Sr5yWEoCOmF5EqpVizffCCKRHJvDg4Xh2WgTt+fb/1XTdMoa3e6JuooEaH5Cfzrf9kTJPZWaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fosshost.org; dmarc=pass action=none header.from=fosshost.org;
 dkim=pass header.d=fosshost.org; arc=none
Received: from LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:c2::10)
 by LO3P123MB3177.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Tue, 5 Jan
 2021 18:55:38 +0000
Received: from LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM
 ([fe80::5121:a2d7:cd28:d11f]) by LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM
 ([fe80::5121:a2d7:cd28:d11f%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 18:55:38 +0000
From: Fosshost <admin@fosshost.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: QEMU hosting
Thread-Topic: QEMU hosting
Thread-Index: AQHW424jqgpOevQOwkK3Y6N1ZcH1wqoZYUOD
Date: Tue, 5 Jan 2021 18:55:37 +0000
Message-ID: <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
References: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
In-Reply-To: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fosshost.org;
x-originating-ip: [2001:470:1f09:3f:f83e:1734:a902:c969]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0e3ddb4-0be8-454f-8c46-08d8b1ab7dc8
x-ms-traffictypediagnostic: LO3P123MB3177:
x-microsoft-antispam-prvs: <LO3P123MB3177E3775810E4AE6E1A2BDBC8D10@LO3P123MB3177.GBRP123.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l6SUuW2koWDU3O5TYAwzRGgrvYKTSSekBvuMsgTsM0TE+iVn+JqegeSfZpf9Qd3BB4oSP92m1PKQB1HmBTf2YO8Sh8fIKjr9Ojf2Lt3wtFtKeqigxm1g70Ue8d6QWv32+b6J9e2aApaYem5VGuZ+JfEW4oem5bkVS4ebDBCrkLaBJDXC1MwsknFSjmJF5+XQTkTNUCTm0GaVHSiGBDdg5o+k+4Wf2e15T1KYDrRIGtiTkpOJYWPLgdlwiiJmpXxlmZrbv7OlQPNGuZ6bbKssLiPZM/OyfSuXR8h5k40Xtnnz6z8qmB7+P8usrBI99zgX5/RS+ks84EWXU7NeIEqhzQqAQupGcEy1CRqKzxjNwQI2BQSJzKLKGgLrin18LAL3pGAajc7MhRJ8vUPQN72A5bc6GgzsvLfO4fFKHhZWhXAxjlf2H+yKVL02TkCSP322tt9XLTjvz8yIWLNie3ioKsqY0shsJtsMJCdLqQZKmgScS95a2yznTd2aSeyn/N56JG12XzWs087Teb4b5xtoMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(39830400003)(396003)(346002)(34096005)(66556008)(66946007)(64756008)(66476007)(6916009)(76116006)(4326008)(38610400001)(8676002)(53546011)(9686003)(71200400001)(498600001)(586005)(6506007)(66446008)(186003)(7116003)(966005)(19627405001)(5660300002)(52536014)(2906002)(83380400001)(166002)(86362001)(8936002)(7696005)(33656002)(3480700007)(55016002)(11634003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2ET3DtFsubYF8yFHHf3c9L28FMs3sLalqfnXf3s95tjuORJpp7abXGSxlIDY?=
 =?us-ascii?Q?L1iQxnxKMXt2xP6KPk1fGCiEdyy27xrHtvQX7FifATbixRWurpN/KtOiE9TC?=
 =?us-ascii?Q?rr3IK8rdbHxgQGot0Z51KTN9xKVF96QGCPEkhuv2jH3qXSbGEarg0WUuZKSx?=
 =?us-ascii?Q?/GauwBnm+zDZkOQmd/DA9jCSnfIbGaH+UqpSapbp9mx7RiMwil5A/SFRoAiN?=
 =?us-ascii?Q?oC5TZ1vAXu6GOQRvDJU/+bOBCYl/tWQWFsqdIluBk3KnTOB9dMlSKnN8YtfW?=
 =?us-ascii?Q?wkwLR2D4JgN6D9otN5dnSuvnLG/C8cK4VLvAgr9O/XHjw34YLeQqTV3p79Rs?=
 =?us-ascii?Q?tWwurO0xrKCoLXSN8a2yQsAOsK02mSqIKBcF+ItYL3DKgwowhyMhfiyNe0iG?=
 =?us-ascii?Q?a80zDx7e7SgJELdHxZ49g2YF9ZKtrUjTyZn5K8OvWPe01UI4G9NJouD92m52?=
 =?us-ascii?Q?+n6fUm4LTJ8DRNzNoTVPvg6swwUoWZMvB9kNUlIG467kjOtHn57Ekj3ALkwm?=
 =?us-ascii?Q?Ciq76HLrIYUVVtfZLPNEHPfrA6fp/923iv8FCYSRh2KchZw7jlKedmNqLKCd?=
 =?us-ascii?Q?dQDYhMPTAbL7tWP6F8c7F01DPN+h58G23YycW1akuNpqv8ND9CE4FViMXP1i?=
 =?us-ascii?Q?/TBToq4I8iEfphQn+XYOdGvOt74kwjB7HwoVlLwONui8DZMU8gzw+sHk+E6f?=
 =?us-ascii?Q?EfTj7qNZur6eeQXsrNrp5xD9yOVi6dHVMg9a6Xi11YBKRV0IlO1YHID0LPCI?=
 =?us-ascii?Q?rk3GOeK9rEV1zzr8lE/OJqlicjqs252z/NE7Wee8Y+Q6uhzkXIgKT5TRUqbA?=
 =?us-ascii?Q?sN3S9c2NzC37INjpq6wz0/EojQete+Hmgg9muPDmvbIQcJw5RWtpdnlZS/Fw?=
 =?us-ascii?Q?nDVoK/CRD1XRp4cjgcIrEXceWF9Ug10yD6tA2FuYdFdOWROJyIiYhqtieki7?=
 =?us-ascii?Q?KQle4Z2bSgmwaENtEVHvV6cOZJcRYUeELSu0PJVEFH2pkaBmOvahXtvjiMPI?=
 =?us-ascii?Q?iMMpi8P+1n1CoixJQEcLu4opgO6YwLzlsfwXZy6SDanVKVY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_LO2P123MB2605DA330913C7D2DA311EF1C8D10LO2P123MB2605GBRP_"
MIME-Version: 1.0
X-OriginatorOrg: fosshost.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e3ddb4-0be8-454f-8c46-08d8b1ab7dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 18:55:37.9944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f05e4df-9801-4bb7-80d6-e7c58e957903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7nQ93w9+rdZ4oYe7dU8J8bf/5S354pViUXHzZpfZJx39yvGph2zu7ezBRy3eqmqeNOJepZSkALcY5ceGvwQYrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3177
Received-SPF: pass client-ip=40.107.11.73; envelope-from=admin@fosshost.org;
 helo=GBR01-CWL-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_LO2P123MB2605DA330913C7D2DA311EF1C8D10LO2P123MB2605GBRP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Stefan

Thank you for your email.


  1.  We do not offer MacOS hosting
  2.  We can provide virtual machines with full KVM virt on x86 architectur=
e and soon arm64 v8
  3.  We do not provide dedicated servers.

If you would like to apply, you can do so at https://fosshost.org/apply

Feel free to join our IRC channel on freenode #fosshost if you have any que=
stions regarding our work and service

Kind regards,
Thomas
Fosshost


________________________________
From: Stefan Hajnoczi <stefanha@gmail.com>
Sent: 05 January 2021 14:21
To: Fosshost <admin@fosshost.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: QEMU hosting

Hi Thomas,
In November you emailed qemu-devel asking if the QEMU project was
interested in exploring hosting with Fosshost.org. I think my reply
may have gotten lost so I wanted to check if you have time to discuss
this again.

The main hosting need that QEMU has is for continuous integration
system runners. We are particularly interested in non-x86/non-Linux
build machines and a dedicated server for reproducible performance
tests. Just today there was discussion on #qemu IRC about how to go
about adding a macOS build machine, for example.

It would be great to find out more about Fosshost.org and whether we
can work together.

Thanks,
Stefan

--_000_LO2P123MB2605DA330913C7D2DA311EF1C8D10LO2P123MB2605GBRP_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Stefan</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you for your email.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ol>
<li>We do not offer MacOS hosting</li><li>We can provide virtual machines w=
ith full KVM virt on x86 architecture and soon arm64 v8</li><li>We do not p=
rovide dedicated servers.</li></ol>
<div>If you would like to apply, you can do so at <a href=3D"https://fossho=
st.org/apply" id=3D"LPlnk">
https://fosshost.org/apply</a></div>
<div><br>
</div>
<div>Feel free to join our IRC channel on freenode #fosshost if you have an=
y questions regarding our work and service</div>
<div><br>
</div>
<div>Kind regards, <br>
</div>
<div>Thomas</div>
<div>Fosshost</div>
<div><br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Stefan Hajnoczi &lt;s=
tefanha@gmail.com&gt;<br>
<b>Sent:</b> 05 January 2021 14:21<br>
<b>To:</b> Fosshost &lt;admin@fosshost.org&gt;<br>
<b>Cc:</b> qemu-devel &lt;qemu-devel@nongnu.org&gt;<br>
<b>Subject:</b> QEMU hosting</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Thomas,<br>
In November you emailed qemu-devel asking if the QEMU project was<br>
interested in exploring hosting with Fosshost.org. I think my reply<br>
may have gotten lost so I wanted to check if you have time to discuss<br>
this again.<br>
<br>
The main hosting need that QEMU has is for continuous integration<br>
system runners. We are particularly interested in non-x86/non-Linux<br>
build machines and a dedicated server for reproducible performance<br>
tests. Just today there was discussion on #qemu IRC about how to go<br>
about adding a macOS build machine, for example.<br>
<br>
It would be great to find out more about Fosshost.org and whether we<br>
can work together.<br>
<br>
Thanks,<br>
Stefan<br>
</div>
</span></font></div>
</body>
</html>

--_000_LO2P123MB2605DA330913C7D2DA311EF1C8D10LO2P123MB2605GBRP_--

