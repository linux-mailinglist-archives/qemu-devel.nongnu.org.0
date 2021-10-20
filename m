Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48894355F0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:35:40 +0200 (CEST)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKBP-0002Iz-O9
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3d-0002Mj-P8
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:37 -0400
Received: from mail-eopbgr740135.outbound.protection.outlook.com
 ([40.107.74.135]:53168 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3c-0006qY-6c
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4oKeBYbo7rFqHsScz9+cSwPfd5DkfISreUfvf80Fq41UmT2B9Ipdy7zY/mJeBcmZr/qcN1tFYP3g0jsWR2IP/fA30AH7BfHr4aUvk+SsXGBjPGMfJGih40ORqbUeBO87KMX0zLBLvdGVQuBS1gSyXAAF4f5re8JHdb7xI75LmX4TxAWHVnf8dOT00UkuGLIy50Ddc7BLWBju8XFwSWwsnwL6mdZBkOmTFXbWs3UoaH+nFTsoaHT5NiTLL8kTuUozjqNWbMBC1WhpOVKyD0j5juBrAVuZzMJnmuuOzQxWIHHNcxnuTssr0EKeXYf+m4r4HIxpNilfQaA7MT5ZawkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsDUoIv6vhg2Bje/fpsk0t1qYukkmRa6+KAy/u6NtbA=;
 b=MygITMhyeW/BKZsze8NCfXlbjGbY/4DN4sckBrEjT6bWG0+ZBmnTT1ZsPtuVZN0xnTFgPzW2K5mVKawfbiPG+DAScCgN6/jud+kTfbyFG7rhHc2bYfj5pde66YkvFSaFK4urqpcwqAiIj2lT4fYVzprfUCi+liU3ApJZCdv4Hp1WZMMTbaWSuCVh9JH2MTLfe+7XoTQ+taRGWv0hCJxjwroK0LjMXBfOAMWIF9AfO1vbJxypZ0vHtupKn2b7TANkb8M2lG9vxh1+3yMqEQy6LlDu9b7Wnx1ZoEzWs4NMtyM9M3MyKkjrVuaXhIxwx8oNaLyUC8oKDj3QgK8e2eoz4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsDUoIv6vhg2Bje/fpsk0t1qYukkmRa6+KAy/u6NtbA=;
 b=NWgXjhxq26mwWrXsHCotq+By/pY37x+i/BWTCDNCGhEccExY1dDpVT260TPrx9Pol3b+1IU1fbfuRqtTMhvTc5KskXWnGIbWtwQRcFI6iWCWALo+QpsMLdoWZMh1aWg17aiDhd8pqHLmqjMZIxHduZ75ycfrHfCbCvGnFtqhyb0S/wSiSwmo2Ww1E0R8SMTipccmkB424umyv4Gwyd/PVhQ2hwicO+QGR7nl9LNDGfewUYs0qiHdB26mEAqH+b97dhGY8hS5QPDff+mTEqkdvQp7aPYySfIJALPNy/obwJWVUkv0j/bEDeWmpKmNzg8n6QwXMt12fmkRDc2WY6IAVg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:27:18 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:18 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 09/48] tcg/optimize: Drop nb_oargs, nb_iargs locals
Thread-Topic: [PATCH v2 09/48] tcg/optimize: Drop nb_oargs, nb_iargs locals
Thread-Index: AQHXu7d3mmDYeDtWxEiRFt5qp1LbHqvchhCg
Date: Wed, 20 Oct 2021 22:27:18 +0000
Message-ID: <CPXPR80MB5224B73FF1954E6DD1C20D7EDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-10-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-10-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 737f503b-d808-4002-d3e8-08d99418c6c9
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB448266BD7FF910700428A5E5DABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uqi9dJ4gMBNiaWYRpi5+9eQQzhGg2KXnM2VBZW1+Fbvz/I+xN3xnj1U0KCh+PyyoImrBWSDXlcvQ35n1QAOBhXCjBjC99toSz0ryWIQRgjlITNPJTLLJo6iK9bnyFo1qJUV0uxpZK+bfr5cLbYgYJz4wlGPD6ttH/Jp+q9bsPeV8OM2lt8yAkYxVXc0xKqCFMO8io6w7fZf5Q0Uu1ypTWaZbJSEWbyNyF4SUhTzw0XnvD6mze//pH4gFBwEc/ubNnyfXdvvRLjauL9sThrIS08is//ct7gH+Y2nHmpkV8GjQS5DRf0zUS2Po7jFDPBAEPjQUMZ70tkmHr79FH9iisbWkjLQc6qL7w05mW5osJiG63f2qul/vhGXqtSYIYeuI2nwJR0og7LqDfntf6OJfZbP8i8rMD4ErXU3P9dB68kdqkGPV45YQC5vLQLazp3OawdP40m9f9GVVynNIxSSxZDeJl/In0fpADpcxt8QtbtjZBrs1/t5e0bpzXxorZbwBTzDsafgacomvwMY4XdLJaAtNJ+VtMZBnr3ipaiyLhEnyoKOjDBQh+3FYkpvn14wKlwrJYF8iTeMtUBHHd5EUo5OxdYOf+jO4ZcfyfgaYx64M4zJPDq/TgmKQKpVNg7PIVEbH4w+tKzLnAVbi1EP+QL8LPOWgT8+i/NyF+gJvK+XJ9y4CpmkKozWYUft1J21bUUqoNwTMuJbxGNXETJKColdS7rZwbSqSfsbUZaz87Zcu1FLQnSpuDBy4LNGXTBydaVRzdjL1SzB1d1KRMeOlhiOlC9qpOIF69ETbCCcg++k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?52N/hseLcbtJvbjROx2TgU2kNLUDZiZCglLOESCLchjlfWmipLnuWABmyYGW?=
 =?us-ascii?Q?g2bhpZSDR4s/sMkbfTfWCeFetGEya69C/tk/plQFfoyDehxW/SBTju90l5LR?=
 =?us-ascii?Q?F2DHFlV3tQqfepitl/RzSErg55lqyjPoLY4PSYvtHPXm9fBTOjmAAK14pjfN?=
 =?us-ascii?Q?++nu+0Q10RiHz+4cRSaCUvZEMt7RMcDtt9WFunrJ2eaI7AbA8pqW1D5htCWM?=
 =?us-ascii?Q?Mi5o0yBr6n2NjZLNcuhb8INjAX7oPM1lBVOng8c0ta6+wIaczRVVeOwXvGp5?=
 =?us-ascii?Q?LIFzn8B8ryNy1tJfAXaTWwxnIIBjvUrr4EViQp+O7sgHElbinV2jmVvf53Lw?=
 =?us-ascii?Q?Ih3U8x7fyGs6aH3QcUbBlf40zKkQwLwXNgwLuBiLSy4T7Gxz7lO+qW5DUrBt?=
 =?us-ascii?Q?Eyo7FU7nywUCZWm5O1NODObYDFKIgA6mKa6LAAB1faSgbc7HPd7U2+HmstbN?=
 =?us-ascii?Q?vmiwk+I4vYTSBWBGa2zngymcdmJRHaXWg/yLw8f2D6CMrLcMLqS/Nchnoyv3?=
 =?us-ascii?Q?a34cJ08bxn1l9HK4qINcpnr6EfdYnRFjAw2clai4XUfFfTpZOVqvc4E4HUpZ?=
 =?us-ascii?Q?kBA8sFj5jHu7NCIlA+VKxy4ptmiAczF/aYx4rV/2KyOIWnaZSg7CG+S9JEJ9?=
 =?us-ascii?Q?g7e+e4ZVDxjhMAOqKM1AA6TPAvFs40EARMKCfliCeLtXuNH1lHW8/bESPQBm?=
 =?us-ascii?Q?AZATZVnuGCOgXmQMBTnCbk875u0URuP6H4Ff2Y3KhzHO00/aw/ggSlLGZgwA?=
 =?us-ascii?Q?bcvF4apf9aCkIT1F1bmP8f8jjam96odtu3JZTehR2ifGXkThBPwlobKa45Sv?=
 =?us-ascii?Q?PM9x8cY+M18nFNJqUHzOy2q2q/dAL6KcOE7R5ccc2RPhDj0BcYfyyHRWXGr8?=
 =?us-ascii?Q?ht84IUb4gjyH4QyyGvHYvUjayrZT+FmhJIzjxzpUFpLpQ2p77kTCpuG+ydmx?=
 =?us-ascii?Q?h3RxQtfcngKbSpJzJg5M3NxfbjJXMZ0E97LQviXZhy1zCys01XZGS8zmetTU?=
 =?us-ascii?Q?RfYj0iexTcu8x/mreZwuvFCfIXv7PAb5GNMrW4Jc3G+wYU162KRUyhujS0mO?=
 =?us-ascii?Q?Za+0icjTUyvX/f39srKC+n6PHnMznuuifNgi9m43PrEbuO/EZTEPnJ3Pwl+/?=
 =?us-ascii?Q?0KEWcCezy9UDDCTTrkZLiEMOJaptvkpX8pKPphgg6+0bwQjz4ep/cWdwYyL2?=
 =?us-ascii?Q?Mgw8DJF202Cli4Rpek7c9c+Z7xgHlhJ6rwSo+lP+rUfHHJWxQeyUECR/EkU/?=
 =?us-ascii?Q?5vH9Mcyry/qXXLxfP9o9ERKf2hCFfOEltd8y5p9KLZzArw4efBQzqV4QnR98?=
 =?us-ascii?Q?YGmnK0PQr9OPwYyw35pWB5VD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737f503b-d808-4002-d3e8-08d99418c6c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:18.3288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Rather than try to keep these up-to-date across folding, re-read nb_oargs=
 at the
> end, after re-reading the opcode.
>=20
> A couple of asserts need dropping, but that will take care of itself as w=
e split the
> function further.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

