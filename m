Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF7B4B5445
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:12:51 +0100 (CET)
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJd22-0007W1-3A
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:12:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nJcAx-0007au-06
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:17:59 -0500
Received: from [187.72.171.209] (port=38209 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1nJcAt-00067Q-Mh
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:17:58 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 14 Feb 2022 11:17:46 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7C65C800059;
 Mon, 14 Feb 2022 11:17:45 -0300 (-03)
Message-ID: <f8164a77-80d1-86fa-7fc9-6089d6b4f34b@eldorado.org.br>
Date: Mon, 14 Feb 2022 11:17:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 11/11] tests/tcg: add vectorised sha512 versions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-12-alex.bennee@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220211160309.335014-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 14 Feb 2022 14:17:46.0037 (UTC)
 FILETIME=[A34F4650:01D821AD]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMTEvMDIvMjAyMiAxMzowMywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGlzIGJ1aWxk
cyB2ZWN0b3Jpc2VkIHZlcnNpb25zIG9mIHNoYTUxMiB0byBleGVyY2lzZSB0aGUgdmVjdG9y
IGNvZGU6DQo+IA0KPiAgICAtIGFhcmNoNjQgKEFkdlNpbWQpDQo+ICAgIC0gaTM4NiAoU1NF
KQ0KPiAgICAtIHMzOTB4IChNVlgpDQo+ICAgIC0gcHBjNjQgKHZlY3RvcikNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4g
UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnPg0KPiBNZXNzYWdlLUlkOiA8MjAyMjAyMDIxOTEyNDIuNjUyNjA3LTUtYWxleC5i
ZW5uZWVAbGluYXJvLm9yZz4NCj4gDQo+IC0tLQ0KPiB2Mg0KPiAgICAtIHVzZSAtbXNzZTQu
MSAtTzMgaW5zdGVhZCBvZiAtcGVudGl1bTQgZm9yIGkzODYgYnVpbGQNCj4gLS0tDQo+ICAg
dGVzdHMvdGNnL211bHRpYXJjaC9zaGE1MTIuYyAgICAgIHwgMiArLQ0KPiAgIHRlc3RzL3Rj
Zy9hYXJjaDY0L01ha2VmaWxlLnRhcmdldCB8IDcgKysrKysrKw0KPiAgIHRlc3RzL3RjZy9h
cm0vTWFrZWZpbGUudGFyZ2V0ICAgICB8IDggKysrKysrKysNCj4gICB0ZXN0cy90Y2cvaTM4
Ni9NYWtlZmlsZS50YXJnZXQgICAgfCA2ICsrKysrKw0KPiAgIHRlc3RzL3RjZy9wcGM2NGxl
L01ha2VmaWxlLnRhcmdldCB8IDUgKysrKy0NCj4gICB0ZXN0cy90Y2cvczM5MHgvTWFrZWZp
bGUudGFyZ2V0ICAgfCA5ICsrKysrKysrKw0KPiAgIHRlc3RzL3RjZy94ODZfNjQvTWFrZWZp
bGUudGFyZ2V0ICB8IDcgKysrKysrKw0KPiAgIDcgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQoNCjxzbmlwPg0KDQo+IGRpZmYgLS1naXQg
YS90ZXN0cy90Y2cvcHBjNjRsZS9NYWtlZmlsZS50YXJnZXQgYi90ZXN0cy90Y2cvcHBjNjRs
ZS9NYWtlZmlsZS50YXJnZXQNCj4gaW5kZXggNDgwZmYwODk4ZC4uNGYxZDAzZGZjZiAxMDA2
NDQNCj4gLS0tIGEvdGVzdHMvdGNnL3BwYzY0bGUvTWFrZWZpbGUudGFyZ2V0DQo+ICsrKyBi
L3Rlc3RzL3RjZy9wcGM2NGxlL01ha2VmaWxlLnRhcmdldA0KPiBAQCAtNSwxMCArNSwxMyBA
QA0KPiAgIFZQQVRIICs9ICQoU1JDX1BBVEgpL3Rlc3RzL3RjZy9wcGM2NGxlDQo+IA0KPiAg
IGlmbmVxICgkKERPQ0tFUl9JTUFHRSkkKENST1NTX0NDX0hBU19QT1dFUjhfVkVDVE9SKSwp
DQo+IC1QUEM2NExFX1RFU1RTPWJjZHN1YiBub25fc2lnbmFsbGluZ194c2N2DQo+ICtQUEM2
NExFX1RFU1RTPWJjZHN1YiBub25fc2lnbmFsbGluZ194c2N2IHNoYTUxMi12ZWN0b3INCj4g
ICBlbmRpZg0KPiAgICQoUFBDNjRMRV9URVNUUyk6IENGTEFHUyArPSAtbXBvd2VyOC12ZWN0
b3INCj4gDQoNClNpbmNlIHRoaXMgdGVzdCBkb2VzIG5vdCB0YXJnZXQgYSBzcGVjaWZpYyBp
bnN0cnVjdGlvbiwgbWF5YmUgaXQgc2hvdWxkIA0KdXNlIC1tdnN4Ly1tYWx0aXZlYyB0byBh
bGxvdyB0aGUgY29tcGlsZXIgdG8gdXNlIG5ld2VyIGluc3RydWN0aW9ucy4NCg0KPiArc2hh
NTEyLXZlY3Rvcjogc2hhNTEyLmMNCj4gKyAgICAgICAkKENDKSAkKENGTEFHUykgJChFWFRS
QV9DRkxBR1MpICQ8IC1vICRAICQoTERGTEFHUykNCj4gKw0KDQpDYW4gd2UgaGF2ZSB0aGlz
IHRlc3QgZm9yIGJpZy1lbmRpYW4gdG9vPw0KDQpUaGFua3MsDQpNYXRoZXVzIEsuIEZlcnN0
DQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPIDxodHRwOi8vd3d3LmVsZG9yYWRv
Lm9yZy5ici8+DQpBbmFsaXN0YSBkZSBTb2Z0d2FyZQ0KQXZpc28gTGVnYWwgLSBEaXNjbGFp
bWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

