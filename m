Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4EF35D7C6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 08:12:00 +0200 (CEST)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWCHH-0007rT-2C
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 02:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lWCGF-0007Pt-MI
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 02:10:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:33715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lWCFp-0000xk-3k
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 02:10:54 -0400
IronPort-SDR: 6ULsBXnL1dESIUwoR+S1T9MuVZwRZyJ10s/bX/3COQMcfzBJdx8FTqs6D5ZmUbd3L7gkh4azw9
 FuJRoD8AzF8Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="193906744"
X-IronPort-AV: E=Sophos;i="5.82,218,1613462400"; d="scan'208";a="193906744"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 23:10:21 -0700
IronPort-SDR: xrpr0uNPQ1XDiqabbg1rUF6z/Czms0MHNCjgIyH627jYW7qkCVtZ22NLkDTkZERxxTfE6zEqPF
 H5WbHvUlBTSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,218,1613462400"; d="scan'208";a="600242115"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 12 Apr 2021 23:10:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 12 Apr 2021 23:10:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 12 Apr 2021 23:10:20 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Mon, 12 Apr 2021 23:10:20 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 00/11] Add support for Blob resources feature
Thread-Topic: [PATCH 00/11] Add support for Blob resources feature
Thread-Index: AQHXJdz2h6I8jP8coE+Bdspyq04keqqyA4vg
Date: Tue, 13 Apr 2021 06:10:19 +0000
Message-ID: <58a1404f12d9434bae1d336f6553279e@intel.com>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
In-Reply-To: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=vivek.kasireddy@intel.com; helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, "Kim, 
 Dongwon" <dongwon.kim@intel.com>, "Zhang, Tina" <tina.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgR2VyZCwNCldoaWxlIGxvb2tpbmcgYXQgdGhlIFFlbXUgVUkgY29kZSwgSSBub3RpY2VkIHRo
YXQgdGhlcmUgaXMgYSBCbGl0IG9wZXJhdGlvbg0KcGVyZm9ybWVkIHRvIGNvcHkgdGhlIEd1ZXN0
IEZCICh0ZXh0dXJlKSBpbnRvIGEgSG9zdCBidWZmZXIgYmVmb3JlIGl0IGlzIHByZXNlbnRlZA0K
dG8gdGhlIEhvc3QgY29tcG9zaXRvci4gSSB3YXMgd29uZGVyaW5nIGlmIHRoZXJlIGFyZSBhbnkg
ZWxlZ2FudCB3YXlzIHRvDQplbGltaW5hdGUgdGhpcyBCbGl0IHRvIGZ1cnRoZXIgdGhlIGdvYWwg
b2YgYWJzb2x1dGUgemVyby1jb3B5LiBPbmUgaWRlYSB0aGF0IEkgYW0gDQpmYW1pbGlhciB3aXRo
IGludm9sdmVzIHRoZSB1c2FnZSBvZiB0aGlzIGV4dGVuc2lvbjoNCmh0dHBzOi8vd3d3Lmtocm9u
b3Mub3JnL3JlZ2lzdHJ5L0VHTC9leHRlbnNpb25zL1dML0VHTF9XTF9jcmVhdGVfd2F5bGFuZF9i
dWZmZXJfZnJvbV9pbWFnZS50eHQNCg0KSG93ZXZlciwgSSBkbyByZWFsaXplIHRoYXQgdGhpcyBp
cyB2ZXJ5IFdheWxhbmQgc3BlY2lmaWMgYnV0IHdlIGFyZSBhbHNvIGdvaW5nIHRvIG5lZWQNCnRv
IGFkZCBleHBsaWNpdCBzeW5jIHN1cHBvcnQgd2hpY2ggaXMgY3VycmVudGx5IG9ubHkgYXZhaWxh
YmxlIGluIHVwc3RyZWFtIFdlc3Rvbi4gDQpJIGRpZCB0cnkgYWRkaW5nIGV4cGxpY2l0IHN5bmMg
c3VwcG9ydCB0byBHVEsgYnV0IHRoZSBtYWludGFpbmVycyBhcmUgbm90IHBhcnRpY3VsYXJseQ0K
dGhyaWxsZWQgYWJvdXQgaXQ6DQpodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ3RrLy0v
bWVyZ2VfcmVxdWVzdHMvMzQxMA0KDQpBbnkgb3RoZXIgaWRlYXMgYXMgdG8gaG93IHRvIGVsaW1p
bmF0ZSB0aGF0IEJsaXQgY2xlYW5seT8NCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYXNpcmVkZHksIFZpdmVrIDx2aXZlay5rYXNpcmVk
ZHlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAzMCwgMjAyMSA4OjEwIFBNDQo+
IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IEthc2lyZWRkeSwgVml2ZWsgPHZpdmVr
Lmthc2lyZWRkeUBpbnRlbC5jb20+OyBHZXJkIEhvZmZtYW5uDQo+IDxrcmF4ZWxAcmVkaGF0LmNv
bT47IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPjsgS2lt
LA0KPiBEb25nd29uIDxkb25nd29uLmtpbUBpbnRlbC5jb20+OyBaaGFuZywgVGluYSA8dGluYS56
aGFuZ0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAwMC8xMV0gQWRkIHN1cHBvcnQgZm9y
IEJsb2IgcmVzb3VyY2VzIGZlYXR1cmUNCj4gDQo+IEVuYWJsaW5nIHRoaXMgZmVhdHVyZSB3b3Vs
ZCBlbGltaW5hdGUgZGF0YSBjb3BpZXMgZnJvbSB0aGUgcmVzb3VyY2Ugb2JqZWN0IGluIHRoZSBH
dWVzdCB0bw0KPiB0aGUgc2hhZG93IHJlc291cmNlIGluIFFlbXUuIFRoaXMgcGF0Y2ggc2VyaWVz
IGhvd2V2ZXIgYWRkcyBzdXBwb3J0IG9ubHkgZm9yIEJsb2JzIG9mDQo+IHR5cGUgVklSVElPX0dQ
VV9CTE9CX01FTV9HVUVTVCB3aXRoIHByb3BlcnR5DQo+IFZJUlRJT19HUFVfQkxPQl9GTEFHX1VT
RV9TSEFSRUFCTEUuDQo+IA0KPiBNb3N0IG9mIHRoZSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGFy
ZSBhIHJlYmFzZWQsIHJlZmFjdG9yZWQgYW5kIGJ1Z2ZpeGVkIHZlcnNpb25zIG9mIEdlcmQNCj4g
SG9mZm1hbm4ncyBwYXRjaGVzIGxvY2F0ZWQgaGVyZToNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL3ZpcmdsL3FlbXUvLS9jb21taXRzL3ZpcnRpby1ncHUtbmV4dA0KPiANCj4gVE9E
TzoNCj4gLSBFbmFibGUgdGhlIGNvbWJpbmF0aW9uIHZpcmdsICsgYmxvYiByZXNvdXJjZXMNCj4g
LSBBZGQgc3VwcG9ydCBmb3IgVklSVEdQVV9CTE9CX01FTV9IT1NUM0QgYmxvYnMNCj4gDQo+IENj
OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4NCj4gQ2M6IE1hcmMtQW5kcsOpIEx1
cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPg0KPiBDYzogRG9uZ3dvbiBLaW0gPGRv
bmd3b24ua2ltQGludGVsLmNvbT4NCj4gQ2M6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwu
Y29tPg0KPiANCj4gVml2ZWsgS2FzaXJlZGR5ICgxMSk6DQo+ICAgdWk6IEdldCB0aGUgZmQgYXNz
b2NpYXRlZCB3aXRoIHVkbWFidWYgZHJpdmVyDQo+ICAgdWkvcGl4bWFuOiBBZGQgcWVtdV9waXht
YW5fdG9fZHJtX2Zvcm1hdCgpDQo+ICAgdmlydGlvLWdwdTogQWRkIHVkbWFidWYgaGVscGVycw0K
PiAgIHZpcnRpby1ncHU6IEFkZCB2aXJ0aW9fZ3B1X2ZpbmRfY2hlY2tfcmVzb3VyY2UNCj4gICB2
aXJ0aW8tZ3B1OiBSZWZhY3RvciB2aXJ0aW9fZ3B1X3NldF9zY2Fub3V0DQo+ICAgdmlydGlvLWdw
dTogUmVmYWN0b3IgdmlydGlvX2dwdV9jcmVhdGVfbWFwcGluZ19pb3YNCj4gICB2aXJ0aW8tZ3B1
OiBBZGQgaW5pdGlhbCBkZWZpbml0aW9ucyBmb3IgYmxvYiByZXNvdXJjZXMNCj4gICB2aXJ0aW8t
Z3B1OiBBZGQgdmlydGlvX2dwdV9yZXNvdXJjZV9jcmVhdGVfYmxvYg0KPiAgIHZpcnRpby1ncHU6
IEFkZCBoZWxwZXJzIHRvIGNyZWF0ZSBhbmQgZGVzdHJveSBkbWFidWYgb2JqZWN0cw0KPiAgIHZp
cnRpby1ncHU6IEFkZCB2aXJ0aW9fZ3B1X3NldF9zY2Fub3V0X2Jsb2INCj4gICB2aXJ0aW8tZ3B1
OiBVcGRhdGUgY3Vyc29yIGRhdGEgdXNpbmcgYmxvYg0KPiANCj4gIGh3L2Rpc3BsYXkvbWVzb24u
YnVpbGQgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIGh3L2Rpc3BsYXkvdHJhY2Ut
ZXZlbnRzICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiAgaHcvZGlzcGxheS92aXJ0aW8t
Z3B1LTNkLmMgICAgICAgICAgICAgICAgICB8ICAgMyArLQ0KPiAgaHcvZGlzcGxheS92aXJ0aW8t
Z3B1LWJhc2UuYyAgICAgICAgICAgICAgICB8ICAgMyArDQo+ICBody9kaXNwbGF5L3ZpcnRpby1n
cHUtdWRtYWJ1Zi5jICAgICAgICAgICAgIHwgMjc2ICsrKysrKysrKysrKysNCj4gIGh3L2Rpc3Bs
YXkvdmlydGlvLWdwdS5jICAgICAgICAgICAgICAgICAgICAgfCA0MjMgKysrKysrKysrKysrKysr
LS0tLS0NCj4gIGluY2x1ZGUvaHcvdmlydGlvL3ZpcnRpby1ncHUtYnN3YXAuaCAgICAgICAgfCAg
MTYgKw0KPiAgaW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLWdwdS5oICAgICAgICAgICAgICB8ICA0
MSArLQ0KPiAgaW5jbHVkZS9zdGFuZGFyZC1oZWFkZXJzL2xpbnV4L3VkbWFidWYuaCAgICB8ICAz
MiArKw0KPiAgaW5jbHVkZS9zdGFuZGFyZC1oZWFkZXJzL2xpbnV4L3ZpcnRpb19ncHUuaCB8ICAg
MSArDQo+ICBpbmNsdWRlL3VpL2NvbnNvbGUuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAz
ICsNCj4gIGluY2x1ZGUvdWkvcWVtdS1waXhtYW4uaCAgICAgICAgICAgICAgICAgICAgfCAgIDEg
Kw0KPiAgc2NyaXB0cy91cGRhdGUtbGludXgtaGVhZGVycy5zaCAgICAgICAgICAgICB8ICAgMyAr
DQo+ICB1aS9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsN
Cj4gIHVpL3FlbXUtcGl4bWFuLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzUgKy0N
Cj4gIHVpL3VkbWFidWYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNDAgKysN
Cj4gIDE2IGZpbGVzIGNoYW5nZWQsIDc3MiBpbnNlcnRpb25zKCspLCAxMTAgZGVsZXRpb25zKC0p
ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gaHcvZGlzcGxheS92aXJ0aW8tZ3B1LXVkbWFidWYuYyAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc3RhbmRhcmQtDQo+IGhlYWRlcnMvbGludXgvdWRt
YWJ1Zi5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdWkvdWRtYWJ1Zi5jDQo+IA0KPiAtLQ0KPiAy
LjI2LjINCg0K

