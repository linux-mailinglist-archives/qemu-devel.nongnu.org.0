Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B9E55C0BE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:34:12 +0200 (CEST)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69Tv-0007hL-00
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o69Lh-0007ib-82; Tue, 28 Jun 2022 07:25:42 -0400
Received: from [200.168.210.66] (port=15211 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o69Ld-0004WE-QD; Tue, 28 Jun 2022 07:25:41 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 28 Jun 2022 08:25:32 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 5719680009B;
 Tue, 28 Jun 2022 08:25:32 -0300 (-03)
Message-ID: <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
Date: Tue, 28 Jun 2022 08:25:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Slowness with multi-thread TCG?
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 28 Jun 2022 11:25:32.0652 (UTC)
 FILETIME=[C77C5AC0:01D88AE1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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

T24gMjcvMDYvMjAyMiAxNToyNSwgRnJlZGVyaWMgQmFycmF0IHdyb3RlOg0KPiBbIFJlc2Vu
ZGluZyBhcyBpdCB3YXMgbWVhbnQgZm9yIHRoZSBxZW11LXBwYyBsaXN0IF0NCj4gDQo+IEhl
bGxvLA0KPiANCj4gSSd2ZSBiZWVuIGxvb2tpbmcgYXQgd2h5IG91ciBxZW11IHBvd2VybnYg
bW9kZWwgaXMgc28gc2xvdyB3aGVuIGJvb3RpbmcNCj4gYSBjb21wcmVzc2VkIGxpbnV4IGtl
cm5lbCwgdXNpbmcgbXVsdGlwbGUgdmNwdXMgYW5kIG11bHRpLXRocmVhZCB0Y2cuDQo+IFdp
dGggb25seSBvbmUgdmNwdSwgdGhlIGRlY29tcHJlc3Npb24gdGltZSBvZiB0aGUga2VybmVs
IGlzIHdoYXQgaXQgaXMsDQo+IGJ1dCB3aGVuIHVzaW5nIG11bHRpcGxlIHZjcHVzLCB0aGUg
ZGVjb21wcmVzc2lvbiBpcyBhY3R1YWxseSBzbG93ZXIuIEFuZA0KPiB3b3JzZTogaXQgZGVn
cmFkZXMgdmVyeSBmYXN0IHdpdGggdGhlIG51bWJlciBvZiB2Y3B1cyENCj4gDQo+IFJvdWdo
IG1lYXN1cmVtZW50IG9mIHRoZSBkZWNvbXByZXNzaW9uIHRpbWUgb24gYSB4ODYgbGFwdG9w
IHdpdGgNCj4gbXVsdGktdGhyZWFkIHRjZyBhbmQgdXNpbmcgdGhlIHFlbXUgcG93ZXJudjEw
IG1hY2hpbmU6DQo+IDEgdmNwdSA9PiAxNSBzZWNvbmRzDQo+IDIgdmNwdXMgPT4gNDUgc2Vj
b25kcw0KPiA0IHZjcHVzID0+IDEgbWluIDMwIHNlY29uZHMNCj4gDQo+IExvb2tpbmcgaW4g
ZGV0YWlscywgd2hlbiB0aGUgZmlybXdhcmUgKHNraWJvb3QpIGhhbmRzIG92ZXIgZXhlY3V0
aW9uIHRvDQo+IHRoZSBsaW51eCBrZXJuZWwsIHRoZXJlJ3Mgb25lIG1haW4gdGhyZWFkIGVu
dGVyaW5nIHNvbWUgYm9vdHN0cmFwIGNvZGUNCj4gYW5kIHJ1bm5pbmcgdGhlIGtlcm5lbCBk
ZWNvbXByZXNzaW9uIGFsZ29yaXRobS4gQWxsIHRoZSBvdGhlciBzZWNvbmRhcnkNCj4gdGhy
ZWFkcyBhcmUgbGVmdCBzcGlubmluZyBpbiBza2lib290ICgxIHRocmVhZCBwZXIgdnBjdSku
IFNvIG9uIHBhcGVyLA0KPiB3aXRoIG11bHRpLXRocmVhZCB0Y2cgYW5kIGFzc3VtaW5nIHRo
ZSBzeXN0ZW0gaGFzIGVub3VnaCBhdmFpbGFibGUNCj4gcGh5c2ljYWwgY3B1cywgSSB3b3Vs
ZCBleHBlY3QgdGhlIGRlY29tcHJlc3Npb24gdG8gaG9nIG9uZSBwaHlzaWNhbCBjcHUNCj4g
YW5kIHRoZSB0aW1lIG5lZWRlZCB0byBiZSBjb25zdGFudCwgbm8gbWF0dGVyIHRoZSBudW1i
ZXIgb2YgdnBjdXMuDQo+IA0KPiBBbGwgdGhlIHNlY29uZGFyeSB0aHJlYWRzIGFyZSBsZWZ0
IHNwaW5uaW5nIGluIGNvZGUgbGlrZSB0aGlzOg0KPiANCj4gIMKgwqDCoMKgwqDCoCBmb3Ig
KDs7KSB7DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChjcHVfY2hlY2tf
am9icyhjcHUpKcKgIC8vIHJlYWRpbmcgY3B1LWxvY2FsIGRhdGENCj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmVjb25maWd1cmVfaWRsZSnCoMKgwqDCoCAvLyBn
bG9iYWwgdmFyaWFibGUNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrOw0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiYXJy
aWVyKCk7DQo+ICDCoMKgwqDCoMKgwqAgfQ0KPiANCj4gVGhlIGJhcnJpZXIgaXMgdG8gZm9y
Y2UgcmVhZGluZyB0aGUgbWVtb3J5IHdpdGggZWFjaCBpdGVyYXRpb24uIEl0J3MNCj4gZGVm
aW5lZCBhczoNCj4gDQo+ICDCoCBhc20gdm9sYXRpbGUoIiIgOiA6IDogIm1lbW9yeSIpOw0K
PiANCj4gDQo+IFNvbWUgdGltZSBsYXRlciwgdGhlIG1haW4gdGhyZWFkIGluIHRoZSBsaW51
eCBrZXJuZWwgd2lsbCBnZXQgdGhlDQo+IHNlY29uZGFyeSB0aHJlYWRzIG91dCBvZiB0aGF0
IGxvb3AgYnkgcG9zdGluZyBhIGpvYi4NCj4gDQo+IE15IGZpcnN0IHRob3VnaHQgd2FzIHRo
YXQgdGhlIHRyYW5zbGF0aW9uIG9mIHRoYXQgY29kZSB0aHJvdWdoIHRjZyB3YXMNCj4gc29t
ZWhvdyBjYXVzaW5nIHNvbWUgYWJub3JtYWxseSBzbG93IGJlaGF2aW9yLCBtYXliZSBkdWUg
dG8gc29tZQ0KPiBub24tb2J2aW91cyBjb250ZW50aW9uIGJldHdlZW4gdGhlIHRocmVhZHMu
IEhvd2V2ZXIsIGlmIEkgc2VuZCB0aGUNCj4gdGhyZWFkcyBzcGlubmluZyBmb3JldmVyIHdp
dGggc2ltcGx5Og0KPiANCj4gIMKgwqDCoCBmb3IgKDs7KSA7DQo+IA0KPiBzdXBwb3NlZGx5
IHJlbW92aW5nIGFueSBjb250ZW50aW9uLCB0aGVuIHRoZSBkZWNvbXByZXNzaW9uIHRpbWUg
aXMgdGhlIA0KPiBzYW1lLg0KPiANCj4gSXJvbmljYWxseSwgdGhlIGJlaGF2aW9yIHNlZW4g
d2l0aCBzaW5nbGUgdGhyZWFkIHRjZyBpcyB3aGF0IEkgd291bGQNCj4gZXhwZWN0OiAxIHRo
cmVhZCBkZWNvbXByZXNzaW5nIGluIDE1IHNlY29uZHMsIGFsbCB0aGUgb3RoZXIgdGhyZWFk
cw0KPiBzcGlubmluZyBmb3IgdGhhdCBzYW1lIGFtb3VudCBvZiB0aW1lLCBhbGwgc2hhcmlu
ZyB0aGUgc2FtZSBwaHlzaWNhbA0KPiBjcHUsIHNvIGl0IGFsbCBhZGRzIHVwIG5pY2VseTog
SSBzZWUgNjAgc2Vjb25kcyBkZWNvbXByZXNzaW9uIHRpbWUgd2l0aA0KPiA0IHZjcHVzICg0
eDE1KS4gV2hpY2ggbWVhbnMgbXVsdGktdGhyZWFkIHRjZyBpcyBzbG93ZXIgYnkgcXVpdGUg
YSBiaXQuDQo+IEFuZCBzaW5nbGUgdGhyZWFkIHRjZyBob2dzIG9uZSBwaHlzaWNhbCBjcHUg
b2YgdGhlIGxhcHRvcCB2cy4gNCBwaHlzaWNhbA0KPiBjcHVzIGZvciB0aGUgc2xvd2VyIG11
bHRpLXRocmVhZCB0Y2cuDQo+IA0KPiBEb2VzIGFueWJvZHkgaGF2ZSBhbiBpZGVhIG9mIHdo
YXQgbWlnaHQgaGFwcGVuIG9yIGhhdmUgc3VnZ2VzdGlvbiB0bw0KPiBrZWVwIGludmVzdGln
YXRpbmc/DQo+IFRoYW5rcyBmb3IgeW91ciBoZWxwIQ0KPiANCj4gIMKgIEZyZWQNCj4gDQo+
IA0KDQpIaSBGcmVkZXJpYywNCg0KSSBkaWQgc29tZSBib290IHRpbWUgdGVzdHMgcmVjZW50
bHkgYW5kIGRpZG4ndCBub3RpY2UgdGhpcyBiZWhhdmlvci4gDQpDb3VsZCB5b3Ugc2hhcmUg
eW91ciBRRU1VIGNvbW1hbmQgbGluZSB3aXRoIHVzPyBEaWQgeW91IGJ1aWxkIFFFTVUgd2l0
aCANCmFueSBkZWJ1ZyBvcHRpb24gb3Igc2FuaXRpemVyIGVuYWJsZWQ/DQoNCi0tIA0KTWF0
aGV1cyBLLiBGZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETyA8aHR0cDov
L3d3dy5lbGRvcmFkby5vcmcuYnIvPg0KQW5hbGlzdGEgZGUgU29mdHdhcmUNCkF2aXNvIExl
Z2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWlt
ZXIuaHRtbD4NCg==

