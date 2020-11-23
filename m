Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FBD2C11F6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 18:31:10 +0100 (CET)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khFgC-0006O0-Te
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 12:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cristian.ancuta@intel.com>)
 id 1khFeZ-0005Vk-OV
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:29:27 -0500
Received: from mga02.intel.com ([134.134.136.20]:59326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cristian.ancuta@intel.com>)
 id 1khFeW-00004x-Qq
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:29:27 -0500
IronPort-SDR: nN2d2xgvLXczz1BXAfIshyx77TpRSps2BRkdY345lXykyhNWflGffCwHZ+vZiMJm4liINAXySm
 gxm1xPbhrTAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="158849646"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
 d="scan'208,217";a="158849646"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 09:29:16 -0800
IronPort-SDR: cAi1vWlTEZ6PtQ5DGmGFfLcB2669A14AOnUKmycLr3fSahLIlOAvouZOxfEGvp9r2mVE5RvA6E
 rSQE47SAD1jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
 d="scan'208,217";a="312960856"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2020 09:29:16 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Nov 2020 09:29:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Nov 2020 09:29:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 23 Nov 2020 09:29:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz3cz8GePorBkkQb2iMc+DZZ7clXXYCrtSy3GisB5URWuQGHqDTR4kuZ5kvFzH96w0xZeRy7XNbXMYVYqF7ZkGJ8/+KwjPLlSqa9pnye1QAtXTDU3aRd2XH3lyhufWk0I4xS5gFAy5MHDGE0EhyTT0OviQm2fS+ZR/Rl59/LIRZ0lodswuKABju6enDkihrXkXMx28wjSkhwbudZ/UGwjIDjG8rwOlB8rgUcPTb2gceeN2nQqHoypaHLNwJzal8s6OPvjpWs3gILFPejXnd++IUzW8sNNtoRDQvkx3PdOl0AEdhwcMPhCXgz6WzTkjC/z3wKSH9pt/q7B8raCXtcwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI7v13bEAkGMpP776hTUrDUh1EFqWwakKMC4e582uJI=;
 b=hboln6AztMMSvoCZ+txMo0mwcUjEmviAHRmWrE/p4aoHtZfsyCJAfeiaRmRCh9X40tcq6j0ZfmXHJwndfEMRz7oEpRP863b/Pw5sCoQiLtngs2dBaN0g3fc7XF9YhMifkLS9FHSN/1Rbyp2epPjP0RPRpW/yfB8fyzGkfJvDm+k111ZVOcBAEQqzO3SmeCq5ncPs8Kk48Ofe7CCgYzijz4obDKnBDpHqBNQmjM8qN9A1vwTM+wb45w7HTAVY4ZkCYBY6AeS9gokeMk9Fwj4qNVYESDKzX1gM1eEzYYQuoUtDnherIfSFAv+I135n4jH2g2A185GLH706+8v8tKGWwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI7v13bEAkGMpP776hTUrDUh1EFqWwakKMC4e582uJI=;
 b=JvE5gEqSrxZOQfhiJeGOREJXe1hQ1EP8dUmOyK5hKNu2fIvrH8/7NpDKgAobGOrOPQVAiKEYlxWSTyO/jsPCvibNZOWvt2HA+x0h5q1U3AEiW4pnqfoxBJv0Jj8JOe5RqfeQmF/yf42zDJ4kd96AlUYO4mbhBGHf2fOl1tIkqa4=
Received: from DM6PR11MB3963.namprd11.prod.outlook.com (2603:10b6:5:19b::16)
 by DM6PR11MB3673.namprd11.prod.outlook.com (2603:10b6:5:145::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Mon, 23 Nov
 2020 17:29:14 +0000
Received: from DM6PR11MB3963.namprd11.prod.outlook.com
 ([fe80::7561:baba:68f0:74fe]) by DM6PR11MB3963.namprd11.prod.outlook.com
 ([fe80::7561:baba:68f0:74fe%7]) with mapi id 15.20.3589.025; Mon, 23 Nov 2020
 17:29:14 +0000
From: "Ancuta, Cristian" <cristian.ancuta@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: QEMU build dependencies for new board
Thread-Topic: QEMU build dependencies for new board
Thread-Index: AdbBtL1I0SVUWHapTDmy3nFFMPEtqw==
Date: Mon, 23 Nov 2020 17:29:14 +0000
Message-ID: <DM6PR11MB3963BA87438B343A71230675F4FC0@DM6PR11MB3963.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [94.52.169.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9a8e5ed-4d6b-47dc-1200-08d88fd54c60
x-ms-traffictypediagnostic: DM6PR11MB3673:
x-microsoft-antispam-prvs: <DM6PR11MB3673D879872ED5C571010BA7F4FC0@DM6PR11MB3673.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bi4AUKicORFMPUdGGuAKuhp11vFm+rsepwD9cz4uV20CJgurbG4pHEsGD0RKNJyPwttCfYKeD2VKk17WdVCrs32seqdht5AqSLuSdC9043uUZZUnX+V6mXTbR5P1omHNj0Mpd1HcA/DGXX6dqac+oe6eTHCjG8/s8pw3ZbA67lNkkkkG9E6StjK15zFIMkaQTLwC3p9U0MNVX+HygsmwI9HaNBCpfxKtCg9wWgkLJu8TE0snC7mYqjNras2pS+Px8Tkwxs2zM3CegiaKdDXEM9vVoG0GI5vqXrGdqjv34ZHMwxM8p62X22GjJ546jYs2Ri1dghdb6N1kboyPkKr//Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3963.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(9686003)(66946007)(76116006)(86362001)(52536014)(66476007)(66556008)(64756008)(66446008)(71200400001)(5660300002)(316002)(6916009)(26005)(186003)(478600001)(7696005)(8676002)(6506007)(2906002)(8936002)(33656002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8pNn7niHVe9e4V0pYOgX5F2z1FWlJIxMDB9qCOb3PKy5VU4MVXzkJOjWJ4x5dUR+s2QP7PdpGWuIovUpfWF0jkYnG+DzvY3B/mgzA163DKCE8Q7H+1S8mxOCBEQhrM2H8ioyFG3JTyxYz/fDw8Zgbh43r4BYbnPdhBHNzaJ1WU8u6z6C+BhafyY5sZWxrP4k4pvhomkQXA64+DIwKgdrUv1CEsQmF6mIB+EIddjcF8Qbdt9MFleuDYyLDaZ6tsDitgedLJvqQBo/k5aCORiYAuo1taTrE4JX5du18iv21TKM0Y1N63oly4VvFfgR4u+cRjWtKyixmRn+DSoQHYQd7I/8CuVMSfRqNXZRzMJq5n31Cbya+5v07ftkviePaDv0NlEjQ309hJoE8RnNAGnNFe9+pIVeVAsnstqbNNRBmZaxIhQovVHdLmTeYVm+VtwgcAfE+jtUzbqSjTK7wX380oxQBu+qvyHBuz3bgRXXNOEVnPULYIjvEM34tuchGL69j+LMQpsc4HeOr5euSgsS8/92Vv7lWDolI8cz1h1s/Mu1HBxgl7YJqUGssWWWCi09UPxbD2V/1+NmSl6viFulTjBV4wPcA/LwTQiusPRqRTfdheHH3jFHxX9SdQ6VhPGAs6sL3m1QrKj6qKaLH79EJmY9LmK8zDi9CDTSKXi0xtxK2756tflEhbcxOxU2GajXOZ9KUybpiwuAPYTS8Ethe4ES74QZhCluZ7qNZuK3NSZPW4emmGfZmGUfzWWQhKw7toYdQfTSuOd0qnxh6JbW6OjQhxS+06PPXZT6qrgWZF2FsifvEP66SIxgLlalupRdA1Gtc8NIEJdyhY3V6kL6coBZ+ln05hrJxSUs1Q+w2bP7VcYDlkNy5zEznya4A7NqOOV77Fh2+44CJNeUDW6A4g==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB3963BA87438B343A71230675F4FC0DM6PR11MB3963namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a8e5ed-4d6b-47dc-1200-08d88fd54c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2020 17:29:14.3886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z5jEvDRdv6CjeFOHHVgiaCQTQ9VIILCaulwD01I0MNVijx2RP5LQswcQDz4Qd0FwT4haROPDftnGa8GLCu8gGuRpqOzgQbj08KnKI+Eaygo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3673
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=cristian.ancuta@intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--_000_DM6PR11MB3963BA87438B343A71230675F4FC0DM6PR11MB3963namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I've implemented a new CPU target in ./target/arch_name and I'm also trying=
 to add a new board to emulate that target on in system mode in ./hw/arch_n=
ame. The board is based on the versatilepb, but I'll gradually be removing =
all the arm implementation from it, aiming for a minimal implementation wit=
h just my custom cpu architecture, system bus, main memory and an UART.

I've also added all the necessary stuff required by minikconf.py in ./defau=
lt-configs/<target>-softmmu.mak, ./hw/<arch>/Kconfig and a source entry in =
./hw/Kconfig.

Here's what the ./hw/<arch>/Kconfig file looks like

config NEW_BOARD
                  bool
                  select PL011  # UART
                  select PL080  # DMA controller

The problem is that the build system is bringing in other files that I didn=
't specify (CONFIG_A15MPCORE, CONFIG_A15MPCORE, CONFIG_9MPCORE, etc. ), and=
 I'm not sure how they're ending up in ./build/<target>-softmmu/config_devi=
ce.mak:

CONFIG_A15MPCORE=3Dy
CONFIG_A9MPCORE=3Dy
CONFIG_A9SCU=3Dy
CONFIG_A9_GTIMER=3Dy
CONFIG_ARM11MPCORE=3Dy
CONFIG_ARM11SCU=3Dy
CONFIG_ARM_GIC=3Dy
CONFIG_ARM_MPTIMER=3Dy
CONFIG_ARM_TIMER=3Dy
CONFIG_BITBANG_I2C=3Dy
CONFIG_DS1338=3Dy
CONFIG_FRAMEBUFFER=3Dy
CONFIG_I2C=3Dy
CONFIG_LAN9118=3Dy
CONFIG_LSI_SCSI_PCI=3Dy
CONFIG_MSI_NONBROKEN=3Dy
CONFIG_<NEW_BOARD>=3Dy
CONFIG_PCI=3Dy
CONFIG_PL011=3Dy
CONFIG_PL031=3Dy
CONFIG_PL041=3Dy
CONFIG_PL050=3Dy
CONFIG_PL061=3Dy
CONFIG_PL080=3Dy
CONFIG_PL110=3Dy
CONFIG_PL181=3Dy
CONFIG_PL310=3Dy
CONFIG_PS2=3Dy
CONFIG_PTIMER=3Dy
CONFIG_SCSI=3Dy
CONFIG_SD=3Dy


And because a15mpcore.c is trying to include "kvm_arm.h" from /target/arm w=
hich I don't include in my build, it obviously doesn't compile.

Any help would be appreciated

Thanks,
Cristian

--_000_DM6PR11MB3963BA87438B343A71230675F4FC0DM6PR11MB3963namp_
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"RO" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#8217;ve implemented a new CP=
U target in ./target/arch_name and I&#8217;m also trying to add a new board=
 to emulate that target on in system mode in ./hw/arch_name. The board is b=
ased on the versatilepb, but I&#8217;ll gradually be removing
 all the arm implementation from it, aiming for a minimal implementation wi=
th just my custom cpu architecture, system bus, main memory and an UART.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#8217;ve also added all the n=
ecessary stuff required by minikconf.py in ./default-configs/&lt;target&gt;=
-softmmu.mak, ./hw/&lt;arch&gt;/Kconfig and a source entry in ./hw/Kconfig.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Here&#8217;s what the ./hw/&lt;=
arch&gt;/Kconfig file looks like<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:35.4pt"><span lang=3D"EN-US">co=
nfig NEW_BOARD<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;bool<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;select P=
L011&nbsp; # UART<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;select P=
L080&nbsp; # DMA controller<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The problem is that the build s=
ystem is bringing in other files that I didn&#8217;t specify (CONFIG_A15MPC=
ORE, CONFIG_A15MPCORE, CONFIG_9MPCORE, etc. ), and I&#8217;m not sure how t=
hey&#8217;re ending up in ./build/&lt;target&gt;-softmmu/config_device.mak:=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_A15MPCORE=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_A9MPCORE=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_A9SCU=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_A9_GTIMER=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_ARM11MPCORE=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_ARM11SCU=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_ARM_GIC=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_ARM_MPTIMER=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_ARM_TIMER=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_BITBANG_I2C=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_DS1338=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_FRAMEBUFFER=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_I2C=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_LAN9118=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_LSI_SCSI_PCI=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_MSI_NONBROKEN=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_&lt;NEW_BOARD&gt;=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PCI=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PL011=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PL031=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PL041=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PL050=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PL061=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PL080=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PL110=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PL181=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PL310=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PS2=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_PTIMER=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_SCSI=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US">CO=
NFIG_SD=3Dy<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US"><o=
:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:35.4pt"><span lang=3D"EN-US"><o=
:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And because a15mpcore.c is tryi=
ng to include &#8220;kvm_arm.h&#8221; from /target/arm which I don&#8217;t =
include in my build, it obviously doesn&#8217;t compile.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Any help would be appreciated<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Cristian<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_DM6PR11MB3963BA87438B343A71230675F4FC0DM6PR11MB3963namp_--

