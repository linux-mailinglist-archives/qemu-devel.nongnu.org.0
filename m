Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC27457E2A0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 15:54:22 +0200 (CEST)
Received: from localhost ([::1]:46838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEt6j-0005Vm-HP
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 09:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.drap@auriga.com>)
 id 1oEq4a-0002LF-SR
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 06:39:57 -0400
Received: from hq-ms.auriga.com ([82.97.202.32]:47258 helo=hq-ms.auriga.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.drap@auriga.com>)
 id 1oEq4X-0003bz-10
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 06:39:55 -0400
Received: from HQ-MS1.office.auriga.msk (82.97.202.32) by
 hq-ms1.office.auriga.msk (82.97.202.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Fri, 22 Jul 2022 13:28:32 +0300
Received: from HQ-MS1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e]) by
 hq-ms1.office.auriga.msk ([fe80::e47e:a86e:e738:f45e%3]) with mapi id
 15.02.1118.007; Fri, 22 Jul 2022 13:28:32 +0300
From: "Drap, Anton" <anton.drap@auriga.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?gb2312?B?RGFuaWVsIFAuIEJlcnJhbmeopg==?= <berrange@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Sebelev, Vladimir"
 <vladimir.sebelev@auriga.com>
Subject: Re: [PATCH v2] Loading new machines and devices from external modules
Thread-Topic: [PATCH v2] Loading new machines and devices from external modules
Thread-Index: AQHYm2cIc3eO0DnuKUO8RbRjctQBvq2FjaqAgAShnT4=
Date: Fri, 22 Jul 2022 10:28:31 +0000
Message-ID: <d711926c2de2406c9e785971ac058d8a@auriga.com>
References: <20220719115922.306265-1-anton.drap@auriga.com>,
 <Yta+06u01e16zKTd@redhat.com>
In-Reply-To: <Yta+06u01e16zKTd@redhat.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.99.99.90]
x-tm-as-product-ver: SMEX-14.0.0.1158-9.0.1002-27030.002
x-tm-as-result: No-10--20.076300-8.000000
x-tmase-matchedrid: Z/tjqhsgM6c7iuZ/mdYYtgeLCIX046iBjNLxrcxKViWsFJeHnIHZi1J7
 qurUfgrV09u9852d+TI2aDVyTGx/p5kShYcLpGH9rDZuIFerDYT3MMlWBma+yOdo//33TCNr92U
 gRT09630J20J6/X1jUiIuZ/6CFMb/iV+W3AL5LvPBLWXgH5RHPvo1c6H9DbojCJAMkZUwyBpOEd
 9LrUUcYR6I6ugYAnp0LTHwnYOikQ2nqX8cP+MnnePsX9qV3arkCPm/g09Et+kMf7Ce+LIFdhhLc
 NjoUT5G1Y4IIoI+uMJ85pjA/x1xfvpmtpBLoURa1JVSTP0E9d52NlrEE6Ojjet2gGXLArR6Unuq
 6tR+CtXBbSLvX0u/npTp3iXK6AMUQ/2UjISFQXCtye4yTToxztQoeM+lJUpETCjMsLY1HGYAthf
 4DwDQ7ZrFf6cTuZsv5DSMPEZQAkO//vF0tCNdIv67wpKrIJNBEqSmDx1CZ0okQRCilDpfuPRJXs
 JGdVBENom9oBSPl986N/cDgNNi4fHo9NwPFKnlWAuSz3ewb23AcYhf/hLwpq4gqyqHwHi+/mwrA
 JcV2mmDMGP0DrC3Yt5x7RpGJf1aF4r8H5YrEqzrQGUex1PL9WRiwCvS+G0mXW0oaF2DNM4Dw12R
 17PclpmXURexwsOZuce7gFxhKa1pkBMYDn8FeLXl40gTGJ5p8Ov7/Lmqcj2h9xN1JciTva7TOca
 MTTTjrFMDyJP7G27ho30+LUTeF5naxzJFBx6vVC5d5tiOKEBQQymr+7NCVhlz1vTsWmwiNlu4h9
 L2BAwPgCQ1Nx/qoNfeP+V/VXwsDBemPtRYU7mXBXaJoB9JZ1SeX1pUaPNfd1+qKb6k9uAEBoFKX
 61SFyeam5kIHECYa7leoU/OMhNIHLsvL1EPeI9MV/4mEzh7yF0w9+St0v4cDGfA1PcSH6cTt3jh
 cES7ftwZ3X11IV0=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--20.076300-8.000000
x-tmase-version: SMEX-14.0.0.1158-9.0.1002-27030.002
x-tm-snts-smtp: DAEB11A2E14693AF9B024717E87A2877A82FAFCDD685C0E28D9C273F930E84622000:8
Content-Type: multipart/alternative;
 boundary="_000_d711926c2de2406c9e785971ac058d8aaurigacom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=82.97.202.32; envelope-from=anton.drap@auriga.com;
 helo=hq-ms.auriga.ru
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 MIME_CHARSET_FARAWAY=2.45, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 Jul 2022 09:50:46 -0400
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

--_000_d711926c2de2406c9e785971ac058d8aaurigacom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgR3V5cywNCg0KDQoNCkxldCBtZSBjbGFyaWZ5IG15IHBvc2l0aW9uIGFib3V0IG91dCBvZiB0
cmVlIGRldmljZXMuIFllcywgSSB1bmRlcnN0YW5kIHRoYXQgY3VycmVudCBRRU1VIHBvbGl0aWNz
IGlzIHRvIGhhdmUgYWxsIHRoZSBzdXBwb3J0ZWQgcGxhdGZvcm1zIGluc2lkZSBRRU1VIHNvdXJj
ZSB0cmVlLCBidXQgYWN0dWFsbHkgc2ltdWxhdG9yIGNvcmUgZGV2ZWxvcG1lbnQsIGRldmVsb3Bt
ZW50IG9mIHRoZSBkZXZpY2VzIHN0YW5kYXJkIGxpYnJhcnkgYW5kIGRldmVsb3BtZW50IG9mIHZp
cnR1YWwgcGxhdGZvcm1zIGFyZSB0aHJlZSBkaWZmZXJlbnQgdGFza3MuIE1vcmVvdmVyIGRpZmZl
cmVudCBwZW9wbGUgaW50ZXJlc3RlZCBpbiBkaWZmZXJlbnQgcGFydHMgb2YgUUVNVS4gUUVNVSBj
b3JlIGRldmVsb3BlcnMgbm90IGludGVyZXN0ZWQgaW4gc3VwcG9ydGluZyBhbmQgbWFpbnRhaW5p
bmcgdG9ucyBvZiBwbGF0Zm9ybXMgYXZhaWxhYmxlIG9uIHRoZSBtYXJrZXQuIFZpcnR1YWwgcGxh
dGZvcm0gZGV2ZWxvcGVycyBub3QgaW50ZXJlc3RlZCBhbmQgdXN1YWxseSBkb26hr3QgaGF2ZSBy
ZXNvdXJjZXMgdG8gbWVyZ2UgdGhlaXIgY2hhbmdlcyB1cHN0cmVhbS4gU28gd2UgaGF2ZSBhIGxv
dHMgb2YgYWJhbmRvbmVkIFFFTVUgZm9ya3MgZm9yIGRpZmZlcmVudCBwbGF0Zm9ybXMuIEZvciBl
eGFtcGxlIHdloa9yZSBub3cgd29ya2luZyBvbiBSYXNwYmVycnkgUGkgNGIgaW1wbGVtZW50YXRp
b24gZm9yIG91ciBpbnRlcm5hbCBuZWVkcyBhbmQgd2Whr3JlIHBsYW5uaW5nIHRvIG1lcmdlIGl0
IHVwc3RyZWFtLiBJdKGvcyBiYXNlZCBvbiBzb21lIFFFTVUgZm9yayBhdXRob3Igb2Ygd2hpY2gg
d2FzbqGvdCBhYmxlIHRvIGNvbXBsZXRlIGl0IGFuZCBjb21taXQgdXBzdHJlYW0uIEFuZCBpdCBj
YW6hr3QgYmUgdXNlZCB3aXRoIGxhdGVyIFFFTVUgd2l0aG91dCBzb21lIGVmZm9ydHMgdG8gcG9y
dCBpdCB0byBuZXdlciBRRU1VIHZlcnNpb24uIE5vYm9keSBzdXBwb3J0cyBhbmQgbWFpbnRhaW5p
bmcgaXQgc2luY2UgY29uc3RhbnQgZWZmb3J0cyBuZWNlc3NhcnkgdG8gYmUgaW4gc3luYyB3aXRo
IFFFTVUgbWFpbmxpbmUuIFNvIG15IG9waW5pb24gaXMgdGhhdCBjb3JlIGRldmVsb3BtZW50LCBj
b3JlIGRldmljZSBsaWJyYXJ5IGFuZCB2aXJ0dWFsIHBsYXRmb3JtIGRldmVsb3BtZW50IHNob3Vs
ZCBiZSBkaXZpZGVkIHRvIG1ha2UgbGlmZSBlYXNpZXIgZm9yIGV2ZXJ5Ym9keS4gQW5kIHRoaXMg
Y2hhbmdlcyBpcyBmaXJzdCBzdGVwIHRvIGl0Lg0KDQoNCg0KQWJvdXQgbGVnYWwgcmVhc29ucyBh
bmQgR1BMIHZpb2xhdGlvbnMuIFBvc3NpYmlsaXR5IHRvIG1ha2UgLnNvIHdpdGggbWFjaGluZSBz
ZXBhcmF0ZWx5IGFuZCBsb2FkIGl0IHdpdGhvdXQgcHJvdmlkaW5nIHNvdXJjZXMgaXMgYSBsZWdh
bCByaXNrIGFuZCBjYW6hr3QgYmUgY29tcGxldGVseSBzb2x2ZWQgd2l0aCB0ZWNobmljYWwgYWN0
aW9ucy4gQmFuIG9uIGV4dGVybmFsIG1vZHVsZXMganVzdCBtYWtlcyBpdCBtb3JlIGRpZmZpY3Vs
dCBmb3IgZXZlcnlib2R5IHRvIHVzZSBub3QgdXBzdHJlYW0gY29kZSAoaW5jbHVkaW5nIEdQTCB2
aW9sYXRvcnMsIGJ1dCBub3Qgb25seSBmb3IgdGhlbSkgYW5kIGRvZXNuoa90IGJsb2NrIGFiaWxp
dHkgdG8gZGlzdHJpYnV0ZSBmdWxsIFFFTVUgZm9yayB3aXRoIGNsb3NlZCBtb2RlbHMgd2l0aG91
dCBwcm92aWRpbmcgc291cmNlcy4gU28gSSBkb26hr3Qgc2VlIGFueSByZWFzb24gdG8gbWFrZSB0
ZWNobmljYWwgbGltaXRhdGlvbnMgd2hpY2ggYWN0dWFsbHkgY2Fuoa90IHNvbHZlIGxlZ2FsIHBy
b2JsZW0uDQoNCg0KDQpCZXN0IFJlZ2FyZHMsDQoNCkFudG9uDQoNClNvZnR3YXJlIGVuZ2luZWVy
IGZyb20gQXVyaWdhIExMQzxodHRwOi8vd3d3LmF1cmlnYS5jb20vPg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0Kp7Cn5DogRGFuaWVsIFAuIEJlcnJhbmeopiA8YmVycmFuZ2VA
cmVkaGF0LmNvbT4NCqewp+Sn4afip9Gn06fdp9an36fgOiAxOSCn2qfwp92n8SAyMDIyIKfULiAx
OToyNQ0Kp6yn4Kfep+U6IERyYXAgQW50b24NCqesp+Cn4afap/E6IHFlbXUtZGV2ZWxAbm9uZ251
Lm9yZzsgRHJhcCwgQW50b24NCqe0p9an3qfROiBSZTogW1BBVENIIHYyXSBMb2FkaW5nIG5ldyBt
YWNoaW5lcyBhbmQgZGV2aWNlcyBmcm9tIGV4dGVybmFsIG1vZHVsZXMNCg0KT24gVHVlLCBKdWwg
MTksIDIwMjIgYXQgMDQ6NTk6MjJQTSArMDUwMCwgRHJhcCBBbnRvbiB3cm90ZToNCj4gRnJvbTog
IkRyYXAsIEFudG9uIiA8YW50b24uZHJhcEBhdXJpZ2EuY29tPg0KPg0KPiBUaGVyZSBpcyBubyBt
ZWNoYW5pc20gdG8gbG9hZCBleHRlcm5hbCBtYWNoaW5lcyBhbmQgY2xhc3NlcyBmcm9tIG1vZHVs
ZXMNCj4gYXQgdGhlIG1vbWVudC4gVGhpcyBwYXRjaCBpcyB0byBhZGQgdHdvIHBhcmFtZXRlcnMg
YGFkZF9tYWNoaW5lYCBhbmQNCj4gYGFkZF9tb2RpbmZvYCBmb3IgaXQuDQo+IGBhZGRfbWFjaGlu
ZWAgaXMgdG8gYWRkIG1hY2hpbmVzIGZyb20gZXh0ZXJuYWwgbW9kdWxlcy4NCj4gYGFkZF9tb2Rp
bmZvYCBpcyB0byBhZGQgZGV2aWNlcyBmcm9tIGV4dGVybmFsIG1vZHVsZXMsIG5lZWRlZCBmb3Ig
YSBuZXcNCj4gbWFjaGluZSwgZm9yIGV4YW1wbGUuDQo+IE1haW4gYWltIGlzIHRvIGhhdmUgcG9z
c2liaWxpdHkgdG8gZGV2ZWxvcCBpbmRlcGVuZGVudCBtb2RlbHMgYW5kIGJlIGFibGUNCj4gdG8g
dXNlIGl0IHdpdGggbWFpbmxpbmUgUUVNVS4gSXQgd2lsbCBoZWxwIHRvIG1ha2UgZGV2ZWxvcCBu
ZXcgbW9kZWxzIG9mDQo+IHByb3ByaWV0YXJ5IGJvYXJkcywgc2ltcGxpZnkgdG8gdXNlIFFlbXUg
YnkgaGFyZHdhcmUgZGV2ZWxvcGVycyBhbmQgZXh0ZW5kDQo+IG51bWJlciBvZiBzdXBwb3J0aW5n
IGJvYXJkcyBhbmQgZGV2aWNlcyBpbiBRRU1VLiBJdCB3aWxsIGJlIGVhc2llciBmb3INCj4gc21h
bGwgaGFyZHdhcmUgbWFudWZhY3R1cmVycyB0byB1c2UgUUVNVSB0byBkZXZlbG9wIHRoZWlyIG93
biBib2FyZCBtb2RlbHMNCj4gYW5kIHVzZSB0aGVtIHRvIHNoaWZ0IGxlZnQgb2YgRlcvU1cgZGV2
ZWxvcG1lbnQuDQoNCklJVUMsIHRoaXMgaXMgc3VnZ2VzdGluZyBRRU1VIGxvYWQgcHJlLWJ1aWx0
IC5zbyBmaWxlcyBjcmVhdGVkIGZyb20NCm5vbi11cHN0cmVhbSBjb2RlLCB0byBhcmJpdHJhcmls
eSBleHRlbmQgUUVNVSdzIGZ1bmN0aW9uYWxpdHkuIFN1Y2gNCi5zbyBmaWxlcyB3aWxsIGluaGVy
YW50bHkgaGF2ZSB0byBiZSBHUExkIGFzIHRoZXknbGwgZGVyaXZlIGZyb20NClFFTVUncyBpbnRl
cm5hbCBBUElzIHdoaWNoIGFyZSBHUEwuIEdpdmVuIHRoZSBwcm9wb3NlZCB1c2UgY2FzZSBpcw0K
dG8gZW11bGF0ZSBub24tcmVsZWFzZWQgcHJvcHJpZXRhcnkgaGFyZHdhcmUsIEkgc3RydWdnbGUg
dG8gc2VlIGhvdw0KeW91J2xsIGZ1bGxmaWxsIHRoZSByZXF1aXJlbWVudHMgZm9yIEdQTCBsaWNl
bnNpbmcgb2YgdGhlIGxvYWRlZCAuc28sDQp3aXRob3V0IHJldmVhbGluZyB5b3VyIHByb3ByaWV0
YXJ5IGhhcmR3YXJlIGRlc2lnbiB0byBhbnkgd2hvIHJlY2VpdmUNCnRoZSAuc28gZmlsZXMuDQoN
Cg0KTW9yZSBnZW5lcmFsbHksIFFFTVUncyBleGlzdGluZyBsb2FkYWJsZSBtb2R1bGUgdXNhZ2Ug
aXMgZXhwbGljaXRseQ0KZGVzaWduZWQgdG8gdHJ5IHRvICpwcmV2ZW50KiBsb2FkaW5nIG9mIG5v
bi11cHN0cmVhbSBjb2RlLiBJdCBhaW1zDQp0byBvbmx5IGxvYWQgY29kZSB0aGF0IHdhcyBidWls
dCBhcyBwYXJ0IG9mIHRoZSBpbnRlZ3JhdGVkIFFFTVUNCmJ1aWxkIHByb2Nlc3MuIGllLCBRRU1V
J3MgbG9hZGFibGUgbW9kdWxlIHN5c3RlbSBpcyBhYm91dCBtYWtpbmcNCml0IHBvc3NpYmxlIHRv
IGJ1aWxkIG1hbnkgUUVNVSBmZWF0dXJlcywgYnV0IHRoZW4gc2VsZWN0aXZlbHkgbG9hZA0KdGhl
bSBhdCBydW50aW1lIHRvIHJlZHVjZSBmb290cHJpbnQvYXR0YWNrIHN1cmZhY2UuIEl0IGlzICpu
b3QqDQppbnRlbmRlZCB0byBhbGxvdyBub24tdXBzdHJlYW0gY29kZSB0byBiZSBsb2FkZWQuDQoN
Cg0KQXNpZGUgZnJvbSBvdXIgZ29hbCB0byBwcmV2ZW50L2Rpc2NvdXJhZ2UgR1BMIHZpb2xhdGlv
biB0aHJvdWdoDQpjbG9zZWQgc291cmNlIGxvYWRhYmxlIG1vZHVsZXMsIFFFTVUgYWxzbyBoYXMg
YSBzdHJvbmcgZGVzaXJlIHRvDQpub3QgbG9jayBvdXJzZWx2ZXMgaW50byBzdXBwb3J0aW5nIGEg
cHVibGljIEFQSSBmb3IgbG9hZGFibGUNCm1vZHVsZXMuIE1haW50YWluZXJzIHdpc2ggdG8gcmV0
YWluIGZsZXhpYmlsaXR5IHRvIGNoYW5nZSB0aGUNCmludGVybmFsIEFQSXMgYXQgYW55IHRpbWUu
DQoNCg0KUGFydGlhbGx5IHJlbGF0ZWQgdG8gdGhpcyB0b3BpYywgdGhlcmUgaXMgc29tZSB3b3Jr
IHRha2luZyBwbGFjZQ0Kd2l0aCB0aGUgZ29hbCBvZiBtYWtpbmcgaXQgcG9zc2libGUgdG8gZGVm
aW5lIG5ldyBtYWNoaW5lIHR5cGVzDQppbiBRRU1VIGZyb20gYSBRQVBJIGJhc2VkIEpTT04gZGVz
Y3JpcHRpb24uICBUaGUgYWN0dWFsIGhhcmR3YXJlDQpkZXZpY2VzIGFuZCBDUFVzIHdvdWxkIHN0
aWxsIG5lZWQgY29kZSB0byBiZSBidWlsdCBpbnRvIFFFTVUNCmFuZCB1cHN0cmVhbSwgYnV0IHRo
ZSB3YXkgdGhlIGhhcmR3YXJlIGRldmljZXMgJiBDUFVzIGFyZSB3aXJlZA0KdG9nZXRoZXIgd291
bGQgYmUgY3VzdG9taXphYmxlIHZpYSB0aGUgSlNPTiBjb25maWcuICBUaGF0IGNvdWxkDQpnZXQg
c29tZSwgYnV0IG5vdCBhbGwsIG9mIHRoZSBiZW5lZml0cyB5b3Ugc2VlayB3aXRob3V0IHRoZQ0K
ZG93bnNpZGVzIHRoZSBRRU1VIG1haW50YWluZXJzIHdpc2ggdG8gYXZvaWQuICBUaGlzIGlzbid0
IHJlYWR5DQp0byBjb25zdW1lIHlldCBhbmQgd2UgZG9uJ3QgaGF2ZSBhbnkgZmlybSBFVEEgZWl0
aGVyIEknbQ0KYWZyYWlkLg0KDQpXaXRoIHJlZ2FyZHMsDQpEYW5pZWwNCi0tDQp8OiBodHRwczov
L2JlcnJhbmdlLmNvbSAgICAgIC1vLSAgICBodHRwczovL3d3dy5mbGlja3IuY29tL3Bob3Rvcy9k
YmVycmFuZ2UgOnwNCnw6IGh0dHBzOi8vbGlidmlydC5vcmcgICAgICAgICAtby0gICAgICAgICAg
ICBodHRwczovL2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6fA0KbGlidmlydDogVGhlIHZpcnR1YWxp
emF0aW9uIEFQSTxodHRwczovL2xpYnZpcnQub3JnLz4NCmxpYnZpcnQub3JnDQpsaWJ2aXJ0LCB2
aXJ0dWFsaXphdGlvbiwgdmlydHVhbGl6YXRpb24gQVBJDQoNCg0KDQp8OiBodHRwczovL2VudGFu
Z2xlLXBob3RvLm9yZyAgICAtby0gICAgaHR0cHM6Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFu
Z2UgOnwNCg0K

--_000_d711926c2de2406c9e785971ac058d8aaurigacom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in; font-size: 11pt; font-family=
: Calibri, sans-serif; color: rgb(33, 33, 33);">
<span lang=3D"EN-US" style=3D"font-family: Calibri, sans-serif, serif, Emoj=
iFont;">Hi Guys,</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in; font-size: 11pt; font-family=
: Calibri, sans-serif; color: rgb(33, 33, 33);">
<span lang=3D"EN-US" style=3D"font-family: Calibri, sans-serif, serif, Emoj=
iFont;">&nbsp;</span></p>
<p></p>
<p></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in; font-size: 11pt; font-family=
: Calibri, sans-serif; color: rgb(33, 33, 33);">
<span lang=3D"EN-US" style=3D"font-family: Calibri, sans-serif, serif, Emoj=
iFont;">Let me clarify my position about out of tree devices. Yes, I unders=
tand that current QEMU politics is to have all the supported platforms insi=
de QEMU source tree, but actually simulator
 core development, development of the devices standard library and developm=
ent of virtual platforms are three different tasks. Moreover different peop=
le interested in different parts of QEMU. QEMU core developers not interest=
ed in supporting and maintaining
 tons of platforms available on the market. Virtual platform developers not=
 interested and usually don=A1=AFt have resources to merge their changes up=
stream. So we have a lots of abandoned QEMU forks for different platforms. =
For example we=A1=AFre now working on Raspberry
 Pi 4b implementation for our internal needs and we=A1=AFre planning to mer=
ge it upstream. It=A1=AFs based on some QEMU fork author of which wasn=A1=
=AFt able to complete it and commit upstream. And it can=A1=AFt be used wit=
h later QEMU without some efforts to port it to newer
 QEMU version. Nobody supports and maintaining it since constant efforts ne=
cessary to be in sync with QEMU mainline. So my opinion is that core develo=
pment, core device library and virtual platform development should be divid=
ed to make life easier for everybody.
 And this changes is first step to it.</span></p>
<p></p>
<p></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in; font-size: 11pt; font-family=
: Calibri, sans-serif; color: rgb(33, 33, 33);">
<span lang=3D"EN-US" style=3D"font-family: Calibri, sans-serif, serif, Emoj=
iFont;"><br>
&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in; font-size: 11pt; font-family=
: Calibri, sans-serif; color: rgb(33, 33, 33);">
<span lang=3D"EN-US" style=3D"font-family: Calibri, sans-serif, serif, Emoj=
iFont;">About legal reasons and GPL violations. Possibility to make .so wit=
h machine separately and load it without providing sources is a legal risk =
and can=A1=AFt be completely solved with
 technical actions. Ban on external modules just makes it more difficult fo=
r everybody to use not upstream code (including GPL violators, but not only=
 for them) and doesn=A1=AFt block ability to distribute full QEMU fork with=
 closed models without providing sources.
 So I don=A1=AFt see any reason to make technical limitations which actuall=
y can=A1=AFt solve legal problem.</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in; font-size: 11pt; font-family=
: Calibri, sans-serif; color: rgb(33, 33, 33);">
<span lang=3D"EN-US" style=3D"font-family: Calibri, sans-serif, serif, Emoj=
iFont;">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in; font-size: 11pt; font-family=
: Calibri, sans-serif; color: rgb(33, 33, 33);">
<span lang=3D"EN-US" style=3D"font-family: Calibri, sans-serif, serif, Emoj=
iFont; font-size: 10pt;">Best&nbsp;Regards,&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in; font-size: 11pt; font-family=
: Calibri, sans-serif; color: rgb(33, 33, 33);">
<span lang=3D"EN-US" style=3D"font-family: Calibri, sans-serif, serif, Emoj=
iFont;"></span><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, He=
lvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe =
UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android =
Emoji&quot;, EmojiSymbols; font-size: 10pt;">Anton</span></p>
<p><font size=3D"2" style=3D"color: rgb(33, 33, 33); font-family: Calibri, =
sans-serif, serif, EmojiFont;"><span style=3D"font-size: 10pt;">Software en=
gineer from&nbsp;</span></font><a href=3D"http://www.auriga.com/" target=3D=
"_blank" rel=3D"noopener noreferrer" style=3D"font-family: Calibri, sans-se=
rif, serif, EmojiFont; font-size: 14.6667px;" title=3D"http://www.auriga.co=
m/=0A=
Ctrl&#43; =A7=EB=A7=D6=A7=DD=A7=E9=A7=E0=A7=DC =A7=DA=A7=DD=A7=DA =A7=DC=A7=
=D1=A7=E3=A7=D1=A7=DF=A7=DA=A7=D6: =A7=E1=A7=D6=A7=E2=A7=D6=A7=DB=A7=E4=A7=
=DA =A7=E1=A7=E0 =A7=E3=A7=E3=A7=ED=A7=DD=A7=DC=A7=D6"><font size=3D"2"><sp=
an style=3D"font-size: 10pt;"><font color=3D"#0563C1">Auriga
 LLC</font></span></font></a></p>
<p></p>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=A7=B0=A7=E4:</b> Daniel P. B=
errang=A8=A6 &lt;berrange@redhat.com&gt;<br>
<b>=A7=B0=A7=E4=A7=E1=A7=E2=A7=D1=A7=D3=A7=DD=A7=D6=A7=DF=A7=E0:</b> 19 =A7=
=DA=A7=F0=A7=DD=A7=F1 2022 =A7=D4. 19:25<br>
<b>=A7=AC=A7=E0=A7=DE=A7=E5:</b> Drap Anton<br>
<b>=A7=AC=A7=E0=A7=E1=A7=DA=A7=F1:</b> qemu-devel@nongnu.org; Drap, Anton<b=
r>
<b>=A7=B4=A7=D6=A7=DE=A7=D1:</b> Re: [PATCH v2] Loading new machines and de=
vices from external modules</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Tue, Jul 19, 2022 at 04:59:22PM &#43;0500, Drap=
 Anton wrote:<br>
&gt; From: &quot;Drap, Anton&quot; &lt;anton.drap@auriga.com&gt;<br>
&gt; <br>
&gt; There is no mechanism to load external machines and classes from modul=
es<br>
&gt; at the moment. This patch is to add two parameters `add_machine` and<b=
r>
&gt; `add_modinfo` for it.<br>
&gt; `add_machine` is to add machines from external modules.<br>
&gt; `add_modinfo` is to add devices from external modules, needed for a ne=
w<br>
&gt; machine, for example.<br>
&gt; Main aim is to have possibility to develop independent models and be a=
ble<br>
&gt; to use it with mainline QEMU. It will help to make develop new models =
of<br>
&gt; proprietary boards, simplify to use Qemu by hardware developers and ex=
tend<br>
&gt; number of supporting boards and devices in QEMU. It will be easier for=
<br>
&gt; small hardware manufacturers to use QEMU to develop their own board mo=
dels<br>
&gt; and use them to shift left of FW/SW development.<br>
<br>
IIUC, this is suggesting QEMU load pre-built .so files created from<br>
non-upstream code, to arbitrarily extend QEMU's functionality. Such<br>
.so files will inherantly have to be GPLd as they'll derive from<br>
QEMU's internal APIs which are GPL. Given the proposed use case is<br>
to emulate non-released proprietary hardware, I struggle to see how<br>
you'll fullfill the requirements for GPL licensing of the loaded .so,<br>
without revealing your proprietary hardware design to any who receive<br>
the .so files.<br>
<br>
<br>
More generally, QEMU's existing loadable module usage is explicitly<br>
designed to try to *prevent* loading of non-upstream code. It aims<br>
to only load code that was built as part of the integrated QEMU<br>
build process. ie, QEMU's loadable module system is about making<br>
it possible to build many QEMU features, but then selectively load<br>
them at runtime to reduce footprint/attack surface. It is *not*<br>
intended to allow non-upstream code to be loaded.<br>
<br>
<br>
Aside from our goal to prevent/discourage GPL violation through<br>
closed source loadable modules, QEMU also has a strong desire to<br>
not lock ourselves into supporting a public API for loadable<br>
modules. Maintainers wish to retain flexibility to change the<br>
internal APIs at any time.<br>
<br>
<br>
Partially related to this topic, there is some work taking place<br>
with the goal of making it possible to define new machine types<br>
in QEMU from a QAPI based JSON description.&nbsp; The actual hardware<br>
devices and CPUs would still need code to be built into QEMU<br>
and upstream, but the way the hardware devices &amp; CPUs are wired<br>
together would be customizable via the JSON config.&nbsp; That could<br>
get some, but not all, of the benefits you seek without the<br>
downsides the QEMU maintainers wish to avoid.&nbsp; This isn't ready<br>
to consume yet and we don't have any firm ETA either I'm<br>
afraid.<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" id=3D"LPlnk825185" previewremoved=3D"tr=
ue">https://berrange.com</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -o-&nbsp;&nbsp;&=
nbsp;
<a href=3D"https://www.flickr.com/photos/dberrange" id=3D"LPlnk956038" prev=
iewremoved=3D"true">
https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" id=3D"LPlnk989989" previewremoved=3D"tru=
e">https://libvirt.org</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
-o-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"https://fstop138.berrange.com" id=3D"LPlnk59255" previewremoved=
=3D"true">https://fstop138.berrange.com</a> :|
<div id=3D"LPBorder_GT_16584845619120.31907147013939974" style=3D"margin-bo=
ttom: 20px; overflow: auto; width: 100%; text-indent: 0px;">
<table id=3D"LPContainer_16584845619110.44744252278234575" role=3D"presenta=
tion" cellspacing=3D"0" style=3D"width: 90%; background-color: rgb(255, 255=
, 255); position: relative; overflow: auto; padding-top: 20px; padding-bott=
om: 20px; margin-top: 20px; border-top: 1px dotted rgb(200, 200, 200); bord=
er-bottom: 1px dotted rgb(200, 200, 200);">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td id=3D"TextCell_16584845619120.6127948159468621" colspan=3D"2" style=3D"=
vertical-align: top; position: relative; padding: 0px; display: table-cell;=
">
<div id=3D"LPRemovePreviewContainer_16584845619120.7401051908317879"></div>
<div id=3D"LPTitle_16584845619120.18132162838559385" style=3D"top: 0px; col=
or: rgb(0, 120, 215); font-weight: 400; font-size: 21px; font-family: wf_se=
goe-ui_light, &quot;Segoe UI Light&quot;, &quot;Segoe WP Light&quot;, &quot=
;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; line-heig=
ht: 21px;">
<a id=3D"LPUrlAnchor_16584845619120.07717305462077362" href=3D"https://libv=
irt.org/" target=3D"_blank" style=3D"text-decoration: none;">libvirt: The v=
irtualization API</a></div>
<div id=3D"LPMetadata_16584845619120.7312393815229452" style=3D"margin: 10p=
x 0px 16px; color: rgb(102, 102, 102); font-weight: 400; font-family: wf_se=
goe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, s=
ans-serif; font-size: 14px; line-height: 14px;">
libvirt.org</div>
<div id=3D"LPDescription_16584845619120.5867739016059099" style=3D"display:=
 block; color: rgb(102, 102, 102); font-weight: 400; font-family: wf_segoe-=
ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-=
serif; font-size: 14px; line-height: 20px; max-height: 100px; overflow: hid=
den;">
libvirt, virtualization, virtualization API</div>
</td>
</tr>
</tbody>
</table>
</div>
<br>
<br>
|: <a href=3D"https://entangle-photo.org" id=3D"LPlnk565320" previewremoved=
=3D"true">https://entangle-photo.org</a>&nbsp;&nbsp;&nbsp; -o-&nbsp;&nbsp;&=
nbsp;
<a href=3D"https://www.instagram.com/dberrange" id=3D"LPlnk833873" previewr=
emoved=3D"true">
https://www.instagram.com/dberrange</a> :|<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_d711926c2de2406c9e785971ac058d8aaurigacom_--

