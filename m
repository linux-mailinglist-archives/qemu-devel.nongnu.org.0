Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5459D35BFB7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 11:20:08 +0200 (CEST)
Received: from localhost ([::1]:33730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVsji-0002yA-7e
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 05:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVsiJ-000248-PU
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:18:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVsiH-0006np-Ki
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:18:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618219112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h2zBXeHQksvcaRIstg4r3aQ4YJKiVFW+sz0ufPrakKw=;
 b=FHduk5r1FfNkS3+TytLKTPNFULPejGwkVyY9z478uPgNfq0FychFBxqmWq+iZ6e8naHlC+
 PYk79SKXaHa9fkxOAHYTKssOZUh9+afybX0RJxkIOug41C71rLUKfh4CXy/62VzNxPWNqg
 +FA+CMgc/gMfeAB7/8YXu34d2eQepEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-rImBbWQ4NZucw5MEAd-2gw-1; Mon, 12 Apr 2021 05:18:30 -0400
X-MC-Unique: rImBbWQ4NZucw5MEAd-2gw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9697E107ACF4;
 Mon, 12 Apr 2021 09:18:29 +0000 (UTC)
Received: from localhost (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1ED35D6DC;
 Mon, 12 Apr 2021 09:18:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
Date: Mon, 12 Apr 2021 10:18:24 +0100
Message-Id: <20210412091824.707855-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Qin Wang <qinwang@rehdat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U29tZSBkb3duc3RyZWFtcyByZW5hbWUgdGhlIFFFTVUgYmluYXJ5IHRvICJxZW11LWt2bSIuIFRo
aXMgYnJlYWtzCnF0ZXN0X2dldF9hcmNoKCksIHdoaWNoIGF0dGVtcHRzIHRvIHBhcnNlIHRoZSB0
YXJnZXQgYXJjaGl0ZWN0dXJlIGZyb20KdGhlIFFURVNUX1FFTVVfQklOQVJZIGVudmlyb25tZW50
IHZhcmlhYmxlLgoKUHJpbnQgYW4gZXJyb3IgaW5zdGVhZCBvZiByZXR1cm5pbmcgdGhlIGFyY2hp
dGVjdHVyZSAia3ZtIi4gVGhpbmdzIGZhaWwKaW4gd2VpcmQgd2F5cyB3aGVuIHRoZSBhcmNoaXRl
Y3R1cmUgc3RyaW5nIGlzIGJvZ3VzLgoKQXJndWFibHkgcXRlc3RzIHNob3VsZCBhbHdheXMgYmUg
cnVuIGluIGEgYnVpbGQgZGlyZWN0b3J5IGluc3RlYWQgb2YKYWdhaW5zdCBhbiBpbnN0YWxsZWQg
UUVNVS4gSW4gYW55IGNhc2UsIHByaW50aW5nIGEgY2xlYXIgZXJyb3Igd2hlbiB0aGlzCmhhcHBl
bnMgaXMgaGVscGZ1bC4KClJlcG9ydGVkLWJ5OiBRaW4gV2FuZyA8cWlud2FuZ0ByZWhkYXQuY29t
PgpDYzogRW1hbnVlbGUgR2l1c2VwcGUgRXNwb3NpdG8gPGVlc3Bvc2l0QHJlZGhhdC5jb20+ClNp
Z25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiB0
ZXN0cy9xdGVzdC9saWJxdGVzdC5jIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9xdGVzdC9saWJxdGVzdC5jIGIvdGVz
dHMvcXRlc3QvbGlicXRlc3QuYwppbmRleCA3MWUzNTllZmNkLi43Y2FmMjBmNTZiIDEwMDY0NAot
LS0gYS90ZXN0cy9xdGVzdC9saWJxdGVzdC5jCisrKyBiL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMK
QEAgLTkxMCw2ICs5MTAsMTYgQEAgY29uc3QgY2hhciAqcXRlc3RfZ2V0X2FyY2godm9pZCkKICAg
ICAgICAgYWJvcnQoKTsKICAgICB9CiAKKyAgICBpZiAoIXN0cnN0cihxZW11LCAiLXN5c3RlbS0i
KSkgeworICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIlFURVNUX1FFTVVfQklOQVJZIG11c3QgZW5k
IHdpdGggKi1zeXN0ZW0tPGFyY2g+IHdoZXJlICIKKyAgICAgICAgICAgICAgICAgICAgICAgICIn
YXJjaCcgaXMgdGhlIHRhcmdldCBhcmNoaXRlY3R1cmUgKHg4Nl82NCwgYWFyY2g2NCwgIgorICAg
ICAgICAgICAgICAgICAgICAgICAgImV0YykuIElmIHlvdSBhcmUgdXNpbmcgcWVtdS1rdm0gb3Ig
YW5vdGhlciBjdXN0b20gIgorICAgICAgICAgICAgICAgICAgICAgICAgIm5hbWUsIHBsZWFzZSBj
cmVhdGUgYSBzeW1saW5rIGxpa2UgbG4gLXMgIgorICAgICAgICAgICAgICAgICAgICAgICAgInBh
dGgvdG8vcWVtdS1rdm0gcWVtdS1zeXN0ZW0teDg2XzY0IGFuZCB1c2UgdGhhdCAiCisgICAgICAg
ICAgICAgICAgICAgICAgICAiaW5zdGVhZC5cbiIpOworICAgICAgICBhYm9ydCgpOworICAgIH0K
KwogICAgIHJldHVybiBlbmQgKyAxOwogfQogCi0tIAoyLjMwLjIKCg==


