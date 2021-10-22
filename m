Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1B437C3D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:47:53 +0200 (CEST)
Received: from localhost ([::1]:38528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdye0-0003is-Pn
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyRw-0005pQ-Je
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:35:26 -0400
Received: from mail-eopbgr820105.outbound.protection.outlook.com
 ([40.107.82.105]:39449 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyRq-0007It-UP
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:35:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jq09NAlVTvjUmkQP8Vq4wT22KDdOzcfjsaFALoPj1HKsgw6ddPsDRmE31AIoX3di8NZNdbyBvdQPxwzxLWXi4lWVwkrwbptFHktYgtUVLgCiYvYRytKxF9AGgB4HbCTLWyt1EIdytaz8mlitkFOfeU3HQvoNDjX88g+DQZDdDRZRrr/NojcjjEjYzZt9KHaKH9tfVJaAEMmRh99D3sEWucYc/c6tGD4ujkFNk7popZVqlcY/dlDOOahF3HYk+fJzlERcEnHvnkWQQgGvuNbn9dx3Q6A+RKnS47FKUwtgLaSrR0MwVnzOpEEp7EAqmPg6wbPN4e0qScCP4G34IthYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1OqygDCLBxlHpGwqtr3DSdIgVCgzFuweXOgMNXhd9M=;
 b=dY+W5N6Pirm/GysjljF9Qf9bsHn/oxPz6TpXYdMNdyeMOIvNJVvuppP4VLTj9GQnHfI718jBEaW1TPCyE1fRKBjO8bcc3edGpFn0qF229huJebqzFikRtK6YaqdqdiOLzKA5fJnF0VzBn0lMbx2HrltkAh9PsNpqye6WT6j4j55ZdPGJIXTXKnP4L5xRlieeqZ4QzBUzLZ2Cr4N5FADjzCcbrubXnCnLaNRGS6ZRtPV3fkEakg5i6gx+kllVAwl2RBGBlBRTRlfiUCH4lkdMYORPQYJlnM8OTpHOQZugWmCyxWTB6gwIhFts5jtLgBGs9aEAQq3dNbnoytVNWe/pDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1OqygDCLBxlHpGwqtr3DSdIgVCgzFuweXOgMNXhd9M=;
 b=g+xETXftVrwcHDomcXLzduAXE7yssCD0mpXsvGubdHz6uceCyNHlYvvk2IfxotDrR6A1SC/5cX9KqAzPRbpK7DiNHbTer5WMNrh+ZDo6TKCOJOqcX6RZGDhVdp7Mccq+qeVy2uH3mo+2nFwaxDdGTgTmSZuFjvaXaKKVv1zJ+jAbI2yeLQTSW2HEPzUWko/kxWukFmoF4Vgx3jxfD0TlLehIR6DsB7Fmkw8p81l4USAL/QjE54ed89VPbsZ7bJ6McrVvfFZXYQsApOaD8JiPe6ZR5COqtGjwiaVqbJ3HYj9KpV8NybIvtH4Nh6PykcI8oZ9wTlONFE58ItnzRad8Cg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3924.lamprd80.prod.outlook.com (2603:10d6:102:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 17:35:14 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:35:14 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 25/48] tcg/optimize: Split out fold_deposit
Thread-Topic: [PATCH v3 25/48] tcg/optimize: Split out fold_deposit
Thread-Index: AQHXxr90qPvvUxK1gEeuYYJLUvnz9KvfSMjg
Date: Fri, 22 Oct 2021 17:35:14 +0000
Message-ID: <CPXPR80MB52242283EFFA27CEED231037DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-26-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-26-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50727663-4d6a-4cd3-e68e-08d995824e9f
x-ms-traffictypediagnostic: CP2PR80MB3924:
x-microsoft-antispam-prvs: <CP2PR80MB3924735434F5C3A5619D1BFBDA809@CP2PR80MB3924.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gVB2Iv9/NJPm8n4AEUekzuB6efPDg8AlFWFPqQUuhlhOCJWMgMwUVybkf+Fjw92PhWIl4JhgfGtHWHb5GtkXqezL01AzHbMAvo/+Tu0Hc9cCMbiOWXw7qLW90EMseXP1PWTsoQJMRZBcOnyneY2VcoBtusC+QlphW0JoYnCI0fedNeJdyTt97q0cdCQJRlV+6tO4tNcTOnAlLIMX09CbH0fcMlzU4yGkns31BBJtd4QkWqsQotraNQjCIajLQE34Z83/FVdmOJQO7x4s2vm6SRRjOV6ybKrb8iKFGppHUI90A0CcwzOGp5DoTTu7W91W5cIAzqefKQGCTYq3I4xBC5MLL5V911B1eVJ2IDfF2eOwOsMx+8QvLv1pZdlXv+vb2gik3uguYx3cLK0Vi3L+0YyYrMcsV5AG2z8ACfbwufli2jw3UHkHVEUGb+Ufs7x5JN+OtoXxAhUEVJbgrsbXjuGooHM5EezijwkdoCdnDQ/AN97RehdPcUsEG5UIihtGQ9QZPcqB/YIMJPzxmtllvgRueQuS/9ghblMz7pEHZJP/lF4lwsgiZMwKvvsb6vN6TW28Pp+DvJwkYdMFoeOwklHEjnZ6/ZhzjRMo1eSP8R6NGkqWq8nm2XkvUbHNXgM0vEvp+0utdFaW9Tl4cKUcobtJ5dnOWfk13ckVwofmmyeRFUUmFi9kUPDQgZPecQD3M+BHIIVW3Ej9UiGV6sx0eb9VpMjcsOCTKAhEm2oylHwklCXv2R5dlPLmGLEi7yLCdTgNvLF/uA3nwqryWYJkj6FcdAa2k7mFHSJfJMwGBs4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4326008)(186003)(66476007)(52536014)(66556008)(66446008)(316002)(71200400001)(9686003)(33656002)(86362001)(83380400001)(64756008)(76116006)(55016002)(8936002)(5660300002)(2906002)(110136005)(38100700002)(66946007)(26005)(6506007)(558084003)(122000001)(508600001)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Svo11WttyZ8yc3WO2nv14sEanNfX4OBvHRrIRrWX47i+ZzYaDkIm53s9Eauc?=
 =?us-ascii?Q?tXJmYQN/+qif5SoVzW3hMAlUbDFWSn+cGNf1Dl/jDFKQcMnAPGUxSsdJNX9A?=
 =?us-ascii?Q?YvVL6NhCm34fD0IBb7yWEkoqlY4tDFdjoTX+YcYmsHCjb197sjS4BzueRYgq?=
 =?us-ascii?Q?V90KqFBxqFdIMXQfhzJpsM9TAMU4xdA6Y+2W7EGAqppHt9+JAnOa0XMrYgDC?=
 =?us-ascii?Q?Smt2GbEETP+wEyn6ZtFEp8wB+2tRnTG/kLfyhtkaLtzZ+p5H/oUAMqXZcyXw?=
 =?us-ascii?Q?WkXvu/3SIJcT9qlmOfXe9irb5eYjDmWP0vtin/n/RfRlC0bhiAa9AaFMVNZi?=
 =?us-ascii?Q?jIA5GnS1JAtoH8wcQkzIdtLhqtRrlHP+cr4dH+Gcb0J/b//yrMsueIKTzFSG?=
 =?us-ascii?Q?hwbQuEp20ZWEo1x9x//DUgGtJvjf5934bxkNinuufPG3feuZ85cnv1sSDmPw?=
 =?us-ascii?Q?TP4qJjGs5QCLckAMVmlaZ9w+W/FHsfNGSPVUm7cEHYLl872zO+uvYG067MSv?=
 =?us-ascii?Q?qz4Fk9YEJnwcBbv1hHO9dOXdvyheMAp4SuQ1ktqTRm2qUOY2aljAM5O7FXJn?=
 =?us-ascii?Q?MmmVqzh0g0XXh7oMO8CYUJ4UFZmHmmIoNACssNgUjGE+7eVKrTdzvp2dt3Pq?=
 =?us-ascii?Q?vcMD3phFM5fzdcalWI+2JbYiccTFZTPmuOasGYx2HKZUHpCd57X6w1UteGnK?=
 =?us-ascii?Q?cE2NgxaIC8nO5ATRy+zWV8TPWse0Ckp3qWoWNgkdAOtFTR2VfZnGZOuPKps9?=
 =?us-ascii?Q?XXkXCJejwU/cltr5zCOQZZ9lLBpProl7pFoJmNLxO+UrgF0+99Sx2FERQbou?=
 =?us-ascii?Q?IqbV3Cs7YyICdW9qLIin8HcbDf62RamuacMRU0ohEsfBI6A4Z/4m+okx+CWQ?=
 =?us-ascii?Q?rljU7MNmqyCnlh26+L59raIR5bexB0sdC4cDvWIoT7Vd9NXRbfsl3jtHT24X?=
 =?us-ascii?Q?jw1eUNi1cPkfhsnnzudPsutVngJiAeMYPwa/PJmZTqk0FnBPzFB6pNaaXPR+?=
 =?us-ascii?Q?bolLyNgZRW4JNQa8HfF8UEGQb62ggMTQar52It4XFVFcMG8tcVajLCkFtMs3?=
 =?us-ascii?Q?NjwL1LcLrSeDXHryFQFWEtfcJKC6QuOAEtSlh3B8jn/kRO82AJeBy3d6KcUn?=
 =?us-ascii?Q?Og606fEkgFdMmGvk5Rt+D7XXFklXXoYl0ESPrKGbHyaoQB+BikQAHf6dcCz5?=
 =?us-ascii?Q?BD4Qy6u72JHgIe1R7dPoV9jfRaTic4WD3STIOGLfWNl89pajE/eB3TzAirtu?=
 =?us-ascii?Q?hmsjkxjTfeLtqIvuo9wt3VLi4adyweDfwRbTUH/aYVmMiYnW7iIJY5r3IKdk?=
 =?us-ascii?Q?d4AnEDGoc/WdNqZjBLwFaqRiqMt0w6saKGyYB7hK+yJj77gZM9/lyxr+vvGA?=
 =?us-ascii?Q?311rl7bZc4D0+1p86rCeFUQTUraSmrKOaPZAhLykDWiyIeS+DVd9EtvZbXxb?=
 =?us-ascii?Q?2YMxUtiJyk8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50727663-4d6a-4cd3-e68e-08d995824e9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:35:14.6535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3924
Received-SPF: pass client-ip=40.107.82.105;
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
>  tcg/optimize.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

