Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E7FB9423
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 17:38:09 +0200 (CEST)
Received: from localhost ([::1]:60956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBKz1-0006lI-Fc
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 11:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhlb29@foxmail.com>) id 1iBKoE-0007bf-Sp
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:26:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhlb29@foxmail.com>) id 1iBKoD-0003m7-E8
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:26:58 -0400
Received: from smtpbg702.qq.com ([203.205.195.102]:46983
 helo=smtpproxy21.qq.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhlb29@foxmail.com>) id 1iBKoB-0003ks-Bg
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1568993196;
 bh=6niNeTAJiBo+bQJ2gVNRyzX5Lv9FlpisyZxqikUvxLE=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=I1Y4umFxavjEIqAQVkSrV1SiPP3RFR1IZ2iw9jEJS+1XemajILbHEw/iBko1pSmp9
 In+sm2ZEF26E06vD01tJAjMfBfMO2R8WoCDWPqgoDrUtD0G+NzAdEcKU/iLzleXGq1
 la0+68k0lW4hKvQxlo9cx4je9tnW0kMFbI8tjwnI=
X-QQ-SSF: 00000000000000F000000000000000G
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 123.114.36.138
In-Reply-To: <CAFEAcA87Pb4Mk8McdaZHe41s=Cc1EeCknKfikRm6F+QoxKsdgg@mail.gmail.com>
References: <tencent_7BDD949D4C752E2A291A6A02@qq.com>
 <CAFEAcA9QDrwUAdZWX7n_gO9afnT4n9+i8ZdqOcxrNbvi6n9=sw@mail.gmail.com>
 <tencent_5378456F7A2F471F74C049FC@qq.com>
 <CAFEAcA87Pb4Mk8McdaZHe41s=Cc1EeCknKfikRm6F+QoxKsdgg@mail.gmail.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1568993195t734260
From: "=?ISO-8859-1?B?TGlibyBaaG91?=" <zhlb29@foxmail.com>
To: "=?ISO-8859-1?B?UGV0ZXIgTWF5ZGVsbA==?=" <peter.maydell@linaro.org>
Subject: Re:  Initialize data memory in user space emulation
Mime-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date: Fri, 20 Sep 2019 23:26:35 +0800
X-Priority: 3
Message-ID: <tencent_7D89E27172EB5C93465EFBB4@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 3619368583
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 20 Sep 2019 23:26:35 +0800 (CST)
Feedback-ID: webenglish:foxmail.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.205.195.102
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
Cc: =?ISO-8859-1?B?cWVtdS1kZXZlbA==?= <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSBhY3R1YWxseSB0aG91Z2h0IGFib3V0IGhhY2tpbmcgaXQgdG8gbW1hcCBmcm9tIGZpbGUg
aW50byBndWVzdCBtZW1vcnkgYmVmb3JlIHJ1bm5pbmcgRUxGLiBJbiBpbmNsdWRlL2V4ZWMv
bWVtb3J5LmgsIHRoZSBmdW5jdGlvbiBtZW1vcnlfcmVnaW9uX2luaXRfcmFtX2Zyb21fZmls
ZSBzb3VuZHMgbGlrZSB3aGF0IEkgbmVlZC4gQnV0IHRoZSBlbnRpcmUgbWVtb3J5Lmggc291
cmNlIGZpbGUgaXMgd3JhcHBlZCBieSAjaWZuZGVmIENPTkZJR19VU0VSX09OTFksIEkgY2Fu
bm90IHVzZSB0aGF0IEFQSSBpbiB1c2VyIHNwYWNlIGVtdWxhdGlvbiwgcmlnaHQ/CgotLS0t
LS0tLS0tLS0tLS0tLS0gT3JpZ2luYWwgLS0tLS0tLS0tLS0tLS0tLS0tCkZyb206ICAiUGV0
ZXIgTWF5ZGVsbCI7PHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz47ClNlbmQgdGltZTogRnJp
ZGF5LCBTZXAgMjAsIDIwMTkgMTA6NTUgUE0KVG86ICJMaWJvIFpob3UiPHpobGIyOUBmb3ht
YWlsLmNvbT47IApDYzogInFlbXUtZGV2ZWwiPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IApT
dWJqZWN0OiAgUmU6IEluaXRpYWxpemUgZGF0YSBtZW1vcnkgaW4gdXNlciBzcGFjZSBlbXVs
YXRpb24KCk9uIEZyaSwgMjAgU2VwIDIwMTkgYXQgMTU6NDksIExpYm8gWmhvdSA8emhsYjI5
QGZveG1haWwuY29tPiB3cm90ZToKPiBJIG5lZWQgdG8gZW11bGF0ZSBhIERpZ2l0YWwgU2ln
bmFsIFByb2Nlc3Nvci4gVGhlIERTUCBlc3NlbnRpYWxseSBoYXMgb25seSBiYXNpYyBNSVBT
IElTQSwgYW5kIGl0IG1hbmlwdWxhdGVzIHRoZSBkYXRhIHN0b3JlZCBpbiBhICJkYXRhIG1l
bW9yeSIuIEkgY2FuIHJ1biBhbiBFTEYgd2l0aCB1c2VyIHNwYWNlIGVtdWxhdGlvbiwgd2hh
dCBJIG5lZWQgdG8gYWRkaXRpb25hbGx5IGRvIGlzIHRvIGluaXRpYWxpemUgdGhlICJkYXRh
IG1lbW9yeSIgZmlyc3QsIHRoZW4gcnVuIGFuIEVMRiB0aGF0IG1hbmlwdWxhdGVzIHRoZSBk
YXRhIGluIHRoZSAiZGF0YSBtZW1vcnkiLCBhbmQgZmluYWxseSBzZWUgaWYgdGhlIHJlc3Vs
dGluZyBkYXRhIGFyZSBjb3JyZWN0IG9yIG5vdC4KClFFTVUgZG9lc24ndCByZWFsbHkgc3Vw
cG9ydCBkb2luZyB0aGF0IGtpbmQgb2YgdGhpbmcsIGJlY2F1c2UKYWN0dWFsIExpbnV4IGJp
bmFyaWVzIGRvbid0IGV4ZWN1dGUgaW4gYW4gZW52aXJvbm1lbnQgbGlrZSB0aGF0LgpZb3Ug
Y291bGQgcHJvYmFibHkgaGFjayBRRU1VIHRvIG1tYXAgYSBmaWxlIGludG8gdGhlIGd1ZXN0
J3MKbWVtb3J5IGJlZm9yZSB3ZSBzdGFydCB0byBydW4gdGhlIHVzZXJzcGFjZSBwcm9jZXNz
LCBidXQgdGhlcmUncwpub3RoaW5nIHRoYXQgd2lsbCBkbyB3aGF0IHlvdSB3YW50IG91dCBv
ZiB0aGUgYm94LgoKdGhhbmtzCi0tIFBNTQ==




