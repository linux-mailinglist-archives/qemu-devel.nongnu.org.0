Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243CB2F9853
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 04:37:44 +0100 (CET)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1LMN-0004Lw-6F
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 22:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=645c2efc4=Dmitry.Fomichev@wdc.com>)
 id 1l1LKf-00031e-Ud; Sun, 17 Jan 2021 22:35:57 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:65159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=645c2efc4=Dmitry.Fomichev@wdc.com>)
 id 1l1LKc-0004bH-Px; Sun, 17 Jan 2021 22:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610940954; x=1642476954;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WOPdHazOM4qQMfQHWW/Nn/EQPI2uf3r8HlEzCh6B6TI=;
 b=mVFrn3cPXj0hQ4LFzOQn19CkfIxej0kPsdngcrDpT9F8fbfYYP0j/JN9
 h6jQ38X0fBWfNcQQ1+eBRZKtXkVv5iv6lBeCtK6SZicaC0PwBRVFTg6qc
 xj+6a2ZnWyhKzj+0hjEvD3Qk8XCgVuJy5cYlOHuFBD8Vo6OztKslQggOz
 TT3yOlbjr3lI0CfTfel2IzmaY5A0CpW86yMb0sjJgDk/RKq/bMXI5A0Uv
 VSpR+w1Sa3Y6L0dWAsL3IW6DRIU5fEEpaJcA3mSSUZQiwlXbl60DEph7n
 nt1P7nwHCal9MY09ZYIw7CySMNopelBxT4RKX0fFwKYF5/W3KVlU0rrZG w==;
IronPort-SDR: Hmvy2aIoYzyWrgK7lGouk0nUDQBDsNk/6nOLKeKS4g842IhxV7yyqQgnKvyZt4eIMr7WrpAUYX
 QrXko4cy+tRHRfe2cqQaUrpYDosEAs8A99ZiOG6Pf8K4kbM6UAU5e418XYMvixXdk70T2ERVg1
 i2O5PavoVESgKuouDX6wChg6a2a+0rKrADlvbOjDM/AxuyFbvNFH+WhxNTkehltSxzaZhTrbL5
 hpTjt89UJT/CjnZBWO0Da7pDnvzj8zuY1Ze6a35lByybQlCq1h2C8XzmoBH7Kh/lwgFBuiV4qQ
 0+U=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="162107398"
Received: from mail-sn1nam02lp2059.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.59])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 11:35:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kvm3izGn+qLPd7LDuIW5U3A+qLIwqUYU6psonBgyPOj6enMnnrnvCz/0yfeVob9Iv6fRVmyQFd0U+y09uRWtsBfj4BjX3FLrQ1E5iOC8JSJ2a02aUPNKbfdMsiIxdJgi1lVlu3S+3BSSVHEnO5bRLtA35UVzyrm14wqL1RMi375yKARH/glIAz7jxZm+3xfcxWFIjYvJTVcvmrmgY2LawrzPB5OTXhFuxZy7L3fVyMiHcsT2d1p38X9gc4riA4SY3gcPS8oSCien+DWjKLVbRQu0pqEjpyucTkeAllIAY1X1ZOgVi2lx4agoTL60YKKqgTklCSDq2KOivAHwVdLuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOPdHazOM4qQMfQHWW/Nn/EQPI2uf3r8HlEzCh6B6TI=;
 b=JtvifkDcknnCtt9MCKqfPc/bQvK060q6V8y4hVbEWeUPT8FdUwqBMFT/SGlAuxvLWpw7Nzn/jFiNjrzaq5Y8TG/y+XUSsoACOFmV+nb8Xe+xrbJHDZSijBRF3jEKHzgcYdd5JQh5v5MkfNJGKHb9r3VorBMox3CiyAdNrT5RgQoulFxWfmWaot5Q9N4n5NifqTEjWG545NgG01bGILKQIzf8j/W/aBfqpRI4+v03vi2s6Uv416IIGqUYgSIF3uApEM9+Ju7jZZ0d9yD+Uahrq9mNrKJYLF1xHG1avlZ5xdHYG3fBG2xjTqbqJZEmswHzf8aLXif47TmsXb48GgQTew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOPdHazOM4qQMfQHWW/Nn/EQPI2uf3r8HlEzCh6B6TI=;
 b=jyx3oqs51BxPJZBJUeG1qCcxfWwcHPTzCc7yL0ujM2uCX+mOaNSBmVNOMJP3ZRCGBJibWvzXVBd3dAkoxMS2q78po8WjpUZMxyTLIJdrZudoQo/74yJA2409mAkz5cfGlGDEFUjlcNgdh1bkP93uhsc9s17fkTguFDOTETtgnL8=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MN2PR04MB6125.namprd04.prod.outlook.com (2603:10b6:208:e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 03:35:50 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::61cd:6fe8:7a7e:79a3]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::61cd:6fe8:7a7e:79a3%3]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 03:35:50 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "its@irrelevant.dk" <its@irrelevant.dk>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 0/6] hw/block/nvme: zoned misc fixes
Thread-Topic: [PATCH 0/6] hw/block/nvme: zoned misc fixes
Thread-Index: AQHW6BXWN8p25/S3kUSiFLCVrInIVqosxduA
Date: Mon, 18 Jan 2021 03:35:50 +0000
Message-ID: <0e93635d89378b7cb0250ad4a73555676d0ad4ea.camel@wdc.com>
References: <20210111123223.76248-1-its@irrelevant.dk>
In-Reply-To: <20210111123223.76248-1-its@irrelevant.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 (3.38.2-1.fc33) 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [74.102.244.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ea7e118-7858-497f-8676-08d8bb6226c0
x-ms-traffictypediagnostic: MN2PR04MB6125:
x-microsoft-antispam-prvs: <MN2PR04MB61259CB165D045D0BBBF6988E1A40@MN2PR04MB6125.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tmNxr4Aoh4qlArVwp7t2BG/bSxy2twY1iCpwpT8VNSwo672IoNEE9J3Qg1WbFnaTzOhDqaOf9HwMHRmqLe5aB3uYu0DD0iJY2utQtfTF7iHR4ucIW75tvQ/7t5uNfXT45ZSo8IEqE6ztl0nwxYje/gqDZ5xXilGVjZqKOz0Z9kDXMV+yRHGTcUCOrKKnkNXnUzJGJ/vdQFYEb3Rp+kWSQu4iBGEgp8/g3tN9mOkWmgwiSbwi64L5AtKhYw98z7IcXo0wrA954h62JdNMzVHj3EhPi7OgufDsknU1JdkXW9PlI8Fh6hpflLUqQZWR7050qxKc5S7uj7LkfNq8QTw3jGs+El70hc6+qfJzWGapixEh8ZyAhknYEZtJW9JbfIBz+GF54MfrxDdJA/cPWbul7sMOwRt4/45BaxSCeSAUAb+CDFxkPkr+1hlySY6/Qy3076s90BxLKPPhhMB0099woyxLEc7RAqtrOFQW/SIub5FSky4WZNP3jCEBWoU0sRwLe7gXYJV7wfMMFWe1FIjfmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(110136005)(316002)(54906003)(71200400001)(2616005)(86362001)(66946007)(5660300002)(64756008)(66476007)(76116006)(66556008)(6486002)(66446008)(4326008)(2906002)(26005)(6506007)(83380400001)(8936002)(478600001)(8676002)(6512007)(36756003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?R2RqQlVNdVQwdHgzWEVTdzVyaEc1WVJrTDQ1QW8xUGtBa2ZGYlU2NXdPa2k5?=
 =?utf-8?B?SlYyUndjb09rTUN1b1Z0Z2d0TE9Wakdld2pjV1kxclNDa3AyYmN5VWgxcHJY?=
 =?utf-8?B?eUcwdjBqYy9RWVVpa1hSeEl5ZUJwdWptSk50d3ZNYmwyRDh2L1ZtODdOZEQ5?=
 =?utf-8?B?V1RCNzFndjRyb3Q4Vk9lTk5LdlA1MXhLYUZ6RTk0NEpHQitCWWhuTnplL21M?=
 =?utf-8?B?aWtIbytIQVgrUDVvY0o5dDVEMlMxd2ZEMkgrY0UyTVhkdXQ1NWVHUmxGUjRk?=
 =?utf-8?B?QkJQYnFRYjJoaDV3OUFSd3Zvcml4eitBUFRhSFRRNUgyVmNlRERlMzNralZO?=
 =?utf-8?B?dFgvblNsaDhXQzFCcmJaVWEwZ0hBdlgzWjl6OXdGNkZmLzdUR0ZtNVdVNCts?=
 =?utf-8?B?M0pxemJ0WDUra2o5b1RFMTlFUkNXaXh1U0dYRDBmenFGbVdlcklRYjdSNW9z?=
 =?utf-8?B?YytILzAvdXlJVDA3NjdKN2ZCc0dxbzlmS2g5N2NuWnhlSGp0OG5KRUdQY2hC?=
 =?utf-8?B?RnRIZnJPbFR0UlMrME9PMjRpcEZwMXIvdU5YZHNSNDRXS2QxeDF5emV0UnVJ?=
 =?utf-8?B?ekpPbU1SNDE4MFkxbk9lN3ZGSmkyWUhnU0hpOXVMVWpVOTNDcHd5RFVxNklG?=
 =?utf-8?B?L243UEc2MnNqMmIwc1pYNER3TG9LUG9zajRYU2VFR1NNYUs5eHFiMVF6VGp3?=
 =?utf-8?B?MUxHUFVWRUp0OWxhOXJPRkVzdVlVZkxPazhSQ2V6UjA2Tkc4UjBYSkY5SHB4?=
 =?utf-8?B?MlRtRGVOVGNKMi9TaVgzTFZxclE3K3VmS0puY3NMVDc0TitWY1dhS251QmR6?=
 =?utf-8?B?TnI3MU1XVWFQVkFTbVZRa2s3a1RjQVorMWtlSGRxWitKV3l1cmNjeFprSTJV?=
 =?utf-8?B?QVROVjFvQVliTXliMU41K1hpTGVzUVgzMGJ1N2ZBVGNwYWNZMy9qR3NDTFJm?=
 =?utf-8?B?czlzQjRRelMzOHU4ZkdoRDUvZ0x6SzY5cHh5ZUtuV1FWcTFNVEZoeUhuRlR1?=
 =?utf-8?B?S0Q4NjRjVUpJbVJGWW93eXpNb0JsOVc2ODhhYm83M0duQzl3TUErMUlFMGFr?=
 =?utf-8?B?eWVYWStpYy8rSytuUDkzS0tWdmRtNzkySWhDY3VtSDFSWTBIQzR5MWxTYisr?=
 =?utf-8?B?NmZJVjlUQjdEVmhscEVyOGpBWmdnWU5hNEZrTGtMekhobk1RSHJMT0hSaVhL?=
 =?utf-8?B?dTZEUVFWaWxGODBLLzRRN016dmNSWjBJdUJ5V3FYcTR1SnIrMjB6RS9mN3kr?=
 =?utf-8?B?K0lSaVB0bzRGbXoxU1pZekZyRGhtbnlRMGJHSGVhK2Nsbm05TEVJWHpyZk1E?=
 =?utf-8?Q?58z5ZDf8bXSxRZX3PlKy7z5mXjLfUvLx6j?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <33223D46CC6246439F94D9F5FE0B3270@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea7e118-7858-497f-8676-08d8bb6226c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2021 03:35:50.3586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: woq7B7I6dILmbcczPFvnW83j4Nwps5VqHGY0gC4xpLTA2FRaMyjot8zZ20nEwW419/Z2jLe+Bw+sGheDHHQDMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6125
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=645c2efc4=Dmitry.Fomichev@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: "kbusch@kernel.org" <kbusch@kernel.org>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gTW9uLCAyMDIxLTAxLTExIGF0IDEzOjMyICswMTAwLCBLbGF1cyBKZW5zZW4gd3JvdGU6DQo+
IEZyb206IEtsYXVzIEplbnNlbiA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQoNCktsYXVzLA0KDQpU
aGlzIHNlcmllcyBsb29rcyBnb29kIHRvIG1lLiBJJ3ZlIG1hZGUgYSBjb21tZW50IGluICJ6ZXJv
IG91dCB6b25lcyBvbiByZXNldCINCnBhdGNoLCBidXQgaXQgaXMgb25seSBjb3NtZXRpYyBpbiBu
YXR1cmUuIEkgYW0gZ29pbmcgdG8gc2VuZCBhIHBhdGNoDQp3aXRoIGFub3RoZXIgc21hbGwgZml4
IGluIFpOUyBjb2RlLg0KDQpCZXN0IHJlZ2FyZHMsDQpEbWl0cnkNCg0KVGVzdGVkLWJ5OiBEbWl0
cnkgRm9taWNoZXYgPGRtaXRyeS5mb21pY2hldkB3ZGMuY29tPg0KUmV2aWV3ZWQtYnk6IERtaXRy
eSBGb21pY2hldiA8ZG1pdHJ5LmZvbWljaGV2QHdkYy5jb20+DQoNCj4gDQo+IFRoZXNlIGFyZSBz
b21lIGZvbGxvdy11cCBwYXRjaGVzIHRvIHRoZSBqdXN0IG1lcmdlZCB6b25lZCBzZXJpZXMuDQo+
IA0KPiBUaGUgYmlnZ2VzdCBhZGRpdGlvbiBoZXJlIGlzIGFzeW5jaHJvbm91cyB6ZXJvaW5nIG9m
IHpvbmVzIG9uIHJlc2V0Lg0KPiANCj4gS2xhdXMgSmVuc2VuICg2KToNCj4gwqDCoGh3L2Jsb2Nr
L252bWU6IGZpeCBzaHV0ZG93bi9yZXNldCBsb2dpYw0KPiDCoMKgaHcvYmxvY2svbnZtZTogbWVy
Z2UgaW1wbGljaXRseS9leHBsaWNpdGx5IG9wZW5lZCBwcm9jZXNzaW5nIG1hc2tzDQo+IMKgwqBo
dy9ibG9jay9udm1lOiBlbnVtIHN0eWxlIGZpeA0KPiDCoMKgaHcvYmxvY2svbnZtZTogemVybyBv
dXQgem9uZXMgb24gcmVzZXQNCj4gwqDCoGh3L2Jsb2NrL252bWU6IGFkZCBtaXNzaW5nIHN0cmlu
ZyByZXByZXNlbnRhdGlvbnMgZm9yIGNvbW1hbmRzDQo+IMKgwqBody9ibG9jay9udm1lOiByZW1v
dmUgdW5uZWNlc3NhcnkgY2hlY2sgZm9yIGFwcGVuZA0KPiANCj4gwqBody9ibG9jay9udm1lLW5z
LmggICAgfCAgIDQgKy0NCj4gwqBody9ibG9jay9udm1lLmggICAgICAgfCAgIDQgKw0KPiDCoGlu
Y2x1ZGUvYmxvY2svbnZtZS5oICB8ICAgNCArLQ0KPiDCoGh3L2Jsb2NrL252bWUuYyAgICAgICB8
IDIwMCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0NCj4gwqBody9i
bG9jay90cmFjZS1ldmVudHMgfCAgIDEgKw0KPiDCoDUgZmlsZXMgY2hhbmdlZCwgMTQwIGluc2Vy
dGlvbnMoKyksIDczIGRlbGV0aW9ucygtKQ0KPiANCj4gLS0gDQo+IDIuMzAuMA0KPiANCg0K

