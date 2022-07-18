Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431857820D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:19:18 +0200 (CEST)
Received: from localhost ([::1]:40208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPiX-0002lO-Df
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.pour@hetzner.com>)
 id 1oDPRv-0003is-OK; Mon, 18 Jul 2022 08:02:09 -0400
Received: from mail.hetzner.company ([2a01:4f8:d0a:203a::1]:57636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.pour@hetzner.com>)
 id 1oDPRr-0007Nr-9m; Mon, 18 Jul 2022 08:02:06 -0400
Received: from [2a01:4f8:0:a53b:9775:b751:8e88:cd9d]
 (helo=[IPV6:2a01:4f8:0:a63b:9775:b751:8e88:cd9d])
 by mail.hetzner.company with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92) (envelope-from <raphael.pour@hetzner.com>)
 id 1oDPRi-0006pZ-2j; Mon, 18 Jul 2022 14:01:54 +0200
Message-ID: <4fc3aa76-d190-9868-8efe-43dbe62198ed@hetzner.com>
Date: Mon, 18 Jul 2022 14:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:RBD" <qemu-block@nongnu.org>,
 Peter Lieven <pl@kamp.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Ilya Dryomov <idryomov@gmail.com>
References: <20220413122656.3070251-1-raphael.pour@hetzner.com>
 <21cbfa05-0e2c-8e69-a5ab-fac31f87531f@redhat.com>
From: Raphael Pour <raphael.pour@hetzner.com>
Autocrypt: addr=raphael.pour@hetzner.com; keydata=
 xjMEXmXjyxYJKwYBBAHaRw8BAQdAtiEYnlLIuIUjvvqOH//nEbhrxSa54ZyAl7Iel403QaXN
 J1JhcGhhZWwgUG91ciA8cmFwaGFlbC5wb3VyQGhldHpuZXIuY29tPsKWBBMWCAA+FiEEvj4O
 DnHb6pxm/uWJzbHrt4XF634FAl5l48sCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgEC
 F4AACgkQzbHrt4XF635TcwD+NEMqL1HZPHP/WRsYujCDtqt0p+7uxGcpvzv//AjqMZ0A+wUh
 0bOYYNdlXWNMMNLA88SsAT2mxAfD+F/paVmLpdoLzjgEXmXjyxIKKwYBBAGXVQEFAQEHQB0z
 JYP6jtTj989IJL1vguinsiIxia5fkW83OB1+Bb4QAwEIB8J+BBgWCAAmFiEEvj4ODnHb6pxm
 /uWJzbHrt4XF634FAl5l48sCGwwFCQlmAYAACgkQzbHrt4XF6372LgEAi3qfceU+R53Ehg/Y
 SSHV4wg+zfPwrD6ylEg/xKabYDcBALrD0E3YX458RPjLIOC8H0u0rcFIvBqNYx/kGaMEmbEG
Subject: Re: [PATCH] block/rbd: support driver-specific reopen
In-Reply-To: <21cbfa05-0e2c-8e69-a5ab-fac31f87531f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xtufM2i39ZTRh8m1dgClf8ZD"
X-Authenticated-Sender: raphael.pour@hetzner.com
Received-SPF: pass client-ip=2a01:4f8:d0a:203a::1;
 envelope-from=raphael.pour@hetzner.com; helo=mail.hetzner.company
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xtufM2i39ZTRh8m1dgClf8ZD
Content-Type: multipart/mixed; boundary="------------lhAZw3vIYFvwmf6hcQ9I7bEG";
 protected-headers="v1"
From: Raphael Pour <raphael.pour@hetzner.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:RBD" <qemu-block@nongnu.org>,
 Peter Lieven <pl@kamp.de>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Ilya Dryomov <idryomov@gmail.com>
Message-ID: <4fc3aa76-d190-9868-8efe-43dbe62198ed@hetzner.com>
Subject: Re: [PATCH] block/rbd: support driver-specific reopen
References: <20220413122656.3070251-1-raphael.pour@hetzner.com>
 <21cbfa05-0e2c-8e69-a5ab-fac31f87531f@redhat.com>
In-Reply-To: <21cbfa05-0e2c-8e69-a5ab-fac31f87531f@redhat.com>

--------------lhAZw3vIYFvwmf6hcQ9I7bEG
Content-Type: multipart/mixed; boundary="------------mT9VcNbdAmB0i1bL3ADwIrj2"

--------------mT9VcNbdAmB0i1bL3ADwIrj2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNy8xLzIyIDExOjQxLCBIYW5uYSBSZWl0eiB3cm90ZToNCj4gT24gMTMuMDQuMjIgMTQ6
MjYsIFJhcGhhZWwgUG91ciB3cm90ZToNCj4gID4+IMKgwqDCoMKgwqAgfQ0KPj4gLcKgwqDC
oCByZXR1cm4gcmV0Ow0KPj4gK8KgwqDCoCAvKg0KPj4gK8KgwqDCoMKgICogUmVtb3ZlIGFs
bCBrZXlzIGZyb20gdGhlIGdlbmVyaWMgbGF5ZXIgd2hpY2gNCj4+ICvCoMKgwqDCoCAqIGNh
bid0IGJlIGNvbnZlcnRlZCBieSByYmQNCj4+ICvCoMKgwqDCoCAqID4NCj4gRG9lcyBhbnkg
b3RoZXIgZHJpdmVyIGRvIHRoaXM/wqAgU2hvdWxkbuKAmXQgd2UgbGVhdmUgdGhlbSB0aGVy
ZSBzbyB0aGF0IA0KPiB0aGUgZ2VuZXJpYyBsYXllciBjYW4gdmVyaWZ5IHRoYXQgdGhleSBh
cmVu4oCZdCBjaGFuZ2VkPw0KPiANCj4+ICvCoMKgwqAgcWRpY3RfZGVsKHN0YXRlLT5vcHRp
b25zLCAiZHJpdmVyIik7DQo+PiArwqDCoMKgIHFkaWN0X2RlbChzdGF0ZS0+b3B0aW9ucywg
Im5vZGUtbmFtZSIpOw0KPj4gK8KgwqDCoCBxZGljdF9kZWwoc3RhdGUtPm9wdGlvbnMsICJh
dXRvLXJlYWQtb25seSIpOw0KPj4gK8KgwqDCoCBxZGljdF9kZWwoc3RhdGUtPm9wdGlvbnMs
ICJkaXNjYXJkIik7DQo+PiArwqDCoMKgIHFkaWN0X2RlbChzdGF0ZS0+b3B0aW9ucywgImNh
Y2hlIik7DQo+IA0KPiBCZWNhdXNlIEFGQUlVIHRoaXMgd291bGQgbWVhbiB0aGF0IHVzZXJz
IGNvdWxkIGF0dGVtcHQgdG8gY2hhbmdlIGUuZy4gDQo+IHRoZSBAY2FjaGUgb3B0aW9uLCBh
bmQgd291bGRu4oCZdCByZWNlaXZlIGFuIGVycm9yIGJhY2ssIGV2ZW4gdGhvdWdoIHRoZXJl
IA0KPiBpcyBubyBzdXBwb3J0IGZvciBjaGFuZ2luZyBpdC4NCj4gDQo+PiArDQo+PiArwqDC
oMKgIC8qDQo+PiArwqDCoMKgwqAgKiBUbyBtYWludGFpbiB0aGUgY29tcGF0aWJpbGl0eSBw
cmlvciB0aGUgcmJkLXJlb3BlbiwNCj4+ICvCoMKgwqDCoCAqIHdoZXJlIHRoZSBnZW5lcmlj
IGxheWVyIGNhbiBiZSBhbHRlcmVkIHdpdGhvdXQgYW55DQo+PiArwqDCoMKgwqAgKiByYmQg
YXJndW1lbnQgZ2l2ZW4sDQo+IA0KPiBXaGF0IGRvZXMg4oCcdGhlIGdlbmVyaWMgbGF5ZXIg
Y2FuIGJlIGFsdGVyZWTigJ0gbWVhbj/CoCBBcyBmYXIgYXMgSSANCj4gdW5kZXJzdGFuZCwg
aXQgd2FzIG9ubHkgcG9zc2libGUgdG8gY2hhbmdlIGJldHdlZW4gcmVhZC93cml0ZSBhbmQg
DQo+IHJlYWQtb25seSBhY2Nlc3MuDQo+IA0KPj4gKw0KPj4gK8KgwqDCoCBrZXlwYWlycyA9
IGdfc3RyZHVwKHFkaWN0X2dldF90cnlfc3RyKHN0YXRlLT5vcHRpb25zLCANCj4+ICI9a2V5
dmFsdWUtcGFpcnMiKSk7DQo+PiArwqDCoMKgIGlmIChrZXlwYWlycykgew0KPj4gK8KgwqDC
oMKgwqDCoMKgIHFkaWN0X2RlbChzdGF0ZS0+b3B0aW9ucywgIj1rZXl2YWx1ZS1wYWlycyIp
Ow0KPj4gK8KgwqDCoCB9DQo+PiArDQo+PiArwqDCoMKgIHNlY3JldGlkID0gZ19zdHJkdXAo
cWRpY3RfZ2V0X3RyeV9zdHIoc3RhdGUtPm9wdGlvbnMsIA0KPj4gInBhc3N3b3JkLXNlY3Jl
dCIpKTsNCj4+ICvCoMKgwqAgaWYgKHNlY3JldGlkKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAg
cWRpY3RfZGVsKHN0YXRlLT5vcHRpb25zLCAicGFzc3dvcmQtc2VjcmV0Iik7DQo+PiArwqDC
oMKgIH0NCj4+ICsNCj4+ICvCoMKgwqAgciA9IHFlbXVfcmJkX2NvbnZlcnRfb3B0aW9ucyhz
dGF0ZS0+b3B0aW9ucywgJm9wdHMsICZsb2NhbF9lcnIpOw0KPj4gK8KgwqDCoCBpZiAobG9j
YWxfZXJyKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
ICogSWYga2V5cGFpcnMgYXJlIHByZXNlbnQsIHRoYXQgbWVhbnMgc29tZSBvcHRpb25zIGFy
ZSANCj4+IHByZXNlbnQgaW4NCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogdGhlIG1vZGVybiBv
cHRpb24gZm9ybWF0LsKgIERvbid0IGF0dGVtcHQgdG8gcGFyc2UgbGVnYWN5IA0KPj4gb3B0
aW9uDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGZvcm1hdHMsIGFzIHdlIHdvbid0IHN1cHBv
cnQgbWl4ZWQgdXNhZ2UuDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4gK8KgwqDCoMKg
wqDCoMKgIGlmIChrZXlwYWlycykgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJy
b3JfcHJvcGFnYXRlKGVycnAsIGxvY2FsX2Vycik7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIG91dDsNCj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+PiArDQo+PiArwqDCoMKg
wqDCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogSWYgdGhlIGluaXRpYWwgYXR0
ZW1wdCB0byBjb252ZXJ0IGFuZCBwcm9jZXNzIHRoZSBvcHRpb25zIA0KPj4gZmFpbGVkLA0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiB3ZSBtYXkgYmUgYXR0ZW1wdGluZyB0byBvcGVuIGFu
IGltYWdlIGZpbGUgdGhhdCBoYXMgdGhlIA0KPj4gcmJkIG9wdGlvbnMNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgICogc3BlY2lmaWVkIGluIHRoZSBvbGRlciBmb3JtYXQgY29uc2lzdGluZyBv
ZiBhbGwga2V5L3ZhbHVlIA0KPj4gcGFpcnMNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogZW5j
b2RlZCBpbiB0aGUgZmlsZW5hbWUuwqAgR28gYWhlYWQgYW5kIGF0dGVtcHQgdG8gcGFyc2Ug
dGhlDQo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGZpbGVuYW1lLCBhbmQgc2VlIGlmIHdlIGNh
biBwdWxsIG91dCB0aGUgcmVxdWlyZWQgb3B0aW9ucy4NCj4+ICvCoMKgwqDCoMKgwqDCoMKg
ICovDQo+PiArwqDCoMKgwqDCoMKgwqAgciA9IHFlbXVfcmJkX2F0dGVtcHRfbGVnYWN5X29w
dGlvbnMoc3RhdGUtPm9wdGlvbnMsICZvcHRzLCANCj4+ICZrZXlwYWlycyk7DQo+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKHIgPCAwKSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
Kg0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFByb3BhZ2F0ZSB0aGUgb3JpZ2lu
YWwgZXJyb3IsIG5vdCB0aGUgbGVnYWN5IHBhcnNpbmcgDQo+PiBmYWxsYmFjaw0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGVycm9yLCBhcyB0aGUgbGF0dGVyIHdhcyBqdXN0
IGEgYmVzdC1lZmZvcnQgYXR0ZW1wdC4NCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ki8NCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBs
b2NhbF9lcnIpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7DQo+PiAr
wqDCoMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qDQo+PiArwqDCoMKgwqDC
oMKgwqDCoCAqIFRha2UgY2FyZSB3aGVuZXZlciBkZWNpZGluZyB0byBhY3R1YWxseSBkZXBy
ZWNhdGU7IG9uY2UgDQo+PiB0aGlzIGFiaWxpdHkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICog
aXMgcmVtb3ZlZCwgd2Ugd2lsbCBub3QgYmUgYWJsZSB0byBvcGVuIGFueSBpbWFnZXMgd2l0
aCANCj4+IGxlZ2FjeS1zdHlsZWQNCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogYmFja2luZyBp
bWFnZSBzdHJpbmdzLg0KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8NCj4+ICvCoMKgwqDCoMKg
wqDCoCB3YXJuX3JlcG9ydCgiUkJEIG9wdGlvbnMgZW5jb2RlZCBpbiB0aGUgZmlsZW5hbWUg
YXMga2V5dmFsdWUgDQo+PiBwYWlycyAiDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgImlzIGRlcHJlY2F0ZWQiKTsNCj4+ICvCoMKgwqAgfQ0KPj4gKw0K
Pj4gK8KgwqDCoCAvKg0KPj4gK8KgwqDCoMKgICogUmVtb3ZlIHRoZSBwcm9jZXNzZWQgb3B0
aW9ucyBmcm9tIHRoZSBRRGljdCAodGhlIHZpc2l0b3IgDQo+PiBwcm9jZXNzZXMNCj4+ICvC
oMKgwqDCoCAqIF9hbGxfIG9wdGlvbnMgaW4gdGhlIFFEaWN0KQ0KPj4gK8KgwqDCoMKgICov
DQo+PiArwqDCoMKgIHdoaWxlICgoZSA9IHFkaWN0X2ZpcnN0KHN0YXRlLT5vcHRpb25zKSkp
IHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBxZGljdF9kZWwoc3RhdGUtPm9wdGlvbnMsIGUtPmtl
eSk7DQo+PiArwqDCoMKgIH0NCiA+DQogPiBPSywgSSBzZWUgd2h5IHlvdeKAmWQgdGhlbiB3
YW50IHRvIHJlbW92ZSBhbGwgbm9uLVJCRCBvcHRpb25zIGJlZm9yZSB0aGlzDQogPiBwb2lu
dC4gIE90aGVyIGJsb2NrIGRyaXZlcnMgc2VlbSB0byBzb2x2ZSB0aGlzIGJ5IGhhdmluZyBh
bg0KID4gWF9ydW50aW1lX29wdHMgUWVtdU9wdHNMaXN0LCB3aGljaCBjb250YWlucyBhbGwg
ZHJpdmVyLWhhbmRsZWQgb3B0aW9ucywNCiA+IHNvIHRoZXkgY2FuIHRoZW4gdXNlIHFlbXVf
b3B0c19hYnNvcmJfcWRpY3QoKSB0byBleHRyYWN0IHRoZSBvcHRpb25zDQogPiB0aGV5IGNh
biBoYW5kbGUuICAoQ29tcGFyZSBlLmcuIHFjb3cyX3VwZGF0ZV9vcHRpb25zX3ByZXBhcmUo
KS4pDQogPg0KDQpMb29raW5nIHRocm91Z2ggYWxsIHRoZSBkcml2ZXJzLCByYmQgc2VlbXMg
dG8gYmUgdGhlIG9ubHkgb25lIG5vdCANCmFic29yYmluZyBpdHMgb3B0aW9ucyB2aWEgcnVu
dGltZV9vcHRzIGJ1dCBpbnN0ZWFkIHVzaW5nIA0KcWVtdV9yYmRfY29udmVydF9vcHRpb25z
LiBUaGUgY29udmVydGVyIHZpc2l0cyBhbGwgdGhlIG9wdGlvbnMgZnJvbSANCkJsb2NrZGV2
T3B0aW9uc1JiZCBkZWZpbmVkIGluIGJsb2NrLWNvcmUuanNvbi4gSWYgdGhlcmUgaXMgYW4g
dW5rbm93biANCm9wdGlvbiB0aGUgY29udmVyc2lvbiBmYWlscyB3aXRoIEVJTlZBTC4NCg0K
VGhlIHJ1bnRpbWVfb3B0cyBpbiBjb250cmFzdCB0byB0aGUgYWxyZWFkeSBkZWZpbmVkIGpz
b24gc2NoZW1hIHdpdGggdGhlIA0KdmlzaXRvci1jb2RlLWdlbmVyYXRpb24gc2VlbSB0byBi
ZSByZWR1bmRhbnQuIERvIHlvdSBoYXZlIHNvbWUgaW5zaWdodHMgDQp3aHkgYW5kIHdoZW4g
dGhpcyByZWR1bmRhbmN5IGlzIHJlYXNvbmFibGU/DQoNCkkgY2FtZSB1cCB3aXRoIHNldmVy
YWwgYWx0ZXJuYXRpdmVzOg0KDQoxLiBhZGQgb3duIHJ1bnRpbWVfb3B0czoNCiAgIC0gcHJv
OiAidGhlIHFlbXUgd2F5IiwgaXQgYmVoYXZlcyBsaWtlIG1vc3Qgb2YgdGhlIGRyaXZlcnMN
CiAgIC0gY29uOiByZWR1bmRhbmN5IHRvIHFlbXVfcmJkX2NvbnZlcnRfb3B0aW9ucyB3aGlj
aCBkb2VzIHRoZSBzYW1lIA0KZXhjZXB0IHNraXBwaW5nIHRoZSBnZW5lcmljIGJsb2NrIGxh
eWVyIG9wdGlvbnMgYW5kIGFkZHMgKzFrIGxpbmVzDQogICAtIGNvbjogSSBjb3VsZG4ndCBm
aWd1cmUgb3V0IGhvdyB0byBhZGQgbm9uLXByaW1pdGl2ZSBvcHRpb25zIHRvIHRoZSANCnJ1
bnRpbWVfb3B0cyBsaWtlIGVuY3J5cHQgb3Igc2VydmVyDQoyLiB0ZWxsIHZpc2l0b3IgdG8g
aWdub3JlIHVua25vd24ga2V5cyAoPykNCjMuIHBhcnNlIHJiZCBvcHRpb25zIG1hbnVhbGx5
IChvcHBvc2l0ZSBvZiBkZWxldGluZyB0aGUgZ2VuZXJpYyBibG9jayBrZXlzKQ0KDQpJIGFn
cmVlIGRlbGV0aW5nIHRoZSBnZW5lcmljIGJsb2NrIG9wdHMgaXNuJ3Qgb3B0aW1hbC4NCg0K
V2hhdCBkbyB5b3UgdGhpbms/DQoNCllvdXIgcmVtYWluaW5nIHBvaW50cyBhcmUgYWxzbyBy
ZWFzb25hYmxlIGFuZCBJJ2xsIHN1Ym1pdCB0aGVpciBmaXggDQphbG9uZyB3aXRoIHRoZSBz
b2x1dGlvbiB0byB0aGUgaXNzdWUgYWJvdmUuDQo=
--------------mT9VcNbdAmB0i1bL3ADwIrj2
Content-Type: application/pgp-keys; name="OpenPGP_0xCDB1EBB785C5EB7E.asc"
Content-Disposition: attachment; filename="OpenPGP_0xCDB1EBB785C5EB7E.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEXmXjyxYJKwYBBAHaRw8BAQdAtiEYnlLIuIUjvvqOH//nEbhrxSa54ZyAl7Ie
l403QaXNJ1JhcGhhZWwgUG91ciA8cmFwaGFlbC5wb3VyQGhldHpuZXIuY29tPsKW
BBMWCAA+FiEEvj4ODnHb6pxm/uWJzbHrt4XF634FAl5l48sCGwMFCQlmAYAFCwkI
BwIGFQoJCAsCBBYCAwECHgECF4AACgkQzbHrt4XF635TcwD+NEMqL1HZPHP/WRsY
ujCDtqt0p+7uxGcpvzv//AjqMZ0A+wUh0bOYYNdlXWNMMNLA88SsAT2mxAfD+F/p
aVmLpdoLzjgEXmXjyxIKKwYBBAGXVQEFAQEHQB0zJYP6jtTj989IJL1vguinsiIx
ia5fkW83OB1+Bb4QAwEIB8J+BBgWCAAmFiEEvj4ODnHb6pxm/uWJzbHrt4XF634F
Al5l48sCGwwFCQlmAYAACgkQzbHrt4XF6372LgEAi3qfceU+R53Ehg/YSSHV4wg+
zfPwrD6ylEg/xKabYDcBALrD0E3YX458RPjLIOC8H0u0rcFIvBqNYx/kGaMEmbEG
=3D3kgq
-----END PGP PUBLIC KEY BLOCK-----

--------------mT9VcNbdAmB0i1bL3ADwIrj2--

--------------lhAZw3vIYFvwmf6hcQ9I7bEG--

--------------xtufM2i39ZTRh8m1dgClf8ZD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS+Pg4OcdvqnGb+5YnNseu3hcXrfgUCYtVLrgUDAAAAAAAKCRDNseu3hcXrfluW
AQCasarBbsfUqiadZJQdMMy0lRQwgOoFFLDixrgrF/UXVQEAhYRiPjweFzYrVSFqTMPKWwtgGlIp
Lh1EIbAkhZ5NgAc=
=iWli
-----END PGP SIGNATURE-----

--------------xtufM2i39ZTRh8m1dgClf8ZD--

