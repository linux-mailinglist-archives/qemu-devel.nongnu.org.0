Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF62E3363
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 01:41:36 +0100 (CET)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktgbP-00065l-IU
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 19:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ktgZ4-0004hJ-6K
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 19:39:11 -0500
Received: from mga05.intel.com ([192.55.52.43]:44944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ktgYz-0002um-T3
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 19:39:09 -0500
IronPort-SDR: 9prEnu2oZL8zGmk1wk1rGpnWt8Atuq1IR3L2RJzyJsJwNKS5mNYpns1GAc/v3lAt69ZdPvn3ms
 59Lc0PJHV2Yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9847"; a="261077821"
X-IronPort-AV: E=Sophos;i="5.78,453,1599548400"; d="scan'208";a="261077821"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2020 16:39:02 -0800
IronPort-SDR: ZiiM/Hat22Lm5pkRYthZkW6NkRZloq3hP+x141F/6nbb3QdyW41JlvfCNWpq7Llc6tntlHdost
 /8W9RnuHU2Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,453,1599548400"; d="scan'208";a="340710639"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 27 Dec 2020 16:39:02 -0800
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 27 Dec 2020 16:39:01 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Dec 2020 08:39:00 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Mon, 28 Dec 2020 08:39:00 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Eric
 Blake" <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH 0/3] Bypass specific network traffic in COLO
Thread-Topic: [PATCH 0/3] Bypass specific network traffic in COLO
Thread-Index: AQHW2ZH2TQccpom8pUur848MxDH3B6oG05kAgATZFnA=
Date: Mon, 28 Dec 2020 00:38:59 +0000
Message-ID: <51247e7757db4cf490d6a0f6ec16c676@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <247fcbaf-4772-1bf9-db97-471649ce30b0@redhat.com>
In-Reply-To: <247fcbaf-4772-1bf9-db97-471649ce30b0@redhat.com>
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
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
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
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAyNSwgMjAyMCAyOjIz
IFBNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBxZW11LWRldiA8
cWVtdS0NCj4gZGV2ZWxAbm9uZ251Lm9yZz47IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29t
PjsgRHIuIERhdmlkIEFsYW4NCj4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47IE1hcmt1
cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4NCj4gQ2M6IFpoYW5nIENoZW4gPHpoYW5n
Y2tpZEBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC8zXSBCeXBhc3Mgc3BlY2lm
aWMgbmV0d29yayB0cmFmZmljIGluIENPTE8NCj4gDQo+IA0KPiBPbiAyMDIwLzEyLzI0IOS4iuWN
iDk6MDksIFpoYW5nIENoZW4gd3JvdGU6DQo+ID4gRnJvbTogWmhhbmcgQ2hlbiA8Y2hlbi56aGFu
Z0BpbnRlbC5jb20+DQo+ID4NCj4gPiBTaW5jZSB0aGUgcmVhbCB1c2VyIHNjZW5hcmlvIGRvZXMg
bm90IG5lZWQgdG8gbW9uaXRvciBhbGwgdHJhZmZpYy4NCj4gDQo+IA0KPiBIaSBDaGVuOg0KPiAN
Cj4gSXQgd291bGQgYmUgYmV0dGVyIHRvIGVsYWJvcmF0ZSBtb3JlIG9uIHRoaXMuIEUuZyB3aGF0
IHNjZW5hcmlvIGFuZCB3aG8gd2lsbA0KPiB1c2UgdGhvc2UgbmV3IFFNUC9ITVAgY29tbWFuZHMu
DQoNCk9LLCBJIHdpbGwgYWRkIG1vcmUgY29tbWl0IGxvZyBpbiBuZXh0IHZlcnNpb24uDQoNClRo
YW5rcw0KQ2hlbg0KDQo+IA0KPiBUaGFua3MNCj4gDQo+IA0KPiA+IFRoaXMgc2VyaWVzIGdpdmUg
dXNlciBhYmlsaXR5IHRvIGJ5cGFzcyBraW5kcyBvZiBuZXR3b3JrIHN0cmVhbS4NCj4gPg0KPiA+
IFpoYW5nIENoZW4gKDMpOg0KPiA+ICAgIHFhcGkvbmV0OiBBZGQgbmV3IFFNUCBjb21tYW5kIGZv
ciBDT0xPIHBhc3N0aHJvdWdoDQo+ID4gICAgaG1wLWNvbW1hbmRzOiBBZGQgbmV3IEhNUCBjb21t
YW5kIGZvciBDT0xPIHBhc3N0aHJvdWdoDQo+ID4gICAgbmV0L2NvbG8tY29tcGFyZTogQWRkIGhh
bmRsZXIgZm9yIHBhc3N0aHJvdWdoIGNvbm5lY3Rpb24NCj4gPg0KPiA+ICAgaG1wLWNvbW1hbmRz
Lmh4ICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIGluY2x1ZGUvbW9u
aXRvci9obXAuaCB8ICAyICsrDQo+ID4gICBtb25pdG9yL2htcC1jbWRzLmMgICAgfCAyMCArKysr
KysrKysrKysrKysrKysNCj4gPiAgIG5ldC9jb2xvLWNvbXBhcmUuYyAgICB8IDQ5DQo+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIG5ldC9jb2xvLWNv
bXBhcmUuaCAgICB8ICAyICsrDQo+ID4gICBuZXQvbmV0LmMgICAgICAgICAgICAgfCAzOSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICBxYXBpL25ldC5qc29uICAgICAg
ICAgfCA0Ng0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4g
ICA3IGZpbGVzIGNoYW5nZWQsIDE4NCBpbnNlcnRpb25zKCspDQo+ID4NCg0K

