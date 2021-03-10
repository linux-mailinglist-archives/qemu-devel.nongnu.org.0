Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36460333918
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:44:44 +0100 (CET)
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvOV-0002Io-8T
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lJvNP-00012Y-MZ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:43:35 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lJvNM-0006se-OJ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:43:35 -0500
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DwRt83L23z5bRD;
 Wed, 10 Mar 2021 17:41:36 +0800 (CST)
Received: from DGGEML509-MBS.china.huawei.com ([169.254.4.125]) by
 DGGEML404-HUB.china.huawei.com ([fe80::b177:a243:7a69:5ab8%31]) with mapi id
 14.03.0513.000; Wed, 10 Mar 2021 17:43:15 +0800
From: fangying <fangying1@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Subject: =?gb2312?B?tPC4tDogW1JGQyBQQVRDSCAwLzVdIGh3L2FybS92aXJ0OiBJbnRyb2R1Y2Ug?=
 =?gb2312?Q?cpu_topology_support?=
Thread-Topic: [RFC PATCH 0/5] hw/arm/virt: Introduce cpu topology support
Thread-Index: AQHXC1Qj/tHAn0qQjECDFlJEyFNqxKp8gJiAgACL/7A=
Date: Wed, 10 Mar 2021 09:43:15 +0000
Message-ID: <43E932EA88344C498D975E4FF00CF41E2F0F60DF@dggeml509-mbs.china.huawei.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210310092059.blt3yymqi2eyc2ua@kamzik.brq.redhat.com>
In-Reply-To: <20210310092059.blt3yymqi2eyc2ua@kamzik.brq.redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.186.67]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=fangying1@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "zhangliang \(AG\)" <zhangliang5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBBbmRyZXcgSm9uZXMgW21haWx0bzpkcmpv
bmVzQHJlZGhhdC5jb21dIA0Kt6LLzcqxvOQ6IDIwMjHE6jPUwjEwyNUgMTc6MjENCsrVvP7Iyzog
ZmFuZ3lpbmcgPGZhbmd5aW5nMUBodWF3ZWkuY29tPg0K1vfM4jogUmU6IFtSRkMgUEFUQ0ggMC81
XSBody9hcm0vdmlydDogSW50cm9kdWNlIGNwdSB0b3BvbG9neSBzdXBwb3J0DQoNCg0KPiBIaSBZ
aW5nIEZhbmcsDQo+IA0KPiBEbyB5b3UgcGxhbiB0byByZXBvc3QgdGhpcyBzb29uPyBJdCdkIGJl
IGdyZWF0IGlmIGl0IGdvdCBpbnRvIDYuMC4NCj4NCj4gVGhhbmtzLA0KPiBkcmV3DQoNCg0KSGkg
QW5kcmV3DQpUaGFua3MgZm9yIHlvdXIgcmVtaW5kLg0KWWVzLCBJIHdpbGwgcmVwb3N0IGFuZCB1
cGRhdGUgdGhpcyBzZXJpZXMgc29vbi4NCkl0IHNlZW1zIDYuMCB3aWxsIGJlIHNvZnQgZmVhdHVy
ZSBmcm96ZW4gYXQgMy4xNi4NCkRlYWRsaW5lIGlzIGNsb3NlLg0KDQpPbiBUaHUsIEZlYiAyNSwg
MjAyMSBhdCAwNDo1NjoyMlBNICswODAwLCBZaW5nIEZhbmcgd3JvdGU6DQo+IEFuIGFjY3VyYXRl
IGNwdSB0b3BvbG9neSBtYXkgaGVscCBpbXByb3ZlIHRoZSBjcHUgc2NoZWR1bGVyJ3MgZGVjaXNp
b24gDQo+IG1ha2luZyB3aGVuIGRlYWxpbmcgd2l0aCBtdWx0aS1jb3JlIHN5c3RlbS4gU28gY3B1
IHRvcG9sb2d5IA0KPiBkZXNjcmlwdGlvbiBpcyBoZWxwZnVsIHRvIHByb3ZpZGUgZ3Vlc3Qgd2l0
aCB0aGUgcmlnaHQgdmlldy4gRGFyaW8gDQo+IEZhZ2dpb2xpJ3MgdGFsayBpbiBbMF0gYWxzbyBz
aG93cyB0aGUgdmlydHVhbCB0b3BvbG9neSBtYXkgaGFzIGltcGFjdCBvbiBzY2hlZCBwZXJmb3Jt
YWNlLg0KPiBUaHVzIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIHBvc3RlZCB0byBpbnRyb2R1Y2UgY3B1
IHRvcG9sb2d5IHN1cHBvcnQgZm9yIA0KPiBhcm0gcGxhdGZvcm0uDQo+IA0KPiBCb3RoIGZkdCBh
bmQgQUNQSSBhcmUgaW50cm9kdWNlZCB0byBwcmVzZW50IHRoZSBjcHUgdG9wb2xvZ3kuIFRvIA0K
PiBkZXNjcmliZSB0aGUgY3B1IHRvcG9sb2d5IHZpYSBBQ1BJLCBhIFBQVFQgdGFibGUgaXMgaW50
cm9kdWNlZCANCj4gYWNjb3JkaW5nIHRvIHRoZSBwcm9jZXNzb3IgaGllcmFyY2h5IG5vZGUgc3Ry
dWN0dXJlLiBUaGlzIHNlcmllcyBpcyANCj4gZGVyaXZlZCBmcm9tIFsxXSwgaW4gWzFdIHdlIGFy
ZSB0cnlpbmcgdG8gYnJpbmcgYm90aCBjcHUgYW5kIGNhY2hlIA0KPiB0b3BvbG9neSBzdXBwb3J0
IGZvciBhcm0gcGxhdGZvcm0sIGJ1dCB0aGVyZSBpcyBzdGlsbCBzb21lIGlzc3VlcyB0byANCj4g
c29sdmUgdG8gc3VwcG9ydCB0aGUgY2FjaGUgaGllcmFyY2h5LiBTbyB3ZSBzcGxpdCB0aGUgY3B1
IHRvcG9sb2d5IHBhcnQgb3V0IGFuZCBzZW5kIGl0IHNlcGVyYXRlbHkuDQo+IFRoZSBwYXRjaCBz
ZXJpZXMgdG8gc3VwcG9ydCBjYWNoZSBoaWVyYXJjaHkgd2lsbCBiZSBzZW5kIGxhdGVyIHNpbmNl
IA0KPiBTYWxpbCBNZWh0YSdzIGNwdSBob3RwbHVnIGZlYXR1cmUgbmVlZCB0aGUgY3B1IHRvcG9s
b2d5IGVuYWJsZWQgZmlyc3QgDQo+IGFuZCBoZSBpcyB3YWl0aW5nIGZvciBpdCB0byBiZSB1cHN0
cmVhbWVkLg0KPiANCj4gVGhpcyBwYXRjaCBzZXJpZXMgd2FzIGluaXRpYWxseSBiYXNlZCBvbiB0
aGUgcGF0Y2hlcyBwb3N0ZWQgYnkgQW5kcmV3IEpvbmVzIFsyXS4NCj4gSSBqdW1wZWQgaW4gb24g
aXQgc2luY2Ugc29tZSBPUyB2ZW5kb3IgY29vcGVyYXRpdmUgcGFydG5lciBhcmUgZWFnZXIgZm9y
IGl0Lg0KPiBUaGFua3MgZm9yIEFuZHJldydzIGNvbnRyaWJ1dGlvbi4NCj4gDQo+IEFmdGVyIGFw
cGx5aW5nIHRoaXMgcGF0Y2ggc2VyaWVzLCBsYXVuY2ggYSBndWVzdCB3aXRoIHZpcnQtNi4wIGFu
ZCBjcHUgDQo+IHRvcG9sb2d5IGNvbmZpZ3VyZWQgd2l0aCBzb2NrZXRzOmNvcmVzOnRocmVhZHMg
PSAyOjQ6MiwgeW91IHdpbGwgZ2V0IA0KPiB0aGUgYmVsbG93IG1lc3NhZ2VzIHdpdGggdGhlIGxz
Y3B1IGNvbW1hbmQuDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiBBcmNoaXRlY3R1cmU6ICAgICAgICAgICAgICAgICAgICBhYXJjaDY0DQo+IENQVSBv
cC1tb2RlKHMpOiAgICAgICAgICAgICAgICAgIDY0LWJpdA0KPiBCeXRlIE9yZGVyOiAgICAgICAg
ICAgICAgICAgICAgICBMaXR0bGUgRW5kaWFuDQo+IENQVShzKTogICAgICAgICAgICAgICAgICAg
ICAgICAgIDE2DQo+IE9uLWxpbmUgQ1BVKHMpIGxpc3Q6ICAgICAgICAgICAgIDAtMTUNCj4gVGhy
ZWFkKHMpIHBlciBjb3JlOiAgICAgICAgICAgICAgMg0KPiBDb3JlKHMpIHBlciBzb2NrZXQ6ICAg
ICAgICAgICAgICA0DQo+IFNvY2tldChzKTogICAgICAgICAgICAgICAgICAgICAgIDINCj4gTlVN
QSBub2RlKHMpOiAgICAgICAgICAgICAgICAgICAgMg0KPiBWZW5kb3IgSUQ6ICAgICAgICAgICAg
ICAgICAgICAgICBIaVNpbGljb24NCj4gTW9kZWw6ICAgICAgICAgICAgICAgICAgICAgICAgICAg
MA0KPiBNb2RlbCBuYW1lOiAgICAgICAgICAgICAgICAgICAgICBLdW5wZW5nLTkyMA0KPiBTdGVw
cGluZzogICAgICAgICAgICAgICAgICAgICAgICAweDENCj4gQm9nb01JUFM6ICAgICAgICAgICAg
ICAgICAgICAgICAgMjAwLjAwDQo+IE5VTUEgbm9kZTAgQ1BVKHMpOiAgICAgICAgICAgICAgIDAt
Nw0KPiBOVU1BIG5vZGUxIENQVShzKTogICAgICAgICAgICAgICA4LTE1DQo+IA0KPiBbMF0gDQo+
IGh0dHBzOi8va3ZtZm9ydW0yMDIwLnNjaGVkLmNvbS9ldmVudC9lRTF5L3ZpcnR1YWwtdG9wb2xv
Z3ktZm9yLXZpcnR1YWwNCj4gLW1hY2hpbmVzLWZyaWVuZC1vci1mb2UtZGFyaW8tZmFnZ2lvbGkt
c3VzZQ0KPiBbMV0gDQo+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1k
ZXZlbC8yMDIwLTExL21zZzAyMTY2Lmh0bWwNCj4gWzJdIA0KPiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvcWVtdS1kZXZlbC9jb3Zlci8yMDE4MDcwNDEyNDkyMy4zDQo+IDI0
ODMtMS1kcmpvbmVzQHJlZGhhdC5jb20NCj4gDQo+IFlpbmcgRmFuZyAoNSk6DQo+ICAgZGV2aWNl
X3RyZWU6IEFkZCBxZW11X2ZkdF9hZGRfcGF0aA0KPiAgIGh3L2FybS92aXJ0OiBBZGQgY3B1LW1h
cCB0byBkZXZpY2UgdHJlZQ0KPiAgIGh3L2FybS92aXJ0LWFjcGktYnVpbGQ6IGRpc3Rpbmd1aXNo
IHBvc3NpYmxlIGFuZCBwcmVzZW50IGNwdXMNCj4gICBody9hY3BpL2FtbC1idWlsZDogYWRkIHBy
b2Nlc3NvciBoaWVyYXJjaHkgbm9kZSBzdHJ1Y3R1cmUNCj4gICBody9hcm0vdmlydC1hY3BpLWJ1
aWxkOiBhZGQgUFBUVCB0YWJsZQ0KPiANCj4gIGh3L2FjcGkvYW1sLWJ1aWxkLmMgICAgICAgICAg
fCA0MCArKysrKysrKysrKysrKysrKysrKysrDQo+ICBody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMg
ICAgIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICBody9hcm0v
dmlydC5jICAgICAgICAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgaW5j
bHVkZS9ody9hY3BpL2FjcGktZGVmcy5oICB8IDEzICsrKysrKysrICANCj4gaW5jbHVkZS9ody9h
Y3BpL2FtbC1idWlsZC5oICB8ICA3ICsrKysNCj4gIGluY2x1ZGUvaHcvYXJtL3ZpcnQuaCAgICAg
ICAgfCAgMSArDQo+ICBpbmNsdWRlL3N5c2VtdS9kZXZpY2VfdHJlZS5oIHwgIDEgKw0KPiAgc29m
dG1tdS9kZXZpY2VfdHJlZS5jICAgICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrLS0N
Cj4gIDggZmlsZXMgY2hhbmdlZCwgMjA0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+
IA0KPiAtLQ0KPiAyLjIzLjANCj4gDQoNCg==

