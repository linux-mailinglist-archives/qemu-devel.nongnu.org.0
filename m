Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CF0B0D52
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 12:58:22 +0200 (CEST)
Received: from localhost ([::1]:60944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Mnt-00089K-6k
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 06:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33180)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhlb29@foxmail.com>) id 1i8Mn2-0007kN-F1
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:57:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhlb29@foxmail.com>) id 1i8Mmz-0007V2-Hy
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:57:28 -0400
Received: from smtpbg504.qq.com ([203.205.250.60]:55680 helo=smtpbg.qq.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhlb29@foxmail.com>) id 1i8Mmx-0007Ri-13
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1568285833;
 bh=MUaihbo8EOUmeVQJejUoTYYT8Vsj+JwN1XE5NUJ34eg=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=ZfhruUEzo8SZQ/bKhsp4/jKejmB8iC5VW8fRFQ1/qoHyi3yACWDf4F31D0yfB8CHx
 l3fcg2qxYdavHwgS64xiwL1aSAukukcwVOLoZuqMzVwrc1S08eWepm8vLnugE7WhpC
 brVOcwDA/U3Plm35cZblu4mHwUfIbJ+2b+Ob8Los=
X-QQ-SSF: 00010000000000F000000000000000G
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 124.200.70.7
In-Reply-To: <87blvy99y9.fsf@linaro.org>
References: <tencent_3156C5EA2695B7CD53C6114C@qq.com>
 <CAL1e-=hWOXgnTbC0Y2v_CMZOMmQLgdToBAsi+XaW7+9uyN55CA@mail.gmail.com>
 <tencent_23ACCA1A48AFB09124C52E70@qq.com>
 <87blvy99y9.fsf@linaro.org>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1568284117t806835
From: "=?ISO-8859-1?B?TGlibyBaaG91?=" <zhlb29@foxmail.com>
To: "=?ISO-8859-1?B?QWxleCBCZW5u6WU=?=" <alex.bennee@linaro.org>,
 "=?ISO-8859-1?B?cWVtdS1kZXZlbA==?=" <qemu-devel@nongnu.org>
Mime-Version: 1.0
Date: Thu, 12 Sep 2019 18:28:37 +0800
X-Priority: 3
Message-ID: <tencent_0E8715864EBBAA153BB730E2@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 2386325565
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 12 Sep 2019 18:28:37 +0800 (CST)
Feedback-ID: webenglish:foxmail.com:bgweb:bgweb2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.205.250.60
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] QEMU as ISS (Instruction Set Simulator)
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
Cc: =?ISO-8859-1?B?QWxla3NhbmRhciBNYXJrb3ZpYw==?= <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWxleCBCZW5u6WUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+IHdyaXRlczoNCg0KDQo+IFRo
ZSBnZGJzdHViIHNob3VsZCBhbGxvdyB5b3UgZG8gZnVsbCBpbnRyb3NwZWN0aW9uIGFuZCBh
ZGRpbmcNCj4gYWRkaXRpb25hbCByZWdpc3RlcnMgaXMgZmFpcmx5IGVhc3ksIHNlZSBtaXBz
X2NwdV9nZGJfcmVhZF9yZWdpc3RlciBmdW5jdGlvbg0KPiBpbiAgdGFyZ2V0L21pcHMvZ2Ri
c3R1Yi5jLg0KDQoNCg0KSGkgQWxleCBhbmQgQWxla3NhbmRhciwNCg0KDQpOb3cgSSBjYW4g
Y29ubmVjdCBnZGIgdG8gcWVtdSBzdWNjZXNzZnVsbHkuIEFuZCBJIGNhbiB1c2UgdGhpcyBj
b21tYW5kIHRvIHNob3cgYWxsIHRoZSByZWdpc3RlciBjb250ZW50cyBpbiBhIGdkYiBzZXNz
aW9uLg0KDQoNCihnZGIpIGxheW91dCByZWdzDQoNCg0KSG93ZXZlciwgSSB3aWxsIG5lZWQg
dG8gYWRkIHNvbWUgbW9yZSByZWdpc3RlcnMgdG8gdGhlIENQVS4gRG9lcyBhZGRpbmcgbmV3
IHJlZ2lzdGVycyBpbiBnZGJzdHViLmMgYWxzbyBzaG93IHRoZSBuZXcgcmVnaXN0ZXJzIGlu
IHRoZSBUVUk/DQpJIGRvdWJ0IGl0IGJlY2F1c2Ugd2hlbiBJIG1vZGlmaWVkIHRoZSByZWdu
YW1lc1tdIGluIHRyYW5zbGF0ZS5jLCB0aGUgcmVnaXN0ZXJzJyBuYW1lcyBkaWRuJ3QgY2hh
bmdlIGluIGdkYi4NCg0KDQoNCkNoZWVycywNCkxpYm8NCg0KDQoNCj4gQWxleCBCZW5u6WU=
