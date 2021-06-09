Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE723A1859
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:00:20 +0200 (CEST)
Received: from localhost ([::1]:38844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzg4-0006Ro-IY
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzdd-0003q7-Il
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:01 -0400
Received: from mail-eopbgr800111.outbound.protection.outlook.com
 ([40.107.80.111]:14221 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzdb-0003rn-8C
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHbDfhp/32pES7uWpnN0rBWefPRLBdez9110pwnKkqC4RjIcbMDshouPyeGpfU2Sr59aSjkrY9kEq4rHUunnvo4OrnDNWKVmXi5vfKjqKdmTj0/3JIiPiF0aEbyMIolGFIZV385K0YndlwPMRhFoBv+bQBBoV2qFs7i+AF5S2p3wzRXmwYwpcwE6vAy2P8pK0hYGekMgQg9WJM84wnnS7+JgqLV8C6U68v7jYsxoS+diDatnlR2wUPo1pGo26SldxnyGyL+9rqr6TDoOQNAGgfPJTP39/rnhO9x8rNPZuhQEpS1k01Oi/ZnQL1VpXoxVddqVNVK0Hi1r6ymh69YnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUqzpf14xOnTut5/uCRrnIetEC2sk93ubsGkZShpeX0=;
 b=aH3eFP0LCit+/iA/aT9AXindg/GwxIJPC5c6R/BhmfLquhOJJQ/5Bvf0VIQv1XdkgTNzeyWqsHNCwVI9TxNwhEb9I+hKV9ObC5FjxuLNGBUdPQBhrd8cW3LXxjHlzgpVxJRC3wo5NFlpFO4oA7AHermIMMyEDcNyBQU32GqhwzUbEPkWvSBejtDBQQ2nFd9vRBYt62GQH9VF9YCfWvhPM/ulbe/Yj9lkWkuAXDKZkZNcKCmuDCF7Szw/Hkey4nGeKowTVuOYjnx85kJnQuK6Eh6fbXHMA9r2sor0aLogk0ICoTJLst6DqvLQIW6k2OlU2bQdNVpVZWu+YgMapm49vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUqzpf14xOnTut5/uCRrnIetEC2sk93ubsGkZShpeX0=;
 b=nsb4mvmNa5aaXlB/iB/g0aWQUX2pqae3Oc11plD1hHwOYdGUWMc8loYn+9nMm+BB0MGSjyu3ZwhCMrdyG8w60QlUjliMs5SqlFXpefRYmyt1MZaiS+TpyJqX+qTJxqxa2k8Gymd2wYZbukmnxaw8bKjyotAalxxuXkXyq6sBtG/jlojOMz6dOqyJOxOIZBFes60AsP/2ZsYp1vHH2r4A8pPojL04HYn740vffJiRI/xsJf8bzpQ+Z9FtPFRwsL1JLmWTBjXG5WuJTSnI9TFJ/dwRgJR7pS0ZEjGDRWNsxxve6trZ72ugFFiRsgPkI5HH6I/66F6rtW8jTu2NPqFgNw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB1905.lamprd80.prod.outlook.com (2603:10d6:101:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 9 Jun
 2021 14:56:55 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:56:55 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 01/28] meson: Split out tcg/meson.build
Thread-Topic: [PATCH v3 01/28] meson: Split out tcg/meson.build
Thread-Index: AQHXP6oQunrLeM0v40Sr2EbIFxarWKsL9fiA
Date: Wed, 9 Jun 2021 14:56:55 +0000
Message-ID: <CP2PR80MB366847D65978D0D6F13B33B2DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-2-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-2-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7eb1b087-b2de-4697-fdc7-08d92b56d2f0
x-ms-traffictypediagnostic: CP2PR80MB1905:
x-microsoft-antispam-prvs: <CP2PR80MB1905C17DB513B8F7E7428945DA369@CP2PR80MB1905.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YIG0TfMZzKuU8IVp7Vh0S08XjtBuJJ3UgMY/1H2KMRSHielad6O1cdY8ujWp1pNmsAIvsjz95m/fsb8VQDejUZCthHxl0foxPMbb14yO5GdLedXzykKCaJXHUroMrYYxKHCwxIZmLkwZ0rFXOXOSOQFmrOqDVTIZj+RHyFPr9RQzBhiwxqD3/CuvHVpCa9tbW83rrxWBewZBkhjND5llz202UU/RmZh8a0ew5Ng3NoV7Qu2tHBbozgL5Iu8J6DKDK/9OLn/7rjnL6drxQYsVJ0NdHtPTaIVoGjCbWby4dHjJD2fNSPhrnDsFZvuBgYDjMcV8Os5++dF7Yj3B5uEe1lHi9x4oVOc1B7mtXX4///RR2lIbkqbvrPT9+Zwa+WPej268ssTMNK096CbhFrAJCzlZWGSW83eZ4R/H+mlkJUcc8/xYCGK2ux1kKZEsNlJphzqT7M2fVEhN7cA1iWS2CivpEDmSPq3ka1pxWnUgYIHTaNP/SpTxSM3q2U6GGod0B9kbNMHeUjn+gpJ2RxyhxdX46EPT/6V9mxVEJ8gC+CpO30bg990QK+gS0FElW6DzB52ihbBlKrvvnlwXzJnYYIW8cCkToHVcnMYyvAJ4xbMkzMfPV3Klpq6Z2ftgc8iVXXebYGP4UvzFgdldOdchlZp94qtcaQJasZPvZnEQV+rebLo8OuH+5fcjdEpk/mmS/eD8+x4IbNARCgVA8qIe8ccsWdZCyunfiQ+XZSxGdek=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39840400004)(33656002)(66946007)(6506007)(86362001)(186003)(110136005)(316002)(76116006)(4744005)(66556008)(9686003)(38100700002)(7696005)(55016002)(26005)(4326008)(8676002)(8936002)(83380400001)(52536014)(64756008)(478600001)(122000001)(66476007)(2906002)(71200400001)(5660300002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RlZTVEtIM0d3aTZCYXo2K0VONjNCZGZKamZWbVVOTlh5MFdHNDdsT2tOU1BZ?=
 =?utf-8?B?L1prbTRpRlpqMk1XSXRYNE8vb3hLRlhvZ3B2eGUzQnZUWUU3QmZMRUs5bzZJ?=
 =?utf-8?B?T0k1L2lxNm5ZcDVWL0NyK2tDUkwwNTMwZXo5T3hmalROWTNtKytSSE5ZWndq?=
 =?utf-8?B?N2kzcmEyNU5MeGo5ZDFnNG0vWFdvOEdJQW5lZytaZlQ1QU9UQkZqdEFRdEhq?=
 =?utf-8?B?STZBT0hUc3hhUyt0Sm03VVBiSGZnWFZ1b3YxN0hGKyt5YzVPaTk4MjdxdUlB?=
 =?utf-8?B?WHRlaXp4R3kwaERQQnp4RGd5ZDhBS2IxbFdMMTZNYkdpM3hDUFJTTmxacGgr?=
 =?utf-8?B?L0JKTnlCazc5TkFTdjhQcEYwaVJOb1E3VzlZVmpzellLd1dQcS9LMFNDVGNY?=
 =?utf-8?B?ZFhEc2F1YWs0c2RnVGl3TnV6NE1hYXFReFVhbEMrTHI3b2JqQ3pNMmxmRDdw?=
 =?utf-8?B?cFR0b3N0QVl3c3REcW1rN2g3UnpsTGFhdS9kRWY5Qmp3QXhNbzNhY2wvR3Fj?=
 =?utf-8?B?NlJjNE9OS2E4N090aHorQ0taV3NQOGlmU25uMXB4VEx4YlpYQk5TdWhxeXBi?=
 =?utf-8?B?YzAvWFNwRXBGcjM0eG5aSVdYQVJFY3dCU1dveWE1SS9FZGpnY3VNVDRMbS9R?=
 =?utf-8?B?Wmp6T1p0RnhEcTlMend6V21VME9LajlDc01POXkwWXNzYlFZZmNSZXJuTmEv?=
 =?utf-8?B?WGFCTmpwMWRpRkptKzVUc29UVXZWY1V2R0VyVFliOElHK0tQUHJDVTZuUHFm?=
 =?utf-8?B?UU1BMmRwcU9rRmZpUjFSV0lPVUR5Y0VibmlqTU02bzcxeHIyaEpUdktEeXVJ?=
 =?utf-8?B?UWNBcGJMdjNzMVZTUkY0dWYyREpDN3VzanVLNldmMm1QWWZtcjNNYkcrTko4?=
 =?utf-8?B?TWJjRGR0d2FYdHdrWXhDZkF1TG9lL2VweGFLaktyMEFGWEFlQTZpTEMvVzN6?=
 =?utf-8?B?ZXlNMm9Sa0pQellGMk1mTXkyNWd2aHhHZmJyN2ZxQnJtVUZXYmU1NmIxQk4x?=
 =?utf-8?B?S3VhOWMwU1R4dldaVmx0YlZzY3YvV3NEQWEvRUp2MG5maDB2VkkyWHFZWllF?=
 =?utf-8?B?RFpGd3J4M3czaDdKcm11elR3UElNdG5UcldEalUwY1J5d3FCd1h4aldMN25Y?=
 =?utf-8?B?czBNQm94ZnN1RjlrWWl3aTdxZk8zQmh2eHZNMmJFc294WUtPQWQyQWRFb1Zs?=
 =?utf-8?B?SGQ4b2VGU2srQjhTeTM5dWFLa3NZZU9vU0tVckxpNG0rMU56Nm5VSCt2d0NN?=
 =?utf-8?B?RThDTGNiWkoyN2x4QjZzWWpSN2dZSUdQQ3c3THVuQnV1UTBaWHMzOForaVUy?=
 =?utf-8?B?N2o5UVRHZ3lDc21CME5HWjhId0ZNSjY5T2k3WlhEb1VFQTJlekM4cVFSM1h2?=
 =?utf-8?B?bCtBVlFWTjAvWmQxUXM3WldwL3QxQWRUaHczNklJanlTZzYxRFMyT0JHU2g0?=
 =?utf-8?B?K3hyY1JONHcvSGJJNU1ZTFZHcnZjQ1g0OEhFTld0NVk0b2lRWEt2aGN6ZEV5?=
 =?utf-8?B?VHZaZlJnVEpjM3F2ZlFvbFduZVZ0bEw0a3p3TjdrK2xtKytjY1l0L1AvVjhi?=
 =?utf-8?B?K0R2eG9MYUxBZ0NiZFhKeVlIMkJpT1NLN0N1cUY2cjN4OGFibnE3MW9SNldN?=
 =?utf-8?B?UVRmRUNLNmUzSmI3VE1hMTBXODcrWDZ1WldHRklKMy9RMUg5MnhFUXhlV085?=
 =?utf-8?B?VDRNb2M1NlEyRW8rcnE2cGVsSThnS0hPVFhtbUV3NUlXQU5lZjY0QnI4NmRu?=
 =?utf-8?Q?575mksOeKKY1BWHgohiQkYUWDWNTDwcnYysy/JH?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb1b087-b2de-4697-fdc7-08d92b56d2f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:56:55.4487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IY9pR0JFfCpQvgvfkKMdnfQwi2yoQG1ZvrUiif2GO4oRRIZp29CzmAZorTLoLM9Ft0MjFdw5mdZqfvwneEOcUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1905
Received-SPF: pass client-ip=40.107.80.111;
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
QGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgbWVzb24uYnVpbGQgICAgIHwgIDggKy0tLS0tLS0NCj4g
IHRjZy9tZXNvbi5idWlsZCB8IDEzICsrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiB0
Y2cvbWVzb24uYnVpbGQNCg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGlyZXMgPGx1aXMucGlyZXNAZWxk
b3JhZG8ub3JnLmJyPg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBF
TERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5v
cmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

