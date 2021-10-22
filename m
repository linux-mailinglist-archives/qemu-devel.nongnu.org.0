Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C7438026
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 00:14:59 +0200 (CEST)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me2oU-0005p2-4Q
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 18:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1me2l0-0003hm-0G
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:11:22 -0400
Received: from mail-dm3nam07on2102.outbound.protection.outlook.com
 ([40.107.95.102]:22185 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1me2kx-0004ou-QE
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 18:11:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6ijmj+u2OjL4EcxXw9Bkocplijn1spjGQuTVsM4cR6bOAPbpwBXr63eIVGK36+FMr4Re7ORVAvrKA1wbs06aXorychRRfarG3A8DFbqGeJINR4eqNJTIUHugtQwXtrZmbU3OSBG39yjJIHM8WiCZ4QQdP5e0qHITf8Qm8cbN15IbiK3m+CzrP1l1VE8Ts/tiVdLAOPBt2Zkym/uVqnEMZz/NuLnzXtp7P5CynE8KiNMvAgo27657FsuF1kdZO/64GIkDy4OpTWsLNITXu2iCK6AkQDuLPHi58LqREstkc+3W2Nnx0peaywTT34pOVs5MWE1krwT7w0shdBxsLH08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmOtud12I6sK0A+EmswQeysXefGD7odlPuG/KEJJmHw=;
 b=SxkEFwZWvJeQ0WLJQK46E5bTfj246cdmSHkpFcXTff+2+ikXWvFpF0UKUh+50JhEHlNyTtGNVNJw64Y2M82X4YRwGA42isWWk1ogBzn0QZztJHUSQQGg6QqHMcOTBFv7vI5AYmNL5NIiG9nXb7cf5SaanEoZXD0uKDLAr2sQVyKm7AcM9jIkBS1Kvj7/rOtqItn7ZeCU93nlmW+Ap2S0D0FEPmQBgLuBZYsPOJXvuBye69iWtsmNeY6ghXukPDoduxzRcaqVWJDEJW5ZiULFRoSE5sTJx37zZtk/k9E5FR7OjdacdqUJ2p0ZmGIuqQw4e9AUoS33QRKH4l7oLRQ08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmOtud12I6sK0A+EmswQeysXefGD7odlPuG/KEJJmHw=;
 b=da7QxQsXatyIqYj9VOWv4MVwn8M5xYQMCcISqrqJxQ7yoCebc+aSzg1kRZ97AXVN650k63BMP/JsLfBrUPjSk1g505QMvQs20gcA9Mng+ImwysRVryS659ruq8diDHBKjMn8reUzmDv1x4451L+4K/8ZeuGV7V/RC/jwN/GzvVm8VJNCT1lNJ3L0EdXl9+1qGmABg+TGwW6uHw0nx3Odx9YDI6flAYspY8FipIz4viBjJk0yyvg6AS3yI9J3pO4yXrIP2UEYmjIhA6tjrGSfanTP9y9L99jFwgabD2qyhIKZZldsTHzfSPsh2Wqy9/RaquvJDOLC/IA7+9MStctpKQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP0PR80MB4833.lamprd80.prod.outlook.com (2603:10d6:103:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Fri, 22 Oct
 2021 22:11:15 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 22:11:15 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 33/48] tcg/optimize: Add type to OptContext
Thread-Topic: [PATCH v3 33/48] tcg/optimize: Add type to OptContext
Thread-Index: AQHXxr95QzwAQtGoP0aO6VHw/TRjsKvflA9A
Date: Fri, 22 Oct 2021 22:11:15 +0000
Message-ID: <CPXPR80MB52241D92F187BA5F64608712DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-34-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-34-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74052f9a-0111-4db9-2df7-08d995a8dd6a
x-ms-traffictypediagnostic: CP0PR80MB4833:
x-microsoft-antispam-prvs: <CP0PR80MB48331B401653239135359AC9DA809@CP0PR80MB4833.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:619;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gAF4rWB2NmOsezhFPXvJH8mNoNWjJQRs7EhSKH6EQEukPvvU7Yk3nIoUSE5fVM2yXO0MxA4BavqF4Hx1Ql4xYJlc5Cj4QzhkFJlgZjG/Fk6tVWr5tWqK1Vn5bFwe/scnDdPjL1PFS+RzynsIX/2ocHi2lutOIKlD2MDQP9z0e3TVPi51NMP86XEjT60XrFd3LxdhOEsMCk4AxwGBcYGKlBNi3ENZtte6Ncl61y01bt/sglceWBfkWsh83ta1OQgIrwxaiUYwvZpJC+jx/AeZo+ZUjfW0ZVPHbgHhg2+It6heAf3Dct4UQDgpcNxsgX0rfScCKdE1jMAzTrpbaTPJCxvSnAnT0BpfiN1bT2i8O9rju4+l31tOuO5TU8Zja4KXkkmFy4Y08qPQgmQcqvJlI7pRXaCVPVttUC2faxCBfSQ8qVfFLVH4AYTjdR5wSv2QSlhHQ/yXy+Z7byen+9vlOrmLKKMzqRxKo95VOow+dWpYb3f+sM6JW1gFuGJPj7AVK7OHmC6JP2uyxy9alXLhejqb7fqCP3WFAwaYNvNvyScl3FQiL2os2wzwgYIdOSS82+coxfLeQe5+gt44Oqo0unoSxzcgcd7NWj1zHKaBMVyWmT3blUAbczeHfWGI+cF+a4Oryzvkec5+eBq7ROnszyfbncey7uG0o5wWbSZmPVpONlAFDzg1UJGQbZ7sDq7WwWh2nFRnc28ApfV2nIE7Y0ub9IOWDG5oT4CYEomChSI8wnJ9zLmc90523DpW6Y3xb7VhkQEV9PWzbUGn7jX7ziEBtXD6UUHf7g5yg5dvEFc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(2906002)(5660300002)(26005)(316002)(6506007)(55016002)(52536014)(186003)(7696005)(8936002)(66476007)(64756008)(4326008)(66446008)(66556008)(9686003)(38070700005)(110136005)(33656002)(8676002)(122000001)(38100700002)(66946007)(71200400001)(86362001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fqGPtzBTWhoxF/ReCgrgwYMucqtpox+e6qUbvguSah8Eo0yO0ACCx0xpcluw?=
 =?us-ascii?Q?mWOkIySEdHYqp6ya7cax1h3nfSfu2PLq4l24OntTiuwYYV8bY1zc2a5lj1Nl?=
 =?us-ascii?Q?54e3oB8jcBdfeCJ731rF7PKrEogJZd4Rfnja4gtvWqPuMMnRjNqRZqpix9a1?=
 =?us-ascii?Q?oVKfAV7iYuNr/0KsT2AJn7p/Ij0YwF1x91e9qUujL5eh8icbtLpndvh8dBWA?=
 =?us-ascii?Q?aepCMIhJs7OpKooV+e9WUXJagF2UzfY31Xuv9e0Pqp1riId7tvRmeoGuBY4p?=
 =?us-ascii?Q?BRt+NViWVebs8gyhKUeE4ZTBKLSVLUsjnr2DFpVyQfFNL/qbCBdeQT7zIlkd?=
 =?us-ascii?Q?6GplZvKNiDw1KaVsSDAxkYr3Om7yxPSbFTQq3/WX6HWv8oAGgSFK/cTTKI+M?=
 =?us-ascii?Q?vZCIS4AgpwABmOYYnbPpgRGj740G9sfjuhtTOiHOE1xsOa8ohT/6EjeGTrd9?=
 =?us-ascii?Q?kVaZ225h6izYIzawd2k82UIguUJmgn4PpycJNLkqH8hnIIgEwKZ6YkuLqG4P?=
 =?us-ascii?Q?7V48M4Jc6dMKQDY241w/EuMlehlGXf9kG0k0DjBaDAK4BLo5rQBkjN05KkaC?=
 =?us-ascii?Q?byGMZ35Zsd1WRW7T7GppRh5lbLKMacBZKkPeihJoQly4oKxpQebqZv3W899P?=
 =?us-ascii?Q?MLARIF/HAN5L+dmWLGNMZHXf05LwUlTXaxOwXq60louBIx2yqM1OVop0gRdV?=
 =?us-ascii?Q?if7CsElxZ5Nva2HCeicKX/Q7fY6VBITAnvERynf7TeGyEqQAs/37K6r/02an?=
 =?us-ascii?Q?X9SJgA5KIcfWghb4XPf5t90vfT3nevro2uv/haxsWgKVATvwzWohF1wV+07n?=
 =?us-ascii?Q?i2cLSFHXFPULRTPu+37zAhWc0ANC2dtM4HSLAkKyBVFITyJ/UZVt0FxHB1lB?=
 =?us-ascii?Q?hctcakUkZgex8gQbZYAVPaafoySU8ASlKmy3uX7/cXyYRkne+dEUCYXSGLnx?=
 =?us-ascii?Q?BB/Jtq0+ENNdsm8At4km8XGapHb72yAPI0Bcn4VeL+Okso6T2o0fGwsuyriD?=
 =?us-ascii?Q?k7l1F514xC/bmGxkzdoTMnJ/nA5G3TVkWeofkakxHtNFmc+yrC9M4s7IIC4S?=
 =?us-ascii?Q?f4x/dmIzVDpkvlwa/+kovXweGIO4nRAImPwV1I3x0apPcJVslkPVaWNANkgF?=
 =?us-ascii?Q?dmtP/fa57u9pEsfA0cQIp1Ot2IRiIr9/WlB5aCYqxCzWgvz4NVTIYnP63qNw?=
 =?us-ascii?Q?vQJWSKIOrTcesorIbUqYgfIGFCYJ373OnRHS/Tn6Gcy2jECyGEoNYGDWqGPk?=
 =?us-ascii?Q?KNZRmFQR90C1Vz3LTx7lkW77iYBfBGcoGbCGZLRWw2gPN8c03dbliCktdtfN?=
 =?us-ascii?Q?CRfYDWOTjjn1GazWTBaXNH0Rtf2u/fQ1rFqArtqDpWV2JZUBdNFiLbvYpKA9?=
 =?us-ascii?Q?KSXCMjlhW9flVpy/wKnTC0y9ecw2Pq7hUhr9va1x+T8CfsSQ7huhZionDYR+?=
 =?us-ascii?Q?Zy8WmsrTPZY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74052f9a-0111-4db9-2df7-08d995a8dd6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 22:11:15.0514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB4833
Received-SPF: pass client-ip=40.107.95.102;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

> @@ -1392,18 +1408,18 @@ void tcg_optimize(TCGContext *s)
>                      /* Proceed with possible constant folding. */
>                      break;
>                  }
> -                if (opc =3D=3D INDEX_op_sub_i32) {
> +                switch (ctx.type) {
> +                case TCG_TYPE_I32:
>                      neg_op =3D INDEX_op_neg_i32;
>                      have_neg =3D TCG_TARGET_HAS_neg_i32;
> -                } else if (opc =3D=3D INDEX_op_sub_i64) {
> +                    break;
> +                case TCG_TYPE_I64:
>                      neg_op =3D INDEX_op_neg_i64;
>                      have_neg =3D TCG_TARGET_HAS_neg_i64;
> -                } else if (TCG_TARGET_HAS_neg_vec) {
> -                    TCGType type =3D TCGOP_VECL(op) + TCG_TYPE_V64;
> -                    unsigned vece =3D TCGOP_VECE(op);
> +                    break;
> +                default:
>                      neg_op =3D INDEX_op_neg_vec;
> -                    have_neg =3D tcg_can_emit_vec_op(neg_op, type, vece)=
 > 0;
> -                } else {
> +                    have_neg =3D tcg_can_emit_vec_op(neg_op, ctx.type,
> + TCGOP_VECE(op)) > 0;

Should we replace the 'default' here with a case for TCG_TYPE_V{64,128,256}=
 and add a new 'default' with g_assert_not_reached()?

> @@ -1457,15 +1473,19 @@ void tcg_optimize(TCGContext *s)
>                  TCGOpcode not_op;
>                  bool have_not;
>=20
> -                if (def->flags & TCG_OPF_VECTOR) {
> +                switch (ctx.type) {
> +                default:
>                      not_op =3D INDEX_op_not_vec;
>                      have_not =3D TCG_TARGET_HAS_not_vec;

And here too?

Either way,

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

