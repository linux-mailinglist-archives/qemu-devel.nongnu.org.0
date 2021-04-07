Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5413C356A1F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:46:31 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5hd-0004nw-Ub
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lU5ga-0004I2-Jc
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lU5gX-0000FB-NN
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617792319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4yYs4XGWfQPgVs/65PGKUB1sHYl5p2m+qxRYzu3svUs=;
 b=i0ReozbcB3/0xKe7uR2qjVncWOje45VAUD4hDzt8Q/gmaUxCCVZ1jkZrrBqCD0G4MI13DN
 4ZfvIc1rqV1gDS4jUIwARTCHMYZxCq8F3ON0c5rwBPHASx1iFu2f03g1do1N7TeV0g2xoH
 1KjO6mzUh8g2vljZJmsU0DODbBFx1hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-xjjukNEpO6KupC80cXQIgQ-1; Wed, 07 Apr 2021 06:45:18 -0400
X-MC-Unique: xjjukNEpO6KupC80cXQIgQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 167186D4E0;
 Wed,  7 Apr 2021 10:45:17 +0000 (UTC)
Received: from localhost (ovpn-114-86.ams2.redhat.com [10.36.114.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A41614108;
 Wed,  7 Apr 2021 10:45:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
Date: Wed,  7 Apr 2021 11:45:11 +0100
Message-Id: <20210407104511.343061-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qin Wang <qinwang@rehdat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
ZXN0cy9xdGVzdC9saWJxdGVzdC5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMgYi90ZXN0cy9x
dGVzdC9saWJxdGVzdC5jCmluZGV4IDcxZTM1OWVmY2QuLjJmYzI0OWMwYjUgMTAwNjQ0Ci0tLSBh
L3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMKKysrIGIvdGVzdHMvcXRlc3QvbGlicXRlc3QuYwpAQCAt
OTEwLDYgKzkxMCwxNCBAQCBjb25zdCBjaGFyICpxdGVzdF9nZXRfYXJjaCh2b2lkKQogICAgICAg
ICBhYm9ydCgpOwogICAgIH0KIAorICAgIGlmIChzdHJjbXAoZW5kICsgMSwgImt2bSIpID09IDAp
IHsKKyAgICAgICAgZnByaW50ZihzdGRlcnIsICJRVEVTVF9RRU1VX0JJTkFSWSBtdXN0IGVuZCB3
aXRoICotPGFyY2g+LiBJZiB5b3UgYXJlICIKKyAgICAgICAgICAgICAgICAgICAgICAgICJ1c2lu
ZyBxZW11LWt2bSwgcGxlYXNlIGNyZWF0ZSBhIHN5bWxpbmsgbGlrZSBsbiAtcyAiCisgICAgICAg
ICAgICAgICAgICAgICAgICAicGF0aC90by9xZW11LWt2bSBxZW11LXN5c3RlbS14ODZfNjQgYW5k
IHVzZSB0aGF0ICIKKyAgICAgICAgICAgICAgICAgICAgICAgICJpbnN0ZWFkLlxuIik7CisgICAg
ICAgIGFib3J0KCk7CisgICAgfQorCiAgICAgcmV0dXJuIGVuZCArIDE7CiB9CiAKLS0gCjIuMzAu
MgoK


