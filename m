Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D43A73EF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 04:27:59 +0200 (CEST)
Received: from localhost ([::1]:34190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsyo2-0001mX-QH
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 22:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lsyn3-0000bi-RE
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 22:26:57 -0400
Received: from mga05.intel.com ([192.55.52.43]:12342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lsymx-0002qV-Uv
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 22:26:56 -0400
IronPort-SDR: xWPJbaXpgynhWYBmyGZZclwBsIwj1q5Fm0F4RPKC0fDQPWp1yWB0d54un4XzLoKhK1VAvZh3u8
 ojuL3PoBVCRw==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="291542978"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="291542978"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 19:26:43 -0700
IronPort-SDR: rq8fi1WqiGSbtLSQRjuc27LHJoD0eUK+NfpEUltnsKeHVGOE5l+X4F+bWkAI1h/+P2pZn1e9XN
 t2xsAwu1+b4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="420972935"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga002.jf.intel.com with ESMTP; 14 Jun 2021 19:26:42 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 14 Jun 2021 19:26:41 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 10:26:39 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Tue, 15 Jun 2021 10:26:39 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V7 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Thread-Topic: [PATCH V7 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Thread-Index: AQHXUdthkZsZrNXk3keJMgxjCRGGYqsDc96AgACWN9CACpzlj4AFwl4g
Date: Tue, 15 Jun 2021 02:26:39 +0000
Message-ID: <b2a59647a8d64bcf957c3f82b97abf7a@intel.com>
References: <20210526025424.1319994-1-chen.zhang@intel.com>
 <20210526025424.1319994-2-chen.zhang@intel.com>
 <20210604143521.ej6n7g5tlawkhwpj@redhat.com>
 <9a7a70304c304d2f99e5ee952eddf49f@intel.com>
 <87mtrwspxo.fsf@dusky.pond.sub.org>
In-Reply-To: <87mtrwspxo.fsf@dusky.pond.sub.org>
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
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?utf-8?B?RGFuaWVsIFAuQmVycmFuZ8Op?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFya3VzIEFybWJydXN0
ZXIgPGFybWJydUByZWRoYXQuY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bmUgMTEsIDIwMjEgNToz
NyBQTQ0KPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiBDYzogRXJp
YyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+OyBMdWthcyBTdHJhdWIgPGx1a2Fzc3RyYXViMkB3
ZWIuZGU+Ow0KPiBEYW5pZWwgUC5CZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+OyBMaSBa
aGlqaWFuDQo+IDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+OyBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPjsgTWFya3VzDQo+IEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPjsg
cWVtdS1kZXYgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47DQo+IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPjsgWmhhbmcgQ2hlbiA8emhhbmdja2lkQGdtYWlsLmNvbT47DQo+IERyLiBE
YXZpZCBBbGFuIEdpbGJlcnQgPGRnaWxiZXJ0QHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggVjcgMS82XSBxYXBpL25ldDogQWRkIElQRmxvd1NwZWMgYW5kIFFNUCBjb21tYW5kDQo+
IGZvciBDT0xPIHBhc3N0aHJvdWdoDQo+IA0KPiAiWmhhbmcsIENoZW4iIDxjaGVuLnpoYW5nQGlu
dGVsLmNvbT4gd3JpdGVzOg0KPiANCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4gRnJvbTogRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+DQo+ID4+IFNlbnQ6IEZyaWRh
eSwgSnVuZSA0LCAyMDIxIDEwOjM1IFBNDQo+ID4+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFu
Z0BpbnRlbC5jb20+DQo+ID4+IENjOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsg
cWVtdS1kZXYgPHFlbXUtDQo+ID4+IGRldmVsQG5vbmdudS5vcmc+OyBEci4gRGF2aWQgQWxhbiBH
aWxiZXJ0IDxkZ2lsYmVydEByZWRoYXQuY29tPjsNCj4gPj4gTWFya3VzIEFybWJydXN0ZXIgPGFy
bWJydUByZWRoYXQuY29tPjsgRGFuaWVsIFAuIEJlcnJhbmfDqQ0KPiA+PiA8YmVycmFuZ2VAcmVk
aGF0LmNvbT47IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPjsgTGkNCj4gWmhpamlh
bg0KPiA+PiA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPjsgWmhhbmcgQ2hlbiA8emhhbmdja2lk
QGdtYWlsLmNvbT47IEx1a2FzDQo+ID4+IFN0cmF1YiA8bHVrYXNzdHJhdWIyQHdlYi5kZT4NCj4g
Pj4gU3ViamVjdDogUmU6IFtQQVRDSCBWNyAxLzZdIHFhcGkvbmV0OiBBZGQgSVBGbG93U3BlYyBh
bmQgUU1QDQo+IGNvbW1hbmQNCj4gPj4gZm9yIENPTE8gcGFzc3Rocm91Z2gNCj4gPj4NCj4gPj4g
T24gV2VkLCBNYXkgMjYsIDIwMjEgYXQgMTA6NTQ6MTlBTSArMDgwMCwgWmhhbmcgQ2hlbiB3cm90
ZToNCj4gPj4gPiBTaW5jZSB0aGUgcmVhbCB1c2VyIHNjZW5hcmlvIGRvZXMgbm90IG5lZWQgQ09M
TyB0byBtb25pdG9yIGFsbCB0cmFmZmljLg0KPiA+PiA+IEFkZCBjb2xvLXBhc3N0aHJvdWdoLWFk
ZCBhbmQgY29sby1wYXNzdGhyb3VnaC1kZWwgdG8gbWFpbnRhaW4gYQ0KPiA+PiA+IENPTE8gbmV0
d29yayBwYXNzdGhyb3VnaCBsaXN0LiBBZGQgSVBGbG93U3BlYyBzdHJ1Y3QgZm9yIGFsbCBRTVAN
Cj4gY29tbWFuZHMuDQo+ID4+ID4gRXhjZXB0IHByb3RvY29sIGZpZWxkIGlzIG5lY2Vzc2FyeSwg
b3RoZXIgZmllbGRzIGFyZSBvcHRpb25hbC4NCj4gPj4NCj4gPj4gVGhhdCBsYXN0IHNlbnRlbmNl
IHJlYWRzIGF3a3dhcmRseSwgYW5kIEkgZG9uJ3Qgc2VlIGEgcHJvdG9jb2wgZmllbGQNCj4gPj4g
aW4gdGhlIHBhdGNoIGJlbG93Lg0KPiA+DQo+ID4gT2gsIFdlIG1vdmUgdGhlIHByb3RvY29sIGZp
ZWxkIHRvIG9wdGlvbmFsIGJ5IEx1a2FzJ3MgY29tbWVudHMgaW4gVjYuDQo+ID4gSSB3aWxsIHJl
bW92ZSB0aGlzIGNvbW1lbnRzIGhlcmUuDQo+ID4NCj4gPj4NCj4gPj4gPg0KPiA+PiA+IFNpZ25l
ZC1vZmYtYnk6IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiA+PiA+IC0tLQ0K
PiA+PiA+ICBuZXQvbmV0LmMgICAgIHwgMTAgKysrKysrKysNCj4gPj4gPiAgcWFwaS9uZXQuanNv
biB8IDY4DQo+ID4+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKQ0KPiA+
PiA+DQo+ID4+DQo+ID4+ID4gKysrIGIvcWFwaS9uZXQuanNvbg0KPiA+PiA+IEBAIC03LDYgKzcs
NyBAQA0KPiA+PiA+ICAjIw0KPiA+PiA+DQo+ID4+ID4gIHsgJ2luY2x1ZGUnOiAnY29tbW9uLmpz
b24nIH0NCj4gPj4gPiAreyAnaW5jbHVkZSc6ICdzb2NrZXRzLmpzb24nIH0NCj4gPj4gPg0KPiA+
PiA+ICAjIw0KPiA+PiA+ICAjIEBzZXRfbGluazoNCj4gPj4gPiBAQCAtNjk0LDMgKzY5NSw3MCBA
QA0KPiA+PiA+ICAjIw0KPiA+PiA+ICB7ICdldmVudCc6ICdGQUlMT1ZFUl9ORUdPVElBVEVEJywN
Cj4gPj4gPiAgICAnZGF0YSc6IHsnZGV2aWNlLWlkJzogJ3N0cid9IH0NCj4gPj4gPiArDQo+ID4+
ID4gKyMjDQo+ID4+ID4gKyMgQElQRmxvd1NwZWM6DQo+ID4+ID4gKyMNCj4gPj4gPiArIyBJUCBm
bG93IHNwZWNpZmljYXRpb24uDQo+ID4+ID4gKyMNCj4gPj4gPiArIyBAcHJvdG9jb2w6IFRyYW5z
cG9ydCBsYXllciBwcm90b2NvbCBsaWtlIFRDUC9VRFAuLi4NCj4gPj4NCj4gPj4gV2h5IGlzIHRo
aXMgb3Blbi1jb2RlZCBhcyAnc3RyJyBpbnN0ZWFkIG9mIGFuIGVudW0/DQo+ID4NCj4gPiBUaGUg
b3JpZ2luYWwgY29kZSB1c2UgZW51bSwgYnV0IHdlIGNoYW5nZSBpdCBieSBEYXZlIGFuZCBNYXJr
dXMncw0KPiBjb21tZW50cy4NCj4gPiBQbGVhc2UgY2hlY2sgdGhlIGhpc3Rvcnk6DQo+ID4gaHR0
cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjEtMDQvbXNnMDM5
MTkuaHRtbA0KPiANCj4gSXQncyBhIHN0cmluZyB0byBiZSBwYXNzZWQgdG8gZ2V0cHJvdG9ieW5h
bWUoMykuICBQbGVhc2UgbWVudGlvbiB0aGF0IGluIHRoZQ0KPiBkb2Mgc3RyaW5nLg0KDQpPSywg
SSB3aWxsIGFkZCB0aGlzIHRvIGNvbW1pdCBsb2cgYW5kIHFhcGkvbmV0Lmpzb24gIGluIG5leHQg
dmVyc2lvbi4NCg0KPiANCj4gSXQncyBub3QgYW4gZW51bSwgYmVjYXVzZSB3ZSBkb24ndCB3YW50
IHRvIGR1cGxpY2F0ZSAvZXRjL3Byb3RvY29scyBpbiB0aGUNCj4gUUFQSSBzY2hlbWEuDQoNClll
cy4NCg0KPiANCj4gPj4gPiArIw0KPiA+PiA+ICsjIEBvYmplY3QtbmFtZTogUG9pbnQgb3V0IHRo
ZSBJUGZsb3cgc3BlYyBlZmZlY3RpdmUgcmFuZ2Ugb2YNCj4gPj4gPiArb2JqZWN0LA0KPiANCj4g
SSBoYXZlIG5vIGlkZWEgd2hhdCB0aGF0IG1lYW5zIDopDQo+IA0KPiBJdCBtaWdodCBiZSB3aGF0
IHdhcyBjYWxsZWQgQGlkIGluIHY0LiAgVGhlcmUsIHlvdSBleHBsYWluZWQNCj4gDQo+ICAgICBU
aGUgQGlkIG1lYW5zIHBhY2tldCBoYW5kZXIgaW4gUWVtdS4gQmVjYXVzZSBub3QgYWxsIHRoZSBn
dWVzdCBuZXR3b3JrDQo+IHBhY2tldCBpbnRvIHRoZSBjb2xvLWNvbXBhcmUgbW9kdWxlLCB0aGUg
bmV0LWZpbHRlcnMgYXJlIHNhbWUgY2FzZXMuDQo+ICAgICBUaGVyZSBtb2R1bGVzIGF0dGFjaCB0
byBOSUMgb3IgY2hhcmRldiBzb2NrZXQgdG8gd29yaywgVk0gbWF5YmUgaGF2ZQ0KPiBtdWx0aSBt
b2R1bGVzIHJ1bm5pbmcuIFNvIHdlIHVzZSB0aGUgSUQgdG8gc2V0IHRoZSBydWxlIHRvIHRoZSBz
cGVjaWZpYw0KPiBtb2R1bGUuDQo+IA0KPiBhbmQgSSBhc2tlZCB5b3UgdG8gd29yayBpdCBpbnRv
IHRoZSBkb2MgY29tbWVudC4NCj4gDQoNClllcywgQXMgd2UgZGlzY3Vzc2VkIEluIFY0LCBhbHJl
YWR5IGNoYW5nZWQgdGhlICJpZCIgdG8gIm9iamVjdC1uYW1lIi4NCmh0dHBzOi8vbGlzdHMuZ251
Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIxLTA0L21zZzAxMDg4Lmh0bWwgDQoNCkFu
ZCBzb3JyeSBJIG1pc3NlZCBhbm90aGVyIG1haWwgdGhyZWFkIHRvIGFkZCB0aGUgY29tbWVudHMs
IEkgd2lsbCBhZGQgdGhlIGV4cGxhbmF0aW9uIGFuZCBxdWljayB1cGRhdGUgdG8gVjggZm9yIHRo
aXMgc2VyaWVzLg0KVGhhbmtzIGZvciB5b3VyIGhlbHB+DQoNClRoYW5rcw0KQ2hlbg0KDQo+IElm
IHlvdSB3YW50IGhlbHAgd2l0aCB3b3JraW5nIGl0IGludG8gdGhlIGRvYyBjb21tZW50LCBwbGVh
c2UgZXhwbGFpbiBpdHMNCj4gaW50ZW5kZWQgdXNlIGZvciBkdW1taWVzIDopDQo+IA0KPiA+PiA+
ICsjICAgICAgICAgICAgICAgSWYgdGhlcmUgaXMgbm8gc3VjaCBwYXJ0LCBpdCBtZWFucyBnbG9i
YWwgc3BlYy4NCj4gPj4gPiArIw0KPiA+PiA+ICsjIEBzb3VyY2U6IFNvdXJjZSBhZGRyZXNzIGFu
ZCBwb3J0Lg0KPiA+PiA+ICsjDQo+ID4+ID4gKyMgQGRlc3RpbmF0aW9uOiBEZXN0aW5hdGlvbiBh
ZGRyZXNzIGFuZCBwb3J0Lg0KPiA+PiA+ICsjDQo+ID4+ID4gKyMgU2luY2U6IDYuMQ0KPiA+PiA+
ICsjIw0KPiA+PiA+ICt7ICdzdHJ1Y3QnOiAnSVBGbG93U3BlYycsDQo+ID4+ID4gKyAgJ2RhdGEn
OiB7ICcqcHJvdG9jb2wnOiAnc3RyJywgJypvYmplY3QtbmFtZSc6ICdzdHInLA0KPiA+PiA+ICsg
ICAgJypzb3VyY2UnOiAnSW5ldFNvY2tldEFkZHJlc3NCYXNlJywNCj4gPj4gPiArICAgICcqZGVz
dGluYXRpb24nOiAnSW5ldFNvY2tldEFkZHJlc3NCYXNlJyB9IH0NCj4gPj4gPiArDQo+ID4+ID4g
KyMjDQo+ID4+ID4gKyMgQGNvbG8tcGFzc3Rocm91Z2gtYWRkOg0KPiA+PiA+ICsjDQo+ID4+ID4g
KyMgQWRkIHBhc3N0aHJvdWdoIGVudHJ5IGFjY29yZGluZyB0byB1c2VyJ3MgbmVlZHMgaW4gQ09M
Ty1jb21wYXJlLg0KPiA+PiA+ICsjIFNvdXJjZSBJUC9wb3J0IGFuZCBkZXN0aW5hdGlvbiBJUC9w
b3J0IGJvdGggb3B0aW9uYWwsIElmIHVzZXINCj4gPj4gPiAranVzdCAjIGlucHV0IHBhcnRzIG9m
IGluZm90bWF0aW9uLCBpdCB3aWxsIG1hdGNoIGFsbC4NCj4gPj4NCj4gPj4gaW5mb3JtYXRpb24N
Cj4gPj4NCj4gPj4gR3JhbW1hciBzdWdnZXN0aW9uOg0KPiA+Pg0KPiA+PiBUaGUgc291cmNlIGFu
ZCBkZXN0aW5hdGlvbiBJUC9wb3J0cyBhcmUgYm90aCBvcHRpb25hbDsgaWYgdGhlIHVzZXINCj4g
Pj4gb25seSBpbnB1dHMgcGFydCBvZiB0aGUgaW5mb3JtYXRpb24sIHRoaXMgd2lsbCBtYXRjaCBh
bGwgdHJhZmZpYy4NCj4gPj4NCj4gPj4gZXhjZXB0IEknbSBub3Qgc3VyZSBpZiBteSByZXdyaXRl
IGNvbnZleXMgdGhlIGFjdHVhbCBpbnRlbnQuDQo+ID4NCj4gPiBMb29rcyBnb29kIHRvIG1lLCBJ
dCBzaG91bGQgYWRkIHRoZSAicHJvdG9jb2wiIHRvIG9wdGlvbmFsIHRvby4NCj4gPiBTb3JyeSwg
SSdtIG5vdCBhIG5hdGl2ZSBzcGVha2VyLCBJIHdpbGwgZml4IGl0IGluIG5leHQgdmVyc2lvbi4N
Cj4gPg0KPiA+Pg0KPiA+PiA+ICsjDQo+ID4+ID4gKyMgUmV0dXJuczogTm90aGluZyBvbiBzdWNj
ZXNzDQo+ID4+ID4gKyMNCj4gPj4gPiArIyBTaW5jZTogNi4xDQo+ID4+ID4gKyMNCj4gPj4gPiAr
IyBFeGFtcGxlOg0KPiA+PiA+ICsjDQo+ID4+ID4gKyMgLT4geyAiZXhlY3V0ZSI6ICJjb2xvLXBh
c3N0aHJvdWdoLWFkZCIsDQo+ID4+ID4gKyMgICAgICAiYXJndW1lbnRzIjogeyAicHJvdG9jb2wi
OiAidGNwIiwgIm9iamVjdC1uYW1lIjogIm9iamVjdDAiLA0KPiA+PiA+ICsjICAgICAgInNvdXJj
ZSI6IHsiaG9zdCI6ICIxOTIuMTY4LjEuMSIsICJwb3J0IjogIjEyMzQifSwNCj4gPj4gPiArIyAg
ICAgICJkZXN0aW5hdGlvbiI6IHsiaG9zdCI6ICIxOTIuMTY4LjEuMiIsICJwb3J0IjogIjQzMjEi
fSB9IH0NCj4gPj4gPiArIyA8LSB7ICJyZXR1cm4iOiB7fSB9DQo+ID4+ID4gKyMNCj4gPj4gPiAr
IyMNCj4gPj4gPiAreyAnY29tbWFuZCc6ICdjb2xvLXBhc3N0aHJvdWdoLWFkZCcsICdib3hlZCc6
IHRydWUsDQo+ID4+ID4gKyAgICAgJ2RhdGEnOiAnSVBGbG93U3BlYycgfQ0KPiA+PiA+ICsNCj4g
Pj4gPiArIyMNCj4gPj4gPiArIyBAY29sby1wYXNzdGhyb3VnaC1kZWw6DQo+ID4+ID4gKyMNCj4g
Pj4gPiArIyBEZWxldGUgcGFzc3Rocm91Z2ggZW50cnkgYWNjb3JkaW5nIHRvIHVzZXIncyBuZWVk
cyBpbiBDT0xPLQ0KPiBjb21wYXJlLg0KPiA+PiA+ICsjIFNvdXJjZSBJUC9wb3J0IGFuZCBkZXN0
aW5hdGlvbiBJUC9wb3J0IGJvdGggb3B0aW9uYWwsIElmIHVzZXINCj4gPj4gPiAranVzdCAjIGlu
cHV0IHBhcnRzIG9mIGluZm90bWF0aW9uLCBpdCB3aWxsIG1hdGNoIGFsbC4NCj4gPj4NCj4gPj4g
U2FtZSBwcm9ibGVtcyBhcyBhYm92ZS4NCj4gPg0KPiA+IE9LLg0KPiA+DQo+ID4gVGhhbmtzDQo+
ID4gQ2hlbg0KPiA+DQo+ID4+DQo+ID4+ID4gKyMNCj4gPj4gPiArIyBSZXR1cm5zOiBOb3RoaW5n
IG9uIHN1Y2Nlc3MNCj4gPj4gPiArIw0KPiA+PiA+ICsjIFNpbmNlOiA2LjENCj4gPj4gPiArIw0K
PiA+PiA+ICsjIEV4YW1wbGU6DQo+ID4+ID4gKyMNCj4gPj4gPiArIyAtPiB7ICJleGVjdXRlIjog
ImNvbG8tcGFzc3Rocm91Z2gtZGVsIiwNCj4gPj4gPiArIyAgICAgICJhcmd1bWVudHMiOiB7ICJw
cm90b2NvbCI6ICJ0Y3AiLCAib2JqZWN0LW5hbWUiOiAib2JqZWN0MCIsDQo+ID4+ID4gKyMgICAg
ICAic291cmNlIjogeyJob3N0IjogIjE5Mi4xNjguMS4xIiwgInBvcnQiOiAiMTIzNCJ9LA0KPiA+
PiA+ICsjICAgICAgImRlc3RpbmF0aW9uIjogeyJob3N0IjogIjE5Mi4xNjguMS4yIiwgInBvcnQi
OiAiNDMyMSJ9IH0gfQ0KPiA+PiA+ICsjIDwtIHsgInJldHVybiI6IHt9IH0NCj4gPj4gPiArIw0K
PiA+PiA+ICsjIw0KPiA+PiA+ICt7ICdjb21tYW5kJzogJ2NvbG8tcGFzc3Rocm91Z2gtZGVsJywg
J2JveGVkJzogdHJ1ZSwNCj4gPj4gPiArICAgICAnZGF0YSc6ICdJUEZsb3dTcGVjJyB9DQo+ID4+
ID4gLS0NCj4gPj4gPiAyLjI1LjENCj4gPj4gPg0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiBFcmljIEJs
YWtlLCBQcmluY2lwYWwgU29mdHdhcmUgRW5naW5lZXINCj4gPj4gUmVkIEhhdCwgSW5jLiAgICAg
ICAgICAgKzEtOTE5LTMwMS0zMjY2DQo+ID4+IFZpcnR1YWxpemF0aW9uOiAgcWVtdS5vcmcgfCBs
aWJ2aXJ0Lm9yZw0KDQo=

