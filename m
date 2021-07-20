Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D13CF565
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 09:36:35 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5kIs-0007cl-1s
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 03:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m5kHV-0006aS-TH; Tue, 20 Jul 2021 03:35:10 -0400
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246]:7840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m5kHT-0004Zr-4b; Tue, 20 Jul 2021 03:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626766508; x=1658302508;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L9ES61FUbsVnL55tKMTAvWH51wy15c69GJw4JMReWLc=;
 b=sJqltjLg1jAwJ9jXOvg1GJzZXxsBQ41E9zbykwcXLlSMves2obgifQR/
 82jzduj19tnw+6hTAFNbNE5c/ZKGOs+IwX2xRQk1xPDODA9aAYfINAdGe
 dr3kfhLw9We7XD+4mAoxK2UIyMcYulV1GihvhjqWX0u7fCtLrSekdcXeu
 U8vaNheUg83A71HO3Z5RxDBDGthIdUJkw8BdUqUkgjaOTCB/TQAsrgRFf
 FiyU3uCTLZ6Kyc8wdu9ghWFI+yzU6zqhjFErE9Tce153CpvoVBcmhuV6o
 Lt0RhA8NVub7xlfR+2Ad2SdSjbEctUPq3tr/I9BzRYRULI20TMEKeRlye A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="43414965"
X-IronPort-AV: E=Sophos;i="5.84,254,1620658800"; d="scan'208";a="43414965"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:35:01 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRdsSiWROD5LVWSBeVLnn/Cpt6akLevT4zwHvQJSrVxykVMLsq8lYUV/LQakSHbAjKsC32wTolIwwlMWKLrONDc4eDgUU878QFvGgbSoO2HqmYLMG/MWJZqTB6dbgqvY1OmS1Jflpv9xYoSq+1jx0TxxNl8v0MYR4f86m7GYyjRgBTcAEwKiXTg+V2J4Gj5N22snOG3KWNIv5ABftfG2YpraSEUgcC32i64TOR6/yvPIF2PQZ1cLvl4S2AsF9G5+asqRm+KyKSc1V+lRoMMh3i1vakP5qMoztjqtTrdYtSrVCG+ML+PUvVoB84d7fw10Uk6Gzkk0zkKJUGkO/2EaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9ES61FUbsVnL55tKMTAvWH51wy15c69GJw4JMReWLc=;
 b=oRjWemUej0LKEb+m3EPxpaxD64ZdI4GMAVyZU2OOP87+fEceSdlAlva4LZAQI5Ycx5Lijj0A4jCB8lCsuR7wRmt7ReS4GDmbgXNl+4C0ikJrA449mUPlwaIYN5huRCJ61fAk/t+S43mepg9NEnRz8J8T2JmIdUY2q4aBdnwlcjXvSkvvnXMfeWHsoHTsa/ktx1AYVZ/kzPIFgX2FFFv68mbecunQ7BGBfQM1NGokxY5Mm/1ho2fLtPnU478MDKgeXX4xdM1i5PmZOI25v4FkAdiAE0m/jgRuxOz1hMMZFWaHGCn8tFbi7rS9jDNLxMFaGWhlOFUfaVAPSTuEAfa8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9ES61FUbsVnL55tKMTAvWH51wy15c69GJw4JMReWLc=;
 b=PIqyO/sOgw5eRtnXTybTDqyTHbDhi9yDMlJU1S6qwXvyQBxi4LrJLiIcrTtmDl6G6QB1DTGSmXXbi3RaIsjFSv0Vc5axWA4SapuqFMROlE4tQxTQvb3BZL9yE7WZBxHbqTeo97APgRRN5lni47CgYounuuDKWJzFfWYxqkreNdE=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYBPR01MB5328.jpnprd01.prod.outlook.com (2603:1096:404:801f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 07:34:57 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 07:34:57 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>
Subject: RE: [PATCH 0/4] Add support for Fujitsu A64FX processor
Thread-Topic: [PATCH 0/4] Add support for Fujitsu A64FX processor
Thread-Index: AQHXegM6kUAks0xQNk6Z/S3GC/IfSatKRPIAgAE22/A=
Date: Tue, 20 Jul 2021 07:34:57 +0000
Message-ID: <TYCPR01MB61601256BD8311CE6D2A6767E9E29@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <CAFEAcA_xMdsLtsyX3aV+JKoLuNiaR3zHmv1NXwVUkWRSAbQuAA@mail.gmail.com>
In-Reply-To: <CAFEAcA_xMdsLtsyX3aV+JKoLuNiaR3zHmv1NXwVUkWRSAbQuAA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YWUxNDkxM2ItMWUyNy00MzY0LTk2MDUtYzc4MzNhNTBl?=
 =?utf-8?B?ZjEzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wNy0yMFQwNzoyMTo1NFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3beda34-2a5e-41d3-4cfc-08d94b50dfe0
x-ms-traffictypediagnostic: TYBPR01MB5328:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYBPR01MB5328D516F781E52AD58B3E25E9E29@TYBPR01MB5328.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o7ElAXtEHEFxju/TmQIXWAJgpKEwSnIvQl/ExUYSpS3LSsP1ZaOApFxn30mPS1m2NSSosJg6DRCnPYoPWHUFUF1CnhUmHxvfNBwKLvqafZL9nggPZCdYWpg0+UO5BqhbiPFqQYpbhCj3OpUkTrpRmxDWc0MVK+fvEzyQLLyHeNY4J8Yk8KNQFa7o8tqFGvxgKbc2Xz3HlmNjjuASjQll1ryPSeGiGm5lhAEy+s+AXSno9kx6r4WZtlhaNqUYV+zMSDK1ne8rPNi5btAZF6BDo1n0HTRzexmykKBL0XwKhPlt+l8CDOkFZG7MVHO0TdRVloyj5gTAb3uqVxS3MC1JTm3IWVjuRtrEL1P/QHALKBPvRNlo7znblsHld6i6XLXwvgr3uNpRNVbTCAuq+2ExRmA9+hFC/+eOPUsp1pi6u1tSmaWhsYJrNiCz7kNE6XnkZkzB0oxqAqPm5cl3po+46ZqiHzLLs1MkIEHaKiR3xbm3uNkWvPuUwiJEGYD18OTOQO3qxf5qayS3x2K2aSCggVWLOM9wesrzeMOFYEMvHrJONgPyuAVc+/A1ALS9+M2WWhZMz0jYrwVglqq3Uv9ANHTyV2nQdStUUiuNe3XuUw4Mz3iHIqiwmCWjSAKtfjKuhh/M77zvWiTbzVVUrVapQETIkgk+e/2TYBIqhs499Om0juDRjsRS7cK0cE6zQCjTFLxZ5wJhKZB6u7im9SprFf8zaacA0jjJpNE2Fdz0xfqfCsu6QSgHnGdANW/yhum8l15BqInTc7NxKjr95yYGt14TicbtQXNvpXLlDyNRzDjei6mJxbUMwlK9qPoTQJ57xAuCuO3cJapcchE18MaVpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(107886003)(316002)(6916009)(86362001)(66476007)(52536014)(64756008)(76116006)(66446008)(66556008)(8936002)(55016002)(478600001)(66946007)(4326008)(8676002)(38100700002)(2906002)(54906003)(85182001)(71200400001)(7696005)(122000001)(966005)(53546011)(6506007)(83380400001)(5660300002)(9686003)(33656002)(26005)(186003)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDdCbXdFb3p5TmtLZ3F6ZDVQTGdYcDg1WnFERldhU2I2dXh4ckhqSHNCTUp6?=
 =?utf-8?B?YmpGdnVQaXM2TDYvc1VtNGpWRzRCb2pCTmVhQWxHU3A2aTFQNHJlTzNHZHU1?=
 =?utf-8?B?YnlJRjVLTU5hNmFyMHVsSHJSVWxCRjBXSWNqNFI1U3JTUGFMOS9YR25rVDFB?=
 =?utf-8?B?TC9seEZFc1RzcEpJNkRYaUFzK3VWdkR1YjRIWWY4K2VsRlc4QmFQRjFqMG9U?=
 =?utf-8?B?RjRUZ2VVakdQUTBJWHNjcWoxM2Z6bnI0eTBDT0xMQkhIMEQxWit3dTVBYXJ6?=
 =?utf-8?B?TGpWQ0VKcDlGcVd6aWE3ZEZWT3JyZWZONS9ya3RxTDZrb21IWnVabks2ck5y?=
 =?utf-8?B?cjUzeXJ0alpDc2U5ZUhUaUdISkZpS2dRNXdTbnhVVDVDTEJYSUM1b1VKdjVu?=
 =?utf-8?B?Zjd6clZMQUtTTnByYnR0ZFU0dU9UNG84T0w4QUJMVEZmeW54ZVRIU0V0cVFk?=
 =?utf-8?B?c04wZ21qVUFMa2U2Z3dERXJnM0REdHI4cVQzR3lCR3o1Z0F4cG1OMGEzLytj?=
 =?utf-8?B?L2VhZEcxUkJINllEaDZIVm9EU2xvUFNWYVFVN2d6ZXVPMi9ST2t4U0NMaU9R?=
 =?utf-8?B?ZlBQQnNZU21OeXVqUEZUS0JTZFNNRDhjOXgyL0pSdm01TlRuMDhYZ0hJdDFk?=
 =?utf-8?B?aHlzS0lmaHVQN3J3MVBmQ3dHekdHN285WUhILzllUndqTlZ4Vjg1ZEYwWHFL?=
 =?utf-8?B?U3FpbUlVZkZ2QTY0MzA4THk3WjExUXdMOUpBRUc0NEJNdUZtTE1KTzhNM2VV?=
 =?utf-8?B?Y0F3eVVOWUxSYUJlWHNKdkVSTTVBancyaUFsV3Zna1Q3QUE2cXRsWmc5RTBM?=
 =?utf-8?B?NGNkcHFZbFA2ZjdsNW1qblUzWUVicFJlalExOEdyUHRwY3ZpaVovdFRQZGNJ?=
 =?utf-8?B?UUxBbnNrbU95NE1vVmZwMkRzdGhkdmpoaGVnMlYvamZMZElJWVkwa1M1eW9U?=
 =?utf-8?B?Wko3ekFYbWtBTXBJZzZyWnRvS1R6OFZwQWJxR1NTcmFuTHhLS3ZZa0hycTgr?=
 =?utf-8?B?SmlvdWMzYm5YMTlHb1dVVDAxcmg5M1ZmZ3FSSGY0QzBtdGpWck5keHhaMmZ3?=
 =?utf-8?B?NUxtaEI4alY4UlQrS2cvY2RGblZqRjdsb1JZZGZoSk1NZnBkZlJSSFgyZGJG?=
 =?utf-8?B?WndNZlVkRG54NGlTK2o1SldoQ0tkV09MQ3puWTlXNUJ0Uk93L1MzbFRFeHNz?=
 =?utf-8?B?SjJvbE5iSmVnbTRyUXFLZVliNG1STnJGR2F2NzZDeDh5MEsrVlMwRFZsTnVt?=
 =?utf-8?B?ZEhVMjBUbld6ck9LN2Jkek8vcnBPVS95QXB2S1UwNGp6UzNzQmh4cVkyR3h4?=
 =?utf-8?B?eXZlRFB4a2VWNEczZ09iWkx3ODVPTFAvbWtiU0NXSWNLOHBvd2VJY01adEdo?=
 =?utf-8?B?VFVlK25NZTljdGJjVUZsY210UXBJRnY2ZklLUi9PdUREVWY5MGFUUlNQRldq?=
 =?utf-8?B?TldHblJ0dWtXb2hCUWpreExTT2NQaFNkQ0ZsZjVOaE0weXV0Z2RmbGtBNFpY?=
 =?utf-8?B?aHFPUW5WSXI4VTFlcDRWL0FzbkxPQVAzQ0xkczBCdmpVZzM4Nkl0MnhoYVZp?=
 =?utf-8?B?Wkg4YVlaZzhnODRXZHc0dkFQRzZTOGhUNWduRGU0Q05qQ3JQMVZvM1prbWxB?=
 =?utf-8?B?OE4yRGd0dVluVXFVaHJEUk5PNFVwaFUyNVdHR0ZZdDZUc2ZRd0U1U1ZvUkhF?=
 =?utf-8?B?SmFsaEZIR3ZYdm1IeEt3WXk1NU92bXNFRDFXZVgxZGlFTHJQaldoWGRpYTNi?=
 =?utf-8?Q?0+MhrmPSziEGpsTyEUxvFopziWLk1m8rU/iR3zd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3beda34-2a5e-41d3-4cfc-08d94b50dfe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 07:34:57.4514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZqBZ+8wlqleB9f1xSnGt4nNOoWNBJZ3rQm5fuPyVdjCeTKrDqhUU1H2vWdCmfUe08L2hUnMatMq2tsEvcD58LUO3skGe2O6C48uz9Dr7lY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5328
Received-SPF: pass client-ip=68.232.152.246;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa2.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksIHBldGVyDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudC4NCg0KPiBIaTsgaXQgbG9va3Mg
bGlrZSBzb21ldGhpbmcgd2l0aCB5b3VyIG91dGdvaW5nIGVtYWlsIHNldHVwIHN0aWxsIGRpc2Fn
cmVlcw0KPiB3aXRoIFFFTVUncyBtYWlsaW5nIGxpc3Qgc2VydmVyIDotKCAgQXMgZmFyIGFzIEkg
Y2FuIHRlbGwgdGhlc2UgZW1haWxzIGRpZG4ndA0KPiBtYWtlIGl0IHRvIHRoZSBsaXN0LCBzbyBv
bmx5IHBlb3BsZSBvbiB0aGUgZGlyZWN0LWNjIGxpc3Qgd2lsbCBoYXZlDQo+IHNlZW4gdGhlbSA6
LSgNCg0KQXMgeW91IHNhaWQsIGl0IHNlZW1zIHRoYXQgSSBhbSBub3QgbGlzdGVkIGluIHRoZSBt
YWlsIHNlcnZlciBhZ2Fpbi4NCldoZW4gSSBjb250YWN0ZWQgdGhlIHNlcnZlciBhZG1pbmlzdHJh
dG9yIGJlZm9yZSwgDQp0aGUgc2VydmVyIGFkbWluaXN0cmF0b3IgdG9vayBjYXJlIG9mIGl0IHNv
IHRoYXQgbXkgZS1tYWlsIGFkZHJlc3Mgd291bGQgbm90IGJlIGp1ZGdlZCBhcyBzcGFtIG1haWws
IA0KYnV0IEkgYW0gaW4gdGhlIHByb2Nlc3Mgb2YgY29udGFjdGluZyB0aGUgc2VydmVyIGFkbWlu
aXN0cmF0b3IgYWdhaW4uDQoNCklmIHRoZSBtYWlsIHNlcnZlciBpcyBhYmxlIHRvIGxpc3QgaXQg
Y29ycmVjdGx5LA0Kc2hvdWxkIHdlIHJlc3VibWl0IHRoZSBWMSBwYXRjaCBzZXJpZXMgdG8gbGlz
dCBpdCBwcm9wZXJseT8NCk9yLCBzaW5jZSB0aGVyZSBhcmUgcGF0Y2hlcyB0aGF0IGhhdmUgYWxy
ZWFkeSBiZWVuIGNvbW1lbnRlZCBvbiwNCnNob3VsZCBJIHBvc3QgdGhlbSBhcyBhIFYyIHBhdGNo
IHNlcmllcyB0aGF0IHJlZmxlY3RzIHRob3NlIGNvbW1lbnRzPw0KDQpCZXN0IHJlZ2FyZHMuDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0
ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMTksIDIwMjEgOTo0
OSBQTQ0KPiBUbzogSXNoaWksIFNodXVpY2hpcm91L+efs+S6lSDlkajkuIDpg44gPGlzaGlpLnNo
dXVpY2hpckBmdWppdHN1LmNvbT4NCj4gQ2M6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29t
PjsgTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT47DQo+IFBhb2xvIEJvbnppbmkg
PHBib256aW5pQHJlZGhhdC5jb20+OyBxZW11LWFybSA8cWVtdS1hcm1Abm9uZ251Lm9yZz47DQo+
IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDAvNF0gQWRkIHN1cHBvcnQgZm9yIEZ1aml0c3UgQTY0RlggcHJvY2Vzc29yDQo+IA0K
PiBPbiBGcmksIDE2IEp1bCAyMDIxIGF0IDA2OjI3LCBTaHV1aWNoaXJvdSBJc2hpaQ0KPiA8aXNo
aWkuc2h1dWljaGlyQGZ1aml0c3UuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhlbGxvLCBldmVyeW9u
ZS4NCj4gDQo+IEhpOyBpdCBsb29rcyBsaWtlIHNvbWV0aGluZyB3aXRoIHlvdXIgb3V0Z29pbmcg
ZW1haWwgc2V0dXAgc3RpbGwgZGlzYWdyZWVzDQo+IHdpdGggUUVNVSdzIG1haWxpbmcgbGlzdCBz
ZXJ2ZXIgOi0oICBBcyBmYXIgYXMgSSBjYW4gdGVsbCB0aGVzZSBlbWFpbHMgZGlkbid0DQo+IG1h
a2UgaXQgdG8gdGhlIGxpc3QsIHNvIG9ubHkgcGVvcGxlIG9uIHRoZSBkaXJlY3QtY2MgbGlzdCB3
aWxsIGhhdmUNCj4gc2VlbiB0aGVtIDotKA0KPiANCj4gPiBUaGVzZSBhcmUgYSBzZXJpZXMgb2Yg
cGF0Y2hlcyB0byBlbmFibGUgdGhlIEZ1aml0c3UgQTY0RlggcHJvY2Vzc29yWzFdIGluDQo+ICJt
YWNoaW5lIHZpcnQiLg0KPiA+DQo+ID4gWzFdDQo+ID4NCj4gaHR0cHM6Ly9naXRodWIuY29tL2Z1
aml0c3UvQTY0RlgvYmxvYi9tYXN0ZXIvZG9jL0E2NEZYX01pY3JvYXJjaGl0ZWN0dXJlXw0KPiBN
YW51YWxfZW5fMS40LnBkZg0KPiA+DQo+ID4NCj4gPiBUaGUgbW90aXZhdGlvbiBmb3IgY3JlYXRp
bmcgdGhlc2UgcGF0Y2hlcyB3YXMgcHJldmlvdXNseSBkaXNjdXNzZWQgaW4gdGhlDQo+IGZvbGxv
d2luZyBSRkMuDQo+ID4NCj4gPg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVs
L2E1NjI4M2IzLTNiYjItZDlhMy05YTZlLTgxNzVjYzE3YjM3Ng0KPiBAbGluYXJvLm9yZy8NCj4g
Pg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGEgZml4IHRvIGVuYWJsZSB0aGUgQTY0RlggcHJv
Y2Vzc29yIGJ5IHNwZWNpZnlpbmcgIi1jcHUNCj4gYTY0ZngiIGluICItTSB2aXJ0Ii4NCj4gPiBJ
biB0aGUgZnV0dXJlLCB3ZSBwbGFuIHRvIGltcGxlbWVudCB0aGUgaW1wbGVtZW50YXRpb24gZGVm
aW5lZCByZWdpc3RlciBncm91cCBvZg0KPiB0aGUgSFBDDQo+ID4gKEhpZ2ggUGVyZm9ybWFuY2Ug
Q29tcHV0aW5nKSBmdW5jdGlvblsyXSB3aGljaCBpcyBpbXBsZW1lbnRlZCBzcGVjaWZpYyB0byB0
aGUNCj4gQTY0RlggcHJvY2Vzc29yLA0KPiA+IGJ1dCBzaW5jZSB0aGUgQTY0RlgtcmVsYXRlZCBm
dW5jdGlvbnMgYXJlIG5vdCBpbXBsZW1lbnRlZCBpbiBRRU1VIGF0IHByZXNlbnQsDQo+ID4gd2Ug
d2lsbCBmaXJzdCBpbXBsZW1lbnQgdGhlIG1pbmltdW0gbmVjZXNzYXJ5IGZ1bmN0aW9ucy4NCj4g
PiBIb3dldmVyLCBzaW5jZSB0aGUgQTY0RlgtcmVsYXRlZCBmdW5jdGlvbnMgYXJlIGN1cnJlbnRs
eSBub3QgaW1wbGVtZW50ZWQgaW4NCj4gUUVNVSwNCj4gPiB3ZSB3aWxsIGZpcnN0IGltcGxlbWVu
dCB0aGUgbWluaW11bSBuZWNlc3NhcnkgZnVuY3Rpb25zLg0KPiA+DQo+ID4gWzJdDQo+ID4NCj4g
aHR0cHM6Ly9naXRodWIuY29tL2Z1aml0c3UvQTY0RlgvYmxvYi9tYXN0ZXIvZG9jL0E2NEZYX1Nw
ZWNpZmljYXRpb25fSFBDXw0KPiBFeHRlbnNpb25fdjFfRU4ucGRmDQo+ID4NCj4gPiBTaW5jZSB0
aGlzIGlzIHRoZSBmaXJzdCB0aW1lIGZvciB1cyB0byBjb250cmlidXRlIHBhdGNoZXMgdG8gcWVt
dSwNCj4gPiB3ZSBhcmUgc3VyZSB0aGF0IHRoZXJlIHdpbGwgYmUgc29tZSBpbmNvbXBldGVuY2Us
DQo+ID4gYnV0IGlmIHRoZXJlIGFyZSBhbnkgcHJvYmxlbXMsIHdlIHdvdWxkIGFwcHJlY2lhdGUg
eW91ciBjb21tZW50cy4NCj4gPg0KPiA+IEJlc3QgcmVnYXJkcw0KPiA+DQo+ID4gU2h1dWljaGly
b3UgSXNoaWkgKDQpOg0KPiA+ICAgdGFyZ2V0LWFybTogSW50cm9kdWNlIEFSTV9GRUFUVVJFX0E2
NEZYDQo+ID4gICB0YXJnZXQtYXJtOiBjcHU2NDogQWRkIHN1cHBvcnQgZm9yIEZ1aml0c3UgQTY0
RlgNCj4gPiAgIHRlc3RzL2FybS1jcHUtZmVhdHVyZXM6IEFkZCBBNjRGWCBwcm9jZXNzb3IgcmVs
YXRlZCB0ZXN0cw0KPiA+ICAgZG9jcy9zeXN0ZW06IEFkZCBhNjRmeChGdWppdHN1IEE2NEZYIHBy
b2Nlc3NvcikgdG8gc3VwcG9ydGVkIGd1ZXN0IENQVQ0KPiA+ICAgICB0eXBlDQo+ID4NCj4gPiAg
ZG9jcy9zeXN0ZW0vYXJtL3ZpcnQucnN0ICAgICAgIHwgIDEgKw0KPiA+ICBody9hcm0vdmlydC5j
ICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ID4gIHRhcmdldC9hcm0vY3B1LmggICAgICAgICAg
ICAgICB8ICAxICsNCj4gPiAgdGFyZ2V0L2FybS9jcHU2NC5jICAgICAgICAgICAgIHwgNDkNCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIHRlc3RzL3F0
ZXN0L2FybS1jcHUtZmVhdHVyZXMuYyB8ICAzICsrKw0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDU1
IGluc2VydGlvbnMoKykNCj4gDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg==

