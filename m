Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613C9437C03
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:34:44 +0200 (CEST)
Received: from localhost ([::1]:54640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdyRG-0003c8-Uh
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyOF-00020Z-3L
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:31:35 -0400
Received: from mail-sn1anam02on20731.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::731]:39979
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyOB-0004IY-Tj
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:31:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deu73IvZIQXaUFekyhH0bPTJ/cqdUqZz4mnGzQ4+13sn9nWLPcWj44EU/TGYUUdhL2AGm8sce/Iimb9+9ndyxeexTHnlUCWQyQTPXiuaQYMOPtYWaH/0MOlqY1UKPtwatvWzcsnwmXemateLLFCxavpHE7LmPxrWpQf046vzI90Um54PIGnvfHqWh0bXqogerKxdEruW0BVExRVqeLqnHquWWxNG4dkyb6fYB1FrT5qxayj8zfPZdwzLXyjWXyAQ8EXZ++sMkweq6HbvE6xEeASs/YnuhyC0XRzTLlcPFrhB7Tll6DedW9+p0dBGLDNcp2Ngi1sZirGkYresDcytmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftFKM2KmbJ6p0HTcE0RtEPMV3UScAOVmVlAjxAc4320=;
 b=TwWNOsmeKPkbNyUFQw6wQ+uBnNObn0m8ex2FZbUqIOVsMjNtjfSgRGlu5RLr4v4lSwElYhWrYJzyzysFFlxOv5I2T+i0rn+5OM7SPWojG+eW5gcah8PfpgmMvnzc3BD1nBYNHIWLK8WPmaZT4ELtTJt/kAucr690PR6+lj01VSE8v6QsSM+lmpH7era1D6GrnDoc0cfdSKfaFZDfXAeq6/caqU1WalFcX+LTAgOzcGynVMdnfkmiDXcZEN2WJkgM5k9CB1/XjmjZH3DH++iwqkTpcxpBsDo673pevauPt9v4n7X1zAxIc88fQhUJZk9T1YefBKget+hzH48Zpnt5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftFKM2KmbJ6p0HTcE0RtEPMV3UScAOVmVlAjxAc4320=;
 b=MqOsLTzqsT5NXwSbBxZeA0EYg7W11L23YkRW7H9Nzv/0+alHOkXZjytpTi2JDDJdZQiaEcq6JZB11h7BjbjZKf3RNzs0idiv8swtRO2M9dP4GX+ZAmqrXQLOeR02b4iBUhRcbqcSYTPUlAw5sHTNlnrXkKE4anw5e5qjJELRdFLkQvFkiBNlWvy71pj/lz1oiLIp3yQHjmJCcfypjrdw1f83bzb8Rv+aafsr9+fydAFC5H+En6HlUXY3n/OQ9CrrsXChA4ERKLE1TMJLF6nvQ6GpS5I6fU1o5mYUagWDGfcrujXIGoqZihgeit8JeHiMZ0LVuzFsEuH92X53iJZ0VQ==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB5473.lamprd80.prod.outlook.com (2603:10d6:102:6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Fri, 22 Oct
 2021 17:26:24 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:26:24 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 17/48] tcg/optimize: Split out fold_brcond2
Thread-Topic: [PATCH v3 17/48] tcg/optimize: Split out fold_brcond2
Thread-Index: AQHXxr9wAmLlJvHPV0Oq4QPoXYkjj6vfRe4A
Date: Fri, 22 Oct 2021 17:26:24 +0000
Message-ID: <CPXPR80MB5224C5834CD97FCC5640A397DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-18-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-18-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 777f4940-3e73-46ad-459c-08d995811291
x-ms-traffictypediagnostic: CP2PR80MB5473:
x-microsoft-antispam-prvs: <CP2PR80MB5473160EF2F3ABBE654BBB3CDA809@CP2PR80MB5473.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XqoMlQchdYAWuzuTQQmkyI7w+HKSstvigzTltdTj0svd54MMYdtb8fJ8Ao16i0oINSOQ39iIKYCx/5GNSK4EDxpj4idsK0oJwepdSHOL6blAogSi1pB+aK856JymJcP3T+b9z3v38MNvL5uQCFsK+MTm4QVmViL53H3hxanByIC9qzNmRzl6vbI3Q+lFkjxijq4L4pwvsJt/wfy3exhVHj5IC/fcZ4aetF/nbRmgQbl4rCY1RrsxxwqddakayWYFFlG/9jJlfu2hseAsMgzk5tCfgwkFPsYt0i6LVtDdQBxll7ugkDEHEu2AGS7PjmR1b4ChUJZGvqo/W0EHD43LmZRDLC1R1/+b5gLSlGzD4SlAly9nSN4MWK7NtsLnQYtWbRsuc/LU7Q+rKd1agmWRVc+qrkMXHC59l0zmTJhNGQZMPgrBt9IQhsleBKm8Ofs8MaBPVrpkpGoTm9MYmccQcynqq3GmCYM8ocBGskRdZm0IkM+C4CqlQXOXWWB4UQlBNYSkMIGp6/Lj6asi9Fns9nmSXfLGyoADkDiqER2pGT3JMSZ9fJ+olIq/mI2HHQyIjPS7nK2tb/HtO+Y4+ay5caHIDCzFVpz6Skxz6OQjF21zScJOOWyPbGZa/dFkpjia1FFc+iNUneRQxQCEzsJcz0MvoC+szaQp/Wk1H3zdrBhGgdFebsyu+DeZGFVcOVEbF9RT0XUDVex2QxC6nweJzZOTZiODKalNgqp7VpY1ulQx2RbHiSEL5RoKU+qV/sbQDvQcJeFCviCKGXkQoOMa50iE54OWtF3T4mZRK8pAYLI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4744005)(316002)(33656002)(66946007)(71200400001)(86362001)(38100700002)(26005)(122000001)(7696005)(76116006)(508600001)(6506007)(66556008)(66446008)(186003)(66476007)(38070700005)(52536014)(9686003)(8676002)(2906002)(64756008)(110136005)(83380400001)(5660300002)(55016002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JzAmBUzytsyx1E0OLuWLEbgCeVq79G3dafmr/8h0ltd35EFynz4PmE8ai40F?=
 =?us-ascii?Q?e6Yd1FkdVSE3gJLVlUGov9CVDcGBX+cdb/JYbyzBnI0uKH+2UEuZr4Q1QNo9?=
 =?us-ascii?Q?uznWipOBD6IoHJ7EiuFFCsf8IMrCyEgTJjPR5h3XL2Kht/IAXGMZm+nnzRqP?=
 =?us-ascii?Q?Z9n8yRB1fhn2AvOqKeeeXxVy8YRM82ZI5quZYe6M4/rMchCrPEdnqCxjsqtx?=
 =?us-ascii?Q?M1ESHyZ+UCdOTPWbBiLx1vPREnsV8RdTwJG1TDE9uj6QG/6P2LOT7e/4Su75?=
 =?us-ascii?Q?3o8vnIukvIGLryPhJsV22CVKFfjLao9ZNI6D8tV5t7HFeznHOZyJQdz05wqT?=
 =?us-ascii?Q?NVFjXVbY5YdqAASeoQBuE5lvgju/fXqVTE0kZ0FzPKjOst0Y8N9PtITLBsLy?=
 =?us-ascii?Q?sisf4BcpXbs0CJjoO5qJHa8K47roxDUKH4/pmbHJHNJTGYVvOe7cN3aXGwfz?=
 =?us-ascii?Q?PJLT1q63EaQ4DvXphnv2iWsW+UUmdZI3tT7MnkgnHTbup0jLH2rG3dcVinuR?=
 =?us-ascii?Q?RRbsBpjVLIBL2eQlrq95REZDALSUF1nXf0Yy5GJz5R1CVekEauxTzntQYy6L?=
 =?us-ascii?Q?tQ/qmTfsHXREVVIZyBNVKY4qotVPOHtpgZknQcdkzwFnIQsduAwDXh0qwUpW?=
 =?us-ascii?Q?kOELQzp/Nn7s00dOxCW7wbimJpy11BxWBtSV2KDN4PPnPf9g99VozrdAIQ5W?=
 =?us-ascii?Q?1hDw7M1440UnJ7TYpHeH9Tse92lsyXTFlRD5s60DARZLBWuVZJlp6Wpfh8Zl?=
 =?us-ascii?Q?tRxqUiQYBqU8C6qG6J/P/wHLReGzpm5a8A+jMSLIYuM2d0kclV04QiJ4QFar?=
 =?us-ascii?Q?iftr5haZud9kBCiuYJq8i9zyq08svIzzlQ/4MxiNC3XKscosdHSMix22uJQP?=
 =?us-ascii?Q?i47JYowKDWu3K9y7oqPwuswPAqin+XKoIFrjOtJros//lvBznmTNyKfRMshs?=
 =?us-ascii?Q?T8PYwAAQt3It/7X9HemiwApmbojvxndU+t17p/V8aon2bMO5wRdSb3WwtarH?=
 =?us-ascii?Q?V5g/KtJGLsqrf+6jfyW4xcivqbkd81i768WKf96kMfj55CiCH+url5aGPHI0?=
 =?us-ascii?Q?mGGidqaC/qgO07ll7Pve/1xOrgmqMF6tFHIfKzvr7PWw3+iqbkMm2knqyD3b?=
 =?us-ascii?Q?66XTy+V+SqvypG4gZXQlay6lI4bQY86eGFn6nnUvT9oE62I46jovrNpHGZTW?=
 =?us-ascii?Q?vUDGDWl80iLqGKRzn2YtIMhjUntvCQh/AlxLyP8eKlAJdlfa4rEsPx+s5zBQ?=
 =?us-ascii?Q?XEQIQIwVKwts+Jh3G4/ovoFPpHC/WWaYueySijH/D087bQrztqBvaCVuw9Tv?=
 =?us-ascii?Q?ymKReApKVNWoFDP/R/4Zgi0wbI1EXVV4Yj9Yl7fXaJcyptDZ4KMJdBWMOScM?=
 =?us-ascii?Q?/qGPwgOtY3Ni0x5CE8x3Us7O/CxONzbYXjVgxTH2wjerVRU4GmW5wqx/cpHT?=
 =?us-ascii?Q?LgD3I+FK/M8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777f4940-3e73-46ad-459c-08d995811291
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:26:24.3696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5473
Received-SPF: pass client-ip=2a01:111:f400:7ea9::731;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
> Reduce some code duplication by folding the NE and EQ cases.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 159 +++++++++++++++++++++++++------------------------
>  1 file changed, 81 insertions(+), 78 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

