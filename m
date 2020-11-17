Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1152B6380
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:39:46 +0100 (CET)
Received: from localhost ([::1]:56152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1Cz-0007M2-72
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kf1BM-0006TR-DT; Tue, 17 Nov 2020 08:38:04 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kf1BJ-0006VS-EO; Tue, 17 Nov 2020 08:38:04 -0500
Received: from dggemi401-hub.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Cb6SW2GxzzXnL6;
 Tue, 17 Nov 2020 21:37:31 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.162]) by
 dggemi401-hub.china.huawei.com ([10.3.17.134]) with mapi id 14.03.0487.000;
 Tue, 17 Nov 2020 21:37:36 +0800
From: ganqixin <ganqixin@huawei.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
Thread-Topic: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
Thread-Index: AQHWu/oMyb2Urt3Gu0q8d02Pkq8oI6nKRNcAgAIPoiA=
Date: Tue, 17 Nov 2020 13:37:35 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065C27CD@DGGEMI525-MBS.china.huawei.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-10-ganqixin@huawei.com>
 <49d4e8e3-7138-18cf-3972-c18e8275d3be@redhat.com>
In-Reply-To: <49d4e8e3-7138-18cf-3972-c18e8275d3be@redhat.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=ganqixin@huawei.com;
 helo=szxga01-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 08:37:44
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSBbbWFpbHRvOnBoaWxtZEByZWRoYXQuY29tXQ0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVy
IDE2LCAyMDIwIDEwOjA1IFBNDQo+IFRvOiBnYW5xaXhpbiA8Z2FucWl4aW5AaHVhd2VpLmNvbT47
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4gcWVtdS10cml2aWFsQG5vbmdudS5vcmc7IE1hcmMt
QW5kcsOpIEx1cmVhdQ0KPiA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tPjsgdGh1dGhAcmVk
aGF0LmNvbQ0KPiBDYzogQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3ZWkuY29tPjsg
WmhhbmdoYWlsaWFuZw0KPiA8emhhbmcuemhhbmdoYWlsaWFuZ0BodWF3ZWkuY29tPjsgR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ow0KPiBFZHVhcmRvIEhhYmtvc3QgPGVoYWJrb3N0
QHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDkvMTNdIHUyZi1wYXNzdGhydTog
cHV0IGl0IGludG8gdGhlICd1c2InIGNhdGVnb3J5DQo+IA0KPiBPbiAxMS8xNS8yMCA3OjQ4IFBN
LCBHYW4gUWl4aW4gd3JvdGU6DQo+ID4gVGhlIGNhdGVnb3J5IG9mIHRoZSB1MmYtcGFzc3RocnUg
ZGV2aWNlIGlzIG5vdCBzZXQsIHB1dCBpdCBpbnRvIHRoZSAndXNiJw0KPiA+IGNhdGVnb3J5Lg0K
PiANCj4gSSBndWVzcyB3ZSBkaXNjdXNzZWQgdGhpcyB3aXRoIFRob21hcyAxIG9yIDIgeWVhcnMg
YWdvIGJ1dCBJIGRvbid0IHJlbWVtYmVyLg0KPiBJIHRoaW5rIGl0IHdhcyBhYm91dCB1c2luZyBz
ZXRfYml0cygpIHNvIGRldmljZXMgY2FuIGFwcGVhciBpbiBtdWx0aXBsZQ0KPiBjYXRlZ29yaWVz
Lg0KPiANCj4gR2VyZCwgZG8geW91IGtub3cgd2hhdCBpcyB0aGUgcG9pbnQgb2YgdGhlICJ1c2Ii
IGNhdGVnb3J5IGZvciBtYW5hZ2VtZW50DQo+IGFwcHM/IFRoaXMgaXMgYSBidXMgYWNjZXB0aW5n
IG11bHRpcGxlIGJldHRlciBjYXRlZ29yaXplZCBkZXZpY2VzIChkaXNwbGF5LA0KPiBzdG9yYWdl
LCBpbnB1dCwgbmV0d29yaywgc291bmQpLg0KPiANCj4gVW5yZWxhdGVkIGJ1dCBtdWx0aXBsZSBk
ZXZpY2VzIGFyZSByZWxhdGVkIHRvIFNFQ1VSSVRZLg0KPiBNYXliZSBpdCBpcyB0aW1lIHRvIGlu
dHJvZHVjZSB0aGUgREVWSUNFX0NBVEVHT1JZX1NFQ1VSSVRZPw0KDQpIaSwgUGhpbGlwcGUNClRo
YW5rcyBmb3IgeW91ciByZXBseSwgYnV0IEknbSBub3Qgc3VyZSBpZiBpdCBpcyBhcHByb3ByaWF0
ZSB0byBhZGQgYSBzZWN1cml0eSBjYXRlZ29yeSB0byBwbGFjZSB0aGlzIGRldmljZS4NCihNYXli
ZSBpdCdzIGJlY2F1c2UgSSBkb24ndCBrbm93IG11Y2ggYWJvdXQgdGhlc2UgZGV2aWNlLCBJIGhh
dmVuJ3QgZmluZCBtYW55IHNhZmV0eS1yZWxhdGVkIGRldmljZXMgaW4gJ21pc2MnIGNhdGVnb3J5
IG9yIHVuY2F0ZWdvcml6ZWQgZGV2aWNlcykNCg0KVGhhbmtzLA0KR2FuIFFpeGluDQo=

