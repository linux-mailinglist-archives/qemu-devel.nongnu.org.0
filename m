Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2A393128
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:42:15 +0200 (CEST)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHDC-000748-HA
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lmGxW-0001Lf-2W; Thu, 27 May 2021 10:26:03 -0400
Received: from mail-bn1nam07on2134.outbound.protection.outlook.com
 ([40.107.212.134]:13797 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lmGxN-0005NU-Ul; Thu, 27 May 2021 10:25:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEbzc3vIWpOOzDui6n6jHCO0TIIGmvb02sTVMniqDCzPJvid8I3Zy369aaGSqWOgbaftgtdhbtYphYDT+fiw3zRn51DX5plCuhpdKQ+xGkrVKGk1nd3KOFaF0TxrzBJQQv3ZM6CdWmk3ABitg+3nlGh4rNyI29094y6+eS4nkfefhXVEzUfE6c1rJfwykxuj7HUGlGPVjHQsLgEuiR+/Aj9AKVV6CWvX04oHVe3YnivgJxhMWGbx74dglIUMg/KLVLWniB2fZLjVgQLxUgGKTptQhKuiojuvho+9nmZESclaLPNVi5BVp15jrEoohnHbgCD2AmGWOPOE5ouJYwHHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuTbjMLnWycyfYrUmGFuuEznRM+lH6Y7JYvG/NFVE0s=;
 b=BFoDtkrAxFUgcjcOEgXP6ZWNFFPWAlW0CByl3R+iRlZZyaItqd0iDm9FUjjrI7hFiLeyQG6TZ4BPbJI7ZGiXgK7Nwb3hk6Rw4XX2jaUYvL+N0TiUXasYEAUrHYApW3P4gQ/3z+UIKYJ0JU47S3arq6eFK7zq9vhPd6yydFB1J2vtqCGaumiAIIkE3wsGfU7uWMb8R0d1dUe9/+7llsi4kqMUuhYYX7rDuFXlWBZYG6LNf9JalcHa9pNLQ3urrQTHGZNfCqxUOL5DbtN+sV/LMe0LLnbl3IT3MSEABjh80jR9EUw6rsOsQdcbQ8VsBTi57BAnUJ+unPIabtjkiFqmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuTbjMLnWycyfYrUmGFuuEznRM+lH6Y7JYvG/NFVE0s=;
 b=jVj7+IANKFTaEWsCD/ZHYq6ayJZGGsyUJcr/9J/AvcYmi7KarrMyX1sLZgUO4X0DbRxDJ7Yh0g5iPnZv0yXqQKNococz3vGd9dGtorAlYvJJRoybqtUrRsMb6EHvwCWObp6uPsdXMhrsycaL4CVvmcCJ2KDwMFThMy5bwm1BWcwXIHyf3+bqyOBCOJjg0IcdhwaeA/trmQDvHHkp8G5vmUZ3M4C+WixSaBIkK7asLqKu7EdI1h0DR51kOXddiVez+GhJ2Wnysrlk59P/k9KXTPZtgYBJ8KxiYDvQfca+OCR4pJ494vEfTLYsOBX2ta9b1H6kV0nk1EIUhgBrRolOOw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4434.lamprd80.prod.outlook.com (2603:10d6:102:45::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 27 May
 2021 14:25:47 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.024; Thu, 27 May 2021
 14:25:47 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Bruno Piazera
 Larsen <bruno.larsen@eldorado.org.br>
Subject: RE: [PATCH 0/5] stop collection of instruction usage statistics
Thread-Topic: [PATCH 0/5] stop collection of instruction usage statistics
Thread-Index: AQHXUmzV0FK+xanQ8U2anCsT0YoL16r3W7eAgAAE3fA=
Date: Thu, 27 May 2021 14:25:47 +0000
Message-ID: <CP2PR80MB36689194A6DF4B3848702C7FDA239@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <87v9741djt.fsf@linaro.org>
In-Reply-To: <87v9741djt.fsf@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.9.76.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f668150-467f-4293-effe-08d9211b522a
x-ms-traffictypediagnostic: CP2PR80MB4434:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB4434BF7FBDC9F29DF97C413EDA239@CP2PR80MB4434.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PM/QkrfZzj1ivB3WuHM11gl18UY/YZ01pMdWn64LAzKDWbkxNpq/CpTdDp/tZODNuFjl9HxE7cGFHQi/vIVFp3B/WpGHLCmCVr9l/SQjfoYj/bwkGpDtAkk08E7tQ+kcdUvIZPxMJSd8XTf+YVN28vhB5TpVmp6fIJF4Z+o1wAlhq0jyhnPCY46gGHyYUvTY+c2+uVPPDqvs1iOOOI9LfwkB75yL4GT4B8nZfbOR4vY7STUDkercB400Ex9RG1IsLPjv3P80xRnK1xdm80756CnammI0oO57rLHzpVsgf07g/C+15zkuAjtj+9ON14KvrFcjb7Y/Dtb7Q5OnWWOBMfCYQUWTjK2caZMJ3a0FUu/fTk8wVLLlIAkVvNo/AY/odiikwewL3LHDyqvZ189l1/LCQwOhtRhF0AmKIsybp+hhettQ7Qbejpu9rRzCLiHS0lIhV6wiTEx/cScc4ghenBp6Fr5wg1NxvkqU6fhMLV0iTaenRlRmqx2PftJjSNAYw3Qx2BY9STugb+UKvQa8CUCE6zHc66zKYxJtHBjzs5Ms/GKyJ5uBzaH2xBd4NOiQnREgdZfPWZ0ASelUMaZ9YPPoC//tfUJLeTcy6LflIpOgR70vkL23DI0uqLALBtC0ehBwzi+MB2s5IU0ZkPyaA3YP2PiVpTuqbIrnU7CdzZDhm598kVdqxTQpkmKBVP8KJ8f0OW47R2gb40ijcdwIuuoirxBQAx5zQcouTk4+aTg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39840400004)(136003)(396003)(376002)(346002)(186003)(66446008)(66476007)(66556008)(66946007)(64756008)(122000001)(76116006)(5660300002)(52536014)(33656002)(71200400001)(26005)(4326008)(6506007)(9686003)(7696005)(55016002)(86362001)(478600001)(8936002)(38100700002)(316002)(110136005)(54906003)(2906002)(6636002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YWRhd1RUYWVwbUdIREhmSkdTYitSRDRZS1BqYUpYd3F3RU9BMGhjRk5MWnhE?=
 =?utf-8?B?MnFZc3liMlM4cTNZeVJ3R1oyUEJDWFNNU1J4SWxKbENmSHduRmN5WDU0UjBs?=
 =?utf-8?B?aDN1RkRILy91TGpEZElPdEtreWhuOGxBZFc1WVo4WWFMN3dsMGQyVFBUeVBF?=
 =?utf-8?B?UFZGQ3B5ajJXTEg1ZjZEeEEyNjBhcmRlK1l4ZExWbVlxdDJaVmpER0xiZW1I?=
 =?utf-8?B?bGVVQkVhOEVLSjJjdWxWY1VNT25OaitKUmFzazJGV3NjdytFakRkMEw2Snhk?=
 =?utf-8?B?Q21LOTBlVDlWbytMOTNNWTZDaE5LZkxrZTZQSlB1UjhQTG9OeHB4NzVVdFZS?=
 =?utf-8?B?RXB6VVhKYXd0ZER6a3J6Y1FKbXBTc1VTZUhSZGxlYWJOVjMxRTJYK0NIOXhI?=
 =?utf-8?B?Smt0cHFmS3FFb3laUXBEblhFODRmUWo1eXVyeGI3NUNZQmZsRlBSME0wSytE?=
 =?utf-8?B?Nlh5QjB2T1BQVldBYnVrcnV4RGFIeVJLOEF1c1FDdGJudHorcFpPQkcvNU5t?=
 =?utf-8?B?R2NZbDRoaE9sNnM2YkxKdmttcXA3VEh2Nll1enZ6aXJPRi9nb1c1Z0Y1SFRG?=
 =?utf-8?B?a0NaVDFxUWhiaVRPTDl1NjVMSkFZeTQxVTJXR29kVEo5anQyOHZJQ29RdE5n?=
 =?utf-8?B?b2dEallqMFd5YTRHbXF2dWc4UXdiOEdobERuUm5mRUFTZ0xIWnBBZUNkRzVv?=
 =?utf-8?B?eTF0bjRuZFN5ZEdsdlIwaXl6VFFkZFpHeXJGWXZjMnRWcGh4QUNVSjk0UlVJ?=
 =?utf-8?B?MHF3UVU0WnAvN2UzcXdVemNHVXNJQW4yeXoyQlpRbzk4a1N6VkszdVB5MU8v?=
 =?utf-8?B?OGtoSFFQZGhEMnV3VGV0WHIyb3hTTE1EQzU1LzJ1NWhSTUN0anh0d0hoVHpy?=
 =?utf-8?B?S083bGgxNm4ycHFCd21qQitSZWxYanVVbVlBZmZzR20yNkpYeWhWRTIrSUtQ?=
 =?utf-8?B?TkwraGVXUkJCMzdMeXJOK3I0K0RUU0hxcXBlWUZ0NTUrTVRCYUNjZS9Zdkxl?=
 =?utf-8?B?VWFXczhWUGNERzA1Zzc5Z3ZYNjdnYklraXozL202RG82dW5yWGFtSlNXVHNM?=
 =?utf-8?B?bVBiMkI2RDc1dWhNMmF4Q3JXQmp4QnVFY2ExcFZpSEpMcXhoWkk2QllxTU5k?=
 =?utf-8?B?TEs2aGQ5VCtyT3FIQ1kwcURUWUxQajJZOE40TFhydmY2UG5PWE16Ny82L1Jw?=
 =?utf-8?B?OHY1ZmpwSXVaVVZMTktsUytxdlhqZTBFUk9OU3lGL3N3WDJxR1FVdFR3N0J0?=
 =?utf-8?B?ZHEreW9TTW9lTGxXMkRRVmgrRjhNOENGbFBIRTByU0thNC9HR1Y2ZlNzd2J5?=
 =?utf-8?B?M1JFdHZTSlE1UWlWajdTaTRDbkpZbWhIbUFnRlp4Slp1TUpTUTNoZlQ5OVFC?=
 =?utf-8?B?akFybjY1Skd5aHpPZThoQ3dGUUorZnd5SEZ0RU5PMTNVTmtDejRwN2xhMEl0?=
 =?utf-8?B?bHJpRTNwa3ZJMnMwS3lRT1l4K1IweEdpajBwNzFYUTJOcHdTQzlzMURxRnBQ?=
 =?utf-8?B?T2lTdjluUG0rSmZhVUtDNmFhRzc4dUpEdkI4TkdLSmJPVFBwYXR5SEFOSzdK?=
 =?utf-8?B?Yk94REF3bzJRaDJhdGhpY09CSTJtQlVyQXNLMDExdmNxV3EvbERtSHljeUw2?=
 =?utf-8?B?N0NvUTV6Rk5WQTR2aWN0TzYwYnExRDVTUzNhQ2svSWtDNW5LNi8yck9SU2xp?=
 =?utf-8?B?QlRRdWhYVjJRblNRYjdsM1pOaHJVTjVRb1Z1U05pcUNqUVFaN2RkejBMZ3BM?=
 =?utf-8?Q?yxi17uyMUTx2ciHfX0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f668150-467f-4293-effe-08d9211b522a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2021 14:25:47.4196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0VxMfV8zcLTgwnIPZ+wii6o6HMySyAaRMEvkkOdiiWYP7l/m/ZO+qEmNibXpjO/RNWKbOdfbzxbH3a4xbmtExg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4434
Received-SPF: pass client-ip=40.107.212.134;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBJIGhhdmUgbm8g
cGFydGljdWxhciBjb21tZW50IHRvIG1ha2UgYWJvdXQgdGhlIFBQQyBzdHVmZiBidXQgd2l0aCB0
aGUgY29tbW9uDQo+IHRyYW5zbGF0b3IgbG9vcCB3ZSBoYXZlIGhvb2tzIGFjcm9zcyBhbGwgY29u
dmVydGVkIGZyb250IGVuZHMgdG8gaWRlbnRpZnkgdGhlDQo+IHN0YXJ0IG9mIGVhY2ggaW5zdHJ1
Y3Rpb24uIEl0J3MgbmVlZGVkIGZvciB0aGUgVENHIHBsdWdpbiBpbnN0cnVtZW50YXRpb24gYW5k
IHdlDQo+IGNvdWxkIGluIHRoZW9yeSB1c2UgaXQgZm9yIG1vcmUgaW50ZWdyYXRlZCBzdGF0cyBh
Y3Jvc3MgdGhlIGJvYXJkLg0KPiANCj4gT3V0IG9mIGludGVyZXN0IHdoYXQgd2FzIHRoZSBtYWlu
IGFpbSBvZiB0aGlzIGNvZGUgLSBhIHZpZXcgb2YgdG90YWwgZXhlY3V0ZWQNCj4gaW5zdHJ1Y3Rp
b25zIG9yIHNvbWV0aGluZyBtb3JlIGRldGFpbGVkIGxpa2UgYSBicmVha2Rvd24gb2YgdHlwZXMg
YW5kIG9wcz8NCg0KVGhlIGxlZ2FjeSBpbnN0cnVjdGlvbiBkZWNvZGluZyBsb2dpYyBpbiB0aGUg
UFBDIGltcGxlbWVudGF0aW9uIHVzZXMgYSB0YWJsZSB0aGF0IG1hcHMgb3Bjb2RlIHBhdHRlcm5z
IChiYXNlZCBvbiBkaWZmZXJlbnQgcGFydHMgb2YgdGhlIGluc3RydWN0aW9ucykgdG8gaGFuZGxl
cnMgdGhhdCBhY3R1YWxseSBpbXBsZW1lbnQgZWFjaCBpbnN0cnVjdGlvbi4gDQpUaGUgY29kZSB0
aGF0IGlzIGJlaW5nIHJlbW92ZWQgd291bGQgbGlzdCBob3cgbWFueSB0aW1lcyBlYWNoIHNwZWNp
ZmljIGhhbmRsZXIgd2FzIGludm9rZWQsIHNvIGl0IGhhZCBtb3JlIGluZm9ybWF0aW9uIHRoYW4g
anVzdCB0aGUgdG90YWwgY291bnQgb2YgZXhlY3V0ZWQgaW5zdHJ1Y3Rpb25zLg0KDQpUaGF0IGJl
aW5nIHNhaWQsIHRoZSBjb2RlIHByb2JhYmx5IHdhc24ndCBiZWluZyB1c2VkIGZvciBhIHdoaWxl
IG5vdywgYXMgaXQgZGlkbid0IGV2ZW4gY29tcGlsZS4NCg0KLS0NCkx1aXMgUGlyZXMNCkluc3Rp
dHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8gPGh0dHA6Ly93d3cuZWxkb3JhZG8ub3JnLmJyPg0K
RGVwYXJ0YW1lbnRvIGRlIENvbXB1dGHDp8OjbyBFbWJhcmNhZGENCkF2aXNvIExlZ2FsIC0gRGlz
Y2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg0K

