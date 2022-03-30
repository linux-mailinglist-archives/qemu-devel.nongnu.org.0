Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E64ECB41
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:04:03 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcfq-0003bA-IY
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:04:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbQ-0008KL-09; Wed, 30 Mar 2022 13:59:28 -0400
Received: from [187.72.171.209] (port=8566 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nZcbO-0004gS-Cn; Wed, 30 Mar 2022 13:59:27 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 14:59:20 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 6E9B68002AF;
 Wed, 30 Mar 2022 14:59:20 -0300 (-03)
Message-ID: <19555754-74bf-0718-e230-352fd5b568eb@eldorado.org.br>
Date: Wed, 30 Mar 2022 14:59:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH 0/6] softfloat 128-bit integer support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
 <c2a9a1e2-18f5-9a3c-8fcb-bc2777ca2912@linaro.org>
Content-Language: en-US
In-Reply-To: <c2a9a1e2-18f5-9a3c-8fcb-bc2777ca2912@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 30 Mar 2022 17:59:20.0844 (UTC)
 FILETIME=[E1CED4C0:01D8445F]
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

T24gMjkvMDMvMjAyMiAwMDozOCwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDMv
MjgvMjIgMTQ6MTQsIG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyIHdyb3RlOg0KPj4g
RnJvbTogTWF0aGV1cyBGZXJzdCA8bWF0aGV1cy5mZXJzdEBlbGRvcmFkby5vcmcuYnI+DQo+
Pg0KPj4gVGhpcyBSRkMgaXMgYSBmaXJzdCBhdHRlbXB0IGF0IGltcGxlbWVudGluZyB0aGUg
MTI4LWJpdCBpbnRlZ2VyDQo+PiBjb252ZXJzaW9uIHJvdXRpbmVzIGluIHNvZnRmbG9hdCwg
YXMgcmVxdWlyZWQgYnkgdGhlIHhzY3Zbc3VdcXFwIGFuZA0KPj4geHNjdnFwW3N1XXF6IGlu
c3RydWN0aW9ucyBvZiBQb3dlcklTQSB2My4xLg0KPj4NCj4+IEluc3RlYWQgb2YgdXNpbmcg
aW50MTI4LmgsIGludC10by1mbG9hdCByb3V0aW5lcyByZWNlaXZlIHRoZSAxMjgtYml0DQo+
PiBudW1iZXJzIHRocm91Z2ggYSBwYWlyIG9mIDY0LWJpdCB2YWx1ZXMsIGFuZCBmbG9hdC10
by1pbnQgY29udmVyc2lvbnMNCj4+IHVzZSBhIHBvaW50ZXIgdG8gcmV0dXJuIHRoZSBsb3dl
ciBoYWxmIG9mIHRoZSByZXN1bHQuDQo+Pg0KPj4gV2Ugb25seSBuZWVkIHRoZSBwYXJ0czEy
OCBtZXRob2RzLCBidXQgc2luY2UgdGhlIGRpZmZlcmVuY2UgdG8gcGFydHM2NA0KPj4gb25l
cyBzZWVtZWQgbWlub3IsIEkgaW5jbHVkZWQgYm90aCBpbiB0aGlzIHBhdGNoLg0KPj4NCj4+
IFJGQzoNCj4+IMKgIC0gU2hvdWxkIHdlIHVzZSBzdHJ1Y3QgSW50MTI4IGluc3RlYWQgb2Yg
NjQtYml0IHZhbHVlIHBhaXJzPw0KPiANCj4gSSB0aGluayBzby7CoCBXZSBoYXZlIGl0LCBh
bmQgaXQgbWFrZXMgdGhlIGludGVyZmFjZSBtb3JlIG9idmlvdXMuDQo+IA0KPj4gwqAgLSBJ
J3ZlIG5vdCB0ZXN0ZWQgdGhlIGZsb2F0NjQgbWV0aG9kcyBzaW5jZSB0aGUgUFBDIGluc3Ry
dWN0aW9ucyBvbmx5DQo+PiDCoMKgwqAgdXNlIHRoZSBxdWFkLXByZWNpc2lvbiByb3V0aW5l
cy4gU2hvdWxkIHdlIGtlZXAgdGhlbSBpbiB0aGUgZmluYWwNCj4+IMKgwqDCoCB2ZXJzaW9u
Pw0KPiANCj4gTGV0J3Mgbm90IGFkZCBhbnl0aGluZyB0aGF0IHdlIGRvbid0IGhhdmUgYSBu
ZWVkIGZvci4NCj4gSXQgbWF5IGV2ZW50dWFsbHkgYmUgbmVlZGVkIGJ5IFJJU0MtViBSVjEy
OCwgYnV0IHdlIGNhbiBhZGQgaXQgdGhlbi4NCj4gDQo+IA0KPiByfg0KDQpUaGFua3MgZm9y
IHlvdXIgY29tbWVudHMgYW5kIHJldmlldy4gSSdsbCBzZW5kIGFuIGFsdGVybmF0aXZlIHZl
cnNpb24gb2YgDQp0aGlzIFJGQyB1c2luZyBJbnQxMjguDQoNCi0tIA0KTWF0aGV1cyBLLiBG
ZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETyA8aHR0cDovL3d3dy5lbGRv
cmFkby5vcmcuYnIvPg0KQW5hbGlzdGEgZGUgU29mdHdhcmUNCkF2aXNvIExlZ2FsIC0gRGlz
Y2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4N
Cg==

