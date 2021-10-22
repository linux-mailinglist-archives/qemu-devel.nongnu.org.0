Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612B5437C44
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:52:11 +0200 (CEST)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdyiA-0008Ve-Do
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyRU-0005Wi-EY
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:34:56 -0400
Received: from mail-eopbgr820097.outbound.protection.outlook.com
 ([40.107.82.97]:12032 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyRS-0007C1-Ve
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:34:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2rlp2KutmeSfwesRMRvdt3Gt/+tGeUJ8XQ7/vhYw2l18e4VMMQFgSaNyqaOzVX4gDBp5fU58bwYKH1/CKkx+ojrscXhnOxE0D8k/ROrUYXcSPmuJTG9jZFXtBfygM/At3wgOIJ9+kW62PFUlvoYsPV++AbnrJKMfarEaoFMUy5fdlz5p5SnskfF2zdKAo2gaA141AzuKqacVX/QlwPcu0bOD5jqZ3Eq6TZbFh3dHs0Bu8ZZAdSV6nWaNTDApzRq9Pksvzd5embjFx5Bhyq148ctlJ7kM9JOqGITaGtPtBZhEOL8Qq+9N7klpvIqb/AmLzdexmidlGshahzX/VPLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hWWJFXKAvjqNKUvuU3Vr161LWGf8DLjvsusLDmXpPU=;
 b=MRPOKxEyROBmrucjAskowl+bRTb1qHu2f/NO68ZFD4GQVyEnhMgQyTsg+WZDCT2jMKsrwpSDa9MwPedtLD9eXIH1IGVS8y1ublgSeTIcV57Yo7x/2wLWkBsL1H2XgrNqz4tCXGnmA6/A11IKljm8R2n2RXUSlLkFLQbKNqhbg/3lCh80XV9RF1hTHkznUxTfsk96JF2aQp5QkOXSsAXJkhr6d/bLG3odDfLjku7Vozc/O5ZNvrxfYSbh2b3yPjNCgbmpLtypAxN+c0IwQKP6xHMlrMCITnBD81E8DR2PnE2Z8RL5D9QmxbMTnsrzXmF8hLfBXLPCJtDitPIdK0U5cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hWWJFXKAvjqNKUvuU3Vr161LWGf8DLjvsusLDmXpPU=;
 b=JwtXRiyON773P7Tf9fprkwqih/gDXAlveYc9Gt8eGF2wyxXqda4nIMzbzn2w8brrTOb8UDByz5kaWTX7DefcauUqzT/+QvsHiqvOY8zYXRBR8kprSRGjAqyoTLT6P5IPJpBWO2Z7shsQpUvn+12PYQT67nsS8MjnMvoCRolFdjzu+NcEEe0Z/tr4CKGDUC3MFD2S4gjfPNC/RhSaPY1d5XiDZDXPshJNvXaav89UvTJ7Am3DKK7kW9VXGrsIsP1jLUv0t8NHKrtKSi4gw91PmtVPV8SVojS/K4cAvQkGgcXbA/0aHZ7oLz4Tn18tCOUQqQOzJQBUGFgDruEs1u1sNg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3924.lamprd80.prod.outlook.com (2603:10d6:102:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 17:34:52 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:34:52 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 24/48] tcg/optimize: Split out fold_extract,
 fold_sextract
Thread-Topic: [PATCH v3 24/48] tcg/optimize: Split out fold_extract,
 fold_sextract
Thread-Index: AQHXxr90KyNYr3f1iEi0Oukw8mAHsKvfSK4g
Date: Fri, 22 Oct 2021 17:34:52 +0000
Message-ID: <CPXPR80MB5224EF9ACC37D16F5560064FDA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-25-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-25-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c92acf3f-53d7-428d-7de3-08d995824153
x-ms-traffictypediagnostic: CP2PR80MB3924:
x-microsoft-antispam-prvs: <CP2PR80MB392484A46992F8CDB84186C2DA809@CP2PR80MB3924.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CIrfFqcG0FCaqZktPqF5TtRU4azV47Oa7KzDCGZBek+vnveaPeQkc1UmEmIbjAmIgRs58on9izUxZQZ4m/GqVuy2eVEz1tUYTJXk/9B8l/zaCu5zniR8C87qxI/O3XEmY8+k82c8mli+EhTidGcf6A54l8loykBSUjR6UQj2U7iqt97FMe/nMZof2HSx1NrYvnTllU51NLXbQt39Jyy/RN7Lb3CC/O29Acl2jERCLF9nH91UWz6DRnL0B5c/HiyW8yBjBXh6KX3Su7Rmkb4aTTmkEj7VywCkFBnz+7y3WdhLpfcanRME3XN4/a+VU/MUzWxafhJH3G5lfexc2LtajgIYZtWQ1kuLUl0/MTF8pYhaZjnDBI1ZjlPJ5NdBfVQLDVe1izhxZ9U8GEBUwIL024nlkJdi6bJx6DzretoZNUQhrTsKCrvmdlnR2079mqBe6qjGFZykRm3heSM+62MxiQjqjpusdJxZ0TJYaKzEOr2DTzpgm8D/n+XNPCBEjEwr4lOUT43LBJTsnxh5kvbmmRyMRJGqnfQVqo15OAywsoSwviRaJx0kvntaN8435ltTs+1w6Y1wfxdkVZePibLta7lPrZ9UjlPCUJYULq/voccUB4RZB8ny4DBjg5K5jIPpyK14+J9It0qmVg5Ycnl4IjsyW5t1z0nE/BlImE7IrPtc6ZRaCsomBDKAjOsbwqg75PfrjLjqYQ9A8hQaxa+2O2iAbFIXgr2nUwWvyvRw4CiAXxOk6PprEvAjyZ2Na2Xhcm4UDUzK0vVTX5CFB/P4CiH4+91Uqj8XfT7kyF0hylI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4326008)(186003)(66476007)(52536014)(66556008)(66446008)(316002)(71200400001)(9686003)(33656002)(86362001)(83380400001)(64756008)(76116006)(55016002)(8936002)(5660300002)(2906002)(110136005)(38100700002)(66946007)(26005)(6506007)(558084003)(122000001)(508600001)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lNeOggdZMPyc+I2a8iECv6sGo9DPG+0hq5ZgsXMIPpYghbV8laxXAZPQN57q?=
 =?us-ascii?Q?gFwBzT71v9neXB/bh1JS0HHb6tvO5PTipnRnUO/8niQXRE1WJxikutJ9W4VY?=
 =?us-ascii?Q?6xXah9SdeyFou4Jsb0nf6NZd9PdiIAhSVeYqyrh4y0S1cnCF8jJ+UJk6SY6H?=
 =?us-ascii?Q?uLiT9LjaRo4D51VBrnqC8W3w53OR54++atmDtir1Un36NjaZS3mi/1mUvqQz?=
 =?us-ascii?Q?Q2YyqnGsGdvcn9Xc1hc/MOQLpSFbJaXYL0ZMO5uwR3Nm7JR0cXP6aXxVNkEm?=
 =?us-ascii?Q?UY/RQD0PJN4LuwpEcAc3z/h1HdQsabGnYpPnUvLQb8c4cTulZNZe2VcFZCWF?=
 =?us-ascii?Q?7XONq4PsRtqsVa5k1AkMzV0GLVD1SZRzILanLjw7w6lkM6uvQZgQEy0rFshS?=
 =?us-ascii?Q?TdyDj/VR1R0CvQL1KqkbFCy3pVzX33imoFviiasfd6k9j5VNEbtR4N4mmz6t?=
 =?us-ascii?Q?11yTcrN+SpM7N89Hke5yUCRr0q/4dNvLMKDnMhbTZvH9cI2yyRf2ebivup77?=
 =?us-ascii?Q?98Y2YvRUAYg7YUH1J/RScTTjk3hxHQ+1GzIzZbUZqFmtxa6cBQWY9oDAGipd?=
 =?us-ascii?Q?HgTzvICdvrEt9Zsi5mQ4qm+d7a2sq+EYAP5sXCJzPbwkcf70GoiqAcu73FX/?=
 =?us-ascii?Q?IOKpNzCHd5E893Z+LWAWLih82l5nxIt/lewHh9Yb33EyagunJvVOkmfdC+Gu?=
 =?us-ascii?Q?zmz863xJmLdHb1qJmMm0Px2SKlBa6Sw64gcOzVSTGoOGr7OcrB/iVzyaC7Vs?=
 =?us-ascii?Q?xYy4BbEnlVG/ueyWAkAfoq+yMmIMlHqM+PwKdjjL+WV4c9Wfo9ZkQRlhSQQv?=
 =?us-ascii?Q?aiPhgRO0nf9iI7oPCHLiJI2tLxx6xoEDyj6TeoWhSP5BclOjgoMQba4muD3a?=
 =?us-ascii?Q?8mKmIlAL6EIR2tObGM0POhnBeB7Y5XLEvbT7zFYAjcc6B7C5nTVjWPN5ilpQ?=
 =?us-ascii?Q?+jtoDl36d+NTGKxgq3OtScyRJnxEJsizyUyhCKakm8/2xyxryw9pFYYMrNWA?=
 =?us-ascii?Q?84iwWs7N9wzNLehfaDGrbu10y39BFVO2IigxeJy780br2CdxDKPY9kkDym+e?=
 =?us-ascii?Q?O1m+2JJLgaaVkCWGSmzu+7Ke5xpk7KZVfq4MIv5o7rMrdX5vIZ4Yxwbh5hNc?=
 =?us-ascii?Q?SNhd2f/6JWctYe0OXREc5fa7GWjiqmisSYV+rqV0siZUvqsQ4OKzq5DJmurR?=
 =?us-ascii?Q?+t+8aC7R96cmepO1yPtlmuLdvC2ay8B8P1xnemeKL5EnWGyyg/IdhwcEweAr?=
 =?us-ascii?Q?tYtrmmHFrii2AGOt5AmEMo/eELLCAsmqAaI88j3nr5o6ySuT/07sKY5U8m1P?=
 =?us-ascii?Q?WGrc9oO/P3U2EbBOzI2mND3+ojmKnelEVk7fqOuunyVLofPs4AZLjPbq4tP+?=
 =?us-ascii?Q?YBZOqMeaiPzmiHkbL5msw2WTg0isDTBhu4ixtXfixYTC7N7XbVArPkHEevhL?=
 =?us-ascii?Q?qq1+NxUM+8M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92acf3f-53d7-428d-7de3-08d995824153
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:34:52.3633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3924
Received-SPF: pass client-ip=40.107.82.97;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 48 ++++++++++++++++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 18 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

