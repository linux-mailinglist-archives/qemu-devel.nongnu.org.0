Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F623466ABC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:06:39 +0100 (CET)
Received: from localhost ([::1]:41858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mssLm-0003GS-4B
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:06:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mssK2-0002JQ-8w; Thu, 02 Dec 2021 15:04:50 -0500
Received: from [2a01:111:f400:7e18::625] (port=24992
 helo=FRA01-PR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mssK0-0002iR-GB; Thu, 02 Dec 2021 15:04:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jioqa5Z27eJ3H+wNrNKX96r6caOlgYUgg6pQBQQms49vg1kWU1ZGIq3H7b2BnwV7XQnbgTl2P9uKvFgtkvBH/rULc8Q2FlHyUkJY67ATSwj/8kKx3Q8LK9zYzjhsblmTpT6qT1arPuWzc6c5xdXQ9gWg5fDbotLBHtoRYOu06XfU8yZYtOyuQTSnZdjcXXy7Rfs8aKgVR4oIvnK5GF3eNl27l+j3KQ0oCAAn1JaQ8cx8XX7cp8m3C21TQCzjDZSAOHHFWMlgo26wIj/Fs84BHFwTFuLeLi88fXJ+vzFA3uXuSkcZPYCYpVryZeBNpmZ/nJiukpISUpShLGQXHCLRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EOlNxiPYxOqciSP8SRFB/wjURhq1ZJL7QxzOpGsxdM=;
 b=XbQsHKq4QgOyxONfMqDnr2846KjekJKpAJSGVAnrRM8axqxcXAPZuX2DL1dR8aaE/+Ax6G0RAulnGsUa8TXqBf82mJoBut77UXEw8tDzZXaXkjujOh/ZClVHcWe8h6dW2hENQvGav6mm1cmVeV3pOyrFJYeTY4iC/qw+gJouHX0tjVuAlU4BpmDK3xwcRRtT5ioyXBiiwhgIWhacnGsc6IwXrPnLOUyMBB089TANakpY5X5BklzXxbReZFRXr40qRt9itanZ06eJe1/kT4djY/+L+EeFg6ZcGHypVM6S1M7Vw6wg1o3H7DkBZ7FLmQtJafL4eQseTucyXuE/W+O8ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3154.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 2 Dec
 2021 19:32:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.016; Thu, 2 Dec 2021
 19:32:11 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Thomas Huth
 <thuth@redhat.com>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Change kernel load address
Thread-Topic: [PATCH] hw/ppc/ppc405_boards: Change kernel load address
Thread-Index: AQHX57DjJhJuDZQnKkqKeG5JofQWd6wfkwgAgAAAsQCAAAN/gA==
Date: Thu, 2 Dec 2021 19:32:11 +0000
Message-ID: <32012645-274e-9ee9-2d8a-a3d87c4a6bf5@csgroup.eu>
References: <20211202191446.1292125-1-clg@kaod.org>
 <d8119266-e6f1-969c-d440-d511951178f6@redhat.com>
 <8d21273b-0b81-5041-cfc4-704307aa37cc@kaod.org>
In-Reply-To: <8d21273b-0b81-5041-cfc4-704307aa37cc@kaod.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef8b59b1-98cd-439a-867e-08d9b5ca6fcc
x-ms-traffictypediagnostic: MR1P264MB3154:
x-microsoft-antispam-prvs: <MR1P264MB31546D21DC35FFCC566C28C6ED699@MR1P264MB3154.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fv7Q3hQA+DLo5wAqtmHPg9ok0IJbp82gWA5+IB9ecS6ZdXWiCPUTeTjpEfkqrRSCnUJQ/N2ju88IB7BF3Lwg0vf8iY/1bw5DLNblQ9AKOtOky+eAf2oUJqZTWGSR+pfNu0ENqMJVN9lTYwMfl0glruCVB68Wd2fj+zj/Tbsp80fjAMSZbXNczh36QZhFnlfV9OMGgU2nbdZ5chT8FQQ2JzjPa3r1GtwbbSbD7kVQfiUdOCmWfBjcMaHnD6WA4cPI9DPm2cZaDL6kPfny/PyDIejdC3WjUWVzXce+6gtjzUQ7KUfM9KqROB8aThVT4Eh+MiJf16roqjfwBZ9hN0W36AC9ZlfxmtyQiRrPi1/xRe3+nSSJjE7a13AQ3b3m9a7ARzSOpgDOgAC11gaGuVhUQMAz/LOxKApErd7s9bPiPRq+YTm1dEJE8qiQEt4TNCTvBdb+7yQDldMIsTH6qdYqEbVvKU6yOX3C6DREkO3OcxeWElLBTz7nqA3Wdb08GC97v/UtylZYuyZiRPDwvIVCHWT5/JveDKNwtLqeF/zHo/CglNYX6jIcLaISfOmVvV0z+ASQr5ueRyihN2Qh2aKQasIPjo+dfXoHDtd1UypMsknmX46rYJELTOAlskxZLLdTvZMOpN1QFncgrQO9Tu/n2J0pe42Q1E6LbAG90rWm8zm0b6SeOQnIMvOL5tbCDGGixoviejHfXJvSQU2N2lkqGwQgnhleZZJbs3UX2II7ocnqCthm8VpnS7DeusAO1MH9sLY3sh7ADZP8fj1HkPZ+QQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(5660300002)(38070700005)(86362001)(4326008)(4744005)(31686004)(508600001)(2906002)(6512007)(53546011)(71200400001)(122000001)(26005)(316002)(64756008)(66446008)(66476007)(66556008)(8936002)(186003)(8676002)(2616005)(66946007)(110136005)(91956017)(76116006)(38100700002)(31696002)(54906003)(36756003)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHFLbnJXRzJuSENrdWFUZUVLbWF1RjhOTzFVWlFYL1FKOFcyMXU3MjVPVUxr?=
 =?utf-8?B?VWg4WFRJUlFsbS9HVUNYV2ZJbUtYaXhuOGllUG90NGVPTXFtd2hqdjVyTVp4?=
 =?utf-8?B?ZFkxMmRSN29tb1hrTnVxcFRibXcwM3FvSWVZTlpyUTd0cXphMjcrYU02UEdZ?=
 =?utf-8?B?Rm9CSmswNFJ3ekdOMC90eTJsYVE4aWFmZFE0dHFrVXZhZmswbVl3UmJraTkz?=
 =?utf-8?B?Tk9VT0F6YTUzZGNZYkc4Y1FkZHhVQTQyUjVkK0kzMzUzOUJtMVB1c0NwZFB1?=
 =?utf-8?B?eUU1amRJTHRHenVVUlRldFhGRUdCb0lITGpQRzJvNDRMWno3aGU3V3ZET3pY?=
 =?utf-8?B?MXlwYVc5bW5FcVN2UEEwT3FuYVlLc0t0S3gxYTQ2cFFvMU9hUWcxNFJxZkxH?=
 =?utf-8?B?OXovTlMxazZXaHpMRW40eERWNjM5RlUrVEx3ZkJCNFI5WmVGSjZuT3k4MVg2?=
 =?utf-8?B?cFlrRGd6VW5DQlh1NWdMQ2tsb0oxcCtkOFJTRVkweXVHdzduMWNWWnorRVhn?=
 =?utf-8?B?bTE2end1dk9lNWF1WjIvajFVSjBITXBJMFIzUFZobVZqZTFmOW1GVU1iTTFZ?=
 =?utf-8?B?NDJQMVd2ZEVTMCsyVUdsd1JtcHNNOFBRR1kzSS9zeWE3RW5jSGs2U2hDdXZS?=
 =?utf-8?B?ZlI4MTRzSjBRWmo5aTBHMWhVWGtnalYrMkVwbVFWNUlRaGhFZzVBait1cHFD?=
 =?utf-8?B?cUFYVy9zdkpDMTBXL1ZwWXVLQTRheGJvMjRFNU1TSm9UeDlUeEVJZ1VSZ1h1?=
 =?utf-8?B?Sy9QeHAxcm5ES2ZST2QxNDR2OGxoMmRmalg3M0tQWTh4TlppZXZrWm9EZmxQ?=
 =?utf-8?B?V3RjMkJqYVE0dkcveVV0QWZ4QlZTQzVtOXNzMmxTOFQ2UVFKZ0lDRHJyOS9k?=
 =?utf-8?B?N0E4NEw2TElWNUVxYlpUeWNQSzE0VEdZSStNVnpya0h4VFpUY01BUm1nY3I1?=
 =?utf-8?B?ZlgzN055bUo3Tk5mWitUMmxXWnlmL2x2YUZRM0Y4NmNoKzlpT2ltRW1qZmVT?=
 =?utf-8?B?V2E4QkpVaVJFQnh6MU9iR0ZjYjBVQ0dMdzl2TTdJSGIxNUhmQ1RWZHRpQ3FL?=
 =?utf-8?B?VWpvWWg2SGFQNnkrQmczTFc5TnUyVUpneEhHd3Z2YktKWEtiRUlUTDRSWnZp?=
 =?utf-8?B?N2NSWjhpb0VGUVNFTnpIY0xUZy9WbHN1cWVXVlNrTFRGWm5xa2dCNGN1S1lL?=
 =?utf-8?B?aFdWOEFTbkU5bFVsMkdTVWpXV0RTaWxYNDhBRm5DT1JmWDBDRnQyV3ZBV2k3?=
 =?utf-8?B?b1plUFl0dkZIL0h2MU5kaDJZNVkxcnFMT0piVWlxR21VcUY0MVg4dWRHQzBw?=
 =?utf-8?B?eE4zMVdkUlZDN0FFd08zaCtQUlRtclVhQWwzdzBHOWdPVi95WGdTVmh2eDNu?=
 =?utf-8?B?WFV2OEhTWnRoS1lqRGdaU05za0NpZmZxcEl4ek1oOVlrbkdzNFhSUzZoc2ZJ?=
 =?utf-8?B?bTE3UFQ1N3ZaeVlnYitCcGVVZnc5OXNzcW9vam5JdkpZaVpFVU1ySWJsaWgx?=
 =?utf-8?B?Ri8yTXV1RXpCQzRsZEtwbDVqZ1VHK1NVd2lWaE9Fc1VzUHpNM3BiemhZRTBE?=
 =?utf-8?B?TVpBVmRsWng0N0E4QWlaNTJha1hhSlk1aGpEZlVDUXJZY25zOXFlVmNNb2ZJ?=
 =?utf-8?B?OWZGay9pQndtZndyRzZLNTREVmtEM0ZYeGRkbXEwdUFYM05RYkM0Mi83Qm16?=
 =?utf-8?B?QVJrR21oU2JZU0FYYUM3MWhqM2psWVdlMmhaMlV4SjBoaVJTYm9KcUdNWU9r?=
 =?utf-8?B?S0hIdGsxbWJnS2IvbXhRdUdFNjVBYTdJRzg2eUQrcldwTHRydlgrMUk2c29J?=
 =?utf-8?B?aVhkMVBsTWdmL3l0cFBOVVNQNEthTUZMRmJid3kzd1lMaytFcEcveUFJeEo0?=
 =?utf-8?B?U0l4Q2R0RWZDL0FOOXNXOHdGc3pqQmpmeDhJZ0NHbXhIQWU0VnZXOWk4SUth?=
 =?utf-8?B?SUcwVDdDVFYyWXVFRHlXZFNyMjJ3RnpCdU5ieTlFcnk3LzRIYWpsSXl0UTFk?=
 =?utf-8?B?b2tlQTBrMUJ6bUNWMHhrUE5BUGFXNWpJdElidEJPSW9JcmhWWFh5Mjk0V1dp?=
 =?utf-8?B?YitWSWppU0c3L09qOG8rNmdaSk95ZkpsZEdBR3JDTG12d1lsMFd0V3RwS1pu?=
 =?utf-8?B?N1hBTlBsVGI3bmpMajc5anJydGxqbFhuOUlacjEyTjJWZE9wRms0dVVrNFRE?=
 =?utf-8?B?RWx1Mi9yVDFWckdrRXpLN0ZhWUtuK2U5WHlLanN3bkhJU0V0WDhIMlJ3M3Fn?=
 =?utf-8?Q?t+nbiJSVtOoamYVH664vWAYwkJFYD4keMINEqilvS0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EB263C424384C41A41051E7D41D886A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8b59b1-98cd-439a-867e-08d9b5ca6fcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 19:32:11.2415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E0xPu9eZ6AeN0oS+dOlOd4B46nvvSrF2r+0pRNWBRqe7Lmw+zU7qc1Kj3JCOqeFQiMm2Oa8D4hTrIg/HUbUe3dVz0LYmfqiJAIsnEBddDHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3154
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e18::625
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e18::625;
 envelope-from=christophe.leroy@csgroup.eu;
 helo=FRA01-PR2-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCkxlIDAyLzEyLzIwMjEgw6AgMjA6MTksIEPDqWRyaWMgTGUgR29hdGVyIGEgw6ljcml0wqA6
DQo+IE9uIDEyLzIvMjEgMjA6MTcsIFRob21hcyBIdXRoIHdyb3RlOg0KPj4gT24gMDIvMTIvMjAy
MSAyMC4xNCwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+Pj4gVGhlIGRlZmF1bHQgYWRkcmVz
c2VzIHRvIGxvYWQgdGhlIGtlcm5lbCwgZmR0LCBpbml0cmQgb2YgQU1DQyBib2FyZHMNCj4+PiBp
biBVLUJvb3QgdjIwMTUuMTAgYXJlIDoNCj4+Pg0KPj4+IMKgwqDCoMKgImtlcm5lbF9hZGRyX3I9
MTAwMDAwMFwwIg0KPj4+IMKgwqDCoMKgImZkdF9hZGRyX3I9MTgwMDAwMFwwIg0KPj4+IMKgwqDC
oMKgInJhbWRpc2tfYWRkcl9yPTE5MDAwMDBcMCINCj4+Pg0KPj4+IFRoZSB0YWlodSBpcyBvbmUg
b2YgdGhlc2UgYm9hcmRzLCB0aGUgcmVmNDA1ZXAgaXMgbm90IGJ1dCB3ZSBkb24ndA0KPj4+IGhh
dmUgbXVjaCBpbmZvcm1hdGlvbiBvbiBpdCBhbmQgYm90aCBib2FyZHMgaGF2ZSBhIHZlcnkgc2lt
aWxhcg0KPj4+IGFkZHJlc3Mgc3BhY2UgbGF5b3V0LiBDaGFuZ2UgdGhlIGtlcm5lbCBsb2FkIGFk
ZHJlc3MgdG8gbWF0Y2ggVS1Cb290DQo+Pj4gZXhwZWN0YXRpb25zIGFuZCBmaXggbG9hZGluZy4N
Cj4+DQo+PiBZb3UgY291bGQgYWRkaXRpb25hbGx5IG1lbnRpb24gdGhhdCBVLUJvb3QgY29ycnVw
dHMgdGhlIGtlcm5lbCBpZiBpdCANCj4+IGdldHMgbG9hZGVkIHRvIGFkZHJlc3MgMC4NCj4gDQo+
IFRydWUuIFRoZSBmaXJzdCB3b3JkIGlzIG92ZXJ3cml0dGVuIHdpdGggemVyb3MuIEkgbG9va2Vk
IGZvciBpdA0KPiBpbiB0aGUgY29kZSBidXQgY291bGQgbm90IGZpbmQgdGhlIHJlYXNvbi4NCj4g
DQoNCklzbid0IGl0IGJlY2F1c2UgVS1ib290IHVuemlwcyB0aGUga2VybmVsIGF0IGFkZHJlc3Mg
MCA/DQoNCkNocmlzdG9waGU=

