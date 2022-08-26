Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426975A2799
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:20:20 +0200 (CEST)
Received: from localhost ([::1]:39852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYJu-0003Nk-QI
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1oRYFV-0007T7-Ci; Fri, 26 Aug 2022 08:15:45 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1oRYFO-0008Vw-6d; Fri, 26 Aug 2022 08:15:44 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4MDdzL3RV9z13MfG;
 Fri, 26 Aug 2022 20:13:50 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 26 Aug 2022 20:15:30 +0800
Received: from lhrpeml500005.china.huawei.com ([7.191.163.240]) by
 lhrpeml500005.china.huawei.com ([7.191.163.240]) with mapi id 15.01.2375.024; 
 Fri, 26 Aug 2022 13:15:28 +0100
To: Laszlo Ersek <lersek@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
CC: "imammedo@redhat.com" <imammedo@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Linuxarm <linuxarm@huawei.com>, "chenxiang (M)"
 <chenxiang66@hisilicon.com>, "Ard Biesheuvel (kernel.org address)"
 <ardb@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
Thread-Topic: [PATCH] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
Thread-Index: AQHYuJ5p23rvTq/DF0St1dy35YWrx63BBLQAgAAB6oCAABHCkA==
Date: Fri, 26 Aug 2022 12:15:28 +0000
Message-ID: <3ab1fd4d692949fc92668a14a15a42ff@huawei.com>
References: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
 <43c62060-7a5d-25cf-91a3-1c391d3a58f9@redhat.com>
 <ab43b53b-546a-4056-0e91-31691f716109@redhat.com>
In-Reply-To: <ab43b53b-546a-4056-0e91-31691f716109@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.195.32.71]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-devel@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFzemxvIEVyc2VrIFtt
YWlsdG86bGVyc2VrQHJlZGhhdC5jb21dDQo+IFNlbnQ6IDI2IEF1Z3VzdCAyMDIyIDEzOjA3DQo+
IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2Rp
QGh1YXdlaS5jb20+Ow0KPiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtYXJtQG5vbmdudS5v
cmcNCj4gQ2M6IGltYW1tZWRvQHJlZGhhdC5jb207IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsg
TGludXhhcm0NCj4gPGxpbnV4YXJtQGh1YXdlaS5jb20+OyBjaGVueGlhbmcgKE0pIDxjaGVueGlh
bmc2NkBoaXNpbGljb24uY29tPjsgQXJkDQo+IEJpZXNoZXV2ZWwgKGtlcm5lbC5vcmcgYWRkcmVz
cykgPGFyZGJAa2VybmVsLm9yZz47IEdlcmQgSG9mZm1hbm4NCj4gPGtyYXhlbEByZWRoYXQuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBmd19jZmc6IERvbid0IHNldCBjYWxsYmFja19vcGFx
dWUgTlVMTCBpbg0KPiBmd19jZmdfbW9kaWZ5X2J5dGVzX3JlYWQoKQ0KPiANCj4gK0FyZCArR2Vy
ZCwgb25lIHBvaW50ZXIgYXQgdGhlIGJvdHRvbQ0KPiANCj4gT24gMDgvMjYvMjIgMTM6NTksIExh
c3psbyBFcnNlayB3cm90ZToNCj4gPiBPbiAwOC8yNS8yMiAxODoxOCwgU2hhbWVlciBLb2xvdGh1
bSB3cm90ZToNCj4gPj4gSGkNCj4gPj4NCj4gPj4gT24gYXJtL3ZpcnQgcGxhdGZvcm0sIENoZW4g
WGlhbmcgcmVwb3J0ZWQgYSBHdWVzdCBjcmFzaCB3aGlsZQ0KPiA+PiBhdHRlbXB0aW5nIHRoZSBi
ZWxvdyBzdGVwcywNCj4gPj4NCj4gPj4gMS4gTGF1bmNoIHRoZSBHdWVzdCB3aXRoIG52ZGltbT1v
bg0KPiA+PiAyLiBIb3QtYWRkIGEgTlZESU1NIGRldg0KPiA+PiAzLiBSZWJvb3QNCj4gPj4gNC4g
R3Vlc3QgYm9vdHMgZmluZS4NCj4gPj4gNS4gUmVib290IGFnYWluLg0KPiA+PiA2LiBHdWVzdCBi
b290IGZhaWxzLg0KPiA+Pg0KPiA+PiBRRU1VX0VGSSByZXBvcnRzIHRoZSBiZWxvdyBlcnJvcjoN
Cj4gPj4gUHJvY2Vzc0NtZEFkZFBvaW50ZXI6IGludmFsaWQgcG9pbnRlciB2YWx1ZSBpbiAiZXRj
L2FjcGkvdGFibGVzIg0KPiA+PiBPblJvb3RCcmlkZ2VzQ29ubmVjdGVkOiBJbnN0YWxsQWNwaVRh
YmxlczogUHJvdG9jb2wgRXJyb3INCj4gPj4NCj4gPj4gRGVidWdnaW5nIHNob3dzIHRoYXQgb24g
Zmlyc3QgcmVib290KGFmdGVyIGhvdC1hZGRpbmcgTlZESU1NKSwNCj4gPj4gUWVtdSB1cGRhdGVz
IHRoZSBldGMvdGFibGUtbG9hZGVyIGxlbiwNCj4gPj4NCj4gPj4gcWVtdV9yYW1fcmVzaXplKCkN
Cj4gPj4gwqAgZndfY2ZnX21vZGlmeV9maWxlKCkNCj4gPj4gwqAgwqAgwqBmd19jZmdfbW9kaWZ5
X2J5dGVzX3JlYWQoKQ0KPiA+Pg0KPiA+PiBBbmQgaW4gZndfY2ZnX21vZGlmeV9ieXRlc19yZWFk
KCkgd2Ugc2V0IHRoZSAiY2FsbGJhY2tfb3BhcXVlIiBmb3INCj4gPj4gdGhlICJrZXkiIGVudHJ5
IHRvIE5VTEwuIEJlY2F1c2XCoG9mIHRoaXMsIG9uIHRoZSBzZWNvbmQgcmVib290LA0KPiA+PiB2
aXJ0X2FjcGlfYnVpbGRfdXBkYXRlKCkgaXMgY2FsbGVkIHdpdGggYSBOVUxMICJidWlsZF9zdGF0
ZSIgYW5kDQo+ID4+IHJldHVybnMgd2l0aG91dCB1cGRhdGluZyB0aGUgQUNQSSB0YWJsZXMuIFRo
aXMgc2VlbXMgdG8gYmUNCj4gPj4gdXBzZXR0aW5nIHRoZSBmaXJtd2FyZS4NCj4gPj4NCj4gPj4g
VG8gZml4IHRoaXMsIGRvbid0IGNoYW5nZSB0aGUgY2FsbGJhY2tfb3BhcXVlIGluDQo+IGZ3X2Nm
Z19tb2RpZnlfYnl0ZXNfcmVhZCgpLg0KPiA+Pg0KPiA+PiBSZXBvcnRlZC1ieTogY2hlbnhpYW5n
IDxjaGVueGlhbmc2NkBoaXNpbGljb24uY29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTaGFtZWVy
IEtvbG90aHVtDQo+IDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+DQo+ID4+
IC0tLQ0KPiA+PiBJIGFtIHN0aWxsIG5vdCB2ZXJ5IGNvbnZpbmNlZCB0aGlzIGlzIHRoZSByb290
IGNhdXNlIG9mIHRoZSBpc3N1ZS4NCj4gPj4gVGhvdWdoIGl0IGxvb2tzIGxpa2Ugc2V0dGluZyBj
YWxsYmFja19vcGFxdWUgdG8gTlVMTCB3aGlsZSB1cGRhdGluZw0KPiA+PiB0aGUgZmlsZSBzaXpl
IGlzIHdyb25nLCB3aGF0IHB1enpsZXMgbWUgaXMgdGhhdCBvbiB0aGUgc2Vjb25kIHJlYm9vdA0K
PiA+PiB3ZSBkb24ndCBoYXZlIGFueSBBQ1BJIHRhYmxlIHNpemUgY2hhbmdlcyBhbmQgaWRlYWxs
eSBmaXJtd2FyZSBzaG91bGQNCj4gPj4gc2VlIHRoZSB1cGRhdGVkIHRhYmxlcyBmcm9tIHRoZSBm
aXJzdCByZWJvb3QgaXRzZWxmLg0KPiA+Pg0KPiA+PiBQbGVhc2UgdGFrZSBhIGxvb2sgYW5kIGxl
dCBtZSBrbm93Lg0KPiA+Pg0KPiA+PiBUaGFua3MsDQo+ID4+IFNoYW1lZXINCj4gPj4NCj4gPj4g
LS0tDQo+ID4+ICBody9udnJhbS9md19jZmcuYyB8IDEgLQ0KPiA+PiAgMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2h3L252cmFtL2Z3X2NmZy5j
IGIvaHcvbnZyYW0vZndfY2ZnLmMNCj4gPj4gaW5kZXggZDYwNWYzZjQ1YS4uZGZlODQwNGMwMSAx
MDA2NDQNCj4gPj4gLS0tIGEvaHcvbnZyYW0vZndfY2ZnLmMNCj4gPj4gKysrIGIvaHcvbnZyYW0v
ZndfY2ZnLmMNCj4gPj4gQEAgLTcyOCw3ICs3MjgsNiBAQCBzdGF0aWMgdm9pZA0KPiAqZndfY2Zn
X21vZGlmeV9ieXRlc19yZWFkKEZXQ2ZnU3RhdGUgKnMsIHVpbnQxNl90IGtleSwNCj4gPj4gICAg
ICBwdHIgPSBzLT5lbnRyaWVzW2FyY2hdW2tleV0uZGF0YTsNCj4gPj4gICAgICBzLT5lbnRyaWVz
W2FyY2hdW2tleV0uZGF0YSA9IGRhdGE7DQo+ID4+ICAgICAgcy0+ZW50cmllc1thcmNoXVtrZXld
LmxlbiA9IGxlbjsNCj4gPj4gLSAgICBzLT5lbnRyaWVzW2FyY2hdW2tleV0uY2FsbGJhY2tfb3Bh
cXVlID0gTlVMTDsNCj4gPj4gICAgICBzLT5lbnRyaWVzW2FyY2hdW2tleV0uYWxsb3dfd3JpdGUg
PSBmYWxzZTsNCj4gPj4NCj4gPj4gICAgICByZXR1cm4gcHRyOw0KPiA+Pg0KPiA+DQo+ID4gSSB2
YWd1ZWx5IHJlY2FsbCBzZWVpbmcgdGhlIHNhbWUgaXNzdWUgcmVwb3J0IHllYXJzIGFnbyAoYWxz
byBpbg0KPiA+IHJlbGF0aW9uIHRvIGhvdC1hZGRpbmcgTlZESU1NKS4gSG93ZXZlciwgSSBoYXZl
IG5vIGNhcGFjaXR5IHRvDQo+ID4gcGFydGljaXBhdGUgaW4gdGhlIGRpc2N1c3Npb24uIE1ha2lu
ZyB0aGlzIHJlbWFyayBqdXN0IGZvciBjbGFyaXR5Lg0KPiANCj4gVGhlIGVhcmxpZXIgcmVwb3J0
IEkndmUgaGFkIGluIG1pbmQgd2FzIGZyb20gU2hhbWVlciBhcyB3ZWxsOg0KPiANCj4gaHR0cDov
L21pZC5tYWlsLWFyY2hpdmUuY29tLzVGQzMxNjNDRkQzMEMyNDZBQkFBOTk5NTRBMjM4RkE4M0Yz
Rg0KPiBCMzI4QGxocmVtbDUyNC1tYnMuY2hpbmEuaHVhd2VpLmNvbQ0KDQpSaWdodC4gVGhhdCB3
YXMgYSBzbGlnaHRseSBkaWZmZXJlbnQgaXNzdWUgdGhvdWdoLiBJdCB3YXMgYmFzaWNhbGx5IEFD
UEkgdGFibGUgc2l6ZSBub3QNCmdldHRpbmcgdXBkYXRlZCBvbiB0aGUgZmlyc3QgcmVib290IG9m
IEd1ZXN0IGFmdGVyIHdlIGhvdC1hZGQgTlZESU1NIGRldi4gVGhlIGVycm9yDQpmcm9tIGZpcm13
YXJlIHdhcyBkaWZmZXJlbnQgaW4gdGhhdCBjYXNlLA0KDQpQcm9jZXNzQ21kQWRkQ2hlY2tzdW06
IGludmFsaWQgY2hlY2tzdW0gcmFuZ2UgaW4gImV0Yy9hY3BpL3RhYmxlcyINCk9uUm9vdEJyaWRn
ZXNDb25uZWN0ZWQ6IEluc3RhbGxBY3BpVGFibGVzOiBQcm90b2NvbCBFcnJvcg0KDQpBbmQgaXQg
d2FzIGZpeGVkIHdpdGggdGhpcyBzZXJpZXMgaGVyZSwNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9xZW11LWRldmVsL2NvdmVyLzIwMjAwNDAzMTAxODI3LjMwNjY0LTEtc2hh
bWVlcmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tLw0KDQpUaGUgY3VycmVudCBpc3N1ZSBv
bmx5IGhhcHBlbnMgb24gdGhlIHNlY29uZCByZWJvb3Qgb2YgdGhlIEd1ZXN0IGFzIGRlc2NyaWJl
ZCBpbiANCnRoZSBzdGVwcyBhYm92ZS4NCg0KVGhhbmtzLA0KU2hhbWVlcg0KDQo=

