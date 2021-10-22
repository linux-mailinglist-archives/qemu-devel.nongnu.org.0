Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D2C437C0B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:38:10 +0200 (CEST)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdyUb-0006RR-QA
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyQb-0003xV-KF
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:34:01 -0400
Received: from mail-eopbgr820137.outbound.protection.outlook.com
 ([40.107.82.137]:31073 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyQZ-0006sz-Nk
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:34:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXauUWkCtC7T4OYjFM7SYOER0gEBLSJcbgx9wv4NdUZXwJRoUNsq/AleJ5slZHcEalKy3nr275e0my2rIuE8Oxac+1P6149fN2p4sh5iDu8qmLsYcPUfDKgRuYSRzInaBrJbVp0GJQWGO0vOM0txs14mkHGUmSWoPJHAt+IGOJsxVxnOwwYMJeBGuxYGa8dZn2g7TwzbtdI/6ItY+Q4Ni9TRyf8uaAIYJ+Y1gUjkDmBI5oj/iy3GTy9VYmrVxQ8o0zP8XzjwmPoBRDl7uSD9r1AzuxGcDtY7QhRsDR3b6YR6nzi2rwROrAx2XfNkONyXKAXlQNwlmiBKqLc35WBiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnSJe7hgnYAScf2Ri3lJQVGFTEeAaboEK/hNoOCzTso=;
 b=AynSD9s/n7UczHy7dQqajVM2qvoENphyYVaFjADbgtXXQktKvv4OfBA8bQO65pRZQaBoLqrwFpqx47xknDIHmxOz5Pieu5n8aOeZrRhPh+LAiXh+/X6LH+xk+5oX4/jWwPiIhpQdDSQ++4d6UCl3DRGDfZMvt9t4YJs7L9IXJmj8tJv0MVVHsxx8jD3jWY1S12Q3GyAStQhakO70qYA+5eFhGFhbZvQkT3GnRE7HhTjYvoWs/U3ESu+bHnS/NzCPEHwRN59XVfIclXvLb344tGJQ+bRqTDlI5gUDeAOfK2O0RggUnp86f3OPrVYZGrILHA2GMXvb1w3G8hEhAvdRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnSJe7hgnYAScf2Ri3lJQVGFTEeAaboEK/hNoOCzTso=;
 b=DBOA3RiKREW6WDkzfslfZZ0l0q9cXrTjNe+UMHDt9t0Uvu0X0tE+zjJZFQdFNmK2I0Kr7qLPxy2Y8g0rBRbI3P8hVD6S9EgakeQoQ4sRvYihCIo0G/LEgj68bFrb9JHpxkd2Qx3Gdu29BoTV4ztA1I20lC2+is391t+rXIqB3G1zEDGWcynYGdqmBetIvIMX29IDl0PC1PST2U9LLDuyGn189dYGikluCrAG9a4epEhfUYE/cn9e8ojk72ZGTpgST9Yt3waMYCKdio1T4XZKEmxu2NCuh6+kc9PMhFxAKm8xRX0RY1PKcfa4SV1wPCRCuJTwe3wrRZj3/g8cGXa/Aw==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3924.lamprd80.prod.outlook.com (2603:10d6:102:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 17:33:57 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:33:57 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 21/48] tcg/optimize: Split out fold_addsub2_i32
Thread-Topic: [PATCH v3 21/48] tcg/optimize: Split out fold_addsub2_i32
Thread-Index: AQHXxr9yGJCf5JDnH0OmOGGRlKfoBKvfSFFg
Date: Fri, 22 Oct 2021 17:33:56 +0000
Message-ID: <CPXPR80MB52241F42671A1F21F23750DBDA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-22-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-22-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f8e7997-cff4-4b0d-dae1-08d995822059
x-ms-traffictypediagnostic: CP2PR80MB3924:
x-microsoft-antispam-prvs: <CP2PR80MB3924111806F64604EA159FD8DA809@CP2PR80MB3924.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CDyPV54Z4z9KDynICfnyG84YuRNwZ/+goTBf0H0++wYEi0J5A4YFnIZb3eEEGFOnL0HJaaUhIMxa5xCcM1+2b88xV1sEX/Ds+rNqCqvZgdcyMHxYERW+oFdaYMhSajPJJPqVqVW+CGr2EvqP0fXIYiK7TTpuONx3qeHR8jmZUtt1kmRmkLt0aHGJhRffKYR0PTnUMWv95QtEWrTHLiUfqXju2Lx//2ckQ6TiZzh48qWdPxGM2XzPxyPZH6fyXcf+Cf+mSMdNnB/wf4BooGqklu1keoB3LymtfMtzBY+j+fUBM7pcSdJ4lZ4iAkONM5OlAWA2Sh3jjW8oLdqY1kH5YQuXnYs2Pzx9hI4VwXSIOPnX0m+OdGmUVNIQbsumYFWNu6qCDDkGb5Q4I8MDg+gMtJqfeB1WpFWzoTcLkUSa6OVA7AgQY3D8VTc5OlG6bJmkKvLUI6w546shb9gzjy/Cejpv3Xobs8bQ+CWYBw3sRmw3ucpGzAL/is4aIdMdS6Vok3RxMQZiM/6fQy4afjd7OFs2Vz/gw1uDm14ecTcobkAVdl7erUSjFhkUzSsypBxsXZCy4JhGMXCyxcdUBS01ttQEe71FXwoj0x39zXH+oI/iF/oXj7aWOaJ/LHpOg4A5izhAvuW93CHcU2RN+1KXr7PJzdrs2Ra+z6W4j7sTHLU0SdKExo7MUWH/BNs3rKppw5UivTyiesvze+fvdXpRz+CNkSY1r+fNYPezTrAxhD4NGkwUvxqFt+E2nwDugotE0YfMd88avT5DNUFJ7LYv0zfGZshwjH92oI63SJ44cCU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4326008)(186003)(66476007)(52536014)(4744005)(66556008)(66446008)(316002)(71200400001)(9686003)(33656002)(86362001)(83380400001)(64756008)(76116006)(55016002)(8936002)(5660300002)(2906002)(110136005)(38100700002)(66946007)(26005)(6506007)(122000001)(508600001)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HAaHYcOgUCCiTqmT6VLYIP48uOe3s1m1g/hwmYHR80RMQgCOjh8S0wfQtnWU?=
 =?us-ascii?Q?g1GqkN4Ve2zt3Im+y5wMrdfasiXmEYgMImf18rxO7CJQoyIHgB0szHjXF2CF?=
 =?us-ascii?Q?kz5xC6rJNwiUPYA98gU0xAcfS9ZZmlloKSd1fo+aZZptISTh0mvS64i4rA2w?=
 =?us-ascii?Q?Hxcz7L4fXLj7gslAvRmM5tYj6osAO+pgd9nR6VFcuhvlcmsv8D1hA2PabBiP?=
 =?us-ascii?Q?tK19Mm+vrjDmQ4GiJBePom3vqWgVbLmfXRWw4HoIF/Jc3Co3IVAPo/hz9TLP?=
 =?us-ascii?Q?Z/SVVM+x4fJGTPVcix3kPfUXcYM2B+8aeB+8KY1l4yAIIt6jcaRyGLJQ+Kt7?=
 =?us-ascii?Q?bwLj1br+2Sb+copm7IQPF1/rC/gx3mPmSdr/1ixyfo5s6aQnTd2uED6O0Q3D?=
 =?us-ascii?Q?yuMiS641wm/zZA1pd5vBncL24T3SVmRQTqWnOYz+/KGVQRU/Bbr3mFxP7NDa?=
 =?us-ascii?Q?CCYBDuZwom1k+7FiQQImDlRDttjPEr+Y+cXqiLxOOcbazdXQIcgBMfg9Yt7F?=
 =?us-ascii?Q?+LtGGR5vu2fEnVTOSOAfs6TeIiG+Of0GlvDP9IJWZz4gMrYvVcuxqYlryPBb?=
 =?us-ascii?Q?7+7lPeUEHmlfXZ0L7SWk/2rk+AxEN42vVbrUIWg2JjbaDtqsfQnwuB+Zwy6M?=
 =?us-ascii?Q?JlMkvdHTUaGIHy++l/yxPNCvZjeNE3dxXauc/7OXWi5u244GvkrU1AGxjJ7C?=
 =?us-ascii?Q?/szFiID9IA61UzFT5F7xxVTzluCX+PlhM7KU/L5SooC3qVt8/jSziI/6OInL?=
 =?us-ascii?Q?dHHmpZqq/JxfIibHRiJmewKcfQeDqpjMv/sbDsR5F8eMM9odln2z9MDj2kzl?=
 =?us-ascii?Q?DEsfM+Td3gPp1s2PQDxI/q2yfD8U5lapfe/HyKKDqPu7BsF8+S3ljXr/tHPN?=
 =?us-ascii?Q?mJ25y4AQSeqFSJkYJ8KdXVpWI99e+cTJYkT6vEWsveCsMDnZC32fuByLm/PL?=
 =?us-ascii?Q?fGu3v7+fP+bf4HsB5V6ILt81IzyvKu/HuurEChpylKR6QEZgKw1kQFTywTt9?=
 =?us-ascii?Q?wf05mdz6Hyvxmh/M5Pc1comuT8BRAPqR/dJUH5disPRiZ2t/qOwpHV8o/CiX?=
 =?us-ascii?Q?maAxQUNZbBYvKqS2h91Ho0RyoIs0B+zhdvj4IYSLJpfgUzV1GXsaQzwzGOEs?=
 =?us-ascii?Q?KpceP9bT92Mzahu0OVLBrpDKBd1G8evFFad6ZPghGL7TLBu2gGvJdDWkp88U?=
 =?us-ascii?Q?SNBNh5zIHOLIv3HW+eUPgsOUuA7h6H99hgAt7Wlmvr7Q8QZ48OkyQhSoxyjB?=
 =?us-ascii?Q?LDV3IMRAGeYukAMNXsXpXhHUL5DthuHt/PzQfhob+8Saqqa8W9Wq0bI5b/PW?=
 =?us-ascii?Q?6oZeyHg7FRL1/2n7txcJm5xdoomJDSiJKN7sAs/ukE0mKlbVjS5vIQPdEtSt?=
 =?us-ascii?Q?oyL11MyOyBNFfY0qPnj7IBbtApyWOLNpWzk1dAEYLUCKLg7bVu4qJ4jd3VTz?=
 =?us-ascii?Q?JHAHbGqn3Tc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8e7997-cff4-4b0d-dae1-08d995822059
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:33:56.9923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3924
Received-SPF: pass client-ip=40.107.82.137;
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
> Add two additional helpers, fold_add2_i32 and fold_sub2_i32 which will no=
t be
> simple wrappers forever.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 70 +++++++++++++++++++++++++++++++-------------------
>  1 file changed, 44 insertions(+), 26 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

