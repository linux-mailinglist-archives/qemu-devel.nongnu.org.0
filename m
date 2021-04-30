Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA17E3702F7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:29:24 +0200 (CEST)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcahP-0006wm-RA
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcZsm-0003zj-9X; Fri, 30 Apr 2021 16:37:04 -0400
Received: from mail-eopbgr750092.outbound.protection.outlook.com
 ([40.107.75.92]:21933 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcZsi-00037A-QX; Fri, 30 Apr 2021 16:37:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPZCvacXH78QaOepMK/cYFk34+2n2J7zaqnQz6FRv9OSyNElALXmklKQkhUMYFMCRhG6VOKRIL2ICz410kDBODZbTkDfKMM7h29ydW4bKYqO7pGDvv9Ep6GhtVMmN9gzhEyCnnt+HoNIZeDxDzP4OJjK6jL8uY03UHqtdy3rTxRcAZN3Ln1ipy8oGNAxckgfISGqPU6pHOM4ETpuwvr1CM8KblwDTixvUVcvN2RZxdHmtwt77+qO6LzmiFpn9Ug83E2DQP3sQe1F+gQEwpxQ9IhI95Ml9bTWz90lBzLV9YqWwKJiEfnntGkZcCb+c1THHJpC3JWbrhRcH1sNrOGgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s9kNechTqqkCCZOXhWC+GwSje3zgm5jL6sKPQok8nk=;
 b=afcKXHqActbhtrJm9+HzjEFYs1PezjavOXPbNcbOO60EZqGWT/T9fBk9/Uu2MeqMk0x/z/hjli3/YmiESc2CnSBZCH5JrlmsE1RVBTyOVJjew8rX0pSZggLaJ3d/5U6DyDkOHcaT3lZ1/XME1U+oCzEUuUX55vgWVOy9J9R86rMTWK8BhZeQIxawmeX+qfPDbjM3hd2NCnqyFnJZen4gu2hny89WP4LSwXMA1aez3c3nID2wQNdbpvEYc4MPIdJkXyfcB1LahVWrWnWGd/On0Iaetd7Gi1+1qtdqOjRcYnMLOFaia3dt35sZRTQ96B4maqN1CfK87v0xxkQI/Bn4/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0s9kNechTqqkCCZOXhWC+GwSje3zgm5jL6sKPQok8nk=;
 b=vcqyg87IFTmk3CskYxQTCnJe6NQtdQAsK+wOe+WIwPZ0orZeTWfag9oUjIevzM1CHcpVIesefmGs+5NpnXpc13NCtu7bZI8SFZJuGRkxWpcu7mqxjPm1G7jMqGsBKZNvTQ1DD1oR0LPY2CKFCuzHL2ESuIu9/BN9p4hSaARqupsiDnGD+QxcraAdtSgNIjnxFda+f7oMrhf8PisuD3A0mdcDA9i+5Q3v2fhYj7TQEaonUlPZpZJXBoH6qb2PnrfEH/tY1iWn7yOUUylx8gwGxEbTFB3/92MBEpzw0RCn5PgRRwl8SY/x5jNFnXAOgB/6y8Bu7MKb6CTeGjfGby1uVg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB1969.lamprd80.prod.outlook.com (2603:10d6:101:7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Fri, 30 Apr
 2021 20:36:58 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 20:36:58 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 06/30] target/ppc: Split out decode_legacy
Thread-Topic: [PATCH v3 06/30] target/ppc: Split out decode_legacy
Thread-Index: AQHXPV5eC8PiHVY6DUeG9zkU1BwCYKrNhk+g
Date: Fri, 30 Apr 2021 20:36:57 +0000
Message-ID: <CP2PR80MB366840440FFCEAEB6B773E73DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-7-richard.henderson@linaro.org>
In-Reply-To: <20210430011543.1017113-7-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89846682-89f5-4c1b-53ba-08d90c17b35a
x-ms-traffictypediagnostic: CP2PR80MB1969:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB1969A4B9E47F773E75585420DA5E9@CP2PR80MB1969.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ClUDXoXyZlYJ5d/WXsybBepHhw6OqJwzdopx7IdhcV4rsk8426Unk1TvnkIHmd3n09A2HqtAdAvGaG+RlliVztmxJlNBeDKPETrS7jOpt3ovP4oToWStIx1Q+0ktvYXWqnsQgzNVo7puGpIzqw/XwI1W7xstAn/G/k9HRDvsQHHMEUQUX2opHk41r8gng2C3yWQBAXd+ZcvQ4oBnv3bC15TLWywd1jK9DZAikv/iFlcbJjy/q4Tgmkpg/Tu2c/93CUQ9Do9zvpd3T1lbSLRxzKyxtfLn11xa3aiglHnNTFWSJQV2CTX70VfQ28WfVk1jGu5oRtuOSIizH3gA+xGJ7VgRhApy5UH2G6bYExkZeyVNjUBI0UgqweG/68cOElrrqd438N41dXgnsXsq4OCQmRHTJx9Pc/C5MbVCkzUDpex/BeYAPMKLYr4MgvbZGGidgKLrLhdnpXsLlv79MIGabXtvtTLe/PMhWJvRUYNzynql7cCUl+lH1fD6nzfT/rxmghjPrjNFbgdzTKicleu5CcdkrILUipWEiPZaHnRnkE/cvjZWLl94SZUe8WcsQgOv4qD5L3PsqTW1chz/mjF5yDuvrINwyV7Pq0RoFGDunLw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(376002)(346002)(396003)(366004)(2906002)(38100700002)(122000001)(4326008)(66476007)(8936002)(83380400001)(8676002)(64756008)(66446008)(76116006)(52536014)(66556008)(71200400001)(558084003)(6506007)(478600001)(5660300002)(86362001)(66946007)(55016002)(33656002)(186003)(316002)(54906003)(9686003)(110136005)(7696005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6JfzHrZcuUheGM55Ryq17vbslNQZDZyHg/Pot+taX5V9SfFCMKQp2IdEs+3l?=
 =?us-ascii?Q?3YCerm+hkPbauN7mHXWDC7G8xQq+HdLmF4uU8DPn/C3XzuOc6jQlana3Y142?=
 =?us-ascii?Q?5fvjUp8RiHZ1F9XZ6N/laGlsdfCiPguFs49nryWKUkLx/e4x8on3UlWH3nca?=
 =?us-ascii?Q?bRMHcixjr2Pn57be917b67ZFz+72SAcQAaGrJ4L5Ba+4DVWbnKqX6fEqYjWW?=
 =?us-ascii?Q?1CLldAZuqpADAnjTdAdAQPR3FiKHgnv1JofA45H2susN8wGBX7xJxAteehQB?=
 =?us-ascii?Q?IPtre6qho5iiwmYxO6/8q3UFWAjLT0HuxWlHsgl5+T920Hxiqb5MdrZDKgHb?=
 =?us-ascii?Q?KCS9sgfNgoTdLFXN6u92L50zW0ZJsVzgA/1sY1fkSSf089cxrJMcOy9mfpmY?=
 =?us-ascii?Q?a3P6/wmcLxtvP2v6+XGmcPnVoK93RBqVY3H7tb+i/0DGU6J2FlEzDC0IP0NI?=
 =?us-ascii?Q?GYO0OKXOlbRlCfe1LDkthgfC7EefqEDDp+WpdC/OYNGIqA+XRdGoAfCPvkYI?=
 =?us-ascii?Q?XIn2Qn98Ep5mYye1vyB87AMn/dCRhstmH2TzSxWzurgTxHwyVeCAbw9vK8L9?=
 =?us-ascii?Q?Em3STzyzdPTkReRbNb+Er1jNJqbBNq+QV8ILnzlJCZlnYUor+B4NUwYyt5mV?=
 =?us-ascii?Q?tOIpdIGJvmaShNq3RxzV6PxJpwmMZFiS44iCBoOtJDdKFUzVY+8OT9sUTHoY?=
 =?us-ascii?Q?8y96M6jVTKRf/PZEs1b1DWg2a2fyINkcQKcdMrAQtUNilNg3XTLlpbRbkwNH?=
 =?us-ascii?Q?/k4np4t5f9U71M0tAHz+VeZyN7a33jcY116RWDYHhCKuT4I+B/5/4GeNt6fC?=
 =?us-ascii?Q?io+6i0+d6sTTTUnYfvKTpdQBgFP2JAxcTJWHHVJfqU29ogrPYPxfPgLz8LPM?=
 =?us-ascii?Q?sQRTIHX6ncuug+MGJwu67wYiQWTTpSfweTyzAKAuaHCGZlpXMPDvI/c5CRb2?=
 =?us-ascii?Q?2FsAccHSnENExr8cDhBs68xMpvWxjBKaQZOU1sbx6Ace2Bu49XAo/KH5D1zu?=
 =?us-ascii?Q?N7x3ICIBkvuWDGNb2FoHC4gDZCCuUPbTUIrepwP1v3rSxdVB4qAnCWUQbxyK?=
 =?us-ascii?Q?Fw4TCG61Z0mxrpiLxm2qtWl4kBCuM7Jnoe3pOCPHmOXQmU7vDZe/57DDLhRn?=
 =?us-ascii?Q?hxFr9dEO/vImmy0UAlXyFsgGY3TQPXFM/IGYwojUr83PHM/92X2VsvfTeGHp?=
 =?us-ascii?Q?vvgju5SM/vBAg2MkCz5vkYgI6WOkHRt2PBjs5DQNne3WjC5wz+VJG8XaKqEP?=
 =?us-ascii?Q?w8Hqk1+0qVhmhRFsvdLO0z2bZDTrA7nSQ1xG3CJlWXCw6dhtk05BOldIxOfd?=
 =?us-ascii?Q?8cc/Eyzv4Im0tBkjDHkR4EyF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89846682-89f5-4c1b-53ba-08d90c17b35a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 20:36:58.0289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whhXlHZ0ve5hQA5NDUW2fUafykzfQr0feJrkdqNzS+JXGeX0hfdrMQjudFBD2KukDQ6Iz7q3TebvxQE028miEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1969
Received-SPF: pass client-ip=40.107.75.92;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/translate.c | 115 +++++++++++++++++++++++------------------
>  1 file changed, 64 insertions(+), 51 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>


