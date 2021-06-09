Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B593A1960
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:24:55 +0200 (CEST)
Received: from localhost ([::1]:43704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr04c-0006hn-95
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzgN-0000hZ-1g
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:51 -0400
Received: from mail-eopbgr740127.outbound.protection.outlook.com
 ([40.107.74.127]:10653 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzgL-0005r0-2f
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtH+ZbtJ6+OQ32ZbQyvDSu/xbHC5Bzd344SRpA9phl6izTzFqq6bLT4cbLMLMFP/AfZ7KnanD//y2AkDeQHeOGZUpsLluJrOrx00WtINYk/Iza0RMgF4Lka6zsbKbq4x795Rgf8y/A+RYgHfD9hei8nYiFj0a8IKpqrs9/HfAKmMN+crcvNDBnCLIoLlkvj5OrXgVWl2V0fzID7EKsMQDI2/fZBgfbRX6uYb0DWsugVJPBN+LWhOVn0cMB96jeL7eUpn7BZh/fldnWHbJHYLqPeO16vzqOgbkRCJIE6TNfGUECPkjGonzSztHq6l79vRpg5wwnRlnTAZKtjvPHG2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJgi/s4Tv/fYIf7Jd+O9FJVPIo191RDJ12n9SPKidig=;
 b=LXl0vmQMV/gquuroH53JZiV81b03qfaO7k2AaX1aCBtjiQiOR8oHh6Pe5bJmPyIQXpIbT3Fd7rapP6ICljg0PWn9bj+aeihB68W18gaUcKqAzsYH8Kn7i6SXWbG9fJ5AAcdjICphmiHzhlXma1yirkfyWAUdVA2HU+6jDpJ3dM9g84L0irkZGzpRijb7OEMwLt3GdKcAqWQxCi2P3/x0jVenHDFEkEnojHSLAkaNTuXoxLwoc1WcPHMq7Cx56DJGZ8v/ILouLMqjZey5y7C/ewLC7y4jkfW7Pt3XAJCYVdb9Yft6tS1WsOLp3tMX3lzKU3k7D7vfQzVO+QhVI+VXiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJgi/s4Tv/fYIf7Jd+O9FJVPIo191RDJ12n9SPKidig=;
 b=JWPbKXwZ+VEzbYkXrw3kKqGprGOfYXolb++H3sI0M0T1DV7tM0rW+2SEJ1VRVNqnpWmn1REbjeXKy4Bul+7Gg3d2p20LjKMkki3QJ51UbI40c8DZxpgRezTdEdBIsrKqKkDnrKn3vEGYrdsTDCVDeUV2bnaa06Y2XXvmtUN1KZKPILrU9EIMEc4YcnBkm39Nho1vNwkr0yJfGu3fWR8liSjH8Fu7UbUYPgDqLxUWTl8rKiKW4ZrF4LGkE6C6tMDnYMZkHyj7ZlwCeqXXNnYUl2tesZBiab+zG6vP79xpdQ16ixG6FggiQcP2kESQncLCRtXSYSCWR+5dQOMZIRM/VQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB4979.lamprd80.prod.outlook.com (2603:10d6:103:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 14:59:47 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:59:47 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 28/28] tcg: Move tcg_init_ctx and tcg_ctx from
 accel/tcg/
Thread-Topic: [PATCH v3 28/28] tcg: Move tcg_init_ctx and tcg_ctx from
 accel/tcg/
Thread-Index: AQHXP6sAs2PD0UheEESLLwNvMAc3EasL/pHA
Date: Wed, 9 Jun 2021 14:59:47 +0000
Message-ID: <CP2PR80MB3668A567879BAD6CECE755E7DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-29-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-29-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e0355c9-5baf-4d20-e539-08d92b573941
x-ms-traffictypediagnostic: CP0PR80MB4979:
x-microsoft-antispam-prvs: <CP0PR80MB4979D5A4EE4D60AC6F8129E9DA369@CP0PR80MB4979.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ID6rUvkyb646psFBA752n8fAoK8pM5he3z3TFLBimT1JAylZ4b5xpYfjuiO1QocdaQ6jAu+uNX+sVcoT//G7GK8rj2dXOpPhWnO1WC6ldMx1TGjH5s4brxrju0uUAqpPy4Ity+ooKLQ5K5UbcbRa0lflD3+cJV1sjJJoHY5hFiLeGgQmHsWRIwZm7UeHjg9Kqisys9paWuSeacAAPviC2mAkl68uLD8/iMpknJyeV0zIv5F+lJ6913P41GHSLfcgdUws+d31SrnG668r9E2Mgz87OW9zDcn7KoQe9Jy/Y10gGLdgJLtawtLxoN/8p/uiMO21/3wX4qpJmFUQ4bYLtOmdJf4+DoKsPf7mUEUHTCghT97emEh/3oRVXysgf/07sQnkmR8uFrA1zjR0mt+mcm8e12spXxW4vsxy9LfAaStDEA6tmjz41QUE/E95i2MP/D4V9G3FE7LtjmPpC8Uf2uoVsmveiLDomh2rMuNx6IbE7FH3bOSY4Zj4M9Ydpc0sHbwDPuIJAA4Eyoj1bmKPvkl41aGlfQtBSkkSxYTJUIlPDvW+Dw9OCqxT9y45ywqZG5DGvVXN/o/UNjOavgAM2JwB93M6P2Lp0CkX3n2SdwAavI33XDv9SeTtXGrmlmZEBDaQC2kUZj9nQ3CZ2kit+22yj4ZAOdzjFMyjaJtkhF+1w9NUrKpYHnKM7Wu8VyMuv7WE3h0gdlpQGifRh28Ax1CbI++9RVIGVra2zH/WmmE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39840400004)(346002)(376002)(366004)(26005)(316002)(110136005)(55016002)(38100700002)(66446008)(122000001)(66556008)(64756008)(66946007)(66476007)(2906002)(6506007)(478600001)(71200400001)(4744005)(8676002)(8936002)(76116006)(9686003)(5660300002)(7696005)(83380400001)(33656002)(186003)(52536014)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z0VsU3BKRU92Y09FVWhGeVFGR3Y3U0xjQmNLcTVoSjk0dVpHNmcydVIwcjhU?=
 =?utf-8?B?Umh2RHEwNVBXUXJVNENrUC9qVlppTFVsSUlGTk1QOHYvazhOMGp4MVZpVk5z?=
 =?utf-8?B?YTlRNnpRb29kbjFWaVUrMG5Fb1RoN05SMGI0aTZtWUUwemxmVVpIZ3VjYWh2?=
 =?utf-8?B?MmEvN3hHYWRQSW5uZ2U3MzduSjRxZ1hjbmJTYkU0Q0s3YnJncWQrVTcreFpI?=
 =?utf-8?B?am5NVng0NUZaelNSWkFISG1VMFh6WFIrUmdFeTBwMFZieWZuajBzNVJLa2Ja?=
 =?utf-8?B?dUt6dEtFZHNkZCtLak1xN2pBelowTlA5R3AzS0hRbFFMRStyMXBMVG4rWW1z?=
 =?utf-8?B?THhHU09vc1htQ2pBazR0Z3RoUEZNVWdzNk0wa2MyVVZIZENLamlldlB6bS8w?=
 =?utf-8?B?WGtmekNhZnBzYms2ekg3M1BqYnZKSVNsT2VEdkhOTWZOVXk5M3dCR0NKSzYw?=
 =?utf-8?B?UWFNMkx0cWNtaVNLN1FiK3JoU1kzWTNXQmI3Zm5yeG9Yd25OUGlnOEhUeFZz?=
 =?utf-8?B?MU5GamJTQWpyYXpJLzNHQ2R5cG9nTCtvWTVhenp5V2pIdEJsenVlZmpNMHd4?=
 =?utf-8?B?cUZURFFYOUMvcmNhQW4yMEE1eVN1YWFYYStEQzFsNGhYU1VIZERaTHVsYndP?=
 =?utf-8?B?MWtZMUpBZVYwZHBkWlVTUG1yaGNNM1hLYkl3dkFKR282VllvK3FYcHprdUF4?=
 =?utf-8?B?bXN6MjBGdmNORTVacmdIakU1Sy8vbCtvRExzcmh6a3VRTkdrcTNrQ2hKZFhm?=
 =?utf-8?B?b2lxbkYrRU52a0dYUDNLMnM5NU1zUVpjMHZkb1pFUDJ6aHVZaFovS3l6WTZD?=
 =?utf-8?B?bFVsYVFFK3RFY0FmcHR4elNMQVB3QTBkUnVVWVphV2ZrM0dxUDhpTjdxRFd6?=
 =?utf-8?B?ajdxQlNmMVlLWmRIN3FBTUV6ZUJzSC9kSTJkc3lYckxLaDY1R1pGR3NiOStB?=
 =?utf-8?B?VXdBTzZOYkJoa1BkZENsUzFRdHpmV0lBRmNKUEZobzN3VXA1bWsrbUtGd1pv?=
 =?utf-8?B?VVNtUHFqNENlVUVtay9zL2RnT05FWlhBNWd5SklsRHdzejhFUEZPa0w0aWRx?=
 =?utf-8?B?M0wyVUpPNkVqSU5PTzdlSGlNenlKS2N3SWEydDQ4RnhNVlNhaytQeXZhbm9J?=
 =?utf-8?B?MGJQQ09JWDduYS8wbDVTUjBLbytkTWttTEZJQmsvT3U2VW5zTENUSmpocU83?=
 =?utf-8?B?S0FHd0lmMXFxS0J6UkxzVVBNMnVwOStkWnJhR0ZIdGZQYjRlK1Z6d28zRnds?=
 =?utf-8?B?SEVWd0JRanlaeWFDalJWU3NBM0l5M3BYZFluSXlBSnZRT1NXNjZsSUNlY2pV?=
 =?utf-8?B?ZVhQMWNnUHk4aU1jNEZNWks4cFFNQ3ZGNWdpVlJLbXI5dXc4VUF5MGcvRkNY?=
 =?utf-8?B?YWJYVVZWWndGbXVBVy9RTndrT1pUaStSU045ZWpYQU5EQ20xdXdQVXNtdW1k?=
 =?utf-8?B?M2pwcGMvVnd1bG5xcldTY2RBcTFWV3N4UGN1RlhkcFBZME1uby95UEtaYmdJ?=
 =?utf-8?B?TThWUnQ3Rko3VW5ZbGhDUzJiZVQ1emFpZ2RqVEtPRXVYQ0xwd2Zqb05OQ3NX?=
 =?utf-8?B?N0tpcFhXUVZjZnM2cFBmMVdoNm5aY3h0VUI1Zy9ybDRwaDMvdjVrNDhjRzg4?=
 =?utf-8?B?QVZvamQ2MUt1ZDRxSTJKcXVuZTVIU2pqcS9hMTI5dUxxN05DYXl1b1JQUi8w?=
 =?utf-8?B?YWM3Sm44NTRadmlzdWpQR1oxeGFBWXlodW82R2w3SjdYK2xtZVpDb2paMXVB?=
 =?utf-8?Q?/EcPJYSgCOJeVpQ6LgPX5i3T5zrITRvnuEBLLMZ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0355c9-5baf-4d20-e539-08d92b573941
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:59:47.0846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eV/AmC+i5oK+FTNReAfdiFEJAQKrkkCoBSHsJ+gDA+od0+w2CiSGYnRfFp8vIIe+D7Vj7H8Q+gvVQePGd5KqgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB4979
Received-SPF: pass client-ip=40.107.74.127;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
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
IFRoZXNlIHZhcmlhYmxlcyBiZWxvbmcgdG8gdGhlIGppdCBzaWRlLCBub3QgdGhlIHVzZXIgc2lk
ZS4NCj4gDQo+IFNpbmNlIHRjZ19pbml0X2N0eCBpcyBubyBsb25nZXIgdXNlZCBvdXRzaWRlIG9m
IHRjZy8sIG1vdmUgdGhlIGRlY2xhcmF0aW9uIHRvDQo+IHRjZy9pbnRlcm5hbC5oLg0KPiANCj4g
U3VnZ2VzdGVkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0K
PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGlu
YXJvLm9yZz4NCj4gLS0tDQo+ICBpbmNsdWRlL3RjZy90Y2cuaCAgICAgICAgIHwgMSAtDQo+ICB0
Y2cvaW50ZXJuYWwuaCAgICAgICAgICAgIHwgMSArDQo+ICBhY2NlbC90Y2cvdHJhbnNsYXRlLWFs
bC5jIHwgMyAtLS0NCj4gIHRjZy90Y2cuYyAgICAgICAgICAgICAgICAgfCAzICsrKw0KPiAgNCBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNClJldmlld2Vk
LWJ5OiBMdWlzIFBpcmVzIDxsdWlzLnBpcmVzQGVsZG9yYWRvLm9yZy5icj4NCg0KLS0NCkx1aXMg
UGlyZXMNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlz
Y2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

