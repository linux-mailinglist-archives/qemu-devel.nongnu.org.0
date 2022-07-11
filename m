Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A12C57073E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:39:14 +0200 (CEST)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAvVB-0006LG-0Z
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oAvMn-00076Y-SA; Mon, 11 Jul 2022 11:30:34 -0400
Received: from [200.168.210.66] (port=55941 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oAvMl-00020i-Qx; Mon, 11 Jul 2022 11:30:33 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 11 Jul 2022 12:30:27 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id E4DE4800172;
 Mon, 11 Jul 2022 12:30:26 -0300 (-03)
Message-ID: <f12d1bc2-5ef0-04cf-f2da-58e60dd1d24d@eldorado.org.br>
Date: Mon, 11 Jul 2022 12:30:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 1/2] target/ppc: Implement hashst and hashchk
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, mst@redhat.com,
 pbonzini@redhat.com, farosas@linux.ibm.com
References: <20220711134258.63147-1-victor.colombo@eldorado.org.br>
 <20220711134258.63147-2-victor.colombo@eldorado.org.br>
 <87tu7n68dh.fsf@redhat.com>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <87tu7n68dh.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 11 Jul 2022 15:30:27.0218 (UTC)
 FILETIME=[257FEF20:01D8953B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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

T24gMTEvMDcvMjAyMiAxMToxOCwgQ29ybmVsaWEgSHVjayB3cm90ZToNCj4gT24gTW9uLCBK
dWwgMTEgMjAyMiwgVsOtY3RvciBDb2xvbWJvIDx2aWN0b3IuY29sb21ib0BlbGRvcmFkby5v
cmcuYnI+IHdyb3RlOg0KPiANCj4+IEltcGxlbWVudGF0aW9uIGZvciBpbnN0cnVjdGlvbnMg
aGFzaHN0IGFuZCBoYXNoY2hrLCB3aGljaCB3ZXJlIGFkZGVkDQo+PiBpbiBQb3dlciBJU0Eg
My4xQi4NCj4+DQo+PiBJdCB3YXMgZGVjaWRlZCB0byBpbXBsZW1lbnQgdGhlIGhhc2ggYWxn
b3JpdGhtIGZyb20gZ3JvdW5kIHVwIGluIHRoaXMNCj4+IHBhdGNoIGV4YWN0bHkgYXMgZGVz
Y3JpYmVkIGluIFBvd2VyIElTQS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBWw61jdG9yIENv
bG9tYm8gPHZpY3Rvci5jb2xvbWJvQGVsZG9yYWRvLm9yZy5icj4NCj4+IC0tLQ0KPj4gICBs
aW51eC1oZWFkZXJzL2FzbS1wb3dlcnBjL2t2bS5oICAgICAgICAgICAgfCAgMiArDQo+PiAg
IHRhcmdldC9wcGMvY3B1LmggICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4+
ICAgdGFyZ2V0L3BwYy9jcHVfaW5pdC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysN
Cj4+ICAgdGFyZ2V0L3BwYy9leGNwX2hlbHBlci5jICAgICAgICAgICAgICAgICAgIHwgODAg
KysrKysrKysrKysrKysrKysrKysrKw0KPj4gICB0YXJnZXQvcHBjL2hlbHBlci5oICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMiArDQo+PiAgIHRhcmdldC9wcGMvaW5zbjMyLmRlY29k
ZSAgICAgICAgICAgICAgICAgICB8ICA4ICsrKw0KPj4gICB0YXJnZXQvcHBjL3RyYW5zbGF0
ZS5jICAgICAgICAgICAgICAgICAgICAgfCAgNSArKw0KPj4gICB0YXJnZXQvcHBjL3RyYW5z
bGF0ZS9maXhlZHBvaW50LWltcGwuYy5pbmMgfCAzMiArKysrKysrKysNCj4+ICAgOCBmaWxl
cyBjaGFuZ2VkLCAxMzQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9saW51
eC1oZWFkZXJzL2FzbS1wb3dlcnBjL2t2bS5oIGIvbGludXgtaGVhZGVycy9hc20tcG93ZXJw
Yy9rdm0uaA0KPj4gaW5kZXggOWYxOGZhMDkwZi4uZGQ1OGQ1NzRiZiAxMDA2NDQNCj4+IC0t
LSBhL2xpbnV4LWhlYWRlcnMvYXNtLXBvd2VycGMva3ZtLmgNCj4+ICsrKyBiL2xpbnV4LWhl
YWRlcnMvYXNtLXBvd2VycGMva3ZtLmgNCj4+IEBAIC02NDYsNiArNjQ2LDggQEAgc3RydWN0
IGt2bV9wcGNfY3B1X2NoYXIgew0KPj4gICAjZGVmaW5lIEtWTV9SRUdfUFBDX1NJRVIzICAg
IChLVk1fUkVHX1BQQyB8IEtWTV9SRUdfU0laRV9VNjQgfCAweGMzKQ0KPj4gICAjZGVmaW5l
IEtWTV9SRUdfUFBDX0RBV1IxICAgIChLVk1fUkVHX1BQQyB8IEtWTV9SRUdfU0laRV9VNjQg
fCAweGM0KQ0KPj4gICAjZGVmaW5lIEtWTV9SRUdfUFBDX0RBV1JYMSAgIChLVk1fUkVHX1BQ
QyB8IEtWTV9SRUdfU0laRV9VNjQgfCAweGM1KQ0KPj4gKy8qIEZJWE1FOiBLVk0gaGFzbid0
IGV4cG9zZWQgdGhlc2UgcmVnaXN0ZXJzIHlldCAqLw0KPj4gKyNkZWZpbmUgS1ZNX1JFR19Q
UENfSEFTSEtFWVIgICAgKEtWTV9SRUdfUFBDIHwgS1ZNX1JFR19TSVpFX1U2NCB8IDB4MDAp
DQo+Pg0KPj4gICAvKiBUcmFuc2FjdGlvbmFsIE1lbW9yeSBjaGVja3BvaW50ZWQgc3RhdGU6
DQo+PiAgICAqIFRoaXMgaXMgYWxsIEdQUnMsIGFsbCBWU1ggcmVncyBhbmQgYSBzdWJzZXQg
b2YgU1BScw0KPiANCj4gPGVkaXRvcmlhbD4NCj4gUGxlYXNlIHNwbGl0IGFueSBoZWFkZXIg
dXBkYXRlcyBpbnRvIGEgc2VwYXJhdGUgcGF0Y2ggKGEgZnVsbCBoZWFkZXINCj4gdXBkYXRl
IG9yLCBpZiB0aGUgY2hhbmdlcyBhcmUgbm90IHlldCBpbmNsdWRlZCBpbiBMaW51eCwgYSBw
bGFjZWhvbGRlcg0KPiBwYXRjaC4gVGhhbmsgeW91IDopDQo+IDwvZWRpdG9yaWFsPg0KPiAN
Cg0KSGVsbG8gQ29ybmVsaWENCkknbGwgZG8gaXQuIFRoYW5rcyBmb3IgeW91ciByZXBseQ0K
DQotLSANClbDrWN0b3IgQ29yYSBDb2xvbWJvDQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVM
RE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2NsYWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRv
Lm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

