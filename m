Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615A5BFE86
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:58:12 +0200 (CEST)
Received: from localhost ([::1]:41484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazIl-0006oL-4j
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oayXq-0006y2-In; Wed, 21 Sep 2022 08:09:38 -0400
Received: from [200.168.210.66] (port=48600 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oayXo-00068A-NT; Wed, 21 Sep 2022 08:09:38 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 21 Sep 2022 09:09:30 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 286BB800181;
 Wed, 21 Sep 2022 09:09:30 -0300 (-03)
Message-ID: <7c78d9e9-c3e5-1545-cda3-08c7393a5c0c@eldorado.org.br>
Date: Wed, 21 Sep 2022 09:09:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] scripts/ci/setup: ninja missing from
 build-environment
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Cleber Rosa <crosa@redhat.com>
References: <20220914124153.61017-1-lucas.araujo@eldorado.org.br>
 <20220914124153.61017-2-lucas.araujo@eldorado.org.br>
 <29bfc681-0e37-e799-85fa-bf8ed0d096eb@redhat.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <29bfc681-0e37-e799-85fa-bf8ed0d096eb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 21 Sep 2022 12:09:30.0471 (UTC)
 FILETIME=[00DC5770:01D8CDB3]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.702,
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

DQoNCk9uIDE1LzA5LzIwMjIgMTI6NTQsIFRob21hcyBIdXRoIHdyb3RlOg0KDQo+IE9uIDE0
LzA5LzIwMjIgMTMuNDEsIEx1Y2FzIE1hdGV1cyBDYXN0cm8oYWxxb3RlbCkgd3JvdGU6DQo+
PiBGcm9tOiAiTHVjYXMgTWF0ZXVzIENhc3RybyAoYWxxb3RlbCkiIDxsdWNhcy5hcmF1am9A
ZWxkb3JhZG8ub3JnLmJyPg0KPj4NCj4+IG5pbmphLWJ1aWxkIGlzIG1pc3NpbmcgZnJvbSB0
aGUgUkhFTCBlbnZpcm9ubWVudCwgc28gYSBzeXN0ZW0gcHJlcGFyZWQNCj4+IHdpdGggdGhh
dCBzY3JpcHQgd291bGQgc3RpbGwgZmFpbCB0byBjb21waWxlIFFFTVUuDQo+PiBUZXN0ZWQg
b24gYSBGZWRvcmEgMzYNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBNYXRldXMgQ2Fz
dHJvIChhbHFvdGVsKSANCj4+IDxsdWNhcy5hcmF1am9AZWxkb3JhZG8ub3JnLmJyPg0KPj4g
LS0tDQo+PiDCoCBzY3JpcHRzL2NpL3NldHVwL2J1aWxkLWVudmlyb25tZW50LnltbCB8IDEg
Kw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL3NjcmlwdHMvY2kvc2V0dXAvYnVpbGQtZW52aXJvbm1lbnQueW1sIA0KPj4gYi9z
Y3JpcHRzL2NpL3NldHVwL2J1aWxkLWVudmlyb25tZW50LnltbA0KPj4gaW5kZXggMjMyNTI1
YjkxZC4uNmRmM2U2MWQ5NCAxMDA2NDQNCj4+IC0tLSBhL3NjcmlwdHMvY2kvc2V0dXAvYnVp
bGQtZW52aXJvbm1lbnQueW1sDQo+PiArKysgYi9zY3JpcHRzL2NpL3NldHVwL2J1aWxkLWVu
dmlyb25tZW50LnltbA0KPj4gQEAgLTE1MCw2ICsxNTAsNyBAQA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGxpYmVwb3h5LWRldmVsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gbGliZ2NyeXB0LWRldmVsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbHpvLWRl
dmVsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gbmluamEtYnVpbGQNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLSBtYWtlDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVz
YS1saWJFR0wtZGV2ZWwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBuZXR0bGUtZGV2
ZWwNCj4gDQo+IExvb2tzIGxpa2UgdGhlIGxpc3QgdXNlZCB0byBiZSBzb3J0ZWQgYWxwaGFi
ZXRpY2FsbHksIHNvIG1heWJlIHlvdSBzaG91bGQNCj4gc29ydCBpdCBpbiBzb21lIGxpbmVz
IGxhdGVyPw0KRCdvaCwgSSdsbCBzZW5kIGEgdjMgZml4aW5nIHRoYXQuDQo+IA0KPiBBbmQg
SSB3b25kZXIgd2h5IHRoaXMgaGFzbid0IGJlZW4gbm90aWNlZCBiZWZvcmUgLi4uIENsZWJl
ciwgd2FzIHRoaXMgaW4gDQo+IHVzZQ0KPiBhZnRlciBhbGw/DQo+IA0KPiAgwqBUaG9tYXMN
Cj4gDQoNCi0tIA0KTHVjYXMgTWF0ZXVzIE0uIEFyYXVqbyBlIENhc3Rybw0KSW5zdGl0dXRv
IGRlIFBlc3F1aXNhcyBFTERPUkFETw0KPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici8/
dXRtX2NhbXBhaWduPWFzc2luYXR1cmFfZGVfZS1tYWlsJnV0bV9tZWRpdW09ZW1haWwmdXRt
X3NvdXJjZT1SRCtTdGF0aW9uPg0KRGVwYXJ0YW1lbnRvIENvbXB1dGHDp8OjbyBFbWJhcmNh
ZGENCkFuYWxpc3RhIGRlIFNvZnR3YXJlIEp1bmlvcg0KQXZpc28gTGVnYWwgLSBEaXNjbGFp
bWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

