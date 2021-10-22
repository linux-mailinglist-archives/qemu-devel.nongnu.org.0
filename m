Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E197437C56
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:56:53 +0200 (CEST)
Received: from localhost ([::1]:56892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdymi-00085u-3L
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdySc-0006jP-Ib
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:36:06 -0400
Received: from mail-eopbgr820091.outbound.protection.outlook.com
 ([40.107.82.91]:6272 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdySZ-0007gT-QT
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:36:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgPJuwpvPqxgd0oyZ09BkSj4Ft+Mo6ow90FGogRvRTbG4NMKA2SZmQYTAgRAkkjVd6i1t5p4kXpBWXYoW0GWOq5U9g4NA9TGFC7VWQHLhV/wrR+Xr8HflAy/kBo6658txWUJAR63zaJTCU7VVfNszQ8GUHy7B1v7lESuHL8pFqBNQphNLtCg8+f6cObqhK0N40naGYDoNOscNK8uWsdAdJ4LEEfULygBffGGk5M47cn+tYQ+2VIKwBK3po91lFAlj/9oBEup0f4CSc6/6vPJKaCZPo1NG6OmxTcC3j8QcZlL/Md+HmY/oD/UWGeWJt5aMt0ht0m/GIWqIbg43xQbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ld48Mp7YWFmE6PgeFcc4IhTvM3loIIFNdvZuUDjLrE=;
 b=INzmWpuqydNdf7gwPLw9athxl06GDyPXCOHnvKEb0Wn5psRoHxaog/3WAsp0Jj7TmPFPuTHcswltwx9fsdnjVK4ZCnPGfFBzpLPmmPaqbHfMp6h+VxecDgRD082N7MUI6uYS+866Fkn+W1mYuwRgKSBR5voYneWbi/xi08gKni7aWPSdltclvgsLGRm+qf3a+8AuAnXo2iEhuF4SkLsdeLHM2ApnnGnDK0jm2Jxuiot7cy9FvhUv2pjsjrBVDBllxnZ1rpX5LR0NTWhkJGN4P2L0y4UnzqKpQgNUAY/bZVgSsME9w1XnXeBWJGSvDQDu1DQhWPP6Gg0VwQV0h106Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ld48Mp7YWFmE6PgeFcc4IhTvM3loIIFNdvZuUDjLrE=;
 b=IWgVI/qUUVJz89zfS0Bw4h0hna7Hei0pGxeKxMRSTH4FTxvb+vOj0uDknzTdxk9Yx6b7WfLHMXRzLVpgPBXEm3U3jTm6ZgDanolHG2qPUvLcMPYRhSuH+MP+1+fxU0nkdQvU2pBumQDbIkihYXJMwYwCZI/ERQWUvmHV2g8WJKZl/i1v28WmrRponhSk/dcNFpD50YEBWIN4NByghyKlGVM8KKXPNRM4arczgXRxFxitiiWe9yIW4FGCE+YAsRK5PpN/aAUXIKVKZUNsO67IyBX2dVPaV25DtAUo7589Lc1qcl5qX6HHxy/pikmWUV9iQsaWVVwU+yiG0XUNuzEJCg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3924.lamprd80.prod.outlook.com (2603:10d6:102:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 17:35:57 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:35:57 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 26/48] tcg/optimize: Split out fold_count_zeros
Thread-Topic: [PATCH v3 26/48] tcg/optimize: Split out fold_count_zeros
Thread-Index: AQHXxr92UnaO5BJOQUuWJMSYpcyOgKvfSPpQ
Date: Fri, 22 Oct 2021 17:35:57 +0000
Message-ID: <CPXPR80MB52247711B59DAAF473390A60DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-27-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-27-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5f6a41b-9f3c-423d-e858-08d995826837
x-ms-traffictypediagnostic: CP2PR80MB3924:
x-microsoft-antispam-prvs: <CP2PR80MB392462452AA9F739AEE44FF0DA809@CP2PR80MB3924.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RSpGA5U8OIAQ7LZb61ky8+Nla+Wl02UEqorDeOrIfkh9J4JIdWtIVbCvyWj9uutj7FVhdJQDMXwpiJp7e0ykjnw4aRKjwGRkCi+A1KvpSqeGbntBK19qNKx85hXXghe7Y63sGdKMsesCju+fF2VpBJT5UrnahYQrBLYgwZZ1mHthBUYybN19llzeCngyc/krb1mW2i5GWE3ig0BI/uf8WvJHNWFMgFtd5e5vyypcIk47BaHcVLuhqRh+d9umEp3xDc9mmykoHzCAFUhdxIWkvCYiYXca+SypD3WGDkhezSVgFwbbocboulJf/HZQgoR8xAhRW11vkeuiFUkNK4Nn3oGaLjUHcCumF0+POwCkT8H0QJbsnmvf1bHEzoAuHHLECq4pzfBb92dEzcqvn227lb9hhTSZjyqpvyZsGUjudj7O4nO6BQVRSh1qkytJEf8hWj33oh0pO5WkKXRzblT4UWzD2PjSD0apa0yY0Na5PUZG7KJu4OP8GAdvumi5eTJ+ptSiO7pG2HZ0Au93wqUhg7cBWjKVdZllEZgIh3BFRW8T5jlJE5XJKGgujeAp8ZHYcTrvPuXFpj7idZnDDKRz4YEujbCeHy3RYOkAB7Tp3Pfo16eZ+iD/iNbKMsy3QEudlyk2q4M+c0jDiP24t4+n5IRhVCBMGZfpPN4YRHlrfMcLU/8jiSVd0o/FuUWfwKmWEio9fXIlGjsveyUWDpuYiNU/fsqGF4yVZMVm9woCAz/FtzloF1b6LXNmYys7soc0Eg9nRF6dRAOsucZutecfSbLPD5AKq/xJJuZiDHinn/M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4326008)(186003)(66476007)(52536014)(66556008)(66446008)(316002)(71200400001)(9686003)(33656002)(86362001)(83380400001)(64756008)(76116006)(55016002)(8936002)(5660300002)(2906002)(110136005)(38100700002)(66946007)(26005)(6506007)(558084003)(122000001)(508600001)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pdXSrDN0gxtLtSnCLEABdTvB1nGO+BVejsNexNTBvc9NNZRy1LGwdK5BmTK+?=
 =?us-ascii?Q?djQH2v/CIgHrVd2TlxPv3zTaKpE3sUatrHlX/NX8ULomteCm30RpdT+bi6cF?=
 =?us-ascii?Q?lwODJ+CEPkXAN72D2pNNyNOaFaM5MV8XRukjIUWkAzT3l7NRTbP9eLCqiCrO?=
 =?us-ascii?Q?kdMndfDGFbkAAcD2kqdwEewhLdCbANmt90KexGEw2LmM0HI8gRmcsrnZ643R?=
 =?us-ascii?Q?qOjPeTT3hAbs3udrEgLZhh7FHUr7dTX5d3sHoxrZEXza09zsFBiPxFt1m0SR?=
 =?us-ascii?Q?XLseisJfL5JxmObxDZQXCzLrY7TuCEj66YdOXNKRlVmQid9wNii1VGeqtH+c?=
 =?us-ascii?Q?OYpN5G5MfCgvEvvKXmw8pZ0598mBGWGWqciYj6a7teRR5Q3gZ8hVkXUvomVT?=
 =?us-ascii?Q?HWrkhVSmaHE87a4UU0jlY5Er7y9yASe2mjeAKhytTzcSKluIuKyLV+ujN+VE?=
 =?us-ascii?Q?naNic9i4m/C39o6Y0sNTKfsUMhLk+k5Ulk+G4F1MwfgCNsdRsLMzhzghD/7W?=
 =?us-ascii?Q?Zc6CnglnYHaOLNyt+6FC4z7xcCDXm7PfS66A8azi5oDXQ/oaQbpyw3/H64x4?=
 =?us-ascii?Q?+C5zhVO1HIBDxUNWHKQZK9ebrCMjwDUrrQvCt41sbnp1Kmsz5B4Cqx96//uG?=
 =?us-ascii?Q?ln9nNHxZ5YsNv/wNCyttXWpKaccYUNAToQAL3yJhxN2VLdr6jhxDw6i6hqyv?=
 =?us-ascii?Q?ZRXUB/TFyGHoUZRI0DSRCn92BKkBGVFbLBmtFtP0bQCDpL2LjN2IFRf++skj?=
 =?us-ascii?Q?Vg6qUCPmrHEnIkaZPOnMw9yZ3fklc0iIUO+FuHiFFedncTZfjEzWfoj87V/Z?=
 =?us-ascii?Q?QotllNFL+KiY7h3TS7iUndGL8A6nNnFO+2ff0go+D0JUQKtqeXqZ/D8wrVHm?=
 =?us-ascii?Q?owPYvfhAXasM/rUKoYZksbFeIFYvpwaMc2inAnGhltSxf71sRG+UpQ7fb8Tr?=
 =?us-ascii?Q?Ff2B7teIcLr1HnNP+1Y0KUTNZzvAB34iu5+zrwN+894MOTfOmJ7pmNzp+Q4e?=
 =?us-ascii?Q?8KeC2J/70mdUcACRmlH3F0sqHDmBL3wkAkCv+uskTu6P01RP0sm5E3nMP8cG?=
 =?us-ascii?Q?PXUOEYubjWljmpgX4CGJAmjqgwHvlNvpsduWo8zpAa3NCtoYhUvdBAYdaXGG?=
 =?us-ascii?Q?bXxG52af/BydMJBq3o2Ff0VyNv0+SRG7s2uZ+qQyYi6tPQlsy4h2UyOYxpQI?=
 =?us-ascii?Q?ZbIU4aTv5uXokgWFN3pn/6SMd4lJlumEdsr1ntmQ5L1M90/SiHNaCc0VqoQH?=
 =?us-ascii?Q?9Kc26YE0EkKNhLUG5nyononQCUsIdDrHvJKZu/CT5MnVwdXuS68iOzMXifkr?=
 =?us-ascii?Q?VMI3t/jpepl7AS2+DEG8a1EoYsnk/tXygDAg7CXaRxSgyyGIT7Si+bjY1QQM?=
 =?us-ascii?Q?Pp8r9APbVw/clc8NK1GcdQ48+rhfwzDzD1BnWN9lu153ZyDqcFXSGETjs7ME?=
 =?us-ascii?Q?JD7Uj8krpF4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f6a41b-9f3c-423d-e858-08d995826837
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:35:57.5467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3924
Received-SPF: pass client-ip=40.107.82.91;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

