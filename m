Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BF439FE01
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:43:47 +0200 (CEST)
Received: from localhost ([::1]:53490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqflS-0006VY-LA
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1lqfj1-0004Cf-09
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:41:15 -0400
Received: from havoc.proulx.com ([96.88.95.61]:34244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlmgr@proulx.com>) id 1lqfiy-00009u-70
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:41:13 -0400
Received: by havoc.proulx.com (Postfix, from userid 1027)
 id 368A15A4; Tue,  8 Jun 2021 11:41:11 -0600 (MDT)
Authentication-Results: havoc.proulx.com;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.b="Nvl2y5aI"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fujitsu.onmicrosoft.com
 header.i=@fujitsu.onmicrosoft.com header.b="dvRSzE9v"; 
 dkim-atps=neutral
Resent-From: Mailing List Manager <mlmgr@proulx.com>
Resent-Date: Tue, 8 Jun 2021 11:41:10 -0600
Resent-Message-ID: <20210608174110.GE21839@havoc.proulx.com>
Resent-To: qemu-devel@nongnu.org
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1lp5D2-0004OR-Q5; Fri, 04 Jun 2021 04:29:40 -0400
Received: from esa20.fujitsucc.c3s2.iphmx.com ([216.71.158.65]:39797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1lp5Cy-0003QR-TX; Fri, 04 Jun 2021 04:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622795377; x=1654331377;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x50S8puOsCl5jQZFE37WgcfXrScck8GQ7myXgwZ98VI=;
 b=Nvl2y5aIKsmtZvdjRRn0J/2gS6cVuKd7ZyFl2DVuF98WVLqxHWs5DvWC
 nI2mnBY6ROGsx2bLFle7r2TIULRpYCjxOD+EtTKS0W8AYh3Naey8mrEku
 3OmT+KHajRRCTlQxkHpnjLcKI7f8NYy6MBAuXe1wvYz1Rtr88PE8CgB+G
 9j4x0hr9wyccVNPL+wz/AeNobToCuvy7dUq27PA8KunOZJtdG7uJS5/GY
 SwoxEZBdmvJTOtV2ityJ8lyBUD/KdoU2yOYMRQq3tvqO1OtmbZTmF1oDs
 gdLvSZb1RCNQzFfw9SEv78uKgNX/x36AniCnDuz1Zl6MgGXHCMVoz7Gve Q==;
IronPort-SDR: oeiBE0nLtim/qcTa15tDuHn1SjVby0u4z/o8NIg7mdumV0uH3aabDRB33sINJqn2L/SeF8QGDG
 6Vl9nd6p4jzu0LgWZ0dW2yTdZynMaljo2nXj1pzuUXS9YPsl7IvDTxGLDEVVQwVHmHUvJmzHJ9
 48+Kl9En9rfmiqguFsv58KAZOT1To0UlpICLjpGR9oLFEcYGUxH0Eo9zNjTtr0A2j+oRBrT145
 94FGBzJMwr739sLySRpIyyrDFe7hYyA8xRtJDVF4/o3JF4PlbDsFb7ejTCtRdtShK2nGGeW4G+
 nTs=
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="32471116"
X-IronPort-AV: E=Sophos;i="5.83,247,1616425200"; d="scan'208";a="32471116"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 17:29:29 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llOFjgHKeype7qPfGpcOUcHKh8RScX/lcevZxU3GkBFPFz2iK+l3MCnlwgdK+WiuPfKI5DwC0oW3WejXxcz9YHwZs+a5cAvxpCq5LSG7Wejuhg7EX2XxCKf9L1AlDGX+RXytr2Jc0KSdprI5s0xSRf5BU6tMSplPucQ9VTfsH1dRBWI00By1eVoHdtU295iBzAWtNUMaH5YvHo4AObJpiDh4Jn4XVqppxx2ZyUMLyT9zd0tvkAeW7zwU4Yzt+qzH4HdDUh3h17QI2d7/guvFG1Msm5bNC/ICrwEMn+kmE8CEtVx4ombaEl52euYq3L6MtV+T9Jpee4/AbhaPs3DNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6CiexG1Uj8rNUG2l1iFDoTq+H6RimfLHx9rZrWTT4g=;
 b=J24xSqeB6KA0As1Ra/LhnKX9S65G/R1teDrR40ri/AC+ZKx7ceWQEESyNxc8/WTn47I9wV68Qp7iBdjEZe39qjckCYNpA/bTS1MbynU/KjtCfVmrp25T74n+6l+L+xXV2hc4DBpBIZWtR4jzKGMdyA2dC5zJRoE96nbEbmNCJW7bmkrMFhNwm2avW8aWYlQkwxNuJcq/ulnwWCIzVD+TywCpZP/fsEMFE9FLAutOSnlOYa+9+FgOe5AijiuWY8YXU9KiC7xyrEBxX1DNBx4sFsEwY2TueQ25RrrjJeyafRekbC/p8Ur52bMle1aoFZ0KAG6pQLA7zR7gawe3c6g2qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6CiexG1Uj8rNUG2l1iFDoTq+H6RimfLHx9rZrWTT4g=;
 b=dvRSzE9vzQjMGWUqk96N3iySovHFUR8xASgKxMvdhZnKlSg4asXqmU4ZUzs1hpgY5BdDJtPQiGEC6F+YF6gcmz/3OosZP+ZRHG5CrKpDnIxxssBa0z81Lo0lRzWW7gjd6Rfo3S2NPVVO14Bw1QlSqO4K4EYSFAaAxuxbk4+lzT8=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYAPR01MB5642.jpnprd01.prod.outlook.com (2603:1096:404:8058::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 08:29:25 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::4934:aef5:d5a8:482e]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::4934:aef5:d5a8:482e%4]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 08:29:25 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Richard Henderson' <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: RE: [RFC] Adding the A64FX's HPC funtions.
Thread-Topic: [RFC] Adding the A64FX's HPC funtions.
Thread-Index: AddR72HvX+KHC7w5TWeyXhvxcP1CJAEsiw9gABYQM4AAOf27gAALWxOAACk/Z4AACluOUA==
Date: Fri, 4 Jun 2021 08:29:25 +0000
Message-ID: <TYCPR01MB6160266A2DFDE090276C44D0E93B9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
 <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <65323e52-789c-567a-3446-ccb7709877e2@linaro.org>
In-Reply-To: <65323e52-789c-567a-3446-ccb7709877e2@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2021-06-04T01:04:51Z; 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=cfcd02b7-e180-4d01-bd73-20fb6eaa9d53;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [210.162.30.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2f354ff-8c95-4f04-02f3-08d92732dcff
x-ms-traffictypediagnostic: TYAPR01MB5642:
x-microsoft-antispam-prvs: <TYAPR01MB5642CF146828E949D23FB5EEE93B9@TYAPR01MB5642.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hTuUP8bP7NuomOy9Akfw8xgtpCPnQjmfMey40ARIdCbG6+0KHsTryT05fF70T1PuLUw9u66fjjNlh8m1m4etjfLxsQh5WlO613jvFfyQiauw7xbPUs9OU42iNiIQ2Z41ChA9W2VCalNFwzOVkfi/xTZZEn2TwZqOpGDb97xtYom0im0lPeEZjYbq6inKk1Y2Sv546pOUMXvfH6r7rc18RfQ1klBJ+F0zNbR3Gvm5A2AzlRVrHoJ17ens1Fuq4EpdS90Z0ahkod8YHbwz/aa0rl6uttkY5matTsocASPHAQ/FmJRR5OxSTesT4rWuVm452oMF5uq1ciQNHkNeLZXlLlOWgBm3Bvcr3PsY+ma46GgQkCRjc8Pskcfczp3KgQTNkHAzSFvVM4GtHZxcNhZPlwV22NUi9SqNCBRRNOZXbqNA6iML/+OjnUHclZUs6QW7nqBDlPtDPtnSa4DmpN75//qHElleWh9TcNXaXcrJovJbwRPcwRD0dMiKk35PsBaOnvzWz7s10+gR/Ix9knA9aY7HrQ/YGxZM2bU/x84sxCS8sMjtco8Xw3rHzSdnT9LkL8VCb08EkA0KnA5RUoQjq+I+UgnTfWl0YMRPucOvd8jCRIvk7Du3G1bMjWUAhLytp/crYxECtJII0JLrq+C0SM3x6VNp8TCpgYXu2vtUXh/M7W3cIOuQs7Cvh4GV+TmBBY25eaP8MViqridpC/MdOuIB7DSB7HJSC/QXjUaR2q4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(38100700002)(122000001)(4326008)(83380400001)(33656002)(966005)(478600001)(52536014)(186003)(5660300002)(26005)(2906002)(64756008)(66556008)(66476007)(66946007)(76116006)(9686003)(66446008)(7696005)(6506007)(110136005)(54906003)(316002)(53546011)(8936002)(8676002)(71200400001)(55016002)(85182001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?TTFGaTI1bklDYmNIZVFGcUhJdW1QSmpmUjQ3b2FrZGhndk9OSHdvaDZM?=
 =?iso-2022-jp?B?Q3ljeXhGMVRxLzRqUWxNemZOam5uVWJ2TmI4U0V5NlpBaWJKRnZTbmp5?=
 =?iso-2022-jp?B?NXNINGQ1bHFieGFWd093WVFmV0w1Q3ZkcDlXQ0xvVmVTYlJ0ZnhONTRr?=
 =?iso-2022-jp?B?YkE0MG1MbnRnb1FyQXpWWjMvZTBLMWl6cUx1ay9nRzZNZnpVNjFMa29W?=
 =?iso-2022-jp?B?ZVVPZ2phLzVrdXBZRnVFUGtUQVFTQlN3UlB0dVVZMkJPTUFwWFhyVk5j?=
 =?iso-2022-jp?B?WXpCd3VqQXFJNzEza1FDR3NTMlh4Ky9VWjdQR2dWWWQrK1NrYmVmSTFl?=
 =?iso-2022-jp?B?eVRmYll1RDJFdnBFamdrandyT3hEUUU5VGgrZThRTW1vVlMwQVFEQm4z?=
 =?iso-2022-jp?B?dWMwbTY0RDd4YmxhRkpNaUtCNkhuSHRUVFVuZUFBa0RkaE1lb3NVQlpz?=
 =?iso-2022-jp?B?NXJJY0FDQWdLa1hGcEtYZ21NZmMxaWlzSWdHWk4wYm11em9aaWkxdXl6?=
 =?iso-2022-jp?B?NkdJZU1pMnd0NVAwbW45RE1rTWFTZW5Zdzk4eWZqQW1SZnpMVDMyR1pQ?=
 =?iso-2022-jp?B?NWpXVjVoTUpwQTZlYk5pam5iWDUzaEZCRFI4eEhuc3hFS2MwKzlMdE43?=
 =?iso-2022-jp?B?SUgzOUZnQlRtVGM4U1k0Q25IMXNKT29CZFJiNHk4TzlnMjRxNVFPaTdu?=
 =?iso-2022-jp?B?Qm8vOTJnU2YvU2RHZnUwd0U5Mnp4WG1UMHpwK2RUd2M4SWYrcXJBdjYw?=
 =?iso-2022-jp?B?di96TUNrYTViQ21KVmdKVzJVaytkRXFiUVUyZERDL0RzbXZzRStiR3Rw?=
 =?iso-2022-jp?B?UlV4czFKV3hWMkFiRGtYaTZHRHVHTERva3g1MXZUQVZpNDhyUTdUMDFy?=
 =?iso-2022-jp?B?WVdhTGtCRVB3U01JcUJuU3R6UllVbDB2Q3VBdkxTN25HTExzcHp2WERI?=
 =?iso-2022-jp?B?VWZxMnFTNHRxcjJXQzF5dlFlVTRJNURNUDQxRVlsclhXZUk4SUtaQ2Qy?=
 =?iso-2022-jp?B?RFQ2STZrTDRkOGpaL0dGUi9uN1M5WE5TekV4YXhDZTJiMFFWQ0ErNmcz?=
 =?iso-2022-jp?B?Wnc1NW40WSszbUtjTE9BOVdDQXZ2Wmc0L0VEbUl5VXp4TGcxL0tJblp3?=
 =?iso-2022-jp?B?NCtJWjN5MDl2eHM4eFhIVG5pUyt1Wm5IaXNxUWVuc1Fma1hzaWxVc0lm?=
 =?iso-2022-jp?B?VnhtT1d0T2JLZHk1R2ZwZEtkRktEN1VQUkVPSzN0VnNFRy9GaWlIbUVw?=
 =?iso-2022-jp?B?NHFVREF6YnJ5ZkJnTitVcWlGaVVHMHFqeWcyWXdGWjJieTBnS3FGbHpj?=
 =?iso-2022-jp?B?cDRJUnYvdHB5d3lwOVRXU2NuKzM1a1c4UE1xZG95cFpkcitQQ2M5Y3NR?=
 =?iso-2022-jp?B?Vm1UL2hMM3krcmw3d0dCL3g5bHlMMnJyVEE2dW13SmcxdkJTM1V5SjZ2?=
 =?iso-2022-jp?B?RU1hOG4xRkhMa2oyVDFQUFNMMDBhalI0dGJpVzJsb0ZTajhIRzhFWlR0?=
 =?iso-2022-jp?B?STUyVVVlcmc5WHJPdUY0ZVI2bXlpM2FCTnVDZkdTbkcxUE1uN0Y4Lzcv?=
 =?iso-2022-jp?B?cDVwZUtQYml4Z2pySUh1WllrTGdVUDdZNlZIRXNpakljb1IxM2xIVlJL?=
 =?iso-2022-jp?B?Vy9iTTJjRmZRSVpDcWlvN1ZOWkcrbXBRalZwc254dWpZSE9naGM2VHBz?=
 =?iso-2022-jp?B?L1VQZm80VElmK2RTNXJhRzIzMVlNalRneUx4V1g3ZlFseE5qUWMzQ2NV?=
 =?iso-2022-jp?B?Y0FReVRpOHdiT1VKdVM4Ym01b05KNEVmbDBBdHVUN25xbWk0eDdCRFl1?=
 =?iso-2022-jp?B?UVR4b1Bnbjhhamd1Rm91VGVZMUFyWXZpVU9hZkFwTWdQWXZWdEg3d1Ez?=
 =?iso-2022-jp?B?TWRmYkQzVk1XQVZqaFhyQ3NtRFdZTTZKRUw0Nnl2V1NlRXVydmJoN1BQ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f354ff-8c95-4f04-02f3-08d92732dcff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 08:29:25.8337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jEqmPdjHI/hDfpndPh7733R4IdNV6GXwNA8fZN1KOOjX4az3LDvA9RXbU4hI2bR4SIwS9MhmmKeIhuQfWTSSsufvroJA5+GyiZOz4F9GFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5642
Received-SPF: pass client-ip=216.71.158.65;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa20.fujitsucc.c3s2.iphmx.com
X-Spam_action: no action
Received-SPF: pass client-ip=96.88.95.61; envelope-from=mlmgr@proulx.com;
 helo=havoc.proulx.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, HK_RANDOM_ENVFROM=0.998,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard.

> Well, Peter disagreed with having them enabled by default in -cpu max, so=
 we
> might need at least one extra property.  I see no reason to have three
> properties -- one property a64fx-hpc should be sufficient.  But we might =
not
> want any command-line properties, see below...

I understood.

> For comparison, in the Arm Cortex-A76 manual,
>    https://developer.arm.com/documentation/100798/0301/
> section B2.4 "AArch64 registers by functional group", there is a concise
> listing of all of the system registers and their reset values.

Thank you for the information.

> The most important of these for QEMU to create '-cpu a64fx' are the
> ID_AA64{ISAR,MMFR,PFR} and MIDR values.  These values determine all of
> the
> standard architectural features,

The values of ID_AA64{ISAR,MMFR,PFR} and MIDR are not listed in the specifi=
cations published at this time.=20
Of course, they are listed in the A64FX specification document managed with=
in Fujitsu,
but we cannot tell how far these setting values can be disclosed=20
without checking with the A64FX specification staff within Fujitsu.

In order to make the "-cpu a64fx" option, the above problem needs to be sol=
ved.
When the necessary register specifications are released,
it will be possible to implement the "-cpu a64fx" option,
but I thought it would be better to implement the "-cpu max" option as a fi=
rst step,
partly because I don't know when it will be possible to solve this problem.

However, MIDR.partnum can be found in "CPU implementer" of /proc/cpuinfo,
and CPU FEAT is partially displayed in kernel boot messages.
It is true that there are some values that are publicly known in a sense fr=
om Linux on A64FX-equipped machines,
even if they are not listed in the existing public A64FX|specification.

To what extent ID_AA64{ISAR,MMFR,PFR} can be made public needs to be confir=
med=20
with the A64FX specification staff. As for the MIDR register values,
I think they can be implemented in QEMU as publicly known information that =
can be recognized by the OS.

When considering implementation with the "-cpu a64fx" option,
is there any problem to define only the value of MIDR,
using a temporary value for now until the information of ID_AA64{ISAR,MMFR,=
PFR} can be disclosed?

> Peter is suggesting that if full support for -cpu a64fx apart from the hp=
c
> extensions is close, then we shouldn't implementing a property for -cpu m=
ax,
> but only implement -cpu a64fx.  (Because how does the OS detect the hpc
> feature, apart from the MIDR value?)

The HPC extension is implemented as an impldef register as a unique feature=
 for HPC in the A64FX processor.
the existence of the HPC extension would be determined from the fact that M=
IDR.partnum is A64FX (0x46).

Best regards.

> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Friday, June 4, 2021 5:08 AM
> To: Ishii, Shuuichirou/=1B$B@P0f=1B(B =1B$B<~0lO:=1B(B <ishii.shuuichir@f=
ujitsu.com>; Peter
> Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [RFC] Adding the A64FX's HPC funtions.
>=20
> On 6/3/21 1:17 AM, ishii.shuuichir@fujitsu.com wrote:
> > Hi, Richard.
> >
> > Thank you for your comment.
> >
> >> My first thought is that -cpu max can simply enable the extensions,
> >> without extra flags.  The max cpu has all of the features that we can
> >> enable, and as I see it this is just one more.
> >
> > Let me confirm a few things about the above comment.
> > Does it mean that I don't need to explicitly enable individual
> > extensions such as a64fx-hpc-sec, a64fx-hpc-hwpf, and a64fx-hpc-hwb,
> > since all extensions can be enabled by specifying -cpu max?
>=20
> Well, Peter disagreed with having them enabled by default in -cpu max, so=
 we
> might need at least one extra property.  I see no reason to have three
> properties -- one property a64fx-hpc should be sufficient.  But we might =
not
> want any command-line properties, see below...
>=20
> >
> >> The microarchitectural document provided does not list all of the syst=
em
> >> register reset values for the A64FX, and I would be surprised if there=
 were
> an
> >> architectural id register that specified a non-standard extension like=
 this.
> >> Thus I would expect to add ARM_FEATURE_A64FX with which to enable
> these
> >> extensions in helper.c.
> >
> > As you said,
> > some of the published specifications do not describe the reset values o=
f the
> registers.
> > I would like to implement this in QEMU by referring to a real machine w=
ith
> A64FX.
>=20
> I presume there exists some documentation for this somewhere, though
> possibly
> only internal to Fujitsu so far.
>=20
> For comparison, in the Arm Cortex-A76 manual,
>    https://developer.arm.com/documentation/100798/0301/
> section B2.4 "AArch64 registers by functional group", there is a concise
> listing of all of the system registers and their reset values.
>=20
> The most important of these for QEMU to create '-cpu a64fx' are the
> ID_AA64{ISAR,MMFR,PFR} and MIDR values.  These values determine all of
> the
> standard architectural features, and from them we can tell what QEMU may =
(or
> may not) be missing for proper emulation of the cpu.  For comparison, loo=
k at
> aarch64_a72_initfn in target/arm/cpu64.c.
>=20
> Peter is suggesting that if full support for -cpu a64fx apart from the hp=
c
> extensions is close, then we shouldn't implementing a property for -cpu m=
ax,
> but only implement -cpu a64fx.  (Because how does the OS detect the hpc
> feature, apart from the MIDR value?)
>=20
>=20
> r~


