Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079C25883CF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 23:52:02 +0200 (CEST)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIzo0-00073R-LK
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 17:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1oIzhX-0002Hd-W7
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 17:45:20 -0400
Received: from havoc.proulx.com ([96.88.95.61]:56372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1oIzhU-0006SF-Nu
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 17:45:18 -0400
Received: by havoc.proulx.com (Postfix, from userid 1027)
 id 68D3C6DB; Tue,  2 Aug 2022 15:45:15 -0600 (MDT)
Authentication-Results: havoc.proulx.com; dkim=pass (1024-bit key;
 unprotected) header.d=minersutep.onmicrosoft.com
 header.i=@minersutep.onmicrosoft.com header.b="Blgj4EGD"; 
 dkim-atps=neutral
Resent-From: Mailing List Manager <mlmgr@proulx.com>
Resent-Date: Tue, 2 Aug 2022 15:45:15 -0600
Resent-Message-ID: <20220802214515.GA8801@havoc.proulx.com>
Resent-To: qemu-devel@nongnu.org
Received: from eggs.gnu.org ([2001:470:142:3::10]:48894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vherreravi@miners.utep.edu>)
 id 1oItwH-0004B0-Se
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:36:12 -0400
Received: from mail-mw2nam04on20616.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::616]:2998
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vherreravi@miners.utep.edu>)
 id 1oItwC-0006X4-BN
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:36:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDWCLvft1z5CsoCFVzSLM3LpF6bn8uYVQ4wPHu1IXpBRkVPI/CLtIEPHDzzX4VPypCUnAVeicvyNBlHGjGgvb9Uqx9TmQKkuteKp8ewifvE5RDaTHKAqFZ90Fysyixd+D8Wmo8H/lKBjEADc73hQZrexRkj3Bxfwz7pFsc84Di1hWFKwn38fGnyDCmHxLNvOiIgw3iKhZEXnxbtcXnYxJdmiTKx6utn/EfyuJXkAmerdH6j/qdydzUjxou0/hsv1lW9B14Toc4IR7wQdAeYSW7XiEyHBjjP5UV2/STGCYL0/8h3kZgg5if3r2SnGaAzvS0pQEihJxbk2RnzOQX4iyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3Azb5tE7LSkz+2PHr8yFndNHC/ULUbhBZMMv5P2pNw=;
 b=TRffzsHSAM48WLBrFxWY5BMa44VdlF5LPyeJc3GWuANQ60NrCezbKZIGvdTuW5b1RaBxK1inPW4VHL5crMWjS/mME627sFh7KMh2L8Lz7wYtAP6xP0mvwYCENnGOXfwjaSQYHZ6ShzOxeOaiK2GBvfX32/c240kziFI46O3wy4czU2o8Skduqaud1RJ0wmVJED/lgXJoXkKD2Ku0sphFzPerKwVzYTHcArGqlBOh478xWdJIw5LXI4Dr12iPlU0Fl2nY6igZHBxMkB+g6b+mchOxWvw5CJIxqM+UFjafNHgrv7ZCFCcu4PLIXxunmpsCbVBbMXFTcMjLUg4zcf325w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=miners.utep.edu; dmarc=pass action=none
 header.from=miners.utep.edu; dkim=pass header.d=miners.utep.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minersutep.onmicrosoft.com; s=selector2-minersutep-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3Azb5tE7LSkz+2PHr8yFndNHC/ULUbhBZMMv5P2pNw=;
 b=Blgj4EGDwC2bqMJY502KlV98KbQNsfp3vYcBmjfV5xeAk6BFiFawhUGiG0lD6C5egWa309EFrzygij92BKBGFoqirD7alTfzK44WmAXwrM1ApNJCr2G6QFw6vlbGSDouceWvXLefPYfoNmVcBwr0sfcNa8yn5CVcKajEJf9YmwQ=
Received: from CY4PR0501MB3890.namprd05.prod.outlook.com
 (2603:10b6:910:94::30) by CY4PR05MB3607.namprd05.prod.outlook.com
 (2603:10b6:910:57::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.12; Tue, 2 Aug
 2022 15:30:58 +0000
Received: from CY4PR0501MB3890.namprd05.prod.outlook.com
 ([fe80::a49a:2c33:7fb8:9a97]) by CY4PR0501MB3890.namprd05.prod.outlook.com
 ([fe80::a49a:2c33:7fb8:9a97%4]) with mapi id 15.20.5504.013; Tue, 2 Aug 2022
 15:30:58 +0000
From: "Herrera Vidales, Victor" <vherreravi@miners.utep.edu>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: installing qemu on linux
Thread-Topic: installing qemu on linux
Thread-Index: AQHYpoSqPn2l23XYWUKBsEzchDN4jQ==
Date: Tue, 2 Aug 2022 15:30:58 +0000
Message-ID: <CY4PR0501MB389009D2998A175E9D162EB3869D9@CY4PR0501MB3890.namprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=miners.utep.edu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2edbea2f-6bb2-4ba4-348b-08da749bff97
x-ms-traffictypediagnostic: CY4PR05MB3607:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FY3axxyOMOLPSr4sdoEqJB0I0XgJT6r0lE1bVRLNp9O3ZKiZGrGWYA4K+kyxTMoC88wkr0+m7KNLyuJgxQT/uqeZM2ukwLwaJNzSgtVLf57tETPqyLAKfko67pVLnO6bBbmkagExzi8/gBY3jAAtLPJ5yU4uioIDAd30VuUBtCr0yVMOHEQRlpNi8//6LFyWBszQ+yX5uhANFT29Ak/KbJf4UDR2chGThhRniTVdoGIQNdAH/LCvNxS0tyxK+l/hLByXMSAEr87Tq/am4xUxPPnKzDvIXDshRtIrzSZPTHnn/Ll5ng8Y4aVtar5dL0AtItFe8n6ZrHhyCc5wfvZJZf3fU1ktb5aSu5p+xYUkUystk2oVmM4urClfOdkDMNkKKLbvzUppN1Il3pTDKVrzK6TYGbyVJQX+e9IBUzgANAcw4P9A2jLf5hlcIo7YmQAdu2Tkr4WQ/GFx3QF2RF8EwND3oLewsfjNmTBbMlQvZ/+VU2PzfBb8vRNqJYZbkbmYIOgBWu1lqOO4Lk7UQQ58XDoVx6zq+9OeOIODKwobaoKzuirkrQsD199HYTslwDQliROjzIlpJyshA8oKwd+Vk10wP473oN93jUaVwRMLN8Y5y62gkB3KoZCsjy/ordIi1UOy073yeMUNvPK120JwO/Sl9TjKmJyJiXs2z1Wbh6dK+rjQXXDOthd3GYjxUMATrtqiMsWRVWy4EXVyDXdgcyLqROkRQa8cSsvYPJUlI4zrqnrL6G2anNn0HMqVf7rK5q5g6ea8gVwEbJblyjDfWFlVN48dLJ8JeGnJ5t04YrhRBEMr5XyxwxVMGqGDBDOjB/cUTtLBREXATPyQ6AoMTS3ZXWENR2Ny0i6HpR+QhS8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR0501MB3890.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(2906002)(66946007)(38100700002)(75432002)(91956017)(8676002)(5660300002)(76116006)(122000001)(41320700001)(8936002)(186003)(33656002)(478600001)(66556008)(86362001)(66446008)(64756008)(66476007)(4744005)(38070700005)(71200400001)(3480700007)(19627405001)(316002)(786003)(6506007)(7696005)(6916009)(52536014)(55016003)(26005)(9686003)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?heZtMP307ABcoN9iuAQkCf/R+NE/CxkjPmghVS1KvAAXnzEZ9fgjDtFviH?=
 =?iso-8859-1?Q?mJHoeVN5VVlvhHiKQYSSmMaa1lMb/CUSYnErH3Uwi/TjaRXY90V/F1DRzL?=
 =?iso-8859-1?Q?61hSnnBysud2DN2uhTvle+z36HxvKKdfrff1F44a8DEfdAanWIBcHLoL5y?=
 =?iso-8859-1?Q?WNlv/53ADEMmYqvnzv52/uyryEqei4PQfvxg4XnFEYPN3lvocOsi22VODf?=
 =?iso-8859-1?Q?UOE1+d5OC5oLD5+5bD6/CiQHVgc3KWZXCAcEzSWIU0ZWNhqt4bhBWD6Q59?=
 =?iso-8859-1?Q?L7bCyGiLLszzekLccmSm6bnBeH4u1SFPCTmehC6r2JCUOpUZMy8Ldidcpf?=
 =?iso-8859-1?Q?ZFzdLzyQnP+EGSo4yzEnPoWCKzZYZGDDhjdrh5SfCg6+Azz4E2tkfiBsTQ?=
 =?iso-8859-1?Q?ZFK5+ddQeNTaHA2mCJ+DapG5RBjSLnPJKrTcgw+mBIyYUeF1bxkvHu8ME6?=
 =?iso-8859-1?Q?lCHQ96g3YilehErsDCxGsYUjmxLiztlYat1x38iMKZlXEyQ8nhwxeAq6fJ?=
 =?iso-8859-1?Q?4cXikS9zoDQlR/KZ7RUtu8mwYvRIfXTzXepNFr/xbs7F+60YRiTqnqTa6J?=
 =?iso-8859-1?Q?AIsTkzf9FsKhGbZ9AbKilPzFAoxOQfeDs3CRlD9U8nuiZa1d0OQ7uZReUg?=
 =?iso-8859-1?Q?eQAEdMOMXnxrBz5c1tivH8Mjz8uLlpRcitDC6Y8GXiCciR9GRvjliAT7dP?=
 =?iso-8859-1?Q?w79oOiqNAeSotS81y/0PWF7C8rSfQFLml/446GgRiTIbD2MUsKKI3rWAdG?=
 =?iso-8859-1?Q?wv/Nfi4wihINb7mNavvTdSeEL5LiANeWR8FwYyY+pnzNHfXfyBL9R+pOrX?=
 =?iso-8859-1?Q?pUAsD+NsxF5RRssQE3Aj/VcaRxuF/ZnOJkk2lE8FjVqf2qqQHzYhbRNAsC?=
 =?iso-8859-1?Q?OKo+sWy6sf4wl4xnrBQgHYlhv27lpDKNEMqsPd/li7Y6uht0p5EOfZCB8x?=
 =?iso-8859-1?Q?4MIKCuZ5nJZjrKWWwA4OHoXzwbm3Fz0NgkXxhppCLmm++duzb6d0+z0upj?=
 =?iso-8859-1?Q?CqtPuchekyEx03oN7IwcAf4yHzZIkKbvFEcCIWqLaJ0DoEqI2O1kV7GDqx?=
 =?iso-8859-1?Q?fazXzRsjoV9s1YHyqtGgBf/iv1d8qoGscL5YQsWFSGfWe9h9deVMuUO/hG?=
 =?iso-8859-1?Q?qgCATU3OeQlUYEPUlHyRXSRhI37UsuqPXlXyEwOV6umf8FjaMPzXr4K4bf?=
 =?iso-8859-1?Q?OhdI1sWifCBoOYsUzPP0K2amA/hEv9NOp2zVPzbLLSQRfUIdE+fnlwR0is?=
 =?iso-8859-1?Q?hsaa0jSPREqrh6ymoorPhSgIbRbgHfXdKD3svST7i98n4jESKxwhQPEAqF?=
 =?iso-8859-1?Q?PjWrdo2jxH791yStU9g6/r8irUWDNdmaJPWIQszbsUpeiAVrR9c4tY+l5B?=
 =?iso-8859-1?Q?Ly9p23VHWG+AAd8iMca7vWo2BwABwDGZgpoGyQF6hhsqtUbeYmueEOF8MC?=
 =?iso-8859-1?Q?eJ3TrNHVjHf7hyxq49VLqoNSkjtwNP9C5Uhyy6HAaRv2WiMCmz7wLNaQWb?=
 =?iso-8859-1?Q?vXxAeWasG/VNE5bAq5KQdTuYbzi4Bgely014Plk2hPkhwMzPk7KYkhIG2r?=
 =?iso-8859-1?Q?ir7EzMeNZTB2WYsvzIvj6WW9JSwZAL1Ys1d4Zmoc07TY92EuJsXHNlKZoR?=
 =?iso-8859-1?Q?QgtH6Gezu+R3WBFFVXxTQI/Vs3H6oA+B5W?=
Content-Type: multipart/alternative;
 boundary="_000_CY4PR0501MB389009D2998A175E9D162EB3869D9CY4PR0501MB3890_"
MIME-Version: 1.0
X-OriginatorOrg: miners.utep.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR0501MB3890.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edbea2f-6bb2-4ba4-348b-08da749bff97
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 15:30:58.2573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 857c21d2-1a16-43a4-90cf-d57f3fab9d2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9rZG/HCljZnh/34hvAu7Qyv2IWYB1usKzaRk4C1EDuWGMEZN0U7yoMZNMqYFVRJGmzU6yVD2iPnwBXGHX+c7CKKRFXgdoSpSnZoeDaxy6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR05MB3607
Received-SPF: softfail client-ip=2a01:111:f400:7e8c::616;
 envelope-from=vherreravi@miners.utep.edu;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_action: no action
X-Listhelper-Id: 20220802095402-3255
X-Bogosity: Spam, tests=bogofilter, spamicity=1.000000, version=1.2.4
X-CRM114-Status: SPAM  (  -5.09  )
Received-SPF: pass client-ip=96.88.95.61; envelope-from=mlmgr@proulx.com;
 helo=havoc.proulx.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HK_RANDOM_ENVFROM=0.998,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 02 Aug 2022 17:50:24 -0400
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

--_000_CY4PR0501MB389009D2998A175E9D162EB3869D9CY4PR0501MB3890_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Good Morning,
My name is Victor Herrera and I am attempting to install qemu on linux, I a=
m trying to run CAN Bus well in the process of reseaching all these things.=
 I am research assistant with the University of Texas at El Paso. I tried t=
he link provided in the git repository, but there is an error on the page. =
Is there any other information I can use.

Thank You

Victor Herrera

--_000_CY4PR0501MB389009D2998A175E9D162EB3869D9CY4PR0501MB3890_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Good Morning,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
My name is Victor Herrera and I am attempting to install qemu on linux, I a=
m trying to run CAN Bus well in the process of reseaching all these things.=
 I am research assistant with the University of Texas at El Paso. I tried t=
he link provided in the git repository,
 but there is an error on the page. Is there any other information I can us=
e.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thank You</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Victor Herrera</div>
</body>
</html>

--_000_CY4PR0501MB389009D2998A175E9D162EB3869D9CY4PR0501MB3890_--


