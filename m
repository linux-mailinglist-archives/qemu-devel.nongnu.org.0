Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03893296D7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:19:03 +0100 (CET)
Received: from localhost ([::1]:55256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH0FA-0007BE-SH
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changlm@chinatelecom.cn>)
 id 1lH0C1-0004hL-0A
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:15:45 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:44501
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changlm@chinatelecom.cn>) id 1lH0Bt-0001fM-SD
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:15:44 -0500
HMM_SOURCE_IP: 172.18.0.92:7019.2121736248
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.101.58?logid-2ef1f600f5e04b7fa66fe2bcf1f81bef
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id 27F952800AB;
 Tue,  2 Mar 2021 16:15:28 +0800 (CST)
X-189-SAVE-TO-SEND: 71112636@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 2ef1f600f5e04b7fa66fe2bcf1f81bef for
 gcf1129@gmail.com; Tue Mar  2 16:15:30 2021
X-Transaction-ID: 2ef1f600f5e04b7fa66fe2bcf1f81bef
X-filter-score: filter<0>
X-Real-From: changlm@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Tue, 2 Mar 2021 16:15:23 +0800
From: ChangLimin <changlm@chinatelecom.cn>
To: "Sean Kuo" <gcf1129@gmail.com>
Subject: Re: Re: [Bug 1917394] [NEW] command lspci does not show the IVSHMEM
 device
References: <161465544550.24578.14846009621606228644.malonedeb@wampee.canonical.com>, 
 <2021030215305283912052@chinatelecom.cn>, 
 <CAFkVRJKbRqjEnF_K2RXYTb+ZF0KnFO+J05f1ETEaumxc=CVvaA@mail.gmail.com>
X-Priority: 3
X-GUID: EC6759F4-811B-48FE-B72F-86224DAA5618
X-Has-Attach: no
X-Mailer: Foxmail 7.2.17.58[cn]
Mime-Version: 1.0
Message-ID: <2021030216152347613554@chinatelecom.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart650134582402_=----"
Received-SPF: pass client-ip=42.123.76.223;
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
Cc: Bug 1917394 <1917394@bugs.launchpad.net>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

------=_001_NextPart650134582402_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

VGhlcmUgaXMgbm8gZHJpdmVyIGZvciBpdC4gWW91IHNob3VsZCB3cml0ZSBpdCBieSB5b3VzZWxm
LiBNYXliZSB5b3UgY2FuIHJlZmVyIHRvIA0KaHR0cDovL2RvYy5kcGRrLm9yZy9ndWlkZXMtMS44
L3Byb2dfZ3VpZGUvaXZzaG1lbV9saWIuaHRtbCBhbmQgZHBkayBzb3VyY2UuDQoNCkdvb2wgbHVj
ayENCg0KIA0KRnJvbTogU2VhbiBLdW8NCkRhdGU6IDIwMjEtMDMtMDIgMTU6NTkNClRvOiBDaGFu
Z0xpbWluDQpDQzogQnVnIDE5MTczOTQ7IHFlbXUtZGV2ZWwNClN1YmplY3Q6IFJlOiBbQnVnIDE5
MTczOTRdIFtORVddIGNvbW1hbmQgbHNwY2kgZG9lcyBub3Qgc2hvdyB0aGUgSVZTSE1FTSBkZXZp
Y2UNCkhpIENoYW5nTGltaW4sDQoNClRoYW5rcyBmb3IgeW91ciByZXBseS4gSSBjaGVja2VkIGFn
YWluIHRvIGZpbmQgdGhlIGRldmljZS4uLiBJIHRob3VnaHQgdGhlIG5hbWUgd2FzIGl2c2htZW0u
DQpJIGRvbid0IGZpbmQgYW55IGRyaXZlciBjb2RlIGZvciBJVlNITUVNIGluIHRoZSBsaW51eCBh
bmQgcWVtdSByZXBvLiBDYW4geW91IGdpdmUgbWUgc29tZSBoZWxwPyANCg0KMDA6MTAuMCBSQU0g
bWVtb3J5OiBSZWQgSGF0LCBJbmMuIEludGVyLVZNIHNoYXJlZCBtZW1vcnkgKHJldiAwMSkNClN1
YnN5c3RlbTogUmVkIEhhdCwgSW5jLiBRRU1VIFZpcnR1YWwgTWFjaGluZQ0KRmxhZ3M6IGZhc3Qg
ZGV2c2VsDQpNZW1vcnkgYXQgZmNjMWMwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3Np
emU9MjU2XQ0KTWVtb3J5IGF0IGZkYzAwMDAwICg2NC1iaXQsIHByZWZldGNoYWJsZSkgW3NpemU9
NE1dDQoNClRoYW5rcywNClNlYW4NCg0KDQoNCg0KDQoNCk9uIFR1ZSwgTWFyIDIsIDIwMjEgYXQg
MzozMSBQTSBDaGFuZ0xpbWluIDxjaGFuZ2xtQGNoaW5hdGVsZWNvbS5jbj4gd3JvdGU6DQpDYW4g
eW91IGdpdmUgdGhlIGxzcGNpIG1lc3NhZ2VzPyBUaGUgYmVsb3cgaXMgbXkgb3V0cHV0LiAgVGhl
cmUgaXMgYSBSQU0gbWVtb3J5IGRldmljZS4NCg0KJCBsc3BjaQ0KMDA6MDAuMCBIb3N0IGJyaWRn
ZTogSW50ZWwgQ29ycG9yYXRpb24gNDQwRlggLSA4MjQ0MUZYIFBNQyBbTmF0b21hXSAocmV2IDAy
KQ0KMDA6MDEuMCBJU0EgYnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjM3MVNCIFBJSVgzIElT
QSBbTmF0b21hL1RyaXRvbiBJSV0NCjAwOjAxLjEgSURFIGludGVyZmFjZTogSW50ZWwgQ29ycG9y
YXRpb24gODIzNzFTQiBQSUlYMyBJREUgW05hdG9tYS9Ucml0b24gSUldDQowMDowMS4yIFVTQiBj
b250cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjM3MVNCIFBJSVgzIFVTQiBbTmF0b21hL1Ry
aXRvbiBJSV0gKHJldiAwMSkNCjAwOjAxLjMgQnJpZGdlOiBJbnRlbCBDb3Jwb3JhdGlvbiA4MjM3
MUFCL0VCL01CIFBJSVg0IEFDUEkgKHJldiAwMykNCjAwOjAyLjAgVkdBIGNvbXBhdGlibGUgY29u
dHJvbGxlcjogRGV2aWNlIDEyMzQ6MTExMSAocmV2IDAyKQ0KMDA6MDMuMCBQQ0kgYnJpZGdlOiBS
ZWQgSGF0LCBJbmMuIFFFTVUgUENJLVBDSSBicmlkZ2UNCjAwOjA0LjAgRXRoZXJuZXQgY29udHJv
bGxlcjogUmVkIEhhdCwgSW5jLiBWaXJ0aW8gbmV0d29yayBkZXZpY2UNCjAwOjA1LjAgU0NTSSBz
dG9yYWdlIGNvbnRyb2xsZXI6IFJlZCBIYXQsIEluYy4gVmlydGlvIFNDU0kNCjAwOjA2LjAgQ29t
bXVuaWNhdGlvbiBjb250cm9sbGVyOiBSZWQgSGF0LCBJbmMuIFZpcnRpbyBjb25zb2xlDQowMDox
MC4wIFJBTSBtZW1vcnk6IFJlZCBIYXQsIEluYy4gSW50ZXItVk0gc2hhcmVkIG1lbW9yeSAocmV2
IDAxKQ0KMDE6MDcuMCBQQ0kgYnJpZGdlOiBSZWQgSGF0LCBJbmMuIFFFTVUgUENJLVBDSSBicmlk
Z2UNCg0KIA0KRnJvbTogc2VhbiBrdW8NCkRhdGU6IDIwMjEtMDMtMDIgMTE6MjQNClRvOiBxZW11
LWRldmVsDQpTdWJqZWN0OiBbQnVnIDE5MTczOTRdIFtORVddIGNvbW1hbmQgbHNwY2kgZG9lcyBu
b3Qgc2hvdyB0aGUgSVZTSE1FTSBkZXZpY2UNClB1YmxpYyBidWcgcmVwb3J0ZWQ6DQogDQpxZXVt
IHZlcnNpb246DQpRRU1VIGVtdWxhdG9yIHZlcnNpb24gNC4yLjENCiANCkkgbWV0IGEgcHJvYmxl
bSB3aGVuIEkgdHJpZWQgdG8gdXNlIElWU0hNRU0uIENvbW1hbmQgbHNwY2kgZG9lcyBub3Qgc2hv
dyB0aGUgSVZTSE1FTSBkZXZpY2UuDQpCZWxvdyBpcyB0aGUgY29uZmlndXJhdGlvbiBmcm9tIG15
IHNpZGU6DQogDQoxLiAgZ3Vlc3Qgdm0geG1sIGNvbmZpZ3VyYXRpb24uDQogIDxzaG1lbSBuYW1l
PSdpdnNobWVtJz4NCiAgICAgIDxtb2RlbCB0eXBlPSdpdnNobWVtLXBsYWluJy8+DQogICAgICA8
c2l6ZSB1bml0PSdNJz4yPC9zaXplPg0KICAgICAgPGFkZHJlc3MgdHlwZT0ncGNpJyBkb21haW49
JzB4MDAwMCcgYnVzPScweDAwJyBzbG90PScweDEwJyBmdW5jdGlvbj0nMHgwJy8+DQogICAgPC9z
aG1lbT4NCiANCjIuIGFmdGVyIHRoZSBib290aW5nIHVwIGFuZCBJIGZvdW5kIHRoZSBxZW11IGNv
bW1hbmRsaW5lIGlkZWVkbHkgIGhhdmUgdGhlIGRldmljZSBvcHRpb246DQpwcyBhdXggfCBncmVw
IGl2c2htZW0NCi91c3IvYmluL3FlbXUtc3lzdGVtLXg4Nl82NCANCiAgICAgIC4uLi4uLi4oaWdu
b3JlIG90aGVyIG9wdGlvbnMpDQotb2JqZWN0IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9c2htbWVt
LXNobWVtMCxtZW0tcGF0aD0vZGV2L3NobS9ob3N0bWVtLHNpemU9NDE5NDMwNCxzaGFyZT15ZXMg
LWRldmljZSBpdnNobWVtLXBsYWluLGlkPXNobWVtMCxtZW1kZXY9c2htbWVtLXNobWVtMCxidXM9
cGNpZS4wLGFkZHI9MHgxMA0KIA0KMy4gbHNwY2kgY29tbWFuZCAgbm90IHNob3duIHRoZSBkZXZp
Y2UuDQogDQo0LiBsc2h3IGNvbW1hbmQgaW5kZWVkbHkgc2hvdyB0aGUgZGV2aWNlOg0KIA0KKi1t
ZW1vcnkgVU5DTEFJTUVEDQogICAgICAgICAgICAgZGVzY3JpcHRpb246IFJBTSBtZW1vcnkNCiAg
ICAgICAgICAgICBwcm9kdWN0OiBJbnRlci1WTSBzaGFyZWQgbWVtb3J5DQogICAgICAgICAgICAg
dmVuZG9yOiBSZWQgSGF0LCBJbmMuDQogICAgICAgICAgICAgcGh5c2ljYWwgaWQ6IDEwDQogICAg
ICAgICAgICAgYnVzIGluZm86IHBjaUAwMDAwOjAwOjEwLjANCiAgICAgICAgICAgICB2ZXJzaW9u
OiAwMQ0KICAgICAgICAgICAgIHdpZHRoOiA2NCBiaXRzDQogICAgICAgICAgICAgY2xvY2s6IDMz
TUh6ICgzMC4zbnMpDQogICAgICAgICAgICAgY29uZmlndXJhdGlvbjogbGF0ZW5jeT0wDQogICAg
ICAgICAgICAgcmVzb3VyY2VzOiBtZW1vcnk6ZmNjMWMwMDAtZmNjMWMwZmYgbWVtb3J5OmZkYzAw
MDAwLWZkZmZmZmZmDQogDQpNeSBob3N0IGFuZCB2bSBvcyBpcyB1YnVudHUgMjAuMDQgYW5kIHZl
cnNpb24gaXM6DQojNDl+MjAuMDQuMS1VYnVudHUgU01QIEZyaSBGZWIgNSAwOTo1Nzo1NiBVVEMg
MjAyMSB4ODZfNjQgeDg2XzY0IHg4Nl82NCBHTlUvTGludXgNCiANCioqIEFmZmVjdHM6IHFlbXUN
CiAgICAgSW1wb3J0YW5jZTogVW5kZWNpZGVkDQogICAgICAgICBTdGF0dXM6IE5ldw0KIA0KLS0g
DQpZb3UgcmVjZWl2ZWQgdGhpcyBidWcgbm90aWZpY2F0aW9uIGJlY2F1c2UgeW91IGFyZSBhIG1l
bWJlciBvZiBxZW11LQ0KZGV2ZWwtbWwsIHdoaWNoIGlzIHN1YnNjcmliZWQgdG8gUUVNVS4NCmh0
dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTkxNzM5NA0KIA0KVGl0bGU6DQogIGNvbW1h
bmQgbHNwY2kgZG9lcyBub3Qgc2hvdyB0aGUgSVZTSE1FTSBkZXZpY2UNCiANClN0YXR1cyBpbiBR
RU1VOg0KICBOZXcNCiANCkJ1ZyBkZXNjcmlwdGlvbjoNCiAgcWV1bSB2ZXJzaW9uOg0KICBRRU1V
IGVtdWxhdG9yIHZlcnNpb24gNC4yLjENCiANCiAgSSBtZXQgYSBwcm9ibGVtIHdoZW4gSSB0cmll
ZCB0byB1c2UgSVZTSE1FTS4gQ29tbWFuZCBsc3BjaSBkb2VzIG5vdCBzaG93IHRoZSBJVlNITUVN
IGRldmljZS4NCiAgQmVsb3cgaXMgdGhlIGNvbmZpZ3VyYXRpb24gZnJvbSBteSBzaWRlOg0KIA0K
ICAxLiAgZ3Vlc3Qgdm0geG1sIGNvbmZpZ3VyYXRpb24uDQogICAgPHNobWVtIG5hbWU9J2l2c2ht
ZW0nPg0KICAgICAgICA8bW9kZWwgdHlwZT0naXZzaG1lbS1wbGFpbicvPg0KICAgICAgICA8c2l6
ZSB1bml0PSdNJz4yPC9zaXplPg0KICAgICAgICA8YWRkcmVzcyB0eXBlPSdwY2knIGRvbWFpbj0n
MHgwMDAwJyBidXM9JzB4MDAnIHNsb3Q9JzB4MTAnIGZ1bmN0aW9uPScweDAnLz4NCiAgICAgIDwv
c2htZW0+DQogDQogIDIuIGFmdGVyIHRoZSBib290aW5nIHVwIGFuZCBJIGZvdW5kIHRoZSBxZW11
IGNvbW1hbmRsaW5lIGlkZWVkbHkgIGhhdmUgdGhlIGRldmljZSBvcHRpb246DQogIHBzIGF1eCB8
IGdyZXAgaXZzaG1lbQ0KICAgL3Vzci9iaW4vcWVtdS1zeXN0ZW0teDg2XzY0IA0KICAgICAgICAu
Li4uLi4uKGlnbm9yZSBvdGhlciBvcHRpb25zKQ0KICAtb2JqZWN0IG1lbW9yeS1iYWNrZW5kLWZp
bGUsaWQ9c2htbWVtLXNobWVtMCxtZW0tcGF0aD0vZGV2L3NobS9ob3N0bWVtLHNpemU9NDE5NDMw
NCxzaGFyZT15ZXMgLWRldmljZSBpdnNobWVtLXBsYWluLGlkPXNobWVtMCxtZW1kZXY9c2htbWVt
LXNobWVtMCxidXM9cGNpZS4wLGFkZHI9MHgxMA0KIA0KICAzLiBsc3BjaSBjb21tYW5kICBub3Qg
c2hvd24gdGhlIGRldmljZS4NCiANCiAgNC4gbHNodyBjb21tYW5kIGluZGVlZGx5IHNob3cgdGhl
IGRldmljZToNCiANCiAgKi1tZW1vcnkgVU5DTEFJTUVEDQogICAgICAgICAgICAgICBkZXNjcmlw
dGlvbjogUkFNIG1lbW9yeQ0KICAgICAgICAgICAgICAgcHJvZHVjdDogSW50ZXItVk0gc2hhcmVk
IG1lbW9yeQ0KICAgICAgICAgICAgICAgdmVuZG9yOiBSZWQgSGF0LCBJbmMuDQogICAgICAgICAg
ICAgICBwaHlzaWNhbCBpZDogMTANCiAgICAgICAgICAgICAgIGJ1cyBpbmZvOiBwY2lAMDAwMDow
MDoxMC4wDQogICAgICAgICAgICAgICB2ZXJzaW9uOiAwMQ0KICAgICAgICAgICAgICAgd2lkdGg6
IDY0IGJpdHMNCiAgICAgICAgICAgICAgIGNsb2NrOiAzM01IeiAoMzAuM25zKQ0KICAgICAgICAg
ICAgICAgY29uZmlndXJhdGlvbjogbGF0ZW5jeT0wDQogICAgICAgICAgICAgICByZXNvdXJjZXM6
IG1lbW9yeTpmY2MxYzAwMC1mY2MxYzBmZiBtZW1vcnk6ZmRjMDAwMDAtZmRmZmZmZmYNCiANCiAg
TXkgaG9zdCBhbmQgdm0gb3MgaXMgdWJ1bnR1IDIwLjA0IGFuZCB2ZXJzaW9uIGlzOg0KICAjNDl+
MjAuMDQuMS1VYnVudHUgU01QIEZyaSBGZWIgNSAwOTo1Nzo1NiBVVEMgMjAyMSB4ODZfNjQgeDg2
XzY0IHg4Nl82NCBHTlUvTGludXgNCiANClRvIG1hbmFnZSBub3RpZmljYXRpb25zIGFib3V0IHRo
aXMgYnVnIGdvIHRvOg0KaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvcWVtdS8rYnVnLzE5MTcz
OTQvK3N1YnNjcmlwdGlvbnMNCiANCg==

------=_001_NextPart650134582402_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }div.FoxDiv20210302161323916750 { =
}body { font-size: 14px; font-family: 'Microsoft YaHei UI'; color: rgb(0, =
0, 0); line-height: 1.5; }</style></head><body>=0A<div>There is no driver =
for it. You should write it by youself. Maybe you can refer to&nbsp;</div>=
<div><span></span><a href=3D"http://doc.dpdk.org/guides-1.8/prog_guide/ivs=
hmem_lib.html" microsoft=3D"" yahei=3D"" ui';=3D"" font-size:=3D"" 14px;=
=3D"" font-weight:=3D"" normal;=3D"" font-style:=3D"" normal;'=3D"" style=
=3D"line-height: 1.5; background-color: transparent;">http://doc.dpdk.org/=
guides-1.8/prog_guide/ivshmem_lib.html</a><span microsoft=3D"" yahei=3D"" =
ui';=3D"" font-size:=3D"" 14px;=3D"" color:=3D"" rgb(0,=3D"" 0,=3D"" 0);=
=3D"" background-color:=3D"" rgba(0,=3D"" font-weight:=3D"" normal;=3D"" f=
ont-style:=3D"" normal;text-decoration:=3D"" none;'=3D"" style=3D"line-hei=
ght: 1.5; background-color: transparent;">&nbsp;and dpdk source.</span></d=
iv><div><span microsoft=3D"" yahei=3D"" ui';=3D"" font-size:=3D"" 14px;=3D=
"" color:=3D"" rgb(0,=3D"" 0,=3D"" 0);=3D"" background-color:=3D"" rgba(0,=
=3D"" font-weight:=3D"" normal;=3D"" font-style:=3D"" normal;text-decorati=
on:=3D"" none;'=3D"" style=3D"line-height: 1.5; background-color: transpar=
ent;"><br></span></div><div>Gool luck!</div><span microsoft=3D"" yahei=3D"=
" ui';=3D"" font-size:=3D"" 14px;=3D"" color:=3D"" rgb(0,=3D"" 0,=3D"" 0);=
=3D"" background-color:=3D"" rgba(0,=3D"" font-weight:=3D"" normal;=3D"" f=
ont-style:=3D"" normal;text-decoration:=3D"" none;'=3D""></span>=0A<div><b=
r></div>=0A<blockquote style=3D"margin-Top: 0px; margin-Bottom: 0px; margi=
n-Left: 0.5em; margin-Right: inherit"><div>&nbsp;</div><div style=3D"borde=
r:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div styl=
e=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMILY:ta=
homa;COLOR:#000000; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PADDING-TOP:=
 8px"><div><b>From:</b>&nbsp;<a href=3D"mailto:gcf1129@gmail.com">Sean Kuo=
</a></div><div><b>Date:</b>&nbsp;2021-03-02&nbsp;15:59</div><div><b>To:</b=
>&nbsp;<a href=3D"mailto:changlm@chinatelecom.cn">ChangLimin</a></div><div=
><b>CC:</b>&nbsp;<a href=3D"mailto:1917394@bugs.launchpad.net">Bug 1917394=
</a>; <a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel</a></div><div><b=
>Subject:</b>&nbsp;Re: [Bug 1917394] [NEW] command lspci does not show the=
 IVSHMEM device</div></div></div><div><div class=3D"FoxDiv2021030216132391=
6750"><div dir=3D"ltr">Hi&nbsp;ChangLimin,<div><br></div><div>Thanks for y=
our reply. I checked again to find the device... I thought the name was iv=
shmem.</div><div>I don't find any driver code for IVSHMEM in the linux and=
 qemu repo. Can you give me some help?&nbsp;</div><div><br></div><div>00:1=
0.0 RAM memory: Red Hat, Inc. Inter-VM shared memory (rev 01)<br>	Subsyste=
m: Red Hat, Inc. QEMU Virtual Machine<br>	Flags: fast devsel<br>	Memory at=
 fcc1c000 (32-bit, non-prefetchable) [size=3D256]<br>	Memory at fdc00000 (=
64-bit, prefetchable) [size=3D4M]</div><div><br></div><div>Thanks,</div><d=
iv>Sean</div><div><br></div><div><br><div><br></div><div><br></div></div><=
/div><div dir=3D"ltr"><div><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 3:31 PM Chang=
Limin &lt;<a href=3D"mailto:changlm@chinatelecom.cn" target=3D"_blank">cha=
nglm@chinatelecom.cn</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div>=0A<div><span></span><div><span style=3D"line-h=
eight:1.5;background-color:transparent">Can you give the lspci messages? T=
he below is my output.&nbsp; There is a RAM memory device.</span></div><di=
v><span style=3D"line-height:1.5;background-color:transparent"><br></span>=
</div><div><span style=3D"line-height:1.5;background-color:transparent">$ =
lspci</span></div><div>00:00.0 Host bridge: Intel Corporation 440FX - 8244=
1FX PMC [Natoma] (rev 02)</div><div>00:01.0 ISA bridge: Intel Corporation =
82371SB PIIX3 ISA [Natoma/Triton II]</div><div>00:01.1 IDE interface: Inte=
l Corporation 82371SB PIIX3 IDE [Natoma/Triton II]</div><div>00:01.2 USB c=
ontroller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)=
</div><div>00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev=
 03)</div><div>00:02.0 VGA compatible controller: Device 1234:1111 (rev 02=
)</div><div>00:03.0 PCI bridge: Red Hat, Inc. QEMU PCI-PCI bridge</div><di=
v>00:04.0 Ethernet controller: Red Hat, Inc. Virtio network device</div><d=
iv>00:05.0 SCSI storage controller: Red Hat, Inc. Virtio SCSI</div><div>00=
:06.0 Communication controller: Red Hat, Inc. Virtio console</div><div>00:=
10.0 RAM memory: Red Hat, Inc. Inter-VM shared memory (rev 01)</div><div>0=
1:07.0 PCI bridge: Red Hat, Inc. QEMU PCI-PCI bridge</div></div>=0A<div><b=
r></div>=0A<blockquote style=3D"margin-top:0px;margin-bottom:0px;margin-le=
ft:0.5em;margin-right:inherit"><div>&nbsp;</div><div style=3D"border-right=
:none;border-bottom:none;border-left:none;border-top:1pt solid rgb(181,196=
,223);padding:3pt 0cm 0cm"><div style=3D"padding:8px;font-size:12px;font-f=
amily:tahoma;color:rgb(0,0,0);background:rgb(239,239,239)"><div><b>From:</=
b>&nbsp;<a href=3D"mailto:1917394@bugs.launchpad.net" target=3D"_blank">se=
an kuo</a></div><div><b>Date:</b>&nbsp;2021-03-02&nbsp;11:24</div><div><b>=
To:</b>&nbsp;<a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">qe=
mu-devel</a></div><div><b>Subject:</b>&nbsp;[Bug 1917394] [NEW] command ls=
pci does not show the IVSHMEM device</div></div></div><div><div>Public bug=
 reported:</div>=0A<div>&nbsp;</div>=0A<div>qeum version:</div>=0A<div>QEM=
U emulator version 4.2.1</div>=0A<div>&nbsp;</div>=0A<div>I met a problem =
when I tried to use IVSHMEM. Command lspci does not show the IVSHMEM devic=
e.</div>=0A<div>Below is the configuration from my side:</div>=0A<div>&nbs=
p;</div>=0A<div>1.&nbsp; guest vm xml configuration.</div>=0A<div>&nbsp; &=
lt;shmem name=3D'ivshmem'&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&lt;model type=3D'ivshmem-plain'/&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &lt;size unit=3D'M'&gt;2&lt;/size&gt;</div>=0A<div>&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; &lt;address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' sl=
ot=3D'0x10' function=3D'0x0'/&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp; &lt;/shm=
em&gt;</div>=0A<div>&nbsp;</div>=0A<div>2. after the booting up and I foun=
d the qemu commandline ideedly&nbsp; have the device option:</div>=0A<div>=
ps aux | grep ivshmem</div>=0A<div> /usr/bin/qemu-system-x86_64 </div>=0A<=
div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .......(ignore other options)</div>=0A<=
div>-object memory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/shm/hos=
tmem,size=3D4194304,share=3Dyes -device ivshmem-plain,id=3Dshmem0,memdev=
=3Dshmmem-shmem0,bus=3Dpcie.0,addr=3D0x10</div>=0A<div>&nbsp;</div>=0A<div=
>3. lspci command&nbsp; not shown the device.</div>=0A<div>&nbsp;</div>=0A=
<div>4. lshw command indeedly show the device:</div>=0A<div>&nbsp;</div>=
=0A<div>*-memory UNCLAIMED</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; description: RAM memory</div>=0A<di=
v>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 product: Inter-VM shared memory</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vendor: Red Hat, Inc.</div>=
=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; physical id: 10</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bus info: pci@0000:00:10.0</div>=0A<div=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
version: 01</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; width: 64 bits</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock: 33MHz (30.3ns)</=
div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; configuration: latency=3D0</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resources: memory:fcc1c0=
00-fcc1c0ff memory:fdc00000-fdffffff</div>=0A<div>&nbsp;</div>=0A<div>My h=
ost and vm os is ubuntu 20.04 and version is:</div>=0A<div>#49~20.04.1-Ubu=
ntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux</div>=
=0A<div>&nbsp;</div>=0A<div>** Affects: qemu</div>=0A<div>&nbsp;&nbsp;&nbs=
p;&nbsp; Importance: Undecided</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Status: New</div>=0A<div>&nbsp;</div>=0A<div>-- </div>=
=0A<div>You received this bug notification because you are a member of qem=
u-</div>=0A<div>devel-ml, which is subscribed to QEMU.</div>=0A<div><a hre=
f=3D"https://bugs.launchpad.net/bugs/1917394" target=3D"_blank">https://bu=
gs.launchpad.net/bugs/1917394</a></div>=0A<div>&nbsp;</div>=0A<div>Title:<=
/div>=0A<div>&nbsp; command lspci does not show the IVSHMEM device</div>=
=0A<div>&nbsp;</div>=0A<div>Status in QEMU:</div>=0A<div>&nbsp; New</div>=
=0A<div>&nbsp;</div>=0A<div>Bug description:</div>=0A<div>&nbsp; qeum vers=
ion:</div>=0A<div>&nbsp; QEMU emulator version 4.2.1</div>=0A<div>&nbsp;</=
div>=0A<div>&nbsp; I met a problem when I tried to use IVSHMEM. Command ls=
pci does not show the IVSHMEM device.</div>=0A<div>&nbsp; Below is the con=
figuration from my side:</div>=0A<div>&nbsp;</div>=0A<div>&nbsp; 1.&nbsp; =
guest vm xml configuration.</div>=0A<div>&nbsp;&nbsp;&nbsp; &lt;shmem name=
=3D'ivshmem'&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
lt;model type=3D'ivshmem-plain'/&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &lt;size unit=3D'M'&gt;2&lt;/size&gt;</div>=0A<div>&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;address type=3D'pci' domain=3D'=
0x0000' bus=3D'0x00' slot=3D'0x10' function=3D'0x0'/&gt;</div>=0A<div>&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/shmem&gt;</div>=0A<div>&nbsp;</div>=0A<div=
>&nbsp; 2. after the booting up and I found the qemu commandline ideedly&n=
bsp; have the device option:</div>=0A<div>&nbsp; ps aux | grep ivshmem</di=
v>=0A<div>&nbsp;&nbsp; /usr/bin/qemu-system-x86_64 </div>=0A<div>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .......(ignore other options)</div>=0A<d=
iv>&nbsp; -object memory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/s=
hm/hostmem,size=3D4194304,share=3Dyes -device ivshmem-plain,id=3Dshmem0,me=
mdev=3Dshmmem-shmem0,bus=3Dpcie.0,addr=3D0x10</div>=0A<div>&nbsp;</div>=0A=
<div>&nbsp; 3. lspci command&nbsp; not shown the device.</div>=0A<div>&nbs=
p;</div>=0A<div>&nbsp; 4. lshw command indeedly show the device:</div>=0A<=
div>&nbsp;</div>=0A<div>&nbsp; *-memory UNCLAIMED</div>=0A<div>&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
description: RAM memory</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; product: Inter-VM shared m=
emory</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vendor: Red Hat, Inc.</div>=0A<div>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; physical id: 10</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bus info: pci@0000:00:10.0</div>=
=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; version: 01</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; width: 64 bits</div=
>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; clock: 33MHz (30.3ns)</div>=0A<div>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; configur=
ation: latency=3D0</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resources: memory:fcc1c000-fcc1=
c0ff memory:fdc00000-fdffffff</div>=0A<div>&nbsp;</div>=0A<div>&nbsp; My h=
ost and vm os is ubuntu 20.04 and version is:</div>=0A<div>&nbsp; #49~20.0=
4.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux<=
/div>=0A<div>&nbsp;</div>=0A<div>To manage notifications about this bug go=
 to:</div>=0A<div><a href=3D"https://bugs.launchpad.net/qemu/+bug/1917394/=
+subscriptions" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/191=
7394/+subscriptions</a></div>=0A<div>&nbsp;</div>=0A</div></blockquote>=0A=
</div></blockquote></div>=0A</div></div></blockquote>=0A</body></html>
------=_001_NextPart650134582402_=------


