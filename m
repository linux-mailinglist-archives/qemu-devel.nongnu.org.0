Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CDB2E6D63
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 03:57:58 +0100 (CET)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku5Cv-0005tu-Iv
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 21:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ku5C3-0005Ui-37
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:57:03 -0500
Received: from mga03.intel.com ([134.134.136.65]:40737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ku5Bz-00048I-M5
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:57:02 -0500
IronPort-SDR: zVSrrPe7ltvjKhv7nXXbipgUsyvyLgp8xrMCbK1K5byJv6W3lgdQxOQb9izOIXpj173enhSk/9
 eeVyX1VQ2mww==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="176547007"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; d="scan'208";a="176547007"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2020 18:56:52 -0800
IronPort-SDR: kFU9l2aKsFJnbfslkUfa5bRz0B/LIiF00fBR+QixVjgl/gnApD4+y10SQKU+fTjKbckqNYaxU3
 nvbZRT+IfK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; d="scan'208";a="567611194"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 28 Dec 2020 18:56:51 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Dec 2020 18:56:51 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Dec 2020 10:56:49 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Tue, 29 Dec 2020 10:56:49 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Eric
 Blake" <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Thread-Topic: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Thread-Index: AQHW2ZH35CoUMePT00WBg9eX6s7M0aoG0rqAgATaJwD//+sqgIABz6ig
Date: Tue, 29 Dec 2020 02:56:49 +0000
Message-ID: <704028b0dbf843ed9ae64b93ecd1db13@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-2-chen.zhang@intel.com>
 <08fe5c51-1383-12dd-b255-151a868cd6d9@redhat.com>
 <a4adb965911348f4901f72e7e472c07e@intel.com>
 <97d593c2-222d-a3cf-e797-8d77b8701bed@redhat.com>
In-Reply-To: <97d593c2-222d-a3cf-e797-8d77b8701bed@redhat.com>
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
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBEZWNlbWJlciAyOCwgMjAyMCAzOjEx
IFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBxZW11LWRldiA8
cWVtdS0NCj4gZGV2ZWxAbm9uZ251Lm9yZz47IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29t
PjsgRHIuIERhdmlkIEFsYW4NCj4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47IE1hcmt1
cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4NCj4gQ2M6IFpoYW5nIENoZW4gPHpoYW5n
Y2tpZEBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8zXSBxYXBpL25ldDogQWRk
IG5ldyBRTVAgY29tbWFuZCBmb3IgQ09MTw0KPiBwYXNzdGhyb3VnaA0KPiANCj4gDQo+IE9uIDIw
MjAvMTIvMjgg5LiK5Y2IODozOCwgWmhhbmcsIENoZW4gd3JvdGU6DQo+ID4NCj4gPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAyNSwgMjAyMCAyOjIwIFBNDQo+
ID4+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBxZW11LWRldiA8cWVt
dS0NCj4gPj4gZGV2ZWxAbm9uZ251Lm9yZz47IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29t
PjsgRHIuIERhdmlkIEFsYW4NCj4gPj4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47IE1h
cmt1cyBBcm1icnVzdGVyDQo+IDxhcm1icnVAcmVkaGF0LmNvbT4NCj4gPj4gQ2M6IFpoYW5nIENo
ZW4gPHpoYW5nY2tpZEBnbWFpbC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8zXSBx
YXBpL25ldDogQWRkIG5ldyBRTVAgY29tbWFuZCBmb3IgQ09MTw0KPiA+PiBwYXNzdGhyb3VnaA0K
PiA+Pg0KPiA+Pg0KPiA+PiBPbiAyMDIwLzEyLzI0IOS4iuWNiDk6MDksIFpoYW5nIENoZW4gd3Jv
dGU6DQo+ID4+PiBGcm9tOiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPj4+
DQo+ID4+PiBTaW5jZSB0aGUgcmVhbCB1c2VyIHNjZW5hcmlvIGRvZXMgbm90IG5lZWQgdG8gbW9u
aXRvciBhbGwgdHJhZmZpYy4NCj4gPj4+IEFkZCBjb2xvLXBhc3N0aHJvdWdoLWFkZCBhbmQgY29s
by1wYXNzdGhyb3VnaC1kZWwgdG8gbWFpbnRhaW4gYSBDT0xPDQo+ID4+PiBuZXR3b3JrIHBhc3N0
aHJvdWdoIGxpc3QuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogWmhhbmcgQ2hlbiA8Y2hl
bi56aGFuZ0BpbnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIG5ldC9uZXQuYyAgICAgfCAx
MiArKysrKysrKysrKysNCj4gPj4+ICAgIHFhcGkvbmV0Lmpzb24gfCA0Ng0KPiA+PiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4+PiAgICAyIGZpbGVz
IGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvbmV0
L25ldC5jIGIvbmV0L25ldC5jDQo+ID4+PiBpbmRleCBlMTAzNWYyMWQxLi5lYWM3YTkyNjE4IDEw
MDY0NA0KPiA+Pj4gLS0tIGEvbmV0L25ldC5jDQo+ID4+PiArKysgYi9uZXQvbmV0LmMNCj4gPj4+
IEBAIC0xMTUxLDYgKzExNTEsMTggQEAgdm9pZCBxbXBfbmV0ZGV2X2RlbChjb25zdCBjaGFyICpp
ZCwgRXJyb3INCj4gPj4gKiplcnJwKQ0KPiA+Pj4gICAgICAgIHFlbXVfZGVsX25ldF9jbGllbnQo
bmMpOw0KPiA+Pj4gICAgfQ0KPiA+Pj4NCj4gPj4+ICt2b2lkIHFtcF9jb2xvX3Bhc3N0aHJvdWdo
X2FkZChjb25zdCBjaGFyICpwcm90LCBjb25zdCB1aW50MzJfdCBwb3J0LA0KPiA+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEVycm9yICoqZXJycCkgew0KPiA+Pj4gKyAgICAvKiBT
ZXR1cCBwYXNzdGhyb3VnaCBjb25uZWN0aW9uICovIH0NCj4gPj4+ICsNCj4gPj4+ICt2b2lkIHFt
cF9jb2xvX3Bhc3N0aHJvdWdoX2RlbChjb25zdCBjaGFyICpwcm90LCBjb25zdCB1aW50MzJfdCBw
b3J0LA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVycm9yICoqZXJycCkg
ew0KPiA+Pj4gKyAgICAvKiBEZWxldGUgcGFzc3Rocm91Z2ggY29ubmVjdGlvbiAqLyB9DQo+ID4+
PiArDQo+ID4+PiAgICBzdGF0aWMgdm9pZCBuZXRmaWx0ZXJfcHJpbnRfaW5mbyhNb25pdG9yICpt
b24sIE5ldEZpbHRlclN0YXRlICpuZikNCj4gPj4+ICAgIHsNCj4gPj4+ICAgICAgICBjaGFyICpz
dHI7DQo+ID4+PiBkaWZmIC0tZ2l0IGEvcWFwaS9uZXQuanNvbiBiL3FhcGkvbmV0Lmpzb24gaW5k
ZXgNCj4gPj4+IGMzMTc0OGM4N2YuLjQ2NmMyOTcxNGUgMTAwNjQ0DQo+ID4+PiAtLS0gYS9xYXBp
L25ldC5qc29uDQo+ID4+PiArKysgYi9xYXBpL25ldC5qc29uDQo+ID4+PiBAQCAtNzE0LDMgKzcx
NCw0OSBAQA0KPiA+Pj4gICAgIyMNCj4gPj4+ICAgIHsgJ2V2ZW50JzogJ0ZBSUxPVkVSX05FR09U
SUFURUQnLA0KPiA+Pj4gICAgICAnZGF0YSc6IHsnZGV2aWNlLWlkJzogJ3N0cid9IH0NCj4gPj4+
ICsNCj4gPj4+ICsjIw0KPiA+Pj4gKyMgQGNvbG8tcGFzc3Rocm91Z2gtYWRkOg0KPiA+Pj4gKyMN
Cj4gPj4+ICsjIEFkZCBwYXNzdGhyb3VnaCBlbnRyeSBhY2NvcmRpbmcgdG8gY3VzdG9tZXIncyBu
ZWVkcyBpbiBDT0xPLQ0KPiBjb21wYXJlLg0KPiA+Pj4gKyMNCj4gPj4+ICsjIEBwcm90b2NvbDog
Q09MTyBwYXNzdGhyb3VnaCBqdXN0IHN1cHBvcnQgVENQIGFuZCBVRFAuDQo+ID4+PiArIw0KPiA+
Pj4gKyMgQHBvcnQ6IFRDUCBvciBVRFAgcG9ydCBudW1iZXIuDQo+ID4+PiArIw0KPiA+Pj4gKyMg
UmV0dXJuczogTm90aGluZyBvbiBzdWNjZXNzDQo+ID4+PiArIw0KPiA+Pj4gKyMgU2luY2U6IDUu
Mw0KPiA+Pj4gKyMNCj4gPj4+ICsjIEV4YW1wbGU6DQo+ID4+PiArIw0KPiA+Pj4gKyMgLT4geyAi
ZXhlY3V0ZSI6ICJjb2xvLXBhc3N0aHJvdWdoLWFkZCIsDQo+ID4+PiArIyAgICAgICJhcmd1bWVu
dHMiOiB7ICJwcm90b2NvbCI6ICJ0Y3AiLCAicG9ydCI6IDMzODkgfSB9DQo+ID4+PiArIyA8LSB7
ICJyZXR1cm4iOiB7fSB9DQo+ID4+PiArIw0KPiA+Pj4gKyMjDQo+ID4+PiAreyAnY29tbWFuZCc6
ICdjb2xvLXBhc3N0aHJvdWdoLWFkZCcsDQo+ID4+PiArICAgICAnZGF0YSc6IHsncHJvdG9jb2wn
OiAnc3RyJywgJ3BvcnQnOiAndWludDMyJ30gfQ0KPiA+Pg0KPiA+PiBEbyB3ZSBwbGFuIHRvIHN1
cHBvcnQgNC10dXBsZSAoc3JjIGlwLHNyYyBwb3J0LCBkc3QgaXAsIGRzdCBwb3J0KSBpbg0KPiA+
PiB0aGUgZnV0dXJlPyBJZiB5ZXMsIGxldCdzIGFkZCB0aGVtIG5vdy4NCj4gPj4NCj4gPj4gQW5k
IGRvIHdlIHBsYW4gdG8gc3VwcG9ydCB3aWxkY2FyZCBoZXJlPw0KPiA+IEkgdGhpbmsganVzdCB1
c2luZyB0aGUgcG9ydCBpcyBlbm91Z2ggZm9yIENPTE8gY29tcGFyZS4NCj4gPiBCZWNhdXNlIGlu
IHRoaXMgY2FzZSwgdXNlcnMgbmVlZCBwYXNzdGhyb3VnaCBzb21lIGd1ZXN0IHNlcnZpY2VzIGFy
ZQ0KPiBkaXN0aW5ndWlzaGVkIGJ5IHN0YXRpYyBwb3J0cy4NCj4gPiBBbmQgZm9yIHN1cHBvcnQg
NC10dXBsZSBhbmQgd2lsZGNhcmQgYXJlIGEgZ29vZCBxdWVzdGlvbiwgZG8geW91IHRoaW5rDQo+
ID4gd2Ugc2hvdWxkIGFkZCBzb21lIHBhc3N0aHJvdWdoIE1lY2hhbmlzbSBmb3IgYWxsIFFlbXUg
bmV0IGZpbHRlcj8gSWYgeWVzLA0KPiB3ZSBzaG91bGQgc3VwcG9ydCB0aGF0IGluIHRoZSBmdXR1
cmUuDQo+IA0KPiANCj4gSSB0aGluayB3ZSBjYW4gc3RhcnQgZm9ybSBDT0xPLiBUbyBhdm9pZCBR
TVAgY29tcGF0aWJpbGl0eSBpc3N1ZXMsIEkgd291bGQNCj4gbGlrZSB0byBhZGQgdGhlIG4gdHVw
bGUgYW5kIHdpbGRjYXJkIHN1cHBvcnQgbm93Lg0KDQpPSywgSSB3aWxsIGRvIHRoaXMgam9iIGlu
IG5leHQgdmVyc2lvbi4NCkZvciB0aGUgUU1QIGNvbXBhdGliaWxpdHkgaXNzdWVzLCBwbGVhc2Ug
Z2l2ZSBtZSBhIGRlbW8gb2Ygd2hhdCB3ZSB3YW50IHRvIHNlZSwgTGlrZSBzb21lIGV4aXN0aW5n
IGNvbW1hbmRzLg0KDQpUaGFua3MNCkNoZW4NCg0KPiANCj4gVGhhbmtzDQo+IA0KPiANCj4gPg0K
PiA+IFRoYW5rcw0KPiA+IENoZW4NCj4gPg0KPiA+PiBUaGFua3MNCj4gPj4NCj4gPj4NCj4gPj4+
ICsNCj4gPj4+ICsjIw0KPiA+Pj4gKyMgQGNvbG8tcGFzc3Rocm91Z2gtZGVsOg0KPiA+Pj4gKyMN
Cj4gPj4+ICsjIERlbGV0ZSBwYXNzdGhyb3VnaCBlbnRyeSBhY2NvcmRpbmcgdG8gY3VzdG9tZXIn
cyBuZWVkcyBpbiBDT0xPLQ0KPiA+PiBjb21wYXJlLg0KPiA+Pj4gKyMNCj4gPj4+ICsjIEBwcm90
b2NvbDogQ09MTyBwYXNzdGhyb3VnaCBqdXN0IHN1cHBvcnQgVENQIGFuZCBVRFAuDQo+ID4+PiAr
Iw0KPiA+Pj4gKyMgQHBvcnQ6IFRDUCBvciBVRFAgcG9ydCBudW1iZXIuDQo+ID4+PiArIw0KPiA+
Pj4gKyMgUmV0dXJuczogTm90aGluZyBvbiBzdWNjZXNzDQo+ID4+PiArIw0KPiA+Pj4gKyMgU2lu
Y2U6IDUuMw0KPiA+Pj4gKyMNCj4gPj4+ICsjIEV4YW1wbGU6DQo+ID4+PiArIw0KPiA+Pj4gKyMg
LT4geyAiZXhlY3V0ZSI6ICJjb2xvLXBhc3N0aHJvdWdoLWRlbCIsDQo+ID4+PiArIyAgICAgICJh
cmd1bWVudHMiOiB7ICJwcm90b2NvbCI6ICJ0Y3AiLCAicG9ydCI6IDMzODkgfSB9DQo+ID4+PiAr
IyA8LSB7ICJyZXR1cm4iOiB7fSB9DQo+ID4+PiArIw0KPiA+Pj4gKyMjDQo+ID4+PiAreyAnY29t
bWFuZCc6ICdjb2xvLXBhc3N0aHJvdWdoLWRlbCcsDQo+ID4+PiArICAgICAnZGF0YSc6IHsncHJv
dG9jb2wnOiAnc3RyJywgJ3BvcnQnOiAndWludDMyJ30gfQ0KDQo=

