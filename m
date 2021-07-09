Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B723C1F27
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:57:58 +0200 (CEST)
Received: from localhost ([::1]:35392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jWO-00032F-8A
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m1jUr-0000rx-Ar
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:56:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:22977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m1jUn-0002XO-3A
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:56:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="189330432"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="189330432"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 22:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="487930927"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2021 22:56:10 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 8 Jul 2021 22:56:09 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 9 Jul 2021 13:56:07 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.010;
 Fri, 9 Jul 2021 13:56:07 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: RE: [PULL V2 1/6] qapi/net: Add IPFlowSpec and QMP command for filter
 passthrough
Thread-Topic: [PULL V2 1/6] qapi/net: Add IPFlowSpec and QMP command for
 filter passthrough
Thread-Index: AQHXbloTQ3KqX9QaG0m2nrIHIbOgwas5iOGAgACmpjA=
Date: Fri, 9 Jul 2021 05:56:07 +0000
Message-ID: <d54b15a183ee4138bc68cf3064259257@intel.com>
References: <20210701091130.3022093-1-chen.zhang@intel.com>
 <20210701091130.3022093-2-chen.zhang@intel.com>
 <a49385c6-5ccc-42db-b3ca-0f81b5734f05@redhat.com>
In-Reply-To: <a49385c6-5ccc-42db-b3ca-0f81b5734f05@redhat.com>
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
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBKdWx5IDksIDIwMjEgMTE6NTMgQU0N
Cj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6IEx1a2FzIFN0
cmF1YiA8bHVrYXNzdHJhdWIyQHdlYi5kZT47IERhbmllbCBQLiBCZXJyYW5nw6kNCj4gPGJlcnJh
bmdlQHJlZGhhdC5jb20+OyBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+OyBx
ZW11LWRldg0KPiA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgTWFya3VzIEFybWJydXN0ZXIgPGFy
bWJydUByZWRoYXQuY29tPjsNCj4gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+OyBF
cmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT47IERyLg0KPiBEYXZpZCBBbGFuIEdpbGJlcnQg
PGRnaWxiZXJ0QHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUFVMTCBWMiAxLzZdIHFhcGkv
bmV0OiBBZGQgSVBGbG93U3BlYyBhbmQgUU1QIGNvbW1hbmQgZm9yDQo+IGZpbHRlciBwYXNzdGhy
b3VnaA0KPiANCj4gDQo+IOWcqCAyMDIxLzcvMSDkuIvljYg1OjExLCBaaGFuZyBDaGVuIOWGmemB
kzoNCj4gPiBTaW5jZSB0aGUgcmVhbCB1c2VyIHNjZW5hcmlvIGRvZXMgbm90IG5lZWQgdG8gbW9u
aXRvciBhbGwgdHJhZmZpYy4NCj4gPiBBZGQgcGFzc3Rocm91Z2gtZmlsdGVyLWFkZCBhbmQgcGFz
c3Rocm91Z2gtZmlsdGVyLWRlbCB0byBtYWludGFpbiBhDQo+ID4gbmV0d29yayBwYXNzdGhyb3Vn
aCBsaXN0IGluIG9iamVjdCB3aXRoIG5ldHdvcmsgcGFja2V0IHByb2Nlc3NpbmcNCj4gPiBmdW5j
dGlvbi4gQWRkIElQRmxvd1NwZWMgc3RydWN0IGZvciBhbGwgUU1QIGNvbW1hbmRzLg0KPiA+IE1v
c3QgdGhlIGZpZWxkcyBvZiBJUEZsb3dTcGVjIGFyZSBvcHRpb25hbCxleGNlcHQgb2JqZWN0LW5h
bWUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVs
LmNvbT4NCj4gDQo+IA0KPiBIaToNCj4gDQo+IEkgd291bGQgbGlrZSB0byBoYXZlIGFjayBmcm9t
IHRoZSBRQVBJIGd1eXMgZm9yIHRoaXMgcGF0Y2guDQoNClN1cmUsIE1hcmt1cyBhbHJlYWR5IGdp
dmUgc29tZSBjb21tZW50cyBmb3IgdGhpcyBwYXRjaC4NCkhpIE1hcmt1cywgIENhbiB5b3UgcGxl
YXNlIGFkZCBhbiBhY2sgdG8gdGhpcyBwYXRjaD8NCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+IFRo
YW5rcw0KPiANCj4gDQo+ID4gLS0tDQo+ID4gICBuZXQvbmV0LmMgICAgIHwgMTAgKysrKysrKw0K
PiA+ICAgcWFwaS9uZXQuanNvbiB8IDc4DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4OCBpbnNlcnRp
b25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbmV0L25ldC5jIGIvbmV0L25ldC5jDQo+ID4g
aW5kZXggNzZiYmI3YzMxYi4uMDBmMmJlN2E1OCAxMDA2NDQNCj4gPiAtLS0gYS9uZXQvbmV0LmMN
Cj4gPiArKysgYi9uZXQvbmV0LmMNCj4gPiBAQCAtMTE5NSw2ICsxMTk1LDE2IEBAIHZvaWQgcW1w
X25ldGRldl9kZWwoY29uc3QgY2hhciAqaWQsIEVycm9yDQo+ICoqZXJycCkNCj4gPiAgICAgICB9
DQo+ID4gICB9DQo+ID4NCj4gPiArdm9pZCBxbXBfcGFzc3Rocm91Z2hfZmlsdGVyX2FkZChJUEZs
b3dTcGVjICpzcGVjLCBFcnJvciAqKmVycnApIHsNCj4gPiArICAgIC8qIFRPRE8gaW1wbGVtZW50
IHNldHVwIHBhc3N0aHJvdWdoIHJ1bGUgKi8gfQ0KPiA+ICsNCj4gPiArdm9pZCBxbXBfcGFzc3Ro
cm91Z2hfZmlsdGVyX2RlbChJUEZsb3dTcGVjICpzcGVjLCBFcnJvciAqKmVycnApIHsNCj4gPiAr
ICAgIC8qIFRPRE8gaW1wbGVtZW50IGRlbGV0ZSBwYXNzdGhyb3VnaCBydWxlICovIH0NCj4gPiAr
DQo+ID4gICBzdGF0aWMgdm9pZCBuZXRmaWx0ZXJfcHJpbnRfaW5mbyhNb25pdG9yICptb24sIE5l
dEZpbHRlclN0YXRlICpuZikNCj4gPiAgIHsNCj4gPiAgICAgICBjaGFyICpzdHI7DQo+ID4gZGlm
ZiAtLWdpdCBhL3FhcGkvbmV0Lmpzb24gYi9xYXBpL25ldC5qc29uIGluZGV4DQo+ID4gN2ZhYjJl
N2NkOC4uYmZlMzhmYWFiNSAxMDA2NDQNCj4gPiAtLS0gYS9xYXBpL25ldC5qc29uDQo+ID4gKysr
IGIvcWFwaS9uZXQuanNvbg0KPiA+IEBAIC03LDYgKzcsNyBAQA0KPiA+ICAgIyMNCj4gPg0KPiA+
ICAgeyAnaW5jbHVkZSc6ICdjb21tb24uanNvbicgfQ0KPiA+ICt7ICdpbmNsdWRlJzogJ3NvY2tl
dHMuanNvbicgfQ0KPiA+DQo+ID4gICAjIw0KPiA+ICAgIyBAc2V0X2xpbms6DQo+ID4gQEAgLTY5
NiwzICs2OTcsODAgQEANCj4gPiAgICMjDQo+ID4gICB7ICdldmVudCc6ICdGQUlMT1ZFUl9ORUdP
VElBVEVEJywNCj4gPiAgICAgJ2RhdGEnOiB7J2RldmljZS1pZCc6ICdzdHInfSB9DQo+ID4gKw0K
PiA+ICsjIw0KPiA+ICsjIEBJUEZsb3dTcGVjOg0KPiA+ICsjDQo+ID4gKyMgSVAgZmxvdyBzcGVj
aWZpY2F0aW9uLg0KPiA+ICsjDQo+ID4gKyMgQHByb3RvY29sOiBUcmFuc3BvcnQgbGF5ZXIgcHJv
dG9jb2wgbGlrZSBUQ1AvVURQLCBldGMuIFRoZSBwcm90b2NvbCBpcw0KPiB0aGUNCj4gPiArIyAg
ICAgICAgICAgIHN0cmluZyBpbnN0ZWFkIG9mIGVudW0sIGJlY2F1c2UgaXQgY2FuIGJlIHBhc3Nl
ZCB0bw0KPiBnZXRwcm90b2J5bmFtZSgzKQ0KPiA+ICsjICAgICAgICAgICAgYW5kIGF2b2lkIGR1
cGxpY2F0aW9uIHdpdGggL2V0Yy9wcm90b2NvbHMuDQo+ID4gKyMNCj4gPiArIyBAb2JqZWN0LW5h
bWU6IFRoZSBAb2JqZWN0LW5hbWUgbWVhbnMgYSBxZW11IG9iamVjdCB3aXRoIG5ldHdvcmsNCj4g
cGFja2V0DQo+ID4gKyMgICAgICAgICAgICAgICBwcm9jZXNzaW5nIGZ1bmN0aW9uLCBmb3IgZXhh
bXBsZSBjb2xvLWNvbXBhcmUsIGZpbHRyLXJlZGlyZWN0b3INCj4gPiArIyAgICAgICAgICAgICAg
IGZpbHRyLW1pcnJvciwgZXRjLiBWTSBjYW4gcnVubmluZyB3aXRoIG11bHRpIG5ldHdvcmsgcGFj
a2V0DQo+ID4gKyMgICAgICAgICAgICAgICBwcm9jZXNzaW5nIGZ1bmN0aW9uIG9iamVjdHMuIFRo
ZXkgY2FuIGNvbnRyb2wgZGlmZmVyZW50IG5ldHdvcmsNCj4gPiArIyAgICAgICAgICAgICAgIGRh
dGEgcGF0aHMgZnJvbSBuZXRkZXYgb3IgY2hhcmRldi4gU28gaXQgbmVlZHMgdGhlIG9iamVjdC1u
YW1lDQo+ID4gKyMgICAgICAgICAgICAgICB0byBzZXQgdGhlIGVmZmVjdGl2ZSBtb2R1bGUuDQo+
ID4gKyMNCj4gPiArIyBAc291cmNlOiBTb3VyY2UgYWRkcmVzcyBhbmQgcG9ydC4NCj4gPiArIw0K
PiA+ICsjIEBkZXN0aW5hdGlvbjogRGVzdGluYXRpb24gYWRkcmVzcyBhbmQgcG9ydC4NCj4gPiAr
Iw0KPiA+ICsjIFNpbmNlOiA2LjENCj4gPiArIyMNCj4gPiAreyAnc3RydWN0JzogJ0lQRmxvd1Nw
ZWMnLA0KPiA+ICsgICdkYXRhJzogeyAnKnByb3RvY29sJzogJ3N0cicsICdvYmplY3QtbmFtZSc6
ICdzdHInLA0KPiA+ICsgICAgJypzb3VyY2UnOiAnSW5ldFNvY2tldEFkZHJlc3NCYXNlJywNCj4g
PiArICAgICcqZGVzdGluYXRpb24nOiAnSW5ldFNvY2tldEFkZHJlc3NCYXNlJyB9IH0NCj4gPiAr
DQo+ID4gKyMjDQo+ID4gKyMgQHBhc3N0aHJvdWdoLWZpbHRlci1hZGQ6DQo+ID4gKyMNCj4gPiAr
IyBBZGQgcGFzc3Rocm91Z2ggZW50cnkgSVBGbG93U3BlYyB0byBhIHFlbXUgb2JqZWN0IHdpdGgg
bmV0d29yaw0KPiA+ICtwYWNrZXQgIyBwcm9jZXNzaW5nIGZ1bmN0aW9uLCBmb3IgZXhhbXBsZSBm
aWx0ci1taXJyb3IsIENPTE8tY29tcGFyZSwgZXRjLg0KPiA+ICsjIFRoZSBvYmplY3QtbmFtZSBp
cyBuZWNlc3NhcnkuIFRoZSBwcm90b2NvbCBhbmQgc291cmNlL2Rlc3RpbmF0aW9uDQo+ID4gK0lQ
IGFuZCAjIHNvdXJjZS9kZXN0aW5hdGlvbiBwb3J0cyBhcmUgb3B0aW9uYWwuIGlmIG9ubHkgaW5w
dXRzIHBhcnQNCj4gPiArb2YgdGhlICMgaW5mb3JtYXRpb24sIGl0IHdpbGwgbWF0Y2ggYWxsIHRy
YWZmaWMuDQo+ID4gKyMNCj4gPiArIyBSZXR1cm5zOiBOb3RoaW5nIG9uIHN1Y2Nlc3MNCj4gPiAr
Iw0KPiA+ICsjIFNpbmNlOiA2LjENCj4gPiArIw0KPiA+ICsjIEV4YW1wbGU6DQo+ID4gKyMNCj4g
PiArIyAtPiB7ICJleGVjdXRlIjogInBhc3N0aHJvdWdoLWZpbHRlci1hZGQiLA0KPiA+ICsjICAg
ICAgImFyZ3VtZW50cyI6IHsgInByb3RvY29sIjogInRjcCIsICJvYmplY3QtbmFtZSI6ICJvYmpl
Y3QwIiwNCj4gPiArIyAgICAgICJzb3VyY2UiOiB7Imhvc3QiOiAiMTkyLjE2OC4xLjEiLCAicG9y
dCI6ICIxMjM0In0sDQo+ID4gKyMgICAgICAiZGVzdGluYXRpb24iOiB7Imhvc3QiOiAiMTkyLjE2
OC4xLjIiLCAicG9ydCI6ICI0MzIxIn0gfSB9DQo+ID4gKyMgPC0geyAicmV0dXJuIjoge30gfQ0K
PiA+ICsjDQo+ID4gKyMjDQo+ID4gK3sgJ2NvbW1hbmQnOiAncGFzc3Rocm91Z2gtZmlsdGVyLWFk
ZCcsICdib3hlZCc6IHRydWUsDQo+ID4gKyAgICAgJ2RhdGEnOiAnSVBGbG93U3BlYycgfQ0KPiA+
ICsNCj4gPiArIyMNCj4gPiArIyBAcGFzc3Rocm91Z2gtZmlsdGVyLWRlbDoNCj4gPiArIw0KPiA+
ICsjIERlbGV0ZSBwYXNzdGhyb3VnaCBlbnRyeSBJUEZsb3dTcGVjIHRvIGEgcWVtdSBvYmplY3Qg
d2l0aCBuZXR3b3JrDQo+ID4gK3BhY2tldCAjIHByb2Nlc3NpbmcgZnVuY3Rpb24sIGZvciBleGFt
cGxlIGZpbHRyLW1pcnJvciwgQ09MTy1jb21wYXJlLCBldGMuDQo+ID4gKyMgVGhlIG9iamVjdC1u
YW1lIGlzIG5lY2Vzc2FyeS4gVGhlIHByb3RvY29sIGFuZCBzb3VyY2UvZGVzdGluYXRpb24NCj4g
PiArSVAgYW5kICMgc291cmNlL2Rlc3RpbmF0aW9uIHBvcnRzIGFyZSBvcHRpb25hbC4gaWYgb25s
eSBpbnB1dHMgcGFydA0KPiA+ICtvZiB0aGUgIyBpbmZvcm1hdGlvbiwgb25seSB0aGUgZXhhY3Qg
c2FtZSBydWxlIHdpbGwgYmUgZGVsZXRlZC4NCj4gPiArIw0KPiA+ICsjIFJldHVybnM6IE5vdGhp
bmcgb24gc3VjY2Vzcw0KPiA+ICsjDQo+ID4gKyMgU2luY2U6IDYuMQ0KPiA+ICsjDQo+ID4gKyMg
RXhhbXBsZToNCj4gPiArIw0KPiA+ICsjIC0+IHsgImV4ZWN1dGUiOiAicGFzc3Rocm91Z2gtZmls
dGVyLWRlbCIsDQo+ID4gKyMgICAgICAiYXJndW1lbnRzIjogeyAicHJvdG9jb2wiOiAidGNwIiwg
Im9iamVjdC1uYW1lIjogIm9iamVjdDAiLA0KPiA+ICsjICAgICAgInNvdXJjZSI6IHsiaG9zdCI6
ICIxOTIuMTY4LjEuMSIsICJwb3J0IjogIjEyMzQifSwNCj4gPiArIyAgICAgICJkZXN0aW5hdGlv
biI6IHsiaG9zdCI6ICIxOTIuMTY4LjEuMiIsICJwb3J0IjogIjQzMjEifSB9IH0NCj4gPiArIyA8
LSB7ICJyZXR1cm4iOiB7fSB9DQo+ID4gKyMNCj4gPiArIyMNCj4gPiAreyAnY29tbWFuZCc6ICdw
YXNzdGhyb3VnaC1maWx0ZXItZGVsJywgJ2JveGVkJzogdHJ1ZSwNCj4gPiArICAgICAnZGF0YSc6
ICdJUEZsb3dTcGVjJyB9DQoNCg==

