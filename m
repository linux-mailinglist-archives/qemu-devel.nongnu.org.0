Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41322FE792
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:29:24 +0100 (CET)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2XDQ-0001OW-0h
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=648267919=acatan@amazon.com>)
 id 1l2XCa-0000y0-Uq
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:28:32 -0500
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:23006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=648267919=acatan@amazon.com>)
 id 1l2XCZ-0005Mq-07
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 05:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1611224911; x=1642760911;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding:subject;
 bh=hqeYFR4tFeQmudUNvthDELGWhM89CIKBNi0DsWXyEWk=;
 b=Ldmj5bqrulWxmG2ub8pkEOlz3n9iPVlTJCGLNrzBwlu33ukvuF4uknp/
 RVH7wtmSM+iJeDLwGWMRF0hIP3+EsPOhv/jxTN/MnrnVq0aPAGsjNwNt2
 J5LSYrlhYaBjBID4dnkPlnL/QnYM+dPf39wFoTZJQsmwI4Cd4nA3emJ8G o=;
X-IronPort-AV: E=Sophos;i="5.79,363,1602547200"; d="scan'208";a="112527416"
Subject: Re: [PATCH v4 0/2] System Generation ID driver and VMGENID backend
Thread-Topic: [PATCH v4 0/2] System Generation ID driver and VMGENID backend
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Jan 2021 10:28:20 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id A95A7A1766; Thu, 21 Jan 2021 10:28:18 +0000 (UTC)
Received: from EX13D01UWB003.ant.amazon.com (10.43.161.94) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 21 Jan 2021 10:28:18 +0000
Received: from EX13D08EUB004.ant.amazon.com (10.43.166.158) by
 EX13d01UWB003.ant.amazon.com (10.43.161.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 21 Jan 2021 10:28:16 +0000
Received: from EX13D08EUB004.ant.amazon.com ([10.43.166.158]) by
 EX13D08EUB004.ant.amazon.com ([10.43.166.158]) with mapi id 15.00.1497.010;
 Thu, 21 Jan 2021 10:28:16 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Thread-Index: AQHW6NzBCUlWHHU+FkK+vi5glcJcE6oj8LeAgA4fV4A=
Date: Thu, 21 Jan 2021 10:28:16 +0000
Message-ID: <9952EF0C-CD1D-4EDB-BAB8-21F72C0BF90D@amazon.com>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <20210112074658-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210112074658-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.195]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3101E87ED31714D98C7F1E02527BB78@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.190.10;
 envelope-from=prvs=648267919=acatan@amazon.com; helo=smtp-fw-33001.amazon.com
X-Spam_score_int: -120
X-Spam_score: -12.1
X-Spam_bar: ------------
X-Spam_report: (-12.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>,
 "0x7f454c46@gmail.com" <0x7f454c46@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "avagin@gmail.com" <avagin@gmail.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "ptikhomirov@virtuozzo.com" <ptikhomirov@virtuozzo.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "ebiggers@kernel.org" <ebiggers@kernel.org>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Singh,
 Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "Graf \(AWS\), Alexander" <graf@amazon.de>, "arnd@arndb.de" <arnd@arndb.de>,
 "jannh@google.com" <jannh@google.com>, "Weiss, Radu" <raduweis@amazon.com>,
 "asmehra@redhat.com" <asmehra@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>,
 "luto@kernel.org" <luto@kernel.org>, "gil@azul.com" <gil@azul.com>,
 "MacCarthaigh, 
 Colm" <colmmacc@amazon.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "areber@redhat.com" <areber@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "ovzxemul@gmail.com" <ovzxemul@gmail.com>, "w@1wt.eu" <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Catangiu, Adrian Costin" <acatan@amazon.com>
From: acatan--- via <qemu-devel@nongnu.org>

T24gMTIvMDEvMjAyMSwgMTQ6NDksICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNv
bT4gd3JvdGU6DQoNCiAgICBPbiBUdWUsIEphbiAxMiwgMjAyMSBhdCAwMjoxNTo1OFBNICswMjAw
LCBBZHJpYW4gQ2F0YW5naXUgd3JvdGU6DQogICAgPiBUaGUgZmlyc3QgcGF0Y2ggaW4gdGhlIHNl
dCBpbXBsZW1lbnRzIGEgZGV2aWNlIGRyaXZlciB3aGljaCBleHBvc2VzIGENCiAgICA+IHJlYWQt
b25seSBkZXZpY2UgL2Rldi9zeXNnZW5pZCB0byB1c2Vyc3BhY2UsIHdoaWNoIGNvbnRhaW5zIGEN
CiAgICA+IG1vbm90b25pY2FsbHkgaW5jcmVhc2luZyB1MzIgZ2VuZXJhdGlvbiBjb3VudGVyLiBM
aWJyYXJpZXMgYW5kDQogICAgPiBhcHBsaWNhdGlvbnMgYXJlIGV4cGVjdGVkIHRvIG9wZW4oKSB0
aGUgZGV2aWNlLCBhbmQgdGhlbiBjYWxsIHJlYWQoKQ0KICAgID4gd2hpY2ggYmxvY2tzIHVudGls
IHRoZSBTeXNHZW5JZCBjaGFuZ2VzLiBGb2xsb3dpbmcgYW4gdXBkYXRlLCByZWFkKCkNCiAgICA+
IGNhbGxzIG5vIGxvbmdlciBibG9jayB1bnRpbCB0aGUgYXBwbGljYXRpb24gYWNrbm93bGVkZ2Vz
IHRoZSBuZXcNCiAgICA+IFN5c0dlbklkIGJ5IHdyaXRlKClpbmcgaXQgYmFjayB0byB0aGUgZGV2
aWNlLiBOb24tYmxvY2tpbmcgcmVhZCgpIGNhbGxzDQogICAgPiByZXR1cm4gRUFHQUlOIHdoZW4g
dGhlcmUgaXMgbm8gbmV3IFN5c0dlbklkIGF2YWlsYWJsZS4gQWx0ZXJuYXRpdmVseSwNCiAgICA+
IGxpYnJhcmllcyBjYW4gbW1hcCgpIHRoZSBkZXZpY2UgdG8gZ2V0IGEgc2luZ2xlIHNoYXJlZCBw
YWdlIHdoaWNoDQogICAgPiBjb250YWlucyB0aGUgbGF0ZXN0IFN5c0dlbklkIGF0IG9mZnNldCAw
Lg0KDQogICAgTG9va2luZyBhdCBzb21lIHNwZWNpZmljYXRpb25zLCB0aGUgZ2VuIElEIG1pZ2h0
IGFjdHVhbGx5IGJlIGxvY2F0ZWQNCiAgICBhdCBhbiBhcmJpdHJhcnkgYWRkcmVzcy4gSG93IGFi
b3V0IGluc3RlYWQgb2YgaGFyZC1jb2RpbmcgdGhlIG9mZnNldCwNCiAgICB3ZSBleHBvc2UgaXQg
ZS5nLiBpbiBzeXNmcz8NCg0KVGhlIGZ1bmN0aW9uYWxpdHkgaXMgc3BsaXQgYmV0d2VlbiBTeXNH
ZW5JRCB3aGljaCBleHBvc2VzIGFuIGludGVybmFsIHUzMg0KY291bnRlciB0byB1c2Vyc3BhY2Us
IGFuZCBhbiAob3B0aW9uYWwpIFZtR2VuSUQgYmFja2VuZCB3aGljaCBkcml2ZXMNClN5c0dlbklE
IGdlbmVyYXRpb24gY2hhbmdlcyBiYXNlZCBvbiBodyB2bWdlbmlkIHVwZGF0ZXMuDQoNClRoZSBo
dyBVVUlEIHlvdSdyZSByZWZlcnJpbmcgdG8gKHZtZ2VuaWQpIGlzIG5vdCBtbWFwLWVkIHRvIHVz
ZXJzcGFjZSBvcg0Kb3RoZXJ3aXNlIGV4cG9zZWQgdG8gdXNlcnNwYWNlLiBJdCBpcyBvbmx5IHVz
ZWQgaW50ZXJuYWxseSBieSB0aGUgdm1nZW5pZA0KZHJpdmVyIHRvIGZpbmQgb3V0IGFib3V0IFZN
IGdlbmVyYXRpb24gY2hhbmdlcyBhbmQgZHJpdmUgdGhlIG1vcmUgZ2VuZXJpYw0KU3lzR2VuSUQu
DQoNClRoZSBTeXNHZW5JRCB1MzIgbW9ub3RvbmljIGluY3JlYXNpbmcgY291bnRlciBpcyB0aGUg
b25lIHRoYXQgaXMgbW1hcGVkIHRvDQp1c2Vyc3BhY2UsIGJ1dCBpdCBpcyBhIHNvZnR3YXJlIGNv
dW50ZXIuIEkgZG9uJ3Qgc2VlIGFueSB2YWx1ZSBpbiB1c2luZyBhIGR5bmFtaWMNCm9mZnNldCBp
biB0aGUgbW1hcGVkIHBhZ2UuIE9mZnNldCAwIGlzIGZhc3QgYW5kIGVhc3kgYW5kIG1vc3QgaW1w
b3J0YW50bHkgaXQgaXMNCnN0YXRpYyBzbyBubyBuZWVkIHRvIGR5bmFtaWNhbGx5IGNhbGN1bGF0
ZSBvciBmaW5kIGl0IGF0IHJ1bnRpbWUuDQoNClRoYW5rcywNCkFkcmlhbi4NCg0KCgoKQW1hem9u
IERldmVsb3BtZW50IENlbnRlciAoUm9tYW5pYSkgUy5SLkwuIHJlZ2lzdGVyZWQgb2ZmaWNlOiAy
N0EgU2YuIExhemFyIFN0cmVldCwgVUJDNSwgZmxvb3IgMiwgSWFzaSwgSWFzaSBDb3VudHksIDcw
MDA0NSwgUm9tYW5pYS4gUmVnaXN0ZXJlZCBpbiBSb21hbmlhLiBSZWdpc3RyYXRpb24gbnVtYmVy
IEoyMi8yNjIxLzIwMDUuCg==


