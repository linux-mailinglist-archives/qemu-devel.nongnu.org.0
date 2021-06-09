Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431283A18BB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:11:12 +0200 (CEST)
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzrL-0007ZA-2c
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeP-00056y-Da
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:49 -0400
Received: from mail-eopbgr800137.outbound.protection.outlook.com
 ([40.107.80.137]:31454 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeM-0004YC-5j
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ea5ebTcbHnQGR+EwRHxt0QjPn5NFAqPRvbuqw0mwpfCsapVN633XDvwp+xXSJH4JPJth1drWVyJ6kAMi2lvPT1amCDIDXCkZ17IHPSMrU8+Bj65ZMRiIEMksfyaRWr7mjDfL0JKA3Y28nhhELune36J8c7vjXxIhmSVdbcFUMPfr5m1tU5T7ERhrdSxTtv5t01JLDbcMk38C1mAu+KG8R3XDLl3IH0Jmdy/aqN5AfSNublOQz+0w99e1y45ZcSkajy6K+yF8Qjt/zQlf4zMeAL9YjGzL90BZAMjwRkW38yQFrarGMRj8N4iVGVSRi3QhjOi9cgXm5Gzi8mbZ4W5JXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEvPAwi9GDK+gTceTBfx7oqPu0OTfhmtUnbZ8EbGMSo=;
 b=XG7Ll3LpfkjNZF4RqOPA5vLP8e4BdfedbcFp97S2H56I3kg/9tT+mcDJHcQpdPH0a+u+Muqu+sDEuUiKWvF0PRBOFPtw8/fElrqTXBBLhNZvMk5c2UTzLr9oUCTNzrdAklvUsSGgEyOFd0twEEr9jdKPiKPMjvmq+rjORlrwfT7Q0amtlbigXBJPVl+7PTMmbg/IyzRNuWLSvLt1kx/CG52pqN8Fmrh1IidQxrGYojesURXugulK+BdrA02mqTiq6WTtFeoyIBB1dQR7iGyjWu65dAZthqJpK6+o/1TjRZ8H6QtORWv6/+0rcWAPT2TtDXQJBbb0QDbk3AoaNG2yPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEvPAwi9GDK+gTceTBfx7oqPu0OTfhmtUnbZ8EbGMSo=;
 b=nUm3/inY9MkXDgoxvFk4PF6BR+FdihyBRSANpbrYaUR1KXfKZL8VeAQhm7g+hEzYcdAq6EZC4VDVFOC6VawtFR7FTttDp/9Hape2LLlGVZMQwpCgupJHfjMCBuKfVKZm8WeX6deOSE/q1xQEoTtLON4kfWDosR5Y5cafJRRI0vaXzgz8Gc6hfIJbwPZrwC++uG3I7bbhR6VjtV80qneFly+HlQuXhfMw70QsIDr7zbXRkEgrBIgzrGRPsRpF2KfVys4TP31jsNCG5kcJV+HluKK5JpGHj6iNnF8Ta4orAoCHIij8wI2ZSQOHmZU1pjdKVOtUULOY8XBLAJvLqzD4xQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:57:43 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:57:43 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 09/28] accel/tcg: Move alloc_code_gen_buffer to
 tcg/region.c
Thread-Topic: [PATCH v3 09/28] accel/tcg: Move alloc_code_gen_buffer to
 tcg/region.c
Thread-Index: AQHXP6t9XHQ8YD6mQ0GCAPpZHswVVasL+toQ
Date: Wed, 9 Jun 2021 14:57:43 +0000
Message-ID: <CP2PR80MB3668884FA10F266583491FE6DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-10-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-10-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b31d44c-d298-48f9-578b-08d92b56efc6
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB0017B29458BADB88E8149857DA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LqrexMJpL4UtV1iJjtlIF/0Dz6x9RZUJhs9y5bjNH+imTuu/G4f9UCsdaYtQ7NYWcEkXh9Adqa72wvHoeXcc3qOfjbccEV8PL4EsSYXOyXBI9kzqFzCUjDxAVN6NIsoPc88TPHJ30WNCIuUGb4lW1fdfXaxaGnW9tY/nzBCJkt3CweFyZSZyC6fyslElCjWy0NNj4ymmofcb+MfGxc9TXsLY2uDBeJa4z06S1dEZmVnl5Kc7kEoWJAxreLCGEdPSsSVejef6+ThgpSBwQHM1Xr+WrivUm7GX8PCFGdi9IT4XZb6ubEcWxKaJor68BPSNrvZycWMa13PQUOT1qQyo8A9jsrFL6On8hdZRSJakbQF5vyFYwvoz7rhe4avBg7H83FwU6veWqE/uv4rUWYFjcZ2KQDKR7TmbxT/Mo1qF93TqogXsnShpcOhmTR+J8Sa9IusqXIobJsWmw9yslaxQ1CElK6ln52NtorYy5ivxq3Y9BpaJTPjGf0Pc6o/UYhBAlKHGnZeGYAZN5IjqdgoKpiMmArcxnZpZ2E6eRDGC5OZRPwxW12jMVU3PP/Z1JTcXGfEmvOSQ6Zyk3HxAMP5yBJc8RSBz40AdJJ8+/Y20KiQ6wYr6P5EnlYZ/rtDw5Qh8OBXB26j5GLObtS/j8TelPDYPk4RtyE/5wBnlO6TiBYp9dQxGQk9B/Cm7WplfiET+5qSpK+sGSh2Pz/bqgOLSICEp8pm+dOnhmWO2NNDf4ls=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dhDf68sSwuv03f8wAJW0Ivu/thxLqZnou5IAxbeXLnw13jtCrlQrkSnKLaOO?=
 =?us-ascii?Q?hpzDvm8TpSBR1mTf2ed2VuN3XQPn1Vz2sBncm+3N07zJG3qlfHB6i5pMIzth?=
 =?us-ascii?Q?3dEdYjgRSKJ+7yKD7aZJa75cm3/oIJuIXPdldi/436vuMvlhaxMWtM3mB3Af?=
 =?us-ascii?Q?yh7SL2CXbWhfU50yFGaKYuwjjLo2arDOOKWEMh82zkGEWOTz6phTw5YSu7Ov?=
 =?us-ascii?Q?lvExPcbGWobZrCEHWrMrU87r1LN9i1KnQp4t9Jgv+66MaDxb3/qKIwJTR0xD?=
 =?us-ascii?Q?fWj2wAjIBlJe2y7O/zAjWsVPgOfCqSKayifnayDkt+yNOyzl4OyfbcGLghgY?=
 =?us-ascii?Q?8SAvtazp/jNygizFzxZmrWa4FmTB9BCdw5qPxoFvyQpGiTdEtPmLiubLzvn7?=
 =?us-ascii?Q?hr7s/GgsahZKMkSs0J/CR79PXKgubYQ7rrOYw/aXJiKGYP/djD4BpXCfarOt?=
 =?us-ascii?Q?WwKbeUMjsChMFOh5hhxUA+Geblai2ORD2mTcb6q8tGq4gF6qOfjuKudYcFqt?=
 =?us-ascii?Q?vw1jdAMnffOOgxhRts1FHrT9pR0PYRq0tUr4KTVlccr+KOglBXk/3ydpc5Xn?=
 =?us-ascii?Q?ODH51o3pg+edF8LQFsT9VjEAEjYLPzJANkUKQdS4wjTomGxUyrvNCunHCJn5?=
 =?us-ascii?Q?MKJibgDEPfqE/rpaz42NgpmJ7fT1NbNbV0o6+ZPfkNrYDhGQy8ZjiNHj3cXE?=
 =?us-ascii?Q?/HBPXM8YNObWYEAKrrgV0AJECM1ADjqVBWcNW6EjJEyy8PCBjURLkRbWDc3T?=
 =?us-ascii?Q?vbOHDV420slxE1lH/T49QpZvtgYn5UtW33pYs9qr+VugEUSBQxB1ATH9JnI0?=
 =?us-ascii?Q?3pYjlCWJgPN4vyJyA4EKp5lgqUOve7kqbC/qDsz9ZIOjP8wHQYxvLmFJz0X2?=
 =?us-ascii?Q?ATIRALhKUUTyETQZeN80coqqqijQdBZQOvtFBErinz7goqGjrPHxHYz/UwNQ?=
 =?us-ascii?Q?cTVoAw3iBuiEL6Siul8VQHNDT6J4r7Yaf1pWsp/azvQ30kdLHJCqSjNtvRtS?=
 =?us-ascii?Q?GmPvV1KSCCF7HcWqEvVaWB1Pb2TV+7zRoBlCylCj5Zf7bHHJkt+9YURSV+Qz?=
 =?us-ascii?Q?nBWrGDUFvhFMwp6AZ4DdUFWi2hPYADrif70+gOfVeE/siDI3CfZVX7bO+QPp?=
 =?us-ascii?Q?1MJICymNaCOZ67BeOfwCHMnh5Lps8oDfy7o1WFqowL1teaZTAISSs6Ho9nxw?=
 =?us-ascii?Q?Kj4uT7xJkKL5GfayXO61wbxbGzuzc0hLPSZlf53fbEq4lN4bUlYNUsmVIYrs?=
 =?us-ascii?Q?v9Ppm7rboaVrsJYRbWLPECkyyUurm8O2qtbliUwD+p8u1rTpmQ0aEd3WuyKY?=
 =?us-ascii?Q?/KYeWbh8vY2A+X0njY6Oa/mI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b31d44c-d298-48f9-578b-08d92b56efc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:57:43.8131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JkxrRSOA0arwLVW+paXqrnRdYULuO90BG2xzP5B6HDJS8kHbqyj0BwdAeNDITaxz62jWN1ChC61tFwALrS7ytA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.80.137;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Buffer management is integral to tcg.  Do not leave the allocation to cod=
e
> outside of tcg/.  This is code movement, with further cleanups to follow.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h         |   2 +-
>  accel/tcg/translate-all.c | 414 +------------------------------------
>  tcg/region.c              | 421 +++++++++++++++++++++++++++++++++++++-
>  3 files changed, 418 insertions(+), 419 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

