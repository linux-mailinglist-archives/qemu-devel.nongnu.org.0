Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08AE41D004
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 01:33:46 +0200 (CEST)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVj57-0007Le-HE
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 19:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mVj3q-0006bE-36
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 19:32:26 -0400
Received: from mga12.intel.com ([192.55.52.136]:8655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mVj3n-0000aW-GH
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 19:32:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="204547959"
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; d="scan'208";a="204547959"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 16:32:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; d="scan'208";a="617782299"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2021 16:32:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Sep 2021 16:32:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Sep 2021 16:32:12 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.012;
 Wed, 29 Sep 2021 16:32:12 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: virtio-gpu: Get FD for texture
Thread-Topic: virtio-gpu: Get FD for texture
Thread-Index: AQHXs4lrZDs5kXGfUkqMN7/oDwRhcKu7gXSAgAAiykA=
Date: Wed, 29 Sep 2021 23:32:12 +0000
Message-ID: <2ba7012a2e9e487c891218216f882cd6@intel.com>
References: <968fd181-3f7d-4639-3265-9e4b36a6de61@collabora.com>
 <273005ec-fc49-b8ac-cd6e-9efdb8a8aab4@collabora.com>
In-Reply-To: <273005ec-fc49-b8ac-cd6e-9efdb8a8aab4@collabora.com>
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
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=vivek.kasireddy@intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgQW50b25pbywNCg0KPiANCj4gSSBhbSBzdGFydGluZyB0byBiZWxpZXZlIHRoYXQgdGhlIGVy
cm9yIGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IG5vIEVHTENvbnRleHQgaXMgYWN0aXZlIG9uIHRo
ZQ0KPiBjdXJyZW50IHRocmVhZCAodGhlIG9uZSBydW5uaW5nIHRoZSBWdWxrYW4gYXBwbGljYXRp
b24pLg0KW0thc2lyZWRkeSwgVml2ZWtdIFdoaWNoIFVJIG1vZHVsZSAoYW5kIEhvc3QgZW52aXJv
bm1lbnQpIGFyZSB5b3UgdGVzdGluZyB3aXRoPw0KZ3RrPyBlZ2wtaGVhZGxlc3M/IENvdWxkIHlv
dSBwbGVhc2UgcHJvdmlkZSBtb3JlIGRldGFpbHMgYWJvdXQgdGhlIGVudmlyb25tZW50IGFuZA0K
dGhlIHVzZS1jYXNlPw0KDQo+IA0KPiBUcnlpbmcgdG8gY2FsbCBlZ2xNYWtlQ3VycmVudCB3aXRo
aW4gdGhpcyB0aHJlYWQgZ2l2ZXMgbWUgYW4gRUdMX0JBRF9BQ0NFU1MgZXJyb3INCj4gYXMgdGhl
IEVHTENvbnRleHQgYXNzb2NpYXRlZCB0byB0aGUgR0wgdGV4dHVyZSBiZWxvbmdzIHRvIGEgZGlm
ZmVyZW50IHRocmVhZC4NCltLYXNpcmVkZHksIFZpdmVrXSBJSVVDLCBjb250ZXh0cyBjYW4gb25s
eSBiZSBib3VuZCB0byBvbmUgdGhyZWFkIGF0IGEgdGltZS4gU28geW91IGVpdGhlcg0KbmVlZCB0
byByZWxlYXNlIHRoZSBjb250ZXh0IGluIHRoZSBvdGhlciB0aHJlYWQgKGVnbE1ha2VDdXJyZW50
KE5VTEwsIE5VTEwpIGJlZm9yZSBtYWtpbmcNCml0IGN1cnJlbnQgaW4geW91ciBjdXJyZW50IHRo
cmVhZCBvciBjcmVhdGUgYSBzaGFyZWQgY29udGV4dCBiZXR3ZWVuIGJvdGggdGhlIHRocmVhZHMg
dG8gYmUgYWJsZQ0KdG8gc2hhcmUgdGV4dHVyZXMuDQoNClRoYW5rcywNClZpdmVrDQoNCj4gDQo+
IERvZXMgdGhhdCBtYWtlIHNlbnNlPw0KPiANCj4gS2luZCByZWdhcmRzLA0KPiBBbnRvbmlvIENh
Z2dpYW5vDQo+IA0KPiBPbiAyNy8wOS8yMSAxMjoyMSwgQW50b25pbyBDYWdnaWFubyB3cm90ZToN
Cj4gPiBIaSwNCj4gPg0KPiA+IEkgYW0gdHJ5aW5nIHRvIHN1cHBvcnQgYSBWdWxrYW4gYXBwbGlj
YXRpb24gaW4gdGhlIGd1ZXN0DQo+ID4gKEdUS0dsQXJlYStWaXJHTCt2ZW51cykgd2hpY2ggbmVl
ZHMgdG8gaW1wb3J0IGEgR0wgdGV4dHVyZSBmcm9tIGEgR0wNCj4gPiBjb250ZXh0Lg0KPiA+DQo+
ID4gQmVmb3JlIGRvaW5nIHRoYXQsIEkgbmVlZCB0byBnZXQgYSBGRCBmb3IgdGhhdCB0ZXh0dXJl
LCB0aGVyZWZvcmUgSQ0KPiA+IHRyaWVkIHdpdGggY2FsbGluZyBlZ2wtaGVscGVycy5oOmVnbF9n
ZXRfZmRfZm9yX3RleHR1cmUoKSBidXQgSSBnZXQgYW4NCj4gPiBlcG94eSBlcnJvcjoNCj4gPg0K
PiA+ICA+IE5vIHByb3ZpZGVyIG9mIGVnbENyZWF0ZUltYWdlS0hSIGZvdW5kLsKgIFJlcXVpcmVz
IG9uZSBvZjoNCj4gPg0KPiA+ICA+wqDCoCBFR0xfS0hSX2ltYWdlDQo+ID4NCj4gPiAgPsKgwqAg
RUdMX0tIUl9pbWFnZV9iYXNlDQo+ID4NCj4gPiBUaGlzIGlzIGEgYml0IHdlaXJkIHRvIG1lIGFz
IEkgYW0gc3VyZSBJIGFtIHJ1bm5pbmcgUUVNVSB3aXRoIGlyaXMgYW5kDQo+ID4gYWNjb3JkaW5n
IHRvIGVnbGluZm8gYm90aCBvZiB0aGVzZSBleHRlbnNpb25zIGFyZSBhdmFpbGFibGUuDQo+ID4N
Cj4gPiBEbyB5b3UgdGhpbmsgbXkgYXBwcm9hY2ggbWFrZXMgc2Vuc2Ugb3IgSSBhbSBkb2luZyBz
b21ldGhpbmcgd3JvbmcNCj4gPiBzb21ld2hlcmU/DQo+ID4NCj4gPg0KPiA+IEtpbmQgcmVnYXJk
cywNCj4gPiBBbnRvbmlvIENhZ2dpYW5vDQo=

