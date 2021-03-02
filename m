Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A173296A3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:32:58 +0100 (CET)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGzWb-0002iC-51
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changlm@chinatelecom.cn>)
 id 1lGzUw-0001ud-CQ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:31:14 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:51672
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changlm@chinatelecom.cn>) id 1lGzUs-0008QK-4x
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 02:31:13 -0500
HMM_SOURCE_IP: 172.18.0.92:37527.1877433154
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-106.120.101.58?logid-6683da60a19642feb9695fd8141778e8
 (unknown [172.18.0.92])
 by chinatelecom.cn (HERMES) with SMTP id C990E28009F;
 Tue,  2 Mar 2021 15:30:57 +0800 (CST)
X-189-SAVE-TO-SEND: 71112636@chinatelecom.cn
Received: from  ([172.18.0.92])
 by App0021 with ESMTP id 6683da60a19642feb9695fd8141778e8 for
 gcf1129@gmail.com; Tue Mar  2 15:31:00 2021
X-Transaction-ID: 6683da60a19642feb9695fd8141778e8
X-filter-score: filter<0>
X-Real-From: changlm@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
Date: Tue, 2 Mar 2021 15:30:53 +0800
From: ChangLimin <changlm@chinatelecom.cn>
To: "Sean Kuo" <gcf1129@gmail.com>, 
 "Bug 1917394" <1917394@bugs.launchpad.net>, 
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Bug 1917394] [NEW] command lspci does not show the IVSHMEM device
References: <161465544550.24578.14846009621606228644.malonedeb@wampee.canonical.com>
X-Priority: 3
X-GUID: A04E7069-1AD4-47AC-AA2B-E9C5D461723A
X-Has-Attach: no
X-Mailer: Foxmail 7.2.17.58[cn]
Mime-Version: 1.0
Message-ID: <2021030215305283912052@chinatelecom.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart068060514861_=----"
Received-SPF: pass client-ip=42.123.76.219;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

------=_001_NextPart068060514861_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Q2FuIHlvdSBnaXZlIHRoZSBsc3BjaSBtZXNzYWdlcz8gVGhlIGJlbG93IGlzIG15IG91dHB1dC4g
IFRoZXJlIGlzIGEgUkFNIG1lbW9yeSBkZXZpY2UuDQoNCiQgbHNwY2kNCjAwOjAwLjAgSG9zdCBi
cmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIDQ0MEZYIC0gODI0NDFGWCBQTUMgW05hdG9tYV0gKHJl
diAwMikNCjAwOjAxLjAgSVNBIGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gODIzNzFTQiBQSUlY
MyBJU0EgW05hdG9tYS9Ucml0b24gSUldDQowMDowMS4xIElERSBpbnRlcmZhY2U6IEludGVsIENv
cnBvcmF0aW9uIDgyMzcxU0IgUElJWDMgSURFIFtOYXRvbWEvVHJpdG9uIElJXQ0KMDA6MDEuMiBV
U0IgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gODIzNzFTQiBQSUlYMyBVU0IgW05hdG9t
YS9Ucml0b24gSUldIChyZXYgMDEpDQowMDowMS4zIEJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24g
ODIzNzFBQi9FQi9NQiBQSUlYNCBBQ1BJIChyZXYgMDMpDQowMDowMi4wIFZHQSBjb21wYXRpYmxl
IGNvbnRyb2xsZXI6IERldmljZSAxMjM0OjExMTEgKHJldiAwMikNCjAwOjAzLjAgUENJIGJyaWRn
ZTogUmVkIEhhdCwgSW5jLiBRRU1VIFBDSS1QQ0kgYnJpZGdlDQowMDowNC4wIEV0aGVybmV0IGNv
bnRyb2xsZXI6IFJlZCBIYXQsIEluYy4gVmlydGlvIG5ldHdvcmsgZGV2aWNlDQowMDowNS4wIFND
U0kgc3RvcmFnZSBjb250cm9sbGVyOiBSZWQgSGF0LCBJbmMuIFZpcnRpbyBTQ1NJDQowMDowNi4w
IENvbW11bmljYXRpb24gY29udHJvbGxlcjogUmVkIEhhdCwgSW5jLiBWaXJ0aW8gY29uc29sZQ0K
MDA6MTAuMCBSQU0gbWVtb3J5OiBSZWQgSGF0LCBJbmMuIEludGVyLVZNIHNoYXJlZCBtZW1vcnkg
KHJldiAwMSkNCjAxOjA3LjAgUENJIGJyaWRnZTogUmVkIEhhdCwgSW5jLiBRRU1VIFBDSS1QQ0kg
YnJpZGdlDQoNCiANCkZyb206IHNlYW4ga3VvDQpEYXRlOiAyMDIxLTAzLTAyIDExOjI0DQpUbzog
cWVtdS1kZXZlbA0KU3ViamVjdDogW0J1ZyAxOTE3Mzk0XSBbTkVXXSBjb21tYW5kIGxzcGNpIGRv
ZXMgbm90IHNob3cgdGhlIElWU0hNRU0gZGV2aWNlDQpQdWJsaWMgYnVnIHJlcG9ydGVkOg0KIA0K
cWV1bSB2ZXJzaW9uOg0KUUVNVSBlbXVsYXRvciB2ZXJzaW9uIDQuMi4xDQogDQpJIG1ldCBhIHBy
b2JsZW0gd2hlbiBJIHRyaWVkIHRvIHVzZSBJVlNITUVNLiBDb21tYW5kIGxzcGNpIGRvZXMgbm90
IHNob3cgdGhlIElWU0hNRU0gZGV2aWNlLg0KQmVsb3cgaXMgdGhlIGNvbmZpZ3VyYXRpb24gZnJv
bSBteSBzaWRlOg0KIA0KMS4gIGd1ZXN0IHZtIHhtbCBjb25maWd1cmF0aW9uLg0KICA8c2htZW0g
bmFtZT0naXZzaG1lbSc+DQogICAgICA8bW9kZWwgdHlwZT0naXZzaG1lbS1wbGFpbicvPg0KICAg
ICAgPHNpemUgdW5pdD0nTSc+Mjwvc2l6ZT4NCiAgICAgIDxhZGRyZXNzIHR5cGU9J3BjaScgZG9t
YWluPScweDAwMDAnIGJ1cz0nMHgwMCcgc2xvdD0nMHgxMCcgZnVuY3Rpb249JzB4MCcvPg0KICAg
IDwvc2htZW0+DQogDQoyLiBhZnRlciB0aGUgYm9vdGluZyB1cCBhbmQgSSBmb3VuZCB0aGUgcWVt
dSBjb21tYW5kbGluZSBpZGVlZGx5ICBoYXZlIHRoZSBkZXZpY2Ugb3B0aW9uOg0KcHMgYXV4IHwg
Z3JlcCBpdnNobWVtDQovdXNyL2Jpbi9xZW11LXN5c3RlbS14ODZfNjQgDQogICAgICAuLi4uLi4u
KGlnbm9yZSBvdGhlciBvcHRpb25zKQ0KLW9iamVjdCBtZW1vcnktYmFja2VuZC1maWxlLGlkPXNo
bW1lbS1zaG1lbTAsbWVtLXBhdGg9L2Rldi9zaG0vaG9zdG1lbSxzaXplPTQxOTQzMDQsc2hhcmU9
eWVzIC1kZXZpY2UgaXZzaG1lbS1wbGFpbixpZD1zaG1lbTAsbWVtZGV2PXNobW1lbS1zaG1lbTAs
YnVzPXBjaWUuMCxhZGRyPTB4MTANCiANCjMuIGxzcGNpIGNvbW1hbmQgIG5vdCBzaG93biB0aGUg
ZGV2aWNlLg0KIA0KNC4gbHNodyBjb21tYW5kIGluZGVlZGx5IHNob3cgdGhlIGRldmljZToNCiAN
CiotbWVtb3J5IFVOQ0xBSU1FRA0KICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBSQU0gbWVtb3J5
DQogICAgICAgICAgICAgcHJvZHVjdDogSW50ZXItVk0gc2hhcmVkIG1lbW9yeQ0KICAgICAgICAg
ICAgIHZlbmRvcjogUmVkIEhhdCwgSW5jLg0KICAgICAgICAgICAgIHBoeXNpY2FsIGlkOiAxMA0K
ICAgICAgICAgICAgIGJ1cyBpbmZvOiBwY2lAMDAwMDowMDoxMC4wDQogICAgICAgICAgICAgdmVy
c2lvbjogMDENCiAgICAgICAgICAgICB3aWR0aDogNjQgYml0cw0KICAgICAgICAgICAgIGNsb2Nr
OiAzM01IeiAoMzAuM25zKQ0KICAgICAgICAgICAgIGNvbmZpZ3VyYXRpb246IGxhdGVuY3k9MA0K
ICAgICAgICAgICAgIHJlc291cmNlczogbWVtb3J5OmZjYzFjMDAwLWZjYzFjMGZmIG1lbW9yeTpm
ZGMwMDAwMC1mZGZmZmZmZg0KIA0KTXkgaG9zdCBhbmQgdm0gb3MgaXMgdWJ1bnR1IDIwLjA0IGFu
ZCB2ZXJzaW9uIGlzOg0KIzQ5fjIwLjA0LjEtVWJ1bnR1IFNNUCBGcmkgRmViIDUgMDk6NTc6NTYg
VVRDIDIwMjEgeDg2XzY0IHg4Nl82NCB4ODZfNjQgR05VL0xpbnV4DQogDQoqKiBBZmZlY3RzOiBx
ZW11DQogICAgIEltcG9ydGFuY2U6IFVuZGVjaWRlZA0KICAgICAgICAgU3RhdHVzOiBOZXcNCiAN
Ci0tIA0KWW91IHJlY2VpdmVkIHRoaXMgYnVnIG5vdGlmaWNhdGlvbiBiZWNhdXNlIHlvdSBhcmUg
YSBtZW1iZXIgb2YgcWVtdS0NCmRldmVsLW1sLCB3aGljaCBpcyBzdWJzY3JpYmVkIHRvIFFFTVUu
DQpodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE5MTczOTQNCiANClRpdGxlOg0KICBj
b21tYW5kIGxzcGNpIGRvZXMgbm90IHNob3cgdGhlIElWU0hNRU0gZGV2aWNlDQogDQpTdGF0dXMg
aW4gUUVNVToNCiAgTmV3DQogDQpCdWcgZGVzY3JpcHRpb246DQogIHFldW0gdmVyc2lvbjoNCiAg
UUVNVSBlbXVsYXRvciB2ZXJzaW9uIDQuMi4xDQogDQogIEkgbWV0IGEgcHJvYmxlbSB3aGVuIEkg
dHJpZWQgdG8gdXNlIElWU0hNRU0uIENvbW1hbmQgbHNwY2kgZG9lcyBub3Qgc2hvdyB0aGUgSVZT
SE1FTSBkZXZpY2UuDQogIEJlbG93IGlzIHRoZSBjb25maWd1cmF0aW9uIGZyb20gbXkgc2lkZToN
CiANCiAgMS4gIGd1ZXN0IHZtIHhtbCBjb25maWd1cmF0aW9uLg0KICAgIDxzaG1lbSBuYW1lPSdp
dnNobWVtJz4NCiAgICAgICAgPG1vZGVsIHR5cGU9J2l2c2htZW0tcGxhaW4nLz4NCiAgICAgICAg
PHNpemUgdW5pdD0nTSc+Mjwvc2l6ZT4NCiAgICAgICAgPGFkZHJlc3MgdHlwZT0ncGNpJyBkb21h
aW49JzB4MDAwMCcgYnVzPScweDAwJyBzbG90PScweDEwJyBmdW5jdGlvbj0nMHgwJy8+DQogICAg
ICA8L3NobWVtPg0KIA0KICAyLiBhZnRlciB0aGUgYm9vdGluZyB1cCBhbmQgSSBmb3VuZCB0aGUg
cWVtdSBjb21tYW5kbGluZSBpZGVlZGx5ICBoYXZlIHRoZSBkZXZpY2Ugb3B0aW9uOg0KICBwcyBh
dXggfCBncmVwIGl2c2htZW0NCiAgIC91c3IvYmluL3FlbXUtc3lzdGVtLXg4Nl82NCANCiAgICAg
ICAgLi4uLi4uLihpZ25vcmUgb3RoZXIgb3B0aW9ucykNCiAgLW9iamVjdCBtZW1vcnktYmFja2Vu
ZC1maWxlLGlkPXNobW1lbS1zaG1lbTAsbWVtLXBhdGg9L2Rldi9zaG0vaG9zdG1lbSxzaXplPTQx
OTQzMDQsc2hhcmU9eWVzIC1kZXZpY2UgaXZzaG1lbS1wbGFpbixpZD1zaG1lbTAsbWVtZGV2PXNo
bW1lbS1zaG1lbTAsYnVzPXBjaWUuMCxhZGRyPTB4MTANCiANCiAgMy4gbHNwY2kgY29tbWFuZCAg
bm90IHNob3duIHRoZSBkZXZpY2UuDQogDQogIDQuIGxzaHcgY29tbWFuZCBpbmRlZWRseSBzaG93
IHRoZSBkZXZpY2U6DQogDQogICotbWVtb3J5IFVOQ0xBSU1FRA0KICAgICAgICAgICAgICAgZGVz
Y3JpcHRpb246IFJBTSBtZW1vcnkNCiAgICAgICAgICAgICAgIHByb2R1Y3Q6IEludGVyLVZNIHNo
YXJlZCBtZW1vcnkNCiAgICAgICAgICAgICAgIHZlbmRvcjogUmVkIEhhdCwgSW5jLg0KICAgICAg
ICAgICAgICAgcGh5c2ljYWwgaWQ6IDEwDQogICAgICAgICAgICAgICBidXMgaW5mbzogcGNpQDAw
MDA6MDA6MTAuMA0KICAgICAgICAgICAgICAgdmVyc2lvbjogMDENCiAgICAgICAgICAgICAgIHdp
ZHRoOiA2NCBiaXRzDQogICAgICAgICAgICAgICBjbG9jazogMzNNSHogKDMwLjNucykNCiAgICAg
ICAgICAgICAgIGNvbmZpZ3VyYXRpb246IGxhdGVuY3k9MA0KICAgICAgICAgICAgICAgcmVzb3Vy
Y2VzOiBtZW1vcnk6ZmNjMWMwMDAtZmNjMWMwZmYgbWVtb3J5OmZkYzAwMDAwLWZkZmZmZmZmDQog
DQogIE15IGhvc3QgYW5kIHZtIG9zIGlzIHVidW50dSAyMC4wNCBhbmQgdmVyc2lvbiBpczoNCiAg
IzQ5fjIwLjA0LjEtVWJ1bnR1IFNNUCBGcmkgRmViIDUgMDk6NTc6NTYgVVRDIDIwMjEgeDg2XzY0
IHg4Nl82NCB4ODZfNjQgR05VL0xpbnV4DQogDQpUbyBtYW5hZ2Ugbm90aWZpY2F0aW9ucyBhYm91
dCB0aGlzIGJ1ZyBnbyB0bzoNCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L3FlbXUvK2J1Zy8x
OTE3Mzk0LytzdWJzY3JpcHRpb25zDQogDQo=

------=_001_NextPart068060514861_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 14px; font-fami=
ly: 'Microsoft YaHei UI'; color: rgb(0, 0, 0); line-height: 1.5; }</style>=
</head><body>=0A<div><span></span><div><span style=3D"line-height: 1.5; ba=
ckground-color: transparent;">Can you give the lspci messages? The below i=
s my output. &nbsp;There is a RAM memory device.</span></div><div><span st=
yle=3D"line-height: 1.5; background-color: transparent;"><br></span></div>=
<div><span style=3D"line-height: 1.5; background-color: transparent;">$ ls=
pci</span></div><div>00:00.0 Host bridge: Intel Corporation 440FX - 82441F=
X PMC [Natoma] (rev 02)</div><div>00:01.0 ISA bridge: Intel Corporation 82=
371SB PIIX3 ISA [Natoma/Triton II]</div><div>00:01.1 IDE interface: Intel =
Corporation 82371SB PIIX3 IDE [Natoma/Triton II]</div><div>00:01.2 USB con=
troller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01)</=
div><div>00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 0=
3)</div><div>00:02.0 VGA compatible controller: Device 1234:1111 (rev 02)<=
/div><div>00:03.0 PCI bridge: Red Hat, Inc. QEMU PCI-PCI bridge</div><div>=
00:04.0 Ethernet controller: Red Hat, Inc. Virtio network device</div><div=
>00:05.0 SCSI storage controller: Red Hat, Inc. Virtio SCSI</div><div>00:0=
6.0 Communication controller: Red Hat, Inc. Virtio console</div><div>00:10=
.0 RAM memory: Red Hat, Inc. Inter-VM shared memory (rev 01)</div><div>01:=
07.0 PCI bridge: Red Hat, Inc. QEMU PCI-PCI bridge</div></div>=0A<div><br>=
</div>=0A<blockquote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-=
Left: 0.5em; margin-Right: inherit"><div>&nbsp;</div><div style=3D"border:=
none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div style=
=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMILY:tah=
oma;COLOR:#000000; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PADDING-TOP: =
8px"><div><b>From:</b>&nbsp;<a href=3D"mailto:1917394@bugs.launchpad.net">=
sean kuo</a></div><div><b>Date:</b>&nbsp;2021-03-02&nbsp;11:24</div><div><=
b>To:</b>&nbsp;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel</a></di=
v><div><b>Subject:</b>&nbsp;[Bug 1917394] [NEW] command lspci does not sho=
w the IVSHMEM device</div></div></div><div><div>Public bug reported:</div>=
=0A<div>&nbsp;</div>=0A<div>qeum version:</div>=0A<div>QEMU emulator versi=
on 4.2.1</div>=0A<div>&nbsp;</div>=0A<div>I met a problem when I tried to =
use IVSHMEM. Command lspci does not show the IVSHMEM device.</div>=0A<div>=
Below is the configuration from my side:</div>=0A<div>&nbsp;</div>=0A<div>=
1.&nbsp; guest vm xml configuration.</div>=0A<div>&nbsp; &lt;shmem name=3D=
'ivshmem'&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;model type=
=3D'ivshmem-plain'/&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;si=
ze unit=3D'M'&gt;2&lt;/size&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &lt;address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x10' fu=
nction=3D'0x0'/&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp; &lt;/shmem&gt;</div>=
=0A<div>&nbsp;</div>=0A<div>2. after the booting up and I found the qemu c=
ommandline ideedly&nbsp; have the device option:</div>=0A<div>ps aux | gre=
p ivshmem</div>=0A<div> /usr/bin/qemu-system-x86_64 </div>=0A<div>&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; .......(ignore other options)</div>=0A<div>-object =
memory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/shm/hostmem,size=3D=
4194304,share=3Dyes -device ivshmem-plain,id=3Dshmem0,memdev=3Dshmmem-shme=
m0,bus=3Dpcie.0,addr=3D0x10</div>=0A<div>&nbsp;</div>=0A<div>3. lspci comm=
and&nbsp; not shown the device.</div>=0A<div>&nbsp;</div>=0A<div>4. lshw c=
ommand indeedly show the device:</div>=0A<div>&nbsp;</div>=0A<div>*-memory=
 UNCLAIMED</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; description: RAM memory</div>=0A<div>&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; product: Inter-=
VM shared memory</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; vendor: Red Hat, Inc.</div>=0A<div>&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; physical id=
: 10</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bus info: pci@0000:00:10.0</div>=0A<div>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version: 01</div>=
=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; width: 64 bits</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock: 33MHz (30.3ns)</div>=0A<div>&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config=
uration: latency=3D0</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resources: memory:fcc1c000-fcc1c0ff memor=
y:fdc00000-fdffffff</div>=0A<div>&nbsp;</div>=0A<div>My host and vm os is =
ubuntu 20.04 and version is:</div>=0A<div>#49~20.04.1-Ubuntu SMP Fri Feb 5=
 09:57:56 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux</div>=0A<div>&nbsp;</div=
>=0A<div>** Affects: qemu</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp; Importance=
: Undecided</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Status: New</div>=0A<div>&nbsp;</div>=0A<div>-- </div>=0A<div>You received=
 this bug notification because you are a member of qemu-</div>=0A<div>deve=
l-ml, which is subscribed to QEMU.</div>=0A<div>https://bugs.launchpad.net=
/bugs/1917394</div>=0A<div>&nbsp;</div>=0A<div>Title:</div>=0A<div>&nbsp; =
command lspci does not show the IVSHMEM device</div>=0A<div>&nbsp;</div>=
=0A<div>Status in QEMU:</div>=0A<div>&nbsp; New</div>=0A<div>&nbsp;</div>=
=0A<div>Bug description:</div>=0A<div>&nbsp; qeum version:</div>=0A<div>&n=
bsp; QEMU emulator version 4.2.1</div>=0A<div>&nbsp;</div>=0A<div>&nbsp; I=
 met a problem when I tried to use IVSHMEM. Command lspci does not show th=
e IVSHMEM device.</div>=0A<div>&nbsp; Below is the configuration from my s=
ide:</div>=0A<div>&nbsp;</div>=0A<div>&nbsp; 1.&nbsp; guest vm xml configu=
ration.</div>=0A<div>&nbsp;&nbsp;&nbsp; &lt;shmem name=3D'ivshmem'&gt;</di=
v>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;model type=3D'ivs=
hmem-plain'/&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
lt;size unit=3D'M'&gt;2&lt;/size&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; &lt;address type=3D'pci' domain=3D'0x0000' bus=3D'0x00'=
 slot=3D'0x10' function=3D'0x0'/&gt;</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &lt;/shmem&gt;</div>=0A<div>&nbsp;</div>=0A<div>&nbsp; 2. after the=
 booting up and I found the qemu commandline ideedly&nbsp; have the device=
 option:</div>=0A<div>&nbsp; ps aux | grep ivshmem</div>=0A<div>&nbsp;&nbs=
p; /usr/bin/qemu-system-x86_64 </div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; .......(ignore other options)</div>=0A<div>&nbsp; -object me=
mory-backend-file,id=3Dshmmem-shmem0,mem-path=3D/dev/shm/hostmem,size=3D41=
94304,share=3Dyes -device ivshmem-plain,id=3Dshmem0,memdev=3Dshmmem-shmem0=
,bus=3Dpcie.0,addr=3D0x10</div>=0A<div>&nbsp;</div>=0A<div>&nbsp; 3. lspci=
 command&nbsp; not shown the device.</div>=0A<div>&nbsp;</div>=0A<div>&nbs=
p; 4. lshw command indeedly show the device:</div>=0A<div>&nbsp;</div>=0A<=
div>&nbsp; *-memory UNCLAIMED</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; description: RAM mem=
ory</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; product: Inter-VM shared memory</div>=0A<div>&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; vendor: Red Hat, Inc.</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; physical id: 10</d=
iv>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bus info: pci@0000:00:10.0</div>=0A<div>&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v=
ersion: 01</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; width: 64 bits</div>=0A<div>&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
clock: 33MHz (30.3ns)</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; configuration: latency=3D0</=
div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; resources: memory:fcc1c000-fcc1c0ff memory:fdc00000=
-fdffffff</div>=0A<div>&nbsp;</div>=0A<div>&nbsp; My host and vm os is ubu=
ntu 20.04 and version is:</div>=0A<div>&nbsp; #49~20.04.1-Ubuntu SMP Fri F=
eb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux</div>=0A<div>&nbsp;<=
/div>=0A<div>To manage notifications about this bug go to:</div>=0A<div>ht=
tps://bugs.launchpad.net/qemu/+bug/1917394/+subscriptions</div>=0A<div>&nb=
sp;</div>=0A</div></blockquote>=0A</body></html>
------=_001_NextPart068060514861_=------


