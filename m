Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F22FDF02
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 02:52:08 +0100 (CET)
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2P8q-0001kP-2S
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 20:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1l2P87-0001Lq-4A
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:51:23 -0500
Received: from mga09.intel.com ([134.134.136.24]:43143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1l2P85-000528-5X
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:51:22 -0500
IronPort-SDR: zbY/5rZv5bXQnQwe/72BBSuqNnPuIV6139d8qXTGpgEKjJbjYME83cOzzB6vj4bDiaZGsGv+4c
 BwPK93o4sgEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="179355682"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="179355682"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 17:50:56 -0800
IronPort-SDR: BkbV0nSnotTXdFZWYb7Wd+FtWnRtJAGEXIZklHRlduLmiEjwFHW4Q30xRZQ/gaogfjNthwntLZ
 sa5zgbM263Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="366586082"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga002.jf.intel.com with ESMTP; 20 Jan 2021 17:50:55 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 17:50:54 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 21 Jan 2021 09:50:52 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Thu, 21 Jan 2021 09:50:52 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Eric Blake <eblake@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-dev
 <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Thread-Topic: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Thread-Index: AQHW2ZH35CoUMePT00WBg9eX6s7M0aou+oMAgAKAn5A=
Date: Thu, 21 Jan 2021 01:50:52 +0000
Message-ID: <f2e078f0267e415581c639913937a931@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-2-chen.zhang@intel.com>
 <ae366160-74fe-ddbd-136b-d657a21007dd@redhat.com>
In-Reply-To: <ae366160-74fe-ddbd-136b-d657a21007dd@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBCbGFrZSA8ZWJs
YWtlQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyMCwgMjAyMSAzOjMz
IEFNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBKYXNvbiBXYW5n
DQo+IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgcWVtdS1kZXYgPHFlbXUtZGV2ZWxAbm9uZ251Lm9y
Zz47IERyLiBEYXZpZA0KPiBBbGFuIEdpbGJlcnQgPGRnaWxiZXJ0QHJlZGhhdC5jb20+OyBNYXJr
dXMgQXJtYnJ1c3Rlcg0KPiA8YXJtYnJ1QHJlZGhhdC5jb20+DQo+IENjOiBaaGFuZyBDaGVuIDx6
aGFuZ2NraWRAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gcWFwaS9uZXQ6
IEFkZCBuZXcgUU1QIGNvbW1hbmQgZm9yIENPTE8NCj4gcGFzc3Rocm91Z2gNCj4gDQo+IE9uIDEy
LzIzLzIwIDc6MDkgUE0sIFpoYW5nIENoZW4gd3JvdGU6DQo+ID4gRnJvbTogWmhhbmcgQ2hlbiA8
Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+ID4NCj4gPiBTaW5jZSB0aGUgcmVhbCB1c2VyIHNjZW5h
cmlvIGRvZXMgbm90IG5lZWQgdG8gbW9uaXRvciBhbGwgdHJhZmZpYy4NCj4gPiBBZGQgY29sby1w
YXNzdGhyb3VnaC1hZGQgYW5kIGNvbG8tcGFzc3Rocm91Z2gtZGVsIHRvIG1haW50YWluIGEgQ09M
Tw0KPiA+IG5ldHdvcmsgcGFzc3Rocm91Z2ggbGlzdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiANCj4gPiAtLS0gYS9xYXBpL25l
dC5qc29uDQo+ID4gKysrIGIvcWFwaS9uZXQuanNvbg0KPiA+IEBAIC03MTQsMyArNzE0LDQ5IEBA
DQo+ID4gICMjDQo+ID4gIHsgJ2V2ZW50JzogJ0ZBSUxPVkVSX05FR09USUFURUQnLA0KPiA+ICAg
ICdkYXRhJzogeydkZXZpY2UtaWQnOiAnc3RyJ30gfQ0KPiA+ICsNCj4gPiArIyMNCj4gPiArIyBA
Y29sby1wYXNzdGhyb3VnaC1hZGQ6DQo+ID4gKyMNCj4gPiArIyBBZGQgcGFzc3Rocm91Z2ggZW50
cnkgYWNjb3JkaW5nIHRvIGN1c3RvbWVyJ3MgbmVlZHMgaW4gQ09MTy1jb21wYXJlLg0KPiA+ICsj
DQo+ID4gKyMgQHByb3RvY29sOiBDT0xPIHBhc3N0aHJvdWdoIGp1c3Qgc3VwcG9ydCBUQ1AgYW5k
IFVEUC4NCj4gPiArIw0KPiA+ICsjIEBwb3J0OiBUQ1Agb3IgVURQIHBvcnQgbnVtYmVyLg0KPiA+
ICsjDQo+ID4gKyMgUmV0dXJuczogTm90aGluZyBvbiBzdWNjZXNzDQo+ID4gKyMNCj4gPiArIyBT
aW5jZTogNS4zDQo+IA0KPiBUaGUgbmV4dCByZWxlYXNlIGlzIDYuMCwgbm90IDUuMy4NCg0KTWlz
c2VkIHRoZSBwbGFuLCBJIHdpbGwgZml4IGl0IGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gPiAr
Iw0KPiA+ICsjIEV4YW1wbGU6DQo+ID4gKyMNCj4gPiArIyAtPiB7ICJleGVjdXRlIjogImNvbG8t
cGFzc3Rocm91Z2gtYWRkIiwNCj4gPiArIyAgICAgICJhcmd1bWVudHMiOiB7ICJwcm90b2NvbCI6
ICJ0Y3AiLCAicG9ydCI6IDMzODkgfSB9DQo+ID4gKyMgPC0geyAicmV0dXJuIjoge30gfQ0KPiA+
ICsjDQo+ID4gKyMjDQo+ID4gK3sgJ2NvbW1hbmQnOiAnY29sby1wYXNzdGhyb3VnaC1hZGQnLA0K
PiA+ICsgICAgICdkYXRhJzogeydwcm90b2NvbCc6ICdzdHInLCAncG9ydCc6ICd1aW50MzInfSB9
DQo+IA0KPiBTaG91bGQgJ3Byb3RvY29sJyBiZSBhbiBlbnVtIChmaW5pdGUgc2V0IG9mIHZhbHVl
cykgcmF0aGVyIHRoYW4gYW4gb3Blbi0NCj4gY29kZWQgc3RyaW5nIChpbmZpbml0ZSBudW1iZXIg
b2YgdmFsdWVzLCBldmVuIHRob3VnaCB5b3UgbWVudGlvbmVkIGluIHRoZQ0KPiBkb2NzIGFib3Zl
IHRoYXQgb25seSAndGNwJyBvciAndWRwJyBtYWtlIHNlbnNlKT8gIEluIGZhY3QsIGRvIHdlIGFs
cmVhZHkgaGF2ZQ0KPiBleGlzdGluZyBRQVBJIHR5cGVzIHJlcHJlc2VudGluZyB0Y3AvdWRwIGFu
ZCBhIHBvcnQgbnVtYmVyIHRoYXQgY291bGQgYmUNCj4gcmV1c2VkIGhlcmUsIHJhdGhlciB0aGFu
IG9wZW4tY29kaW5nIHlldCBhbm90aGVyIG9uZT8NCj4gDQoNCkkgY2hlY2tlZCBjdXJyZW50IFFB
UEkgY29kZSwgbG9va3Mgbm8gZXhpc3RpbmcgZW51bSBkZWZpbmVkLg0KSSB3aWxsIGFkZCB0aGUg
bmV3IGdlbmVyYWwgUUFQSSB0eXBlcyBpbiBuZXh0IHZlcnNpb24uDQoNClRoYW5rcw0KQ2hlbg0K
DQo+ID4gKw0KPiA+ICsjIw0KPiA+ICsjIEBjb2xvLXBhc3N0aHJvdWdoLWRlbDoNCj4gPiArIw0K
PiA+ICsjIERlbGV0ZSBwYXNzdGhyb3VnaCBlbnRyeSBhY2NvcmRpbmcgdG8gY3VzdG9tZXIncyBu
ZWVkcyBpbiBDT0xPLQ0KPiBjb21wYXJlLg0KPiA+ICsjDQo+ID4gKyMgQHByb3RvY29sOiBDT0xP
IHBhc3N0aHJvdWdoIGp1c3Qgc3VwcG9ydCBUQ1AgYW5kIFVEUC4NCj4gPiArIw0KPiA+ICsjIEBw
b3J0OiBUQ1Agb3IgVURQIHBvcnQgbnVtYmVyLg0KPiA+ICsjDQo+ID4gKyMgUmV0dXJuczogTm90
aGluZyBvbiBzdWNjZXNzDQo+ID4gKyMNCj4gPiArIyBTaW5jZTogNS4zDQo+IA0KPiBhbm90aGVy
IDYuMCBzcG90DQo+IA0KDQpPSy4NCg0KPiA+ICsjDQo+ID4gKyMgRXhhbXBsZToNCj4gPiArIw0K
PiA+ICsjIC0+IHsgImV4ZWN1dGUiOiAiY29sby1wYXNzdGhyb3VnaC1kZWwiLA0KPiA+ICsjICAg
ICAgImFyZ3VtZW50cyI6IHsgInByb3RvY29sIjogInRjcCIsICJwb3J0IjogMzM4OSB9IH0NCj4g
PiArIyA8LSB7ICJyZXR1cm4iOiB7fSB9DQo+ID4gKyMNCj4gPiArIyMNCj4gPiAreyAnY29tbWFu
ZCc6ICdjb2xvLXBhc3N0aHJvdWdoLWRlbCcsDQo+ID4gKyAgICAgJ2RhdGEnOiB7J3Byb3RvY29s
JzogJ3N0cicsICdwb3J0JzogJ3VpbnQzMid9IH0NCj4gPg0KPiANCj4gLS0NCj4gRXJpYyBCbGFr
ZSwgUHJpbmNpcGFsIFNvZnR3YXJlIEVuZ2luZWVyDQo+IFJlZCBIYXQsIEluYy4gICAgICAgICAg
ICsxLTkxOS0zMDEtMzIyNg0KPiBWaXJ0dWFsaXphdGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5v
cmcNCg0K

