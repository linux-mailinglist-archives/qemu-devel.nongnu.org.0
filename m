Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CED3488E9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:20:13 +0100 (CET)
Received: from localhost ([::1]:55208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJLm-0004Jo-BS
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changlm@chinatelecom.cn>)
 id 1lPJ9E-0004Fs-IU; Thu, 25 Mar 2021 02:07:14 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:38576
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changlm@chinatelecom.cn>)
 id 1lPJ9A-0001RC-CH; Thu, 25 Mar 2021 02:07:12 -0400
HMM_SOURCE_IP: 172.18.0.92:36454.1505729424
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.101.58?logid-ba0f01792523409a949893830667ad42
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 20DA72800A9;
 Thu, 25 Mar 2021 14:06:54 +0800 (CST)
X-189-SAVE-TO-SEND: 71112636@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id ba0f01792523409a949893830667ad42 for
 nsoffer@redhat.com; Thu Mar 25 14:06:58 2021
X-Transaction-ID: ba0f01792523409a949893830667ad42
X-filter-score: filter<0>
X-Real-From: changlm@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Thu, 25 Mar 2021 14:06:48 +0800
From: ChangLimin <changlm@chinatelecom.cn>
To: "Nir Soffer" <nsoffer@redhat.com>, 
	mreitz <mreitz@redhat.com>
Subject: Re: [PATCH V4] file-posix: allow -EBUSY error during ioctl(fd,
 BLKZEROOUT, range) on block
References: <2021032217253258728710@chinatelecom.cn>, 
 <0b01a688-f86b-0888-2c03-f4d55273b93f@redhat.com>, 
 <CAMRbyysT_s+AkskuAGvT7wXOQ+LaX3OkSYTo4UxtYKqE0cjBMg@mail.gmail.com>
X-Priority: 3
X-GUID: 7C6F51CC-A29B-414F-8317-22C6F67706F0
X-Has-Attach: no
X-Mailer: Foxmail 7.2.17.58[cn]
Mime-Version: 1.0
Message-ID: <2021032514064808224635@chinatelecom.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart501182822776_=----"
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=changlm@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

------=_001_NextPart501182822776_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pk9uIFdlZCwgTWFyIDI0LCAyMDIxIGF0IDQ6NTIgUE0gTWF4IFJlaXR6IDxtcmVpdHpAcmVkaGF0
LmNvbT4gd3JvdGU6DQo+T24gMjIuMDMuMjEgMTA6MjUsIENoYW5nTGltaW4gd3JvdGU6DQo+PiBG
b3IgTGludXggNS4xMC81LjExLCBxZW11IHdyaXRlIHplcm9zIHRvIGEgbXVsdGlwYXRoIGRldmlj
ZSB1c2luZw0KPj4gaW9jdGwoZmQsIEJMS1pFUk9PVVQsIHJhbmdlKSB3aXRoIGNhY2hlIG5vbmUg
b3IgZGlyZWN0c3luYyByZXR1cm4gLUVCVVNZDQo+PiBwZXJtYW5lbnRseS4NCj4NCj5TbyBhcyBm
YXIgYXMgSSBjYW4gdHJhY2sgYmFjayB0aGUgZGlzY3Vzc2lvbiwgS2V2aW4gYXNrZWQgb24gdjEg
d2h5IHdl4oCZZCANCj5zZXQgaGFzX3dyaXRlX3plcm9lcyB0byBmYWxzZSwgaS5lLiB3aGV0aGVy
IHRoZSBFQlVTWSBtaWdodCBub3QgZ28gYXdheSANCj5hdCBzb21lIHBvaW50LCBhbmQgaWYgaXQg
ZGlkLCB3aGV0aGVyIHdlIHNob3VsZG7igJl0IHJldHJ5IEJMS1pFUk9PVVQgdGhlbi4NCj5Zb3Ug
aGF2ZW7igJl0IGV4cGxpY2l0bHkgcmVwbGllZCB0byB0aGF0IHF1ZXN0aW9uIChhcyBmYXIgYXMg
SSBjYW4gc2VlKSwgDQo+c28gaXQga2luZCBvZiBzdGlsbCBzdGFuZHMuDQo+DQo+SW1wbGljaXRs
eSwgdGhlcmUgYXJlIHR3byBjb25mbGljdGluZyBhbnN3ZXJzIGluIHRoaXMgcGF0Y2g6IE9uIG9u
ZSANCj5oYW5kLCB0aGUgY29tbWl0IG1lc3NhZ2Ugc2F5cyDigJxwZXJtYW5lbnRseeKAnSwgYW5k
IHRoaXMgaXMgd2hhdCB5b3UgdG9sZCANCj5OaXIgYXMgYSByZWFsaXN0aWMgY2FzZSB3aGVyZSB0
aGlzIGNhbiBvY2N1ci4gDQoNCkZvciBMaW51eCA1LjEwLzUuMTEsIHRoZSBFQlVTWSBpcyBwZXJt
YW5lbnRseSwgdGhlIHJlcHJvZHVjZSBzdGVwIGlzIGJlbG93LiANCkZvciBvdGhlciBMaW51eCB2
ZXJzaW9uLCB0aGUgRUJVU1kgbWF5IGJlIHRlbXBvcmFyeS4gDQpCZWNhdXNlICBMaW51eCA1LjEw
LzUuMTEgaXMgbm90IHVzZWQgd2lkZWx5LCBzbyBkbyBub3Qgc2V0IGhhc193cml0ZV96ZXJvZXMg
dG8gZmFsc2UuDQoNCj5JJ20gYWZyYWlkIENoYW5nTGltaW4gZGlkIG5vdCBhbnN3ZXIgbXkgcXVl
c3Rpb24uIEknbSBsb29raW5nIGZvciByZWFsDQo+d29ybGQgdXNlZCBjYXNlIHdoZW4gcWVtdSBj
YW5ub3Qgd3JpdGUgemVyb3MgdG8gbXVsdGlwYXRoIGRldmljZSwgd2hlbg0KPm5vYm9keSBlbHNl
IGlzIHVzaW5nIHRoZSBkZXZpY2UuDQo+DQo+SSB0cmllZCB0byByZXByb2R1Y2UgdGhpcyBvbiBG
ZWRvcmEgKGtlcm5lbCA1LjEwKSB3aXRoIHFlbXUtaW1nIGNvbnZlcnQsDQo+b25jZSB3aXRoIGEg
bXVsdGlwYXRoIGRldmljZSwgYW5kIG9uY2Ugd2l0aCBsb2dpY2FsIHZvbHVtZSBvbiBhIHZnIGNy
ZWF0ZWQNCj5vbiB0aGUgbXVsdGlwYXRoIGRldmljZSwgYW5kIEkgY291bGQgbm90IHJlcHJvZHVj
ZSB0aGlzIGlzc3VlLg0KDQpUaGUgZm9sbG93aW5nIGlzIHN0ZXBzIHRvIHJlcHJvZHVjdCB0aGUg
aXNzdWUgb24gRmVkb3JhIDM0Lg0KDQojIHVuYW1lIC1hDQpMaW51eCBmZWRvcmEtMzQgNS4xMS4z
LTMwMC5mYzM0Lng4Nl82NCAjMSBTTVAgVGh1IE1hciA0IDE5OjAzOjE4IFVUQyAyMDIxIHg4Nl82
NCB4ODZfNjQgeDg2XzY0IEdOVS9MaW51eA0KDQojIHFlbXUtaW1nIC1WDQpxZW11LWltZyB2ZXJz
aW9uIDUuMi4wIChxZW11LTUuMi4wLTUuZmMzNC4xKQ0KDQoxLiAgTG9naW4gaW4gYW4gSVNDU0kg
TFVOIGNyZWF0ZWQgdXNpbmcgdGFyZ2V0Y2xpIG9uIHVidW50dSAyMC4wNA0KIyBpc2NzaWFkbSAt
bSBkaXNjb3ZlcnkgLXQgc3QgLXAgMTkyLjE2OS4xLjEwOQ0KMTkyLjE2OS4xLjEwOTozMjYwLDEg
aXFuLjIwMDMtMDEub3JnLmxpbnV4LWlzY3NpOmxpby1sdjEwMA0KDQojIGlzY3NpYWRtIC1tIG5v
ZGUgLWwgLVQgaXFuLjIwMDMtMDEub3JnLmxpbnV4LWlzY3NpOmxpby1sdjEwMA0KIyBpc2NzaWFk
bSAtbSBzZXNzaW9uDQp0Y3A6IFsxXSAxOTIuMTY5LjEuMTA5OjMyNjAsMSBpcW4uMjAwMy0wMS5v
cmcubGludXgtaXNjc2k6bGlvLWx2MTAwIChub24tZmxhc2gpDQoNCjIuIHN0YXJ0IG11bHRpcGF0
aGQgc2VydmljZQ0KIyBtcGF0aGNvbmYgLS1lbmFibGUNCiMgc3lzdGVtY3RsIHN0YXJ0IG11bHRp
cGF0aGQNCg0KMy4gIGFkZCBtdWx0aXBhdGggcGF0aA0KIyBtdWx0aXBhdGggLWEgYC9saWIvdWRl
di9zY3NpX2lkIC1nIC9kZXYvc2RiYCAgICMgc2RiIG1lYW5zIHRoZSBJU0NTSSBMVU4NCnd3aWQg
JzM2MDAxNDA1Yjc2ODU2ZTQ4MTZiNDhiOTljNmE3N2RlMycgYWRkZWQNCg0KIyBtdWx0aXBhdGhk
IGFkZCBwYXRoIC9kZXYvc2RiDQpvaw0KDQojIG11bHRpcGF0aCAtbGwgICAgICMgL2Rldi9kbS0x
IGlzIHRoZSBtdWx0aXBhdGggZGV2aWNlIGJhc2VkIG9uIC9kZXYvc2RiDQptcGF0aGEgKDM2MDAx
NDA1YmViZmMzYTA1MjI1NDFjZGEzMDIyMGRiOSkgZG0tMSBMSU8tT1JHLGx2MTAyDQpzaXplPTEu
MEcgZmVhdHVyZXM9JzAnIGh3aGFuZGxlcj0nMSBhbHVhJyB3cD1ydw0KYC0rLSBwb2xpY3k9J3Nl
cnZpY2UtdGltZSAwJyBwcmlvPTUwIHN0YXR1cz1hY3RpdmUNCiAgYC0gNTowOjA6MCAgc2RkICA4
OjQ4ICAgYWN0aXZlIHJlYWR5IHJ1bm5pbmcNCg0KNC4gcWVtdS1pbWcgcmV0dXJuIEVCVVNZIGJv
dGggdG8gZG0tMSBhbmQgc2RiDQojIHdnZXQgaHR0cDovL2Rvd25sb2FkLmNpcnJvcy1jbG91ZC5u
ZXQvMC40LjAvY2lycm9zLTAuNC4wLXg4Nl82NC1kaXNrLmltZw0KIyBxZW11LWltZyBjb252ZXJ0
IC1PIHJhdyAtdCBub25lIGNpcnJvcy0wLjQuMC14ODZfNjQtZGlzay5pbWcgL2Rldi9kbS0xDQpx
ZW11LWltZzogZXJyb3Igd2hpbGUgd3JpdGluZyBhdCBieXRlIDA6IERldmljZSBvciByZXNvdXJj
ZSBidXN5DQoNCiMgcWVtdS1pbWcgY29udmVydCAtTyByYXcgLXQgbm9uZSBjaXJyb3MtMC40LjAt
eDg2XzY0LWRpc2suaW1nIC9kZXYvc2RiDQpxZW11LWltZzogZXJyb3Igd2hpbGUgd3JpdGluZyBh
dCBieXRlIDA6IERldmljZSBvciByZXNvdXJjZSBidXN5DQoNCjUuIGJsa2Rpc2NhcmQgYWxzbyBy
ZXR1cm4gRUJVU1kgIGJvdGggdG8gZG0tMSBhbmQgc2RiDQojIGJsa2Rpc2NhcmQgLW8gMCAtbCA0
MDk2IC9kZXYvZG0tMQ0KYmxrZGlzY2FyZDogY2Fubm90IG9wZW4gL2Rldi9kbS0xOiBEZXZpY2Ug
b3IgcmVzb3VyY2UgYnVzeQ0KDQojIGJsa2Rpc2NhcmQgLW8gMCAtbCA0MDk2IC9kZXYvc2RiDQpi
bGtkaXNjYXJkOiBjYW5ub3Qgb3BlbiAvZGV2L3NkYjogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eQ0KDQo2LiBkZCB3cml0ZSB6ZXJvIGlzIGdvb2QsIGJlY2F1c2UgaXQgZG9lcyBub3QgdXNlIGJs
a2Rpc2NhcmQNCiMgZGQgaWY9L2Rldi96ZXJvIG9mPS9kZXYvZG0tMSBicz0xTSBjb3VudD0xMDAg
b2ZsYWc9ZGlyZWN0IA0KMTAwKzAgcmVjb3JkcyBpbg0KMTAwKzAgcmVjb3JkcyBvdXQNCjEwNDg1
NzYwMCBieXRlcyAoMTA1IE1CLCAxMDAgTWlCKSBjb3BpZWQsIDIuMzM2MjMgcywgNDQuOSBNQi9z
DQoNCjcuIFRoZSBMVU4gc2hvdWxkIHN1cHBvcnQgYmxrZGlzY2FyZCBmZWF0dXJlLCBvdGhlcndp
c2UgaXQgd2lsbCBub3Qgd3JpdGUgemVybyANCndpdGggIGlvY3RsKGZkLCBCTEtaRVJPT1VULCBy
YW5nZSkgDQoNCj5JZiBJIHVuZGVyc3RhbmQgdGhlIGtlcm5lbCBjaGFuZ2UgY29ycmVjdGx5LCB0
aGlzIGNhbiBoYXBwZW4gd2hlbiB0aGVyZSBpcw0KPmEgbW91bnRlZCBmaWxlIHN5c3RlbSBvbiB0
b3Agb2YgdGhlIG11bHRpcGF0aCBkZXZpY2UuIEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSANCj5hIHVz
ZSBjYXNlIHdoZW4gcWVtdSBhY2Nlc3NlcyBhIG11bHRpcGF0aCBkZXZpY2Ugd2hlbiB0aGUgZGV2
aWNlIGlzIHVzZWQNCj5ieSBhIGZpbGUgc3lzdGVtLCBidXQgbWF5YmUgSSBtaXNzZWQgc29tZXRo
aW5nLg0KPiANCj5TbyB0aGF0IHRvIG1lIGltcGxpZXMgDQo+dGhhdCB3ZSBhY3R1YWxseSBzaG91
bGQgbm90IHJldHJ5IEJMS1pFUk9PVVQsIGJlY2F1c2UgdGhlIEVCVVNZIHdpbGwgDQo+cmVtYWlu
LCBhbmQgdGhhdCBjb25kaXRpb24gd29u4oCZdCBjaGFuZ2Ugd2hpbGUgdGhlIGJsb2NrIGRldmlj
ZSBpcyBpbiB1c2UgDQo+YnkgcWVtdS4NCj4NCj5PbiB0aGUgb3RoZXIgaGFuZCwgaW4gdGhlIGNv
ZGUsIHlvdSBoYXZlIGRlY2lkZWQgbm90IHRvIHJlc2V0IA0KPmhhc193cml0ZV96ZXJvZXMgdG8g
ZmFsc2UsIHNvIHRoZSBpbXBsZW1lbnRhdGlvbiB3aWxsIHJldHJ5Lg0KPg0KPkVCVVNZIGlzIHVz
dWFsbHkgYSB0ZW1wb3JhcnkgZXJyb3IsIHNvIHJldHJ5aW5nIG1ha2VzIHNlbnNlLiBUaGUgcXVl
c3Rpb24NCj5pcyBpZiB3ZSByZWFsbHkgY2FuIHdyaXRlIHplcm9lcyBtYW51YWxseSBpbiB0aGlz
IGNhc2U/DQo+IA0KPlNvIEkgZG9u4oCZdCBxdWl0ZSB1bmRlcnN0YW5kLiAgU2hvdWxkIHdlIGtl
ZXAgdHJ5aW5nIEJMS1pFUk9PVVQgb3IgaXMgDQo+dGhlcmUgbm8gY2hhbmNlIG9mIGl0IHdvcmtp
bmcgYWZ0ZXIgaXQgaGFzIGF0IG9uZSBwb2ludCBmYWlsZWQgd2l0aCANCj5FQlVTWT8gIChBcmUg
dGhlcmUgb3RoZXIgY2FzZXMgYmVzaWRlcyB3aGF04oCZcyBkZXNjcmliZWQgaW4gdGhpcyBjb21t
aXQgDQo+bWVzc2FnZSB3aGVyZSBFQlVTWSBtaWdodCBiZSByZXR1cm5lZCBhbmQgaXQgaXMgb25s
eSB0ZW1wb3Jhcnk/KQ0KPg0KPj4gRmFsbGJhY2sgdG8gcHdyaXRldiBpbnN0ZWFkIG9mIGV4aXQg
Zm9yIC1FQlVTWSBlcnJvci4NCj4+IA0KPj4gVGhlIGlzc3VlIHdhcyBpbnRyb2R1Y2VkIGluIExp
bnV4IDUuMTA6DQo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9Mzg0ZDg3ZWYyYzk1NGZjNThlNmM1ZmQ4
MjUzZTRhMTk4NGY1ZmUwMg0KPj4gDQo+PiBGaXhlZCBpbiBMaW51eCA1LjEyOg0KPj4gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0L2NvbW1pdC8/aWQ9NTY4ODdjZmZlOTQ2YmIwYTkwYzc0NDI5ZmE5NGQ2MTEwYTczMTE5ZA0K
Pj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ0xpbWluIDxjaGFuZ2xtQGNoaW5hdGVsZWNvbS5j
bj4NCj4+IC0tLQ0KPj4gICBibG9jay9maWxlLXBvc2l4LmMgfCA4ICsrKysrKy0tDQo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRp
ZmYgLS1naXQgYS9ibG9jay9maWxlLXBvc2l4LmMgYi9ibG9jay9maWxlLXBvc2l4LmMNCj4+IGlu
ZGV4IDIwZTE0ZjhlOTYuLmQ0MDU0YWM5Y2IgMTAwNjQ0DQo+PiAtLS0gYS9ibG9jay9maWxlLXBv
c2l4LmMNCj4+ICsrKyBiL2Jsb2NrL2ZpbGUtcG9zaXguYw0KPj4gQEAgLTE2MjQsOCArMTYyNCwx
MiBAQCBzdGF0aWMgc3NpemVfdCANCj4+IGhhbmRsZV9haW9jYl93cml0ZV96ZXJvZXNfYmxvY2so
UmF3UG9zaXhBSU9EYXRhICphaW9jYikNCj4+ICAgICAgICAgICB9IHdoaWxlIChlcnJubyA9PSBF
SU5UUik7DQo+PiANCj4+ICAgICAgICAgICByZXQgPSB0cmFuc2xhdGVfZXJyKC1lcnJubyk7DQo+
PiAtICAgICAgICBpZiAocmV0ID09IC1FTk9UU1VQKSB7DQo+PiAtICAgICAgICAgICAgcy0+aGFz
X3dyaXRlX3plcm9lcyA9IGZhbHNlOw0KPj4gKyAgICAgICAgc3dpdGNoIChyZXQpIHsNCj4+ICsg
ICAgICAgIGNhc2UgLUVOT1RTVVA6DQo+PiArICAgICAgICAgICAgcy0+aGFzX3dyaXRlX3plcm9l
cyA9IGZhbHNlOyAvKiBmYWxsIHRocm91Z2ggKi8NCj4+ICsgICAgICAgIGNhc2UgLUVCVVNZOiAv
KiBMaW51eCA1LjEwLzUuMTEgbWF5IHJldHVybiAtRUJVU1kgZm9yIG11bHRpcGF0aCANCj4+IGRl
dmljZXMgKi8NCj4+ICsgICAgICAgICAgICByZXR1cm4gLUVOT1RTVVA7DQo+PiArICAgICAgICAg
ICAgYnJlYWs7DQo+DQo+KE5vdCBzdXJlIHdoeSB0aGlzIGJyZWFrIGlzIGhlcmUuKQ0KPg0KPk1h
eA0KPg0KPj4gICAgICAgICAgIH0NCj4+ICAgICAgIH0NCj4+ICAgI2VuZGlmDQo+PiAtLQ0KPj4g
Mi4yNy4wDQo+PiANCg0K

------=_001_NextPart501182822776_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }body { font-size: 14px; font-f=
amily: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</sty=
le></head><body><div>&gt;On Wed, Mar 24, 2021 at 4:52 PM Max Reitz &lt;mre=
itz@redhat.com&gt; wrote:</div><div>&gt;On 22.03.21 10:25, ChangLimin wrot=
e:</div><div>&gt;&gt; For Linux 5.10/5.11, qemu write zeros to a multipath=
 device using</div><div>&gt;&gt; ioctl(fd, BLKZEROOUT, range) with cache n=
one or directsync return -EBUSY</div><div>&gt;&gt; permanently.</div><div>=
&gt;</div><div>&gt;So as far as I can track back the discussion, Kevin ask=
ed on v1 why we=E2=80=99d&nbsp;</div><div>&gt;set has_write_zeroes to fals=
e, i.e. whether the EBUSY might not go away&nbsp;</div><div>&gt;at some po=
int, and if it did, whether we shouldn=E2=80=99t retry BLKZEROOUT then.</d=
iv><div>&gt;You haven=E2=80=99t explicitly replied to that question (as fa=
r as I can see),&nbsp;</div><div>&gt;so it kind of still stands.</div><div=
>&gt;</div><div>&gt;Implicitly, there are two conflicting answers in this =
patch: On one&nbsp;</div><div>&gt;hand, the commit message says =E2=80=9Cp=
ermanently=E2=80=9D, and this is what you told&nbsp;</div><div>&gt;Nir as =
a realistic case where this can occur.&nbsp;</div><div><br></div><div>For =
Linux 5.10/5.11, the EBUSY is permanently, the reproduce step is below.&nb=
sp;</div><div>For other Linux version,&nbsp;<span style=3D"line-height: 1.=
5; background-color: transparent;">the EBUSY may be&nbsp;temporary.&nbsp;<=
/span></div><div><span style=3D"line-height: 1.5; background-color: transp=
arent;">Because&nbsp;</span><span style=3D"line-height: 1.5; background-co=
lor: transparent;">&nbsp;</span><span style=3D"line-height: 1.5; backgroun=
d-color: transparent;">Linux 5.10/5.11 is not used widely,&nbsp;</span><sp=
an style=3D"line-height: 1.5; background-color: transparent;">so do not se=
t&nbsp;</span><span style=3D"line-height: 1.5; background-color: transpare=
nt;">has_write_zeroes to false.</span></div><div><br></div><div>&gt;I'm af=
raid ChangLimin did not answer my question. I'm looking for real</div><div=
>&gt;world used case when qemu cannot write zeros to multipath device, whe=
n</div><div>&gt;nobody else is using the device.</div><div>&gt;</div><div>=
&gt;I tried to reproduce this on Fedora (kernel 5.10) with qemu-img conver=
t,</div><div>&gt;once with a multipath device, and once with logical volum=
e on a vg created</div><div>&gt;on the multipath device, and I could not r=
eproduce this issue.</div><div><br></div><div><div>The following is steps =
to reproduct the issue on Fedora 34.</div><div><div><br></div><div># uname=
 -a</div><div>Linux fedora-34 5.11.3-300.fc34.x86_64 #1 SMP Thu Mar 4 19:0=
3:18 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux</div></div><div><div><br></di=
v><div># qemu-img -V</div><div>qemu-img version 5.2.0 (qemu-5.2.0-5.fc34.1=
)</div></div><div><br></div><div>1. &nbsp;Login in an ISCSI LUN created us=
ing targetcli on ubuntu 20.04</div><div># iscsiadm -m discovery -t st -p 1=
92.169.1.109</div><div>192.169.1.109:3260,1 iqn.2003-01.org.linux-iscsi:li=
o-lv100</div><div><br></div><div># iscsiadm -m node -l -T&nbsp;<span style=
=3D"line-height: 1.5; background-color: transparent;">iqn.2003-01.org.linu=
x-iscsi:lio-lv100</span></div><div><span style=3D"background-color: transp=
arent;"><div># iscsiadm -m session</div><div>tcp: [1] 192.169.1.109:3260,1=
 iqn.2003-01.org.linux-iscsi:lio-lv100 (non-flash)</div><div><br></div></s=
pan></div><div><span style=3D"line-height: 1.5; background-color: transpar=
ent;">2. start multipathd service</span></div><div><span style=3D"backgrou=
nd-color: transparent;"># mpathconf&nbsp;</span><span style=3D"background-=
color: transparent;">--enable</span></div><div># systemctl start multipath=
d</div><div><br></div><div>3. &nbsp;add multipath path</div><div><div># mu=
ltipath -a `/lib/udev/scsi_id -g /dev/sdb` &nbsp; # sdb means the ISCSI LU=
N</div><div>wwid '36001405b76856e4816b48b99c6a77de3' added</div></div><div=
><br></div><div><div># multipathd add path /dev/sdb</div><div>ok</div></di=
v><div><br></div><div><div># multipath -ll &nbsp; &nbsp; # /dev/dm-1 is th=
e multipath device based on /dev/sdb</div><div>mpatha (36001405bebfc3a0522=
541cda30220db9) dm-1 LIO-ORG,lv102</div><div>size=3D1.0G features=3D'0' hw=
handler=3D'1 alua' wp=3Drw</div><div>`-+- policy=3D'service-time 0' prio=
=3D50 status=3Dactive</div><div>&nbsp; `- 5:0:0:0 &nbsp;sdd &nbsp;8:48 &nb=
sp; active ready running</div></div><div><br></div><div>4. qemu-img return=
 EBUSY both to dm-1 and sdb</div><div># wget&nbsp;http://download.cirros-c=
loud.net/0.4.0/cirros-0.4.0-x86_64-disk.img</div><div># qemu-img convert -=
O raw -t none&nbsp;<span style=3D"line-height: 1.5; background-color: tran=
sparent;">cirros-0.4.0-x86_64-disk.img /dev/dm-1</span></div><div><span st=
yle=3D"background-color: transparent;">qemu-img: error while writing at by=
te 0: Device or resource busy</span></div><div><span style=3D"background-c=
olor: transparent;"><br></span></div><div><span style=3D"background-color:=
 transparent;"><div># qemu-img convert -O raw -t none cirros-0.4.0-x86_64-=
disk.img /dev/sdb</div><div>qemu-img: error while writing at byte 0: Devic=
e or resource busy</div><div><br></div></span></div><div><span style=3D"ba=
ckground-color: transparent;">5. blkdiscard also return EBUSY&nbsp;</span>=
<span style=3D"line-height: 1.5; background-color: transparent;">&nbsp;</s=
pan><span style=3D"line-height: 1.5; background-color: transparent;">both =
to dm-1 and sdb</span></div><div><span style=3D"background-color: transpar=
ent;"># blkdiscard -o 0 -l 4096 /dev/dm-1</span></div><div>blkdiscard: can=
not open /dev/dm-1: Device or resource busy</div></div><div><div><br></div=
><div># blkdiscard -o 0 -l 4096 /dev/sdb</div><div>blkdiscard: cannot open=
 /dev/s<span style=3D"line-height: 1.5; background-color: transparent;">db=
: No such file or directory</span></div></div><div><span style=3D"line-hei=
ght: 1.5; background-color: transparent;"><br></span></div><div><span styl=
e=3D"line-height: 1.5; background-color: transparent;">6. dd write zero is=
 good, because it does not use blkdiscard</span></div><div><span style=3D"=
background-color: transparent;"># dd if=3D/dev/zero of=3D/dev/dm-1 bs=3D1M=
 count=3D100 oflag=3Ddirect&nbsp;</span></div><div>100+0 records in</div><=
div>100+0 records out</div><div>104857600 bytes (105 MB, 100 MiB) copied, =
2.33623 s, 44.9 MB/s</div><div><br></div><div>7. The LUN&nbsp;should suppo=
rt blkdiscard feature, otherwise it will not write zero&nbsp;</div><div>wi=
th&nbsp;<span style=3D"line-height: 1.5; background-color: transparent;">&=
nbsp;ioctl(fd, BLKZEROOUT, range)</span><span style=3D"line-height: 1.5; b=
ackground-color: transparent;">&nbsp;</span></div><div><br></div><div>&gt;=
If I understand the kernel change correctly, this can happen when there is=
</div><div>&gt;a mounted file system on top of the multipath device. I don=
't think we have&nbsp;</div><div>&gt;a use case when qemu accesses a multi=
path device when the device is used</div><div>&gt;by a file system, but ma=
ybe I missed something.</div><div>&gt;&nbsp;</div><div>&gt;So that to me i=
mplies&nbsp;</div><div>&gt;that we actually should not retry BLKZEROOUT, b=
ecause the EBUSY will&nbsp;</div><div>&gt;remain, and that condition won=
=E2=80=99t change while the block device is in use&nbsp;</div><div>&gt;by =
qemu.</div><div>&gt;</div><div><span style=3D"line-height: 1.5; background=
-color: transparent;">&gt;On the other hand, in the code, you have decided=
 not to reset&nbsp;</span></div><div>&gt;has_write_zeroes to false, so the=
 implementation will retry.</div><div>&gt;</div><div>&gt;EBUSY is usually =
a temporary error, so retrying makes sense. The question</div><div>&gt;is =
if we really can write zeroes manually in this case?</div><div>&gt;&nbsp;<=
/div><div>&gt;So I don=E2=80=99t quite understand. &nbsp;Should we keep tr=
ying BLKZEROOUT or is&nbsp;</div><div>&gt;there no chance of it working af=
ter it has at one point failed with&nbsp;</div><div>&gt;EBUSY? &nbsp;(Are =
there other cases besides what=E2=80=99s described in this commit&nbsp;</d=
iv><div>&gt;message where EBUSY might be returned and it is only temporary=
?)</div><div>&gt;</div><div>&gt;&gt; Fallback to pwritev instead of exit f=
or -EBUSY error.</div><div>&gt;&gt;&nbsp;</div><div>&gt;&gt; The issue was=
 introduced in Linux 5.10:</div><div>&gt;&gt; https://git.kernel.org/pub/s=
cm/linux/kernel/git/stable/linux.git/commit/?id=3D384d87ef2c954fc58e6c5fd8=
253e4a1984f5fe02</div><div>&gt;&gt;&nbsp;</div><div>&gt;&gt; Fixed in Linu=
x 5.12:</div><div>&gt;&gt; https://git.kernel.org/pub/scm/linux/kernel/git=
/torvalds/linux.git/commit/?id=3D56887cffe946bb0a90c74429fa94d6110a73119d<=
/div><div>&gt;&gt;&nbsp;</div><div>&gt;&gt; Signed-off-by: ChangLimin &lt;=
changlm@chinatelecom.cn&gt;</div><div>&gt;&gt; ---</div><div>&gt;&gt; &nbs=
p; block/file-posix.c | 8 ++++++--</div><div>&gt;&gt; &nbsp; 1 file change=
d, 6 insertions(+), 2 deletions(-)</div><div>&gt;&gt;&nbsp;</div><div>&gt;=
&gt; diff --git a/block/file-posix.c b/block/file-posix.c</div><div>&gt;&g=
t; index 20e14f8e96..d4054ac9cb 100644</div><div>&gt;&gt; --- a/block/file=
-posix.c</div><div>&gt;&gt; +++ b/block/file-posix.c</div><div>&gt;&gt; @@=
 -1624,8 +1624,12 @@ static ssize_t&nbsp;</div><div>&gt;&gt; handle_aiocb_=
write_zeroes_block(RawPosixAIOData *aiocb)</div><div>&gt;&gt; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; } while (errno =3D=3D EINTR);</div><div>&gt;&gt;&nb=
sp;</div><div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ret =3D translat=
e_err(-errno);</div><div>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp;if (ret =3D=
=3D -ENOTSUP) {</div><div>&gt;&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;s-&gt;has_write_zeroes =3D false;</div><div>&gt;&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;switch (ret) {</div><div>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
;case -ENOTSUP:</div><div>&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;s-&gt;has_write_zeroes =3D false; /* fall through */</div><div>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp;case -EBUSY: /* Linux 5.10/5.11 may return =
-EBUSY for multipath&nbsp;</div><div>&gt;&gt; devices */</div><div>&gt;&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -ENOTSUP;</div><div>&g=
t;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div><div>&gt;</d=
iv><div>&gt;(Not sure why this break is here.)</div><div>&gt;</div><div>&g=
t;Max</div><div>&gt;</div><div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 }</div><div>&gt;&gt; &nbsp; &nbsp; &nbsp; }</div><div>&gt;&gt; &nbsp; #en=
dif</div><div>&gt;&gt; --</div><div>&gt;&gt; 2.27.0</div><div>&gt;&gt;&nbs=
p;</div><div><br></div></body></html>
------=_001_NextPart501182822776_=------


