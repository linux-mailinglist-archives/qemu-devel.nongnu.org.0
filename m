Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6C02F87EC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:51:45 +0100 (CET)
Received: from localhost ([::1]:40012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0X0Q-0006OJ-Io
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0Wxf-0005s8-Nt
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:48:51 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:49742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1l0Wxc-0002OK-Dp
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:48:50 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 923174045D;
 Fri, 15 Jan 2021 21:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610747326; bh=DBks7NHGiL7arzIHfkLrL6W8hsAQH/hWBVmZiKqaGyI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=hyZRBF6SafX5839S7N5bVqlK4RMkB1WBP7c+Jv5q6v3iLplDeNXpL0xmtijrUEoK+
 8XfM1rfUxOLom6ISbBwRrHnlAFO3e+9EnHGYEps+ppXt1NURPqp1jLLUVB9injPnPF
 F8fJjyM9hZjNiFJj8wOVnZIsZXa7hvgnfBPfWmhyJ5lIQ18l+vJVgNBilB2z95OvZg
 5wTwzDP/P4WyVG5JwGN2b7vbm7njS3WzBjgxYpYQssl24IGCHWwfcloMcjcYjdH44F
 zFrfuzaUQMOTnbeIUU7kyidWrHa2tozgZ/qixt0uEVIi9SY+G0hrOrTQ9o86icHr+Z
 141yKdKwWBLdw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8080CA006A;
 Fri, 15 Jan 2021 21:48:41 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 45BE9800C8;
 Fri, 15 Jan 2021 21:48:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="nRH1Im39";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHpPHoHGurigtEbbm8Q0uRJZzGNe12X4bJ6YFZOAWQ6anX6qOGUiNj7EXXUZF6hLmhh4ganSuhPZh0kehvoGgSNUcSk2mT3Oyuc/M6o7Q/jdbDKDTF8FhyojQ2PPdWfX0ekQ668VecvXBLmDCXR1YpOeMCANQS+ZeCAbaxoE8N91Upui2VKWKBcBil4pKPTWMay9XsJdAv5AcYKWS2h16GuSO9ppgqHDB3fuFB4GCoedpQPWvdFX8yRvuUuZRdIp7W+BXlRTXV6JbK6PBZdsJ8Oczzg9g8WTe6k2CXPlCFLrwu0zMUskphxCb6q2AE6iTjWv2+5R6CxlaWpSGR/bQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBks7NHGiL7arzIHfkLrL6W8hsAQH/hWBVmZiKqaGyI=;
 b=VwjvPLlItd2oue3KHwzH0s0eB3IzidGnl9TJgMQ8WpoFKRGP8YEaazBChAELQqK0HLkWKSHjjtW1cvHA8YG8NxeI9xCAPs+shYazuzUKP1/vhcZTXE8lCyt+PqQKWmwzGU8A/ydSiCOKacPUXtBQvYoMSD0hUMqiDrmDuerzhDsbhNgAlHi3iZTMO6vjSFg7Llypi8upzJiyyU8Xeee3e9CK6NO/SlMfIFuYyGW87y/q01llUjPN39WBfTpIkMelXJlSseysT18Qy4oSTrqzPcKrdRlK/X71maFFsq+rhgx6xij5+atSchnESYrd3Pu4e/JVchXWmwjMZqsRQFxZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBks7NHGiL7arzIHfkLrL6W8hsAQH/hWBVmZiKqaGyI=;
 b=nRH1Im39RE5L3FNl2fHIv8oz46qEkua7Rdo+Az1UDrVHQ6BBagAw0Au/GWuLCQVdrBYUvNtjr7fppEuRwT3hwLJ2EMwsuWwDrKu9/r+QKrx37S7OM89pfy6U8tDG7uxNMvh/qdvECkJYXOXXBvau78KPLfTQEK4A1b7ujXXQRTE=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by BL0PR12MB4993.namprd12.prod.outlook.com (2603:10b6:208:17e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 21:48:38 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::b123:27a0:c5e2:f5f0%7]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 21:48:38 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Topic: [PATCH 04/15] arc: TCG and decoder glue code and helpers
Thread-Index: AQHW62F0vmOtZqCO7Uy4HrbUomKevA==
Date: Fri, 15 Jan 2021 21:48:37 +0000
Message-ID: <826051d0-623c-9e29-e62d-8c3818c3e0af@synopsys.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
 <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
 <e13f0b99-c5d5-4c8b-95c1-1ef79bdfd95a@linaro.org>
In-Reply-To: <e13f0b99-c5d5-4c8b-95c1-1ef79bdfd95a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [188.250.163.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc545b74-57ae-4c8c-5f12-08d8b99f50df
x-ms-traffictypediagnostic: BL0PR12MB4993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB49935D1060F64C202C782ADDA8A70@BL0PR12MB4993.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +aBH6iPMfdOrIc5JzDapmLEjDR0Bo1KHUcqkNAUTTvzBkU4FqEWaI0UAB0pjOUFNlTSApt9z4Dz6tN/jo3/imwGCIHrxaAaUksCwM26osIJKIe/5rKG66rLOBMnBMiHh1R+zqpzOPyKJuGRp6T/jJTY1xWApvz0CRs+TfvSnmhTIpV0HIPnW7q3PX7ZMn8dOFg0WEq6SfsvmxusCcJCKG4eAvjpb6vBrpOIlP2ipcqHEoowqypIS8tEa64rLSUkVhslzCjQh/Qjtnb2oWQ7rU9qgTuGYCbatHdm/BJItH+VsMB7/D/ExLHW0MaU+wK2a82EP8vej01DtAhz4JBV9FC/XGLSm6DXwUIIL140zrJU23uewbx5U+6ZGTp927lCHCTCOh2zhQKf1oo7BNcXb55VGElPvsKrpdVJf+2l1uaVK1x1nfQjgiKdXDqnqn4rB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(396003)(346002)(366004)(376002)(54906003)(316002)(478600001)(110136005)(53546011)(83380400001)(26005)(31696002)(8936002)(66476007)(2616005)(31686004)(86362001)(66446008)(36756003)(8676002)(66946007)(76116006)(4326008)(107886003)(64756008)(6486002)(5660300002)(66556008)(91956017)(6512007)(71200400001)(6506007)(2906002)(186003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eGxwQUQzL0drUTdqbGxHQVFqNDZselhtaCtiallmNjdiRlcvWnZtQU1qSUds?=
 =?utf-8?B?cElUODMycSszbzErVUFmMmlrNFBFUFpKTElRUVZlK0xQUzN0UHQ5YUZNWkVp?=
 =?utf-8?B?NXBSeGRqZm1ST2ZhSzcwRzZYcHR5RDJ2Z1ZsTlRweWFxQ1hBYS9YTzNhTEVB?=
 =?utf-8?B?R3hFRGtCVlFKWFZUeHIvaXhkUm9BbnBqSWtTbWsyZGNHYWFZbTR2aUtBbGhJ?=
 =?utf-8?B?YVgwUUxoVUxDbUp0OVAyYUovUjltZXlpTnZkU2trTEhmeXVzaTJoa0EzRDlB?=
 =?utf-8?B?bHFqbVdnNVBXemJQNmNyZUVFVUVoWmpCdXpKemNZNFdyNCtIWEViVzA4dFBD?=
 =?utf-8?B?V0FnT3VOYnorL1FPUkpOdjN2WlVHeHNpYzZFdnlVYnhINko5L0NrT1BWNU51?=
 =?utf-8?B?QlFqNUtsR0dVZUJjU0hPYmlBRmljTlFLR3hZSDBGZUN6eTUzU200dTVYeXRM?=
 =?utf-8?B?RzhiQXJ6eklQUDZPMlFqd3cyRy9qRzVTNmVZZENoYmtTZFdVQ2tBdDdjS3hL?=
 =?utf-8?B?NzVDb1o2U0dic1R3UVhXVkVwemJ0RHA0WlVMYjV5cGhGV0JKVkJKN2JQREc5?=
 =?utf-8?B?TzhhUlB3YzE1UWlCZWcvRnpHZkk3SXBlbGRPQXRvYW1lR1ZkdkNYYlJ2ZFVD?=
 =?utf-8?B?UjhNa0JDMzRIdWw5U0IrSmNzdGtTY2ZyanpxUzhxRmZKUG9CMWhpU3c4dE82?=
 =?utf-8?B?LzZxWWpMN1haMmVwVTVYMjlmeDVDOWo2T3JSWGFWMWx5NkN1UndOb3hJa1g5?=
 =?utf-8?B?VkZsN3k4a3ZHMk9scTBMa0dNRVZrdmJSMUwxRnRUUzdjVUFyUkxYYjJLTDF6?=
 =?utf-8?B?Vm0vL0FZM3JmNk1UbWxsaC9Pc3ZJUFNwMk8vVXhSZEtoZ3l5bXpieUJuVnFx?=
 =?utf-8?B?NkZ4elQ2NWtTa05ITVRoRFB5MVgwYzRWNk41TFU3Q1RoNCtHRE5tcGhzZ3Iy?=
 =?utf-8?B?ejkySmIwQkg1YVp2NjdOYmZvTVZlLzQ4SGVOYjV1MCsvVkZkb3hTZjZNNlp3?=
 =?utf-8?B?eUVnTk96UTZNbVpoeTh2ckRNODhRQXBhVE1SbjdrUDVVWmt6Q0NYVTEwY2Fv?=
 =?utf-8?B?aXBmKzh0WXBScURrRkVBdnNtdE5uc1ZyZW1HT3VrSW14UnZodHNZV3ZKQ29O?=
 =?utf-8?B?UTZwcVR3WVJGZ0ZGTFNzYmxqanhNeGt4ZVhnRXZ0N1U2ZlNPT1F6WlZDK3Vy?=
 =?utf-8?B?REVBTlFiNFJucmR2NGRBQVd4dTRrQUVYU0NaTzdFZ3JoSWYwVWFNem1wcExj?=
 =?utf-8?B?WkhQbS9LNGtVWFRpMUN2MmxTQk9vQytWam52VG9nYmZLRVI4VExDUFNwa25L?=
 =?utf-8?Q?cQtyJPUvK64Hc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36EF7D95E3679A4699D68755948B0743@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc545b74-57ae-4c8c-5f12-08d8b99f50df
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 21:48:37.9497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nirxcUUbbt2yCezn3GXXt1qPwZz9XiViC9GVcT8Qqu4N1L2+FX6Mp38Qt6dvR/53Bm1pQMI1AKc64Y5TTLgNag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4993
Received-SPF: pass client-ip=149.117.73.133;
 envelope-from=Cupertino.Miranda@synopsys.com; helo=smtprelay-out1.synopsys.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDEvMTUvMjEgODozMSBQTSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDEv
MTUvMjEgNzoxMSBBTSwgQ3VwZXJ0aW5vIE1pcmFuZGEgd3JvdGU6DQo+Pj4gU2ltaWxhcmx5LiAg
SSB0aGluayB0aGF0IGJvdGggb2YgdGhlc2UgY291bGQgYmUgaW1wbGVtZW50ZWQgZW50aXJlbHkg
aW4NCj4+PiB0cmFuc2xhdGUsIHdoaWNoIGlzIHdoYXQNCj4+Pg0KPj4+PiArICAgIGJvb2wgcmVz
dG9yZV9mcCAgICA9IHU3ICYgMHgxMDsgLyogdVs0XSBpbmRpY2F0ZXMgaWYgZnAgbXVzdCBiZSBz
YXZlZCAgKi8NCj4+Pj4gKyAgICBib29sIHJlc3RvcmVfYmxpbmsgPSB1NyAmIDB4MjA7IC8qIHVb
NV0gaW5kaWNhdGVzIHNhdmluZyBvZiBibGluayAgICAgICovDQo+Pj4+ICsgICAgYm9vbCBqdW1w
X3RvX2JsaW5rID0gdTcgJiAweDQwOyAvKiB1WzZdIHNob3VsZCB3ZSBqdW1wIHRvIGJsaW5rPyAg
ICAgICAqLw0KPj4+DQo+Pj4gdGhlc2UgYml0cyBzdHJvbmdseSBpbXBseS4NCj4+Pg0KPj4NCj4+
IEZvciBsYWNrIG9mIGtub3dpbmcgYmV0dGVyLCBpdCBpcyB1bmNsZWFyIHRvIG1lIHdoZXJlIHRv
IGRyYXcgdGhlIGxpbmUNCj4+IHdoZW4gY2hvb3NpbmcgYmV0d2VlbiBhIHRyYW5zbGF0ZSB0aW1l
ICh0Y2cpIG9yIGhlbHBlciBpbXBsZW1lbnRhdGlvbi4NCj4+IFlvdXIgc3VnZ2VzdGlvbnMgZm9y
IGNhcnJ5L292ZXJmbG93IGNvbXB1dGF0aW9uIGFyZSBzaGFycCBhbmQgd2Ugc2hvdWxkDQo+PiBo
YXZlIG5ldmVyIHVzZWQgYW4gaGVscGVyLCBob3dldmVyIEkgd29uZGVyIHdoYXQgd291bGQgYmUg
dGhlIGJlbmVmaXQgb2YNCj4+IGltcGxlbWVudGluZyBlbnRlciBhbmQgbGVhdmUgdGhyb3VnaCBU
Q0cuDQo+Pg0KPj4gV2UgaGF2ZSBkZWFsdCB3aXRoIHRob3NlIGV4Y2VwdGlvbiBpc3N1ZXMgYnkg
anVzdCBjaGFuZ2luZyBTUCBpbiB0aGUgZW5kDQo+PiBvZiB0aGUgaW5zdHJ1Y3Rpb24gaW1wbGVt
ZW50YXRpb24sIHdoZW4gbm8gZXhjZXB0aW9ucyBjYW4gaGFwcGVuLg0KPiANCj4gNS0xMCB0Y2cg
b3Bjb2RlcyBpcyB0aGUgcnVsZSBvZiB0aHVtYi4gIEEgY29uZGl0aW9uYWwgZXhjZXB0aW9uIChy
ZXF1aXJpbmcgYQ0KPiBicmFuY2gpIGlzIGEgZ29vZCByZWFzb24gdG8gcHV0IHRoZSB3aG9sZSB0
aGluZyBvdXQgb2YgbGluZS4NCj4gDQo+IEluIHRoZSBjYXNlIG9mIGVudGVyIG9yIGxlYXZlLCB0
aGlzIGlzIG9uZSBsb2FkL3N0b3JlIHBsdXMgb25lIGFkZGl0aW9uLA0KPiBmb2xsb3dlZCBieSBh
IGJyYW5jaC4gIEFsbCBvZiB3aGljaCBpcyBlbmNvZGVkIGFzIGZpZWxkcyBpbiB0aGUgaW5zdHJ1
Y3Rpb24uDQo+IEV4dHJlbWVseSBzaW1wbGUuDQoNClNvIHlvdXIgcmVjb21tZW5kYXRpb24gaXMg
bGVhdmUgdGhlIGNvbmRpdGlvbmFsIGV4Y2VwdGlvbiB0cmlnZ2VyaW5nIG9mIA0KZW50ZXIgYW5k
IGxlYXZlIGluIGEgaGVscGVyIGFuZCBtb3ZlIHRoZSBsb2Fkcy9zdG9yZXMgdG8gdGNnID8NCg0K
PiANCj4+IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQgd2hlbiBhbiBleGNlcHRpb24gaGFwcGVucyBp
biB0aGUgbWlkZGxlIG9mIHRoZQ0KPj4gaGVscGVyIG9yIGV2ZW4gb24gYSBUQ0cgaW1wbGVtZW50
YXRpb24sIGl0IGp1bXBzIG91dCBvZiB0aGF0IFRCDQo+PiBleGVjdXRpb24gdG8gZGVhbCB3aXRo
IHRoZSBleGNlcHRpb24uIE9uIHJ0aWUgaW5zdGVhZCBvZiBpdCByZXR1cm5pbmcgdG8NCj4+IHRo
ZSBzYW1lIHRjZ19sZCBvciB0Y2dfc3Qgd2hlcmUgaXQgYWN0dWFsbHkgdHJpZ2dlcmVkIHRoZSBl
eGNlcHRpb24gaXQNCj4+IHdpbGwgcmUtZGVjb2RlIHRoZSBzYW1lIGluc3RydWN0aW9uIHdoaWNo
IHRyaWdnZXJlZCB0aGUgZXhjZXB0aW9uLCBhbmQNCj4+IHJlLWF0dGVtcHRzIHRvIGV4ZWN1dGUg
aXQuDQo+PiBJcyB0aGF0IHRoZSBjYXNlIGluIGN1cnJlbnQgVENHIGltcGxlbWVudGF0aW9uLCBv
ciBkaWQgaXQgaW1wcm92ZWQgYW5kDQo+PiBpdCBpcyBub3cgYWJsZSB0byByZXR1cm4gdG8gcHJl
dmlvdXMgZXhlY3V0aW9uIGZsb3cgKGkuZSB0cmFuc2xhdGlvbg0KPj4gYmxvY2spID8NCj4gDQo+
IEkgdGhpbmsgSSBkb24ndCB1bmRlcnN0YW5kIHlvdXIgcXVlc3Rpb24uDQo+IA0KPiBBbiBleGNl
cHRpb24gbGVhdmVzIHRoZSBUQiwgdmlhIGxvbmdqbXAuICBCZWZvcmUgdGhlIGxvbmdqbXAsIHRo
ZXJlIGlzIG5vcm1hbGx5DQo+IGFuICJ1bndpbmQiIG9yICJyZXN0b3JlIiBvcGVyYXRpb24sIHRv
IHN5bmMgdGhlIGNwdSBzdGF0ZSB3aXRoIHRoZSBtaWRkbGUgb2YNCj4gdGhlIFRCLiAgVGhpcyBo
YXBwZW5zIGluIHJlc3RvcmVfc3RhdGVfdG9fb3BjKCkuDQo+IA0KPiBXaGVuIHByb2Nlc3Npbmcg
b2YgdGhlIGV4Y2VwdGlvbiBpcyBjb21wbGV0ZSwgZXhlY3V0aW9uIHdpbGwgY29udGludWUgd2l0
aCB0aGUNCj4gYXBwcm9wcmlhdGUgY3B1IHN0YXRlLiAgV2hpY2ggd2lsbCBwcm9iYWJseSBiZSBh
IG5ldyBUQiB0aGF0IChsb2dpY2FsbHkpDQo+IHBhcnRpYWxseSBvdmVybGFwcyB0aGUgcHJldmlv
dXMgVEIuDQo+IA0KPiBJLmUuIGV2ZXJ5dGhpbmcgd2lsbCB3b3JrIGFzIHlvdSdkIGV4cGVjdC4N
Cj4gDQo+IFNvLi4uIHdoYXQncyB0aGUgcXVlc3Rpb24/DQo+IA0KWW91IGFuc3dlcmVkIHRoZSBx
dWVzdGlvbi4gVGhhdCBpcyBleGFjdGx5IGhvdyBJIHVuZGVyc3RhbmQgaXQgd29ya3MuDQoNCj4g
DQo+IHJ+DQo+IA0K

