Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FD4C36E3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:27:14 +0100 (CET)
Received: from localhost ([::1]:41354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKhl-0000ky-D9
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:27:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNKeA-000689-0b; Thu, 24 Feb 2022 15:23:30 -0500
Received: from [187.72.171.209] (port=56564 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNKe6-0003l9-HT; Thu, 24 Feb 2022 15:23:29 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 24 Feb 2022 17:23:19 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 9FA718001D4;
 Thu, 24 Feb 2022 17:23:18 -0300 (-03)
Message-ID: <ad35a0d1-c11d-ee5f-8ef3-922f581de607@eldorado.org.br>
Date: Thu, 24 Feb 2022 17:23:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 24/47] target/ppc: move vrl[bhwd]nm/vrl[bhwd]mi to
 decodetree
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-25-matheus.ferst@eldorado.org.br>
 <9111db3b-f238-7780-a5dd-4350721146b3@linaro.org>
 <a77fcbaa-6810-ada8-3aef-2beb140c00d3@eldorado.org.br>
 <cf26c57f-ec5e-daec-b129-cd3f49112c3b@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <cf26c57f-ec5e-daec-b129-cd3f49112c3b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 24 Feb 2022 20:23:19.0011 (UTC)
 FILETIME=[5C830330:01D829BC]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMjMvMDIvMjAyMiAxOToxOSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDIv
MjMvMjIgMTE6NDMsIE1hdGhldXMgSy4gRmVyc3Qgd3JvdGU6DQo+Pj4gTm90ZSB0aGF0IHJv
dGx2IGRvZXMgdGhlIG1hc2tpbmcgaXRzZWxmOg0KPj4+DQo+Pj4gLyoNCj4+PiDCoCAqIEV4
cGFuZCBEID0gQSA8PCAoQiAlIGVsZW1lbnQgYml0cykNCj4+PiDCoCAqDQo+Pj4gwqAgKiBV
bmxpa2Ugc2NhbGFyIHNoaWZ0cywgd2hlcmUgaXQgaXMgZWFzeSBmb3IgdGhlIHRhcmdldCBm
cm9udCBlbmQNCj4+PiDCoCAqIHRvIGluY2x1ZGUgdGhlIG1vZHVsbyBhcyBwYXJ0IG9mIHRo
ZSBleHBhbnNpb24uwqAgSWYgdGhlIHRhcmdldA0KPj4+IMKgICogbmF0dXJhbGx5IGluY2x1
ZGVzIHRoZSBtb2R1bG8gYXMgcGFydCBvZiB0aGUgb3BlcmF0aW9uLCBncmVhdCENCj4+PiDC
oCAqIElmIHRoZSB0YXJnZXQgaGFzIHNvbWUgb3RoZXIgYmVoYXZpb3VyIGZyb20gb3V0LW9m
LXJhbmdlIHNoaWZ0cywNCj4+PiDCoCAqIHRoZW4gaXQgY291bGQgbm90IHVzZSB0aGlzIGZ1
bmN0aW9uIGFueXdheSwgYW5kIHdvdWxkIG5lZWQgdG8NCj4+PiDCoCAqIGRvIGl0J3Mgb3du
IGV4cGFuc2lvbiB3aXRoIGN1c3RvbSBmdW5jdGlvbnMuDQo+Pj4gwqAgKi8NCj4+Pg0KPj4N
Cj4+IFVzaW5nIHRjZ19nZW5fcm90bHZfdmVjKHZlY2UsIHZydCwgdnJhLCB2cmIpIHdvcmtz
IG9uIFBQQyBidXQgZmFpbHMgb24gDQo+PiB4ODYuIEl0IGxvb2tzIGxpa2UNCj4+IGEgcHJv
YmxlbSBvbiB0aGUgaTM4NiBiYWNrZW5kLiBJdCdzIHVzaW5nIFZQU1tSTF1MVltEUV0sIGJ1
dCBpbnN0ZWFkIA0KPj4gb2YgdGhpcyBtb2R1bG8NCj4+IGJlaGF2aW9yLCB0aGVzZSBpbnN0
cnVjdGlvbnMgd3JpdGUgemVybyB0byB0aGUgZWxlbWVudFsxXS4gSSdtIG5vdCANCj4+IHN1
cmUgaG93IHRvIGZpeCB0aGF0Lg0KPiANCj4gWW91IGRvbid0IHdhbnQgdG8gdXNlIHRjZ19n
ZW5fcm90bHZfdmVjIGRpcmVjdGx5LCBidXQgdGNnX2dlbl9yb3Rsdl92ZWMuDQo+IA0KDQpJ
IGd1ZXNzIHRoZXJlIGlzIGEgdHlwbyBoZXJlLiBEaWQgeW91IG1lYW4gdGNnX2dlbl9ndmVj
X3JvdGx2PyBPciANCnRjZ19nZW5fcm90bHZfbW9kX3ZlYz8NCg0KPiBUaGUgZ2VuZXJpYyBt
b2R1bG8gaXMgYmVpbmcgYXBwbGllZCBoZXJlOg0KPiANCj4gc3RhdGljIHZvaWQgdGNnX2dl
bl9yb3Rsdl9tb2RfdmVjKHVuc2lnbmVkIHZlY2UsIFRDR3ZfdmVjIGQsDQo+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgVENHdl92ZWMgYSwgVENHdl92ZWMgYikNCj4gew0KPiAgwqDCoMKgIFRDR3ZfdmVj
IHQgPSB0Y2dfdGVtcF9uZXdfdmVjX21hdGNoaW5nKGQpOw0KPiAgwqDCoMKgIFRDR3ZfdmVj
IG0gPSB0Y2dfY29uc3RhbnRfdmVjX21hdGNoaW5nKGQsIHZlY2UsICg4IDw8IHZlY2UpIC0g
MSk7DQo+IA0KPiAgwqDCoMKgIHRjZ19nZW5fYW5kX3ZlYyh2ZWNlLCB0LCBiLCBtKTsNCj4g
IMKgwqDCoCB0Y2dfZ2VuX3JvdGx2X3ZlYyh2ZWNlLCBkLCBhLCB0KTsNCj4gIMKgwqDCoCB0
Y2dfdGVtcF9mcmVlX3ZlYyh0KTsNCj4gfQ0KDQpJIGNhbiBzZWUgdGhhdCB0aGlzIG1ldGhv
ZCBpcyBjYWxsZWQgd2hlbiB3ZSB1c2UgdGNnX2dlbl9ndmVjX3JvdGx2IHRvIA0KaW1wbGVt
ZW50IHZybFtiaHdkXSwgYW5kIHRoZXkgYXJlIHdvcmtpbmcgYXMgZXhwZWN0ZWQuIEZvciB2
cmxbd2Rdbm0gYW5kIA0KdnJsW3dkXW1pLCBob3dldmVyLCB3ZSBjYW4ndCBjYWxsIHRjZ19n
ZW5fcm90bHZfbW9kX3ZlYyBkaXJlY3RseSBpbiB0aGUgDQouZm5pdiBpbXBsZW1lbnRhdGlv
biBiZWNhdXNlIGl0IGlzIG5vdCBleHBvc2VkIGluIHRjZy1vcC5oLiBJcyB0aGVyZSBhbnkg
DQpvdGhlciB3YXkgdG8gdXNlIHRoaXMgbWV0aG9kPyBTaG91bGQgd2UgYWRkIGl0IHRvIHRo
ZSBoZWFkZXIgZmlsZT8NCg0KVGhhbmtzLA0KTWF0aGV1cyBLLiBGZXJzdA0KSW5zdGl0dXRv
IGRlIFBlc3F1aXNhcyBFTERPUkFETyA8aHR0cDovL3d3dy5lbGRvcmFkby5vcmcuYnIvPg0K
QW5hbGlzdGEgZGUgU29mdHdhcmUNCkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6
Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4NCg==

