Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1423947DB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 22:18:37 +0200 (CEST)
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmiwG-0006pa-7D
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 16:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lmisu-0004gA-09
 for qemu-devel@nongnu.org; Fri, 28 May 2021 16:15:08 -0400
Received: from mail-eopbgr800109.outbound.protection.outlook.com
 ([40.107.80.109]:50080 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lmisr-0000Ba-Qe
 for qemu-devel@nongnu.org; Fri, 28 May 2021 16:15:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxkxgk7iuAont6SPKTX3GjN6fscI6c8KyIH5M3UQUZPMJaFngIegtpi4uXfwqgzhmN3mycaBM7+KqkRWoIfNSq6SlbcDbMFAazhBqg8RY2DGIM/Q6OHLSfqbELXsivc7u0/hfHZPzN/iEekBvsBBIxCg0LMyi3AoAUqSgj7kIkU2sT+wAGoJlJWBihRl1oW1yIm3DwgyXgTyxvLYaguXTgzU9PGDcs+Fnt2HztvNFiH79/5hfJ4EwT2Hr/S+I2Vil7kE6sfAt2pW9Wiz1caX3pFSDJKxA6GXvWVH91aqZyIAhp0VibuLe8u1R72q3ZIXUhqgCu4z1bv4XSlmBWjo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYHxa7YN4TUzcYGqaGzgusfscJH0rHVuO+G0H5myDnQ=;
 b=hKtebk0mzox0hdEzUUCREaTdo6Ls22PhPMXYadWK5unM2X+xSkonE6ov0Pn1bIT0HwPB7QzuHY3eDNWDqAF5ugPADIQsudr2ONzQ9xw52vCZbr3IUBfQL6Vj2H8M/dmFDq28iPtIBiEABNkFa5DBGG8vfsjMBm6Ul2qYA1i2eQHJvoLGg1YwJ1fthQI+RqXIMtfINkrbzMHThud9aum6lgXpRX0l8RFxUg5mwWmVjlUxDYH5Z56lPvVdWk2T7RbyKDj2Zs+TWi+I5UHmxIQqSJkrwLhMx6a+aD0bCdmKjynJ/mXp1hLffH4O4UNC1bpHxLWSc6wX77NViO/qJXO6oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYHxa7YN4TUzcYGqaGzgusfscJH0rHVuO+G0H5myDnQ=;
 b=YUziL4Mj75fJBNt5kMx95GThFSopwWIDjVUQiTRcMNCJ4FDXviM4hhbYQycYEQL5uL33gYyS7dUnJvJP3v//BDKSvAGs33OOvd6IziU2lrwyXFq/q2RazgpbJQ3DTzXgtxYjlFM1eWZC3JoIa5zmlr02WxojuDAVIfa8RZxGt5l8Y/zQvZd9lc+mjx5F8N5udrGqYpP8L9cvetr+cGeCVhJuNxTvYXQTUmIZYugnp8DNJOwI2xJ4UDHfCBZaaNkert0il5vQEDNgRyQ2BeYYrO3oHdMr2uwqUZnQHgeRyp6irX40OoQoaPByTCa1pZGo6Lums/4+dgQ8uUxZ7NfAQQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4244.lamprd80.prod.outlook.com (2603:10d6:102:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 28 May
 2021 20:15:01 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 20:15:00 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] docs/devel: Explain in more detail the TB chaining
 mechanisms
Thread-Topic: [PATCH] docs/devel: Explain in more detail the TB chaining
 mechanisms
Thread-Index: AQHXU71pliPtsMUHHUKbRXdKFpLOAqr5AQ4AgABTFdA=
Date: Fri, 28 May 2021 20:15:00 +0000
Message-ID: <CP2PR80MB3668626182F8BA3A3E170667DA229@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210528123029.143847-1-luis.pires@eldorado.org.br>
 <5690d0be-1e3b-a9f7-060a-8d08d9cd6c35@linaro.org>
In-Reply-To: <5690d0be-1e3b-a9f7-060a-8d08d9cd6c35@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.9.76.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 284997b2-fc1e-4c25-f052-08d9221545bd
x-ms-traffictypediagnostic: CP2PR80MB4244:
x-microsoft-antispam-prvs: <CP2PR80MB42448A2355959FA1093EA811DA229@CP2PR80MB4244.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V0f1zsJ+F9Il4MMjatovxp/1Hopc1c6MT51+NfHAudxl2IGTISlH9uirzCg9C00RoPIWwPHWSiYst3xW98+QEfXnyt+OlvCjLvoslBidpLuQAlVaNTUu3KLP4FzDeXdbhu1j5sDlLDy1Rp34N2dB1wyf00kS4CqZot91TyIk/JqvLnQ/4UVLSuASTTaZUR0o1NfcT1b9oQd7vLcANGw2Lo8CXGavo8GwQNkIYnGq2hRvpE24LRU3r5ktVTQwE8WDQdz5OYvbWLwDyv3hNiBQfLclN4uI/MgXbGBw/zgl9gYoN1VPn40X9DHwn5kVZjwkPpvRG0jIqNqltqT8SWoVeb0hxQLP+IrAxEwV+LopBzNr57uByr3QVurjvJ6y1n9Wo2aRhrPst8Djp+o/y8ynnyyvknJeRViNunoE5qAgZSINNmjtzSR7Sa1GLQ97tnuHuWTDZg98osoWtH6X0wstETUbEEn7r8Dt/1K9U+m26akW5uxgHpUFNBavRVeXFr8fkea1tpa/S7BKkkBP+D1D4BNazJ+s7eOFw9cSl4xK0NRZGatgRTDq9cy4MxAvDH6XDJXuCFqzuBOA+rxI1t0KFjkYpqLqBIhyRzCh6mU1Q5l2o1a/SPAGbq+TQ5fUeHSSHLXx2sVaJennGoKK8U3H9gAchmenpvQsRhoWHvO3HeufrL47Xd1QxtKzwyppwiCHn+VCU7T99I5M/u8AUKz8o7y9PLkqLcpxxq3om0lailU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(346002)(376002)(39850400004)(71200400001)(33656002)(66946007)(66476007)(66556008)(8676002)(122000001)(2906002)(76116006)(52536014)(8936002)(478600001)(66446008)(55016002)(64756008)(26005)(38100700002)(4326008)(9686003)(86362001)(83380400001)(186003)(7696005)(110136005)(4744005)(316002)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?azlkaWRUY1RCQ3pJNEVEU2dZV2FTQ3pwcFdRK1htS283N2NvVnFkL0RXbDlk?=
 =?utf-8?B?dDJuRTJEdHdqcVdkeTdIMEJmVERMWDVIVGVpNnZiSFZHenY0aWIvc0pBa1lr?=
 =?utf-8?B?UmgwUm9uUnJvVytwZ0w5RzJETEdpTlZsdk95K3grbmZXMVNZdTZYVHRDbXRB?=
 =?utf-8?B?MTIxY0RGeWdid2s2ei9BNWNXbEpNalp5UkRTWUZpZUxHbnBvWDdDNGlSeWI5?=
 =?utf-8?B?ZWNlZm1UMVZuTTNUdjFCRWp1eTlKWUdTZWhvcmdyMU82cUh5NXpaK3VPdE1i?=
 =?utf-8?B?RVBrOTBKRC94MW9GN3l6Y25GS09ibDZPRVZMZG0zK2ExS0doUG4yVmpaaGpL?=
 =?utf-8?B?cldDUmJzWWRUdVVTOWpBK3F3SGd4WnZ0cHNqVytOdHo0enMyTzNCVnZHd1M4?=
 =?utf-8?B?bGg4M3BtRmVjYmF4OW91M2Yxb083NXdqMU83Ly9OYVplN3FEM3dERFVrZ1lj?=
 =?utf-8?B?QS9pdmR6N2FhUEJHY0RpZmpoMWVya25KTFVheWpzU2tBS2JzRmphV1lub054?=
 =?utf-8?B?cXMySGdXTWhKbHBQa3VNUS9wUzhRUTdIaFdVNWI5SjJNVGJ6VEw4NHQrVW1i?=
 =?utf-8?B?V0lSZ2tzRFVoYkY5a1FQL0lwM2R0WHhHb29uM0FQMitHUm8vaTZXc1JEa1FQ?=
 =?utf-8?B?SndaYTQyWFBhQlVlSTVPSlU4SHBxYXkrTGV6VjdOOFdyTjRUeTVjWUpMVkFu?=
 =?utf-8?B?aHVuVWNYZXkrQzZqYTJUaWVnS2g3b0lZWndCSldJbzNOY2RkZ3I4YmhLbXZX?=
 =?utf-8?B?NDY1TW5xQjNKdlVzR1RKU1o3bmVNcTIwTmFIRy96MkdCdHAwNkZLdEQ1S0Ri?=
 =?utf-8?B?cmNSdytnNWV2VUszTEhjNjhGUHZUeXJ5S1kzRm0yRGdrVEpNSnV2cWVkd2FV?=
 =?utf-8?B?MjFYYkVHSXp6ZlBZaVVvUkV4M3M3OUNDYlhFQkJjZFc3RmJmM3lBWU9NQWNY?=
 =?utf-8?B?L0ZqVXlEMTNIeC9jMkM5d0RTblN5Zm9UTEg1Ri9aR05wekxpLzUwV3owWGUx?=
 =?utf-8?B?NjJMaVRmVFFzeEdJTzdkK1BiZnB3a0dLbllHMk9PZk9pM3BMOGxCQUdyem5Z?=
 =?utf-8?B?MzVBTTFibjZOYldRSjRjRkdQeFY5bWhnUFhFbXNqbWJ6Y3B5YW1rVUsvajZv?=
 =?utf-8?B?SnJTT2djRXJuM2VPTVQ4YklRT0RTSzVCckd2dlo4K3g0WmMxZjYwUU9pRVlC?=
 =?utf-8?B?cW5rS3RNL1VTNVBLOEVWVEpnbW9vdDE3VE5hUXgwYWtpbmt1dXFYdzR6cU44?=
 =?utf-8?B?Vis0cFBDVXU0QzhXWXVrTmZSM0hYWWhMa3JRQk9obE9CV3J3Nk1VZ2YrbGdo?=
 =?utf-8?B?aXZtNHppbUN2YzIyOUtsY3haSzN5OVVEU0dXUXcxRUdmQjYvYXhWK3hTRDcv?=
 =?utf-8?B?MEVRYW9zdzROdzU0dVE5UGNCTDM4ejVrZTQwZXZsUFNrSEI1WUVqMDRvY0dr?=
 =?utf-8?B?d2ZFMHJ0L0ZMSFo2ZkVnbzNkVkVZYmUvOEVQcDdQYmJwamxYMzByWGhFUnZa?=
 =?utf-8?B?YTRROEZBM1B1eUJjbXY0akNOYWwwK0Zhb0xwaGVPVnU0ZWFUd3VsbzFNc2NH?=
 =?utf-8?B?ZGlZcHB5eFhaZVBqR0swNlBRbkhFOENncXY4UjRMbkNmQmhWbUpmVEVrK0F5?=
 =?utf-8?B?MUN6WlBlM0MrMzdTd1V5d3VBcmVScVhWbWYyeVhFSG5MbW1ySmJYMzJJZlhL?=
 =?utf-8?B?bmV6NmFUcW0zK3JTWllGeFBmUXMyVjFwdDc0VzdtQTk5d3JQWTg3MUROUldJ?=
 =?utf-8?Q?PbhX2cru36niELlvFc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 284997b2-fc1e-4c25-f052-08d9221545bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 20:15:00.8139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R0Me+WD7zP1ykq8A2/E02mE8O6nOpX+NX1vb8Y8/LRMtCcedfRKeuM0A8k5zsBxTljgcrRKHyCFwi0CsPqUDnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4244
Received-SPF: pass client-ip=40.107.80.109;
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IE1vcmUgY29tcGxldGVseSwgdXBkYXRlIHRoZSBDUFUgc3RhdGUgd2l0aCBhbnkgaW5mb3JtYXRp
b24gdGhhdCBoYXMgYmVlbg0KPiBhc3N1bWVkIGNvbnN0YW50LiAgRm9yIG1vc3QgZ3Vlc3RzLCB0
aGlzIGlzIGp1c3QgdGhlIFBDLiAgQnV0IGUuZy4gZm9yIGhwcGENCj4gdGhpcyBpcyBib3RoIGlh
b3EuZiAoY2lwKSBhbmQgaWFvcS5iIChuaXApLg0KPiANCj4gSXQgaXMgdmVyeSBtdWNoIHVwIHRv
IHRoZSBndWVzdCB0byBkZXRlcm1pbmUgdGhlIHNldCBvZiBkYXRhIHRoYXQgaXMgcHJlc2VudCBp
bg0KPiBjcHVfZ2V0X3RiX2NwdV9zdGF0ZSwgYW5kIHdoYXQgY2FuIGJlIGFzc3VtZWQgYWNyb3Nz
IHRoZSBicmVhay4NCg0KSeKAmW0gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoYXQg4oCcYXNzdW1l
ZCBjb25zdGFudOKAnSBtZWFucyBpbiB0aGlzIGNvbnRleHQuIFdvdWxkDQppdCBiZSBmYWlyIHRv
IHNheSB0aGF0IHN0ZXAgMiBzaG91bGQgdXBkYXRlIGFueSBDUFUgc3RhdGUgaW5mb3JtYXRpb24g
dGhhdCBpcw0KcmVxdWlyZWQgYnkgdGhlIG1haW4gbG9vcCB0byBjb3JyZWN0bHkgbG9jYXRlIGFu
ZCBleGVjdXRlIHRoZSBuZXh0IFRCLCBidXQgbm90DQphbnl0aGluZyB0aGF0IHdvdWxkIGJlIG5l
ZWRlZCBpZiB3ZSB3ZXJlIHRvIGp1bXAgZGlyZWN0bHkgZnJvbSBzdGVwIDEgdG8gdGhlIGZpcnN0
DQppbnN0cnVjdGlvbiBpbiB0aGUgbmV4dCBUQiB3aXRob3V0IGdvaW5nIHRocm91Z2ggdGhlIG1h
aW4gbG9vcD8NCg0KVGhhbmtzLA0KDQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1
aXNhcyBFTERPUkFETyANCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxk
b3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

