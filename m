Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B84355E0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:31:14 +0200 (CEST)
Received: from localhost ([::1]:54248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdK77-0004uP-L9
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3U-00026q-GJ
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:28 -0400
Received: from mail-eopbgr740130.outbound.protection.outlook.com
 ([40.107.74.130]:33335 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3Q-0006fG-E0
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgTDnewQ9bhBcyr0Wfgw8Md4E37hGst7p+BuMHPFs8DLcowOPc5CkPCma4JA2VMHPJeO/vxnialJD2mD1kPYdAX8VXxUCG+jKZm6i7lUEKZO5TOPjsGdOcITZ1T6+0YC3xX7tp1vyWyrh4OzFwxrXr9NMc4IqbU1nFQVX8ICD36xavagEUm+nLycT4rF5Uwq2e43gBDmA2tIY/KXX9XBMYIZzitr7IXeyHbUi4GHvthhb7M0sDXtfTWV/kk3Faa3gX19va6UYEQ6hg6TBwa7U6Uk/RqG0qmSyp08JbIsoKbHOw2lGIx1wwl+ze1oIvnWvbfUKGtXxKKrwowLHeQN1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLl2wZVTwzJ6sRWPe9a59N8MA9kW+NG/OVbEFlrtGPQ=;
 b=SNlaupFUaAXZypredBPJ2Wq7Zpz2iMXVNOpLEgUb8OuMgJ4qoevZhJiqFsyVJYmZ6whsJfwbtWWY2fybHQxqrQSiag0J30oEdQ9boWG8vtg3H+mTlD8zfVsWdTWl3PLEMjcu7apJX7zsvthh/U3Wiixc0xT1bKy3q3p3s9FWPAd8xOLSbVYL0X5U/A+rhjTHsyqErDn+OlxiJZ5Yu1BzagE3MYu+yz/Da2qJkIK4AQyUxRSigsipQ+NTSVa3KMq7FGnG7ddT5e5q5CA0ujXLoMT69rSPYUoQUIUIJwdPM1RKbNcthYJGnOZ6guJq5nMLOCIK5ulLcI9wx506SadUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLl2wZVTwzJ6sRWPe9a59N8MA9kW+NG/OVbEFlrtGPQ=;
 b=B0CkUxLq3adV1GJnLVM5ljlFHx3YFWcqHVTrPaqvJEqV2wzCwSUEBctsGSHHo+MDfrAnp2KRgpDwHVk3lWjlLmFq/Smzm9kEuVmZmR2bOIoQ06Ni5dCrghxTVjOjJQCuMepNjwxqUCLnCskGucxbweHnEg25x9xDgf9f28qW4mbtKP2MKD1EnW/d+cl93sgWShASK/p0+NIDLm09Z1BHISOu/FYzVefi3xMduryTK86EFTqS7ukSs1l7MbIGEqxqIQYv1gvJpXIG1nE/0iBU50hwc1OhH3DGd2zv841m282UVV4iZq7CCSuEFN8VPdjSeqBMhlOknWLOatXzSKM7lg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:26:57 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:26:57 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 04/48] tcg/optimize: Change tcg_opt_gen_{mov, movi}
 interface
Thread-Topic: [PATCH v2 04/48] tcg/optimize: Change tcg_opt_gen_{mov, movi}
 interface
Thread-Index: AQHXu7YfDlRaWnz+v0SoATZpxeVb9avchReQ
Date: Wed, 20 Oct 2021 22:26:56 +0000
Message-ID: <CPXPR80MB5224BEBA5B17EF42A40A81AADABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-5-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-5-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73286b69-6642-435a-fe1e-08d99418ba0d
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB448240305D9C71EEA9F1F849DABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L3Zu/69agCEaLpIhryulWQsFyL/EieW5QXcZ5lQgLlwG8Z2tTSUESDPtNRuco+KR0+mqzlIUbcaNrIjIyOGplpJEfHd1dswpkzoGRlWc2lYPnaIoRWMtD4AqOnqZtz5LmmZALgVJCXY6nec6CjaaOvGyiXdcbrqukq8Kgh14KzosXrZ1UG9kJMVKuzGR07gAxvuElnHJ1HVWLwkStqQvL/71Om/wWfxdNILXvZsPThEen4pcaqFW+JQScI6gtx2umxjgg0Q/egxGFmoW6LqzSJi2SsRNtTiCOdlqDDFh5PZlQ+cJGCIDVK57DEqRtjOJ3D6OrfApgJ98CQRISuorNTVhCKgqjrNq7gzs+zK0WNikltTLgEt/bPBRFHhVbxk7i/MKYR4B1i6ganueA46dZ3tezgoHhOPd3lqAH6IX+l3/JxFHFDCX3XEr3lrieKeIM2x8dVA7KoDYL4GgiL0F6JoJAMUhI4wW9+yoBRNIBTbfuRYaykBzl7JQOWXHYxPdkfMDJX1H55TOubf2nzplqvZue2xaFT9mzw0Lgl/3pUEKyJtxoObcmiwPilgkr1ndYMv64W+lTv7J/KjPBj+XJmmDsYLMke2lhNYkrPBlsSvh3X1Qh5ih9iOHTrOBK3WSY3+vFlHECsOxgjurFTieYWDaK5F8wnF47gtK0ElHzGHYV/YwF+V+mYSku707+UdnyMHUa3LOz8JTBPBnwFjTiqt336E73+AmFW8y+knmE7eaUfo1hNZPFdC1N43ZVtH60mbiVmJk2+cpJSsisZOpkH0ZE6FxRFCY8WbVIMeb1Qg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v7WgPNULqVv7bEgQmbr1gSv7fjk5AQUduabh34zcnLKM3yKYIVYc/YU+d/XL?=
 =?us-ascii?Q?6449WgrlupWwqQPF+35Waw4+tYNoecrNsYRQp8bpX8HuYXP2FJpfbGkCDSbj?=
 =?us-ascii?Q?8VEggiHhCeQbNVLn5gv21+lK5kOw/XWMW+1a7G4AGLw9cwwQfa8m3vsNuWvo?=
 =?us-ascii?Q?goeGvh4K0bFln7/91lUCpA5VS9jr8zPZedvBUDzVF+GUmRzAcyZ4sfTRgX/9?=
 =?us-ascii?Q?yn5w7wS9jPVslnb1JhIilEP+eRDKx/mRUXEBynRWGLjdduid7VYPvyeDEK/w?=
 =?us-ascii?Q?WfaRFfIsfHR4sN+5tUd76oC+pGOQZI6HnE5VrU1r/YHQpMzomUjSdxoCQE6p?=
 =?us-ascii?Q?zZ+XmLF49XI+wqscMmqF1uiuSO9AVxlhcHBa19GldQd0Xpt9FsiDpk8K8xE7?=
 =?us-ascii?Q?rZZH9dVM5ec+DmcjhmzjMOqmshP2FyLoLF+k6pTyWRNyRoGcVqbmTgZwabWT?=
 =?us-ascii?Q?pJt05cLISc6GIES1KQ4WkTH6ukkbdbeQLyFRbL5TALmDFCuXvyTrQ4Ug914m?=
 =?us-ascii?Q?YtMmRh86jvmdaH27wMpjn4IZMVaXs4KYLqk4wuStvvP8YzTM8fSQJWggWwfx?=
 =?us-ascii?Q?gJthXdj4kSFXEkgU3woqmN6nCMru/QPjIztm7MJ6vSYfuoHIPOFgtk79s9e4?=
 =?us-ascii?Q?X/K7b5rGXuQ0qW3vIXHC8cids+jQ7gd57aLPRyqHolq7pEXy5aShe2By3Tjf?=
 =?us-ascii?Q?r8vHjkifeIT42ChNULbOd6gpcaBPN7sOvvuBXyMDLnD6NgzcVSuX89dORVRj?=
 =?us-ascii?Q?GzoOU2226tB6aa4vL2+XkxXdmSf6+2EPcp1M+1YwJC4L2mXzeOpLhUrpJxXA?=
 =?us-ascii?Q?uiVTr9/e4fD9+DsLEtOuNptrPPW+iuovo6B6mVjw+YNlzHtxgHrltgJlRmaU?=
 =?us-ascii?Q?kHeWoDC9xO5Jbe+SCiwDx+wf3RDPdrTw/l4ooI/bbf1GNpyp781vOAT+fBMN?=
 =?us-ascii?Q?jQ+0+aKq+KTr935qAB7QgJ7yNhcXlbi6jlB2LrpuETp/X54QdXiLCSdZ2+OJ?=
 =?us-ascii?Q?dh31Sd11kpIjY+c+MYOJBZQUGEWTAuAf01t8ZU95ZcHCfDwPtWqQA3dwyUIS?=
 =?us-ascii?Q?U0rhiEh7upveDURa4SH7xMsAAwZ6WiVKHwC1w73HJ9PV3lKaRq28Ht1c3mVy?=
 =?us-ascii?Q?Idcl2l39HxbkLQcONoSQauXCWanaMgiI0k9ESO8z85jIAtBcLIsl2/wonJuU?=
 =?us-ascii?Q?QhpmZFiAcxq4N9LcHaSkBXAmay0yyeHt60fWtux2q9cKrHdeWbPvkexb0msX?=
 =?us-ascii?Q?yI43KAfB8EkmllRsXeEE+oGe6k4p13hRuTPxRngK0S9axcmsjwZs+JajN7ui?=
 =?us-ascii?Q?5Z7+hukYE2fCXQI64KkNwC1J?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73286b69-6642-435a-fe1e-08d99418ba0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:26:56.9741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.130;
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
> Adjust the interface to take the OptContext parameter instead of TCGConte=
xt or
> both.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 67 +++++++++++++++++++++++++-------------------------
>  1 file changed, 34 insertions(+), 33 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

