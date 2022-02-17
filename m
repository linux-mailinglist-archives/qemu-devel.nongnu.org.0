Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764274BA2A1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:12:07 +0100 (CET)
Received: from localhost ([::1]:37518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKhVu-0007BD-4a
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nKgCI-0007lo-Fh; Thu, 17 Feb 2022 07:47:49 -0500
Received: from [187.72.171.209] (port=34490 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nKgCD-0001Sp-9z; Thu, 17 Feb 2022 07:47:44 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 17 Feb 2022 09:46:05 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7BA5A8001F1;
 Thu, 17 Feb 2022 09:46:04 -0300 (-03)
Message-ID: <178c1bc8-49c8-2c03-8890-34c85d1b83f7@eldorado.org.br>
Date: Thu, 17 Feb 2022 09:46:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 3/3] tests/tcg/ppc64le: Use vector types instead of
 __int128
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
 <20220208203145.3844662-4-matheus.ferst@eldorado.org.br>
 <1646dc52-cab4-baa6-aac3-9c16b4f9d7d9@kaod.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <1646dc52-cab4-baa6-aac3-9c16b4f9d7d9@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-OriginalArrivalTime: 17 Feb 2022 12:46:05.0054 (UTC)
 FILETIME=[53B521E0:01D823FC]
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
Cc: danielhb413@gmail.com, alex.bennee@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMTcvMDIvMjAyMiAwNTowOSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+IE9uIDIv
OC8yMiAyMTozMSwgbWF0aGV1cy5mZXJzdEBlbGRvcmFkby5vcmcuYnIgd3JvdGU6DQo+PiBG
cm9tOiBNYXRoZXVzIEZlcnN0IDxtYXRoZXVzLmZlcnN0QGVsZG9yYWRvLm9yZy5icj4NCj4+
DQo+PiBMTFZNL0NsYW5nIGRvZXNuJ3QgbGlrZSBpbmxpbmUgYXNtIHdpdGggX19pbnQxMjgs
IHVzZSBhIHZlY3RvciB0eXBlDQo+PiBpbnN0ZWFkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IE1hdGhldXMgRmVyc3QgPG1hdGhldXMuZmVyc3RAZWxkb3JhZG8ub3JnLmJyPg0KPj4gLS0t
DQo+PiBBbHRlcm5hdGl2ZWx5LCB3ZSBjb3VsZCBwYXNzIFZTUiB2YWx1ZXMgaW4gR1BSIHBh
aXJzLCBhcyB3ZSBkaWQgaW4NCj4+IHRlc3RzL3RjZy9wcGM2NGxlL25vbl9zaWduYWxsaW5n
X3hzY3YuYw0KPj4gLS0tDQo+PiDCoCB0ZXN0cy90Y2cvcHBjNjRsZS9iY2RzdWIuYyB8IDky
ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL3RjZy9wcGM2NGxlL2JjZHN1Yi5jIGIvdGVzdHMvdGNnL3BwYzY0
bGUvYmNkc3ViLmMNCj4+IGluZGV4IDhjMTg4Y2FlNmQuLjE3NDAzZGFmMjIgMTAwNjQ0DQo+
PiAtLS0gYS90ZXN0cy90Y2cvcHBjNjRsZS9iY2RzdWIuYw0KPj4gKysrIGIvdGVzdHMvdGNn
L3BwYzY0bGUvYmNkc3ViLmMNCj4+IEBAIC0xLDYgKzEsNyBAQA0KPj4gwqAgI2luY2x1ZGUg
PGFzc2VydC5oPg0KPj4gwqAgI2luY2x1ZGUgPHVuaXN0ZC5oPg0KPj4gwqAgI2luY2x1ZGUg
PHNpZ25hbC5oPg0KPj4gKyNpbmNsdWRlIDxhbHRpdmVjLmg+DQo+Pg0KPj4gwqAgI2RlZmlu
ZSBDUkZfTFTCoCAoMSA8PCAzKQ0KPj4gwqAgI2RlZmluZSBDUkZfR1TCoCAoMSA8PCAyKQ0K
Pj4gQEAgLTgsNiArOSwxNiBAQA0KPj4gwqAgI2RlZmluZSBDUkZfU0/CoCAoMSA8PCAwKQ0K
Pj4gwqAgI2RlZmluZSBVTkRFRsKgwqAgMA0KPj4NCj4+ICsjaWZkZWYgX19MSVRUTEVfRU5E
SUFOX18NCj4gDQo+IFNob3VsZG4ndCB3ZSBiZSB1c2luZyA6DQo+IA0KPiAjaWYgQllURV9P
UkRFUiA9PSBMSVRUTEVfRU5ESUFODQo+IA0KPiBpbnN0ZWFkID8NCj4gDQoNCkkgZ3Vlc3Mg
aXQgaXMgYmV0dGVyLCBJJ2xsIHNlbmQgYSB2Mi4NCg0KVGhhbmtzLA0KTWF0aGV1cyBLLiBG
ZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETyA8aHR0cDovL3d3dy5lbGRv
cmFkby5vcmcuYnIvPg0KQW5hbGlzdGEgZGUgU29mdHdhcmUNCkF2aXNvIExlZ2FsIC0gRGlz
Y2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rpc2NsYWltZXIuaHRtbD4N
Cg==

