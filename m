Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C0C01C8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 11:07:50 +0200 (CEST)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDmE8-0003MX-Ja
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 05:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhlb29@foxmail.com>) id 1iDmBU-0001u0-MT
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:05:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhlb29@foxmail.com>) id 1iDmBP-0000fp-JQ
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:05:01 -0400
Received: from smtpbg508.qq.com ([203.205.250.107]:45178 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhlb29@foxmail.com>) id 1iDmBN-0000CE-Rs
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1569574767;
 bh=MTViV74lg+EX1dT6DqhRcomLrJ+paoVHjhWujd8cHJk=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=SE77pE+UMwNzF4gZ1+N8quOnx45GU5lUyEetQNuAnbmg4vuJCYQkfu//5Z1ufIrgq
 RTlRZiaIC4B3X580dPysphCPkmt+BEQeMrqoVQFjuOpqJjHQZKk3SARrMy9o9cAqRj
 MmVLiPJdtFFVlXiOKY9pNkgQwL6j3HVAGQKIkVWo=
X-QQ-SSF: 00000000000000F000000000000000G
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 159.226.200.178
In-Reply-To: <66b6b01d-f2b9-7715-982d-ae8106e40dc7@redhat.com>
References: <tencent_5D6D8ED31E83C5675AB8AA3C@qq.com>
 <c722d11e-e0ff-8a91-d8f3-ee0a31f1df33@redhat.com>
 <tencent_7AB3CDCC529EAE38265539A9@qq.com>
 <66b6b01d-f2b9-7715-982d-ae8106e40dc7@redhat.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1569574765t881051
From: "=?ISO-8859-1?B?TGlibyBaaG91?=" <zhlb29@foxmail.com>
To: "=?ISO-8859-1?B?UGhpbGlwcGUgTWF0aGlldS1EYXVk?=" <philmd@redhat.com>,
 "=?ISO-8859-1?B?UGV0ZXIgTWF5ZGVsbA==?=" <peter.maydell@linaro.org>
Subject: Re: illegal hardware instruction during MIPS-I ELF linux useremulation
Mime-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date: Fri, 27 Sep 2019 16:59:25 +0800
X-Priority: 3
Message-ID: <tencent_0EF1A5BF04625441589A212C@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1113095885
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 27 Sep 2019 16:59:26 +0800 (CST)
Feedback-ID: webenglish:foxmail.com:bgweb:bgweb2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 203.205.250.107
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

PiA+ICt7Cj4gPiArICAgIC5uYW1lID0gIk15Q1BVIiwKPiA+ICsgICAgLmluc25fZmxhZ3Mg
PSBDUFVfTUlQUzEgfCBJTlNOX01ZQ1BVLAo+ID4gK30sCj4gPiAuLi4KPiA+IEkganVzdCBu
ZWVkIHRvIHNpbXVsYXRlIGl0J3MgaW5zdHJ1Y3Rpb24gc2V0IGluIGxpbnV4IHVzZXIgZW11
bGF0aW9uLCBJIGRpZG4ndCBpbmNsdWRlIENQMCogaXRlbXMgaW4gdGhlIGxpc3QuIElzIHRo
aXMgZ29vZCBlbm91Z2ggdG8gYWRkIGEgbmV3IENQVSBtb2RlbD8KCj4gU29tZXRoaW5nIGxp
a2UgdGhhdCBtaWdodCBiZSBhY2NlcHRhYmxlIGZvciBsaW51eC11c2VyLgo+IFlvdSBzaG91
bGQgYXQgbGVhc3Qgc2V0IENQMF9QUmlkL0NvbmZpZzAvU3RhdHVzX21hc2suCgo+IExvb2sg
YXQgdGhpcyBwYXRjaCB3aGVyZSBBbGVrc2FuZGFyIGFjY2VwdGVkIHRoZSBSNTkwMCBDUFU6
Cj4gaHR0cHM6Ly9naXQucWVtdS5vcmcvP3A9cWVtdS5naXQ7YT1jb21taXRkaWZmO2g9ZWQ0
ZjQ5YmE5YmI1NgoKPiBDYW4geW91IHNoYXJlIHdoYXQgaXMgeW91ciBDUFU/CgpJdCdzIHdv
cmtpbmcgbm93LiBXaGVuIEkgcHV0IHRoZSAtY3B1IGZsYWcgYXQgdGhlIGVuZCBvZiB0aGUg
Y29tbWFuZCBsaW5lLCBteSBjcHUgd2FzIG5vdCByZWNvZ25pemVkLgoKVGhhbmtzLApMaWJv



