Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EBF17023A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 16:22:16 +0100 (CET)
Received: from localhost ([::1]:45752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6yVr-0003TT-QN
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 10:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1j6yUx-00031q-AL
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:21:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1j6yUt-0008T9-1r
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:21:19 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52749
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1j6yUs-0008SG-Uk
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582730474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PefAQTZ2aPgt1bUnb8k1qGmCM3QHWOMtEjj+e6heTrs=;
 b=QJMCpS6YfhHhQE0jrtvhANMqqtryGnRaF3oRpOWzUBavcDvLxsrvcZfZ24k3SVGFfRZY+L
 3EwQqQWm6z+1ZWvZjuo/gBABhCzao2hMYBrM2e7bMCVJT2hEoYiAfKMVwgiib5IBNBxu0z
 pSNctoz1DJZwAnOh4gcOP0v+wvzansM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-sErtrNW7PZeyD0m4LPM2Rw-1; Wed, 26 Feb 2020 10:21:00 -0500
X-MC-Unique: sErtrNW7PZeyD0m4LPM2Rw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC6CD10CE780
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 15:20:59 +0000 (UTC)
Received: from localhost (unknown [10.36.118.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D83821001902;
 Wed, 26 Feb 2020 15:20:56 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] Add GSoC 2020 announcement to blog
Date: Wed, 26 Feb 2020 15:20:55 +0000
Message-Id: <20200226152055.75190-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TGV0IHBlb3BsZSBrbm93IHRoYXQgd2UgYXJlIHBhcnRpY2lwYXRpbmcgaW4gR29vZ2xlIFN1bW1l
ciBvZiBDb2RlIGFnYWluCnRoaXMgeWVhci4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6
aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiAuLi4tZ29vZ2xlLXN1bW1lci1vZi1jb2RlLWlu
dGVybnNoaXBzLTIwMjAubWQgfCAyNyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMjcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IF9wb3N0cy8yMDIwLTAyLTI2
LWdvb2dsZS1zdW1tZXItb2YtY29kZS1pbnRlcm5zaGlwcy0yMDIwLm1kCgpkaWZmIC0tZ2l0IGEv
X3Bvc3RzLzIwMjAtMDItMjYtZ29vZ2xlLXN1bW1lci1vZi1jb2RlLWludGVybnNoaXBzLTIwMjAu
bWQgYi9fcG9zdHMvMjAyMC0wMi0yNi1nb29nbGUtc3VtbWVyLW9mLWNvZGUtaW50ZXJuc2hpcHMt
MjAyMC5tZApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi41MWM3NjRiCi0tLSAv
ZGV2L251bGwKKysrIGIvX3Bvc3RzLzIwMjAtMDItMjYtZ29vZ2xlLXN1bW1lci1vZi1jb2RlLWlu
dGVybnNoaXBzLTIwMjAubWQKQEAgLTAsMCArMSwyNyBAQAorLS0tCitsYXlvdXQ6IHBvc3QKK3Rp
dGxlOiAgIkFubm91bmNpbmcgR29vZ2xlIFN1bW1lciBvZiBDb2RlIDIwMjAgaW50ZXJuc2hpcHMi
CitkYXRlOiAgIDIwMjAtMDItMjYgMDc6MDA6MDAgKzAwMDAKK2NhdGVnb3JpZXM6IFtnc29jLCBp
bnRlcm5zaGlwc10KKy0tLQorUUVNVSBpcyBwYXJ0aWNpcGF0aW5nIGluIFtHb29nbGUgU3VtbWVy
IG9mIENvZGUKKzIwMjBdKGh0dHBzOi8vc3VtbWVyb2Zjb2RlLndpdGhnb29nbGUuY29tLykgYWdh
aW4gdGhpcyB5ZWFyISAgR29vZ2xlIFN1bW1lciBvZgorQ29kZSAoR1NvQykgaXMgYW4gaW50ZXJu
c2hpcCBwcm9ncmFtIHRoYXQgYnJpbmdzIHN0dWRlbnRzIGludG8gb3BlbiBzb3VyY2UKK2RldmVs
b3BtZW50LiAgR1NvQyBvZmZlcnMgZnVsbC10aW1lIHJlbW90ZSB3b3JrIG9wcG9ydHVuaXRpZXMg
Zm9yIHRhbGVudGVkIG5ldworZGV2ZWxvcGVycyB3aXNoaW5nIHRvIGdldCBpbnZvbHZlZCBpbiBv
dXIgY29tbXVuaXR5LgorCitFYWNoIGludGVybiB3b3JrcyB3aXRoIG9uZSBvciBtb3JlIG1lbnRv
cnMgd2hvIHN1cHBvcnQgdGhlbSBpbiB0aGVpciBwcm9qZWN0LgorQ29kZSBpcyBzdWJtaXR0ZWQg
dGhyb3VnaCBRRU1VJ3Mgb3BlbiBzb3VyY2UgZGV2ZWxvcG1lbnQgcHJvY2VzcywgZ2l2aW5nIHRo
ZQoraW50ZXJuIGV4cGVyaWVuY2UgaW4gb3BlbiBzb3VyY2Ugc29mdHdhcmUgZGV2ZWxvcG1lbnQu
CisKK0lmIHlvdSBhcmUgaW50ZXJlc3RlZCBpbiBjb250cmlidXRpbmcgdG8gUUVNVSB0aHJvdWdo
IGEgcGFpZCAxMi13ZWVrIGludGVybnNoaXAKK2Zyb20gTWF5IHRvIEF1Z3VzdCwgdGFrZSBhIGxv
b2sgYXQgW291ciBwcm9qZWN0CitpZGVhc10oaHR0cHM6Ly93aWtpLnFlbXUub3JnL0dvb2dsZV9T
dW1tZXJfb2ZfQ29kZV8yMDIwKSBmb3IgbW9yZSBpbmZvcm1hdGlvbi4KK0FwcGxpY2F0aW9ucyBh
cmUgb3BlbiBNYXJjaCAxNi0zMSwgMjAyMC4KKworUGxlYXNlIHJldmlldyB0aGUgW2VsaWdpYmls
aXR5Citjcml0ZXJpYV0oaHR0cHM6Ly9kZXZlbG9wZXJzLmdvb2dsZS5jb20vb3Blbi1zb3VyY2Uv
Z3NvYy9mYXEjd2hhdF9hcmVfdGhlX2VsaWdpYmlsaXR5X3JlcXVpcmVtZW50c19mb3JfcGFydGlj
aXBhdGlvbikgYmVmb3JlIGFwcGx5aW5nLgorCitRRU1VIGlzIGFsc28gcGFydGljaXBhdGluZyBp
biB0aGUgW091dHJlYWNoeSBpbnRlcm5zaGlwCitwcm9ncmFtXShodHRwczovL3d3dy5vdXRyZWFj
aHkub3JnL2FwcGx5L3Byb2plY3Qtc2VsZWN0aW9uLyNxZW11KSwgc28gYmUgc3VyZQordG8gY2hl
Y2sgdGhhdCBvdXQgYXMgd2VsbCEKLS0gCjIuMjQuMQoK


