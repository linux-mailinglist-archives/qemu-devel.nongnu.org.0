Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AAB43CB2F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:51:33 +0200 (CEST)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjL2-00011p-Ss
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfj3Y-0001Xo-I8
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:33:29 -0400
Received: from mail-dm3nam07on2098.outbound.protection.outlook.com
 ([40.107.95.98]:29526 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfj3P-0000Y3-Fg
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:33:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SslWGkWbBmsd6ONAF9tnxKTQMesxm9h4+U9QiSijhFDhOFXyNXnt0wL/9hflXN4zmQMQk07a/ZImX8atKbCZtSnrC0pbW7Yr6VMPrtcscI9rtJofI87jO93cMcsFZWyBLVSeRUtU/J5+6rBEC9t+BGBQ8b8cWVvS+sZ71entP6DC5mf8mMW+d5gF394xCLAocQFehNu6KT7xGe9yXNOSI3jD7reYj60C+7ESvUR/EO21micI1WghNa/8oWn2fHTG9qB72hNfu66gCPYZLHn7HH2EBX77D3SFlgSu6FRWDR+0KjiY6zAaWQFt9fz4FVOhselkOGGoSbMJLh7/wPvZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zsmTO0wPyS7vmix6ik2AsMv+oVHZJBNevaPeV20V1w=;
 b=ZAkW6hY3hlaSwbDAhhPL34LMtF/X1lp+IwIRXvwVIkpclibHu/LShpXWWeqhztaewbHgRCqeEnB8jJ7bsoHcxIWwJlEhH2nrDE17Ml1Kk9A8gnUFjRkWNdYz2512KWp4tO8HKQb1w3BBiaThHydbtGXmnO1ncnXm/5U9PseFReMfXJ2Po3cELAfrdlEuFIHIqzUr3N/ZPlsjJABAK1uFEJspDwgTtpC/JBmjBoUsdXm6RLXUeh0buyq7nBn5K1jT5xtufYp9x4svCZuvmhwENMf4OJ1uJHQmePmWx6HVUGM0NJsi+avJisb5Ezc/EIfD5GN70QAUxlVix7ojmwtagA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zsmTO0wPyS7vmix6ik2AsMv+oVHZJBNevaPeV20V1w=;
 b=xWZlV9ife+f0HZ1pnb4ZsxnfQqg4c8O0XE1x6OHcbdTusKsdUdTreJv1KL4Y2+t5Ki+JVx9ABpKAQ1XuM4m+vcRNHvI3qzwEUHHbqYpVilsms49ZXBxtX0C3rpV2QnZmx2u1DPV9OsBRqyJdU+A85KkHVTDI2Q1JgHNV6OMuEi4Dc5rwLL2bIept2oVhueeW4HoyYOwc8Mhug3+lQbvCDNBHe30B2zzSjF4jQDxbXJtePK3Qd7z0AoAKlNNO2oXrdb5c9O4occ5iZPz7vRJn4E/waGUtj2JuTZEfGPy1JZpUxqxcS5bfisGrWt0gRr6NtwYd7j+XqDt+zlQd2WHLow==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP0PR80MB5363.lamprd80.prod.outlook.com (2603:10d6:103:5a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 13:32:42 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 13:32:42 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 36/51] tcg/optimize: Split out fold_xi_to_x
Thread-Topic: [PATCH v4 36/51] tcg/optimize: Split out fold_xi_to_x
Thread-Index: AQHXyr6lxg8CI6yiGEuCZRlZOXpKVKvm2JVw
Date: Wed, 27 Oct 2021 13:32:42 +0000
Message-ID: <CPXPR80MB522421FCEB57941F6194CC3FDA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-37-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-37-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b6f804a-5d6a-4de9-4e33-08d9994e411a
x-ms-traffictypediagnostic: CP0PR80MB5363:
x-microsoft-antispam-prvs: <CP0PR80MB5363BC408C98D7B14056711FDA859@CP0PR80MB5363.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GrChUawcQ9D2J8bX/vP4oOkaWX787OeBat+2CengwYhqaPTdB6eOWFi0/VCG1aXjYJRnpZisK8GZb4dnS0FOHAOt4cOKJeXZHqgX5d9bD4fr0iMiqqxB3tQKDyYhL1BEB9DGUNZDQXWk0/uuI9gmmFnbxdA0FYyLLi2XmhjRkqlu8cqeURbcclLMKDWmaYGnf0tBuSO+D3Fq+wXx3gGZnPq9C8mPFg+QbLs7cUOpp2bMNG+NljH4e9G4YTjoKP3Z5v2HO922yQods9KtOxfVDY4hbTe8r0slw3QaeMFn0hhYysgFlElMXnJMW2TzTUKYaN5R1ariIaAmiPqSb/x7OOeGZwL4KdSy1kEWYeBrXfEh8W8cwUA4qEQ1BQk3zTZguZTyIYb/sHhh+/5NdevzAt4MN4yXIeuT0CnIN0p0xdGIKpSbWr8S/PJ8YAD3d3YFDu054xT0QxStnTGz4MRwvcg8L4Yf7Ipb0ZN5k0ZMyVp/JSS0K5qmuy3VHw169wRImEx2piFwbjwwcqbAXw0xYRam/DWwW9RWJTLRMRNS6noOH4QZ4qbAsV9MUDND5+hGvaGUupJLbewSCS9vXqsOnm3tD3fM026ffL7iX2kg30dGfIKOzH8GEeRFAITa9crgj7Udv7C3Y7S2l/9YgsTLpNxBpzOir4yY+aEEwnPqCZ5ieCcK5RpxSEUbSd930HisCfE0IZHhgA3vzdRMET/3qSfzSyx6pbRy1gnpMzGZjpsAXsUyhILXSLbahHQuJgi773AOAwIrrOyXv0JA0QF0ji5mfV8d9DeHS5e8m568IWg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(66446008)(66556008)(71200400001)(66946007)(64756008)(8676002)(86362001)(122000001)(38100700002)(4744005)(54906003)(110136005)(76116006)(8936002)(5660300002)(38070700005)(186003)(7696005)(83380400001)(6506007)(2906002)(316002)(52536014)(33656002)(4326008)(55016002)(508600001)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cf6d2PQuvvcvG9UbSFo7tzNgT6EmciMCd80HJeHklUGkHGOheRRc/VaDgb/7?=
 =?us-ascii?Q?TbScUbQ3E8RnkrBg7bIOwSR9KOoHinrwEGsQAuYHhW5VB38dzIRtpTaxqzmz?=
 =?us-ascii?Q?HMYhZ/dKZysGNY4YrdMBcew5KboGPEi8uZO3FgnjhGraUE1xU01gAnp8Lv3u?=
 =?us-ascii?Q?SjvpIvrAZodOWZG48nv1X+eWwhyZ2v6tStEpIFl8bp0K2EWo16HeqcghrHYa?=
 =?us-ascii?Q?Upg5TH4qmYTlI9gt3MYdvvFqhmkWrlSEJm+Q/I5LV/oNUPgDf4cgHFrZaDIN?=
 =?us-ascii?Q?E86N1lfFrv/1YB0hzbYhmHylM1hzETg8SOcmbrms1PtiB8W0qsQmyatrnPOQ?=
 =?us-ascii?Q?DV+8JTSJHDCelC+yrIXLfSX8LTovQ+lj9pkhe27Av1f62lw8d2dgzwVcsFKW?=
 =?us-ascii?Q?qGfHQKydvDOWW1CRg0hfcKw7sf3Dm8DexlLAcn/fRLYRSEwCzOqd7wdRlww4?=
 =?us-ascii?Q?saYDHzTfDZD8D3z1U4sy6RcTgZT492p6OIz02ExiWTq4awOGda5qZqBEBXlU?=
 =?us-ascii?Q?Vispp5/3+cbSHlWYb2GOFCDyQLSsV0rM+SCqa7/7H9CB1fq0Nr/xAUvVv4j/?=
 =?us-ascii?Q?3AM+zSz8xU8YuSwm+MtdvTTYTyjBupDNXfarcDcAtUzdDn6Vgiwy6POnEv1s?=
 =?us-ascii?Q?Rl1ykkWbVOmeHyzp9+0hX1LErWmEOKHGh73PIJd5E088pAdpWT1sGE7jt0g0?=
 =?us-ascii?Q?Ii4a9syGA+ALOEF5lGqg7SyRj/h0gcXJy/K13yUYfWA03lMXZYpCuwY7PsKj?=
 =?us-ascii?Q?YgIpu0tdVw33U5Owu7dub07OoDIUk9NC7nY+Eyhb76RG5yv+u9cyKCbeYXVZ?=
 =?us-ascii?Q?Z3kiVwRzRxNFaFDdMAxg8bCA6kTclFfjEAvoDANAONP2a5WYuahXneJsCxwG?=
 =?us-ascii?Q?lEI1TwyTP4IU1v9wuCqSfYOSCx2QGXdr1zItpDUU7vJm03qyjdVxHV1kET6r?=
 =?us-ascii?Q?qX2CXC3P9EPPGoyDioZdfHkOi56wSbx+FURgtsja8d4HfjZxqbjan5Dw8CUW?=
 =?us-ascii?Q?iHNrhWxOf3Enug81WQC2WQ/k2Oe5Og+qFFVDR72SR3TqiQ+ZW4lKuNzqqYUQ?=
 =?us-ascii?Q?ZCCf1VUYWNTl9BW/i/EgTdUgXcmBU19L/PBQ5YRj3JVYYyU5jiRkXL3v0f7y?=
 =?us-ascii?Q?pdkT1TkEvsE1DgUq4Z/r7+mxzrBrxebjT4eJ4Z9yMRpyXk47+Qh9OjD9Wymn?=
 =?us-ascii?Q?g32kd6lPBxKgVppzF092HOTkhIYhj5rYtPl8UcYsJI39G4jkCxHBhjTbW4vO?=
 =?us-ascii?Q?hjToX5qJ6x3xFoCupJAblweVpynEdrudwHvvHn7wYH5TUbS8SuAb/Gn9VH7m?=
 =?us-ascii?Q?F+Uo4+BcwMLgsts/+sDofr10kOAKNoeysp/gUGTYVtBF7BmdnwBUUST/Fh5Q?=
 =?us-ascii?Q?Nguv6hNtUhyJQFpzVBfeSriwBN7c2+BQzpBnhz1dQRAC6xCbRVTWuiD8+Jpq?=
 =?us-ascii?Q?x+fCBd8mQugcuFXSEHYW2i8Sw0utAq+OFqfhwGrue9p5BxECBc20jrgOSMef?=
 =?us-ascii?Q?m36/H5zyvFrFj+/NwDxiHjl1oykbwCs8F1LagppuGGcA3OcB5gZ797ZwmE54?=
 =?us-ascii?Q?2cQFEUEsPemPb/gJ0Qw4TRY8F+pesCk1eaQzyUmLRqsctHJBMB514kgGTtgm?=
 =?us-ascii?Q?Mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6f804a-5d6a-4de9-4e33-08d9994e411a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 13:32:42.7867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Sb5OY555t6J03RnyUu5/1WNpAw6ZLbv9RCX7Gpsu25icmdKnpJpM2HadFMAXPHSgnm9l4Jilujam2ouaLsOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5363
Received-SPF: pass client-ip=40.107.95.98;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Pull the "op r, a, i =3D> mov r, a" optimization into a function, and use=
 them in the
> outer-most logical operations.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 61 +++++++++++++++++++++-----------------------------
>  1 file changed, 26 insertions(+), 35 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

