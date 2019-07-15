Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5163269D64
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 23:11:35 +0200 (CEST)
Received: from localhost ([::1]:43872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn8Fx-0004CQ-44
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 17:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42658)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hn8Ec-00072q-N9
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:10:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hn8Ea-0006Ca-Mw
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:10:10 -0400
Resent-Date: Mon, 15 Jul 2019 17:10:09 -0400
Resent-Message-Id: <E1hn8Ea-0006Ca-Mw@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21874)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hn8EY-00069i-VS; Mon, 15 Jul 2019 17:10:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563224967; cv=none; d=zoho.com; s=zohoarc; 
 b=PckfYrJYhoZ4k65p4oBliGOui2KK4A9gV+bMFYdfj0J1aeUXToHnL4ck4vDEAPCFZ/PRA8A3xUe7OpDpqkqdCHDr3+/1wkMJ+dz4qNTRdp61m930RWdpwOUsztzeIAOsqoGF/M1sC5+fhRSTOK/UAwRnS53QnWYPgQxXlZpQ4SM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1563224967;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=igLBMnQuI4Z5mcfK+JcH12L0YWDut4w7fTe0Yz5BP0c=; 
 b=kdtZu15nqb9cMatZtJU7m8IxVSIVBO7UDhk4eg+styEaz8CNKT3VMS5FGRIvUPHydqkU+jmYx/PBXFbwSXzXhLOgIugIR/4FpxeLjKsSlSnOWSRqU8acPr84G9/kX+A+rGVPjUZBBwvgtoiMQxMuzLWmiSi33Dt3+wzOri1YFWE=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1563224965846976.4433392779716;
 Mon, 15 Jul 2019 14:09:25 -0700 (PDT)
Message-ID: <156322496393.3080.18323027869659884783@c4a48874b076>
In-Reply-To: <20190715152225.26135-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Date: Mon, 15 Jul 2019 14:09:25 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-devel] [RFC PATCH-for-4.1? v2 0/5] semihosting: Build
 with CONFIG_SEMIHOSTING disabled
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, arikalo@wavecomp.com,
 jhogan@kernel.org, riku.voipio@iki.fi, qemu-devel@nongnu.org,
 laurent@vivier.eu, alex.bennee@linaro.org, qemu-arm@nongnu.org,
 amarkovic@wavecomp.com, pbonzini@redhat.com, james.hogan@mips.com,
 philmd@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDcxNTE1MjIyNS4yNjEz
NS0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCBidWlsZCB0
ZXN0IG9uIHMzOTB4IGhvc3QuIFBsZWFzZSBmaW5kIHRoZSBkZXRhaWxzIGJlbG93LgoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAojIFRlc3Rpbmcgc2NyaXB0IHdpbGwgYmUg
aW52b2tlZCB1bmRlciB0aGUgZ2l0IGNoZWNrb3V0IHdpdGgKIyBIRUFEIHBvaW50aW5nIHRvIGEg
Y29tbWl0IHRoYXQgaGFzIHRoZSBwYXRjaGVzIGFwcGxpZWQgb24gdG9wIG9mICJiYXNlIgojIGJy
YW5jaApzZXQgLWUKCmVjaG8KZWNobyAiPT09IEVOViA9PT0iCmVudgoKZWNobwplY2hvICI9PT0g
UEFDS0FHRVMgPT09IgpycG0gLXFhCgplY2hvCmVjaG8gIj09PSBVTkFNRSA9PT0iCnVuYW1lIC1h
CgpDQz0kSE9NRS9iaW4vY2MKSU5TVEFMTD0kUFdEL2luc3RhbGwKQlVJTEQ9JFBXRC9idWlsZApt
a2RpciAtcCAkQlVJTEQgJElOU1RBTEwKU1JDPSRQV0QKY2QgJEJVSUxECiRTUkMvY29uZmlndXJl
IC0tY2M9JENDIC0tcHJlZml4PSRJTlNUQUxMCm1ha2UgLWo0CiMgWFhYOiB3ZSBuZWVkIHJlbGlh
YmxlIGNsZWFuIHVwCiMgbWFrZSBjaGVjayAtajQgVj0xCm1ha2UgaW5zdGFsbAo9PT0gVEVTVCBT
Q1JJUFQgRU5EID09PQoKICBDQyAgICAgIG1pcHM2NC1saW51eC11c2VyL2xpbnV4LXVzZXIvZmQt
dHJhbnMubwogIENDICAgICAgbWlwczY0LWxpbnV4LXVzZXIvdGFyZ2V0L21pcHMvdHJhbnNsYXRl
Lm8KICBDQyAgICAgIG1pcHM2NGVsLWxpbnV4LXVzZXIvdGFyZ2V0L21pcHMvbWlwcy1zZW1pLXN0
dWJzLm8KL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLW4wbXJzX3p3L3NyYy90YXJnZXQvbWlw
cy9taXBzLXNlbWktc3R1YnMuYzoxOTo2OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhoZWxwZXJfZG9fc2VtaWhvc3RpbmfigJkgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVz
XQogICAxOSB8IHZvaWQgaGVscGVyX2RvX3NlbWlob3N0aW5nKENQVU1JUFNTdGF0ZSAqZW52KQog
ICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5n
IHRyZWF0ZWQgYXMgZXJyb3JzCi0tLQogIENDICAgICAgbWlwc2VsLWxpbnV4LXVzZXIvdGFyZ2V0
L21pcHMvdHJhbnNsYXRlLm8KICBDQyAgICAgIG1pcHM2NC1saW51eC11c2VyL3RhcmdldC9taXBz
L21zYV9oZWxwZXIubwogIENDICAgICAgbWlwczY0LWxpbnV4LXVzZXIvdGFyZ2V0L21pcHMvbWlw
cy1zZW1pLXN0dWJzLm8KL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLW4wbXJzX3p3L3NyYy90
YXJnZXQvbWlwcy9taXBzLXNlbWktc3R1YnMuYzoxOTo2OiBlcnJvcjogbm8gcHJldmlvdXMgcHJv
dG90eXBlIGZvciDigJhoZWxwZXJfZG9fc2VtaWhvc3RpbmfigJkgWy1XZXJyb3I9bWlzc2luZy1w
cm90b3R5cGVzXQogICAxOSB8IHZvaWQgaGVscGVyX2RvX3NlbWlob3N0aW5nKENQVU1JUFNTdGF0
ZSAqZW52KQogICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5p
bmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCi0tLQogIENDICAgICAgbWlwc2VsLWxpbnV4LXVz
ZXIvdGFyZ2V0L21pcHMvbWlwcy1zZW1pLXN0dWJzLm8KICBHRU4gICAgIHRyYWNlL2dlbmVyYXRl
ZC1oZWxwZXJzLmMKICBDQyAgICAgIG1pcHNlbC1saW51eC11c2VyL3RyYWNlL2NvbnRyb2wtdGFy
Z2V0Lm8KL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLW4wbXJzX3p3L3NyYy90YXJnZXQvbWlw
cy9taXBzLXNlbWktc3R1YnMuYzoxOTo2OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhoZWxwZXJfZG9fc2VtaWhvc3RpbmfigJkgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVz
XQogICAxOSB8IHZvaWQgaGVscGVyX2RvX3NlbWlob3N0aW5nKENQVU1JUFNTdGF0ZSAqZW52KQog
ICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5n
IHRyZWF0ZWQgYXMgZXJyb3JzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8v
cGF0Y2hldy5vcmcvbG9ncy8yMDE5MDcxNTE1MjIyNS4yNjEzNS0xLXBoaWxtZEByZWRoYXQuY29t
L3Rlc3RpbmcuczM5MHgvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0
aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91
ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


