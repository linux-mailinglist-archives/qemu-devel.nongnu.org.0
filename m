Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3125B5AD799
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 18:34:09 +0200 (CEST)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVF31-0004le-Sh
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 12:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVF0N-0002a3-DK; Mon, 05 Sep 2022 12:31:24 -0400
Received: from [200.168.210.66] (port=1241 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVF0L-00024K-2P; Mon, 05 Sep 2022 12:31:23 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 5 Sep 2022 13:31:16 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id DFB1A8001D1;
 Mon,  5 Sep 2022 13:31:15 -0300 (-03)
Message-ID: <20affe6c-fc70-78fe-ae3c-da5b66518320@eldorado.org.br>
Date: Mon, 5 Sep 2022 13:31:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] target/ppc: Merge fsqrt and fsqrts helpers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, matheus.ferst@eldorado.org.br, lucas.araujo@eldorado.org.br,
 leandro.lupori@eldorado.org.br, lucas.coutinho@eldorado.org.br
References: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
 <20220905123746.54659-4-victor.colombo@eldorado.org.br>
 <f2fac00a-cacb-25b3-f6ae-9f35a82ab440@linaro.org>
 <e3153a0e-4451-3b21-7821-6877d78868e8@eldorado.org.br>
 <6dbd2eb5-efd6-073a-a106-4afbb8abcfc2@linaro.org>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <6dbd2eb5-efd6-073a-a106-4afbb8abcfc2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 05 Sep 2022 16:31:16.0399 (UTC)
 FILETIME=[EBB6C3F0:01D8C144]
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

T24gMDUvMDkvMjAyMiAxMzoyMSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDkv
NS8yMiAxNzoxOSwgVsOtY3RvciBDb2xvbWJvIHdyb3RlOg0KPj4+IEV4aXN0aW5nIGJ1Zywg
YnV0IHRoaXMgaXMgbWlzc2luZyB0byBjbGVhciBmcCBzdGF0dXMgdG8gc3RhcnQuDQo+Pj4N
Cj4+PiBSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29u
QGxpbmFyby5vcmc+DQo+Pj4NCj4+PiByfg0KPj4+DQo+Pg0KPj4gSGVsbG8gUmljaGFyZCwg
dGhhbmtzIGZvciB5b3VyIHJldmlldyENCj4+IGdlbl9yZXNldF9mcHN0YXR1cygpIGlzIGNh
bGxlZCBieSB0aGUgaW5saW5lIGltcGxlbWVudGF0aW9uIGluDQo+PiBkb19oZWxwZXJfZnNx
cnQoKSBiZWZvcmUgY2FsbGluZyB0aGUgaGVscGVyIChwYXRjaCAxKS4NCj4gDQo+IE9vcHMs
IG9rLg0KPiANCj4gDQo+PiBJdCdzIHByb2JhYmx5IGJldHRlciB0byBtb3ZlIHRoZSBjYWxs
IHRvIGluc2lkZSB0aGUgaGVscGVyLg0KPiANCj4gSSBkaWQgd3JpdGUgYWJvdXQgYSBzY2hl
bWUgYnkgd2hpY2ggYWxsIG9mIHRoZXNlIGNhbGxzIHNob3VsZCBnbyBhd2F5LiAgDQo+IEkg
Z3Vlc3MgaXQgaGFzDQo+IGJlZW4gYSB3aGlsZS4uLg0KPiANCj4gDQo+IHJ+DQoNCkkgaGF2
ZSBhIG1lc3NhZ2UgYm9va21hcmtlZCBoZXJlIChbMV0pLCBidXQgSSBkb24ndCBrbm93IGlm
IHRoZXJlIGlzIGENCnByZXZpb3VzIG9uZSB3aXRoIGEgbW9yZSBpbiBkZXB0aCBzY2hlbWUu
DQpBbnl3YXksIEkgd2FzIGFsc28gYW5hbHl6aW5nIHJlY2VudGx5IHRoZSBpZGVhIG9mIHJl
bW92aW5nIGFsbCB0aGVzZQ0KcmVzZXRfZnBzdGF0dXMoKSBjYWxscyBmcm9tIGluc3RydWN0
aW9ucyBoZWxwZXJzLiBJIHRoaW5rIHRoaXMgd291bGQNCnJlcXVpcmUgdG8gYWN0dWFsbHkg
Y2FsbCBpdCBmcm9tIHRoZSBlbmQgb2YgdGhlIChwcmV2aW91cykgaW5zdHJ1Y3Rpb25zIA0K
aW5zdGVhZCBvZiB0aGUgYmVnaW5uaW5nPyBMaWtlIGFkZGluZyB0aGUgY2FsbCB0bw0KZG9f
ZmxvYXRfY2hlY2tfc3RhdHVzKCkgYW5kIGZsb2F0X2ludmFsaWRfb3BfKigpIGFzIGEgZm9j
YWwgcG9pbnQgdG8NCidoaWRlJyB0aGUgY2FsbHMgdG8gcmVzZXRfZnBzdGF0dXMoKS4gSG93
ZXZlciB0aGVyZSBhcmUgYWxzbyBpbnNucw0KaGVscGVycyB0aGF0IGRvbid0IGNhbGwgdGhl
c2UgYXV4aWxpYXJ5IGZ1bmN0aW9ucywgd2hpY2ggSSB0aGluayB3b3VsZA0KY2F1c2UgdGhl
IHJlZmFjdG9yIHRvIG5vdCBiZSB3b3J0aHkgb3ZlcmFsbC4NCkRpZCB5b3UgaGF2ZSBhbm90
aGVyIGlkZWEgdGhhdCBjb3VsZCBiZSBzaW1wbGVyPw0KDQpbMV0gaHR0cHM6Ly9saXN0cy5n
bnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjAtMDUvbXNnMDAwNjQuaHRtbA0K
DQoNCi0tIA0KVsOtY3RvciBDb3JhIENvbG9tYm8NCkluc3RpdHV0byBkZSBQZXNxdWlzYXMg
RUxET1JBRE8NCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3Jh
ZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

