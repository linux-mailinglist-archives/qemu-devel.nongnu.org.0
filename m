Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A10B8D9C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 11:25:46 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBFAe-00083b-TL
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 05:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhlb29@foxmail.com>) id 1iBF8U-0005nI-LG
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:23:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhlb29@foxmail.com>) id 1iBF18-0001B5-FP
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:15:55 -0400
Received: from smtpbgeu1.qq.com ([52.59.177.22]:44123)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhlb29@foxmail.com>) id 1iBF17-00016G-Gr
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1568970939;
 bh=hRmCv+roy9K/PEwD0JktNzxRXy89jC54EjZpmYUexY0=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=tSfmOerxKBzj3pJ7zi8EX0/A0GcM5h23IPVBx57Bi39woTiHRBp5yTTo8zTgOgmGg
 XKneNS8JsJoL1m3P9Cy+fVHpPy5zzO1Lv9X3DWzrAPoWAWAI4gMmMqbs1AouR2sU6+
 wXY5HTN1iXEmltN1r7x7NtgQZyANtxH/ZTHwrAYA=
X-QQ-SSF: 00000000000000F000000000000000G
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 128.189.13.171
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1568970938t680328
From: "=?ISO-8859-1?B?TGlibyBaaG91?=" <zhlb29@foxmail.com>
To: "=?ISO-8859-1?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>
Subject: Initialize data memory in user space emulation
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5D8498BA_0BD78840_41E9D5A2"
Content-Transfer-Encoding: 8Bit
Date: Fri, 20 Sep 2019 17:15:38 +0800
X-Priority: 3
Message-ID: <tencent_7BDD949D4C752E2A291A6A02@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 20 Sep 2019 17:15:39 +0800 (CST)
Feedback-ID: webenglish:foxmail.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 52.59.177.22
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

------=_NextPart_5D8498BA_0BD78840_41E9D5A2
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQoNCkkgbmVlZCBhIHdheSB0byBtYW5pcHVsYXRlIGRhdGEgc2F2ZWQgaW4g
YSByZXNlcnZlZCBtZW1vcnkgcmVnaW9uIGluIGxpbnV4IHVzZXIgc3BhY2UgZW11bGF0aW9u
LiBJIGZvdW5kIHRoZSAtQiBvcHRpb24gdmVyeSBwcm9taXNpbmcuICBEb2N1bWVudGF0aW9u
IHNheXMgaXQgaXMgdXNlZnVsIHdoZW4gdGhlIGFkZHJlc3MgcmVnaW9uIHJlcXVpcmVkIGJ5
IGd1ZXN0IGFwcGxpY2F0aW9ucyBpcyByZXNlcnZlZCBvbiB0aGUgaG9zdC4NCg0KDQpCdXQg
aG93IGNhbiBJIGluaXRpYWxpemUgdGhhdCBtZW1vcnkgd2l0aCBkYXRhPw0KDQoNCg0KVGhh
bmtzLA0KTGlibyBaaG91

------=_NextPart_5D8498BA_0BD78840_41E9D5A2
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj48Zm9udCBjb2xvcj0iIzAwMzM2NiI+SGkgYWxsLDwvZm9udD48L2Rpdj48ZGl2Pjxm
b250IGNvbG9yPSIjMDAzMzY2Ij48YnI+PC9mb250PjwvZGl2PjxkaXY+PGZvbnQgY29sb3I9
IiMwMDMzNjYiPkkgbmVlZCBhIHdheSB0byBtYW5pcHVsYXRlIGRhdGEgc2F2ZWQgaW4gYSBy
ZXNlcnZlZCBtZW1vcnkgcmVnaW9uIGluIGxpbnV4IHVzZXIgc3BhY2UgZW11bGF0aW9uLiBJ
IGZvdW5kIHRoZSAtQiBvcHRpb24gdmVyeSBwcm9taXNpbmcuJm5ic3A7IERvY3VtZW50YXRp
b24gc2F5cyBpdCBpcyB1c2VmdWwgd2hlbiB0aGUgYWRkcmVzcyByZWdpb24gcmVxdWlyZWQg
YnkgZ3Vlc3QgYXBwbGljYXRpb25zIGlzIHJlc2VydmVkIG9uIHRoZSBob3N0LjwvZm9udD48
L2Rpdj48ZGl2Pjxmb250IGNvbG9yPSIjMDAzMzY2Ij48YnI+PC9mb250PjwvZGl2PjxkaXY+
PGZvbnQgY29sb3I9IiMwMDMzNjYiPkJ1dCBob3cgY2FuIEkgaW5pdGlhbGl6ZSB0aGF0IG1l
bW9yeSB3aXRoIGRhdGE/PGJyPjwvZm9udD48L2Rpdj48ZGl2Pjxmb250IGNvbG9yPSIjMDAz
MzY2Ij48YnI+PC9mb250PjwvZGl2PjxkaXY+PGZvbnQgY29sb3I9IiMwMDMzNjYiPlRoYW5r
cyw8L2ZvbnQ+PC9kaXY+PGRpdj48Zm9udCBjb2xvcj0iIzAwMzM2NiI+TGlibyBaaG91PGJy
PjwvZm9udD48L2Rpdj4=

------=_NextPart_5D8498BA_0BD78840_41E9D5A2--




