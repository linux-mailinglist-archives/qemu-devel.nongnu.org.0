Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5057F623194
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 18:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoyy-0001fn-He; Wed, 09 Nov 2022 12:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=3054bc8e5=cnkevin@amazon.com>)
 id 1osoyw-0001eO-Gp
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:35:22 -0500
Received: from smtp-fw-80007.amazon.com ([99.78.197.218])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=3054bc8e5=cnkevin@amazon.com>)
 id 1osoyu-00063J-Ee
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1668015321; x=1699551321;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=Yc+ovcaiVNqEbc6Ak+t3lHqMxfV+v9F1CZj80YPrIk8=;
 b=Fvwjnbdyjq2k9aMwDpi7cDDe+hnvfbcg3Bgq+5nVqsI6pqWEoD4Htd26
 iFPdRBcRm2bnnDaE6IzV/QAtP0Sk6/3T8s5LHmqqaE42x0vSmh2UUZZNv
 Tm2Xj5tUYhhXaeMJhY6TdZ/8NbRetxhLjjawKqXZWAm9p1Ep1zHNm3PQc 4=;
X-IronPort-AV: E=Sophos;i="5.96,151,1665446400"; d="scan'208";a="149297780"
Subject: Re: Questions about QEMU exception
Thread-Topic: Questions about QEMU exception
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-m6i4x-32fb4f1a.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 17:35:18 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-m6i4x-32fb4f1a.us-west-2.amazon.com (Postfix)
 with ESMTPS id 6BF0610A381; Wed,  9 Nov 2022 17:35:17 +0000 (UTC)
Received: from EX19D022UWC001.ant.amazon.com (10.13.139.251) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 9 Nov 2022 17:35:16 +0000
Received: from EX19D022UWC004.ant.amazon.com (10.13.139.244) by
 EX19D022UWC001.ant.amazon.com (10.13.139.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.15;
 Wed, 9 Nov 2022 17:35:16 +0000
Received: from EX19D022UWC004.ant.amazon.com ([fe80::b8b8:82f3:ceea:2f15]) by
 EX19D022UWC004.ant.amazon.com ([fe80::b8b8:82f3:ceea:2f15%6]) with
 mapi id 15.02.1118.015; Wed, 9 Nov 2022 17:35:16 +0000
From: "Li, Kevin" <cnkevin@amazon.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Index: AQHY89z59Vyy/iCgGEC+rUz4GJkFsK42XzuA///2MQA=
Date: Wed, 9 Nov 2022 17:35:16 +0000
Message-ID: <1B66DF3E-BC4B-4D21-87A3-0E74305DF661@amazon.com>
References: <6FE4D6CD-1F6C-4632-92ED-9233C8F0EB87@amazon.com>
 <CAFEAcA-gz1=4we6wNy3dyW8yTjpWUf2iERSMrHD55Pd=-xeeuw@mail.gmail.com>
In-Reply-To: <CAFEAcA-gz1=4we6wNy3dyW8yTjpWUf2iERSMrHD55Pd=-xeeuw@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.179.32]
Content-Type: text/plain; charset="utf-8"
Content-ID: <205E34B4A61A944CB5E529E94FB5DADB@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
Received-SPF: pass client-ip=99.78.197.218;
 envelope-from=prvs=3054bc8e5=cnkevin@amazon.com; helo=smtp-fw-80007.amazon.com
X-Spam_score_int: -118
X-Spam_score: -11.9
X-Spam_bar: -----------
X-Spam_report: (-11.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGkgUGV0ZXIsDQoNCldlIGZpcnN0IGluc3RhbGwgdmlhIGhvbWVicmV3IGFuZCB0aGVuIGV4dHJh
Y3QgdGhlIGV4ZWN1dGFibGVzIChxZW11LWltZyBhbmQgcWVtdS1zeXN0ZW0teHh4KSBvdXQuDQpX
ZSByZWNlbnRseSBkaWQgdGhpcywgc28gaXQgc2hvdWxkIGJlIHRoZSBsYXRlc3QgdmVyc2lvbiBv
ZiBxZW11IHZpYSBob21lYnJldywgYW5kIG91ciBwYWNrYWdlIGlzIGZvciBNYWNPUywgd2hpY2gg
bmVlZHMgc2lnbiBhbmQgbm90YXJpemUuDQpJZiB3ZSBleHRyYWN0IGluIHRoaXMgd2F5LCBhbmQg
dXNlIGl0IG9uIG90aGVyIGVudiB3aXRob3V0IHNpZ25pbmcsIGl0IHdpbGwgc2hvdyB0aGUgdW5p
ZGVudGlmaWVkIGRldmVsb3Blciwgc28gd2Ugc2lnbiBpdCBhbG9uZyB3aXRoIG90aGVyIGV4ZWN1
dGFibGVzLg0KV2UgdXNlcyB0aGVzZSBleGVjdXRhYmxlcyB0byBwYWNrIGEgcGtnIGluc3RhbGxl
ciwgc28gZmlyc3Qgd2Ugc2lnbiBhbGwgdGhlIGV4ZWN1dGFibGVzIGluY2x1ZGluZyBxZW11LCBh
bmQgdGhlbiBzaWduIHRoZSBwa2csIGFuZCBmaW5hbGx5IG5vdGFyaXplIHRoZSBwa2cuDQpJIHRo
aW5rIHRoZSBwcmV2aW91cyBlcnJvciBJIG1lbnRpb25lZCBtYXliZSBjYXVzZWQgYnkgd2UgZGlk
bid0IHNpZ24gcWVtdSB3aXRoIHRoZSBlbnRpdGxlbWVudCwgc28gSSBzaWduZWQgd2l0aCB0aGUg
ZW50aXRsZW1lbnQgd2l0aCBmb2xsb3dpbmcga2V5czoNCjxrZXk+Y29tLmFwcGxlLnNlY3VyaXR5
LmNzLmFsbG93LWppdDwva2V5Pg0KPHRydWUvPg0KPGtleT5jb20uYXBwbGUuc2VjdXJpdHkuY3Mu
YWxsb3ctdW5zaWduZWQtZXhlY3V0YWJsZS1tZW1vcnk8L2tleT4NCjx0cnVlLz4NCjxrZXk+Y29t
LmFwcGxlLnNlY3VyaXR5LmNzLmRpc2FibGUtbGlicmFyeS12YWxpZGF0aW9uPC9rZXk+DQo8dHJ1
ZS8+DQo8a2V5PmNvbS5hcHBsZS5zZWN1cml0eS5oeXBlcnZpc29yPC9rZXk+DQo8dHJ1ZS8+DQo8
a2V5PmNvbS5hcHBsZS5zZWN1cml0eS5pbmhlcml0PC9rZXk+DQo8dHJ1ZS8+DQpIb3dldmVyLCBl
dmVuIEkgc2lnbmVkIGl0LCBxZW11IHN0aWxsIHNob3cgdW5pZGVudGlmaWVkIGRldmVsb3BlciBw
b3AgdXAsIHdoaWNoIGRvZXNuJ3Qgbm90IGhhcHBlbiB0byBvdGhlciBleGVjdXRhYmxlcy4NClBs
ZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgY2x1ZSBvciBzdWdnZXN0aW9uIHdpdGgg
aXQuIFRoYW5rcyBpbiBhZHZhbmNlLg0KDQpUaGFua3MsDQpLZXZpbg0KDQoNCu+7v09uIDIwMjIt
MTEtMDksIDI6MTAgQU0sICJQZXRlciBNYXlkZWxsIiA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3Jn
PiB3cm90ZToNCg0KICAgIENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNp
ZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250
ZW50IGlzIHNhZmUuDQoNCg0KDQogICAgT24gV2VkLCA5IE5vdiAyMDIyIGF0IDAxOjUzLCBMaSwg
S2V2aW4gPGNua2V2aW5AYW1hem9uLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gSGkgcWVtdSBj
b21tdW5pdHksDQogICAgPg0KICAgID4NCiAgICA+DQogICAgPiBXZSBhcmUgd29ya2luZyBvbiBz
b21lIG9wZW4gc291cmNlIHByb2plY3Qgd2hpY2ggdXNlcyBxZW11IG9uIG1hYywgYW5kIHdlIGhh
dmUgc29tZSBzaWduaW5nIHByb2Nlc3MgdG8gc2lnbiBxZW11LXN5c3RlbS14ODZfNjQuDQogICAg
Pg0KICAgID4gSWYgcWVtdS1zeXN0ZW0teDg2XzY0IGlzIG5vdCBzaWduZWQsIHdlIGRvbuKAmXQg
c2VlIGFueSBwcm9ibGVtLCBidXQgYWZ0ZXIgc2lnbiBpdCwgd2UgZ290IHRoZSBmb2xsb3dpbmcg
ZXJyb3I6DQogICAgPg0KICAgID4NCiAgICA+DQogICAgPiBxZW11LXN5c3RlbS14ODZfNjQgLU0g
bm9uZSAtbmV0ZGV2IGhlbHBdOiBzdGRvdXQ9XCJBY2NlbGVyYXRvcnMgc3VwcG9ydGVkIGluIFFF
TVUgYmluYXJ5OlxcbnRjZ1xcbmhheFxcbmh2ZlxcblwiLCBzdGRlcnI9XCJxZW11LXN5c3RlbS14
ODZfNjQ6IGFsbG9jYXRlIDEwNzM3NDE4MjQgYnl0ZXMgZm9yIGppdCBidWZmZXI6IEludmFsaWQg
YXJndW1lbnQNCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+IERvZXMgYW55b25lIGhhcyBjbHVl
IGFib3V0IHdoYXQgY2hhbmdlIG1heSByZXN1bHQgaW4gdGhpcyBmYWlsdXJlPw0KDQogICAgWW91
IGRvbid0IHNheSB3aGljaCBRRU1VIHZlcnNpb24geW91J3JlIHVzaW5nLiBEb2VzIGl0IHN0aWxs
IGhhcHBlbg0KICAgIHdpdGggdGhlIG1vc3QgcmVjZW50IHJlbGVhc2U/IERvZXMgaXQgc3RpbGwg
aGFwcGVuIGlmIHlvdSBidWlsZA0KICAgIGZyb20gY3VycmVudCBoZWFkLW9mLWdpdCA/DQoNCiAg
ICBQUzogSSB0aGluayB0aGUgUUVNVSBidWlsZCBwcm9jZXNzIHNob3VsZCBhbHJlYWR5IGJlIHNp
Z25pbmcgdGhlIGV4ZWN1dGFibGUsDQogICAgc28gSSdtIG5vdCBzdXJlIHdoeSB5b3UgbmVlZCB0
byBzaWduIGl0IGFnYWluIChzZWUgc2NyaXB0cy9lbnRpdGxlbWVudC5zaCkuDQoNCiAgICB0aGFu
a3MNCiAgICAtLSBQTU0NCg0K

