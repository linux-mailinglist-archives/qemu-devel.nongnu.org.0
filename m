Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5844930339C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 06:01:18 +0100 (CET)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4GTd-00037t-CD
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 00:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=Dmitry.Fomichev@wdc.com>)
 id 1l4GRd-0002Bh-C6; Mon, 25 Jan 2021 23:59:13 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=Dmitry.Fomichev@wdc.com>)
 id 1l4GRb-0005eI-CX; Mon, 25 Jan 2021 23:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611637152; x=1643173152;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CY2bYPobvPkYo5li0FPOurCGUFSozO+VdwpAYPC9fRs=;
 b=Xi3+WAX1y5VSA5R1Rxl4XOiqRth9ayf9Ficsqf+SbNGZ8YOaeGXVKHYq
 QuifgZZd1gyezz3qkWPwe4bYz7cJQEiIe2Y52oj3Tpu4IGayXscBzy481
 xbTljqIEp23JrjgVXUWwMni/UloNhfxUpzfsavfmkyHDr3w6ztSoxI7/K
 86t/Brvhpe9pzvQbjbbhySI/pDLqn93h2eFa2GkdH8CmYqC7CXr5RrQqr
 bROqHGDjmwqpe5NVpSr+uqa5gwmS6qGE6i+tfr87uKUDIIoKYRj/bY3ru
 5r2JpNl+zDjnQk3m/33lUqVnTWKFyxELCEqNoSSczJFwwuAaqvKmwS+QW Q==;
IronPort-SDR: bYLlhhS5Y19mK0DQFjw+fZyPogaeNhGy7m1SbPj5ycWGMdiKM0Q0lYcwpKobbGTlSqm8V0iq7r
 GAMsF+6ily9PY1g8ACVeadozev8KJJ3bvs6Ioa10sKl6xy582gQaGQbtXIi7PPnM+cCOy5E8Dm
 XssJE0M/BGWOAN9C6pS2HiDhu6yaJdidIpr8L567OG2vufpw/Eh7SNTfjCSBjDSzwyROQYesEc
 yMUrxZtk202jV6LAJPDSX4L0bgEm1pVl5mVdd3L5B3qCQhRnlvZmK4PZR2GkYsB/fZ0h+wrSLh
 Qdk=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="159493066"
Received: from mail-bn8nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.177])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 12:59:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDjeuZ33zJd/vCzNmb5w5Q2I5fg3zxGZQ1AgZiE48gfeyeycpnViTo2IXn3FXFvsDDLdO0e/F/S70d1nEOvNkEs03PBECglXCCaJVkPyC2xLlQM+RD9ScRTAx3IPkgT1BFmnz22OaQp+iC0hohJjXreh6ptco+YoDPiTSM3oE6WV9Z58163HUQlvoji95b06OvzALndJm3p273PJm8jEd1MZfLapdowACnDa0nHpgqYwCI9Sp7w4r06toO2uUqX4LLAHUaPgouaE3Strg5VaNu0VSc460hHKEgA7PHlU5XoPo1db/KTa0Lb/neTtlwu3FWgrlvK+41j+0hiAW96oMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CY2bYPobvPkYo5li0FPOurCGUFSozO+VdwpAYPC9fRs=;
 b=ITCG6GXJJa+14SN2BkaXViqpt81e7U8VYSxsaYsN55a/nqzOPexIalGVQfs1xky23omQxEVkFsEWTtbJcg129+TLg4GdfhVRljMpfr++lg9+3sYoiOkVdRcXRh4ds3ohkk2WNO0knG5SRIBHHWkIcRtj9ovojOQmbWxxUYYt1LY7bx3R9wVoJ4+OmHf3ujebOTs5lw2ZGdw8gtQQ90X7tNRIyxfQ+PY1tbiYIqBHeSK0xFgYEE6yX6A0V0D+06zGo0Xe1GxYI7xHkbMCEKhZPzgYV2wBFhLuL6WFMSJhHm5qGmZZgTxk1VB4e4MgoMspf6Wlkhq+818Kl42nvTvrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CY2bYPobvPkYo5li0FPOurCGUFSozO+VdwpAYPC9fRs=;
 b=fIRmuvzMF2Nv9H2A8cmgpjJlVqaauHFJPQWZZ/kJtmsxP2P9FNOYPGyW2X1Lr58pJGQmHpBT67hZ9ZgMzkqxbXqAlrLSCNfZZFsKByRI/nMPBy6seSYi5D+gL+RxgewibSSCVNLP5rXws6lQxyijLAB/eJfAQJ82ikz38zmMIns=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MN2PR04MB6157.namprd04.prod.outlook.com (2603:10b6:208:dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 04:59:08 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617%4]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 04:59:07 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "its@irrelevant.dk" <its@irrelevant.dk>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 3/3] hw/block/nvme: align with existing style
Thread-Topic: [PATCH 3/3] hw/block/nvme: align with existing style
Thread-Index: AQHW8vM/rYBuaHCamEKDLyaorJ4uLqo5Wg2A
Date: Tue, 26 Jan 2021 04:59:07 +0000
Message-ID: <d9e7de21ed4586659e162f022b30f29cbbf3a3d7.camel@wdc.com>
References: <20210125082227.20160-1-its@irrelevant.dk>
 <20210125082227.20160-4-its@irrelevant.dk>
In-Reply-To: <20210125082227.20160-4-its@irrelevant.dk>
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
x-ms-office365-filtering-correlation-id: 556e3810-c78f-4354-b6a1-08d8c1b71cd6
x-ms-traffictypediagnostic: MN2PR04MB6157:
x-microsoft-antispam-prvs: <MN2PR04MB6157A7FF6B7E55F2E2D58FACE1BC9@MN2PR04MB6157.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w1aCuxgzx80XT+JOt2lPgOBHaH1adtTRKWYMg+P5PY96aaAUwUudQuZP2IzqTztWG0m2l20guK54kveKX3x6bEA1CAfXyvfuulZByIWn05wTfJ182BS6tJpImIh/2tt8+30hCHwv5atDkOXzioPVXy2VSAD2jWQ/+J9zMCeB7sNkixFTD0LEe5Skk+6naR8eJC7lewSHSvHgE98QG7UIo94OyCvfNSmc8R2YSCZaBqGb29csMSz0kFdK8lB8oal0CGuGjmfiLWejDVho2YGb11WzEBDH4gbMZph8kTy2tSuTuvLHFjjVb2lc+PT16lnF4uFv93hUqm9bRBevl7q4xjeP4D+LTxOXdH2zTQiZqZR64o3OwKJEMc9+LPoF9kMXIc8KNpzO1mmmuzFyjxT9YA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(5660300002)(4326008)(6506007)(76116006)(6512007)(83380400001)(6486002)(66556008)(66476007)(66446008)(64756008)(66946007)(186003)(26005)(36756003)(2616005)(8676002)(2906002)(8936002)(478600001)(110136005)(54906003)(86362001)(71200400001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?d0U4SjRYQTladlRZZ1dqNUVqbHpkMjZ1S2Q2ejZFUDhPMG95VlBlaDE1Rksx?=
 =?utf-8?B?dk5HMUY1YUZEUkoxMkNBQ21IR3lSR2lPQmhLaitCZ0x4bXlIc0FnaklOdW8y?=
 =?utf-8?B?d2RwRTMyVnk2ek5HNmlhSTJDVnFxWElnRzZZcmlYalQ0a3RsMEN4S1BzS2Ju?=
 =?utf-8?B?emxqbU05NElNMHdBakVTT2ljS1FqcVR5cVpnbnlSbHJ6cXNmQ1ZUZjE5SlRv?=
 =?utf-8?B?VnpIUzg0Qk5KZHB5azJBY3lpWGJ0Zytsa201cHQ0RXZrZS9rMTBmQ2NzWUZy?=
 =?utf-8?B?NXUvNmVFUUg1L09aRlRLWW11Zk1mWitJZ0wxU212aXhaeEVhU1RkeU9GNU9h?=
 =?utf-8?B?Mm83YjJhYTQ2ZWVUT001Z2ROOExMazBkdENDTGFLRnNmWWR3RHJERXltbkRs?=
 =?utf-8?B?NE5iTnM0NVp2anNBWXpnVGxsU2dZQm5QZGl2R2Y0SkN6WnNaRS94UGd6TDgw?=
 =?utf-8?B?Q3V4dThaOVRWczFicGpMVFdOaDZad1NlZUFMZlhXTXBLMzB4MXpJOGw2QVNr?=
 =?utf-8?B?TnNsRWN5U2djcjlOc2EzRGx2Y0JjTGF5WHNRckdMek5EYjlDTU16M3ZxZ2xU?=
 =?utf-8?B?R1V6bkpMekdJYWxubnNuTFlOWG45WHFMaXdMYWFGMkR1NXlBWERvSTRTNkNr?=
 =?utf-8?B?NU5meURSM1J6eDFXeU44NXJkUkwxKzhIczJVYjlSUnhiNGxrZWhNMlZuRkp3?=
 =?utf-8?B?eXpOaE0wR3VHM2FUMHZ2S1U5MHFUT1ZadW5VbTUvdWUya0xCeEIvSVczLzNP?=
 =?utf-8?B?NU9LNXFKczMxcDRENHRVQ0tHY1FFSlpHallkQU5hM1h1OFdZRlYrMmtDNXkr?=
 =?utf-8?B?MEJNdVpJeklkbzNncUlxczdOWHFaZ0NpOUxsZlVkelluRVV4R040RmVsa3U5?=
 =?utf-8?B?ZXVnQ0ZiYWF2TE84YW50NENqcXBOZHN1UG9OU21tUmFVR1drSFpWaWVLUFMv?=
 =?utf-8?B?NU5uMUlvZlJaMERtUmxoYkFTVlFNaGZWd3JTZjFvWmtZTGJMZi9BQnBuQnZB?=
 =?utf-8?B?cm5FcnkxUlZnYzV0cy9CUE10aEtUVkgxMEZaTkFPRzluY05IMWE2TFRkVm54?=
 =?utf-8?B?SHBSenF0QklEckpBSHVubG5odGpnVDNzcld6UVlPUFptOGZQOVNoeXBFUlZv?=
 =?utf-8?B?L0gxR010Zk51RDJpTGNtdzFzYk5NWFpkV1lhWmVLTTZPQWhvblFoQzA2QmNt?=
 =?utf-8?B?VC83Z01Fb09oWFB3ZG1ZNXhONWtUdEdSejlhakw3akFIdTJFRmY5cmt4TnlW?=
 =?utf-8?B?RS8rU0pSd0k3UFNlTEtWUmg5UlJMcldmQnJQakp3b2d2WkxaSjhOWVY3Rjcr?=
 =?utf-8?B?Tlh1QkJnK09WZnBxTWwwVGcwNEJ3SEFaK3VQN1ZLNDB6NjZock5YZ3RrOElY?=
 =?utf-8?B?NmU4a29GNEQrN3UwYjVnVGZlWjZ4U2xtVm1NMkRlWi81SkhCOWZHV1pVZGdI?=
 =?utf-8?B?cnBsY0JJMldaMGF1RDNGd1J5eE9xUzBwNEJzVGRnPT0=?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D79E0E2F4577441884F29CCE86F69A2@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556e3810-c78f-4354-b6a1-08d8c1b71cd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 04:59:07.8775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jq12qlCKDc+2P93k83HeJUdtWdOS58AxOv02OeiTgZX1QOk5XLtnOGBgPK5OOQX63BJDfIetuMXckIUZcmezIA==
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
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "anaidu.gollu@samsung.com" <anaidu.gollu@samsung.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gTW9uLCAyMDIxLTAxLTI1IGF0IDA5OjIyICswMTAwLCBLbGF1cyBKZW5zZW4gd3JvdGU6DQo+
IEZyb206IEdvbGx1IEFwcGFsYW5haWR1IDxhbmFpZHUuZ29sbHVAc2Ftc3VuZy5jb20+DQo+IA0K
PiBDaGFuZ2Ugc3RhdHVzIGNoZWNrcyB0byBhbGlnbiB3aXRoIHRoZSBleGlzdGluZyBzdHlsZSBh
bmQgcmVtb3ZlIHRoZQ0KPiBleHBsaWNpdCBjaGVjayBhZ2FpbnN0IE5WTUVfU1VDQ0VTUy4NCj4g
DQo+IENjOiBEbWl0cnkgRm9taWNoZXYgPGRtaXRyeS5mb21pY2hldkB3ZGMuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBHb2xsdSBBcHBhbGFuYWlkdSA8YW5haWR1LmdvbGx1QHNhbXN1bmcuY29tPg0K
PiBSZXZpZXdlZC1ieTogS2xhdXMgSmVuc2VuIDxrLmplbnNlbkBzYW1zdW5nLmNvbT4NCg0KTG9v
a3MgZ29vZC4NClJldmlld2VkLWJ5OiBEbWl0cnkgRm9taWNoZXYgPGRtaXRyeS5mb21pY2hldkB3
ZGMuY29tPg0KDQo+IC0tLQ0KPiDCoGh3L2Jsb2NrL252bWUuYyB8IDIwICsrKysrKysrKystLS0t
LS0tLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L2Jsb2NrL252bWUuYyBiL2h3L2Jsb2NrL252bWUu
Yw0KPiBpbmRleCAxYmU1YjU0ZTBmZWQuLjk4ZDg0ZmUyNjY0NCAxMDA2NDQNCj4gLS0tIGEvaHcv
YmxvY2svbnZtZS5jDQo+ICsrKyBiL2h3L2Jsb2NrL252bWUuYw0KPiBAQCAtMTE5OCw3ICsxMTk4
LDcgQEAgc3RhdGljIHVpbnQxNl90IG52bWVfY2hlY2tfem9uZV93cml0ZShOdm1lQ3RybCAqbiwg
TnZtZU5hbWVzcGFjZSAqbnMsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoHN0YXR1cyA9IG52bWVfY2hl
Y2tfem9uZV9zdGF0ZV9mb3Jfd3JpdGUoem9uZSk7DQo+IMKgwqDCoMKgwqB9DQo+IMKgDQo+IA0K
PiANCj4gDQo+IC0gICAgaWYgKHN0YXR1cyAhPSBOVk1FX1NVQ0NFU1MpIHsNCj4gKyAgICBpZiAo
c3RhdHVzKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoHRyYWNlX3BjaV9udm1lX2Vycl96b25lX3dy
aXRlX25vdF9vayhzbGJhLCBubGIsIHN0YXR1cyk7DQo+IMKgwqDCoMKgwqB9IGVsc2Ugew0KPiDC
oMKgwqDCoMKgwqDCoMKgwqBhc3NlcnQobnZtZV93cF9pc192YWxpZCh6b25lKSk7DQo+IEBAIC0x
MjUzLDcgKzEyNTMsNyBAQCBzdGF0aWMgdWludDE2X3QgbnZtZV9jaGVja196b25lX3JlYWQoTnZt
ZU5hbWVzcGFjZSAqbnMsIHVpbnQ2NF90IHNsYmEsDQo+IMKgwqDCoMKgwqB1aW50MTZfdCBzdGF0
dXM7DQo+IMKgDQo+IA0KPiANCj4gDQo+IMKgwqDCoMKgwqBzdGF0dXMgPSBudm1lX2NoZWNrX3pv
bmVfc3RhdGVfZm9yX3JlYWQoem9uZSk7DQo+IC0gICAgaWYgKHN0YXR1cyAhPSBOVk1FX1NVQ0NF
U1MpIHsNCj4gKyAgICBpZiAoc3RhdHVzKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoDsNCj4gwqDC
oMKgwqDCoH0gZWxzZSBpZiAodW5saWtlbHkoZW5kID4gYm5kcnkpKSB7DQo+IMKgwqDCoMKgwqDC
oMKgwqDCoGlmICghbnMtPnBhcmFtcy5jcm9zc196b25lX3JlYWQpIHsNCj4gQEAgLTEyNjYsNyAr
MTI2Niw3IEBAIHN0YXRpYyB1aW50MTZfdCBudm1lX2NoZWNrX3pvbmVfcmVhZChOdm1lTmFtZXNw
YWNlICpucywgdWludDY0X3Qgc2xiYSwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbyB7
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB6b25lKys7DQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSBudm1lX2NoZWNrX3pvbmVfc3RhdGVf
Zm9yX3JlYWQoem9uZSk7DQo+IC0gICAgICAgICAgICAgICAgaWYgKHN0YXR1cyAhPSBOVk1FX1NV
Q0NFU1MpIHsNCj4gKyAgICAgICAgICAgICAgICBpZiAoc3RhdHVzKSB7DQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOw0KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0gd2hpbGUg
KGVuZCA+IG52bWVfem9uZV9yZF9ib3VuZGFyeShucywgem9uZSkpOw0KPiBAQCAtMTY3Nyw3ICsx
Njc3LDcgQEAgc3RhdGljIHVpbnQxNl90IG52bWVfcmVhZChOdm1lQ3RybCAqbiwgTnZtZVJlcXVl
c3QgKnJlcSkNCj4gwqANCj4gDQo+IA0KPiANCj4gwqDCoMKgwqDCoGlmIChucy0+cGFyYW1zLnpv
bmVkKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoHN0YXR1cyA9IG52bWVfY2hlY2tfem9uZV9yZWFk
KG5zLCBzbGJhLCBubGIpOw0KPiAtICAgICAgICBpZiAoc3RhdHVzICE9IE5WTUVfU1VDQ0VTUykg
ew0KPiArICAgICAgICBpZiAoc3RhdHVzKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
dHJhY2VfcGNpX252bWVfZXJyX3pvbmVfcmVhZF9ub3Rfb2soc2xiYSwgbmxiLCBzdGF0dXMpOw0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gaW52YWxpZDsNCj4gwqDCoMKgwqDCoMKg
wqDCoMKgfQ0KPiBAQCAtMTc0OCwxMiArMTc0OCwxMiBAQCBzdGF0aWMgdWludDE2X3QgbnZtZV9k
b193cml0ZShOdm1lQ3RybCAqbiwgTnZtZVJlcXVlc3QgKnJlcSwgYm9vbCBhcHBlbmQsDQo+IMKg
wqDCoMKgwqDCoMKgwqDCoHpvbmUgPSBudm1lX2dldF96b25lX2J5X3NsYmEobnMsIHNsYmEpOw0K
PiDCoA0KPiANCj4gDQo+IA0KPiDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSBudm1lX2NoZWNr
X3pvbmVfd3JpdGUobiwgbnMsIHpvbmUsIHNsYmEsIG5sYiwgYXBwZW5kKTsNCj4gLSAgICAgICAg
aWYgKHN0YXR1cyAhPSBOVk1FX1NVQ0NFU1MpIHsNCj4gKyAgICAgICAgaWYgKHN0YXR1cykgew0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gaW52YWxpZDsNCj4gwqDCoMKgwqDCoMKg
wqDCoMKgfQ0KPiDCoA0KPiANCj4gDQo+IA0KPiDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSBu
dm1lX2F1dG9fb3Blbl96b25lKG5zLCB6b25lKTsNCj4gLSAgICAgICAgaWYgKHN0YXR1cyAhPSBO
Vk1FX1NVQ0NFU1MpIHsNCj4gKyAgICAgICAgaWYgKHN0YXR1cykgew0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGdvdG8gaW52YWxpZDsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0K
PiANCj4gDQo+IA0KPiBAQCAtMTg1MiwxNCArMTg1MiwxNCBAQCBzdGF0aWMgdWludDE2X3QgbnZt
ZV9vcGVuX3pvbmUoTnZtZU5hbWVzcGFjZSAqbnMsIE52bWVab25lICp6b25lLA0KPiDCoMKgwqDC
oMKgc3dpdGNoIChzdGF0ZSkgew0KPiDCoMKgwqDCoMKgY2FzZSBOVk1FX1pPTkVfU1RBVEVfRU1Q
VFk6DQo+IMKgwqDCoMKgwqDCoMKgwqDCoHN0YXR1cyA9IG52bWVfYW9yX2NoZWNrKG5zLCAxLCAw
KTsNCj4gLSAgICAgICAgaWYgKHN0YXR1cyAhPSBOVk1FX1NVQ0NFU1MpIHsNCj4gKyAgICAgICAg
aWYgKHN0YXR1cykgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBzdGF0dXM7
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gwqDCoMKgwqDCoMKgwqDCoMKgbnZtZV9hb3JfaW5j
X2FjdGl2ZShucyk7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoC8qIGZhbGwgdGhyb3VnaCAqLw0KPiDC
oMKgwqDCoMKgY2FzZSBOVk1FX1pPTkVfU1RBVEVfQ0xPU0VEOg0KPiDCoMKgwqDCoMKgwqDCoMKg
wqBzdGF0dXMgPSBudm1lX2Fvcl9jaGVjayhucywgMCwgMSk7DQo+IC0gICAgICAgIGlmIChzdGF0
dXMgIT0gTlZNRV9TVUNDRVNTKSB7DQo+ICsgICAgICAgIGlmIChzdGF0dXMpIHsNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoc3RhdGUgPT0gTlZNRV9aT05FX1NUQVRFX0VNUFRZKSB7
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBudm1lX2Fvcl9kZWNfYWN0aXZl
KG5zKTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+IEBAIC0xOTcyLDcgKzE5NzIs
NyBAQCBzdGF0aWMgdWludDE2X3QgbnZtZV9zZXRfemRfZXh0KE52bWVOYW1lc3BhY2UgKm5zLCBO
dm1lWm9uZSAqem9uZSkNCj4gwqANCj4gDQo+IA0KPiANCj4gwqDCoMKgwqDCoGlmIChzdGF0ZSA9
PSBOVk1FX1pPTkVfU1RBVEVfRU1QVFkpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVzID0g
bnZtZV9hb3JfY2hlY2sobnMsIDEsIDApOw0KPiAtICAgICAgICBpZiAoc3RhdHVzICE9IE5WTUVf
U1VDQ0VTUykgew0KPiArICAgICAgICBpZiAoc3RhdHVzKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIHN0YXR1czsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoMKgwqDC
oMKgwqDCoMKgwqBudm1lX2Fvcl9pbmNfYWN0aXZlKG5zKTsNCj4gQEAgLTMzMDEsNyArMzMwMSw3
IEBAIHN0YXRpYyB1aW50MTZfdCBudm1lX3NldF9mZWF0dXJlX3RpbWVzdGFtcChOdm1lQ3RybCAq
biwgTnZtZVJlcXVlc3QgKnJlcSkNCj4gwqANCj4gDQo+IA0KPiANCj4gwqDCoMKgwqDCoHJldCA9
IG52bWVfZG1hKG4sICh1aW50OF90ICopJnRpbWVzdGFtcCwgc2l6ZW9mKHRpbWVzdGFtcCksDQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBETUFfRElSRUNUSU9OX1RP
X0RFVklDRSwgcmVxKTsNCj4gLSAgICBpZiAocmV0ICE9IE5WTUVfU1VDQ0VTUykgew0KPiArICAg
IGlmIChyZXQpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCj4gwqDCoMKgwqDC
oH0NCj4gwqANCj4gDQo+IA0KPiANCg0K

