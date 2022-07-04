Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFB9565D33
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 19:50:26 +0200 (CEST)
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8QDJ-0008Rw-3O
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 13:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o8QAW-0006on-Vi; Mon, 04 Jul 2022 13:47:35 -0400
Received: from [200.168.210.66] (port=42060 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o8QAV-0007ju-8Y; Mon, 04 Jul 2022 13:47:32 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 4 Jul 2022 14:46:07 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 5958E8001F4;
 Mon,  4 Jul 2022 14:46:07 -0300 (-03)
Message-ID: <679bb1ff-5bc4-7fc0-75e5-58628f577a27@eldorado.org.br>
Date: Mon, 4 Jul 2022 14:46:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC 5/8] static-analyzer: Enforce coroutine_fn restrictions on
 function pointers
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
References: <20220702113331.2003820-1-afaria@redhat.com>
 <20220702113331.2003820-6-afaria@redhat.com>
 <ac264c3d-3345-38bf-35e5-ddc1b809c3b4@eldorado.org.br>
 <CAELaAXyAAfXGrO-NUSrqkU-Kd1hSzanUsz_Mk1fVSCfK9vhN8Q@mail.gmail.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <CAELaAXyAAfXGrO-NUSrqkU-Kd1hSzanUsz_Mk1fVSCfK9vhN8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 04 Jul 2022 17:46:07.0674 (UTC)
 FILETIME=[F0B2B1A0:01D88FCD]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

T24gMDQvMDcvMjAyMiAxMzo1NywgQWxiZXJ0byBGYXJpYSB3cm90ZToNCj4gSGkgVsOtY3Rv
ciwNCj4gDQo+IE9uIE1vbiwgSnVsIDQsIDIwMjIgYXQgMzoxOCBQTSBWw61jdG9yIENvbG9t
Ym8NCj4gPHZpY3Rvci5jb2xvbWJvQGVsZG9yYWRvLm9yZy5icj4gd3JvdGU6DQo+PiBBbmQg
SSByZWNlaXZlIGFuIGV4Y2VwdGlvbiBvbiB0aGUgbGluZSBhYm92ZSBzYXlpbmcgdGhhdCBu
b2RlIGlzIG9mIHR5cGUNCj4+IE5vbmVUeXBlLiBTZWVtcyB0aGF0IGBub2RlID0gbm9kZS5y
ZWZlcmVuY2VkYCBpcyBzZXR0aW5nIGBub2RlYCB0byBOb25lDQo+PiBpbiB0aGlzIGNhc2Uu
DQo+Pg0KPj4gSSB3YXMgdW5hYmxlIHRvIHVuZGVyc3RhbmQgdGhlIHJvb3QgY2F1c2Ugb2Yg
aXQuIElzIHRoaXMgYW4gaW5jb3JyZWN0DQo+PiB1c2FnZSBvZiB0aGUgdG9vbCBmcm9tIG15
IHBhcnQ/IEZ1bGwgZXJyb3IgbWVzc2FnZSBiZWxvdw0KPiANCj4gVW5mb3J0dW5hdGVseSB0
aGVyZSBzZWVtIHRvIGJlIGEgbG90IG9mIGNvcm5lciBjYXNlcyB0aGF0IGxpYmNsYW5nIGNh
bg0KPiB0aHJvdyBhdCB1cy4gSSBoYWRuJ3QgY29tZSBhY3Jvc3MgdGhpcyBvbmUgYmVmb3Jl
LiBJIGV4cGVjdGVkIHRoYXQNCj4gREVDTF9SRUZfRVhQUi9NRU1CRVJfUkVGX0VYUFIgd291
bGQgYWx3YXlzIHJlZmVyZW5jZSBzb21ldGhpbmcuDQo+IA0KPiBUaGlzIG1heSBiZSBkdWUg
dG8gc29tZSBidWlsZCBlcnJvciAtLSBsaWJjbGFuZyB0cmllcyB0byBjb250aW51ZQ0KPiBw
cm9jZXNzaW5nIGEgdHJhbnNsYXRpb24gdW5pdCBieSBkcm9wcGluZyBzdWJ0cmVlcyBvciBu
b2RlcyB0aGF0IGhhdmUNCj4gcHJvYmxlbXMuIElzIHRoZXJlIGEgInRvbyBtYW55IGVycm9y
cyBlbWl0dGVkLCBzdG9wcGluZyBub3c7IHRoaXMgbWF5DQo+IGxlYWQgdG8gZmFsc2UgcG9z
aXRpdmVzIGFuZCBuZWdhdGl2ZXMiIGxpbmUgYXQgdGhlIHRvcCBvZiB0aGUgc2NyaXB0J3MN
Cj4gb3V0cHV0Pw0KPiANCg0KWWVzLCB0aGlzIGxpbmUgaXMgcHJlc2VudCBhdCB0aGUgYmVn
aW5uaW5nIG9mIHRoZSBvdXRwdXQNCklzIHRoaXMgY2F1c2VkIGJ5IHByb2JsZW1zIHdpdGgg
dGhlIGNvZGUgYmVpbmcgYW5hbHl6ZWQgb3IgaXMgaXQgYmVjYXVzZQ0KbGliY2xhbmcgaXMg
Z2V0dGluZyBjb25mdXNlZCB3aXRoIHNvbWV0aGluZyB0aGF0IGlzIG91dHNpZGUgb2Ygb3Vy
DQpjb250cm9sPw0KDQotLSANClbDrWN0b3IgQ29yYSBDb2xvbWJvDQpJbnN0aXR1dG8gZGUg
UGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8v
d3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

