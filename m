Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BFD5F3AEB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 03:10:15 +0200 (CEST)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofWRp-0007Fl-L0
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 21:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blue_3too@hotmail.com>)
 id 1ofSmT-0001En-T6
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 17:15:18 -0400
Received: from mail-bn7nam10olkn20819.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::819]:49984
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blue_3too@hotmail.com>)
 id 1ofSmR-0002EF-R0
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 17:15:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aURQ1FLyGpb5Kg05jLFoHQrix8TyB/uVPgCXbJ0VhnNzNYzbB9x+dl6QqCublv1XZN6Yu+oEaPIHCo598XYci8BP0r6YE/T1yeHr6e4RHaQJZPPLTbYg5HdqoLhHqeJXyUNsfF3rJq0fsY5lPo9rlTOzGgUv2VoHhsa6fH7lp06GAFOsb51ntTA6wv3s1894AWClVs4gaTnYe8fgG3XbVht2Oarl8FM9H9Xl3tNfWbl+VJD/82gFKjpFc5wW8AcPTfxI/l8Q3cBPTf7T9d68eKAsL+LHk0kNj9VtiKvgtZzgeb2L/2iLc+M5att/A5rejYNhqDCPByQM3BawcpSsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gvsDhVziSRinK/bRPoIwATwkfE7JnKAFzyZItyABJg=;
 b=X2WeACRUjLQXzkMrTKQjTuxx165oHYPpd1FreKbCspKp/YgmwRHWmO+Q+24OXQn3D6NtDF0rrY4q71SMln2yIoC5D4AsNrsv4FdOXNul+n1XjtiLpH5+iXCilZKlMhX+n5zjCPReX74TZHI0hzEY8H8jJITJBWT5LO/3ah/WcgIuhuLoEeuPIzBJg2uibUnWzPIvls4pu8qL80PmPwKglURzJO0hGw/gIESQStbqUsamyQmjIEkywt+xk6bxeiJPIxRNpV9vhHtkUfoPjlY8UMYsqgmWKLkOO3YMvCDODSLNTWyRljGb554MNW8AZKEfY3vc7IrrrGDYb9BwjVL0Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gvsDhVziSRinK/bRPoIwATwkfE7JnKAFzyZItyABJg=;
 b=RngNPlwG6vhB8haxrm7/NHg4EGQlKSkGtDXEW6TdN11PFMYw0uxjuCn+ysop4W6PTNBgZn+cwz30Dm4A9/g7WiqakHOrnxbCkcBh5C/aI8yITIDXMZKAHph7bEn0v1krYHav0G0fyeFn/aEhZ/x3sRRFf+sPOfMFWI/E6n1t/1gPjyJTv59t9xXKL2yzn0rMmJIblNx8xSrPyDL5SlMCs33yhwt8YclJyVVA2RxutYYIopWhuPPODL5RYWISt+2w/8at3wenG3G8Nci4u81M2jLCkVYkSTBSti7UM8bTEonvUbheLpZthzuCaVpWaQHezmS8SP761ekAZwYBd4H58g==
Received: from SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22)
 by PH7PR12MB6762.namprd12.prod.outlook.com (2603:10b6:510:1ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Mon, 3 Oct
 2022 21:10:11 +0000
Received: from SJ1PR12MB6290.namprd12.prod.outlook.com
 ([fe80::e9ff:a76f:2f26:fa75]) by SJ1PR12MB6290.namprd12.prod.outlook.com
 ([fe80::e9ff:a76f:2f26:fa75%6]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 21:10:11 +0000
From: a b <blue_3too@hotmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: A few QEMU questiosn
Thread-Topic: A few QEMU questiosn
Thread-Index: AQHY12p/vsJc5BbzP0O9/uPBNihaZg==
Date: Mon, 3 Oct 2022 21:10:11 +0000
Message-ID: <SJ1PR12MB6290BE35913F0FEACB426B4EC95B9@SJ1PR12MB6290.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [BWHg099plrE32Bw+pF/fgkyYnWQG1SpnkBEf6rf8HEw6NnnxDk/aDInq+E4XO2h/]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6290:EE_|PH7PR12MB6762:EE_
x-ms-office365-filtering-correlation-id: e048cee9-282a-4501-7f4b-08daa583a87a
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EBwhHHezGYJT1s6YdVKvlc+Dd44h9TKev3l3SRdxn30SEibCeSlo/rgtVauUa/qMDt4A9Cn9UMnCWTEu1RjTlpjhLPSMuvk7lV4h+lHyyK4CkXJUSE5U+ztCDJ7+eMC4FGXyoCoQIISHokL2aVJnM46jAXH9Y7UCHKJIycmpjnELHPLrzZ8VjvmgPSe8mcI2hWjYi9gGsC3xX8ndFWYVLGM7ywLRszQ3TemUmhkxVMpCeMQCtdIHipwT15lUEuAdAYiOAyleLHg8SXDRaRdADjvQHxYR9EMqdCBfLnE++NpbNIx/fNpyv21t90vnqIL4GOtU8frB9ICm4WhGAqVHmG5VSha0Z+SkL3w04jAfLmDZ86l/sggUi9QkPvzbdTp4eJ8UjMALLl9Mk6CQpDdY8x3Ejy2rYRN3nt2cyqua0WXa5+TPYyC9Lmxjuf8/h1k4sIBYy+OVUq5glfdORS+POhUzSbVM1hrzXO9wfDk30y6/cJwLLssCmdoWUYJM/i5JR2TUWFuJdFC79c++1PcEQH4rQhIVLcWSZxztGzeR1Fs+86c0k3JZpq317WNGR/K3xmXWBiRgxrxbssyfnmPlmKTA/EmXVSRrE9d7d0K3BU+gmDeh39zxzbav5pEKm8Kj
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7ZTC05it1fGpThaMi32g302co6mtuRGIGT0zMQAxU6DK+gRvC2dq/aeHgO?=
 =?iso-8859-1?Q?B9GWF9PpJ9C4nNMukkj7Jl/G4ZXrTQoOyXnpt8xW6OZuda/vWlyCiMtO0u?=
 =?iso-8859-1?Q?U6wZ1XzIQaOwYERDX4vE0bF9DnQKBeS4XyeQm54TY4fY5IxBPwBqsRvy61?=
 =?iso-8859-1?Q?0SRbWnuTiEcYTfV8xzLKhZMEOANyZGoZertAPEkK1Qp4bdIoaFmxw53vpf?=
 =?iso-8859-1?Q?SHXBDa0qgAURDv59zoHiKG8t4HzhT0tNpD9c+9BVq9xPcqb0ORI/EQvc7l?=
 =?iso-8859-1?Q?zdpVULRdI9LkhYIjANqyPOqvtpIBWZ2vEhE4YJnSR9MKHRUoEqoWHmjQ9B?=
 =?iso-8859-1?Q?a9CwIfZAKDW4/jruvFYtFAqm9GykI09JzokYUZZiqlM1TmnxQ4f/g7AU5A?=
 =?iso-8859-1?Q?yMipICY5XbaCdm79UvJ7sLp3lBzvlTX/YUabEBGlnPVz0fT2k0G9TlqCLM?=
 =?iso-8859-1?Q?Tbiz4xg4IsYkfhHSwUY9MARNyTqmuh5tRtd1reh193Zq4HEvoYt2RqWYxT?=
 =?iso-8859-1?Q?EIPcBZbqd/0xEfan/wBvKcvyPcDegE7p2ZufdO9ETScnEoO/9FC6cujR00?=
 =?iso-8859-1?Q?nPRQ3FeyYIct5J2lcxee4TzMMb4QtJedkKzpW13rmOA+4Yz6ueSAX3hvAx?=
 =?iso-8859-1?Q?Zo0FsrkiNFVYl0OUU/H+4jJlqZjw7udsn1n27TDk9MeHVMS0Z6xKvqfGgb?=
 =?iso-8859-1?Q?c5Zi29FoH2kTdkSUY8xr1YqaUz7RXCHhh/XJ+HwCg86V64Q+Ds8me3DtO3?=
 =?iso-8859-1?Q?9TdPWiu6PC9TdFDyYjNFfmW5+rcpMxLS9e//Fijb5QC3tZqD7Te9jvONUD?=
 =?iso-8859-1?Q?bRnaAN8kKgi+LQpCBFXSJjO50b1nxxeKHbFwvMWkyEd2IbJf3aQvGElqxd?=
 =?iso-8859-1?Q?U1n2+vYid9JhML9+c8988EWrneyYyUw39DjALIicr02spB4J9Bn5ev/CVB?=
 =?iso-8859-1?Q?dA4mT/GypvQrMyuLBphGMRTJ62ZbDkFuee3Mype+dr7egsl1QlNMPX+W4S?=
 =?iso-8859-1?Q?w57QzgmJ24oGvIbDi4GWZOubH7BYcyRUBZNjfXbRBxOH9rvJKule1Qzj8Z?=
 =?iso-8859-1?Q?xOWKMUgJ68zanrQ9VEdPBVCJrp7Y8kIGEIlOmOHhKMcKHeR7RAxNa1ayLb?=
 =?iso-8859-1?Q?RcuAV1qRQcS3mf/+98+BaOqu6CzWQTukJWUqM3pFVaFAGny3QmWnJbnxIs?=
 =?iso-8859-1?Q?bAhWvbMONt/dUObftcIyLT3pO4TP2x8FSUFKX2DylKJrPBBQaAZtQM7y5w?=
 =?iso-8859-1?Q?ENb8aZwBnm/8hYWjEGN/4v+C8xLvZrX/N4DATSaRSVENnXOejM1jFgFA/S?=
 =?iso-8859-1?Q?wLbsTQXlmNdvR1XuYAMfAdoW/1FJ+OkCLf9zSeLgTekSg72ncl82M5HEcg?=
 =?iso-8859-1?Q?K/Lvww3JpW?=
Content-Type: multipart/alternative;
 boundary="_000_SJ1PR12MB6290BE35913F0FEACB426B4EC95B9SJ1PR12MB6290namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-71ea3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e048cee9-282a-4501-7f4b-08daa583a87a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 21:10:11.2089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6762
Received-SPF: pass client-ip=2a01:111:f400:7e8a::819;
 envelope-from=blue_3too@hotmail.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 Oct 2022 21:07:23 -0400
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

--_000_SJ1PR12MB6290BE35913F0FEACB426B4EC95B9SJ1PR12MB6290namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello, there,

I have a few newbie QEMU questions.  I found that mmu_idx in aarch64-softmm=
u  falls in 8, 10 and 12.

I need some help to understand what they are for.

I cannot find which macros are for mmu-idx 8, 10 and 12 at target/arm/cpu.h=
<https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtarget/arm/cpu.h;h=3D89d49=
cdcb21b6c57de391851d64a523f07bde664;hb=3DHEAD#l2178>. It looks like all the=
 values from ARMMMUIdx<https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtarg=
et/arm/cpu.h;h=3D89d49cdcb21b6c57de391851d64a523f07bde664;hb=3DHEAD#l2262> =
are greater than 0x10 (ARM_MMU_IDX_A). Am I looking at the wrong place or m=
issing something for the different MMU modes in aarch64?

I'd appreciate your help.

Regards


--_000_SJ1PR12MB6290BE35913F0FEACB426B4EC95B9SJ1PR12MB6290namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Hello, there,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
I have a few newbie QEMU questions.&nbsp; I found that mmu_idx in aarch64-s=
oftmmu&nbsp; falls in 8, 10 and 12.&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
I need some help to understand what they are for.&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
I cannot find which macros are for mmu-idx 8, 10 and 12 at <a href=3D"https=
://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtarget/arm/cpu.h;h=3D89d49cdcb21=
b6c57de391851d64a523f07bde664;hb=3DHEAD#l2178" title=3D"https://git.qemu.or=
g/?p=3Dqemu.git;a=3Dblob;f=3Dtarget/arm/cpu.h;h=3D89d49cdcb21b6c57de391851d=
64a523f07bde664;hb=3DHEAD#l2178">
target/arm/cpu.h</a>. It looks like all the values from&nbsp;<a href=3D"htt=
ps://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dtarget/arm/cpu.h;h=3D89d49cdcb=
21b6c57de391851d64a523f07bde664;hb=3DHEAD#l2262" title=3D"https://git.qemu.=
org/?p=3Dqemu.git;a=3Dblob;f=3Dtarget/arm/cpu.h;h=3D89d49cdcb21b6c57de39185=
1d64a523f07bde664;hb=3DHEAD#l2262">ARMMMUIdx</a>&nbsp;are
 greater than 0x10 (<span style=3D"font-family:monospace;font-size:12px;bac=
kground-color:rgb(255, 255, 255);display:inline !important" class=3D"Conten=
tPasted1">ARM_MMU_IDX_A</span>). Am I looking at the wrong place or missing=
 something for the different MMU modes
 in aarch64?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
I'd appreciate your help.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Regards</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
&nbsp;</div>
</body>
</html>

--_000_SJ1PR12MB6290BE35913F0FEACB426B4EC95B9SJ1PR12MB6290namp_--

