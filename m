Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95624355EF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:35:32 +0200 (CEST)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKBH-00022C-O4
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3u-0002w5-Ex
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:54 -0400
Received: from mail-eopbgr740135.outbound.protection.outlook.com
 ([40.107.74.135]:53168 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3r-0006qY-N8
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCMAEN3Z4eFyJEu3o0n/tMEBb1JTv0HzpjcAaZtFRZGLJcT4r9PFIq8li2FOssTuAjEkvuETfoXA5sYZNySHw8GIfIxEnb4N3r6mWNd0nkIurTwFsG1fLQd32Y6OTrlV+U2g8EFSCo2Z6jq9WtJySOcRvlxLLs/Y9q7tPJoLqMwbYl8POqHKjEIzYvLi1OMrULqfaNX0A/xcwSo7QaCjH6u3V52sP/KXLfJ7tLBLDvrRq61FUeBahVsgFzoTJiQPMairhG6QqehGv65ReIp3qjr/08VXYXi5kS50yaSoOiZaPdOp4xrymXFjIGUURC21grFDO09gz/DQu6TKWCM0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/aSh/hPRzdkhQHUmKKT8L6zMGD1TBFqx1KD/Nhvbfg=;
 b=kaLxLMblGCuUIm4P/vqqoBbumrwOzDnIS10nevgyS98dw2aPdCmpccl3WqBFK/h/E/2DnseS/mszjziXSk8ugtZOh1NPk82w/0v9/N/OXbTSqSFhw64VY/LbylKFyNhyVaFgqI6aVRwJvkBZFEA+sF0Qmc7p7nAstFabvTvExxJfuur30DstQ8EP72lmcLPv1D5B9nJXLQJuOTiFH9QdkERJRAXoLLNb7NfushsXhNIogor6sVImUF+rfo3wzQx34+6y/fXyqKsZb4Zs0FMvwmdo0Ckm509czfJ2UiAENNIYrhCj5LbEGfBe9N0Mxc3s93v9a9xjZ1bGVYe1OqmkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/aSh/hPRzdkhQHUmKKT8L6zMGD1TBFqx1KD/Nhvbfg=;
 b=jSbXDYzkPkjynqQxD9YwHCZqrUOQ63s/8so3Ztt/O/hxEYCbzoUlGEmuyHAV4Iuq51s/HXZ48pudej2AT/HKxQAGGr2mYsGmJXUgdKfMFcl4t1VkpZObL55eFlrHbVdta0sKN721SXLZXO44PWnhXjxFqlJXS3TvKeXpWR+usTdlwa6LZ9CF8QQP5UuSuEhmbnOGJFD8aU2kxdXIcrSDMmoHmk1D/hJCe930vx4T0QbzllDEi4C/w8/dWOknqY/zld4uBJYWQuRonYeYGdfvuTAZ5XErXqFbkvzG8PnuvzlV0pvvW2WjzZbAbvn3617dQj/oeqC8FewdaCmcXWwrLQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:27:27 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:27 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 14/48] tcg/optimize: Split out fold_mb,
 fold_qemu_{ld,st}
Thread-Topic: [PATCH v2 14/48] tcg/optimize: Split out fold_mb,
 fold_qemu_{ld,st}
Thread-Index: AQHXu7VUhLToBOY1IUSbdG4hwRjvbKvch2xA
Date: Wed, 20 Oct 2021 22:27:27 +0000
Message-ID: <CPXPR80MB5224126F881346870B25646ADABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-15-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-15-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 439a1560-7925-4b73-99ce-08d99418cc18
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB44821083269C7B474F83D481DABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QvRiEgHuOctkEtNQSliAyTFrvImPTLSseLoraFbMhhdFgz4RU5X6WUggKL2Jg4NZ549xIyHZ79778k1LOfohKmszHkRz3lQ4VTiqX5iJ29WDvgivKPqustet0hbqbdsjRU1aejE/iYPyAYl3PrV2TNtmxaGUrVraKsjcVSV8wi2WPfIWVO4CYPfu1v6ltzEC/RKjQ2ZxgNdQMVI/6FhgJkke+NayfSJN65OGOf1Bh8i3Y/Jj9HrP8rHd2jc0DXxiXGlghvk3fPPRSVt1wQ48jw8SEgQOGiaORZ+NgHrFDmcPc+nrgJdZdmEgVmXxpt0dYNX4kQdPmnCZ85vpck5xmkxLaaMflTTCaAxe2KYgyvxFsEbog0LMHqpeINQUTc8DRd/O6hSIYGENrNT5hrfaoflrRL3tAkKVQiGdfwtdUjVWCAuyc37p5ZqaV4Di0MHqEfbzHaehvyGQYgGkBYxk2po1hpZ7F3E1y7rNNqnExy9ygBBE6PD8eT9XF3iS4trRIRUAEwPfumk1/0SRcYj7ZCHQTVQ8owQdV8KiQF3Ys5YUqDL5AQE+U3546FH5+3siShWponKqquWOk7SISrY+VjK8zSUEY6O6TVSp+17Zv8GZmMw9TVjK5xvFVVeJ7koZfVpfTZlhCvCqIhp9dxlYAG8Rlmv1EeBHOblYtZD3J5wXDbFB7CCrZg4nzkVIX1AM61taQan8sJxkjtVYzN0usrUp8QLpAsHgriOUT+rs630+xzwgPRniVIV4DCH52gSyDqFisRlSKQ/yO6N6jg64Ds0qqMoAd4WZX6oNVz0uvuI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i7JSE99cs5Sy8UugTcs6fNen2PI8e7aADFyibfhLYPDpW/RlTba7S+OfYDSw?=
 =?us-ascii?Q?hjQrMVlCbZRruI++MpuN0BsQZE3Fu+4JoccDqrfcYUlO+7cO9dWFjI8RUu/r?=
 =?us-ascii?Q?7LF2XwXrEJ+cPLewmsmk+HcGfvSiRONMF3wTfzWmEllInXzALyFQcCMYBoMZ?=
 =?us-ascii?Q?lrc6QDGszk7bilbQSh5pAyt82TN4yEjGgWl9RxE4Crhv5LSS8tCNQfL8hDR+?=
 =?us-ascii?Q?xVA9ChMJ8UDu9KSWUPRdd3UqxjbVoSY7LuFICVcPfuOXMVFWetGKGuR5p3N2?=
 =?us-ascii?Q?9gZ0R5ubw7tSkPuEUGKmhwLrgXFuRlFrFbAwjDEA/qUbG61u+Sk2YYrXUjHh?=
 =?us-ascii?Q?gK/KcRFl646KqobUVGaJLM7ZYm1qNKpJ6k8yml8ClFNO8rkh4+lhi7v/+ja0?=
 =?us-ascii?Q?KINTsc8GXEVNkogtDpobVwjlbijj5TWBMBxbthgLhFTvjtLxRSISBWtAU8i2?=
 =?us-ascii?Q?mLyvZ9slUq0oUSxpwymsuPApwqP1uSVpBXuEgPgQaKWY/O89F67V9YKQQv/R?=
 =?us-ascii?Q?0ThpH6IU1+Nd0DMnuTl6n8EbhjNo6Oh0Lff9dmBiweAA7QSj5DOcigT+tuz5?=
 =?us-ascii?Q?H9Gkntej0w7iJU943si7azQkzAa67vjAQS+lNb3fXsiCul3j774RwZR1dugS?=
 =?us-ascii?Q?K7aS7xZn4VkTwaf9tcjpXbF0D/sIFeIlW5nDEhaSKLYAfCaDjfXEXMj7taWQ?=
 =?us-ascii?Q?MqdgDFL5po0tDbvV44f9WNS3jpLM6y08IHo2eUmnzXzRh9ddAF+AedzrMmpo?=
 =?us-ascii?Q?AWiVhxD38RYMKORONNwKwc7Nnj8Of8wcrcSDBGSAEuyi3SQ16sGavfqmJGki?=
 =?us-ascii?Q?XBXn+bBoffaCVNStVXotreYrSN9uUbRfrQrGnUSQWX42j5BLjmmMUKq5hAFH?=
 =?us-ascii?Q?p8W8x4yaX30jFkDUhmwrJp23EGMqzWSXNgSfVd5HiHt+djkcHeLRnFStg4BM?=
 =?us-ascii?Q?EfilllmHTtDb+mIjq0YIHOJc5pNgtGol9BeKNFzGG65uJE73SGS/z1C+CkSx?=
 =?us-ascii?Q?yjnh144OKMmazA8l6Zg+2/bNUaA1KVifHRBB08emK6yjr84hy2PlkwPWsnPW?=
 =?us-ascii?Q?CrTtYxQiaqKqAz0BwCKh2Uijrjzom67rtECMKfwIugMqLsiVkS4++7O+IHOq?=
 =?us-ascii?Q?z3OpphOFBnwK+CBYNh6cLrqbWyR8a+wgqivZUNA2+BTdiK2cGK3hubpTKsup?=
 =?us-ascii?Q?bwajUAGYVZ4vuSv8Bl+8RUNcF/1IChO5N+e9GV5UunlERGfCB9FuaVkKTEen?=
 =?us-ascii?Q?lGlfbyrgGeSZ/zEMN0w9GKofPfA0VHJXyXJPKeDXw69nP847MJe7J9FBCG/L?=
 =?us-ascii?Q?nOiuH0rdQVFiWsyig3RpVUFB?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439a1560-7925-4b73-99ce-08d99418cc18
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:27.1977 (UTC)
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
> This puts the separate mb optimization into the same framework as the oth=
ers.
> While fold_qemu_{ld,st} are currently identical, that won't last as more =
code
> gets moved.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 89 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 51 insertions(+), 38 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

