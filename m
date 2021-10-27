Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D343D308
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:42:23 +0200 (CEST)
Received: from localhost ([::1]:39244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpkc-0002kZ-N3
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpgD-0008KU-13
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:37:53 -0400
Received: from mail-bn1nam07on2120.outbound.protection.outlook.com
 ([40.107.212.120]:56642 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpgB-0007fR-05
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:37:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEkppU3O7pSGEBiMRD1P0SeEuQckxlqG3u9cyvBPwSics9KBvQGOZ4uSmS/iqwUGzsPOGnCKSpjLBYthIUU4VbMSqhV/BrUN7gjB1s70JrXeWc+w5v6Vp6hWdDi6fZSVY0O99hdwus/74OsJCgajjmlnm/1mrdIDOMvMDmYKTrwEeSZL2cRD+y/kAh1obWpkhi7KDLEav3n5MIvX+XpOLFxqwJdmcnNpe9JWjCst3ElW6YcWz5H9+s7XLIQCc6TnrWUQ+ORW62+Zavg9kIuHUyC2wSOe4m/YB9R3mqIbUdfRO8nduW3ObXlNuFoPOUDRzhlke74ygXBFhORS4/YWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEYEhuhO70XC0y1PBHpPFw0kAtHp6I459xKInOQoct4=;
 b=WrIwYfpZZnHDYvlODdi/C6fVl6LND/GsAKpishi4WSPC71mQeyq6g+8sPYgwkVYwmQy/lhur0KMBqiqnQWev3T8J4PyowAW0dt7ew2F5oSrzbIF/48hvilD4UmMPuTbMlZ9/MLqDQtxB5oVtUFrrSbsoXdW1ADFq9OrE5ufMfjwZV2fW5HPBk3WQkpwvoJAgwvJVTY3g+5kd85+phfjaaRB0ncHhR5yt7fnKNrWMaia5ffgXe55aKUYuKLn/Hg0Afy0K4ZKtVKDkxbwL3Jkh3hH1V0Q/Jmxhf+yjbJLuEqA7bcn5Sj2i3ZvpLN6x6oljlieuHCncpCILfp7V7C222g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEYEhuhO70XC0y1PBHpPFw0kAtHp6I459xKInOQoct4=;
 b=ZTI783fSR4rRGFGf8PQh8/iE+kUXuAJxx6QT8i3KkP5aFo3FxJSuOjMex3bkcarHduYrYoPJviIUWnimRMkig0XXvBfP9Z7RoO+acOYmjn/LfbtzBrUddjT8olkzYLERgB7yyDNcs520XO2h5BAVO6KqL2afhnZScKJvMAxUAsCxfPaddD/3kBApO6TBCNCH0+e8LxoyXntWmxQDqK6DXzQE+02x7HWmVnbY53LTzKdWmsxsF9FCA+PCYC3j99dKVIGaZJRYWUjRmbzsXw3xN1whDjC/RTA+lmCFff2TaQTPikdUC4eQRiR6ruPHJQOkkjeGUVlTG4sLSd0NdkJ2Ew==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3572.lamprd80.prod.outlook.com (2603:10d6:102:36::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 20:37:45 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:37:45 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 45/51] tcg/optimize: Use fold_xi_to_x for div
Thread-Topic: [PATCH v4 45/51] tcg/optimize: Use fold_xi_to_x for div
Thread-Index: AQHXyr8WmYCsAfgTvk27EBYJYRVY8KvnT1Yg
Date: Wed, 27 Oct 2021 20:37:44 +0000
Message-ID: <CPXPR80MB5224860B7338838D201D9C82DA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-46-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-46-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc8a040f-89b3-4370-b2ef-08d99989a1a5
x-ms-traffictypediagnostic: CP2PR80MB3572:
x-microsoft-antispam-prvs: <CP2PR80MB35722585BE1586AA2E5E8AC3DA859@CP2PR80MB3572.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iLfuwfD7pmFKUcZ1ae3OUU9fkiPqEt6i8BZxbKbUUwmf9E+sKmHxPT+3vJrCZ6o8NjdIvyR5JxjTSwIn9uN999nsWTB1piBvvgZpD/gwHu9GvrQR1SCcoEDeyM7R0sJoev0UVujfYlbNBiJn4V0VcRXtkk90RrmMems1ePp3v0dEe/9zFeXbSld2Bzf0fF1uIwRd55n0+6JtiilqQqHOirUqi0J61omflz2VMxtfqAia+51pRPrwzZnmySWU828SxYIdh7uhUIesvxd35EMLRGuTpFxWRez214S/dpS/HGfyWGRfo1Iy5csumaExoULBDU5S2wL+SE0iAh2JtEDtzSGhMt/huuV/ffYcqQMlwnMP/u9dK8tKolDnh6TclAeTNGW+Uh5o6L55vfazhMBYulyvGHZKrNt9+Gx0IANUfIpk+oGAUF2GFZcy7/yP8MBod7iiYxZkHCX6m8tux0QCgRv03VDlR/ZAvqqO9nk0fUtnzv1T6bBEo9HkPZZHm+/OGLHsmtaOA5kVkVMp1icr/memKia/+5wKLdcji3/YzPRj8k2pK7mAh3eDdRY7rvI/OlKIkjqTadiRGEjbSahPNzh+bBT+YkChgFxN5rkLnA9qSlD0Iy0jo86G8CFqeFuk/AIC5fvdbg7O2zn/BC2KQsD4rEw2VF4aP0n57GJYnGjI01BBOGBXRWH5h2/+eIfvWmIPUiKdHA+yq7Pw5jBE1zJdSyaLHzbJESJyqleJ2owtpAUWzLuV8/GrgDhgWLvmD+m26/gonrWde6K3Fyv6BIah+jheZRo4V6NurAjED3c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7696005)(316002)(52536014)(110136005)(186003)(54906003)(5660300002)(33656002)(26005)(86362001)(2906002)(9686003)(55016002)(508600001)(83380400001)(4744005)(71200400001)(64756008)(76116006)(8936002)(4326008)(66946007)(122000001)(6506007)(38100700002)(66476007)(8676002)(38070700005)(66556008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F0BmknbDjpFtx9qy0EPX5CgfiS8xS7Sv1zIByZTdYwuvmMbupK+ZfhH5Eccd?=
 =?us-ascii?Q?wdx7UCE57jSSRBwamCP+A+sxTVlF6iCd3HPMNloEwPqozMS1LxFIJcp1bPZv?=
 =?us-ascii?Q?vyeqxPgzGTfE9uEi4v+aAlNiIpLN7urqguE7mvfQq7+8g0S03NG/YYtSHKja?=
 =?us-ascii?Q?P/SYC1dg0WhR2KokvY9EEeCsep4bWkVTcGG1HoG0U6hUrOm1CKw2Wp0lC81N?=
 =?us-ascii?Q?fuqelCE2OEkZ6kBn3O4jGwQ5SnutAoF9lraIH/yCnAx4K4EBW97q/QzV1ibY?=
 =?us-ascii?Q?q8aGbK3O8RBvFVS0daTxxp8rAlCGCXw2CK7zc+bvPqW0MH8a9EihUlkBpl1A?=
 =?us-ascii?Q?Tjh14kil6b/u4fTBoYBtWylJjcOkVNn9qTCqDbY3nLbzZjuCzq0vDbeA9FN0?=
 =?us-ascii?Q?M/GGm+oF6Ho+mx15Yf7dyu945mnjpIq1P7ujsJfO5XD5DMKQhzK6yKeQEBqU?=
 =?us-ascii?Q?zESpIIoy/q53aKgW8nfHu1IvhwWOXxvd1DAc0OyufxK3kwsMdPIWmZojp00y?=
 =?us-ascii?Q?eDLeK5i70FwTE8ZzmJoCCL4lG6EL8AKoUovfk7ZevDJhRKHIL6WAHG6YZrJu?=
 =?us-ascii?Q?MAOgdumESsYp69AJH3chogs8qUlMRQsFSnMVFGX5ffS3ihR/tvgNe+8R7Wx8?=
 =?us-ascii?Q?+h0CrQ6uFom1CviW+PBJmYpLn1FPWIOK3LQ49mxMLbGqb5LgGCTCVroRq2G4?=
 =?us-ascii?Q?raQb9qlBS0+4/PvWUIyHHN7wjMq0cHSe2d+Ug4bJmb/41Tod/YRZ0TZ7FmYU?=
 =?us-ascii?Q?6S1tY3hR6t1vEnyG0Al9BkctBGvSrQ4RGZyndFfYOnjz0qZy/GSdbmjrNb0A?=
 =?us-ascii?Q?GSbif+7waQELhrgYGWfEKuCfUf84DuxWTEUZGgbbW54b5AYjlxyBYlZrF3kH?=
 =?us-ascii?Q?slVWFx2hjo60rG0JR7nw/3Zd+sN/J4CXwURJ038BVghsb36qDPvLQPkRO2qf?=
 =?us-ascii?Q?2Q6ohIEjNGvTYPHYiFOU6iRLvECtWa/yfsDDwtFJFR3+06tNzg8R1/LKYLh8?=
 =?us-ascii?Q?0kW4vS9i4OiUyfZxu4b6Z3mlDIwe+Co+L3RfdueBg5nXBpp7tM7WChwKZOqz?=
 =?us-ascii?Q?nOSpEu8xdgfyR41tlWD+S6rSSf1jFBmZ9lGY8hTJeleoRhE5boLqjSHtWz7N?=
 =?us-ascii?Q?Y74K28MJht1iuP9Fk/By9mK8VXhgZXfQVZlgZtWeaGJJMIlrefvl8XQeW8sG?=
 =?us-ascii?Q?YM+iE1KiJzc/WTd3TRPoty/HfSpWiyNCE/7TSad21bLMbAY0wjwrN9WP9LCr?=
 =?us-ascii?Q?mg2sQ3QJHxLq54Z0EFeh0brBpjud6S15nf2AQW1WSUvESsosFzgzyBPG1DMy?=
 =?us-ascii?Q?Cuv5xvMw/9Fq8loq8jJ+JdFAx1Pi3YPSTzcf+Rt1zc9bsD+2DdyJMKV56rGi?=
 =?us-ascii?Q?dbIlQVlglM0/GTHhK8D0XU5TbQtwX9X4gg9lgKG5FjVpxdM+rKy8g+l9ysXx?=
 =?us-ascii?Q?YKwhXDKUQdd69/XPrpRiiolzLM676NWUtJsU14tbDK+1vVlmFcBip22aehW6?=
 =?us-ascii?Q?Oy/khIlesw9iAFFTIdNjx0Q7WmTGfEQsXBRS/EBr8xF62WdiisJrch6NYs3V?=
 =?us-ascii?Q?5TOIK12dYHqRybfaIlufJQ2gBfI7ftrMzTmWh3/ZuWYfqKO02w08IlS07e/U?=
 =?us-ascii?Q?Z5mFb8pQWLG0ito+9IbA+vU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8a040f-89b3-4370-b2ef-08d99989a1a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:37:44.9826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3kZlJDJmz6WmaDXkzo911rl+/4vlT/Jbzs9PHJiFIQ4pIzjksN6g9aEaXpn8J2PFNJGNwdRD1SXP1hXB2jk1hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3572
Received-SPF: pass client-ip=40.107.212.120;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
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
> Recognize the identity function for division.
>=20
> Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

