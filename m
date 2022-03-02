Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA64CAF41
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:00:00 +0100 (CET)
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPV8h-0006jJ-Dr
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 14:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPV5n-0005oo-BT; Wed, 02 Mar 2022 14:56:59 -0500
Received: from [187.72.171.209] (port=7375 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPV5j-0004Jq-S3; Wed, 02 Mar 2022 14:56:57 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 2 Mar 2022 16:56:49 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 321CA800066;
 Wed,  2 Mar 2022 16:56:49 -0300 (-03)
Message-ID: <295ae767-277c-589f-51e2-ff5401a15a79@eldorado.org.br>
Date: Wed, 2 Mar 2022 16:56:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 00/49] target/ppc: PowerISA Vector/VSX instruction batch
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <962c99fa-07a4-d8d6-1c14-534ddcfc6b52@kaod.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <962c99fa-07a4-d8d6-1c14-534ddcfc6b52@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 02 Mar 2022 19:56:49.0827 (UTC)
 FILETIME=[A7C34730:01D82E6F]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMDEvMDMvMjAyMiAwNToyOSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+IE9uIDIv
MjUvMjIgMjI6MDgsIG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyIHdyb3RlOg0KPj4g
RnJvbTogTWF0aGV1cyBGZXJzdCA8bWF0aGV1cy5mZXJzdEBlbGRvcmFkby5vcmcuYnI+DQo+
Pg0KPj4gVGhpcyBwYXRjaCBzZXJpZXMgaW1wbGVtZW50cyA1IG1pc3NpbmcgaW5zdHJ1Y3Rp
b25zIGZyb20gUG93ZXJJU0EgdjMuMA0KPj4gYW5kIDU4IG5ldyBpbnN0cnVjdGlvbnMgZnJv
bSBQb3dlcklTQSB2My4xLCBtb3ZpbmcgODcgb3RoZXIgaW5zdHJ1Y3Rpb25zDQo+PiB0byBk
ZWNvZGV0cmVlIGFsb25nIHRoZSB3YXkuDQo+Pg0KPj4gUGF0Y2hlcyB3aXRob3V0IHJldmll
dzogNCwgMjQsIDI2LCAyNywgMzQsIDM1LCAzOCwgNDAsIDQ0LTQ2DQo+IA0KPiBJIHRoaW5r
IHdlIGFyZSBkb25lLg0KPiANCj4gQXBwbGllZCB0byBwcGMtNy4wLg0KPiANCj4gVGhhbmtz
LA0KPiANCj4gQy4NCg0KV2Ugc3RpbGwgaGFkIHNvbWUgbWlub3IgZml4ZXMsIGJ1dCBJIGd1
ZXNzIHdlIGNhbiBzZW5kIGluIGEgZm9sbG93LXVwIHBhdGNoLg0KDQpUaGFua3MsDQpNYXRo
ZXVzIEsuIEZlcnN0DQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPIDxodHRwOi8v
d3d3LmVsZG9yYWRvLm9yZy5ici8+DQpBbmFsaXN0YSBkZSBTb2Z0d2FyZQ0KQXZpc28gTGVn
YWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1l
ci5odG1sPg0K

