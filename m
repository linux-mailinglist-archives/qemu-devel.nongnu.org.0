Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB4957C9B7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 13:28:15 +0200 (CEST)
Received: from localhost ([::1]:45170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEULm-0008Ca-82
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 07:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oEUJA-0005vL-AS
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:25:36 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:3872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oEUJ6-0001iD-5v
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 07:25:31 -0400
Received: from canpemm100006.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LpVXY3Ywxz1M8Cm;
 Thu, 21 Jul 2022 19:22:21 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 canpemm100006.china.huawei.com (7.192.104.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Jul 2022 19:25:06 +0800
Received: from kwepemm600015.china.huawei.com ([7.193.23.52]) by
 kwepemm600015.china.huawei.com ([7.193.23.52]) with mapi id 15.01.2375.024;
 Thu, 21 Jul 2022 19:25:06 +0800
To: Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?RGFuaWVsIFAuQmVycmFuZ8Op?= <berrange@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>, "Wangxin
 (Alexander)" <wangxinxin.wang@huawei.com>
Subject: Re: [PATCH] dump: introduce dump-cancel QMP command
Thread-Topic: [PATCH] dump: introduce dump-cancel QMP command
Thread-Index: Adic9IVTXn8vFcgvS061nQP8k3Zqhg==
Date: Thu, 21 Jul 2022 11:25:06 +0000
Message-ID: <1758bfebd35b4d3a9a9c3dc809251e2b@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.172]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=hogan.wang@huawei.com; helo=szxga08-in.huawei.com
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

DQo+IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+IHdyaXRlczoNCj4g
DQo+ID4gT24gVGh1LCBKdWwgMjEsIDIwMjIgYXQgMDI6MjE6MThQTSArMDgwMCwgSG9nYW4gV2Fu
ZyB2aWEgd3JvdGU6DQo+ID4+IFRoZXJlJ3Mgbm8gd2F5IHRvIGNhbmNlbCB0aGUgY3VycmVudCBl
eGVjdXRpbmcgZHVtcCBwcm9jZXNzLCBsZWFkIHRvIA0KPiA+PiB0aGUgdmlydHVhbCBtYWNoaW5l
IG1hbmFnZXIgZGFlbW9uKChlLmcuIGxpYnZpcnRkKSBjYW5ub3QgcmVzdG9yZSB0aGUgDQo+ID4+
IGR1bXAgam9iIGFmdGVyIGRhZW1vbiByZXN0YXJ0Lg0KPiA+PiANCj4gPj4gQWRkIHRoZSAnY2Fu
Y2VsbGluZycgYW5kICdjYW5jZWxsZWQnIGR1bXAgc3RhdGVzLg0KPiA+PiANCj4gPj4gVXNlICdk
dW1wLWNhbmNlbCcgcW1wIGNvbW1hbmQgU2V0IHRoZSBkdW1wIHN0YXRlIGFzICdjYW5jZWxsaW5n
Jy4NCj4gPj4gVGhlIGR1bXAgcHJvY2VzcyBjaGVjayB0aGUgJ2NhbmNlbGxpbmcnIHN0YXRlIGFu
ZCBicmVhayBsb29wcy4gDQo+ID4+IFRoZSAnY2FuY2VsbGVkJyBzdGF0ZSBtYXJrIHRoZSBkdW1w
IHByb2Nlc3MgY2FuY2VsbGVkIHN1Y2Nlc3MuDQo+ID4NCj4gPiBPbiB0aGUgb25lIGhhbmQgdGhp
cyBwYXRjaCBpcyBmYWlybHkgc2ltcGxlIHdoaWNoIGlzIG9idmlvdXNseSANCj4gPiBkZXNpcmFi
bGUuDQo+ID4NCj4gPiBPbiB0aGUgb3RoZXIgaGFuZCB0aG91Z2gsIHRoaXMgZmVlbHMgbGlrZSBp
dCBpcyBmdXJ0aGVyIHJlLWludmVudGluZyANCj4gPiB0aGUgam9icyBjb25jZXB0Lg0KPiA+DQo+
ID4gSU1ITyBpZGVhbGx5IHRoZSAnZHVtcCcgY29tbWFuZCBwcm9iYWJseSBvdWdodCB0byBnZXQg
YSAnam9iLWlkJw0KPiA+IHBhcmFtZXRlciwgYW5kIGludGVncmF0ZSB3aXRoIHRoZSBnZW5lcmlj
IGJhY2tncm91bmQgam9icyAgZnJhbWV3b3JrLg0KPiA+IFRoaXMgd291bGQgdW5sb2NrIHRoZSBh
YmlsaXR5IHRvIHVzZSBleGlzdGluZyBjb21tYW5kcyBsaWtlIA0KPiA+ICdqb2ItY2FuY2VsJywg
J2pvYi1wYXVzZScsICdqb2ItcmVzdW1lJywgJ3F1ZXlyLWpvYnMnIHRvIGludGVyYWN0IHdpdGgg
DQo+ID4gaXQuDQo+IA0KPiBTZWNvbmRlZC4NCj4gDQo+IEhvZ2FuIFdhbmcsIHdvdWxkIHlvdSBi
ZSBpbnRlcmVzdGVkIGluIHJlYmFzaW5nIHRoZSBkdW1wIGZlYXR1cmUgb250byB0aGUgam9icyBp
bmZyYXN0cnVjdHVyZT8NCg0KWWVzISBJJ20gZ2xhZCB0byBkbyB0aGlzLCBidXQgaXQnbGwgdGFr
ZSBzb21lIHRpbWUuDQo=

