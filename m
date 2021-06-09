Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7D03A1861
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:01:12 +0200 (CEST)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzhf-0000CK-CM
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeB-0004m7-GE
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:35 -0400
Received: from mail-sn1anam02on2096.outbound.protection.outlook.com
 ([40.107.96.96]:16654 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqze9-0004L3-M8
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5sDYVrD2uw/In8x8UdwpKM+el6iNrXFW7dkNYm5Po6G2i5uXmabqTgfYUCKxuo0WKiRnHnpp0qD0KVQeB5jk+I/QKWuKwjjURDoI+EWUqPXNfmSLKC4fO/AhG0P6wphSWbJvVbCv4WVUpKEOddcWSHcNuQOnPXOFTf9UTquELrAeyFm/nnehaY990l+eh5Ni+8ksOFthJ8BF0tJwdaGibaD2kaDkl9UFxR6fKaTBZJLVX3NB6vqNj4mEMlQznHlk+gZ3YTHwrYaMX60bkqOOHzD/AUrdNWevKm8Ska+/67FQfdnjSHkzpc1yUBswMFIE0Ey286Aa84Emv4ZRWYjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Paqk2FoO9HImSKnaqe+JESNyaj8vSjsAqUfp0Bc6XWc=;
 b=kCFfgp99lyWXv9YHGbtANsoiSSnhJ8UBD2d+YcwXn4KkpteQzugz1+KJdwIFD7sOalCAO6Dh/li0hej0AM5KV56uBJcYJtn9515CLULs9NLmjWQX/MKRPdql+XmJJRetyT5I+VrIdEDLIcf/foLSXOjbYwnAJvdpVEFbE50rb2961iF/0QjZBkF6zKJKtcay7HQmGWYbMaPTNWgJ9oJfMc0IWGHhKlCAF1I+h/QrSjcasV5WiSMt8axjYkaSRzMuwyEhU6tKaC2DOofxgOJ41TWbxevXrCaqmYUoroO38oufl56xBrDw3NbJPhokgNYOmjjU3bcXWJpO7OjxDcPnqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Paqk2FoO9HImSKnaqe+JESNyaj8vSjsAqUfp0Bc6XWc=;
 b=TaURV0pmUXoWTbEednvejcCoaNgOQvqZwV66A9JcTTapG46w4p+MfiBngLrNyXCme8qB3FzgiOXRaeI9Y8dIG11EI9T0yTf9RXCELPlZoLoHcu1kb5NQrxr/Lf/4EDJogdx2yUOkDZ+hswBYL5WGz1t/7ACnKb+K80JN7DbHPpnh3gpH37zyAQLVpaAqdLxCTA7/iF4J7ltNL3IekioJg1rsM2M9UI9ok7w22yIlUsn4PuhZlMye8AudURZggrAaxDzyxpQiADW5qBrHKu8Z8yzAKZWcrisxy14DvCJHqGs19yplGisarnyjcacSoz10v8tlUZZ/MjZB8DG5wL550A==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:57:29 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:57:29 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 06/28] tcg: Split out tcg_region_prologue_set
Thread-Topic: [PATCH v3 06/28] tcg: Split out tcg_region_prologue_set
Thread-Index: AQHXP6oS6FNqh85d10ClxIR4pC/Sn6sL+nww
Date: Wed, 9 Jun 2021 14:57:29 +0000
Message-ID: <CP2PR80MB3668722A1161C36E3C25CCB2DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-7-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-7-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4231e593-adf5-4677-7a13-08d92b56e707
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB0017672F2DFA1789EFB5A109DA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cxx7Irx02x/pd4/DSCe0x37f0/lx5gMTT1sFxT6uz/qWkfevOk2IMPCc2ThX5wjES1voA/roEEznDT6lK0XCmc8LENkEjDpUgIwm0IP2YUO4GJ6KXYamGCZdCVKNgAcXLiQTYroL5bveUoZBhgZCJM/Y/pc+PK3abKN47UB12V+UKZKcSKOXKCiiUm4FXBznA37fMHeJJM0jJTTGuc71dTUZlynPbd8NbgQTs55dqmUgPlHoxFORUG6IzSZP+38F+Mc9Q30S6zFK1a5ii5moe3gS6xgbiAXCyFLVr8juaU2V8IB4O6vHdp6tydmlhci9387Fj8Vh2t0DpjlpFN1mmdTxISk7BVeJ5Cx0dRfpCBmRNfeFSpgp/KRuuhS5zKJGnF12q/UkF22Dhiv3XBWGlS2+nDFjtO6Wa4cAsvsLFoE3K51kKZfapT3hjcx2BJylWvTQ5bDF+vz8nnRO/GERoaboDFzAUNKVt5hulhP0nzlGsgtEE1NWS74d+QsFWEts2hNjiOMWebP/0wPl2rzvIbdtAdSXEqOLbDAFh5QjXLSbyDaJU+mb3gzS5dcjJC6UFBb8/qL1mHTI3dLVp+CXRp8tr6R3mzz96fqIKNWE8lyYlgjtczVbrzG5hIR3Owh2PQw84EJ8CBtsDx8mRFvhpNr/Evhrzajd7TIDjveL3RMTqqD6jm6NmojMG0uWTHv0/vdgm/OyreWOXali35vPhkTQ7WE9witqLl0Jsb7xVb4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?AWf7Y0VXkcSAEsXYlXdrhnAjHmYUYOos2yov20wQxQdH6ZPOjlof+bjgDpmY?=
 =?us-ascii?Q?KZVILf+JwvsqsU+xBkw7TZopjTwJRoQJgFvNp3l7ROh46Te97zd49vLd7u5w?=
 =?us-ascii?Q?6mEKH7A9aMd2pfc4e8SpkoeAmyQRgvjHcdahJmWprzTqIPnLiwVQz3jDyQzm?=
 =?us-ascii?Q?iqcPLq+Fy8Xbkh0Eu06mz0TeXFIrgzAWr94l4cnFZr1dPXLxNqQUBg7p3ewM?=
 =?us-ascii?Q?mkWyZygvNJqhnejuqY8UfJ8TcT53r4nHwLl2y7ACPO9nmDiftnkJS2ubX1w+?=
 =?us-ascii?Q?VOzJWQrEGzICer09Yp7NiLDQC5aFOuL78BwadDaw8mnx6JOe2HxVWI8Ruoqc?=
 =?us-ascii?Q?5ZMjVOftgGzEWRYu8ZjmiMIAsmcDRXRRRL/4JzB9PidjWGhvPEMr1elE+P0m?=
 =?us-ascii?Q?Ba8a2i066HrT+Zq1jzR7TRkJbCPx3hiZamqMO8kOcXhrfW9SGDUBNZBGyoWP?=
 =?us-ascii?Q?Zrvm1fde1UBW96d8csfLnFyyawq22OnQN3TzBFTK5ceMMIbrHA8Czhlt20HD?=
 =?us-ascii?Q?wir7+T9mBtuAe3t59kcwNUx9ZWyKOBXzDbWYXeH86c5Uf00f2DPecbOA3Ecy?=
 =?us-ascii?Q?nquWvas58uAs8vUKZxle58BRXw0pck77hw0ppyZcBtgS0WEH4NQRBsvh31Mp?=
 =?us-ascii?Q?zvNRR9CknhpveeQSdRC9R79ujJbVNBAt1TjazXyeexOXINUwvhNdMY4vj2NJ?=
 =?us-ascii?Q?KMUhI3fLIMlTvtzOxXsambbZG4FVmrHs9lBXpNzHjS7buNSuWI5TlpRSKEiP?=
 =?us-ascii?Q?S4nzaB2E9mB6pQVU8q6UlYPCRF3rtOvC8ctWuHF3H5QHsQI8BZIeGs9wl3K4?=
 =?us-ascii?Q?odQ4j8vmetxb/HR6AxQSbIOBKcqRN4WimTa+G3aQPuff7dAjH4RZs7sAMu3Q?=
 =?us-ascii?Q?rNXVHd/tsDrJS2utaM3h5fYT5XDLt50XUJI84FfVZ9+AvNUHBU9NgOOhs7Xq?=
 =?us-ascii?Q?ZGgcXRDt51lPfn3Cap0EvNfnfPOhGq/EQ07+6GyOKMD3WKcUf5LK4fd3Ylye?=
 =?us-ascii?Q?lUrXZKTAE6iLm9TuV+gze1XPUdY04E9jP5nDxLB/ARPusWmWcnmDa4FSRQyI?=
 =?us-ascii?Q?I4xwgWWlFDA6wJPQP5qMLeiqRJ559oa5YqPdtgRVmVTDihVviMU6t0FZDjYT?=
 =?us-ascii?Q?4Wds+ZGJBz5vY3vVEkJPy25wvuRDXtohOoVbW4x3JJAVGFe4BPtfMGqqKkYF?=
 =?us-ascii?Q?+98ovICya/z+zf7Jio41tJp1vAVm4dpBvC7h+gN5dVfaVTWrS70QzMvPawbR?=
 =?us-ascii?Q?lL4PEyu4pqjRFrWIpr9GUrNI03ED32C0KUMzh2W4MzAkbloSuvV4RXc+B/z1?=
 =?us-ascii?Q?At1Zw3xd3KD8P6Lf6x/v1Dz0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4231e593-adf5-4677-7a13-08d92b56e707
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:57:29.0945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2+qdSWr+qw4UGM/I09zLDaem5XPUi+eQvru+x19XfdMhcI4jSTvxRVD1SlYM7EVZgTZCyrGvTVHhZ+MEEGI0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.96.96;
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
> This has only one user, but will make more sense after some code motion.
>=20
> Always leave the tcg_init_ctx initialized to the first region, in prepara=
tion for
> tcg_prologue_init().  This also requires that we don't re-allocate the re=
gion for
> the first cpu, lest we hit the assertion for total number of regions allo=
cated .
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

