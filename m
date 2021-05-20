Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB8389D56
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:50:12 +0200 (CEST)
Received: from localhost ([::1]:37372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljbZT-0007aM-Cv
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ljbYZ-0006i0-HY
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:49:15 -0400
Received: from mga06.intel.com ([134.134.136.31]:7874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ljbYX-0002xt-Ep
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:49:15 -0400
IronPort-SDR: hHN7z/0gOFl0JLFU/L9j8sSeAumavpUhpby71YkuMRJGcQNpcB0LWOwwvDfYzD8MJryfBD2e34
 HvQZXzZ6ybQw==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262372221"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262372221"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 22:49:11 -0700
IronPort-SDR: k/t5TLuIlBzxraIMeNSUCeYCWcF80m4NYndB+hXViH7DhWg2SkUTrrmTDdwVgTvHmD/gC+4TaH
 dQuxd8cw48VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="473846200"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 19 May 2021 22:49:11 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 19 May 2021 22:49:10 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 20 May 2021 13:49:06 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Thu, 20 May 2021 13:49:06 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V6 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Thread-Topic: [PATCH V6 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Thread-Index: AQHXNfjoX9e9whRt0EOkDuOU55NBi6rnxhUAgAQ8AtA=
Date: Thu, 20 May 2021 05:49:06 +0000
Message-ID: <9c5dfb900ad3458da2a2885488561ec9@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
 <20210420151537.64360-2-chen.zhang@intel.com>
 <20210517223444.782d99cc@gecko.fritz.box>
In-Reply-To: <20210517223444.782d99cc@gecko.fritz.box>
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
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
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
Cc: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTHVrYXMgU3RyYXViIDxs
dWthc3N0cmF1YjJAd2ViLmRlPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTgsIDIwMjEgNDozNSBB
TQ0KPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiBDYzogSmFzb24g
V2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT47IHFlbXUtZGV2IDxxZW11LQ0KPiBkZXZlbEBub25n
bnUub3JnPjsgRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+OyBEci4gRGF2aWQgQWxhbg0K
PiBHaWxiZXJ0IDxkZ2lsYmVydEByZWRoYXQuY29tPjsgTWFya3VzIEFybWJydXN0ZXIgPGFybWJy
dUByZWRoYXQuY29tPjsNCj4gRGFuaWVsIFAuIEJlcnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNv
bT47IEdlcmQgSG9mZm1hbm4NCj4gPGtyYXhlbEByZWRoYXQuY29tPjsgTGkgWmhpamlhbiA8bGl6
aGlqaWFuQGNuLmZ1aml0c3UuY29tPjsgWmhhbmcgQ2hlbg0KPiA8emhhbmdja2lkQGdtYWlsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWNiAxLzZdIHFhcGkvbmV0OiBBZGQgSVBGbG93U3Bl
YyBhbmQgUU1QIGNvbW1hbmQNCj4gZm9yIENPTE8gcGFzc3Rocm91Z2gNCj4gDQo+IE9uIFR1ZSwg
MjAgQXByIDIwMjEgMjM6MTU6MzIgKzA4MDANCj4gWmhhbmcgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRl
bC5jb20+IHdyb3RlOg0KPiANCj4gPiBTaW5jZSB0aGUgcmVhbCB1c2VyIHNjZW5hcmlvIGRvZXMg
bm90IG5lZWQgQ09MTyB0byBtb25pdG9yIGFsbCB0cmFmZmljLg0KPiA+IEFkZCBjb2xvLXBhc3N0
aHJvdWdoLWFkZCBhbmQgY29sby1wYXNzdGhyb3VnaC1kZWwgdG8gbWFpbnRhaW4gYSBDT0xPDQo+
ID4gbmV0d29yayBwYXNzdGhyb3VnaCBsaXN0LiBBZGQgSVBGbG93U3BlYyBzdHJ1Y3QgZm9yIGFs
bCBRTVAgY29tbWFuZHMuDQo+ID4gRXhjZXB0IHByb3RvY29sIGZpZWxkIGlzIG5lY2Vzc2FyeSwg
b3RoZXIgZmllbGRzIGFyZSBvcHRpb25hbC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5n
IENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBuZXQvbmV0LmMgICAg
IHwgMTAgKysrKysrKysNCj4gPiAgcWFwaS9uZXQuanNvbiB8IDY4DQo+ID4gKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgNzggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL25ldC9uZXQuYyBi
L25ldC9uZXQuYw0KPiA+IGluZGV4IGVkZjliOTU0MTguLjJhNmU1ZjM4ODYgMTAwNjQ0DQo+ID4g
LS0tIGEvbmV0L25ldC5jDQo+ID4gKysrIGIvbmV0L25ldC5jDQo+ID4gQEAgLTExOTYsNiArMTE5
NiwxNiBAQCB2b2lkIHFtcF9uZXRkZXZfZGVsKGNvbnN0IGNoYXIgKmlkLCBFcnJvcg0KPiAqKmVy
cnApDQo+ID4gICAgICB9DQo+ID4gIH0NCj4gPg0KPiA+ICt2b2lkIHFtcF9jb2xvX3Bhc3N0aHJv
dWdoX2FkZChJUEZsb3dTcGVjICpzcGVjLCBFcnJvciAqKmVycnApIHsNCj4gPiArICAgIC8qIFRP
RE8gaW1wbGVtZW50IHNldHVwIHBhc3N0aHJvdWdoIHJ1bGUgKi8gfQ0KPiA+ICsNCj4gPiArdm9p
ZCBxbXBfY29sb19wYXNzdGhyb3VnaF9kZWwoSVBGbG93U3BlYyAqc3BlYywgRXJyb3IgKiplcnJw
KSB7DQo+ID4gKyAgICAvKiBUT0RPIGltcGxlbWVudCBkZWxldGUgcGFzc3Rocm91Z2ggcnVsZSAq
LyB9DQo+ID4gKw0KPiA+ICBzdGF0aWMgdm9pZCBuZXRmaWx0ZXJfcHJpbnRfaW5mbyhNb25pdG9y
ICptb24sIE5ldEZpbHRlclN0YXRlICpuZikgIHsNCj4gPiAgICAgIGNoYXIgKnN0cjsNCj4gPiBk
aWZmIC0tZ2l0IGEvcWFwaS9uZXQuanNvbiBiL3FhcGkvbmV0Lmpzb24gaW5kZXgNCj4gPiBhZjNm
NWIwZmRhLi5mNmU0ZTM3NTI2IDEwMDY0NA0KPiA+IC0tLSBhL3FhcGkvbmV0Lmpzb24NCj4gPiAr
KysgYi9xYXBpL25ldC5qc29uDQo+ID4gQEAgLTcsNiArNyw3IEBADQo+ID4gICMjDQo+ID4NCj4g
PiAgeyAnaW5jbHVkZSc6ICdjb21tb24uanNvbicgfQ0KPiA+ICt7ICdpbmNsdWRlJzogJ3NvY2tl
dHMuanNvbicgfQ0KPiA+DQo+ID4gICMjDQo+ID4gICMgQHNldF9saW5rOg0KPiA+IEBAIC02OTQs
MyArNjk1LDcwIEBADQo+ID4gICMjDQo+ID4gIHsgJ2V2ZW50JzogJ0ZBSUxPVkVSX05FR09USUFU
RUQnLA0KPiA+ICAgICdkYXRhJzogeydkZXZpY2UtaWQnOiAnc3RyJ30gfQ0KPiA+ICsNCj4gPiAr
IyMNCj4gPiArIyBASVBGbG93U3BlYzoNCj4gDQo+IEkgdGhpbmsgc29tZXRoaW5nIGxpa2UgIkBJ
UEZpbHRlclJ1bGUiIGlzIGNsZWFyZXIuDQo+IA0KPiA+ICsjIElQIGZsb3cgc3BlY2lmaWNhdGlv
bi4NCj4gDQo+ICJJUCBmaWx0ZXIgcnVsZSBzcGVjaWZpY2F0aW9uIg0KPiANCj4gPiArIyBAcHJv
dG9jb2w6IFRyYW5zcG9ydCBsYXllciBwcm90b2NvbCBsaWtlIFRDUC9VRFAuLi4NCj4gPiArIw0K
PiA+ICsjIEBvYmplY3QtbmFtZTogUG9pbnQgb3V0IHRoZSBJUGZsb3cgc3BlYyBlZmZlY3RpdmUg
cmFuZ2Ugb2Ygb2JqZWN0LA0KPiA+ICsjICAgICAgICAgICAgICAgSWYgdGhlcmUgaXMgbm8gc3Vj
aCBwYXJ0LCBpdCBtZWFucyBnbG9iYWwgc3BlYy4NCj4gDQo+IEkgdGhpbmsgSVBGbG93U3BlYyBz
aG91bGQgYmUga2VwdCBnZW5lcmljLCBzbyBvYmplY3QtbmFtZSBzaG91bGQgbm90IGJlDQo+IHBh
cnQgb2YgaXQuIEl0IHNob3VsZCBtb3ZlIGRpcmVjdGx5IHRvICdjb2xvLXBhc3N0aHJvdWdoLWFk
ZCcgYW5kICdjb2xvLQ0KPiBwYXNzdGhyb3VnaC1kZWwnLg0KPiANCj4gQWxzbyBwbGVhc2UgdXNl
IGNsZWFyZXIgd29yZGluZy4gUHJvcG9zYWw6DQo+ICJAb2JqZWN0LW5hbWU6IFRoZSBpZCBvZiB0
aGUgY29sby1jb21wYXJlIG9iamVjdCB0byBhZGQgdGhlIGZpbHRlciB0by4iDQo+IA0KPiBBZ2Fp
biwgaWYgb3RoZXIgbmV0IGZpbHRlcnMgc3VwcG9ydCB0aGUgbmV3IGZlYXR1cmUgaW4gdGhlIGZ1
dHVyZSwgdGhlIHdvcmRpbmcNCj4gY2FuIGFsd2F5cyBiZSBjaGFuZ2VkIGxhdGVyLg0KDQpXZSBh
bHJlYWR5IGRpc2N1c3NlZCB0aGUgbmFtZSBvZiB0aGUgIklQRmxvd1NwZWMiIGluIHRoaXMgc2Vy
aWVzIFYzL1Y0Li4uDQpDdXJyZW50IGRlZmluaXRpb24gaXMgYSBnZW5lcmljIG9uZS4gQm90aCBP
SyBmb3IgbWUuDQpGb3IgdGhlIHFhcGkvbmV0Lmpzb24sIEhpIE1hcmt1cywgd2hpY2ggbmFtZSBk
byB5b3UgdGhpbmsgaXMgYmV0dGVy77yfDQoNCg0KPiANCj4gPiArIyBAc291cmNlOiBTb3VyY2Ug
YWRkcmVzcyBhbmQgcG9ydC4NCj4gPiArIw0KPiA+ICsjIEBkZXN0aW5hdGlvbjogRGVzdGluYXRp
b24gYWRkcmVzcyBhbmQgcG9ydC4NCj4gPiArIw0KPiA+ICsjIFNpbmNlOiA2LjENCj4gPiArIyMN
Cj4gPiAreyAnc3RydWN0JzogJ0lQRmxvd1NwZWMnLA0KPiA+ICsgICdkYXRhJzogeyAncHJvdG9j
b2wnOiAnc3RyJywgJypvYmplY3QtbmFtZSc6ICdzdHInLA0KPiA+ICsgICAgJypzb3VyY2UnOiAn
SW5ldFNvY2tldEFkZHJlc3NCYXNlJywNCj4gPiArICAgICcqZGVzdGluYXRpb24nOiAnSW5ldFNv
Y2tldEFkZHJlc3NCYXNlJyB9IH0NCj4gDQo+IEkgdGhpbmsgJ3Byb3RvY29sJyBzaG91bGQgYmUg
bWFkZSBvcHRpb25hbCB0b28uDQoNCk1ha2UgcHJvdG9jb2wgdG8gb3B0aW9uYWwgaXMgZWFzeS4N
CkJ1dCBmb3IgbW9zdCBjYXNlcywgd2l0aCBhIHByb3RvY29sIGlzIG5lY2Vzc2FyeS4NCklmIHVz
ZXIgdW5leHBlY3RlZCBpbnB1dCBub3RoaW5nLCBpdCB3aWxsIG1ha2UgdGhlIGVudGlyZSBuZXR3
b3JrIHVuYXZhaWxhYmxlLg0KDQpUaGFua3MNCkNoZW4NCg0KPiANCj4gPiArIyMNCj4gPiArIyBA
Y29sby1wYXNzdGhyb3VnaC1hZGQ6DQo+ID4gKyMNCj4gPiArIyBBZGQgcGFzc3Rocm91Z2ggZW50
cnkgYWNjb3JkaW5nIHRvIHVzZXIncyBuZWVkcyBpbiBDT0xPLWNvbXBhcmUuDQo+ID4gKyMgU291
cmNlIElQL3BvcnQgYW5kIGRlc3RpbmF0aW9uIElQL3BvcnQgYm90aCBvcHRpb25hbCwgSWYgdXNl
ciBqdXN0DQo+ID4gKyMgaW5wdXQgcGFydHMgb2YgaW5mb3RtYXRpb24sIGl0IHdpbGwgbWF0Y2gg
YWxsLg0KPiA+ICsjDQo+ID4gKyMgUmV0dXJuczogTm90aGluZyBvbiBzdWNjZXNzDQo+ID4gKyMN
Cj4gPiArIyBTaW5jZTogNi4xDQo+ID4gKyMNCj4gPiArIyBFeGFtcGxlOg0KPiA+ICsjDQo+ID4g
KyMgLT4geyAiZXhlY3V0ZSI6ICJjb2xvLXBhc3N0aHJvdWdoLWFkZCIsDQo+ID4gKyMgICAgICAi
YXJndW1lbnRzIjogeyAicHJvdG9jb2wiOiAidGNwIiwgIm9iamVjdC1uYW1lIjogIm9iamVjdDAi
LA0KPiA+ICsjICAgICAgInNvdXJjZSI6IHsiaG9zdCI6ICIxOTIuMTY4LjEuMSIsICJwb3J0Ijog
IjEyMzQifSwNCj4gPiArIyAgICAgICJkZXN0aW5hdGlvbiI6IHsiaG9zdCI6ICIxOTIuMTY4LjEu
MiIsICJwb3J0IjogIjQzMjEifSB9IH0NCj4gPiArIyA8LSB7ICJyZXR1cm4iOiB7fSB9DQo+ID4g
KyMNCj4gPiArIyMNCj4gPiAreyAnY29tbWFuZCc6ICdjb2xvLXBhc3N0aHJvdWdoLWFkZCcsICdi
b3hlZCc6IHRydWUsDQo+ID4gKyAgICAgJ2RhdGEnOiAnSVBGbG93U3BlYycgfQ0KPiA+ICsNCj4g
PiArIyMNCj4gPiArIyBAY29sby1wYXNzdGhyb3VnaC1kZWw6DQo+ID4gKyMNCj4gPiArIyBEZWxl
dGUgcGFzc3Rocm91Z2ggZW50cnkgYWNjb3JkaW5nIHRvIHVzZXIncyBuZWVkcyBpbiBDT0xPLWNv
bXBhcmUuDQo+ID4gKyMgU291cmNlIElQL3BvcnQgYW5kIGRlc3RpbmF0aW9uIElQL3BvcnQgYm90
aCBvcHRpb25hbCwgSWYgdXNlciBqdXN0DQo+ID4gKyMgaW5wdXQgcGFydHMgb2YgaW5mb3RtYXRp
b24sIGl0IHdpbGwgbWF0Y2ggYWxsLg0KPiA+ICsjDQo+ID4gKyMgUmV0dXJuczogTm90aGluZyBv
biBzdWNjZXNzDQo+ID4gKyMNCj4gPiArIyBTaW5jZTogNi4xDQo+ID4gKyMNCj4gPiArIyBFeGFt
cGxlOg0KPiA+ICsjDQo+ID4gKyMgLT4geyAiZXhlY3V0ZSI6ICJjb2xvLXBhc3N0aHJvdWdoLWRl
bCIsDQo+ID4gKyMgICAgICAiYXJndW1lbnRzIjogeyAicHJvdG9jb2wiOiAidGNwIiwgIm9iamVj
dC1uYW1lIjogIm9iamVjdDAiLA0KPiA+ICsjICAgICAgInNvdXJjZSI6IHsiaG9zdCI6ICIxOTIu
MTY4LjEuMSIsICJwb3J0IjogIjEyMzQifSwNCj4gPiArIyAgICAgICJkZXN0aW5hdGlvbiI6IHsi
aG9zdCI6ICIxOTIuMTY4LjEuMiIsICJwb3J0IjogIjQzMjEifSB9IH0NCj4gPiArIyA8LSB7ICJy
ZXR1cm4iOiB7fSB9DQo+ID4gKyMNCj4gPiArIyMNCj4gPiAreyAnY29tbWFuZCc6ICdjb2xvLXBh
c3N0aHJvdWdoLWRlbCcsICdib3hlZCc6IHRydWUsDQo+ID4gKyAgICAgJ2RhdGEnOiAnSVBGbG93
U3BlYycgfQ0KPiANCj4gDQo+IA0KPiAtLQ0KDQo=

