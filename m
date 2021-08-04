Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007F03DF95D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 03:46:07 +0200 (CEST)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB5yw-0000Cp-13
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 21:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jianjay.zhou@huawei.com>)
 id 1mB5xT-0007FK-A3
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 21:44:35 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jianjay.zhou@huawei.com>)
 id 1mB5xP-0004tK-IS
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 21:44:34 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GfZFB3S5zz83kw;
 Wed,  4 Aug 2021 09:40:30 +0800 (CST)
Received: from kwepeml500003.china.huawei.com (7.221.188.182) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 09:44:19 +0800
Received: from dggema773-chm.china.huawei.com (10.1.198.217) by
 kwepeml500003.china.huawei.com (7.221.188.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 09:44:19 +0800
Received: from dggema773-chm.china.huawei.com ([10.9.49.87]) by
 dggema773-chm.china.huawei.com ([10.9.49.87]) with mapi id 15.01.2176.012;
 Wed, 4 Aug 2021 09:44:18 +0800
From: "Zhoujian (jay)" <jianjay.zhou@huawei.com>
To: Yi Sun <yi.y.sun@linux.intel.com>
Subject: RE: Question about delaying dirty log stop to next vm_start
Thread-Topic: Question about delaying dirty log stop to next vm_start
Thread-Index: AQHXh3RsC2IDyZ+Vnkiu5QG5DYVPDKtijcKQ
Date: Wed, 4 Aug 2021 01:44:18 +0000
Message-ID: <ed55f836280f41be8429114c6bf01d42@huawei.com>
References: <20210802075349.GA2565@yi.y.sun>
In-Reply-To: <20210802075349.GA2565@yi.y.sun>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.151.254]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jianjay.zhou@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Huangweidong \(C\)" <weidong.huang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgWWksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWkgU3VuIFtt
YWlsdG86eWkueS5zdW5AbGludXguaW50ZWwuY29tXQ0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAy
LCAyMDIxIDM6NTQgUE0NCj4gVG86IFpob3VqaWFuIChqYXkpIDxqaWFuamF5Lnpob3VAaHVhd2Vp
LmNvbT4NCj4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcGJvbnppbmlAcmVkaGF0LmNvbTsg
c2FuamF5Lmsua3VtYXJAaW50ZWwuY29tOw0KPiB5aS5sLmxpdUBpbnRlbC5jb207IHlpLnkuc3Vu
QGxpbnV4LmludGVsLmNvbQ0KPiBTdWJqZWN0OiBRdWVzdGlvbiBhYm91dCBkZWxheWluZyBkaXJ0
eSBsb2cgc3RvcCB0byBuZXh0IHZtX3N0YXJ0DQo+IA0KPiBIaSwgSmF5LA0KPiANCj4gV2UgYXJl
IHRlc3Rpbmcgc29tZSBsaXZlIG1pZ3JhdGlvbiBjYXNlcyByZWNlbnRseS4gV2UgZm91bmQgeW91
ciBiZWxvdyBwYXRjaA0KPiBkZWxheXMgdGhlIGRpcnR5IGxvZyBzdG9wIHRvIHRoZSBuZXh0IHZt
X3N0YXJ0Lg0KPiANCj4gY29tbWl0IDE5MzEwNzYwNzcyNTRhMjg4NmRhYTdjODMwYzc4MzhlYmQx
ZjgxZWYNCj4gQXV0aG9yOiBKYXkgWmhvdSA8amlhbmpheS56aG91QGh1YXdlaS5jb20+DQo+IERh
dGU6ICAgRnJpIEp1bCAyOCAxODoyODo1MyAyMDE3ICswODAwDQo+IA0KPiAgICAgbWlncmF0aW9u
OiBvcHRpbWl6ZSB0aGUgZG93bnRpbWUNCj4gDQo+IFdlIHVuZGVyc3RhbmQgdGhpcyBjb21taXQg
Y2FuIG9wdGltaXplIHRoZSBkb3dudGltZS4gQnV0IHdlIG9ic2VydmVkIHRoYXQNCj4gdGhlIGRp
cnR5IGxvZyBzdG9wIGNhbm5vdCBiZSBleGVjdXRlZCBpZiB1c2VyIGlucHV0cyAicXVpdCIgaW4g
cWVtdSBtb25pdG9yIGFmdGVyDQo+IG1pZ3JhdGlvbiBjb21wbGV0ZXMuIEhhdmUgeW91IGNvbnNp
ZGVyZWQgc3VjaCBjYXNlIGJlZm9yZT8NCg0KSWYgdGhlIG1pZ3JhdGlvbiBpcyBzdWNjZXNzZnVs
bHkgZmluaXNoZWQsIHRoZSBzcmMgVk0gc2hvdWxkIGJlIGRlc3Ryb3llZC4gDQoNCklmIHVzZXIg
aW5wdXRzICJxdWl0IiBpbiBxZW11IG1vbml0b3IgYWZ0ZXIgbWlncmF0aW9uIGNvbXBsZXRlcywg
dGhlIFZNIGlzIHN0aWxsDQpwYXVzZWQodmNwdSBpcyBzdG9wcGVkKSwgZGlydHkgbG9nIHRha2Vz
IG5vIGVmZmVjdDsgaWYgdGhlIG1pZ3JhdGlvbiBmYWlsZWQsIHRoZSBkaXJ0eSBsb2cNCnN0b3Ag
Y2FuIGJlIGV4ZWN1dGVkIGFmdGVyIHNyYyBWTSBzdGFydGVkLg0KDQpUaGFua3MsDQpKYXkgWmhv
dQ0K

