Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EC15AEE6A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 17:13:13 +0200 (CEST)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVaGB-0003DM-RR
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 11:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVZSy-00009o-Gd; Tue, 06 Sep 2022 10:22:16 -0400
Received: from [200.168.210.66] (port=48667 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVZSv-0001uZ-B2; Tue, 06 Sep 2022 10:22:16 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 6 Sep 2022 11:22:09 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id AE83F8002BE;
 Tue,  6 Sep 2022 11:22:08 -0300 (-03)
Message-ID: <f2234ecf-fac5-9a18-f6d5-d3170967cb9a@eldorado.org.br>
Date: Tue, 6 Sep 2022 11:22:08 -0300
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
 <20affe6c-fc70-78fe-ae3c-da5b66518320@eldorado.org.br>
 <6af72233-3e87-c35d-b581-3777d5992d9a@linaro.org>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <6af72233-3e87-c35d-b581-3777d5992d9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 06 Sep 2022 14:22:09.0176 (UTC)
 FILETIME=[0C6C1980:01D8C1FC]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.752,
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

T24gMDUvMDkvMjAyMiAxNDoyMCwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IFdlbGws
IHRoZXJlIHdvdWxkIG9mIGNvdXJzZSBiZSBubyBzZXBhcmF0ZSBjYWxsLCBidXQgDQoNCkkg
ZGlkbid0IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbnQgaGVyZSB3aXRoICdubyBzZXBhcmF0
ZSBjYWxsJy4uLg0KDQo+IGRvX2Zsb2F0X2NoZWNrX3N0YXR1cyB3b3VsZDoNCj4gDQo+ICDC
oMKgwqAgaW50IHN0YXR1cyA9IGdldF9mbG9hdF9leGNlcHRpb25fZmxhZ3MoJmVudi0+ZnBf
c3RhdHVzKTsNCj4gDQo+ICDCoMKgwqAgc2V0X2Zsb2F0X2V4Y2VwdGlvbl9mbGFncygwLCAm
ZW52LT5mcF9zdGF0dXMpOw0KPiANCj4gc3RyYWlnaHQgYXdheS7CoCBObyBleHRyYSBjYWxs
IG92ZXJoZWFkLCBhbmQgdGhlIHN0ZWFkeS1zdGF0ZSBvZiBzb2Z0ZnAgDQo+IGV4Y2VwdGlv
biBmbGFncw0KPiBvdXRzaWRlIG9mIGFuIGluLXByb2dyZXNzIGZwIG9wZXJhdGlvbiBpcyAw
Lg0KPiANCg0KUmlnaHQsIG1ha2VzIHNlbnNlLiBBbmQgd2hhdCBhYm91dCB3aGVuIGFuIGlu
dmFsaWQgb3BlcmF0aW9uIG9jY3VycywNCndpdGggdGhlIGNvcnJlc3BvbmRpbmcgZXhjZXB0
aW9uIGVuYWJsZWQgYml0IHNldD8NCmZsb2F0X2ludmFsaWRfb3BfKiB3b3VsZCBzdG9wIHRo
ZSBleGVjdXRpb24gYW5kIGRvX2Zsb2F0X2NoZWNrX3N0YXR1cw0Kd291bGQgbm90IGJlIGNh
bGxlZCwgcmlnaHQ/IFNvIGl0IHdvdWxkIHJlcXVpcmUgdG8gY2FsbA0Kc2V0X2Zsb2F0X2V4
Y2VwdGlvbl9mbGFncyB0aGVyZSB0b28sIGNvcnJlY3Q/DQpJZiB0aGF0J3MgYWxsIHRoYXQn
cyBuZWNlc3NhcnksIEkgbWlnaHQgYmUgYWJsZSB0byB0YWtlIGEgbG9vayBhdCBpdCBhbmQN
CmNvbWUgd2l0aCBhIHBvc3NpYmxlIHBhdGNoLg0KDQo+IEFueXRoaW5nIHRoYXQgY2FuIHJh
aXNlIGEgc29mdGZwIGV4Y2VwdGlvbiBhbmQgZG9lc24ndCBkbyBzb21ldGhpbmcgd2l0aCAN
Cj4gaXQsIGVpdGhlcg0KPiBpbW1lZGlhdGVseSB3aXRoaW4gdGhlIHNhbWUgaGVscGVyLCBv
ciBqdXN0IGFmdGVyd2FyZCB3aXRoIA0KPiBoZWxwZXJfZmxvYXRfY2hlY2tfc3RhdHVzLCBp
cw0KPiBidWdneS7CoCBXaXRoIHRob3NlIGZpeGVkLCBoZWxwZXJfcmVzZXRfZnBzdGF0dXMg
bWF5IGJlIHJlbW92ZWQgZW50aXJlbHkuDQo+IA0KDQpPaCwgdGhhdCBtYWtlcyBzZW5zZS4g
SXQncyBlYXNpZXIgdG8gaW1wbGVtZW50IHRoZSBpZGVhIHVzaW5nIHRoaXMNCmFzc3VtcHRp
b24uDQoNCg0KLS0gDQpWw61jdG9yIENvcmEgQ29sb21ibw0KSW5zdGl0dXRvIGRlIFBlc3F1
aXNhcyBFTERPUkFETw0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5l
bGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

