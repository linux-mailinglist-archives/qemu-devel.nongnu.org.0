Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1A13A191B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:18:54 +0200 (CEST)
Received: from localhost ([::1]:56378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzyn-00042Y-Dm
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfL-0006r8-Cs
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:47 -0400
Received: from mail-eopbgr820130.outbound.protection.outlook.com
 ([40.107.82.130]:47388 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfJ-0005Et-Na
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3JZ2hb/Rcz7LaAZCWGhzaHta24D3cq5DmTn1HXRmdCTCzHouub247LO+xegaEg8gDB71tRdBS8ZasXkaXJnMNNKMMh27uNE1IeJoH0A66QXu+7MQqHvEcS9Gn3Gy/+wLyRA5LDJLjVGsfL4GbdXnogqFQIlXIVVPMfIcvrd9RdNus/mBTYd8iyodvU6pSO2VkjvdXzujuPkKAzX3G+ACpuARKatmMPlcbHdt2uvnS8fCAWur197LbOSclM1Ku5hT5uuYkstcmqEVKnO0gw10SKHDluG7df53Yq+ONcSqcHtZybwW/NdV007dLBFjJzzo0PGdi7RelJuEHcKV7Maow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saoQEzl3hJoxAxjdAFcthxzeM7gpI8Uldjr8019evNU=;
 b=QWsDnSVHtWggTZcAlrt3UH7j5J0OfJ9qymU4QmCM0u05i7Denq0wa+LmnH5TRXiSBDt6h9m6c4GQhRk/a4YBlMsNt1lWDR7Nf6crC5kawz4/TPji4F4qoktXKoHSzA9mvB9521nH5uEl0L6+HBAJbaKgIqzTF9uay9tXoywIXPpDwh5rfblL2lQrWPmDstYcS+lXbs9dfc0x2bfuvI8ewEvhPCg3nMHmbhTZdUDrFQ5Uz4lqX5LHv4MuwG+pAX3yJ85AlhebEzIYKxuKxerPTupTi/Z32xhiLNJd0PlrnGWxezs34rPpW91GDfGN10oWQw2tGkEfWjmLoZ+zh7gdJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saoQEzl3hJoxAxjdAFcthxzeM7gpI8Uldjr8019evNU=;
 b=TBwxkCTezZzPGc6iB6EPxcvAXhLEweU0Ht64BnUNFYjVs8TcLOgwAJd/Nz3LmQX1dVdv/7hxE7owERnDE0tULXMvf8xnkwoJqknukRD4sEQOwD9sz/IAnwj1ed3h4RquxbwG0hpb2RKF82CBmcpWknA05IGtaoJfgqc2bM7yYU9j5nii5e9VMspgDUfdlc1nO93olkhRTiqBbtNXYIkXfQyH1sF4+5ofdbDb1PelWW8QMccfL3uvUJIfQIyjuaQmhau8bXtaVkOgA8UKZxoihUFG51eA53Sob9aO8Gso7kZcM/gQfwZ/eIj4qcOjYIL6OBmZPnapBLfxIIYjf1WOfQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4484.lamprd80.prod.outlook.com (2603:10d6:102:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Wed, 9 Jun
 2021 14:58:43 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:58:43 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 18/28] tcg: Tidy tcg_n_regions
Thread-Topic: [PATCH v3 18/28] tcg: Tidy tcg_n_regions
Thread-Index: AQHXP6y3cesGzG2j0UiBGB9gmRMg6KsL/HcA
Date: Wed, 9 Jun 2021 14:58:43 +0000
Message-ID: <CP2PR80MB3668A3B5B61F3438BF19467CDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-19-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-19-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed98c216-cea2-4737-f702-08d92b571330
x-ms-traffictypediagnostic: CP2PR80MB4484:
x-microsoft-antispam-prvs: <CP2PR80MB4484E97F8098174A752692B5DA369@CP2PR80MB4484.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fo7n9RLnlzWBT+c5c+uP9y7JVwMYXRQIw8aG2Zhps2DAtNles8/x1uakTJkfPRTwyEjQ/Kby9RrNumPySms2r0s4uFFOLJBxP/H44op8isIQenLvIyhY5wZIWJxHG/lL/7PjZEYFc0gd1at4YVCC/hjQW7CNbRJ85cA6eGvv31JBDJvrTpkQN7oN5jH7HWyTRKX8qz9HRZ2FRPdnbEodCz0nVgkbJUJBj5f7pjdYnLTmExMwPTR/OQSjHHJNHmmdI1UpiNP3l4CnePnWoZ04eaUlpDoKFYK8/dr5BdZmoB6SDkAR9NiD26y0mVFXrphhug3slsolYttJzhcg2dK74g+T03z0lcl9kpRyrbv5dd0MndFMwF+obra3YPeI3D7RQEYXBuHskFXcn8GJN5H5Um1PAIkQg4VJ8aAIUW9SAHjUpPDLmKYwHdgq7kJiaUqYhIdYRehfLe6QmPVCsC/C/hs3VtY6fDVm4Mjv9lcCiK7uA5X8FyuBg+dmedmjWDo+0RAPXye9yKI57uz1FJm+w8CkKDeyVVSq75HVT2eG0uKQM7ZizLD6/gcCKF9Y2u/jjw787bHm0e1K2x4mSeXvHHdpEpkzPEDmpOxhuJhJwkQd5UMjgeKWIHIN0v68l2OHK3yEA2h9wCTE736YwwF5LPF6QL6yE1ik3WjgiD79IM22DAQQzTpcuBRfuUgzm4x4Kny3LSBhoiXz4MtbM56k/TX0Q4lwYeOLfMWG8sOQXmQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(136003)(376002)(39840400004)(6506007)(7696005)(110136005)(26005)(2906002)(186003)(316002)(38100700002)(76116006)(478600001)(9686003)(64756008)(66476007)(122000001)(55016002)(66556008)(71200400001)(66946007)(8936002)(8676002)(52536014)(5660300002)(83380400001)(33656002)(66446008)(4744005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?eMFMuySy4z3Jm81mHGB5S9dEX92gAwBF9ZxF1RgNohf7sbOjSUiXkqhD5CNd?=
 =?us-ascii?Q?pgd6esCEyM0XQZ5VDas4/Wq8JWjt/cFAn0lFx46yBFVCrGL6asvW7Qlj891d?=
 =?us-ascii?Q?gKDfK95vd7UWyGGBwl1KM0WXHMv7TNtvuozMwZ1aGfhnkKFbTTw+E9AsACEO?=
 =?us-ascii?Q?eJ7SW+H/CnDLtv7VP0CN2xw8pF4WkmziL0tjXIgF7eBjvAX7SZqFgMBF4/GY?=
 =?us-ascii?Q?SWkBH+h1y4R/qj9F5Mcp/7843QG+j37n6n/XvxxkGs8NrtL3DL/YVJmqM3Wt?=
 =?us-ascii?Q?Iv6LedVdY+tcz5dnm2HUVf8p7hpw9QPqEqCcfJmdP4FxUuIUl8yNtd122UOt?=
 =?us-ascii?Q?jnpQZyj/VY64xDlG8PfSWuj8SbxDusxx1iwJBKYgwd2fS7msnHx9rRgJ3UxB?=
 =?us-ascii?Q?9aq3wELgeW9IfcFP6JNErpTGnbbCxUGxLOk+JxVdry+e1xaKOIXL4F23GRv+?=
 =?us-ascii?Q?bs4BdaX1QgJhKYP2Ld31Dn5ICbKDDkUK/i2PmJgtYSkWgaTc8UD+AV19H8db?=
 =?us-ascii?Q?xVMwAoLuUNBJGiW5X6z6gkQpGEsaCU5+VWacm3UMj6qvCOw3pGzkjP7gLM00?=
 =?us-ascii?Q?2Hu6UvBMpr17JyO/td3KvEPmVkg3PrQ5RzwNyusrUcrKEGbhuBZDr9Ug7ARq?=
 =?us-ascii?Q?41PO6BgTurNHZ7M2LebfWXAJUidv2ChKnidU7A8WIxuYOoxKfRLtPtib5OYb?=
 =?us-ascii?Q?ORkfh6ffdjc9sON2ZbzeV9KF8seP9hRpo9TXw6qC7q8T8WtXacGR9ORjhJaG?=
 =?us-ascii?Q?RSc9lDUJVvviYHgH+wQ1E50ql8PruD5NqqERcMhzP/7qgWRhusVmhZZQN31q?=
 =?us-ascii?Q?06dZyxjGAaTJ5xPfSUQ7nOmUgnv3AdfYcmov3ulb/MMIwIRN+dXKIk69GrlQ?=
 =?us-ascii?Q?NtrUxroB7yTtTTYVaLg7pMenQlftICsteL4SXYaZBql/RkvF4Qg4ZDUFNVph?=
 =?us-ascii?Q?4FhIQn6dQYuzFEzrha/q99zCI1vvDH+UZX2LOZHbpiOHtpbfyu4PXnl4pJPV?=
 =?us-ascii?Q?wrsPGnKXhDr7EBehl4YHFPZHsHHBciSJgkPw8QR27aC39Qwg+ujkSC6Hb8tB?=
 =?us-ascii?Q?H4d8VGzVK9uzGcp/VM2IDCg6NX2moNb4utWi2XSzyFfnqElJ5WDDB/6DJ4He?=
 =?us-ascii?Q?RCe+dbNhqtEYbXuyUg1H1x9Evj0VBy7CSXa+50EHejYRPI53x+fPP7tb6gwp?=
 =?us-ascii?Q?NIMqEHFREIl9/Wev52VDKu7rhaoCaedjVYiEbM+JD5doivqWXFXDP+RkE+gM?=
 =?us-ascii?Q?W8xpw7/ItxqGD9CAkiGo3iMdHOe1ZT0TntqNEm4v38WiAX5pYsMWCUTAX1Rk?=
 =?us-ascii?Q?KD3L0cGo5xxo2q9MRaY8LpxW?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed98c216-cea2-4737-f702-08d92b571330
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:58:43.2121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69+OKLySLgNAyICVoyJxnVvCmueUCYvB2yMBdhce6/jKbywILShOTBCwP7zS5rJBifu4/FEZoXYj9OIYDVeq5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4484
Received-SPF: pass client-ip=40.107.82.130;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
> Compute the value using straight division and bounds, rather than a loop.=
  Pass
> in tb_size rather than reading from tcg_init_ctx.code_gen_buffer_size,
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

