Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452915AD955
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 21:00:05 +0200 (CEST)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVHKF-00026E-SK
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 15:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVHId-0000Y7-5u; Mon, 05 Sep 2022 14:58:23 -0400
Received: from [200.168.210.66] (port=23729 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVHIb-0007at-20; Mon, 05 Sep 2022 14:58:22 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 5 Sep 2022 15:58:16 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 1ED7B8001D1;
 Mon,  5 Sep 2022 15:58:16 -0300 (-03)
Message-ID: <320a6db3-75cf-0ed3-eb7d-6c956c9a253b@eldorado.org.br>
Date: Mon, 5 Sep 2022 15:58:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 18/19] target/ppc: Clear fpstatus flags on VSX_CMP
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-19-victor.colombo@eldorado.org.br>
 <2e2cdbcc-bebd-bf58-57e3-39ef7e28a2ae@gmail.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <2e2cdbcc-bebd-bf58-57e3-39ef7e28a2ae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 05 Sep 2022 18:58:16.0591 (UTC)
 FILETIME=[74F541F0:01D8C159]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

T24gMDUvMDkvMjAyMiAxNTo0MSwgRGFuaWVsIEhlbnJpcXVlIEJhcmJvemEgd3JvdGU6DQo+
IE9uIDkvMS8yMiAxMDoxNywgVsOtY3RvciBDb2xvbWJvIHdyb3RlOg0KPj4gU2lnbmVkLW9m
Zi1ieTogVsOtY3RvciBDb2xvbWJvIDx2aWN0b3IuY29sb21ib0BlbGRvcmFkby5vcmcuYnI+
DQo+PiAtLS0NCj4gDQo+IFdoYXQgSSBtZW50aW9uZWQgaW4gcGF0Y2ggMTAgYWxzbyBhcHBs
aWVzIHRvIGFsbCBwYXRjaGVzIGZyb20gMTEgdG8gMTgNCj4gaXQgc2VlbXMuIEFsbCBjaGFu
Z2VzIG1hZGUgaW4gcGF0Y2hlcyAwOS0xOCBhcmUgYmFzZWQgb24gdGhlIGV4cGxhbmF0aW9u
DQo+IGdhdmUgaW4gcGF0Y2ggMDguDQo+IA0KPiBUaGUgcHJvYmxlbSB3aXRoIHRoaXMgaXMg
dGhhdCBpdCdsbCBiZSBhbm5veWluZyBpZi93aGVuIHNvbWV0aGluZyBnb2VzDQo+IHdyb25n
LiBMZXQncyBzYXkgdGhhdCB0aGUgY2hhbmdlIG1hZGUgaW4gcGF0Y2ggMTUgY2F1c2VkIGEg
c2lkZS1lZmZlY3QuDQo+IEJpc2VjdCB3aWxsIHBvaW50IGl0IHRvIHBhdGNoIDE1LCB3aGlj
aCBkb2Vzbid0IGhhdmUgYW4gZXhwbGFuYXRpb24gb2YNCj4gd2h5IHlvdSBtYWRlIHRoZSBj
aGFuZ2UsIGFuZCB0aGVuIG9uZSB3aWxsIG5lZWQgdG8gdHJhY2UgaXQgYmFjayB0byB0aGUN
Cj4gbWFpbGluZyBsaXN0IHRvIHVuZGVyc3RhbmQgaXQuIEl0J3Mgbm90IGEgZ2l2ZW4gdGhh
dCBvbmUgd2lsbCBsb29rIGF0DQo+IGFsbCB0aGUgcmVjZW50IGNoYW5nZXMgYW5kIHVuZGVy
c3RhbmQgdGhhdCB0aGUgbG9naWMgdXNlZCBpbiBwYXRjaCAwOA0KPiBhcmUgYWxzbyBiZWlu
ZyB1c2VkIGluIHRoZSBzdWJzZXF1ZW50IHBhdGNoZXMuDQo+IA0KPiBJIGRvbid0IG1pbmQg
aWYgeW91IGp1c3QgY29weS9wYXN0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgZnJvbSBwYXRjaCAw
OCBhbmQNCj4ganVzdCBjaGFuZ2UgdGhlIGluc3RydWN0aW9uIG5hbWUgYmVpbmcgZml4ZWQu
IFdoYXQncyBpbXBvcnRhbnQgaXMgdG8NCj4gcHJvdmlkZSBzb21lIGNvbnRleHQgZm9yIGVh
Y2ggaW5kaXZpZHVhbCBjaGFuZ2UuDQo+IA0KPiANCj4gVGhhbmtzLA0KPiANCj4gDQo+IERh
bmllbA0KPiANCg0KSGVsbG8gRGFuaWVsLiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUg
cmV2aWV3cy4NCg0KSSdsbCB0YWtlIHlvdXIgcmVjb21tZW5kYXRpb24gYW5kIG1ha2UgdGhl
IG5lY2Vzc2FyeSBjaGFuZ2VzLg0KDQpCZXN0IHJlZ2FyZHMsDQoNCi0tIA0KVsOtY3RvciBD
b3JhIENvbG9tYm8NCkluc3RpdHV0byBkZSBQZXNxdWlzYXMgRUxET1JBRE8NCkF2aXNvIExl
Z2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWlt
ZXIuaHRtbD4NCg==

