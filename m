Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F12E3362
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 01:41:36 +0100 (CET)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktgbP-00064j-9f
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 19:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ktgZ0-0004gY-0w
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 19:39:07 -0500
Received: from mga07.intel.com ([134.134.136.100]:39712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ktgYx-0002tp-Ef
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 19:39:05 -0500
IronPort-SDR: Njl+NBePqiXPZdazKbFlV7N0jRl4/ssqBTagNNZzrgMugrkfThWWZlzZ76exPBvKQ7yRF7CDuL
 YXwdx/xRThqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9847"; a="240416004"
X-IronPort-AV: E=Sophos;i="5.78,453,1599548400"; d="scan'208";a="240416004"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2020 16:38:56 -0800
IronPort-SDR: kLWKZfFeAXz2VAFbY9jgJ2fRaTJgf+giTBDqLBMi78aExOzSPSTInxjLSb2a0/dD4eStFBzPZM
 U/lxVhEykYwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,453,1599548400"; d="scan'208";a="358367975"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 27 Dec 2020 16:38:56 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 27 Dec 2020 16:38:55 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Dec 2020 08:38:53 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Mon, 28 Dec 2020 08:38:53 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Eric
 Blake" <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Thread-Topic: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Thread-Index: AQHW2ZH35CoUMePT00WBg9eX6s7M0aoG0rqAgATaJwA=
Date: Mon, 28 Dec 2020 00:38:53 +0000
Message-ID: <a4adb965911348f4901f72e7e472c07e@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-2-chen.zhang@intel.com>
 <08fe5c51-1383-12dd-b255-151a868cd6d9@redhat.com>
In-Reply-To: <08fe5c51-1383-12dd-b255-151a868cd6d9@redhat.com>
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
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chen.zhang@intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAyNSwgMjAyMCAyOjIw
IFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBxZW11LWRldiA8
cWVtdS0NCj4gZGV2ZWxAbm9uZ251Lm9yZz47IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29t
PjsgRHIuIERhdmlkIEFsYW4NCj4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47IE1hcmt1
cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4NCj4gQ2M6IFpoYW5nIENoZW4gPHpoYW5n
Y2tpZEBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8zXSBxYXBpL25ldDogQWRk
IG5ldyBRTVAgY29tbWFuZCBmb3IgQ09MTw0KPiBwYXNzdGhyb3VnaA0KPiANCj4gDQo+IE9uIDIw
MjAvMTIvMjQg5LiK5Y2IOTowOSwgWmhhbmcgQ2hlbiB3cm90ZToNCj4gPiBGcm9tOiBaaGFuZyBD
aGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPg0KPiA+IFNpbmNlIHRoZSByZWFsIHVzZXIg
c2NlbmFyaW8gZG9lcyBub3QgbmVlZCB0byBtb25pdG9yIGFsbCB0cmFmZmljLg0KPiA+IEFkZCBj
b2xvLXBhc3N0aHJvdWdoLWFkZCBhbmQgY29sby1wYXNzdGhyb3VnaC1kZWwgdG8gbWFpbnRhaW4g
YSBDT0xPDQo+ID4gbmV0d29yayBwYXNzdGhyb3VnaCBsaXN0Lg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogWmhhbmcgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBu
ZXQvbmV0LmMgICAgIHwgMTIgKysrKysrKysrKysrDQo+ID4gICBxYXBpL25ldC5qc29uIHwgNDYN
Cj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
bmV0L25ldC5jIGIvbmV0L25ldC5jDQo+ID4gaW5kZXggZTEwMzVmMjFkMS4uZWFjN2E5MjYxOCAx
MDA2NDQNCj4gPiAtLS0gYS9uZXQvbmV0LmMNCj4gPiArKysgYi9uZXQvbmV0LmMNCj4gPiBAQCAt
MTE1MSw2ICsxMTUxLDE4IEBAIHZvaWQgcW1wX25ldGRldl9kZWwoY29uc3QgY2hhciAqaWQsIEVy
cm9yDQo+ICoqZXJycCkNCj4gPiAgICAgICBxZW11X2RlbF9uZXRfY2xpZW50KG5jKTsNCj4gPiAg
IH0NCj4gPg0KPiA+ICt2b2lkIHFtcF9jb2xvX3Bhc3N0aHJvdWdoX2FkZChjb25zdCBjaGFyICpw
cm90LCBjb25zdCB1aW50MzJfdCBwb3J0LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBFcnJvciAqKmVycnApIHsNCj4gPiArICAgIC8qIFNldHVwIHBhc3N0aHJvdWdoIGNvbm5l
Y3Rpb24gKi8gfQ0KPiA+ICsNCj4gPiArdm9pZCBxbXBfY29sb19wYXNzdGhyb3VnaF9kZWwoY29u
c3QgY2hhciAqcHJvdCwgY29uc3QgdWludDMyX3QgcG9ydCwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgRXJyb3IgKiplcnJwKSB7DQo+ID4gKyAgICAvKiBEZWxldGUgcGFzc3Ro
cm91Z2ggY29ubmVjdGlvbiAqLyB9DQo+ID4gKw0KPiA+ICAgc3RhdGljIHZvaWQgbmV0ZmlsdGVy
X3ByaW50X2luZm8oTW9uaXRvciAqbW9uLCBOZXRGaWx0ZXJTdGF0ZSAqbmYpDQo+ID4gICB7DQo+
ID4gICAgICAgY2hhciAqc3RyOw0KPiA+IGRpZmYgLS1naXQgYS9xYXBpL25ldC5qc29uIGIvcWFw
aS9uZXQuanNvbiBpbmRleA0KPiA+IGMzMTc0OGM4N2YuLjQ2NmMyOTcxNGUgMTAwNjQ0DQo+ID4g
LS0tIGEvcWFwaS9uZXQuanNvbg0KPiA+ICsrKyBiL3FhcGkvbmV0Lmpzb24NCj4gPiBAQCAtNzE0
LDMgKzcxNCw0OSBAQA0KPiA+ICAgIyMNCj4gPiAgIHsgJ2V2ZW50JzogJ0ZBSUxPVkVSX05FR09U
SUFURUQnLA0KPiA+ICAgICAnZGF0YSc6IHsnZGV2aWNlLWlkJzogJ3N0cid9IH0NCj4gPiArDQo+
ID4gKyMjDQo+ID4gKyMgQGNvbG8tcGFzc3Rocm91Z2gtYWRkOg0KPiA+ICsjDQo+ID4gKyMgQWRk
IHBhc3N0aHJvdWdoIGVudHJ5IGFjY29yZGluZyB0byBjdXN0b21lcidzIG5lZWRzIGluIENPTE8t
Y29tcGFyZS4NCj4gPiArIw0KPiA+ICsjIEBwcm90b2NvbDogQ09MTyBwYXNzdGhyb3VnaCBqdXN0
IHN1cHBvcnQgVENQIGFuZCBVRFAuDQo+ID4gKyMNCj4gPiArIyBAcG9ydDogVENQIG9yIFVEUCBw
b3J0IG51bWJlci4NCj4gPiArIw0KPiA+ICsjIFJldHVybnM6IE5vdGhpbmcgb24gc3VjY2Vzcw0K
PiA+ICsjDQo+ID4gKyMgU2luY2U6IDUuMw0KPiA+ICsjDQo+ID4gKyMgRXhhbXBsZToNCj4gPiAr
Iw0KPiA+ICsjIC0+IHsgImV4ZWN1dGUiOiAiY29sby1wYXNzdGhyb3VnaC1hZGQiLA0KPiA+ICsj
ICAgICAgImFyZ3VtZW50cyI6IHsgInByb3RvY29sIjogInRjcCIsICJwb3J0IjogMzM4OSB9IH0N
Cj4gPiArIyA8LSB7ICJyZXR1cm4iOiB7fSB9DQo+ID4gKyMNCj4gPiArIyMNCj4gPiAreyAnY29t
bWFuZCc6ICdjb2xvLXBhc3N0aHJvdWdoLWFkZCcsDQo+ID4gKyAgICAgJ2RhdGEnOiB7J3Byb3Rv
Y29sJzogJ3N0cicsICdwb3J0JzogJ3VpbnQzMid9IH0NCj4gDQo+IA0KPiBEbyB3ZSBwbGFuIHRv
IHN1cHBvcnQgNC10dXBsZSAoc3JjIGlwLHNyYyBwb3J0LCBkc3QgaXAsIGRzdCBwb3J0KSBpbiB0
aGUgZnV0dXJlPyBJZg0KPiB5ZXMsIGxldCdzIGFkZCB0aGVtIG5vdy4NCj4gDQo+IEFuZCBkbyB3
ZSBwbGFuIHRvIHN1cHBvcnQgd2lsZGNhcmQgaGVyZT8NCg0KSSB0aGluayBqdXN0IHVzaW5nIHRo
ZSBwb3J0IGlzIGVub3VnaCBmb3IgQ09MTyBjb21wYXJlLg0KQmVjYXVzZSBpbiB0aGlzIGNhc2Us
IHVzZXJzIG5lZWQgcGFzc3Rocm91Z2ggc29tZSBndWVzdCBzZXJ2aWNlcyBhcmUgZGlzdGluZ3Vp
c2hlZCBieSBzdGF0aWMgcG9ydHMuDQpBbmQgZm9yIHN1cHBvcnQgNC10dXBsZSBhbmQgd2lsZGNh
cmQgYXJlIGEgZ29vZCBxdWVzdGlvbiwgZG8geW91IHRoaW5rIHdlIHNob3VsZCBhZGQgc29tZSBw
YXNzdGhyb3VnaA0KTWVjaGFuaXNtIGZvciBhbGwgUWVtdSBuZXQgZmlsdGVyPyBJZiB5ZXMsIHdl
IHNob3VsZCBzdXBwb3J0IHRoYXQgaW4gdGhlIGZ1dHVyZS4NCg0KVGhhbmtzDQpDaGVuDQoNCj4g
DQo+IFRoYW5rcw0KPiANCj4gDQo+ID4gKw0KPiA+ICsjIw0KPiA+ICsjIEBjb2xvLXBhc3N0aHJv
dWdoLWRlbDoNCj4gPiArIw0KPiA+ICsjIERlbGV0ZSBwYXNzdGhyb3VnaCBlbnRyeSBhY2NvcmRp
bmcgdG8gY3VzdG9tZXIncyBuZWVkcyBpbiBDT0xPLQ0KPiBjb21wYXJlLg0KPiA+ICsjDQo+ID4g
KyMgQHByb3RvY29sOiBDT0xPIHBhc3N0aHJvdWdoIGp1c3Qgc3VwcG9ydCBUQ1AgYW5kIFVEUC4N
Cj4gPiArIw0KPiA+ICsjIEBwb3J0OiBUQ1Agb3IgVURQIHBvcnQgbnVtYmVyLg0KPiA+ICsjDQo+
ID4gKyMgUmV0dXJuczogTm90aGluZyBvbiBzdWNjZXNzDQo+ID4gKyMNCj4gPiArIyBTaW5jZTog
NS4zDQo+ID4gKyMNCj4gPiArIyBFeGFtcGxlOg0KPiA+ICsjDQo+ID4gKyMgLT4geyAiZXhlY3V0
ZSI6ICJjb2xvLXBhc3N0aHJvdWdoLWRlbCIsDQo+ID4gKyMgICAgICAiYXJndW1lbnRzIjogeyAi
cHJvdG9jb2wiOiAidGNwIiwgInBvcnQiOiAzMzg5IH0gfQ0KPiA+ICsjIDwtIHsgInJldHVybiI6
IHt9IH0NCj4gPiArIw0KPiA+ICsjIw0KPiA+ICt7ICdjb21tYW5kJzogJ2NvbG8tcGFzc3Rocm91
Z2gtZGVsJywNCj4gPiArICAgICAnZGF0YSc6IHsncHJvdG9jb2wnOiAnc3RyJywgJ3BvcnQnOiAn
dWludDMyJ30gfQ0KDQo=

