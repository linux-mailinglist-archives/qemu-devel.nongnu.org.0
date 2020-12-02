Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B432CBFCC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:34:09 +0100 (CET)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTCq-0005iA-Bb
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erich.mcmillan@hp.com>)
 id 1kkTAo-0003xj-2P
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:32:02 -0500
Received: from us-smtp-delivery-162.mimecast.com ([63.128.21.162]:53866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <erich.mcmillan@hp.com>)
 id 1kkTAl-0004UD-N1
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com;
 s=mimecast20180716; t=1606919517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x5Qt3MAnYBNRwKfjsInZftiPXsP2OMtz+whx8l2yNac=;
 b=BgbqEYnTVJja59n/VT9vI9lTGCWmF739F0RvfbHiUQ8JqjWGe2bN8nWstIS4e4ZdYVfJQY
 XsVn0wywenBpdYNHxvDsGOFdX3KU6gl9sY7BSKTTdQyVg8nYvhEbND3EmBb6O1hNeE3bRJ
 EJEFgUAVbCAngvs+A9A6LS4CQ/zj5U8=
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-VLz5wApoOESrsBQ9awhtKQ-1; Wed, 02 Dec 2020 09:31:52 -0500
X-MC-Unique: VLz5wApoOESrsBQ9awhtKQ-1
Received: from CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7507::9) by CS1PR8401MB0886.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:750f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 2 Dec
 2020 14:31:50 +0000
Received: from CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::51cc:84ed:4698:5dca]) by CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::51cc:84ed:4698:5dca%7]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 14:31:50 +0000
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
Thread-Index: AQHWk2Vu5Zex3oyzg0aTR1075CA/CqnM3aqAgACDQ0WAFpsSgIAATO+L
Date: Wed, 2 Dec 2020 14:31:50 +0000
Message-ID: <CS1PR8401MB03270F0A0C876B2AAE28157AF3F30@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
References: <20200925175751.4017-1-erich.mcmillan@hp.com>
 <20201117115329-mutt-send-email-mst@kernel.org>
 <CS1PR8401MB03272F390100B1B88CCAC784F3E10@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>,
 <20201202045601-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201202045601-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [76.199.17.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a47423c-19ec-4579-06c5-08d896cf0200
x-ms-traffictypediagnostic: CS1PR8401MB0886:
x-microsoft-antispam-prvs: <CS1PR8401MB08869E3EB720448F89F13B2DF3F30@CS1PR8401MB0886.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:813
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 7bDbqkX5ylxYhOZttgdhG6AbzgfTXbX416tbHAxjz8ZTX2vRVBhQnbLGsGlp19wPcdemujSQekV1aqhzsHNHdNMuVdAj8LpaQZnq6KW0aXo3kaclwPoyIZOpi2zwnfj9qysult6pYsD57AhbHtbJaqYlIcWvEV0jG4HLODFyjC3NnY2UXHOITaSpyI83cMMB3kb77/BrfoFmGaJBl84uLLD/aBKRCYjbvb0oevP5u49JQN0hv9x3Aure6sNp/kuO1BYuDZwyaS1WFSifc7v4K/KeuKYlIHWcps33YqenMSbgxu0QYUALFm5y6QxJ6jcsTnxjN9gtaCFG1JnaH3Sd2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(396003)(136003)(366004)(52536014)(186003)(19627405001)(5660300002)(8676002)(26005)(86362001)(33656002)(7696005)(478600001)(66476007)(66556008)(64756008)(66446008)(55016002)(91956017)(9686003)(76116006)(6506007)(53546011)(66946007)(54906003)(4744005)(8936002)(71200400001)(4326008)(6916009)(316002)(2906002);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MSGkeCzrybiLm3RBzlsKIVv2iC5ESiZL4ZWMiuwgtYoFFwXXJSzFFZefyiD2?=
 =?us-ascii?Q?YhbYc5cKzatIsWblwI9TXOdGS8T9CG9qjIsC/aggI+e7CjQq4hLEm2BMobco?=
 =?us-ascii?Q?+ITdv3d/8kE74KOxzjszrsLN3P9KwIoJL8IdqYRZJ+ihPEmr1aUQtUs6wnTH?=
 =?us-ascii?Q?vt3sD3yj0mFnhAuqponeW0oKzYzc1IMEhPHTlOyg9Zid6eSwF0B89OKoB19a?=
 =?us-ascii?Q?vhMqMor1uV13eLXBfFACCdqJCIGtYVtGKUuCb+ZMHPCq2V9+8L+gSRHRdfYY?=
 =?us-ascii?Q?fxfM8PqKlToGd8t5bAiW/EaUEl7i14eG1t2i6zVeOt5wYzuqrVk2/ql1usDl?=
 =?us-ascii?Q?KHI5+4K/MopBO5U5isPy7dQWDglbjAYYXqdhxk71vgeJB8fKh/rG24Z1v2f4?=
 =?us-ascii?Q?pTDp67LwKRq/vkzzvJD5CCRnLk94bw7qPBxmwDuRTHN8+eS0wBlh6zE6QRy6?=
 =?us-ascii?Q?C7Xb2gZ4uI5MfWJHWe2M/kWSkeyV6KnIoPKvOl7WjRZPIOFJCpt9cC0KfFrk?=
 =?us-ascii?Q?GOvv0aBL7hY0ptZb+ZfLsJKmiCaRCVJ8XQEagLpm+SsNbUUUg5mFiChvR/V6?=
 =?us-ascii?Q?ayjVagdXgpfTLmHn1GnBS/008h+2mQWx5asvK/xokOkjXkR1iqN2dUukZpoc?=
 =?us-ascii?Q?GzS3gA23Lkacm6dZXTPJ+3zMWjkxMWOkU+izTODLyX0+WIgZqDcdW8DpuB/F?=
 =?us-ascii?Q?7sTuAJ+TSynlCMnUHfpXopPn3yNaub4eQrr7dkcnpnG8z2OWqQ9SKU34tR3+?=
 =?us-ascii?Q?nxwsdmYrHjSuUCz54MnFoCi39Xut1jqNZskiwJbJ7t1XmY+Vyn6LVSCah+EF?=
 =?us-ascii?Q?nlS9zFrq07hmmrERcDxmMcpWFPrrYzowLZlcQq8DTboMT/Xb5TqLGuoArJtQ?=
 =?us-ascii?Q?4uER/aY6fX3jJGBbTiXDtsndxcTMGPG8GZjUBRfjqYlCUBg7YrdcIjHwJFJ7?=
 =?us-ascii?Q?b7FWTDLz2t0QQHdIQMUiiErqDKKmMpmKnDh4J+5l5vk=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a47423c-19ec-4579-06c5-08d896cf0200
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 14:31:50.7918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D9tePdmJsPPyyXj/gsFnK1mXS1bz0pKEvySeJr0DHwskWZJfShUuopf6iVTspttyhHq1DJiKZsgLRTAU2gvbaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0886
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA62A171 smtp.mailfrom=erich.mcmillan@hp.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_CS1PR8401MB03270F0A0C876B2AAE28157AF3F30CS1PR8401MB0327_"
Received-SPF: pass client-ip=63.128.21.162; envelope-from=erich.mcmillan@hp.com;
 helo=us-smtp-delivery-162.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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

--_000_CS1PR8401MB03270F0A0C876B2AAE28157AF3F30CS1PR8401MB0327_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

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


--_000_CS1PR8401MB03270F0A0C876B2AAE28157AF3F30CS1PR8401MB0327_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span class=3D"smartReply">Sure, no problem.</span></div>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Michael S. Tsirkin &l=
t;mst@redhat.com&gt;<br>
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
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Could you help by rebasing this on master? Shouldn=
't be hard ...<br>
Thanks!<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CS1PR8401MB03270F0A0C876B2AAE28157AF3F30CS1PR8401MB0327_--


