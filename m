Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841233A18F9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:16:49 +0200 (CEST)
Received: from localhost ([::1]:49978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzwm-0007yL-GQ
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfw-0008Ju-Ed
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:24 -0400
Received: from mail-sn1anam02on2094.outbound.protection.outlook.com
 ([40.107.96.94]:15619 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfu-0005Zr-Kr
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOubxRjZeRcpof7sqAbwwQhOXi2wzxeFgL8/hDTpMGnX6+IvED4rFTcz0Eke7T/AEH8y8T3EJyjZEPJ6blnEYJmB5XxNy0Wnuflz8zJXWLYxRDldd8rNi/idhXL0jze0taVVXPSGwyxiKEKS1JwuRsqU1Z9ntOpXo+/9SuO0VH4NQ1jkIQwG177C6bAaJPTgAbaJ6Q3N5Mv7lNFlpkWo6+Fh69x+0NMiLxqHaJI+RWs0wRtAK6TI68MqT0tgaPE/ZJHiaqbX5tKnoRULJY7kFFXBUE2bddzxEgH1VU66ZThdelQJoKMuIckGN6bOU/X0ck8OK0XCOrlH9JuwYrwFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSzSA/7t8xGgYV6q+i/bH7W6Kw98dLNKgNacIy1f2Hw=;
 b=ky3hMdFmHWiLaC4dA8wvOEUD+M831crpwS35qy0/Ha/YyHzt+CQajS92mtFLYa67AsbQ4MjEHeVyDbgtCq0OdqRR9gDGJqXDw/PSScfwIlWTO1zkra61E28D0O/pfUb2VPwzuI3Do9e6/cxsrP9Zi6VVsQZSBScOzVd9dyb4usiX92a/6MZTYeV6X59ZmYV7UTx9CT9fS4SC8Dy+9mNhpksTe38J31wsd5DgzNeYhCoD1sSnmC1bMfWZ3GQmXia7fdahuV3Bhw+8NTUBoaaczi926MUHVZeZxVbBpU9t1HQY6+akjK/k8ZxDQXdgqYF8hKTc9UNClmfBTl6vu2dgcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSzSA/7t8xGgYV6q+i/bH7W6Kw98dLNKgNacIy1f2Hw=;
 b=RXNoVUTb/tzGUuQTvtxAM6KXqRGsarjjvB+I+N2R1B1+PdH6gWwQtSA2HG83Bw0qYCWINvqgZrcKWUv4JH+YGHSx2A3keBbzlZlNWcdISLJhIT6Ba8cNnQRuc/fusZYF7OswxLoWiWs8FRvDhWoFOs/xsP5O0SkmckBeGNXBmxwhGketr4x6g4Oh5GwJO8OxKpiKUaFAH914ZtEKdC9iKxMibx9g6NLbqwb6OTDaSnBCKZxYj51Do8NhSzlWdjJRkSMnub/+KoOvrZ9Z1M6brlAQWvBT1gZGw0r+3/B3mWnkN2EiESGIfriJ0KEI+vhV/UE0Znc2iRYkYZKFhWc8mw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:59:21 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:59:21 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 23/28] tcg: Sink qemu_madvise call to common code
Thread-Topic: [PATCH v3 23/28] tcg: Sink qemu_madvise call to common code
Thread-Index: AQHXP6s/vGn5VCTxF0q0W2znRPv5JasL/iSw
Date: Wed, 9 Jun 2021 14:59:21 +0000
Message-ID: <CP2PR80MB3668233A5034F43D714E980FDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-24-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-24-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30783946-c886-4159-f35f-08d92b5729ce
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB001768322F6EA5D9F7F1573CDA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oHFaV6pGqLBmBQUVkX47OgFpo/4lyw3tLGgFsr1utqnbEiDR3EesLU0L1Us8EgboFnVmKP2AOnKlqn3ftiZtiwbUc8Sza6Ga2H9tJRrQEilxYKlwSFF3H3LkEh7b8H6jCawV9kmGLrvHNNNw45g3LeFSGKvappP3nMnuE2zF81VaQMIThthI6Mcj+F/Ym9G5VVu9Y0VMKrNtxi7+SFOQXTwPhbBvpCy8Eu7aDPrAcTMcYFhJI/lxrGlCbIWxy1cdKQ7wGrH4gMhLxUyQPoU34WL4nX5svU7cvjaCLPu4Q21Gzazj95mv7SAf9HRoaUZr6bljZ7p3HQ7flfLcIbHDJaMv+alfizHA6J+CI6Vz/4g7EimmkkUVsKYmKkg2GaMAZVb6MiReW/BKkZ4Jtcs/HjN6PhUOsGidfL53WL2FzNHSuCIvglDm2X5Lu1SIjJQreRUzC0W3CP4lOviwCEMpb6hwp92196e6qtB9zgYHVD3dxEUkPBMAbEfzGJPIEHUPjhrpN4jE0ImPjRNpMbo712ENaEaRYobJQ0gFU3ulzgYJlB9VBd/qK/luBi5K6t2PLASPU7/tzY3bypHZdBZ2KUmH5yOccpHiEU8c5e2AtXsE2doIrcpVt/Bqgz8crDkndtzpFOeCiodYlFjQhB9cx29uVKlF+M8DW+5iJz9EgUX5+P4RRmnWxqSzG4n2vGjuyILayy2qHuRMsnKcUHKyUyutAacnFkJUXY8m0T9MG0c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?KYEN4wfCufINmO07md+VYXb2Vo2T+w8Ns4ElpxOfgvPZkbC31/wcz7/0zdsX?=
 =?us-ascii?Q?tvArV46RUk7TiXkq/eNGHjYQoiiOMoPvgBr2tDdTLL8rZLKVyS9HaB+qbOuA?=
 =?us-ascii?Q?wdBC+asMxnWj2yUZcBruqlwlpQjau847KC1/xhLaZdvwWH1m5Nbijruc7qEq?=
 =?us-ascii?Q?zowdHK9s0ddoNm7MT7eSB8WhSTaEVVzCJqLdG+drR/iexiVUFc69QlKb/jcF?=
 =?us-ascii?Q?hCHvaPuQ/zWgX/gs1q0m5q/iNVXqK90FLQC82HcPhh1J/hqCzf84eU4vKe6+?=
 =?us-ascii?Q?1ul95B7pqpeeQ0El55C4LOBZBRLdnLnzJr1kcGOX3jwsrW8twnyoEfraEMOR?=
 =?us-ascii?Q?0VPwpsYTqajiJoydORN9UvJjFuEaCRWxakm1oRJ8gQbKB0cisp5LWBpifPMJ?=
 =?us-ascii?Q?3Tm+sATiqOT3F99J8y3nMJEt0RiuSx7xdrXukBf/gPvcoHjhLnCQOqoZtbVA?=
 =?us-ascii?Q?jnuN2aUQdUdwFtnHS5KXSb7oXGqfTkJV0e5okMd8Jj8zmw0zXX+Gpp9ed2xc?=
 =?us-ascii?Q?W5inRbiL15iEsFOa4zPlcKfW2b5bfecSlG3jIGTCdUNi5YanbR5ebqI9lgak?=
 =?us-ascii?Q?b+4pgTB1Y0PKuYgfc3Z5b0WA+ZHEYPyO6S/SqbSUpxPj7KEV4rcOOi7JGRzB?=
 =?us-ascii?Q?HMr0i/XSxkEWFiSOeNboG/i5I/syZaHFo1wTao67oV11ZHnOKPgdPwYZ1FXP?=
 =?us-ascii?Q?FpBe35aok6LNCufktlg+SnwasH1tAmfge6vy/g3gUubDq/kjqPzrG9Bva/DR?=
 =?us-ascii?Q?zhkt4uWYc0FHDpBpnMTdkEBgImOAkHHoFgJw201Xdc5QfdWDoP6LcURxhscF?=
 =?us-ascii?Q?KCeaYO2gGRv6ZRYq0yD3sKIBC0MGJ3QTXqWrK09VY0iaWYinUM0KBVyNQUGg?=
 =?us-ascii?Q?m26evZ8pU3VAvPDQ0JZ7hf3Q3OQnOtEueHkY/Ya5R9LNXjUzM/D30SkMHRps?=
 =?us-ascii?Q?cIjNGljoFLhGbD4ndOxJWPXElDAkiNAymwUS77bbEEdy7MDoxbOml5mEaj0E?=
 =?us-ascii?Q?VGot+1c5kRlA8VC2ead0cxWVi70X3MM+lxZawgQFaUUSeqV0D1/sbq5hKC12?=
 =?us-ascii?Q?PNjwRgjQ5C3SAY1O/POTuI/YLdtwyNvMeLee0uCgf6YdW7mSqfvTNqkdqIuO?=
 =?us-ascii?Q?W5wtojVwy5Oe5+G0ge0DGbsCWwhia7Qi1gdXKPOfGIb8l6Z3LIyAK26Iyx+7?=
 =?us-ascii?Q?JRDCmtPLQ4Q04qz1d7r2fBcVsuYLKpYN/SEOH48V5JEtvDXFyaZKcETmX3wU?=
 =?us-ascii?Q?bCe7N7qxRSP/Mo4qHzyU299lfyQwBsfTTPbgwcpqiHc5dY7GGcjkZeYkDUEG?=
 =?us-ascii?Q?4VvzG2dGoOYJT5LI5ZMvGaW5?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30783946-c886-4159-f35f-08d92b5729ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:59:21.1044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wZqDuPJiEXSrHWHh2o493ysuVdY8wQENwCyP0/i1NKnt4yjuC1XNDcIL1NNaKifBVppIu9piRMJYkZ3tPk4Hsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.96.94;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
> Move the call out of the N versions of alloc_code_gen_buffer and into
> tcg_region_init.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

