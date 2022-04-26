Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD450FD8D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:47:35 +0200 (CEST)
Received: from localhost ([::1]:45486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKbO-00050A-C1
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1njKXg-0002iu-KY
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 08:43:44 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1njKXb-0006BI-Et
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 08:43:43 -0400
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KnhM43P6qz67NMW;
 Tue, 26 Apr 2022 20:41:04 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 14:43:35 +0200
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 13:43:35 +0100
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2375.024; Tue, 26 Apr 2022 13:43:35 +0100
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, Yi Liu
 <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "thuth@redhat.com" <thuth@redhat.com>, "farman@linux.ibm.com"
 <farman@linux.ibm.com>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>, "pasic@linux.ibm.com"
 <pasic@linux.ibm.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "chao.p.peng@intel.com" <chao.p.peng@intel.com>, "yi.y.sun@intel.com"
 <yi.y.sun@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, Zhangfei Gao
 <zhangfei.gao@linaro.org>
Subject: RE: [RFC 00/18] vfio: Adopt iommufd
Thread-Topic: [RFC 00/18] vfio: Adopt iommufd
Thread-Index: AQHYT+0OTGNprklv2E6ANQZpjBJsW60CAlLggAATGICAABalMA==
Date: Tue, 26 Apr 2022 12:43:35 +0000
Message-ID: <4ac4956cfe344326a805966535c1dc43@huawei.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <4f920d463ebf414caa96419b625632d5@huawei.com>
 <be8aa86a-25d1-d034-5e3b-6406aa7ff897@redhat.com>
In-Reply-To: <be8aa86a-25d1-d034-5e3b-6406aa7ff897@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.178]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-devel@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBBdWdlciBbbWFp
bHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0NCj4gU2VudDogMjYgQXByaWwgMjAyMiAxMjo0NQ0K
PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9k
aUBodWF3ZWkuY29tPjsgWWkNCj4gTGl1IDx5aS5sLmxpdUBpbnRlbC5jb20+OyBhbGV4LndpbGxp
YW1zb25AcmVkaGF0LmNvbTsgY29odWNrQHJlZGhhdC5jb207DQo+IHFlbXUtZGV2ZWxAbm9uZ251
Lm9yZw0KPiBDYzogZGF2aWRAZ2lic29uLmRyb3BiZWFyLmlkLmF1OyB0aHV0aEByZWRoYXQuY29t
OyBmYXJtYW5AbGludXguaWJtLmNvbTsNCj4gbWpyb3NhdG9AbGludXguaWJtLmNvbTsgYWtyb3dp
YWtAbGludXguaWJtLmNvbTsgcGFzaWNAbGludXguaWJtLmNvbTsNCj4gampoZXJuZUBsaW51eC5p
Ym0uY29tOyBqYXNvd2FuZ0ByZWRoYXQuY29tOyBrdm1Admdlci5rZXJuZWwub3JnOw0KPiBqZ2dA
bnZpZGlhLmNvbTsgbmljb2xpbmNAbnZpZGlhLmNvbTsgZXJpYy5hdWdlci5wcm9AZ21haWwuY29t
Ow0KPiBrZXZpbi50aWFuQGludGVsLmNvbTsgY2hhby5wLnBlbmdAaW50ZWwuY29tOyB5aS55LnN1
bkBpbnRlbC5jb207DQo+IHBldGVyeEByZWRoYXQuY29tOyBaaGFuZ2ZlaSBHYW8gPHpoYW5nZmVp
Lmdhb0BsaW5hcm8ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1JGQyAwMC8xOF0gdmZpbzogQWRvcHQg
aW9tbXVmZA0KDQpbLi4uXQ0KIA0KPiA+Pg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0v
MC12MS1lNzljZDhkMTY4ZTgrNi1pb21tdWZkX2pnZ0BudmlkaWEuY29tDQo+ID4+IC8NCj4gPj4g
WzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9sdXhpczE5OTkvaW9tbXVmZC90cmVlL2lvbW11ZmQtdjUu
MTctcmM2DQo+ID4+IFszXSBodHRwczovL2dpdGh1Yi5jb20vbHV4aXMxOTk5L3FlbXUvdHJlZS9x
ZW11LWZvci01LjE3LXJjNi12bS1yZmN2MQ0KPiA+IEhpLA0KPiA+DQo+ID4gSSBoYWQgYSBnbyB3
aXRoIHRoZSBhYm92ZSBicmFuY2hlcyBvbiBvdXIgQVJNNjQgcGxhdGZvcm0gdHJ5aW5nIHRvDQo+
IHBhc3MtdGhyb3VnaA0KPiA+IGEgVkYgZGV2LCBidXQgUWVtdSByZXBvcnRzIGFuIGVycm9yIGFz
IGJlbG93LA0KPiA+DQo+ID4gWyAgICAwLjQ0NDcyOF0gaGlzaV9zZWMyIDAwMDA6MDA6MDEuMDog
ZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpDQo+ID4gcWVtdS1zeXN0ZW0tYWFyY2g2NC1p
b21tdWZkOiBJT01NVV9JT0FTX01BUCBmYWlsZWQ6IEJhZCBhZGRyZXNzDQo+ID4gcWVtdS1zeXN0
ZW0tYWFyY2g2NC1pb21tdWZkOiB2ZmlvX2NvbnRhaW5lcl9kbWFfbWFwKDB4YWFhYWZlYjQwY2Uw
LA0KPiAweDgwMDAwMDAwMDAsIDB4MTAwMDAsIDB4ZmZmZmI0MGVmMDAwKSA9IC0xNCAoQmFkIGFk
ZHJlc3MpDQo+ID4NCj4gPiBJIHRoaW5rIHRoaXMgaGFwcGVucyBmb3IgdGhlIGRldiBCQVIgYWRk
ciByYW5nZS4gSSBoYXZlbid0IGRlYnVnZ2VkIHRoZQ0KPiBrZXJuZWwNCj4gPiB5ZXQgdG8gc2Vl
IHdoZXJlIGl0IGFjdHVhbGx5IHJlcG9ydHMgdGhhdC4NCj4gRG9lcyBpdCBwcmV2ZW50IHlvdXIg
YXNzaWduZWQgZGV2aWNlIGZyb20gd29ya2luZz8gSSBoYXZlIHN1Y2ggZXJyb3JzDQo+IHRvbyBi
dXQgdGhpcyBpcyBhIGtub3duIGlzc3VlLiBUaGlzIGlzIGR1ZSB0byB0aGUgZmFjdCBQMlAgRE1B
IGlzIG5vdA0KPiBzdXBwb3J0ZWQgeWV0Lg0KPiANCg0KWWVzLCB0aGUgYmFzaWMgdGVzdHMgYWxs
IGdvb2Qgc28gZmFyLiBJIGFtIHN0aWxsIG5vdCB2ZXJ5IGNsZWFyIGhvdyBpdCB3b3JrcyBpZg0K
dGhlIG1hcCgpIGZhaWxzIHRob3VnaC4gSXQgbG9va3MgbGlrZSBpdCBmYWlscyBpbiwNCg0KaW9t
bXVmZF9pb2FzX21hcCgpDQogIGlvcHRfbWFwX3VzZXJfcGFnZXMoKQ0KICAgaW9wdF9tYXBfcGFn
ZXMoKQ0KICAgLi4NCiAgICAgcGZuX3JlYWRlcl9waW5fcGFnZXMoKQ0KDQpTbyBkb2VzIGl0IG1l
YW4gaXQganVzdCB3b3JrcyBiZWNhdXNlIHRoZSBwYWdlIGlzIHJlc2lkZW50KCk/DQoNClRoYW5r
cywNClNoYW1lZXINCg0KDQoNCg==

