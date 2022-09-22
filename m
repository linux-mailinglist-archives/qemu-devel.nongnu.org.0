Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013FA5E69B1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:33:20 +0200 (CEST)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQ4c-0001xh-BV
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obPMQ-0007Jp-HO; Thu, 22 Sep 2022 12:47:39 -0400
Received: from [200.168.210.66] (port=49764 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obPMO-0007R1-Et; Thu, 22 Sep 2022 12:47:38 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 22 Sep 2022 13:47:32 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 1663680012C;
 Thu, 22 Sep 2022 13:47:32 -0300 (-03)
Message-ID: <4989844d-cbac-91e3-d300-1afc96c3b7a4@eldorado.org.br>
Date: Thu, 22 Sep 2022 13:47:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/4] Patch series to set up a ppc64le CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220922135516.33627-1-lucas.araujo@eldorado.org.br>
 <874jwz4bev.fsf@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <874jwz4bev.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 22 Sep 2022 16:47:32.0337 (UTC)
 FILETIME=[0270D610:01D8CEA3]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.893,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

DQoNCk9uIDIyLzA5LzIwMjIgMTM6MzIsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gIkx1Y2Fz
IE1hdGV1cyBDYXN0cm8oYWxxb3RlbCkiIDxsdWNhcy5hcmF1am9AZWxkb3JhZG8ub3JnLmJy
PiB3cml0ZXM6DQo+IA0KPj4gVGhpcyBwYXRjaCBzZXJpZXMgYWltIHRvIG1ha2UgZWFzaWVy
IHRvIHNldCB1cCBhIGNvbXBpbGF0aW9uIGFuZCBDSQ0KPj4gZW52aXJvbm1lbnQgb24gUFBD
NjQgYW5kIFBQQzY0TEUgbWFjaGluZXMuDQo+IA0KPiBRdWV1ZWQgdG8gdGVzdGluZy9uZXh0
LCB0aGFua3MuDQo+IA0KPiBEbyB3ZSBoYXZlIGEgZG9uYXRlZCBwcGM2NCBtYWNoaW5lIHRv
IGFkZCB0byB0aGUgY3VzdG9tIHJ1bm5lcnM/DQo+IA0KSSBwcm9iYWJseSBzaG91bGQgaGF2
ZSBjaGFuZ2VkIHRoZSBtZXNzYWdlLCB0aGlzIGlzIGp1c3QgYSByZXN0cnVjdHVyaW5nIA0K
b2YgYSBwYXRjaCBzZXJpZXMgb3JpZ2luYWxseSB0byBzZXQgdXAgYSBDSSBmb3IgUFBDNjQg
DQooPDIwMjIwNzI3MTYzNjMyLjU5ODA2LTEtbHVjYXMuYXJhdWpvQGVsZG9yYWRvLm9yZy5i
cj4pLCBidXQgRGFuaWVsIA0KcG9pbnRlZCBzb21lIHVuY2VydGFpbnR5IGluIHRoZSBpbmZy
YXN0cnVjdHVyZSBvcmlnaW5hbGx5IHBsYW5uZWQgdG8gYmUgDQp1c2VkIGZvciB0aGlzIENJ
ICg8ZTg2MDliZGEtODY1Zi00MmM4LTkyMzQtNzViMDgyY2E5ZGYwQGdtYWlsLmNvbT4pIGFu
ZCANCmFza2VkIGZvciBhIHJlc2VuZCBvZiBwYXRjaCAxLTQgYXMgdGhvc2Ugd2VyZSBnZW5l
cmFsIGZpeGVzIGluIHNjcmlwdHMgSSANCmZvdW5kIHdoaWxlIHVzaW5nIHRoZW0gdG8gc2V0
IHVwIGEgUFBDIG1hY2hpbmUgd2l0aCBhbnNpYmxlIGFuZCBydW4gc29tZSANCmRvY2tlciB0
ZXN0cy4NClNvIGFzIG9mIHJpZ2h0IG5vdyB0aGlzIHBhdGNoIHNlcmllcyBpcyBub3QgYWJv
dXQgc2V0IHVwIGEgQ0kgZm9yIA0KUFBDNjQvUFBDNjRMRS4NCj4+IHYzOg0KPj4gQ2hhbmdl
ZCBwYXRjaCAxIHRvIHJlc3BlY3QgYWxwaGFiZXRpY2FsIG9yZGVyDQo+Pg0KPj4gdjI6DQo+
PiBUaGlzIHBhdGNoIHNlcmllcyBhcmUgb25seSBwYXRjaGVzIDItNCBvZiB2MSBhbmQgYW4g
YWx0ZXJuYXRpdmUgdG8gcGF0Y2ggMQ0KPj4gc3VnZ2VzdGVkIGJ5IERhbmllbC4NCj4+DQo+
PiBMdWNhcyBNYXRldXMgQ2FzdHJvIChhbHFvdGVsKSAoNCk6DQo+PiAgICBzY3JpcHRzL2Np
L3NldHVwOiBuaW5qYSBtaXNzaW5nIGZyb20gYnVpbGQtZW52aXJvbm1lbnQNCj4+ICAgIHNj
cmlwdHMvY2kvc2V0dXA6IEZpeCBsaWJ4ZW4gcmVxdWlyZW1lbnRzDQo+PiAgICBzY3JpcHRz
L2NpL3NldHVwOiBzcGljZS1zZXJ2ZXIgb25seSBvbiB4ODYgYWFyY2g2NA0KPj4gICAgdGVz
dHMvZG9ja2VyOiBydW4gc2NyaXB0IHVzZSByZWFscGF0aCBpbnN0ZWFkIG9mIHJlYWRsaW5r
DQo+Pg0KPj4gICBzY3JpcHRzL2NpL3NldHVwL2J1aWxkLWVudmlyb25tZW50LnltbCB8IDE1
ICsrKysrKysrKysrKystLQ0KPj4gICB0ZXN0cy9kb2NrZXIvcnVuICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IA0KPiAtLQ0KPiBBbGV4IEJlbm7DqWUNCg0KLS0g
DQpMdWNhcyBNYXRldXMgTS4gQXJhdWpvIGUgQ2FzdHJvDQpJbnN0aXR1dG8gZGUgUGVzcXVp
c2FzIEVMRE9SQURPDQo8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyLz91dG1fY2FtcGFp
Z249YXNzaW5hdHVyYV9kZV9lLW1haWwmdXRtX21lZGl1bT1lbWFpbCZ1dG1fc291cmNlPVJE
K1N0YXRpb24+DQpEZXBhcnRhbWVudG8gQ29tcHV0YcOnw6NvIEVtYmFyY2FkYQ0KQW5hbGlz
dGEgZGUgU29mdHdhcmUgSnVuaW9yDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBz
Oi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

