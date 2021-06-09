Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0D3A1879
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:04:29 +0200 (CEST)
Received: from localhost ([::1]:48582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzkq-0004jX-LB
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzdy-0004Ia-8d
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:22 -0400
Received: from mail-eopbgr800094.outbound.protection.outlook.com
 ([40.107.80.94]:10651 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzdw-00049c-KU
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOSKaRuIAoyskIBxSZVAqocBFi9WnbZDQJdY/I202WXUdDKcY2w0tK+uo+Us3iS+wobbAPiDgVrsQb2I2FKKC3qVIqEflhAWjJSyyKzSOqP/TPf9XtYG96bIt+MZgluaIT9GgIvAO2PqiyFPIl5lpk6kqSIRZTh0kL8OeEc5duX/NaO4cRE39ak7F/5ndF0yG06F88Ke+m6S54HcvhCouDcanW8VlOYhCQtldiecJWR7vPaN/lNpYjH2Z87T98QEa/RWukd7vkCyzXCRtdsTO8cYraXEyz0bLndPBXoQZmIXwD+458Z1Hso5MRFenxECZ3TIpobvKrODaEVJifVqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh57McqLzHudNBWTfso0x+L/Etd/NMo504dOzl3nGvM=;
 b=MeyHgeU8Z+UzecNzxJjGvPBzGAWrelV/D15rGBJzxQ6w8WDyWfqN+pLhHz21H4YTlMYXYMnI/OGb8KLTtvxL33AYW2q8BgQ6NZl1an5oBtYXUulp9mV6AFH5H8F752mkMWdKyhrU+ou2VFNf0++fCEVbBnPJaGiqJTcN+JjI7AblXoEAutHdZydsztQBSLH3ix91DN9lS1BmjFVM7l1rQ+JwZ3dD8/dLm5NgIySLThO/HCt8VqtqTC13vHcJIhwTO1QMXIH5yPDa0lbSi/+gJ3/vFIoEY6OizXp6OwTiCJw07yIF8u/Zh+sToOIpNosd7neBEliD4yYJ8D1qFq+OeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh57McqLzHudNBWTfso0x+L/Etd/NMo504dOzl3nGvM=;
 b=p6bzWiPzTG3Z9d1hhZC42oJtmTdv1YfuN8ehwhCTe7BtN73JG5Vc8D8HpN3W7L96ZI4m+rZJ23yzOOQI6cYgu4L8lXXOEWMusZY8XybfA5iMIt23LD+U9eufm9KCQeGpPpIp/JmQtK0urEbzWf9dDUpQOC98fsKY238PURqLbfUqnhpor+vPK2v9h79NtWyZYsfv7JZd/txzFiU2bZVDTJAXfgLp/fZvxfCsJpyY7L1pr0Jxnhg+FgFB6mr4FehJGe8l98PA0/guXMEVcxBU7ZjqGlu19YF2/Mf0+6ag85TFVfh2FuBiUeNvbIg7wb1ZKJqPZS7zObsEvqrndvT8Ig==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB1905.lamprd80.prod.outlook.com (2603:10d6:101:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 9 Jun
 2021 14:57:18 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:57:18 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 04/28] tcg: Remove error return from
 tcg_region_initial_alloc__locked
Thread-Topic: [PATCH v3 04/28] tcg: Remove error return from
 tcg_region_initial_alloc__locked
Thread-Index: AQHXP6q48D5jj8fqZ0WnnFiZltr7d6sL+kHQ
Date: Wed, 9 Jun 2021 14:57:18 +0000
Message-ID: <CP2PR80MB3668BB6125EB7DDEC0F5522ADA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-5-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-5-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6444f113-be38-4678-f058-08d92b56e0b1
x-ms-traffictypediagnostic: CP2PR80MB1905:
x-microsoft-antispam-prvs: <CP2PR80MB19059089639A353E1AF636F6DA369@CP2PR80MB1905.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s+nyT1+SEgqihdRhIH2QNJYDD27/hQltpx5dh4dUb8ISKosALYp7gyTp8KsGLndYtA3ek/iCM8ADfs2LKB84QK/7e4FMh6prqDKjOEm0LgV3OihDUHIFH02Dxuy9Rv4pLP/uFUHx2xN5TS6lTKDR6okLBb69BabPygTU0m9mc0MIhoxA4i7aNYGoo0BTWCEIg3rzN39PSJG9xCWHD4IpuZEr3BdOBNkWTh7/cn2gZOQzAkDcJy3BdiKY1qX8DUmHl4Fx73zJ07V706Z1tGBjOnqmu6EeB24mi2SIpinvOqL25RfYt4OSfWz+6o2zi/PpMGA8eOIGOs2khbCW5nLm1JV4/Iu4953Gq40XwYQRRMNbjd9GLJTeP3qe4+tDdlptSLb5wA2Kf5xpFhuPPGj7hRPMBGB8pkwPMvv958Fr2DBwBtipZ7psCiTCM9venK+5jdNbiFNSeS1OexcM0pchc7mtoKYIfTbM4nO6luUWcnsblUsUGOglc/03bT7uZlCVp4WveYbbg564aUMthjJuU9alHjzC8PcWkkRqhAMhCQ2jShdpKioW1AzPpL2DFwl+q2+CAoVV2YFbH8Kgsq8AY9LpIXZo8i2bFuhksOndEh/q0tcfWJyCs2Dw7i0q6S6VJQYY1fbkKW6sV70cb7xzpq74zMIFV91KqWO+y7ombQWuMCzHjFfW2l9W9pIbp0RTB9/ub+r1LknWVT53HZff49smCogiOgcMg3M/2U+wEkMEjVUvPEnLRqheLeenCKYev0f8l9IlPlrTX+NK/chEww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39840400004)(33656002)(66946007)(6506007)(86362001)(186003)(110136005)(316002)(76116006)(4744005)(66556008)(9686003)(38100700002)(7696005)(55016002)(26005)(4326008)(8676002)(8936002)(83380400001)(52536014)(64756008)(478600001)(122000001)(66476007)(2906002)(71200400001)(5660300002)(66446008)(101420200003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MzFYZm9Ca2hxd3FqRnI1aWhDQ25Cb3VaVGlDSGJULzd6ZG1RWnlHK2hsamNa?=
 =?utf-8?B?aG1zbnJYbXZkV3p1N2NsaU1EbUkvc3dwQVNBbWVwbEFNRjNjdkQxUGVlTkZl?=
 =?utf-8?B?RGVUUWliMmpEOEc5QlJKTEk5QnkvV3VSL1pTZzdKR1RYUzdVM1h6UENJOTBy?=
 =?utf-8?B?UUNmWFVmbURoN0g1dlNEV1hSQWhYaGtqemZmbUV2cDhSbGYvWGNXSmU2elk4?=
 =?utf-8?B?QkFPcldmZzZZZm8xSWhkaWJPcjNtaGNoVXFhVWZ2VU9NVm1pSnZsejJPWDVz?=
 =?utf-8?B?YnNUVVMxcC9DUEV3alFHSXpodmNSdkV6Nkg0Q0RIa1RQNGw4dHZNQnBrUGtT?=
 =?utf-8?B?c0h4MW9za1AwRkFTWTY1RXdHZExMcm5ha1g2bU51a2lraWs4SHE4b3J4VnVJ?=
 =?utf-8?B?REVSR2ZpYmRvaTFJUG9FWnAvd0Y1U0lHY3QwMmFnNWpSV2N0VmtGNmlodWVr?=
 =?utf-8?B?WXVxS3pRcmdpRVI2OER3NDIwR3NZdkVBQXRZSmg3TW5hSWc2ZXRFSmt0Rk5P?=
 =?utf-8?B?RW5DbUJNbmFZUTN2MFhDanpOcVdPY1ZwYzZZNzRpSk5JRDEvTEp6bi82czVX?=
 =?utf-8?B?WHhPZUlFMzhBRWgzbDY2SWxYTzY4L2xFTEZRaUVVZWc1YlJTOVVHcUkzZ3RV?=
 =?utf-8?B?ZVIrQ1BBUHZLekpaazVDU3RkRVpKVUFLdVEyWS9yWUo4bkxZbUE1cnFSME55?=
 =?utf-8?B?V0VXdE9QVklmTGdZcGNoUERVQzk1UHhRdHlQVDBjVDA2SHVpQlJRQzR6TkE1?=
 =?utf-8?B?cnFnYjUrbWpKaG9zeTBVL1IzWHJtTFV5M0Rlb05OMzBLMFZpZE1ta0RRbm52?=
 =?utf-8?B?OHhLSmdFSVNleVVoVGIzSE1ZQndWUGhUMmJ6Y21MVTVMS2Fxcm5CTXZEME5L?=
 =?utf-8?B?a0ZqWEpMZWhHdUxvdlRBdHJRM2hxakxtYncvL21pd1ltQ2hPV3F6UkcyZGJB?=
 =?utf-8?B?VVlsMlA0bms2VTNUeHJVK2JJNFdXVWg1Q2V5dUd6WXQrbCt0MUJOa243Qkky?=
 =?utf-8?B?SEI0ZXlUb1BoSVI2czZDcUlKbkx3UXZaTEhvNitQL1g1WUh5a3BDSEs3MVgy?=
 =?utf-8?B?MzdZN05iVmxhY0dVam5tN29PWEJsVDFNZDNNRDFzbk9SdmRqOTduVTVQNzdZ?=
 =?utf-8?B?dVlZQmZVdndjL0R5N245Rjd1S2ZVS2JFZnMyVzA4Si9qbEdzS3NLLzc4b0Zi?=
 =?utf-8?B?eml5emphc1k5dHhXTkdpWm5GRmMxQlo0Z0FITHZqaytnS0MzWmphQVhnN2N3?=
 =?utf-8?B?dVQxSnNxTS9FV3J3amY3MXlKamcwQVhmbXZUYmI4aWkzS0QvOVc2REUxejhK?=
 =?utf-8?B?U1VEeTNHaXEyZWZIZGFGUFkvZXJxTnFnNHBmQ2pLRHZaZ2U0N3c4U2hsNXda?=
 =?utf-8?B?NlpiNzc3dmpMNXQ3VkkxOVNnVkZBem1NTU0vaVlFeERrcitIU3RNTlI1VlBm?=
 =?utf-8?B?d080eHZKNjhZTU11Q2ZZNWxpZldjQ2hWZTQwK0ZKdndkOTJYY2RaRy9jNEJy?=
 =?utf-8?B?enM5Qm1wQXUyM1ZqL0d3cndXYTBnUzdzSmx5RlUvb0MrbnZFazV0aFVpZ1Mv?=
 =?utf-8?B?QjZ5UlJJck9rMTVrVjBTS0RhakxsNDhvQ1lyQk9ZSGRVZGJleWhaRnRrbjRr?=
 =?utf-8?B?Nis0SnoybSt3eDZRUStwQUVWM3FOeEtpT1BHaHN6UHNFbG1DcFFrakVGZ1k4?=
 =?utf-8?B?L1ZXZ1RJOCtOZ3ZBWjE5dTY2TzJFdlJoVGlCQUdLMjg4TUMzY0NRcjh1SE1E?=
 =?utf-8?Q?37ytjNmyHjgpDbHV1lfFtAalEpLZflDgs0MGLSV?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6444f113-be38-4678-f058-08d92b56e0b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:57:18.4446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OEs/WLuOgL1W8AAdI+I0x+jJqxosjQj3HBSe2Q0ebEzmZ/PnR0R9XBr7pv3rAZ54L9wbWyAYjP/Zb6cb7hvcZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1905
Received-SPF: pass client-ip=40.107.80.94;
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
IEFsbCBjYWxsZXJzIGltbWVkaWF0ZWx5IGFzc2VydCBvbiBlcnJvciwgc28gbW92ZSB0aGUgYXNz
ZXJ0IGludG8gdGhlIGZ1bmN0aW9uDQo+IGl0c2VsZi4NCj4gDQo+IFJldmlld2VkLWJ5OiBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBS
aWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gLS0tDQo+
ICB0Y2cvdGNnLmMgfCAxOSArKysrKystLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6IEx1aXMgUGly
ZXMgPGx1aXMucGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0
dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRw
czovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

