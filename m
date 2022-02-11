Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343954B2E60
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 21:24:32 +0100 (CET)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIcT0-0007Sl-NJ
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 15:24:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nIcR5-0006c9-4R; Fri, 11 Feb 2022 15:22:31 -0500
Received: from [187.72.171.209] (port=29611 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nIcR2-0002wx-6U; Fri, 11 Feb 2022 15:22:30 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 11 Feb 2022 17:22:20 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 5AE71800145;
 Fri, 11 Feb 2022 17:22:20 -0300 (-03)
Message-ID: <f92f65c0-8b5b-bdcc-67d4-6202d354048c@eldorado.org.br>
Date: Fri, 11 Feb 2022 17:22:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/3] tests/tcg/ppc64le: fix the build of TCG tests
 with Clang
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
 <a2159a5a-18a5-8737-0ac9-df1505f73da1@kaod.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <a2159a5a-18a5-8737-0ac9-df1505f73da1@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 11 Feb 2022 20:22:20.0778 (UTC)
 FILETIME=[126E9CA0:01D81F85]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>, danielhb413@gmail.com,
 alex.bennee@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMDkvMDIvMjAyMiAwOTozMSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+IEhlbGxv
IE1hdGhldXMsDQo+IA0KPiBbIEFkZGluZyBNaXJvc2xhdiBdDQo+IA0KPiBPbiAyLzgvMjIg
MjE6MzEsIG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyIHdyb3RlOg0KPj4gRnJvbTog
TWF0aGV1cyBGZXJzdCA8bWF0aGV1cy5mZXJzdEBlbGRvcmFkby5vcmcuYnI+DQo+Pg0KPj4g
QmFzZWQtb246IA0KPj4gaHR0cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11
LWRldmVsLzIwMjItMDEvbXNnMDY1MDYuaHRtbA0KPj4NCj4+IEFzIHRoZSBjb25maWd1cmF0
aW9uIHNjcmlwdHMgdXNlZCAtbWJpZyBhbmQgLW1saXR0bGUsIGJ1aWxkaW5nIFBQQyB0ZXN0
cw0KPj4gd2l0aCBDbGFuZyB3YXMgc2lsZW50bHkgc2tpcHBlZC4gV2l0aCB0aGUgcGF0Y2gg
dG8gZml4IHRoZXNlIG9wdGlvbnNbMV0sDQo+PiAibWFrZSBjaGVjay10Y2ciIGZhaWxzIGJl
Y2F1c2Ugb2YgYnVpbGQgYW5kIHJ1bnRpbWUgZXJyb3JzLiBUaGlzIHBhdGNoDQo+PiBzZXJp
ZXMgdHJpZXMgdG8gZml4IHNvbWUgb2YgdGhlc2UgcHJvYmxlbXMuDQo+Pg0KPj4gVGhlIGZp
cnN0IHBhdGNoIGZpeGVzICJ0ZXN0cy90Y2cvcHBjNjRsZS9tdGZzZi5jIiBieSByZW1vdmlu
ZyB0aGUNCj4+IEdDQy1vbmx5IGJ1aWx0aW5zIHVzZWQgdG8gZW1pdCBtdGZzZiBhbmQgbWZm
cy4gV2UgY2FuIGVtaXQgdGhlc2UgaW5zbnMNCj4+IHdpdGggaW5saW5lIGFzbSBpbnN0ZWFk
Lg0KPj4NCj4+IFRoZSBzZWNvbmQgcGF0Y2ggYWRkcmVzc2VzIGRpZmZlcmVuY2VzIGluIHRo
ZSBvdXRwdXQgb2YgZmxvYXRfbWFkZHMuYy4NCj4+IFRoZSBfX2J1aWx0aW5fZm1hZiB1c2Vk
IGluIHRoaXMgdGVzdCBlbWl0cyBmbWFkZHMgd2l0aCBHQ0MgYW5kIHhzbWFkZGFzcA0KPj4g
d2l0aCBMTFZNLiBUaGUgZmlyc3QgaW5zbiBoYWQgcm91bmRpbmcgZXJyb3JzIGZpeGVkIGlu
DQo+PiBkMDRjYTg5NWRjN2YgKCJ0YXJnZXQvcHBjOiBBZGQgaGVscGVycyBmb3IgZm1hZGRz
IGV0IGFsIiksIHdlIGFwcGx5DQo+PiBhIHNpbWlsYXIgZml4IHRvIHhzbWFkZGFzcC4NCj4+
DQo+PiBUaGVuIHdlIGhhdmUgdGhlIGJ1aWxkIGVycm9ycyBvZiB0ZXN0cy90Y2cvcHBjNjRs
ZS9iY2RzdWIuYy4gQWNjb3JkaW5nDQo+PiB0byBHQ0MgZG9jc1syXSwgdGhlICctbXBvd2Vy
OC12ZWN0b3InIGZsYWcgcHJvdmlkZXMgc29tZSBiY2RzdWINCj4+IGJ1aWx0aW5zLCBzbyBp
dCdkIGJlIHJlYXNvbmFibGUgdG8gYXNzdW1lIHRoYXQgdGhlIHJlc3Qgb2YgdGhlIHRvb2xj
aGFpbg0KPj4ga25vd3MgYWJvdXQgdGhlIGluc24gaWYgdGhlIGNvbXBpbGVyIGFjY2VwdHMg
dGhpcyBmbGFnLiBDbGFuZyBzdXBwb3J0cw0KPj4gdGhpcyBmbGFnIHNpbmNlIHZlcnNpb24g
My42WzNdLCBidXQgdGhlIGluc24gYW5kIGJ1aWx0aW5zIHdlcmUgb25seQ0KPj4gYWRkZWQg
aW4gTExWTSAxNFs0XS4gSSBjb3VsZG4ndCBmaW5kIGEgZ29vZCBzb2x1dGlvbi4gU2hvdWxk
IHdlIHdyaXRlIGENCj4+IHRlc3QgdG8gY2hlY2sgZm9yIHRoaXMgaW5zbiBhdCBjb25maWd1
cmF0aW9uIHRpbWU/IFNob3VsZCB3ZSBkZXRlY3QgdGhlDQo+PiBjb21waWxlciBhdCBidWls
ZCB0aW1lIGFuZCBlbWl0IHRoZSBpbnNucyB3aXRoICIubG9uZyIgYW5kIGZpeGVkDQo+PiBy
ZWdpc3RlcnM/DQo+Pg0KPj4gRXZlbiBidWlsZGluZyB3aXRoIENsYW5nIDE0LCB0aGUgdGVz
dCB3aWxsIGZhaWwgaW4gcnVudGltZSBiZWNhdXNlDQo+PiBMTFZNIGRvZXNuJ3QgbGlrZSAi
X19pbnQxMjgiIGluIGlubGluZSBhc20uIE5vIGVycm9yIG9yIHdhcm5pbmcgaXMNCj4+IGVt
aXR0ZWQsIGJ1dCB0aGUgZ2VuZXJhdGVkIGNvZGUgb25seSBsb2FkcyBvbmUgZG91Ymxld29y
ZCBvZiB0aGUgVlNSLg0KPj4gVGhlIHRoaXJkIHBhdGNoIG9mIHRoaXMgc2VyaWVzIGF2b2lk
cyB0aGlzIGlzc3VlIGJ5IHVzaW5nIGEgdmVjdG9yDQo+PiB0eXBlIGZvciBWU1IgdmFsdWVz
Lg0KPj4NCj4+IEZpbmFsbHksIGl0IHNlZW1zIHRoYXQgdGhlIGluc25zIHRlc3RlZCBieQ0K
Pj4gdGVzdHMvdGNnL3BwYzY0bGUvYnl0ZV9yZXZlcnNlLmMgYXJlIG5vdCB5ZXQgc3VwcG9y
dGVkIGJ5IExMVk0uIFNpbmNlDQo+PiB0aGUgY29uZmlndXJhdGlvbiBzY3JpcHQgdXNlcyAn
LW1wb3dlcjEwJyB0byBjaGVjayBmb3IgUE9XRVIxMCBzdXBwb3J0DQo+PiBhbmQgQ2xhbmcg
ZG9lc24ndCBzdXBwb3J0IHRoaXMgZmxhZywgIm1ha2UgY2hlY2stdGNnIiBkb2Vzbid0IGZh
aWwuIFdlDQo+PiBzaG91bGQgcHJvYmFibHkgY2hhbmdlIHRoaXMgY2hlY2sgaW4gdGhlIGZ1
dHVyZSwgYnV0IHNpbmNlIExMVk0gc3VwcG9ydA0KPj4gb2YgUE9XRVIxMCBzZWVtcyBpbmNv
bXBsZXRlLCBJIGd1ZXNzIHdlIGNhbiBsZWF2ZSBpdCBmb3Igbm93Lg0KPiANCj4gZ2l0bGFi
IGRpZG4ndCBzcG90IGFueSBpc3N1ZXMgd2l0aCB0aGUgNCBwYXRjaGVzIGFwcGxpZWQuDQoN
Cg0KQUZBSUNULCBDSSB3b3VsZG4ndCBydW4gaW50byB0aGlzIGtpbmQgb2YgcHJvYmxlbSBi
ZWNhdXNlIHdlIGRvbid0IGhhdmUgDQpQUEMgcnVubmVycywgYW5kIHRoZSBjcm9zcy1jb21w
aWxlciBjb250YWluZXJzIHVzZSBHQ0MuDQoNCj4gU2hvdWxkIHdlIG1lcmdlIGFsbCBwYXRj
aGVzIDoNCj4gDQo+ICDCoCBVc2UgbG9uZyBlbmRpYW4gb3B0aW9ucyBmb3IgcHBjNjQNCj4g
IMKgIHRlc3RzL3RjZy9wcGM2NGxlOiBVc2UgdmVjdG9yIHR5cGVzIGluc3RlYWQgb2YgX19p
bnQxMjgNCj4gIMKgIHRhcmdldC9wcGM6IGNoYW5nZSB4c1tuXW1hZGRbYW1dc3AgdG8gdXNl
IGZsb2F0NjRyMzJfbXVsYWRkDQo+ICDCoCB0ZXN0cy90Y2cvcHBjNjRsZTogdXNlIGlubGlu
ZSBhc20gaW5zdGVhZCBvZiBfX2J1aWx0aW5fbXRmc2YNCj4gDQo+IGFuZCBzZWUgaG93IHdl
IGNhbiBhZGRyZXNzIHRoZSBMTFZNIHN1cHBvcnQgZm9yIFAxMCBsYXRlciA/DQo+IA0KDQpU
aGUgcHJvYmxlbXMgd2l0aCBiY2RzdWIuYyBhcmUgbm90IHJlc29sdmVkIGZvciBDbGFuZyA8
IDE0LCBidXQgSSBndWVzcyANCml0J3Mgb2sgdG8gbWVyZ2UgYW55d2F5Lg0KDQpUaGFua3Ms
DQpNYXRoZXVzIEsuIEZlcnN0DQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPIDxo
dHRwOi8vd3d3LmVsZG9yYWRvLm9yZy5ici8+DQpBbmFsaXN0YSBkZSBTb2Z0d2FyZQ0KQXZp
c28gTGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlz
Y2xhaW1lci5odG1sPg0K

