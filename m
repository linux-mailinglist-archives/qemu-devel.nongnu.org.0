Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F023340BC5A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 01:47:47 +0200 (CEST)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQI9R-0000fT-7M
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 19:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mQI8G-0008OP-WA
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 19:46:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:56903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mQI8D-00039n-6o
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 19:46:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="307714349"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="307714349"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 16:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="452291882"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga002.jf.intel.com with ESMTP; 14 Sep 2021 16:46:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 16:46:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 16:46:22 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.012;
 Tue, 14 Sep 2021 16:46:22 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
Subject: RE: [RFC v2 0/2] ui: Add a Wayland backend for Qemu UI (v2)
Thread-Topic: [RFC v2 0/2] ui: Add a Wayland backend for Qemu UI (v2)
Thread-Index: AQHXqO9urxiPQd9SfUG/0yIAa5I5hKukLvOA///5YAA=
Date: Tue, 14 Sep 2021 23:46:22 +0000
Message-ID: <49324d7fd71647b08427bbb1939bb12e@intel.com>
References: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
 <YUDN/Sb7rcaCnXXY@redhat.com>
In-Reply-To: <YUDN/Sb7rcaCnXXY@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=vivek.kasireddy@intel.com; helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, "Singh,
 Satyeshwar" <satyeshwar.singh@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Tina" <tina.zhang@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgRGFuaWVsLA0KDQo+IE9uIE1vbiwgU2VwIDEzLCAyMDIxIGF0IDAzOjIwOjM0UE0gLTA3MDAs
IFZpdmVrIEthc2lyZWRkeSB3cm90ZToNCj4gPiBXaHkgZG9lcyBRZW11IG5lZWQgYSBuZXcgV2F5
bGFuZCBVSSBiYWNrZW5kPw0KPiA+IFRoZSBtYWluIHJlYXNvbiB3aHkgdGhlcmUgbmVlZHMgdG8g
YmUgYSBwbGFpbiBhbmQgc2ltcGxlIFdheWxhbmQgYmFja2VuZA0KPiA+IGZvciBRZW11IFVJIGlz
IHRvIGVsaW1pbmF0ZSB0aGUgQmxpdCAoYWthIEdQVSBjb3B5KSB0aGF0IGhhcHBlbnMgaWYgdXNp
bmcNCj4gPiBhIHRvb2xraXQgbGlrZSBHVEsgb3IgU0RMIChiZWNhdXNlIHRoZXkgdXNlIEVHTCku
IFRoZSBCbGl0IGNhbiBiZSBlbGltaW5hdGVkDQo+ID4gYnkgc2hhcmluZyB0aGUgZG1hYnVmIGZk
IC0tIGFzc29jaWF0ZWQgd2l0aCB0aGUgR3Vlc3Qgc2Nhbm91dCBidWZmZXIgLS0NCj4gPiBkaXJl
Y3RseSB3aXRoIHRoZSBIb3N0IGNvbXBvc2l0b3IgdmlhIHRoZSBsaW51eC1kbWFidWYgKHVuc3Rh
YmxlKSBwcm90b2NvbC4NCj4gPiBPbmNlIHByb3Blcmx5IGludGVncmF0ZWQsIGl0IHdvdWxkIGJl
IHBvdGVudGlhbGx5IHBvc3NpYmxlIHRvIGhhdmUgdGhlDQo+ID4gc2Nhbm91dCBidWZmZXIgY3Jl
YXRlZCBieSB0aGUgR3Vlc3QgY29tcG9zaXRvciBiZSBwbGFjZWQgZGlyZWN0bHkgb24gYQ0KPiA+
IGhhcmR3YXJlIHBsYW5lIG9uIHRoZSBIb3N0IHRoZXJlYnkgaW1wcm92aW5nIHBlcmZvcm1hbmNl
LiBPbmx5IEd1ZXN0DQo+ID4gY29tcG9zaXRvcnMgdGhhdCB1c2UgbXVsdGlwbGUgYmFjayBidWZm
ZXJzIChhdC1sZWFzdCAxIGZyb250IGFuZCAxIGJhY2spDQo+ID4gYW5kIHZpcnRpby1ncHUgd291
bGQgYmVuZWZpdCBmcm9tIHRoaXMgd29yay4NCj4gDQo+IElNRSwgUUVNVSBhbHJlYWR5IHN1ZmZl
cnMgZnJvbSBoYXZpbmcgdG9vIG1hbnkgYmFyZWx5IG1haW50YWluZWQgVUkNCj4gaW1wbGVtZW50
YXRpb25zIGFuZCBpdGkgcyBjb25mdXNpbmcgdG8gdXNlcnMuIFVzaW5nIGEgdG9vbGtpdCBsaWtl
IEdUSw0KPiBpcyBnZW5lcmFsbHkgYSBnb29kIHRoaW5nLCBldmVuIGlmIHRoZXkgZG9uJ3QgZW5h
YmxlIHRoZSBtYXhpbXVtDQo+IHRoZW9yZXRpY2FsIHBlcmZvcm1hbmNlLCBiZWNhdXNlIHRoZXkg
cmVkdWNlIHRoZSBsb25nIHRlcm0gbWFpbnQgYnVyZGVuLg0KW0thc2lyZWRkeSwgVml2ZWtdIFRo
ZSBXYXlsYW5kIFVJIGlzIH42MDAgbGluZXMgb2YgY29kZSBhbmQgbW9yZSB0aGFuIGhhbGYgb2YN
CnRoYXQgaXMganVzdCBib2lsZXJwbGF0ZTsgaXQgaXMgYWxzbyBmYWlybHkgc3RhbmRhbG9uZS4g
V2UgZG9uJ3QgaGF2ZSBhbnkgbWFqb3INCmNvbXBsYWludHMgYWdhaW5zdCBHVEsgVUkgKHdoaWNo
IGlzIH4zMDAwIGxpbmVzIG9mIGNvZGUsIGp1c3QgdGhlIFFlbXUgcGllY2UNCmV4Y2x1ZGluZyBs
aWJndGspIGV4Y2VwdCB0aGF0IHRoZXJlIGlzIG5vIHdheSB0byBkaXNzb2NpYXRlIEVHTCBmcm9t
IGl0LiBBbmQsIHRvDQprZWVwIHRoZSBVSSBjb2RlYmFzZSB1cC10by1kYXRlIGFuZCBsZXZlcmFn
ZSBsYXRlc3QgZmVhdHVyZXMgZnJvbSBHVEsgKGZvcg0KZXhhbXBsZSBHVEs0IGFuZCBiZXlvbmQp
IGl0IHdvdWxkIHJlcXVpcmUgbm9uLXRyaXZpYWwgYW1vdW50IG9mIHdvcmsuDQpUaGVyZWZvcmUs
IEkgdGhpbmsgaXQnZCBub3QgYmUgdG9vIG9uZXJvdXMgdG8gbWFpbnRhaW4gc29tZXRoaW5nIGxp
Z2h0d2VpZ2h0IGxpa2UNCnRoZSBXYXlsYW5kIFVJIG1vZHVsZS4NCg0KPiANCj4gSSdtIGZhciBm
cm9tIGNvbnZpbmNlZCB0aGF0IHdlIHNob3VsZCB0YWtlIG9uIHRoZSBtYWludCBvZiB5ZXQgYW5v
dGhlcg0KPiBVSSBpbiBRRU1VLCBldmVuIGlmIGl0IGRvZXMgaGF2ZSBzb21lIHBlcmZvcm1hbmNl
IGJlbmVmaXQsIGVzcGVjaWFsbHkNCltLYXNpcmVkZHksIFZpdmVrXSBUaGVyZSBhcmUgbm92ZWwg
dXNlLWNhc2VzIGNvbWluZyB1cCBwYXJ0aWN1bGFybHkgd2l0aCANCnRoZSBhcnJpdmFsIG9mIHRl
Y2hub2xvZ2llcyBsaWtlIFNSSU9WIHdoZXJlIHRoZSBHdWVzdCBpcyBleHBlY3RlZCB0byBkbyBh
bGwgdGhlDQpyZW5kZXJpbmcgYW5kIHNoYXJlIHRoZSBmdWxseSBjb21wb3NpdGVkIGJ1ZmZlciB3
aXRoIHRoZSBIb3N0IHdob3NlIGpvYiBpcyB0bw0KanVzdCBwcmVzZW50IGl0IG9uIHRoZSBzY3Jl
ZW4uIEFuZCwgaW4gdGhpcyBzY2VuYXJpbywgaWYgd2Ugd2VyZSB0byB1c2UgR1RLIFVJLA0KdGhl
IChmdWxsc2NyZWVuIHNpemVkKSBCbGl0cyBpbmN1cnJlZCB3b3VsZCBxdWlja2x5IGFkZCB1cCBp
ZiB0aGVyZSBhcmUgNC02IEd1ZXN0cw0KcnVubmluZyBhbmQgcHJlc2VudGluZyBjb250ZW50IGF0
IHRoZSBzYW1lIHRpbWUgbG9jYWxseSBvbiBtdWx0aXBsZSBtb25pdG9ycy4NCldheWxhbmQgVUkg
aGVscHMgaW4gdGhpcyBzaXR1YXRpb24gYXMgaXQgZG9lcyBub3QgZG8gYW55IGFkZGl0aW9uYWwg
cmVuZGVyaW5nIG9uDQp0aGUgSG9zdCAobm8gQmxpdCkgYXMgaXQganVzdCBtZXJlbHkgZm9yd2Fy
ZHMgdGhlIEd1ZXN0IGNvbXBvc2l0ZWQgYnVmZmVyIHRvIHRoZQ0KSG9zdCBjb21wb3NpdG9yLg0K
DQo+IGlmIGltcGxlbWVudGVkIHVzaW5nIGEgdmVyeSBsb3cgbGV2ZWwgQVBJIGxpa2UgV2F5bGFu
ZCwgdGhhdCB3b24ndCBsZXQNCj4gdXMgZWFzaWx5IGFkZCByaWNoIFVJIGZlYXR1cmVzLg0KW0th
c2lyZWRkeSwgVml2ZWtdIFllcywgaXQgaXMgYSBkcmF3YmFjayBvZiBXYXlsYW5kIFVJIHRoYXQg
aXQnZCBub3QgYmUgcG9zc2libGUgdG8NCmRvIHdpbmRvdyBkZWNvcmF0aW9ucy9yaWNoIFVJIGZl
YXR1cmVzIGJ1dCB0aGVyZSBhcmUgdXNlcnMvY3VzdG9tZXJzIHRoYXQgZG8gbm90IGNhcmUNCmZv
ciB0aGVtLiBJIHRoaW5rIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBoYXZlIGJvdGggV2F5bGFu
ZCBhbmQgR1RLIFVJIGNvLWV4aXN0DQp3aGVyZSB1c2VycyBjYW4gY2hvb3NlIEdUSyBVSSBmb3Ig
ZmFuY3kgZmVhdHVyZXMgYW5kIFdheWxhbmQgVUkgZm9yIHBlcmZvcm1hbmNlLg0KDQpUaGFua3Ms
DQpWaXZlaw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBEYW5pZWwNCj4gLS0NCj4gfDogaHR0cHM6Ly9i
ZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJl
cnJhbmdlIDp8DQo+IHw6IGh0dHBzOi8vbGlidmlydC5vcmcgICAgICAgICAtby0gICAgICAgICAg
ICBodHRwczovL2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6fA0KPiB8OiBodHRwczovL2VudGFuZ2xl
LXBob3RvLm9yZyAgICAtby0gICAgaHR0cHM6Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFuZ2Ug
OnwNCg0K

