Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C448B40BBDF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 01:04:35 +0200 (CEST)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQHTe-0000FP-EI
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 19:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mQHSh-00080h-22
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 19:03:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:15739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mQHSe-0001rO-8V
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 19:03:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="222209172"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="222209172"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 16:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="529151287"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2021 16:03:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 16:03:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 16:03:23 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.012;
 Tue, 14 Sep 2021 16:03:23 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
Subject: RE: [RFC v2 2/2] ui: Add a plain Wayland backend for Qemu UI
Thread-Topic: [RFC v2 2/2] ui: Add a plain Wayland backend for Qemu UI
Thread-Index: AQHXqO9u6jvZ3adbW0OsNCC0q9Uxy6ukKtKA///2hxA=
Date: Tue, 14 Sep 2021 23:03:23 +0000
Message-ID: <7b3b949b2ca541afb1a558e2d80ab9ee@intel.com>
References: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
 <20210913222036.3193732-3-vivek.kasireddy@intel.com>
 <YUDKh+83AdvtsV28@redhat.com>
In-Reply-To: <YUDKh+83AdvtsV28@redhat.com>
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
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=vivek.kasireddy@intel.com; helo=mga03.intel.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgRGFuaWVsLA0KIA0KPiBPbiBNb24sIFNlcCAxMywgMjAyMSBhdCAwMzoyMDozNlBNIC0wNzAw
LCBWaXZlayBLYXNpcmVkZHkgd3JvdGU6DQo+ID4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpdmVrIEthc2lyZWRkeSA8dml2ZWsua2Fz
aXJlZGR5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgY29uZmlndXJlICAgICAgICAgfCAgIDgg
Ky0NCj4gPiAgbWVzb24uYnVpbGQgICAgICAgfCAgMzMgKysrDQo+ID4gIG1lc29uX29wdGlvbnMu
dHh0IHwgICAyICsNCj4gPiAgcWFwaS91aS5qc29uICAgICAgfCAgIDMgKw0KPiA+ICB1aS9tZXNv
bi5idWlsZCAgICB8ICA1MiArKysrDQo+ID4gIHVpL3dheWxhbmQuYyAgICAgIHwgNjI4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgNiBmaWxlcyBj
aGFuZ2VkLCA3MjUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKSAgY3JlYXRlIG1vZGUgMTAw
NjQ0DQo+ID4gdWkvd2F5bGFuZC5jDQo+IA0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvdWkvbWVzb24u
YnVpbGQgYi91aS9tZXNvbi5idWlsZCBpbmRleA0KPiA+IGE3M2JlYjBlNTQuLjg2ZmMzMjRjODIg
MTAwNjQ0DQo+ID4gLS0tIGEvdWkvbWVzb24uYnVpbGQNCj4gPiArKysgYi91aS9tZXNvbi5idWls
ZA0KPiA+IEBAIC02NCw2ICs2NCw1OCBAQCBpZiBjb25maWdfaG9zdC5oYXNfa2V5KCdDT05GSUdf
T1BFTkdMJykgYW5kIGdibS5mb3VuZCgpDQo+ID4gICAgdWlfbW9kdWxlcyArPSB7J2VnbC1oZWFk
bGVzcycgOiBlZ2xfaGVhZGxlc3Nfc3N9ICBlbmRpZg0KPiA+DQo+ID4gK3dheWxhbmRfc2Nhbm5l
ciA9IGZpbmRfcHJvZ3JhbSgnd2F5bGFuZC1zY2FubmVyJykgcHJvdG9fc291cmNlcyA9IFsNCj4g
PiArICBbJ3hkZy1zaGVsbCcsICdzdGFibGUnLCBdLA0KPiA+ICsgIFsnZnVsbHNjcmVlbi1zaGVs
bCcsICd1bnN0YWJsZScsICd2MScsIF0sDQo+ID4gKyAgWydsaW51eC1kbWFidWYnLCAndW5zdGFi
bGUnLCAndjEnLCBdLCBdIHdheWxhbmRfaGVhZGVycyA9IFtdDQo+ID4gK3dheWxhbmRfcHJvdG9f
c291cmNlcyA9IFtdDQo+ID4gKw0KPiA+ICtpZiB3YXlsYW5kLmZvdW5kKCkNCj4gPiArICBmb3Jl
YWNoIHA6IHByb3RvX3NvdXJjZXMNCj4gPiArICAgIHByb3RvX25hbWUgPSBwLmdldCgwKQ0KPiA+
ICsgICAgcHJvdG9fc3RhYmlsaXR5ID0gcC5nZXQoMSkNCj4gPiArDQo+ID4gKyAgICBpZiBwcm90
b19zdGFiaWxpdHkgPT0gJ3N0YWJsZScNCj4gPiArICAgICAgb3V0cHV0X2Jhc2UgPSBwcm90b19u
YW1lDQo+ID4gKyAgICAgIGlucHV0ID0gZmlsZXMoam9pbl9wYXRocyh3bHByb3RvX2RpciwNCj4g
J0AwQC9AMUAvQDJALnhtbCcuZm9ybWF0KHByb3RvX3N0YWJpbGl0eSwgcHJvdG9fbmFtZSwgb3V0
cHV0X2Jhc2UpKSkNCj4gPiArICAgIGVsc2UNCj4gPiArICAgICAgcHJvdG9fdmVyc2lvbiA9IHAu
Z2V0KDIpDQo+ID4gKyAgICAgIG91dHB1dF9iYXNlID0gJ0AwQC1AMUAtQDJAJy5mb3JtYXQocHJv
dG9fbmFtZSwgcHJvdG9fc3RhYmlsaXR5LA0KPiBwcm90b192ZXJzaW9uKQ0KPiA+ICsgICAgICBp
bnB1dCA9IGZpbGVzKGpvaW5fcGF0aHMod2xwcm90b19kaXIsDQo+ICdAMEAvQDFAL0AyQC54bWwn
LmZvcm1hdChwcm90b19zdGFiaWxpdHksIHByb3RvX25hbWUsIG91dHB1dF9iYXNlKSkpDQo+ID4g
KyAgICBlbmRpZg0KPiA+ICsNCj4gPiArICAgIHdheWxhbmRfaGVhZGVycyArPSBjdXN0b21fdGFy
Z2V0KCdAMEAgY2xpZW50IGhlYWRlcicuZm9ybWF0KG91dHB1dF9iYXNlKSwNCj4gPiArICAgICAg
aW5wdXQ6IGlucHV0LA0KPiA+ICsgICAgICBvdXRwdXQ6ICdAMEAtY2xpZW50LXByb3RvY29sLmgn
LmZvcm1hdChvdXRwdXRfYmFzZSksDQo+ID4gKyAgICAgIGNvbW1hbmQ6IFsNCj4gPiArICAgICAg
ICB3YXlsYW5kX3NjYW5uZXIsDQo+ID4gKyAgICAgICAgJ2NsaWVudC1oZWFkZXInLA0KPiA+ICsg
ICAgICAgICdASU5QVVRAJywgJ0BPVVRQVVRAJywNCj4gPiArICAgICAgXSwgYnVpbGRfYnlfZGVm
YXVsdDogdHJ1ZQ0KPiA+ICsgICAgKQ0KPiA+ICsNCj4gPiArICAgIHdheWxhbmRfcHJvdG9fc291
cmNlcyArPSBjdXN0b21fdGFyZ2V0KCdAMEAgc291cmNlJy5mb3JtYXQob3V0cHV0X2Jhc2UpLA0K
PiA+ICsgICAgICBpbnB1dDogaW5wdXQsDQo+ID4gKyAgICAgIG91dHB1dDogJ0AwQC1wcm90b2Nv
bC5jJy5mb3JtYXQob3V0cHV0X2Jhc2UpLA0KPiA+ICsgICAgICBjb21tYW5kOiBbDQo+ID4gKyAg
ICAgICAgd2F5bGFuZF9zY2FubmVyLA0KPiA+ICsgICAgICAgICdwcml2YXRlLWNvZGUnLA0KPiA+
ICsgICAgICAgICdASU5QVVRAJywgJ0BPVVRQVVRAJywNCj4gPiArICAgICAgXSwgYnVpbGRfYnlf
ZGVmYXVsdDogdHJ1ZQ0KPiA+ICsgICAgKQ0KPiA+ICsgIGVuZGZvcmVhY2gNCj4gPiArZW5kaWYN
Cj4gPiArDQo+ID4gK2lmIHdheWxhbmQuZm91bmQoKQ0KPiA+ICsgIHdheWxhbmRfc3MgPSBzcy5z
b3VyY2Vfc2V0KCkNCj4gPiArICB3YXlsYW5kX3NzLmFkZCh3aGVuOiB3YXlsYW5kLCBpZl90cnVl
OiBmaWxlcygnd2F5bGFuZC5jJywNCj4gPiArJ3hkZy1zaGVsbC1wcm90b2NvbC5jJywNCj4gPiAr
J2Z1bGxzY3JlZW4tc2hlbGwtdW5zdGFibGUtdjEtcHJvdG9jb2wuYycsJ2xpbnV4LWRtYWJ1Zi11
bnN0YWJsZS12MS1wDQo+ID4gK3JvdG9jb2wuYycpKQ0KPiA+ICsgICN3YXlsYW5kX3NzLmFkZCh3
aGVuOiB3YXlsYW5kLCBpZl90cnVlOiBmaWxlcygnd2F5bGFuZC5jJyksDQo+ID4gK1t3YXlsYW5k
X3Byb3RvX3NvdXJjZXNdKQ0KPiA+ICsgIHVpX21vZHVsZXMgKz0geyd3YXlsYW5kJyA6IHdheWxh
bmRfc3N9IGVuZGlmDQo+IA0KPiBDb25maWd1cmUgZmFpbHMgb24gdGhpcw0KPiANCj4gICBQcm9n
cmFtIHdheWxhbmQtc2Nhbm5lciBmb3VuZDogWUVTICgvdXNyL2Jpbi93YXlsYW5kLXNjYW5uZXIp
DQo+IA0KPiAgIC4uL3VpL21lc29uLmJ1aWxkOjExNDoxMzogRVJST1I6IEZpbGUgeGRnLXNoZWxs
LXByb3RvY29sLmMgZG9lcyBub3QgZXhpc3QuDQo+IA0KPiANCj4gdGhlIGNvZGUgYSBmZXcgbGlu
ZXMgYWJvdmUgZ2VuZXJhdGVzIHhkZy1zaGVsbC1wcm90b2NvbC5jLCBidXQgdGhhdCBpc24ndCBy
dW4gdW50aWwgeW91IHR5cGUNCj4gIm1ha2UiLCBzbyB3aGVuIG1lc29uIGlzIHJlc29sdmluZyB0
aGUgc291cmNlIGZpbGVzIHRoZXkgZG9uJ3QgZXhpc3QuDQo+IA0KPiBUaGUgYWx0ZXJuYXRpdmUg
bGluZSB5b3UgaGF2ZSBjb21tZW50ZWQgb3V0IGxvb2tzIG1vcmUgbGlrZSB3aGF0IHdlIHdvdWxk
IG5lZWQsIGJ1dCBpdA0KPiBkb2Vzbid0IHdvcmsgZWl0aGVyIGFzIGl0cyBzeW50YXggaXMgaW52
YWxpZC4NCltLYXNpcmVkZHksIFZpdmVrXSBSaWdodCwgdGhlIGNvbW1lbnRlZCBsaW5lIGlzIHRo
ZSBvbmUgd2UnZCBuZWVkIGJ1dCBkZXNwaXRlIGV4aGF1c3RpdmVseQ0KdHJ5aW5nIHZhcmlvdXMg
ZGlmZmVyZW50IGNvbWJpbmF0aW9ucywgSSBjb3VsZG4ndCBnZXQgTWVzb24gdG8gaW5jbHVkZSB0
aGUgYXV0by1nZW5lcmF0ZWQNCnByb3RvY29sIHNvdXJjZXMuIElmIGl0IGlzIG5vdCB0b28gbXVj
aCB0cm91YmxlLCBjb3VsZCB5b3UgcGxlYXNlIHBvaW50IG1lIHRvIGFuIGV4YW1wbGUNCndoZXJl
IHRoaXMgaXMgZG9uZSBlbHNld2hlcmUgaW4gUWVtdSBzb3VyY2UgdGhhdCBJIGNhbiBsb29rIGF0
Pw0KDQo+IA0KPiBIb3cgZGlkIHlvdSBhY3R1YWxseSBjb21waWxlIHRoaXMgc2VyaWVzID8NCltL
YXNpcmVkZHksIFZpdmVrXSBPaCwgYXMgYSB3b3JrYXJvdW5kLCBJIGp1c3QgbWFudWFsbHkgYWRk
ZWQgdGhlIHByb3RvY29sIHNvdXJjZXMuIEkgYW0NCnNvcnJ5IEkgZGlkIG5vdCByZWFsaXplIHRo
YXQgdGhpcyBjb2RlIHdvdWxkIGJlIGNvbXBpbGVkL3Rlc3RlZDsgSSBtYWlubHkgcG9zdGVkIHRo
ZXNlDQpSRkMvV0lQIHBhdGNoZXMgdG8gcHJvdmlkZSBhZGRpdGlvbmFsIGNvbnRleHQgdG8gdGhl
IGRpc2N1c3Npb24gYXNzb2NpYXRlZCB3aXRoIHRoZSBEUk0vDQpWaXJ0aW8tZ3B1IGtlcm5lbCBw
YXRjaGVzLg0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiANCj4gUmVnYXJkcywNCj4gRGFuaWVs
DQo+IC0tDQo+IHw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBzOi8vd3d3
LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fA0KPiB8OiBodHRwczovL2xpYnZpcnQub3Jn
ICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5jb20gOnwN
Cj4gfDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmlu
c3RhZ3JhbS5jb20vZGJlcnJhbmdlIDp8DQoNCg==

