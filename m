Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1A32B6946
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:02:11 +0100 (CET)
Received: from localhost ([::1]:49092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3Qo-0000EJ-Sn
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:02:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1kf3P3-0007fj-AQ
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:00:21 -0500
Received: from mga14.intel.com ([192.55.52.115]:27530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1kf3Oz-0005ii-Kv
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:00:20 -0500
IronPort-SDR: kJ308I9UbVQWXxCnzxTTXQZVG7oqn590fKe61mBn62A6GDvs8digW7tdwny2rUJNP8OF7CS1FK
 JULVSop1T31Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="170166152"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="170166152"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 08:00:13 -0800
IronPort-SDR: apJ1Lcvweo+lS9xASA0lJVziBb4K6NOt3efut3VnZIllqvowD7CB14cbsxgv+4VjWjdClxfLIj
 aYoarcv0/QSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="533860303"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga005.fm.intel.com with ESMTP; 17 Nov 2020 08:00:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Nov 2020 08:00:10 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Nov 2020 08:00:10 -0800
Received: from orsmsx612.amr.corp.intel.com ([10.22.229.25]) by
 ORSMSX612.amr.corp.intel.com ([10.22.229.25]) with mapi id 15.01.1713.004;
 Tue, 17 Nov 2020 08:00:09 -0800
From: "Venegas Munoz, Jose Carlos" <jose.carlos.venegas.munoz@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Thread-Topic: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Thread-Index: AQHWs6wS+hq1rToqXk+gGyKm0jKNO6m6eUOAgAE5L4CAAIaOAIAIjASAgAfqnYA=
Date: Tue, 17 Nov 2020 16:00:09 +0000
Message-ID: <C5CAD300-DB1D-4C6A-A2D3-2E6BA9F901DF@intel.com>
References: <20201105194416.GA1384085@redhat.com>
 <20201105195253.GB1384085@redhat.com>
 <D9233684-9B76-468E-A5F1-B35DA3F3C091@intel.com>
 <20201106223524.GG1436035@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
In-Reply-To: <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F189AD52D767C74C8E66B8902563DADD@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=jose.carlos.venegas.munoz@intel.com; helo=mga14.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 11:00:14
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, "Shinde,
 Archana M" <archana.m.shinde@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAgIE5vdCBzdXJlIHdoYXQgdGhlIGRlZmF1bHQgaXMgZm9yIDlwLCBidXQgY29tcGFyaW5nDQo+
ICAgZGVmYXVsdCB0byBkZWZhdWx0IHdpbGwgZGVmaW5pdGVseSBub3QgYmUgYXBwbGVzIHRvIGFw
cGxlcyBzaW5jZSB0aGlzDQo+ICAgbW9kZSBpcyBub25leGlzdGVudCBpbiA5cC4NCg0KSW4gS2F0
YSB3ZSBhcmUgbG9va2luZyBmb3IgdGhlIGJlc3QgY29uZmlnIGZvciBmcyBjb21wYXRpYmlsaXR5
IGFuZCBwZXJmb3JtYW5jZS4gU28gZXZlbiBpZiBhcmUgbm8gYXBwbGVzIHRvIGFwcGxlcywNCndl
IGFyZSBmb3IgdGhlIGJlc3QgY29uZmlnIGZvciBib3RoIGFuZCBjb21wYXJpbmcgdGhlIGJlc3Qg
dGhhdCBlYWNoIG9mIHRoZW0gY2FuIGRvLg0KDQpJbiB0aGUgY2FzZSBvZiBLYXRhIGZvciA5cGZz
KHRoaXMgaXMgdGhlIGNvbmZpZyB3ZSBoYXZlIGZvdW5kIGhhcyBiZXR0ZXIgcGVyZm9ybWFuY2Ug
YW5kIGZzIGNvbXBhdGliaWxpdHkgIGluIGdlbmVyYWwpIHdlIGhhdmU6DQpgYGANCi1kZXZpY2Ug
dmlydGlvLTlwLXBjaSAjIGRldmljZSB0eXBlDQosZGlzYWJsZS1tb2Rlcm49ZmFsc2UgDQosZnNk
ZXY9ZXh0cmEtOXAta2F0YVNoYXJlZCAjIGF0dHI6IGRldmljZSBpZCAgZm9yIGZzZGV2DQosbW91
bnRfdGFnPWthdGFTaGFyZWQgICMgYXR0cjogdGFnIG9uIGhvdyB3aWxsIGJlIGZvdW5kIGRlIHNo
YXJlZGZzIA0KLHJvbWZpbGU9IA0KLWZzZGV2IGxvY2FsICAjbG9jYWw6IFNpbXBseSBsZXRzIFFF
TVUgY2FsbCB0aGUgaW5kaXZpZHVhbCBWRlMgZnVuY3Rpb25zIChtb3JlIG9yIGxlc3MpIGRpcmVj
dGx5IG9uIGhvc3QuDQosaWQ9ZXh0cmEtOXAta2F0YVNoYXJlZCANCixwYXRoPSR7U0hBUkVEX1BB
VEh9ICMgYXR0cnM6IHBhdGggdG8gc2hhcmUNCixzZWN1cml0eV9tb2RlbD1ub25lICMgICAgDQoj
ICAgIHBhc3N0aHJvdWdoOiBGaWxlcyBhcmUgc3RvcmVkIHVzaW5nIHRoZSBzYW1lIGNyZWRlbnRp
YWxzIGFzIHRoZXkgYXJlIGNyZWF0ZWQgb24gdGhlIGd1ZXN0LiBUaGlzIHJlcXVpcmVzIFFFTVUg
dG8gcnVuIGFzICMgcm9vdC4NCiMgICAgbm9uZTogU2FtZSBhcyAicGFzc3Rocm91Z2giIGV4Y2Vw
dCB0aGUgc2V2ZXIgd29uJ3QgcmVwb3J0IGZhaWx1cmVzIGlmIGl0IGZhaWxzIHRvIHNldCBmaWxl
IGF0dHJpYnV0ZXMgbGlrZSBvd25lcnNoaXAgIyANCiMgIChjaG93bikuIFRoaXMgbWFrZXMgYSBw
YXNzdGhyb3VnaCBsaWtlIHNlY3VyaXR5IG1vZGVsIHVzYWJsZSBmb3IgcGVvcGxlIHdobyBydW4g
a3ZtIGFzIG5vbiByb290Lg0KLG11bHRpZGV2cz1yZW1hcA0KYGBgDQoNClRoZSBtb3VudCBvcHRp
b25zIGFyZToNCmBgYA0KdHJhbnM9dmlydGlvIA0KICAgICx2ZXJzaW9uPTlwMjAwMC5MIA0KICAg
ICxjYWNoZT1tbWFwIA0KICAgICwibm9kZXYiICMgU2VjdXJpdHk6IFRoZSBub2RldiBtb3VudCBv
cHRpb24gc3BlY2lmaWVzIHRoYXQgdGhlIGZpbGVzeXN0ZW0gY2Fubm90IGNvbnRhaW4gc3BlY2lh
bCBkZXZpY2VzLiANCiAgICAsIm1zaXplPTgxOTIiICMgbXNpemU6IE1heGltdW0gcGFja2V0IHNp
emUgaW5jbHVkaW5nIGFueSBoZWFkZXJzLg0KYGBgDQoNCkFkaXRpb25hbGx5IHdlIHVzZSB0aGlz
IHBhdGNoIGh0dHBzOi8vZ2l0aHViLmNvbS9rYXRhLWNvbnRhaW5lcnMvcGFja2FnaW5nL2Jsb2Iv
c3RhYmxlLTEuMTIvcWVtdS9wYXRjaGVzLzUuMC54LzAwMDEtOXAtcmVtb3ZpbmctY29yb3V0aW5l
cy1vZi05cC10by1pbmNyZWFzZS10aGUtSS1PLXBlci5wYXRjaA0KDQpJbiBrYXRhIGZvciB2aXJ0
aW9mcyBJIGFtIHRlc3RpbmcgIHVzZToNCmBgYA0KLWNoYXJkZXYgc29ja2V0DQosaWQ9SUQtU09D
S0VUDQoscGF0aD0uLi4vdmhvc3QtZnMuc29jayAgIyBQYXRoIHRvIHZob3N0IHNvY2tldA0KLWRl
dmljZSB2aG9zdC11c2VyLWZzLXBjaSAjDQosY2hhcmRldj1JRC1TT0NLRVQgDQosdGFnPWthdGFT
aGFyZWQgDQoscm9tZmlsZT0NCg0KIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtZmlsZSAjIGZvcmNl
IHVzZSBvZiBtZW1vcnkgc2hhcmFibGUgd2l0aCB2aXJ0aW9mc2QuIA0KICxpZD1kaW1tMQ0KICxz
aXplPTIwNDhNDQogLG1lbS1wYXRoPS9kZXYvc2htIA0KICxzaGFyZT1vbg0KYGBgDQpWaXJ0aW9m
c2Q6DQpgYGANCi1vIGNhY2hlPWF1dG8gDQotbyBub19wb3NpeF9sb2NrICMgZW5hYmxlL2Rpc2Fi
bGUgcmVtb3RlIHBvc2l4IGxvY2sNCi0tdGhyZWFkLXBvb2wtc2l6ZT0wDQpgYGANCg0KQW5kIHZp
cnRpb2ZzIG1vdW50IG9wdGlvbnM6DQpgYGANCnNvdXJjZTpcImthdGFTaGFyZWRcIiANCmZzdHlw
ZTpcInZpcnRpb2ZzXCINCmBgYA0KDQpXaXRoIHRoaXMgcGF0Y2gsIGNvbXBhcmluZyB0aGlzIHR3
byBjb25maWd1cmF0aW9ucywgSSBoYXZlIHNlZW4gYmV0dGVyIHBlcmZvcm1hbmNlIHdpdGggdmly
dGlvZnMgaW4gZGlmZmVyZW50IGhvc3RzLg0KDQotDQpDYXJsb3MNCg0KLQ0KDQrvu79PbiAxMi8x
MS8yMCAzOjA2LCAiTWlrbG9zIFN6ZXJlZGkiIDxtc3plcmVkaUByZWRoYXQuY29tPiB3cm90ZToN
Cg0KICAgIE9uIEZyaSwgTm92IDYsIDIwMjAgYXQgMTE6MzUgUE0gVml2ZWsgR295YWwgPHZnb3lh
bEByZWRoYXQuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBPbiBGcmksIE5vdiAwNiwgMjAyMCBh
dCAwODozMzo1MFBNICswMDAwLCBWZW5lZ2FzIE11bm96LCBKb3NlIENhcmxvcyB3cm90ZToNCiAg
ICA+ID4gSGkgVml2ZWssDQogICAgPiA+DQogICAgPiA+IEkgaGF2ZSB0ZXN0ZWQgd2l0aCBLYXRh
IDEuMTItYXBoYTAsIHRoZSByZXN1bHRzIHNlZW1zIHRoYXQgYXJlIGJldHRlciBmb3IgdGhlIHVz
ZSBmaW8gY29uZmlnIEkgYW0gdHJhY2tpbmcuDQogICAgPiA+DQogICAgPiA+IFRoZSBmaW8gY29u
ZmlnIGRvZXMgIHJhbmRydzoNCiAgICA+ID4NCiAgICA+ID4gZmlvIC0tZGlyZWN0PTEgLS1ndG9k
X3JlZHVjZT0xIC0tbmFtZT10ZXN0IC0tZmlsZW5hbWU9cmFuZG9tX3JlYWRfd3JpdGUuZmlvIC0t
YnM9NGsgLS1pb2RlcHRoPTY0IC0tc2l6ZT0yMDBNIC0tcmVhZHdyaXRlPXJhbmRydyAtLXJ3bWl4
cmVhZD03NQ0KICAgID4gPg0KICAgID4NCiAgICA+IEhpIENhcmxvcywNCiAgICA+DQogICAgPiBU
aGFua3MgZm9yIHRoZSB0ZXN0aW5nLg0KICAgID4NCiAgICA+IFNvIGJhc2ljYWxseSB0d28gY29u
Y2x1c2lvbnMgZnJvbSB5b3VyIHRlc3RzLg0KICAgID4NCiAgICA+IC0gZm9yIHZpcnRpb2ZzLCAt
LXRocmVhZC1wb29sLXNpemU9MCBpcyBwZXJmb3JtaW5nIGJldHRlciBhcyBjb21hcHJlZA0KICAg
ID4gICB0byAtLXRocmVhZC1wb29sLXNpemU9MSBhcyB3ZWxsIGFzIC0tdGhyZWFkLXBvb2wtc2l6
ZT02NC4gQXBwcm94aW1hdGVseQ0KICAgID4gICAzNS00MCUgYmV0dGVyLg0KICAgID4NCiAgICA+
IC0gdmlydGlvLTlwIGlzIHN0aWxsIGFwcHJveGltYXRlbHkgMzAlIGJldHRlciB0aGFuIHZpcnRp
b2ZzDQogICAgPiAgIC0tdGhyZWFkLXBvb2wtc2l6ZT0wLg0KICAgID4NCiAgICA+IEFzIEkgaGFk
IGRvbmUgdGhlIGFuYWx5c2lzIHRoYXQgdGhpcyBwYXJ0aWN1bGFyIHdvcmtsb2FkIChtaXhlZCBy
ZWFkIGFuZA0KICAgID4gd3JpdGUpIGlzIGJhZCB3aXRoIHZpcnRpb2ZzIGJlY2F1c2UgYWZ0ZXIg
ZXZlcnkgd3JpdGUgd2UgYXJlIGludmFsaWRhdGluZw0KICAgID4gYXR0cnMgYW5kIGNhY2hlIHNv
IG5leHQgcmVhZCBlbmRzIHVwIGZldGNoaW5nIGF0dHJzIGFnYWluLiBJIGhhZCBwb3N0ZWQNCiAg
ICA+IHBhdGNoZXMgdG8gZ2FpbiBzb21lIG9mIHRoZSBwZXJmb3JtYW5jZS4NCiAgICA+DQogICAg
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mc2RldmVsLzIwMjAwOTI5MTg1MDE1LkdH
MjIwNTE2QHJlZGhhdC5jb20vDQogICAgPg0KICAgID4gQnV0IEkgZ290IHRoZSBmZWVkYmFjayB0
byBsb29rIGludG8gaW1wbGVtZW50aW5nIGZpbGUgbGVhc2VzIGluc3RlYWQuDQoNCiAgICBIbW0s
IHRoZSBGVVNFX0FVVE9fSU5WQUxfREFUQSBmZWF0dXJlIGlzIGJ1Z2d5LCBob3cgYWJvdXQgdHVy
bmluZyBpdA0KICAgIG9mZiBmb3Igbm93PyAgIDlwIGRvZXNuJ3QgaGF2ZSBpdCwgc28gbm8gcG9p
bnQgaW4gZW5hYmxpbmcgaXQgZm9yDQogICAgdmlydGlvZnMgYnkgZGVmYXVsdC4NCg0KICAgIEFs
c28gSSB0aGluayBzb21lIGNvbmZ1c2lvbiBjb21lcyBmcm9tIGNhY2hlPWF1dG8gYmVpbmcgdGhl
IGRlZmF1bHQNCiAgICBmb3IgdmlydGlvZnMuICAgIE5vdCBzdXJlIHdoYXQgdGhlIGRlZmF1bHQg
aXMgZm9yIDlwLCBidXQgY29tcGFyaW5nDQogICAgZGVmYXVsdCB0byBkZWZhdWx0IHdpbGwgZGVm
aW5pdGVseSBub3QgYmUgYXBwbGVzIHRvIGFwcGxlcyBzaW5jZSB0aGlzDQogICAgbW9kZSBpcyBu
b25leGlzdGVudCBpbiA5cC4NCg0KICAgIDlwOmNhY2hlPW5vbmUgIDwtPiB2aXJ0aW9mczpjYWNo
ZT1ub25lDQogICAgOXA6Y2FjaGU9bG9vc2UgPC0+IHZpcnRpb2ZzOmNhY2hlPWFsd2F5cw0KDQog
ICAgIjlwOmNhY2hlPW1tYXAiIGFuZCAidmlydGlvZnM6Y2FjaGU9YXV0byIgaGF2ZSBubyBtYXRj
aC4NCg0KICAgIFVudGVzdGVkIHBhdGNoIGF0dGFjaGVkLg0KDQogICAgVGhhbmtzLA0KICAgIE1p
a2xvcw0KDQo=

