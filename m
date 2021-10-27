Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122F743D317
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:46:29 +0200 (CEST)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpoa-0007Le-3Q
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpkV-0004Gl-Ez
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:42:15 -0400
Received: from mail-bn1nam07on2124.outbound.protection.outlook.com
 ([40.107.212.124]:45734 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpkT-0000J1-Gu
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:42:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwsFYYzaFIcuC8zHLyWARX40bcXA3GBBOezJpjO0FCwuwe7a5Jdu0ls8gt25KWDMg7QQd3cHexcGUe2B4S+YWSxRsuRAokDHDRsa0ILhImLlsliCS/idp7G3PBRkQjmeBvZQtM2xfdt26qbTAjKds8rdyWySjJt3fFsV1oPguLyCaTIVp2JBXfvCPMcgLwTYACt5fHGFbhOS7lc9lj7UPR8Pp62uLlTcT+xh6lN9iBUBfm7500X5v8O0nQcMGgyM/6bLn/rDBXUKtWyOJ96AKB4oRNz3w7hbp2QxHQ2H6MJoJVFYTQObprpMSHsMrqwx31S/9FP3oPLfDtGvfgO93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eck+Joy/qztDeS5+g0oUJHojz45E8IACa2LgrBcq3p0=;
 b=WClAiSIVHe30utDt5Pfnb1TvbHSIyLYoH/zFGsxjj0izOjHIjGH8JASbgJWW3Ed+gFVrO8xig7qFOYaq03aGmfJ7usPB5ZhO41lG6vo058Rnz5SN6Uz/EFx+shxJlPHDuwADlpsj8ODVe6oeD0bW71JCLyhu1snShDfe/bFu0bAhZPO1EdeMUqYWNtBhSoZ6mha8UF7vow4CJnGVfmcZEoCdmSrxncLVMCoxV3oatLoj78vs5CDJ/OsNRy0N5GldfNVuT0N+64UyuiofMRFRTuxk9JCKVzXgy06e0bKJlTrMVntN1NPdJjQb0uYh4mzxZWalaBqqV9MQrzY1xhpz3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eck+Joy/qztDeS5+g0oUJHojz45E8IACa2LgrBcq3p0=;
 b=ERL+0Vm5G4r8EDlxdvgFuZfICVN5gQtHwPp3pyoBfAl7fpm5g8kC9Dy5VWcFXKNjuDjhWGTo75oSSOfO6HyKHZrw8L9NslZu5il4ZCSJTrX+5Tg9RLeMttUSUpLOjr3W71uhrCZFAJv/OZDakGKVUycGkqeP+U3Y47bd2ZL6RqpOp9VsHTr08jW8W1Hoj3rrOmUbTz91nRll2D1EETD8hV05I+wPX9HHCWTWvLNC8SL354JKpKPohqwscgvaE66fHOOLI2Y11pI0Xif5ZIxYcnms0Bl10oNyQcmTu1qthuKoGVAqFPhzwFzDVMmnqOEmoDy95qfNKp27S5pRhyYAkA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB5538.lamprd80.prod.outlook.com (2603:10d6:102:10::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:42:09 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:42:09 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 46/51] tcg/optimize: Use fold_xx_to_i for rem
Thread-Topic: [PATCH v4 46/51] tcg/optimize: Use fold_xx_to_i for rem
Thread-Index: AQHXyr8X3iK6w/BLgEy0Z9PvGEE+F6vnT4RA
Date: Wed, 27 Oct 2021 20:42:09 +0000
Message-ID: <CPXPR80MB52247FE76878B0F308FFDEA2DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-47-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-47-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9bf6b12-f5a1-46d1-2d83-08d9998a3f38
x-ms-traffictypediagnostic: CP2PR80MB5538:
x-microsoft-antispam-prvs: <CP2PR80MB5538F5996D4A8F7AD8CD1ED8DA859@CP2PR80MB5538.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g2Ru7a4MwugCverzGIrop2ruxtOaIJAPww6rSQe1ehYSj9iROxmrK2vECuVz6zXHCsRZ/tynHFGDl1lGtWlY4fxLNATJnS2DvSkJJS/4TCER68KxaSQ+YsLx5jsiRlQwcv3oTXS7t7NHeVpRauB5Engz5UjjVcDwUmvEO0FZ+HNJHK0wY0dkreRvclZMZYr9i5z5fvTDXXLnTKevexYJIc0Do1GVRH22v4emjU1PTJTikDa4ucZIc69MeYxExzOIuXVHuVM/lwUM4arXOT7392/Y6EYQ6PDY57n1IFx28KlqbRsVpfnyhXuWOZKhjzpJdcBz9VzeC516IyHYf44a/A/PIDbb5BWJssmjeB5RRzhgoFyk3S+PaKIJ6xgCCQ5+EZcLK5PI0ADU3rdAKpEGlbKFuK+PM7f64/WgMPYxskxr5/dfe7H0JHoZT8B1M7dQPFlp5k+QDjgYNJArY918GrbDxh2TKgIMsZwqqpG15pPwOcdClVRaCft3GbIrkUBOkmS9lqu/gx2smZmYpzq7KoR//ne6Is0gZyfk9CoOFqJ/zSAjVGkUYNtG/jE52r/lt36P8LllwKGL5KxwqynsMYEPiCQ/rkqqt4qwxpHqTg3thib4AFIWurWMs/vKHZM0eBe68uv/VKBXBm9vNI+8rFtOqTBWwQrVQsqZkJBCdjroMKwZ989h6zxQmndK2EuIiCiASHCGxyAK6lN8yUBpPUxzjtGRKf2s1CA9O3JNEXkmqfXWfmmBzGBhpsfafavrSTSqvdf0s3Gr5pVc4B5+WL58ZfEBVq6xzLW31FAKWLs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(7696005)(6506007)(8676002)(54906003)(9686003)(5660300002)(8936002)(316002)(26005)(110136005)(4744005)(71200400001)(186003)(4326008)(2906002)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(52536014)(508600001)(38070700005)(38100700002)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l+cZRrGyx/nDpXt7UOfeysUwJ1+Re+whW9/dxZdt+muDzKBkII0XA366cSyu?=
 =?us-ascii?Q?QFE1fj9FUeMgKKw+4U5XJUkQ/Y/DpDx60dDG/Xi1J89NNxDc+eprVD7LEC4y?=
 =?us-ascii?Q?jL+3ZHc3BvKmvOvaSGPfvG4HSAu94G+zLyhVfAkJ+RARL8PVcNbnz103pOaw?=
 =?us-ascii?Q?Au24vG7eZ87FGUhx4Nxn8IcUyeM69Q8zQZLOjHUkztQUdZSOGCOfzE28qI6e?=
 =?us-ascii?Q?uXprcR+j9IiaV4s3NA4sqi5Yb8W19ug5etfBix5LH1YNBA2cpFC168ePqi0K?=
 =?us-ascii?Q?qyIMvuCzKfPeZDVL9OQjscr+5WlbgwMqKclRCMyHEi+W/Fe8/GBJ0+JdIp/3?=
 =?us-ascii?Q?077WaVWJchDyYOIXOPoVzuTWDa716v2P9uOFPbE+1jSl9emHHbeqB70YRnPE?=
 =?us-ascii?Q?LcA4zcYhKbZ9ZDryqvi2j3uUl/4QnL8md2jIkNpfnuHybngJobDyCya9aJiu?=
 =?us-ascii?Q?YVJPfMskzMRbekEUtao/bble7MIIixYvSNu8elmahEf2d//zDDarwWLAhAgj?=
 =?us-ascii?Q?3vIwPCGnXVZW7V0j0KhIccStLkQYbuyzYl7YYI6wsgRpDkwfK3j3Tqk9Mfmw?=
 =?us-ascii?Q?M/H7F6qQAhNCudjGiu3IKYh+ysU/+BAEjB+X7/P8Ki8JuucHC+XqdQiOFHij?=
 =?us-ascii?Q?toB8KGeOUqwclvv/I8JR2WRFXY7ovx0w+ADAT6wKMyvRaZKo9sdE+5jTGNl1?=
 =?us-ascii?Q?Ep8c2d752ruEz3/eP5p8r086EeFY5sPXQqj8iQ0Zjhb/c7jhIBFaT64QzI7i?=
 =?us-ascii?Q?2ueKvpntfAQhgA/Ifndq09Fh4bJGgYxGAvgEogPY9mK4G0V1t0TUMWSJWDBe?=
 =?us-ascii?Q?IX+3qsEA4FeKsm+1lE7r1pQNkQTDrmBRqlBr/l3plewwz7wIGRacPuPtN0si?=
 =?us-ascii?Q?b+EyLtGhfDHDi7Zt2BYghXe7z4oaqqQ+zQRAoxcTMi416HQT//ZpbaaAD6pR?=
 =?us-ascii?Q?iRKFciGbKHuIMz2+lXxH8M8LfM8hEZpb9lPHkAI8KSQam/D3wHWSVKRR2VIL?=
 =?us-ascii?Q?HP6a8rymnv9RdoD9lnuTbU56LZwLUC0zD+20QadfqszLMpwVwekoBev0yGUE?=
 =?us-ascii?Q?fBL3d9B+GC5oi3u6sN8kppP6Wk0l6K1fErZVdwfWCR65IQCkbI08Jc+N1buz?=
 =?us-ascii?Q?EM609KG5kBzzHsaxgNv3rL7CyugrevvQ4wWSbcBf0F3SVIuPJRG1zpuhEE/l?=
 =?us-ascii?Q?PxWGHgy/m4xU5nA8SaPcgOfdfg21QgBxTDfzg0ZSq4DFnkcOh52Cntz61gFt?=
 =?us-ascii?Q?MbC1EdWIqJzigX2Zinwg7nBzXOQfBEgs+XRCvb8r0CRIDfwm0/9zlJKy2Ef/?=
 =?us-ascii?Q?YGHyAo8zg7wi2+YDJCVoBPfg1CDV6soIp/oh4QvVgI0cxD0Sy2bwwDxIQmXR?=
 =?us-ascii?Q?KTgHbTc1UlmkUoqHbBy7BYXEWYyXAFUK1KXdwyvB5wJ+3/is4hh88fbOT3b/?=
 =?us-ascii?Q?2lUMqQbhPICl8zzp6Rz4RzvX7+GkSHS+0MZYDfN05JYBWXqk2sjOI0Pm3TEq?=
 =?us-ascii?Q?ZW6x3ei1LP7Dz1xZ6YiOhX4MyesIFSwIXRhPnWkeFl0BGEIacL4gMGCSNqzZ?=
 =?us-ascii?Q?NCrivR/E/OyXW8s3sv/1oDR0n5TN7xWlIJrSaZufgxJqB5ozICAZCEAeKdOo?=
 =?us-ascii?Q?YcIsAbzvspM9uFM/DV13Yio=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bf6b12-f5a1-46d1-2d83-08d9998a3f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:42:09.3039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hSiwSzBinpPNOIOz3GdiX4VB1pGboPdKy/QYfuVF1c3akHzTeo9G72wx5boehk5XzU8xrex2vVymW5+7783w/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5538
Received-SPF: pass client-ip=40.107.212.124;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

>  static bool fold_remainder(OptContext *ctx, TCGOp *op)  {
> -    return fold_const2(ctx, op);
> +    if (fold_const2(ctx, op) ||
> +        fold_xx_to_i(ctx, op, 1)) {

Should this be fold_xx_to_i(ctx, op, 0)?
If arg[2] is 0, we would have different results than do_constant_folding(),=
 but not sure we care, since the result is documented as undefined.

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

