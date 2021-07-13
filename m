Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537EB3C6808
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 03:24:02 +0200 (CEST)
Received: from localhost ([::1]:36118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m379U-00047v-VE
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 21:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caihuoqing@baidu.com>)
 id 1m377y-0003R8-HM
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 21:22:26 -0400
Received: from usmx01.baidu.com ([12.0.243.41]:59888 helo=baidu.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <caihuoqing@baidu.com>) id 1m377t-0004Dh-1c
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 21:22:23 -0400
Received: from BC-Mail-Ex25.internal.baidu.com (unknown [172.31.51.19])
 by Forcepoint Email with ESMTPS id 80DF1B7F16E6B04EDD6E;
 Mon, 12 Jul 2021 18:22:12 -0700 (PDT)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex25.internal.baidu.com (172.31.51.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.4; Tue, 13 Jul 2021 09:22:10 +0800
Received: from BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) by
 BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) with mapi id
 15.01.2242.008; Tue, 13 Jul 2021 09:22:10 +0800
From: "Cai,Huoqing" <caihuoqing@baidu.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH] vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI
 processor
Thread-Topic: [PATCH] vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI
 processor
Thread-Index: AQHXds8tHaHfK9HsY0WfX+i2eiVt6as/OkoAgADinHA=
Date: Tue, 13 Jul 2021 01:22:10 +0000
Message-ID: <cf1583335b6146359196869434efed56@baidu.com>
References: <20210712033655.390-1-caihuoqing@baidu.com>
 <20210712134922.510d0cff.alex.williamson@redhat.com>
In-Reply-To: <20210712134922.510d0cff.alex.williamson@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.18.18.22]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=12.0.243.41; envelope-from=caihuoqing@baidu.com;
 helo=baidu.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U3VyZSBJIHdpbGwgY2hlY2sgdGhlc2UgaXNzdWUgaW4gb3VyIGhhcmR3YXJlDQpUaGVuICxzZW5k
IHBhdGNoLXYyIA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQWxleCBXaWxs
aWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4gDQpTZW50OiAyMDIxxOo31MIxM8jV
IDM6NDkNClRvOiBDYWksSHVvcWluZyA8Y2FpaHVvcWluZ0BiYWlkdS5jb20+DQpDYzogbXN0QHJl
ZGhhdC5jb207IG1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29tOyBxZW11LWRldmVsQG5vbmdudS5v
cmcNClN1YmplY3Q6IFJlOiBbUEFUQ0hdIHZmaW8vcGNpOiBBZGQgcGJhX29mZnNldCBQQ0kgcXVp
cmsgZm9yIEJBSURVIEtVTkxVTiBBSSBwcm9jZXNzb3INCg0KT24gTW9uLCAxMiBKdWwgMjAyMSAx
MTozNjo1NSArMDgwMA0KQ2FpIEh1b3FpbmcgPGNhaWh1b3FpbmdAYmFpZHUuY29tPiB3cm90ZToN
Cg0KPiBGaXggcGJhX29mZnNldCBpbml0aWFsaXphdGlvbiB2YWx1ZSBmb3IgQkFJRFUgS1VOTFVO
IFZpcnR1YWwgRnVuY3Rpb24gDQo+IGRldmljZS4gVGhlIEtVTkxVTiBoYXJkd2FyZSByZXR1cm5z
IGFuIGluY29ycmVjdCB2YWx1ZSBmb3IgdGhlIFZGIFBCQSANCj4gb2Zmc2V0LCBhbmQgYWRkIGEg
cXVpcmsgdG8gaW5zdGVhZCByZXR1cm4gYSBoYXJkY29kZWQgdmFsdWUgb2YgMHhiNDAwLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQ2FpIEh1b3FpbmcgPGNhaWh1b3FpbmdAYmFpZHUuY29tPg0KPiAt
LS0NCj4gIGh3L3ZmaW8vcGNpLmMgICAgICAgICAgICB8IDggKysrKysrKysNCj4gIGluY2x1ZGUv
aHcvcGNpL3BjaV9pZHMuaCB8IDQgKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvdmZpby9wY2kuYyBiL2h3L3ZmaW8vcGNpLmMg
aW5kZXggDQo+IGFiNDA3N2FhZDIuLjcyYjdhYmY2MjMgMTAwNjQ0DQo+IC0tLSBhL2h3L3ZmaW8v
cGNpLmMNCj4gKysrIGIvaHcvdmZpby9wY2kuYw0KPiBAQCAtMTQ5OSw2ICsxNDk5LDE0IEBAIHN0
YXRpYyB2b2lkIHZmaW9fbXNpeF9lYXJseV9zZXR1cChWRklPUENJRGV2aWNlICp2ZGV2LCBFcnJv
ciAqKmVycnApDQo+ICAgICAgICAgIGlmICh2ZGV2LT52ZW5kb3JfaWQgPT0gUENJX1ZFTkRPUl9J
RF9DSEVMU0lPICYmDQo+ICAgICAgICAgICAgICAodmRldi0+ZGV2aWNlX2lkICYgMHhmZjAwKSA9
PSAweDU4MDApIHsNCj4gICAgICAgICAgICAgIG1zaXgtPnBiYV9vZmZzZXQgPSAweDEwMDA7DQo+
ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIEJBSURVIEtVTkxVTiBWaXJ0dWFsIEZ1bmN0aW9u
IGRldmljZXMgYXJlIGVuY29kZWQgYXMgMHgzNjg1IGZvcg0KPiArICAgICAgICAgKiBLVU5MVU4g
QUkgcHJvY2Vzc29yLiBUaGUgS1VOTFVOIGhhcmR3YXJlIHJldHVybnMgYW4gaW5jb3JyZWN0DQo+
ICsgICAgICAgICAqIHZhbHVlIGZvciB0aGUgVkYgUEJBIG9mZnNldC4gVGhlIGNvcnJlY3QgdmFs
dWUgaXMgMHhiNDAwLg0KPiArICAgICAgICAgKi8NCg0KV2hhdCBpcyB0aGUgaW5jb3JyZWN0IHZh
bHVlIGFuZCB3aGF0IGlzIHRoZSBCQVIgc2l6ZT8gIFRoaXMgaW5mb3JtYXRpb24gaW4gdGhlIGNv
bW1lbnQgY291bGQgaGVscCBkZWJ1Z2dpbmcgbGF0ZXIuDQoNCj4gKyAgICAgICAgfSBlbHNlIGlm
ICh2ZGV2LT52ZW5kb3JfaWQgPT0gUENJX1ZFTkRPUl9JRF9CQUlEVSAmJg0KPiArICAgICAgICAg
ICAgICAgICAgIHZkZXYtPmRldmljZV9pZCA9PSBQQ0lfREVWSUNFX0lEX0tVTkxVTl9WRikgew0K
DQpTaW5jZSB3ZSBkb24ndCBoYXZlIGFuICJlbmNvZGluZyIgbGlrZSB0aGUgcHJldmlvdXMgcXVp
cmssIHdlIGNhbiB1c2UNCnZmaW9fcGNpX2lzKCkgaGVyZToNCg0KICAgICAgICB9IGVsc2UgaWYg
KHZmaW9fcGNpX2lzKHZkZXYsIFBDSV9WRU5ET1JfSURfQkFJRFUsDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgUENJX0RFVklDRV9JRF9LVU5MVU5fVkYpKSB7DQoNCj4gKyAgICAgICAg
ICAgIG1zaXgtPnBiYV9vZmZzZXQgPSAweGI0MDA7DQo+ICAgICAgICAgIH0gZWxzZSBpZiAodmRl
di0+bXNpeF9yZWxvID09IE9GRl9BVVRPUENJQkFSX09GRikgew0KPiAgICAgICAgICAgICAgZXJy
b3Jfc2V0ZyhlcnJwLCAiaGFyZHdhcmUgcmVwb3J0cyBpbnZhbGlkIGNvbmZpZ3VyYXRpb24sICIN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIk1TSVggUEJBIG91dHNpZGUgb2Ygc3BlY2lmaWVk
IEJBUiIpOyBkaWZmIA0KPiAtLWdpdCBhL2luY2x1ZGUvaHcvcGNpL3BjaV9pZHMuaCBiL2luY2x1
ZGUvaHcvcGNpL3BjaV9pZHMuaCBpbmRleCANCj4gNWMxNDY4MWI4Mi4uYmM3M2M1MDI3NyAxMDA2
NDQNCj4gLS0tIGEvaW5jbHVkZS9ody9wY2kvcGNpX2lkcy5oDQo+ICsrKyBiL2luY2x1ZGUvaHcv
cGNpL3BjaV9pZHMuaA0KPiBAQCAtMjI3LDYgKzIyNywxMCBAQA0KPiAgI2RlZmluZSBQQ0lfVkVO
RE9SX0lEX0ZSRUVTQ0FMRSAgICAgICAgICAweDE5NTcNCj4gICNkZWZpbmUgUENJX0RFVklDRV9J
RF9NUEM4NTMzRSAgICAgICAgICAgMHgwMDMwDQo+ICANCj4gKyNkZWZpbmUgUENJX1ZFTkRPUl9J
RF9CQUlEVSAgICAgICAgICAgICAgMHgxZDIyDQo+ICsjZGVmaW5lIFBDSV9ERVZJQ0VfSURfS1VO
TFVOICAgICAgICAgICAgIDB4MzY4NA0KDQpMZXQncyBub3QgYWRkIGEgZGV2aWNlIElEIHRoYXQg
d2UgZG9uJ3QgdXNlIGVsc2V3aGVyZSBpbiB0aGUgY29kZSwgd2Ugb25seSB1c2UgdGhlIHZlbmRv
ciBJRCBhbmQgdGhlIFZGIElEIGJlbG93LiAgVGhhbmtzLA0KDQpBbGV4DQoNCj4gKyNkZWZpbmUg
UENJX0RFVklDRV9JRF9LVU5MVU5fVkYgICAgICAgICAgMHgzNjg1DQo+ICsNCj4gICNkZWZpbmUg
UENJX1ZFTkRPUl9JRF9JTlRFTCAgICAgICAgICAgICAgMHg4MDg2DQo+ICAjZGVmaW5lIFBDSV9E
RVZJQ0VfSURfSU5URUxfODIzNzggICAgICAgIDB4MDQ4NA0KPiAgI2RlZmluZSBQQ0lfREVWSUNF
X0lEX0lOVEVMXzgyNDQxICAgICAgICAweDEyMzcNCg0K

