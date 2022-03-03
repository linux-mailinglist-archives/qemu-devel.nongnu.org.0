Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB63D4CC761
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:57:20 +0100 (CET)
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsVj-0000W9-W1
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:57:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPsSt-000758-DB; Thu, 03 Mar 2022 15:54:23 -0500
Received: from [187.72.171.209] (port=21287 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPsSr-00065d-Cg; Thu, 03 Mar 2022 15:54:22 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 3 Mar 2022 17:53:14 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B3C888001CD;
 Thu,  3 Mar 2022 17:53:13 -0300 (-03)
Message-ID: <5fa9dcf4-fcd6-ddb6-ad87-a5a15d283ebb@eldorado.org.br>
Date: Thu, 3 Mar 2022 17:53:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/5] tests/tcg/ppc64le: Use Altivec register names in
 clobbler list
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
 <20220303172041.1915037-6-matheus.ferst@eldorado.org.br>
 <31ce0473-0706-65c1-c54b-4e572defebe7@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <31ce0473-0706-65c1-c54b-4e572defebe7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 03 Mar 2022 20:53:14.0681 (UTC)
 FILETIME=[B3B4C290:01D82F40]
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
Cc: thuth@redhat.com, danielhb413@gmail.com, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMDMvMDMvMjAyMiAxNjozMCwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDMv
My8yMiAwNzoyMCwgbWF0aGV1cy5mZXJzdEBlbGRvcmFkby5vcmcuYnIgd3JvdGU6DQo+PiBG
cm9tOiBNYXRoZXVzIEZlcnN0IDxtYXRoZXVzLmZlcnN0QGVsZG9yYWRvLm9yZy5icj4NCj4+
DQo+PiBMTFZNL0NsYW5nIGRvZXNuJ3Qga25vdyB0aGUgVlNYIHJlZ2lzdGVycyB3aGVuIGNv
bXBpbGluZyB3aXRoDQo+PiAtbWFiaT1lbGZ2MS4gVXNlIG9ubHkgcmVnaXN0ZXJzID49IDMy
IGFuZCBsaXN0IHRoZW0gd2l0aCB0aGVpciBBbHRpdmVjDQo+PiBuYW1lLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IE1hdGhldXMgRmVyc3QgPG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3Jn
LmJyPg0KPiANCj4gVGhpcyBkZXNjcmlwdGlvbiBpc24ndCBxdWl0ZSByaWdodC7CoCBUaGUg
Y2hhbmdlIHRvIHRoZSBtW3RmXXZzciBpbnNucyBpcyANCj4gYSBnZW5lcmljIGJ1Zw0KPiBm
aXgsIGFuZCBub3QgcmVsYXRlZCB0byBDbGFuZy4NCj4gDQoNCkknbSBub3Qgc3VyZSBpZiBJ
IHVuZGVyc3Rvb2QuIEknbSB0YXJnZXRpbmcgdGhlIENsYW5nIHByb2JsZW0gd2l0aCB0aGlz
IA0KcGF0Y2gsIGlzIHNvbWV0aGluZyBlbHNlIGJlaW5nIGZpeGVkIGJ5IHRoaXMgY2hhbmdl
Pw0KQUZBSUNULCB0aGUgb2xkICJtdHZzcmQgMCwgJTIiIGFuZCAibWZ2c3JkICUwLCAwIiB3
ZXJlIGNvcnJlY3QsIEknbSBqdXN0IA0KY2hhbmdpbmcgZnJvbSBWU1IgMCB0byBWU1IgMzIg
dG8gYWxsb3cgdGhlIGNsb2JiZXIgd2l0aCBDbGFuZywgYnV0IEdDQyANCmRvZXNuJ3Qgc2Vl
bSB0byBoYXZlIHRoaXMgbGltaXRhdGlvbiB3aXRoIEVMRnYxLg0KDQpUaGFua3MsDQpNYXRo
ZXVzIEsuIEZlcnN0DQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPIDxodHRwOi8v
d3d3LmVsZG9yYWRvLm9yZy5ici8+DQpBbmFsaXN0YSBkZSBTb2Z0d2FyZQ0KQXZpc28gTGVn
YWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1l
ci5odG1sPg0K

