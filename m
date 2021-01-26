Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4FB30339B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 06:01:06 +0100 (CET)
Received: from localhost ([::1]:33388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4GTR-0002ux-GL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 00:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=Dmitry.Fomichev@wdc.com>)
 id 1l4GRU-00020x-Pn; Mon, 25 Jan 2021 23:59:04 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=Dmitry.Fomichev@wdc.com>)
 id 1l4GRS-0005Xt-Ns; Mon, 25 Jan 2021 23:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611637143; x=1643173143;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NJGJpxPBfZZVCsDs0oI88Q5QmZn5QckUZGxJBHQ0V/w=;
 b=EPLmunHqf9RQFzNVuzWu+hWsfwFRQ09aLbLS9rmZaWg+xxUOesIf9kxL
 Wp13PA2ObWmW7zEIQ2vqjR3bnpJfrIV19IiH8pbOMqhWuqNLjU3e5ntu7
 Dco/ilxD/3fgFVKEdLsUpt4T2QQiCgxgrMBk19P1/aPFV1Ewf8qgvFUOe
 82q27E1PlbCC/qMsPzTSn0ZXWh4VDaQpsfSqoqgIW7Zghvh9B+iYTRFGG
 8zegOCoLMIFXb9q6kpYBGCE6JvWRHM6bGYrHqwb5k0O57o8sfL3A+SbKj
 GEjzY05Zr5cRAg5J0thUVk1VmyW/BspY/hMDioRYRucA+GQ/sY5N/Zenn Q==;
IronPort-SDR: 1RaBo6ZyGPSCIw8RKWnYTKnGEzsZS3cZmirCc4LuIa2D9wGyoRHoLTMt30kkaxFYMenjDcnA0/
 Z+5n8+tOw1gB6z7U8LSBfE6tzpbrzio2g1qRRcib9+EkBfsiQH7VWfSfwXIjuSCVX/vQIrPeQA
 njZfx0cncZaWn5c6x4Yk0L9I8lE07rkVh8UMb0o4zvZG/HEY977GfvTRoz5rh+oAYaofu5q3lr
 8K0GM9VL/IiF2z3EDnTDa2zBrt4hKHxjHnN7RGBY403cH4pcnc6GBuK0+4544rWJUqVz0VHFbM
 KgM=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="159493058"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 12:59:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnUDH7FY59CNVYCQ8saSbGps6L2g6tU6yJyd6AEKorQ+j3KmgbL66CaVBBdhcleeB+HBEoh20d5YhqaYuouTsL/fM/YlWgaMkbIVuuN801wE75TOOi4GYJ+s8/Y1IIWg36PNbxdIxcHmD0LV/HcCOGwHw5ZArjfEvhCt9O4Ahsz9TKqAn8tgzXZv8Hrd+IHtvZij9EICEwlae08EQq8HWgUnQQ4cBa30HoVTKrTOjvl5oU9u1LiftcO6zBbWDWxU1JUAZG20Z9kfItvbM2KUBamm809IQVW1Io+yeXNGyyWAGfZQRohLD0uBJb3aKTfZN0+YZI+PCQY0XRXR0WZNbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJGJpxPBfZZVCsDs0oI88Q5QmZn5QckUZGxJBHQ0V/w=;
 b=oElUckPkUcCwdBggCkkLOUoH+rv8lTXkvNFQbQO/R+3/2mmfvci0o3c68d0/ruDE/RxE4o6sHDa5BfaXR6I12xOu8d+VnmIiBRnEtOiBvL8fuZPawqzJhu76bTgjVBrnJovU7smp4TihS3O8gzoo2frQ4Rsju7A1n2xJPB0ww+yU77+NszeSYtQM5Wai6aaFOHWA4VQUiZaIQdj0E0F/7nKrxUI0M+wr7USwPxuD+NIlBhr9dHHdcQzE7AcjxYoRiRrKseTF8CBlpwZZ/rJZDfIBvq1ASwzRsmMgPrNTSgRWvmr61nZqh3HkAg/V8VD9LfFb7YIPXPgE9WmUC30RTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJGJpxPBfZZVCsDs0oI88Q5QmZn5QckUZGxJBHQ0V/w=;
 b=JCNMX5a2362sLbVouoCe8wd95XaRSQ2h9/FFiLBzTM2/jtoC/qmQcK3HZScMCOpDuUJrmkBp3RodGCK6AIzmTtPbcc2mj7srXaWuo/VC0k62QkYbljMuVJhilI2rgE+SyaMv+xHTJjjdTQySJunJw6hitKn4hbEQ2qeQdVLN26o=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MN2PR04MB6157.namprd04.prod.outlook.com (2603:10b6:208:dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 04:58:58 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617%4]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 04:58:58 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "its@irrelevant.dk" <its@irrelevant.dk>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 2/2] hw/block/nvme: refactor the logic for zone write
 checks
Thread-Topic: [PATCH 2/2] hw/block/nvme: refactor the logic for zone write
 checks
Thread-Index: AQHW7mq1CImdfE90NkiOv9bFn+d+8qo5YxMA
Date: Tue, 26 Jan 2021 04:58:58 +0000
Message-ID: <d595963465bee43b8c532df364128fee8aeea57f.camel@wdc.com>
References: <20210119135500.265403-1-its@irrelevant.dk>
 <20210119135500.265403-3-its@irrelevant.dk>
In-Reply-To: <20210119135500.265403-3-its@irrelevant.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 (3.38.2-1.fc33) 
authentication-results: irrelevant.dk; dkim=none (message not signed)
 header.d=none;irrelevant.dk; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [100.35.205.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 511da844-5f99-4223-8ef5-08d8c1b7176d
x-ms-traffictypediagnostic: MN2PR04MB6157:
x-microsoft-antispam-prvs: <MN2PR04MB61576CEB42C1A0FBB508A323E1BC9@MN2PR04MB6157.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4eduPQfjhSRwoGaTuSI1BkuCqJ2mg4O/pMFGsIyYpNaRyroSoECr9lzWW31l5NjRGUpja+Li9/ow7thlIbDcVyOuvlzfc7mT/by1pFPmNO6M3OZXh7Cy1bcCYV3NzjworL+yH0q4VQPR2aLRCy03ZofXQzX7k/fOpoRh57/Z6CgTiWhop1NA7znkRXmcKrufoqjRFnqmb3BDZ+Gd6jTlAhVoaGYNytnr+UxfygSNajCuegoUBbyHeGLsQ1+E/RyRLx6odaFd3ot2orSA8GBPShWCnOlOVqQCRq6HuwwogW5fk+DbYZ7jbt1dLGFWP5K9ORo7R2p3B9dnAiVnlmruwEkTkJp6hM7y5PQQvPhJ99P1jk7lrog4+0JKYoik1bE2fmxxL5Ym32Msoy8MC9XVWQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(5660300002)(4326008)(6506007)(76116006)(6512007)(83380400001)(6486002)(66556008)(66476007)(66446008)(64756008)(66946007)(186003)(26005)(36756003)(2616005)(8676002)(2906002)(8936002)(478600001)(110136005)(54906003)(86362001)(71200400001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UVBObWFwbHBPaWhZZytrSUlEYWpnS3hYOE5VMmxTMktQYU9QYVh2Rk1sWDVU?=
 =?utf-8?B?MHpoc0Qza0drYThwOWoyMUtoUkRGQ01SU0hHT0hjOUV2alZwbENIV2gzZ0Nn?=
 =?utf-8?B?ODBmaTZPNGRMaE1hd09aU3VUMm43Z2FrYnhnTG80aTdEVG1hWHlZUldpYW9Q?=
 =?utf-8?B?bFl0RGRER2hyYTBDdkpNcGtLVEhxVFBHdE1UbGxwQ2dTaEptbkRPQ2Nud0g0?=
 =?utf-8?B?WExINjF6eFhFVWV2THYvSEswVUFObkRLU0pzTjlKRWxzWjRyRWJCQnA4NGFa?=
 =?utf-8?B?TWRRcnF3RzFsTUNOT2F1TzFVRWducWE0TVNkNkFjQlZ5SHpjMGJMWGkvNmJi?=
 =?utf-8?B?NUdZN096UVZwTXdVaitqR3ZQcUtKTDE1VjF5R3pjZnBqdmpYM1hkZVJNbUY3?=
 =?utf-8?B?NXU3VmpuUWlRcW1HK2tZazdmMTVmekxpNmZhZHRoTXpQT1o2WU94LzRnRndN?=
 =?utf-8?B?REpCSEJpL2tCU2wrUU5jZFlOM3dMalQvV01rUWlCMmZja2ZLL1pjYStaZGZk?=
 =?utf-8?B?Tk85bjRxbWtiSnlGQ2p4Y2NmOTJ3VTZYaWgwVDBhdUNCNjZPVVBDWUhnMGNL?=
 =?utf-8?B?VGRJV0tvRXRnUElEbHdycS9UcHpEcGU1OU9TeFAvQUJNcStScXFwZElvbk5G?=
 =?utf-8?B?QWVENkM4ZjZ6TjBBay9lc24rZ2VwZEtIaEpvR3JseG5wdTd2NEVOa3pzdnd2?=
 =?utf-8?B?U2NaR2oxZHlidytQdngxczg0cUJhN2pqN3JPY2ZqQjg2NnhkM0grOGNKajMw?=
 =?utf-8?B?Z0hvZU1BTWV6a0xwVjlIcVo5QVo0a29yOGtMTTRXRmlxdXMyNG01NUJmak1l?=
 =?utf-8?B?Y1VjZ3p1Y0ZqaWc3UnMvK1MwcDlrVzB0VFZxMzl0Q21Cb2tPSFFYOUJlSyta?=
 =?utf-8?B?UDdENHk1SG9aVVhpSFNkVERQQXJUZHB6MENqMExlRytIMnRHMEczQ0ZUbU1Y?=
 =?utf-8?B?RGZGc0JDeUo3TFdtRVppQlhQQSsxcEZJdm9tS0NJQ0FJSlRXbC9UOUVYY2c1?=
 =?utf-8?B?SmNIL3ViL293U0ZMUEYzQU9xck9TVUtGSjY2b3dzV0YzUlVNcmVGd3hUaHNk?=
 =?utf-8?B?UDQ1bkhmbkdJV09tMS9xSHZGSFJEZDYzTWdUcmIrQ0g0ZEptZnNqbnVINmFE?=
 =?utf-8?B?dnJDUlJjNHNMRTNBdkd5aHRGZ2RPY1l5b1RNaVVKbjJLK2sxVTllRk5Zd2hn?=
 =?utf-8?B?dVhVb3lIY1o5TG5zOUdpSEF1Z3dheEt1TUM1WFNocHZTNzRTQlMyNnJqVThW?=
 =?utf-8?B?WlY3ZzNVdXdpRmtrV3NVbUhxZ0l3cTNBSDI2SWF6L3E2QTFYa2RKaVdWeXEv?=
 =?utf-8?B?WGZWaW9CTHlaTTBGaDVqbGlUZjRmNVQwV0V4OWlsRmhvdkpmNDZFdVpaUUMv?=
 =?utf-8?B?bnZCSU5EK1k5b2VKTTZiK0RQWCtMeGkzVkxDbjVQaUJka0tsTTR4UDVOYTZF?=
 =?utf-8?B?L2pBeGpkeCtnd1M3d2NxS3pOdXEyNkJORHZIMk1RPT0=?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3166F3485FB8344B91DE2F6751A0483F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511da844-5f99-4223-8ef5-08d8c1b7176d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 04:58:58.8277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YSSfIyIFwLC4kbmzZT40zBKcRx1KFDVoBu8h8Z1OZnFn7AQ2NULL/vrInvX2E2bg0XVgzXnZy3uYzyRJT64Ezw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6157
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=653775e38=Dmitry.Fomichev@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlLCAyMDIxLTAxLTE5IGF0IDE0OjU1ICswMTAwLCBLbGF1cyBKZW5zZW4gd3JvdGU6DQo+
IEZyb206IEtsYXVzIEplbnNlbiA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQo+IA0KPiBSZWZhY3Rv
ciB0aGUgem9uZSB3cml0ZSBjaGVjayBsb2dpYyBzdWNoIHRoYXQgdGhlIG1vc3QgIm1lYW5pbmdm
dWwiDQo+IGVycm9yIGlzIHJldHVybmVkIGZpcnN0LiBUaGF0IGlzLCBmaXJzdCwgaWYgdGhlIHpv
bmUgaXMgbm90IHdyaXRhYmxlLA0KPiByZXR1cm4gYW4gYXBwcm9wcmlhdGUgc3RhdHVzIGNvZGUg
Zm9yIHRoYXQuIFRoZW4sIG1ha2Ugc3VyZSB3ZSBhcmUNCj4gYWN0dWFsbHkgd3JpdGluZyBhdCB0
aGUgd3JpdGUgcG9pbnRlciBhbmQgZmluYWxseSBjaGVjayB0aGF0IHdlIGRvIG5vdA0KPiBjcm9z
cyB0aGUgem9uZSB3cml0ZSBib3VuZGFyeS4gVGhpcyBhbGlnbnMgd2l0aCB0aGUgInByaW9yaXR5
IiBvZiBzdGF0dXMNCj4gY29kZXMgZm9yIHpvbmUgcmVhZCBjaGVja3MuDQoNClJpZ2h0LCBhbGwg
Ym91bmRhcnkgY2hlY2tzIG5lZWQgdG8gYmUgcGVyZm9ybWVkIGFmdGVyIHZhbGlkYXRpbmcgdGhl
IHpvbmUNCnN0YXRlIGFuZCBXUCBjaGVja3MuIA0KDQo+IA0KPiBBbHNvIGFkZCBhIGNvdXBsZSBv
ZiBhZGRpdGlvbmFsIGRlc2NyaXB0aXZlIHRyYWNlIGV2ZW50cyBhbmQgcmVtb3ZlIGFuDQo+IGFs
d2F5cyB0cnVlIGFzc2VydC4NCg0KQWRkaW5nIHRoZSBuZXcgdHJhY2UgZXZlbnRzIGxvb2tzIGxp
a2UgYSBncmVhdCBpZGVhLiBJIHRoaW5rIHRoYXQgYXNzZXJ0DQppcyB1c2VmdWwsIGJ1dCBJIGhh
dmUgbm8gcXVhbG1zIGFib3V0IHJlbW92aW5nIGl0Lg0KDQpPdmVyYWxsLCB0aGlzIGxvb2tzIGdv
b2QgdG8gbWUsIGV4Y2VwdCB0aGUgcGFydCBhYm91dCBvcGVuIGNvZGluZw0KWkEgdmFsaWRhdGlv
biA6KQ0KDQpCZXN0IHJlZ2FyZHMsDQpEbWl0cnkNCg0KPiANCj4gQ2M6IERtaXRyeSBGb21pY2hl
diA8ZG1pdHJ5LmZvbWljaGV2QHdkYy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEtsYXVzIEplbnNl
biA8ay5qZW5zZW5Ac2Ftc3VuZy5jb20+DQo+IC0tLQ0KPiDCoGh3L2Jsb2NrL252bWUuYyAgICAg
ICB8IDQ3ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gwqBo
dy9ibG9jay90cmFjZS1ldmVudHMgfCAgNSArKysrKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMjYg
aW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvYmxv
Y2svbnZtZS5jIGIvaHcvYmxvY2svbnZtZS5jDQo+IGluZGV4IGYwNWRlYTY1N2IwMS4uMTkzYTI3
MjU5ZGRhIDEwMDY0NA0KPiAtLS0gYS9ody9ibG9jay9udm1lLmMNCj4gKysrIGIvaHcvYmxvY2sv
bnZtZS5jDQo+IEBAIC0xMTA2LDU2ICsxMTA2LDUxIEBAIHN0YXRpYyBpbmxpbmUgTnZtZVpvbmUg
Km52bWVfZ2V0X3pvbmVfYnlfc2xiYShOdm1lTmFtZXNwYWNlICpucywgdWludDY0X3Qgc2xiYSkN
Cj4gwqANCj4gDQo+IA0KPiANCj4gwqBzdGF0aWMgdWludDE2X3QgbnZtZV9jaGVja196b25lX3N0
YXRlX2Zvcl93cml0ZShOdm1lWm9uZSAqem9uZSkNCj4gwqB7DQo+IC0gICAgdWludDE2X3Qgc3Rh
dHVzOw0KPiArICAgIHVpbnQ2NF90IHpzbGJhID0gem9uZS0+ZC56c2xiYTsNCj4gwqANCj4gDQo+
IA0KPiANCj4gwqDCoMKgwqDCoHN3aXRjaCAobnZtZV9nZXRfem9uZV9zdGF0ZSh6b25lKSkgew0K
PiDCoMKgwqDCoMKgY2FzZSBOVk1FX1pPTkVfU1RBVEVfRU1QVFk6DQo+IMKgwqDCoMKgwqBjYXNl
IE5WTUVfWk9ORV9TVEFURV9JTVBMSUNJVExZX09QRU46DQo+IMKgwqDCoMKgwqBjYXNlIE5WTUVf
Wk9ORV9TVEFURV9FWFBMSUNJVExZX09QRU46DQo+IMKgwqDCoMKgwqBjYXNlIE5WTUVfWk9ORV9T
VEFURV9DTE9TRUQ6DQo+IC0gICAgICAgIHN0YXR1cyA9IE5WTUVfU1VDQ0VTUzsNCj4gLSAgICAg
ICAgYnJlYWs7DQo+ICsgICAgICAgIHJldHVybiBOVk1FX1NVQ0NFU1M7DQo+IMKgwqDCoMKgwqBj
YXNlIE5WTUVfWk9ORV9TVEFURV9GVUxMOg0KPiAtICAgICAgICBzdGF0dXMgPSBOVk1FX1pPTkVf
RlVMTDsNCj4gLSAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgIHRyYWNlX3BjaV9udm1lX2Vycl96
b25lX2lzX2Z1bGwoenNsYmEpOw0KPiArICAgICAgICByZXR1cm4gTlZNRV9aT05FX0ZVTEw7DQo+
IMKgwqDCoMKgwqBjYXNlIE5WTUVfWk9ORV9TVEFURV9PRkZMSU5FOg0KPiAtICAgICAgICBzdGF0
dXMgPSBOVk1FX1pPTkVfT0ZGTElORTsNCj4gLSAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgIHRy
YWNlX3BjaV9udm1lX2Vycl96b25lX2lzX29mZmxpbmUoenNsYmEpOw0KPiArICAgICAgICByZXR1
cm4gTlZNRV9aT05FX09GRkxJTkU7DQo+IMKgwqDCoMKgwqBjYXNlIE5WTUVfWk9ORV9TVEFURV9S
RUFEX09OTFk6DQo+IC0gICAgICAgIHN0YXR1cyA9IE5WTUVfWk9ORV9SRUFEX09OTFk7DQo+IC0g
ICAgICAgIGJyZWFrOw0KPiArICAgICAgICB0cmFjZV9wY2lfbnZtZV9lcnJfem9uZV9pc19yZWFk
X29ubHkoenNsYmEpOw0KPiArICAgICAgICByZXR1cm4gTlZNRV9aT05FX1JFQURfT05MWTsNCj4g
wqDCoMKgwqDCoGRlZmF1bHQ6DQo+IMKgwqDCoMKgwqDCoMKgwqDCoGFzc2VydChmYWxzZSk7DQo+
IMKgwqDCoMKgwqB9DQo+IC0NCj4gLSAgICByZXR1cm4gc3RhdHVzOw0KPiDCoH0NCj4gwqANCj4g
wqBzdGF0aWMgdWludDE2X3QgbnZtZV9jaGVja196b25lX3dyaXRlKE52bWVDdHJsICpuLCBOdm1l
TmFtZXNwYWNlICpucywNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTnZtZVpvbmUgKnpvbmUsIHVp
bnQ2NF90IHNsYmEsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVpbnQzMl90IG5sYikNCj4gwqB7
DQo+ICsgICAgdWludDY0X3QgemNhcCA9IG52bWVfem9uZV93cl9ib3VuZGFyeSh6b25lKTsNCj4g
wqDCoMKgwqDCoHVpbnQxNl90IHN0YXR1czsNCj4gwqANCj4gDQo+IA0KPiANCj4gLSAgICBpZiAo
dW5saWtlbHkoKHNsYmEgKyBubGIpID4gbnZtZV96b25lX3dyX2JvdW5kYXJ5KHpvbmUpKSkgew0K
PiAtICAgICAgICBzdGF0dXMgPSBOVk1FX1pPTkVfQk9VTkRBUllfRVJST1I7DQo+IC0gICAgfSBl
bHNlIHsNCj4gLSAgICAgICAgc3RhdHVzID0gbnZtZV9jaGVja196b25lX3N0YXRlX2Zvcl93cml0
ZSh6b25lKTsNCj4gKyAgICBzdGF0dXMgPSBudm1lX2NoZWNrX3pvbmVfc3RhdGVfZm9yX3dyaXRl
KHpvbmUpOw0KPiArICAgIGlmIChzdGF0dXMpIHsNCj4gKyAgICAgICAgcmV0dXJuIHN0YXR1czsN
Cj4gwqDCoMKgwqDCoH0NCj4gwqANCj4gDQo+IA0KPiANCj4gLSAgICBpZiAoc3RhdHVzICE9IE5W
TUVfU1VDQ0VTUykgew0KPiAtICAgICAgICB0cmFjZV9wY2lfbnZtZV9lcnJfem9uZV93cml0ZV9u
b3Rfb2soc2xiYSwgbmxiLCBzdGF0dXMpOw0KPiAtICAgIH0gZWxzZSB7DQo+IC0gICAgICAgIGFz
c2VydChudm1lX3dwX2lzX3ZhbGlkKHpvbmUpKTsNCj4gLQ0KPiAtICAgICAgICBpZiAodW5saWtl
bHkoc2xiYSAhPSB6b25lLT53X3B0cikpIHsNCj4gLSAgICAgICAgICAgIHRyYWNlX3BjaV9udm1l
X2Vycl93cml0ZV9ub3RfYXRfd3Aoc2xiYSwgem9uZS0+ZC56c2xiYSwNCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgem9uZS0+d19wdHIpOw0KPiAtICAg
ICAgICAgICAgc3RhdHVzID0gTlZNRV9aT05FX0lOVkFMSURfV1JJVEU7DQo+IC0gICAgICAgIH0N
Cj4gKyAgICBpZiAodW5saWtlbHkoc2xiYSAhPSB6b25lLT53X3B0cikpIHsNCj4gKyAgICAgICAg
dHJhY2VfcGNpX252bWVfZXJyX3dyaXRlX25vdF9hdF93cChzbGJhLCB6b25lLT5kLnpzbGJhLCB6
b25lLT53X3B0cik7DQo+ICsgICAgICAgIHJldHVybiBOVk1FX1pPTkVfSU5WQUxJRF9XUklURTsN
Cj4gwqDCoMKgwqDCoH0NCj4gwqANCj4gDQo+IA0KPiANCj4gLSAgICByZXR1cm4gc3RhdHVzOw0K
PiArICAgIGlmICh1bmxpa2VseSgoc2xiYSArIG5sYikgPiB6Y2FwKSkgew0KPiArICAgICAgICB0
cmFjZV9wY2lfbnZtZV9lcnJfem9uZV9ib3VuZGFyeShzbGJhLCBubGIsIHpjYXApOw0KPiArICAg
ICAgICByZXR1cm4gTlZNRV9aT05FX0JPVU5EQVJZX0VSUk9SOw0KPiArICAgIH0NCj4gKw0KPiAr
ICAgIHJldHVybiBOVk1FX1NVQ0NFU1M7DQo+IMKgfQ0KPiDCoA0KPiANCj4gwqBzdGF0aWMgdWlu
dDE2X3QgbnZtZV9jaGVja196b25lX3N0YXRlX2Zvcl9yZWFkKE52bWVab25lICp6b25lKQ0KPiBk
aWZmIC0tZ2l0IGEvaHcvYmxvY2svdHJhY2UtZXZlbnRzIGIvaHcvYmxvY2svdHJhY2UtZXZlbnRz
DQo+IGluZGV4IDc4ZDc2YjBhNzFjMS4uYzgwYjAyYjg1YWM5IDEwMDY0NA0KPiAtLS0gYS9ody9i
bG9jay90cmFjZS1ldmVudHMNCj4gKysrIGIvaHcvYmxvY2svdHJhY2UtZXZlbnRzDQo+IEBAIC0x
MjcsNiArMTI3LDExIEBAIHBjaV9udm1lX2Vycl91bmFsaWduZWRfem9uZV9jbWQodWludDhfdCBh
Y3Rpb24sIHVpbnQ2NF90IHNsYmEsIHVpbnQ2NF90IHpzbGJhKSAiDQo+IMKgcGNpX252bWVfZXJy
X2ludmFsaWRfem9uZV9zdGF0ZV90cmFuc2l0aW9uKHVpbnQ4X3QgYWN0aW9uLCB1aW50NjRfdCBz
bGJhLCB1aW50OF90IGF0dHJzKSAiYWN0aW9uPTB4JSJQUkl4OCIsIHNsYmE9JSJQUkl1NjQiLCBh
dHRycz0weCUiUFJJeDMyIiINCj4gwqBwY2lfbnZtZV9lcnJfd3JpdGVfbm90X2F0X3dwKHVpbnQ2
NF90IHNsYmEsIHVpbnQ2NF90IHpvbmUsIHVpbnQ2NF90IHdwKSAid3JpdGluZyBhdCBzbGJhPSUi
UFJJdTY0Iiwgem9uZT0lIlBSSXU2NCIsIGJ1dCB3cD0lIlBSSXU2NCIiDQo+IMKgcGNpX252bWVf
ZXJyX2FwcGVuZF9ub3RfYXRfc3RhcnQodWludDY0X3Qgc2xiYSwgdWludDY0X3Qgem9uZSkgImFw
cGVuZGluZyBhdCBzbGJhPSUiUFJJdTY0IiwgYnV0IHpvbmU9JSJQUkl1NjQiIg0KPiArcGNpX252
bWVfZXJyX3pvbmVfaXNfZnVsbCh1aW50NjRfdCB6c2xiYSkgInpzbGJhIDB4JSJQUkl4NjQiIg0K
PiArcGNpX252bWVfZXJyX3pvbmVfaXNfcmVhZF9vbmx5KHVpbnQ2NF90IHpzbGJhKSAienNsYmEg
MHglIlBSSXg2NCIiDQo+ICtwY2lfbnZtZV9lcnJfem9uZV9pc19vZmZsaW5lKHVpbnQ2NF90IHpz
bGJhKSAienNsYmEgMHglIlBSSXg2NCIiDQo+ICtwY2lfbnZtZV9lcnJfem9uZV9ib3VuZGFyeSh1
aW50NjRfdCBzbGJhLCB1aW50MzJfdCBubGIsIHVpbnQ2NF90IHpjYXApICJsYmEgMHglIlBSSXg2
NCIgbmxiICUiUFJJdTMyIiB6Y2FwIDB4JSJQUkl4NjQiIg0KPiArcGNpX252bWVfZXJyX3pvbmVf
aW52YWxpZF93cml0ZSh1aW50NjRfdCBzbGJhLCB1aW50NjRfdCB3cCkgImxiYSAweCUiUFJJeDY0
IiB3cCAweCUiUFJJeDY0IiINCj4gwqBwY2lfbnZtZV9lcnJfem9uZV93cml0ZV9ub3Rfb2sodWlu
dDY0X3Qgc2xiYSwgdWludDMyX3QgbmxiLCB1aW50MzJfdCBzdGF0dXMpICJzbGJhPSUiUFJJdTY0
IiwgbmxiPSUiUFJJdTMyIiwgc3RhdHVzPTB4JSJQUkl4MTYiIg0KPiDCoHBjaV9udm1lX2Vycl96
b25lX3JlYWRfbm90X29rKHVpbnQ2NF90IHNsYmEsIHVpbnQzMl90IG5sYiwgdWludDMyX3Qgc3Rh
dHVzKSAic2xiYT0lIlBSSXU2NCIsIG5sYj0lIlBSSXUzMiIsIHN0YXR1cz0weCUiUFJJeDE2IiIN
Cj4gwqBwY2lfbnZtZV9lcnJfYXBwZW5kX3Rvb19sYXJnZSh1aW50NjRfdCBzbGJhLCB1aW50MzJf
dCBubGIsIHVpbnQ4X3QgemFzbCkgInNsYmE9JSJQUkl1NjQiLCBubGI9JSJQUkl1MzIiLCB6YXNs
PSUiUFJJdTgiIg0KDQo=

