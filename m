Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FD03A189B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:08:33 +0200 (CEST)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzom-0003ep-Tz
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfG-0006en-Eu
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:42 -0400
Received: from mail-eopbgr820120.outbound.protection.outlook.com
 ([40.107.82.120]:19780 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfE-0005C7-GB
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1Q6xklGhzHpOJjfIBihl6zL9/eXaqzGHv3CWHJrg+5VFenkUQBgOqR8bhmZLX6Vn6JMAJAol8RRFTWP/50X3r6vqL//krYSUrKJ5qWRZDH5Q1AXwQwyWWjAXLDrp67cCkKjEeQEAXKtr7jX6UOozq2sqFHMwb7JylZ6IePXbb4IC7YxUycz4Ftezsu3/mLakL2Ng6i46I+VIkj7mkMrp4yBZQ6BZWfd57DVl7ts6w3GVrNs6IF8tdop6Jb4Ohzl7/PTdgc4XT/XiG3McJwNaovgCDCSRVPf1LKpjwUa9oB6+nK+/QVSb1Yw3pUSmW/rJPZDUEgbmB35Uj1VeIp5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqFKCA7PCf6QXnBxtn2e3VYqN11s2Ja+Kgmopo0zYY4=;
 b=SyesOgTpAkfPuoDLDr6orIkuCcUsym/hYftnwWFAzlsRGzpwG3nT6TUHyhNixblsVCwK7WgLwa4diMuG9+wsFDOv+b1MRxJHenP4HpNl7orvyKO0pDPDCx+heoMdSbTDe9CKmTEmnwd2u/wfgd1AjuyKBgnVbtKRFKYrbRBcLccAjKvniZkoIr8322T4Vm0XGDZG4cAlRhmyjCM5J068lGXAI/tCrOlVnhojdyOw+5PS3q0IRzB/w0gA2Q/O7HkvjXB2S2T2az89n7xLUuFcqukceKSOyF0TynJbFBAtof3XvJdDm8MuhcSQC5ltJ4MIXFc/mOeUJwrrybO0h+vXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqFKCA7PCf6QXnBxtn2e3VYqN11s2Ja+Kgmopo0zYY4=;
 b=ebQhhrwL0MHNimSylaGoYsN+0QndKOgI14h5rmXtW6MmVqRczPp6SdXMwSV6pvTzPOlU7VOPXhGNHsDzIqxV6YZS5jGpQyCMQ6Sg+d96mlax1Iv3I8BkNVBJRHNqksW53TI/VwxdgaYzZQk8RmngUWHQarFOSb+o83A6oyW+bQDU0VJYdBasNUaoL2t8E9RdISmEdCNZPnM7Z4pWplTv45nRYVa65SzevN6ghdZaAflOfpqzzWtHN/xDRN9nukBWUy8bkaadTDCYTZcyzlimrpzDf9XQGLa3yssEPXT7eawMLhGfgtezMW8nv6lYnmFBkXZcLZHa7ypxvuUFmycZpQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4484.lamprd80.prod.outlook.com (2603:10d6:102:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Wed, 9 Jun
 2021 14:58:38 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:58:38 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 17/28] tcg: Rename region.start to region.after_prologue
Thread-Topic: [PATCH v3 17/28] tcg: Rename region.start to
 region.after_prologue
Thread-Index: AQHXP6pcZvpiHy+XeUyiVYrGxwrT7KsL/FHA
Date: Wed, 9 Jun 2021 14:58:38 +0000
Message-ID: <CP2PR80MB3668B8B1E29E3A242F219C84DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-18-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-18-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77c20949-57c0-4a92-86ce-08d92b571052
x-ms-traffictypediagnostic: CP2PR80MB4484:
x-microsoft-antispam-prvs: <CP2PR80MB44840585CA6FEFC05E963B61DA369@CP2PR80MB4484.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KNklpr2hu0OTK6XCTa8jB6nrTHgZpwptvtzpUkr+6eTYJ0YUyRNplmdhVVr3xZ8cbA4gjkq9asXLoQmPG25cAXaP3tdInIoyWEMV9BSIsgVd+acAzJdOVKEb5orH2FukHBjLftZ2B/0oDEF3xt/q5yDgYT6wLxfVDY0XNLy4TLk3rJF2LyVJdQrBiMnt34hwgQg+NW/uArBDEVUvq11VjGw1b30F9+jbX5jeDpHn9D0n48Ih2YEFK4VISf6uPcFZkb+D1Im/BvylXS9gb9dArHgmb0/lx5NiI/cNZvL0XR8cnCcTo3fZCtu0qiQoEnlCR/EYq7fnjIc2VGIfNO7Zl4tFI1TrDW6RsI64pKGwCP6VIkY4K/BC8tSM3x9LxISgeStmssk/uoFr10PU0yYJeIJjch73TQsobGe6C0wIk8k98CuSukawGAhxe2uDP871idfgwTvger47qzh+f7BSRFzCkndqoh19HETEsJpchj3YsyB6a7QJEa3Yeyk39fUDgNTh/XvJ4TUP261M3N8tOlYzs+s/HO5nPxxjyHkN/LI/cYC5j7UAJHlxLMzZkp44bFRVm+9lyPzTdIXmRlXPwkf5aMefT302f/gnwVn19kZRaEmZCm8gwD9EEzfvWE/iVcoJgozzly385UToL2MdwjGWzNbX2Si0uujKNT1wJb4A9x3Rz0pJpvq/jPca+aR+iVqJ5KfsxI7NBCIJXFqVwyH3shHGWOGqDarFJ8VpalM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(136003)(376002)(39840400004)(6506007)(7696005)(110136005)(26005)(2906002)(186003)(316002)(38100700002)(76116006)(478600001)(9686003)(64756008)(66476007)(122000001)(55016002)(66556008)(71200400001)(66946007)(8936002)(8676002)(52536014)(5660300002)(83380400001)(33656002)(66446008)(4744005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?CCyJMMjhLaMgFuNmJRqKNM9i5DvQqEKOb1H7841JJ8b7pt5DfotlbzqoDHNN?=
 =?us-ascii?Q?fEpPrLMXtf6/Br4bw3SZ3zwTiTIEywTgghiI+Hh9MlnbrVPkqAR5bnjVM9P0?=
 =?us-ascii?Q?6VcRHS4YXhL4OK1OPV2MKyMRGL6kVJX+8pyItb61RpYBTe9qDTrh6om2TWn7?=
 =?us-ascii?Q?iYLntH87cis/qEBZ4SoPod97FTRrQCR4DTQSdV670yCYqHtUCSn0yiusWi+H?=
 =?us-ascii?Q?05/H/qP56FKxsoUVDmUjDqjJ7TNGEQmeZnyAB5bwG3VyH0pOpH90IyHUQXE8?=
 =?us-ascii?Q?PwTu8a3t64vMdadgVHrZRRyP86LkyN1F2Enf+kmbsOUFlBbcjvvY5+NrrqnG?=
 =?us-ascii?Q?5jHDcMloU4HMqtv+2XGqJVUi8KfD3raQ2uKVuLLJ5ht2HT26ZtvUO8OJPP9I?=
 =?us-ascii?Q?3Sl3HFsbMmaDAhUvjWBUh6RqCIGm4Ug6u49G61Dgu4JQfP4BpbvrHF7ewPAk?=
 =?us-ascii?Q?ygc154bsG3fikdq16hwpHLqzVJ2Hr9WLadiucL9kp/y1l/d96nzvBnPIG6jj?=
 =?us-ascii?Q?FsEQhZas+5w6ubuNdO0obMib3EiefptYdObfYFsKwHS7WqjyMYk24c5gKazO?=
 =?us-ascii?Q?7V3vUQwmg5+xUHq8LT8KCVr/wxeTRlFtpgW2ASP0/uAC0ThG24P7t9oO5Fxm?=
 =?us-ascii?Q?qcDdmPRnsJBefoZlBr85RDSDkvDLsOVnH9GqCM9Lct5MlPMuls/eGef0Zusd?=
 =?us-ascii?Q?Bd+sPcIdzM+y3DcSJxJSSqhT7GIaY3j3p4xqbE55JopQVK0tUURKKMzPKP7j?=
 =?us-ascii?Q?E3N6hnHenKJ6acTRdVvXSiQO1HUT0XgkwsPcjgEyjqbxEOFzCu5t5ProS9Zv?=
 =?us-ascii?Q?+6SreuKQDkQAtDt0v4l7iGQchtuUhh/O5zwF/tRKCDd82sJGf6tpL3bM0tvn?=
 =?us-ascii?Q?x3SMrM78Xuzid29INPg5Vy/D/thf2XEm/2HPuKFfcJkRaY3f7srFo0pDdvtp?=
 =?us-ascii?Q?0JbnfBM/bGE3biun/XSKjcXQUJy9seLzji8JHO8APZzLd2lL8GKGEGPe34dL?=
 =?us-ascii?Q?X7n9FWDdJe0ztXeqcaoKL7MDrHQRyeBvcWIksfQDSmjpUasuI289Y2wEPA3X?=
 =?us-ascii?Q?h/qaVa8tcdn/vTnYP15ij495Jr7mM425o3uQQQWryzdhQckhoQ9BAebZw5Vi?=
 =?us-ascii?Q?NM6yTxvMqfApM6s9EuDD6QSgorQobb1rV4PAoLo8KVTwOUWubfEUzH5nJcig?=
 =?us-ascii?Q?C4bdhn9G0XiGRDt7tubXcBOey5fZMdRHHvlRmdCxNHEVXa1fgw2DT9pkIPIM?=
 =?us-ascii?Q?lwF/qzCLihSGGzzouRBUpTCp3DtoUq9SkzT5n/lUTwLKBOtqT3PxYUXWG9IX?=
 =?us-ascii?Q?sciXFvhnD31Ci+mUSVxe5ss9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c20949-57c0-4a92-86ce-08d92b571052
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:58:38.3719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z7lmv7lfKKaLC4NWlhGZbnqjGw47YE9lF9ehkSYyP7ltX38fnb/iFv2saT0VqdZEJjWaD5dlMm1zt/6v2FRLpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4484
Received-SPF: pass client-ip=40.107.82.120;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
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
> Give the field a name reflecting its actual meaning.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

