Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B762F3921DF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:17:53 +0200 (CEST)
Received: from localhost ([::1]:35672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0uW-00072y-8y
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lm0qu-0006C4-UN; Wed, 26 May 2021 17:14:08 -0400
Received: from mail-eopbgr790099.outbound.protection.outlook.com
 ([40.107.79.99]:28867 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lm0qo-0005ev-QT; Wed, 26 May 2021 17:14:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dysZS9UxWVa7D15m44Pcm6HBxiKWv+N4G0gCVUvIqrJSqC55F0zFWgh7wrYB539RoW0BSr//rbxBqWc62iuC48SSWkUTs2NjOljKaicnQTt4+c45ZrYVpB8HYHzSF0gTfaOA4aOUyE1p9M+5bLw9LbBE0k/e86NlRe4ujAasBEdlZxCkB7+pkJK2zXl7PHkCBufYlUcS/eEdWHHB1Zd7RD+G8ir9Rd0P+XujtWLTnLUv1LOEsEbJKURalUlM1vJ5yFG/minds/fvAZtVS8GV9f1yk8a0N2xEZe1X+mmbPNuDypCc6VaBNqd93v9SDv1QAqP1bTkbcJuoeffMOsi3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaJKN4W+jZlQvLsvFdM7KJAS2Q2BGtVrHVrRhwWl4vk=;
 b=m6ITqb5ATFXceNCtum88amDKyKPLel19scENcrGWnSPG3uUxTkmwG9uzQGGtsRDZRXiTDbmBqOkovS61VROPQ7kqFKKRfT9GdINwDFtO+SHsDspi0O1eq6fbH2a6O574sQB8pDQX+/geJkW6tjAHtMNgotr0sA6Qc5sGH3w7ILVKT1DX1ngb10tp3Vu3/PXoe5EHFYFhufP05yUqVn9oSw7ewQQ9/GygPp/j+btOlgK6iEpPdTe9pO5P8XSng+jESAZNsCTE6ul4IO2h1hV2OVIZewhFtJHN89sw76rMCaka//L2XPfrrtrneyvwwkToK3P06eBztf3SzyQsOHmSDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaJKN4W+jZlQvLsvFdM7KJAS2Q2BGtVrHVrRhwWl4vk=;
 b=Mfb5jt0Xkx39Hh4e4ekaMvkhqts1Y4aLW5VEWtCPhRFVq6FRv0jXar+WyvRzZ5GgtM9sTLdTvyNvSWVqppc4f3hkR7Ms1rpd0bn1hMPspU95Xgf0URne6rPUgdtyWa92X5Jk5rzr1VC+nutl+GQsjuyRSpDl+IeI5Ov64u82osC+b8v0Ylt2AHdnpn2MEvkH6K5KJfu9MD99M3Guzuqr+CaAgdjznAwIy4nNNpMPZXOv9L9X/Abx9yPoBtFidEdHeUtGSFhD3c9TwEizOIlq0kT3ZqJNOWOXKmsCm+FW0qrs0R9wEk4kwWBw16JwscImm+ekkpLmK7us3+Hlg8u+LA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CPXPR80MB5223.lamprd80.prod.outlook.com (2603:10d6:103:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 21:13:56 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 21:13:56 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 1/5] target/ppc: fixed GEN_OPCODE behavior when
 PPC_DUMP_CPU is set
Thread-Topic: [PATCH 1/5] target/ppc: fixed GEN_OPCODE behavior when
 PPC_DUMP_CPU is set
Thread-Index: AQHXUmzWBjSM8yM3fkGDvMuYb4OqXqr2P7Mg
Date: Wed, 26 May 2021 21:13:56 +0000
Message-ID: <CP2PR80MB36687B3DEA1BA59FB969DB5EDA249@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-2-bruno.larsen@eldorado.org.br>
In-Reply-To: <20210526202104.127910-2-bruno.larsen@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [177.9.76.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e91d832d-07b4-4e61-0a51-08d9208b2c6d
x-ms-traffictypediagnostic: CPXPR80MB5223:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB5223A7718852D55C42ECE5D6DA249@CPXPR80MB5223.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IsOb2sgLu01DUhHXC3BisKByIlZp8drYnvtzlqFwL3YhfA8KHQvQ92Cio1n7E0sZa9K/bxqrsDKYs5K1wkuKI9UiQY07AYldA2NdbxDrAUANiVAwRSk2pIqUHta0/9HrOecmqBwhFifv9Qk64kqFoi32oO/OPA1bS2Niw0wT4W+DmAX5yvo9iVDw/VHJRwgnlO65p7IUswA+I+UhrmWdXSBLlcRn2u6e3nJLaQvyrMeoh28jR9CQnkqsTKIJlLCGWAorNfLQu0SGPNXYiLoOy+wc/ZdJu/5sb65CDIFBSBLYjhE0owhUq6HqZugwWMnZCgUING0SfcBhTCFfgYARIK6+DhwauQiMZGlJo+s/sKY2wEwDFuM1T6vI+IxYMcvlw0nZ24FRIaN3/EMA3uesKGhV/XnVXHnGpGmVtg57zKDY4Fy7PeDpTJbIfrhkgMyxs5IWiaN09Sl/16KwCGv0v4QjyZU0QTXwHsTDhWSMYtEM/AAHHzu0hoWyzFW9tf24QhCImldwed0Rvmjvw+mB56OI6zi3JsrTCQO9QrbGbnz4gorX2S/h/r6TtZ3qZcA+GcDfH8k8Yaty106Nbw6iJuD3mmxVUHuP7VhX2BXA0Xk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(39850400004)(136003)(396003)(26005)(54906003)(9686003)(4326008)(186003)(110136005)(55016002)(8936002)(86362001)(8676002)(316002)(83380400001)(2906002)(38100700002)(122000001)(71200400001)(66476007)(66556008)(4744005)(76116006)(64756008)(66446008)(52536014)(6506007)(33656002)(478600001)(66946007)(5660300002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?K0JZIClRNTvdfVqjeH7h+lzXkDkbgSIsKWjxrA+RlD9a9H1luH+C+cCIuYW8?=
 =?us-ascii?Q?GVNBvAXLTvQ81B73e0C8aKVnXFJZ0+G5XjsPBZ13TnDiP9Ede14TD1TSi6vP?=
 =?us-ascii?Q?NXqO/cS4YGbSf9yQRmT/x2wa8zKBiJ5vVDYWeZTr7dm0qyE5s9XgeZI68U/8?=
 =?us-ascii?Q?eEL0iLV/ArecDPQZqnlXI3KXxEDhDtaJ7W/tNOgvUOwtidr3tZPs4+MCb703?=
 =?us-ascii?Q?vXWLg3bgBwPhpgDBXWr9zVPmgHMuKKbfiqepBHq4GeBRYMTFDpImDzLchZEx?=
 =?us-ascii?Q?1Ng+poXoQTLoyF32eVMWXWBleFGt/72OLjYv7QoKD1VBjbIndcy4IhKtLupT?=
 =?us-ascii?Q?2YFiSNCeaG0cNONkbJWz0CS8aGo7G8vma0owcUoqljMmdXgwQ6kfWQFufRLL?=
 =?us-ascii?Q?mFOVjsV44o1swz2ErzwQ1Im6vuUhCqpLJ35wp2pr20dhEboUaNXcoDqNgktm?=
 =?us-ascii?Q?s61FcNkiqw5xCdH0IeOsbZawtx139aRc13Vfb1bIovaz5DQ4HJViclFrfG93?=
 =?us-ascii?Q?Pc1xY5N+25iWqKK+avdoMa6TVFEfR7XCH+T/BsYZHpLxX5MywRJ8CYS6KhB7?=
 =?us-ascii?Q?OsTRPrj6J4iaeP7GOsQODURK6KRGEQJ5/0gxY+wYE/UllWGN4hmPZwrXKTWN?=
 =?us-ascii?Q?Bc0ib0DEmYMZD3/rdXSsf55w361TRTM8QmVBsvcDDwn3l5Rxi7Tie7tgAWaX?=
 =?us-ascii?Q?Adegmh2U2hWi2SWKhUZH+y8gPrcAEIsEXntdp70FhHS7Fe5qxEsH5aX9lkWr?=
 =?us-ascii?Q?Tf94vjnlHI7OUEkHxhLguJFwGLjhrmbQSZI+ml7Kpi1SEfzjmB/1on3fQ9ME?=
 =?us-ascii?Q?iRPy5evSTLSDeD0cXAjR41J6lMi+NK47092RfNRqNUGaCI4M8ZIg5KSQFG3o?=
 =?us-ascii?Q?uouXqywIlkDOEANtTmUm9+1U6ACYUZLgnmWGLIEdgYI4JOwLWLzvUbboTfze?=
 =?us-ascii?Q?wmAHFOvcFqMvDLBemL9/pNfTTUQ8XGNghXLRNYvdssQreNC4PsTHe9atZu/4?=
 =?us-ascii?Q?V1ckkw8akAVxNJdXESMp0grzr9J86BOkBEGLf9iBkro0VqP3oHQNXb2qJ9Tp?=
 =?us-ascii?Q?a2dxodWeBDft2vaPleAn0S7jR2587sPirS7VFvKHXUKUIJ70uWOpzUR7He2p?=
 =?us-ascii?Q?Uompnqr2f37pXg5DSQERHrKtiOXuRhFRPv3xWndrTNG5uAVCdbfFwbGuwTAK?=
 =?us-ascii?Q?2onR9lnVvxNL9Zij+c4Ov5ltffFioeW7N/QJEvKjegZEXMpkFhu0+33CLwue?=
 =?us-ascii?Q?NPW52TAQ8v0k1Vf1XirRl537KIaHk0jp2O/2js4apSqeY/NgpUOX/ZkrcEH5?=
 =?us-ascii?Q?8Vw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e91d832d-07b4-4e61-0a51-08d9208b2c6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 21:13:56.5333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uiDaO9IKgfvLz5jTclEAClvtcSb7fYRyPC31iBN3l/+FHy7h37pm5UrlF7YO3QY6lHdYdv3HfaDrvhAWkF7OMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5223
Received-SPF: pass client-ip=40.107.79.99;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Before this patch, when PPC_DUMP_CPU is set, oname is added to
> opc_handler_t, but GEN_OPCODE* wouldn't set it unless DO_PPC_STATISTICS
> was set as well.
>=20
> This patch changes it so those changes would happen when PPC_DUMP_CPU is
> set, but not statistics, because the latter is being removed.
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I suggest removing dump_ppc_insns() altogether and 'oname' along with it.

Now that we're moving to decodetree, dump_ppc_insns() wouldn't show all the=
 available opcodes anyway. And the only other locations where 'oname' is be=
ing used are when registering more than one handler for the same opcode by =
mistake, which won't happen anymore, as any new instructions should use dec=
odetree.

Luis

