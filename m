Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00EC2FEAA3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:50:41 +0100 (CET)
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZQ8-0004d2-MZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=648267919=acatan@amazon.com>)
 id 1l2ZOG-0003kV-Ov
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:48:44 -0500
Received: from smtp-fw-9103.amazon.com ([207.171.188.200]:50052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=648267919=acatan@amazon.com>)
 id 1l2ZO9-0002Yx-3I
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1611233317; x=1642769317;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding:subject;
 bh=YGqUQ1UUFyxHwrMSqEqyzgCapYq/vp03G99HlwzxUsM=;
 b=KpeHPGY6gdpKJ6SyXx5xDLWet+HDbJMRnq+R+QjCR/NzUg05I9bBUtZz
 aPZFdDAwVKw/y/Ck1eFeiElvITDClNaBHNsXWeVWO7ER/Q54jdQQfow+w
 00ZZzq8FOznKZyQPaPpyG1XQhDfoCaCnP1goOIGV5FO7Va/dpdJ/nxqaK c=;
X-IronPort-AV: E=Sophos;i="5.79,363,1602547200"; d="scan'208";a="912380983"
Subject: Re: [PATCH v4 1/2] drivers/misc: sysgenid: add system generation id
 driver
Thread-Topic: [PATCH v4 1/2] drivers/misc: sysgenid: add system generation id
 driver
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-cc689b93.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9103.sea19.amazon.com with ESMTP;
 21 Jan 2021 12:48:27 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-cc689b93.us-west-2.amazon.com (Postfix) with ESMTPS
 id BB3C5120DDC; Thu, 21 Jan 2021 12:48:25 +0000 (UTC)
Received: from EX13D01UWA004.ant.amazon.com (10.43.160.99) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 21 Jan 2021 12:48:25 +0000
Received: from EX13D08EUB004.ant.amazon.com (10.43.166.158) by
 EX13d01UWA004.ant.amazon.com (10.43.160.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 21 Jan 2021 12:48:24 +0000
Received: from EX13D08EUB004.ant.amazon.com ([10.43.166.158]) by
 EX13D08EUB004.ant.amazon.com ([10.43.166.158]) with mapi id 15.00.1497.010;
 Thu, 21 Jan 2021 12:48:23 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Thread-Index: AQHW6NzJ6Ner/CpAZ0GLGgCheKaWxKoj9m4AgA5AxgA=
Date: Thu, 21 Jan 2021 12:48:23 +0000
Message-ID: <3159F7DB-C72B-4727-9C83-7E7619FC7D98@amazon.com>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <1610453760-13812-2-git-send-email-acatan@amazon.com>
 <20210112080427-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210112080427-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.192]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E59309106369F468D00E8FFBB8BA324@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=207.171.188.200;
 envelope-from=prvs=648267919=acatan@amazon.com; helo=smtp-fw-9103.amazon.com
X-Spam_score_int: -120
X-Spam_score: -12.1
X-Spam_bar: ------------
X-Spam_report: (-12.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

T24gMTIvMDEvMjAyMSwgMTU6MDksICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNv
bT4gd3JvdGU6DQoNCiAgICBPbiBUdWUsIEphbiAxMiwgMjAyMSBhdCAwMjoxNTo1OVBNICswMjAw
LCBBZHJpYW4gQ2F0YW5naXUgd3JvdGU6DQogICAgDQogICAgPiArMykgTWFwcGVkIG1lbW9yeSBw
b2xsaW5nIHNpbXBsaWZpZWQgZXhhbXBsZTo6DQogICAgPiArDQogICAgPiArICAgICAvKg0KICAg
ID4gKyAgICAgICogYXBwL2xpYnJhcnkgZnVuY3Rpb24gdGhhdCBwcm92aWRlcyBjYWNoZWQgc2Vj
cmV0cw0KICAgID4gKyAgICAgICovDQogICAgPiArICAgICBjaGFyICogc2FmZV9jYWNoZWRfc2Vj
cmV0KGFwcF9kYXRhX3QgKmFwcCkNCiAgICA+ICsgICAgIHsNCiAgICA+ICsgICAgICAgICAgICAg
Y2hhciAqc2VjcmV0Ow0KICAgID4gKyAgICAgICAgICAgICB2b2xhdGlsZSB1bnNpZ25lZCAqY29u
c3QgZ2VuaWRfcHRyID0gZ2V0X3N5c2dlbmlkX21hcHBpbmcoYXBwKTsNCiAgICA+ICsgICAgIGFn
YWluOg0KICAgID4gKyAgICAgICAgICAgICBzZWNyZXQgPSBfX2NhY2hlZF9zZWNyZXQoYXBwKTsN
CiAgICA+ICsNCiAgICA+ICsgICAgICAgICAgICAgaWYgKHVubGlrZWx5KCpnZW5pZF9wdHIgIT0g
YXBwLT5jYWNoZWRfZ2VuaWQpKSB7DQogICAgPiArICAgICAgICAgICAgICAgICAgICAgYXBwLT5j
YWNoZWRfZ2VuaWQgPSAqZ2VuaWRfcHRyOw0KICAgID4gKyAgICAgICAgICAgICAgICAgICAgIGJh
cnJpZXIoKTsNCiAgICA+ICsNCiAgICA+ICsgICAgICAgICAgICAgICAgICAgICAvLyByZWJ1aWxk
IHdvcmxkIHRoZW4gY29uZmlybSB0aGUgZ2VuaWQgdXBkYXRlICh0aHJ1IHdyaXRlKQ0KICAgID4g
KyAgICAgICAgICAgICAgICAgICAgIHJlYnVpbGRfY2FjaGVzKGFwcCk7DQogICAgPiArDQogICAg
PiArICAgICAgICAgICAgICAgICAgICAgYWNrX3N5c2dlbmlkX3VwZGF0ZShhcHApOw0KICAgID4g
Kw0KICAgID4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gYWdhaW47DQogICAgPiArICAgICAg
ICAgICAgIH0NCiAgICA+ICsNCiAgICA+ICsgICAgICAgICAgICAgcmV0dXJuIHNlY3JldDsNCg0K
DQoNCiAgICBIbW0uIFRoaXMgc2VlbXMgdG8gcmVseSBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IGlm
IHlvdSBoYXZlDQogICAgcmVhZCB0aGUgSUQgYW5kIGl0IGRpZCBub3QgY2hhbmdlLCB0aGVuIGFs
bCBpcyB3ZWxsLg0KDQogICAgUHJvYmxlbSBpcywgaW4gdGhlIGludGVycnVwdCBkcml2ZW4gaW1w
bGVtZW50YXRpb24NCiAgICB0aGlzIGlzIG5vdCBhIHNhZmUgYXNzdW1wdGlvbiB0byBtYWtlOiBJ
RA0KICAgIGZyb20gaHlwZXJ2aXNvciBtaWdodCBoYXZlIGNoYW5nZWQgYnV0IGludGVycnVwdA0K
ICAgIGNvdWxkIGJlIGRlbGF5ZWQuDQoNCg0KICAgIElmIHdlIG1hcCB0aGUgaHlwZXJ2aXNvciBJ
RCB0byB1c2Vyc3BhY2UgdGhlbiB3ZSB3b24ndA0KICAgIGhhdmUgdGhpcyByYWNlIC4uLiB3b3J0
aCB3b3JyeSBhYm91dD8gd2h5IG5vdD8NCg0KVGhpcyBpcyBhIHZlcnkgZ29vZCBwb2ludCEgVW5m
b3J0dW5hdGVseSwgdGhlcmUgaXMgbm8gaW1tZWRpYXRlIHNvbHV0aW9uIGhlcmUuDQpUaGUgY3Vy
cmVudCBwYXRjaC1zZXQgbWFrZXMgdGhpcyB0cmFkZS1vZmYgaW4gb3JkZXIgdG8gZ2FpbiB0aGUg
Z2VuZXJpY2l0eSBvZg0KYSBzeXN0ZW0tbGV2ZWwgZ2VuZXJhdGlvbiBJRCB3aGljaCBpcyBub3Qg
bGltaXRlZCB0byBWTXMgdXNlY2FzZXMsIGJ1dCBjYW4gYWxzbw0KYmUgdXNlZCB3aXRoIHRoaW5n
cyBsaWtlIENSSVUuDQoNCkRpcmVjdGx5IG1hcHBpbmcgdGhlIHZtZ2VuaWQgVVVJRCB0byB1c2Vy
c3BhY2Ugd2FzIHRoZSBpbml0aWFsIGRlc2lnbiBvZiB0aGlzDQpwYXRjaC1zZXQgKHNlZSB2MSks
IGJ1dCBpdCB3YXMgYXJndWVkIGFnYWluc3QgYW5kIGV2b2x2ZWQgaW50byBjdXJyZW50IHN0YXRl
Lg0KDQpJIHdvdWxkIHBlcnNvbmFsbHkgcmF0aGVyIGVuaGFuY2UgdGhlIEhXIHN1cHBvcnQgKHZt
Z2VuaWQgZGV2aWNlIGZvciBleGFtcGxlKQ0KdG8gYWxzbyBleHBvc2UgYSBjb25maWd1cmFibGUg
dTMyIFZtIEdlbiBDb3VudGVyIGFsb25nc2lkZSB0aGUgMTI4LWJpdCBVVUlEOw0KYW5kIGFkZCBz
dXBwb3J0IGluIFN5c0dlbklEIHRvIG9mZmxvYWQgdGhlIGNvdW50ZXIgdG8gSFcgd2hlbiBhcHBs
aWNhYmxlLg0KDQoNClRoZSBicm9hZGVyIHZpZXcgaXMgd2UgbmVlZCB0byBzdHJpa2UgdGhlIHJp
Z2h0IGJhbGFuY2UgYmV0d2VlbiBhIGZ1bmN0aW9uYWwsDQpzYWZlIG1lY2hhbmlzbSB3aXRoIHRv
ZGF5J3MgdGVjaG5vbG9neSwgYnV0IGFsc28gZGVzaWduIGEgZnV0dXJlLXByb29mIGdlbmVyaWMN
Cm1lY2hhbmlzbS4NCg0KRml4aW5nIHRoZSByYWNlIHlvdSBtZW50aW9uZWQgaW4gU3lzR2VuSUQg
b25seSBtb3ZlcyB0aGUgcmFjZSBhIGJpdCBmdXJ0aGVyIHVwDQp0aGUgc3RhY2sgLSB5b3UgZ2Vu
ZXJhdGUgdGhlIHNlY3JldCByYWNlLWZyZWUgYnV0IHRoZSBzZWNyZXQgY2FuIHN0aWxsIGJlIGR1
cGxpY2F0ZWQNCmluIHRoZSBuZXh0IGxheWVyLiBUbyBtYWtlIGFueSBtZWNoYW5pc20gY29tcGxl
dGVseSBzYWZlIHdlIG5lZWQgdG8gY29uY2VwdHVhbGx5DQpkaXNjb25uZWN0IG91cnNlbHZlcyBm
cm9tIGJlbGlldmluZyB0aGF0IGEgcmVzdG9yZWQgc25hcHNob3QgaXMgaW1tZWRpYXRlbHkgYXZh
aWxhYmxlLg0KVGhlcmUgbmVlZHMgdG8gYmUgc29tZSBlbnRpdHkgdGhhdCBtb3ZlcyB0aGUgcmVz
dG9yZWQgVk0vY29udGFpbmVyL3N5c3RlbQ0KZnJvbSBhIHRyYW5zaWVudCBzdGF0ZSB0byAiYXZh
aWxhYmxlIi4gVGhhdCBlbnRpdHkgY2FuIGJlIGEgcHJvY2VzcyBpbnNpZGUgdGhlIFZNLA0KYnV0
IGl0IGNhbiBhbHNvIGJlIHNvbWV0aGluZyBvdXRzaWRlIHRoZSBWTSwgaW4gdGhlIGh5cGVydmlz
b3Igb3IgaW4gdGhlIHN0YWNrDQpzdXJyb3VuZGluZyBpdC4gVGhhdCBlbnRpdHkgaXMgcmVzcG9u
c2libGUgZm9yIG1hbmFnaW5nIHRoZSB0cmFuc2l0aW9uIG9mIHRoZSBWTQ0Kb3IgY29udGFpbmVy
IGZyb20gdHJhbnNpZW50IC0+IGF2YWlsYWJsZS4gSXQgaXMgcmVzcG9uc2libGUgZm9yIG5vdCBh
bGxvd2luZyB0aGUgVk0vDQpjb250YWluZXIgdG8gYmUgdXNlZCBvciB1c2FibGUgdW50aWwgdGhh
dCB0cmFuc2l0aW9uIGlzIGNvbXBsZXRlLg0KDQpJbiB0aGUgZmlyc3QgZ2VuZXJhdGlvbnMgb2Yg
Vk0gY2xvbmVzIGFuZCBDUklVIHByb2R1Y3Rpb24gZGVwbG95bWVudHMsIEkgZXhwZWN0DQp0aGlz
IGVudGl0eSB0byBiZSBhIHN0YWNrLXNwZWNpZmljIGNvbXBvbmVudCB3aXRoIGludGltYXRlIGtu
b3dsZWRnZSBvZiB0aGUgc3lzdGVtDQpjb21wb25lbnRzLCB0cmFuc2llbnQgc3RhdGVzLCBsaWZl
Y3ljbGUsIGV0Yy4gV2hpY2ggdGhpcyBwYXRjaC1zZXQgZW5hYmxlcy4NCg0KDQpUaGFua3MsDQpB
ZHJpYW4uDQoNCg0KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciAoUm9tYW5pYSkgUy5SLkwu
IHJlZ2lzdGVyZWQgb2ZmaWNlOiAyN0EgU2YuIExhemFyIFN0cmVldCwgVUJDNSwgZmxvb3IgMiwg
SWFzaSwgSWFzaSBDb3VudHksIDcwMDA0NSwgUm9tYW5pYS4gUmVnaXN0ZXJlZCBpbiBSb21hbmlh
LiBSZWdpc3RyYXRpb24gbnVtYmVyIEoyMi8yNjIxLzIwMDUuCg==


