Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347DBC00B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 04:30:42 +0200 (CEST)
Received: from localhost ([::1]:40280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCabB-00064G-7C
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 22:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhlb29@foxmail.com>) id 1iCaZ5-0004vP-V6
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 22:28:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhlb29@foxmail.com>) id 1iCaZ3-0007Qd-DO
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 22:28:30 -0400
Received: from smtpbg514.qq.com ([203.205.250.64]:54450 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhlb29@foxmail.com>) id 1iCaZ2-0007PK-6J
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 22:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1569292099;
 bh=2MWcgtFQfYAeEDQu8swVWyy+0tu2Mr4K0NNML+h12ys=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=VR3AQcNbhUpbyOjAj2xpG/0ONokAb+z0e8xUvO714pVIhQSYagVn7V8iQS1jAHBF9
 egYTqgu3h+QuzlXu0vTsf+/lgN4r0HlVEVhxD3a6XunYW0USIwJP4WEvWzBIizO5Ux
 WpsYjOs5QHBWbVqL5LNFw6iSpr9BN01Hn0UETXNM=
X-QQ-SSF: 00000000000000F000000000000000G
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 124.200.70.7
In-Reply-To: <CAFEAcA98asDEZru6ht3PVN6g9duXnTTEHsuUzckFHZmV3+sqXw@mail.gmail.com>
References: <tencent_5D6D8ED31E83C5675AB8AA3C@qq.com>
 <tencent_6E390A001F25D33F67930C37@qq.com>
 <CAFEAcA98asDEZru6ht3PVN6g9duXnTTEHsuUzckFHZmV3+sqXw@mail.gmail.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1569291056t460881
From: "=?ISO-8859-1?B?TGlibyBaaG91?=" <zhlb29@foxmail.com>
To: "=?ISO-8859-1?B?UGV0ZXIgTWF5ZGVsbA==?=" <peter.maydell@linaro.org>
Subject: Re: illegal hardware instruction during MIPS-I ELF linux useremulation
Mime-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date: Tue, 24 Sep 2019 10:10:56 +0800
X-Priority: 3
Message-ID: <tencent_3BE0CBCB7BA7249A0F92A863@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1771949582
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Tue, 24 Sep 2019 10:10:56 +0800 (CST)
Feedback-ID: webenglish:foxmail.com:bgweb:bgweb4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.205.250.64
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
Cc: =?ISO-8859-1?B?cWVtdS1kZXZlbA==?= <qemu-devel@nongnu.org>,
 =?ISO-8859-1?B?QWxla3NhbmRhciBNYXJrb3ZpYw==?= <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBJIHdvdWxkIHN0YXJ0IGJ5IHVzaW5nIHRoZSBRRU1VIGdkYnN0dWIgdG8gY29ubmVjdCBh
Cj4gTUlQUy1hd2FyZSBnZGIuIFRoZW4gd2hlbiB0aGUgU0lHSUxMIGFycml2ZXMgeW91IGNh
biBzZWUKPiB3aGF0IGluc3RydWN0aW9uIHRoZSBndWVzdCBwcm9ncmFtIHdhcyB0cnlpbmcg
dG8gZXhlY3V0ZS4KCkp1c3QgdHJpZWQgaXQgYW5kIGZvdW5kIHNvbWV0aGluZyBpbnRlcmVz
dGluZy4KSSBjb25uZWN0ZWQgZ2RiLW11bHRpYXJjaCB0byBRRU1VIGdkYnN0dWIuIGdkYi1t
dWx0aWFyY2gncyBhcmNoaXRlY3R1cmUgd2FzIHNldCB0byBtaXBzOjMwMDAgYXV0b21hdGlj
YWxseSAoYW5kIFdpa2lwZWRpYSBzYXlzIHIzayB1c2VzIE1JUFMtSSkuCgpXaGVuIEkgZGlk
ICdsYXlvdXQgYXNtJywgYW5kIGNvbXBhcmVkIHRoZSBpbnN0cnVjdGlvbnMgZGlzcGxheWVk
IGFnYWluc3QgdGVzdC5zIGdlbmVyYXRlZCBieSBteSBtaXBzZWwtbGludXgtdW5rbm93bi1n
Y2MsIHRoZXkgYXBwZWFyZWQgdG8gYmUgYSBsaXR0bGUgYml0IGRpZmZlcmVudC4KClRoZSAn
c3RvcmUgd29yZCcgaW5zdHJ1Y3Rpb24gaW4gdGVzdC5zIGlzIHNob3duIGFzIGEgaGV4ICcw
eDdmLi4uLi4uKGRvbid0IHJlbWVtYmVyIHRoZSByZXN0KSc7Cidsb2FkIHdvcmQnIGlzIHNo
b3duIGFzICcweDVmLi4uLi4uJzsKJ2xvYWQgaW1tZWRpYXRlJyBpcyBzZWVuIGFzICdhZGRp
JzsKJ2onIGFzICdqcic7CgpXaGVuIEkgc2luZ2xlLXN0ZXBwZWQgdGhlIGluc3RydWN0aW9u
cywgdGhlIFNJR0lMTCB3YXMgdGhyb3duIGltbWVkaWF0ZWx5IGFmdGVyIHRoZSBmaXJzdCB1
bnJlY29nbml6ZWQgMHg3Zi4uLi4uLiwgd2hpY2ggaXMgc3VwcG9zZWQgdG8gYmUgYSBzdG9y
ZSB3b3JkIChzdykuCiAKSGVuY2UsIGNhbiBJIGNvbmNsdWRlIHRoYXQgTUlQUy1JIGlzIG5v
dCBpbXBsZW1lbnRlZCBpbiBRRU1VIG91dCBvZiB0aGUgYm94Pw==


