Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259743DFD0F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:38:46 +0200 (CEST)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCQH-0001FR-6p
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <AIERPATIJIANG1@kingsoft.com>)
 id 1mBCMm-0003EX-Ts
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:35:08 -0400
Received: from [114.255.44.146] (port=39932 helo=mail.kingsoft.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <AIERPATIJIANG1@kingsoft.com>) id 1mBCMi-0004EB-Qd
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:35:08 -0400
X-AuditID: 0a580155-983ff7000002fcd1-55-610a5126df51
Received: from mail.kingsoft.com (localhost [10.88.1.79])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.kingsoft.com (SMG-2-NODE-85) with SMTP id 43.9B.64721.6215A016;
 Wed,  4 Aug 2021 16:34:46 +0800 (HKT)
Received: from KSbjmail3.kingsoft.cn (10.88.1.78) by KSBJMAIL4.kingsoft.cn
 (10.88.1.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 4 Aug
 2021 16:34:46 +0800
Received: from KSbjmail3.kingsoft.cn ([fe80::7d5f:5fcb:9c30:789b]) by
 KSBJMAIL3.kingsoft.cn ([fe80::7d5f:5fcb:9c30:789b%6]) with mapi id
 15.01.2176.014; Wed, 4 Aug 2021 16:34:46 +0800
From: =?utf-8?B?QUlFUlBBVElKSUFORzEgW+iJvuWwlOW4leaPkOaxn8K36Zi/5biD6YO96LWb?=
 =?utf-8?B?5Lmw5o+QXQ==?= <AIERPATIJIANG1@kingsoft.com>
To: Laurent Vivier <lvivier@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>
Subject: Re: [PATCH] hw/char/virtio-serial-bus: fix: Unpop throttled
 VirtQueueElement to queue before discard vq data
Thread-Topic: [PATCH] hw/char/virtio-serial-bus: fix: Unpop throttled
 VirtQueueElement to queue before discard vq data
Thread-Index: AQHXfhCIoeZCoIzDgkWI30flJ82In6tWICuAgASwioCABQuHAIADPsqA
Date: Wed, 4 Aug 2021 08:34:46 +0000
Message-ID: <A090670A-BD6D-452A-BE91-62783EB53C51@kingsoft.com>
References: <2904D378-AA27-4510-A3C8-7E2E34DF37EF@kingsoft.com>
 <330EE4BB-DE8D-4D4A-9E6E-08E50BDA5E45@kingsoft.com>
 <918AA6D7-F6C6-4A0E-8E65-6C7ECF148304@kingsoft.com>
 <abe0d719-20e2-ebf3-c61a-c1778a461d5c@redhat.com>
In-Reply-To: <abe0d719-20e2-ebf3-c61a-c1778a461d5c@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.2.22]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CC69275BA23F345A42619F9A65678FA@kingsoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsXCFcHor6sWyJVo8PWFisXnu3PYLT41SFn8
 //WK1eJ47w4Wi9eT/rM6sHpsWtXJ5vHk2mYmj/f7rrIFMEdx2aSk5mSWpRbp2yVwZZyevYSl
 4JNmxcrFG1gaGF9odDFyckgImEh8XfKfpYuRi0NIYDqTxPFFH9ggnOeMEtMuL4fK7GaUWLGk
 jRHEYRNoZ5Q4fHg6K0i/iECYxLwNe1lAbGaBWonvM+cyg9jCAuUSk2a0A9kcQDUVErf+pECU
 u0msfD4FrJVFQEWi9UYLG4jNK2Av8XDWLkaIZfcZJY5cWA82h1PATuLh2w9gRYwCshLTHt1n
 gtglLjF32ixWiB8EJJbsOc8MYYtKvHz8DyouJ7HhRCc7yA3MApoS63fpQ7RaS1w88YsVwlaU
 mNL9kB3iBkGJkzOfsExgFJ+FZMMshO5ZSLpnIemehaR7ASPrKkaW4tx0o02MkKgL3cE4o+mj
 3iFGJg7GQ4wSHMxKIryhNzgShXhTEiurUovy44tKc1KLDzFKc7AoifM2HPyXICSQnliSmp2a
 WpBaBJNl4uCUamDamZsT9+5vVrvnRL5H3N9b9/e+mvPAYe6DA54z69Y+MnT9P3n3HO8rfnNe
 zNdoOWR25MJR6UMmaSlnsmfkr/23+/Zp75b0Kb/jD984K3fn+YwrWUETH3Zpi15qf1dg6VFv
 t7pNXC7y8fV7pTdtK6Xqa4N/h5hZnq3/eH1/pv2O+NNM283uH1zboia3UvjKl39drzZ4NkxU
 NBZiXG9vcLTkYsvzqmhLTykllQOLtt12fSR/2SLd3KiWU87QzU+01XPGc7WymxdKMtITbavz
 7tx1fuPfZKPbVRF0q5ht0hyn98sWiO+PfteusvpZdVWR7mFfU3PBnV9kWEKlOvbUVb7YUVVq
 cOyiD/OEPVva7TYpsRRnJBpqMRcVJwIAPufncSkDAAA=
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.255.44.146 (failed)
Received-SPF: pass client-ip=114.255.44.146;
 envelope-from=AIERPATIJIANG1@kingsoft.com; helo=mail.kingsoft.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "amit@kernel.org" <amit@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCu+7v+WcqCAyMDIxLzgvMiDkuIvljYgxMTowMe+8jOKAnExhdXJlbnQgVml2aWVy4oCdPGx2
aXZpZXJAcmVkaGF0LmNvbT4g5YaZ5YWlOg0KDQogICAgT24gMzAvMDcvMjAyMSAwMzo1OCwgQUlF
UlBBVElKSUFORzEgW+iJvuWwlOW4leaPkOaxn8K36Zi/5biD6YO96LWb5Lmw5o+QXSB3cm90ZToN
CiAgICA+PiBQb3J0cyBlbnRlciBhICJ0aHJvdHRsZWQiIHN0YXRlIHdoZW4gd3JpdGluZyB0byB0
aGUgY2hhcmRldiB3b3VsZCBibG9jay4NCiAgICA+PiBUaGUgY3VycmVudCBvdXRwdXQgVmlydFF1
ZXVlRWxlbWVudCBpcyBrZXB0IGFyb3VuZCB1bnRpbCB0aGUgY2hhcmRldg0KICAgID4+IGJlY29t
ZXMgd3JpdGFibGUgYWdhaW4uDQogICAgPj4gDQogICAgPj4gQmVjYXVzZSBjbG9zaW5nIHRoZSB2
aXJ0aW8gc2VyaWFsIGRldmljZSBkb2VzIG5vdCByZXNldCB0aGUgcXVldWUsIHdlIGNhbm5vdA0K
ICAgID4+IGRpcmVjdGx5IGRpc2NhcmQgdGhpcyBlbGVtZW50LCAgb3RoZXJ3aXNlIHRoZSBjb250
cm9sIHZhcmlhYmxlcyBvZiB0aGUgZnJvbnQNCiAgICA+PiBhbmQgYmFjayBlbmRzIG9mIHRoZSBx
dWV1ZSBhcmUgaW5jb25zaXN0ZW50IHN1Y2ggYXMgdXNlZF9pbmRleC4gV2Ugc2hvdWxkIHVucG9w
IHRoZQ0KICAgID4+IFZpcnRRdWV1ZUVsZW1lbnQgdG8gcXVldWUsIGxldCBkaXNjYXJkX3ZxX2Rh
dGEgcHJvY2VzcyBpdC4NCiAgICA+PiANCiAgICA+PiBUaGUgdGVzdCBlbnZpcm9ubWVudDoNCiAg
ICA+PiBrZXJuZWw6IGxpbnV4LTUuMTINCiAgICA+PiBRZW11IGNvbW1hbmQ6DQogICAgPj4gUWVt
dS1zeXN0ZW0teDg2IC1tYWNoaW5lIHBjLGFjY2VsPWt2bSBcDQogICAgPj4gICAgIC1jcHUgaG9z
dCxob3N0LXBoeXMtYml0cyBcDQogICAgPj4gICAgIC1zbXAgNCBcDQogICAgPj4gICAgIC1tIDRH
IFwNCiAgICA+PiAgICAgLWtlcm5lbCAuL2tlcm5lbCBcDQogICAgPj4gICAgIC1kaXNwbGF5IG5v
bmUgXA0KICAgID4+ICAgICAtbm9kZWZhdWx0cyBcDQogICAgPj4gICAgIC1zZXJpYWwgbW9uOnN0
ZGlvIFwNCiAgICA+PiAgICAgLWFwcGVuZCAicGFuaWM9MSBub190aW1lcl9jaGVjayBub3JlcGxh
Y2Utc21wIHJvb3RmbGFncz1kYXRhPW9yZGVyZWQgcm9vdGZzdHlwZT1leHQ0IGNvbnNvbGU9dHR5
UzAgcmVib290PWsgcm9vdD0vZGV2L3ZkYTEgcnciIFwNCiAgICA+PiAgICAgLWRyaXZlIGlkPW9z
LGZpbGU9Li9kaXNrLGlmPW5vbmUgXA0KICAgID4+ICAgICAtZGV2aWNlIHZpcnRpby1ibGstcGNp
LGRyaXZlPW9zIFwNCiAgICA+PiAgICAgLWRldmljZSB2aXJ0aW8tc2VyaWFsLXBjaSxpZD12aXJ0
aW8tc2VyaWFsMCxidXM9cGNpLjAsYWRkcj0weDQgXA0KICAgID4+ICAgICAtY2hhcmRldiBzb2Nr
ZXQsaWQ9Y2hhcmNoYW5uZWwwLHBhdGg9L3RtcC9jaGFyLWRldi10ZXN0LHNlcnZlcixub3dhaXQg
XA0KICAgID4+ICAgLWRldmljZSB2aXJ0c2VyaWFscG9ydCxidXM9dmlydGlvLXNlcmlhbDAuMCxu
cj0xLGNoYXJkZXY9Y2hhcmNoYW5uZWwwLGlkPWNoYW5uZWwwLG5hbWU9b3JnLnFlbXUuZ3Vlc3Rf
YWdlbnQuMA0KICAgID4+IA0KICAgID4+IGZ1bGwgdXAgdmlydGlvIHF1ZXVlIGFmdGVyIFZNIHN0
YXJ0ZWQ6DQogICAgPj4gQ2F0IC9sYXJnZS1maWxlID4gL2Rldi92cG9ydDFwMQ0KICAgID4+IA0K
ICAgID4+IEhvc3Qgc2lkZToNCiAgICA+PiBPcGVuIGFuZCBjbG9zZSBjaGFyYWN0ZXIgZGV2aWNl
IHNvY2tldHMgcmVwZWF0ZWRseQ0KICAgID4+IA0KICAgID4+IEFmdGVyIGF3aGlsZSB3ZSBjYW7i
gJl0IHdyaXRlIGFueSByZXF1ZXN0IHRvIC9kZXYvdnBvcnQxcDEgYXQgVk0gc2lkZSwgVk0ga2Vy
bmVsIHNvZnQgbG9ja3VwIGF0IGRyaXZlcnMvY2hhci92aXJ0aW9fY29uc29sZS5jOiBfX3NlbmRf
dG9fcG9ydA0KICAgID4+IA0KICAgID4+IA0KICAgID4+IFNpZ25lZC1vZmYtYnk6IEFyYWZhdG1z
IDxhaWVycGF0aWppYW5nMUBraW5nc29mdC5jb20+DQogICAgPj4gDQogICAgPj4gZGlmZiAtLWdp
dCBhL2h3L2NoYXIvdmlydGlvLXNlcmlhbC1idXMuYyBiL2h3L2NoYXIvdmlydGlvLXNlcmlhbC1i
dXMuYw0KICAgID4+IGluZGV4IGRkNmJjMjdiM2IuLjM2MjM2ZGVmZGYgMTAwNjQ0DQogICAgPj4g
LS0tIGEvaHcvY2hhci92aXJ0aW8tc2VyaWFsLWJ1cy5jDQogICAgPj4gKysrIGIvaHcvY2hhci92
aXJ0aW8tc2VyaWFsLWJ1cy5jDQogICAgPj4gQEAgLTE1MCw4ICsxNTAsMTIgQEAgc3RhdGljIHZv
aWQgZGlzY2FyZF92cV9kYXRhKFZpcnRRdWV1ZSAqdnEsIFZpcnRJT0RldmljZSAqdmRldikNCiAg
ICA+PiANCiAgICA+PiBzdGF0aWMgdm9pZCBkaXNjYXJkX3Rocm90dGxlX2RhdGEoVmlydElPU2Vy
aWFsUG9ydCAqcG9ydCkNCiAgICA+PiB7DQogICAgPj4gKyAgICBpZiAoIXZpcnRpb19xdWV1ZV9y
ZWFkeShwb3J0LT5vdnEpKSB7DQogICAgPj4gKyAgICAgICAgcmV0dXJuOw0KICAgID4+ICsgICAg
fQ0KDQogICAgPldoeSBkbyB3ZSBuZWVkIHRvIGNoZWNrIHZpcnRpb19xdWV1ZV9yZWFkeSgpIG5v
dz8NCg0KCUkgdGhpbmsgd2Ugc2hvdWxkIGNoZWNrIHZpcnRpb19xdWV1ZV9yZWFkeSBiZWZvcmUg
ZXZlcnkgb3BlcmF0aW9uIG9mIHZpcnRfcXVldWVzLg0KDQogICAgPj4gKw0KICAgID4+ICAgICAg
aWYgKHBvcnQtPmVsZW0pIHsNCiAgICA+PiAtICAgICAgICB2aXJ0cXVldWVfZGV0YWNoX2VsZW1l
bnQocG9ydC0+b3ZxLCBwb3J0LT5lbGVtLCAwKTsNCiAgICA+PiArICAgICAgICB2aXJ0cXVldWVf
dW5wb3AocG9ydC0+b3ZxLCBwb3J0LT5lbGVtLCAwKTsNCiAgICA+PiAgICAgICAgICBnX2ZyZWUo
cG9ydC0+ZWxlbSk7DQogICAgPj4gICAgICAgICAgcG9ydC0+ZWxlbSA9IE5VTEw7DQogICAgPj4g
ICAgICB9DQogICAgPj4gDQoNCiAgICA+IEl0IHNlZW1zIHRoZSBwcm9ibGVtIHlvdSByZXBvcnQg
Y2FuIG9ubHkgaGFwcGVuIHdoZW4gdGhlIHBvcnQgaXMgY2xvc2VkIGZyb20gdGhlIGhvc3Qgc2lk
ZQ0KICAgID4gKGJlY2F1c2UgZnJvbSB0aGUgZ3Vlc3Qgc2lkZSBJIGd1ZXNzIHRoZSBjbGVhbnVw
IGlzIGRvbmUgYnkgdGhlIGd1ZXN0IGRyaXZlcikuDQoNCglZZXMsIHRoaXMgcHJvYmxlbSBjYW4g
b25seSBoYXBwZW4gd2hlbiB0aGUgcG9ydCBpcyBjbG9zZWQgZnJvbSB0aGUgaG9zdCBzaWRlLiAN
Cg0KICAgID4gU3RlZmFuLCB5b3UgaGF2ZSBpbnRyb2R1Y2VkIHRoZSBmdW5jdGlvbiBkaXNjYXJk
X3Rocm90dGxlX2RhdGEoKSBpbjoNCg0KICAgID4gIGQ0YzE5Y2RlZWIyZiAoInZpcnRpby1zZXJp
YWw6IGFkZCBtaXNzaW5nIHZpcnRpb19kZXRhY2hfZWxlbWVudCgpIGNhbGwiKQ0KDQogICAgPiBk
byB5b3UgcmVtZW1iZXIgd2h5IHlvdSBwcmVmZXJlZCB0byB1c2UgdmlydHF1ZXVlX2RldGFjaF9l
bGVtZW50KCkgcmF0aGVyIHRoYW4NCiAgICA+IHZpcnRxdWV1ZV91bnBvcCgpIChvciB2aXJ0cXVl
dWVfZGlzY2FyZCgpIGF0IHRoaXMgdGltZSwgc2VlIDI3ZTU3ZWZlMzJmNSAoInZpcnRpbzogcmVu
YW1lDQogICAgPiB2aXJ0cXVldWVfZGlzY2FyZCB0byB2aXJ0cXVldWVfdW5wb3AiKSkNCg0KICAg
ID4gVGhhbmtzLA0KICAgID4gTGF1cmVudA0KDQoJSSBvYnNlcnZlZCBhbGwgdGhlIHNpdHVhdGlv
bnMgd2hlcmUgZGlzY2FyZF90aHJvdHRsZV9kYXRhIGlzIGNhbGxlZCwgVGhlIHJlc3VsdCBvbmx5
IHBvaW50cyB0byBvbmUgc2l0dWF0aW9uLCB0aGF0IGlzLCB0aGUgdmlydGlvIGRldmljZSBpcw0K
CWRhbWFnZWQoZHJpdmVyIHdpbGwgcmVzZXQgYWxsIHF1ZXVlcykuIEFib3V0IHZpcnRpby1zZXJp
YWwgZGV2aWNlLCBjbG9zZSBkZXZpc2UgZnJvbSBob3N0IHNpZGUgZG9lc24ndCBtZWFuIHRoZSBk
cml2ZXIgcmVzZXQgYWxsIHF1ZXVlcywNCglzbyB3ZSBjYW4ndCBqdXN0IGRldGFjaCB0aGUgdGhy
b3R0bGVkIGVsZW0uDQoNCglUaGFua3MsDQoJQXJhZmF0bXMNCg0KDQo=

