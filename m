Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E9557DD09
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 11:02:01 +0200 (CEST)
Received: from localhost ([::1]:53670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEoXo-0005Fn-81
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 05:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oEoSB-0000M7-Vc
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:56:12 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oEoS9-0000Tm-AG
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:56:11 -0400
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Lq3D33N21zGp7p;
 Fri, 22 Jul 2022 16:54:59 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 22 Jul 2022 16:56:04 +0800
Received: from kwepemm600015.china.huawei.com ([7.193.23.52]) by
 kwepemm600015.china.huawei.com ([7.193.23.52]) with mapi id 15.01.2375.024;
 Fri, 22 Jul 2022 16:56:03 +0800
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>, "Wangxin
 (Alexander)" <wangxinxin.wang@huawei.com>
Subject: Re: [PATCH] dump: introduce dump-cancel QMP command
Thread-Topic: [PATCH] dump: introduce dump-cancel QMP command
Thread-Index: AdidqGLXXn8vFcgvS061nQP8k3Zqhg==
Date: Fri, 22 Jul 2022 08:56:03 +0000
Message-ID: <6b40667e3b184c0785924c88b2aa17a9@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.166.163.62]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=hogan.wang@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-to:  "Wangjing(Hogan)" <hogan.wang@huawei.com>
From:  "Wangjing(Hogan)" via <qemu-devel@nongnu.org>

PiBPbiBUaHUsIEp1bCAyMSwgMjAyMiBhdCAwOToxMzo1M0FNICswMTAwLCBEYW5pZWwgUC4gQmVy
cmFuZ8OpIHdyb3RlOg0KPiA+IE9uIFRodSwgSnVsIDIxLCAyMDIyIGF0IDAyOjIxOjE4UE0gKzA4
MDAsIEhvZ2FuIFdhbmcgdmlhIHdyb3RlOg0KPiA+ID4gVGhlcmUncyBubyB3YXkgdG8gY2FuY2Vs
IHRoZSBjdXJyZW50IGV4ZWN1dGluZyBkdW1wIHByb2Nlc3MsIGxlYWQgdG8gDQo+ID4gPiB0aGUg
dmlydHVhbCBtYWNoaW5lIG1hbmFnZXIgZGFlbW9uKChlLmcuIGxpYnZpcnRkKSBjYW5ub3QgcmVz
dG9yZSANCj4gPiA+IHRoZSBkdW1wIGpvYiBhZnRlciBkYWVtb24gcmVzdGFydC4NCj4gPiA+IA0K
PiA+ID4gQWRkIHRoZSAnY2FuY2VsbGluZycgYW5kICdjYW5jZWxsZWQnIGR1bXAgc3RhdGVzLg0K
PiA+ID4gDQo+ID4gPiBVc2UgJ2R1bXAtY2FuY2VsJyBxbXAgY29tbWFuZCBTZXQgdGhlIGR1bXAg
c3RhdGUgYXMgJ2NhbmNlbGxpbmcnLg0KPiA+ID4gVGhlIGR1bXAgcHJvY2VzcyBjaGVjayB0aGUg
J2NhbmNlbGxpbmcnIHN0YXRlIGFuZCBicmVhayBsb29wcy4gDQo+ID4gPiBUaGUgJ2NhbmNlbGxl
ZCcgc3RhdGUgbWFyayB0aGUgZHVtcCBwcm9jZXNzIGNhbmNlbGxlZCBzdWNjZXNzLg0KPiA+IA0K
PiA+IE9uIHRoZSBvbmUgaGFuZCB0aGlzIHBhdGNoIGlzIGZhaXJseSBzaW1wbGUgd2hpY2ggaXMg
b2J2aW91c2x5IA0KPiA+IGRlc2lyYWJsZS4NCj4gPiANCj4gPiBPbiB0aGUgb3RoZXIgaGFuZCB0
aG91Z2gsIHRoaXMgZmVlbHMgbGlrZSBpdCBpcyBmdXJ0aGVyIHJlLWludmVudGluZyANCj4gPiB0
aGUgam9icyBjb25jZXB0Lg0KPiA+IA0KPiA+IElNSE8gaWRlYWxseSB0aGUgJ2R1bXAnIGNvbW1h
bmQgcHJvYmFibHkgb3VnaHQgdG8gZ2V0IGEgJ2pvYi1pZCcNCj4gDQo+IEkgbWVhbnQgdG8gc2F5
IGFuICpvcHRpb25hbCogam9iLWlkIGZpZWxkLCBzaW5jZSB3ZSBuZWVkIHRvIGtlZXAgYmFjayBj
b21wYXQuIFBvc3NpYmx5IHdlIGNvdWxkIHNlY3JldGx5IGNyZWF0ZSBhIGpvYiBhbnl3YXkgaW50
ZXJuYWxseSBpZiBqb2ItaWQgaXMgb21pdHRlZCwgaWYgaXQgbWFrZXMgY29kZSBlYXNpZXIuDQoN
CkkgaGF2ZSB0aGUgc2FtZSBpZGVhIGFzIHlvdSwgYW5kIHdpbGwgcHVzaCB0aGUgcGF0Y2hlcyBs
YXRlci4NCj4gDQo+ID4gcGFyYW1ldGVyLCBhbmQgaW50ZWdyYXRlIHdpdGggdGhlIGdlbmVyaWMg
YmFja2dyb3VuZCBqb2JzICBmcmFtZXdvcmsuDQo+ID4gVGhpcyB3b3VsZCB1bmxvY2sgdGhlIGFi
aWxpdHkgdG8gdXNlIGV4aXN0aW5nIGNvbW1hbmRzIGxpa2UgDQo+ID4gJ2pvYi1jYW5jZWwnLCAn
am9iLXBhdXNlJywgJ2pvYi1yZXN1bWUnLCAncXVleXItam9icycgdG8gaW50ZXJhY3Qgd2l0aCAN
Cj4gPiBpdC4NCj4gDQo+IFdpdGggcmVnYXJkcywNCj4gRGFuaWVsDQoNCg0K

