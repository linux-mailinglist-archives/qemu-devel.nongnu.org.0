Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F9F37F01A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:53:11 +0200 (CEST)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyf8-0006qy-NU
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <re.mcclue@protonmail.com>)
 id 1lgyeB-0005V4-SP
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:52:11 -0400
Received: from mail4.protonmail.ch ([185.70.40.27]:14920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <re.mcclue@protonmail.com>)
 id 1lgye4-0005Zk-V1
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:52:11 -0400
Date: Wed, 12 May 2021 23:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1620863520;
 bh=SjGJ9OgxCEFpeQevSKOqMMyFm5is61VB8y1GCZhN40c=;
 h=Date:To:From:Reply-To:Subject:From;
 b=Z96BlH/bIChn+zg4Xe2REk6WIsAIzSBHPQAt1JIYuMMcvdMShh809D4nuFIqxTcTG
 h9pBp7Nw2XVB5KjCK7Rc6cTnTO/F6zCrz1Bt2IP+oJJm0hGUL0td8EevbdzAAUR9Q1
 dakSIkwFnWEsu3vxS4xRAvgKeLh92JLwf0ttC2SI=
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: "re.mcclue" <re.mcclue@protonmail.com>
Subject: QEMU Memory Allocation Issue
Message-ID: <Z6bNY9boA9cBuHnG-6-PLfzVwiyqyNjVnqy1uQ9GdkXvHlgaDvd1zRgEFuwQBPlbmmVHV_qKLes308uc8zl_VQSNUXPLDqcTjoiS6H8xv34=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_tXqfCNQxGAOAEfKk1C6HrrpUDdgTp6J1JVLsrmpIk"
Received-SPF: pass client-ip=185.70.40.27;
 envelope-from=re.mcclue@protonmail.com; helo=mail4.protonmail.ch
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: "re.mcclue" <re.mcclue@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.

--b1_tXqfCNQxGAOAEfKk1C6HrrpUDdgTp6J1JVLsrmpIk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SW5zaWRlIG9mIGdkYiwgSSdtIGdldHRpbmcgMHhkNmFkMDAwIDxlcnJvcjogQ2Fubm90IGFjY2Vz
cyBtZW1vcnkgYXQgYWRkcmVzcyAweGQ2YWQwMDA+IGZvciBtZW1vcnkgYWxsb2NhdGlvbnMgbWFk
ZSB3aXRoIG1tYXAoKQoKSSBydW4gcWVtdSB3aXRoOiBxZW11LXN5c3RlbS14ODZfNjQgLWVuYWJs
ZS1rdm0gLW0gNTEyTSAtcyAtUyAtZHJpdmUgZm9ybWF0PXJhdyxmaWxlPWtlci5pbWcgLWtlcm5l
bCAvYm9vdC92bWxpbnV6LTUuOC4wLTUwLWdlbmVyaWMgLWFwcGVuZCAicm9vdD0vZGV2L3NkYSBp
bml0PS9zYmluL3g2NC1rZXIgbm9rYXNsciIKClRoZSBtbWFwKCkgY2FsbCBzdWNjZWVkcywgeWV0
IHRoZSBtZW1vcnkgcmV0dXJuZWQgc2VlbXMgdG8gYmUgaW5hY2Nlc3NpYmxlLgpSdW5uaW5nIG9u
IG15IFVidW50dSBob3N0IGl0IHdvcmtzIGZpbmUuIE1lbW9yeSBpcyB2YWxpZCBhbmQgemVyb2Vk
LiBTbywgaXQgc2VlbXMgdG8gYmUgYW4gaXNzdWUgd2l0aCBxZW11LgoKc3RhdGljIHZvaWQgKgp4
NjRfc3lzY2FsbF9tbWFwKHZvaWQgKmJhc2VfYWRkciwgdTY0IHNpemUsIHUzMiBtZW1vcnlfcHJv
dGVjdGlvbiwKICAgICAgICAgICAgICAgIHUzMiBtYXBwaW5nX3Zpc2liaWxpdHksIHMzMiBmZCwg
dTY0IGZkX29mZnNldCkKewogIHM2NCByZXN1bHQgPSAwOwogIF9fYXNtX18gX192b2xhdGlsZV9f
KCJtb3YgcjEwLCAlNVxuIgogICAgICAgICAgICAgIm1vdiByOCwgJTZcbiIKICAgICAgICAgICAg
ICJtb3YgcjksICU3XG4iCiAgICAgICAgICAgICAic3lzY2FsbCIKICAgICAgICAgICAgICA6ICI9
YSIgKHJlc3VsdCkKICAgICAgICAgICAgICA6ICJhIiAoOSksCiAgICAgICAgICAgICAgICAiRCIg
KCh1NjQpYmFzZV9hZGRyKSwKICAgICAgICAgICAgICAgICJTIiAoc2l6ZSksCiAgICAgICAgICAg
ICAgICAiZCIgKCh1NjQpbWVtb3J5X3Byb3RlY3Rpb24pLAogICAgICAgICAgICAgICAgInIiICgo
dTY0KW1hcHBpbmdfdmlzaWJpbGl0eSksCiAgICAgICAgICAgICAgICAiciIgKCh1NjQpZmQpLAog
ICAgICAgICAgICAgICAgInIiIChmZF9vZmZzZXQpCiAgICAgICAgICAgICAgOiAicjEwIiwgInI4
IiwgInI5IiwgInIxMSIsICJyY3giLCAibWVtb3J5Iik7CgogIHZvaWQgKnN5c19yZXN1bHQgPSAo
dm9pZCAqKSgodTY0KXJlc3VsdCk7CiAgaWYgKCh1NjQpcmVzdWx0ID49ICh1NjQpKC1NQVhfRVJS
Tk8pKSB7CiAgICBicmVha3BvaW50KCk7CiAgICBzeXNfcmVzdWx0ID0gTlVMTDsKICB9CgogIHJl
dHVybiBzeXNfcmVzdWx0Owp9Cgp2b2lkICptZW0gPSB4NjRfc3lzY2FsbF9tbWFwKE5VTEwsIDEw
MjQgKiAxMDI0ICogMjAwLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAogICAgICAgICAgTUFQX1BS
SVZBVEUgfCBNQVBfQU5PTllNT1VTLCAtMSwgMCk7CgpUaGFua3MKClNlbnQgd2l0aCBbUHJvdG9u
TWFpbF0oaHR0cHM6Ly9wcm90b25tYWlsLmNvbSkgU2VjdXJlIEVtYWlsLg==

--b1_tXqfCNQxGAOAEfKk1C6HrrpUDdgTp6J1JVLsrmpIk
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj5JbnNpZGUgb2YgZ2RiLCBJJ20gZ2V0dGluZyA8Yj4weGQ2YWQwMDAgJmx0O2Vycm9yOiBD
YW5ub3QgYWNjZXNzIG1lbW9yeSBhdCBhZGRyZXNzIDB4ZDZhZDAwMCZndDsgPC9iPmZvciBtZW1v
cnkgYWxsb2NhdGlvbnMgbWFkZSB3aXRoIDxiPm1tYXAoKTwvYj48YnI+PC9kaXY+PGRpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PkkgcnVuIHFlbXUgd2l0aDogPGI+cWVtdS1zeXN0ZW0teDg2XzY0IC1l
bmFibGUta3ZtIC1tIDUxMk0gLXMgLVMgLWRyaXZlIGZvcm1hdD1yYXcsZmlsZT1rZXIuaW1nIC1r
ZXJuZWwgL2Jvb3Qvdm1saW51ei01LjguMC01MC1nZW5lcmljIC1hcHBlbmQgInJvb3Q9L2Rldi9z
ZGEgaW5pdD0vc2Jpbi94NjQta2VyIG5va2FzbHIiPC9iPjxicj48L2Rpdj48ZGl2PjxkaXY+PGJy
PjwvZGl2PjwvZGl2PjxkaXY+VGhlIDxiPm1tYXAoKTwvYj4gY2FsbCBzdWNjZWVkcywgeWV0IHRo
ZSBtZW1vcnkgcmV0dXJuZWQgc2VlbXMgdG8gYmUgaW5hY2Nlc3NpYmxlLjxicj48L2Rpdj48ZGl2
PlJ1bm5pbmcgb24gbXkgVWJ1bnR1IGhvc3QgaXQgd29ya3MgZmluZS4gTWVtb3J5IGlzIHZhbGlk
IGFuZCB6ZXJvZWQuIFNvLCBpdCBzZWVtcyB0byBiZSBhbiBpc3N1ZSB3aXRoIHFlbXUuPGJyPjwv
ZGl2PjwvZGl2PjxwcmU+PGNvZGU+c3RhdGljIHZvaWQgKg0KeDY0X3N5c2NhbGxfbW1hcCh2b2lk
ICpiYXNlX2FkZHIsIHU2NCBzaXplLCB1MzIgbWVtb3J5X3Byb3RlY3Rpb24sDQogICAgICAgICAg
ICAgICAgdTMyIG1hcHBpbmdfdmlzaWJpbGl0eSwgczMyIGZkLCB1NjQgZmRfb2Zmc2V0KQ0Kew0K
ICBzNjQgcmVzdWx0ID0gMDsNCiAgX19hc21fXyBfX3ZvbGF0aWxlX18oIm1vdiByMTAsICU1XG4i
DQogICAgICAgICAgICAgIm1vdiByOCwgJTZcbiINCiAgICAgICAgICAgICAibW92IHI5LCAlN1xu
Ig0KICAgICAgICAgICAgICJzeXNjYWxsIg0KICAgICAgICAgICAgICA6ICI9YSIgKHJlc3VsdCkN
CiAgICAgICAgICAgICAgOiAiYSIgKDkpLA0KICAgICAgICAgICAgICAgICJEIiAoKHU2NCliYXNl
X2FkZHIpLA0KICAgICAgICAgICAgICAgICJTIiAoc2l6ZSksDQogICAgICAgICAgICAgICAgImQi
ICgodTY0KW1lbW9yeV9wcm90ZWN0aW9uKSwNCiAgICAgICAgICAgICAgICAiciIgKCh1NjQpbWFw
cGluZ192aXNpYmlsaXR5KSwNCiAgICAgICAgICAgICAgICAiciIgKCh1NjQpZmQpLA0KICAgICAg
ICAgICAgICAgICJyIiAoZmRfb2Zmc2V0KQ0KICAgICAgICAgICAgICA6ICJyMTAiLCAicjgiLCAi
cjkiLCAicjExIiwgInJjeCIsICJtZW1vcnkiKTsNCg0KICB2b2lkICpzeXNfcmVzdWx0ID0gKHZv
aWQgKikoKHU2NClyZXN1bHQpOw0KICBpZiAoKHU2NClyZXN1bHQgJmd0Oz0gKHU2NCkoLU1BWF9F
UlJOTykpIHsNCiAgICBicmVha3BvaW50KCk7DQogICAgc3lzX3Jlc3VsdCA9IE5VTEw7DQogIH0N
Cg0KICByZXR1cm4gc3lzX3Jlc3VsdDsNCn08L2NvZGU+PGJyPjwvcHJlPjxwcmU+PGNvZGU+IHZv
aWQgKm1lbSA9IHg2NF9zeXNjYWxsX21tYXAoTlVMTCwgMTAyNCAqIDEwMjQgKiAyMDAsIFBST1Rf
UkVBRCB8IFBST1RfV1JJVEUsDQogICAgICAgICAgTUFQX1BSSVZBVEUgfCBNQVBfQU5PTllNT1VT
LCAtMSwgMCk7PC9jb2RlPjxicj48L3ByZT48ZGl2PlRoYW5rczxicj48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jayI+PGRpdiBjbGFzcz0i
cHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stdXNlciBwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9j
ay1lbXB0eSI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2Nr
LXByb3RvbiI+U2VudCB3aXRoIDxhIGhyZWY9Imh0dHBzOi8vcHJvdG9ubWFpbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5Qcm90b25NYWlsPC9hPiBTZWN1cmUgRW1haWwuPGJyPjwvZGl2PjwvZGl2Pjxk
aXY+PGJyPjwvZGl2Pg==


--b1_tXqfCNQxGAOAEfKk1C6HrrpUDdgTp6J1JVLsrmpIk--


