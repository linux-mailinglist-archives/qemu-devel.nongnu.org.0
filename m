Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E465A789
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 01:21:55 +0200 (CEST)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hh0Bm-0008QS-HE
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 19:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51417)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hh0AP-0007Hw-Bx
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:20:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hh0AN-0007nE-V2
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:20:29 -0400
Resent-Date: Fri, 28 Jun 2019 19:20:29 -0400
Resent-Message-Id: <E1hh0AN-0007nE-V2@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21485)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hh0AN-0007da-O7
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:20:27 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1561763068; cv=none; d=zoho.com; s=zohoarc; 
 b=Azn7XsIrXwZaN7mdSRKi95h1TEe+QCo+S7CflvcUcOLJAbVb+iJM86l3LfYB7E9H9xuwJVphD1GjUt2n845EOyN+bxpU7VTbjwwdqUOydrPucWYPWaP3CpVth7GUqipJ4ZRQCDVK53hsrQ2EdME36XX/CXqxe1y6Ch9et9ZQgR4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1561763068;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=fgy8QMHDkmRsllaOGmCAnGRBuoUDyxi12RhgKuCwyN4=; 
 b=YhwcvU5pUNWd++LEUw3YVzubJskqGE83kkr1nrsrRT2MGGj4ea7pnTGdb3gzYZfLrP0tO3QbqqGl0TtCy754SWaP068BIGSsl26Qc+Kt0XDyAvQhYfCxQy9G2IIyRqYTXH3zVI0B7PFi/I1Ae8/cejytvGI3zGzkZsBY0H/y2N0=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1561763054508239.17882317198814;
 Fri, 28 Jun 2019 16:04:14 -0700 (PDT)
Message-ID: <156176305246.16285.15387842115700265166@c4a48874b076>
In-Reply-To: <20190628183321.GE1862@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ehabkost@redhat.com
Date: Fri, 28 Jun 2019 16:04:14 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-devel] [PATCH] fixup! hw/s390x: Replace global smp
 variables with machine smp properties
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
Cc: peter.maydell@linaro.org, like.xu@linux.intel.com, david@redhat.com,
 qemu-trivial@nongnu.org, cohuck@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, imammedo@redhat.com, alistair23@gmail.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDYyODE4MzMyMS5HRTE4
NjJAaGFia29zdC5uZXQvCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIGJ1aWxkIHRlc3Qgb24g
czM5MHggaG9zdC4gUGxlYXNlIGZpbmQgdGhlIGRldGFpbHMgYmVsb3cuCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCiMgVGVzdGluZyBzY3JpcHQgd2lsbCBiZSBpbnZva2Vk
IHVuZGVyIHRoZSBnaXQgY2hlY2tvdXQgd2l0aAojIEhFQUQgcG9pbnRpbmcgdG8gYSBjb21taXQg
dGhhdCBoYXMgdGhlIHBhdGNoZXMgYXBwbGllZCBvbiB0b3Agb2YgImJhc2UiCiMgYnJhbmNoCnNl
dCAtZQoKZWNobwplY2hvICI9PT0gRU5WID09PSIKZW52CgplY2hvCmVjaG8gIj09PSBQQUNLQUdF
UyA9PT0iCnJwbSAtcWEKCmVjaG8KZWNobyAiPT09IFVOQU1FID09PSIKdW5hbWUgLWEKCkNDPSRI
T01FL2Jpbi9jYwpJTlNUQUxMPSRQV0QvaW5zdGFsbApCVUlMRD0kUFdEL2J1aWxkCm1rZGlyIC1w
ICRCVUlMRCAkSU5TVEFMTApTUkM9JFBXRApjZCAkQlVJTEQKJFNSQy9jb25maWd1cmUgLS1jYz0k
Q0MgLS1wcmVmaXg9JElOU1RBTEwKbWFrZSAtajQKIyBYWFg6IHdlIG5lZWQgcmVsaWFibGUgY2xl
YW4gdXAKIyBtYWtlIGNoZWNrIC1qNCBWPTEKbWFrZSBpbnN0YWxsCj09PSBURVNUIFNDUklQVCBF
TkQgPT09CgogIENDICAgICAgczM5MHgtc29mdG1tdS90YXJnZXQvczM5MHgvc2lncC5vCiAgQ0Mg
ICAgICBzMzkweC1zb2Z0bW11L3RhcmdldC9zMzkweC9rdm0ubwovdmFyL3RtcC9wYXRjaGV3LXRl
c3Rlci10bXAtM2RlM2Jvd2Ivc3JjL3RhcmdldC9zMzkweC9rdm0uYzogSW4gZnVuY3Rpb24g4oCY
a3ZtX2FyY2hfaW5pdF92Y3B14oCZOgovdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtM2RlM2Jv
d2Ivc3JjL3RhcmdldC9zMzkweC9rdm0uYzozNjU6NTY6IGVycm9yOiDigJhNYWNoaW5lU3RhdGXi
gJkge2FrYSDigJhzdHJ1Y3QgTWFjaGluZVN0YXRl4oCZfSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKA
mHNtcOKAmQogIDM2NSB8ICAgICB1bnNpZ25lZCBpbnQgbWF4X2NwdXMgPSBNQUNISU5FKHFkZXZf
Z2V0X21hY2hpbmUoKSktPnNtcC5tYXhfY3B1czsKICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KL3Zhci90bXAvcGF0Y2hldy10
ZXN0ZXItdG1wLTNkZTNib3diL3NyYy90YXJnZXQvczM5MHgva3ZtLmM6IEluIGZ1bmN0aW9uIOKA
mGt2bV9zMzkwX3ZjcHVfaW50ZXJydXB0X3ByZV9zYXZl4oCZOgovdmFyL3RtcC9wYXRjaGV3LXRl
c3Rlci10bXAtM2RlM2Jvd2Ivc3JjL3RhcmdldC9zMzkweC9rdm0uYzoxOTU0OjU2OiBlcnJvcjog
4oCYTWFjaGluZVN0YXRl4oCZIHtha2Eg4oCYc3RydWN0IE1hY2hpbmVTdGF0ZeKAmX0gaGFzIG5v
IG1lbWJlciBuYW1lZCDigJhzbXDigJkKIDE5NTQgfCAgICAgdW5zaWduZWQgaW50IG1heF9jcHVz
ID0gTUFDSElORShxZGV2X2dldF9tYWNoaW5lKCkpLT5zbXAubWF4X2NwdXM7CiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+Cm1h
a2VbMV06ICoqKiBbL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLTNkZTNib3diL3NyYy9ydWxl
cy5tYWs6Njk6IHRhcmdldC9zMzkweC9rdm0ub10gRXJyb3IgMQoKClRoZSBmdWxsIGxvZyBpcyBh
dmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTA2MjgxODMzMjEuR0UxODYy
QGhhYmtvc3QubmV0L3Rlc3RpbmcuczM5MHgvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVy
YXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxl
YXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


