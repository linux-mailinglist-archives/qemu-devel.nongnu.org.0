Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3342ED21
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:07:12 +0200 (CEST)
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJBG-00026n-Qi
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <limingwang@huawei.com>)
 id 1mbIxH-0007PU-Kt; Fri, 15 Oct 2021 04:52:43 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <limingwang@huawei.com>)
 id 1mbIx2-0000Mv-C1; Fri, 15 Oct 2021 04:52:43 -0400
Received: from dggeme708-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HW0NC15wMzWYsP;
 Fri, 15 Oct 2021 16:50:35 +0800 (CST)
Received: from dggeme703-chm.china.huawei.com (10.1.199.99) by
 dggeme708-chm.china.huawei.com (10.1.199.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 15 Oct 2021 16:52:14 +0800
Received: from dggeme703-chm.china.huawei.com ([10.9.48.230]) by
 dggeme703-chm.china.huawei.com ([10.9.48.230]) with mapi id 15.01.2308.008;
 Fri, 15 Oct 2021 16:52:14 +0800
From: "limingwang (A)" <limingwang@huawei.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: RE: [PATCH v2] hw/riscv: virt: bugfix the memory-backend-file command
 is invalid
Thread-Topic: [PATCH v2] hw/riscv: virt: bugfix the memory-backend-file
 command is invalid
Thread-Index: AQHXvwrdL24DD0plLUas3imNvF1pl6vQfF6AgANHiTA=
Date: Fri, 15 Oct 2021 08:52:14 +0000
Message-ID: <c4c6cc03d1c6459ea036c08ae30806a5@huawei.com>
References: <20211012014501.24996-1-limingwang@huawei.com>
 <CAEUhbmX=A4LPgzNgNPcxzzg=veU0=3vXyZQrwikxMFvb_Rcxzw@mail.gmail.com>
In-Reply-To: <CAEUhbmX=A4LPgzNgNPcxzzg=veU0=3vXyZQrwikxMFvb_Rcxzw@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.17]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=limingwang@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jiangyifei <jiangyifei@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 "Fanliang \(EulerOS\)" <fanliang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Wubin \(H\)" <wu.wubin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQpPbiBXZWQsIE9jdCAxMywgMjAyMSBhdCAyMjo0MSBQTSBCaW4gTWVuZyA8YmluLm1lbmdAd2lu
ZHJpdmVyLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIE9jdCAxMiwgMjAyMSBhdCA5OjQ2IEFN
IE1pbmdXYW5nIExpIDxsaW1pbmd3YW5nQGh1YXdlaS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJv
bTogTWluZ3dhbmcgTGkgPGxpbWluZ3dhbmdAaHVhd2VpLmNvbT4NCj4gPg0KPiA+IFdoZW4gSSBz
dGFydCB0aGUgVk0gd2l0aCB0aGUgZm9sbG93aW5nIGNvbW1hbmQ6DQo+ID4gJCAuL3FlbXUtc3lz
dGVtLXJpc2N2NjQgLU0gdmlydCxhY2NlbD1rdm0gLW0gNDA5Nk0gLWNwdSBob3N0IC1ub2dyYXBo
aWMgXA0KPiA+ICAgICAtbmFtZSBndWVzdD1yaXNjdi1ndXNldCBcDQo+ID4gICAgIC1zbXAgMiBc
DQo+ID4gICAgIC1iaW9zIG5vbmUgXA0KPiA+ICAgICAta2VybmVsIC4vSW1hZ2UgXA0KPiA+ICAg
ICAtZHJpdmUgZmlsZT0uL2d1ZXN0LmltZyxmb3JtYXQ9cmF3LGlkPWhkMCBcDQo+ID4gICAgIC1k
ZXZpY2UgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIFwNCj4gPiAgICAgLWFwcGVuZCAicm9v
dD0vZGV2L3ZkYSBydyBjb25zb2xlPXR0eVMwIGVhcmx5Y29uPXNiaSIgXA0KPiA+ICAgICAtb2Jq
ZWN0DQo+IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9bWVtLHNpemU9NDA5Nk0sbWVtLXBhdGg9L2Rl
di9odWdlcGFnZXMsc2hhcmU9b24gXA0KPiA+ICAgICAtbnVtYSBub2RlLG1lbWRldj1tZW0gLW1l
bS1wcmVhbGxvYyBcDQo+ID4gICAgIC1jaGFyZGV2IHNvY2tldCxpZD1jaGFyMCxwYXRoPS9tbnQv
dmhvc3QtbmV0MCBcDQo+ID4gICAgIC1uZXRkZXYgdHlwZT12aG9zdC11c2VyLGlkPW15bmV0MSxj
aGFyZGV2PWNoYXIwLHZob3N0Zm9yY2UgXA0KPiA+ICAgICAtZGV2aWNlDQo+ID4gdmlydGlvLW5l
dC1wY2ksbWFjPTUyOjU0OjAwOjAwOjAwOjAxLG5ldGRldj1teW5ldDEsbXJnX3J4YnVmPW9uLGNz
dW09bw0KPiA+IG4sZ3Vlc3RfY3N1bT1vbixndWVzdF9lY249b24gXA0KPiA+DQo+ID4gVGhlbiwg
UUVNVSBkaXNwbGF5cyB0aGUgZm9sbG93aW5nIGVycm9yIGluZm9ybWF0aW9uOg0KPiA+IHFlbXUt
c3lzdGVtLXJpc2N2NjQ6IEZhaWxlZCBpbml0aWFsaXppbmcgdmhvc3QtdXNlciBtZW1vcnkgbWFw
LA0KPiA+IGNvbnNpZGVyIHVzaW5nIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtZmlsZSBzaGFyZT1v
bg0KPiANCj4gSSBzZWUgeW91ciBjb21tYW5kIGxpbmUgcGFyYW1ldGVycyBhbHJlYWR5IGNvbnRh
aW4gIi1vYmplY3QgbWVtb3J5LWJhY2tlbmQtZmlsZQ0KPiBzaGFyZT1vbiIsIHNvIHRoaXMgZXJy
b3IgbWVzc2FnZSBpcyBub3QgYWNjdXJhdGUuDQoNClFFTVUgdXNlcyB0aGlzIGNvbW1hbmQgdG8g
YWxsb2MgZmQgaW4gdGhlICJtZW1vcnlfcmVnaW9uX2luaXRfcmFtX2Zyb21fZmlsZSIgZnVuY3Rp
b24NCmFuZCBhc3NpZ25zIHRoZSB2YWx1ZSBvZiBmZCB0byBtci0+cmFtX2Jsb2NrLWZkLiBJZiB0
aGUgUUVNVSB1c2VzIHRoZSBkZWZhdWx0IG1lbW9yeSB0bw0KaW5pdGlhbGl6ZSB0aGUgc3lzdGVt
LCB0aGUgUUVNVSBjYW5ub3Qgb2J0YWluIHRoZSBmZCBpbiB0aGUgInZob3N0X3VzZXJfbWVtX3Nl
Y3Rpb25fZmlsdGVyIiANCmZ1bmN0aW9uIHdoZW4gaW5pdGlhbGl6aW5nIHRoZSB2aG9zdC11c2Vy
LiBBcyBhIHJlc3VsdCwgYW4gZXJyb3IgaXMgcmVwb3J0ZWQgaW4gdGhlICJ2aG9zdF91c2VyX2Zp
bGxfc2V0X21lbV90YWJsZV9tc2ciDQpmdW5jdGlvbi4NCg0KQmVjYXVzZSBvZiB0aGUgYWJvdmUg
YnVnLCBldmVuIGlmICItb2JqZWN0IG1lbW9yeS1iYWNrZW5kLWZpbGUgc2hhcmU9b24iIGlzIGFk
ZGVkIHRvIHRoZSBjb21tYW5kIGxpbmUsDQp0aGUgUUVNVSBzdGlsbCByZXBvcnRzIGFuIGVycm9y
Lg0KVGhpcyBwYXRjaCBjYW4gc29sdmUgdGhpcyBidWcuDQoNCj4gU2hvdWxkIHRoaXMgbWVzc2Fn
ZSBiZSBhbHRlcmVkIHRvIG1lbnRpb24gdGhpbmdzIGxpa2Ugd2hhdCB0aGlzIHBhdGNoIGRvZXM/
DQoNClRoYW5rcywgSSB3aWxsIHJld3JpdGUgdGhlIG1lc3NhZ2UgaW4gbmV4dCB2ZXJzaW9uLg0K
PiANCj4gPiBxZW11LXN5c3RlbS1yaXNjdjY0OiB2aG9zdF9zZXRfbWVtX3RhYmxlIGZhaWxlZDog
SW50ZXJydXB0ZWQgc3lzdGVtDQo+ID4gY2FsbCAoNCkNCj4gPiBxZW11LXN5c3RlbS1yaXNjdjY0
OiB1bmFibGUgdG8gc3RhcnQgdmhvc3QgbmV0OiA0OiBmYWxsaW5nIGJhY2sgb24NCj4gPiB1c2Vy
c3BhY2UgdmlydGlvDQo+ID4NCj4gPiBOb3RlIHRoYXQsIGJlZm9yZSBzdGFydGluZyB0aGUga3Zt
LWFjY2VsZWQgUUVNVSBWTSwgZm9sbG93aW5nDQo+ID4gdGVtcG9yYXJpbHkgdW5hY2NlcHRlZCBR
RU1VIHBhdGNoZXMgc2hvdWxkIGJlIHVzZWQ6DQo+ID4gaHR0cHM6Ly9saXN0cy5nbnUub3JnL2Fy
Y2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjEtMDgvbXNnMDI1MTYuaHRtbA0KPiA+DQo+ID4gVGhp
cyBlcnJvciB3YXMgbWFkZSBiYWNhdXNlIGRlZmF1bHQgbWFpbl9tZW0gaXMgdXNlZCB0byBiZSBy
ZWdpc3RlcmVkDQo+IA0KPiB0eXBvOiBiZWNhdXNlDQo+IA0KVGhhbmtzLg0KDQo+ID4gYXMgdGhl
IHN5c3RlbSBtZW1vcnksIG90aGVyIG1lbW9yeSBjYW5ub3QgYmUgaW5pdGlhbGl6ZWQuIFRoZXJl
Zm9yZSwNCj4gPiB0aGUgc3lzdGVtIG1lbW9yeSBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgdG8gdGhl
IG1hY2hpbmUtPnJhbSwgd2hpY2gNCj4gPiBjb25zaXN0cyBvZiB0aGUgZGVmYXVsdCBtYWluX21l
bSBhbmQgb3RoZXIgcG9zc2libGUgbWVtb3J5IHJlcXVpcmVkIGJ5DQo+ID4gYXBwbGljYXRpb25z
LCBzdWNoIGFzIHNoYXJlZCBodWdlcGFnZSBtZW1vcnkgaW4gRFBESy4NCj4gPiBBbHNvLCB0aGUg
bWMtPmRlZmF1bF9yYW1faWQgc2hvdWxkIGJlIHNldCB0byB0aGUgZGVmYXVsdCBtYWluX21lbSwN
Cj4gPiBzdWNoIGFzICJyaXNjdl92aXJ0X2JvYXJkLnJhbSIgZm9yIHRoZSB2aXJ0IG1hY2hpbmUu
DQo+ID4NCj4gDQo+IEhvdyBhYm91dCBjaGFuZ2luZyB0aGUgY29tbWl0IHRpdGxlIHRvOiAiVXNl
IG1hY2hpbmUtPnJhbSBhcyB0aGUgc3lzdGVtDQo+IG1lbW9yeSIgPz8NCj4gDQoNCkkgdGhpbmsg
aXQgaXMganVzdCBhIGJ1Z2ZpeC4NCg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pbmd3YW5nIExpIDxs
aW1pbmd3YW5nQGh1YXdlaS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWlmZWkgSmlhbmcgPGpp
YW5neWlmZWlAaHVhd2VpLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJhbmNpcyA8
YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPg0KPiA+IC0tLQ0KPiA+ICBody9yaXNjdi92aXJ0LmMg
fCA2ICsrLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L3Jpc2N2L3ZpcnQuYyBiL2h3L3Jpc2N2
L3ZpcnQuYyBpbmRleA0KPiA+IGVjMGNiNjliOGMuLmIzYjQzMWM4NDcgMTAwNjQ0DQo+ID4gLS0t
IGEvaHcvcmlzY3YvdmlydC5jDQo+ID4gKysrIGIvaHcvcmlzY3YvdmlydC5jDQo+ID4gQEAgLTc3
MSw3ICs3NzEsNiBAQCBzdGF0aWMgdm9pZCB2aXJ0X21hY2hpbmVfaW5pdChNYWNoaW5lU3RhdGUg
Km1hY2hpbmUpDQo+ID4gICAgICBjb25zdCBNZW1NYXBFbnRyeSAqbWVtbWFwID0gdmlydF9tZW1t
YXA7DQo+ID4gICAgICBSSVNDVlZpcnRTdGF0ZSAqcyA9IFJJU0NWX1ZJUlRfTUFDSElORShtYWNo
aW5lKTsNCj4gPiAgICAgIE1lbW9yeVJlZ2lvbiAqc3lzdGVtX21lbW9yeSA9IGdldF9zeXN0ZW1f
bWVtb3J5KCk7DQo+ID4gLSAgICBNZW1vcnlSZWdpb24gKm1haW5fbWVtID0gZ19uZXcoTWVtb3J5
UmVnaW9uLCAxKTsNCj4gPiAgICAgIE1lbW9yeVJlZ2lvbiAqbWFza19yb20gPSBnX25ldyhNZW1v
cnlSZWdpb24sIDEpOw0KPiA+ICAgICAgY2hhciAqcGxpY19oYXJ0X2NvbmZpZywgKnNvY19uYW1l
Ow0KPiA+ICAgICAgdGFyZ2V0X3Vsb25nIHN0YXJ0X2FkZHIgPSBtZW1tYXBbVklSVF9EUkFNXS5i
YXNlOyBAQCAtODkwLDEwDQo+ID4gKzg4OSw4IEBAIHN0YXRpYyB2b2lkIHZpcnRfbWFjaGluZV9p
bml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkNCj4gPiAgICAgIH0NCj4gPg0KPiA+ICAgICAgLyog
cmVnaXN0ZXIgc3lzdGVtIG1haW4gbWVtb3J5IChhY3R1YWwgUkFNKSAqLw0KPiA+IC0gICAgbWVt
b3J5X3JlZ2lvbl9pbml0X3JhbShtYWluX21lbSwgTlVMTCwgInJpc2N2X3ZpcnRfYm9hcmQucmFt
IiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFjaGluZS0+cmFtX3NpemUsICZl
cnJvcl9mYXRhbCk7DQo+ID4gICAgICBtZW1vcnlfcmVnaW9uX2FkZF9zdWJyZWdpb24oc3lzdGVt
X21lbW9yeSwNCj4gbWVtbWFwW1ZJUlRfRFJBTV0uYmFzZSwNCj4gPiAtICAgICAgICBtYWluX21l
bSk7DQo+ID4gKyAgICAgICAgbWFjaGluZS0+cmFtKTsNCj4gPg0KPiA+ICAgICAgLyogY3JlYXRl
IGRldmljZSB0cmVlICovDQo+ID4gICAgICBjcmVhdGVfZmR0KHMsIG1lbW1hcCwgbWFjaGluZS0+
cmFtX3NpemUsIG1hY2hpbmUtPmtlcm5lbF9jbWRsaW5lLA0KPiA+IEBAIC0xMDMyLDYgKzEwMjks
NyBAQCBzdGF0aWMgdm9pZCB2aXJ0X21hY2hpbmVfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqb2Ms
DQo+IHZvaWQgKmRhdGEpDQo+ID4gICAgICBtYy0+Y3B1X2luZGV4X3RvX2luc3RhbmNlX3Byb3Bz
ID0gcmlzY3ZfbnVtYV9jcHVfaW5kZXhfdG9fcHJvcHM7DQo+ID4gICAgICBtYy0+Z2V0X2RlZmF1
bHRfY3B1X25vZGVfaWQgPSByaXNjdl9udW1hX2dldF9kZWZhdWx0X2NwdV9ub2RlX2lkOw0KPiA+
ICAgICAgbWMtPm51bWFfbWVtX3N1cHBvcnRlZCA9IHRydWU7DQo+ID4gKyAgICBtYy0+ZGVmYXVs
dF9yYW1faWQgPSAicmlzY3ZfdmlydF9ib2FyZC5yYW0iOw0KPiA+DQo+ID4gICAgICBtYWNoaW5l
X2NsYXNzX2FsbG93X2R5bmFtaWNfc3lzYnVzX2RldihtYywgVFlQRV9SQU1GQl9ERVZJQ0UpOw0K
PiA+DQo+IA0KPiBSZWdhcmRzLA0KPiBCaW4NCg0K

