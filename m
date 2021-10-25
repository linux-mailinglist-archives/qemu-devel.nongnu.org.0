Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31885439EC4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 20:56:43 +0200 (CEST)
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf59G-0006bf-8t
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 14:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf55L-0004tp-Nb; Mon, 25 Oct 2021 14:52:39 -0400
Received: from mail-eopbgr820098.outbound.protection.outlook.com
 ([40.107.82.98]:37532 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf55K-0004aJ-71; Mon, 25 Oct 2021 14:52:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tz++9jG7EVSRw4t9Ps+Lig5YPTxJx6M5lBs6lmPYtBW1iH0QRtVa5JAlfAL0DDuymy/ofuoUMCuwr96+lxyIPcfKI/PuLDzPE1qnHND0kgpZtQhHMS96D3aUWoZR2raUgOkBxomdAD7Rk0z+BsGiK/13HToVUL2rQKzkjsGCezMQ/WuUw5tr8yDI/lzuvec5Jln1u1ER+U9iXc51XpglAJ2i/QkFQ+YPlSZX3ctPmvB9Ja3zhG2S2rC8kzqKrlRVCWNkg4FClMCia/Xmlb7+BnrOJjrAERP36Eb7oJpssD9PYfEwlIItXe3ZXE80beNU+x9qJDXmLmW0bk+BT+pLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xby0EG740+FQj/XuaAZjHYlrqulQmLtma3Wwukl9p1A=;
 b=MROdsRejJG4l5dWKO2iXu0ZjN4UARMZkOA3chl5WSbVFKWmexjQK0DlFOOrbec7CMsvqC0fzY2jm9oXNsS9mPBzUSw5ywjZS1DefpGh9tyruki8qdwdRecEFYYbrYy4VVtflb8FhCIaNeoebGdN1lX26EMRB1KCdVVnH6JmGARlbP3vkO7Z4Ylsav2UfrfjixusB6kPRkWhlJFr161RsVIPUNPiLvSmA7cu2/+TeRo4zoy4i+4wyaGL3ZJhsnoM5VFMD318Dz3krX6kRy69+xVbamHcwiUsvmnJ+2LeucuGd0u/RqF9sqrSFVZvduXwPg4uw49T3W1nV/czMXPGpXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xby0EG740+FQj/XuaAZjHYlrqulQmLtma3Wwukl9p1A=;
 b=LYs5iaLLPwT4AzqlpADv8Z+/IHZpQQ3cA7Pwlus/VMxMDacQ452Nj/4agCyzoDGLsi/m/pgv/iOn7UkkTRUAKhN15GKyVwxxrkmiZrN5bTNYkerbtd4Oy3sgFg2FF8/woR7t88fIFODhL7LLV/1eUZb9/81UXgXTquqVXMTZDNPLd49RKuO/ySr63lnRP/Xm2MQNIqxw1pYV1paT7KNJoVhI51NaGiSaGsAE8xg7ZI0t2d9hT4MQb4RdASIIoZvMl2pNMEmx+CFMKlCdNrzg2XvMiWFcTlK3EjTrZUp9QCwHCr0fokrn1UYaEDuKczpPTdFapawJRwztRb8zeINyQw==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4467.lamprd80.prod.outlook.com (2603:10d6:102:48::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 18:52:07 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 18:52:07 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: RE: [PATCH v3 16/22] target/ppc: Move dtstdc[q]/dtstdg[q] to
 decodetree
Thread-Topic: [PATCH v3 16/22] target/ppc: Move dtstdc[q]/dtstdg[q] to
 decodetree
Thread-Index: AQHXpjbRhgQN95zcFUCdmi6n0jJGHKveQSwAgAYRU1A=
Date: Mon, 25 Oct 2021 18:52:07 +0000
Message-ID: <CPXPR80MB52245A34281585A6B9F962C0DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-17-luis.pires@eldorado.org.br>
 <a460a151-c1ad-36f4-b76c-ac34af0281db@linaro.org>
In-Reply-To: <a460a151-c1ad-36f4-b76c-ac34af0281db@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc17adbd-9b53-4acc-16c6-08d997e88b20
x-ms-traffictypediagnostic: CP2PR80MB4467:
x-microsoft-antispam-prvs: <CP2PR80MB446739C5DA394C5C76B4D336DA839@CP2PR80MB4467.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yiYGjfaym24AUnkpWBDRqsTX3f1tjsq/qApQreoR3F6H2Xdk+00d1bvdelavgiHtKecR7slnQrSSYrYNQ8chkLfgIu/pQXocNytjGKLTSOIa59vEQXH+3SDZx2W42jOOKuWMl1KJD9DxADdCtbSGwoSnJnvtOKLW3oOzzkKxxN9LRTbn/9902LQVTrz3GjVDln1GnWeBFHH/Kgm0nkXXAMwTEiYJXpfJY/2A3fjOYDYc6BXDo4hoSNcxgJs44RnTTYPBxAoCt8sT8WKOyZkCTXhULufqRQ5eKZoNshdXY+cbf6/6zdFZfg8Xbmj+t0LgmjwDsxRqQddcGtYtqTx+kIEEpGYCCJgrMMyWddtz4k0yVlMdZxiWffvO02B4PBE3wLyISiOpcKcCnWad/Dx+OmcPgKeg8oMW4qkhHteC8NrhbHR8G5Bgyp7zFtoz3fm1vCMVujalvnsLf9pTwDEw2/bfVTnwArmMn6qSIgSfhaOpcze5tbJ3kHKp5xCmUfbujBuPlM/ZBKdSZ680ApKVceeUFijxs4rVhXv5YEPq16nJVmfRbIhXMBFJJS9bUovH1CXVAIw9Bh9fetdWT3D6SvlEDWwkBBEzNsIyeC0igEmpS50Q0DizEuYEuxl01l1WskibagaV67ZZh2A/fnraigDU2e4uWQq5kzjYMLsRREcEed/av3fwQS3cRublRGYAACX8IzlW7qYM69sLSV9S8Vx7cTJUa5I8J52QnIw92tg88AYagNOeFN/XLGIf9dKHkUMin4l5+8WerKze6IaLz+68lc5wbTNyM0VrnQGdxRw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(71200400001)(110136005)(38100700002)(4744005)(316002)(2906002)(8676002)(7696005)(33656002)(4326008)(5660300002)(52536014)(66476007)(122000001)(83380400001)(6506007)(53546011)(66946007)(66556008)(26005)(8936002)(86362001)(66446008)(38070700005)(9686003)(76116006)(186003)(64756008)(55016002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzJVVysyMzhSODVFT2F3bWFnODEvbnRMdE1VUW1Oa3VMYmpONGtIanZqM1pZ?=
 =?utf-8?B?c3gzTkxDUGg4LzkzK2lQT1lxeUVpamJKck1yV2k2ZWh1RytFcVczYmUxZkJn?=
 =?utf-8?B?TWNubThHOERmQnk2NFlEMEEvVEVyRjMwbElpT2lEV1ZaMFFBZCtHZnAvQ3pR?=
 =?utf-8?B?Rm9iZzhlVURmRG9uRmxKbGovQ3pnWCtGVFMrNDNxWm5acm9FZitZT1dMVTRR?=
 =?utf-8?B?Zm1sa3pWRVRtbk5Jcnp3Kzd2V0N1dU1qUnQvTmdpVHNlOCs5NEhweWlLZ1RC?=
 =?utf-8?B?cWo0U2YvcVNQMFFxcnE2YndYQjEyMEtKVjlLUUM4ejk4YnQ3NndVY240cmFV?=
 =?utf-8?B?d0RuUk9RZzd0a1FLL0czZlE5aWNUeUQ1WkxEOG5OcisvRE9tVWFhT0tEMXBC?=
 =?utf-8?B?amJ0ZDZ2QjA1SFFFcGxhOTVoSFNVZDhBK3FjOVRSd2sxV0JrTUp3ZDE3N1Q4?=
 =?utf-8?B?bUFKK2M4ZE5MUjhqN3B5SGlJSFV3bTFxdGxqY3BhSFNrd1kwelJnY1huaCsz?=
 =?utf-8?B?WkdaemowNy9ScjUvWW4zbDBBOVlETnFsakRGRHF0RG1uVS9IV0NwaGkzeDNu?=
 =?utf-8?B?T1FrQ3R3djRzYXZKdzF4dHR1cG9ZelVnakN1dW1DWjJmS1UwVCtqOHRTekc1?=
 =?utf-8?B?SEJYVVBSL0dTK0d6MStBSTFZUzJaRGdkNkQvWVppSXFxZG1uOUJYcFFXU0hH?=
 =?utf-8?B?Z014WUxMUnFMemMyUFYzTUhRbmJQSkhtTHlIckpSSGw3eTN0VGlkcDhpcDFX?=
 =?utf-8?B?emRIclBBRklRTVdNaXEvUmd1TVFlRE9MNDNiQldoTnJ4VmV3U0hUN2pBWUc5?=
 =?utf-8?B?VG85ZkF2S0hKeDVKbnZ1UzVlLzdGN1k2NnJaazdTdW9LdWVwY1FydUtaYmlR?=
 =?utf-8?B?MnFRTXZQRWZQdlA4MUFBQytLY2pNbVVaZTMzeGJkd09rVG9XamptYTNWMTBo?=
 =?utf-8?B?TStleW1LU3lMdjNlUGZUY3dXTkpjanlYVXF0elcycWpNc2RqcmJNVGtKT0hJ?=
 =?utf-8?B?aXM3ZFJCc1ZkODJBdDNkV3BselhBT2VONDFaL201MDUrUFpycTNFaWV1TnB2?=
 =?utf-8?B?dm51TE5tTHd5Z2luTk1XWmxzdDgxR29ScVRGaFRzS213MXd2ZTEyUU5ld2Zn?=
 =?utf-8?B?SU4xZ1ArOXRaVHJqcFlwd0xxNVJNUUw4bGFONC9aS0hJbVE5eThLUlpsZXJU?=
 =?utf-8?B?bzlRTjNaWVNWblp5SXpYcTgzSXUvWTNsNXhvWXpCNWJ6SStmU3phcEpBaFJj?=
 =?utf-8?B?NXVHSlh5TTI3Zmw3WXJlWmRRbzJlbXZ5Z1U3QlRPYmxocW1LUGdWZ3k3aCtz?=
 =?utf-8?B?dFNDeTFwVk0vVk42eFNuSjNTams2N0FLYTNrNXFrVDRaMTRJdDJSZDdMNklk?=
 =?utf-8?B?VEYzQk9CN2h0QndGaUlpcnFnNEVqVGxaTnpLZlZROXJaN1pWNWdyUm5yWlk5?=
 =?utf-8?B?TGhVQVlXMDlYb0FPSG5BTE5wb3h0VU5UZzh4ZTQvRmNVamd5QU9TamYwY2dm?=
 =?utf-8?B?VHo0ZitaOVYxckdrTjM3N3pPV09kUUNyYUt5aXZESVNDclFTNGtJVi9keitT?=
 =?utf-8?B?WS9BME5tbkFxSHpGMm9VVG1yZ2VKSHpuLzdTNXNPK1B0R2xQQTQvejVFdnp1?=
 =?utf-8?B?ZDVhUjVnclJxNEMyU2VVRzhFdUFyRmhINjNRZ09GSmRtcGI4MklTQkNXYnZI?=
 =?utf-8?B?OWZMSVNRNG5FR0x3L2FheGVlUnE0cFJRZUd1cXUxYjh3aG9FNExYNUgralpy?=
 =?utf-8?B?WEhnenNmUmEvTUJwL2x1VkpnUmpVbFp0dk9DbXJRTDZiK0RTM0FicXI4V1cr?=
 =?utf-8?B?NUhpR1NnZVAyY09aWjNjYzh1bEMzWDlhV3ZUR2FBT2hXNVdHVU5lbVBxUmtH?=
 =?utf-8?B?N2FDQzVIN2Y3K3JSTldPcCtEUTFDV3FJbzBRdDdtL2VYRHlvMW9OYVMyeWRh?=
 =?utf-8?B?b0RQNksyYTJhbTdGZFk0UUhQWTlhM0UvaEgrdTdKUXNNbVp4QjB5cEp3cUx5?=
 =?utf-8?B?ZjVGY3I1N2VicVNCZzU5d0N1R0lFYnh6RERxQUdBRHJLNUNmdUJsLzZocCti?=
 =?utf-8?B?Z3JCTDhIOC9PYVBXN1lCdWdhNmZzdHgyUDV3SWJ6TjB3TXY4bzF4SkRQWVpO?=
 =?utf-8?B?R0x4RUZUVEpsN2QyVGtQZzhRMmxHdXp6eTV3eWdPZGdUQVUyQ3FrdWJUUGM2?=
 =?utf-8?B?cFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc17adbd-9b53-4acc-16c6-08d997e88b20
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 18:52:07.1578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YkYbICE/4P1QnsCPJ6u3r1Q2rR4vPHgjTwgW94pPC7DZozLwa6/rWGy4pGNth2h4/Vyywg1Tc8ND6A3KjjFh6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4467
Received-SPF: pass client-ip=40.107.82.98;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "groug@kaod.org" <groug@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IE9uIDkvMTAvMjEgNDoyNiBBTSwgTHVpcyBQaXJlcyB3cm90ZToNCj4gPiArJloyMl9iZl9mcmEg
ICAgIGJmIGZyYSBkbQ0KPiA+ICtAWjIyX2JmX2ZyYSAgICAgLi4uLi4uIGJmOjMgLi4gZnJhOjUg
ZG06NiAuLi4uLi4uLi4gLiAgICAgICAgICAgJloyMl9iZl9mcmENCj4gPiArDQo+ID4gKyV6MjJf
ZnJhcCAgICAgICAxNzo0ICFmdW5jdGlvbj10aW1lc18yDQo+ID4gK0BaMjJfYmZfZnJhcCAgICAu
Li4uLi4gYmY6MyAuLiAuLi4uMCBkbTo2IC4uLi4uLi4uLiAuICAgICAgICAgICAmWjIyX2JmX2Zy
YQ0KPiBmcmE9JXoyMl9mcmFwDQo+IA0KPiBIb3cgY29uZnVzaW5nLiAgVGhlcmUncyBhIHR5cG8g
aW4gdGhlIG1hbnVhbCBmb3IgdGhlc2UgaW5zbnMsIHdpdGggdGhlIG1pbm9yDQo+IG9wY29kZSAo
WE8pIGZpZWxkIGF0IHRoZSB3cm9uZyBsb2NhdGlvbi4gIEl0J3MgY29ycmVjdCBpbiB0aGUgc3Vt
bWFyeSBvZg0KPiBpbnN0cnVjdGlvbiBmb3JtYXRzIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIG1h
bnVhbC4NCg0KUmlnaHQhIFRoaXMgd2FzIGFsc28gdGhlIGNhc2UgZm9yIGRzY2xpW3FdL2RzY3Jp
W3FdLiBJJ3ZlIHJlcG9ydGVkIHRoaXMsIGFuZCBpdCBzaG91bGQgYmUgZml4ZWQgaW4gdGhlIG5l
eHQgcmVsZWFzZSBvZiB0aGUgSVNBLg0KDQo+IEZ1bmN0aW9uYWwgY2hhbmdlOiB5b3UncmUgbm8g
bG9uZ2VyIHN0b3JpbmcgbmlwLiAgSXQgZG9lcyBzZWVtIHdyb25nLCBidXQgdGhhdA0KPiBmaXgg
c2hvdWxkIGJlIGJyb2tlbiBvdXQgdG8gYSBzZXBhcmF0ZSBwYXRjaC4NCg0KVGhhbmtzLCBJJ3Zl
IG1vdmVkIHRoZSBuaXAgdXBkYXRlIGNoYW5nZXMgdG8gYSBzZXBhcmF0ZSBwYXRjaCBpbiB0aGUg
bmV3IHNlcmllcy4NCg0KLS0NCkx1aXMgUGlyZXMNCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxE
T1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3Jn
LmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

