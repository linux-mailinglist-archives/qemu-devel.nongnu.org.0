Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC6A349DBD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 01:24:00 +0100 (CET)
Received: from localhost ([::1]:52678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPaGc-0001Ko-Lu
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 20:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changlm@chinatelecom.cn>)
 id 1lPaE9-0000ei-DO; Thu, 25 Mar 2021 20:21:25 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:40358
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changlm@chinatelecom.cn>)
 id 1lPaE1-0001Cr-9j; Thu, 25 Mar 2021 20:21:24 -0400
HMM_SOURCE_IP: 172.18.0.218:49557.1722634324
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.101.58?logid-fa6bcca755404a069c58392e9ff84f1a
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 809712800A0;
 Fri, 26 Mar 2021 08:21:01 +0800 (CST)
X-189-SAVE-TO-SEND: 71112636@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id fa6bcca755404a069c58392e9ff84f1a for
 nsoffer@redhat.com; Fri Mar 26 08:21:05 2021
X-Transaction-ID: fa6bcca755404a069c58392e9ff84f1a
X-filter-score: filter<0>
X-Real-From: changlm@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Date: Fri, 26 Mar 2021 08:20:56 +0800
From: ChangLimin <changlm@chinatelecom.cn>
To: "Nir Soffer" <nsoffer@redhat.com>, 
 "Benjamin Marzinski" <bmarzins@redhat.com>
Subject: Re: [PATCH V4] file-posix: allow -EBUSY error during ioctl(fd,
 BLKZEROOUT, range) on block
References: <2021032217253258728710@chinatelecom.cn>, 
 <0b01a688-f86b-0888-2c03-f4d55273b93f@redhat.com>, 
 <CAMRbyysT_s+AkskuAGvT7wXOQ+LaX3OkSYTo4UxtYKqE0cjBMg@mail.gmail.com>, 
 <2021032514064808224635@chinatelecom.cn>, 
 <CAMRbyyuuWLjKrCXAu5iRYSn5hV_0bytMy1JtjFuuU1aeFZVGqw@mail.gmail.com>
X-Priority: 3
X-GUID: 5FCBF415-A73F-48C5-B3D1-CE92A7EB7500
X-Has-Attach: no
X-Mailer: Foxmail 7.2.17.58[cn]
Mime-Version: 1.0
Message-ID: <2021032608205626965639@chinatelecom.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart307515656684_=----"
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=changlm@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 mreitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

------=_001_NextPart307515656684_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pk9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDg6MDcgQU0gQ2hhbmdMaW1pbiA8Y2hhbmdsbUBjaGlu
YXRlbGVjb20uY24+IHdyb3RlOg0KPj5PbiBXZWQsIE1hciAyNCwgMjAyMSBhdCA0OjUyIFBNIE1h
eCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+IHdyb3RlOg0KPj5PbiAyMi4wMy4yMSAxMDoyNSwg
Q2hhbmdMaW1pbiB3cm90ZToNCj4+PiBGb3IgTGludXggNS4xMC81LjExLCBxZW11IHdyaXRlIHpl
cm9zIHRvIGEgbXVsdGlwYXRoIGRldmljZSB1c2luZw0KPj4+IGlvY3RsKGZkLCBCTEtaRVJPT1VU
LCByYW5nZSkgd2l0aCBjYWNoZSBub25lIG9yIGRpcmVjdHN5bmMgcmV0dXJuIC1FQlVTWQ0KPj4+
IHBlcm1hbmVudGx5Lg0KPj4NCj4+U28gYXMgZmFyIGFzIEkgY2FuIHRyYWNrIGJhY2sgdGhlIGRp
c2N1c3Npb24sIEtldmluIGFza2VkIG9uIHYxIHdoeSB3ZeKAmWQgDQo+PnNldCBoYXNfd3JpdGVf
emVyb2VzIHRvIGZhbHNlLCBpLmUuIHdoZXRoZXIgdGhlIEVCVVNZIG1pZ2h0IG5vdCBnbyBhd2F5
IA0KPj5hdCBzb21lIHBvaW50LCBhbmQgaWYgaXQgZGlkLCB3aGV0aGVyIHdlIHNob3VsZG7igJl0
IHJldHJ5IEJMS1pFUk9PVVQgdGhlbi4NCj4+WW91IGhhdmVu4oCZdCBleHBsaWNpdGx5IHJlcGxp
ZWQgdG8gdGhhdCBxdWVzdGlvbiAoYXMgZmFyIGFzIEkgY2FuIHNlZSksIA0KPj5zbyBpdCBraW5k
IG9mIHN0aWxsIHN0YW5kcy4NCj4+DQo+PkltcGxpY2l0bHksIHRoZXJlIGFyZSB0d28gY29uZmxp
Y3RpbmcgYW5zd2VycyBpbiB0aGlzIHBhdGNoOiBPbiBvbmUgDQo+PmhhbmQsIHRoZSBjb21taXQg
bWVzc2FnZSBzYXlzIOKAnHBlcm1hbmVudGx54oCdLCBhbmQgdGhpcyBpcyB3aGF0IHlvdSB0b2xk
IA0KPj5OaXIgYXMgYSByZWFsaXN0aWMgY2FzZSB3aGVyZSB0aGlzIGNhbiBvY2N1ci4gDQo+DQo+
Rm9yIExpbnV4IDUuMTAvNS4xMSwgdGhlIEVCVVNZIGlzIHBlcm1hbmVudGx5LCB0aGUgcmVwcm9k
dWNlIHN0ZXAgaXMgYmVsb3cuIA0KPkZvciBvdGhlciBMaW51eCB2ZXJzaW9uLCB0aGUgRUJVU1kg
bWF5IGJlIHRlbXBvcmFyeS4gDQo+QmVjYXVzZSAgTGludXggNS4xMC81LjExIGlzIG5vdCB1c2Vk
IHdpZGVseSwgc28gZG8gbm90IHNldCBoYXNfd3JpdGVfemVyb2VzIHRvIGZhbHNlLg0KPg0KPj5J
J20gYWZyYWlkIENoYW5nTGltaW4gZGlkIG5vdCBhbnN3ZXIgbXkgcXVlc3Rpb24uIEknbSBsb29r
aW5nIGZvciByZWFsDQo+PndvcmxkIHVzZWQgY2FzZSB3aGVuIHFlbXUgY2Fubm90IHdyaXRlIHpl
cm9zIHRvIG11bHRpcGF0aCBkZXZpY2UsIHdoZW4NCj4+bm9ib2R5IGVsc2UgaXMgdXNpbmcgdGhl
IGRldmljZS4NCj4+DQo+PkkgdHJpZWQgdG8gcmVwcm9kdWNlIHRoaXMgb24gRmVkb3JhIChrZXJu
ZWwgNS4xMCkgd2l0aCBxZW11LWltZyBjb252ZXJ0LA0KPj5vbmNlIHdpdGggYSBtdWx0aXBhdGgg
ZGV2aWNlLCBhbmQgb25jZSB3aXRoIGxvZ2ljYWwgdm9sdW1lIG9uIGEgdmcgY3JlYXRlZA0KPj5v
biB0aGUgbXVsdGlwYXRoIGRldmljZSwgYW5kIEkgY291bGQgbm90IHJlcHJvZHVjZSB0aGlzIGlz
c3VlLg0KPg0KPlRoZSBmb2xsb3dpbmcgaXMgc3RlcHMgdG8gcmVwcm9kdWN0IHRoZSBpc3N1ZSBv
biBGZWRvcmEgMzQuDQo+DQo+IyB1bmFtZSAtYQ0KPkxpbnV4IGZlZG9yYS0zNCA1LjExLjMtMzAw
LmZjMzQueDg2XzY0ICMxIFNNUCBUaHUgTWFyIDQgMTk6MDM6MTggVVRDIDIwMjEgeDg2XzY0IHg4
Nl82NCB4ODZfNjQgR05VL0xpbnV4DQo+DQo+SXMgdGhpcyB0aGUgbW9zdCByZWNlbnQga2VybmVs
PyBJIGhhdmUgNS4xMS43IGluIGZlZG9yYSAzMi4NCj4gDQo+DQo+IyBxZW11LWltZyAtVg0KPnFl
bXUtaW1nIHZlcnNpb24gNS4yLjAgKHFlbXUtNS4yLjAtNS5mYzM0LjEpDQo+DQo+MS4gIExvZ2lu
IGluIGFuIElTQ1NJIExVTiBjcmVhdGVkIHVzaW5nIHRhcmdldGNsaSBvbiB1YnVudHUgMjAuMDQN
Cj4jIGlzY3NpYWRtIC1tIGRpc2NvdmVyeSAtdCBzdCAtcCAxOTIuMTY5LjEuMTA5DQo+MTkyLjE2
OS4xLjEwOTozMjYwLDEgaXFuLjIwMDMtMDEub3JnLmxpbnV4LWlzY3NpOmxpby1sdjEwMA0KPg0K
PiMgaXNjc2lhZG0gLW0gbm9kZSAtbCAtVCBpcW4uMjAwMy0wMS5vcmcubGludXgtaXNjc2k6bGlv
LWx2MTAwDQo+IyBpc2NzaWFkbSAtbSBzZXNzaW9uDQo+dGNwOiBbMV0gMTkyLjE2OS4xLjEwOToz
MjYwLDEgaXFuLjIwMDMtMDEub3JnLmxpbnV4LWlzY3NpOmxpby1sdjEwMCAobm9uLWZsYXNoKQ0K
Pg0KPjIuIHN0YXJ0IG11bHRpcGF0aGQgc2VydmljZQ0KPiMgbXBhdGhjb25mIC0tZW5hYmxlDQo+
IyBzeXN0ZW1jdGwgc3RhcnQgbXVsdGlwYXRoZA0KPg0KPjMuICBhZGQgbXVsdGlwYXRoIHBhdGgN
Cj4jIG11bHRpcGF0aCAtYSBgL2xpYi91ZGV2L3Njc2lfaWQgLWcgL2Rldi9zZGJgICAgIyBzZGIg
bWVhbnMgdGhlIElTQ1NJIExVTg0KPnd3aWQgJzM2MDAxNDA1Yjc2ODU2ZTQ4MTZiNDhiOTljNmE3
N2RlMycgYWRkZWQNCj4NCj4jIG11bHRpcGF0aGQgYWRkIHBhdGggL2Rldi9zZGINCj5vaw0KPg0K
PiMgbXVsdGlwYXRoIC1sbCAgICAgIyAvZGV2L2RtLTEgaXMgdGhlIG11bHRpcGF0aCBkZXZpY2Ug
YmFzZWQgb24gL2Rldi9zZGINCj5tcGF0aGEgKDM2MDAxNDA1YmViZmMzYTA1MjI1NDFjZGEzMDIy
MGRiOSkgZG0tMSBMSU8tT1JHLGx2MTAyDQo+c2l6ZT0xLjBHIGZlYXR1cmVzPScwJyBod2hhbmRs
ZXI9JzEgYWx1YScgd3A9cncNCj5gLSstIHBvbGljeT0nc2VydmljZS10aW1lIDAnIHByaW89NTAg
c3RhdHVzPWFjdGl2ZQ0KPiAgYC0gNTowOjA6MCAgc2RkICA4OjQ4ICAgYWN0aXZlIHJlYWR5IHJ1
bm5pbmcNCj4NCj5Zb3UgYXJlIHVzaW5nIHVzZXJfZnJpZW5kbHlfbmFtZXMgd2hpY2ggaXMgKHNh
ZGx5KSB0aGUgZGVmYXVsdC4NCj5CdXQgSSBkb24ndCB0aGluayBpdCBzaG91bGQgbWF0dGVyLg0K
Pg0KPjQuIHFlbXUtaW1nIHJldHVybiBFQlVTWSBib3RoIHRvIGRtLTEgYW5kIHNkYg0KPiMgd2dl
dCBodHRwOi8vZG93bmxvYWQuY2lycm9zLWNsb3VkLm5ldC8wLjQuMC9jaXJyb3MtMC40LjAteDg2
XzY0LWRpc2suaW1nDQo+IyBxZW11LWltZyBjb252ZXJ0IC1PIHJhdyAtdCBub25lIGNpcnJvcy0w
LjQuMC14ODZfNjQtZGlzay5pbWcgL2Rldi9kbS0xDQo+cWVtdS1pbWc6IGVycm9yIHdoaWxlIHdy
aXRpbmcgYXQgYnl0ZSAwOiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeQ0KPg0KPiMgcWVtdS1pbWcg
Y29udmVydCAtTyByYXcgLXQgbm9uZSBjaXJyb3MtMC40LjAteDg2XzY0LWRpc2suaW1nIC9kZXYv
c2RiDQo+cWVtdS1pbWc6IGVycm9yIHdoaWxlIHdyaXRpbmcgYXQgYnl0ZSAwOiBEZXZpY2Ugb3Ig
cmVzb3VyY2UgYnVzeQ0KPg0KPjUuIGJsa2Rpc2NhcmQgYWxzbyByZXR1cm4gRUJVU1kgIGJvdGgg
dG8gZG0tMSBhbmQgc2RiDQo+IyBibGtkaXNjYXJkIC1vIDAgLWwgNDA5NiAvZGV2L2RtLTENCj5i
bGtkaXNjYXJkOiBjYW5ub3Qgb3BlbiAvZGV2L2RtLTE6IERldmljZSBvciByZXNvdXJjZSBidXN5
DQo+DQo+IyBibGtkaXNjYXJkIC1vIDAgLWwgNDA5NiAvZGV2L3NkYg0KPmJsa2Rpc2NhcmQ6IGNh
bm5vdCBvcGVuIC9kZXYvc2RiOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+DQo+Ni4gZGQg
d3JpdGUgemVybyBpcyBnb29kLCBiZWNhdXNlIGl0IGRvZXMgbm90IHVzZSBibGtkaXNjYXJkDQo+
IyBkZCBpZj0vZGV2L3plcm8gb2Y9L2Rldi9kbS0xIGJzPTFNIGNvdW50PTEwMCBvZmxhZz1kaXJl
Y3QgDQo+MTAwKzAgcmVjb3JkcyBpbg0KPjEwMCswIHJlY29yZHMgb3V0DQo+MTA0ODU3NjAwIGJ5
dGVzICgxMDUgTUIsIDEwMCBNaUIpIGNvcGllZCwgMi4zMzYyMyBzLCA0NC45IE1CL3MNCj4NCj43
LiBUaGUgTFVOIHNob3VsZCBzdXBwb3J0IGJsa2Rpc2NhcmQgZmVhdHVyZSwgb3RoZXJ3aXNlIGl0
IHdpbGwgbm90IHdyaXRlIHplcm8gDQo+d2l0aCAgaW9jdGwoZmQsIEJMS1pFUk9PVVQsIHJhbmdl
KSANCj4NCj5UaGFua3MhDQo+DQo+SSBjb3VsZCBub3QgcmVwcm9kdWNlIHRoaXMgd2l0aCBrZXJu
ZWwgNS4xMCwgYnV0IG5vdyBJJ20gbm8gNS4xMToNCj4jIHVuYW1lIC1yDQo+NS4xMS43LTEwMC5m
YzMyLng4Nl82NA0KPg0KPiMgcWVtdS1pbWcgLS12ZXJzaW9uDQo+cWVtdS1pbWcgdmVyc2lvbiA1
LjIuMCAocWVtdS01LjIuMC02LmZjMzIuMSkNCj5Db3B5cmlnaHQgKGMpIDIwMDMtMjAyMCBGYWJy
aWNlIEJlbGxhcmQgYW5kIHRoZSBRRU1VIFByb2plY3QgZGV2ZWxvcGVycw0KPg0KPiMgY2F0IC9l
dGMvbXVsdGlwYXRoLmNvbmYNCj5kZWZhdWx0cyB7DQo+dXNlcl9mcmllbmRseV9uYW1lcyBubw0K
PmZpbmRfbXVsdGlwYXRocyBubw0KPn0NCj4NCj5ibGFja2xpc3RfZXhjZXB0aW9ucyB7DQo+ICAg
ICAgICBwcm9wZXJ0eSAiKFNDU0lfSURFTlRffElEX1dXTikiDQo+fQ0KPg0KPmJsYWNrbGlzdCB7
DQo+fQ0KPg0KPiMgbXVsdGlwYXRoIC1sbCAzNjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJhNjkwMTA5
OWMNCj4zNjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJhNjkwMTA5OWMgZG0tOCBMSU8tT1JHLDMtMDkN
Cj5zaXplPTYuMEcgZmVhdHVyZXM9JzAnIGh3aGFuZGxlcj0nMSBhbHVhJyB3cD1ydw0KPmAtKy0g
cG9saWN5PSdzZXJ2aWNlLXRpbWUgMCcgcHJpbz01MCBzdGF0dXM9YWN0aXZlDQo+ICBgLSAxOjA6
MDo5IHNkayAgICAgODoxNjAgYWN0aXZlIHJlYWR5IHJ1bm5pbmcNCj4NCj4kIGxzYmxrIC9kZXYv
c2RrDQo+TkFNRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFKOk1JTiBSTSBTSVpF
IFJPIFRZUEUgIE1PVU5UUE9JTlQNCj5zZGsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDg6MTYwICAwICAgNkcgIDAgZGlzayAgDQo+4pSU4pSAMzYwMDE0MDVlODg0YWI4ZmY0YjQ0
ZmRiYTY5MDEwOTljIDI1MzoxMyAgIDAgICA2RyAgMCBtcGF0aCANCj4NCj4kIHZpcnQtYnVpbGRl
ciBmZWRvcmEtMzIgLW8gZGlzay5pbWcNCj5bICAgMi45XSBEb3dubG9hZGluZzogaHR0cDovL2J1
aWxkZXIubGliZ3Vlc3Rmcy5vcmcvZmVkb3JhLTMyLnh6DQo+WyAgIDMuOF0gUGxhbm5pbmcgaG93
IHRvIGJ1aWxkIHRoaXMgaW1hZ2UNCj5bICAgMy44XSBVbmNvbXByZXNzaW5nDQo+WyAgMTEuMV0g
T3BlbmluZyB0aGUgbmV3IGRpc2sNCj5bICAxNi4xXSBTZXR0aW5nIGEgcmFuZG9tIHNlZWQNCj5b
ICAxNi4xXSBTZXR0aW5nIHBhc3N3b3Jkcw0KPnZpcnQtYnVpbGRlcjogU2V0dGluZyByYW5kb20g
cGFzc3dvcmQgb2Ygcm9vdCB0byBUY2lrUXFSeEFhSXFTMWtGDQo+WyAgMTcuMF0gRmluaXNoaW5n
IG9mZg0KPiAgICAgICAgICAgICAgICAgICBPdXRwdXQgZmlsZTogZGlzay5pbWcNCj4gICAgICAg
ICAgICAgICAgICAgT3V0cHV0IHNpemU6IDYuMEcNCj4gICAgICAgICAgICAgICAgIE91dHB1dCBm
b3JtYXQ6IHJhdw0KPiAgICAgICAgICAgIFRvdGFsIHVzYWJsZSBzcGFjZTogNS40Rw0KPiAgICAg
ICAgICAgICAgICAgICAgRnJlZSBzcGFjZTogNC4wRyAoNzQlKQ0KPg0KPiQgcWVtdS1pbWcgaW5m
byBkaXNrLmltZw0KPmltYWdlOiBkaXNrLmltZw0KPmZpbGUgZm9ybWF0OiByYXcNCj52aXJ0dWFs
IHNpemU6IDYgR2lCICg2NDQyNDUwOTQ0IGJ5dGVzKQ0KPmRpc2sgc2l6ZTogMS4yOSBHaUINCj4N
Cj4jIHFlbXUtaW1nIGNvbnZlcnQgLXAgLWYgcmF3IC1PIHJhdyAtdCBub25lIC1UIG5vbmUgZGlz
ay5pbWcgL2Rldi9tYXBwZXIvMzYwMDE0MDVlODg0YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljDQo+ICAg
ICgxMDAuMDAvMTAwJSkNCj4NCj5Xb3Jrcy4NCj4NCj4jIGxzYmxrIC9kZXYvc2RrDQo+TkFNRSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFKOk1JTiBSTSAgU0laRSBSTyBUWVBF
ICBNT1VOVFBPSU5UDQo+c2RrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA4
OjE2MCAgMCAgICA2RyAgMCBkaXNrICANCj7ilJTilIAzNjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJh
NjkwMTA5OWMgICAgMjUzOjEzICAgMCAgICA2RyAgMCBtcGF0aCANCj4gIOKUnOKUgDM2MDAxNDA1
ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzEgMjUzOjE0ICAgMCAgICAxTSAgMCBwYXJ0ICANCj4g
IOKUnOKUgDM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzIgMjUzOjE1ICAgMCAgICAx
RyAgMCBwYXJ0ICANCj4gIOKUnOKUgDM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzMg
MjUzOjE2ICAgMCAgNjE1TSAgMCBwYXJ0ICANCj4gIOKUlOKUgDM2MDAxNDA1ZTg4NGFiOGZmNGI0
NGZkYmE2OTAxMDk5YzQgMjUzOjE3ICAgMCAgNC40RyAgMCBwYXJ0ICANCj4NCj4jIHFlbXUtaW1n
IGNvbnZlcnQgLXAgLWYgcmF3IC1PIHJhdyAtdCBub25lIC1UIG5vbmUgZGlzay5pbWcgL2Rldi9t
YXBwZXIvMzYwMDE0MDVlODg0YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljDQo+ICAgICgxMDAuMDAvMTAw
JSkNCj4NCj5Xb3Jrcywgd2lwaW5nIHRoZSBwYXJ0aXRpb25zLg0KPg0KPiMgbW91bnQgL2Rldi9t
YXBwZXIvMzYwMDE0MDVlODg0YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljNCAvdG1wL21udA0KPg0KPiMg
bW91bnQgfCBncmVwIC9kZXYvbWFwcGVyLzM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5
YzQNCj4vZGV2L21hcHBlci8zNjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJhNjkwMTA5OWM0IG9uIC90
bXAvbW50IHR5cGUgeGZzIChydyxyZWxhdGltZSxzZWNsYWJlbCxhdHRyMixpbm9kZTY0LGxvZ2J1
ZnM9OCxsb2dic2l6ZT0zMmssbm9xdW90YSkNCj4NCj5UaGlzIGlzIGludmFsaWQgdXNlLCBjb252
ZXJ0aW5nIHRvIGRldmljZSB3aXRoIG1vdW50ZWQgZmlsZSBzeXN0ZW0sIGJ1dCBsZXQncyB0cnk6
DQo+DQo+IyBxZW11LWltZyBjb252ZXJ0IC1wIC1mIHJhdyAtTyByYXcgLXQgbm9uZSAtVCBub25l
IGRpc2suaW1nIC9kZXYvbWFwcGVyLzM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5Yw0K
PiAgICAoMTAwLjAwLzEwMCUpDQo+DQo+U3RpbGwgd29ya3M/IQ0KPg0KPiMgd2lwZWZzIC1hIC9k
ZXYvbWFwcGVyLzM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5Yw0KPndpcGVmczogZXJy
b3I6IC9kZXYvbWFwcGVyLzM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzogcHJvYmlu
ZyBpbml0aWFsaXphdGlvbiBmYWlsZWQ6IERldmljZSBvciByZXNvdXJjZSBidXN5DQo+DQo+IyBi
bGtkaXNjYXJkIC9kZXYvbWFwcGVyLzM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5Yw0K
Pg0KPldvcmtzLg0KPg0KPlRoaXMgdGhlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIExVTiBvbiB0aGUg
c2VydmVyIHNpZGU6DQo+DQo+ICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAiYWlvIjogZmFsc2UsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAiYWx1
YV90cGdzIjogWyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICANCj4gICAgICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICANCj4gICAgICAgICAgImFsdWFfYWNjZXNzX3N0YXRlIjogMCwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICAgImFsdWFfYWNjZXNz
X3N0YXR1cyI6IDAsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAg
ICAgImFsdWFfYWNjZXNzX3R5cGUiOiAzLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICANCj4gICAgICAgICAgImFsdWFfc3VwcG9ydF9hY3RpdmVfbm9ub3B0aW1pemVkIjogMSwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICAgImFsdWFfc3VwcG9ydF9hY3RpdmVfb3B0
aW1pemVkIjogMSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICAgImFsdWFfc3Vw
cG9ydF9vZmZsaW5lIjogMSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAg
ICAgICAgImFsdWFfc3VwcG9ydF9zdGFuZGJ5IjogMSwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICANCj4gICAgICAgICAgImFsdWFfc3VwcG9ydF90cmFuc2l0aW9uaW5nIjogMSwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICAgImFsdWFfc3VwcG9ydF91bmF2YWls
YWJsZSI6IDEsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICAgImFsdWFf
d3JpdGVfbWV0YWRhdGEiOiAwLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4g
ICAgICAgICAgImltcGxpY2l0X3RyYW5zX3NlY3MiOiAwLCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICANCj4gICAgICAgICAgIm5hbWUiOiAiZGVmYXVsdF90Z19wdF9ncCIsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICAgIm5vbm9wX2RlbGF5X21zZWNz
IjogMTAwLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICAgInBy
ZWZlcnJlZCI6IDAsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAN
Cj4gICAgICAgICAgInRnX3B0X2dwX2lkIjogMCwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICANCj4gICAgICAgICAgInRyYW5zX2RlbGF5X21zZWNzIjogMCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgIH0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICBdLCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICANCj4gICAgICAiYXR0cmlidXRlcyI6IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICANCj4gICAgICAgICJibG9ja19zaXplIjogNTEyLCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJlbXVsYXRlXzNwYyI6
IDEsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAg
ICJlbXVsYXRlX2NhdyI6IDEsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICANCj4gICAgICAgICJlbXVsYXRlX2RwbyI6IDEsICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJlbXVsYXRlX2Z1YV9yZWFkIjogMSwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJlbXVsYXRlX2Z1
YV93cml0ZSI6IDEsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAg
ICAgICJlbXVsYXRlX21vZGVsX2FsaWFzIjogMSwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICANCj4gICAgICAgICJlbXVsYXRlX3ByIjogMSwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJlbXVsYXRlX3Jlc3RfcmVvcmQiOiAw
LCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJlbXVsYXRl
X3RhcyI6IDEsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4g
ICAgICAgICJlbXVsYXRlX3RwdSI6IDEsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICANCj4gICAgICAgICJlbXVsYXRlX3Rwd3MiOiAxLCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJlbXVsYXRlX3VhX2ludGxja19j
dHJsIjogMCwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJlbXVs
YXRlX3dyaXRlX2NhY2hlIjogMSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAN
Cj4gICAgICAgICJlbmZvcmNlX3ByX2lzaWRzIjogMSwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICANCj4gICAgICAgICJmb3JjZV9wcl9hcHRwbCI6IDAsICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJpc19ub25yb3QiOiAwLCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJt
YXhfdW5tYXBfYmxvY2tfZGVzY19jb3VudCI6IDEsICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICANCj4gICAgICAgICJtYXhfdW5tYXBfbGJhX2NvdW50IjogODE5MiwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICANCj4gICAgICAgICJtYXhfd3JpdGVfc2FtZV9sZW4iOiA2NTMzNSwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJvcHRpbWFsX3NlY3Rv
cnMiOiAxNjM4NCwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAg
ICJwaV9wcm90X2Zvcm1hdCI6IDAsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICANCj4gICAgICAgICJwaV9wcm90X3R5cGUiOiAwLCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJwaV9wcm90X3ZlcmlmeSI6IDAsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJxdWV1ZV9kZXB0
aCI6IDEyOCwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAg
ICAgICJ1bm1hcF9ncmFudWxhcml0eSI6IDEsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICANCj4gICAgICAgICJ1bm1hcF9ncmFudWxhcml0eV9hbGlnbm1lbnQiOiAwLCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAgICJ1bm1hcF96ZXJvZXNfZGF0YSI6IDAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICB9LCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4g
ICAgICAiZGV2IjogIi90YXJnZXQvMy8wOSIsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICANCj4gICAgICAibmFtZSI6ICIzLTA5IiwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAicGx1Z2luIjogImZpbGVpbyIsICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgICAic2l6ZSI6
IDY0NDI0NTA5NDQsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAN
Cj4gICAgICAid3JpdGVfYmFjayI6IHRydWUsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICANCj4gICAgICAid3duIjogImU4ODRhYjhmLWY0YjQtNGZkYi1hNjkwLTEw
OTljMDcyYzg2ZCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gICAgfSwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4NCj5NYXliZSB0
aGlzIHVwc3RyZWFtIGNoYW5nZSBpcyBub3QgaW4gYWxsIGRvd25zdHJlYW0gNS4xMSBrZXJuZWxz
LCBvciA1LjExLjcNCj5hbHJlYWR5IGluY2x1ZGVzIHRoZSBmaXg/DQoNCkxpbnV4IDUuMTAuMjQv
NS4xMS43IGFscmVhZHkgbWVyZ2VkIHRoZSBmaXggb24gMjAyMS0wMy0xNyBieSBHcmVnIEtyb2Fo
LUhhcnRtYW4uDQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9oPWxpbnV4LTUuMTEueSZpZD03ZTA4MTU3OTc2
NTZmMDI5ZmFiMmVkYzMwOTQwNmNkZGY5MzFiOWQ4DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aD1saW51eC01
LjEwLnkmaWQ9ZDQ0Yzk3ODBlZDQwZGI4ODYyNmM5MzU0ODY4ZWFiNzIxNTljN2E3Zg0KDQojIGdp
dCBkZXNjcmliZSBkNDRjOTc4MGVkNDBkYjg4NjI2YzkzNTQ4NjhlYWI3MjE1OWM3YTdmDQp2NS4x
MC4yMy0xODQtZ2Q0NGM5NzgwZWQ0MA0KDQojIGdpdCBkZXNjcmliZSA3ZTA4MTU3OTc2NTZmMDI5
ZmFiMmVkYzMwOTQwNmNkZGY5MzFiOWQ4DQp2NS4xMS42LTE3OC1nN2UwODE1Nzk3NjU2DQoNCj5B
ZGRpbmcgQmVuLCBtYXliZSBoZSBoYWQgbW9yZSBpbnNpZ2h0IG9uIHRoZSBtdWx0aXBhdGggc2lk
ZS4NCj4NCj4+SWYgSSB1bmRlcnN0YW5kIHRoZSBrZXJuZWwgY2hhbmdlIGNvcnJlY3RseSwgdGhp
cyBjYW4gaGFwcGVuIHdoZW4gdGhlcmUgaXMNCj4+YSBtb3VudGVkIGZpbGUgc3lzdGVtIG9uIHRv
cCBvZiB0aGUgbXVsdGlwYXRoIGRldmljZS4gSSBkb24ndCB0aGluayB3ZSBoYXZlIA0KPj5hIHVz
ZSBjYXNlIHdoZW4gcWVtdSBhY2Nlc3NlcyBhIG11bHRpcGF0aCBkZXZpY2Ugd2hlbiB0aGUgZGV2
aWNlIGlzIHVzZWQNCj4+YnkgYSBmaWxlIHN5c3RlbSwgYnV0IG1heWJlIEkgbWlzc2VkIHNvbWV0
aGluZy4NCj4+IA0KPj5TbyB0aGF0IHRvIG1lIGltcGxpZXMgDQo+PnRoYXQgd2UgYWN0dWFsbHkg
c2hvdWxkIG5vdCByZXRyeSBCTEtaRVJPT1VULCBiZWNhdXNlIHRoZSBFQlVTWSB3aWxsIA0KPj5y
ZW1haW4sIGFuZCB0aGF0IGNvbmRpdGlvbiB3b27igJl0IGNoYW5nZSB3aGlsZSB0aGUgYmxvY2sg
ZGV2aWNlIGlzIGluIHVzZSANCj4+YnkgcWVtdS4NCj4+DQo+Pk9uIHRoZSBvdGhlciBoYW5kLCBp
biB0aGUgY29kZSwgeW91IGhhdmUgZGVjaWRlZCBub3QgdG8gcmVzZXQgDQo+Pmhhc193cml0ZV96
ZXJvZXMgdG8gZmFsc2UsIHNvIHRoZSBpbXBsZW1lbnRhdGlvbiB3aWxsIHJldHJ5Lg0KPj4NCj4+
RUJVU1kgaXMgdXN1YWxseSBhIHRlbXBvcmFyeSBlcnJvciwgc28gcmV0cnlpbmcgbWFrZXMgc2Vu
c2UuIFRoZSBxdWVzdGlvbg0KPj5pcyBpZiB3ZSByZWFsbHkgY2FuIHdyaXRlIHplcm9lcyBtYW51
YWxseSBpbiB0aGlzIGNhc2U/DQo+PiANCj4+U28gSSBkb27igJl0IHF1aXRlIHVuZGVyc3RhbmQu
ICBTaG91bGQgd2Uga2VlcCB0cnlpbmcgQkxLWkVST09VVCBvciBpcyANCj4+dGhlcmUgbm8gY2hh
bmNlIG9mIGl0IHdvcmtpbmcgYWZ0ZXIgaXQgaGFzIGF0IG9uZSBwb2ludCBmYWlsZWQgd2l0aCAN
Cj4+RUJVU1k/ICAoQXJlIHRoZXJlIG90aGVyIGNhc2VzIGJlc2lkZXMgd2hhdOKAmXMgZGVzY3Jp
YmVkIGluIHRoaXMgY29tbWl0IA0KPj5tZXNzYWdlIHdoZXJlIEVCVVNZIG1pZ2h0IGJlIHJldHVy
bmVkIGFuZCBpdCBpcyBvbmx5IHRlbXBvcmFyeT8pDQo+Pg0KPj4+IEZhbGxiYWNrIHRvIHB3cml0
ZXYgaW5zdGVhZCBvZiBleGl0IGZvciAtRUJVU1kgZXJyb3IuDQo+Pj4gDQo+Pj4gVGhlIGlzc3Vl
IHdhcyBpbnRyb2R1Y2VkIGluIExpbnV4IDUuMTA6DQo+Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPTM4
NGQ4N2VmMmM5NTRmYzU4ZTZjNWZkODI1M2U0YTE5ODRmNWZlMDINCj4+PiANCj4+PiBGaXhlZCBp
biBMaW51eCA1LjEyOg0KPj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTU2ODg3Y2ZmZTk0NmJiMGE5
MGM3NDQyOWZhOTRkNjExMGE3MzExOWQNCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ0xp
bWluIDxjaGFuZ2xtQGNoaW5hdGVsZWNvbS5jbj4NCj4+PiAtLS0NCj4+PiAgIGJsb2NrL2ZpbGUt
cG9zaXguYyB8IDggKysrKysrLS0NCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL2Jsb2NrL2ZpbGUtcG9z
aXguYyBiL2Jsb2NrL2ZpbGUtcG9zaXguYw0KPj4+IGluZGV4IDIwZTE0ZjhlOTYuLmQ0MDU0YWM5
Y2IgMTAwNjQ0DQo+Pj4gLS0tIGEvYmxvY2svZmlsZS1wb3NpeC5jDQo+Pj4gKysrIGIvYmxvY2sv
ZmlsZS1wb3NpeC5jDQo+Pj4gQEAgLTE2MjQsOCArMTYyNCwxMiBAQCBzdGF0aWMgc3NpemVfdCAN
Cj4+PiBoYW5kbGVfYWlvY2Jfd3JpdGVfemVyb2VzX2Jsb2NrKFJhd1Bvc2l4QUlPRGF0YSAqYWlv
Y2IpDQo+Pj4gICAgICAgICAgIH0gd2hpbGUgKGVycm5vID09IEVJTlRSKTsNCj4+PiANCj4+PiAg
ICAgICAgICAgcmV0ID0gdHJhbnNsYXRlX2VycigtZXJybm8pOw0KPj4+IC0gICAgICAgIGlmIChy
ZXQgPT0gLUVOT1RTVVApIHsNCj4+PiAtICAgICAgICAgICAgcy0+aGFzX3dyaXRlX3plcm9lcyA9
IGZhbHNlOw0KPj4+ICsgICAgICAgIHN3aXRjaCAocmV0KSB7DQo+Pj4gKyAgICAgICAgY2FzZSAt
RU5PVFNVUDoNCj4+PiArICAgICAgICAgICAgcy0+aGFzX3dyaXRlX3plcm9lcyA9IGZhbHNlOyAv
KiBmYWxsIHRocm91Z2ggKi8NCj4+PiArICAgICAgICBjYXNlIC1FQlVTWTogLyogTGludXggNS4x
MC81LjExIG1heSByZXR1cm4gLUVCVVNZIGZvciBtdWx0aXBhdGggDQo+Pj4gZGV2aWNlcyAqLw0K
Pj4+ICsgICAgICAgICAgICByZXR1cm4gLUVOT1RTVVA7DQo+Pj4gKyAgICAgICAgICAgIGJyZWFr
Ow0KPj4NCj4+KE5vdCBzdXJlIHdoeSB0aGlzIGJyZWFrIGlzIGhlcmUuKQ0KPj4NCj4+TWF4DQo+
Pg0KPj4+ICAgICAgICAgICB9DQo+Pj4gICAgICAgfQ0KPj4+ICAgI2VuZGlmDQo+Pj4gLS0NCj4+
PiAyLjI3LjANCj4+PiANCg0K

------=_001_NextPart307515656684_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }body { font-size: 14px; font-f=
amily: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</sty=
le></head><body><div>&gt;On Thu, Mar 25, 2021 at 8:07 AM ChangLimin &lt;ch=
anglm@chinatelecom.cn&gt; wrote:</div><div>&gt;&gt;On Wed, Mar 24, 2021 at=
 4:52 PM Max Reitz &lt;mreitz@redhat.com&gt; wrote:</div><div>&gt;&gt;On 2=
2.03.21 10:25, ChangLimin wrote:</div><div>&gt;&gt;&gt; For Linux 5.10/5.1=
1, qemu write zeros to a multipath device using</div><div>&gt;&gt;&gt; ioc=
tl(fd, BLKZEROOUT, range) with cache none or directsync return -EBUSY</div=
><div>&gt;&gt;&gt; permanently.</div><div>&gt;&gt;</div><div>&gt;&gt;So as=
 far as I can track back the discussion, Kevin asked on v1 why we=E2=80=99=
d&nbsp;</div><div>&gt;&gt;set has_write_zeroes to false, i.e. whether the =
EBUSY might not go away&nbsp;</div><div>&gt;&gt;at some point, and if it d=
id, whether we shouldn=E2=80=99t retry BLKZEROOUT then.</div><div>&gt;&gt;=
You haven=E2=80=99t explicitly replied to that question (as far as I can s=
ee),&nbsp;</div><div>&gt;&gt;so it kind of still stands.</div><div>&gt;&gt=
;</div><div>&gt;&gt;Implicitly, there are two conflicting answers in this =
patch: On one&nbsp;</div><div>&gt;&gt;hand, the commit message says =E2=80=
=9Cpermanently=E2=80=9D, and this is what you told&nbsp;</div><div>&gt;&gt=
;Nir as a realistic case where this can occur.&nbsp;</div><div>&gt;</div><=
div>&gt;For Linux 5.10/5.11, the EBUSY is permanently, the reproduce step =
is below.&nbsp;</div><div>&gt;For other Linux version, the EBUSY may be te=
mporary.&nbsp;</div><div>&gt;Because &nbsp;Linux 5.10/5.11 is not used wid=
ely, so do not set has_write_zeroes to false.</div><div>&gt;</div><div>&gt=
;&gt;I'm afraid ChangLimin did not answer my question. I'm looking for rea=
l</div><div>&gt;&gt;world used case when qemu cannot write zeros to multip=
ath device, when</div><div>&gt;&gt;nobody else is using the device.</div><=
div>&gt;&gt;</div><div>&gt;&gt;I tried to reproduce this on Fedora (kernel=
 5.10) with qemu-img convert,</div><div>&gt;&gt;once with a multipath devi=
ce, and once with logical volume on a vg created</div><div>&gt;&gt;on the =
multipath device, and I could not reproduce this issue.</div><div>&gt;</di=
v><div>&gt;The following is steps to reproduct the issue on Fedora 34.</di=
v><div>&gt;</div><div>&gt;# uname -a</div><div>&gt;Linux fedora-34 5.11.3-=
300.fc34.x86_64 #1 SMP Thu Mar 4 19:03:18 UTC 2021 x86_64 x86_64 x86_64 GN=
U/Linux</div><div>&gt;</div><div>&gt;Is this the most recent kernel? I hav=
e 5.11.7 in fedora 32.</div><div>&gt;&nbsp;</div><div>&gt;</div><div>&gt;#=
 qemu-img -V</div><div>&gt;qemu-img version 5.2.0 (qemu-5.2.0-5.fc34.1)</d=
iv><div>&gt;</div><div>&gt;1. &nbsp;Login in an ISCSI LUN created using ta=
rgetcli on ubuntu 20.04</div><div>&gt;# iscsiadm -m discovery -t st -p 192=
.169.1.109</div><div>&gt;192.169.1.109:3260,1 iqn.2003-01.org.linux-iscsi:=
lio-lv100</div><div>&gt;</div><div>&gt;# iscsiadm -m node -l -T iqn.2003-0=
1.org.linux-iscsi:lio-lv100</div><div>&gt;# iscsiadm -m session</div><div>=
&gt;tcp: [1] 192.169.1.109:3260,1 iqn.2003-01.org.linux-iscsi:lio-lv100 (n=
on-flash)</div><div>&gt;</div><div>&gt;2. start multipathd service</div><d=
iv>&gt;# mpathconf --enable</div><div>&gt;# systemctl start multipathd</di=
v><div>&gt;</div><div>&gt;3. &nbsp;add multipath path</div><div>&gt;# mult=
ipath -a `/lib/udev/scsi_id -g /dev/sdb` &nbsp; # sdb means the ISCSI LUN<=
/div><div>&gt;wwid '36001405b76856e4816b48b99c6a77de3' added</div><div>&gt=
;</div><div>&gt;# multipathd add path /dev/sdb</div><div>&gt;ok</div><div>=
&gt;</div><div>&gt;# multipath -ll &nbsp; &nbsp; # /dev/dm-1 is the multip=
ath device based on /dev/sdb</div><div>&gt;mpatha (36001405bebfc3a0522541c=
da30220db9) dm-1 LIO-ORG,lv102</div><div>&gt;size=3D1.0G features=3D'0' hw=
handler=3D'1 alua' wp=3Drw</div><div>&gt;`-+- policy=3D'service-time 0' pr=
io=3D50 status=3Dactive</div><div>&gt; &nbsp;`- 5:0:0:0 &nbsp;sdd &nbsp;8:=
48 &nbsp; active ready running</div><div>&gt;</div><div>&gt;You are using =
user_friendly_names which is (sadly) the default.</div><div>&gt;But I don'=
t think it should matter.</div><div>&gt;</div><div>&gt;4. qemu-img return =
EBUSY both to dm-1 and sdb</div><div>&gt;# wget http://download.cirros-clo=
ud.net/0.4.0/cirros-0.4.0-x86_64-disk.img</div><div>&gt;# qemu-img convert=
 -O raw -t none cirros-0.4.0-x86_64-disk.img /dev/dm-1</div><div>&gt;qemu-=
img: error while writing at byte 0: Device or resource busy</div><div>&gt;=
</div><div>&gt;# qemu-img convert -O raw -t none cirros-0.4.0-x86_64-disk.=
img /dev/sdb</div><div>&gt;qemu-img: error while writing at byte 0: Device=
 or resource busy</div><div>&gt;</div><div>&gt;5. blkdiscard also return E=
BUSY &nbsp;both to dm-1 and sdb</div><div>&gt;# blkdiscard -o 0 -l 4096 /d=
ev/dm-1</div><div>&gt;blkdiscard: cannot open /dev/dm-1: Device or resourc=
e busy</div><div>&gt;</div><div>&gt;# blkdiscard -o 0 -l 4096 /dev/sdb</di=
v><div>&gt;blkdiscard: cannot open /dev/sdb: No such file or directory</di=
v><div>&gt;</div><div>&gt;6. dd write zero is good, because it does not us=
e blkdiscard</div><div>&gt;# dd if=3D/dev/zero of=3D/dev/dm-1 bs=3D1M coun=
t=3D100 oflag=3Ddirect&nbsp;</div><div>&gt;100+0 records in</div><div>&gt;=
100+0 records out</div><div>&gt;104857600 bytes (105 MB, 100 MiB) copied, =
2.33623 s, 44.9 MB/s</div><div>&gt;</div><div>&gt;7. The LUN should suppor=
t blkdiscard feature, otherwise it will not write zero&nbsp;</div><div>&gt=
;with &nbsp;ioctl(fd, BLKZEROOUT, range)&nbsp;</div><div>&gt;</div><div>&g=
t;Thanks!</div><div>&gt;</div><div>&gt;I could not reproduce this with ker=
nel 5.10, but now I'm no 5.11:</div><div>&gt;# uname -r</div><div>&gt;5.11=
.7-100.fc32.x86_64</div><div>&gt;</div><div>&gt;# qemu-img --version</div>=
<div>&gt;qemu-img version 5.2.0 (qemu-5.2.0-6.fc32.1)</div><div>&gt;Copyri=
ght (c) 2003-2020 Fabrice Bellard and the QEMU Project developers</div><di=
v>&gt;</div><div>&gt;# cat /etc/multipath.conf</div><div>&gt;defaults {</d=
iv><div>&gt;user_friendly_names no</div><div>&gt;find_multipaths no</div><=
div>&gt;}</div><div>&gt;</div><div>&gt;blacklist_exceptions {</div><div>&g=
t; &nbsp; &nbsp; &nbsp; &nbsp;property "(SCSI_IDENT_|ID_WWN)"</div><div>&g=
t;}</div><div>&gt;</div><div>&gt;blacklist {</div><div>&gt;}</div><div>&gt=
;</div><div>&gt;# multipath -ll 36001405e884ab8ff4b44fdba6901099c</div><di=
v>&gt;36001405e884ab8ff4b44fdba6901099c dm-8 LIO-ORG,3-09</div><div>&gt;si=
ze=3D6.0G features=3D'0' hwhandler=3D'1 alua' wp=3Drw</div><div>&gt;`-+- p=
olicy=3D'service-time 0' prio=3D50 status=3Dactive</div><div>&gt; &nbsp;`-=
 1:0:0:9 sdk &nbsp; &nbsp; 8:160 active ready running</div><div>&gt;</div>=
<div>&gt;$ lsblk /dev/sdk</div><div>&gt;NAME &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;MAJ:MIN RM SIZE RO TYPE &nbsp;MOUNTPOINT</div><div>&gt;sdk &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8:160 &nbsp;0 &nbsp; 6G &nbsp;0 disk=
 &nbsp;</div><div>&gt;=E2=94=94=E2=94=8036001405e884ab8ff4b44fdba6901099c =
253:13 &nbsp; 0 &nbsp; 6G &nbsp;0 mpath&nbsp;</div><div>&gt;</div><div>&gt=
;$ virt-builder fedora-32 -o disk.img</div><div>&gt;[ &nbsp; 2.9] Download=
ing: http://builder.libguestfs.org/fedora-32.xz</div><div>&gt;[ &nbsp; 3.8=
] Planning how to build this image</div><div>&gt;[ &nbsp; 3.8] Uncompressi=
ng</div><div>&gt;[ &nbsp;11.1] Opening the new disk</div><div>&gt;[ &nbsp;=
16.1] Setting a random seed</div><div>&gt;[ &nbsp;16.1] Setting passwords<=
/div><div>&gt;virt-builder: Setting random password of root to TcikQqRxAaI=
qS1kF</div><div>&gt;[ &nbsp;17.0] Finishing off</div><div>&gt; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Output file: disk.img<=
/div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; Output size: 6.0G</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; Output format: raw</div><div>&gt; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;Total usable space: 5.4G</div><div>&gt; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Free space: 4.0G (7=
4%)</div><div>&gt;</div><div>&gt;$ qemu-img info disk.img</div><div>&gt;im=
age: disk.img</div><div>&gt;file format: raw</div><div>&gt;virtual size: 6=
 GiB (6442450944 bytes)</div><div>&gt;disk size: 1.29 GiB</div><div>&gt;</=
div><div>&gt;# qemu-img convert -p -f raw -O raw -t none -T none disk.img =
/dev/mapper/36001405e884ab8ff4b44fdba6901099c</div><div>&gt; &nbsp; &nbsp;=
(100.00/100%)</div><div>&gt;</div><div>&gt;Works.</div><div>&gt;</div><div=
>&gt;# lsblk /dev/sdk</div><div>&gt;NAME &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; MAJ:MIN RM &nbsp;SIZE RO TYPE &nbsp;MOUNTPOINT</div><div>&gt;s=
dk &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8:160 &nbsp;0=
 &nbsp; &nbsp;6G &nbsp;0 disk &nbsp;</div><div>&gt;=E2=94=94=E2=94=8036001=
405e884ab8ff4b44fdba6901099c &nbsp; &nbsp;253:13 &nbsp; 0 &nbsp; &nbsp;6G =
&nbsp;0 mpath&nbsp;</div><div>&gt; &nbsp;=E2=94=9C=E2=94=8036001405e884ab8=
ff4b44fdba6901099c1 253:14 &nbsp; 0 &nbsp; &nbsp;1M &nbsp;0 part &nbsp;</d=
iv><div>&gt; &nbsp;=E2=94=9C=E2=94=8036001405e884ab8ff4b44fdba6901099c2 25=
3:15 &nbsp; 0 &nbsp; &nbsp;1G &nbsp;0 part &nbsp;</div><div>&gt; &nbsp;=E2=
=94=9C=E2=94=8036001405e884ab8ff4b44fdba6901099c3 253:16 &nbsp; 0 &nbsp;61=
5M &nbsp;0 part &nbsp;</div><div>&gt; &nbsp;=E2=94=94=E2=94=8036001405e884=
ab8ff4b44fdba6901099c4 253:17 &nbsp; 0 &nbsp;4.4G &nbsp;0 part &nbsp;</div=
><div>&gt;</div><div>&gt;# qemu-img convert -p -f raw -O raw -t none -T no=
ne disk.img /dev/mapper/36001405e884ab8ff4b44fdba6901099c</div><div>&gt; &=
nbsp; &nbsp;(100.00/100%)</div><div>&gt;</div><div>&gt;Works, wiping the p=
artitions.</div><div>&gt;</div><div>&gt;# mount /dev/mapper/36001405e884ab=
8ff4b44fdba6901099c4 /tmp/mnt</div><div>&gt;</div><div>&gt;# mount | grep =
/dev/mapper/36001405e884ab8ff4b44fdba6901099c4</div><div>&gt;/dev/mapper/3=
6001405e884ab8ff4b44fdba6901099c4 on /tmp/mnt type xfs (rw,relatime,seclab=
el,attr2,inode64,logbufs=3D8,logbsize=3D32k,noquota)</div><div>&gt;</div><=
div>&gt;This is invalid use, converting to device with mounted file system=
, but let's try:</div><div>&gt;</div><div>&gt;# qemu-img convert -p -f raw=
 -O raw -t none -T none disk.img /dev/mapper/36001405e884ab8ff4b44fdba6901=
099c</div><div>&gt; &nbsp; &nbsp;(100.00/100%)</div><div>&gt;</div><div>&g=
t;Still works?!</div><div>&gt;</div><div>&gt;# wipefs -a /dev/mapper/36001=
405e884ab8ff4b44fdba6901099c</div><div>&gt;wipefs: error: /dev/mapper/3600=
1405e884ab8ff4b44fdba6901099c: probing initialization failed: Device or re=
source busy</div><div>&gt;</div><div>&gt;# blkdiscard /dev/mapper/36001405=
e884ab8ff4b44fdba6901099c</div><div>&gt;</div><div>&gt;Works.</div><div>&g=
t;</div><div>&gt;This the configuration of the LUN on the server side:</di=
v><div>&gt;</div><div>&gt; &nbsp; { &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp;"aio": false, &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<=
/div><div>&gt; &nbsp; &nbsp; &nbsp;"alua_tpgs": [ &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &=
nbsp; &nbsp; &nbsp;{ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&=
gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"alua_access_state": 0, &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"alua=
_access_status": 0, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;"alua_access_type": 3, &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"alua_support_active_n=
onoptimized": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><=
div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"alua_support_active_optimized"=
: 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>=
<div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"alua_support_offline": 1, &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"alua_sup=
port_standby": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;"alua_support_transitioning": 1, &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;"alua_support_unavailable": 1, &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;"alua_write_metadata": 0, &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&=
nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"implicit_trans_sec=
s": 0, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;"name": "default_tg_pt_gp", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;"nonop_delay_msecs": 100, &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&n=
bsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"preferred": 0, &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;"tg_pt_gp_id": 0, &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;"trans_delay_msecs": 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; =
&nbsp; &nbsp; &nbsp; &nbsp;} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</di=
v><div>&gt; &nbsp; &nbsp; &nbsp;], &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;</div><div>&gt; &nbsp; &nbsp; &nbsp;"attributes": { &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbs=
p; &nbsp; &nbsp; &nbsp;"block_size": 512, &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"emulate_3=
pc": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><=
div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"emulate_caw": 1, &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp=
; &nbsp;"emulate_dpo": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"emulate_fua_read": =
1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &n=
bsp; &nbsp;"emulate_fua_write": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<=
/div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"emulate_model_alias": 1, &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"emula=
te_pr": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</d=
iv><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"emulate_rest_reord": 0, &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"emulate=
_tas": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div=
><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"emulate_tpu": 1, &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nb=
sp; &nbsp;"emulate_tpws": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"emulate_ua_intlck_ctrl=
": 0, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"emulat=
e_write_cache": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &=
nbsp; &nbsp; &nbsp;"enforce_pr_isids": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"force_pr_aptpl": 0, &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &=
nbsp; &nbsp;"is_nonrot": 0, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"max_unmap_=
block_desc_count": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"max_=
unmap_lba_count": 8192, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &n=
bsp; &nbsp;"max_write_same_len": 65335, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; =
&nbsp; &nbsp; &nbsp; &nbsp;"optimal_sectors": 16384, &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"pi_prot_format": 0, =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp=
; &nbsp; &nbsp;"pi_prot_type": 0, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"pi_prot_verify": =
0, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &n=
bsp; &nbsp; &nbsp;"queue_depth": 128, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp; &nbsp;"unmap_granular=
ity": 1, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbs=
p; &nbsp; &nbsp;"unmap_granularity_alignment": 0, &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp=
; &nbsp; &nbsp; &nbsp;"unmap_zeroes_data": 0 &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp;}, &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp;"dev": "/target/3/09"=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt; &nbsp; &nb=
sp; &nbsp;"name": "3-09", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp;"plugin": "fi=
leio", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><d=
iv>&gt; &nbsp; &nbsp; &nbsp;"size": 6442450944, &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &nbsp; &nbsp;"writ=
e_back": true, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;=
</div><div>&gt; &nbsp; &nbsp; &nbsp;"wwn": "e884ab8f-f4b4-4fdb-a690-1099c0=
72c86d" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&gt; &nbsp; &=
nbsp;}, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div><div>&gt;</=
div><div>&gt;Maybe this upstream change is not in all downstream 5.11 kern=
els, or 5.11.7</div><div>&gt;already includes the fix?</div><div><br></div=
><div>Linux 5.10.24/5.11.7 already merged the fix on 2021-03-17 by Greg Kr=
oah-Hartman.</div><div><br></div><div>https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux.git/commit/?h=3Dlinux-5.11.y&amp;id=3D7e081579765=
6f029fab2edc309406cddf931b9d8</div><div>https://git.kernel.org/pub/scm/lin=
ux/kernel/git/stable/linux.git/commit/?h=3Dlinux-5.10.y&amp;id=3Dd44c9780e=
d40db88626c9354868eab72159c7a7f</div><div><br></div><div># git describe d4=
4c9780ed40db88626c9354868eab72159c7a7f</div><div>v5.10.23-184-gd44c9780ed4=
0</div><div><br></div><div># git describe 7e0815797656f029fab2edc309406cdd=
f931b9d8</div><div>v5.11.6-178-g7e0815797656</div><div><br></div><div>&gt;=
Adding Ben, maybe he had more insight on the multipath side.</div><div>&gt=
;</div><div>&gt;&gt;If I understand the kernel change correctly, this can =
happen when there is</div><div>&gt;&gt;a mounted file system on top of the=
 multipath device. I don't think we have&nbsp;</div><div>&gt;&gt;a use cas=
e when qemu accesses a multipath device when the device is used</div><div>=
&gt;&gt;by a file system, but maybe I missed something.</div><div>&gt;&gt;=
&nbsp;</div><div>&gt;&gt;So that to me implies&nbsp;</div><div>&gt;&gt;tha=
t we actually should not retry BLKZEROOUT, because the EBUSY will&nbsp;</d=
iv><div>&gt;&gt;remain, and that condition won=E2=80=99t change while the =
block device is in use&nbsp;</div><div>&gt;&gt;by qemu.</div><div>&gt;&gt;=
</div><div>&gt;&gt;On the other hand, in the code, you have decided not to=
 reset&nbsp;</div><div>&gt;&gt;has_write_zeroes to false, so the implement=
ation will retry.</div><div>&gt;&gt;</div><div>&gt;&gt;EBUSY is usually a =
temporary error, so retrying makes sense. The question</div><div>&gt;&gt;i=
s if we really can write zeroes manually in this case?</div><div>&gt;&gt;&=
nbsp;</div><div>&gt;&gt;So I don=E2=80=99t quite understand. &nbsp;Should =
we keep trying BLKZEROOUT or is&nbsp;</div><div>&gt;&gt;there no chance of=
 it working after it has at one point failed with&nbsp;</div><div>&gt;&gt;=
EBUSY? &nbsp;(Are there other cases besides what=E2=80=99s described in th=
is commit&nbsp;</div><div>&gt;&gt;message where EBUSY might be returned an=
d it is only temporary?)</div><div>&gt;&gt;</div><div>&gt;&gt;&gt; Fallbac=
k to pwritev instead of exit for -EBUSY error.</div><div>&gt;&gt;&gt;&nbsp=
;</div><div>&gt;&gt;&gt; The issue was introduced in Linux 5.10:</div><div=
>&gt;&gt;&gt; https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
.git/commit/?id=3D384d87ef2c954fc58e6c5fd8253e4a1984f5fe02</div><div>&gt;&=
gt;&gt;&nbsp;</div><div>&gt;&gt;&gt; Fixed in Linux 5.12:</div><div>&gt;&g=
t;&gt; https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3D56887cffe946bb0a90c74429fa94d6110a73119d</div><div>&gt;&gt;&g=
t;&nbsp;</div><div>&gt;&gt;&gt; Signed-off-by: ChangLimin &lt;changlm@chin=
atelecom.cn&gt;</div><div>&gt;&gt;&gt; ---</div><div>&gt;&gt;&gt; &nbsp; b=
lock/file-posix.c | 8 ++++++--</div><div>&gt;&gt;&gt; &nbsp; 1 file change=
d, 6 insertions(+), 2 deletions(-)</div><div>&gt;&gt;&gt;&nbsp;</div><div>=
&gt;&gt;&gt; diff --git a/block/file-posix.c b/block/file-posix.c</div><di=
v>&gt;&gt;&gt; index 20e14f8e96..d4054ac9cb 100644</div><div>&gt;&gt;&gt; =
--- a/block/file-posix.c</div><div>&gt;&gt;&gt; +++ b/block/file-posix.c</=
div><div>&gt;&gt;&gt; @@ -1624,8 +1624,12 @@ static ssize_t&nbsp;</div><di=
v>&gt;&gt;&gt; handle_aiocb_write_zeroes_block(RawPosixAIOData *aiocb)</di=
v><div>&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } while (errno =3D=
=3D EINTR);</div><div>&gt;&gt;&gt;&nbsp;</div><div>&gt;&gt;&gt; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; ret =3D translate_err(-errno);</div><div>&gt;&gt;=
&gt; - &nbsp; &nbsp; &nbsp; &nbsp;if (ret =3D=3D -ENOTSUP) {</div><div>&gt=
;&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s-&gt;has_write_zeroe=
s =3D false;</div><div>&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;switch (r=
et) {</div><div>&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;case -ENOTSUP:</=
div><div>&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s-&gt;has=
_write_zeroes =3D false; /* fall through */</div><div>&gt;&gt;&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;case -EBUSY: /* Linux 5.10/5.11 may return -EBUSY fo=
r multipath&nbsp;</div><div>&gt;&gt;&gt; devices */</div><div>&gt;&gt;&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -ENOTSUP;</div><div>&gt=
;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div><div>&gt;=
&gt;</div><div>&gt;&gt;(Not sure why this break is here.)</div><div>&gt;&g=
t;</div><div>&gt;&gt;Max</div><div>&gt;&gt;</div><div>&gt;&gt;&gt; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; }</div><div>&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; =
}</div><div>&gt;&gt;&gt; &nbsp; #endif</div><div>&gt;&gt;&gt; --</div><div=
>&gt;&gt;&gt; 2.27.0</div><div>&gt;&gt;&gt;&nbsp;</div><div><br></div></bo=
dy></html>
------=_001_NextPart307515656684_=------


