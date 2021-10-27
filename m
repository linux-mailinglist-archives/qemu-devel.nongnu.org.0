Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A716143CC44
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:30:15 +0200 (CEST)
Received: from localhost ([::1]:43594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjwU-0008Db-03
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfj7l-0006KQ-0R
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:37:50 -0400
Received: from mail-co1nam03on070b.outbound.protection.outlook.com
 ([2a01:111:f400:fe48::70b]:36883
 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfj7i-0001KZ-8N
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:37:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyTEEijwVdOJ2LWJ5+W8KsKgMwrZ9ORlhiEzyRGGlwXx6LKORBiJdXKqPkoorukzEFyk6ZK8J1nGZlHTg6iNjh6a7TTHgMJ3f19NxcHXQhVan9Db35xSUu6Ba+2Pj91NaJEvUCmoxIVF/BGjr5zlHA4XaKDUn3k3kbmCzh8NrccnfM8NonV1SMFm3pHdG+ER9Hw9BQsCOZ7/mszOLMcBxtr/jGJLw5BMCdRawIfxEIPDGVp/OhkKiydST6DFGRcVwRxl3X87UtW+vnvjNvKa84p5dstSUgtvWt27r3GQ0ku1otKkLJuLbacRFBJcwFUUczYzTQC1mT5vFcQrliRKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifP3LJKhU3qzILquexJYIqm0uUufK26TUpirmTOGNdY=;
 b=DFLtYKaw7aoNqfG3n0vw9H6qMwhLaENgBuyMUao0HMlhjKVnO2J5D+iLXw2+m9sZVn1imQq5fsll954XHrz7DhBWaB4oUik2xwG6apJ5onk12Sw6WHNj9uMnG+n+9/Fl2aNEzZlwaRbcucm3IyUztp30yPtMherJ9crnXsEs9sk6DD1JN/aVd9MMfXnLDVua4blPNotTMUKNllyUvOsytOy2q8v36t7ngRfyae4wg5j7rDDUkETHOXfUQQtr3cv6lsxze8fTRw2VtbJc9DR3HRl+nXkN9iV+6NFi3lj9zadUrVuG+KQIGPQ0HqOVa3wBNVX8JAjETgBwkrbm/+WmzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifP3LJKhU3qzILquexJYIqm0uUufK26TUpirmTOGNdY=;
 b=wI18I1ixSxgnm0bPf2fHBA6KtH0w2zrEUHfsg9AiHdqcU3FjbUnay0Sydh8rDs+IVslrydhGeMoleBsnKwgLfG4neiIRH32vJEvk/h2oR9g5Tyq2dL8eZld/y7CqPdzhE3sUmfZrD8ETc9RSbHYEEEPYPFa3tkz/JML6FhMeqkb/Lxtp4JXKuZmI7uNdEYEDwELjtOrNiRafXVNdg+bBrhEXB2hQaHqLDPLyVgdWXKS4ava/4+NUJRLjtGQS//tw6le2YaqdpA6BDROg57+9kTAXKYCpc4SbXNSXg844+BhbcRcxeCzbXQfNxCL82J1DipPo6h+iQ7OicIjgu40MJw==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP0PR80MB5363.lamprd80.prod.outlook.com (2603:10d6:103:5a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 13:32:40 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 13:32:40 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 34/51] tcg/optimize: Split out fold_to_not
Thread-Topic: [PATCH v4 34/51] tcg/optimize: Split out fold_to_not
Thread-Index: AQHXyr6k/DISRAaiiUuIzMQeYfTXQ6vm2GDg
Date: Wed, 27 Oct 2021 13:32:40 +0000
Message-ID: <CPXPR80MB5224D7475D91C3969E1A632BDA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-35-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-35-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85b07f56-bfc9-4f95-11a5-08d9994e3fad
x-ms-traffictypediagnostic: CP0PR80MB5363:
x-microsoft-antispam-prvs: <CP0PR80MB53631A922BE12F0153C22AE3DA859@CP0PR80MB5363.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f6sGFkOX/3cl53oG1IkEdh/1qNwzpo107FWSZJ20Kpe/ST5aDeq2o9M1nX7EPXB3iz5j/Oa6rNuNVEif3M3PcvfKr+TBiExFjdHB0kq2bKmD8uzYjgUvR6jqW2V/OgQKmzCjI/BbHWIiqmzPKaatCk91eEiOF/PliA8coMnKa4Ii690moTUVJWmZ06lIpALjhHCiOonslz0EyBR/gBxDD+X+iZFZe9V1RyTGjK8EIuFJ60mVW476zbLqT/WQTWC/kUjYMwz7ureUiRmehF5eYxV09IwpLguFpqI3SaxfLjI3cXnRgEyxwmCUbEm7hC7Td6YhCGnsHQNl3vlKsXHwwnyGocPPcyYad7u4NfGWIXkS85qhRkuL4KDElZGLCeqmDtcXY6Xy/4ie95Kfn/YGqjvFF8hTKZd8cSE1P6Qa0vqis2jKa6BoPt6QGwkREbhD4luWNITQNBT0pJjy/jKUGtsjTllKUoIUDGEk96dJG/z+dVNaIjSdmbns1YC0lVlmwuuzg1qgFstb4YHe5iHq7V0Gn1CA28+1KusoxU37HTP7b221Swqjn67aECs++LV3shHmdx+UoZlJgATakGmhNSf9E/Zyfe9rUOWdGATIEQgoi6lYBylGPKbAQ6yQUYCeMNpaOjRS+DDl6LJHAwMji0yV73xqgdOSpYFvcAQxNVwqheViW6/VpJK5nKhmA2tBpZ1n5TDAgPq/I84a3YTMHSfsgnbx0WLhvTIVnnSU6n48ys+BJJ0koRudG/t4LsOluotYyWdkWyJNV9f7Zczuwo0hr/UhhXcn+FjG2udr49w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(66446008)(66556008)(71200400001)(66946007)(64756008)(8676002)(86362001)(122000001)(38100700002)(4744005)(54906003)(110136005)(76116006)(8936002)(5660300002)(38070700005)(186003)(7696005)(83380400001)(6506007)(2906002)(316002)(52536014)(33656002)(4326008)(55016002)(508600001)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IfwUycD4xHwNjOxnKO3tH1rN6KHRfanyDQR1nVmNh0KwTSubegK8LJRXCzJM?=
 =?us-ascii?Q?ftHOa1ItulBqsRETACrMuQFW+dopL0inomsSgHcfXZJfN7IhVkKv2f4vg2d5?=
 =?us-ascii?Q?7qzPammSdCYIVB7eIL333FRr1tTMzM33EBF/6HdsOnviPIVjtZTRqSZpMzHP?=
 =?us-ascii?Q?l6oIkUsVfYhO8q1YSUIdJdfuJBchMnqO+s5Ljx9rL11eedXXY8rymg9p5ohq?=
 =?us-ascii?Q?ZbIll788tFBS99/uLF7HsfXuKC6cpghyq8FUmDX2mQ1hRWoFOWLAw/WYTHSA?=
 =?us-ascii?Q?PHjcmsU7nFMID7zUdt7eqIpZjVIjxMk/2EDiTfreOKcg0vyif8EILcVvtSIu?=
 =?us-ascii?Q?5jCYPorMYhxvFgfx4Ldl+a+8qMQmfdmU1vJPSt4hszfedv5LK1UyuQcYU8Es?=
 =?us-ascii?Q?19BRvVpst5dKB3EbCrKUeQuSxvKP/8dygD1I8L2CZQQFMNMRY6KQyKbtWLQ3?=
 =?us-ascii?Q?4Ni3uw31emkQWj6xCzgU7W7EWBY3VXTyyTI/6sOKBDWiohA0IFLfSmZwJy+1?=
 =?us-ascii?Q?CBBXh2NSIpIZ8Jw81KnLoz1La0YgqLjicdoZmRGEG6yShUxLY7CsdrpyG3Ve?=
 =?us-ascii?Q?iBu1tXFEhkq5090rRk1ccauompnqp/ZnUzjM2K735BsA1EdAgDNqsAUguXgF?=
 =?us-ascii?Q?bb4r9cO+/kWCGJXYxONFRFgi8Y43dcc0P9ZHq5Tg7S9Ej4IoOQ3zJ63YSBft?=
 =?us-ascii?Q?AVRKgqPvWE1C9umR9IYUq46Z5iko2jA2H/QARi1mIvmsSEuiG0ggDAEANQwk?=
 =?us-ascii?Q?A2LtxEdsLIM/3sYWbJFqlGEkltsi9WjXrf67gtqKpFgygdvai9Mb9i7YLKBr?=
 =?us-ascii?Q?+1M5zn6ZIXjnvObTIvssvVQ4QyBijRFUS/mg9qkjDGUNdAD/NVmo5FSKpATL?=
 =?us-ascii?Q?aE/nt+I9qC37OvKfCh+DjFEeOPlxj4o2ozpD/R/LWt/+17FxMQw6whYaDyKz?=
 =?us-ascii?Q?Rlv3c2vOYqCuQrZcsHBIOlBT/FVC1btR47DfpHHQo+EFdB9CytBcX9Ld3aRP?=
 =?us-ascii?Q?VkOFIzpc2MinoXgIAvagNfdO5GBXFTacHh721f2mjbQKbJ71HQh6JaaYyTR6?=
 =?us-ascii?Q?YWQJyKzTZ7Iw64nr+wpti+dUH4BSF+lEdRT89Vlz5ugxC/LQtMK5G+B0Vp0W?=
 =?us-ascii?Q?LHQWk97+mbIrIvHqKPoSv98Fyi8dbFVjrfAqK/YbhXrEV9K5HDXUSI4Yp+TO?=
 =?us-ascii?Q?j5YxWPUKAhHEoW58iJPoAf/4DQEr+80ghamxUytADkO2EOuLmDoRUGfsg9he?=
 =?us-ascii?Q?rBZFaWyo+X5Y5374/s1bj3SPOJDLFQkn+rSINF4SAaUfp5nXHsSSLyqHHhfn?=
 =?us-ascii?Q?7R9NRRA6uQGfGfZ9YH3fiGJS7xYdQfoDXmKO6lguVTN5fFhlhG2GlNpg0FJ+?=
 =?us-ascii?Q?5+ofPToKUXPiyepK2+ezcTcSAPexjqlB7EHaoWA59iPbv/rRmmtNSNLbY1jg?=
 =?us-ascii?Q?wnS6LUew5tV8X2+ytUMYAjmRFxLCdabBxGRGXujiDBR+nHQFCfzS25OU/WU/?=
 =?us-ascii?Q?IJtkVxW++1gWU/MyzIiMAWzbJQl1nVCzYu5iW5Y0nGURZGz6kbapwR+GStkO?=
 =?us-ascii?Q?8AB6MUbcLe/2PpECelK91bhNe/vsJxSxqRlmGXnaaJxDeR408Szn3GHuQ1Dg?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b07f56-bfc9-4f95-11a5-08d9994e3fad
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 13:32:40.3602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKOwm92mfMF/h4AHCIXYBmhnKmfAFFpGKVdlAdQxCzmoqwU5KrTqj55jy5D2V/aKmxYmm852GmcYDjJwtWjQgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5363
Received-SPF: pass client-ip=2a01:111:f400:fe48::70b;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Split out the conditional conversion from a more complex logical operatio=
n to a
> simple NOT.  Create a couple more helpers to make this easy for the outer=
-most
> logical operations.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 158 +++++++++++++++++++++++++++----------------------
>  1 file changed, 86 insertions(+), 72 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

