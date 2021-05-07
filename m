Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AE1376629
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 15:28:38 +0200 (CEST)
Received: from localhost ([::1]:59984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf0Wz-0004Yv-Qz
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 09:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.laight@aculab.com>)
 id 1lexHt-0004MZ-6R
 for qemu-devel@nongnu.org; Fri, 07 May 2021 06:00:49 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:60282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.laight@aculab.com>)
 id 1lexHq-0008Fs-Fs
 for qemu-devel@nongnu.org; Fri, 07 May 2021 06:00:48 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-124-XIgOuarZNwyN-c2JrDVmUg-1; Fri, 07 May 2021 10:59:29 +0100
X-MC-Unique: XIgOuarZNwyN-c2JrDVmUg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 7 May 2021 10:59:27 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Fri, 7 May 2021 10:59:27 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Steven Price' <steven.price@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>
Subject: RE: [PATCH v11 5/6] KVM: arm64: ioctl to fetch/store tags in a guest
Thread-Topic: [PATCH v11 5/6] KVM: arm64: ioctl to fetch/store tags in a guest
Thread-Index: AQHXQyWd0YdlNuDzYEavAjiQNQoHN6rXyCEQ
Date: Fri, 7 May 2021 09:59:27 +0000
Message-ID: <42fd9c5ceb974be3b2aae5dd288507e8@AcuMS.aculab.com>
References: <20210416154309.22129-1-steven.price@arm.com>
 <20210416154309.22129-6-steven.price@arm.com>
 <20210427175844.GB17872@arm.com>
 <340d35c2-46ed-35ea-43fa-e5cb64c27230@arm.com> <YJGIBTor+blelKKT@arm.com>
 <25c85740-0119-549e-6ddb-aea69c5efc76@arm.com>
In-Reply-To: <25c85740-0119-549e-6ddb-aea69c5efc76@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=185.58.85.151;
 envelope-from=david.laight@aculab.com; helo=eu-smtp-delivery-151.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 May 2021 09:24:09 -0400
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
Cc: Mark
 Rutland <mark.rutland@arm.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Marc Zyngier <maz@kernel.org>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4NCj4gU2VudDogMDcgTWF5
IDIwMjEgMTA6NDUNCj4gDQo+IE9uIDA0LzA1LzIwMjEgMTg6NDQsIENhdGFsaW4gTWFyaW5hcyB3
cm90ZToNCj4gPiBPbiBUaHUsIEFwciAyOSwgMjAyMSBhdCAwNTowNjowN1BNICswMTAwLCBTdGV2
ZW4gUHJpY2Ugd3JvdGU6DQo+ID4+IE9uIDI3LzA0LzIwMjEgMTg6NTgsIENhdGFsaW4gTWFyaW5h
cyB3cm90ZToNCj4gPj4+IE9uIEZyaSwgQXByIDE2LCAyMDIxIGF0IDA0OjQzOjA4UE0gKzAxMDAs
IFN0ZXZlbiBQcmljZSB3cm90ZToNCj4gPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oDQo+
ID4+Pj4gaW5kZXggMjQyMjNhZGFlMTUwLi4yYjg1YTA0N2MzN2QgMTAwNjQ0DQo+ID4+Pj4gLS0t
IGEvYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oDQo+ID4+Pj4gKysrIGIvYXJjaC9h
cm02NC9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oDQo+ID4+Pj4gQEAgLTE4NCw2ICsxODQsMjAgQEAg
c3RydWN0IGt2bV92Y3B1X2V2ZW50cyB7DQo+ID4+Pj4gICAgCV9fdTMyIHJlc2VydmVkWzEyXTsN
Cj4gPj4+PiAgICB9Ow0KPiA+Pj4+ICtzdHJ1Y3Qga3ZtX2FybV9jb3B5X210ZV90YWdzIHsNCj4g
Pj4+PiArCV9fdTY0IGd1ZXN0X2lwYTsNCj4gPj4+PiArCV9fdTY0IGxlbmd0aDsNCj4gPj4+PiAr
CXVuaW9uIHsNCj4gPj4+PiArCQl2b2lkIF9fdXNlciAqYWRkcjsNCj4gPj4+PiArCQlfX3U2NCBw
YWRkaW5nOw0KPiA+Pj4+ICsJfTsNCj4gPj4+PiArCV9fdTY0IGZsYWdzOw0KPiA+Pj4+ICsJX191
NjQgcmVzZXJ2ZWRbMl07DQo+ID4+Pj4gK307DQo+ID4gWy4uLl0NCj4gPj4+IE1heWJlIGFkZCB0
aGUgdHdvIHJlc2VydmVkDQo+ID4+PiB2YWx1ZXMgdG8gdGhlIHVuaW9uIGluIGNhc2Ugd2Ugd2Fu
dCB0byBzdG9yZSBzb21ldGhpbmcgZWxzZSBpbiB0aGUNCj4gPj4+IGZ1dHVyZS4NCj4gPj4NCj4g
Pj4gSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gaGVyZS4gV2hhdCB3b3VsZCB0aGUgcmVzZXJ2
ZWQgZmllbGRzIGJlIHVuaW9uZWQNCj4gPj4gd2l0aD8gQW5kIHN1cmVseSB0aGV5IGFyZSBubyBs
b25nZXIgcmVzZXJ2ZWQgaW4gdGhhdCBjYXNlPw0KPiA+DQo+ID4gSW4gY2FzZSB5b3Ugd2FudCB0
byBrZWVwIHRoZSBzdHJ1Y3R1cmUgc2l6ZSB0aGUgc2FtZSBmb3IgZnV0dXJlDQo+ID4gZXhwYW5z
aW9uIGFuZCB0aGUgZXhwYW5zaW9uIG9ubHkgaGFwcGVucyB2aWEgdGhlIHVuaW9uLCB5b3UnZCBh
ZGQgc29tZQ0KPiA+IHBhZGRpbmcgaW4gdGhlcmUganVzdCBpbiBjYXNlLiBXZSBkbyB0aGlzIGZv
ciBzdHJ1Y3Qgc2lnaW5mbyB3aXRoIGFuDQo+ID4gX3NpX3BhZFtdIGFycmF5IGluIHRoZSB1bmlv
bi4NCj4gPg0KPiANCj4gQWggSSBzZWUgd2hhdCB5b3UgbWVhbi4gSW4gdGhpcyBjYXNlICJwYWRk
aW5nIiBpcyBqdXN0IGEgc2l6ZXIgdG8gZW5zdXJlDQo+IHRoYXQgZmxhZ3MgaXMgYWx3YXlzIHRo
ZSBzYW1lIGFsaWdubWVudCAtIGl0J3Mgbm90IGludGVuZGVkIHRvIGJlIHVzZWQuDQo+IEFzIEkg
bm90ZWQgcHJldmlvdXNseSB0aG91Z2ggaXQncyBjb21wbGV0ZWx5IHBvaW50bGVzcyBhcyB0aGlz
IG9ubHkgb24NCj4gYXJtNjQgYW5kIGV2ZW4gMzIgYml0IEFybSB3b3VsZCBuYXR1cmFsbHkgYWxp
Z24gdGhlIGZvbGxvd2luZyBfX3U2NC4NCg0KSXQgaXMgbmljZSB0byBiZSBleHBsaWNpdCB0aG91
Z2guDQpZb3UgYWxzbyBoYXZlIHRoZSBwcm9ibGVtIHRoYXQgYSAzMmJpdCAoTEUpIGFwcGxpY2F0
aW9uIHdvdWxkIGxlYXZlIHRoZQ0KaGlnaCBiaXRzIG9mIHRoZSB1c2VyIGFkZHJlc3MgdW5kZWZp
bmVkLg0KDQpBbGwgbW9vdCBhbmQgcG9pbnRsZXNzIGlmIDY0Yml0IG9ubHkgdGhvdWdoLg0KDQoJ
RGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1v
dW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEz
OTczODYgKFdhbGVzKQ0K


