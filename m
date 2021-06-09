Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98773A185A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:00:22 +0200 (CEST)
Received: from localhost ([::1]:39014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzg6-0006Yq-Q9
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzdg-0003qw-W7
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:05 -0400
Received: from mail-eopbgr800118.outbound.protection.outlook.com
 ([40.107.80.118]:12055 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzdf-0003uT-Ch
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8MN0FjGi8cDqHiJNDo0Wa6Eqa0ZAR3AQ1WTYYehJ27cH1HstwyAqKleK8DHGsQiZC6V1Q82CXjUUR/GipKkO/xvMe+7mnZgyoBNu+uUeBB2CRGlx0lOjqZ5PebcHFVLwJEpCnrPNtUJfcKvi646tKnWNUFjm2moxEqBtqRVMYQu3laxRExHs9cLb4sA7mFU0q0iWPM9XroS4cg7gZawMo11Li+lgPKKmMO7CFINbD9YQ/LI7bc8aeQd6UJf3eyGD31+A7zsDXCiUFBsDF64Ydq7TfocZKfR85sN286Nudwl/RoSGBIqGq0en7Bnto5we6eUb1c2ftWCcxXySfSERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfh1HPKbOcc9zYdlL9n4KtJG+qbyUu/gHJS952QIrrk=;
 b=XOwh5xr/SM7EEkBjTX6s3oVqbrpkpHM5tzIxNiXief9urHqBRgy7RMNKc0rc9Q9tjKMtkY9mcx0sPKvJHOyKF71ZaSjhHNzq/GlXaryMks5cCiGBXN+sFHL1oOCyrhQ02DxQvTGTabDI8sJU47FeEx9QeG0QMqTWc7f0Xe9Sz82hL5bel34DUg47jsEFh9OkTxbSFEu3mGSQOcZOy9RGpJxKLYrEJEHtX3EoUNPgy4au1xj6Rq/fl95Dk3hb8v+1/oqHyP+hopOsuoYeJ3ElpwVU0I9p/qeJGoFkJX/jI3nXJdmjYLoBf6ghzeYtB7ZwwKYumU6Z6NjkZ8NzWm5jZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfh1HPKbOcc9zYdlL9n4KtJG+qbyUu/gHJS952QIrrk=;
 b=b4mxMAAMPCzhfvGealNHqAtnlvJdZ+9Mja27Pf+0LsmcPUNScMcDv02fEuSvMhKpuye2uQ95wTTEqcI9UfwqiCvKgsu2mRNYp6MvjAo4/XHcsTy+x2U7R3mQ4IhXxD0eA9dokolXga9bXVhZOvpEC6vIvBQ3/KLd/RpUXbnJSvJX2yLrRUtd6rW6A1gSNYKbRxfwTC/mp1zM5KZPV7rsBVmwGMdcn3WSMpqFwpFFnp9ltrsPcpwgEmBQjwmBpIfFrqac+0eKn8sqjS5kzGeLm0zfSzil7es0KVz71nHkhcU2/XBG39D8N/HBdJWPpZB7eaqs12/QgJWXUPVcmLA29g==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB1905.lamprd80.prod.outlook.com (2603:10d6:101:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 9 Jun
 2021 14:57:01 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:57:01 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 02/28] meson: Split out fpu/meson.build
Thread-Topic: [PATCH v3 02/28] meson: Split out fpu/meson.build
Thread-Index: AQHXP6peuYHWVYSlvUqc51+w8HRXWasL9o6Q
Date: Wed, 9 Jun 2021 14:57:01 +0000
Message-ID: <CP2PR80MB36682E2EBA55F7769B5581FDDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-3-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-3-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27636170-4426-4e14-b7a6-08d92b56d666
x-ms-traffictypediagnostic: CP2PR80MB1905:
x-microsoft-antispam-prvs: <CP2PR80MB1905F54CCD21B9334DB30CEBDA369@CP2PR80MB1905.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HpZlJc3GCs4P9YSQqDVOWUK/fuJ9bwnYMCOKOGkc9nrBBRxg3MqrfUKYfBrFIaNqGrvGpx1hYvd5wgynmtIXlSwt5DgD625Co7fjzn8djvFqr/mydHl82oiCG2zNE62JTvi9vTc9oDrnHtXNK45Y/DiDTw2H7yrw2O2SlOXbhLKVoWh98G0u/3ZIwu2OfYKVAEoiDR7ARnmhYxz7ARTtN5squwAEBKRwNFsSQv3DomxWlboUE0HyCn98e0MTd2mDvcmbCoqV9Txyvq+dqLbcqEbT4tDWiwsj2aKXyxFUlsYjjHM5Ix379i104nIEfgPF8gSTqd/qTMASasFA3BMN4t5t4t3hPUfKaTN1f8wnIoqUHJ84Z0KNiU9jkKM7Rhl0XV/qg/DKR98+0weggy9YrrkVB95xJAKg0JMuuKIWuYgLpI6+ymZDJHwVSN2s8gA/sn1ZbQktZnGdLBwYLNymuJvjMZCG3wFap8mxlHcevvOKfxI2OU0EkzUiUPaD9u+ENFqFyPWOaDMTd8YcTyEA99NiZnwKCgJbslxm7+u3yLw4UxRaD3yLn204zKvUPlbrKvsFHSneY6ZzipGZSayXmyCum5WvWvcm8QcCGUfZ4FU3HBdS0E6ATai1yO3FTuA5wiKHODB6Qra7imoZmUC/KXI1G3UKTQglFZPqdGF9zl3XYq3W+wX2cAr5CbJCNHXp7kHLLfQMrl06rTh6Q9RibZshDIoiE54VdKNrs7bW1IU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39840400004)(33656002)(66946007)(6506007)(86362001)(186003)(110136005)(316002)(76116006)(4744005)(66556008)(9686003)(38100700002)(7696005)(55016002)(26005)(4326008)(8676002)(8936002)(83380400001)(52536014)(64756008)(478600001)(122000001)(66476007)(2906002)(71200400001)(5660300002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VUR6Q2hWd1pqVlFMZnA2VW9tRjJJcG85b1h0aEQ0Um5kRjE5WEZISGlZam9r?=
 =?utf-8?B?M2xCbGFLeUsyY3NtNm81bjB6a3lLR1ZVMWJkQys3VnoxTGVOZnJxS1RZZXph?=
 =?utf-8?B?VWU0ZlF4dDc5MExDcnRsUnVmMno0eldXSjVNSDNzV3B1enNwRzBjVkRBeldY?=
 =?utf-8?B?VU8xZnN6V1VhajBvSkpIWDF2eXpxNkpPSXR4aTlPYzJxMU5DckpnRmc0Qi9q?=
 =?utf-8?B?Wjh2OVBKT28wM2NkOFFQUTk5R3pKNDVwaEpsS0FwQ3NTZ0IxWmxFQ3FoRFdJ?=
 =?utf-8?B?MXJYek5nVXhCOTc2SEpHVjN4YW40bnlyaDdMK2ZzV1NBalhtNTNJOFdUV1Zj?=
 =?utf-8?B?RXVzMzVpQ0hIRDE1REpFd0l1S0NFOUJGdXRqMDVudHVScjFxRDkyOXdMdWtH?=
 =?utf-8?B?NUluYVovVHlESUVTMVBIWFpnNk16emtCcG1pMGRuK1RYV2tqaFg5MUIzVFND?=
 =?utf-8?B?SzVGQnZ6dlpOZDZwMHYvWU9YUnVlNFpPZU1rblRDNnhkWDJEaXNvdUZjRlVT?=
 =?utf-8?B?Rm4yQit1REhpSXkybXUyajRKbDZ3M0pWQmdocEJXUS9GWXR1VFRUL3dXREl5?=
 =?utf-8?B?a3dYRUJHc21jMnFGQ1d5dWd5MmFnMWZweGRhcUtGMnNva1ZBVkNTVUkvcXhI?=
 =?utf-8?B?cnJWalM5d0ExckNreGFzWGY4VHgxMVhkQnpPdDZ6cERZNllMR3ZSOTNkYko1?=
 =?utf-8?B?VDNxZzhTWFlnOWdHdWtTanR3Tmp0YkpnMzVZL2FPN2xYSmhPYVA4TmF1WXF1?=
 =?utf-8?B?K1pPelNJR2VxZ1BlUUFTVnJoeGxQSk1zVjYwcFJTV204dDIwbVQzaVhpYlpB?=
 =?utf-8?B?WUxwWFlKUlVVa1lOSnN0ZWFXYi9Za0pLR2dWaFF6NXY5SER5ZTJNS1VaQUZo?=
 =?utf-8?B?ZXlGODU0ZEZNVFBjTHN1ZlhSYTZramVqNjB5bkh4UmY0QzFlSThJOWdoaEhk?=
 =?utf-8?B?REtud0RDeU4vVkdoblQ2N25sVDJPNENjQ1UyVytNOXpSd2d1NFhyOUJtL1Ux?=
 =?utf-8?B?aTcrUFJ1VlREbHBIaFh6dUo1S2xMMFNqelB1cmVsaU9qazgyWGJBQzBvSzJ2?=
 =?utf-8?B?SUgrVTRTc1o2QnQyL1BlVXM2bVR1ekIzUHVUdS9qK3RWZjBQZ0phQy9zMEJz?=
 =?utf-8?B?aCtjd01yYnlRMXhnMlFsalZ3c3FjTXVyUHQxeXFLYVRLVmdpYWJJYnB0RkxD?=
 =?utf-8?B?RjlQV0RkZEp1L2phc3dhcjkxTmw3bE9JLzFwZnZCQjJlVzgra0M0RU11cGlj?=
 =?utf-8?B?SHN6MDlDMEFySGt3MjZJd0RRNDlOc2hJQ0RNY3BrbzBFMHNDVXQ0R2pPTTNk?=
 =?utf-8?B?SFhORHlndDUxSXdPRCtwUm9lekRrTlhrZmUwcG54aGxadVZIRTFFK1hmYWVI?=
 =?utf-8?B?SzExNFJNU2xQY0xtYkdjbmdwbjJNbnRNM21JUHpNalRoSUlsdkoramNJMkRj?=
 =?utf-8?B?b2dOSVQvbDgwNGgyTXRyaDZOWTdHZHZjWE5nNlQyWVFQSW1udytyVHRZcnBs?=
 =?utf-8?B?SVRXYW51TURYQ1doY2Q0M3E3SHZLMFJCTXYrTjFVQ1dncmFaMWFjamRlcmQv?=
 =?utf-8?B?RGV3UXVuRmE3RmtNdTFRUDNEdFZwMFFRWTg0STJCdkpDZHRzVnhBNXhCaDRj?=
 =?utf-8?B?bTU0TkVSTjJIVm1PTFllSE1acENLa1o3VHFCbERXSjZyRFFQWCtkUXVnYlNM?=
 =?utf-8?B?U0QyT082ak5FdlZWNlJ1d3pXaG4vdVJxMjVlTjBBRWdXOCtKYjJBd3Vqekdi?=
 =?utf-8?Q?WBpG2aQjXSEilsHYXAneuKlThsEjp9rd/jLmIot?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27636170-4426-4e14-b7a6-08d92b56d666
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:57:01.1974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UKkP9HJEJuwK57I2RSrXdP2mHo5c2GZt/eo+Q6bZnvl8XaIEQSZWAXMdzGc+T5ljD59RKfEQtPQX7Ak5CU78Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1905
Received-SPF: pass client-ip=40.107.80.118;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IA0KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9y
Zz4NCj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29u
QGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgbWVzb24uYnVpbGQgICAgIHwgNCArLS0tDQo+ICBmcHUv
bWVzb24uYnVpbGQgfCAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IGZwdS9tZXNvbi5idWlsZA0KDQpS
ZXZpZXdlZC1ieTogTHVpcyBQaXJlcyA8bHVpcy5waXJlc0BlbGRvcmFkby5vcmcuYnI+DQoNCi0t
DQpMdWlzIFBpcmVzDQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdh
bCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0
bWw+DQo=

