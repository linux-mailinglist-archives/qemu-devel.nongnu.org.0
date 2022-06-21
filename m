Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35DA553820
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 18:44:19 +0200 (CEST)
Received: from localhost ([::1]:57598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3gzC-0007Ve-6p
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 12:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o3gtX-0004TC-Pb
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:38:28 -0400
Received: from mail-sn1anam02on2107.outbound.protection.outlook.com
 ([40.107.96.107]:6659 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o3gtH-0001pa-3b
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:38:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIDxehC9wQfp4KLjxm2ZDU7111ljBw5cmP6p6tLZc15SA/oArY0RYboAXp8Q9Cgpft0fnVbyjt6Hj2xi+00jmCM+5y421gM8PEKWzd5w7XGHH+160BxbfebkEG//oFR5hlBaHeu4lTSkEnPFOtVOA5vMUPjhefqPDqCQosP1xrsWyi1M++Tbzndh0rfe5RvuQXuuPQb8hIBkupfp+vMVYuBVm6v/Y/w4NlDPVMbWbWOTUse9R2fiSv+VvWy5rpsoB1j09If0F3ak1iFDR7apJmKrm/VIeIdEjVfmVZ866w299B0rPhELHENmKe9Dc/8sKKGOQALtQnWvqCy6qLRiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXauHDI3ses6r/43uQHzn197osiS7WqZBhDVQu0bHY0=;
 b=WbEZ3m5764QLvjmlmjr6E0PrqIiYPJ4Pw7clrVIHkFB6YZfoi9Pcns8IM55pfSSwNQ6C5wpFV8Uap+wW/eeND4A4pWMKfYcQ9FXP4Itqz0x7+nNiXaNKqz+HCiAlVtqi5N5sw3RqvXRTdFXye8V6ADFb4seprjLrHI7XAx6eDZrAUBA5fDHEmncd5w2+GHaVmRK5qOBChg4vxZ83xH2olLVMaG8M7iF0dUrzYIR7OxTDxrlnF8hucoLkXQFqw+unHzNgNF/V/lsrpqTgePTMHcK57RJtGtUSDujG+Z0EjnFdX+93uWoo+UIS45DOHFswYv0vKUWP5w5Q/EbHlQvvyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXauHDI3ses6r/43uQHzn197osiS7WqZBhDVQu0bHY0=;
 b=GWFbA0zeC4UpNVa4U9XROV0SGmiFTV4Rj8nJVW9DFCQq+O+hTSv+ix9Wzhg+yaUA7YHYkYHkUiA4hJpqnCCxrhVdMfEYCc8Y6/Vbwh818l0RY42FYrhLWQpdeMY4OPON9Tz84SRiHQqig3xCjq1K+RaiWO+EUFlW3qc9zMvQko/AvWpm1J8SwFL8iIRFvczGyXgzjYdxegZBPN3VqIYJkXtLTVPK5kNcWKT+dC7eFy7t57J07jsWfwk6TXpRVIogPkEESF61vy23NySzEo4p5721KVsJ45/hGmzLTrUZH8/GP3zFxlp8KiyHYC39ts/up7tQPf6Sgmc6XwqmeiDftQ==
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com (2603:10d6:102:3d::17)
 by SC1PR80MB4639.lamprd80.prod.outlook.com (2603:10d6:300::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.15; Tue, 21 Jun 2022 16:38:03 +0000
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::e50a:4522:5dff:2f1a]) by CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::e50a:4522:5dff:2f1a%5]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 16:38:03 +0000
From: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 0/6] Fix support for biarch compilers and cross cflags
Thread-Topic: [PATCH 0/6] Fix support for biarch compilers and cross cflags
Thread-Index: AQHYhUSDmdFhmoH7mUuTIJ+6/uaG6K1aD+0A
Date: Tue, 21 Jun 2022 16:38:03 +0000
Message-ID: <fd21c891-91c9-1926-00f7-2ca9edadbc02@eldorado.org.br>
References: <20220621075147.36297-1-pbonzini@redhat.com>
In-Reply-To: <20220621075147.36297-1-pbonzini@redhat.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e29ac767-d418-4352-f31e-08da53a4696a
x-ms-traffictypediagnostic: SC1PR80MB4639:EE_
x-microsoft-antispam-prvs: <SC1PR80MB4639DA5C1D6B2EF3AB5A4A76A1B39@SC1PR80MB4639.lamprd80.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sEdol5VyaVcpGpl4P3Dqkm9EQBOAH5rFTJSAb4q5X41lm20s8Gvp8j9eojiVroymGW+szBmB//vTF1XSNJTlOGkMhLh5qd4Q2Vo9qoqwTotv0JivmxzZz9oA2IMPNjKOjmi+5GkZYd7lPJca8Lz3pfA47nMCtanw9KfQEVPozx4S1vm8aLbia42Rv0C7xKq1Vaq8jYfZctVSHk35Lb3YbkgPh6EiBdBfoB2b8CCaoOGzrIawwfViRyMQ1MLki5GqVB5IKFJqrnn2LPUFg2jwZffOj+y8eRZDRNc09N1Ph8ItfJDoo5ahCrmnhqXcBlDPeXH9XdNGzKIsy7cdbhy4mjTIFA4FdMxIHXUi0C1ZOMMKIpf3BkEMgIowo+L4Kq1N4+uKP+FBu1eya43w/fAG/ANF198/f5L0WwFZsl5qj1SV5mteHN2soVbTRU/5QRYbIpxRAT0+9qiDIzlkK/idO95lSIEVpmQ0n6ESNz9x1y7ghLfa05uj7LgJby6h3nYGsRPX7dbJqGkC9gmnvDdQBfo1CpTgj9RNW+O3/Iw04QSDZdJJN9G5cookRneUFsL5gvTJXHIfK6sCSP50bgyxUamHDQQC99Q6XIy9F4TwuI9ipV+Y/lgFzQZbdKivHqxB8cEQxPajHC3hAm2VMQ29yFoxKCeGIzzFDsGbgpnlONYCmGxCxTY6fPPg8ZYDdSSwLIrmi3RqitsU6mEXk6AJkC2TqfSjF+SbumGoJ8V+ONCLBiHTGy15Suj/ZJ2TwIhvc+aF7RgAB7WVa8dF199BvZrSkNZROE5ETeQn7ERX8r7KkTBD4PF3RX+/q1L1uAJ7FZ6V+RS97PJaCngBhpBnJmwcOE/C37/VIdAikcKfkyYKxtA29BLofWtWVSkVsqmsnPW5UF9F14MogYDpfwr1ZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3969.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(136003)(376002)(39850400004)(6486002)(53546011)(71200400001)(110136005)(66946007)(31696002)(6512007)(66446008)(316002)(8676002)(5660300002)(478600001)(31686004)(36756003)(64756008)(2906002)(41300700001)(2616005)(66556008)(26005)(86362001)(76116006)(66476007)(8936002)(83380400001)(186003)(6506007)(38070700005)(38100700002)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWJyZGdZWWJaWVg2K2t5cDJxZ3hMYXIveXVQZk9BT1YxUm03NEtkSzBRS1ZV?=
 =?utf-8?B?cGFxaDRXczgwKzkxOEtNdjBEMHpoNzhZaThkNFNFT05NNG1iT3V4dXZCb1N1?=
 =?utf-8?B?aEpjcXNNb0FUY1JKWnI0SGFXZi9UWTlMbEhFZ3VyUytEL1pubjBDN2xsaVh1?=
 =?utf-8?B?MUhCUFQ5c3ZZTzRxL1lwZzlBOVZyZVA1MHhlZTZaSkJnTEdOb1V3NXNzdTJi?=
 =?utf-8?B?Tjd3WDBCS0pxRnNoWEhNZ0lOOHBIVFlBMWlPVDBQblZoVTZ6MzBvTWVPbis0?=
 =?utf-8?B?dTFmRU92R2l2QTU3a3FXampwWXNQMHFlMmtac0ZTY3RycmxzQ2QyUGt6RkY1?=
 =?utf-8?B?eHdpS203ZndnYmlqMmpWSUM1Q2xVczAzelJFNFlrL1ZEQjEyRWVNWHdEVitq?=
 =?utf-8?B?cTVVdkRjTlFrM3RHalVCYmZvS1R3RzZoZFJuUncrYnp6SHRpRHY3WlhmMENh?=
 =?utf-8?B?RHhUOHg1RWZwcDcxcHhjdmt6UnN4ODBaS1RCaWpDR010MzUyVXZseDU5YXpO?=
 =?utf-8?B?QUlZZDNLOWNpdGpQNUxpL3dOS2dldUJuSFFkcFpmQjJNSFRIR2hWaVcza3VC?=
 =?utf-8?B?c3FNaCt5bVYvbU5aRXNxVXY1ZmdiV3BSVytrQ043c3RPQ0xuYjdmWkN3RG8x?=
 =?utf-8?B?OXNRVUovZ1grYW15anpMMVhOMlk4UmFScUgxODRGMys0WXRyWVZINU5COC9p?=
 =?utf-8?B?VjJPajAyanpBbHBoeWh1Sko1ZlQyL2JSekUxWTA4aklxbDBOYUxvdTRuS2lS?=
 =?utf-8?B?MmZmV3l3OGdXQ0JLcWJNUjYrMDB1Y29ZeDhDVVNtMTRHQ1hUbENWL3FsRi9h?=
 =?utf-8?B?N1B4UDlwaFVNOW1lYm02VWpJRlNabEw3R0Y3TkVTT2hUODNFdGxsa2FlUlFB?=
 =?utf-8?B?SDNoazZ2eHh5WHNIc0w3eDNhWGtkaE41bGYvcUNpWno0cGZ3alhYWXZ2Mmsw?=
 =?utf-8?B?ZW9FeXI4bnkyV29VckkxREgxR212RzNOVWRzTG9uT3d4ck14N0JRUnFVUnA2?=
 =?utf-8?B?NU1jNXI0cVhQZXJnVE80QzdkTXZGWGwzQ3BkWENmM05JQ0lVYTRoT0p0MFVh?=
 =?utf-8?B?eWlaLzE2SEwzN0pFaEJla1FkV3BJWnlpYTJCWEl6K3kxWmJ0MUZVeWlqQnlQ?=
 =?utf-8?B?ZCtQeDJ1R21QdklMdnh5Z2JGNEVxU0E3TjR3am9FRFo0K3BxSU9MMHlQeERU?=
 =?utf-8?B?ZkZkTnV1SVVNOXFoWkZlZFVNbS95aElPNTZvYTFxdmh6a2toKzJrekpvcjZk?=
 =?utf-8?B?Q0ttRDA3VHplZ0xSbGthYkE3MDQ3S1hzdjlwSTZoeHpJU3dXNCtRa0toR2ND?=
 =?utf-8?B?aElxUExYZ2t5K1pwZjYveHYxV3hxTXovKytjd3hrdGlxRnRERTFiUUpkSWRH?=
 =?utf-8?B?aE5jWkhVVE9pQVEyUHlSN1kyMG1tUHhlUWRNWlduWlBlWHdwNXBPcURiRXd2?=
 =?utf-8?B?Q09VVmVFVWJNNkllVWVZNEx5Y0xHcnhNY0x1b2JhZWdGVGwyQkx5TzRSYmg0?=
 =?utf-8?B?UGxFbUVyZUh6bUdJamFzeU82TlpSNTZmdXdreFJkYVAxS09wR0Y1QjR1Tk9Y?=
 =?utf-8?B?T2owdys4RXJmUlRRSkI0ZjgvYTAxYVhtbXFTa3FTZW51dW4vRWZDSmRFMkxM?=
 =?utf-8?B?NmZLK1JteFdMaDZSSnQwdGF4UXlrMVBhTTdTdExxLzZ1VlBXRXVXRU5CbzBv?=
 =?utf-8?B?TU5FMnhSUlYvbXQyR0pySnhjbG1oYXVWUExEbk5sSVFLaDRtT3F3YmxQNzlH?=
 =?utf-8?B?WWI0SW5sMUVaU3loYWhMTkxJelN2dXR6YTZWV3lPS1UxYkhVNktJR2hKbDVR?=
 =?utf-8?B?NGFOeERMdG5BQ0JxVFJaclUzRlRYTVkzeXpTQ1NzQUhqYnRzUTZZaFZ5V3pk?=
 =?utf-8?B?MUdHYVlzSVM5dDZibDlndDdGaXgwakt5Ly81NWdXVm5OSEdhd1hXZ3BmaVY4?=
 =?utf-8?B?aWZxbFJLYlYzUHNvSk9LTjlXUkxCaEZSWitRWkYwUFFsYWttWThNVVBCbGlj?=
 =?utf-8?B?RVhCMXdIUUoxRTd5SlBydng3VmNnVlpiUjdPMWVjRmlrRlh1b3lQU25yOGYv?=
 =?utf-8?B?VkVSQkdONFpGeDBiRm9HYmpRcko5MWdJUGJIaEFtUkRscXkxcjMzN2F6MFJB?=
 =?utf-8?B?WUpJT3JCaDNyY0NDYm1jOU5Hbk5RQXJPZ3lvR2tSM1JCczBOengySmQyN2Vy?=
 =?utf-8?B?WUpFWFlWT0JjVUVhc3NBV2I2TU11YnAvMlV4ODlCYkg4WTR4ZmY3ZmRya2tG?=
 =?utf-8?B?VC9laGZiNDRWY0NmdGhBbkdaY3lQbGJpRG0xUlpMeW5QMkpvdTQvblRNZVB5?=
 =?utf-8?B?WlJkZ3BCTTlPb1FTRC9ITWVNVFhnTTZRMndQNzZJbyt3M1BnN05BditFSUc2?=
 =?utf-8?Q?YmXvyjmWjiMnHSBlA7kD5MW2ZpUlS9m6I4viH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D8AB835ACB8A44396D40138A51C0905@lamprd80.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3969.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29ac767-d418-4352-f31e-08da53a4696a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 16:38:03.4080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MsjVMwFSl4CGXY0VVpRIcQ7fJ4APjupphYO0gyWTMqO4H6DA10iLOCpmNni72Qkq94C4rBDw2wgJd5MkZtVdolHk3JBPTEl2fANztjbW5Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SC1PR80MB4639
Received-SPF: pass client-ip=40.107.96.107;
 envelope-from=matheus.ferst@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

T24gMjEvMDYvMjAyMiAwNDo1MSwgUGFvbG8gQm9uemluaSB3cm90ZToNCj4gVGhpcyBzZXJpZXMg
Zml4ZXMgdHdvIGJ1Z3Mgd2l0aCBjb25maWd1cmUncyBjcm9zcyBjb21waWxhdGlvbiBkZXRlY3Rp
b246DQo+IA0KPiAtIGZpcnN0LCAtLWNyb3NzLWNmbGFncyBpcyBub3Qgb2JleWVkIGJ5IHBjLWJp
b3MvIGNvbXBpbGF0aW9uDQo+IA0KPiAtIHNlY29uZCwgb24gYSBwcGM2NGxlIG1hY2hpbmUsIHRo
ZSBob3N0IGNvbXBpbGVyIGNhbiBiZSB1c2VkIGZvciBwcGM2NA0KPiAgICB0ZXN0cy90Y2c7DQoN
ClRoYXQgbWF5IGJlIHRydWUgZm9yIHRoZSBjb21waWxlciwgYnV0IHRoZSBjb21wbGV0ZSB0b29s
Y2hhaW4gaXMgdXN1YWxseSANCnNpbmdsZSBlbmRpYW4uIEZvciBpbnN0YW5jZSwgRGViaWFuL1Vi
dW50dSwgRmVkb3JhLCBhbmQgRnJlZUJTRCBsYWNrIA0KbGliYyBhbmQgY3J0Ki5vIGZvciB0aGUg
Zm9yZWlnbiBlbmRpYW5uZXNzLiBTbyB3ZSdkIGJlIGFibGUgdG8gYnVpbGQgDQpwcGM2NC1zb2Z0
bW11IHRlc3RzICh3aGljaCBhcmUgbm90IHVwc3RyZWFtIHlldCkgYnV0IG5vdCANCnBwYzY0LWxp
bnV4LXVzZXIgaW4gcHBjNjRsZSBob3N0cy4NCg0KPiBob3dldmVyLCB0aGlzIGlzIG5vdCBiZWlu
ZyBkb25lIGJlY2F1c2UgJGNwdSBkb2VzIG5vdA0KPiAgICBtYXRjaCB0aGUgdGFyZ2V0LiAgTGlr
ZXdpc2UsIG9uIGFuIHg4Nl82NCBtYWNoaW5lIHRoZSBob3N0IGNvbXBpbGVyDQo+ICAgIGNhbiBi
ZSB1c2VkIHRvIGJ1aWxkIGJvdGggaTM4NiB0ZXN0cy90Y2cgYW5kIHBjLWJpb3Mvb3B0aW9ucm9t
LCBidXQNCj4gICAgdGhlIHNwZWNpYWwgY2FzaW5nIGRvbmUgYnkgdGhlIGNvbmZpZ3VyZSBzY3Jp
cHQgb25seSBjb3ZlcnMgdGhlIGxhdHRlci4NCj4gDQo+IFRoZSB0d28gYXJlIHJlbGF0ZWQgYmVj
YXVzZSwgaWYgb25seSB0aGUgZmlyc3Qgd2FzIGZpeGVkLCBwYy1iaW9zL29wdGlvbnJvbQ0KPiB3
b3VsZCB1c2UgZWl0aGVyIHRoZSBpMzg2IG9yIHRoZSB4ODZfNjQgY2ZsYWdzIGRlcGVuZGluZyBv
biB3aGljaCBjcm9zcw0KPiBjb21waWxlciB3YXMgZm91bmQuICBTbyBwYXRjaGVzIDItNCB0YWNr
bGUgbm90IGp1c3QgdGhlIGNyb3NzIENGTEFHUw0KPiBwcm9ibGVtIHdpdGggcGMtYmlvcywgYnV0
IGFsc28gdGhlIGJpYXJjaCBjb21waWxlciBwcm9ibGVtIHdpdGggaTM4Ng0KPiBhbmQgcHBjLiAg
UGF0Y2ggNSB0aGVuIGNvdmVycyB0aGUgb3RoZXIgYmlhcmNoIGNvbXBpbGVycy4NCj4gDQo+IFRo
ZSBvdGhlciB0d28gcGF0Y2hlcyBhcmUganVzdCBjbGVhbnVwcy4NCj4gDQo+IFN1cGVyc2VkZXM6
IDwyMDIyMDYwNzA5NDAzMS4xMjI3NzE0LTEtcGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gDQo+IFBh
b2xvIEJvbnppbmkgKDYpOg0KPiAgICBwYy1iaW9zL29wdGlvbnJvbTogdXNlIC1tMTYgdW5jb25k
aXRpb25hbGx5DQo+ICAgIGNvbmZpZ3VyZSwgcGMtYmlvcy9vcHRpb25yb206IHBhc3MgY3Jvc3Mg
Q0ZMQUdTIGNvcnJlY3RseQ0KPiAgICBjb25maWd1cmUsIHBjLWJpb3MvczM5MC1jY3c6IHBhc3Mg
Y3Jvc3MgQ0ZMQUdTIGNvcnJlY3RseQ0KPiAgICBjb25maWd1cmUsIHBjLWJpb3Mvdm9mOiBwYXNz
IGNyb3NzIENGTEFHUyBjb3JyZWN0bHkNCj4gICAgY29uZmlndXJlOiBhbGxvdyBtb3JlIGhvc3Qv
dGFyZ2V0IGNvbWJvcyB0byB1c2UgdGhlIGhvc3QgY29tcGlsZXINCj4gICAgY29uZmlndXJlOiB3
cml0ZSBFWFRSQV9DRkxBR1MgZm9yIGFsbCBzdWItTWFrZWZpbGVzDQo+IA0KPiAgIGNvbmZpZ3Vy
ZSAgICAgICAgICAgICAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0NCj4gICBwYy1iaW9zL29wdGlvbnJvbS9NYWtlZmlsZSAgICB8IDE1ICstLS0tLS0tLS0t
DQo+ICAgcGMtYmlvcy9vcHRpb25yb20vY29kZTE2Z2NjLmggfCAgMyAtLS0NCj4gICBwYy1iaW9z
L3MzOTAtY2N3L01ha2VmaWxlICAgICB8IDIwICsrKysrKystLS0tLS0tDQo+ICAgcGMtYmlvcy9z
MzkwLWNjdy9uZXRib290Lm1hayAgfCAgNiArKy0tLQ0KPiAgIHBjLWJpb3Mvdm9mL01ha2VmaWxl
ICAgICAgICAgIHwgIDggKysrLS0tDQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25z
KCspLCA1OSBkZWxldGlvbnMoLSkNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgcGMtYmlvcy9vcHRp
b25yb20vY29kZTE2Z2NjLmgNCj4gDQo+IC0tDQo+IDIuMzYuMQ0KPiANCj4gDQoNCg0KVGhhbmtz
LA0KTWF0aGV1cyBLLiBGZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETyA8aHR0
cDovL3d3dy5lbGRvcmFkby5vcmcuYnIvPg0KQW5hbGlzdGEgZGUgU29mdHdhcmUNCkF2aXNvIExl
Z2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIu
aHRtbD4=

