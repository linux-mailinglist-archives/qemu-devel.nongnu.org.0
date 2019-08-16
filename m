Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFA58FFF9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 12:24:05 +0200 (CEST)
Received: from localhost ([::1]:53558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyZOt-0007WT-N7
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 06:24:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1hyZLp-0006dF-Ow
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 06:20:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hyZLl-00049R-7s
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 06:20:52 -0400
Resent-Date: Fri, 16 Aug 2019 06:20:50 -0400
Resent-Message-Id: <E1hyZLl-00049R-7s@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hyZK8-00030q-IP
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 06:20:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1565950480; cv=none; d=zoho.com; s=zohoarc; 
 b=F7Xs7BWsNUUvPyvUlGl50sOd17MAKcLEY/N5+uWywynQVnWpMQmVXRJrRxKO7s1IYE7eHOtdBynNTPYidPOGqmjwnHrUb1v7uwU6/rZzGvxT+01++Y1AIR24lM00qvUbXngzmPraUs0iaFqrMr5rZzs78Fd2NpqPh0ci+sCt9vk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1565950480;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=mAoK+hQwckdqXR9yrmYvk4I75kiVsqD/HJhJEtmuUig=; 
 b=A8V8gqsnCHb3EWhiclXOz5Gvh/WeMA7BS3zALmjiCXjLzxf+6mAytBeJO5kp8clajSbHAFl6AcqbXr2t402HWFrUkxvTjyzjpyu8WG/bi9RZBmhh4AVx9Ct2c0GCYd83+YAnyaXNw8snvTq4tVQFOEHjwSeMmCom9zTBaVex6EU=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1565950477395270.14917685689693;
 Fri, 16 Aug 2019 03:14:37 -0700 (PDT)
In-Reply-To: <20190816093439.14262-1-kwolf@redhat.com>
Message-ID: <156595047640.20747.3175126524485744896@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kwolf@redhat.com
Date: Fri, 16 Aug 2019 03:14:37 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-devel] [PULL 00/16] Block layer patches
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
Reply-To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDgxNjA5MzQzOS4xNDI2
Mi0xLWt3b2xmQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIGJ1aWxkIHRl
c3Qgb24gczM5MHggaG9zdC4gUGxlYXNlIGZpbmQgdGhlIGRldGFpbHMgYmVsb3cuCgo9PT0gVEVT
VCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCiMgVGVzdGluZyBzY3JpcHQgd2lsbCBiZSBp
bnZva2VkIHVuZGVyIHRoZSBnaXQgY2hlY2tvdXQgd2l0aAojIEhFQUQgcG9pbnRpbmcgdG8gYSBj
b21taXQgdGhhdCBoYXMgdGhlIHBhdGNoZXMgYXBwbGllZCBvbiB0b3Agb2YgImJhc2UiCiMgYnJh
bmNoCnNldCAtZQoKZWNobwplY2hvICI9PT0gRU5WID09PSIKZW52CgplY2hvCmVjaG8gIj09PSBQ
QUNLQUdFUyA9PT0iCnJwbSAtcWEKCmVjaG8KZWNobyAiPT09IFVOQU1FID09PSIKdW5hbWUgLWEK
CkNDPSRIT01FL2Jpbi9jYwpJTlNUQUxMPSRQV0QvaW5zdGFsbApCVUlMRD0kUFdEL2J1aWxkCm1r
ZGlyIC1wICRCVUlMRCAkSU5TVEFMTApTUkM9JFBXRApjZCAkQlVJTEQKJFNSQy9jb25maWd1cmUg
LS1jYz0kQ0MgLS1wcmVmaXg9JElOU1RBTEwKbWFrZSAtajQKIyBYWFg6IHdlIG5lZWQgcmVsaWFi
bGUgY2xlYW4gdXAKIyBtYWtlIGNoZWNrIC1qNCBWPTEKbWFrZSBpbnN0YWxsCj09PSBURVNUIFND
UklQVCBFTkQgPT09CgogIENDICAgICAgYWFyY2g2NC1zb2Z0bW11L3RhcmdldC9hcm0vc3ZlX2hl
bHBlci5vCiAgQ0MgICAgICBsbTMyLXNvZnRtbXUvaHcvaW5wdXQvbWlsa3ltaXN0LXNvZnR1c2Iu
bwogIENDICAgICAgbG0zMi1zb2Z0bW11L2h3L21pc2MvbWlsa3ltaXN0LWhwZG1jLm8KY29sbGVj
dDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCm1ha2VbMV06ICoqKiBbTWFrZWZp
bGU6MjA5OiBxZW11LXN5c3RlbS1hcm1dIEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZTo0NzI6
IGFybS1zb2Z0bW11L2FsbF0gRXJyb3IgMgptYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hl
ZCBqb2JzLi4uLgoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcu
b3JnL2xvZ3MvMjAxOTA4MTYwOTM0MzkuMTQyNjItMS1rd29sZkByZWRoYXQuY29tL3Rlc3Rpbmcu
czM5MHgvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5
IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFj
ayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


