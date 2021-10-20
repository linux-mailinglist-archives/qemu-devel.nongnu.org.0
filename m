Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFD8435602
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:41:20 +0200 (CEST)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKGu-00010e-13
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3p-0002lg-Dh
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:49 -0400
Received: from mail-eopbgr740135.outbound.protection.outlook.com
 ([40.107.74.135]:53168 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3i-0006qY-Em
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Svvl47ymKNkkhVpF0EyqLQ5NfIz3T6eWR6t/yGm3RlRfzrUf3jA8moXbgSnOw/NGmQ45Ky6eqy8oAaC4gb1ap0wi+pdAq3IaQHm7St4WrLO4XXO2KU7bMHsijXojDJublbhwLMXSipRYl7e/Dj63B9mPFLahJrQy8tmuS/Ehibwxw/weiPjrIvrV/ww3BU0/1vIIpLkC7SchpTjuqFuL7vgfqkPHlKrJnU9q0zQ5vsBq2q34GG2850USpB4Q5tBbPftyyx1/uYGd8IS41yTTG8Bpj9R+LHfyV7PdHFc1pq+tbQKHvB5cgscOiSszWdE9+QYEWUDAIEdWPpYF65lBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s3SZN94PS+w2cLLQvNngB4r+CTZHBbezbGiZTae+gQ=;
 b=WphLNBzTtUw149vRY2Ty/ss2phcUCkgsIx0m4CWz+vpWBLsZKt02IB7aF7kblBoCcmHgntjdmzxUmTovPtl75XYWgF3YCSsLA6o64KauHB6poIrgRMEdRf6Ol9OxxchREX6iOqJhFFrG5iXan062yf1KFnvWgoNu+s0Dncw49yLXo/x6R6IMQMgW/AdQMenO0gMjNV9XUS+TkzUObNXEgd90WxziAVL8dwTSzkR8d03Eaw4J61OGfhfgWx9U4Ffdk7ILcLIj7W9bhP0+D+cu91dPwE4I2HqsMHivs+qrgejkoATbDmuJB8EA7CueAqjJf3ZLM2DVNhfCwU1VtUcaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s3SZN94PS+w2cLLQvNngB4r+CTZHBbezbGiZTae+gQ=;
 b=v4OZ24M+T/VvGeABkpXPaa61ziFHDnbcaGdGG1jSxJiHyBKvm6kejKEa1CTiqzwyjevwQGbfcfnn0Ftb+lDB0czFPaX12i99hqpEfvtCLhwZcVnx+jnVCkTaxruDjSoysDxk6CyliJ8DaQb6yYNOI6GQ0V07oUz7vIXs/3QahWfgIP/s8KbxBjwWMBFvDaZ3e8TZg/HmuPWBmabM1B86L2IhyRX1h3odWetpEQywu9vYd/WLsJN/rUpmk61hELsNLed08FQgeqjxsuJebzGxENyge+YFO4WRHf+agOaDvF4awBskUko6Dl/s8DySIk58Lw3pKwdxzKTUZ4AZlxuHvg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:27:23 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:23 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 12/48] tcg/optimize: Split out finish_folding
Thread-Topic: [PATCH v2 12/48] tcg/optimize: Split out finish_folding
Thread-Index: AQHXu7lQChLyjRFp6kinjU55/Dd8jqvchtvg
Date: Wed, 20 Oct 2021 22:27:23 +0000
Message-ID: <CPXPR80MB522485BEF94CEB3E39988006DABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-13-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-13-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb2ba2d2-4cb9-4d6f-1fc3-08d99418c9fe
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB44829068B38FB23B004A7BB8DABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aZi+zrXn4t3NOw9bkpXwGyHumUFrCU9is1tJAwzpEdA4gocXM80ECQ9RMRYhPJfMMWFqdvmG8ZkbQjGy7Iot1luF9VspFcY6vR0jOrKqGYDlc15ZnI37nllWPelKrdMOHQGd5C44bet6MEr3wY6W9ozBYl6lLKBVZ2r6PIzWT6v4izujgyAzqcH2J7Jqdoh7kghCHrCenYBqiTFRfD5EQNtoIAk1F9jKGxXbN2TuqN2ACYkAXweBKWVLmpmMoP3Zn2bro862q2LW0O4fM24X2nGGRnzrpGJdpjbAKDaqP+DPHwqf6LNCxVXPPyCYdwu6XRAI144lb3bsRZy2oxRBUj0GPLuCM8d1ABYq8C71iiJyTctw9eGy/1oTW8zjTdixDsY1Xbg80L6DF+fvFHwq0A7h5FAUdhzWk3eK3ZZ3k21cyhDhVNCFEV83GW0pgPa9vaF/a+Wr2NUpbe5la+YQwlFYMjKSnKeBnsAxW0TJCy9SJd7R0NBPfQ7Ek0PNbaoMovp6TicQ2LfHpG8+ysWi7gqnzxpA9RUrTiVZykbC0OYjDpAUmaX2TEJugFm8JPZxrSRTbHWYW1i2dhhqIA7XR26coBnbfc8cbz8KkXeoKI2oqM1srfRDbN5zDCYmrrpRZtQDVN+8QCd/AVgTaeVsSI7GWETol6HLizJtARWy/z8ywh8CUojnjx4FVDTXTGgv+JczdzxNhDqF5rvOaLJUYl/S1dmNQDCnvp0oorepIdUnIznqoqNCdwOXu3x0U0h8Csy0mNvK0et0WdGghChBY4Mm5ymFgzAT5yV76ee36vc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U9ht3soFdpbLT9lA3smh2IRVb4CNQkfhZE8urohWsDNyo8r61HEoVHcQ37yx?=
 =?us-ascii?Q?w++bmkhOSHTDrpP2SQQ4S6gl76fCBJftrizvhON+vEMuj5PEc24SOaUtesFM?=
 =?us-ascii?Q?Yogd2jSYjGCYI85i0VYmimvZPD9jZgOumyLrs+cB5ILIJf2S8CoPtt81czJ9?=
 =?us-ascii?Q?i/lbEoQSBwab2ptqW5W6gwuyTm9uSBmr2hHoMvHvUJYcrcNBlf9ky4dJ2JiS?=
 =?us-ascii?Q?+jXHacFRBoZeqi45aoUyXyHgu1jhddXDnARw8uxMLWh/0vdXEwCYXf3NKKJT?=
 =?us-ascii?Q?b1zC8KyARgOc+W7YUgO0gAPSODnOZ55YqiyBnG1L91sHF4plgoIXjHFMJ+Dc?=
 =?us-ascii?Q?PSYLgGUWgEKpCooZQKvpBx0bTiobf96Gn9JI3iPj99KEfIjVEDKqzNB8vd7A?=
 =?us-ascii?Q?Qqx8/btpjmvjI/fX3+ihTMsE7ui9HpgQlSEJ+X1HSwZakJDmJZS4ouhxywHO?=
 =?us-ascii?Q?wMImwxcX2PC8laF7FdZx0tF7N2lGcW6P2TSRfK2fftoUV/D0WYQnbluVIF73?=
 =?us-ascii?Q?NKlKY0KCR4BtJSvBLeS/LPOzuLMLCjqhbYHY50eHsUsnchs4rPcdMjAFlCIB?=
 =?us-ascii?Q?qMmVv95pSSoLq1fBIaWNjxIQ93k7+Swnnx755pXxUgbJh8lR9yK5NkMy4ZaM?=
 =?us-ascii?Q?Ql3mYlsI6hniLCOQY8lQhAhqtOCGVtzg2OFhcKF7eg0ORXhzSqr4cP0Y7Msm?=
 =?us-ascii?Q?qaNeKMSwES7TjyjhED3RAgfc5G9i5ssyRn5TIlda2IajD9zzokGit+Kfzh0L?=
 =?us-ascii?Q?z92cGHCcLIKNskNyd2rmsmr7XYTNlVMF6Y76RdCvb4uGSjM3B0oeb2Q0sjf8?=
 =?us-ascii?Q?tedBWAC1iM2KrNC12EwXQJf4TfXhGylsC4Mjjz8zJz8wOSXmVeOkMl464T1u?=
 =?us-ascii?Q?qrHXeODacSj5k976hCJvBeZSC83jnTmhafxj1UBzgmxR5SXyfZgB1ttqknry?=
 =?us-ascii?Q?cYSTJZOAIQrKRw8Hb3e5/oSqmpOeh+MiKINc8Ls+Irl13eZvwKJ7+8qxuzzM?=
 =?us-ascii?Q?NgYRDDfZfX24hWf2JP50Hnv0c2xu9KnvQZkwcjUPNNsLL7QcNmfJXvQL6iLD?=
 =?us-ascii?Q?bBZgUSMh0Q3BBEZJ7XqPptJ0vjPmokHtonhyUwB+Xm5dbuMXTvKxNarppZ7W?=
 =?us-ascii?Q?aU0odBXejd1tHR0ccpb6MF0r/4JDVMKytotmjcpK0+7xemaNWDu01JS0CW2w?=
 =?us-ascii?Q?99hssUR+ESI+yCuBuf6rPwObK1G/3b4OttNDvQzJMOvL6K+KK/wtr0n+XgpW?=
 =?us-ascii?Q?IuCUMUyz5dPcllBP9Fw4Em2rtTolZxdbs8/NoDv6tn8TWEEE3wBolrmXO5Z8?=
 =?us-ascii?Q?H1JEttGupeoJI15Qy17QTT1G?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2ba2d2-4cb9-4d6f-1fc3-08d99418c9fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:23.7157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Copy z_mask into OptContext, for writeback to the first output within the=
 new
> function.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 49 +++++++++++++++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 16 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

