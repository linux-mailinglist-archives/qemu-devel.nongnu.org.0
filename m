Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B11C1AC4E4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 16:07:19 +0200 (CEST)
Received: from localhost ([::1]:34692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP5Ak-0007Rb-Lm
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 10:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1jP59o-0006ur-Uv
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:06:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1jP59n-00011N-T3
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:06:20 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2099 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1jP59l-0000y5-5G; Thu, 16 Apr 2020 10:06:17 -0400
Received: from lhreml719-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 36671CEF52316704C813;
 Thu, 16 Apr 2020 15:06:14 +0100 (IST)
Received: from dggeme755-chm.china.huawei.com (10.3.19.101) by
 lhreml719-chm.china.huawei.com (10.201.108.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1913.5; Thu, 16 Apr 2020 15:06:12 +0100
Received: from dggeme755-chm.china.huawei.com ([10.7.64.71]) by
 dggeme755-chm.china.huawei.com ([10.7.64.71]) with mapi id 15.01.1713.004;
 Thu, 16 Apr 2020 22:06:10 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v25 00/10] Add ARMv8 RAS virtualization support in QEMU
Thread-Topic: [PATCH v25 00/10] Add ARMv8 RAS virtualization support in QEMU
Thread-Index: AQHWDy2Iho/0lGTqbEC6pfKPUDNKmKh70QB0gAABAfE=
Date: Thu, 16 Apr 2020 14:06:10 +0000
Message-ID: B0366384-0528-4F5C-931F-075D5ECCEEAF
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
 <5e9863af.1c69fb81.dbe22.5caaSMTPIN_ADDED_BROKEN@mx.google.com>,
 <CAFEAcA_-fcGUKoo955jeHzNDDVTKCsgvH6QGqUWu0efAyth1rg@mail.gmail.com>
In-Reply-To: <CAFEAcA_-fcGUKoo955jeHzNDDVTKCsgvH6QGqUWu0efAyth1rg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: multipart/alternative;
 boundary="_000_B036638405284F5C931F075D5ECCEEAF_"
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.176.76.210
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
Cc: fam <fam@euphon.net>, "xiaoguangrong.eric" <xiaoguangrong.eric@gmail.com>,
 kvm <kvm@vger.kernel.org>, mst <mst@redhat.com>,
 mtosatti <mtosatti@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl" <shannon.zhaosl@gmail.com>,
 "zhengxiang \(A\)" <zhengxiang9@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, pbonzini <pbonzini@redhat.com>,
 imammedo <imammedo@redhat.com>, rth <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_B036638405284F5C931F075D5ECCEEAF_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

b2vvvIx0aGFua3MgdmVyeSBtdWNoIGZvciBwZXRlcidzIHRpbWUgYW5kICAgICByZXBseQ0KDQrl
j5Hku7bkurrvvJpQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQrmlLbk
u7bkurrvvJpnZW5nZG9uZ2ppdSA8Z2VuZ2RvbmdqaXVAaHVhd2VpLmNvbT4NCuaKhOKAg+mAge+8
mmltYW1tZWRvIDxpbWFtbWVkb0ByZWRoYXQuY29tPjttc3QgPG1zdEByZWRoYXQuY29tPjt4aWFv
Z3Vhbmdyb25nLmVyaWMgPHhpYW9ndWFuZ3JvbmcuZXJpY0BnbWFpbC5jb20+O3NoYW5ub24uemhh
b3NsIDxzaGFubm9uLnpoYW9zbEBnbWFpbC5jb20+O2ZhbSA8ZmFtQGV1cGhvbi5uZXQ+O3J0aCA8
cnRoQHR3aWRkbGUubmV0PjtFZHVhcmRvIEhhYmtvc3QgPGVoYWJrb3N0QHJlZGhhdC5jb20+O210
b3NhdHRpIDxtdG9zYXR0aUByZWRoYXQuY29tPjtxZW11LWRldmVsIDxxZW11LWRldmVsQG5vbmdu
dS5vcmc+O2t2bSA8a3ZtQHZnZXIua2VybmVsLm9yZz47cWVtdS1hcm0gPHFlbXUtYXJtQG5vbmdu
dS5vcmc+O3Bib256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjt6aGVuZ3hpYW5nIChBKSA8emhl
bmd4aWFuZzlAaHVhd2VpLmNvbT47TGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+O0pvbmF0
aGFuIENhbWVyb24gPGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNvbT4NCuaXtuKAg+mXtO+8mjIw
MjAtMDQtMTYgMjI6MDI6MzQNCuS4u+KAg+mimO+8mlJlOiBbUEFUQ0ggdjI1IDAwLzEwXSBBZGQg
QVJNdjggUkFTIHZpcnR1YWxpemF0aW9uIHN1cHBvcnQgaW4gUUVNVQ0KDQpPbiBUaHUsIDE2IEFw
ciAyMDIwIGF0IDE0OjU0LCBnZW5nZG9uZ2ppdSA8Z2VuZ2RvbmdqaXVAaHVhd2VpLmNvbT4gd3Jv
dGU6DQo+DQo+IHBpbmcuLi4uDQoNCkhpOyB0aGlzIGlzIG9uIG15IHRvLXJldmlldyBxdWV1ZSwg
YnV0IHNvIGFyZSAyNSBvdGhlciBwYXRjaHNldHMuDQooSSd2ZSBidWlsdCB1cCBhIGJpdCBvZiBh
IGJhY2tsb2cgZHVlIHRvIGNvbmNlbnRyYXRpbmcgb24gd29yaw0KZm9yIHRoZSA1LjAgcmVsZWFz
ZSB3aGlsZSB3ZSdyZSBpbiB0aGUgZnJlZXplIHBlcmlvZC4pIEkgd2lsbA0KZ2V0IHRvIGl0IGV2
ZW50dWFsbHkgaWYgbm9ib2R5IGVsc2UgZG9lcyBmaXJzdC4uLg0KDQp0aGFua3MNCi0tIFBNTQ0K

--_000_B036638405284F5C931F075D5ECCEEAF_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+DQo8IS0tIGNvbnZlcnRlZCBmcm9tIHRleHQg
LS0+PHN0eWxlPjwhLS0gLkVtYWlsUXVvdGUgeyBtYXJnaW4tbGVmdDogMXB0OyBwYWRkaW5nLWxl
ZnQ6IDRwdDsgYm9yZGVyLWxlZnQ6ICM4MDAwMDAgMnB4IHNvbGlkOyB9IC0tPjwvc3R5bGU+DQo8
L2hlYWQ+DQo8Ym9keT4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQo8IS0tDQpib2R5DQoJe2Zv
bnQtZmFtaWx5OkNhbGlicml9DQotLT4NCjwvc3R5bGU+DQo8ZGl2Pg0KPGRpdj4NCjxwPjxmb250
IHNpemU9IjMiPm9r77yMdGhhbmtzIHZlcnkgbXVjaCBmb3IgcGV0ZXIncyB0aW1lIGFuZCZuYnNw
OyAmbmJzcDsgJm5ic3A7cmVwbHk8L2ZvbnQ+PC9wPg0KPC9kaXY+DQo8ZGl2PjwvZGl2Pg0KPGRp
diBuYW1lPSJ4X0FueU9mZmljZS1CYWNrZ3JvdW5kLUltYWdlIiBzdHlsZT0iYm9yZGVyLXRvcDox
cHggc29saWQgI0I1QzRERjsgcGFkZGluZzo4cHgiPg0KPGRpdiBzdHlsZT0id29yZC1icmVhazpi
cmVhay1hbGwiPjxiPuWPkeS7tuS6uu+8mjwvYj5QZXRlciBNYXlkZWxsICZsdDtwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmcmZ3Q7PC9kaXY+DQo8ZGl2IHN0eWxlPSJ3b3JkLWJyZWFrOmJyZWFrLWFs
bCI+PGI+5pS25Lu25Lq677yaPC9iPmdlbmdkb25naml1ICZsdDtnZW5nZG9uZ2ppdUBodWF3ZWku
Y29tJmd0OzwvZGl2Pg0KPGRpdiBzdHlsZT0id29yZC1icmVhazpicmVhay1hbGwiPjxiPuaKhOKA
g+mAge+8mjwvYj5pbWFtbWVkbyAmbHQ7aW1hbW1lZG9AcmVkaGF0LmNvbSZndDs7bXN0ICZsdDtt
c3RAcmVkaGF0LmNvbSZndDs7eGlhb2d1YW5ncm9uZy5lcmljICZsdDt4aWFvZ3Vhbmdyb25nLmVy
aWNAZ21haWwuY29tJmd0OztzaGFubm9uLnpoYW9zbCAmbHQ7c2hhbm5vbi56aGFvc2xAZ21haWwu
Y29tJmd0OztmYW0gJmx0O2ZhbUBldXBob24ubmV0Jmd0OztydGggJmx0O3J0aEB0d2lkZGxlLm5l
dCZndDs7RWR1YXJkbyBIYWJrb3N0ICZsdDtlaGFia29zdEByZWRoYXQuY29tJmd0OzttdG9zYXR0
aQ0KICZsdDttdG9zYXR0aUByZWRoYXQuY29tJmd0OztxZW11LWRldmVsICZsdDtxZW11LWRldmVs
QG5vbmdudS5vcmcmZ3Q7O2t2bSAmbHQ7a3ZtQHZnZXIua2VybmVsLm9yZyZndDs7cWVtdS1hcm0g
Jmx0O3FlbXUtYXJtQG5vbmdudS5vcmcmZ3Q7O3Bib256aW5pICZsdDtwYm9uemluaUByZWRoYXQu
Y29tJmd0Ozt6aGVuZ3hpYW5nIChBKSAmbHQ7emhlbmd4aWFuZzlAaHVhd2VpLmNvbSZndDs7TGlu
dXhhcm0gJmx0O2xpbnV4YXJtQGh1YXdlaS5jb20mZ3Q7O0pvbmF0aGFuIENhbWVyb24gJmx0O2pv
bmF0aGFuLmNhbWVyb25AaHVhd2VpLmNvbSZndDs8L2Rpdj4NCjxkaXYgc3R5bGU9IndvcmQtYnJl
YWs6YnJlYWstYWxsIj48Yj7ml7bigIPpl7TvvJo8L2I+MjAyMC0wNC0xNiAyMjowMjozNDwvZGl2
Pg0KPGRpdiBzdHlsZT0id29yZC1icmVhazpicmVhay1hbGwiPjxiPuS4u+KAg+mimO+8mjwvYj5S
ZTogW1BBVENIIHYyNSAwMC8xMF0gQWRkIEFSTXY4IFJBUyB2aXJ0dWFsaXphdGlvbiBzdXBwb3J0
IGluIFFFTVU8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPGZvbnQg
c2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMHB0OyI+DQo8ZGl2IGNsYXNzPSJQbGFp
blRleHQiPk9uIFRodSwgMTYgQXByIDIwMjAgYXQgMTQ6NTQsIGdlbmdkb25naml1ICZsdDtnZW5n
ZG9uZ2ppdUBodWF3ZWkuY29tJmd0OyB3cm90ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0OyBwaW5nLi4u
Ljxicj4NCjxicj4NCkhpOyB0aGlzIGlzIG9uIG15IHRvLXJldmlldyBxdWV1ZSwgYnV0IHNvIGFy
ZSAyNSBvdGhlciBwYXRjaHNldHMuPGJyPg0KKEkndmUgYnVpbHQgdXAgYSBiaXQgb2YgYSBiYWNr
bG9nIGR1ZSB0byBjb25jZW50cmF0aW5nIG9uIHdvcms8YnI+DQpmb3IgdGhlIDUuMCByZWxlYXNl
IHdoaWxlIHdlJ3JlIGluIHRoZSBmcmVlemUgcGVyaW9kLikgSSB3aWxsPGJyPg0KZ2V0IHRvIGl0
IGV2ZW50dWFsbHkgaWYgbm9ib2R5IGVsc2UgZG9lcyBmaXJzdC4uLjxicj4NCjxicj4NCnRoYW5r
czxicj4NCi0tIFBNTTxicj4NCjwvZGl2Pg0KPC9zcGFuPjwvZm9udD4NCjwvYm9keT4NCjwvaHRt
bD4NCg==

--_000_B036638405284F5C931F075D5ECCEEAF_--

