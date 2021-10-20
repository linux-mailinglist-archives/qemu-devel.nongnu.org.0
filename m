Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D303C4355DD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:30:35 +0200 (CEST)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdK6T-0004b7-KY
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3M-000223-Hq
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:20 -0400
Received: from mail-eopbgr740130.outbound.protection.outlook.com
 ([40.107.74.130]:33335 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3K-0006fG-Ag
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBm3dsEtdi6mJfrT1F6UdN0yJgHaqL3sb5qMPzH16gYANSVq8CwT1oHh34kKez6DbIXWyYrv17ZfQPqFK9mfUmShVoVAW7DQKbsKFOLPIPqi3vGWrH2G0CNACk/o0M1mu/Gbc4xH9KGv7Jhte5gD8TxKQAQCwyPuQ53rDnvva072WqKJik9U8ZqMAEZfblFxsibsiqHA9iaTZLezeFb13WgscGdOFJFPn0O8Y6F6CzuQGt8x5VxXmyCEoL2vmvxpt8QRDRJTUmeAfYl/fafvRE88/Fcg8GHtNECC1+GPYV0q/5yS86aF9HvfIimRE/8m1oqWEnN2t7HzVQxFZ1pecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNJDak9JhoinmYjKgljdtmOs6hjFrljyDn9MH9uK70o=;
 b=Bfm+ttPUqAjcfy/377rF97iLR8BwIk+rnVw84P9LA53dSJrkWkqEHcNJqkc8jyRZNJo4Fj5460czlBV+PLON03XItydBLnYgFYkQgV7MDZRLzUs2HQWD6+pgIjIgw+GULYNEuMk2rZmkGfvlu7H9fslDFesmnMTYi5/33DSrcnoSsNXnVKmvVZjoy3fcSgl4ftVZ7xQARLhLkeU8KvMp7E99aa98IaM8zlcbEAkDq50Vnmt0e6lad+yTwBA5k14SIyAsHij0ljNUFVJFXMTGbzohjNldN+0W/Cck+cdBCr7zHJDKMxqPaSIOPJ3jsHCwY8n5Wx8oQ6I1bUzDJFXRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNJDak9JhoinmYjKgljdtmOs6hjFrljyDn9MH9uK70o=;
 b=gqgDTzvNjaZA7DhRPtoXvkSAWyjCpBEz2U5wYUQ2S/iRKbmHQAPho48blNqBjWEV6SVwEDgFQDsrDnr2gZ4dTaYVp1frfr7OMoJNcfsTBa75/X9cMuCgR2xxKi17c6xABEhQO5veIvmUk58c6FE3WZrCsomgmm9BFpAWos61QmgDZ0RmOp/8YMn/N0rjs9tbzx1PxryXgJn+kAGHQDSKtuCQzrvcfZar6npDy6ep/EE5yd40bX+HubYKpM6dAr3cW1FnIRDuS7g1Ww/NmhBzofq483Q9wx6l4SpYy8xINkvHwfP1sYO4qFZTS71RV8EaYb0VYKoFJo+L4H8iCRKuig==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:26:47 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:26:47 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 02/48] tcg/optimize: Split out OptContext
Thread-Topic: [PATCH v2 02/48] tcg/optimize: Split out OptContext
Thread-Index: AQHXu7VSqM/RkHymJUOke1XLAXJWMKvchI7w
Date: Wed, 20 Oct 2021 22:26:46 +0000
Message-ID: <CPXPR80MB52241326B5BA1A8C2C08F924DABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-3-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-3-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0b8884d-eb5b-40e8-ea2d-08d99418b407
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB448221F3675A01F20C206F6EDABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hUMRPgZF9OrmevVD0VwgG5t2qg4A0LQrwROZ4FI6cZ2KqPZiFW3/e8vrICAjdY+YXi7uPrvHw7j6Ds/3nYNqJ2g00tXwWyMEmDzcmfN6bhpsyg0L7ORFQ0ntV6XU2/DaRVD5nTwd305CSpO3yxYlVYeDsn9UVnVPdj3dyPwYj/agZ0z5n14XXtx6DikyEXMfrq2bPRrLCocWINWrfRVBnNxXezTdJ9qGkji79PlioNiWFTEVqczh4QtA5Hul6czDXBZ3liY7ZJz01BXknUAW0/TEs7AhEi/9Xhd9ond46bISiDMZicH0VXyrZtBIbIShUUx8zmbmP62r8XPXfG9xB6BpI5PrxrVLTI5d9l5gvLNiDMWpNdJLcdPbwgpCx+BdJrwlTvO/2UZ/WQPoQQFoznxlRNoGHYeYFtgaovFatzcR1tfClMH7GRbRofzekAEsiep/GutTj8EbrllnlXuE736h2y5wTQjSEoWV1T1oty4hY1w4c7kEUBBGZ/q1xxBuPTFtQC77Uxd31hS6xAjfC/VM/p+QV6Wx8gdR4nsL6jSqshCeIZRDe+vci/dKyA5ErKcIlCdbMo/KyS+4LqsC3KLj4fSo6YEpTGSOZvd4NjXa20CGhLurrZWsnMKhTfZdeQykhNkedcOdP4NwoG4MLqVmDzvEObCryuNE9N4Ng2EyRl4H/8RendRZpX6xiV8I43PgI10eNyLm274N3Uq09uasC9wc9+d25RSq3mpOTeQTfRtdV6oFxbvdOQNGT+pxDJpNA6EOHu6plhDIrCqYXy9RFt5KTAN9vFyEsApybMA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K3nvPntrNVHyQuHjvVMzJNqVRLWEfW3+PWKm3n7vPU3B9FyZEXTSMuDjV2iu?=
 =?us-ascii?Q?Tf4XaKuhZKX7rmM1O8QtLr01ImUfwF3xakGpJ/vqVP9NTNRRRhKuaONG+F+Z?=
 =?us-ascii?Q?SjqUcThm2gyiplF+owV1CD7WQUfdv2qYwsrlu5E1DSvSUimRZd/hTNwM4Sbh?=
 =?us-ascii?Q?b3gBWbCpSZjD1jDOwEdAznW0QJ6DC5vfygM47fIXYNKnP+nn65XGe030eKDb?=
 =?us-ascii?Q?yJc3PMnthZu0iIDfAvwQkVxTk2HbzTlkWAVjKxhLgq1UUNEQje+ecVYS41tY?=
 =?us-ascii?Q?kzzFKjJBl/qf47u3KiXxU0TARqL54IeUeue+wuWhE4HQxZDWrk93t+kLl8KE?=
 =?us-ascii?Q?EM0kwo1aJliqym5rKdx2L/3r43wZcda269jHjM69LdCsb+g3cZwP0CeL5n1t?=
 =?us-ascii?Q?3l2/9C8rlaka6D7ZJzJAaZRKZc07mo0LK++q38Ab02AgdChbcS6NnHEnKHvb?=
 =?us-ascii?Q?bp0KwTmqxJ4Mt7MJ6TMqeDNX5g13xThgSistdeUFc4poOEmRF/HbMuYgpIMM?=
 =?us-ascii?Q?A56Hplwi6OHHkuvpUD96mUKDpvVlJ05r2yRxF4pQ7IrgnIgfclRcO+btML5F?=
 =?us-ascii?Q?WClSTBOOP9I2RmX54ixHP96iWCwK2kSB2C3d+dZf8NF1Y+YqXqff1Za19WCx?=
 =?us-ascii?Q?3+oWkVwmsOZ/oc6CJN4fkJtuoAnx3VNO+ygFb04jX29n+d9S0AWnlQ7fJ6Q7?=
 =?us-ascii?Q?FSRrSzLFElNGt1QpgcIvoewVYnw5dAzEmiUxiHMMd+71F0Yn0gNLpIs1mdCV?=
 =?us-ascii?Q?dvOjPM5xvBcZ4kJINvWJln3WNYww4MijhPY54ALnNoPee4mkWqtAqn4UcpbN?=
 =?us-ascii?Q?wOaw5CNGQ2fklFEq3eqRkNqY1ToVRGVfjKge1BNeJYsCLgKXxOFFMuhy0lDc?=
 =?us-ascii?Q?otXYM0r2pvjH5425CiFl5UN82VytSWm0q/Zj2lU8hvxprj4t8ADzyHo+1A8u?=
 =?us-ascii?Q?laxDS4ndTNLARSEAZOIGUrkAThGejPB5RlqAhUjYPwJ5NsdZYRQXWQV7uzLH?=
 =?us-ascii?Q?i1UXFZM+DefA12we+U1SXeJ5PaSw14a1P+iczncYXUz5LZFHKrS+CW9yV7x9?=
 =?us-ascii?Q?opF5batFmmZVXv/BnUBud2i2P9F+euqZi9HVFWoBjbgKJDxHufnhnD+Uwg75?=
 =?us-ascii?Q?e+laMd/sV+MV7H41myna0yzQvV3vhvJi8UU+9oF2lp6SqRyhHOc/arOLG6xr?=
 =?us-ascii?Q?gkPolAu4jb0bjX5nRA3vrAmXoz7o6p4Sf1QqUxeDAA0uKfjsLPvadMFu75vG?=
 =?us-ascii?Q?Hsa2oQCm93kekHueBBsoIjlHE4js+Kfpq1VmE8WjqJyY7zkWFxpL3YKPPGbD?=
 =?us-ascii?Q?tSrTtY0YrB65tjwiyQyVPgvI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b8884d-eb5b-40e8-ea2d-08d99418b407
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:26:46.8330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.130;
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
> Provide what will become a larger context for splitting the very large
> tcg_optimize function.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 77 ++++++++++++++++++++++++++------------------------
>  1 file changed, 40 insertions(+), 37 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

