Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4695432E7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:44:51 +0200 (CEST)
Received: from localhost ([::1]:58558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywvS-0005Q0-NG
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyweL-0001Lt-Hb
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:27:09 -0400
Received: from mail-bn8nam12on2128.outbound.protection.outlook.com
 ([40.107.237.128]:57814 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyweH-0001Fh-9j
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 10:27:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lD1JpWRQ9uMEJFJfse/LHwu3rYim+iiRsw41WztixRoj2QgHSyy8VA+7J0xMG8adwQ+/nvEAlkuwtc2vcIA4FKW8DcdsmlneoSLfkjEarndSIjynYsjd1ulo01Fm9t8cX8rVV9/fh2K6IGnE5D/1/qpWgR4TVJYsQFpOBrL1dz+Z2k/DN9gpekLKpAUDs3OM01GBaZZXCWCSo17TpfgCfAd/zJxv4NnhycIXCKffvBxbNkBjGfgL9NRcYkvBj0vTHxLBnD+te3/RXKyDIEZfa3P6Ep+W3Nfoi0sIkO07gKHkcUYyUfgaz4xtkAi5k8Rn4NIoqEMLr6jhzyKDI1Mshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Srw+VWaj5+SWnjRdSpubjlkLfmocv8ptad/PytUYk1Y=;
 b=BI5hPQfKopDFy2NN7rVbSTewWbTZz8lPWRERsPxetQJXkGJ/GTp06hs1LzqzrHhRSjUT9fTvf1lZ6E7rkRmq3vSnrhEvhk+ao4T2S/L4oon5qp62gkQprs9T26nF5q5IvgHDPqRKx4s8H7zUgToyvHUVk8JhRvyaqqMLBTCEbdDa28tSgWLLL8aJlVIQm2uPuJUF2hjtwuN+Rg1lWrV3kdrLoMuBRJASu/c8ugK6f75HnKoEOxBbRNyDrDsf7KUUSkgds1IpkV9Q4pkeQ9GTbtwlU2Af1xdM0pOC4d1Jivhd81JNm8RBP9HmSEoVi3TeHO+4O6UcsG+Pg9uGS1EyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Srw+VWaj5+SWnjRdSpubjlkLfmocv8ptad/PytUYk1Y=;
 b=ThqRkp45efnqQv+kAmZ7UAWMHfd7jbnwDKD10DyVa0hTOK8MwPvrRTSJlIhT1hEASsk64SQv6TDP895cXV6bk8LCtJ2uScYIIEJZJwlZStOXMErpM0Z+OfSNdZgLYgmkuXXr+G02WMyM3qVl1hpM8KCdoNF8P9dOOi9LiGz+uqQSteOE11jgEYIIbXFuima0kuffVVYyB1qcGZ7MAb387jsmDO8rW0Q8ZMq2yVt3E/LgFST8ZzOcSdlNBq13pphAUchCYKvSEA8V/CxGfK3qfc6yIcx4jJX9iVEqZeJ0vtK2ZYs/Cd17XV9/bpsyVcz0SC88cleTfFtPMbgsa6+Qpw==
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com (2603:10d6:102:3d::17)
 by SC1PR80MB0030.lamprd80.prod.outlook.com (2603:10d6:4:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 8 Jun
 2022 14:21:59 +0000
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::fc59:c02f:9409:5a07]) by CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::fc59:c02f:9409:5a07%4]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 14:21:59 +0000
From: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] configure: ignore --make
Thread-Topic: [PATCH] configure: ignore --make
Thread-Index: AQHYemDoeqvj+Mu6QkWunvRCs2N9T61FkWCA
Date: Wed, 8 Jun 2022 14:21:58 +0000
Message-ID: <75ed39ec-ed5c-a9b6-c51e-94e26a333316@eldorado.org.br>
References: <20220607104908.1263321-2-pbonzini@redhat.com>
In-Reply-To: <20220607104908.1263321-2-pbonzini@redhat.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40a76217-3127-42f3-8be1-08da495a3f8d
x-ms-traffictypediagnostic: SC1PR80MB0030:EE_
x-microsoft-antispam-prvs: <SC1PR80MB003088A156CEB00A6FE759A3A1A49@SC1PR80MB0030.lamprd80.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mTKFRnwFKvjrqlh5cT31BZEoNUYcFgqJzZM07kYcMQM5PdXExOuyd4+RQ7knUVnz0S8+85+IDiJJR3I5ZOIvfmDP2n/pH7eo0LjRBB/VDDbKGGBUnvxoXAniPfhy+r0+bqPKxAe6nZbDshtqvz4D/TK1pTPHzwI2AqO1/r9WwyM6x/uaZCVO1N/2C6jAtCaJq4wUdNeE//S7B6bcsphtE2wiALxdP5hN5pqN9Zyhh7U1hx8vlpAAxIJ9i5RTQcSndWz0di17ZnhbMWqmybd0mL5XOZKVTc2FCBnst5tCnhpoYnj1mNgkuaTOsDXJa+DjWYBLRJqKJg4ljfxha7VDULt2w3AHb2zi4FwrCBoMqWTkuHJoIhE4B/o15Zu12c6JPbT0pcJZ1MAcTX1m57NwxiRm910LMlp/WKluxfgQ56NzUJAnhwGo0elGOtQk/WPMm62yNNgY7OSl5JzfELmCe9zX05q86LLd0y3jpOkgiXMPtkEa9NGJDnV6jADzUrddGO5RGEqOGLz8RCnwr98PyLVdiYqFtEsFRIVoYJqQRaCmLdMHkc6CMvgtMaPa37mY/C89FSfQb1gUMDSwa/EfK7qfmzmNiQEl1WMOYk9H+C3jrJPyt1HtpkyzxrAqMV+5tIN8bRJ4jyg2dEVbYbhUDvAhfK/CLwTGWFhKyKEowwtG6V5z/Qir580w2khpHFlBGMwQ0vKvTvUe1AY0Z0vYyPUFF7N8naOStwqAQh+lYeuAhofLFeDmF6F9z1euLiZLS6QcsGioG6ZCyzqkTpRU7EgiAd8W+bqtaLpTK2uVBdLGfsEF/u2YEuB1/cdJ+SkC7jrtVvdRucFoeVjbUBndQqAhy0JKvpCMPBvpAZvmqKfavV810I+SRgekxgTztKJWGZsLH9kj1OBDPmQLt9Q6MQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3969.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(66446008)(38070700005)(2616005)(2906002)(36756003)(76116006)(5660300002)(53546011)(6486002)(122000001)(26005)(66476007)(66556008)(8676002)(83380400001)(6506007)(110136005)(71200400001)(316002)(38100700002)(6512007)(66946007)(186003)(86362001)(508600001)(31686004)(8936002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czMwbGEvdHRORVBwUmdhT2hEdk5SSzhYTFhYdUkwb0RCakUwcCtwdnNIajky?=
 =?utf-8?B?R3JaNGlDejh1aGU0dm9sMnU1NVZxdEl2a1pScWFWOE1BWUNoMHdmMXZ4d1Nq?=
 =?utf-8?B?bWpkRDJnSUFHVk9US09VRWY3WlFjYkZIdDRmN09iaktZbUIzVGdPbjU3dkds?=
 =?utf-8?B?UHF3QXpRbjZxWUZ4ZTZDVnB2VGYzWFliem5ReDlCUUZYb1Y0WmFiOXJzZlJD?=
 =?utf-8?B?ZXVsVjNFeHJQU3lsM2dNSVdzUThvbExteWVXRjhEdXV4bU50YjNyeE1CQXVv?=
 =?utf-8?B?SVNPVE5LSlpmMDVNV0V5SnU4dXFDNjJkZk1KQ1dCOE4vY283SThaR3J5TlY4?=
 =?utf-8?B?V3RGbTFvcjNQcDduZVQ0MEVmemx5MXYrcm43L2R4UjBCWEJIWnNLaUI3Z0pa?=
 =?utf-8?B?OHhNOE85MUpNSTVVZWpTZzROejNNR0FSTm1yaWdCa1ZGR2N0SFNmWjJWZ2pa?=
 =?utf-8?B?QjFBekg2S1lCWGdlRTlYREdlMXlwOE96SGVIcE51WEE3V0tWTmRuNHptSkdq?=
 =?utf-8?B?WVhWUjV1VVNWZWplMmZkZU81UytVN2NKT3JoeW9zZDZpNVJGMWFNb0pDQko5?=
 =?utf-8?B?K2QvcDhlcnAvR2o4c3JWT3NHNi9oRHBxVG83TEM0RXY2UmtneHN3Qjl6ZU53?=
 =?utf-8?B?TG1SMENjRnJKMENtakxzVTcwWXFKRjVBNlhHU1RmSUNZUXJQc0wxTkZqNnJx?=
 =?utf-8?B?cUVHSmxiMVdlRytZbzdlWi9Va0VrTWpjOVE0bUdXQ3JwYjZYYlpuN0Q0V29s?=
 =?utf-8?B?eE1qYkhNYnU0ekN6ckxZcjVuUEZFZHRzcWpIQkJPbmVnU3Z4cG82MGVwWGFU?=
 =?utf-8?B?RVdCUDRSOEcvSmdSMzU1cVlwYU1EcjBkYnNrbkZBaHFCUnVFTlRuYWRnNlRr?=
 =?utf-8?B?N0FLSFE3SEdjeEhrMUxDU2tTa1hpalp6VHFUYUY2TlZnY1pRSzlYa2ZwcUF4?=
 =?utf-8?B?RkdoT0k3L09ZQUNSeXR0aGhJL1FjK3IwQkRxT1Q3czdBbFZFWWR6TGNhVmVN?=
 =?utf-8?B?dDZ5cURpWUdwZ2EwNXdBemVlcHJPTzByTmJERUxJeC9jTGtQcGRUSlllai9C?=
 =?utf-8?B?RzNueXN3V3dtWXBuY3NYL0JIUkFLOS9qTDdxVjNHRWR1ZGM4NWRlbHl2dmk0?=
 =?utf-8?B?TU1PQnE4ZTUzMjFSYXdwZFRjLzNkZzAvM2NRdkcrcFJGYjU2Y3dVUXdOWkR5?=
 =?utf-8?B?SjdlZjBnb2U4d1JZN3h1OW1JeVhRdnB6YkhnbDlBalZMdk55TmVETXQxQ1Rv?=
 =?utf-8?B?VlorblMyaFlGVXJHOVlzZUZOK1hKdHZlSVdVVHI5VFNuR2hBcitUdm9zWWRI?=
 =?utf-8?B?TGI4Qk01STIzNlQrd2M5eTVzYU9sV0JnN3JRM3hOT0JKT2FzVStiVlJIUE5J?=
 =?utf-8?B?Ykp6dVovK1daSTRMakRMSlFMNkxPK1VhTnMxUjQ4WXhLeVdkVWFpbHhoemlL?=
 =?utf-8?B?ampRNlRuRktaakxZb0tSQitmaVkxaGlTbmFqVUpNVVR5VjI5MmhyTFRMOGZP?=
 =?utf-8?B?OTg3Qy9XMjIxekh5RGp6RnpCSjcxd28rdVJFVlo2T2RJNnZpcmx6SkkzUksv?=
 =?utf-8?B?ZVMzaExRbE5JVjVIM21wUWpWYjR6aGhVU0dNOVZ3YVlnRE4vd2R0ZkhTcjlC?=
 =?utf-8?B?em1FT3h1VkhveDVZTmVWZ1lCdFFzOUFJNHUwSnloMXN4NEJxdTBaWlUxR3Uv?=
 =?utf-8?B?VWlNN3NJcmFhekVNWGpYSXRVVmlZYW80ODRJOFFETVYycDJ1UVQrOVRUOFBE?=
 =?utf-8?B?NUNWanRkcllaZno0Rjh2WThnSUR6OVZXd0FrNkdtVFBQdnRCYmZTMlJvUkFU?=
 =?utf-8?B?S3l1Q0k4eTlMTmtMTkxsMTdMcjEyaUovV3Z4QlE5V3hDRVpmL09rQzJaRkRN?=
 =?utf-8?B?dWN6a2RGSFB6cEEySFk0N3BydUVNY0syYWhYV2ZWRVRnT2FPd2JTK25GajNN?=
 =?utf-8?B?VFl3MzBmTjZaOFVIb1ZRWU0wczhpUEUzd3JISGJiRW41RSs2YjczMUEwbHdL?=
 =?utf-8?B?aWpZbm1qN2dUNWRFU2NOMjFVNnJqbkV6ZlgvSmY1R1hBTG5kcnd5enI0S0ll?=
 =?utf-8?B?V2V4ZE4zNkUyOUU4T0JOL1ZRN09nYk1qVnkzUmgxeDFhbktreU5FN2Zyc3F4?=
 =?utf-8?B?VTBoVzFTUzhlY29UZUdmK0MvdGtFa3RaeWRZZ0lMa1VpTjBMTGFreWVvbUYw?=
 =?utf-8?B?MHJtQ1VjRGFIVXZCMnM3TWRFVVk1U1pYbFdMdEdld2E3TUIrTU1ZM0dqdHZw?=
 =?utf-8?B?L2tQZlZBVmI1dEk3UE5zTlM1cURaMzdzZ1RuWGxheTBnZmpYdy84UmxMVFhD?=
 =?utf-8?B?eldoMEhCdjI5aW1zUDVWdkYxN1VFaGMwMmNIMllBaVEyeW03Q2hUMDg5U3ZK?=
 =?utf-8?Q?p2pSm5qql9IWnhc0k0qC2E0vi9mi38urRjMGX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <854EB3080BF6CC47A179BDD3AB2371EE@lamprd80.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3969.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a76217-3127-42f3-8be1-08da495a3f8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 14:21:58.8159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0RRyp85TVH4g/XHAM/DFZlLDpWQZDprFlyLFPebt+VTTPpcMwCxoab/5jh44DzWHO2xRmIHs+hiiq68Vu4civUgd4yfCa/h16Z6YW06Q8SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SC1PR80MB0030
Received-SPF: pass client-ip=40.107.237.128;
 envelope-from=matheus.ferst@eldorado.org.br;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMDcvMDYvMjAyMiAwNzo0OSwgUGFvbG8gQm9uemluaSB3cm90ZToNCj4gU2V0dGluZyB0aGUg
TUFLRSB2YXJpYWJsZSB0byBhIEdOVSBNYWtlIGV4ZWN1dGFibGUgZG9lcyBub3QgcmVhbGx5IGhh
dmUNCj4gYW55IGVmZmVjdDogaWYgYSBub24tR05VIE1ha2UgaXMgdXNlZCwgdGhlIFFFTVUgTWFr
ZWZpbGUgd2lsbCBmYWlsIHRvDQo+IHBhcnNlLiAgSnVzdCByZW1vdmUgZXZlcnl0aGluZyByZWxh
dGVkIHRvIC0tbWFrZSBhbmQgJG1ha2UgYXMgZGVhZCBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gLS0tDQoNCkhpIFBhb2xv
LA0KDQpPbiBhIGNsZWFuIGJ1aWxkIG9uIEZyZWVCU0Qgd2l0aCB0aGlzIHBhdGNoLCBJIGdvdDoN
Cg0KLi4vbWVzb24uYnVpbGQ6MzY0MTowOiBFUlJPUjogS2V5IE1BS0UgaXMgbm90IGluIGRpY3QN
Cg0KU28gaXQgc2VlbXMgdGhhdCB3ZSBuZWVkIHRvIHJlbW92ZSB0aGUgdXNlIG9mIE1BS0UgaW4g
bWVzb24uYnVpbGQgdG9vLg0KDQo+ICAgY29uZmlndXJlIHwgMTYgKy0tLS0tLS0tLS0tLS0tLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmlndXJlDQo+IGluZGV4IGNlODE0MTk2Mjku
LjE1NGUwNDFiOGUgMTAwNzU1DQo+IC0tLSBhL2NvbmZpZ3VyZQ0KPiArKysgYi9jb25maWd1cmUN
Cj4gQEAgLTQ5MywyMCArNDkzLDE2IEBAIGdudS9rZnJlZWJzZCkNCj4gICA7Ow0KPiAgIGZyZWVi
c2QpDQo+ICAgICBic2Q9InllcyINCj4gLSAgbWFrZT0iJHtNQUtFLWdtYWtlfSINCj4gICAgICMg
bmVlZGVkIGZvciBraW5mb19nZXR2bW1hcCgzKSBpbiBsaWJ1dGlsLmgNCj4gICA7Ow0KPiAgIGRy
YWdvbmZseSkNCj4gICAgIGJzZD0ieWVzIg0KPiAtICBtYWtlPSIke01BS0UtZ21ha2V9Ig0KPiAg
IDs7DQo+ICAgbmV0YnNkKQ0KPiAgICAgYnNkPSJ5ZXMiDQo+IC0gIG1ha2U9IiR7TUFLRS1nbWFr
ZX0iDQo+ICAgOzsNCj4gICBvcGVuYnNkKQ0KPiAgICAgYnNkPSJ5ZXMiDQo+IC0gIG1ha2U9IiR7
TUFLRS1nbWFrZX0iDQo+ICAgOzsNCj4gICBkYXJ3aW4pDQo+ICAgICBic2Q9InllcyINCj4gQEAg
LTUxNyw3ICs1MTMsNiBAQCBkYXJ3aW4pDQo+ICAgOzsNCj4gICBzdW5vcykNCj4gICAgIHNvbGFy
aXM9InllcyINCj4gLSAgbWFrZT0iJHtNQUtFLWdtYWtlfSINCj4gICAjIG5lZWRlZCBmb3IgQ01T
R18gbWFjcm9zIGluIHN5cy9zb2NrZXQuaA0KPiAgICAgUUVNVV9DRkxBR1M9Ii1EX1hPUEVOX1NP
VVJDRT02MDAgJFFFTVVfQ0ZMQUdTIg0KPiAgICMgbmVlZGVkIGZvciBUSU9DV0lOKiBkZWZpbmVz
IGluIHRlcm1pb3MuaA0KPiBAQCAtNjI4LDggKzYyMyw2IEBAIGNhc2UgIiRjcHUiIGluDQo+ICAg
ICAgIENQVV9DRkxBR1M9Ii1tNjQgLW1jcHU9dWx0cmFzcGFyYyIgOzsNCj4gICBlc2FjDQo+IA0K
PiAtOiAke21ha2U9JHtNQUtFLW1ha2V9fQ0KPiAtDQo+ICAgIyBXZSBwcmVmZXIgcHl0aG9uIDMu
eC4gQSBiYXJlICdweXRob24nIGlzIHRyYWRpdGlvbmFsbHkNCj4gICAjIHB5dGhvbiAyLngsIGJ1
dCBzb21lIGRpc3Ryb3MgaGF2ZSBpdCBhcyBweXRob24gMy54LCBzbw0KPiAgICMgd2UgY2hlY2sg
dGhhdCB0b28NCj4gQEAgLTcwOSw3ICs3MDIsNyBAQCBmb3Igb3B0IGRvDQo+ICAgICA7Ow0KPiAg
ICAgLS1vYmpjYz0qKSBvYmpjYz0iJG9wdGFyZyINCj4gICAgIDs7DQo+IC0gIC0tbWFrZT0qKSBt
YWtlPSIkb3B0YXJnIg0KPiArICAtLW1ha2U9KikNCj4gICAgIDs7DQo+ICAgICAtLWluc3RhbGw9
KikNCj4gICAgIDs7DQo+IEBAIC0xMDI0LDcgKzEwMTcsNiBAQCBBZHZhbmNlZCBvcHRpb25zIChl
eHBlcnRzIG9ubHkpOg0KPiAgICAgLS1jcm9zcy1jYy1BUkNIPUNDICAgICAgIHVzZSBjb21waWxl
ciB3aGVuIGJ1aWxkaW5nIEFSQ0ggZ3Vlc3QgdGVzdCBjYXNlcw0KPiAgICAgLS1jcm9zcy1jYy1j
ZmxhZ3MtQVJDSD0gIHVzZSBjb21waWxlciBmbGFncyB3aGVuIGJ1aWxkaW5nIEFSQ0ggZ3Vlc3Qg
dGVzdHMNCj4gICAgIC0tY3Jvc3MtcHJlZml4LUFSQ0g9UFJFRklYIGNyb3NzIGNvbXBpbGVyIHBy
ZWZpeCB3aGVuIGJ1aWxkaW5nIEFSQ0ggZ3Vlc3QgdGVzdCBjYXNlcw0KPiAtICAtLW1ha2U9TUFL
RSAgICAgICAgICAgICAgdXNlIHNwZWNpZmllZCBtYWtlIFskbWFrZV0NCj4gICAgIC0tcHl0aG9u
PVBZVEhPTiAgICAgICAgICB1c2Ugc3BlY2lmaWVkIHB5dGhvbiBbJHB5dGhvbl0NCj4gICAgIC0t
bWVzb249TUVTT04gICAgICAgICAgICB1c2Ugc3BlY2lmaWVkIG1lc29uIFskbWVzb25dDQo+ICAg
ICAtLW5pbmphPU5JTkpBICAgICAgICAgICAgdXNlIHNwZWNpZmllZCBuaW5qYSBbJG5pbmphXQ0K
PiBAQCAtMTA3OSwxMCArMTA3MSw2IEBAIGlmIHRlc3QgLXogIiRweXRob24iDQo+ICAgdGhlbg0K
PiAgICAgICBlcnJvcl9leGl0ICJQeXRob24gbm90IGZvdW5kLiBVc2UgLS1weXRob249L3BhdGgv
dG8vcHl0aG9uIg0KPiAgIGZpDQo+IC1pZiAhIGhhcyAiJG1ha2UiDQo+IC10aGVuDQo+IC0gICAg
ZXJyb3JfZXhpdCAiR05VIG1ha2UgKCRtYWtlKSBub3QgZm91bmQiDQo+IC1maQ0KDQpBbHNvLCB3
ZSB3aWxsIG5vdCBoYXZlIHRoaXMgZXJyb3IgYXQgY29uZmlndXJlLXRpbWUgYW55bW9yZSwgYnV0
IEkgDQpzdXBwb3NlIHRoYXQgKkJTRCB1c2VycyB3aWxsIGlkZW50aWZ5IHRoZSBwcm9ibGVtIGlm
IHRoZXkgdHJ5IHRvIGJ1aWxkIA0Kd2l0aCBub24tZ251IG1ha2UuDQoNCj4gDQo+ICAgIyBOb3Rl
IHRoYXQgaWYgdGhlIFB5dGhvbiBjb25kaXRpb25hbCBoZXJlIGV2YWx1YXRlcyBUcnVlIHdlIHdp
bGwgZXhpdA0KPiAgICMgd2l0aCBzdGF0dXMgMSB3aGljaCBpcyBhIHNoZWxsICdmYWxzZScgdmFs
dWUuDQo+IEBAIC0yNDA5LDcgKzIzOTcsNiBAQCBpZiB0ZXN0ICIkY29udGFpbmVyIiAhPSBubzsg
dGhlbg0KPiAgICAgICBlY2hvICJFTkdJTkU9JGNvbnRhaW5lciIgPj4gJGNvbmZpZ19ob3N0X21h
aw0KPiAgIGZpDQo+ICAgZWNobyAiUk9NUz0kcm9tcyIgPj4gJGNvbmZpZ19ob3N0X21haw0KPiAt
ZWNobyAiTUFLRT0kbWFrZSIgPj4gJGNvbmZpZ19ob3N0X21haw0KPiAgIGVjaG8gIlBZVEhPTj0k
cHl0aG9uIiA+PiAkY29uZmlnX2hvc3RfbWFrDQo+ICAgZWNobyAiR0VOSVNPSU1BR0U9JGdlbmlz
b2ltYWdlIiA+PiAkY29uZmlnX2hvc3RfbWFrDQo+ICAgZWNobyAiTUVTT049JG1lc29uIiA+PiAk
Y29uZmlnX2hvc3RfbWFrDQo+IEBAIC0yNzQwLDcgKzI3MjcsNiBAQCBwcmVzZXJ2ZV9lbnYgQ1hY
RkxBR1MNCj4gICBwcmVzZXJ2ZV9lbnYgTEQNCj4gICBwcmVzZXJ2ZV9lbnYgTERGTEFHUw0KPiAg
IHByZXNlcnZlX2VudiBMRF9MSUJSQVJZX1BBVEgNCj4gLXByZXNlcnZlX2VudiBNQUtFDQo+ICAg
cHJlc2VydmVfZW52IE5NDQo+ICAgcHJlc2VydmVfZW52IE9CSkNGTEFHUw0KPiAgIHByZXNlcnZl
X2VudiBPQkpDT1BZDQo+IC0tDQo+IDIuMzYuMQ0KPiANCj4gDQoNCi0tIA0KTWF0aGV1cyBLLiBG
ZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETyA8aHR0cDovL3d3dy5lbGRvcmFk
by5vcmcuYnIvPg0KQW5hbGlzdGEgZGUgU29mdHdhcmUNCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1l
ciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4=

