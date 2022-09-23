Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9965E72BA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:14:06 +0200 (CEST)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oba4j-0003WI-4O
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <houyl@yusur.tech>)
 id 1obZrm-00065b-0X; Fri, 23 Sep 2022 00:00:42 -0400
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:34357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <houyl@yusur.tech>)
 id 1obZrh-0001j6-8y; Fri, 23 Sep 2022 00:00:41 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0726448|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00417107-0.00150076-0.994328;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=houyl@yusur.tech; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.PMGhZ83_1663905201; 
Received: from HYL(mailfrom:houyl@yusur.tech fp:SMTPD_---.PMGhZ83_1663905201)
 by smtp.aliyun-inc.com; Fri, 23 Sep 2022 11:53:22 +0800
Date: Fri, 23 Sep 2022 11:53:22 +0800
From: "houyl@yusur.tech" <houyl@yusur.tech>
To: jasowang <jasowang@redhat.com>, 
 raphael.norwitz <raphael.norwitz@nutanix.com>
Cc: mst <mst@redhat.com>, kwolf <kwolf@redhat.com>, 
 hreitz <hreitz@redhat.com>, qemu-block <qemu-block@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, zy <zy@yusur.tech>, 
 "lulu@redhat.com" <lulu@redhat.com>, 
 =?UTF-8?B?6ZmI5rWp?= <chenh@yusur.tech>
Subject: Re: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's
 mac address automatically
References: <20220921060026.392164-1-chenh@yusur.tech>, 
 <BL3PR02MB79380882D0B877C2D5A754FFEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>,
 <CACGkMEttGsDrFo_U7AKHEof0HwVfHaRTeQSRE+QTiRPPtnU3hQ@mail.gmail.com>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.22.188[cn]
Mime-Version: 1.0
Message-ID: <2022092311532239888519@yusur.tech>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart000718535203_=----"
Received-SPF: pass client-ip=115.124.28.172; envelope-from=houyl@yusur.tech;
 helo=out28-172.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

------=_001_NextPart000718535203_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMiBTZXAgMjAyMiAwOTozNDo0MSArMDgwMCBKYXNvbiBXYW5nPGphc293YW5nQHJl
ZGhhdC5jb20+ICB3cm90ZToNCg0KPk9uIFRodSwgU2VwIDIyLCAyMDIyIGF0IDE6NTggQU0gUmFw
aGFlbCBOb3J3aXR6DQo+PHJhcGhhZWwubm9yd2l0ekBudXRhbml4LmNvbT4gd3JvdGU6DQo+Pg0K
Pj4gSWYgSSByZWFkIHlvdXIgcmVzcG9uc2Ugb24gdGhlIG90aGVyIHRocmVhZCBjb3JyZWN0bHks
IHRoaXMgY2hhbmdlIGlzIGludGVuZGVkDQo+Pg0KPj4gdG8gcHJpb3JpdGl6ZSB0aGUgTUFDIGFk
ZHJlc3MgZXhwb3NlZCBieSBEUERLIG92ZXIgdGhlIG9uZSBwcm92aWRlZCBieSB0aGUNCj4+DQo+
PiBRRU1VIGNvbW1hbmQgbGluZT8gU291bmRzIHJlYXNvbmFibGUgaW4gcHJpbmNpcGxlLCBidXQg
SSB3b3VsZCBnZXQgY29uZmlybWF0aW9uDQo+Pg0KPj4gZnJvbSB2RFBBL3Zob3N0LW5ldCBtYWlu
dGFpbmVycy4NCiANCj5JIHRoaW5rIHRoZSBiZXN0IHdheSBpcyB0byAoYW5kIGl0IHNlZW1zIGVh
c2llcikNCiANCj4xKSBoYXZlIHRoZSBtYW5hZ2VtZW50IGxheWVyIHRvIG1ha2Ugc3VyZSB0aGUg
bWFjIGNhbWUgZnJvbSBjbGkNCj5tYXRjaGVzIHRoZSB1bmRlcmxheWVyIHZEUEENCg0KIEFncmVl
ZCwgdGhhdCdzIG5vIHByb2JsZW0uDQoNCj4yKSBoYXZpbmcgYSBzYW5pdHkgY2hlY2sgYW5kIGZh
aWwgdGhlIGRldmljZSBpbml0aWFsaXphdGlvbiBpZiB0aGV5IGRvbid0IG1hdGNoDQoNCkhvd2V2
ZXIsIG9uZSBNQUMgYWRkcmVzcyBmb3IgaW50ZWdyaXR5IGNoZWNrIGlzIGZyb20gdGhlIGNsaSwg
YW5kIHRoZSBvdGhlciBNQUMgYWRkcmVzcyBpcyBmcm9tIHRoZSB2RFBBIGRldmljZSwgDQpIb3cg
dG8gZ2V0IGl0Pw0KDQpUaGUgY3VycmVudCBzaXR1YXRpb24gaXMgaWYgTUFDIGNhbWUgZnJvbSBj
bGkgZG9uJ3QgbWF0Y2ggdGhlIHVuZGVybGF5ZXIgdkRQQSwgdGhlIHZpcnR1YWwgbWFjaGluZSBj
YW4gc3RpbGwgc3RhcnQgd2l0aG91dCBhbnkgaGludHMuDQoNClRoYW5rcw0KDQoNCj5UaGFua3MN
CiANCj4+DQo+Pg0KPj4NCj4+IFRoYXQgc2FpZCB0aGUgd2F5IHlvdeKAmXJlIGhhY2tpbmcgdGhl
IHZob3N0LXVzZXIgY29kZSBicmVha3MgYSB2YWx1YWJsZSBjaGVjayBmb3INCj4+DQo+PiBiYWQg
dmhvc3QtdXNlci1ibGsgYmFja2VuZHMuIEkgd291bGQgc3VnZ2VzdCBmaW5kaW5nIGFub3RoZXIg
aW1wbGVtZW50YXRpb24gd2hpY2gNCj4+DQo+PiBkb2VzIG5vdCByZWdyZXNzIGZ1bmN0aW9uYWxp
dHkgZm9yIG90aGVyIGRldmljZSB0eXBlcy4NCj4+DQo+Pg0KPj4NCj4+DQo+Pg0KPj4gPkZyb206
IEhhbyBDaGVuIDxjaGVuaEB5dXN1ci50ZWNoPg0KPj4NCj4+ID4NCj4+DQo+PiA+V2hlbiB1c2Ug
ZHBkay12ZHBhIHRlc3RzIHZkcGEgZGV2aWNlLiBZb3UgbmVlZCB0byBzcGVjaWZ5IHRoZSBtYWMg
YWRkcmVzcyB0bw0KPj4NCj4+ID5zdGFydCB0aGUgdmlydHVhbCBtYWNoaW5lIHRocm91Z2ggbGli
dmlydCBvciBxZW11LCBidXQgbm93LCB0aGUgbGlidmlydCBvcg0KPj4NCj4+ID5xZW11IGNhbiBj
YWxsIGRwZGsgdmRwYSB2ZW5kb3IgZHJpdmVyJ3Mgb3BzIC5nZXRfY29uZmlnIHRocm91Z2ggdmhv
c3RfbmV0X2dldF9jb25maWcNCj4+DQo+PiA+dG8gZ2V0IHRoZSBtYWMgYWRkcmVzcyBvZiB0aGUg
dmRwYSBoYXJkd2FyZSB3aXRob3V0IG1hbnVhbCBjb25maWd1cmF0aW9uLg0KPj4NCj4+ID4NCj4+
DQo+PiA+djEtPnYyOg0KPj4NCj4+ID5Pbmx5IGNvcHkgRVRIX0FMRU4gZGF0YSBvZiBuZXRjZmcg
Zm9yIHNvbWUgdmRwYSBkZXZpY2Ugc3VjaCBhcw0KPj4NCj4+ID5OVklESUEgQkxVRUZJRUxEIERQ
VShCRjIpJ3MgbmV0Y2ZnLT5zdGF0dXMgaXMgbm90IHJpZ2h0Lg0KPj4NCj4+ID5XZSBvbmx5IG5l
ZWQgdGhlIG1hYyBhZGRyZXNzIGFuZCBkb24ndCBjYXJlIGFib3V0IHRoZSBzdGF0dXMgZmllbGQu
DQo+Pg0KPj4gPg0KPj4NCj4+ID5TaWduZWQtb2ZmLWJ5OiBIYW8gQ2hlbiA8Y2hlbmhAeXVzdXIu
dGVjaD4NCj4+DQo+PiA+LS0tDQo+Pg0KPj4gPiBody9ibG9jay92aG9zdC11c2VyLWJsay5jIHwg
IDEgLQ0KPj4NCj4+ID4gaHcvbmV0L3ZpcnRpby1uZXQuYyAgICAgICB8ICA3ICsrKysrKysNCj4+
DQo+PiA+IGh3L3ZpcnRpby92aG9zdC11c2VyLmMgICAgfCAxOSAtLS0tLS0tLS0tLS0tLS0tLS0t
DQo+Pg0KPj4gPiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gPg0KPj4NCj4+ID5kaWZmIC0tZ2l0IGEvaHcvYmxvY2svdmhvc3QtdXNlci1i
bGsuYyBiL2h3L2Jsb2NrL3Zob3N0LXVzZXItYmxrLmMNCj4+DQo+PiA+aW5kZXggOTExNzIyMjQ1
Ni4uNWRjYTRlYWIwOSAxMDA2NDQNCj4+DQo+PiA+LS0tIGEvaHcvYmxvY2svdmhvc3QtdXNlci1i
bGsuYw0KPj4NCj4+ID4rKysgYi9ody9ibG9jay92aG9zdC11c2VyLWJsay5jDQo+Pg0KPj4gPkBA
IC0zMzcsNyArMzM3LDYgQEAgc3RhdGljIGludCB2aG9zdF91c2VyX2Jsa19jb25uZWN0KERldmlj
ZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkNCj4+DQo+PiA+DQo+Pg0KPj4gPiAgICAgdmhvc3Rf
ZGV2X3NldF9jb25maWdfbm90aWZpZXIoJnMtPmRldiwgJmJsa19vcHMpOw0KPj4NCj4+ID4NCj4+
DQo+PiA+LSAgICBzLT52aG9zdF91c2VyLnN1cHBvcnRzX2NvbmZpZyA9IHRydWU7DQo+Pg0KPj4g
PiAgICAgcmV0ID0gdmhvc3RfZGV2X2luaXQoJnMtPmRldiwgJnMtPnZob3N0X3VzZXIsIFZIT1NU
X0JBQ0tFTkRfVFlQRV9VU0VSLCAwLA0KPj4NCj4+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
IGVycnApOw0KPj4NCj4+ID4gICAgIGlmIChyZXQgPCAwKSB7DQo+Pg0KPj4gPmRpZmYgLS1naXQg
YS9ody9uZXQvdmlydGlvLW5ldC5jIGIvaHcvbmV0L3ZpcnRpby1uZXQuYw0KPj4NCj4+ID5pbmRl
eCBkZDBkMDU2ZmRlLi45MDQwNTA4M2IxIDEwMDY0NA0KPj4NCj4+ID4tLS0gYS9ody9uZXQvdmly
dGlvLW5ldC5jDQo+Pg0KPj4gPisrKyBiL2h3L25ldC92aXJ0aW8tbmV0LmMNCj4+DQo+PiA+QEAg
LTE2Niw2ICsxNjYsMTMgQEAgc3RhdGljIHZvaWQgdmlydGlvX25ldF9nZXRfY29uZmlnKFZpcnRJ
T0RldmljZSAqdmRldiwgdWludDhfdCAqY29uZmlnKQ0KPj4NCj4+ID4gICAgICAgICAgICAgfQ0K
Pj4NCj4+ID4gICAgICAgICAgICAgbWVtY3B5KGNvbmZpZywgJm5ldGNmZywgbi0+Y29uZmlnX3Np
emUpOw0KPj4NCj4+ID4gICAgICAgICB9DQo+Pg0KPj4gPisgICAgfSBlbHNlIGlmIChuYy0+cGVl
ciAmJiBuYy0+cGVlci0+aW5mby0+dHlwZSA9PSBORVRfQ0xJRU5UX0RSSVZFUl9WSE9TVF9VU0VS
KSB7DQo+Pg0KPj4gPisgICAgICAgIHJldCA9IHZob3N0X25ldF9nZXRfY29uZmlnKGdldF92aG9z
dF9uZXQobmMtPnBlZXIpLCAodWludDhfdCAqKSZuZXRjZmcsDQo+Pg0KPj4gPisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG4tPmNvbmZpZ19zaXplKTsNCj4+DQo+PiA+KyAgICAg
ICAgaWYgKHJldCAhPSAtMSkgew0KPj4NCj4+ID4rICAgICAgICAgICAgICAgLyogQXV0b21hdGlj
YWxseSBvYnRhaW4gdGhlIG1hYyBhZGRyZXNzIG9mIHRoZSB2ZHBhIGRldmljZQ0KPj4NCj4+ID4r
ICAgICAgICAgICAgICAgICogd2hlbiB1c2luZyB0aGUgZHBkayB2ZHBhICovDQo+Pg0KPj4gPisg
ICAgICAgICAgICAgICAgbWVtY3B5KGNvbmZpZywgJm5ldGNmZywgRVRIX0FMRU4pOw0KPj4NCj4+
ID4gICAgIH0NCj4+DQo+PiA+IH0NCj4+DQo+PiA+DQo+Pg0KPj4gPmRpZmYgLS1naXQgYS9ody92
aXJ0aW8vdmhvc3QtdXNlci5jIGIvaHcvdmlydGlvL3Zob3N0LXVzZXIuYw0KPj4NCj4+ID5pbmRl
eCBiZDI0NzQxYmU4Li44YjAxMDc4MjQ5IDEwMDY0NA0KPj4NCj4+ID4tLS0gYS9ody92aXJ0aW8v
dmhvc3QtdXNlci5jDQo+Pg0KPj4gPisrKyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4+DQo+
PiA+QEAgLTIwMTMsOCArMjAxMyw2IEBAIHN0YXRpYyBpbnQgdmhvc3RfdXNlcl9iYWNrZW5kX2lu
aXQoc3RydWN0IHZob3N0X2RldiAqZGV2LCB2b2lkICpvcGFxdWUsDQo+Pg0KPj4gPiAgICAgfQ0K
Pj4NCj4+ID4NCj4+DQo+PiA+ICAgICBpZiAodmlydGlvX2hhc19mZWF0dXJlKGZlYXR1cmVzLCBW
SE9TVF9VU0VSX0ZfUFJPVE9DT0xfRkVBVFVSRVMpKSB7DQo+Pg0KPj4gPi0gICAgICAgIGJvb2wg
c3VwcG9ydHNfZl9jb25maWcgPSB2dXMtPnN1cHBvcnRzX2NvbmZpZyB8fA0KPj4NCj4+ID4tICAg
ICAgICAgICAgKGRldi0+Y29uZmlnX29wcyAmJiBkZXYtPmNvbmZpZ19vcHMtPnZob3N0X2Rldl9j
b25maWdfbm90aWZpZXIpOw0KPj4NCj4+ID4gICAgICAgICB1aW50NjRfdCBwcm90b2NvbF9mZWF0
dXJlczsNCj4+DQo+PiA+DQo+Pg0KPj4gPiAgICAgICAgIGRldi0+YmFja2VuZF9mZWF0dXJlcyB8
PSAxVUxMIDw8IFZIT1NUX1VTRVJfRl9QUk9UT0NPTF9GRUFUVVJFUzsNCj4+DQo+PiA+QEAgLTIw
MzMsMjMgKzIwMzEsNiBAQCBzdGF0aWMgaW50IHZob3N0X3VzZXJfYmFja2VuZF9pbml0KHN0cnVj
dCB2aG9zdF9kZXYgKmRldiwgdm9pZCAqb3BhcXVlLA0KPj4NCj4+ID4gICAgICAgICAgKi8NCj4+
DQo+PiA+ICAgICAgICAgcHJvdG9jb2xfZmVhdHVyZXMgJj0gVkhPU1RfVVNFUl9QUk9UT0NPTF9G
RUFUVVJFX01BU0s7DQo+Pg0KPj4gPg0KPj4NCj4+ID4tICAgICAgICBpZiAoc3VwcG9ydHNfZl9j
b25maWcpIHsNCj4+DQo+PiA+LSAgICAgICAgICAgIGlmICghdmlydGlvX2hhc19mZWF0dXJlKHBy
b3RvY29sX2ZlYXR1cmVzLA0KPj4NCj4+ID4tICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgVkhPU1RfVVNFUl9QUk9UT0NPTF9GX0NPTkZJRykpIHsNCj4+DQo+PiA+LSAgICAgICAg
ICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJ2aG9zdC11c2VyIGRldmljZSBleHBlY3RpbmcgIg0K
Pj4NCj4+ID4tICAgICAgICAgICAgICAgICAgICAgICAgICAgIlZIT1NUX1VTRVJfUFJPVE9DT0xf
Rl9DT05GSUcgYnV0IHRoZSB2aG9zdC11c2VyIGJhY2tlbmQgZG9lcyAiDQo+Pg0KPj4gPi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAibm90IHN1cHBvcnQgaXQuIik7DQo+Pg0KPj4gPi0gICAg
ICAgICAgICAgICAgcmV0dXJuIC1FUFJPVE87DQo+Pg0KPj4gPi0gICAgICAgICAgICB9DQo+Pg0K
Pj4gPi0gICAgICAgIH0gZWxzZSB7DQo+Pg0KPj4gPi0gICAgICAgICAgICBpZiAodmlydGlvX2hh
c19mZWF0dXJlKHByb3RvY29sX2ZlYXR1cmVzLA0KPj4NCj4+ID4tICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBWSE9TVF9VU0VSX1BST1RPQ09MX0ZfQ09ORklHKSkgew0KPj4NCj4+
ID4tICAgICAgICAgICAgICAgIHdhcm5fcmVwb3J0Zl9lcnIoKmVycnAsICJ2aG9zdC11c2VyIGJh
Y2tlbmQgc3VwcG9ydHMgIg0KPj4NCj4+ID4tICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIlZIT1NUX1VTRVJfUFJPVE9DT0xfRl9DT05GSUcgYnV0IFFFTVUgZG9lcyBub3QuIik7DQo+
Pg0KPj4gPi0gICAgICAgICAgICAgICAgcHJvdG9jb2xfZmVhdHVyZXMgJj0gfigxVUxMIDw8IFZI
T1NUX1VTRVJfUFJPVE9DT0xfRl9DT05GSUcpOw0KPj4NCj4+ID4tICAgICAgICAgICAgfQ0KPj4N
Cj4+ID4tICAgICAgICB9DQo+Pg0KPj4gPi0NCj4+DQo+PiA+ICAgICAgICAgLyogZmluYWwgc2V0
IG9mIHByb3RvY29sIGZlYXR1cmVzICovDQo+Pg0KPj4gPiAgICAgICAgIGRldi0+cHJvdG9jb2xf
ZmVhdHVyZXMgPSBwcm90b2NvbF9mZWF0dXJlczsNCj4+DQo+PiA+ICAgICAgICAgZXJyID0gdmhv
c3RfdXNlcl9zZXRfcHJvdG9jb2xfZmVhdHVyZXMoZGV2LCBkZXYtPnByb3RvY29sX2ZlYXR1cmVz
KTsNCj4+DQo+PiA+LS0NCj4+DQo+PiA+Mi4yNy4wDQo+Pg0KPj4gPg0KPj4NCj4+DQogDQo=

------=_001_NextPart000718535203_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font-fami=
ly: "Microsoft YaHei UI"; color: rgb(0, 0, 0); line-height: 1.5; }</style>=
</head><body>=0A<div>On Thu, 22 Sep 2022 09:34:41 +0800&nbsp;Jason Wang&lt=
;jasowang@redhat.com&gt;&nbsp;&nbsp;<span></span><span style=3D"background=
-color: transparent;">wrote:</span></div>=0A<blockquote style=3D"margin-To=
p: 0px; margin-Bottom: 0px; margin-Left: 0.5em; margin-Right: inherit"><di=
v><br></div><div><div>&gt;On Thu, Sep 22, 2022 at 1:58 AM Raphael Norwitz<=
/div>=0A<div>&gt;&lt;raphael.norwitz@nutanix.com&gt; wrote:</div>=0A<div>&=
gt;&gt;</div>=0A<div>&gt;&gt; If I read your response on the other thread =
correctly, this change is intended</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;=
&gt; to prioritize the MAC address exposed by DPDK over the one provided b=
y the</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; QEMU command line? Sound=
s reasonable in principle, but I would get confirmation</div>=0A<div>&gt;&=
gt;</div>=0A<div>&gt;&gt; from vDPA/vhost-net maintainers.</div>=0A<div>&n=
bsp;</div>=0A<div>&gt;I think the best way is to (and it seems easier)</di=
v>=0A<div>&nbsp;</div>=0A<div>&gt;1) have the management layer to make sur=
e the mac came from cli</div>=0A<div>&gt;matches the underlayer vDPA</div>=
<div><br></div><div>&nbsp;Agreed, that's no problem.</div><div><br></div>=
=0A<div>&gt;2) having a sanity check and fail the device initialization if=
 they don't match</div>=0A<div><br></div><div>However, one MAC address for=
 integrity check is from the cli, and the other MAC address is from the vD=
PA device,&nbsp;</div><div>How to get it?</div><div><br></div><div><div>Th=
e current situation is if MAC came from cli&nbsp;<span style=3D"background=
-color: transparent;">don't match the underlayer vDPA, the virtual machine=
 can still start without any hints.</span></div></div><div><br></div><div>=
Thanks</div><div><br></div><div><br></div>=0A<div>&gt;Thanks</div>=0A<div>=
&nbsp;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt;</=
div>=0A<div>&gt;&gt; That said the way you=E2=80=99re hacking the vhost-us=
er code breaks a valuable check for</div>=0A<div>&gt;&gt;</div>=0A<div>&gt=
;&gt; bad vhost-user-blk backends. I would suggest finding another impleme=
ntation which</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; does not regress=
 functionality for other device types.</div>=0A<div>&gt;&gt;</div>=0A<div>=
&gt;&gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt;=
</div>=0A<div>&gt;&gt; &gt;From: Hao Chen &lt;chenh@yusur.tech&gt;</div>=
=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;</div>=0A<div>&gt;&gt;</div>=0A=
<div>&gt;&gt; &gt;When use dpdk-vdpa tests vdpa device. You need to specif=
y the mac address to</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;start=
 the virtual machine through libvirt or qemu, but now, the libvirt or</div=
>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;qemu can call dpdk vdpa vendor=
 driver's ops .get_config through vhost_net_get_config</div>=0A<div>&gt;&g=
t;</div>=0A<div>&gt;&gt; &gt;to get the mac address of the vdpa hardware w=
ithout manual configuration.</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &=
gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;v1-&gt;v2:</div>=0A<di=
v>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;Only copy ETH_ALEN data of netcfg for=
 some vdpa device such as</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;=
NVIDIA BLUEFIELD DPU(BF2)'s netcfg-&gt;status is not right.</div>=0A<div>&=
gt;&gt;</div>=0A<div>&gt;&gt; &gt;We only need the mac address and don't c=
are about the status field.</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &g=
t;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;Signed-off-by: Hao Chen=
 &lt;chenh@yusur.tech&gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;=
---</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt; hw/block/vhost-user-b=
lk.c |&nbsp; 1 -</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt; hw/net/v=
irtio-net.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 7 +++++++</div>=0A=
<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt; hw/virtio/vhost-user.c&nbsp;&nbsp=
;&nbsp; | 19 -------------------</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&g=
t; &gt; 3 files changed, 7 insertions(+), 20 deletions(-)</div>=0A<div>&gt=
;&gt;</div>=0A<div>&gt;&gt; &gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&g=
t; &gt;diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c<=
/div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;index 9117222456..5dca4eab=
09 100644</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;--- a/hw/block/v=
host-user-blk.c</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;+++ b/hw/b=
lock/vhost-user-blk.c</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;@@ -=
337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Error =
**errp)</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;</div>=0A<div>&gt;=
&gt;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; vhost_dev_set_conf=
ig_notifier(&amp;s-&gt;dev, &amp;blk_ops);</div>=0A<div>&gt;&gt;</div>=0A<=
div>&gt;&gt; &gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;-&nbsp;&=
nbsp;&nbsp; s-&gt;vhost_user.supports_config =3D true;</div>=0A<div>&gt;&g=
t;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vhost_dev_in=
it(&amp;s-&gt;dev, &amp;s-&gt;vhost_user, VHOST_BACKEND_TYPE_USER, 0,</div=
>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errp);</div>=0A<div>&gt;&gt=
;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; if (ret &lt; 0) {</di=
v>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;diff --git a/hw/net/virtio-ne=
t.c b/hw/net/virtio-net.c</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;=
index dd0d056fde..90405083b1 100644</div>=0A<div>&gt;&gt;</div>=0A<div>&gt=
;&gt; &gt;--- a/hw/net/virtio-net.c</div>=0A<div>&gt;&gt;</div>=0A<div>&gt=
;&gt; &gt;+++ b/hw/net/virtio-net.c</div>=0A<div>&gt;&gt;</div>=0A<div>&gt=
;&gt; &gt;@@ -166,6 +166,13 @@ static void virtio_net_get_config(VirtIODev=
ice *vdev, uint8_t *config)</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &g=
t;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 }</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(config, &amp;netc=
fg, n-&gt;config_size);</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</div>=0A<div>&gt;&gt;</di=
v>=0A<div>&gt;&gt; &gt;+&nbsp;&nbsp;&nbsp; } else if (nc-&gt;peer &amp;&am=
p; nc-&gt;peer-&gt;info-&gt;type =3D=3D NET_CLIENT_DRIVER_VHOST_USER) {</d=
iv>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D vhost_net_get_config(get_vhost_net(nc-&gt;peer), (=
uint8_t *)&amp;netcfg,</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n-&gt;config_size);=
</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;+&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; if (ret !=3D -1) {</div>=0A<div>&gt;&gt;</div>=0A<div>&=
gt;&gt; &gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /* Automatically obtain the mac address of the vdp=
a device</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;+&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 * when using the dpdk vdpa */</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt;=
 &gt;+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; memcpy(config, &amp;netcfg, ETH_ALEN);</div>=0A<div=
>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; }</div>=0A<di=
v>&gt;&gt;</div>=0A<div>&gt;&gt; &gt; }</div>=0A<div>&gt;&gt;</div>=0A<div=
>&gt;&gt; &gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;diff --git =
a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c</div>=0A<div>&gt;&gt;</d=
iv>=0A<div>&gt;&gt; &gt;index bd24741be8..8b01078249 100644</div>=0A<div>&=
gt;&gt;</div>=0A<div>&gt;&gt; &gt;--- a/hw/virtio/vhost-user.c</div>=0A<di=
v>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;+++ b/hw/virtio/vhost-user.c</div>=0A=
<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;@@ -2013,8 +2013,6 @@ static int v=
host_user_backend_init(struct vhost_dev *dev, void *opaque,</div>=0A<div>&=
gt;&gt;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; }</div>=0A<div>=
&gt;&gt;</div>=0A<div>&gt;&gt; &gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt=
;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; if (virtio_has_feature(features, VHOST_=
USER_F_PROTOCOL_FEATURES)) {</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &=
gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool supports_f_config =3D =
vus-&gt;supports_config ||</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt=
;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (dev-=
&gt;config_ops &amp;&amp; dev-&gt;config_ops-&gt;vhost_dev_config_notifier=
);</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t protocol_features;</div>=0A<div>&gt;&gt=
;</div>=0A<div>&gt;&gt; &gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &=
gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;backend_featur=
es |=3D 1ULL &lt;&lt; VHOST_USER_F_PROTOCOL_FEATURES;</div>=0A<div>&gt;&gt=
;</div>=0A<div>&gt;&gt; &gt;@@ -2033,23 +2031,6 @@ static int vhost_user_b=
ackend_init(struct vhost_dev *dev, void *opaque,</div>=0A<div>&gt;&gt;</di=
v>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; */</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; protocol_features &amp;=3D VHOST_USER_PROTOC=
OL_FEATURE_MASK;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;</div>=0A=
<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if (supports_f_config) {</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;=
&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; if (!virtio_has_feature(protocol_features,</div>=0A<div>&gt;&gt;</div>=
=0A<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; VHOST_USER_PROTOCOL_F_CONFIG)) {</div>=0A<div>&gt;&gt;</div>=0A=
<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, "vhost-user device ex=
pecting "</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "VHOST=
_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "</div>=0A<div>&gt=
;&gt;</div>=0A<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "not support it.");</div>=0A<div=
>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EPROTO;</div=
>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</div>=0A<div>&gt;&gt;</div>=0A<div=
>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {</div>=
=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (virtio_has_feature(protocol_featu=
res,</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VHOST_USER_PROTOCOL_F_CONFIG)) {</div=
>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; warn_reportf=
_err(*errp, "vhost-user backend supports "</div>=0A<div>&gt;&gt;</div>=0A<=
div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "VHOST_USER=
_PROTOCOL_F_CONFIG but QEMU does not.");</div>=0A<div>&gt;&gt;</div>=0A<di=
v>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; protocol_features &amp;=3D ~(1ULL &lt;&lt=
; VHOST_USER_PROTOCOL_F_CONFIG);</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&g=
t; &gt;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 }</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;-&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; }</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;-</=
div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* final set of protocol features */</div>=0A<div>&g=
t;&gt;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dev-&gt;protocol_features =3D protocol_features;</div>=0A<div>&gt;=
&gt;</div>=0A<div>&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; err =3D vhost_user_set_protocol_features(dev, dev-&gt;protocol_featu=
res);</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt; &gt;--</div>=0A<div>&gt;=
&gt;</div>=0A<div>&gt;&gt; &gt;2.27.0</div>=0A<div>&gt;&gt;</div>=0A<div>&=
gt;&gt; &gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&gt;&gt;</div>=0A<div>&nbs=
p;</div>=0A</div></blockquote>=0A</body></html>
------=_001_NextPart000718535203_=------


