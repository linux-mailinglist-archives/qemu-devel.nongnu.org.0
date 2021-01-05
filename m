Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50812EA3EC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 04:31:16 +0100 (CET)
Received: from localhost ([::1]:39784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwd3z-0003yX-E9
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 22:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kwd1u-00030c-1W
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 22:29:06 -0500
Received: from mga18.intel.com ([134.134.136.126]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kwd1n-0006Uj-OP
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 22:29:05 -0500
IronPort-SDR: FeVdQv+w8mWGZZmUIaARh2pPhAhrjv93BxsyrKlkXgBOp3qBrAB+T0mfk4aVr42npFPpFTRXUU
 nEcfrSQ4ge1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="164747339"
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; d="scan'208";a="164747339"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 19:28:52 -0800
IronPort-SDR: cn4G/icnwUq/VXwzCD/53Vh3myEOA0047GNUeLIpe288XVw+cv5ddmeM6xuJgSNol39LyPTBgZ
 sFsFg7ryxvYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; d="scan'208";a="496634780"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 04 Jan 2021 19:28:51 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 4 Jan 2021 19:28:47 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 5 Jan 2021 11:28:45 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Tue, 5 Jan 2021 11:28:45 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Eric
 Blake" <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Thread-Topic: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
Thread-Index: AQHW2ZH35CoUMePT00WBg9eX6s7M0aoG0rqAgATaJwD//+sqgIABz6iggAEepoCACeSQYA==
Date: Tue, 5 Jan 2021 03:28:45 +0000
Message-ID: <666f41843baf4c84bbafa7f9fdfba96f@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-2-chen.zhang@intel.com>
 <08fe5c51-1383-12dd-b255-151a868cd6d9@redhat.com>
 <a4adb965911348f4901f72e7e472c07e@intel.com>
 <97d593c2-222d-a3cf-e797-8d77b8701bed@redhat.com>
 <704028b0dbf843ed9ae64b93ecd1db13@intel.com>
 <05999128-75c0-aeaf-255f-8c1ec7699eab@redhat.com>
In-Reply-To: <05999128-75c0-aeaf-255f-8c1ec7699eab@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAzMCwgMjAyMCAx
MTo1NyBBTQ0KPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPjsgcWVtdS1k
ZXYgPHFlbXUtDQo+IGRldmVsQG5vbmdudS5vcmc+OyBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0
LmNvbT47IERyLiBEYXZpZCBBbGFuDQo+IEdpbGJlcnQgPGRnaWxiZXJ0QHJlZGhhdC5jb20+OyBN
YXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+DQo+IENjOiBaaGFuZyBDaGVuIDx6
aGFuZ2NraWRAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gcWFwaS9uZXQ6
IEFkZCBuZXcgUU1QIGNvbW1hbmQgZm9yIENPTE8NCj4gcGFzc3Rocm91Z2gNCj4gDQo+IA0KPiBP
biAyMDIwLzEyLzI5IOS4iuWNiDEwOjU2LCBaaGFuZywgQ2hlbiB3cm90ZToNCj4gPj4gSSB0aGlu
ayB3ZSBjYW4gc3RhcnQgZm9ybSBDT0xPLiBUbyBhdm9pZCBRTVAgY29tcGF0aWJpbGl0eSBpc3N1
ZXMsIEkNCj4gPj4gd291bGQgbGlrZSB0byBhZGQgdGhlIG4gdHVwbGUgYW5kIHdpbGRjYXJkIHN1
cHBvcnQgbm93Lg0KPiA+IE9LLCBJIHdpbGwgZG8gdGhpcyBqb2IgaW4gbmV4dCB2ZXJzaW9uLg0K
PiA+IEZvciB0aGUgUU1QIGNvbXBhdGliaWxpdHkgaXNzdWVzLCBwbGVhc2UgZ2l2ZSBtZSBhIGRl
bW8gb2Ygd2hhdCB3ZSB3YW50DQo+IHRvIHNlZSwgTGlrZSBzb21lIGV4aXN0aW5nIGNvbW1hbmRz
Lg0KPiANCj4gDQo+IEkgbWVhbnQgaWYgd2Ugc3RhcnQgZnJvbSBwb3J0IGFuZCB0aGVuIHdhbnQg
dG8gYWRkIGUuZyBuLXR1cGxlIHN1cHBvcnQuDQo+IERvIHdlIG5lZWQgdG8gaW50cm9kdWNlIGFu
b3RoZXIgY29tbWFuZD8gT3IgaXMgdGhlcmUgYW55IGludHJvc3BlY3Rpb24NCj4gdGhhdCBjYW4g
bGV0IG1hbmFnZW1lbnQgbGF5ZXIga25vdyBhYm91dCB0aGlzPw0KDQpPSywgSSB3aWxsIGFkZCB0
aGUgbi10dXBsZSBzdXBwb3J0Lg0KSXQgbG9va3MgYmFzaWMgY29tbWFuZCBhcmUgYWRkL2RlbCBj
b25uZWN0aW9uLCBEbyB5b3UgdGhpbmsgc29tZXRoaW5nIG5lZWRzIHRvIGJlIGludHJvZHVjZWQ/
DQpGb3IgdGhlIG1hbmFnZW1lbnQgbGF5ZXIsIEkgZG9uJ3Qga25vdyB0aGUgZGV0YWlsIHByb2Nl
c3Mgb2YgaG93IHRvIGFkZCBuZXcgUWVtdSBjb21tYW5kIHN1cHBvcnQgZm9yIGV4YW1wbGUgbGli
dmlydC4NCk1heWJlIGRlcGVuZCBvbiBsaWJ2aXJ0IGNvbW11bml0eSdzIHBsYW4/DQoNClRoYW5r
cw0KQ2hlbiANCg0KPiANCj4gVGhhbmtzDQo+IA0KPiANCj4gPg0KPiA+IFRoYW5rcw0KPiA+IENo
ZW4NCj4gPg0KDQo=

